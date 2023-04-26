using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace HastaneSistemi
{
    public partial class frmDoktorDetay : Form
    {
        public frmDoktorDetay()
        {
            InitializeComponent();
        }

        sqlbaglanti bgl = new sqlbaglanti();
        public string tc;

        private void btnbilgiduzenle_Click(object sender, EventArgs e)
        {
            frmDoktorBilgiDuzenle frm = new frmDoktorBilgiDuzenle();
            frm.tc = lblTC.Text;
            frm.Show();
        }

        private void btnduyurular_Click(object sender, EventArgs e)
        {
            frmDuyurular frm = new frmDuyurular();
            frm.Show();
        }

        private void btncıkıs_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmDoktorDetay_Load(object sender, EventArgs e)
        {
            lblTC.Text = tc;

            //Lbl'ye Ad Soyad Çekme

            SqlCommand komut = new SqlCommand("Select DoktorAd, DoktorSoyad From Tbl_Doktor Where DoktorTC=@p1", bgl.baglanti());
            komut.Parameters.AddWithValue("@p1", lblTC.Text);
            SqlDataReader dr = komut.ExecuteReader();
            while (dr.Read())
            {
                lblad.Text = dr[0].ToString();
                lblsoyad.Text = dr[1].ToString();
            }
            bgl.baglanti().Close();

            //Data Grid'e Randevu Verisini Çekmek

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("Select * From Tbl_Randevu Where RandevuDoktor='" + lblad.Text + " " + lblsoyad.Text + "'", bgl.baglanti());
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            int secilen = dataGridView1.SelectedCells[0].RowIndex;
            richTextBox1.Text = dataGridView1.Rows[secilen].Cells[7].Value.ToString();
        }
    }
}
