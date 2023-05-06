using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterProject
{
    public partial class user : System.Web.UI.Page
    {

        protected void Button2_Click(object sender, EventArgs e)
        {

            Response.Redirect("userEDIT.aspx");
        }
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
            if (Session["userId"] != null)
            {
                if (!IsPostBack)
                {
                    SqlConnection con = null;
                    SqlConnection con2 = null;
                    try
                    {
                        // Creating Connection  
                        con = new SqlConnection("data source= DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                        con2 = new SqlConnection("data source= DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");

                        // writing sql query  
                        SqlCommand cm = new SqlCommand($"Select * from users where id = {Session["userId"]}", con);
                        SqlCommand cm2 = new SqlCommand($"select * from orders where orders.user_id = {Session["userId"]}", con2);

                        // Opening Connection  
                        con.Open();
                        // Executing the SQL query  
                        SqlDataReader sdr = cm.ExecuteReader();
                        // Iterating Data  
                        while (sdr.Read())
                        {
                            //product_id = Convert.ToInt32(sdr[0]);

                            //userContainer.InnerHtml = $"<div  > <span> email:{sdr[2]}</span> </div>";
                            //name1.InnerHtml = $"  {sdr[1]}";
                            name2.InnerHtml = $"  {sdr[1]}";
                            img.InnerHtml = $" <img class=\"rounded-circle img-fluid shadow p-2 mb-3 bg-#f6d365 rounded\"  style=\"width: 170px ; height:170px\"  ;   border: solid 8px #F24726!important\";   src='{sdr[5]}' /> ";
                            email.InnerHtml = $"{sdr[2]}";
                            hello.InnerHtml = $"  <span style='color:#F24726 ; font-size:57px ;font-wight:400px ; '> Hello</span>  {sdr[1]}";
                            phone.InnerHtml = sdr[6].ToString() ;
                            //TextBox1.Text = sdr[1].ToString();
                            //TextBox2.Text = sdr[2].ToString();
                            //TextBox3.Text = sdr[3].ToString();
                            //TextBox4.Text = sdr[4].ToString();
                            //TextBox6.Text = sdr[6].ToString();
                            //TextBox7.Text = sdr[7].ToString();

                            //Console.WriteLine(sdr["id"] + " " + sdr["name"] + " " + sdr["email"]); // Displaying Record  
                            //Label1.Text = sdr["id"] + " " + sdr["name"] + " " + sdr["email"];
                        }
                        con2.Open();
                        SqlDataReader sdr2 = cm2.ExecuteReader();
                        // Iterating Data  
                        while (sdr2.Read())
                        {
                            cartContainer.InnerHtml += $"<div class='cartBox' > <span class='details'>{sdr2[1]}</span><span><a class='details1' href='order.aspx?id={sdr2[0]}'>view</a></span> </div>\r\n";
                        }



                        }
                    catch (Exception S)
                    {
                        Console.WriteLine("OOPs, something went wrong.\n" + S);
                        //Label1.Text = "OOPs, something went wrong.\n" + S;
                    }
                    // Closing the connection  
                    finally
                    {
                        con.Close();
                    }

                }

            }
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