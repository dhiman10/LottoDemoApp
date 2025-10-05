# 🎰 LottoDemoApp

A **SwiftUI-based iOS application** that displays **German lottery results** (6aus49 and Eurojackpot) with comprehensive testing coverage and widget support.  

---

## 📖 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Requirements](#requirements)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Testing](#testing)
- [Widget Extension](#widget-extension)
- [Technical Decisions](#technical-decisions)
- [API Integration](#api-integration)
- [Known Limitations](#known-limitations)
- [Future Enhancements](#future-enhancements)
- [License](#license)
- [Author](#author)

---

## 📝 Overview
This project was developed as a **case study** to demonstrate iOS development skills, focusing on:
- Clean architecture (MVVM + Service Layer)  
- Modern **SwiftUI** design patterns  
- Comprehensive **Unit + UI testing**  
- WidgetKit extension  

The app shows lottery draw results for:  
- **Lotto 6aus49** → 6 numbers from 49 + Super Number  
- **Eurojackpot** → 5 numbers from 50 + 2 Euro numbers  
- **Supplementary games** → Spiel 77 and Super 6  

---

## ✨ Features

### ✅ Must-Have
- Display lottery numbers in **ball-style UI**  
- Show **next draw dates** for each lottery  
- Show **jackpot amounts** when available  
- Loading, error, and empty states  

### 🎁 Bonus Features
- Home screen **widget** (small, medium, large)  
- Spiel 77 and Super 6 display  
- Tap-to-open functionality (deep linking)  
- Comprehensive **unit tests**  
- **UI tests** for all major flows  

---

## 🏗️ Architecture
Uses **MVVM + Service Layer**:

View (SwiftUI)
↓
ViewModel (Business Logic)
↓
Manager (Coordination)
↓
Service Layer (Network/Data)



- **View** → Handles UI & accessibility  
- **ViewModel** → State management with `@Observable`  
- **Manager** → Coordinates multiple services  
- **Service Layer** → API + Mock implementations  
- **Models** → Strongly typed data with formatting  

---

## 📦 Requirements
- iOS **17.0+**  
- Xcode **15.0+**  
- Swift **5.9+**  
- SwiftUI  

---

## 🚀 Installation

```bash
# Clone repo
git clone https://github.com/dhiman10/LottoDemoApp.git
cd LottoDemoApp

# Open in Xcode
open LottoDemoApp.xcodeproj


LottoDemoApp/
├── Component/
│   └── Root/LottoDemoAppApp.swift
├── Views/
│   ├── AngledRectangle.swift
│   ├── LotteryCardView.swift
│   ├── NumberBall.swift
│   └── LargeWidgetView.swift
├── Core/
│   ├── LotteryScreen.swift
│   └── LotteryViewModel.swift
├── Extensions/
│   └── DateFormatter+EXT.swift
├── Model/
│   ├── LotteryResponse.swift
│   └── MockData.swift
├── Services/
│   ├── Constants/NetworkConstants.swift
│   └── Service/
│       ├── LotteryService.swift
│       ├── MockLotteryService.swift
│       ├── NetworkLotteryErrors.swift
│       ├── NetworkLotteryService.swift
│       └── LotteryManager.swift
├── Assets/
├── LottoDemoAppWidgetExtension/
├── LottoDemoAppUnitTestsApp/
│   └── LotteryViewModelTests.swift
├── LottoDemoAppUITestApp/
│   └── LotteryScreenUITests.swift
└── LotteryWidget/
    ├── Provider/
    │   ├── LotteryWidgetEntry.swift
    │   └── LotteryWidgetProvider.swift
    ├── Root/LotteryWidget.swift
    └── Utilities/DateFormatter+EXT.swift


