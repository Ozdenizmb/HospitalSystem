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
    public partial class frmSekreterDetay : Form
    {
        public frmSekreterDetay()
        {
            InitializeComponent();
        }

        sqlbaglanti bgl = new sqlbaglanti();
        public string tc;

        private void btndoktorpaneli_Click(object sender, EventArgs e)
        {
            frmSekreterDoktorPaneli frm = new frmSekreterDoktorPaneli();
            frm.Show();
        }

        private void btnbranspaneli_Click(object sender, EventArgs e)
        {
            frmSekreterBransPaneli frm = new frmSekreterBransPaneli();
            frm.Show();
        }

        private void btnrandevupaneli_Click(object sender, EventArgs e)
        {
            frmSekreterRandevuListesi frm = new frmSekreterRandevuListesi();
            frm.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            frmDuyurular frm = new frmDuyurular();
            frm.Show();
        }

        private void frmSekreterDetay_Load(object sender, EventArgs e)
        {
            lblTC.Text = tc;

            //AD SOYAD ÇEKME

            SqlCommand komut1 = new SqlCommand("Select SekreterAdSoyad From Tbl_Sekreter Where SekreterTC=@p1", bgl.baglanti());
            komut1.Parameters.AddWithValue("@p1", lblTC.Text);
            SqlDataReader dr1 = komut1.ExecuteReader();
            while (dr1.Read())
            {
                lbladsoyad.Text = dr1[0].ToString();
            }
            bgl.baglanti().Close();

            //BRANŞLARI DATAGRİD'E ÇEKME

            DataTable dt1 = new DataTable();
            SqlDataAdapter dg1 = new SqlDataAdapter("Select * From Tbl_Brans", bgl.baglanti());
            dg1.Fill(dt1);
            dataGridView1.DataSource = dt1;

            //DOKTROLARI DATAGRİD'E ÇEKME

            DataTable dt2 = new DataTable();
            SqlDataAdapter dg2 = new SqlDataAdapter("Select DoktorAd,DoktorSoyad,DoktorBrans From Tbl_Doktor", bgl.baglanti());
            dg2.Fill(dt2);
            dataGridView2.DataSource = dt2;

            //BRANŞLARI COMBOBOX'A ÇEKME

            SqlCommand komut2 = new SqlCommand("Select BransAd From Tbl_Brans", bgl.baglanti());
            SqlDataReader dr2 = komut2.ExecuteReader();
            while (dr2.Read())
            {
                cmbbrans.Items.Add(dr2[0]);
            }
            bgl.baglanti().Close();
        }

        private void btnkaydet_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand("insert into Tbl_Randevu (RandevuTarih,RandevuSaat,RandevuBrans,RandevuDoktor) values (@p1,@p2,@p3,@p4)", bgl.baglanti());
            komut.Parameters.AddWithValue("@p1", msktarih.Text);
            komut.Parameters.AddWithValue("@p2", msksaat.Text);
            komut.Parameters.AddWithValue("@p3", cmbbrans.Text);
            komut.Parameters.AddWithValue("@p4", cmbdoktor.Text);
            komut.ExecuteNonQuery();
            bgl.baglanti().Close();

            MessageBox.Show("Randevu Sisteme Tanımlanmıştır.", "Özdeniz Hastanesi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void cmbbrans_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbdoktor.Items.Clear();

            SqlCommand komut = new SqlCommand("Select DoktorAd,DoktorSoyad From Tbl_Doktor Where DoktorBrans=@p1", bgl.baglanti());
            komut.Parameters.AddWithValue("@p1", cmbbrans.Text);
            SqlDataReader dr = komut.ExecuteReader();
            while (dr.Read())
            {
                cmbdoktor.Items.Add(dr[0] + " " + dr[1]);
            }
            bgl.baglanti().Close();
        }

        private void btnolustur_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand("insert into Tbl_Duyuru (Duyuru) values (@p1)", bgl.baglanti());
            komut.Parameters.AddWithValue("@p1", richTextBox1.Text);
            komut.ExecuteNonQuery();
            bgl.baglanti().Close();

            MessageBox.Show("Duyurunuz Sisteme Kaydedilmiştir.", "Özdeniz Hastanesi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}
