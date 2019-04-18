
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
namespace QwertyPOS
{
    public partial class SellingPage : System.Web.UI.Page
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
                    ddlModel.DataValueField = "Details_ID";
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

        private void AddItemToList(string modelName)
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd =
                    new SqlCommand("SELECT * FROM Product_Details WHERE Model = @modelName", con))
                {
                    var modelParameter = new SqlParameter();
                    modelParameter.ParameterName = "@modelName";
                    modelParameter.Value = modelName;
                    cmd.Parameters.Add(modelParameter);

                  

                    con.Open();

                    using (var sqlReader = cmd.ExecuteReader())
                    {
                        DataTable dataTable =(DataTable)GetDataTable();
                        while (sqlReader.Read())
                        {
                            var dataRow = dataTable.NewRow();
                            //Hear I assume that Product_Details table has Model and Price columns
                            //So that sqlReader["Model"] and sqlReader["Price"] will not have any issue.
                            dataRow["Model"] = sqlReader["Model"];
                            
                            dataTable.Rows.Add(dataRow);
                        }

                        SaveDataTable(dataTable);
                        GridView1.DataSource = dataTable;
                        GridView1.DataBind();
                    }
                }
            }
           
        }

        private object GetDataTable()
        {
            DataTable dt = ViewState["SelectedModels"] as DataTable;

            if (dt == null)
            {
                dt = new DataTable();
                dt.TableName = "ColorData";
                dt.Columns.Add(new DataColumn("Model", typeof(string)));
               
                ViewState["SelectedModels"] = dt;
            }
            return dt;
        }

        private void SaveDataTable(object dataTable)
        {
            ViewState["SelectedModels"] = dataTable;
        }

        protected void ddlBrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            int maincat = Convert.ToInt32(ddlBrand.SelectedItem.Value);
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

                    ddlQuantity.DataSource = dt;
                    ddlQuantity.DataTextField = "Quantity";
                    ddlQuantity.DataValueField = "Product_ID";
                    ddlQuantity.DataBind();
                    ddlQuantity.Items.Insert(0, new ListItem("--Select--", "0"));

                    ddlPrice.DataSource = dt;
                    ddlPrice.DataTextField = "Price";
                    ddlPrice.DataValueField = "Product_ID";
                    ddlPrice.DataBind();
                    ddlPrice.Items.Insert(0, new ListItem("--Select--", "0"));
                    
                }
               

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
           
            AddItemToList(ddlModel.SelectedItem.Text);
 
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {

        }
    }
}