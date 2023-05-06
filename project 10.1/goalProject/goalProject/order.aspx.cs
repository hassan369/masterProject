using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterProject
{
    public partial class order : System.Web.UI.Page
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
                cart1.Style.Add("display", "none");
            }
            else
            {
                register.Style.Add("display", "none");
                userName.Style.Add("display", "inline-block");
                userName.InnerHtml = Session["name"].ToString();
            }



            if (Session["name"] == null)
            {
                cart1.Style.Add("display", "none");
                dashboard.Style.Add("display", "none");
            }
            else
            {
                cart1.Style.Add("display", "inline-block");
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
                    cart1.Style.Add("display", "none");
                    dashboard.InnerHtml = "dashboard";
                }
            }

            if (Session["name"] != null)
            {

                if (!IsPostBack)
                {
                    SqlConnection con = null;
                    SqlConnection con2 = null;
                    try
                    {
                        // Creating Connection  
                        con = new SqlConnection("data source=  DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                        con2 = new SqlConnection("data source= DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");

                        // writing sql query  
                        SqlCommand cm = new SqlCommand($"select * from  orders_details join product on orders_details.product_id = product.id join orders on orders.datee = orders_details.order_datee where orders.id= {Request.QueryString["id"]}", con);
                        // Opening Connection  
                        con.Open();
                        con2.Open();
                        // Executing the SQL query  
                        SqlDataReader sdr = cm.ExecuteReader();
                        // Iterating Data  
                        double PriceTotal = 0;
                        
                        while (sdr.Read())
                        {
                            //Button button = new Button();
                            //button.Click += new EventHandler(button_delete);
                            //button.ID = Convert.ToString(sdr[0]) ;


                            double x = Convert.ToDouble(sdr[8]);
                            double y = Convert.ToDouble(sdr[10]);
                            double newPrice = x - (x * y);
                            double originalAfterQty = x * Convert.ToInt32(sdr[3]);
                            double priceAfterQty = newPrice * Convert.ToInt32(sdr[3]);
                            PriceTotal += priceAfterQty;

                            if (Convert.ToDecimal(sdr[10]) != 0)
                            {
                                cartContainer.InnerHtml += $"<div class='cartBox' ><img class='productIMG'  src='{sdr[9]}' /> <span class='details'>{sdr[5]}</span class='details'> <span class='details' style='text-decoration: line-through;'>{sdr[8]} $</span> <span class='details'>{newPrice} $</span> <br/> </div>";
                            }
                            else
                            {
                                cartContainer.InnerHtml += $"<div class='cartBox' ><img class='productIMG'  src='{sdr[9]}' /> <span class='details'>{sdr[5]}</span class='details'> <span class='details' >{sdr[8]} $</span> <br/> </div>";
                            }





                        }
                        SqlCommand comand2 = new SqlCommand($"select sum(product.price) from orders join orders_details on orders_details.order_datee = orders.datee join product on orders_details.product_id = product.id where orders.id = {Request.QueryString["id"]};", con2);

                        SqlDataReader rdr2 = comand2.ExecuteReader();
                        while (rdr2.Read())
                        {

                            totalPrice.InnerHtml = PriceTotal.ToString();


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
                        con2.Close();
                    }

                }

            }
            else
            {
                Label1.Text = "please log in first";
            }
        }
    }
}