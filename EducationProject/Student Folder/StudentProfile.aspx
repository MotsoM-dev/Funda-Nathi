<%@ Page Language="C#"  Title="Student Profile" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="EducationProject.StudentProfile" %>

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

        .profile-container {
            max-width: 850px;
            margin: 2rem auto;
            padding: 0 1rem;
            animation: fadeIn 0.6s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .profile-header {
            text-align: center;
            margin-bottom: 2rem;
            background: linear-gradient(135deg, var(--primary), var(--gradient-end));
            padding: 2rem;
            border-radius: 16px;
            color: var(--text-white);
            box-shadow: 0 10px 30px rgba(161, 37, 104, 0.3);
            position: relative;
            overflow: hidden;
        }

        .profile-header::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: rotate 15s linear infinite;
        }

        @keyframes rotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .profile-form {
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            border: 1px solid var(--glass-border);
            border-radius: 16px;
            padding: 2.5rem;
            box-shadow: 0 12px 40px var(--glass-shadow);
            position: relative;
        }


.form-input {
    width: 100%;
    padding: 16px;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: transparent;
    color: rgba(157, 78, 221, 0.5);
    font-size: 1.1rem;
    transition: border-color 0.3s, box-shadow 0.3s;
}
    

    .form-input:focus {
        outline: none;
        border-color: #9d4edd;
        box-shadow: 0 0 8px rgba(157, 78, 221, 0.5);
    }

        .form-group {
            margin-bottom: 2rem;
            display: flex;
            flex-direction: column;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
        }

        .form-group.half {
            flex: 1 1 48%;
        }

        label {
            margin-bottom: 0.6rem;
            color: var(--text-light-gray);
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 1rem 1.2rem;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid var(--glass-border);
            border-radius: 10px;
            color: var(--text-white);
            font-size: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-control:hover {
            border-color: rgba(161, 37, 104, 0.5);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(161, 37, 104, 0.2);
            background: rgba(255, 255, 255, 0.12);
        }

        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }

        .btn {
            background: linear-gradient(135deg, var(--primary), var(--gradient-end));
            color: white;
            border: none;
            padding: 1.1rem 2rem;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.4s ease;
            font-weight: 600;
            font-size: 1rem;
            letter-spacing: 0.5px;
            width: 100%;
            margin-top: 1.5rem;
            box-shadow: 0 4px 20px rgba(161, 37, 104, 0.4);
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(161, 37, 104, 0.5);
        }

        #lblMessage {
            display: block;
            text-align: center;
            padding: 1.2rem;
            margin: 1.5rem 0;
            background: rgba(46, 125, 50, 0.15);
            color: #81c784;
            border-radius: 10px;
            border-left: 4px solid #81c784;
            font-weight: 500;
        }

        .progress-container {
            width: 100%;
            height: 6px;
            background: rgba(255,255,255,0.1);
            border-radius: 3px;
            margin-top: 1.5rem;
            overflow: hidden;
        }

        .progress-bar {
            height: 100%;
            background: linear-gradient(90deg, var(--primary), var(--gradient-end));
            width: 0;
            transition: width 1s ease;
            border-radius: 3px;
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
            }
        }
    </style>

    <form id="form1" runat="server">
        <div class="profile-container">
            <div class="profile-header">
                <h2>Complete Your Profile</h2>
                <p>Help us personalize your Funda Nathi experience</p>
                <div class="progress-container">
                    <div class="progress-bar" id="profileProgress"></div>
                </div>
            </div>

            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />

            <div class="profile-form">
                <div class="form-group">
                <label for="txtFirstName">First Name</label>
                <asp:TextBox ID="txtFirstName" CssClass="form-input" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtLastName">Last Name</label>
                <asp:TextBox ID="txtLastName" CssClass="form-input" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtStudentNo">Student No</label>
                <asp:TextBox ID="txtStudentNo" CssClass="form-input" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtDegree">Degree</label>
                <asp:TextBox ID="txtDegree" CssClass="form-input" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtInstitution">Institution</label>
                <asp:TextBox ID="txtInstitution" CssClass="form-input" runat="server" />
            </div>

            <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn" OnClick="btnUpdate_Click" />

            <div class="message">
                <asp:Label ID="Label1" runat="server" ForeColor="Red" />
            </div>
        </div>
     </div>
      
    </form>
</asp:Content>