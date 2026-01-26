<%@ Page Language="C#" Title="CourseDetails" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeBehind="CourseDetails.aspx.cs" Inherits="EducationProject.CourseCatalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="course-details-container">
            <div class="course-header">
                <h1 class="gradient-text">Course Details</h1>
                <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Student Folder/CourseCatalog.aspx" 
                    CssClass="back-link">
                    <i class="fas fa-arrow-left"></i> Back to Catalog
                </asp:HyperLink>
            </div>

            <div class="course-card">
                <div class="course-image">
                    <img id="imgCourse" runat="server" src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" 
                        alt="Course Image" class="course-img" />
                </div>
                
                <div class="course-content">
                    <h2 id="lblCourseName" runat="server" class="course-title">f</h2>
                    
                    <div class="course-meta">
                        <span class="price">
                            <i class="fas fa-dollar-sign"></i>
                            <asp:Label ID="lblPrice" runat="server" />
                        </span>
                        <span class="duration">
                            <i class="fas fa-clock"></i>
                            <asp:Label ID="lblDuration" runat="server" />
                        </span>
                        <span class="rating">
                            <i class="fas fa-star"></i> 4.8 (124 reviews)
                        </span>
                    </div>
                    
                    <div class="course-description">
                        <h3>About This Course</h3>
                        <p id="lblCourseDescription" runat="server"></p>
                    </div>
                    
                    <div class="course-syllabus">
                        <h3>What You'll Learn</h3>
                        <ul class="learning-points">
                            <li><i class="fas fa-check"></i> Master fundamental concepts</li>
                            <li><i class="fas fa-check"></i> Apply knowledge to real-world problems</li>
                            <li><i class="fas fa-check"></i> Complete hands-on projects</li>
                           
                        </ul>
                    </div>
                    
                    <div class="enroll-section">
                        <asp:Button ID="btnEnroll" runat="server" Text="Enroll Now" 
                            OnClick="EnrollInCourse" CssClass="enroll-btn" />
                        <div class="enroll-notice">
                            <i class="fas fa-shield-alt"></i> 30-day money-back guarantee
                        </div>
                    </div>
                </div>
            </div>
            
            <asp:Label ID="lblMessage" runat="server" CssClass="message-label" Visible="false"></asp:Label>
        </div>
    </form>

    <style type="text/css">
        /* Color Variables */
        :root {
            --primary: #A12568;
            --secondary: #3B185F;
            --gradient-start: #3B185F;
            --gradient-end: #6F5DE0;
            --bg-dark: #13111C;
            --text-white: #FFFFFF;
            --text-light: #E6E6FA;
            --glass-bg: rgba(255, 255, 255, 0.05);
            --glass-border: rgba(255, 255, 255, 0.1);
        }

        .course-details-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .course-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .gradient-text {
            background: linear-gradient(to right, var(--primary), var(--gradient-end));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 2.5rem;
            margin: 0;
        }

        .back-link {
            color: var(--text-light);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: color 0.3s ease;
        }

        .back-link:hover {
            color: var(--primary);
        }

        .course-card {
            display: flex;
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
        }

        .course-image {
            flex: 0 0 40%;
            position: relative;
        }

        .course-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .course-content {
            flex: 1;
            padding: 2rem;
        }

        .course-title {
            color: var(--text-white);
            font-size: 2rem;
            margin: 0 0 1rem 0;
        }

        .course-meta {
            display: flex;
            gap: 1.5rem;
            margin-bottom: 2rem;
            color: var(--text-light);
        }

        .course-meta i {
            margin-right: 0.5rem;
            color: var(--primary);
        }

        .course-description, .course-syllabus {
            margin-bottom: 2rem;
        }

        .course-description h3, .course-syllabus h3 {
            color: var(--text-white);
            margin-bottom: 1rem;
            font-size: 1.3rem;
        }

        .course-description p {
            color: var(--text-light);
            line-height: 1.6;
        }

        .learning-points {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .learning-points li {
            color: var(--text-light);
            margin-bottom: 0.8rem;
            display: flex;
            align-items: flex-start;
            gap: 0.8rem;
        }

        .learning-points i {
            color: var(--primary);
            margin-top: 0.2rem;
        }

        .enroll-section {
            margin-top: 2rem;
            border-top: 1px solid var(--glass-border);
            padding-top: 2rem;
        }

        .enroll-btn {
            background: linear-gradient(to right, var(--primary), var(--gradient-end));
            color: white;
            border: none;
            padding: 1rem 2rem;
            font-size: 1.1rem;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            width: 100%;
            max-width: 300px;
        }

        .enroll-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(161, 37, 104, 0.3);
        }

        .enroll-notice {
            margin-top: 1rem;
            color: var(--text-light);
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .enroll-notice i {
            color: #4CAF50;
        }

        .message-label {
            display: block;
            margin: 1rem auto;
            padding: 0.8rem 1.5rem;
            background: rgba(76, 175, 80, 0.2);
            color: #4CAF50;
            border-radius: 4px;
            max-width: 600px;
            text-align: center;
        }

        @media (max-width: 992px) {
            .course-card {
                flex-direction: column;
            }
            
            .course-image {
                flex: 0 0 300px;
            }
        }

        @media (max-width: 576px) {
            .course-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .course-meta {
                flex-direction: column;
                gap: 0.5rem;
            }
            
            .enroll-btn {
                max-width: 100%;
            }
        }
    </style>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</asp:Content>