<%@ Page Language="C#" Title="LiveSession" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeBehind="LiveSession.aspx.cs" Inherits="EducationProject.LiveSession" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .live-session-container {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            max-width: 1200px;
            margin: 0 auto;
            padding: 1.5rem;
        }

        .session-header {
            background: linear-gradient(135deg, var(--gradient-start), var(--gradient-end));
            padding: 1.5rem;
            border-radius: 10px;
            color: var(--text-white);
            text-align: center;
            margin-bottom: 1rem;
        }

        .video-call-section {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .video-placeholder {
            background: rgba(0, 0, 0, 0.3);
            height: 400px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-light-gray);
            margin-bottom: 1rem;
            position: relative;
            overflow: hidden;
        }

        .video-placeholder::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, 
                          transparent 48%, 
                          var(--glass-border) 48%, 
                          var(--glass-border) 52%, 
                          transparent 52%);
            background-size: 20px 20px;
            opacity: 0.3;
        }

        .btn-Teams {
            background: #6264A7;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-Teams:hover {
            background: #464775;
            transform: translateY(-2px);
        }

        .discussion-section {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1.5rem;
        }

        .discussion-card {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            border-radius: 10px;
            padding: 1.5rem;
        }

        .discussion-question {
            font-size: 1.2rem;
            margin-bottom: 1rem;
            color: var(--text-white);
            font-weight: bold;
        }

        .response-list {
            margin-top: 1rem;
            max-height: 300px;
            overflow-y: auto;
            padding-right: 0.5rem;
        }

        .response-item {
            background: rgba(59, 24, 95, 0.3);
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 0.75rem;
            border-left: 3px solid var(--primary);
        }

        .response-user {
            font-weight: bold;
            color: var(--text-light-gray);
            margin-bottom: 0.25rem;
        }

        .response-text {
            margin-bottom: 0.25rem;
        }

        .response-time {
            font-size: 0.8rem;
            color: var(--text-light-gray);
            opacity: 0.7;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid var(--glass-border);
            border-radius: 5px;
            color: var(--text-white);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
        }

        .btn-primary {
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: #8a1d56;
            transform: translateY(-2px);
        }

        .quiz-section {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            border-radius: 10px;
            padding: 1.5rem;
        }

        .quiz-question {
            font-size: 1.1rem;
            margin-bottom: 1rem;
            color: var(--text-white);
            font-weight: bold;
        }

        .quiz-options {
            margin-bottom: 1.5rem;
        }

        .quiz-options label {
            display: block;
            margin-bottom: 0.5rem;
            padding: 0.5rem;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .quiz-options label:hover {
            background: rgba(161, 37, 104, 0.2);
        }

        .quiz-feedback {
            margin-top: 1rem;
            padding: 0.75rem;
            border-radius: 5px;
            display: none;
        }

        .success {
            background: rgba(40, 167, 69, 0.2);
            border-left: 3px solid #28a745;
        }

        .error {
            background: rgba(220, 53, 69, 0.2);
            border-left: 3px solid #dc3545;
        }

        @media (min-width: 992px) {
            .discussion-section {
                grid-template-columns: 1fr 1fr;
            }
        }
    </style>
    <form id="form1" runat="server">
    <div class="live-session-container">
        <div class="session-header">
            <h2><asp:Label ID="lblSessionDetails" runat="server" Text="Session Details" /></h2>
        </div>

        <!-- Video Call Section -->
        <div class="video-call-section">
            <div class="video-placeholder">
                <div style="text-align: center; z-index: 1;">
                    <i class="fas fa-video" style="font-size: 3rem; margin-bottom: 1rem;"></i>
                    <h3>Live Session</h3>
                    <p>Join the video call to start your tutoring session</p>
                </div>
            </div>
           
        </div>
        <asp:Button ID="btnStartVideoCall" runat="server" Text="Join on Microsoft Teams" CssClass="btn-Teams"  OnClick="btnStartVideoCall_Click"/>
        <asp:Image ID="Image2" runat="server" />
         </div>


         </form>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
</asp:Content>
