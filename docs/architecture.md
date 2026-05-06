# Architecture

This document describes the structural and architectural decisions behind the ZeroEnvs ecosystem.

---

## System Overview

The system is composed of two main layers:

### 1. Central Repository (dev-templates)

Responsible for:

* Template registry (`templates.json`)
* Documentation and standards
* Template discovery
* Installation tooling

---

### 2. Template Repositories

Each template is:

* independent
* self-contained
* responsible for its own environment

---

## Repository Strategy

### Decision: Multi-Repository Architecture

Each template is hosted in its own repository.

#### Reasons:

* Independent versioning
* Decoupled maintenance
* Easier contribution
* Reduced complexity per repository

---

## Registry System

Templates are registered in:

```id="2z7o7p"
templates.json
```

Each entry contains:

* name
* repository
* description

---

## Installation Flow

1. User selects a template
2. `install.sh` reads `templates.json`
3. Repository is cloned locally
4. User runs the template’s `dev` script

---

## Container Strategy

All templates must:

* Use Docker or Docker Compose
* Encapsulate dependencies inside containers

---

## Template Contract

Templates must follow:

* Required folder structure
* Required files
* Runtime constraints

Defined in:

```id="m0smvh"
docs/template-spec.md
```

---

## Design Decisions

### No Command Standardization

Templates define their own commands.

#### Reason:

Different technologies require different workflows.

---

### Minimal Global Responsibility

The central repository does NOT:

* control template behavior
* enforce runtime logic
* manage environment lifecycle

---

### Script-Based Installation (MVP)

Initial implementation uses a shell script.

Future evolution may include:

* CLI tool

---

## Known Trade-offs

* Less uniform UX across templates
* Higher responsibility for template authors
* Potential inconsistency without validation tools

---

## Future Evolution

* Template validation tooling
* CLI improvements
* Metadata standardization
* Versioning system

---

## Contributions

Changes to architecture should be discussed via issues or pull requests.
