using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterProject
{
    public partial class addProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Path.GetFileName(FileUpload1.FileName) != null && Path.GetFileName(FileUpload1.FileName) != "")
            {
                return;
            }
            
        }
        public void uploadToDatabase(string srcP)
        {
            
                SqlConnection con = null;
            try
            {
                // Creating Connection  
                con = new SqlConnection("data source = DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                // writing sql query  

                SqlCommand cm = new SqlCommand($"insert into product  ( name, description, category, price, imgSrc, discount, countINStock)values('{TextBox1.Text}',   '{TextBox2.Text}'   ,    '{DropDownList1.SelectedItem.Value}', '{TextBox4.Text}',  'Images/products/{Path.GetFileName(FileUpload1.FileName)}' , '{TextBox6.Text}', '{TextBox7.Text}')", con);
                // Opening Connection  
                con.Open();
                // Executing the SQL query  
                cm.ExecuteNonQuery();
                // Displaying a message  
                Console.WriteLine("Record Inserted Successfully");
                //Label1.Text = "Record Inserted Successfully";
            }
            catch (Exception A)
            {
                Label1.Attributes.Add("style", "display:inline-block");
                //Console.WriteLine("OOPs, something went wrong." + A);
                Label1.Text = "OOPs, something went wrong." + A;
            }
            // Closing the connection  
            finally
            {
                con.Close();
            }
        
        }




        protected void UploadFile(object sender, EventArgs e)
        {




            try
            {
                string folderPath = Server.MapPath("~/Images/products/");

                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists Create it.
                    Directory.CreateDirectory(folderPath);
                }

                //Save the File to the Directory (Folder).
                string fullPath = folderPath + Path.GetFileName(FileUpload1.FileName);
                string srcPath = "/Images/" + Path.GetFileName(FileUpload1.FileName);

                FileUpload1.SaveAs(fullPath);
                //Image1.ImageUrl = srcPath;
                if (FileUpload1 != null && FileUpload1.HasFile)
                {
                    // Explicitly check if the file was an image (example approach)
                    if (FileUpload1.PostedFile.ContentType.ToLower().StartsWith("image/"))
                    {
                        // It is an image, save it
                        FileUpload1.SaveAs(fullPath);

                    }
                    else
                    {
                        Label1.Text += " file uploaded is not an image ";
                        return;
                        // Not an image, handle accordingly
                    }
                }

                uploadToDatabase(srcPath);


            }
            catch (SqlException q)
            {
                Response.Write(q.Message);
                Label1.Text = "OOPs, something went wrong." + q;

            }

        }

    }
}