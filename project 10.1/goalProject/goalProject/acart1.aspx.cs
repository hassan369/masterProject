using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterProject
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
                    SqlCommand cm = new SqlCommand($"select * from cart join product on cart.product_id = product.id join users on cart.user_id = users.id where cart.user_id = {Session["userId"]}", con);
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

                            if (Convert.ToDecimal(sdr[11]) != 0)
                            {
                                cartContainer.InnerHtml += $@"<tr>
                                     <td class='shoping__cart__item'>
                                         <img style='width:105px;' src='{sdr[10]}' alt=''>
                                         <h5>{sdr[6]}</h5>
                                     </td>
                                     <td class='shoping__cart__price'>
                                         {sdr[9]}
                                     </td>
                                     <td class='shoping__cart__quantity'>
                                         <div class='quantity'>
                                             <div class='pro-qty2'>
                                                 <a style='text-decoration:none;padding:2px 10px;border-radius:5px;background-color:#f24726;color:white' href='qtyChange.aspx?sign=minus&id={sdr[5]}'>-</a>
                                                 <input style='text-align:center;width:85px' type='text' name='fname' value='{sdr[4]}'>
                                                 <a style='text-decoration:none;padding:2px 10px;border-radius:5px;background-color:#f24726;color:white' href='qtyChange.aspx?sign=plus&id={sdr[5]}'>+</a>
                                             </div>
                                         </div>
                                     </td>
                                     <td class='shoping__cart__total'>
                                         {priceAfterQty}JD
                                     </td>
                                     <td class='shoping__cart__item__close'>
                                         <a href='deleteCart.aspx?id={sdr[0]}'><span class='icon_close'></span></a>
                                     </td>
                                 </tr>";
                            }
                            else
                            {
                                cartContainer.InnerHtml += $@"<tr>
                                     <td class='shoping__cart__item'>
                                         <img style='width:105px;' src='{sdr[10]}' alt=''>
                                         <h5>{sdr[6]}</h5>
                                     </td>
                                     <td class='shoping__cart__price'>
                                         {sdr[9]}
                                     </td>
                                     <td class='shoping__cart__quantity'>
                                         <div class='quantity'>
                                             <div class='pro-qty2'>
                                                 <a style='text-decoration:none;padding:2px 10px;border-radius:5px;background-color:#f24726;color:white' href='qtyChange.aspx?sign=minus&id={sdr[5]}'>-</a>
                                                 <input style='text-align:center;width:85px' type='text' name='fname' value='{sdr[4]}'>
                                                 <a style='text-decoration:none;padding:2px 10px;border-radius:5px;background-color:#f24726;color:white' href='qtyChange.aspx?sign=plus&id={sdr[5]}'>+</a>
                                             </div>
                                         </div>
                                     </td>
                                     <td class='shoping__cart__total'>
                                         {priceAfterQty}JD
                                     </td>
                                     <td class='shoping__cart__item__close'>
                                         <a href='deleteCart.aspx?id={sdr[0]}'><span class='icon_close'></span></a>
                                     </td>
                                 </tr>";
                            }








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
                // Load cart items from cookies for unauthenticated users
                double PriceTotal = LoadCartFromCookies();
                totalPrice.InnerHtml = PriceTotal.ToString();
            }


        }

        private Dictionary<int, int> GetTempCart()
        {
            var tempCart = new Dictionary<int, int>();

            if (Request.Cookies["tempCart"] != null)
            {
                string[] items = Request.Cookies["tempCart"].Value.Split(',');

                foreach (string item in items)
                {
                    string[] data = item.Split('-');
                    int productId = int.Parse(data[0]);
                    int qty = int.Parse(data[1]);
                    tempCart.Add(productId, qty);
                }
            }

            return tempCart;
        }

        private double LoadCartFromCookies()
        {
            var tempCart = GetTempCart();
            double PriceTotal = 0;

            if (tempCart.Count > 0)
            {
                SqlConnection con = null;
                try
                {
                    con = new SqlConnection("data source= DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");

                    foreach (var item in tempCart)
                    {
                        int productId = item.Key;
                        int qty = item.Value;

                        SqlCommand cm = new SqlCommand($"SELECT * FROM product WHERE id = {productId}", con);
                        con.Open();
                        SqlDataReader sdr = cm.ExecuteReader();

                        if (sdr.Read())
                        {
                            double x = Convert.ToDouble(sdr["price"]);
                            double y = Convert.ToDouble(sdr["discount"]);
                            double newPrice = x - (x * y);
                            double originalAfterQty = x * qty;
                            double priceAfterQty = newPrice * qty;
                            PriceTotal += priceAfterQty;

                            cartContainer.InnerHtml += $@"<tr>
        <td class='shoping__cart__item'>
            <img style='width:105px;' src='{sdr["imgSrc"]}' alt=''>
            <h5>{sdr["name"]}</h5>
        </td>
        <td class='shoping__cart__price'>
            {sdr["price"]}
        </td>
        <td class='shoping__cart__quantity'>
            <div class='quantity'>
                <div class='pro-qty2'>
                    <a style='text-decoration:none;padding:2px 10px;border-radius:5px;background-color:#f24726;color:white' href='qtyChange.aspx?sign=minus&id={sdr["id"]}'>-</a>
                    <input style='text-align:center;width:85px' type='text' name='fname' value='{qty}'>
                    <a style='text-decoration:none;padding:2px 10px;border-radius:5px;background-color:#f24726;color:white' href='qtyChange.aspx?sign=plus&id={sdr["id"]}'>+</a>
                </div>
            </div>
        </td>
        <td class='shoping__cart__total'>
            {priceAfterQty}JD
        </td>
        <td class='shoping__cart__item__close'>
            <a href='deleteCart.aspx?id={sdr["id"]}'><span class='icon_close'></span></a>
        </td>
    </tr>";
                        }
                        con.Close();
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions if needed
                }
                finally
                {
                    if (con != null)
                    {
                        con.Close();
                    }
                }
            }

            return PriceTotal;
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