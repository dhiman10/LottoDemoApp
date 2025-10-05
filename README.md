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
ViewModel (Business Logic & State Management)
   ↓
Manager (Coordinator / Orchestrator)
   ↓
Service Layer (Network & Data)



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

## 🧪 Testing

### Unit Tests
- Location: `LottoDemoAppUnitTestsApp/`  
- Coverage: ~90% for **ViewModels & Managers**  

**Key Test Cases:**
- `testInitialState()` – Validates initial ViewModel state  
- `testFetchAllLotteries_Success()` – Tests successful data loading  
- `testFetchAllLotteries_Failure()` – Tests error handling  
- `testFetchAllLotteries_AssignsSpiel77AndSuper6To6aus49()` – Ensures supplementary lotteries are assigned correctly  

Run all tests:
```bash
Cmd + U

### 🎯 UI Tests
- **Location:** `LottoDemoAppUITestApp/`  

**Covers the following scenarios:**
- **Loading State** → Validates that the loading indicator appears  
- **Empty State** → Tests empty state UI rendering  
- **Error State** → Checks error display and retry button functionality  
- **Content State** → Ensures lottery results render correctly  
- **Tap Interactions** → Validates tap gestures and navigation  
- **Supplementary Numbers** → Displays Spiel 77 & Super 6 correctly  

## 🧪 Test Coverage
- **Unit Tests:** ~90% code coverage for ViewModels and Managers  
- **UI Tests:** All major user flows covered  
- **Mock Services:** Complete mock implementations for testing  

---

## 📱 Widget Extension

### Features
- Small, Medium, and Large widget sizes  
- Displays latest lottery results  
- Shows jackpot amounts  
- Next draw dates  
- Auto-updates via Timeline  

### Implementation
- Uses **WidgetKit framework**  
- Shares data models with main app  
- Timeline provider for automatic updates  
- Deep linking to main app  

---

## ⚙️ Technical Decisions
1. **SwiftUI over UIKit**  
   - Modern declarative syntax  
   - Less boilerplate code  
   - Built-in state management with `@Observable`  
   - Better preview support  

2. **MVVM Architecture**  
   - Clear separation of concerns  
   - Testable business logic  
   - Easy to mock for testing  
   - Scalable for future features  

3. **Protocol-Oriented Service Layer**  
   - Enables easy mocking for tests  
   - Supports different implementations (Network, Mock, UI Test)  
   - Dependency injection friendly  

4. **Async/Await for Networking**  
   - Modern Swift concurrency  
   - Cleaner than completion handlers  
   - Better error handling  
   - Structured concurrency with `async let`  

5. **@Observable Macro (iOS 17+)**  
   - Replaces `@ObservableObject` + `@Published`  
   - Simpler syntax  
   - Better performance  
   - Automatic change tracking  

6. **Accessibility Identifiers**  
   - All interactive elements tagged  
   - Enables robust UI testing  
   - Follows Apple's accessibility guidelines  

---

## 🌐 API Integration
**Endpoints:**  
- `NetworkConstants.Endpoints.mainLotteries` → Returns: 6aus49, Eurojackpot with draw results  
- `NetworkConstants.Endpoints.additionalLotteries` → Returns: Spiel77, Super6 numbers  

**Data Flow:**  


**Error Handling:**  
- Network errors caught and displayed to user  
- Retry functionality built-in  
- Graceful degradation if one endpoint fails  

---

## ⚠️ Known Limitations
- Requires iOS 17+ (due to `@Observable` macro)  
- No offline functionality  
- Limited to German lotteries  
- No user authentication/personalization  

---

## 🔮 Future Enhancements
- Offline support (cache lottery results locally)  
- User preferences (customize favorite lotteries)  
- Notifications (push notifications for draw results)  
- Animations (smooth transitions between states)  
- Localization (multi-language support)  
- Analytics (track user engagement)  

---

## 📜 License
This project was created as a **case study for evaluation purposes**.  

---

## 👨‍💻 Author
**Dhiman Das**  

**Development Time:** Approximately 4 hours as per case study requirements  

**Key Strengths Demonstrated:**  
- Clean architecture implementation (MVVM + Manager + Service Layer)  
- Comprehensive testing strategy (Unit + UI tests)  
- Modern SwiftUI patterns (`@Observable`, async/await)  
- Production-ready code quality  
- Accessibility considerations  
- Widget extension development  


