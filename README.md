# Kiwix

<p align="center">
  <img width="146" alt="logo2" src="https://github.com/furkanfatihkok/TGY2024-Kiwix/assets/113316242/df877a8a-190e-48fe-8b09-e9b8d998dc2b">
</p>

<div align="center">
  <h1>Kiwix Project by Furkan Fatih Kök</h1>
</div>

## Table of Contents
- [Features](#features)
  - [Screenshots](#screenshots)
  - [Tech Stack](#tech-stack)
  - [Architecture](#architecture)
  - [Unit Tests](#unit-tests)
  - [UI Tests](#unit-tests)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
  - [Home Screen](#home-screen)
  - [Detail Detail](#detail-screen)
- [Known Issues](#known-issues)

  ## Features

 **Browse words:**
- Discover words to search for.
  
 **See Word Detail**
- You can learn the pronunciation of words by practicing Listening.
- You can master the types of words.
- When Core Data is applied, do not lose your past searches when restarting the application.
  

  ## Screenshots

| Image 1                | Image 2                | Image 3                |
|------------------------|------------------------|------------------------|
| ![Onboarding Screen](https://github.com/furkanfatihkok/TGY2024-Kiwix/assets/113316242/f46e158f-f8a7-4220-bf86-b2fc5e8b03c5)|![Home Scren](https://github.com/furkanfatihkok/TGY2024-Kiwix/assets/113316242/31088b06-a056-488d-a9a0-8e5a7eb2ee7f)| ![Detail Screen](https://github.com/furkanfatihkok/TGY2024-Kiwix/assets/113316242/29fd7786-8a54-4c25-a2a7-70cc8edb091f) |
| Onboarding Screen    | Home Screen    | Detail Screen  |

## Tech Stack

- **Xcode:** Version 15.3
- **Language:** Swift 5.10
- **Minimum iOS Version:** 15.0

## Architecture
![Architecture](https://github.com/furkanfatihkok/TGY2024-Kiwix/assets/113316242/eb60e354-ad81-4330-901e-14b920af54d3)

### Unit Tests

Detail Screen test is available

### UI Tests
Onboarding Screen test is available

## Getting Started

### Prerequisites

Before you begin, ensure you have the following:

- Xcode installed

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/furkanfatihkok/TGY2024-Kiwix.git
    ```

2. Open the project in Xcode:

    ```bash
    cd Kiwix
    open Kiwix.xcodeproj
    ```

3. Build and run the project.

## Usage

###  Home Screen

1. Word search is available.
2. We can see the five most recent searches.

<p align="left">
  <img src="https://github.com/furkanfatihkok/TGY2024-Kiwix/assets/113316242/31088b06-a056-488d-a9a0-8e5a7eb2ee7f" alt="Coins Screen" width="200" height="400">
</p>

---

### Detail Screen

1. You can look up types of words and their synonyms.
2. You can learn the pronunciation of words.

<p align="left">
  <img src="https://github.com/furkanfatihkok/TGY2024-Kiwix/assets/113316242/29fd7786-8a54-4c25-a2a7-70cc8edb091f" alt="Coin Detail" width="200" height="400">
</p>

---
### Known Issues
Audio improvements should be made. The audio in each data does not work.
DidSelect result not returning to background default should be improved.
