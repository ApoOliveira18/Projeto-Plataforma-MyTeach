using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
public partial class ContatoINICIO : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        // criando um servidor smtp do tipo GMAIL para
        // usarmos o email generico6wa
        SmtpClient cliente = new SmtpClient("smtp.gmail.com");
        cliente.EnableSsl = true;
        cliente.Port = 587;
        cliente.UseDefaultCredentials = false;

        // email do remetente -> quem está enviando
        MailAddress remetente = new MailAddress(txtEmail.Text, txtNome.Text);

        // email do destinatario -> quem irá receber
        MailAddress destinatario = new MailAddress("2p1f1j@gmail.com", "Projeto MyTeach");

        // criando a mensagem
        MailMessage mensagem = new MailMessage(remetente, destinatario);

        // criando conteúdo da mensagem
        mensagem.Body = "Email do Cliente: " + txtEmail.Text + "\r\n" +
                        "Mensagem: " + txtMensagem.Text;      // conteúdo
        mensagem.Subject = txtAssunto.Text; // assunto

        // criar um email no HOTMAIL para ser o gerenciador de envio de email´s
        // aqui precisa do email completo e da senha
        NetworkCredential credenciais = new NetworkCredential("generico6wa@gmail.com", "generico_6wa", "");
        cliente.Credentials = credenciais;


        try
        {
            cliente.Send(mensagem);
            lblErro.Text = "Seu email foi enviado com sucesso. Aguarde contato.";

            string camposLogin;

             camposLogin= "UIkit.notify({message : 'Por favor, preencha todos os campos!',status  : 'danger',timeout : 6000,pos: 'bottom-right'});";

            txtNome.Text = "";
            txtMensagem.Text = "";
            txtEmail.Text = "";
            txtAssunto.Text = "";
        }
        catch (Exception ex)
        {
            lblErro.Text = ex.ToString();
            string camposLogin;

            camposLogin = "UIkit.notify({message : 'Por favor, preencha todos os campos!',status  : 'danger',timeout : 6000,pos: 'bottom-right'});";

        }
    }
}