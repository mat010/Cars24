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
        public bool IsModelValid(CarDetailsVM carDetailsVm, out string validationMessageInputs)
        {
            validationMessageInputs = string.Empty;
            StringBuilder sb = new StringBuilder();
            if (carDetailsVm.imgList == null)
            {
                sb.Append("At least one image is required\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (carDetailsVm.BodyId < 0)
            {
                sb.Append(", Car body\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (carDetailsVm.BrandId < 0)
            {
                sb.Append(", Brand\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (carDetailsVm.Capacity == null || carDetailsVm.Capacity < 500)
            {
                sb.Append(", Capacity\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (string.IsNullOrEmpty(carDetailsVm.City))
            {
                sb.Append(", City\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }
            
            if (carDetailsVm.ConditionId < 0)
            {
                sb.Append(", Condition\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (string.IsNullOrEmpty(carDetailsVm.Description))
            {
                sb.Append(", Description\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (carDetailsVm.Distance == null || carDetailsVm.Distance < 100)
            {
                sb.Append(", Distance\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (string.IsNullOrEmpty(carDetailsVm.Email))
            {
                sb.Append(", Email\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (carDetailsVm.ModelId < 0)
            {
                sb.Append(", Model\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (carDetailsVm.PetrolTypeId < 0)
            {
                sb.Append(", Petrol type\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (string.IsNullOrEmpty(carDetailsVm.Phone))
            {
                sb.Append(", Phone\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (carDetailsVm.Price <= 0)
            {
                sb.Append(", Price\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (carDetailsVm.ProductYear == null || carDetailsVm.ProductYear > DateTime.Now.Year)
            {
                sb.Append(", Product year\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (carDetailsVm.TransmissionTypeId < 0)
            {
                sb.Append(", Transmision type\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (string.IsNullOrEmpty(carDetailsVm.UserName))
            {
                sb.Append(", User name\n");
                validationMessageInputs = sb.ToString();
                //return false;
            }

            if (string.IsNullOrEmpty(validationMessageInputs))
            {
                return true;
            }
            return false;
        }
    }
}
