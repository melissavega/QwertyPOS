using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


namespace QwertyPOS
{
    public partial class Restock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBrand();
                BindModel();
                BindGender();
                

            }
        }


       
        private void BindGender()
        {

            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con1 = new SqlConnection(CS))
            {

                SqlCommand cmd2 = new SqlCommand("SELECT * FROM Gender", con1);
                con1.Open();

                SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);

                DataTable dt2 = new DataTable();

                sda2.Fill(dt2);
                if (dt2.Rows.Count != 0)
                {
                    ddlGender.DataSource = dt2;
                    ddlGender.DataTextField = "GenderName";

                    ddlGender.DataValueField = "Gender_ID";
                    ddlGender.DataBind();
                    ddlGender.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
        }

        private void BindModel()
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Product_Details", con);

                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlModel.DataSource = dt;
                    ddlModel.DataTextField = "Model";
                    ddlModel.DataValueField = "Product_ID";
                    ddlModel.DataBind();
                    ddlModel.Items.Insert(0, new ListItem("--Select--", "0"));
                }


            }
        }

        private void BindBrand()
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Product", con);

                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlBrand.DataSource = dt;
                    ddlBrand.DataTextField = "Brand";
                    ddlBrand.DataValueField = "Product_ID";
                    ddlBrand.DataBind();
                    ddlBrand.Items.Insert(0, new ListItem("--Select--", "0"));
                }


            }
        }

        protected void ddlBrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            int maincat = Convert.ToInt32(ddlBrand.SelectedItem.Value);
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Product_Details Where Product_ID='" + ddlBrand.SelectedItem.Value + "'", con);

                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlModel.DataSource = dt;
                    ddlModel.DataTextField = "Model";
                    ddlModel.DataValueField = "Product_ID";
                    ddlModel.DataBind();
                    ddlModel.Items.Insert(0, new ListItem("--Select--", "0"));

                    ddlSize.DataSource = dt;
                    ddlSize.DataTextField = "Size";
                    ddlSize.DataValueField = "Product_ID";
                    ddlSize.DataBind();
                    ddlSize.Items.Insert(0, new ListItem("--Select--", "0"));

                    ddlGender.DataSource = dt;
                    ddlGender.DataTextField = "Gender_ID";
                    ddlGender.DataValueField = "Product_ID";
                    ddlGender.DataBind();
                    ddlGender.Items.Insert(0, new ListItem("--Select--", "0"));

                    ddlPrice.DataSource = dt;
                    ddlPrice.DataTextField = "Price";
                    ddlPrice.DataValueField = "Product_ID";
                    ddlPrice.DataBind();
                    ddlPrice.Items.Insert(0, new ListItem("--Select--", "0"));
                }


            }
        }

        protected void btnAddQuantity_Click(object sender, EventArgs e)
        {
            if (ddlBrand.SelectedItem != null && ddlGender.SelectedItem != null && ddlModel.SelectedItem != null && ddlPrice.SelectedItem != null  && ddlSize.SelectedItem != null)
            {
             string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                String c = "UPDATE Product_Details SET Quantity = '" + Quantityadded.Text + "' + Quantity WHERE Product_ID ='" 
                    + ddlBrand.SelectedItem.Value + "'";
                SqlCommand cmd = new SqlCommand(c,con);
                con.Open();

                cmd.ExecuteNonQuery();

            }

            ddlBrand.ClearSelection();
            ddlModel.ClearSelection();
            ddlGender.ClearSelection();
           
            ddlSize.ClearSelection();
            ddlPrice.ClearSelection();

            }
               

        }
    }
}