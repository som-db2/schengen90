# Schengen90 - Calculation Engine Specification

## Purpose

This document defines the business rules used by the Schengen90 calculation engine.

The implementation must always follow this specification.

---

# Rule 1 - Inclusive Counting

The day of entry and the day of exit are both counted.

Example:

Entry: 10 Jan
Exit : 10 Jan

Result: 1 day

---

# Rule 2 - Rolling Window

Calculations are based on the reference date and the previous 179 calendar days.

Total window = 180 calendar days.

---

# Rule 3 - Source of Truth

Completed trips are stored permanently.

Planned trips belong to the Planner and are temporary.

---

# Rule 4 - Calendar Day Counting

A calendar day can only be counted once.

If two trips contain the same calendar day (for example, same-day exit and re-entry), that date is counted only once.

Trip records remain separate.

---

# Rule 5 - Date Normalization

All calculations ignore time-of-day.

Dates are normalized before processing.

---

# Rule 6 - Trip Ordering

Trips are sorted chronologically before calculations.

---

# Rule 7 - Validation

Entry date must be on or before exit date.

Maximum stay per trip is 90 days.

Trips cannot overlap on multiple calendar days.

Same-day exit and re-entry is permitted because duplicate calendar days are counted only once.

---

## Future Rules

(To be added as the project evolves.)