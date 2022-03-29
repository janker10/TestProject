using System;
using System.Configuration;
using System.Data.SqlClient;

namespace TestProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        /*Getting the information of the webconfig file, for make the connection to the database*/
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TestProjectConn"].ConnectionString);

        /*Creating a new instance of the "Utilities" Class*/
        Utilities util = new Utilities();

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        /*Button Add*/
        protected void Button1_Click(object sender, EventArgs e)
        {

            /*Capturing the values of the textboxes*/

            string Id = txtId.Text;
            string FirstName = txtFirstName.Text;
            string LastName = txtLastName.Text;
            string ZipCode = txtZipCode.Text;
            string PhoneNumber = txtPhoneNumber.Text;
            string HireDate = txtHireDate.Text;


            string validationMessage;

            /*Validation of the data*/
            validationMessage = util.Validate (Id, FirstName, LastName, PhoneNumber, ZipCode, HireDate);

            if (validationMessage != "") {

                /*If then validation message is not empty, we need to give feedback for the user*/
                Label1.Text = "";
                Label1.Text = validationMessage;
                Label1.ForeColor = System.Drawing.Color.DarkRed;
                return;

            }
            /*Opening the connection*/
            con.Open();

            SqlCommand cmdExisteId = new SqlCommand(
                "Select top 1  1 x from Employees where EmployeeID  = @id"
                , con);
            cmdExisteId.Parameters.AddWithValue("@Id", Id);

            if (cmdExisteId.ExecuteReader().HasRows) {

                
                Label1.Text = "";
                Label1.Text = "There is already another registry with the same EmployeeId. Please check.";
                Label1.ForeColor = System.Drawing.Color.DarkRed;
                return;

            }
            con.Close();


            /*Opening the connection*/
            con.Open();
            /*Generate the insert sentence */
            SqlCommand cmd = new SqlCommand(
                    "Insert into Employees values(@id, @FirstName, @LastName, @PhoneNumber,@Zip ,  @HireDate)"
                    , con
                );

            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@FirstName", FirstName);
            cmd.Parameters.AddWithValue("@LastName", LastName);
            cmd.Parameters.AddWithValue("@Zip", ZipCode);
            cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
            cmd.Parameters.AddWithValue("@HireDate", HireDate);

            try
            {
                    /*Execute the insert sentence*/
                cmd.ExecuteNonQuery();
            }
            catch( Exception ex)
            {
                /*If the insert sentence generates a exception, this segment catch it */
                Label1.Text = "";
                Label1.Text = ex.Message;
                Label1.ForeColor = System.Drawing.Color.DarkRed;
                con.Close();
                return;
            }
           
            /*closing the connection*/
            con.Close();
            Label1.Text = "Data inserted successfully.";

            txtId.Text = "";
            txtPhoneNumber.Text = "";
            txtZipCode.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtHireDate.Text = "";


            Label1.ForeColor = System.Drawing.Color.DarkGreen;
            GridView1.DataBind();
        }
        /*Button Search*/
        protected void Button1_Click1(object sender, EventArgs e)
        {
            Label1.Text = "";
            /*refreshing the grid*/
            GridView1.DataBind();
        }
    }
}