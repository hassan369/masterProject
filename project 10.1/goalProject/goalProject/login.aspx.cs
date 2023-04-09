using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace goalProject
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["redirectId"] != null)
            {
                registerId.Attributes.Add("href", $"register.aspx?redirectId={Request.QueryString["redirectId"]}");
            }
            else
            {
                registerId.Attributes.Add("href", "register.aspx");

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text==""|| TextBox2.Text=="")
            {
                Label1.Text = "please fill all fields";
                return;
            }
            SqlConnection con = null;
            try
            {
                // Creating Connection  
                con = new SqlConnection("data source= DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                // writing sql query  
                SqlCommand cm = new SqlCommand("Select * from users", con);
                // Opening Connection  
                con.Open();
                // Executing the SQL query  
                SqlDataReader sdr = cm.ExecuteReader();
                // Iterating Data  
                while (sdr.Read())
                {
                    string Email = Convert.ToString(sdr[2]);
                    string Password = Convert.ToString(sdr[3]);
                    if (TextBox1.Text == Email  && TextBox2.Text == Password )
                    {
                        
                        if (Convert.ToInt32(sdr[4]) == 1)
                        {
                            Label1.Text = "user is admin";
                            Session["userId"] = sdr[0];
                            Session["name"] = sdr[1];
                            Session["email"] = sdr[2];
                            Session["isAdmin"] = Convert.ToBoolean(sdr[4]);
                            Response.Redirect("dashboard.aspx");

                        }
                        else
                        {
                            Label1.Text = "user in not admin";
                            
                        }
                        //the next session must be one time before the privious if.
                        Session["userId"] = sdr[0];
                        Session["name"] = sdr[1];
                        Session["email"] = sdr[2];
                        Session["isAdmin"] = Convert.ToBoolean(sdr[4]) ;
                        if (Request.QueryString["redirectId"] != null)
                        {
                            Response.Redirect($"product.aspx?id={Request.QueryString["redirectId"]}");
                        }
                        else
                        {
                            Response.Redirect("checkout.aspx");
                        }
                        
                        break;
                    }
                    else
                    {
                        Label1.Text = "<a style='color:#f24726; text-decoration:none;' href='register.aspx'>user is not registerd</a>";
                        
                    }


                   // Console.WriteLine(sdr["id"] + " " + sdr["name"] + " " + sdr["email"]); // Displaying Record  
                    //Label1.Text = sdr["id"] + " " + sdr["name"] + " " + sdr["email"];
                }
            }
            catch (Exception S)
            {
                //Console.WriteLine("OOPs, something went wrong.\n" + S);
                Label1.Text = "OOPs, something went wrong.\n" + S;
            }
            // Closing the connection  
            finally
            {
                con.Close();
            }
        }
    }
}