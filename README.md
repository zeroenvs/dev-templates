# Dev Templates

A registry of Zero-Install development environments powered by containers.

---

## 🚀 Overview

Dev Templates is the central registry of the ZeroEnvs ecosystem.

It provides a curated list of development environment templates designed to eliminate setup complexity using container-based infrastructure.

---

## 🧠 Philosophy

* Zero-Install environments
* Container-first approach
* Reproducible development setups
* Minimal onboarding friction

---

## 📦 Available Templates

Templates are listed in `templates.json`.

Each template is maintained in its own repository.

---

## ⚙️ Usage

Install a template:

```bash
./scripts/install.sh <template-name> [./path/to/template.json]
```

Then:

```bash
cd <template-name>
./dev
```

---

## 🧱 How Templates Work

Each template:

* Uses Docker / Docker Compose
* Contains its own setup logic
* Provides a ready-to-use development workspace

---

## 🤝 Contributing

To add a new template:

1. Create a template repository
2. Follow the template specification
3. Submit a PR updating `templates.json`

See `CONTRIBUTING.md` for details.

---

## 📌 Status

🚧 Early stage — structure and tooling will evolve.

---

## 🔗 Part of

This repository is part of the **ZeroEnvs** ecosystem.
