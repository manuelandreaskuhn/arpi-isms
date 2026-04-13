import { initWizard, createSubmitHandler, toggleOnSelect } from './wizard-base.js';

const FORM_ID = 'newComServerForm';

initWizard(FORM_ID, (form) => {
    form.addEventListener('submit', createSubmitHandler(
        FORM_ID,
        '/api/communication-servers',
        'Kommunikationsserver erfolgreich erstellt!',
        '/ComponentManagement.html'
    ));
    setupHAToggle();
});

function setupHAToggle() {
    toggleOnSelect(
        '[data-name="ha"]',
        ['active-active', 'active-passive', 'cluster'],
        '.comserver-ha-config'
    );
}