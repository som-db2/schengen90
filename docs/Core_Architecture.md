# Core Architecture

## Purpose

This document defines the overall architecture of the Schengen90 application.

It describes the responsibilities of each layer, the flow of information, and the interaction between components.

The architecture follows the MVVM (Model-View-ViewModel) pattern and separates the user interface from business logic.

---

# Architectural Principles

The application shall follow these principles:

- Single Responsibility Principle
- Separation of Concerns
- Offline First
- Local Data Storage
- Deterministic Calculations
- Reusable Components
- Testable Business Logic

---

# High-Level Architecture

+-----------------------+
|       SwiftUI Views   |
+-----------------------+
            |
            v
+-----------------------+
|      ViewModels       |
+-----------------------+
            |
            v
+-----------------------+
| Calculation Services  |
+-----------------------+
            |
            v
+-----------------------+
| Calculation Engine    |
+-----------------------+
            |
            v
+-----------------------+
|     SwiftData         |
+-----------------------+

---

# Layer Responsibilities

## 1. SwiftUI Views

Responsible for:

- Displaying information
- Handling user interaction
- Navigation
- Showing alerts
- Showing loading indicators

Views never perform calculations.

Views never access the database directly.

---

## 2. ViewModels

Responsible for:

- Receiving user actions
- Calling Services
- Updating UI State
- Formatting display values

ViewModels never calculate Schengen rules.

ViewModels never contain business logic.

---

## 3. Services

Responsible for:

- Coordinating application workflows
- Loading travel history
- Saving trips
- Exporting data
- Importing data

Services call the Calculation Engine.

---

## 4. Calculation Engine

Responsible for:

- Rolling 180-day calculation
- Remaining days
- Days used
- Latest legal exit
- Earliest legal re-entry
- Planner simulation
- Timeline generation

The Calculation Engine never knows anything about SwiftUI.

---

## 5. SwiftData

Responsible only for storing data.

No calculations.

No business rules.

---

# Core Models

The application contains the following models.

---

## Trip

Represents one continuous Schengen stay.

Properties

- id
- entryDate
- exitDate

Derived

- duration

---

## CalculationRequest

Represents an incoming calculation request.

Contains:

- historicalTrips
- proposedEntryDate
- proposedExitDate
- calculationMode
- currentDate

---

## CalculationResult

Returned by the Calculation Engine.

Contains:

- tripAllowed
- daysUsed
- remainingDays
- latestLegalExit
- earliestLegalReEntry
- tripDuration
- timeline

---

## TimelineDay

Represents one day in the Planner timeline.

Contains:

- date
- status

Status values

- Safe
- Warning
- Exceeded

---

## ValidationResult

Represents validation.

Contains:

- isValid
- errors

---

# Calculation Modes

The engine supports five modes.

Current Status

Calculates today's position.

Planner

Simulates a future trip.

Latest Exit

Calculates the latest legal departure.

Earliest Re-entry

Calculates the next legal entry.

Validation

Validates travel history.

---

# Data Flow

User taps button

↓

View

↓

ViewModel

↓

Service

↓

Calculation Engine

↓

CalculationResult

↓

ViewModel

↓

View

---

# Storage Strategy

Stored permanently

- Trips

Not stored

- Remaining Days
- Days Used
- Timeline
- Latest Exit
- Earliest Re-entry

These values are always recalculated.

---

# Error Handling

The application uses user-friendly errors.

Examples

- Entry date required.
- Exit date required.
- Invalid date.
- Exit before entry.
- Trip overlaps another trip.
- Travel history unavailable.

---

# Navigation

Launch

↓

Splash

↓

Home

↓

Trips

↓

Add Trip

↓

Planner

↓

Settings

↓

Calculation Rules

---

# Dependency Rules

Views

↓

ViewModels

↓

Services

↓

Calculation Engine

↓

SwiftData

Dependencies must never point upwards.

Example

Calculation Engine

cannot import

SwiftUI.

---

# Future Expansion

The architecture supports future additions including:

- Entry/Exit System (EES)
- Passport Profiles
- Multiple Travellers
- Cloud Backup
- Widgets
- Apple Watch
- macOS Version
- iPad Layout
- Live Activities

without requiring changes to the Calculation Engine.

---

# Testing Strategy

Unit Tests

- Calculation Engine
- Date Validation
- Timeline Generation

Integration Tests

- Planner
- Home Dashboard
- Trip Storage

UI Tests

- Add Trip
- Delete Trip
- Planner Workflow

---

# Security

Travel history remains on the user's device.

No account is required.

No internet connection is required.

No location tracking.

No analytics are required for calculations.

---

# Performance Goals

Application Launch

< 2 seconds

Calculation

< 100 milliseconds

Travel History

Support at least 1,000 trips.

---

# Architecture Summary

SwiftUI

↓

ViewModel

↓

Services

↓

Calculation Engine

↓

SwiftData

The user interface remains completely independent from the Schengen calculation algorithm.

The Calculation Engine remains reusable and testable independently of the application.