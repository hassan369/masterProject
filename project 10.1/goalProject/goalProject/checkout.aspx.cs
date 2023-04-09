using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace goalProject
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                        con2 = new SqlConnection("data source=  DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");

                        // writing sql query  
                        SqlCommand cm = new SqlCommand($"select * from cart join product on cart.product_id = product.id where cart.user_id is null", con);
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


                            double x = Convert.ToDouble(sdr[9]);
                            double y = Convert.ToDouble(sdr[11]);
                            double newPrice = x - (x * y);
                            double originalAfterQty = x * Convert.ToInt32(sdr[4]);
                            double priceAfterQty = newPrice * Convert.ToInt32(sdr[4]);
                            PriceTotal += priceAfterQty;

                            //if (Convert.ToDecimal(sdr[11]) != 0)
                            //{
                            //    cartContainer.InnerHtml += $"<div class='cartBox' ><img class='productIMG'  src='{sdr[10]}' /> <span class='details'>{sdr[6]}</span class='details'><a style='text-decoration:none;padding:2px 10px;border-radius:5px;background-color:#f24726;color:white' href='qtyChange.aspx?sign=minus&id={sdr[5]}'>-</a>   <input style='text-align:center;width:85px' type=\"text\" name=\"fname\" value='{sdr[4]}'>    <a style='text-decoration:none;padding:2px 10px;border-radius:5px;background-color:#f24726;color:white' href='qtyChange.aspx?sign=plus&id={sdr[5]}'>+</a><span class='details' style='text-decoration: line-through;'>{originalAfterQty} $</span> <span class='details'>{priceAfterQty} $</span> <a style='color: red; font-weight: bold; text-decoration: none;'  class='details' href='deleteCart.aspx?id={sdr[0]}'>delete</a><br/> </div>";
                            //}
                            //else
                            //{
                            productList.InnerHtml += $"<li>{sdr[6]} <span>{priceAfterQty}JD</span></li>";
                            //}





                        }
                        SqlCommand comand2 = new SqlCommand($"select sum(product.price) from cart join product on cart.product_id = product.id join users on cart.user_id = users.id where cart.user_id = {Session["userId"]};", con2);

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
                Response.Redirect("login.aspx");
            }

        }
    }
}