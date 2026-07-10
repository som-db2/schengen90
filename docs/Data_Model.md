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

---

# Business Rules

1. Entry Date must be before or equal to Exit Date.

2. Entry Day counts as a day inside Schengen.

3. Exit Day counts as a day inside Schengen.

4. Duration is always calculated.

5. Trips cannot have missing dates.

6. Trips may be displayed in different orders depending on the screen.

---

# Validation Rules

✓ Entry Date cannot be empty.

✓ Exit Date cannot be empty.

✓ Entry Date cannot be after Exit Date.

✓ Trips may overlap.

✓ Future trips are not stored here.

---

# Derived Values

The application calculates these values whenever required.

- Trip Duration

- Remaining Days

- Days Used

- Latest Legal Exit

- Earliest Re-entry

- Current Status