import { initWizard, createSubmitHandler, toggleOnSelect } from './wizard-base.js';

const FORM_ID = 'newNetworkForm';

initWizard(FORM_ID, (form) => {
    form.addEventListener('submit', createSubmitHandler(
        FORM_ID,
        '/api/networks',
        'Netzwerk erfolgreich erstellt!',
        '/ComponentManagement.html'
    ));
    setupDHCPToggle();
});

function setupDHCPToggle() {
    toggleOnSelect('[data-name="dhcp"]', 'enabled', '#dhcp-range-field');
}