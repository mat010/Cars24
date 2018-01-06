using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using BusinessLogic;
using DataAccess;
using WebDomain.Models;

namespace WebDomain.Controllers
{
    public class HomeController : Controller
    {
        private Repository repository;
        private Validation validate;

        public HomeController()
        {
            repository = new Repository();
            validate = new Validation();
        }

        public ActionResult Index()
        {
            var cars = repository.GetAllCars();
            return View(cars);
        }

        public ActionResult Details(int id)
        {
            var car = repository.GetCarById(id);
            return View(car);
        }

        [HttpPost]
        public JsonResult Insert(CarDetailsVM carDetailsVm)
        {
            if (validate.IsModelValid(carDetailsVm))
            {
                if (repository.Insert(carDetailsVm))
                {
                    return Json(new { Success = true }, JsonRequestBehavior.AllowGet);
                }

                return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetMarks(int id)
        {
            var models = (from m in repository.GetCarModelsByBrandId(id)
                          select new CarModelViewModel { Id = m.Id, ModelName = m.CarModelName }).ToList();

            return Json(models, JsonRequestBehavior.AllowGet);

        }

        public JsonResult GetBrands()
        {
            var brands = (from b in repository.GetAllMarks()
            select new BrandViewModel { Id = b.Id, BrandName = b.BrandName }).ToList();

            return Json(brands, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetPetrolType()
        {
            var petrol = (from p in repository.GetPetrolType()
                select new PetrolViewModel { Id = p.Id, PetrolName = p.PetrolName }).ToList();

            return Json(petrol, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetTransmissionType()
        {
            var transmission = (from t in repository.GetTransmissionType()
                select new TransmissionViewModel { Id = t.Id, TransmissionName = t.TransmissionName }).ToList();

            return Json(transmission, JsonRequestBehavior.AllowGet);
        }
    }
}