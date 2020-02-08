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
	public partial class InsertPaylouad : System.Web.UI.Page
	{
		string connectionStrings;

		protected void Page_Load(object sender, EventArgs e)
		{
			connectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["db_cognizantConnectionString"].ConnectionString;
			RefreshGridPayload();
		}

		protected void btn_insert_Click(object sender, EventArgs e)
		{
			if (txt_name.Text != string.Empty && txt_qtdpax.Text != string.Empty && txt_paxw.Text != string.Empty)
			{
				using (SqlConnection cnn = new SqlConnection(connectionStrings))
				{
					cnn.Open();
					string query_insert = "insert into tb_payload (flight_number,pax_qtd, pax_w)" +
						"values(" + txt_name.Text + "," + txt_qtdpax.Text + "," + txt_paxw.Text + ")";

					SqlCommand cmd = new SqlCommand(query_insert, cnn);
					cmd.ExecuteNonQuery();
					cnn.Close();
					cnn.Dispose();
				}

				txt_name.Text = null;
				txt_qtdpax.Text = null;
				txt_paxw.Text = null;

				RefreshGridPayload();
			}
		}

		private void RefreshGridPayload()
		{
			using(SqlConnection cnn = new SqlConnection(connectionStrings))
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

		protected void gw_payload_SelectedIndexChanged(object sender, EventArgs e)
		{
			int rowIndex = gw_payload.SelectedRow.RowIndex;
			int cod = Convert.ToInt32(gw_payload.DataKeys[rowIndex]["id_payload"].ToString());

			using(SqlConnection cnn = new SqlConnection(connectionStrings))
			{
				cnn.Open();
				string query = "select * from tb_payload where id_payload = " + cod;

				SqlCommand cmd = new SqlCommand(query, cnn);
				SqlDataReader dr = cmd.ExecuteReader();

				while (dr.Read())
				{
					lbl_id_payload.Text = (dr["id_payload"].ToString());
					txt_name.Text = (dr["flight_number"].ToString());
					txt_qtdpax.Text = (dr["pax_qtd"].ToString());
					txt_paxw.Text = (dr["pax_w"].ToString());
				}

				dr.Close();
				cnn.Close();
				cnn.Dispose();
			}

			btn_insert.Visible = false;
			btn_update.Visible = true;
			btn_delete.Visible = true;
		}

		protected void btn_update_Click(object sender, EventArgs e)
		{
			if (txt_name.Text != string.Empty && txt_qtdpax.Text != string.Empty && txt_paxw.Text != string.Empty)
			{
				using (SqlConnection cnn = new SqlConnection(connectionStrings))
				{
					cnn.Open();
					string query_insert = "UPDATE tb_payload" +
						" SET flight_number = " + txt_name.Text + ", pax_qtd = " + txt_qtdpax.Text + ", pax_w = " + txt_paxw.Text +
						" WHERE id_payload = " + lbl_id_payload.Text;

					SqlCommand cmd = new SqlCommand(query_insert, cnn);
					cmd.ExecuteNonQuery();
					cnn.Close();
					cnn.Dispose();
				}

				RefreshGridPayload();
			}
		}

		protected void btn_delete_Click(object sender, EventArgs e)
		{
			using (SqlConnection cnn = new SqlConnection(connectionStrings))
			{
				cnn.Open();
				string query_insert = "delete tb_payload" +
					" WHERE id_payload = " + lbl_id_payload.Text;

				SqlCommand cmd = new SqlCommand(query_insert, cnn);
				cmd.ExecuteNonQuery();
				cnn.Close();
				cnn.Dispose();
			}

			txt_name.Text = null;
			txt_qtdpax.Text = null;
			txt_paxw.Text = null;

			RefreshGridPayload();

			btn_insert.Visible = true;
			btn_update.Visible = false;
			btn_delete.Visible = false;
		}
	}
}