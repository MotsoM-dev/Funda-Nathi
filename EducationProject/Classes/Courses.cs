using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EducationProject.Classes
{
    public class Course
    {
        public int CourseID { get; set; }
        public string CourseName { get; set; }
        public string CourseDescription { get; set; }
        public decimal CourseFee { get; set; }
        public string ImageUrl { get; set; }
    }

    public class CourseHelper
    {
        private readonly string connectionString;

        public CourseHelper()
        {
            connectionString = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;
        }

        public Course GetCourseById(int courseId)
        {
            Course course = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT CourseID, CourseName, CourseDescription, CourseFee, ImageUrl 
                                 FROM Courses WHERE CourseID = @CourseID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    course = new Course
                    {
                        CourseID = Convert.ToInt32(reader["CourseID"]),
                        CourseName = reader["CourseName"].ToString(),
                        CourseDescription = reader["CourseDescription"].ToString(),
                        CourseFee = Convert.ToDecimal(reader["CourseFee"]),
                        ImageUrl = reader["ImageUrl"] != DBNull.Value ? reader["ImageUrl"].ToString() : null
                    };
                }
            }

            return course;
        }

        public decimal GetCourseFee(int courseId)
        {
            decimal fee = 0;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT CourseFee FROM Courses WHERE CourseID = @CourseID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                conn.Open();
                object result = cmd.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    fee = Convert.ToDecimal(result);
                }
            }

            return fee;
        }
    }

}