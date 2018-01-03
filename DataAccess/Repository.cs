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

            using (db = new Car24DatabaseEntities())
            {

                var cars = (from a in car
                    join m in model
                        on a.CarModelId equals m.Id
                    join b in brand
                        on a.BrandId equals b.Id
                            select new CarVM
                            {
                                brand = b.BrandName,
                                model = m.CarModelName,
                                cena = a.Price,
                                miejscowosc = a.City
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
