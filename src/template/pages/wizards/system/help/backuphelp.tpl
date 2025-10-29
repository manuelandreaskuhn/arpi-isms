<!-- Tooltip Definitions -->
<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="backup-system">
        <strong>Backup-System</strong>
        <p>Wählen Sie die Backup-Software oder -Appliance aus, die für diesen Backup-Job verwendet wird.</p>
        <p><strong>Beispiele:</strong> Veeam Backup & Replication, Commvault, Acronis, Veritas NetBackup</p>
        <p><em>Tipp:</em> Das Backup-System muss zuvor als Komponente angelegt worden sein.</p>
    </div>
    
    <div data-tooltip-id="job-name">
        <strong>Job-Name</strong>
        <p>Ein eindeutiger, beschreibender Name für diesen Backup-Job.</p>
        <p><strong>Best Practice:</strong> Verwenden Sie einen Namen, der das Ziel und die Häufigkeit beschreibt.</p>
        <p><strong>Beispiele:</strong> "KIS-Daily-Full", "DB-Hourly-Incremental", "FileServer-Weekly"</p>
    </div>
    
    <div data-tooltip-id="backup-type">
        <strong>Backup-Typ</strong>
        <p>Die Art des Backups bestimmt, was und wie gesichert wird:</p>
        <ul>
            <li><strong>VM Image Backup:</strong> Sichert die komplette virtuelle Maschine als Abbild (Snapshot). Schnelle Wiederherstellung der gesamten VM möglich.</li>
            <li><strong>File-Level Backup:</strong> Sichert einzelne Dateien und Ordner. Ermöglicht granulare Wiederherstellung einzelner Dateien.</li>
            <li><strong>Database Backup:</strong> Spezialisiertes Backup für Datenbanken (SQL, Oracle, etc.). Berücksichtigt Datenbank-Transaktionen und Konsistenz.</li>
            <li><strong>Application Backup:</strong> Anwendungsspezifisches Backup, das den Zustand und die Daten einer Applikation sichert.</li>
            <li><strong>Bare Metal Backup:</strong> Vollständiges System-Backup inklusive Betriebssystem. Ermöglicht Wiederherstellung auf neuer Hardware.</li>
        </ul>
    </div>
    
    <div data-tooltip-id="frequency">
        <strong>Backup-Frequenz</strong>
        <p>Wie oft wird das Backup durchgeführt:</p>
        <ul>
            <li><strong>Stündlich:</strong> Für kritische Systeme mit geringem Datenverlust-Risiko (RPO < 1h)</li>
            <li><strong>Täglich:</strong> Standard für die meisten Produktivsysteme</li>
            <li><strong>Wöchentlich:</strong> Für weniger kritische oder sich selten ändernde Daten</li>
            <li><strong>Monatlich:</strong> Für Archivierungs-Backups oder Compliance-Anforderungen</li>
            <li><strong>On-Demand:</strong> Manuell ausgelöste Backups, z.B. vor System-Updates</li>
        </ul>
        <p><em>Tipp:</em> Häufigere Backups = weniger Datenverlust, aber mehr Speicherplatz und Netzwerklast.</p>
    </div>
    
    <div data-tooltip-id="backup-time">
        <strong>Backup-Zeit</strong>
        <p>Die Uhrzeit, zu der das Backup startet.</p>
        <p><strong>Best Practice:</strong> Wählen Sie eine Zeit außerhalb der Hauptgeschäftszeiten, um die Performance nicht zu beeinträchtigen.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"02:00" - Backup startet um 2 Uhr nachts</li>
            <li>"23:00-01:00" - Backup-Fenster zwischen 23 und 1 Uhr</li>
        </ul>
    </div>
    
    <div data-tooltip-id="backup-window">
        <strong>Backup-Fenster</strong>
        <p>Die maximale Zeit, die für die Durchführung des Backups zur Verfügung steht.</p>
        <p><strong>Wichtig:</strong> Das Backup sollte innerhalb dieses Zeitfensters abgeschlossen sein.</p>
        <p><strong>Beispiel:</strong> Bei einem 4-Stunden-Fenster ab 02:00 Uhr muss das Backup bis 06:00 Uhr fertig sein.</p>
        <p><em>Tipp:</em> Überwachen Sie die tatsächliche Backup-Dauer und passen Sie das Fenster bei Bedarf an.</p>
    </div>
    
    <div data-tooltip-id="backup-days">
        <strong>Backup-Tage</strong>
        <p>An welchen Tagen wird das Backup durchgeführt.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"Mo-Fr" - Montag bis Freitag (Werktags)</li>
            <li>"täglich" - Jeden Tag</li>
            <li>"So, Mi" - Sonntag und Mittwoch</li>
            <li>"1./15." - Am 1. und 15. jeden Monats</li>
        </ul>
    </div>
    
    <div data-tooltip-id="retention-info">
        <strong>Aufbewahrungsrichtlinien (Retention)</strong>
        <p>Retention bestimmt, wie lange Backup-Versionen aufbewahrt werden, bevor sie automatisch gelöscht werden.</p>
        <p><strong>Wichtig für:</strong></p>
        <ul>
            <li>Compliance-Anforderungen (z.B. 10 Jahre für Patientendaten)</li>
            <li>Speicherplatz-Management</li>
            <li>Wiederherstellung älterer Versionen</li>
        </ul>
        <p><em>Tipp:</em> Längere Retention = mehr Speicherplatz benötigt. Planen Sie entsprechend!</p>
    </div>
    
    <div data-tooltip-id="retention-daily">
        <strong>Tägliche Retention</strong>
        <p>Wie viele Tage werden die täglichen Backups aufbewahrt.</p>
        <p><strong>Typische Werte:</strong></p>
        <ul>
            <li>7 Tage - Eine Woche zurück</li>
            <li>14 Tage - Zwei Wochen</li>
            <li>30 Tage - Ein Monat</li>
        </ul>
        <p><strong>Beispiel:</strong> Bei 7 Tagen haben Sie die Backups von heute, gestern, vorgestern, usw. bis vor einer Woche.</p>
    </div>
    
    <div data-tooltip-id="retention-weekly">
        <strong>Wöchentliche Retention</strong>
        <p>Wie viele Wochen werden die wöchentlichen Backups aufbewahrt.</p>
        <p><strong>Typische Werte:</strong> 4-12 Wochen (1-3 Monate)</p>
        <p><strong>Beispiel:</strong> Bei 4 Wochen können Sie auf die letzten 4 Wochen-Backups zugreifen.</p>
    </div>
    
    <div data-tooltip-id="retention-monthly">
        <strong>Monatliche Retention</strong>
        <p>Wie viele Monate werden die monatlichen Backups aufbewahrt.</p>
        <p><strong>Typische Werte:</strong> 6-24 Monate (0.5-2 Jahre)</p>
        <p><strong>Einsatz:</strong> Für längerfristige Wiederherstellungen oder Compliance.</p>
    </div>
    
    <div data-tooltip-id="retention-yearly">
        <strong>Jährliche Retention</strong>
        <p>Wie viele Jahre werden die jährlichen Backups aufbewahrt.</p>
        <p><strong>Typische Werte:</strong> 5-10 Jahre</p>
        <p><strong>Wichtig für:</strong> Gesetzliche Aufbewahrungsfristen, besonders im Gesundheitswesen.</p>
    </div>
    
    <div data-tooltip-id="gfs-schema">
        <strong>GFS (Grandfather-Father-Son) Schema</strong>
        <p>Ein bewährtes Backup-Rotationsschema mit drei Ebenen:</p>
        <ul>
            <li><strong>Son (Sohn):</strong> Tägliche Backups</li>
            <li><strong>Father (Vater):</strong> Wöchentliche Backups</li>
            <li><strong>Grandfather (Großvater):</strong> Monatliche/Jährliche Backups</li>
        </ul>
        <p><strong>Vorteil:</strong> Optimales Verhältnis zwischen Speicherplatz und Wiederherstellungsoptionen.</p>
        <p><strong>Beispiel:</strong> 7 tägliche + 4 wöchentliche + 12 monatliche Backups</p>
    </div>
    
    <div data-tooltip-id="gfs-enabled">
        <strong>GFS aktivieren</strong>
        <p>Aktivieren Sie das GFS-Schema, wenn Sie eine strukturierte Backup-Rotation wünschen.</p>
        <p><strong>Ja:</strong> Verwende GFS-Rotation (empfohlen für Produktivsysteme)</p>
        <p><strong>Nein:</strong> Verwende einfache Retention-Regeln</p>
    </div>
    
    <div data-tooltip-id="gfs-daily">
        <strong>GFS Daily (Son)</strong>
        <p>Die "Söhne" sind die täglichen Backups.</p>
        <p><strong>Empfehlung:</strong> 7 (eine Woche zurück)</p>
        <p>Nach 7 Tagen wird das älteste tägliche Backup gelöscht, außer es wird zum "Father".</p>
    </div>
    
    <div data-tooltip-id="gfs-weekly">
        <strong>GFS Weekly (Father)</strong>
        <p>Die "Väter" sind die wöchentlichen Backups.</p>
        <p><strong>Empfehlung:</strong> 4-5 (einen Monat zurück)</p>
        <p>Meist wird das Freitags- oder Sonntags-Backup zum "Father" befördert.</p>
    </div>
    
    <div data-tooltip-id="gfs-monthly">
        <strong>GFS Monthly (Grandfather)</strong>
        <p>Die "Großväter" sind die monatlichen Backups.</p>
        <p><strong>Empfehlung:</strong> 12 (ein Jahr zurück)</p>
        <p>Meist wird das letzte Backup des Monats zum "Grandfather".</p>
    </div>
    
    <div data-tooltip-id="gfs-yearly">
        <strong>GFS Yearly</strong>
        <p>Jährliche Archiv-Backups für langfristige Aufbewahrung.</p>
        <p><strong>Empfehlung:</strong> 5-10 Jahre (abhängig von Compliance-Anforderungen)</p>
        <p><em>Im Gesundheitswesen oft 10 Jahre Pflicht!</em></p>
    </div>
    
    <div data-tooltip-id="recovery-sla">
        <strong>Recovery-Ziele (SLA)</strong>
        <p>Service Level Agreements definieren die Anforderungen an Backup und Wiederherstellung:</p>
        <p><strong>RPO:</strong> Wie viel Datenverlust ist akzeptabel?</p>
        <p><strong>RTO:</strong> Wie schnell muss das System wieder verfügbar sein?</p>
        <p><em>Diese Werte sollten mit der Geschäftsführung/Fachbereichen abgestimmt sein!</em></p>
    </div>
    
    <div data-tooltip-id="rpo">
        <strong>RPO (Recovery Point Objective)</strong>
        <p>Der <strong>maximale Datenverlust</strong>, den Ihr Unternehmen verkraften kann.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li><strong>24h RPO:</strong> Tägliches Backup ausreichend. Bis zu 24h Daten können verloren gehen.</li>
            <li><strong>4h RPO:</strong> Backup alle 4 Stunden nötig.</li>
            <li><strong>1h RPO:</strong> Stündliches Backup oder kontinuierliche Replikation.</li>
        </ul>
        <p><em>Faustregel:</em> Je kürzer der RPO, desto häufiger müssen Backups erstellt werden!</p>
    </div>
    
    <div data-tooltip-id="rto">
        <strong>RTO (Recovery Time Objective)</strong>
        <p>Die <strong>maximale Zeit</strong>, die für die Wiederherstellung zur Verfügung steht.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li><strong>4h RTO:</strong> System muss innerhalb von 4 Stunden wieder verfügbar sein.</li>
            <li><strong>24h RTO:</strong> System kann innerhalb eines Tages wiederhergestellt werden.</li>
            <li><strong>1h RTO:</strong> Sehr kritisch, schnelle Wiederherstellung erforderlich.</li>
        </ul>
        <p><em>Wichtig:</em> Testen Sie regelmäßig, ob der RTO eingehalten werden kann!</p>
    </div>
    
    <div data-tooltip-id="verification">
        <strong>Automatische Verifizierung</strong>
        <p>Prüft automatisch nach jedem Backup, ob die Daten korrekt gesichert wurden.</p>
        <p><strong>Aktiviert:</strong> Backup-System führt nach jedem Job eine Integritätsprüfung durch.</p>
        <p><strong>Methoden:</strong></p>
        <ul>
            <li>Checksummen-Prüfung</li>
            <li>Testweise Wiederherstellung einzelner Dateien</li>
            <li>Boot-Test von VM-Backups (SureBackup bei Veeam)</li>
        </ul>
        <p><em>Empfehlung:</em> Immer aktivieren! Ein nicht verifizierbares Backup ist wertlos.</p>
    </div>
    
    <div data-tooltip-id="restore-test">
        <strong>Restore-Test</strong>
        <p>Dokumentieren Sie, wann Sie das letzte Mal eine Wiederherstellung getestet haben.</p>
        <p><strong>Wichtig:</strong> Ein Backup ist nur so gut wie seine Wiederherstellbarkeit!</p>
        <p><strong>Best Practice:</strong> Mindestens quartalsweise einen vollständigen Restore-Test durchführen.</p>
        <p><em>Häufiger Fehler:</em> Man verlässt sich auf Backups, ohne sie jemals getestet zu haben!</em></p>
    </div>
    
    <div data-tooltip-id="test-frequency">
        <strong>Test-Frequenz</strong>
        <p>Wie oft führen Sie Wiederherstellungstests durch?</p>
        <p><strong>Empfohlene Frequenz nach Kritikalität:</strong></p>
        <ul>
            <li><strong>Kritisch (24/7):</strong> Monatlich</li>
            <li><strong>Hoch:</strong> Quartalsweise</li>
            <li><strong>Mittel:</strong> Halbjährlich</li>
            <li><strong>Niedrig:</strong> Jährlich</li>
        </ul>
        <p><em>Tipp:</em> Dokumentieren Sie die Ergebnisse jedes Tests!</p>
    </div>
</div>