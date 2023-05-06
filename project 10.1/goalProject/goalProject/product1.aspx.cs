using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterProject
{
    public partial class product1 : System.Web.UI.Page
    {
        int product_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                SqlConnection con5 = null;

                // Creating Connection
                con5 = new SqlConnection("data source=DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                // writing sql query
                SqlCommand cm3 = new SqlCommand($"select sum(qty) from cart where user_id ={Convert.ToInt32(Session["userID"].ToString())}", con5);
                con5.Open();
                SqlDataReader sdr5 = cm3.ExecuteReader();
                while (sdr5.Read())
                {
                   //// cartNum.InnerText = sdr5[0].ToString();
                }
            }

            SqlConnection con = null;
            SqlConnection con2 = null;
            try
            {
                // Creating Connection  
                con = new SqlConnection("data source=  DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                con2 = new SqlConnection("data source= DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                // writing sql query  
                SqlCommand cm = new SqlCommand($"Select * from product where id = {Request.QueryString["id"]}", con);
                SqlCommand cm2 = new SqlCommand($"Select * from reviews where product_id ='{Request.QueryString["id"]}'", con2);
                // Opening Connection  
                con.Open();
                con2.Open();
                // Executing the SQL query  
                SqlDataReader sdr = cm.ExecuteReader();
                // Iterating Data  
                int qty = 0;
                while (sdr.Read())
                {
                    qty = Convert.ToInt32(sdr[7]);
                    product_id = Convert.ToInt32(sdr[0]);

                    productimg.InnerHtml = $"<img class=\"product__details__pic__item--large\"\r\n                                src='{sdr[5]}' alt=\"\">";
                    //productContainer.InnerHtml = $"<div><img src='{sdr[5]}' /> <span>{sdr[1]}</span> <span>{sdr[2]}</span> <span>{sdr[3]}</span> <span>{sdr[4]}</span> <span>{sdr[6]}</span> <span>{sdr[7]}</span>  </div>";
                    titleProduct.InnerHtml = $"{sdr[1]}";
                   // titleProduct2.InnerHtml = $"{sdr[1]}";
                    descriPtionProduct.InnerHtml = $"{sdr[2]}";
                    //categoryName.InnerHtml = $"{sdr[3]}";
                    price.InnerHtml = $"{sdr[4]}JD";
                    double x = Convert.ToDouble(sdr[4]);
                    double y = Convert.ToDouble(sdr[6]);
                    double newPrice = x - (x * y);
                    //priceDiscount.InnerHtml = Convert.ToString(newPrice);
                    //countInStock.InnerHtml = $"{sdr[7]}";
                    //TextBox1.Text = sdr[1].ToString();
                    //TextBox2.Text = sdr[2].ToString();
                    //TextBox3.Text = sdr[3].ToString();
                    //TextBox4.Text = sdr[4].ToString();
                    //TextBox6.Text = sdr[6].ToString();
                    //TextBox7.Text = sdr[7].ToString();

                    //Console.WriteLine(sdr["id"] + " " + sdr["name"] + " " + sdr["email"]); // Displaying Record  
                    //Label1.Text = sdr["id"] + " " + sdr["name"] + " " + sdr["email"];
                }
                for (int i = 1; i <= qty; i++)
                {
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));

                }
                SqlDataReader sdr2 = cm2.ExecuteReader();
                while (sdr2.Read())
                {
                    innerMessage.InnerHtml += $"<div><p style='color:#F24726;'>{sdr2[1]}</p><p>{sdr2[3]}</p></div><hr/>";
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

        private void SaveTempCart(Dictionary<int, int> tempCart)
        {
            var items = tempCart.Select(kv => $"{kv.Key}-{kv.Value}");
            string cookieValue = string.Join(",", items);

            HttpCookie cookie = new HttpCookie("tempCart", cookieValue);
            cookie.Expires = DateTime.Now.AddDays(30); // You can set the expiration date based on your requirements
            Response.Cookies.Add(cookie);
        }


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int productId = Convert.ToInt32(Request.QueryString["id"]);
            int qty = Convert.ToInt32(DropDownList1.SelectedValue);

            if (Session["name"] != null)
            {
                int userId = Convert.ToInt32(Session["userId"]);
                string connectionString = "data source = DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI";

                try
                {
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();

                        bool productExistsInCart = false;

                        using (SqlCommand cmdCheck = new SqlCommand("SELECT COUNT(*) FROM cart WHERE product_id = @ProductId AND user_id = @UserId", con))
                        {
                            cmdCheck.Parameters.AddWithValue("@ProductId", productId);
                            cmdCheck.Parameters.AddWithValue("@UserId", userId);

                            int count = (int)cmdCheck.ExecuteScalar();
                            productExistsInCart = count > 0;
                        }

                        if (productExistsInCart)
                        {
                            using (SqlCommand cmdUpdate = new SqlCommand("UPDATE cart SET qty = @Qty WHERE product_id = @ProductId AND user_id = @UserId", con))
                            {
                                cmdUpdate.Parameters.AddWithValue("@Qty", qty);
                                cmdUpdate.Parameters.AddWithValue("@ProductId", productId);
                                cmdUpdate.Parameters.AddWithValue("@UserId", userId);

                                cmdUpdate.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            using (SqlCommand cmdInsert = new SqlCommand("INSERT INTO cart (product_id, user_id, qty) VALUES (@ProductId, @UserId, @Qty)", con))
                            {
                                cmdInsert.Parameters.AddWithValue("@ProductId", productId);
                                cmdInsert.Parameters.AddWithValue("@UserId", userId);
                                cmdInsert.Parameters.AddWithValue("@Qty", qty);

                                cmdInsert.ExecuteNonQuery();
                            }
                        }
                    }

                    Console.WriteLine("Record Inserted/Updated Successfully");
                }
                catch (Exception ex)
                {
                   // Label1.Text = "OOPs, something went wrong." + ex;
                }
            }
            else
            {
                var tempCart = GetTempCart();

                if (tempCart.ContainsKey(productId))
                {
                    tempCart[productId] = qty;
                }
                else
                {
                    tempCart.Add(productId, qty);
                }

                SaveTempCart(tempCart);
            }
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                SqlConnection con = null;
                try
                {
                    // Creating Connection  
                    con = new SqlConnection("data source = DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                    // writing sql query  

                   ///////// SqlCommand cm = new SqlCommand($"insert into reviews  ( user_name, product_id, comment)values('{Session["name"]}',   {Convert.ToInt32(Request.QueryString["id"])}   ,    '{TextBox1.Text}')", con);
                    // Opening Connection  
                    con.Open();
                    // Executing the SQL query  
                  /////////////////  cm.ExecuteNonQuery();
                    // Displaying a message  
                    Console.WriteLine("Record Inserted Successfully");
                    Response.Redirect($"product.aspx?id={Request.QueryString["id"]}");
                    //Label1.Text = "Record Inserted Successfully";
                }
                catch (Exception A)
                {
                    //Label1.Attributes.Add("style", "display:inline-block");
                    Console.WriteLine("OOPs, something went wrong." + A);
                    // Label1.Text = "OOPs, something went wrong." + A;
                }
                // Closing the connection  
                finally
                {
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }
    }
 }
 