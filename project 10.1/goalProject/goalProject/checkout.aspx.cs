using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


namespace masterProject
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

                            totalPrice.InnerHtml = PriceTotal.ToString() + "JD";


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

                    //autofill the shipping info from user table
                    if (Session["name"] != null)
                    {
                        txtFullName.Text = Session["name"].ToString();
                    }

                    if (Session["email"] != null)
                    {
                        txtEmail.Text = Session["email"].ToString();
                    }

                    if (Session["phoneNumber"] != null)
                    {
                        txtContactNumber.Text = Session["phoneNumber"].ToString();
                    }
                }

            }
            else
            {
                Response.Redirect("login.aspx");
            }

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
                con = new SqlConnection("data source =DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                con2 = new SqlConnection("data source=  DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                con3 = new SqlConnection("data source=  DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                con4 = new SqlConnection("data source=  DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");

                string fullName = txtFullName.Text.Trim();
                string contactNumber = txtContactNumber.Text.Trim();
                string email = txtEmail.Text.Trim();
                string address = txtAddress.Text.Trim();
                string deliveryInstructions = txtDeliveryInstructions.Text.Trim();

                SqlCommand cm = new SqlCommand($"INSERT INTO orders (datee, user_id, full_name, contact_number, email, address, delivery_instructions) VALUES ('{currentDate}', '{Session["userId"]}', '{fullName}', '{contactNumber}', '{email}', '{address}', '{deliveryInstructions}'); SELECT SCOPE_IDENTITY();", con);
                SqlCommand cm2 = new SqlCommand($"select * from cart join product on cart.product_id = product.id join users on cart.user_id = users.id where cart.user_id = {Session["userId"]}", con2);
                SqlCommand cm4 = new SqlCommand($"delete from cart where user_id = {Session["userId"]};", con4);

                con.Open();
                con2.Open();
                con4.Open();

                object orderIdObj = cm.ExecuteScalar();
                int orderId = Convert.ToInt32(orderIdObj);

                SqlDataReader sdr = cm2.ExecuteReader();

                while (sdr.Read())
                {
                    SqlCommand cm3 = new SqlCommand($"INSERT INTO orders_details (order_id, product_id, qty_order_details) VALUES ({orderId}, '{sdr[1]}', {sdr[4]});", con3);
                    con3.Open();
                    cm3.ExecuteNonQuery();
                    con3.Close();
                }

                cm4.ExecuteNonQuery();
                Response.Redirect($"acart.aspx?id={Session["id"]}");

            }
            catch (Exception A)
            {
             //   Label1.Attributes.Add("style", "display:inline-block");
               // Label1.Text = "OOPs, something went wrong." + A;
            }
            finally
            {
                con.Close();
            }
        }

    }
}