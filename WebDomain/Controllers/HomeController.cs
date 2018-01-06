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

        public List<Brand> GetBrands()
        {
            return repository.GetAllMarks();
        }

        public JsonResult GetTest()
        {
            var brands = (from b in repository.GetAllMarks()
            select new BrandViewModel { Id = b.Id, BrandName = b.BrandName }).ToList();

            return Json(brands, JsonRequestBehavior.AllowGet);
        }
    }
}