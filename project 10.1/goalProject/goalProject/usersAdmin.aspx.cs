using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterProject
{
    public partial class usersAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = null;
            try
            {
                // Creating Connection  
                con = new SqlConnection("data source= DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                // writing sql query  
                SqlCommand cm = new SqlCommand("Select * from users where isAdmin <> 1", con);
                // Opening Connection  
                con.Open();
                // Executing the SQL query  
                SqlDataReader sdr = cm.ExecuteReader();
                // Iterating Data  
                while (sdr.Read())
                {
                    Label1.Text += $"<tr> <td> <img style = 'width:100px; height:50px' src = '{sdr[5]}' /> </td>  <td>  <span>{sdr[1]}</span></td><td> <span>{sdr[2]}</span> </td> <td><a href='deleteUser.aspx?id={sdr[0]}'>delete</a>   </td></tr>";

                    //usersContainer.InnerHtml += $"<div><img style='width:100px; height:50px' src='{sdr[5]}'/> <span>{sdr[1]}</span> <span>{sdr[2]}</span> <a href='deleteUser.aspx?id={sdr[0]}'>delete</a> </div>";


                    //Console.WriteLine(sdr["id"] + " " + sdr["name"] + " " + sdr["email"]); // Displaying Record  
                    //Label1.Text = sdr["id"] + " " + sdr["name"] + " " + sdr["email"];
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
    }
}