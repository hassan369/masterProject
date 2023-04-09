using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace goalProject
{
    public partial class about : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["userId"] = null;
            Session["name"] = null;
            Session["email"] = null;
            Session["isAdmin"] = null;
            Response.Redirect("homePage.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                userName.Style.Add("display", "none");
                Button1.Style.Add("display", "none");
                cart.Style.Add("display", "none");
            }
            else
            {
                register.Style.Add("display", "none");
                userName.Style.Add("display", "inline-block");
                userName.InnerHtml = Session["name"].ToString();
            }



            if (Session["name"] == null)
            {
                cart.Style.Add("display", "none");
                dashboard.Style.Add("display", "none");
            }
            else
            {
                cart.Style.Add("display", "inline-block");
                // userName.InnerHtml = Session["name"].ToString();
            }



            if (Session["name"] != null)
            {

                signin.Style.Add("display", "none");

            }
            else
            {
                signin.Style.Add("display", "inline-block");
            }

            if (Session["name"] == null)
            {

                Button1.Attributes.Add("style", "display:none");
            }
            else
            {
                Button1.Attributes.Add("style", "display:inline-block");
            }
            if (Session["isAdmin"] == null)
            {

                dashboard.Style.Add("display", "none");

            }
            else
            {
                dashboard.Style.Add("display", "inline-block");
                if (Convert.ToBoolean(Session["isAdmin"]))
                {
                    cart.Style.Add("display", "none");
                    dashboard.InnerHtml = "dashboard";
                }
            }
        }
    }
}