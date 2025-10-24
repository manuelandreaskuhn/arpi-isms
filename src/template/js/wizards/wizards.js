class CustomSelect {
    constructor(element) {
        this.element = element;
        this.name = element.dataset.name;
        this.multi = element.dataset.multi === 'true';
        this.selectedValues = this.multi ? [] : null;
        
        this.trigger = element.querySelector('.select-trigger');
        this.dropdown = element.querySelector('.select-dropdown');
        this.searchInput = element.querySelector('.select-search input');
        this.options = element.querySelectorAll('.select-option');
        
        this.init();
    }
    
    init() {
        // Toggle dropdown
        this.trigger.addEventListener('click', (e) => {
            e.stopPropagation();
            this.toggle();
        });
        
        // Search functionality
        this.searchInput?.addEventListener('input', (e) => {
            this.filterOptions(e.target.value);
        });
        
        // Option selection
        this.options.forEach(option => {
            option.addEventListener('click', (e) => {
                e.stopPropagation();
                this.selectOption(option);

                let section = this.element.closest('.form-section');
                if (section) {
                    updateSectionCounter(section);
                }
            });
        });
        
        // Close on outside click
        document.addEventListener('click', (e) => {
            if (!this.element.contains(e.target)) {
                this.close();
            }
        });
    }
    
    toggle() {
        const isActive = this.dropdown.classList.contains('active');
        this.closeAll();
        
        if (!isActive) {
            this.dropdown.classList.add('active');
            this.trigger.classList.add('active');
            this.searchInput?.focus();
        }
    }
    
    close() {
        this.dropdown.classList.remove('active');
        this.trigger.classList.remove('active');
        if (this.searchInput !== null) {
            this.searchInput.value = '';
        }
        this.filterOptions('');
    }
    
    closeAll() {
        document.querySelectorAll('.select-dropdown.active').forEach(d => {
            d.classList.remove('active');
        });
        document.querySelectorAll('.select-trigger.active').forEach(t => {
            t.classList.remove('active');
        });
    }
    
    selectOption(option) {
        const value = option.dataset.value;
        const text = option.textContent.trim();
        
        if (this.multi) {
            // Multi-select logic
            const index = this.selectedValues.findIndex(v => v.value === value);
            
            if (index > -1) {
                // Deselect
                this.selectedValues.splice(index, 1);
                option.classList.remove('selected');
            } else {
                // Select
                this.selectedValues.push({ value, text });
                option.classList.add('selected');
            }
            
            this.updateMultiDisplay();
        } else {
            // Single select logic
            this.selectedValues = value;
            
            // Update all options
            this.options.forEach(opt => opt.classList.remove('selected'));
            option.classList.add('selected');
            
            // Update display
            const displaySpan = this.trigger.querySelector('.placeholder, .value');
            if (value === '') {
                displaySpan.className = 'placeholder';
                displaySpan.textContent = 'Bitte wählen';
                option.classList.remove('selected');
            } else {
                displaySpan.className = 'value';
                displaySpan.textContent = text;
            }
            
            this.close();
        }
    }
    
    updateMultiDisplay() {
        const badgeContainer = document.querySelector(`.selected-badges[data-target="${this.name}"]`);
        badgeContainer.innerHTML = '';

        let count = this.selectedValues.length;
        let selectedText = count > 0 ? `${count} ausgewählt` : 'Bitte wählen';
        const displaySpan = this.trigger.querySelector('.placeholder, .value');
        displaySpan.className = count > 0 ? 'value' : 'placeholder';
        displaySpan.textContent = selectedText;
        displaySpan.className = count > 0 ? 'value' : 'placeholder';
        displaySpan.textContent = selectedText;

        this.selectedValues.forEach(item => {
            const badge = document.createElement('div');
            badge.className = 'badge';
            badge.dataset.value = item.value;
            badge.innerHTML = `
                ${item.text}
                <span class="badge-remove" data-value="${item.value}">×</span>
            `;
            
            badge.querySelector('.badge-remove').addEventListener('click', () => {
                this.removeValue(item.value);
            });
            
            badgeContainer.appendChild(badge);
        });
        
        // Update checkmarks in dropdown
        this.options.forEach(opt => {
            const isSelected = this.selectedValues.some(v => v.value === opt.dataset.value);
            if (isSelected) {
                opt.classList.add('selected');
                if (!opt.querySelector('.checkmark')) {
                    const check = document.createElement('span');
                    check.className = 'checkmark';
                    check.textContent = '✓';
                    opt.appendChild(check);
                }
            } else {
                opt.classList.remove('selected');
                const check = opt.querySelector('.checkmark');
                if (check) check.remove();
            }
        });
    }
    
    removeValue(value) {
        const index = this.selectedValues.findIndex(v => v.value === value);
        if (index > -1) {
            this.selectedValues.splice(index, 1);
            this.updateMultiDisplay();
        }
    }
    
    filterOptions(searchTerm) {
        const term = searchTerm.toLowerCase();
        const optionsContainer = this.element.querySelector('.select-options');
        const groups = {};
        
        this.options.forEach(option => {
            const text = option.textContent.toLowerCase();
            const value = option.dataset.value;
            const group = option.dataset.group;
            
            // Keep selected items visible OR matching search
            const isSelected = this.multi 
                ? this.selectedValues.some(v => v.value === value)
                : this.selectedValues === value;
            
            const matchesSearch = text.includes(term);
            
            if (isSelected || matchesSearch) {
                option.classList.remove('hidden');
                if (group) {
                    if (!groups[group]) groups[group] = 0;
                    groups[group]++;
                }
            } else {
                option.classList.add('hidden');
            }
        });

        // Show/hide group headers based on visible options
        const headers = optionsContainer.querySelectorAll('.select-group-header');
        headers.forEach((header, index) => {
            // Find next header or end of list
            let nextHeader = headers[index + 1];
            let visibleCount = 0;
            
            let currentElement = header.nextElementSibling;
            while (currentElement && currentElement !== nextHeader) {
                if (currentElement.classList.contains('select-option') && 
                    !currentElement.classList.contains('hidden')) {
                    visibleCount++;
                }
                currentElement = currentElement.nextElementSibling;
            }
            
            if (visibleCount === 0) {
                header.classList.add('hidden');
            } else {
                header.classList.remove('hidden');
            }
        });
    }
    
    getValue() {
        return this.multi ? this.selectedValues.map(v => v.value) : this.selectedValues;
    }
    
    reset() {
        if (this.multi) {
            this.selectedValues = [];
            this.updateMultiDisplay();
        } else {
            this.selectedValues = null;
            const displaySpan = this.trigger.querySelector('.placeholder, .value');
            displaySpan.className = 'placeholder';
            displaySpan.textContent = 'Bitte wählen';
        }
        
        this.options.forEach(opt => {
            opt.classList.remove('selected');
            const check = opt.querySelector('.checkmark');
            if (check) check.remove();
        });
    }
}

