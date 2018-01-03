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

        public List<Car> GetAllCars()
        {
            using (db = new Car24DatabaseEntities())
            {
                var cars = (from c in db.Cars
                    select c).ToList();

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
