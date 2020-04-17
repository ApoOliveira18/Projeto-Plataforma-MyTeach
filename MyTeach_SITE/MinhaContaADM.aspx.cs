using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MinhaContaADM : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("MyTeach");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usulogado"] != null)
        {
            if (Session["usulogado"].ToString() != "ADM")
            {
                Response.Redirect("LoginINICIO.aspx");

            }
        }
        else
        {
            Response.Redirect("LoginINICIO.aspx");
        }

        //Verifica se a conta exite e exibe as informações
        DataView MinhaConta;

        MinhaConta = (DataView)sqlMinhaConta.
            Select(DataSourceSelectArguments.Empty);

        if (!IsPostBack)
        {
            //Carregar a informações 

            try
            {
                lblNome.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["nome_adm"].ToString());
                lblEmail.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["email_adm"].ToString());
                lblCpf.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["cpf_adm"].ToString());
                lblSexo.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["sexo_adm"].ToString());
                txtCep.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["cep_adm"].ToString());
                txtCidade.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["cidade_adm"].ToString());
                txtRua.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["rua_adm"].ToString());
                txtBairro.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["bairro_adm"].ToString());
                txtNúmero.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["num_adm"].ToString());
                txtTel.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["tel_adm"].ToString());
                Image3.ImageUrl = cripto.Decrypt(MinhaConta.Table.Rows[0]["imagem_adm"].ToString());

                //mudar data para formato certo
                DateTime dt;
                dt = Convert.ToDateTime(MinhaConta.Table.Rows[0]["dataNasc_adm"].ToString());
                txtData.Text = dt.ToShortDateString();               
            }
            catch
            {
                lblNome.Text = "";
                lblEmail.Text = "";
                txtData.Text = "";
                lblCpf.Text = "";
                lblSexo.Text = "";
                txtCep.Text = "";
                txtCidade.Text = "";
                txtRua.Text = "";
                txtBairro.Text = "";
                txtNúmero.Text = "";
                txtTel.Text = "";
                Image3.ImageUrl = "";
            }
        }

        lblData.Text = "";
    }

    

    protected void btnAlterar_Click(object sender, EventArgs e)
    {
        //Alterar as informações
        try
        {
            sqlMinhaConta.UpdateParameters["NovoNome"].DefaultValue = cripto.Encrypt(lblNome.Text);
            sqlMinhaConta.UpdateParameters["NovoEmail"].DefaultValue = cripto.Encrypt(lblEmail.Text);
            sqlMinhaConta.UpdateParameters["NovoCPF"].DefaultValue = cripto.Encrypt(lblCpf.Text);
            sqlMinhaConta.UpdateParameters["NovoSexo"].DefaultValue = cripto.Encrypt(lblSexo.Text);
            sqlMinhaConta.UpdateParameters["NovoCEP"].DefaultValue = cripto.Encrypt(txtCep.Text);
            sqlMinhaConta.UpdateParameters["NovaCidade"].DefaultValue = cripto.Encrypt(txtCidade.Text);
            sqlMinhaConta.UpdateParameters["NovaRua"].DefaultValue = cripto.Encrypt(txtRua.Text);
            sqlMinhaConta.UpdateParameters["NovoBairro"].DefaultValue = cripto.Encrypt(txtBairro.Text);
            sqlMinhaConta.UpdateParameters["NovoNum"].DefaultValue = cripto.Encrypt(txtNúmero.Text);
            sqlMinhaConta.UpdateParameters["NovoTel"].DefaultValue = cripto.Encrypt(txtTel.Text);


            //se nao colocar nesse formato, pula para o catch
            Convert.ToDateTime(txtData.Text);
            sqlMinhaConta.UpdateParameters["NovaDataNasc"].DefaultValue = txtData.Text;

            String foto, foto1BD;

            foto = flFoto.FileName;

            if (foto != "")
            {
                flFoto.SaveAs(Server.MapPath("\\Imagens\\ADM\\" + foto));
                foto1BD = "~\\Imagens\\ADM\\" + foto;
            }
            else
            {
                foto1BD = Image3.ImageUrl;
            }
            sqlMinhaConta.UpdateParameters["NovoFoto"]
                .DefaultValue = cripto.Encrypt(foto1BD);

            sqlMinhaConta.Update();

            sqlUpdateADM.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
            sqlUpdateADM.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Update");
            sqlUpdateADM.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Update Conta ADM");

            sqlUpdateADM.Insert();
        }
        //se der erro só no formato da data
        catch (FormatException)
        {
            lblData.Text = "Data inválida";
        }
    } 


    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomeADM.aspx");
    }
       
    protected void btnDesativar_Click(object sender, EventArgs e)
    {

        //Faz a contagem de ADM para ver se é possivel fazer a desativação da Conta
        DataView Count;
        Count = (DataView)sqlCount.Select(DataSourceSelectArguments.Empty);

        double qtd = Convert.ToDouble(Count.Table.Rows[0]["qtd"].ToString());

        //Se ele for igual a um não pode desativar
        if (qtd == 1)
        {
            lblErro.Text = "Não é possível desativar sua conta, para isso cadastre outro adm.";
        }
        else
        {
            //Desativar
            sqlDesativar.Update();
            
            //Salvar na auditoria
            sqlAuditoriaDesativar.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
            sqlAuditoriaDesativar.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Desativar");
            sqlAuditoriaDesativar.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Desativar Conta ");

            sqlAuditoriaDesativar.Insert();
            Response.Redirect("HomeINICIO.aspx");
        }
        
    }

}