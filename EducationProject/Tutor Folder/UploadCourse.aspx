<%@ Page Language="C#"Title="Upload Courses" MasterPageFile="~/Tutor.Master" AutoEventWireup="true" CodeBehind="UploadCourse.aspx.cs" Inherits="EducationProject.UploadCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        :root {
            --primary: #A12568;
            --secondary: #D61C4E;
            --bg: #13111C;
            --text: #FFFFFF;
            --text-light: #E6E6FA;
            --border: rgba(255, 255, 255, 0.15);
            --bg-glass: rgba(255, 255, 255, 0.08);
        }

        .upload-wrapper {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: var(--bg-glass);
            border: 1px solid var(--border);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(161, 37, 104, 0.2);
            backdrop-filter: blur(12px);
        }

        h2 {
            color: var(--text);
            font-size: 2rem;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .section {
            margin-bottom: 2rem;
        }

        .section-title {
            font-size: 1.3rem;
            color: var(--text-light);
            margin-bottom: 1rem;
            border-left: 4px solid var(--secondary);
            padding-left: 1rem;
        }

        .form-group {
            margin-bottom: 1.25rem;
        }

        label {
            display: block;
            color: var(--text-light);
            margin-bottom: 0.5rem;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid var(--border);
            color: var(--text);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 2px rgba(161, 37, 104, 0.3);
        }

        textarea.form-control {
            min-height: 100px;
            resize: vertical;
        }
        .btn {
    padding: 0.75rem 1.5rem;
    font-size: 1rem;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
    width: 100%;
    max-width: 220px;
    display: inline-block;
    text-align: center;
}

/* Primary Button */
.btn-primary {
    background: linear-gradient(to right, var(--primary), var(--secondary));
    color: white;
}

.btn-primary:hover {
    box-shadow: 0 5px 15px rgba(209, 53, 100, 0.4);
    transform: translateY(-2px);
}

/* Secondary Button */
.btn-secondary {
    background-color: rgba(255, 255, 255, 0.1);
    color: var(--text-light);
    border: 1px solid var(--border);
}

.btn-secondary:hover {
    background-color: rgba(255, 255, 255, 0.2);
    border-color: var(--primary);
    color: white;
}


        .validation-summary-errors {
            background: rgba(255, 0, 0, 0.05);
            border: 1px solid #dc3545;
            padding: 1rem;
            color: #dc3545;
            border-radius: 8px;
            margin-bottom: 1rem;
        }

        .validation-summary-errors ul {
            padding-left: 1rem;
            margin: 0;
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
        }

        .alert-danger {
            background: rgba(220, 53, 69, 0.2);
            color: #dc3545;
        }

        .upload-note {
            font-size: 0.85rem;
            color: var(--text-light);
            margin-top: 0.25rem;
        }

        #uploadSpinner {
            text-align: center;
            display: none;
            margin-top: 1rem;
        }

        @media (max-width: 768px) {
            .upload-wrapper {
                padding: 1.5rem;
                margin: 1rem;
            }
        }
    </style>

    <form id="form1" runat="server">
        <div class="upload-wrapper">
            <h2>Upload New Course</h2>

            <asp:ValidationSummary ID="valSummary" runat="server" CssClass="validation-summary-errors"
                ShowSummary="true" HeaderText="Please fix the following:" />

            <asp:Label ID="lblMessage" runat="server" CssClass="alert" Visible="false" />

            <!-- Course Information -->
            <div class="section">
                <div class="section-title">Course Information</div>

                <div class="form-group">
                    <label for="txtCourseName">Course Name *</label>
                    <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCourseName" CssClass="text-danger"
                        ErrorMessage="Course name is required" Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label for="txtCourseDescription">Course Description</label>
                    <asp:TextBox ID="txtCourseDescription" runat="server" CssClass="form-control" TextMode="MultiLine" />
                </div>

                <div class="form-group">
                    <label for="txtCourseFee">Course Fee (ZAR) *</label>
                    <asp:TextBox ID="txtCourseFee" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCourseFee" CssClass="text-danger"
                        ErrorMessage="Course fee is required" Display="Dynamic" />
                    <asp:CompareValidator runat="server" ControlToValidate="txtCourseFee" Operator="DataTypeCheck" Type="Currency"
                        ErrorMessage="Enter a valid amount" CssClass="text-danger" Display="Dynamic" />
                </div>
            </div>

            <!-- Instructor Info -->
            <div class="section">
                <div class="section-title">Instructor Information</div>

                <div class="form-group">
                    <label for="txtInstructor">Instructor Name *</label>
                    <asp:TextBox ID="txtInstructor" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtInstructor" CssClass="text-danger"
                        ErrorMessage="Instructor name is required" Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label for="txtTitle">Course Code (e.g. ABC123)</label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
                </div>
            </div>

            <!-- Upload Media -->
            <div class="section">
                <div class="section-title">Upload Media</div>

                <div class="form-group">
                    <label>Course Thumbnail Image *</label>
                    <asp:FileUpload ID="fileImageUrl" runat="server" CssClass="form-control" />
                    <span class="upload-note">Accepted: JPG, PNG, GIF | Max: 5MB</span>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="fileImageUrl" CssClass="text-danger"
                        ErrorMessage="Course thumbnail is required" Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label>Optional Supporting Document</label>
                    <asp:FileUpload ID="fileDocument" runat="server" CssClass="form-control" />
                    <span class="upload-note">Accepted: PDF, DOCX, JPG, PNG | Max: 5MB</span>
                </div>

                <asp:Button ID="btnUploadDoc" runat="server" Text="Upload Document Only"  CssClass="btn btn-secondary" OnClick="btnUploadDoc_Click" />
                <asp:Label ID="lblUploadStatus" runat="server" CssClass="upload-note" />
            </div>

            <!-- Submit -->
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Course" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />

            <div id="uploadSpinner">
                <span style="color: var(--text-light); font-size: 0.9rem;">Uploading... Please wait.</span><br />
                <img src="Assets/spinner.svg" alt="Loading..." style="width: 40px;" />
            </div>
        </div>

        <script>
            document.getElementById('<%= btnSubmit.ClientID %>').addEventListener('click', function () {
                document.getElementById('uploadSpinner').style.display = 'block';
            });
        </script>
    </form>
</asp:Content>