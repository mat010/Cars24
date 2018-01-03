using System.Web.Mvc;
using DataAccess;

namespace WebDomain.Controllers
{
    public class HomeController : Controller
    {
        private Repository repository;

        public HomeController()
        {
            repository = new Repository();
        }

        public ActionResult Index()
        {
            var cars = repository.GetAllCars();
            return View(cars);
        }
    }
}