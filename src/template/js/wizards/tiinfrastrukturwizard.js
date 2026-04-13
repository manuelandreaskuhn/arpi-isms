import { initWizard, createSubmitHandler, toggleOnSelect } from './wizard-base.js';

const FORM_ID = 'newTIInfrastructureForm';

initWizard(FORM_ID, (form) => {
    form.addEventListener('submit', createSubmitHandler(
        FORM_ID,
        '/api/ti-infrastructures',
        'TI-Infrastruktur erfolgreich erstellt!',
        '/ComponentManagement.html'
    ));
    setupKonfigurationToggle();
});

function setupKonfigurationToggle() {
    toggleOnSelect(
        '[data-name="konfiguration"]',
        ['redundant', 'cluster'],
        '.ti-redundant-config'
    );
}