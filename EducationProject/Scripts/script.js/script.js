
    document.querySelector('.nav-toggle').addEventListener('click', function() {
        document.querySelector('.nav-links').classList.toggle('active')
    });

    window.addEventListener('scroll', function() {
        const scrollBtn = document.querySelector('.scroll-to-top');
        if (window.scrollY > 300) {
        scrollBtn.style.display = 'flex';
        } else {
        scrollBtn.style.display = 'none';
        }
    });

    document.querySelector('.scroll-to-top').addEventListener('click', function() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });

document.addEventListener("DOMContentLoaded", function () {
    const particlesContainer = document.getElementById("particles-container");
    for (let i = 0; i < 50; i++) {
        createParticle(particlesContainer);
    }

    const statsCounters = document.querySelectorAll(".stats-counter");
    const observer = new IntersectionObserver(
        (entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    const target = entry.target;
                    const value = target.innerText;
                    const numValue = parseInt(value.replace(/\D/g, ""));
                    animateCounter(
                        target,
                        0,
                        numValue,
                        value.includes("+") ? "+" : "",
                        value.includes("%") ? "%" : ""
                    );
                    observer.unobserve(target);
                }
            });
        },
        { threshold: 0.5 }
    );
    statsCounters.forEach((counter) => {
        observer.observe(counter);
    });
});

function createParticle(container) {
    const particle = document.createElement("div");
    particle.classList.add("particle");
    const size = Math.random() * 4 + 2;
    particle.style.width = `${size}px`;
    particle.style.height = `${size}px`;
    particle.style.left = `${Math.random() * 100}%`;
    particle.style.top = `${Math.random() * 100}%`;
    particle.style.opacity = Math.random() * 0.5;
    const colors = ["#A12568", "#6F5DE0", "#3B185F"];
    particle.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
    container.appendChild(particle);
    animateParticle(particle);
}

function animateParticle(particle) {
    const duration = Math.random() * 20000 + 10000;
    const xMovement = Math.random() * 100 - 50;
    const yMovement = Math.random() * 100 - 50;
    particle.animate(
        [
            { transform: "translate(0, 0)" },
            { transform: `translate(${xMovement}px, ${yMovement}px)` },
        ],
        {
            duration: duration,
            iterations: Infinity,
            direction: "alternate",
            easing: "ease-in-out",
        }
    );
}

function animateCounter(element, start, end, suffix = "", prefix = "") {
    let current = start;
    const duration = 2000;
    const stepTime = 50;
    const steps = duration / stepTime;
    const increment = (end - start) / steps;
    const timer = setInterval(() => {
        current += increment;
        if (current >= end) {
            current = end;
            clearInterval(timer);
        }
        element.textContent = `${Math.floor(current)}${suffix}${prefix}`;
    }, stepTime);
}