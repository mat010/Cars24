using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class Repository
    {
        private CarDBEntities db;

        public Repository()
        {
            db = new CarDBEntities();
        }

        public CarDetailsVM GetCarById(int id)
        {
            var brand = db.Brands;
            var model = db.CarModels;
            var car = db.Cars;
            var petrol = db.PetrolTypes;
            var body = db.Bodies;
            var condition = db.TechnicalConditions;
            var transmission = db.Transmissions;
            var details = db.CarDetails;
            var user = db.Users;

            using (db = new CarDBEntities())
            {

                var carDetail = (from c in car
                                 join m in model
                                     on c.CarModelId equals m.Id
                                 join b in brand
                                     on c.BrandId equals b.Id
                                 join p in petrol
                                     on c.PetrolTypeId equals p.Id
                                 join d in details
                                     on c.Id equals d.CarId
                                 join bo in body
                                     on d.BodyId equals bo.Id
                                 join t in condition
                                     on d.ConditionId equals t.Id
                                 join tran in transmission
                                     on d.TransmissionId equals tran.Id
                                 join u in user
                                     on c.Id equals u.CarId
                                 where c.Id == id
                                 select new CarDetailsVM
                                 {
                                     Id = c.Id,
                                     DescriptionId = d.Id,
                                     Brand = b.BrandName,
                                     Model = m.CarModelName,
                                     Price = c.Price,
                                     City = c.City,
                                     Capacity = c.Capacity,
                                     Distance = c.Distance,
                                     ProductYear = c.Year,
                                     PetrolType = p.PetrolName,
                                     BodyName = bo.BodyName,
                                     Description = d.Description,
                                     Condition = t.ConditionName,
                                     TransmissionType = tran.TransmissionName,
                                     Email = u.Email,
                                     UserName = u.Name,
                                     Phone = u.Phone
                                 }
                ).FirstOrDefault();
                return carDetail;
            }
        }

        public List<CarHeaderVm> GetAllCars()
        {

            var brand = db.Brands;
            var model = db.CarModels;
            var car = db.Cars;
            var petrol = db.PetrolTypes;

            using (db = new CarDBEntities())
            {

                var cars = (from c in car
                            join m in model
                                on c.CarModelId equals m.Id
                            join b in brand
                                on c.BrandId equals b.Id
                            join p in petrol
                                on c.PetrolTypeId equals p.Id
                            select new CarHeaderVm
                            {
                                Id = c.Id,
                                Brand = b.BrandName,
                                Model = m.CarModelName,
                                Price = c.Price,
                                City = c.City,
                                Capacity = c.Capacity,
                                Distance = c.Distance,
                                ProductYear = c.Year,
                                PetrolType = p.PetrolName
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
