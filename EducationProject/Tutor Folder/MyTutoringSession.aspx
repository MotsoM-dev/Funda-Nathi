<%@ Page Language="C#" Title="Tutorial Sessions" MasterPageFile="~/Tutor.Master" AutoEventWireup="true" CodeBehind="MyTutoringSession.aspx.cs" Inherits="EducationProject.MyTutoringSession" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    :root {
        --space-unit: 1rem;
        --space-xs: calc(0.25 * var(--space-unit));
        --space-sm: calc(0.5 * var(--space-unit));
        --space-md: var(--space-unit);
        --space-lg: calc(1.5 * var(--space-unit));
        --space-xl: calc(2 * var(--space-unit));
        --space-xxl: calc(3 * var(--space-unit));
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
        --glass-highlight: rgba(255, 255, 255, 0.1);
        --accent-glow: 0 0 15px rgba(255, 95, 158, 0.5);
    }

    body {
        background: radial-gradient(circle at 10% 20%, var(--gradient-start) 0%, var(--bg-main) 40%);
        color: var(--text-light-gray);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-height: 100vh;
        margin: 0;
        padding: var(--space-lg);
    }

    .live-session-container {
        max-width: 1200px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: 1fr;
        gap: var(--space-xl);
    }

    .session-header {
        text-align: center;
        padding: var(--space-lg);
        background: linear-gradient(135deg, 
            rgba(161, 37, 104, 0.7), 
            rgba(214, 28, 78, 0.5));
        border-radius: 16px;
        color: var(--text-white);
        border: 1px solid var(--glass-border);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        box-shadow: var(--glass-shadow);
        position: relative;
        overflow: hidden;
    }

    .session-header h2 {
        margin: 0;
        font-size: 1.8rem;
        font-weight: 600;
        background: linear-gradient(to right, var(--text-white), var(--text-light-gray));
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .session-controls {
        display: flex;
        justify-content: center;
        gap: var(--space-md);
        margin-top: var(--space-md);
    }

    .video-call-section {
        background: var(--glass-bg);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border: 1px solid var(--glass-border);
        border-radius: 16px;
        padding: var(--space-xl);
        box-shadow: var(--glass-shadow);
        text-align: center;
        position: relative;
        overflow: hidden;
    }

    .video-call-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(to right, var(--primary), var(--secondary));
    }

    .video-placeholder {
        padding: var(--space-xxl) var(--space-xl);
        background: rgba(0, 0, 0, 0.2);
        border-radius: 12px;
        margin-bottom: var(--space-lg);
        position: relative;
    }

    .video-placeholder i {
        font-size: 3rem;
        color: var(--secondary);
        margin-bottom: var(--space-md);
        text-shadow: var(--accent-glow);
    }

    .video-placeholder h3 {
        font-size: 1.5rem;
        margin-bottom: var(--space-sm);
        color: var(--text-white);
    }

    .video-placeholder p {
        color: var(--text-light-gray);
        opacity: 0.8;
    }

    .btn-Teams {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: var(--space-md) var(--space-xl);
        background: linear-gradient(to right, var(--primary), var(--secondary));
        color: white;
        border-radius: 8px;
        text-decoration: none;
        transition: all 0.3s ease;
        border: none;
        cursor: pointer;
        font-weight: 500;
        box-shadow: 0 4px 6px rgba(161, 37, 104, 0.3);
        position: relative;
        overflow: hidden;
        font-size: 1rem;
        margin-top: var(--space-md);
    }

    .btn-Teams:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(161, 37, 104, 0.4);
        background: linear-gradient(to right, var(--secondary), var(--primary));
    }

    .btn-Teams i {
        margin-right: var(--space-sm);
    }

    .btn-start-session {
        background: linear-gradient(to right, #4CAF50, #2E7D32);
    }

    .btn-start-session:hover {
        background: linear-gradient(to right, #2E7D32, #4CAF50);
    }

    .meeting-info {
        background: var(--glass-bg);
        padding: var(--space-md);
        border-radius: 8px;
        margin-top: var(--space-md);
        text-align: left;
        display: none;
    }

    .meeting-info.show {
        display: block;
        animation: fadeIn 0.3s ease-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .info-label {
        font-weight: 600;
        color: var(--secondary);
        margin-right: var(--space-sm);
    }

    .info-value {
        word-break: break-all;
    }

    .copy-btn {
        background: var(--glass-bg);
        border: 1px solid var(--glass-border);
        color: var(--text-light-gray);
        padding: var(--space-xs) var(--space-sm);
        border-radius: 4px;
        cursor: pointer;
        margin-left: var(--space-sm);
        transition: all 0.2s ease;
    }

    .copy-btn:hover {
        background: var(--glass-highlight);
    }

    .quiz-section {
        background: var(--glass-bg);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border: 1px solid var(--glass-border);
        border-radius: 16px;
        padding: var(--space-xl);
        box-shadow: var(--glass-shadow);
        margin-top: var(--space-lg);
    }

    .quiz-section h3 {
        color: var(--text-white);
        font-size: 1.5rem;
        margin-bottom: var(--space-lg);
        border-bottom: 1px solid var(--glass-border);
        padding-bottom: var(--space-sm);
    }

    .quiz-question {
        font-size: 1.2rem;
        margin-bottom: var(--space-lg);
        color: var(--text-light-gray);
    }

    .quiz-options {
        margin-bottom: var(--space-xl);
    }

    .discussion-section {
        display: grid;
        grid-template-columns: 1fr;
        gap: var(--space-lg);
    }

    .discussion-card {
        background: var(--glass-bg);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border: 1px solid var(--glass-border);
        border-radius: 16px;
        padding: var(--space-xl);
        box-shadow: var(--glass-shadow);
    }

    .discussion-card h3 {
        color: var(--text-white);
        font-size: 1.5rem;
        margin-bottom: var(--space-lg);
        border-bottom: 1px solid var(--glass-border);
        padding-bottom: var(--space-sm);
    }

    .form-control {
        width: 100%;
        padding: var(--space-md);
        background: rgba(0, 0, 0, 0.2);
        border: 1px solid var(--glass-border);
        border-radius: 8px;
        color: var(--text-light-gray);
        font-size: 1rem;
        margin-bottom: var(--space-md);
    }

    .form-control:focus {
        outline: none;
        border-color: var(--secondary);
        box-shadow: 0 0 0 2px rgba(214, 28, 78, 0.3);
    }

    .response-list {
        margin-bottom: var(--space-xl);
    }

    .response-item {
        background: rgba(0, 0, 0, 0.1);
        border-left: 3px solid var(--primary);
        padding: var(--space-md);
        margin-bottom: var(--space-md);
        border-radius: 0 8px 8px 0;
    }

    .response-user {
        font-weight: 600;
        color: var(--secondary);
        margin-bottom: var(--space-xs);
    }

    .response-time {
        font-size: 0.8rem;
        color: var(--text-light-gray);
        opacity: 0.6;
        margin-top: var(--space-xs);
    }

    @media (max-width: 768px) {
        .live-session-container {
            padding: var(--space-md);
        }
        
        .video-call-section, 
        .quiz-section, 
        .discussion-card {
            padding: var(--space-lg);
        }
        
        .session-controls {
            flex-direction: column;
            align-items: center;
        }
    }
</style>
     <form id="form1" runat="server">
      <div class="live-session-container">
          <div class="session-header">
              <h2><asp:Label ID="lblSessionDetails" runat="server" Text="Tutor Session" /></h2>
              <div class="session-controls">
                  <asp:Button ID="btnCreateMeeting" runat="server" Text="Create Teams Meeting" 
                      CssClass="btn-Teams btn-start-session" OnClick="btnCreateMeeting_Click" />
                 
              </div>
          </div>

          <!-- Video Call Section -->
          <div class="video-call-section">
              <div class="video-placeholder">
                  <div style="text-align: center; z-index: 1;">
                      <i class="fas fa-video"></i>
                      <h3><asp:Label ID="lblSessionStatus" runat="server" Text="Session Not Started" /></h3>
                      <p><asp:Label ID="lblSessionInstructions" runat="server" 
                          Text="Create a meeting to begin your tutoring session" /></p>
                  </div>
              </div>
              
              <div id="meetingInfo" runat="server" class="meeting-info">
                  <div>
                      <span class="info-label">Meeting Link:</span>
                      <span class="info-value" id="meetingLink" runat="server"></span>
                      <button type="button" class="copy-btn" onclick="copyToClipboard('meetingLink')">
                          <i class="fas fa-copy"></i> Copy
                      </button>
                  </div>
                  <div style="margin-top: var(--space-sm);">
                      <span class="info-label">Meeting ID:</span>
                      <span class="info-value" id="meetingId" runat="server"></span>
                      <button type="button" class="copy-btn" onclick="copyToClipboard('meetingId')">
                          <i class="fas fa-copy"></i> Copy
                      </button>
                  </div>
                  <div style="margin-top: var(--space-sm);">
                      <span class="info-label">Passcode:</span>
                      <span class="info-value" id="meetingPasscode" runat="server"></span>
                      <button type="button" class="copy-btn" onclick="copyToClipboard('meetingPasscode')">
                          <i class="fas fa-copy"></i> Copy
                      </button>
                  </div>
              </div>
              
              <div style="text-align: center; margin-top: var(--space-md);">
                  <asp:Button ID="btnJoinMeeting" runat="server" Text="Join Meeting" 
                      CssClass="btn-Teams"  Visible="false" />
                  <asp:Image ID="Image2" runat="server" />
              </div>
          </div>

      </div>
  </form>
     <script>
     function copyToClipboard(elementId) {
         var element = document.getElementById(elementId);
         var textToCopy = element.innerText;
         
         navigator.clipboard.writeText(textToCopy).then(function() {
             // Change button text temporarily
             var button = event.target.closest('.copy-btn');
             var originalHtml = button.innerHTML;
             button.innerHTML = '<i class="fas fa-check"></i> Copied!';
             
             setTimeout(function() {
                 button.innerHTML = originalHtml;
             }, 2000);
         }, function(err) {
             console.error('Could not copy text: ', err);
         });
     }

     // This would be called from server-side after meeting creation
     function showMeetingInfo() {
         var meetingInfo = document.getElementById('<%= meetingInfo.ClientID %>');
         meetingInfo.classList.add('show');
         
         var joinButton = document.getElementById('<%= btnJoinMeeting.ClientID %>');
         joinButton.style.display = 'inline-block';
     }
     </script>

  </asp:Content>