using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterProject
{
    public partial class homePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                SqlConnection con5 = null;

                // Creating Connection
                con5 = new SqlConnection("data source = DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                // writing sql query
                SqlCommand cm3 = new SqlCommand($"select sum(qty) from cart where user_id ={Convert.ToInt32(Session["userID"].ToString())}", con5);
                con5.Open();
                SqlDataReader sdr5 = cm3.ExecuteReader();
                while (sdr5.Read())
                {
                    cartNum.InnerText = sdr5[0].ToString();
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
                //register.Style.Add("display", "none");
                userName.Style.Add("display", "inline-block");
                userName.InnerHtml = Session["name"].ToString();
                userName.Attributes.Add("href", $"user.aspx?id={Session["userID"]}");
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




            if (!IsPostBack)
            {
                SqlConnection con = null;
                try
                {
                    // Creating Connection  
                    con = new SqlConnection("data source= DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                    // writing sql query  
                    SqlCommand cm = null;
                    if (Request.QueryString["category"] == null)
                    {
                         cm = new SqlCommand($"Select * from product", con);
                    }
                    else
                    {
                        if (Request.QueryString["category"] == "discount")
                        {
                            cm = new SqlCommand($"select * from product where discount <> 0", con);
                        }
                        else 
                        {
                            cm = new SqlCommand($"select * from product where category = '{Request.QueryString["category"]}'", con);
                        }
                        
                    }
                    
                    // Opening Connection  
                    con.Open();
                    // Executing the SQL query  
                    SqlDataReader sdr = cm.ExecuteReader();
                    // Iterating Data  
                    while (sdr.Read())
                    {
                        if (Convert.ToDecimal(sdr[6]) != 0)
                        {
                            double priceAfter = Convert.ToDouble(sdr[4]) * (1 - Convert.ToDouble(sdr[6]));
                            //productsContainer.InnerHtml += $"<a href='product.aspx?id={sdr[0]}'><div><img style='width:100px; height:50px;' src='{sdr[5]}'/> <span>name:{sdr[1]}</span> <span>price:{sdr[4]}$</span> <span>discount:{sdr[6]}</span> </div></a>";
                            productsContainer.InnerHtml += $"<a href='product.aspx?id={sdr[0]}'><div style='height:400px; width:220px' id='card-pro' class=' card bg- text-white container-fluied'><img class='img_product' src='{sdr[5]}'/><h5 class=\"card-title\"><span>discount: {Convert.ToDouble(sdr[6])*100}%</span></h5> <ul class=\"list-group list-group-flush\"> <li class=\"list-group-item\"><span style='font-weight:bold;'></span> <span>{sdr[1]}</span></li> <li class=\"list-group-item\"><span style='font-weight:bold;'>price:  </span><span style='text-decoration:line-through;'>{sdr[4]}$</span>     <span style='  font-weight:bold;   color:white; background-color:#f24726;'>{priceAfter}$</span></li></ul> </div></a>";
                        }
                        else 
                        {
                            //productsContainer.InnerHtml += $"<a href='product.aspx?id={sdr[0]}'><div><img style='width:100px; height:50px;' src='{sdr[5]}'/> <span>name:{sdr[1]}</span> <span>price:{sdr[4]}$</span> </div></a>";
                            productsContainer.InnerHtml += $"<a href='product.aspx?id={sdr[0]}'> <div class='card pro' style='height:400px;  width:220px'><img class='img_product' src='{sdr[5]}'/> <span style='width:220px;'><ul class=\"list-group list-group-flush\"><li class=\"list-group-item\"><span style='font-weight:bold;';></span><span>{sdr[1]}</span></li> <li class=\"list-group-item\"><span style='font-weight:bold;'>price</span>  <span>{sdr[4]}$</span></li></ul></span> </div></a>";

                        }




                    }
                }
                catch (Exception S)
                {
                    Console.WriteLine("OOPs, something went wrong.\n" + S);
                    Label1.Text = "OOPs, something went wrong.\n" + S;
                }
                // Closing the connection  
                finally
                {
                    con.Close();
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["userId"] = null;
            Session["name"] = null;
            Session["email"] = null;
            Session["isAdmin"] = null;
            Response.Redirect("homePage.aspx");
        }
    }
}