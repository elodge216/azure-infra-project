Install-WindowsFeature -Name Web-Server -IncludeManagementTools

$html = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Ethan Lodge | Cloud Infrastructure</title>
  <style>
    :root {
      --bg: #0f172a;
      --panel: #111827;
      --text: #e5e7eb;
      --muted: #cbd5e1;
      --accent: #38bdf8;
      --border: #1f2937;
    }

    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: Arial, Helvetica, sans-serif;
      background: var(--bg);
      color: var(--text);
      line-height: 1.6;
    }

    .container {
      max-width: 1000px;
      margin: 0 auto;
      padding: 40px 24px 60px;
    }

    .hero {
      border-bottom: 1px solid var(--border);
      padding-bottom: 24px;
      margin-bottom: 32px;
    }

    h1 {
      margin: 0 0 8px;
      font-size: 2.4rem;
      color: #ffffff;
    }

    .subtitle {
      margin: 0 0 14px;
      font-size: 1.05rem;
      color: var(--accent);
      font-weight: bold;
    }

    .github a {
      color: var(--accent);
      text-decoration: none;
      word-break: break-word;
    }

    .github a:hover {
      text-decoration: underline;
    }

    .section {
      background: var(--panel);
      border: 1px solid var(--border);
      border-radius: 12px;
      padding: 22px 24px;
      margin-bottom: 20px;
    }

    h2 {
      margin-top: 0;
      margin-bottom: 14px;
      font-size: 1.25rem;
      color: var(--accent);
    }

    h3 {
      margin: 18px 0 6px;
      font-size: 1rem;
      color: #ffffff;
    }

    p {
      margin: 0 0 12px;
      color: var(--muted);
    }

    ul {
      margin: 0;
      padding-left: 20px;
      color: var(--muted);
    }

    li {
      margin-bottom: 8px;
    }

    .skills,
    .certs {
      color: var(--muted);
    }

    .footer {
      margin-top: 28px;
      text-align: center;
      color: #94a3b8;
      font-size: 0.95rem;
    }

    @media (max-width: 700px) {
      .container {
        padding: 24px 16px 40px;
      }

      h1 {
        font-size: 2rem;
      }

      .section {
        padding: 18px;
      }
    }
  </style>
</head>
<body>
  <main class="container">
    <section class="hero">
      <h1>Ethan Lodge</h1>
      <p class="subtitle">Cloud / Infrastructure Resume Landing Page</p>
      <p class="github">
        GitHub:
        <a href="https://github.com/elodge216/azure-infra-project" target="_blank" rel="noopener noreferrer">
          https://github.com/elodge216/azure-infra-project
        </a>
      </p>
    </section>

    <section class="section">
      <h2>Professional Summary</h2>
      <p>
        IT professional with 12+ years of experience supporting enterprise environments across
        healthcare, finance, logistics and education. Recently completed a bachelor’s degree in
        Cloud Computing focused on Microsoft Azure and built hands-on experience deploying Azure
        infrastructure using Bicep and GitHub Actions. Strong foundation in systems administration,
        networking, and identity management, with a focus on transitioning into cloud and
        infrastructure roles.
      </p>
    </section>

    <section class="section">
      <h2>Technical Skills</h2>
      <p class="skills">
        Azure (AZ-104), Bicep (Infrastructure as Code), GitHub Actions (CI/CD), Virtual Networks,
        NSG, Virtual Machines, PowerShell (basic scripting), Active Directory, Exchange Online,
        Intune, Windows/Mac Support, Networking Fundamentals
      </p>
    </section>

    <section class="section">
      <h2>Cloud Infrastructure Project</h2>
      <ul>
        <li>Built and deployed modular Azure infrastructure using Bicep, including networking, storage, monitoring, and compute components</li>
        <li>Automated deployment using GitHub Actions with OIDC-based authentication (no stored Azure credentials)</li>
        <li>Provisioned a Windows virtual machine and configured IIS using Custom Script Extension to host a landing page</li>
        <li>Used parameter files to support environment-based deployments (dev/prod)</li>
      </ul>
    </section>

    <section class="section">
      <h2>Professional Experience</h2>

      <h3>UC Davis — Business Technical Support Analyst 2 (2023–Present)</h3>
      <ul>
        <li>Provide Tier 2 technical support across enterprise environment supporting both on-site and remote users</li>
        <li>Provision and manage Active Directory security groups, Exchange mailboxes, and permissions</li>
        <li>Support onboarding processes including account provisioning and equipment preparation</li>
        <li>Contributed to Intune testing, configuration and rollout initiatives</li>
        <li>Created and updated technical documentation for critical systems and configurations</li>
      </ul>

      <h3>Centene Corporation — Senior IT Support Specialist (2022–2023)</h3>
      <ul>
        <li>Resolved Tier 2 and Tier 3 technical issues in enterprise environment</li>
        <li>Supported remote users using enterprise tools such as Nexthink and remote access solutions</li>
        <li>Collaborated with cross-functional teams to resolve infrastructure and endpoint issues</li>
        <li>Improved workflows through documentation and small scripting enhancements</li>
      </ul>

      <h3>The Pasha Group — Service Desk Administrator III (2017–2022)</h3>
      <ul>
        <li>Provided Tier 1–3 support across enterprise environment, including systems and basic networking issues</li>
        <li>Managed Active Directory users, groups, and Exchange permissions</li>
        <li>Mentored junior team members and contributed to process improvements</li>
        <li>Supported remote users and on-site operations, including hardware, software, and networking</li>
      </ul>

      <h3>Additional IT Support Roles (2014–2017)</h3>
      <ul>
        <li>Supported enterprise environments in healthcare and finance sectors</li>
        <li>Performed system imaging, deployment, and troubleshooting of Windows environments</li>
        <li>Worked with Active Directory, SCCM, and endpoint management tools</li>
      </ul>
    </section>

    <section class="section">
      <h2>Certifications</h2>
      <p class="certs">
        Microsoft Azure: AZ-104, AZ-400, AZ-900 | AWS Cloud Practitioner | CompTIA A+, Network+,
        Security+, Cloud+, Project+ | ITIL 4 | LPI Linux Essentials
      </p>
    </section>

    <section class="section">
      <h2>Education</h2>
      <p>Western Governors University: Bachelor of Science, Cloud Computing - Azure Track</p>
    </section>

    <p class="footer">
      Hosted on Azure VM with IIS • Deployed with Bicep • Automated with GitHub Actions
    </p>
  </main>
</body>
</html>
"@

Set-Content -Path 'C:\inetpub\wwwroot\iisstart.htm' -Value $html