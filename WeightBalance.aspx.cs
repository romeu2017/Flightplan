using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flight_Plan
{
    public partial class WeightBalance : System.Web.UI.Page
    {
		string connectionStrings;
		protected void Page_Load(object sender, EventArgs e)
        {
			connectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["db_cognizantConnectionString"].ConnectionString;
			RefreshGridPayload();
			RefreshGridACFT();
		}

        protected void gw_payload_SelectedIndexChanged(object sender, EventArgs e)
        {
			int rowIndex = gw_payload.SelectedRow.RowIndex;
			txt_flightNumber.Text = gw_payload.DataKeys[rowIndex]["flight_number"].ToString();
			lbl_pax_qtd.Text = gw_payload.DataKeys[rowIndex]["pax_qtd"].ToString();
			lbl_pax_w.Text = gw_payload.DataKeys[rowIndex]["pax_w"].ToString();
		}

		private void RefreshGridPayload()
		{
			using (SqlConnection cnn = new SqlConnection(connectionStrings))
			{
				DataSet ds = new DataSet();

				cnn.Open();

				string query = "select * from tb_payload";
				SqlDataAdapter da = new SqlDataAdapter(query, cnn);
				da.SelectCommand.CommandType = CommandType.Text;
				da.Fill(ds);

				gw_payload.DataSource = ds;
				gw_payload.DataBind();

				cnn.Close();
				cnn.Dispose();
			}
		}

		private void RefreshGridACFT()
		{
			using (SqlConnection cnn = new SqlConnection(connectionStrings))
			{
				DataSet ds = new DataSet();

				cnn.Open();

				string query = "select * from tb_acft";
				SqlDataAdapter da = new SqlDataAdapter(query, cnn);
				da.SelectCommand.CommandType = CommandType.Text;
				da.Fill(ds);

				gw_acft.DataSource = ds;
				gw_acft.DataBind();

				cnn.Close();
				cnn.Dispose();
			}
		}

		protected void gw_acft_SelectedIndexChanged(object sender, EventArgs e)
		{
			int rowIndex = gw_acft.SelectedRow.RowIndex;
			txt_name_acft.Text = gw_acft.DataKeys[rowIndex]["name_acft"].ToString();
			lbl_pb.Text = gw_acft.DataKeys[rowIndex]["pb"].ToString();
		}

		protected void btn_calculate_Click(object sender, EventArgs e)
		{
			if (lbl_pax_qtd.Text != string.Empty && lbl_pax_w.Text != string.Empty && lbl_pb.Text != string.Empty)
			{
				int pax_qtd = Convert.ToInt32(lbl_pax_qtd.Text);
				int pax_w = Convert.ToInt32(lbl_pax_w.Text);
				int pb = Convert.ToInt32(lbl_pb.Text);

				int total = (pax_qtd * pax_w) + pb;

				txt_bow.Text = total.ToString();
			}
		}
	}
}