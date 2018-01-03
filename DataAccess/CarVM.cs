using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class CarVM
    {
        public string brand { get; set; }
        public string model { get; set; }
        public decimal cena { get; set; }
        public string miejscowosc { get; set; }
        public int rok_produkcji { get; set; }
        public int przebieg { get; set; }
        public int pojemnosc { get; set; }
        public string rodzaj_paliwa { get; set; }
    }
}
