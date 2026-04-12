let activeTooltip = null;
const helpCache = new Map(); // wizardId → loaded state

/**
 * Initialize help tooltips
 */
export function initializeHelpTooltips() {
    document.addEventListener('click', handleTooltipClick);
    window.addEventListener('resize', closeActiveTooltip);
}

/**
 * Handle tooltip icon clicks
 */
function handleTooltipClick(e) {
    const helpIcon = e.target.closest('.help-icon');

    if (helpIcon) {
        e.preventDefault();
        e.stopPropagation();

        const tooltipId = helpIcon.dataset.tooltip;

        // Close if clicking same icon
        if (activeTooltip && activeTooltip.dataset.tooltipId === tooltipId) {
            closeActiveTooltip();
            return;
        }

        // Close previous tooltip
        if (activeTooltip) {
            closeActiveTooltip();
        }

        loadAndShowTooltip(helpIcon, tooltipId);
    } else if (activeTooltip && !e.target.closest('.help-tooltip')) {
        // Close tooltip when clicking outside
        closeActiveTooltip();
    }
}

/**
 * Fetch help definitions for the wizard if not yet loaded, then show the tooltip
 */
async function loadAndShowTooltip(helpIcon, tooltipId) {
    const wizardId = getWizardId();
    if (!wizardId) {
        console.warn('No data-wizard-id found on form — cannot load help');
        return;
    }

    if (!helpCache.has(wizardId)) {
        const loaded = await fetchHelpDefinitions(wizardId);
        if (!loaded) return;
    }

    showTooltip(helpIcon, tooltipId);
}

/**
 * Read wizard ID from the form element
 */
function getWizardId() {
    return document.querySelector('form[data-wizard-id]')?.dataset.wizardId ?? null;
}

/**
 * Fetch help HTML from the API and inject it as a hidden container into the DOM
 */
async function fetchHelpDefinitions(wizardId) {
    try {
        const response = await fetch(`/api/help/${encodeURIComponent(wizardId)}`);
        if (!response.ok) {
            console.warn(`Failed to load help content for wizard: ${wizardId} (${response.status})`);
            return false;
        }
        const html = await response.text();
        const container = document.createElement('div');
        container.className = 'tooltip-definitions-cache';
        container.style.display = 'none';
        container.innerHTML = html;
        document.body.appendChild(container);
        helpCache.set(wizardId, true);
        return true;
    } catch (err) {
        console.warn('Error loading help definitions:', err);
        return false;
    }
}

/**
 * Show tooltip for the given icon and tooltip ID
 */
function showTooltip(iconElement, tooltipId) {
    // Search through all tooltip-definitions containers (cached and legacy)
    const tooltipDefinitions = document.querySelectorAll('.tooltip-definitions, .tooltip-definitions-cache');
    let definition = null;

    for (const container of tooltipDefinitions) {
        definition = container.querySelector(`[data-tooltip-id="${tooltipId}"]`);
        if (definition) {
            break;
        }
    }

    if (!definition) {
        console.warn(`Tooltip definition not found: ${tooltipId}`);
        return;
    }

    // Create tooltip element
    const tooltip = document.createElement('div');
    tooltip.className = 'help-tooltip';
    tooltip.dataset.tooltipId = tooltipId;
    tooltip.innerHTML = definition.innerHTML;

    // Add close button for mobile
    const closeBtn = document.createElement('button');
    closeBtn.className = 'help-tooltip-close';
    closeBtn.innerHTML = '×';
    closeBtn.onclick = closeActiveTooltip;
    tooltip.appendChild(closeBtn);

    document.body.appendChild(tooltip);

    // Position tooltip
    positionTooltip(tooltip, iconElement);

    // Show tooltip
    requestAnimationFrame(() => {
        tooltip.classList.add('show');
    });

    activeTooltip = tooltip;
}

/**
 * Position tooltip relative to icon
 */
function positionTooltip(tooltip, iconElement) {
    const iconRect = iconElement.getBoundingClientRect();

    // Check if mobile
    if (window.innerWidth <= 768) {
        // Center on mobile
        return;
    }

    // Get tooltip dimensions after it's in the DOM
    const tooltipRect = tooltip.getBoundingClientRect();
    const tooltipHeight = tooltipRect.height;
    const tooltipWidth = tooltipRect.width;

    // Calculate initial position (below the icon)
    let top = iconRect.bottom + window.scrollY + 10;
    let left = iconRect.left + window.scrollX;

    // Check if tooltip would go off right side
    if (left + tooltipWidth > window.innerWidth - 20) {
        left = window.innerWidth - tooltipWidth - 20;
        tooltip.classList.add('tooltip-left');
    }

    // Ensure tooltip doesn't go off left side
    if (left < 20) {
        left = 20;
    }

    // Check if tooltip would go off bottom of viewport
    const viewportBottom = window.scrollY + window.innerHeight;
    if (top + tooltipHeight > viewportBottom - 20) {
        // Position above the icon instead
        top = iconRect.top + window.scrollY - tooltipHeight - 10;
        tooltip.classList.add('tooltip-bottom');

        // If still off screen at top, just position at top of viewport
        if (top < window.scrollY + 20) {
            top = window.scrollY + 20;
            tooltip.classList.remove('tooltip-bottom');
        }
    }

    tooltip.style.top = `${top}px`;
    tooltip.style.left = `${left}px`;
}

/**
 * Close active tooltip
 */
function closeActiveTooltip() {
    if (activeTooltip) {
        activeTooltip.classList.remove('show');
        setTimeout(() => {
            if (activeTooltip && activeTooltip.parentNode) {
                activeTooltip.parentNode.removeChild(activeTooltip);
            }
            activeTooltip = null;
        }, 200);
    }
}

/**
 * Close all tooltips (useful when navigating away)
 */
export function closeAllTooltips() {
    closeActiveTooltip();
}
