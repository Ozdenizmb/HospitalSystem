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
    public partial class frmBilgiDuzenle : Form
    {
        public frmBilgiDuzenle()
        {
            InitializeComponent();
        }

        sqlbaglanti bgl = new sqlbaglanti();

        public string tc;

        private void button1_Click(object sender, EventArgs e)
        {
            SqlCommand komut2 = new SqlCommand("Update Tbl_Hasta Set HastaAd=@p1, HastaSoyad=@p2, HastaTelefon=@p3, HastaSifre=@p4, HastaCinsiyet=@p5 Where HastaTC=@p6", bgl.baglanti());
            komut2.Parameters.AddWithValue("@p1", txtad.Text);
            komut2.Parameters.AddWithValue("@p2", txtsoyad.Text);
            komut2.Parameters.AddWithValue("@p3", msktxttel.Text);
            komut2.Parameters.AddWithValue("@p4", txtsifre.Text);
            komut2.Parameters.AddWithValue("@p5", cmbcinsiyet.Text);
            komut2.Parameters.AddWithValue("@p6", msktxtTC.Text);
            komut2.ExecuteNonQuery();
            bgl.baglanti().Close();

            MessageBox.Show("Kaydınız Güncellenmiştir.", "Özdeniz Hastanesi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void frmBilgiDuzenle_Load(object sender, EventArgs e)
        {
            msktxtTC.Text = tc;

            SqlCommand komut = new SqlCommand("Select * From Tbl_Hasta Where HastaTC=" + msktxtTC.Text, bgl.baglanti());
            SqlDataReader dr = komut.ExecuteReader();
            while (dr.Read())
            {
                txtad.Text = dr["HastaAd"].ToString();
                txtsoyad.Text = dr["HastaSoyad"].ToString();
                msktxttel.Text = dr["HastaTelefon"].ToString();
                txtsifre.Text = dr["HastaSifre"].ToString();
                cmbcinsiyet.Text = dr["HastaCinsiyet"].ToString();
            }
            bgl.baglanti().Close();
        }
    }
}
