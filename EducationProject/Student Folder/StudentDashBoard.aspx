<%@ Page Language="C#" Title="Dashboard" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeBehind="StudentDashBoard.aspx.cs" Inherits="EducationProject.StudentDashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        :root {
            --primary: #A12568;
            --secondary: #3B185F;
            --gradient-end: #6F5DE0;
            --bg-main: #13111C;
            --text-white: #FFFFFF;
            --text-light-gray: #E6E6FA;
            --glass-bg: rgba(255, 255, 255, 0.05);
            --glass-border: rgba(255, 255, 255, 0.1);
            --glass-shadow: rgba(0, 0, 0, 0.37);
        }

        body {
            background-color: var(--bg-main);
            color: var(--text-light-gray);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
            display: grid;
            grid-template-columns: 1fr;
            gap: 2rem;
        }

        .dashboard-header {
            text-align: center;
            padding: 2rem;
            background: linear-gradient(135deg, var(--primary), var(--gradient-end));
            border-radius: 12px;
            color: var(--text-white);
            box-shadow: 0 8px 24px rgba(161, 37, 104, 0.3);
        }

        .dashboard-header h1 {
            font-size: 2rem;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .dashboard-header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .quick-actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-bottom: 1.5rem;
        }

        .action-btn {
            padding: 0.8rem 1.5rem;
            background: linear-gradient(135deg, var(--primary), var(--gradient-end));
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            box-shadow: 0 4px 12px rgba(161, 37, 104, 0.25);
        }

        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(161, 37, 104, 0.35);
        }

        .action-btn i {
            font-size: 1rem;
        }

        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .metric-card {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            border-radius: 10px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 4px 12px var(--glass-shadow);
        }

        .metric-value {
            font-size: 2rem;
            font-weight: 700;
            background: linear-gradient(to right, var(--text-white), var(--text-light-gray));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin: 0.5rem 0;
        }

        .metric-label {
            color: var(--text-light-gray);
            font-size: 0.9rem;
            opacity: 0.8;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .card {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 18px var(--glass-shadow);
        }

        .card-header {
            padding: 1rem 1.5rem;
            background: linear-gradient(to right, var(--gradient-start), var(--primary));
            color: var(--text-white);
            font-size: 1.1rem;
            font-weight: 600;
        }

        .card-body {
            padding: 1.5rem;
        }

        .progress-container {
            margin: 1rem 0;
        }

        .progress-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
        }

        .progress-bar {
            height: 8px;
            background: rgba(255,255,255,0.1);
            border-radius: 4px;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(to right, var(--primary), var(--gradient-end));
            border-radius: 4px;
        }

        .sessions-container {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 6px 18px var(--glass-shadow);
        }

        .sessions-header {
            font-size: 1.25rem;
            margin-bottom: 1.25rem;
            color: var(--text-white);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .session-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem;
            background: rgba(255,255,255,0.03);
            border-radius: 8px;
            border-left: 3px solid var(--primary);
            margin-bottom: 0.75rem;
        }

        .session-details h4 {
            margin: 0;
            font-size: 1rem;
            color: var(--text-white);
        }

        .session-details p {
            margin: 0.25rem 0 0;
            font-size: 0.85rem;
            color: var(--text-light-gray);
        }

        .session-actions {
            display: flex;
            gap: 0.5rem;
        }

        .session-btn {
            padding: 0.5rem 0.8rem;
            background: rgba(255,255,255,0.1);
            color: var(--text-white);
            border: none;
            border-radius: 5px;
            font-size: 0.8rem;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .session-btn.primary {
            background: linear-gradient(135deg, var(--primary), var(--gradient-end));
        }

        .session-btn:hover {
            transform: translateY(-1px);
        }

        .empty-state {
            text-align: center;
            padding: 2rem;
            color: var(--text-light-gray);
            opacity: 0.7;
        }

        @media (max-width: 768px) {
            .dashboard-container {
                padding: 1.5rem;
            }
            
            .metrics-grid {
                grid-template-columns: 1fr;
            }
            
            .quick-actions {
                flex-direction: column;
            }
            
            .action-btn {
                justify-content: center;
            }
        }
    </style>

    <div class="dashboard-container">
        <!-- Header -->
        <div class="dashboard-header">
            <h1>Welcome Back, <asp:Label ID="lblStudentName" runat="server" Text="Student" />!</h1>
            <p>Your personalized learning dashboard</p>
        </div>

        <!-- Quick Actions -->
        <div class="quick-actions">
            <asp:HyperLink CssClass="action-btn" NavigateUrl="~/Student Folder/MyCourses.aspx" runat="server">
                <i class="fas fa-book-open"></i> View Your Courses
            </asp:HyperLink>
            <asp:HyperLink ID="btnBookTutor" CssClass="action-btn" NavigateUrl="BookTutor.aspx" runat="server">
                <i class="fas fa-chalkboard-teacher"></i> Book a Tutor
            </asp:HyperLink>
        </div>

        <!-- Metrics -->
        <div class="metrics-grid">
            <div class="metric-card">
                <div class="metric-value"><asp:Label ID="lblTotalCourses" runat="server" Text="0" /></div>
                <div class="metric-label">Enrolled Courses</div>
            </div>
            <div class="metric-card">
                <div class="metric-value"><asp:Label ID="lblTotalSessions" runat="server" Text="0" /></div>
                <div class="metric-label">Tutoring Sessions</div>
            </div>
        </div>

        <!-- Main Cards -->
        <div class="card-grid">
            <!-- Learning Progress Card -->
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-chart-line"></i> My Learning Progress
                </div>
                <div class="card-body">
                    <h4>Current Courses</h4>
                    <asp:Repeater ID="rptCourses" runat="server">
                        <ItemTemplate>
                            <div class="progress-container">
                                <div class="progress-info">
                                    <span><strong><%# Eval("CourseName") %></strong></span>
                                    <span><%# Eval("Progress") %>%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill" style="width:<%# Eval("Progress") %>%"></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:HyperLink CssClass="action-btn" NavigateUrl="MyCourses.aspx" runat="server" style="margin-top: 1rem; display: inline-block;">
                        <i class="fas fa-arrow-right"></i> View All Courses
                    </asp:HyperLink>
                </div>
            </div>

            <!-- Tutoring Services Card -->
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-user-graduate"></i> Tutoring Services
                </div>
                <div class="card-body">
                    <h4>Recent Tutors</h4>
                    <asp:Repeater ID="rptRecentTutors" runat="server">
                        <ItemTemplate>
                            <div style="margin-bottom: 1rem; padding-bottom: 1rem; border-bottom: 1px solid var(--glass-border);">
                                <p><strong><%# Eval("TutorName") %></strong></p>
                                <p><%# Eval("Course") %></p>
                                <div style="display: flex; align-items: center; gap: 0.5rem; margin: 0.5rem 0;">
                                    <span>(<%# Eval("Rating") %>/5)</span>
                                </div>
                                <asp:HyperLink CssClass="action-btn" NavigateUrl='<%# "BookTutor.aspx?tutorId=" + Eval("TutorId") %>' 
                                    runat="server" style="padding: 0.5rem 1rem; font-size: 0.9rem; display: inline-block;">
                                    <i class="fas fa-calendar-plus"></i> Book Again
                                </asp:HyperLink>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:HyperLink CssClass="action-btn" NavigateUrl="BookTutor.aspx" runat="server" style="margin-top: 1rem; display: inline-block;">
                        <i class="fas fa-search"></i> Find New Tutor
                    </asp:HyperLink>
                </div>
            </div>

            <!-- Academic Performance Card -->
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-medal"></i> Academic Performance
                </div>
                <div class="card-body">
                    <div id="performanceChart" style="height: 150px; margin-bottom: 1rem; background: rgba(255,255,255,0.03); border-radius: 8px;
                        display: flex; align-items: center; justify-content: center; color: var(--text-light-gray);">
                        [Performance Chart Visualization]
                    </div>
                    <div style="text-align: center;">
                        <p style="font-size: 1rem;">Your overall performance score:</p>
                        <div style="font-size: 1.75rem; font-weight: 700; background: linear-gradient(to right, var(--primary), var(--gradient-end));
                            -webkit-background-clip: text; -webkit-text-fill-color: transparent; margin: 0.5rem 0;">
                            <asp:Label ID="lblPerformanceScore" runat="server" Text="85" />/100
                        </div>
                    </div>
                    <asp:HyperLink CssClass="action-btn" NavigateUrl="#" runat="server" style="margin-top: 1rem; display: inline-block;">
                        <i class="fas fa-file-alt"></i> View Report
                    </asp:HyperLink>
                </div>
            </div>
        </div>

        <!-- Upcoming Sessions -->
        <div class="sessions-container">
            <h2 class="sessions-header">
                <i class="fas fa-calendar-alt"></i> Upcoming Sessions
            </h2>
            
            <asp:Repeater ID="rptUpcomingSessions" runat="server">
                <ItemTemplate>
                    <div class="session-item">
                        <div class="session-details">
                            <h4><%# Eval("CourseName") %></h4>
                            <p>With <strong><%# Eval("TutorName") %></strong></p>
                            <p><%# Eval("SessionDate", "{0:MMM dd, yyyy}") %> • <%# Eval("StartTime") %> - <%# Eval("EndTime") %></p>
                        </div>
                        <div class="session-actions">
                            <asp:HyperLink CssClass="session-btn" NavigateUrl='<%# "CourseDetails.aspx?id=" + Eval("SessionId") %>' 
                                runat="server" Text="Details" />
                            <asp:HyperLink CssClass="session-btn primary" NavigateUrl='<%# "LiveSession.aspx?id=" + Eval("SessionId") %>' 
                                runat="server" Text="Join" />
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Panel runat="server" Visible='<%# rptUpcomingSessions.Items.Count == 0 %>' CssClass="empty-state">
                        <i class="far fa-calendar-plus" style="font-size: 1.5rem; margin-bottom: 0.5rem;"></i>
                        <p>No upcoming sessions scheduled.</p>
                        <asp:HyperLink CssClass="action-btn" NavigateUrl="BookTutor.aspx" runat="server" style="margin-top: 1rem;">
                            <i class="fas fa-chalkboard-teacher"></i> Book a Session
                        </asp:HyperLink>
                    </asp:Panel>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>

    <script>
        // Simple animation for metrics counting up
        document.addEventListener('DOMContentLoaded', function () {
            const metrics = document.querySelectorAll('.metric-value');

            metrics.forEach(metric => {
                const target = parseInt(metric.textContent);
                let count = 0;
                const duration = 1500;
                const increment = target / (duration / 16);

                const animate = () => {
                    count += increment;
                    if (count < target) {
                        metric.textContent = Math.ceil(count);
                        requestAnimationFrame(animate);
                    } else {
                        metric.textContent = target;
                    }
                };

                animate();
            });
        });
    </script>
</asp:Content>