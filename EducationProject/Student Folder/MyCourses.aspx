<%@ Page Language="C#"  Title="CourseOptions" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeBehind="MyCourses.aspx.cs" Inherits="EducationProject.MyCourses" %>
    
    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="course-details-container">
            <div class="course-header">
                <div class="breadcrumb-nav">
                    <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Student Folder/CourseCatalog.aspx" 
                        CssClass="back-link">
                        <i class="fas fa-chevron-left"></i> Back to Catalog
                    </asp:HyperLink>
                </div>
                <h1 class="page-title">Course Details</h1>
            </div>

            <div class="course-card glass-card">
                <div class="course-hero">
                    <div class="course-image">
                        <img id="imgCourse" runat="server" src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" 
                            alt="Course Image" class="course-img" />
                        <div class="image-overlay"></div>
                    </div>
                    <div class="course-badge">
                        <span class="badge-text">Featured</span>
                    </div>
                </div>
                
                <div class="course-content">
                    <div class="course-header-content">
                        <h2 id="lblCourseName" runat="server" class="course-title"></h2>
                    </div>
                    
                    <div class="course-tabs">
                        <div class="tab active" data-tab="about">About</div>
                        <div class="tab" data-tab="syllabus">Curriculum</div>
                        <div class="tab" data-tab="sessions">Upcoming Sessions</div>
                    </div>
                    
                    <div class="tab-content active" id="about-tab">
                        <div class="course-description">
                            <h3>Course Overview</h3>
                            <p id="lblCourseDescription" runat="server"></p>
                        </div>
                        
                        <div class="course-features">
                            <div class="feature-card">
                                <i class="fas fa-chalkboard-teacher"></i>
                                <h4>Expert Tutors</h4>
                                <p>Learn from certified professionals</p>
                            </div>
                            <div class="feature-card">
                                <i class="fas fa-user-graduate"></i>
                                <h4>Personalized</h4>
                                <p>One-on-one tutoring sessions</p>
                            </div>
                            <div class="feature-card">
                                <i class="fas fa-calendar-check"></i>
                                <h4>Flexible</h4>
                                <p>Schedule at your convenience</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="tab-content" id="syllabus-tab">
                        <div class="course-syllabus">
                            <h3>What You'll Learn</h3>
                            <ul class="learning-points">
                                <li><i class="fas fa-check-circle"></i> Master fundamental concepts with hands-on exercises</li>
                                <li><i class="fas fa-check-circle"></i> Apply knowledge to real-world problems through case studies</li>
                                <li><i class="fas fa-check-circle"></i> Receive personalized feedback from your tutor</li>
                                <li><i class="fas fa-check-circle"></i> Develop practical skills for academic success</li>
                            </ul>
                            
                           <div class="syllabus-modules">
    <h4>Curriculum Documents</h4>
    <asp:Repeater ID="rptDocuments" runat="server">
        <ItemTemplate>
            <div class="module">
                <div class="module-header">
                    <i class="fas fa-file-alt"></i>
                    <span><%# Eval("FileName") %></span>
                </div>
                <p><strong>Uploaded:</strong> <%# Eval("UploadDate", "{0:dd MMM yyyy}") %></p>
                <a href='CourseDetails.aspx?docId=<%# Eval("DocumentID") %>' class="download-link" target="_blank">
                    <i class="fas fa-download"></i> Download
                </a>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
                    
                    <div class="tab-content" id="sessions-tab">
                        <div class="upcoming-sessions">
                            <h3>Available Tutoring Sessions</h3>
                            <div class="session-list">
                                <div class="session-card">
                                    <div class="session-date">
                                        <span class="day">Mon</span>
                                        <span class="date">15</span>
                                        <span class="month">Jul</span>
                                    </div>
                                    <div class="session-info">
                                        <h4>Morning Session</h4>
                                        <p><i class="fas fa-clock"></i> 9:00 AM - 11:00 AM</p>
                                        <p><i class="fas fa-user"></i> Tutor: Dr. Sarah Johnson</p>
                                    </div>
                                    <button class="book-btn">Book Now</button>
                                </div>
                                <div class="session-card">
                                    <div class="session-date">
                                        <span class="day">Wed</span>
                                        <span class="date">17</span>
                                        <span class="month">Jul</span>
                                    </div>
                                    <div class="session-info">
                                        <h4>Afternoon Session</h4>
                                        <p><i class="fas fa-clock"></i> 2:00 PM - 4:00 PM</p>
                                        <p><i class="fas fa-user"></i> Tutor: Prof. Michael Chen</p>
                                    </div>
                                    <button class="book-btn">Book Now</button>
                                </div>
                                <div class="session-card">
                                    <div class="session-date">
                                        <span class="day">Fri</span>
                                        <span class="date">19</span>
                                        <span class="month">Jul</span>
                                    </div>
                                    <div class="session-info">
                                        <h4>Evening Session</h4>
                                        <p><i class="fas fa-clock"></i> 6:00 PM - 8:00 PM</p>
                                        <p><i class="fas fa-user"></i> Tutor: Ms. Emily Wilson</p>
                                    </div>
                                    <button class="book-btn">Book Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="enroll-section glass-card">
                        <div class="enroll-content">
                            <h3>Ready to Begin Your Learning Journey?</h3>
                            <div class="enroll-benefits">
                                <div class="benefit-item">
                                    <i class="fas fa-check"></i>
                                    <span>Personalized attention</span>
                                </div>
                                <div class="benefit-item">
                                    <i class="fas fa-check"></i>
                                    <span>Flexible scheduling</span>
                                </div>
                                <div class="benefit-item">
                                    <i class="fas fa-check"></i>
                                    <span>Expert guidance</span>
                                </div>
                            </div>
                            
                            <asp:Button ID="btnEnroll" runat="server" Text="Book Your Tutor" 
                                 CssClass="enroll-btn pulse-on-hover" />
                        </div>
                    </div>
                </div>
            </div>
            
            <asp:Label ID="lblMessage" runat="server" CssClass="message-label" Visible="false"></asp:Label>
        </div>
    </form>

    <style type="text/css">
        /* Color Variables - Purple Focus */
        :root {
            --primary: #7E57C2;
            --primary-light: #9575CD;
            --primary-dark: #5E35B1;
            --secondary: #673AB7;
            --accent: #FF9800;
            --dark: #1A1A2E;
            --darker: #16213E;
            --light: #f8f9fa;
            --glass-bg: rgba(126, 87, 194, 0.08);
            --glass-border: rgba(126, 87, 194, 0.15);
            --glass-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            --text-white: #ffffff;
            --text-light: #e2e2e2;
            --text-muted: #b8b8b8;
        }

        .course-details-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
            color: var(--text-white);
        }

        .course-header {
            margin-bottom: 2.5rem;
        }

        .breadcrumb-nav {
            margin-bottom: 1rem;
        }

        .back-link {
            color: var(--text-light);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.95rem;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            color: var(--primary-light);
            transform: translateX(-3px);
        }

        .back-link i {
            transition: transform 0.3s ease;
        }

        .back-link:hover i {
            transform: translateX(-3px);
        }

        .page-title {
            font-size: 2.5rem;
            margin: 0;
            background: linear-gradient(to right, var(--primary), var(--primary-dark));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 700;
        }

        .glass-card {
            background: var(--glass-bg);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid var(--glass-border);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: var(--glass-shadow);
        }

        .course-card {
            display: flex;
            flex-direction: column;
        }

        .course-hero {
            position: relative;
        }

        .course-image {
            height: 300px;
            position: relative;
            overflow: hidden;
        }

        .course-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .course-image:hover .course-img {
            transform: scale(1.05);
        }

        .image-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to top, rgba(26, 26, 46, 0.9), transparent);
        }

        .course-badge {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: var(--accent);
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.85rem;
            box-shadow: 0 4px 15px rgba(255, 152, 0, 0.3);
            color: var(--dark);
        }

        .course-content {
            padding: 2rem;
        }

        .course-header-content {
            margin-bottom: 2rem;
        }

        .course-title {
            color: var(--text-white);
            font-size: 2rem;
            margin: 0 0 0.5rem 0;
            font-weight: 700;
        }

        .course-tabs {
            display: flex;
            border-bottom: 1px solid var(--glass-border);
            margin-bottom: 2rem;
        }

        .tab {
            padding: 0.75rem 1.5rem;
            cursor: pointer;
            font-weight: 500;
            color: var(--text-muted);
            position: relative;
            transition: all 0.3s ease;
        }

        .tab:hover {
            color: var(--text-light);
        }

        .tab.active {
            color: var(--primary-light);
        }

        .tab.active::after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 100%;
            height: 3px;
            background: var(--primary-light);
            border-radius: 3px 3px 0 0;
        }

        .tab-content {
            display: none;
            margin-bottom: 2rem;
        }

        .tab-content.active {
            display: block;
        }

        .course-description h3, .course-syllabus h3, .upcoming-sessions h3 {
            color: var(--text-white);
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
        }

        .course-description p {
            color: var(--text-light);
            line-height: 1.8;
            margin-bottom: 1.5rem;
        }

        .course-features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin: 2rem 0;
        }

        .feature-card {
            background: rgba(126, 87, 194, 0.1);
            border: 1px solid var(--glass-border);
            border-radius: 10px;
            padding: 1.5rem;
            transition: transform 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            background: rgba(126, 87, 194, 0.15);
        }

        .feature-card i {
            font-size: 1.75rem;
            color: var(--primary-light);
            margin-bottom: 1rem;
        }

        .feature-card h4 {
            margin: 0.5rem 0;
            color: var(--text-white);
        }

        .feature-card p {
            color: var(--text-muted);
            margin: 0;
            font-size: 0.9rem;
        }

        .learning-points {
            list-style: none;
            padding: 0;
            margin: 0 0 2rem 0;
        }

        .learning-points li {
            color: var(--text-light);
            margin-bottom: 1rem;
            display: flex;
            align-items: flex-start;
            gap: 1rem;
            line-height: 1.6;
        }

        .learning-points i {
            color: var(--primary-light);
            margin-top: 0.2rem;
            font-size: 1.1rem;
        }

        .syllabus-modules {
            margin-top: 2rem;
        }

        .syllabus-modules h4 {
            color: var(--text-white);
            margin-bottom: 1.5rem;
            font-size: 1.3rem;
        }

        .module {
            background: rgba(126, 87, 194, 0.1);
            border-radius: 8px;
            margin-bottom: 1rem;
            overflow: hidden;
        }

        .module-header {
            padding: 1rem 1.5rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .module-header:hover {
            background: rgba(126, 87, 194, 0.15);
        }

        .module-header i {
            color: var(--primary-light);
        }

        /* Upcoming Sessions Styles */
        .upcoming-sessions {
            margin-top: 1rem;
        }

        .session-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .session-card {
            display: flex;
            align-items: center;
            background: rgba(126, 87, 194, 0.1);
            border-radius: 10px;
            padding: 1rem;
            transition: all 0.3s ease;
            border: 1px solid var(--glass-border);
        }

        .session-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(126, 87, 194, 0.2);
        }

        .session-date {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: var(--primary-dark);
            color: white;
            border-radius: 8px;
            padding: 1rem;
            min-width: 80px;
            margin-right: 1.5rem;
        }

        .session-date .day {
            font-size: 0.9rem;
            text-transform: uppercase;
        }

        .session-date .date {
            font-size: 1.5rem;
            font-weight: bold;
            line-height: 1;
        }

        .session-date .month {
            font-size: 0.9rem;
            text-transform: uppercase;
        }

        .session-info {
            flex-grow: 1;
        }

        .session-info h4 {
            margin: 0 0 0.5rem 0;
            color: var(--text-white);
        }

        .session-info p {
            margin: 0.3rem 0;
            color: var(--text-light);
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .session-info i {
            color: var(--primary-light);
            width: 16px;
            text-align: center;
        }

        .book-btn {
            background: var(--accent);
            color: var(--dark);
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            white-space: nowrap;
            margin-left: 1rem;
        }

        .book-btn:hover {
            background: #FFAB40;
            transform: translateY(-2px);
        }

        .enroll-section {
            margin-top: 3rem;
            padding: 2rem;
            background: linear-gradient(135deg, rgba(126, 87, 194, 0.1), rgba(103, 58, 183, 0.1));
            border: 1px solid rgba(126, 87, 194, 0.2);
        }

        .enroll-content {
            text-align: center;
        }

        .enroll-content h3 {
            color: var(--text-white);
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
        }

        .enroll-benefits {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .benefit-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text-light);
            font-size: 0.95rem;
        }

        .benefit-item i {
            color: var(--primary-light);
        }

        .enroll-btn {
            background: linear-gradient(to right, var(--primary), var(--primary-dark));
            color: white;
            border: none;
            padding: 1rem 2rem;
            font-size: 1.1rem;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            width: 100%;
            max-width: 300px;
            box-shadow: 0 4px 15px rgba(126, 87, 194, 0.3);
            position: relative;
            overflow: hidden;
        }

        .enroll-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(126, 87, 194, 0.4);
            background: linear-gradient(to right, var(--primary-light), var(--primary));
        }

        .enroll-btn:active {
            transform: translateY(0);
        }

        .pulse-on-hover:hover {
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(126, 87, 194, 0.7);
            }
            70% {
                box-shadow: 0 0 0 10px rgba(126, 87, 194, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(126, 87, 194, 0);
            }
        }

        .message-label {
            display: block;
            margin: 1.5rem auto;
            padding: 1rem 1.5rem;
            border-radius: 8px;
            max-width: 600px;
            text-align: center;
            font-weight: 500;
        }

        .message-label.error {
            background: rgba(239, 68, 68, 0.2);
            color: #ef4444;
            border: 1px solid rgba(239, 68, 68, 0.3);
        }

        @media (max-width: 992px) {
            .course-card {
                flex-direction: column;
            }
            
            .course-image {
                height: 250px;
            }
        }

        @media (max-width: 768px) {
            .session-card {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .session-date {
                flex-direction: row;
                margin-right: 0;
                margin-bottom: 1rem;
                width: 100%;
                justify-content: flex-start;
                gap: 1rem;
            }
            
            .session-info {
                width: 100%;
                margin-bottom: 1rem;
            }
            
            .book-btn {
                margin-left: 0;
                width: 100%;
            }
            
            .enroll-benefits {
                flex-direction: column;
                gap: 1rem;
                align-items: center;
            }
        }

        @media (max-width: 576px) {
            .page-title {
                font-size: 2rem;
            }
            
            .course-title {
                font-size: 1.75rem;
            }
            
            .course-tabs {
                justify-content: space-between;
            }
            
            .tab {
                padding: 0.75rem;
                font-size: 0.9rem;
            }
            
            .enroll-btn {
                max-width: 100%;
            }
        }
    </style>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            // Tab switching functionality
            const tabs = document.querySelectorAll('.tab');
            const tabContents = document.querySelectorAll('.tab-content');

            tabs.forEach(tab => {
                tab.addEventListener('click', () => {
                    // Remove active class from all tabs and contents
                    tabs.forEach(t => t.classList.remove('active'));
                    tabContents.forEach(c => c.classList.remove('active'));

                    // Add active class to clicked tab
                    tab.classList.add('active');

                    // Show corresponding content
                    const tabId = tab.getAttribute('data-tab');
                    document.getElementById(tabId + '-tab').classList.add('active');
                });
            });

            // Module accordion functionality
            const modules = document.querySelectorAll('.module-header');
            modules.forEach(module => {
                module.addEventListener('click', () => {
                    const content = module.nextElementSibling;
                    const icon = module.querySelector('i');

                    if (content.style.display === 'block') {
                        content.style.display = 'none';
                        icon.classList.remove('fa-chevron-down');
                        icon.classList.add('fa-play-circle');
                    } else {
                        content.style.display = 'block';
                        icon.classList.remove('fa-play-circle');
                        icon.classList.add('fa-chevron-down');
                    }
                });
            });
        });
    </script>
</asp:Content>