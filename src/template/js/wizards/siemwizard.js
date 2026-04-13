import { initWizard, createSubmitHandler, toggleOnSelect } from './wizard-base.js';

const FORM_ID = 'newSIEMForm';

initWizard(FORM_ID, (form) => {
    form.addEventListener('submit', createSubmitHandler(
        FORM_ID,
        '/api/siems',
        'SIEM-System erfolgreich erstellt!',
        '/ComponentManagement.html'
    ));
    setupDistributedToggle();
});

function setupDistributedToggle() {
    toggleOnSelect(
        '[data-name="architecture"]',
        ['distributed', 'hybrid'],
        '.siem-distributed-config'
    );
}