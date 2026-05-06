# Template Specification

This document defines the **minimum requirements and structure** for development environment templates in the ZeroEnvs ecosystem.

The goal is to ensure **consistency, usability, and reproducibility**, while preserving **full implementation freedom** for template authors.

---

## Core Principles

Templates must follow these principles:

* **Zero-Install**: No local dependencies beyond Docker
* **Container-Based**: Environments must run inside containers
* **Self-Contained**: All required configuration is included
* **Reproducible**: Same setup should work across machines
* **Simple to Use**: Minimal steps to get started

---

## Required Structure

Each template repository must follow this structure:

```
<template-root>/
│
├── README.md
├── CONTRIBUTING.md
├── docker-compose.yml
├── dev.sh
│
├── docs/
│   └── ARCHITECTURE.md
│
├── project/
│
├── image/
│   ├── <service-name>/
│   │   └── Dockerfile
│
└── scripts/ (optional)
```

---

## Required Components

### 1. README.md

Must include:

* Description of the environment
* Requirements (e.g., Docker version)
* Usage instructions
* How to start the environment
* Any known limitations

---

### 2. docker-compose.yml

* Must define the environment services
* Must be functional and runnable
* Must use images defined in the `image/` directory or official images

---

### 3. dev (Main Script)

* Acts as the primary interface for using the template
* Must be executable
* Must simplify environment usage

⚠️ Command structure is **not standardized globally**
Templates are free to define their own commands and workflows

---

### 4. project/

* Represents the developer workspace
* Must be used as the working directory inside the container
* Should be mounted as a volume

---

### 5. image/

* Contains Dockerfiles used by the template
* Organized by service name

Example:

```
image/
  app/
    Dockerfile
  db/
    Dockerfile
```

---

### 6. docs/ARCHITECTURE.md

Must describe:

* Technical decisions
* Architecture overview
* Trade-offs
* Known limitations

---

### 7. CONTRIBUTING.md

Defines:

* How to contribute to the template
* Development workflow
* Any template-specific rules

---

## Optional Components

### scripts/

* Auxiliary scripts used internally by the template
* Must NOT be required for basic usage
* All essential functionality must be accessible via `dev`

---

## Runtime Requirements

Templates must:

* Run using Docker or Docker Compose
* Be executable on a clean system with Docker installed
* Avoid requiring global dependencies outside containers

---

## Usability Requirements

A valid template must allow a user to:

1. Clone the repository
2. Run the environment using documented instructions
3. Start development inside the `project/` directory

---

## Validation Criteria

Templates may be rejected if they:

* Do not follow the required structure
* Are not runnable
* Lack documentation
* Require manual setup outside containers
* Are overly complex without justification

---

## Design Philosophy

Templates are:

> **Independent, self-contained development environments with a shared structural contract.**

We intentionally avoid over-standardizing behavior to allow:

* Flexibility across technologies
* Custom workflows
* Different levels of complexity

---

## Future Considerations

This specification may evolve to include:

* Automated validation tools
* Template versioning
* Metadata standardization
* CLI integration

---

## Questions

If you have questions or need clarification, open an issue in the central repository.