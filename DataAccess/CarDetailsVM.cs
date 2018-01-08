using System.Collections.Generic;
using System.Web;

namespace DataAccess
{
    public class CarDetailsVM : CarHeaderVm
    {
        public string BodyName { get; set; }
        public int BodyId { get; set; }
        public string Condition { get; set; }
        public int ConditionId { get; set; }
        public string Description { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string TransmissionType { get; set; }
        public int TransmissionTypeId { get; set; }
        public string UserName { get; set; }
        public int CarDetailId { get; set; }
        public List<string> imgList { get; set; }
    }
}
