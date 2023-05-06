using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterProject
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                userName.InnerHtml = "Login";
                userNameHref.Attributes.Add("href", "login.aspx");
                // Button1.Style.Add("display", "none");
                //cart.Style.Add("display", "none");
            }
            else
            {
                //register.Style.Add("display", "none");
                userName.InnerHtml = Session["name"].ToString();

                userNameHref.Attributes.Add("href", $"user.aspx?id={Session["userID"]}");
            }
            int totalQuantity = 0;

            if (Session["name"] != null)
            {
                int userId = Convert.ToInt32(Session["userId"]);
                string connectionString = "data source = DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("SELECT SUM(qty) FROM cart WHERE user_id = @UserId", con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);

                        object result = cmd.ExecuteScalar();
                        if (result != DBNull.Value)
                        {
                            totalQuantity = Convert.ToInt32(result);
                        }
                    }
                }
            }
            else
            {
                var tempCart = GetTempCart();

                foreach (var item in tempCart)
                {
                    totalQuantity += item.Value;
                }
            }

            cartNum.InnerHtml = totalQuantity.ToString();
            cartNum2.InnerHtml = totalQuantity.ToString();

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
    }
}