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
    public partial class frmDoktorBilgiDuzenle : Form
    {
        public frmDoktorBilgiDuzenle()
        {
            InitializeComponent();
        }

        sqlbaglanti bgl = new sqlbaglanti();
        public string tc;

        private void frmDoktorBilgiDuzenle_Load(object sender, EventArgs e)
        {
            msktxtTC.Text = tc;

            SqlCommand komut = new SqlCommand("Select * From Tbl_Doktor Where DoktorTC=@p1", bgl.baglanti());
            komut.Parameters.AddWithValue("@p1", msktxtTC.Text);
            SqlDataReader dr = komut.ExecuteReader();
            while (dr.Read())
            {
                txtad.Text = dr[1].ToString();
                txtsoyad.Text = dr[2].ToString();
                txtsifre.Text = dr[5].ToString();
                cmbbrans.Text = dr[3].ToString();
            }
            bgl.baglanti().Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand("Update Tbl_Doktor set DoktorAd=@p1, DoktorSoyad=@p2, DoktorSifre=@p3, DoktorBrans=@p4 Where DoktorTC=@p5", bgl.baglanti());
            komut.Parameters.AddWithValue("@p1", txtad.Text);
            komut.Parameters.AddWithValue("@p2", txtsoyad.Text);
            komut.Parameters.AddWithValue("@p3", txtsifre.Text);
            komut.Parameters.AddWithValue("@p4", cmbbrans.Text);
            komut.Parameters.AddWithValue("@p5", msktxtTC.Text);
            komut.ExecuteNonQuery();
            bgl.baglanti().Close();

            MessageBox.Show("Kaydınız Güncellenmiştir", "Özdeniz Hastanesi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}
