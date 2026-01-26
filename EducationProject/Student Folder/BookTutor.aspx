<%@ Page Language="C#"  Title="BookTutor" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeBehind="BookTutor.aspx.cs" Inherits="EducationProject.BookTutor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="book-tutor-container">
        <form id="form1" runat="server">
            <div class="tutor-header">
                <h1 class="gradient-text">Book Your Tutor Session</h1>
                <p class="subheader">Connect with top-performing alumni for personalized learning</p>
            </div>

            <div class="tutor-form-container">
                <!-- Subject Selection -->
                <div class="form-section">
                    <div class="section-header">
                        <span class="step-number">1</span>
                        <h3>Select Subject</h3>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="ddlSubjects" runat="server" CssClass="styled-dropdown" 
                            AutoPostBack="true" OnSelectedIndexChanged="ddlSubjects_SelectedIndexChanged">
                            <asp:ListItem Text="-- Select Subject --" Value=""></asp:ListItem>
                            <%-- <asp:ListItem Text="Essentials of IS (Information Systems)" Value="Essentials of IS"></asp:ListItem>
                             <asp:ListItem Text="Systems Analysis" Value="Systems Analysis"></asp:ListItem>
                             <asp:ListItem Text="Database Systems" Value="Database Systems"></asp:ListItem>
                              <asp:ListItem Text="Sociology" Value="Sociology"></asp:ListItem>
                             <asp:ListItem Text="Social Transformation" Value="Social Transformation"></asp:ListItem>
    <asp:ListItem Text="Systems Development" Value="Systems Development"></asp:ListItem>
    <asp:ListItem Text="Programming" Value="Programming"></asp:ListItem>
    <asp:ListItem Text="Business Management" Value="Business Management"></asp:ListItem>
    <asp:ListItem Text="Economics" Value="Economics"></asp:ListItem>
    <asp:ListItem Text="Computer Literacy" Value="Computer Literacy"></asp:ListItem>
    <asp:ListItem Text="Emergent Technology" Value="Emergent Technology"></asp:ListItem>--%>
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Tutor Selection -->
                <div class="form-section" id="tutorSection" runat="server">
                    <div class="section-header">
                        <span class="step-number">2</span>
                        <h3>Choose Your Tutor</h3>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="ddlTutor" runat="server" CssClass="styled-dropdown" 
    AutoPostBack="true" OnSelectedIndexChanged="ddlTutor_SelectedIndexChanged">
                             <asp:ListItem Text="-- Select a subject first --" Value=""></asp:ListItem>
</asp:DropDownList>
                </div>
                

              <!-- Date Selection -->
<div class="form-section">
    <div class="section-header">
        <span class="step-number">3</span>
        <h3>Select Date & Time</h3>
    </div>
    <div class="datetime-selection" id="dateSection" runat="server">
        <div class="calendar-container">
            <asp:Calendar ID="calDate" runat="server" OnSelectionChanged="calDate_SelectionChanged"
                DayNameFormat="Shortest" NextPrevFormat="ShortMonth" CssClass="styled-calendar">
                <TitleStyle BackColor="transparent" ForeColor="#E6E6FA" />
                <DayHeaderStyle BackColor="transparent" ForeColor="#E6E6FA" />
                <SelectedDayStyle BackColor="#6F5DE0" ForeColor="White" />
                <TodayDayStyle BackColor="#A12568" ForeColor="White" Font-Bold="true" />
                <OtherMonthDayStyle ForeColor="#555" />
            </asp:Calendar>
        </div>
        <div class="time-selection" id="timeSelectionPanel" runat="server">

           <div class="session-time-display" style="margin-top: 10px;">
    <asp:Label ID="lblSessionTime" runat="server" CssClass="session-time-label" Text="Session Time: " />
               <asp:DropDownList ID="ddlSessionTime" runat="server" />
</div>
        </div>
    </div>
</div>


                <!-- Submit Button -->
                <div class="form-actions">
                    <asp:Button ID="btnBookNow" runat="server" Text="Confirm Booking" 
                        OnClick="btnBookNow_Click" CssClass="primary-button" />
                </div>

                <!-- Message Label -->
                <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>
            </div>
        </form>
    </div>

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

        .book-tutor-container {
            max-width: 900px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .tutor-header {
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
        }

        .tutor-form-container {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
        }

        .form-section {
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid var(--glass-border);
        }

        .form-section:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .section-header {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .step-number {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 28px;
            height: 28px;
            background: var(--primary);
            color: white;
            border-radius: 50%;
            margin-right: 12px;
            font-weight: bold;
            font-size: 0.9rem;
        }

        .form-section h3 {
            color: var(--text-white);
            margin: 0;
            font-size: 1.3rem;
        }

        .styled-dropdown {
            width: 100%;
            padding: 12px 16px;
            background: var(--glass-bg);
            border: 1px solid var(--glass-border);
            border-radius: 8px;
            color: #A12568;
            font-size: 1rem;
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%23E6E6FA'%3e%3cpath d='M7 10l5 5 5-5z'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 16px center;
            background-size: 16px;
            transition: all 0.3s ease;
        }

        .styled-dropdown:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(161, 37, 104, 0.2);
        }

        .datetime-selection {
            display: flex;
            gap: 1.5rem;
        }

        .calendar-container {
            flex: 1;
        }

        .time-selection {
            flex: 0 0 250px;
        }

        .styled-calendar {
            width: 100%;
            background: transparent;
            border: 1px solid var(--glass-border);
            border-radius: 8px;
            padding: 12px;
        }

        .styled-calendar a {
            color: #9901a5 ;
            text-decoration: none;
        }

        .styled-calendar td {
            padding: 8px;
            text-align: center;
        }

        .primary-button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(to right, var(--primary), var(--gradient-end));
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .primary-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(161, 37, 104, 0.3);
        }

        .message-label {
            display: block;
            margin-top: 1.5rem;
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            color: #ff6b6b;
            background: rgba(255, 107, 107, 0.1);
        }

        @media (max-width: 768px) {
            .datetime-selection {
                flex-direction: column;
            }
            
            .time-selection {
                flex: 1;
            }
            
            .gradient-text {
                font-size: 2rem;
            }
        }
    </style>
</asp:Content>