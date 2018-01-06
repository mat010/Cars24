using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class CarDetailsVM : CarHeaderVm
    {
        public string BodyName { get; set; }
        public string Condition { get; set; }
        public string Description { get; set; }
        public int CarId { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string TransmissionType { get; set; }
        public string UserName { get; set; }
    }
}
