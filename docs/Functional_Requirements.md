# Functional Requirements

## Purpose

The application calculates a traveller's legal stay under the Schengen 90/180 rule.

The application must always use the official rolling 180-day calculation.

Calculations must work completely offline.

---

# User Functions

## Home Screen

The Home screen shall display:

- Days remaining today

- Current travel status

- Latest legal exit (if currently inside Schengen)

- Earliest legal re-entry (if currently outside Schengen)

- Recent travel history

## Trips

Users shall be able to:

- Add a trip

- Edit a trip

- Delete a trip

- View travel history

- Store unlimited trips

## Planner

Users shall be able to:

- Enter a future entry date.

- Optionally enter a future exit date.

- Check whether the trip is legal.

- Calculate the latest legal exit.

- Calculate remaining Schengen days.

- View a timeline of the planned stay.

## Data

The application shall:

- Store travel history locally.

- Perform calculations offline.

- Export travel history.

- Import travel history.

## Settings

The application shall provide:

- Calculation Rules

- Export Travel History

- Import Travel History

- Delete All Trips

- About


# Non-Functional Requirements

- Calculations must complete in under one second.

- Internet access must never be required.

- Personal travel history must remain on the user's device.

- The application must remain functional without creating an account.

- The application must not collect personal location data.