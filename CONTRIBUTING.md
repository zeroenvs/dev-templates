# Contributing to Dev Templates

Thank you for your interest in contributing to ZeroEnvs!

---

## 📦 Adding a New Template

To register a new development environment template:

1. Create a repository following this naming convention:

```bash
    dev-template-<name>
```

2. Ensure your template follows the required structure defined in:

   docs/template-spec.md

3. Add your template to `templates.json`:

```json
{
  "name": "<template-name>",
  "repo": "<org>/dev-template-<name>",
  "description": "<short description>"
}
```

4. Open a Pull Request

---

## ✅ Requirements

Your template must:

* Use Docker or Docker Compose
* Include a `README.md`
* Include a `docker-compose.yml`
* Provide a working development environment
* Follow the required folder structure

---

## 🔍 Review Process

Templates are reviewed for:

* Structure compliance
* Clarity of documentation
* Usability
* Reproducibility

---

## 🧠 Philosophy

We prioritize:

* Simplicity
* Reproducibility
* Developer experience

---

## 📬 Questions

Open an issue if you need help or clarification.
