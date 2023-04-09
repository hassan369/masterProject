using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace goalProject
{
    public partial class acart1 : System.Web.UI.Page
    {
        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Session["userId"] = null;
        //    Session["name"] = null;
        //    Session["email"] = null;
        //    Session["isAdmin"] = null;
        //    Response.Redirect("homePage.aspx");
        //}
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["userID"] != null)
            //{
            //    userName.Attributes.Add("href", $"user.aspx?id={Session["userId"]}");
            //    SqlConnection con5 = null;

            //    // Creating Connection
            //    con5 = new SqlConnection("data source=DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
            //    // writing sql query
            //    SqlCommand cm3 = new SqlCommand($"select sum(qty) from cart where user_id ={Convert.ToInt32(Session["userID"].ToString())}", con5);
            //    con5.Open();
            //    SqlDataReader sdr5 = cm3.ExecuteReader();
            //    while (sdr5.Read())
            //    {
            //        cartNum.InnerText = sdr5[0].ToString();
            //    }
            //}

            //if (Session["name"] == null)
            //{
            //    userName.Style.Add("display", "none");
            //    Button1.Style.Add("display", "none");
            //    //cart1.Style.Add("display", "none");
            //}
            //else
            //{
            //    register.Style.Add("display", "none");
            //    userName.Style.Add("display", "inline-block");
            //    userName.InnerHtml = Session["name"].ToString();
            //}



            //if (Session["name"] == null)
            //{
            //    // cart1.Style.Add("display", "none");
            //    dashboard.Style.Add("display", "none");
            //}
            //else
            //{
            //    // cart1.Style.Add("display", "inline-block");
            //    // userName.InnerHtml = Session["name"].ToString();
            //}



            //if (Session["name"] != null)
            //{

            //    signin.Style.Add("display", "none");

            //}
            //else
            //{
            //    signin.Style.Add("display", "inline-block");
            //}

            //if (Session["name"] == null)
            //{

            //    Button1.Attributes.Add("style", "display:none");
            //}
            //else
            //{
            //    Button1.Attributes.Add("style", "display:inline-block");
            //}
            //if (Session["isAdmin"] == null)
            //{

            //    dashboard.Style.Add("display", "none");

            //}
            //else
            //{
            //    dashboard.Style.Add("display", "inline-block");
            //    if (Convert.ToBoolean(Session["isAdmin"]))
            //    {
            //        // cart1.Style.Add("display", "none");
            //        dashboard.InnerHtml = "dashboard";
            //    }
            //}

            //if (Session["name"] != null)
            //{

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
                                cartContainer.InnerHtml += $" <tr>  <td class=\"shoping__cart__item\">\r\n                                        <img style='width:105px;' src='{sdr[10]}' alt=\"\">\r\n                                        <h5>{sdr[6]}</h5>\r\n                                    </td>\r\n                                    <td class=\"shoping__cart__price\">\r\n        {sdr[9]}\r\n                                    </td>\r\n                                    <td class=\"shoping__cart__quantity\">\r\n                                        <div class=\"quantity\">\r\n                                            <div class=\"pro-qty2\">\r\n                                                \r\n                                                <a style='text-decoration:none;padding:2px 10px;border-radius:5px;background-color:#f24726;color:white' href='qtyChange.aspx?sign=minus&id={sdr[5]}'>-</a>   \r\n                                                <input style='text-align:center;width:85px' type=\"text\" name=\"fname\" value='{sdr[4]}'>   \r\n                                                <a style='text-decoration:none;padding:2px 10px;border-radius:5px;background-color:#f24726;color:white' href='qtyChange.aspx?sign=plus&id={sdr[5]}'>+</a> \r\n                                            </div>\r\n                                        </div>\r\n                                    </td>\r\n                                    <td class=\"shoping__cart__total\">\r\n                                        {priceAfterQty}JD\r\n                                    </td>\r\n                                    <td class=\"shoping__cart__item__close\">\r\n                                        <a href='deleteCart.aspx?id={sdr[0]}'><span class=\"icon_close\"></span></a>\r\n                                    </td>\r\n                                </tr>";
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

            //}
            //else
            //{
            //    //Label1.Text = "please log in first";
            //}


        }
        protected void button_delete(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string currentDate = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");

            SqlConnection con = null;
            SqlConnection con2 = null;
            SqlConnection con3 = null;
            SqlConnection con4 = null;

            try
            {
                // Creating Connection  
                con = new SqlConnection("data source =DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                con2 = new SqlConnection("data source=  DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                con3 = new SqlConnection("data source=  DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                con4 = new SqlConnection("data source=  DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");

                // writing sql query  

                SqlCommand cm = new SqlCommand($"insert into orders  values('{currentDate}',   '{Session["userId"]}')", con);
                SqlCommand cm2 = new SqlCommand($"select * from cart join product on cart.product_id = product.id join users on cart.user_id = users.id where cart.user_id is null", con2);
                SqlCommand cm4 = new SqlCommand($"delete from cart where user_id = {Session["userId"]};", con4);

                // Opening Connection  
                con.Open();
                con2.Open();
                con4.Open();
                // Executing the SQL query  
                cm.ExecuteNonQuery();
                SqlDataReader sdr = cm2.ExecuteReader();
                // Iterating Data  
                while (sdr.Read())
                {
                    SqlCommand cm3 = new SqlCommand($"insert into orders_details(order_datee, product_id, qty_order_details) values ('{currentDate}', '{sdr[1]}', {sdr[4]});", con3);
                    con3.Open();
                    cm3.ExecuteNonQuery();
                    con3.Close();
                }
                cm4.ExecuteNonQuery();
                Response.Redirect($"acart.aspx?id={Session["id"]}");
                // Displaying a message  
                Console.WriteLine("Record Inserted Successfully");
                //Label1.Text = "Record Inserted Successfully";
            }
            catch (Exception A)
            {
                Label1.Attributes.Add("style", "display:inline-block");
                //Console.WriteLine("OOPs, something went wrong." + A);
                Label1.Text = "OOPs, something went wrong." + A;
            }
            // Closing the connection  
            finally
            {
                con.Close();
                con2.Close();
                con3.Close();
                con4.Close();
            }
        }

        protected void QtyPlus_Click(object sender, EventArgs e)
        {
            Response.Redirect("plus.aspx");
        }
        protected void QtyMinus_Click(object sender, EventArgs e)
        {
            Response.Redirect("minus.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                Response.Redirect("checkout.aspx");
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}