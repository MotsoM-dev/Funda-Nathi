<%@ Page Language="C#" Title="CourseOptions" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeBehind="CourseCatalog.aspx.cs" Inherits="EducationProject.ViewCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="catalog-container">
            <div class="catalog-header">
                <h1 class="gradient-text">University Course Catalog</h1>
                <p class="subheader">Explore our academic programs and enroll in courses</p>
                <div class="search-filter">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="search-box" 
                        placeholder="Search courses..."></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="filter-dropdown"
                        AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                       <%-- <asp:ListItem Text="All Departments" Value=""></asp:ListItem>
                        <asp:ListItem Text="Computer Science" Value="CS"></asp:ListItem>
                        <asp:ListItem Text="Mathematics" Value="MATH"></asp:ListItem>
                        <asp:ListItem Text="Engineering" Value="ENG"></asp:ListItem>
                        <asp:ListItem Text="Business" Value="BUS"></asp:ListItem>
                        <asp:ListItem Text="Humanities" Value="HUM"></asp:ListItem>--%>
                    </asp:DropDownList>
                </div>
                <!-- Added message label here -->
                <asp:Label ID="lblMessage" runat="server" CssClass="message-label" Visible="false"></asp:Label>
            </div>

          <div class="courses-grid">
   <asp:Repeater ID="rptCourses" runat="server" OnItemCommand="rptCourses_ItemCommand">
        <ItemTemplate>
            <div class="course-card">
                <div class="course-image">
                    <img src='<%# Eval("ImageUrlFinal") %>' alt='<%# Eval("CourseName") %>' />
                </div>
                <div class="course-content">
                    <h3><%# Eval("CourseName") %></h3>
                    <div class="course-meta">
                        <span class="department"><%# Eval("Department") %></span>
                        <span class="credits"><%# Eval("Credits") %> credits</span>
                        <span class="price">$<%# Eval("CourseFee", "{0:0.00}") %></span>
                    </div>
                    <p class="course-desc"><%# Eval("CourseDescription") %></p>
                    <div class="course-footer">
                        <div class="instructor">
                            <i class="fas fa-chalkboard-teacher"></i>
                            <%# Eval("CourseFee") %>
                        </div>
                        <div class="actions">
                            <asp:Button ID="btnDetails" runat="server" Text="Details" 
                                CommandName="ViewDetails" CommandArgument='<%# Eval("CourseID") %>'
                                CssClass="details-btn" />
                            <asp:Button ID="btnEnroll" runat="server" Text="Enroll" 
                                CommandName="Enroll" CommandArgument='<%# Eval("CourseID") %>'
                                CssClass="enroll-btn" />
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>        </div>
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

        .catalog-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .catalog-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .gradient-text {
            background: linear-gradient(to right, var(--primary), var(--gradient-end));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .subheader {
            color: var(--text-light);
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 1.5rem;
        }

        .search-filter {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .search-box {
            padding: 0.8rem 1.2rem;
            border: 1px solid var(--glass-border);
            border-radius: 30px;
            background: var(--glass-bg);
            color: var(--text-white);
            width: 300px;
            font-size: 1rem;
        }

        .filter-dropdown {
            padding: 0.8rem 1.2rem;
            border: 1px solid var(--glass-border);
            border-radius: 30px;
            background: var(--glass-bg);
            color: var(--text-white);
            font-size: 1rem;
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/1999/xhtml' viewBox='0 0 24 24' fill='%23E6E6FA'%3e%3cpath d='M7 10l5 5 5-5z'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1rem;
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

        .courses-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 2rem;
            margin-top: 1rem;
        }

        .course-card {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            border-radius: 12px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .course-image {
            position: relative;
            height: 180px;
            overflow: hidden;
        }

        .course-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .course-card:hover .course-image img {
            transform: scale(1.05);
        }

        .course-code {
            position: absolute;
            top: 1rem;
            left: 1rem;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 0.3rem 0.6rem;
            border-radius: 4px;
            font-weight: bold;
        }

        .course-content {
            padding: 1.5rem;
        }

        .course-content h3 {
            color: var(--text-white);
            margin: 0 0 0.5rem 0;
            font-size: 1.3rem;
        }

        .course-meta {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }

        .department {
            background: rgba(161, 37, 104, 0.2);
            color: var(--primary);
            padding: 0.2rem 0.6rem;
            border-radius: 4px;
        }

        .credits {
            color: var(--text-light);
            opacity: 0.8;
        }

        .course-desc {
            color: var(--text-light);
            opacity: 0.9;
            margin-bottom: 1.5rem;
            line-height: 1.5;
        }

        .course-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .instructor {
            color: var(--text-light);
            opacity: 0.8;
            font-size: 0.9rem;
        }

        .actions {
            display: flex;
            gap: 0.8rem;
        }

        .details-btn, .enroll-btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            font-size: 0.9rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .details-btn {
            background: transparent;
            color: var(--text-light);
            border: 1px solid var(--glass-border);
        }

        .details-btn:hover {
            background: rgba(255, 255, 255, 0.05);
        }

        .enroll-btn {
            background: var(--primary);
            color: white;
        }

        .enroll-btn:hover {
            background: #8c1e57;
        }

        @media (max-width: 768px) {
            .courses-grid {
                grid-template-columns: 1fr;
            }
            
            .search-filter {
                flex-direction: column;
                align-items: center;
            }
            
            .search-box, .filter-dropdown {
                width: 100%;
                max-width: 300px;
            }
        }
    </style>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</asp:Content>