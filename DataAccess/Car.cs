//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class Car
    {
        public int Id { get; set; }
        public int BrandId { get; set; }
        public int CarModelId { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public string City { get; set; }
    
        public virtual Brand Brand { get; set; }
        public virtual CarModel CarModel { get; set; }
    }
}
