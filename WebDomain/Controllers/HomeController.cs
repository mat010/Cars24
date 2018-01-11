using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web.Mvc;
using BusinessLogic;
using DataAccess;
using WebDomain.Models;
using System.IO;
using System;
using WebDomain.Helpers;
using System.Web;

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
            Thread.Sleep(500);
        }

        public ActionResult Index()
        {
            var cars = repository.GetAllCars();
            ViewBag.carList = cars;

            return View();
        }

        public ActionResult Details(int id)
        {
            var car = repository.GetCarById(id);
            return View(car);
        }

        [HttpPost]
        public JsonResult UploadImage(HttpPostedFileWrapper imgFile)
        {
            if (imgFile != null)
            {
                var img = Path.GetFileNameWithoutExtension(imgFile.FileName);
                var imgExtension = Path.GetExtension(imgFile.FileName);
                var newFileImgNameBaseOnCurrentTime = $"{img}_{DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond}{imgExtension}";
                var fullPath = $"/UploadedImages/{newFileImgNameBaseOnCurrentTime}";
                imgFile.SaveAs(Server.MapPath(fullPath));
                return Json(new { Success = true, Message = fullPath }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { Success = false, Message = "Cannot save file to the server" }, JsonRequestBehavior.AllowGet);
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

        public JsonResult GetBodyType()
        {
            var body = (from b in repository.GetBodyType()
                        select new BodyViewModel { Id = b.Id, BodyName = b.BodyName }).ToList();

            return Json(body, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCondition()
        {
            var condition = (from c in repository.GetCondition()
                             select new TechnicalConditionViewModel { Id = c.Id, ConditionName = c.ConditionName }).ToList();

            return Json(condition, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SearchCar(string search)
        {
            var cars = repository.GetCarsByName(search);
            ViewBag.carList = cars;
            return Json(cars, JsonRequestBehavior.AllowGet);
        }
    }
}