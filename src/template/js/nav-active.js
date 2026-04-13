document.addEventListener('DOMContentLoaded', function () {
    const path = window.location.pathname.replace(/\/$/, '') || '/';

    // 1. Versuche exakten Treffer
    let matched = false;
    document.querySelectorAll('header nav a[href]').forEach(function (a) {
        const href = a.getAttribute('href').replace(/\/$/, '') || '/';
        if (path === href) {
            a.classList.add('active');
            matched = true;
        }
    });

    // 2. Kein Treffer – gehe Breadcrumb rückwärts durch und markiere ersten Nav-Treffer
    if (!matched) {
        const crumbLinks = Array.from(
            document.querySelectorAll('aside div.breadcrumb a[href], aside.breadcrumb a[href]')
        ).reverse();
        const navLinks = document.querySelectorAll('header nav a[href]');

        for (const crumb of crumbLinks) {
            const crumbHref = crumb.getAttribute('href').replace(/\/$/, '') || '/';
            for (const nav of navLinks) {
                const navHref = nav.getAttribute('href').replace(/\/$/, '') || '/';
                if (crumbHref === navHref) {
                    nav.classList.add('active');
                    matched = true;
                    break;
                }
            }
            if (matched) break;
        }
    }
});
