using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace goalProject
{
    public partial class homePage1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["userID"] != null)
            //{
            //    SqlConnection con5 = null;

            //    // Creating Connection
            //    con5 = new SqlConnection("data source = DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
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
            //    cart.Style.Add("display", "none");
            //}
            //else
            //{
            //    //register.Style.Add("display", "none");
            //    userName.Style.Add("display", "inline-block");
            //    userName.InnerHtml = Session["name"].ToString();
            //    userName.Attributes.Add("href", $"user.aspx?id={Session["userID"]}");
            //}



            //if (Session["name"] == null)
            //{
            //    cart.Style.Add("display", "none");
            //    dashboard.Style.Add("display", "none");
            //}
            //else
            //{
            //    cart.Style.Add("display", "inline-block");
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
            //        cart.Style.Add("display", "none");
            //        dashboard.InnerHtml = "dashboard";
            //    }
            //}




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
                            productsContainer.InnerHtml += $"<div class='col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat'>     <div class=\"featured__item\">\r\n                        <a href='product1.aspx?id={sdr[0]}'>\r\n                        <div class=\"featured__item__pic set-bg\" data-setbg='{sdr[5]}'>\r\n        </a>                   <ul class='featured__item__pic__hover'>                               <li><a href='product1.aspx?id={sdr[0]}'><i class='fa fa-retweet'></i></a></li>                               <li><a href='product.aspx?id={sdr[0]}'><i class='fa fa-shopping-cart'></i></a></li>                         </ul>                 </div>                     </a>                     <div class=\"featured__item__text\">\r\n                            <h6><a href=\"#\">{sdr[1]}</a></h6>\r\n                            <h5><span style=\"text-decoration:line-through\">{sdr[4]}JD</span>{priceAfter}JD</h5>\r\n                        </div>\r\n                    </div>\r\n                </div>";

                        }
                        else
                        {
                            //productsContainer.InnerHtml += $"<a href='product.aspx?id={sdr[0]}'><div><img style='width:100px; height:50px;' src='{sdr[5]}'/> <span>name:{sdr[1]}</span> <span>price:{sdr[4]}$</span> </div></a>";
                            productsContainer.InnerHtml += $"<div class=\"col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat\">\r\n   <div class=\"featured__item\">\r\n                        <a href='product1.aspx?id={sdr[0]}'>\r\n                        <div class=\"featured__item__pic set-bg\" data-setbg='{sdr[5]}'>\r\n           </a>                 <ul class='featured__item__pic__hover'>                               <li><a href=product1.aspx?id={sdr[0]}><i class=\"fa fa-retweet\"></i></a></li>                              <li><a href=\"product.aspx?id={sdr[0]}\"><i class=\"fa fa-shopping-cart\"></i></a></li>\r\n                            </ul>\r\n                        </div>\r\n                        </a>\r\n                        <div class=\"featured__item__text\">\r\n                            <h6><a href=\"#\">{sdr[1]}</a></h6>\r\n                            <h5>{sdr[4]}JD</h5>\r\n                        </div>\r\n                    </div>\r\n                </div>";

                        }




                    }
                }
                catch (Exception S)
                {
                    Console.WriteLine("OOPs, something went wrong.\n" + S);
                   //// Label1.Text = "OOPs, something went wrong.\n" + S;
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