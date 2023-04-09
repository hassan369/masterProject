using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace goalProject
{
    public partial class editProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = null;
                try
                {
                    // Creating Connection  
                    con = new SqlConnection("data source= DESKTOP-N9T9K9N\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                    // writing sql query  
                    SqlCommand cm = new SqlCommand($"Select * from product where id = {Request.QueryString["id"]}", con);
                    // Opening Connection  
                    con.Open();
                    // Executing the SQL query  
                    SqlDataReader sdr = cm.ExecuteReader();
                    // Iterating Data  
                    while (sdr.Read())
                    {

                        TextBox1.Text = sdr[1].ToString();
                        TextBox2.Text = sdr[2].ToString();
                        //TextBox3.Text = sdr[3].ToString();
                        TextBox4.Text = sdr[4].ToString();
                        TextBox6.Text = sdr[6].ToString();
                        TextBox7.Text = sdr[7].ToString();

                        //Console.WriteLine(sdr["id"] + " " + sdr["name"] + " " + sdr["email"]); // Displaying Record  
                        //Label1.Text = sdr["id"] + " " + sdr["name"] + " " + sdr["email"];
                    }
                }
                catch (Exception S)
                {
                    Console.WriteLine("OOPs, something went wrong.\n" + S);
                    Label1.Text = "OOPs, something went wrong.\n" + S;
                }
                // Closing the connection  
                finally
                {
                    con.Close();
                }

            }

        }


        public void uploadToDatabase(string srcP)
        {

            SqlConnection con = null;
            try
            {
                // Creating Connection  
                con = new SqlConnection("data source = DESKTOP-N9T9K9N\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                // writing sql query  

                SqlCommand cm = new SqlCommand($"update product set  name = '{TextBox1.Text}' , description = '{TextBox2.Text}', category = '{DropDownList1.SelectedItem.Value}', price = '{TextBox4.Text}', imgSrc = 'Images/products/{Path.GetFileName(FileUpload1.FileName)}', discount = '{TextBox6.Text}', countINStock = '{TextBox7.Text}' where id = {Request.QueryString["id"]}", con);
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


                uploadToDatabase(srcPath);


            }
            catch (SqlException q)
            {
                Response.Write(q.Message);
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Path.GetFileName(FileUpload1.FileName) != null && Path.GetFileName(FileUpload1.FileName) != "")
            {
                return;
            }
           

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
                Response.Redirect("productsAdmin.aspx");
                Console.WriteLine("Record Deleted Successfully");
                Label1.Text = "Record Deleted Successfully";
            }
            catch (Exception B)
            {
                Console.WriteLine("OOPs, something went wrong.\n" + B);
                Label1.Text = "OOPs, something went wrong.\n" + B;
            }
            // Closing the connection  
            finally
            {
                con.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("fdf");
        }
    }
}