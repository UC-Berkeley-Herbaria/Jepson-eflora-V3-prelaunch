<header class="herbaria-banner" role="banner">
    <!-- TOP SECTION: University Bar -->
    <div class="top-blue-bar">
        <div class="header-inner">
            <nav class="top-nav desktop-only" aria-label="University Links">
            	<ul class="nav-list">
            	<li><div aria-hidden="true"><a href="https://berkeley.edu/">UC Berkeley</a></div></li>
            	</ul>
            </nav>
            <button class="menu-toggle" aria-controls="main-nav-container" aria-expanded="false" aria-label="Toggle Navigation Menu">
                <span class="hamburger"></span>
                <span class="menu-text">Menu</span>
            </button>

            <nav class="top-nav desktop-only" aria-label="University Links">
                <ul class="nav-list">
                    <li><a href="https://herbaria.berkeley.edu">UC Berkeley Herbaria Home</a></li>
                    <li><a href="https://herbaria.berkeley.edu/people/">People</a></li>
                    <li><a href="https://herbaria.berkeley.edu/about-the-herbaria/contact/">Contact</a></li>
                </ul>
            </nav>
        </div>
    </div>

    <!-- MIDDLE SECTION: Branding -->
    <div class="white-branding-section">
        <div class="header-inner branding-flex">
            <div class="logo-container">
                <a href="/" aria-label="University and Jepson Herbaria Home">
                    <img src="/eflora/common/images/UC-JEPS-no-words.png" alt="University and Jepson Herbaria Logo">
                </a>
            </div>
            <div class="banner-container">
                <img src="/eflora/common/images/png_Horizontal-10-2-V2.png" alt="The Jepson Herbarium: University of California Berkeley" class="banner-img">
            </div>
        </div>
    </div>

    <!-- BOTTOM SECTION: Site Navigation -->
    <nav id="main-nav-container" class="bottom-blue-bar" aria-label="Site Navigation">
        <div class="header-inner">
            <ul class="nav-list main-site-nav">
                <li class="mobile-only"><a href="https://herbaria.berkeley.edu">Herbaria Home</a></li>
                <li><a href="https://herbariadb.berkeley.edu">Herbaria Databases Home</a></li>
                <li><a href="https://webapps.cspace.berkeley.edu/ucjeps/publicsearch/publicsearch/">Specimen Portal</a></li>
                <li><a href="https://herbaria.berkeley.edu/floras/">Floras Home</a></li>
                <li><a href="https://herbaria.berkeley.edu/about-the-herbaria/support-the-herbaria/">Support the Herbaria</a></li>
                <li class="mobile-only"><a href="https://herbaria.berkeley.edu/people/">People</a></li>
                <li class="mobile-only"><a href="https://herbaria.berkeley.edu/about-the-herbaria/contact/">Contact Us</a></li>
            </ul>
        </div>
    </nav>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const menuToggle = document.querySelector('.menu-toggle');
            const navContainer = document.getElementById('main-nav-container');

            menuToggle.addEventListener('click', function() {
                const isExpanded = menuToggle.getAttribute('aria-expanded') === 'true';
                menuToggle.setAttribute('aria-expanded', !isExpanded);
                navContainer.classList.toggle('is-open');
            });
        });
    </script>
</header>
<!--Contrast: The "Berkeley Blue" (#003262) against White text provides a ratio of over 10:1 (exceeding the 7:1 AAA requirement).-->
<!--Touch Targets: Navigation links have padding to ensure they meet the 44x44 pixel requirement for mobile users with limited dexterity.-->
<!--Focus Visibility: A bright Gold (#FDB515) 3px outline is added for keyboard navigators, making the current focus unmistakable.-->
<!--Semantic Navigation: Uses <nav> landmarks and aria-label to distinguish between "University" links and "Site" links for screen reader users.-->
<!--Responsive Layout: The branding section stacks vertically on mobile so the logo and banner don't become illegibly small.-->
<!--Alt Text: Included descriptive alt text placeholders for your images.-->
<!--Aria-Expanded: When the JavaScript toggles the menu, it updates aria-expanded="true/false". This tells screen reader users if the menu is currently open or closed.-->
<!--Focus Management: The menu toggle button has a high-contrast focus ring.-->
<!--Semantic Redundancy: On mobile, the "University Links" (People, Contact, etc.) are moved into the single dropdown menu so the user doesn't have to look for two separate menus.-->
<!--Touch Targets: Every link in the mobile dropdown has a larger padding (12px) to ensure users with mobile devices can easily tap them without hitting the wrong link.-->
<!--Font Size (1.1rem / 17.6px): Standard browser default is 16px. Moving to 17.6px (1.1rem) makes the text significantly more readable for users with visual impairments without looking "oversized" on modern screens.-->
<!--Increased Weight: I used font-weight: 600 for navigation. Heavier weights provide better contrast against dark backgrounds, which helps users with low-vision or astigmatism.-->
<!--Touch Targets (48px height): The padding ensures that every link exceeds the 44px minimum target size, preventing "fat-finger" errors on mobile.-->
<!--Mobile Dropdown Contrast: The mobile dropdown links are 1.2rem (approx 19px) and have generous spacing to ensure the user can clearly distinguish where one link ends and the next begins.-->