<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="Auth.aspx.cs" Inherits="EducationProject.Authentication.Login" %>                                                                                                                                                           
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Login, Sign Up, or Reset Password for Limited Access Education System" />
    <title>Funda Nathi</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <link rel="stylesheet" href="../Styles/auth.css" asp-append-version="true" />
    <style>
        /* Add these styles for the video background */
        .video-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: -1;
            overflow: hidden;
        }

        .video-background video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .video-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(19, 17, 28, 0.7);
            z-index: 1;
        }

        /* Ensure the auth container stays on top */
        .auth-container {
            position: relative;
            z-index: 2;
        }
    </style>
</head>
<body class="auth-page">
    <!-- Video Background -->
    <div class="video-background">
        <video autoplay loop muted playsinline="">
            <source src="../media/3163534-uhd_3840_2160_30fps.mp4" type="video/mp4" />
        </video>
        <div class="video-overlay"></div>
    </div>

    <section class="auth-container glass-container">
        <form id="authForm" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <div class="auth-slider">
                
                <!-- Login Form (Center) -->
                <asp:Label ID="lblError" runat="server" CssClass="error-message" Visible="False" />
                <div class="auth-form login-form" id="login-form">
                    <h2>Welcome back to FundaNathi</h2>
                    <asp:UpdatePanel ID="LoginUpdatePanel" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="LoginPanel" runat="server">
                                <div class="form-content">
                                    <div class="form-group">
                                        <asp:Label ID="lblLoginEmail" runat="server" AssociatedControlID="txtEmail"  Text="Email" />
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" required="#" placeholder ="Enter your username" oninput="validateNoSpaces(this)" />
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" CssClass="error-message" ControlToValidate="txtEmail" 
                                            ErrorMessage="Email is required" Display="Dynamic" ValidationGroup="Login" />
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                                            ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ErrorMessage="Invalid email format" 
                                            CssClass="error-message" Display="Dynamic" ValidationGroup="Login" />
                                    </div>
                                    
                                    <div class="form-group">
                                        <asp:Label ID="lblLoginPassword" runat="server" AssociatedControlID="txtPassword" Text="Password" />
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input" placeholder="Enter your password" />
                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                                            ErrorMessage="Password is required" CssClass="error-message" Display="Dynamic" ValidationGroup="Login" />
                                    </div>
                                </div>
                                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" ValidationGroup="Login" />
                                <asp:Label ID="lblLoginMessage" runat="server" CssClass="error-message" Visible="False" />
                                <div class="auth-links">
                                    <a href="#" class="auth-switch" data-target="signup-form" aria-label="Switch to Sign Up">Create an account</a>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <!-- Sign Up Form (Right) -->
                <div class="auth-form signup-form" id="signup-form">
                    <h2>Welcome to FundaNathi</h2>
                    <asp:UpdatePanel ID="SignUpUpdatePanel" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="SignUpPanel" runat="server">
                                <div class="form-content">
                                    <div class="form-group">
                                        <asp:Label ID="lblSignUpName" runat="server" AssociatedControlID="txtFullName" Text="Full Name" />
                                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input" placeholder="Enter your full name" />
                                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" 
                                            ErrorMessage="Full Name is required" CssClass="error-message" Display="Dynamic" ValidationGroup="SignUp" />
                                    </div>
                                  
                                    <div class="form-group">
                                        <asp:Label ID="lblGender" runat="server" AssociatedControlID="ddlGender" Text="Gender" />
                                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-input">
                                            <asp:ListItem Value="">Select Gender</asp:ListItem>
                                            <asp:ListItem Value="Male">Male</asp:ListItem>
                                            <asp:ListItem Value="Female">Female</asp:ListItem>
                                            <asp:ListItem Value="Other">Other</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" 
                                            InitialValue="" ErrorMessage="Gender is required" CssClass="error-message" Display="Dynamic" ValidationGroup="SignUp" />
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblSignUpEmail" runat="server" AssociatedControlID="txtSignUpEmail" Text="Email" />
                                        <asp:TextBox ID="txtSignUpEmail" runat="server" CssClass="form-input" placeholder="Enter your email" TextMode="Email" />
                                        <asp:RequiredFieldValidator ID="rfvSignUpEmail" runat="server" ControlToValidate="txtSignUpEmail" 
                                            ErrorMessage="Email is required" CssClass="error-message" Display="Dynamic" ValidationGroup="SignUp" />
                                        <asp:RegularExpressionValidator ID="revSignUpEmail" runat="server" ControlToValidate="txtSignUpEmail" 
                                            ErrorMessage="Invalid email format" CssClass="error-message" Display="Dynamic" 
                                            ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ValidationGroup="SignUp" />
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblSignUpPassword" runat="server" AssociatedControlID="txtPasswordSignUp" Text="Password" />
                                        <asp:TextBox ID="txtPasswordSignUp" runat="server" TextMode="Password" CssClass="form-input" placeholder="Enter your password" />
                                        <asp:RequiredFieldValidator ID="rfvSignUpPassword" runat="server" ControlToValidate="txtPasswordSignUp" 
                                            ErrorMessage="Password is required" CssClass="error-message" Display="Dynamic" ValidationGroup="SignUp" />
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword" Text="Confirm Password" />
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-input" placeholder="Confirm your password" />
                                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" 
                                            ErrorMessage="Confirm Password is required" CssClass="error-message" Display="Dynamic" ValidationGroup="SignUp" />
                               

                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblRole" runat="server" AssociatedControlID="ddlRole" Text="Role" />
                                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-input">
                                            <asp:ListItem Value="">Select Role</asp:ListItem>
                                            <asp:ListItem Value="Student">Student</asp:ListItem>
                                            <asp:ListItem Value="Tutor">Tutor</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvRole" runat="server" ControlToValidate="ddlRole" 
                                            InitialValue="" ErrorMessage="Role is required" CssClass="error-message" Display="Dynamic" ValidationGroup="SignUp" />
                                    </div>
                                    <asp:Button ID="btnSignUp" runat="server" 
                                       Text="Sign Up" 
                                       CssClass="btn btn-primary" 
                                       ValidationGroup="SignUp" 
                                       OnClick="btnSignUp_Click" />
                                </div>
                             


<!-- Make sure the label is properly configured -->
<asp:Label ID="lblSignUpMessage" runat="server" 
          CssClass="error-message" 
          Visible="False" />
                            </asp:Panel>
                        </ContentTemplate>
                        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnSignUp" EventName="Click" />
    </Triggers>
                    </asp:UpdatePanel>
                    <div class="auth-links">
                        <a href="#" class="auth-switch" data-target="login-form" aria-label="Switch to Login">Already have an account?</a>
                    </div>
                </div>
            </div>
        </form>
    </section>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="../Scripts/script.js/auth.js" asp-append-version="true"></script>

    <script>
        function validateNoSpaces(input) {
            if (input.value.trim() === "") {
                input.setCustomValidity("Field cannot be empty or just spaces");
            } else {
                input.setCustomValidity("");
            }
        }
    </script>
</body>
</html>