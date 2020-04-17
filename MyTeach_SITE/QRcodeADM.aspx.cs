using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using QRCoder;
using System.Drawing;
using System.IO;
using System.Drawing.Text;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

public partial class QRcodeADM : System.Web.UI.Page
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

        //Aparecer o nome
        lblNome.Text = Session["NomeADM"].ToString();
        imgQRcode.Visible = false;
    }

    protected void btnGerar_Click(object sender, EventArgs e)
    {
        //Gerar o QRCode
        PHQRCode.Visible = true;

        string valor = txtValor.Text;
        QRCodeGenerator qrGenerator = new QRCodeGenerator();
        QRCodeGenerator.QRCode qrCode = qrGenerator.CreateQrCode(valor, QRCodeGenerator.ECCLevel.Q);


        System.Web.UI.WebControls.Image imgQRCode = new System.Web.UI.WebControls.Image();
        imgQRCode.Height = 250;
        imgQRCode.Width = 250;

        using (Bitmap bitmap = qrCode.GetGraphic(20))
        {
            using (MemoryStream ms = new MemoryStream())
            {
                bitmap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                byte[] byteImage = ms.ToArray();
                imgQRCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
            }
            PHQRCode.Controls.Add(imgQRCode);

        }
    }

}
