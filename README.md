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

