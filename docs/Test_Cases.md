# Test Cases

## Purpose

This document defines the official test scenarios for validating the Schengen90 calculation engine.

Every algorithm change must continue to pass all test cases.

---

# Test Categories

1. Basic Calculations

2. Rolling Window

3. Planner

4. Latest Legal Exit

5. Earliest Legal Re-entry

6. Edge Cases

7. Invalid Input

8. Performance

---

# Basic Calculations

## TC-001

Description

First-time traveller.

Travel History

None

Expected

Remaining Days = 90

Days Used = 0

Trip Allowed = Yes

---

## TC-002

Description

One-day trip.

Travel History

10 Jan 2026 → 10 Jan 2026

Expected

Trip Duration = 1

Days Used = 1

Remaining Days = 89

---

## TC-003

Description

Ten-day trip.

Travel History

01 Jan 2026 → 10 Jan 2026

Expected

Duration = 10

Remaining Days = 80

---

# Rolling Window

## TC-010

Description

Exactly 90 days used.

Expected

Remaining Days = 0

Trip Allowed = No

---

## TC-011

Description

89 days used.

Expected

Remaining Days = 1

Trip Allowed = Yes

---

## TC-012

Description

Old trip leaves rolling window.

Expected

Remaining Days increase automatically.

---

# Planner

## TC-020

Description

Future trip fits entirely.

Expected

Trip Allowed = Yes

---

## TC-021

Description

Future trip exceeds limit.

Expected

Trip Allowed = No

Timeline contains Red days.

---

## TC-022

Description

Future trip exactly reaches 90 days.

Expected

Trip Allowed = Yes

Remaining Days = 0

---

# Latest Legal Exit

## TC-030

Description

User enters 10 Sept.

Expected

Latest Legal Exit correctly calculated.

---

## TC-031

Description

Latest exit occurs after older trips expire.

Expected

Algorithm continues simulation correctly.

---

# Earliest Legal Re-entry

## TC-040

Description

Traveller has exhausted allowance.

Expected

Engine returns first legal future entry date.

---

## TC-041

Description

Allowance becomes available one day later.

Expected

Correct earliest date returned.

---

# Edge Cases

## TC-050

Leap Year

Expected

29 February handled correctly.

---

## TC-051

Trip crossing calendar year.

Expected

Correct duration.

---

## TC-052

Same-day entry and exit.

Expected

Duration = 1.

---

## TC-053

Overlapping trips.

Expected

Trips normalized correctly.

---

## TC-054

Consecutive trips.

Expected

Trips merged before calculation.

---

## TC-055

Empty travel history.

Expected

90 remaining days.

---

## TC-056

Very large history (1000 trips).

Expected

Calculation completes successfully.

---

# Invalid Input

## TC-060

Exit before Entry.

Expected

Validation Error.

---

## TC-061

Missing Entry Date.

Expected

Validation Error.

---

## TC-062

Missing Exit Date (History).

Expected

Validation Error.

---

## TC-063

Impossible date.

Expected

Validation Error.

---

# Performance

## TC-070

100 trips.

Expected

Calculation under 100 ms.

---

## TC-071

1000 trips.

Expected

Calculation under 1 second.

---

