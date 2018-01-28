using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
    public class Validation
    {
        public bool IsModelValid(CarDetailsVM carDetailsVm)
        {
            if (carDetailsVm.imgList == null)
            {
                return false;
            }

            if (carDetailsVm.BodyId < 0)
            {
                return false;
            }

            if (carDetailsVm.BrandId < 0)
            {
                return false;
            }

            if (carDetailsVm.Capacity == null || carDetailsVm.Capacity < 500)
            {
                return false;
            }

            if (string.IsNullOrEmpty(carDetailsVm.City))
            {
                return false;
            }
            
            if (carDetailsVm.ConditionId < 0)
            {
                return false;
            }

            if (string.IsNullOrEmpty(carDetailsVm.Description))
            {
                return false;
            }

            if (carDetailsVm.Distance == null || carDetailsVm.Distance < 100)
            {
                return false;
            }

            if (string.IsNullOrEmpty(carDetailsVm.Email))
            {
                return false;
            }

            if (carDetailsVm.ModelId < 0)
            {
                return false;
            }

            if (carDetailsVm.PetrolTypeId < 0)
            {
                return false;
            }

            if (string.IsNullOrEmpty(carDetailsVm.Phone))
            {
                return false;
            }

            if (carDetailsVm.Price < 0)
            {
                return false;
            }

            if (carDetailsVm.ProductYear == null || carDetailsVm.ProductYear > DateTime.Now.Year)
            {
                return false;
            }

            if (carDetailsVm.TransmissionTypeId < 0)
            {
                return false;
            }

            if (string.IsNullOrEmpty(carDetailsVm.UserName))
            {
                return false;
            }
            return true;
        }
    }
}
