# Data Model

## Overview

The application stores a user's historical Schengen trips.

Every calculation in the application is derived from these trips.

The application does not store calculated values permanently.

Calculated values are generated whenever required.

---

# Entity

Trip

| Field | Type | Stored | Notes |
|-------|------|--------|------|
| id | UUID | Yes | Unique identifier |
| entryDate | Date | Yes | First day inside Schengen |
| exitDate | Date | Yes | Last day inside Schengen |
| duration | Integer | No | Calculated |