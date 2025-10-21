<h1>{{property:title}}</h1>

<div class="onboarding-steps">
    <p>Schritt {{property:step}} von 3</p>
    
    <form method="POST" action="/onboarding.html">
        {{if:step|eq:1}}
            <h2>Persönliche Daten</h2>
            <label>Benutzername: <input type="text" name="username" required></label><br>
            <label>E-Mail: <input type="email" name="email" required></label><br>
        {{elseif:step|eq:2}}
            <h2>Unternehmensdaten</h2>
            <label>Firma: <input type="text" name="company" required></label><br>
        {{else}}
            <h2>Abschluss</h2>
            <p>Ihre Registrierung ist abgeschlossen!</p>
        {{/if}}
        
        <button type="submit">Weiter</button>
        <input type="hidden" name="_redirect" value="1">
    </form>
</div>
