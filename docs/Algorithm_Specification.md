# Algorithm Specification

## Purpose

This document defines the exact algorithm used by Schengen90 to calculate legal stay within the Schengen Area.

The algorithm must always produce identical results for identical inputs.

The algorithm is independent of the user interface and programming language.

---

# Definitions

Trip

A continuous period spent inside the Schengen Area.

Rolling Window

The previous 180 calendar days including the day being evaluated.

Stay Day

Every calendar day physically spent inside Schengen.

Current Date

The day on which the calculation is performed.

Proposed Trip

A future trip entered by the user for planning.

---

# Overall Algorithm

1. Validate input.

2. Normalize travel history.

3. Build rolling 180-day window.

4. Count used days.

5. Determine remaining allowance.

6. Simulate future trip (if applicable).

7. Produce calculation result.

---

# Step 1 - Validate Input

Reject calculation if:

- Entry date is missing.
- Exit date precedes entry date.
- Dates are invalid.
- Trip identifier is duplicated.

---

# Step 2 - Normalize Travel History

Sort all trips by Entry Date.

Merge overlapping trips.

Merge consecutive trips.

Remove duplicated trips.

The remaining normalized trips become the official travel history.

---

# Step 3 - Build Rolling Window

For every day being evaluated:

Window Start

Current Day minus 179 days.

Window End

Current Day.

Only travel days inside this window contribute to the calculation.

---

# Step 4 - Count Used Days

For every normalized trip:

Determine the overlap between the trip and the rolling window.

Count every overlapping calendar day.

Entry and Exit days are both counted.

Sum every counted day.

Result = Used Days.

---

# Step 5 - Remaining Days

Remaining Days

=

90

minus

Used Days

Remaining Days cannot exceed 90.

Remaining Days cannot be negative.

---

# Step 6 - Future Planning

Create a temporary proposed trip.

Do not modify historical trips.

For every day of the proposed trip:

Recalculate the rolling window.

Determine:

- Days Used

- Remaining Days

- Legal Status

The temporary trip is discarded after the calculation.

---

# Step 7 - Latest Legal Exit

Starting from the proposed Entry Date:

Evaluate one calendar day at a time.

Continue until Remaining Days becomes negative.

The previous day becomes the Latest Legal Exit.

---

# Step 8 - Earliest Legal Re-entry

Starting from today:

Evaluate each future day.

The first day with Remaining Days greater than zero becomes the Earliest Legal Re-entry.

---

# Timeline Status

For every day in the proposed trip:

Green

Trip is fully legal.

Yellow

Less than 10 remaining days.

Red

Trip exceeds the legal allowance.

---

# Result

The algorithm returns:

Remaining Days

Days Used

Trip Duration

Trip Valid

Latest Legal Exit

Earliest Legal Re-entry

Timeline Status

---

# Edge Cases

Handle:

Leap Years

Same-day Entry and Exit

Trips Crossing Calendar Years

Overlapping Trips

Consecutive Trips

Very Large Travel Histories

Empty Travel History

Future-only Planning

---

# Performance Goal

Typical calculation:

Less than 100 milliseconds.

Worst case:

Less than one second.