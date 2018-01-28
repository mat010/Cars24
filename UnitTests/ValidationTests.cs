using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLogic;
using NUnit.Framework;
using DataAccess;

namespace UnitTests
{
    [TestFixture]
    class ValidationTests
    {
        [Test]
        public void ShouldValidateNewCar()
        {
            var validator = new Validation();

            var car = new CarDetailsVM();

            bool isValid = validator.IsModelValid(car);

            Assert.IsTrue(isValid);
        }
    }
}
