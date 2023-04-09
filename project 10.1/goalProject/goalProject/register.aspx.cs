using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace goalProject
{
    public partial class register : System.Web.UI.Page
    {

        public void uploadToDatabase()
        {

            SqlConnection con = null;
            try
            {
                // Creating Connection  
                con = new SqlConnection("data source = DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalproject; integrated security=SSPI");
                // writing sql query  
                string name = TextBox1.Text + " " + TextBox4.Text;
                int phone = Convert.ToInt32(TextBox5.Text);
                SqlCommand cm = new SqlCommand($"insert into users  ( name, email, password, phone)values('{name}',   '{TextBox2.Text}'   ,    '{TextBox3.Text}', '{phone}' )", con);
                SqlCommand cm2 = new SqlCommand($"select * from users",con);

                // Opening Connection  
                con.Open();
                // Executing the SQL query
                SqlDataReader sdr = cm2.ExecuteReader();
                // Iterating Data  
                while (sdr.Read())
                {
                    if (sdr[2].ToString() == TextBox2.Text)
                    {
                        Label1.Text = "user already exist";
                        con.Close();
                        return;
                    }
                }
                con.Close();
                con.Open();

                    cm.ExecuteNonQuery();
                // Displaying a message  
                Console.WriteLine("Record Inserted Successfully");

                if (Request.QueryString["redirectId"] != null)
                {
                    Response.Redirect($"login.aspx?redirectId={Request.QueryString["redirectId"]}");
                }
                else
                {
                    Response.Redirect("login.aspx");
                }


                Response.Redirect("login.aspx");
                //Label1.Text = "Record Inserted Successfully";
            }
            catch (Exception A)
            {
                //Console.WriteLine("OOPs, something went wrong." + A);
                Label1.Text = "OOPs, something went wrong." + A;
            }
            // Closing the connection  
            finally
            {
            con.Close();
                
            }
        }






        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadFile(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || TextBox5.Text == "")
            {
                Label1.Text = "please fill all fields";
                return;
            }

            if (TextBox3.Text != TextBox6.Text) {
                Label1.Text = "password not match";
                return;
            }

            try
            {
                //string folderPath = Server.MapPath("~/Images/");

                ////Check whether Directory (Folder) exists.
                //if (!Directory.Exists(folderPath))
                //{
                //    //If Directory (Folder) does not exists Create it.
                //    Directory.CreateDirectory(folderPath);
                //}

                ////Save the File to the Directory (Folder).
                //string fullPath = folderPath + Path.GetFileName(FileUpload1.FileName);
                //string srcPath = "/Images/" + Path.GetFileName(FileUpload1.FileName);

                //FileUpload1.SaveAs(fullPath);
                ////Image1.ImageUrl = srcPath;


                uploadToDatabase();


            }
            catch (SqlException q)
            {
                Response.Write(q.Message);
            }

        }

    }
}