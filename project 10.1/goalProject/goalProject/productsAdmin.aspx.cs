using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterProject
{
    public partial class productsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = null;
            try
            {
                // Creating Connection  
                con = new SqlConnection("data source=DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                // writing sql query  
                SqlCommand cm = new SqlCommand("Select * from product", con);
                // Opening Connection  
                con.Open();
                // Executing the SQL query  
                SqlDataReader sdr = cm.ExecuteReader();
                // Iterating Data  
                while (sdr.Read())
                {

                    cartContainer.InnerHtml += $"<div class='cartBox' ><img class='productIMG'  src='{sdr[5]}' /> <span class='details'>{sdr[1]}</span> <span class='details2';'>{sdr[4]}$ </span><span><a class='details1' href='deleteProduct.aspx?id={sdr[0]}'>delete</a><br/> <a class='details1' href='editProduct.aspx?id={sdr[0]}'>Edit</a></span> </div>";

                    //Console.WriteLine(sdr["id"] + " " + sdr["name"] + " " + sdr["email"]); // Displaying Record  
                    //Label1.Text = sdr["id"] + " " + sdr["name"] + " " + sdr["email"];
                }
            }
            catch (Exception S)
            {
                Console.WriteLine("OOPs, something went wrong.\n" + S);
                // Label1.Text = "OOPs, something went wrong.\n" + S;
            }
            // Closing the connection  
            finally
            {
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("addProduct.aspx");
        }
    }
}