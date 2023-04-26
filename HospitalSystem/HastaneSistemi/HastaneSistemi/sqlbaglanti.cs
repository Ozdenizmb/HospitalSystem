using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace HastaneSistemi
{
    class sqlbaglanti
    {
        public SqlConnection baglanti()
        {
            SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-SH4F51P\\SQLEXPRESS;Initial Catalog=HastaneSistemi;Integrated Security=True");
            baglan.Open();

            return baglan;
        }
    }
}