// Top-Level verfügbar machen
let customSelects = {};

function updateSectionCounter(sectionElement) {
    const sectionContent = sectionElement.querySelector('.section-content');
    const counter = sectionElement.querySelector('.section-counter');
    if (!counter || !sectionContent) return;

    let totalFields = 0;
    let filledFields = 0;

    // Text/Number/Textarea
    const textInputs = sectionContent.querySelectorAll('input[type="text"], input[type="number"], textarea');
    textInputs.forEach(input => {
        const parent = input.closest('.form-group');
        if (parent && parent.style.display === 'none') return;

        totalFields++;
        if (input.value.trim() !== '') filledFields++;
    });

    // Custom selects
    const customSelectElements = sectionContent.querySelectorAll('.custom-select');
    customSelectElements.forEach(selectEl => {
        const name = selectEl.dataset.name;
        const customSelect = customSelects[name];
        if (!customSelect) return;

        totalFields++;
        const value = customSelect.getValue();

        if (customSelect.multi) {
            if (value && value.length > 0) filledFields++;
        } else {
            if (value !== null && value !== '') filledFields++;
        }
    });

    // Checkbox-Gruppen
    const checkboxGroups = sectionContent.querySelectorAll('.checkbox-group');
    checkboxGroups.forEach(group => {
        const checkboxes = group.querySelectorAll('input[type="checkbox"]');
        if (checkboxes.length === 0) return;

        totalFields++;
        const anyChecked = Array.from(checkboxes).some(cb => cb.checked);
        if (anyChecked) filledFields++;
    });

    // Anzeige aktualisieren
    counter.textContent = `${filledFields}/${totalFields}`;
    counter.classList.remove('complete', 'partial');
    if (filledFields === totalFields && totalFields > 0) {
        counter.classList.add('complete');
    } else if (filledFields > 0) {
        counter.classList.add('partial');
    }
}

document.addEventListener('DOMContentLoaded', () => {

    // Initialize all custom selects
    customSelects = {};
    document.querySelectorAll('.custom-select').forEach(element => {
        const name = element.dataset.name;
        customSelects[name] = new CustomSelect(element);
    });

    // Section toggle functionality
    document.querySelectorAll('.section-title').forEach(title => {
        title.addEventListener('click', function(e) {
            // Don't toggle if clicking on badge or counter
            if (e.target.classList.contains('section-badge') || 
                    e.target.classList.contains('section-counter')) return;
            
            const section = this.closest('.form-section');
            section.classList.toggle('collapsed');
        });
    });

    // Initial counter update
    document.querySelectorAll('.form-section').forEach(section => {
        updateSectionCounter(section);
    });
    
    // Add event listeners to all inputs
    document.querySelectorAll('.form-section input[type="text"], .form-section input[type="number"], .form-section input[type="checkbox"], .form-section textarea').forEach(input => {
        input.addEventListener('input', function() {
            const section = this.closest('.form-section');
            if (section) {
                updateSectionCounter(section);
            }
        });
    });

});

// Export for external access
export { CustomSelect };