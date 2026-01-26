<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EducationProject.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: "#A12568",
                        secondary: "#3B185F"
                    },
                    borderRadius: {
                        button: "8px",
                    },
                },
            },
        };
    </script>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css" />

    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow-x: hidden;
            scroll-behavior: smooth;
        }

        /* Scrollbar Styling */
        ::-webkit-scrollbar {
            width: 12px;
        }

        ::-webkit-scrollbar-track {
            background: #13111C;
        }

        ::-webkit-scrollbar-thumb {
            background: linear-gradient(#A12568, #6F5DE0);
            border-radius: 6px;
        }

        .hero-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: -1;
            overflow: hidden;
        }

        .hero-bg video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .hero-bg .overlay {
            position: absolute;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, #13111C 10%, rgba(19, 17, 28, 0.4) 50%, transparent 100%);
            z-index: 1;
        }

        .glass {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.05);
        }

        .btn-primary {
            background: linear-gradient(135deg, #A12568, #6F5DE0);
            color: white;
            padding: 14px 30px;
            border-radius: 9999px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(161, 37, 104, 0.4);
        }

        .gradient-text {
            background: linear-gradient(to right, #A12568, #6F5DE0);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .card-hover {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(161, 37, 104, 0.2);
        }

        .stats-counter {
            font-variant-numeric: tabular-nums;
            font-weight: 700;
        }

        .btn-glass {
            background: linear-gradient(135deg, rgba(161, 37, 104, 0.2), rgba(111, 93, 224, 0.2));
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
            border-radius: 50px;
            color: #FFFFFF;
        }

        .btn-glass:hover {
            background: linear-gradient(135deg, rgba(161, 37, 104, 0.3), rgba(111, 93, 224, 0.3));
            border: 1px solid rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(161, 37, 104, 0.3);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Background Video -->
    <div class="hero-bg">
        <video autoplay loop muted playsinline>
            <source src="../Media/3163534-uhd_3840_2160_30fps.mp4" type="video/mp4" />
        </video>
        <div class="overlay"></div>
    </div>

    <!-- Hero Section -->
    <section class="h-screen flex flex-col justify-center items-center text-white text-center relative z-10 px-6">
        <h1 class="text-6xl md:text-7xl font-extrabold mb-6 leading-tight">
            Connect with <span class="gradient-text">Funda Nathi</span>
        </h1>
        <p class="text-xl md:text-2xl max-w-2xl mb-10">
            Bridge the gap between academic excellence and understanding. Learn from students who've mastered the courses you're struggling with.
        </p>
        <asp:Button ID="btnExploreCoursesHero" runat="server" CssClass="btn-primary px-8 py-3 text-white font-medium whitespace-nowrap flex items-center gap-2" 
            Text="Explore Course Catalog" OnClick="btnExploreCourses_Click" />
    </section>

    <!-- Features Section -->
    <section class="py-20 relative z-10">
        <div class="container mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-3xl font-bold mb-4">Why Choose <span class="gradient-text">TutorConnect</span></h2>
                <p class="text-gray-400 max-w-2xl mx-auto">Our platform connects high-achieving students with peers who need academic support, creating a collaborative learning environment.</p>
            </div>
            <div class="grid md:grid-cols-3 gap-8">
                <!-- Feature 1 -->
                <div class="glass p-8 rounded-lg card-hover">
                    <div class="w-16 h-16 flex items-center justify-center bg-gradient rounded-full mb-6 mx-auto">
                        <i class="ri-user-star-line ri-xl text-white"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-4 text-center">Expert Student Tutors</h3>
                    <p class="text-gray-400 text-center">Learn from peers who've excelled in your courses. Our tutors have achieved top grades and know exactly how to help you succeed.</p>
                </div>
                <!-- Feature 2 -->
                <div class="glass p-8 rounded-lg card-hover">
                    <div class="w-16 h-16 flex items-center justify-center bg-gradient rounded-full mb-6 mx-auto">
                        <i class="ri-book-open-line ri-xl text-white"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-4 text-center">Flexible Short Courses</h3>
                    <p class="text-gray-400 text-center">From quick concept reviews to comprehensive exam prep, our short courses fit your schedule and learning needs.</p>
                </div>
                <!-- Feature 3 -->
                <div class="glass p-8 rounded-lg card-hover">
                    <div class="w-16 h-16 flex items-center justify-center bg-gradient rounded-full mb-6 mx-auto">
                        <i class="ri-settings-line ri-xl text-white"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-4 text-center">Personalized Learning</h3>
                    <p class="text-gray-400 text-center">Get tailored support that addresses your specific challenges. Our tutors adapt their teaching style to match your learning preferences.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="py-16 relative z-10">
        <div class="container mx-auto px-6">
            <div class="glass rounded-lg p-10">
                <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
                    <div>
                        <p class="stats-counter text-4xl font-bold gradient-text mb-2 counter" data-target="350">0</p>
                        <p class="text-gray-400">Active Tutors</p>
                    </div>
                    <div>
                        <p class="stats-counter text-4xl font-bold gradient-text mb-2 counter" data-target="120">0</p>
                        <p class="text-gray-400">Available Courses</p>
                    </div>
                    <div>
                        <p class="stats-counter text-4xl font-bold gradient-text mb-2 counter" data-target="92">0</p>
                        <p class="text-gray-400">Success Rate</p>
                    </div>
                    <div>
                        <p class="stats-counter text-4xl font-bold gradient-text mb-2 counter" data-target="5000">0</p>
                        <p class="text-gray-400">Active Learners</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Value Proposition -->
    <section class="py-20 relative z-10">
        <div class="container mx-auto px-6">
            <div class="glass rounded-lg overflow-hidden">
                <div class="grid md:grid-cols-2">
                    <!-- For Students -->
                    <div class="p-10 border-r border-white/10">
                        <div class="w-14 h-14 flex items-center justify-center bg-gradient rounded-full mb-6">
                            <i class="ri-graduation-cap-line ri-xl text-white"></i>
                        </div>
                        <h3 class="text-2xl font-semibold mb-6">For Students</h3>
                        <ul class="space-y-4">
                            <li class="flex items-start gap-3">
                                <div class="w-6 h-6 flex items-center justify-center text-primary mt-0.5">
                                    <i class="ri-check-line"></i>
                                </div>
                                <p class="text-gray-300">Access to tutors who've aced the exact courses you're taking</p>
                            </li>
                            <li class="flex items-start gap-3">
                                <div class="w-6 h-6 flex items-center justify-center text-primary mt-0.5">
                                    <i class="ri-check-line"></i>
                                </div>
                                <p class="text-gray-300">Flexible scheduling that works around your timetable</p>
                            </li>
                            <li class="flex items-start gap-3">
                                <div class="w-6 h-6 flex items-center justify-center text-primary mt-0.5">
                                    <i class="ri-check-line"></i>
                                </div>
                                <p class="text-gray-300">Affordable rates compared to professional tutoring services</p>
                            </li>
                            <li class="flex items-start gap-3">
                                <div class="w-6 h-6 flex items-center justify-center text-primary mt-0.5">
                                    <i class="ri-check-line"></i>
                                </div>
                                <p class="text-gray-300">Peer-to-peer learning that makes complex concepts relatable</p>
                            </li>
                        </ul>
                    </div>
                    <!-- For Tutors -->
                    <div class="p-10">
                        <div class="w-14 h-14 flex items-center justify-center bg-gradient rounded-full mb-6">
                            <i class="ri-user-voice-line ri-xl text-white"></i>
                        </div>
                        <h3 class="text-2xl font-semibold mb-6">For Tutors</h3>
                        <ul class="space-y-4">
                            <li class="flex items-start gap-3">
                                <div class="w-6 h-6 flex items-center justify-center text-primary mt-0.5">
                                    <i class="ri-check-line"></i>
                                </div>
                                <p class="text-gray-300">Earn while sharing your academic expertise</p>
                            </li>
                            <li class="flex items-start gap-3">
                                <div class="w-6 h-6 flex items-center justify-center text-primary mt-0.5">
                                    <i class="ri-check-line"></i>
                                </div>
                                <p class="text-gray-300">Build valuable teaching experience for your resume</p>
                            </li>
                            <li class="flex items-start gap-3">
                                <div class="w-6 h-6 flex items-center justify-center text-primary mt-0.5">
                                    <i class="ri-check-line"></i>
                                </div>
                                <p class="text-gray-300">Flexible hours that fit around your own studies</p>
                            </li>
                            <li class="flex items-start gap-3">
                                <div class="w-6 h-6 flex items-center justify-center text-primary mt-0.5">
                                    <i class="ri-check-line"></i>
                                </div>
                                <p class="text-gray-300">Reinforce your own knowledge through teaching others</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="py-20 relative z-10">
        <div class="container mx-auto px-6">
            <div class="glass rounded-lg p-10 text-center">
                <h2 class="text-3xl font-bold mb-6">Ready to Transform Your Academic Journey?</h2>
                <p class="text-gray-300 max-w-2xl mx-auto mb-8">Join thousands of students who are already benefiting from peer-to-peer tutoring. Whether you're looking to improve your grades or share your knowledge, TutorConnect is your platform.</p>
                <div class="flex flex-wrap justify-center gap-4">
                    <asp:Button ID="btnSignUp" runat="server" CssClass="btn-primary px-8 py-3 text-white font-medium whitespace-nowrap" 
                        Text="Sign Up Now" OnClick="btnSignUp_Click" />
                </div>
            </div>
        </div>
    </section>

    <!-- Counter Animation Script -->
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const counters = document.querySelectorAll(".counter");
            const options = {
                threshold: 0.4
            };

            const countUp = (el) => {
                const target = +el.getAttribute("data-target");
                let count = 0;
                const increment = target / 80;

                const updateCounter = () => {
                    count += increment;
                    if (count < target) {
                        el.textContent = Math.ceil(count);
                        requestAnimationFrame(updateCounter);
                    } else {
                        el.textContent = target;
                    }
                };

                updateCounter();
            };

            const observer = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        countUp(entry.target);
                        observer.unobserve(entry.target);
                    }
                });
            }, options);

            counters.forEach(counter => observer.observe(counter));
        });
    </script>
</asp:Content>