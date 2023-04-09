using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace goalProject
{
    public partial class qtyChange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["name"] != null)
            //{
                SqlConnection con2 = null;
                try
                {
                    string command = "";
                    if (Request.QueryString["sign"] == "minus")
                    {
                        command = $"update cart set qty = qty - 1 where product_id = {Request.QueryString["id"]} ";
                    }
                    else if (Request.QueryString["sign"] == "plus")
                    {
                        command = $"update cart set qty = qty + 1 where product_id = {Request.QueryString["id"]} ";
                    }
                    // Creating Connection  
                    con2 = new SqlConnection("data source = DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");


                    // writing sql query  
                    SqlCommand cm2 = new SqlCommand(command, con2);

                    // Opening Connection  
                    con2.Open();
                    // Iterating Data
                    cm2.ExecuteNonQuery();

                    // Displaying a message  
                    Console.WriteLine("Record Inserted Successfully");
                    //Label1.Text = "Record Inserted Successfully";
                    Response.Redirect($"acart1.aspx");
                }
                catch (Exception A)
                {
                    // Label1.Attributes.Add("style", "display:inline-block");
                    //Console.WriteLine("OOPs, something went wrong." + A);
                    //Label1.Text = "OOPs, something went wrong." + A;
                }
                // Closing the connection  
                finally
                {
                    con2.Close();
                }

            //}
            //else
            //{
            //    Response.Redirect($"login.aspx?redirectId={Request.QueryString["id"]}");
            //}
        }
    }
}