<%@ Page Language="C#" Title="Dashboard" MasterPageFile="~/Tutor.master" AutoEventWireup="true" CodeBehind="TutorDashBoard.aspx.cs" Inherits="EducationProject.TutorDashBoard" %>

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
            font-family: Arial;
            padding: 20px;
        }

        .dashboard-container {
            display: flex;
            flex-direction: column;
            gap: var(--space-xl);
            padding: var(--space-lg);
            max-width: 1400px;
            margin: 0 auto;
        }

        .dashboard-header {
            text-align: center;
            padding: var(--space-xl) var(--space-md);
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

        .dashboard-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, 
                rgba(255, 255, 255, 0.1) 0%, 
                transparent 70%);
            animation: rotate 20s linear infinite;
            z-index: -1;
        }

        @keyframes rotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .section {
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid var(--glass-border);
            border-radius: 16px;
            padding: var(--space-lg);
            margin-bottom: var(--space-xl);
            box-shadow: var(--glass-shadow);
        }

        .section h3 {
            color: var(--text-white);
            margin-bottom: var(--space-lg);
            font-size: 1.5rem;
            border-bottom: 2px solid var(--secondary);
            padding-bottom: var(--space-sm);
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.05);
        }

        .grid th {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: var(--text-white);
            padding: var(--space-md);
            text-align: left;
        }

        .grid td {
            padding: var(--space-md);
            border-bottom: 1px solid var(--glass-border);
            color: var(--text-light-gray);
        }

        .grid tr:nth-child(even) {
            background: rgba(255, 255, 255, 0.03);
        }

        .grid tr:hover {
            background: var(--glass-highlight);
        }

        .action-link {
            color: var(--secondary);
            text-decoration: none;
            margin-right: var(--space-sm);
            transition: all 0.3s ease;
        }

        .action-link:hover {
            color: var(--text-white);
            text-shadow: var(--accent-glow);
        }

        .session-item {
            background: var(--glass-bg);
            border: 1px solid var(--glass-border);
            border-radius: 12px;
            padding: var(--space-md);
            margin-bottom: var(--space-md);
            transition: all 0.3s ease;
        }

        .session-item:hover {
            transform: translateY(-2px);
            box-shadow: var(--glass-shadow);
        }

        .btn {
            padding: var(--space-xs) var(--space-md);
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .btn-primary {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: var(--text-white);
        }

        .btn-primary:hover {
            box-shadow: 0 6px 12px rgba(161, 37, 104, 0.4);
            transform: translateY(-2px);
        }

        @media (max-width: 1200px) {
            .dashboard-container {
                padding: var(--space-md);
            }
        }

        @media (max-width: 768px) {
            .grid {
                display: block;
                overflow-x: auto;
            }
            
            .section {
                padding: var(--space-md);
            }
        }
    </style>
   <form id="Form1" runat="server">
    <div class="dashboard-container">

        <!-- Header Section -->
        <div class="dashboard-header">
            <h1 style="font-size: 2.5rem; margin-bottom: var(--space-sm);">Welcome Back, 
                <asp:Label ID="lblTutorName" runat="server" Text="Tutor" />!
            </h1>
            <p style="font-size: 1.1rem; opacity: 0.9;">Your personalized tutoring dashboard</p>
        </div>

        <!-- Uploaded Documents GridView -->
        <div class="section">
            <h3>Uploaded Documents</h3>
            <asp:GridView ID="gvDocuments" runat="server" AutoGenerateColumns="False" DataKeyNames="DocumentID"
                OnRowEditing="gvDocuments_RowEditing"
                OnRowUpdating="gvDocuments_RowUpdating"
                OnRowCancelingEdit="gvDocuments_RowCancelingEdit"
                OnRowDeleting="gvDocuments_RowDeleting"
                CssClass="grid">
                <Columns>
                    <asp:BoundField DataField="FileName" HeaderText="File Name" ReadOnly="True" />
                    <asp:BoundField DataField="UploadDate" HeaderText="Upload Date" DataFormatString="{0:yyyy-MM-dd}" ReadOnly="True" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" 
                        EditText="✏️ Edit" DeleteText="🗑️ Delete" 
                        ButtonType="Link" ControlStyle-CssClass="action-link" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkView" runat="server" CommandName="View" 
                                CommandArgument='<%# Eval("DocumentID") %>' 
                                CssClass="action-link" OnClick="lnkView_Click">👁️ View</asp:LinkButton>
                            <asp:LinkButton ID="lnkSelect" runat="server" 
                                CommandArgument='<%# Eval("FileName") %>' 
                                OnClick="lnkSelect_Click" CssClass="action-link">📌 Select</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div style="color: var(--text-light-gray); padding: var(--space-md); text-align: center;">
                        No documents uploaded yet.
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

        <!-- Downloads Section -->
        <div class="section">
            <h3>Available Downloads</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grid" DataKeyNames="DocumentID">
                <Columns>
                    <asp:BoundField DataField="FileName" HeaderText="File Name" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Download">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDownload" runat="server"
                                Text="⬇️ Download"
                                CommandArgument='<%# Eval("DocumentID") %>'
                                OnClick="lnkView_Click"
                                CssClass="action-link" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div style="color: var(--text-light-gray); padding: var(--space-md); text-align: center;">
                        No documents available for download.
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

      

    </div>
</form>

</asp:Content>