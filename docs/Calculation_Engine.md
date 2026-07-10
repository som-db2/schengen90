# Calculation Engine

## Purpose

The Calculation Engine is responsible for performing every Schengen stay calculation within the application.

It is the single source of truth for all calculations.

All screens in the application must use this engine.

The engine shall never depend on the user interface.

---

# Responsibilities

The Calculation Engine shall:

- Calculate remaining Schengen days.
- Calculate total days used.
- Calculate trip duration.
- Validate proposed trips.
- Calculate the latest legal exit date.
- Calculate the earliest legal re-entry date.
- Simulate future travel.
- Ignore trips outside the required rolling window.

---

# Inputs

The engine accepts:

- Historical trips
- Proposed entry date
- Proposed exit date (optional)
- Current date

---

# Outputs

The engine returns:

- Remaining Schengen days
- Days used
- Trip duration
- Trip validity
- Latest legal exit
- Earliest legal re-entry
- Daily timeline status

---

# Core Rules

1. Entry day counts as one day.

2. Exit day counts as one day.

3. Maximum stay is 90 days within any rolling 180-day period.

4. Every calculation uses a rolling 180-day window.

5. Future trips do not modify historical travel data.

6. The calculation must always be deterministic.

7. Time zones must not affect calculations.

8. Leap years shall be handled automatically.

---

# Validation Rules

The engine shall reject:

- Missing entry dates.
- Missing exit dates (except planner mode).
- Exit before entry.
- Impossible calendar dates.
- Duplicate trip identifiers.

The engine shall allow:

- Consecutive trips.
- Overlapping trips.

---

# Trip Normalization

Before performing any calculation:

- Sort trips by entry date.
- Merge overlapping trips.
- Merge directly consecutive trips.
- Remove duplicate trips.

The calculation always operates on normalized travel history.

---

# Calculation Modes

The engine supports:

## Current Status

Calculates today's remaining allowance.

## Future Planning

Simulates a proposed future trip.

## Validation

Checks whether a proposed trip is legal.

## Latest Exit

Determines the latest legal departure date for a proposed entry.

## Earliest Re-entry

Determines the earliest future date on which travel becomes legal again.

---

# Error Handling

The engine shall return descriptive errors.

Examples:

- Entry date is required.
- Exit date must not precede entry date.
- Invalid calendar date.
- Travel history is empty.

---

# Performance

The engine should:

- Handle at least 1,000 trips.
- Complete calculations in under one second.
- Produce identical results for identical inputs.