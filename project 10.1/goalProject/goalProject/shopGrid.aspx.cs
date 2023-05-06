using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace goalProject
{
    public partial class shopGrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["actionCompleted"] == "true")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", "showAlert();", true);
                }
            }




            if (!IsPostBack)
            {
                SqlConnection con = null;
                try
                {
                    // Creating Connection  
                    con = new SqlConnection("data source= DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                    // writing sql query  
                    SqlCommand cm = null;

                    string category = Request.QueryString["category"];
                    if (category != null)
                    {
                        category = category.Replace("and", "&");
                    }
                    if (category == null)
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
                            
                            cm = new SqlCommand($"select * from product where category = @category", con);
                            cm.Parameters.AddWithValue("@category", category);
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
                            string returnUrl = HttpUtility.UrlEncode(Request.Url.ToString());

                            double priceAfter = Convert.ToDouble(sdr[4]) * (1 - Convert.ToDouble(sdr[6]));
                            //productsContainer.InnerHtml += $"<a href='product.aspx?id={sdr[0]}'><div><img style='width:100px; height:50px;' src='{sdr[5]}'/> <span>name:{sdr[1]}</span> <span>price:{sdr[4]}$</span> <span>discount:{sdr[6]}</span> </div></a>";
                            productsContainer.InnerHtml += $"<div class='col-lg-4 col-md-6 col-sm-6'>     <div class=\"featured__item\">\r\n                        <a href='product1.aspx?id={sdr[0]}'>\r\n                        <div class=\"featured__item__pic set-bg\" data-setbg='{sdr[5]}'>\r\n      </a>                   <ul class='featured__item__pic__hover'>                               <li><a href='product1.aspx?id={sdr[0]}'><i class='fa fa-search'></i></a></li>                               <li><a href='otherpage.aspx?id={sdr[0]}&returnUrl={returnUrl}&scrollPosition={{scrollPosition}}'><i class='fa fa-shopping-cart'></i></a></li>                         </ul>                 </div>                     </a>                     <div class=\"featured__item__text\">\r\n                            <h6><a href=\"#\">{sdr[1]}</a></h6>\r\n                            <h5><span style=\"text-decoration: line-through; text-decoration-color: #ff0000; text-decoration-thickness: 1.5px; margin-right: 5px;\">{sdr[4]}JD</span><span style=\"color: #7fad39; font-weight: bold;\">{priceAfter}JD</span></h5>\r\n                        </div>\r\n                    </div>\r\n                </div>";

                        }
                        else
                        {
                            string returnUrl = HttpUtility.UrlEncode(Request.Url.ToString());
                            //productsContainer.InnerHtml += $"<a href='product.aspx?id={sdr[0]}'><div><img style='width:100px; height:50px;' src='{sdr[5]}'/> <span>name:{sdr[1]}</span> <span>price:{sdr[4]}$</span> </div></a>";
                            productsContainer.InnerHtml += $"<div class=\"col-lg-4 col-md-6 col-sm-6\">\r\n   <div class=\"featured__item\">\r\n                        <a href='product1.aspx?id={sdr[0]}'>\r\n                        <div class=\"featured__item__pic set-bg\" data-setbg='{sdr[5]}'>\r\n           </a>                 <ul class='featured__item__pic__hover'>                               <li><a href=product1.aspx?id={sdr[0]}><i class=\"fa fa-search\"></i></a></li>                              <li><a href='otherpage.aspx?id={sdr[0]}&returnUrl={returnUrl}&scrollPosition={{scrollPosition}}'><i class='fa fa-shopping-cart'></i></a></li>\r\n                            </ul>\r\n                        </div>\r\n                        </a>\r\n                        <div class=\"featured__item__text\">\r\n                            <h6><a href=\"#\">{sdr[1]}</a></h6>\r\n                            <h5>{sdr[4]}JD</h5>\r\n                        </div>\r\n                    </div>\r\n                </div>";

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
    }
}