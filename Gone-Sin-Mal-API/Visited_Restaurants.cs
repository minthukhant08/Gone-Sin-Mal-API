//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Gone_Sin_Mal_API
{
    using System;
    using System.Collections.Generic;
    
    public partial class Visited_Restaurants
    {
        public long ID { get; set; }
        public long User_id { get; set; }
        public long Rest_id { get; set; }
    
        public virtual Restaurant_Table Restaurant_Table { get; set; }
        public virtual User_Table User_Table { get; set; }
    }
}
