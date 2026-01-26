<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="EducationProject.Payment.Payment" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Secure Payment Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    <style>
        :root {
            --primary: #6F5DE0;
            --primary-light: #8A7AFF;
            --primary-dark: #5A4BC7;
            --accent: #A12568;
            --bg-main: #13111C;
            --bg-dark: #0D0B14;
            --bg-light: #1E1B2A;
            --text-light: #F5F5FF;
            --text-muted: #B8B8CC;
            --border-color: rgba(255, 255, 255, 0.08);
            --success: #4CAF50;
            --error: #FF4D4D;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-main);
            color: var(--text-light);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            line-height: 1.6;
        }

        .payment-container {
            display: flex;
            flex: 1;
            width: 100%;
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
        }

        .payment-form-container {
            flex: 1;
            display: flex;
            background-color: var(--bg-light);
            border-radius: 16px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.25);
            overflow: hidden;
            border: 1px solid var(--border-color);
        }

        .payment-form-sidebar {
            flex: 0 0 45%;
            background: linear-gradient(145deg, var(--primary-dark), var(--primary));
            padding: 4rem;
            color: var(--text-light);
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .payment-form-sidebar::after {
            content: '';
            position: absolute;
            top: -20%;
            right: -20%;
            width: 60%;
            height: 140%;
            background: radial-gradient(circle, rgba(161, 37, 104, 0.15) 0%, transparent 70%);
            transform: rotate(30deg);
            opacity: 0.7;
        }

        .payment-form-main {
            flex: 1;
            padding: 4rem 3rem;
            background-color: var(--bg-light);
        }

        .payment-header {
            margin-bottom: 3rem;
        }

        .payment-header h2 {
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--text-light);
            margin-bottom: 0.75rem;
            position: relative;
            display: inline-block;
        }

        .payment-header h2::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 60px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary), var(--accent));
            border-radius: 3px;
        }

        .payment-header p {
            color: var(--text-muted);
            font-size: 1.05rem;
            max-width: 90%;
        }

        .form-section {
            margin-bottom: 2.5rem;
        }

        .form-section-title {
            font-size: 1.15rem;
            font-weight: 600;
            color: var(--primary-light);
            margin-bottom: 1.75rem;
            display: flex;
            align-items: center;
        }

        .form-section-title::before {
            content: '';
            display: inline-block;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: var(--primary);
            margin-right: 12px;
            box-shadow: 0 0 0 3px rgba(111, 93, 224, 0.3);
        }

        .form-row {
            display: flex;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .form-group {
            flex: 1;
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.75rem;
            font-weight: 500;
            color: var(--text-light);
            font-size: 0.95rem;
        }

        .form-control {
            width: 100%;
            padding: 1.1rem 1.5rem;
            border: 1px solid var(--border-color);
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            background-color: var(--bg-dark);
            color: var(--text-light);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(111, 93, 224, 0.3);
            background-color: var(--bg-main);
        }

        .form-control::placeholder {
            color: var(--text-muted);
            opacity: 0.7;
        }

        .expiry-group {
            display: flex;
            gap: 1.5rem;
        }

        .btn-pay {
            background: linear-gradient(135deg, var(--primary), var(--accent));
            color: white;
            border: none;
            padding: 1.25rem 2rem;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            width: 100%;
            margin-top: 1.5rem;
            box-shadow: 0 4px 20px rgba(111, 93, 224, 0.4);
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .btn-pay::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, var(--primary-dark), var(--accent));
            opacity: 0;
            z-index: -1;
            transition: opacity 0.3s ease;
        }

        .btn-pay:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(111, 93, 224, 0.5);
        }

        .btn-pay:hover::before {
            opacity: 1;
        }

        .btn-pay:active {
            transform: translateY(1px);
        }

        .message {
            padding: 1.25rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            font-weight: 500;
            text-align: center;
            border: 1px solid transparent;
        }

        .error-message {
            background-color: rgba(255, 77, 77, 0.1);
            color: var(--error);
            border-color: rgba(255, 77, 77, 0.2) !important;
        }

        .sidebar-content {
            max-width: 380px;
            position: relative;
            z-index: 2;
        }

        .sidebar-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: var(--text-light);
            line-height: 1.3;
        }

        .sidebar-description {
            font-size: 1.1rem;
            line-height: 1.7;
            margin-bottom: 2.5rem;
            color: rgba(255, 255, 255, 0.85);
        }

        .benefits-list {
            list-style: none;
        }

        .benefits-list li {
            margin-bottom: 1.25rem;
            display: flex;
            align-items: center;
            color: rgba(255, 255, 255, 0.9);
            font-size: 1rem;
        }

        .benefits-list li::before {
            content: "";
            display: inline-block;
            width: 24px;
            height: 24px;
            background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%236F5DE0'%3E%3Cpath d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/%3E%3C/svg%3E") no-repeat center;
            margin-right: 12px;
        }

        @media (max-width: 1200px) {
            .payment-form-sidebar {
                padding: 3rem;
            }
            .payment-form-main {
                padding: 3rem 2.5rem;
            }
        }

        @media (max-width: 992px) {
            .payment-form-container {
                flex-direction: column;
            }
            
            .payment-form-sidebar {
                padding: 3rem 2rem;
            }
            
            .payment-form-main {
                padding: 3rem 2rem;
            }
            
            .form-row {
                gap: 1.5rem;
            }
        }

        @media (max-width: 768px) {
            .payment-container {
                padding: 1.5rem;
            }
            
            .form-row {
                flex-direction: column;
                gap: 1.5rem;
            }
            
            .expiry-group {
                flex-direction: column;
                gap: 1.5rem;
            }
            
            .payment-header h2 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="payment-container">
            <div class="payment-form-container">
                <div class="payment-form-sidebar">
                    <div class="sidebar-content">
                        <h3 class="sidebar-title">Secure Payment Gateway</h3>
                        <p class="sidebar-description">Your transaction is protected with military-grade 256-bit encryption and processed through our PCI-DSS compliant systems.</p>
                        <ul class="benefits-list">
                            <li>End-to-end encrypted transactions</li>
                            <li>Instant payment confirmation</li>
                            <li>24/7 fraud monitoring</li>
                            <li>Bank-level security protocols</li>
                        </ul>
                    </div>
                </div>
                
                <div class="payment-form-main">
                    <div class="payment-header">
                        <h2>Payment Information</h2>
                        <p>Please enter your payment details to complete this secure transaction</p>
                    </div>

                    <asp:Label ID="lblMessage" runat="server" CssClass="message error-message"></asp:Label>

                    <div class="form-section">
                        <h4 class="form-section-title">Card Details</h4>
                        <div class="form-group">
                            <label for="txtCardName" class="form-label">Cardholder Name</label>
                            <asp:TextBox ID="txtCardName" runat="server" CssClass="form-control" placeholder="As shown on card" />
                        </div>
                        
                        <div class="form-group">
                            <label for="txtCardNumber" class="form-label">Card Number</label>
                            <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" MaxLength="16" placeholder="•••• •••• •••• ••••" />
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">Expiration Date</label>
                                <div class="expiry-group">
                                    <asp:DropDownList ID="ddlExpiryMonth" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Month" Value="" />
                                        <asp:ListItem Text="01" />
                                        <asp:ListItem Text="02" />
                                        <asp:ListItem Text="03" />
                                        <asp:ListItem Text="04" />
                                        <asp:ListItem Text="05" />
                                        <asp:ListItem Text="06" />
                                        <asp:ListItem Text="07" />
                                        <asp:ListItem Text="08" />
                                        <asp:ListItem Text="09" />
                                        <asp:ListItem Text="10" />
                                        <asp:ListItem Text="11" />
                                        <asp:ListItem Text="12" />
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlExpiryYear" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Year" Value="" />
                                        <asp:ListItem Text="2025" />
                                        <asp:ListItem Text="2026" />
                                        <asp:ListItem Text="2027" />
                                        <asp:ListItem Text="2028" />
                                        <asp:ListItem Text="2029" />
                                        <asp:ListItem Text="2030" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="txtCVV" class="form-label">Security Code</label>
                                <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control" MaxLength="3" TextMode="Password" placeholder="•••" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-section">
                        <h4 class="form-section-title">Payment Summary</h4>
                        <div class="form-group">
                            <label for="txtAmount" class="form-label">Amount (R)</label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="0.00" />
                        </div>
                    </div>
                    
                    <asp:Button ID="btnPay" runat="server" Text="Confirm Payment" OnClick="btnPay_Click" CssClass="btn-pay" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>