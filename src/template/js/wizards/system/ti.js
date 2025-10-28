export function setupTIConditionalFields(entryElement) {
    const tiConnectedCheck = entryElement.querySelector('.ti-connected-check');
    const tiConnectionConfig = entryElement.querySelector('.ti-connection-config');
    
    if (tiConnectedCheck && tiConnectionConfig) {
        tiConnectedCheck.addEventListener('change', function() {
            tiConnectionConfig.style.display = this.checked ? 'block' : 'none';
        });
        tiConnectionConfig.style.display = tiConnectedCheck.checked ? 'block' : 'none';
    }

    const tiKimActiveCheck = entryElement.querySelector('.ti-kim-active-check');
    const tiKimConfig = entryElement.querySelector('.ti-kim-config');
    
    if (tiKimActiveCheck && tiKimConfig) {
        tiKimActiveCheck.addEventListener('change', function() {
            tiKimConfig.style.display = this.checked ? 'block' : 'none';
        });
        tiKimConfig.style.display = tiKimActiveCheck.checked ? 'block' : 'none';
    }

    const tiErezeptActiveCheck = entryElement.querySelector('.ti-erezept-active-check');
    const tiErezeptConfig = entryElement.querySelector('.ti-erezept-config');
    
    if (tiErezeptActiveCheck && tiErezeptConfig) {
        tiErezeptActiveCheck.addEventListener('change', function() {
            tiErezeptConfig.style.display = this.checked ? 'block' : 'none';
        });
        tiErezeptConfig.style.display = tiErezeptActiveCheck.checked ? 'block' : 'none';
    }
}
