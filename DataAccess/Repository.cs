using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class Repository
    {
        private Car24DatabaseEntities db;

        public Repository()
        {
            db = new Car24DatabaseEntities();
        }

        public List<CarVM> GetAllCars()
        {

            var brand = db.Brands;
            var model = db.CarModels;
            var car = db.Cars;
            var petrol = db.PetrolTypes;

            using (db = new Car24DatabaseEntities())
            {

                var cars = (from a in car
                            join m in model
                                on a.CarModelId equals m.Id
                            join b in brand
                                on a.BrandId equals b.Id
                            join p in petrol
                                on a.PetrolTypeId equals p.Id
                            select new CarVM
                            {
                                brand = b.BrandName,
                                model = m.CarModelName,
                                cena = a.Price,
                                miejscowosc = a.City,
                                pojemnosc = a.Capacity,
                                przebieg = a.Distance,
                                rok_produkcji = a.Year,
                                rodzaj_paliwa = p.PetrolName
                            }
                ).ToList();

                return cars;
            }
        }

        public List<Brand> GetAllMarks()
        {
            var brands = (from b in db.Brands
                          select b).ToList();

            return brands;
        }

        public List<CarModel> GetAllCarModels()
        {
            var models = (from m in db.CarModels
                          select m).ToList();

            return models;
        }
    }
}
