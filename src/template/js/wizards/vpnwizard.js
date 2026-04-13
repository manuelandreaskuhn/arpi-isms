import { initWizard, createSubmitHandler, toggleOnSelect } from './wizard-base.js';

const FORM_ID = 'newVPNForm';

initWizard(FORM_ID, (form) => {
    form.addEventListener('submit', createSubmitHandler(
        FORM_ID,
        '/api/vpns',
        'VPN-System erfolgreich erstellt!',
        '/ComponentManagement.html'
    ));
    setupGatewayToggle();
    setupSecondaryGatewayToggle();
});

function setupGatewayToggle() {
    toggleOnSelect('[data-name="gatewayid"]', 'manual', '#vpn-gateway-manual');
}

function setupSecondaryGatewayToggle() {
    toggleOnSelect('[data-name="secondarygatewayid"]', 'manual', '#secondary-gateway-manual');
}