<%@ Page Language="C#" Title="Manage Profile" MasterPageFile="~/Tutor.Master" AutoEventWireup ="true" CodeBehind="TutorProfile.aspx.cs" Inherits="EducationProject.ManageProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        :root {
            --primary: #A12568;
            --secondary: #D61C4E;
            --gradient-start: #A12568;
            --gradient-end: #FF5F9E;
            --bg-main: #13111C;
            --text-white: #FFFFFF;
            --text-light-gray: #E6E6FA;
            --glass-bg: rgba(255, 255, 255, 0.08);
            --glass-border: rgba(255, 255, 255, 0.15);
            --glass-shadow: 0 8px 32px rgba(161, 37, 104, 0.2);
        }

        body {
            background: var(--bg-main);
            color: var(--text-white);
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            min-height: 100vh;
        }

        .registration-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-radius: 16px;
            border: 1px solid var(--glass-border);
            box-shadow: var(--glass-shadow);
        }

        h1 {
            color: var(--text-white);
            font-size: 2.5rem;
            margin-bottom: 2rem;
            background: linear-gradient(to right, var(--text-white), var(--text-light-gray));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-align: center;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--glass-border);
        }

        .form-section {
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid var(--glass-border);
        }

        .form-section:last-of-type {
            border-bottom: none;
        }

        .form-section h2 {
            color: var(--primary);
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--text-light-gray);
            font-weight: 500;
        }

        .required-field::after {
            content: " *";
            color: var(--secondary);
        }

        .form-control,
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"],
        input[type="date"],
        input[type="time"],
        textarea,
        select {
            width: 100%;
            padding: 0.75rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid var(--glass-border);
            border-radius: 8px;
            color: var(--text-white);
            font-size: 1rem;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .form-control:focus,
        input:focus,
        textarea:focus,
        select:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 2px rgba(161, 37, 104, 0.3);
        }

        textarea {
            min-height: 100px;
            resize: vertical;
        }

        small {
            color: var(--text-light-gray);
            font-size: 0.85rem;
            margin-top: 0.25rem;
            display: block;
        }

        .btn-submit {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: block;
            margin: 2rem auto 0;
            text-align: center;
            box-shadow: 0 4px 6px rgba(161, 37, 104, 0.3);
            width: 200px;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(161, 37, 104, 0.4);
        }

        .alert {
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .alert-success {
            background: rgba(40, 167, 69, 0.2);
            color: #28a745;
            border: 1px solid rgba(40, 167, 69, 0.3);
        }

        .alert-danger {
            background: rgba(220, 53, 69, 0.2);
            color: #dc3545;
            border: 1px solid rgba(220, 53, 69, 0.3);
        }

        @media (max-width: 768px) {
            .registration-container {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            .btn-submit {
                width: 100%;
            }
        }
  
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .form-grid .form-group {
            margin-bottom: 1.5rem;
        }

        .form-full {
            grid-column: 1 / -1;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            margin: 1rem 0;
        }

        .checkbox-group label {
            margin-left: 0.5rem;
            font-weight: 500;
        }

        .btn {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: white;
            border: none;
            padding: 0.85rem 1.5rem;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 1.5rem;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(161, 37, 104, 0.4);
        }

        .message {
            display: block;
            margin-top: 1rem;
            text-align: center;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <form id="form1" runat="server">
        <div class="registration-container">
            <h1>Check into your Tutor Profile</h1>

            <div class="form-section">
                <div class="form-grid">
                    <div class="form-group">
                        <label>Username:</label>
                        <asp:TextBox ID="txtUserName" runat="server" ReadOnly="True" CssClass="form-control" />
                    </div>

                    <div class="form-group">
                        <label>Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" />
                    </div>

                    <div class="form-group">
                        <label>First Name:</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group">
                        <label>Last Name:</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group">
                        <label>Gender:</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Gender" Value="" />
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                            <asp:ListItem Text="Other" Value="Other" />
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label>User Role:</label><br />
                        <asp:Label ID="lblUserRole" runat="server" Text="Tutor" CssClass="form-control" />
                    </div>

                    <div class="form-group form-full checkbox-group">
                        <asp:CheckBox ID="chkIsTutor" runat="server" Text="Register as Tutor" Enabled="false" />
                    </div>
                </div>
            </div>

            <asp:Button ID="btnUpdate" runat="server" Text="Check In" CssClass="btn" OnClick="btnUpdate_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
        </div>
    </form>
</asp:Content>