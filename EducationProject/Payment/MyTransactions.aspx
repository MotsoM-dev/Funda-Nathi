<%@ Page Language="C#" title="" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="MyTransactions.aspx.cs" Inherits="EducationProject.Payment.MyTransactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <form id="form1" runat="server">
<div class="receipt-container">
    <div class="receipt-header">
        <div class="header-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <h1 class="receipt-title">Enrollment Confirmed</h1>
        <p class="receipt-subtitle">Your course access details are below</p>
    </div>

    <div class="glass-container">
        <div class="receipt-card">
            <div class="receipt-badge">
                <i class="fas fa-lock"></i>
                <span>Payment Processed</span>
            </div>

            <div class="receipt-content">
                <div class="receipt-section payment-details">
                    <h3 class="section-title">
                        <i class="fas fa-receipt"></i>
                        Transaction Summary
                    </h3>
                    <div class="detail-grid">
                        <div class="detail-item">
                            <span class="detail-label">Reference #</span>
                            <span class="detail-value" id="lblTransactionID" runat="server">EDU-<%= DateTime.Now.ToString("yyyyMMddHHmm") %></span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Processed On</span>
                            <span class="detail-value" id="lblPaymentDate" runat="server">date</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Payment Method</span>
                            <span class="detail-value" id="lblPaymentMethod" runat="server">Credit Card •••• 4242</span>
                        </div>
                        <div class="detail-item highlight">
                            <span class="detail-label">Amount Paid</span>
                            <span class="detail-value" id="lblAmount" runat="server"> </span>
                        </div>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="receipt-section course-details">
                    <h3 class="section-title">
                        <i class="fas fa-book-open"></i>
                        Course Enrollment
                    </h3>
                    <div class="detail-grid">
                        
                        <div class="detail-item">
                            <span class="detail-label">Access Starts</span>
                            <span class="detail-value" id="lblAccessDate" runat="server"><%= DateTime.Now.ToString("d") %></span>
                        </div>
                    </div>

                    
                </div>

                <div class="receipt-qr">
                    <div class="qr-container">
                        <div class="qr-code">
                            <i class="fas fa-qrcode"></i>
                        </div>
                        <div class="qr-instructions">
                            <p><i class="fas fa-mobile-alt"></i> Scan to access course materials</p>
                            <p><i class="fas fa-user-graduate"></i> Valid for <%= DateTime.Now.AddYears(1).ToString("yyyy") %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="receipt-actions">
            <asp:Button ID="btnDownload" runat="server" Text="Download Receipt" CssClass="action-btn download-btn" OnClick="btnDownload_Click" />
            <asp:Button ID="btnDashboard" runat="server" Text="Go to Dashboard" CssClass="action-btn dashboard-btn" OnClick="btnDashboard_Click"/>
        </div>
    </div>

    <div class="next-steps">
        <h3 class="steps-title"><i class="fas fa-road"></i> Next Steps</h3>
        <div class="steps-container">
            <div class="step-card">
                <div class="step-icon purple-bg">
                    <i class="fas fa-envelope"></i>
                </div>
                <div class="step-content">
                    <h4>Confirmation Sent</h4>
                    <p>Check your email for course access instructions and receipt.</p>
                </div>
            </div>
            <div class="step-card">
                <div class="step-icon purple-bg">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div class="step-content">
                    <h4>Calendar Invite</h4>
                    <p>You'll receive session reminders and important dates.</p>
                </div>
            </div>
            <div class="step-card">
                <div class="step-icon purple-bg">
                    <i class="fas fa-headset"></i>
                </div>
                <div class="step-content">
                    <h4>Support Available</h4>
                    <p>Our team is ready to help at support@edututor.com.</p>
                </div>
            </div>
        </div>
    </div>
