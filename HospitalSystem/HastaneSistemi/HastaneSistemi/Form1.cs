using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HastaneSistemi
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            frmDoktorGiris frm = new frmDoktorGiris();
            frm.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            frmHastaGiris frm = new frmHastaGiris();
            frm.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            frmSekreterGiris frm = new frmSekreterGiris();
            frm.Show();
        }
    }
}
