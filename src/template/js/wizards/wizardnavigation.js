export function initializeWizardNavigation() {
    const sections = document.querySelectorAll('.form-section');
    if (sections.length === 0) return;

    // Create wizard navigation
    createWizardNavigation(sections);
    
    // Ensure only first section is open
    sections.forEach((section, index) => {
        section.classList.add('collapsed');
        if (index === 0) {
            section.classList.remove('collapsed');
        }
        
        // Hide section titles
        const title = section.querySelector('.section-title');
        if (title) {
            title.style.display = 'none';
        }
    });

    // Monitor form changes
    const form = document.querySelector('form');
    if (form) {
        form.addEventListener('input', debounce(() => updateAllStepStatus(), 300));
        form.addEventListener('change', () => updateAllStepStatus());
    }

    // Initial status update
    setTimeout(() => updateAllStepStatus(), 100);
}

function createWizardNavigation(sections) {
    const container = document.createElement('div');
    container.className = 'wizard-navigation-container';
    
    // Create steps indicator
    const stepsContainer = document.createElement('div');
    stepsContainer.className = 'wizard-steps';

    // Create navigation buttons
    const navButtonsPrev = document.createElement('div');
    navButtonsPrev.className = 'wizard-nav-buttons';
    navButtonsPrev.innerHTML = `
        <button type="button" class="wizard-btn wizard-btn-prev" disabled>
            <span>←</span> Zurück
        </button>
    `;

    const navButtonsNext = document.createElement('div');
    navButtonsNext.className = 'wizard-nav-buttons';
    navButtonsNext.innerHTML = `
        <button type="button" class="wizard-btn wizard-btn-next">
            Weiter <span>→</span>
        </button>
    `;
    
    sections.forEach((section, index) => {
        const titleSpan = section.querySelector('.section-title span:first-child');
        const badge = section.querySelector('.section-badge');
        const sectionName = titleSpan ? titleSpan.textContent : `Schritt ${index + 1}`;
        const isRequired = badge && badge.textContent.includes('Pflicht');

        const step = document.createElement('div');
        step.className = 'wizard-step';
        step.dataset.index = index;
        if (index === 0) step.classList.add('active');
        if (isRequired) step.classList.add('required');

        step.innerHTML = `
            <div class="step-circle">
                <span class="step-number">${index + 1}</span>
                <span class="step-check">✓</span>
            </div>
            <div class="step-info">
                <div class="step-label">${sectionName}</div>
                <div class="step-status">Nicht ausgefüllt</div>
            </div>
        `;

        step.addEventListener('click', () => goToStep(index));
        stepsContainer.appendChild(step);
    });

    container.appendChild(navButtonsPrev);
    container.appendChild(stepsContainer);
    container.appendChild(navButtonsNext);

    // Insert before first section
    const firstSection = sections[0];
    firstSection.parentNode.insertBefore(container, firstSection);

    // Add navigation button handlers
    const prevBtn = navButtonsPrev.querySelector('.wizard-btn-prev');
    const nextBtn = navButtonsNext.querySelector('.wizard-btn-next');

    prevBtn.addEventListener('click', () => goToPreviousStep());
    nextBtn.addEventListener('click', () => goToNextStep());

    // Hide section toggle icons since we have wizard navigation
    sections.forEach(section => {
        const toggleIcon = section.querySelector('.section-toggle-icon');
        if (toggleIcon) toggleIcon.style.display = 'none';
        
        // Make section title non-clickable
        const title = section.querySelector('.section-title');
        if (title) {
            title.style.cursor = 'default';
            title.style.pointerEvents = 'none';
        }
    });
}

function goToStep(targetIndex) {
    const sections = document.querySelectorAll('.form-section');
    const steps = document.querySelectorAll('.wizard-step');
    const prevBtn = document.querySelector('.wizard-btn-prev');
    const nextBtn = document.querySelector('.wizard-btn-next');

    sections.forEach((section, index) => {
        if (index === targetIndex) {
            section.classList.remove('collapsed');
            if (steps[index]) steps[index].classList.add('active');
        } else {
            section.classList.add('collapsed');
            if (steps[index]) steps[index].classList.remove('active');
        }
    });

    // Update button states
    prevBtn.disabled = targetIndex === 0;
    nextBtn.disabled = targetIndex === sections.length - 1;
}

function goToNextStep() {
    const sections = document.querySelectorAll('.form-section');
    const activeIndex = Array.from(sections).findIndex(s => !s.classList.contains('collapsed'));
    
    if (activeIndex < sections.length - 1) {
        goToStep(activeIndex + 1);
    }
}

function goToPreviousStep() {
    const sections = document.querySelectorAll('.form-section');
    const activeIndex = Array.from(sections).findIndex(s => !s.classList.contains('collapsed'));
    
    if (activeIndex > 0) {
        goToStep(activeIndex - 1);
    }
}

function updateAllStepStatus() {
    const sections = document.querySelectorAll('.form-section');
    
    sections.forEach((section, index) => {
        const stats = getSectionStats(section);
        updateStepDisplay(index, stats);
    });
}

function getSectionStats(section) {
    const content = section.querySelector('.section-content');
    if (!content) return { filled: 0, total: 0 };

    let filled = 0;
    let total = 0;

    // Regular inputs
    const inputs = content.querySelectorAll('input:not([type="hidden"]):not([type="radio"]):not([type="checkbox"]), textarea');
    inputs.forEach(input => {
        if (input.offsetParent !== null) {
            total++;
            if (input.value && input.value.trim() !== '') filled++;
        }
    });

    // Custom selects
    const selects = content.querySelectorAll('.custom-select');
    selects.forEach(select => {
        if (select.offsetParent !== null) {
            total++;
            const value = select.dataset.value;
            if (value && value !== '' && value !== 'none') filled++;
        }
    });

    // Checkboxes (count groups)
    const checkboxGroups = {};
    content.querySelectorAll('input[type="checkbox"]').forEach(cb => {
        const name = cb.name || 'default';
        if (!checkboxGroups[name]) checkboxGroups[name] = [];
        checkboxGroups[name].push(cb);
    });
    Object.values(checkboxGroups).forEach(group => {
        if (group[0]?.offsetParent !== null) {
            total++;
            if (group.some(cb => cb.checked)) filled++;
        }
    });

    // Radio buttons (count groups)
    const radioGroups = {};
    content.querySelectorAll('input[type="radio"]').forEach(radio => {
        const name = radio.name || 'default';
        if (!radioGroups[name]) radioGroups[name] = [];
        radioGroups[name].push(radio);
    });
    Object.values(radioGroups).forEach(group => {
        if (group[0]?.offsetParent !== null) {
            total++;
            if (group.some(r => r.checked)) filled++;
        }
    });

    return { filled, total };
}

function updateStepDisplay(index, stats) {
    const step = document.querySelector(`.wizard-step[data-index="${index}"]`);
    if (!step) return;

    const statusText = step.querySelector('.step-status');
    const circle = step.querySelector('.step-circle');

    // Remove all status classes
    step.classList.remove('complete', 'partial', 'empty');

    if (stats.total === 0) {
        step.classList.add('empty');
        if (statusText) statusText.textContent = 'Nicht ausgefüllt';
    } else if (stats.filled === stats.total) {
        step.classList.add('complete');
        if (statusText) statusText.textContent = 'Vollständig';
    } else if (stats.filled > 0) {
        step.classList.add('partial');
        if (statusText) statusText.textContent = `${stats.filled} von ${stats.total}`;
    } else {
        step.classList.add('empty');
        if (statusText) statusText.textContent = `0 von ${stats.total}`;
    }
}

function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}
