using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
namespace QwertyPOS
{

    public partial class SellPage_Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBrand();
                BindModel();
                BindGender();
                BindQuantity();
                
            }
        }

        private void calculateSum()
        {
            double total = 0;
            double tax = 0.0625;
            double convert;
            
            foreach(GridViewRow row in GridView1.Rows)
            {
                convert = Convert.ToDouble(row.Cells[3].Text) * tax;
                total = total + ((Convert.ToDouble(row.Cells[3].Text))+convert);
               
            }
            GridView1.FooterRow.Cells[2].Text = "Total:$";
            GridView1.FooterRow.Cells[3].Text = total.ToString();
        }

        private DataTable GetDataTable()
        {
            DataTable dt = ViewState["SelectedModels"] as DataTable;

            if (dt == null)
            {
                dt = new DataTable();
                dt.TableName = "ColorData";
                dt.Columns.Add(new DataColumn("Brand", typeof(string)));
                dt.Columns.Add(new DataColumn("Model", typeof(string)));
                dt.Columns.Add(new DataColumn("Quantity", typeof(string)));
                dt.Columns.Add(new DataColumn("Price", typeof(string)));
                ViewState["SelectedModels"] = dt;
            }
            return dt;
        }
        private void SaveDataTable(DataTable dataTable)
        {
            ViewState["SelectedModels"] = dataTable;
        }
        protected void BindGrid()
        {
            GridView1.DataSource = ViewState["SelectedModels"] as DataTable;
            GridView1.DataBind();
        }
        private void AddItemToList(string Brand,string modelName, string Quantity, string price)
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Product_Details WHERE Model = @modelName AND Price = @price AND Quantity = @Quantity", con))
                
                {
                using (SqlCommand cmd2 = new SqlCommand("SELECT * Product WHERE Product_ID= '"+ddlBrand.SelectedItem.Text+"'", con))
                {
                    var BrandParameter = new SqlParameter();
                    BrandParameter.ParameterName = "Product_ID";
                    BrandParameter.Value = Brand;
                    cmd2.Parameters.Add(BrandParameter);

                    var modelParameter = new SqlParameter();
                    modelParameter.ParameterName = "@modelName";
                    modelParameter.Value = modelName;
                    cmd.Parameters.Add(modelParameter);

                    var QuantityParameter = new SqlParameter();
                    QuantityParameter.ParameterName = "@Quantity";
                    QuantityParameter.Value = Quantity;
                    cmd.Parameters.Add(QuantityParameter);

                    var priceParameter = new SqlParameter();
                    priceParameter.ParameterName = "@price";
                    priceParameter.Value = price;
                    cmd.Parameters.Add(priceParameter);

                    con.Open();

                    using (var sqlReader = cmd.ExecuteReader())
                    {
                        var dataTable = GetDataTable();
                        while (sqlReader.Read())
                        {
                            var dataRow = dataTable.NewRow();
                            //Hear I assume that Product_Details table has Model and Price columns
                            //So that sqlReader["Model"] and sqlReader["Price"] will not have any issue.
                            dataRow["Brand"] = sqlReader["Product_ID"];
                            dataRow["Model"] = sqlReader["Model"];
                            dataRow["Quantity"] = sqlReader["Quantity"];
                            dataRow["Price"] = sqlReader["Price"];
                            dataTable.Rows.Add(dataRow);

                            SaveDataTable(dataTable);
                            GridView1.DataSource = dataTable;
                            GridView1.DataBind();
                            
                        }
                    }
                }
                    
                }
            }
        }
        private void BindQuantity()
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
                    ddlModel.DataTextField = "Quantity";
                    ddlModel.DataValueField = "Product_ID";
                    ddlModel.DataBind();
                    ddlModel.Items.Insert(0, new ListItem("--Select--", "0"));
                }


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
            if(ddlBrand.SelectedItem !=null && ddlGender.SelectedItem !=null && ddlModel.SelectedItem !=null && ddlPrice.SelectedItem!=null && ddlQuantity.SelectedItem!=null && ddlSize.SelectedItem != null)
            {
                AddItemToList(ddlBrand.SelectedItem.Text, ddlModel.SelectedItem.Text, ddlQuantity.SelectedItem.Text, ddlPrice.SelectedItem.Text);
            }
            else
            {
                
            }
            
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Product_Details SET Quantity = Quantity-1 WHERE Product_ID ='"+ddlBrand.SelectedItem.Value+"'", con);
                con.Open();
               
                cmd.ExecuteNonQuery();
                

            }

            ddlBrand.ClearSelection();
            ddlModel.ClearSelection();
            ddlGender.ClearSelection();
            ddlQuantity.ClearSelection();
            ddlSize.ClearSelection();
            ddlPrice.ClearSelection();

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            calculateSum();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["SelectedModels"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["SelectedModels"] = dt;
            BindGrid();
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            foreach(GridViewRow rw in GridView1.Rows)
            {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                
               
                SqlCommand cmd = new SqlCommand("INSERT INTO Transactions(Product_ID,Sold,Price) values('"+rw.Cells[0].Text+"','"+Convert.ToString(rw.Cells[1].Text)+"','"+rw.Cells[3].Text+"')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                
                    
               
               
                
            }
            }
           
        }
    }
}