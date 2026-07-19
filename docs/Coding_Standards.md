# Coding Standards

## Purpose

This document defines the coding conventions used throughout the Schengen90 project.

Following consistent standards improves readability, maintainability and reduces development errors.

---

# General Principles

The codebase should always be:

- Simple
- Readable
- Predictable
- Testable
- Reusable

Readability is preferred over clever code.

---

# Swift Version

Swift 6+

SwiftUI

SwiftData

MVVM Architecture

---

# File Naming

Each file shall contain one primary type.

Examples

Trip.swift

TripService.swift

HomeView.swift

PlannerViewModel.swift

TimelineGenerator.swift

---

# Type Naming

Types use PascalCase.

Examples

Trip

CalculationRequest

CalculationResult

TripService

PlannerViewModel

---

# Variable Naming

Variables use camelCase.

Examples

entryDate

exitDate

remainingDays

latestLegalExit

---

# Function Naming

Functions describe an action.

Examples

calculateRemainingDays()

calculateLatestExit()

validateTrip()

normalizeTrips()

mergeTrips()

---

# Boolean Naming

Booleans should read naturally.

Examples

isValid

isAllowed

hasRemainingDays

isInsideSchengen

Avoid names like

valid

allowed

flag

---

# Constants

Constants use camelCase.

Examples

maximumStayDays

rollingWindowDays

warningThreshold

---

# Magic Numbers

Magic numbers are not allowed.

Instead of

90

Use

maximumStayDays

Instead of

180

Use

rollingWindowDays

---

# Access Control

Default to the most restrictive access level.

Prefer:

private

private(set)

internal

Use public only when necessary.

---

# Comments

Code should explain "why", not "what".

Avoid obvious comments.

Bad

// Increment i

i += 1

Good

// Entry and exit days both count under Schengen rules.

---

# Documentation

Public types and functions should include Swift documentation comments.

Example

/// Calculates remaining Schengen days.

---

# Error Handling

Use descriptive errors.

Avoid returning nil for validation failures.

Prefer:

InvalidEntryDate

ExitBeforeEntry

DuplicateTrip

---

# Date Handling

Always use Date.

Never store dates as Strings.

Formatting belongs only in the UI layer.

---

# Calculations

Business logic belongs only inside the Calculation Engine.

Views must never calculate.

ViewModels must never calculate.

---

# SwiftUI

Views should remain lightweight.

Views display data.

ViewModels prepare data.

Services coordinate work.

---

# SwiftData

Only persistent data is stored.

Derived values are never stored.

Examples

Stored

Entry Date

Exit Date

Not Stored

Duration

Remaining Days

Latest Exit

---

# Testing

Every business logic component must have unit tests.

Every bug fixed should receive a regression test.

---

# Formatting

Indentation

4 spaces

Maximum Line Length

120 characters

Blank Line

Separate logical blocks with one blank line.

---

# Dependencies

Allowed

View

↓

ViewModel

↓

Service

↓

Calculation Engine

↓

Storage

Not Allowed

Calculation Engine

↓

SwiftUI

---

# Git Commits

Use clear commit messages.

Examples

Add Trip model

Implement trip normalization

Create planner calculation engine

Fix leap year calculation

Avoid messages like

Update

Changes

Fix

---

# Pull Request Rule

No feature is considered complete until:

Documentation updated

Unit tests added

Code reviewed

---

# Project Philosophy

The application prioritises:

Accuracy

Simplicity

Privacy

Offline capability

Maintainability

Every new feature should support these principles.