using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EducationProject.Classes
{
	public class Booking
	{
        public class Bookings
        {
            public int BookingId { get; set; }
            public DateTime BookingDate { get; set; }
            public string StudentName { get; set; }
        }
    }
}