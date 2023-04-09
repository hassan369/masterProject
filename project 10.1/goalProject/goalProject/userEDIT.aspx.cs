using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace goalProject
{
    public partial class userEDIT : System.Web.UI.Page
    {

        protected void Button2_Click(object sender, EventArgs e)
        {

            if (TextBox3.Text != TextBox6.Text) {
                Label1.Text = "password not match";
                return;
            }
            try
            {
                if (Path.GetFileName(FileUpload1.FileName) != null && Path.GetFileName(FileUpload1.FileName) !="") 
                {
                    string folderPath = Server.MapPath("~/Images/");

                    //Check whether Directory (Folder) exists.
                    if (!Directory.Exists(folderPath))
                    {
                        //If Directory (Folder) does not exists Create it.
                        Directory.CreateDirectory(folderPath);
                    }

                    //Save the File to the Directory (Folder).
                    string fullPath = folderPath + Path.GetFileName(FileUpload1.FileName);
                    string srcPath = "/Images/" + Path.GetFileName(FileUpload1.FileName);

                    //FileUpload1.SaveAs(fullPath);
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

                    //Image1.ImageUrl = srcPath;
                }



                uploadToDatabase();
                Response.Redirect($"user.aspx?id={Request.QueryString["id"]}");


            }
            catch (SqlException q)
            {
                Response.Write(q.Message);
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
        public void uploadToDatabase()
        {

            SqlConnection con = null;
            try
            {
                // Creating Connection  
                con = new SqlConnection("data source= DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                // writing sql query  
                string name = TextBox1.Text + " " + TextBox2.Text;
                SqlCommand cm = null;
                if (Path.GetFileName(FileUpload1.FileName) != null && Path.GetFileName(FileUpload1.FileName) != "")
                {
                     cm = new SqlCommand($"update users set  name = '{name}' ,  password = '{TextBox3.Text}',phone={TextBox5.Text}, imgSrc = 'Images/{Path.GetFileName(FileUpload1.FileName)}' where id = {Session["userId"]}", con);

                }
                else 
                {
                     cm = new SqlCommand($"update users set  name = '{name}' ,  password = '{TextBox3.Text}',phone={TextBox5.Text} where id = {Session["userId"]}", con);

                }
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
                Console.WriteLine("OOPs, something went wrong." + A);
                //Label1.Text = "OOPs, something went wrong." + A;
            }
            // Closing the connection  
            finally
            {
                con.Close();
            }
        }
        protected void Page_Load()
        {
            if (!IsPostBack)
            {
                SqlConnection con = null;
                try
                {
                    // Creating Connection  
                    con = new SqlConnection("data source= DESKTOP-HIMQ0KV\\SQLEXPRESS; database=goalProject; integrated security=SSPI");
                    // writing sql query  
                    SqlCommand cm = new SqlCommand($"Select * from users where id = {Session["userId"]}", con);
                    // Opening Connection  
                    con.Open();
                    // Executing the SQL query  
                    SqlDataReader sdr = cm.ExecuteReader();
                    // Iterating Data  
                    while (sdr.Read())
                    {
                        string[] name = sdr[1].ToString().Split(' ');
                        TextBox1.Text = name[0];
                        //hello.InnerHtml = $"  <span style='color:#F24726 ; font-size:57px ;bold:400px ; '> Hello</span>  {sdr[1]}";
                        //TextBox4.Text = sdr[2].ToString();
                        TextBox2.Text = name[1];
                        img.InnerHtml = $" <img class=\"rounded-circle img-fluid shadow p-2 mb-3 bg-#f6d365 rounded\"  style=\"width: 170px ; height:170px\"  ;   border: solid 8px #F24726!important\";  src='{sdr[5]}' /> ";
                        TextBox5.Text = sdr[6].ToString();

                        //Console.WriteLine(sdr["id"] + " " + sdr["name"] + " " + sdr["email"]); // Displaying Record  
                        //Label1.Text = sdr["id"] + " " + sdr["name"] + " " + sdr["email"];
                    }
                }
                catch (Exception S)
                {
                    Console.WriteLine("OOPs, something went wrong.\n" + S);

                }
                // Closing the connection  
                finally
                {
                    con.Close();
                }

            }
        


            if (Session["name"] == null)
            {
                userName.Style.Add("display", "none");
                Button1.Style.Add("display", "none");
                cart.Style.Add("display", "none");
            }
            else
            {
                register.Style.Add("display", "none");
                userName.Style.Add("display", "inline-block");
                userName.InnerHtml = Session["name"].ToString();
            }



            if (Session["name"] == null)
            {
                cart.Style.Add("display", "none");
                dashboard.Style.Add("display", "none");
            }
            else
            {
                cart.Style.Add("display", "inline-block");
                // userName.InnerHtml = Session["name"].ToString();
            }



            if (Session["name"] != null)
            {

                signin.Style.Add("display", "none");

            }
            else
            {
                signin.Style.Add("display", "inline-block");
            }

            if (Session["name"] == null)
            {

                Button1.Attributes.Add("style", "display:none");
            }
            else
            {
                Button1.Attributes.Add("style", "display:inline-block");
            }
            if (Session["isAdmin"] == null)
            {

                dashboard.Style.Add("display", "none");

            }
            else
            {
                dashboard.Style.Add("display", "inline-block");
                if (Convert.ToBoolean(Session["isAdmin"]))
                {
                    cart.Style.Add("display", "none");
                    dashboard.InnerHtml = "dashboard";
                }
            }
        }
        }
}