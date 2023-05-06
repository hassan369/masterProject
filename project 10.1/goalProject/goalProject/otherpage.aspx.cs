using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace goalProject
{
    public partial class otherpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                

                


               
                    int productId = Convert.ToInt32(Request.QueryString["id"]);
                    int qty = 1;

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



                string returnUrl = Request.QueryString["returnUrl"];
                string scrollPosition = Request.QueryString["scrollPosition"];


                if (returnUrl.Contains("?"))
                {
                    Response.Redirect($"{returnUrl}&actionCompleted=true&scrollPosition={scrollPosition}");
                }
                else
                {
                    Response.Redirect($"{returnUrl}?actionCompleted=true&scrollPosition={scrollPosition}");
                }
                


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
    }
}