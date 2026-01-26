using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EducationProject.Classes
{
	public class MeetingService
	{
        public string CreateTeamsMeeting(int bookingId)
        {
            // Simulate generating a Teams meeting link
            return "https://teams.microsoft.com/l/meetup-join/fake-meeting-link-" + bookingId;
        }
    }
}