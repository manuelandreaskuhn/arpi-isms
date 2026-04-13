import { initWizard, createSubmitHandler, toggleOnSelect } from './wizard-base.js';

const FORM_ID = 'newMedicalDeviceForm';

initWizard(FORM_ID, (form) => {
    form.addEventListener('submit', createSubmitHandler(
        FORM_ID,
        '/api/medical-devices',
        'Medizingerät erfolgreich erstellt!',
        '/ComponentManagement.html'
    ));
    setupConditionalFields();
});

function setupConditionalFields() {
    toggleOnSelect('[data-name="networked"]', 'yes', '.meddevice-network-config');
    toggleOnSelect('[data-name="gateway"]', 'yes', '.meddevice-gateway-config');
}