</div>



    <style type="text/css">
        /* Enhanced Purple Glass Theme */
        :root {
            --primary: #7E57C2;
            --primary-light: #9575CD;
            --primary-dark: #5E35B1;
            --primary-soft: rgba(126, 87, 194, 0.15);
            --secondary: #673AB7;
            --accent: #FFC107;
            --success: #4CAF50;
            --dark: #1A1A2E;
            --darker: #121212;
            --light: #f8f9fa;
            --glass-bg: rgba(25, 25, 45, 0.85);
            --glass-border: rgba(126, 87, 194, 0.25);
            --glass-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            --text-white: #FFFFFF;
            --text-light: #EAEAEA;
            --text-muted: #B0B0B0;
        }

        body {
            background: linear-gradient(135deg, var(--darker), var(--dark));
            color: var(--text-light);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
        }

        .receipt-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .receipt-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
            z-index: 2;
        }

        .header-icon {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            box-shadow: 0 4px 20px rgba(126, 87, 194, 0.4);
        }

        .header-icon i {
            font-size: 2.5rem;
            color: white;
        }

        .receipt-title {
            font-size: 2.5rem;
            margin: 0 0 0.5rem 0;
            background: linear-gradient(to right, var(--primary-light), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 700;
        }

        .receipt-subtitle {
            color: var(--text-light);
            font-size: 1.2rem;
            margin: 0;
            opacity: 0.9;
        }

        /* Enhanced Glass Container */
        .glass-container {
            background: var(--glass-bg);
            backdrop-filter: blur(12px) saturate(180%);
            -webkit-backdrop-filter: blur(12px) saturate(180%);
            border: 1px solid var(--glass-border);
            border-radius: 16px;
            box-shadow: var(--glass-shadow);
            padding: 2.5rem;
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
        }

        .glass-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(126, 87, 194, 0.1) 0%, rgba(25, 25, 45, 0) 70%);
            z-index: 0;
        }

        .receipt-card {
            position: relative;
            z-index: 1;
        }

        .receipt-badge {
            position: absolute;
            top: -15px;
            right: 30px;
            background: linear-gradient(to right, var(--primary-dark), var(--secondary));
            color: white;
            padding: 0.5rem 1.5rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.95rem;
            box-shadow: 0 4px 15px rgba(126, 87, 194, 0.4);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            z-index: 2;
        }

        .receipt-content {
            position: relative;
            z-index: 1;
        }

        .receipt-section {
            margin: 1.5rem 0;
        }

        .section-title {
            color: var(--text-white);
            margin: 0 0 1.5rem 0;
            font-size: 1.3rem;
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }

        .section-title i {
            color: var(--primary-light);
        }

        .detail-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
            gap: 0.3rem;
            padding: 0.8rem;
            background: rgba(255, 255, 255, 0.03);
            border-radius: 8px;
        }

        .detail-label {
            color: var(--text-muted);
            font-size: 0.9rem;
            font-weight: 500;
        }

        .detail-value {
            color: var(--text-light);
            font-weight: 600;
            font-size: 1.05rem;
        }

        .highlight .detail-value {
            color: var(--accent);
            font-size: 1.2rem;
            font-weight: 700;
        }

        .divider {
            height: 1px;
            background: linear-gradient(to right, transparent, var(--primary-light), transparent);
            margin: 2rem 0;
            opacity: 0.3;
        }

        .course-description {
            margin-top: 2rem;
            padding: 1.5rem;
            background: rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            border-left: 3px solid var(--primary-light);
        }

        .course-description h4 {
            color: var(--text-white);
            margin-bottom: 1rem;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .description-text {
            color: var(--text-light);
            line-height: 1.7;
        }

        .receipt-qr {
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px dashed rgba(126, 87, 194, 0.3);
        }

        .qr-container {
            display: flex;
            align-items: center;
            gap: 2rem;
            background: rgba(126, 87, 194, 0.1);
            padding: 1.5rem;
            border-radius: 12px;
            border: 1px dashed var(--glass-border);
        }

        .qr-code {
            background: white;
            width: 120px;
            height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            flex-shrink: 0;
        }

        .qr-code i {
            font-size: 4rem;
            color: var(--dark);
        }

        .qr-instructions p {
            margin: 0.5rem 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text-light);
        }

        .qr-instructions i {
            color: var(--primary-light);
            width: 20px;
            text-align: center;
        }

        .receipt-actions {
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            margin: 2.5rem 0 1rem;
            flex-wrap: wrap;
        }

        .action-btn {
            border: none;
            padding: 1rem 2rem;
            font-size: 1rem;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            min-width: 220px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.7rem;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .action-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, var(--primary), var(--primary-dark));
            z-index: -1;
            transition: opacity 0.3s ease;
        }

        .download-btn {
            background: transparent;
            border: 2px solid var(--primary-light);
            color: var(--primary-light);
        }

        .download-btn:hover {
            color: white;
        }

        .download-btn:hover::before {
            opacity: 1;
        }

        .dashboard-btn {
            background: rgba(255, 255, 255, 0.05);
            border: 2px solid rgba(255, 255, 255, 0.1);
            color: var(--text-light);
        }

        .dashboard-btn:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: var(--primary-light);
            color: var(--primary-light);
        }

        /* Next Steps Section */
        .next-steps {
            margin-top: 2rem;
        }

        .steps-title {
            text-align: center;
            color: var(--text-white);
            margin-bottom: 2rem;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.8rem;
        }

        .steps-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-top: 1.5rem;
        }

        .step-card {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            border-radius: 12px;
            padding: 1.5rem;
            transition: all 0.3s ease;
            display: flex;
            gap: 1rem;
            align-items: flex-start;
        }

        .step-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            border-color: var(--primary-light);
        }

        .step-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            font-size: 1.2rem;
        }

        .purple-bg {
            background: var(--primary-soft);
            color: var(--primary-light);
            border: 1px solid var(--glass-border);
        }

        .step-content h4 {
            margin: 0 0 0.5rem 0;
            color: var(--text-white);
            font-size: 1.1rem;
        }

        .step-content p {
            margin: 0;
            color: var(--text-muted);
            font-size: 0.9rem;
            line-height: 1.6;
        }

        @media (max-width: 768px) {
            .receipt-title {
                font-size: 2rem;
            }
            
            .receipt-subtitle {
                font-size: 1.1rem;
            }
            
            .glass-container {
                padding: 1.5rem;
            }
            
            .detail-grid {
                grid-template-columns: 1fr;
            }
            
            .qr-container {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }
            
            .receipt-actions {
                flex-direction: column;
                gap: 1rem;
            }
            
            .action-btn {
                width: 100%;
            }
        }

        @media (max-width: 576px) {
            .receipt-title {
                font-size: 1.8rem;
            }
            
            .header-icon {
                width: 70px;
                height: 70px;
            }
            
            .steps-container {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        </form>
</asp:Content>