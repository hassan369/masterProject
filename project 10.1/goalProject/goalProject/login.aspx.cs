using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterProject
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

        private void MergeTempCartWithUserCart(int userId)
        {
            var tempCart = GetTempCart();

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

                        SqlCommand checkCartCmd = new SqlCommand($"SELECT * FROM cart WHERE product_id = {productId} AND user_id = {userId}", con);
                        con.Open();
                        SqlDataReader sdr = checkCartCmd.ExecuteReader();
                        bool itemExists = sdr.HasRows;
                        con.Close();

                        if (itemExists)
                        {
                            SqlCommand updateCmd = new SqlCommand($"UPDATE cart SET qty = qty + {qty} WHERE product_id = {productId} AND user_id = {userId}", con);
                            con.Open();
                            updateCmd.ExecuteNonQuery();
                            con.Close();
                        }
                        else
                        {
                            SqlCommand insertCmd = new SqlCommand($"INSERT INTO cart (product_id, user_id, qty) VALUES ({productId}, {userId}, {qty})", con);
                            con.Open();
                            insertCmd.ExecuteNonQuery();
                            con.Close();
                        }
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

                // Clear the temporary cart cookie
                if (Response.Cookies["tempCart"] != null)
                {
                    HttpCookie tempCartCookie = new HttpCookie("tempCart");
                    tempCartCookie.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(tempCartCookie);
                }
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
                            Session["phoneNumber"] = sdr[6];
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
                        Session["phoneNumber"] = sdr[6];

                        // Merge the temporary cart with the user's existing cart
                        MergeTempCartWithUserCart(Convert.ToInt32(sdr[0]));

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