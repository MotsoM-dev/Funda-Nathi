<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Withdraw.aspx.cs" Inherits="EducationProject.Payment.Withdraw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <style>
        :root {
            --primary: #A12568; /* Kept for accents */
            --secondary: #D61C4E; /* Kept for accents */
            --bg-main: #1A1A2E; /* Darker blue-gray */
            --text-white: #F8F9FA; /* Soft white */
            --text-light-gray: #E9ECEF; /* Lighter gray */
            --glass-bg: rgba(45, 49, 66, 0.6); /* Gray-blue glass */
            --glass-border: rgba(134, 142, 150, 0.2); /* Subtle gray border */
            --glass-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            --success-color: #4CAF50;
            --processing-color: #FFA500;
            --card-bg: #2D3142; /* Dark gray card background */
        }

        .withdraw-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 2rem;
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-radius: 16px;
            border: 1px solid var(--glass-border);
            box-shadow: var(--glass-shadow);
        }

        h1, h2 {
            color: var(--text-white);
            margin-bottom: 1.5rem;
            font-weight: 500;
        }

        h1 {
            font-size: 2rem;
            border-bottom: 1px solid var(--glass-border);
            padding-bottom: 0.75rem;
        }

        h2 {
            font-size: 1.5rem;
            margin-top: 2rem;
        }

        .earnings-summary {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 2rem;
        }

        .summary-card {
            background: var(--card-bg);
            border: 1px solid var(--glass-border);
            border-radius: 12px;
            padding: 1.5rem;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .summary-card:hover {
            transform: translateY(-5px);
        }

        .summary-card h3 {
            color: var(--text-light-gray);
            font-size: 1rem;
            margin-bottom: 0.5rem;
            font-weight: 400;
        }

        .summary-card p {
            font-size: 1.8rem;
            font-weight: 600;
            margin: 0.5rem 0;
            color: var(--text-white);
        }

        .summary-card small {
            color: var(--text-light-gray);
            opacity: 0.7;
            font-size: 0.8rem;
        }

        .withdraw-form {
            background: var(--card-bg);
            border: 1px solid var(--glass-border);
            border-radius: 12px;
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--text-light-gray);
            font-weight: 400;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--glass-border);
            border-radius: 8px;
            color: var(--text-white);
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: rgba(134, 142, 150, 0.4);
            background: rgba(255, 255, 255, 0.08);
        }

        .btn-withdraw {
            background: linear-gradient(to right, #495057, #343A40);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-block;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-withdraw:hover {
            background: linear-gradient(to right, #343A40, #212529);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .btn-export {
            background: transparent;
            color: var(--text-light-gray);
            border: 1px solid var(--glass-border);
            padding: 0.5rem 1rem;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            float: right;
        }

        .btn-export:hover {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(134, 142, 150, 0.4);
        }

        .transactions-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 1rem;
        }

        .transactions-table th {
            background: #2D3142;
            color: var(--text-white);
            padding: 15px;
            text-align: left;
            font-weight: 500;
            border-bottom: 2px solid var(--glass-border);
        }

        .transactions-table td {
            padding: 15px;
            border-bottom: 1px solid var(--glass-border);
            background: var(--card-bg);
            color: var(--text-light-gray);
        }

        .transactions-table tr:hover td {
            background: rgba(255, 255, 255, 0.05);
        }

        .status-completed {
            color: var(--success-color);
            font-weight: 500;
        }

        .status-processing {
            color: var(--processing-color);
            font-weight: 500;
        }

        /* Pink accent for important elements */
        .accent-text {
            color: var(--primary);
        }

        .btn-primary-accent {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: white;
        }

        .btn-primary-accent:hover {
            background: linear-gradient(to right, #8A1A4B, #B51F40);
        }

        @media (max-width: 768px) {
            .earnings-summary {
                grid-template-columns: 1fr;
            }
            
            .withdraw-container {
                padding: 1rem;
            }
            
            .transactions-table {
                display: block;
                overflow-x: auto;
            }
            
            .btn-export {
                float: none;
                margin-bottom: 1rem;
                display: block;
                width: 100%;
            }
        }
    </style>

    <div class="withdraw-container">
        <h1>Withdraw Funds</h1>
        
        <!-- Earnings Summary -->
        <div class="earnings-summary">
            <div class="summary-card">
                <h3>Available Balance</h3>
                <p class="accent-text">R<asp:Label ID="lblAvailableBalance" runat="server" Text="1,850.50" /></p>
                <small>Ready to withdraw</small>
            </div>
            <div class="summary-card">
                <h3>Pending Earnings</h3>
                <p>R<asp:Label ID="lblPendingEarnings" runat="server" Text="320.00" /></p>
                <small>Will be available in 3 days</small>
            </div>
            <div class="summary-card">
                <h3>Total Withdrawn</h3>
                <p>R<asp:Label ID="lblTotalWithdrawn" runat="server" Text="5,420.75" /></p>
                <small>All time</small>
            </div>
        </div>
        
        <!-- Withdrawal Form -->
        <div class="withdraw-form">
            <h2>Withdraw Funds</h2>
                <div class="form-group">
                    <label>Amount to Withdraw (ZAR)</label>
                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" TextMode="Number" min="100" step="1" placeholder="Minimum R100" required="required" />
                </div>
                
                <div class="form-group">
                    <label>Bank Account</label>
                    <asp:DropDownList ID="ddlBankAccount" runat="server" CssClass="form-control" required="required">
                        <asp:ListItem Value="" Text="Select Bank Account" Selected="True" />
                        <asp:ListItem Value="1" Text="FNB •••• 5678" />
                        <asp:ListItem Value="2" Text="Standard Bank •••• 9012" />
                        <asp:ListItem Value="3" Text="Absa •••• 3456" />
                    </asp:DropDownList>
                </div>
                
                <div class="form-group">
                    <label>Notification Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required="required" />
                </div>
                
                <div class="form-group">
                    <label>Notes (Optional)</label>
                    <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" placeholder="Any special instructions" />
                </div>
                
                <asp:Button ID="btnRequestWithdrawal" runat="server" Text="Request Withdrawal" 
                    CssClass="btn-withdraw btn-primary-accent" />
            
        </div>
        
        <!-- Transaction History -->
        <div>
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <h2>Withdrawal History</h2>
                <asp:Button ID="btnExport" runat="server" Text="Export to Excel" CssClass="btn-export" />
            </div>
            
            <asp:GridView ID="gvTransactions" runat="server" AutoGenerateColumns="False" CssClass="transactions-table">
                <Columns>
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:MMM dd, yyyy}" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="R{0:N2}" />
                    <asp:BoundField DataField="BankAccount" HeaderText="Bank Account" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='status-<%# Eval("Status").ToString().ToLower() %>'><%# Eval("Status") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Reference" HeaderText="Reference" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
