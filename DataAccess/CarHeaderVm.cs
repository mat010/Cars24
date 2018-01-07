using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class CarHeaderVm
    {
        public string Brand { get; set; }
        public int BrandId { get; set; }        
        public string Model { get; set; }
        public int ModelId { get; set; }
        public decimal Price { get; set; }
        public string City { get; set; }
        public int? ProductYear { get; set; }
        public int? Distance { get; set; }
        public int? Capacity { get; set; }
        public string PetrolType { get; set; }
        public int PetrolTypeId { get; set; }
        public int CarId { get; set; }
    }
}
