using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace goalProject
{
    public partial class deleteProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = null;
            try
            {
                // Creating Connection
                con = new SqlConnection("data source= DESKTOP-HIMQ0KV\\SQLEXPRESS; database= goalProject; integrated security=SSPI");
                // writing sql query
                SqlCommand cm = new SqlCommand($"delete from product where id = '{Request.QueryString["id"]}'", con);
                // Opening Connection
                con.Open();
                // Executing the SQL query
                cm.ExecuteNonQuery();
                //   Response.Redirect("productsAdmin.aspx");
                Response.Redirect("productsAdmin.aspx");
                // Console.WriteLine("Record Deleted Successfully");
                //Label1.Text = "Record Deleted Successfully";
            }
            catch (SqlException B)
            {
                if (B.Number == 547) {
                    Response.Write("can't delete this item cause othere sections in this website using it ");
                }
                Console.WriteLine("OOPs, something went wrong.\n" + B);
                //Label1.Text = "OOPs, something went wrong.\n" + B;
            }
            // Closing the connection
            finally
            {
                con.Close();
            }
        }
    }
}