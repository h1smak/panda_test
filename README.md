# Chat App

A Flutter-based chat application with Clean Architecture principles. This project demonstrates user authentication via REST API and real-time messaging using WebSocket.

## Getting Started

This project is a starting point for a modular and scalable chat application in Flutter.

### Installation

1. Clone the repository:

   ```bash
   git clone <repository_url>
   cd <repository_folder>
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the application:

   ```bash
   flutter run
   ```

## Backend Server

The backend server is built using Node.js with the following features:

- **Authentication**: Provides a REST endpoint for user authentication.
- **WebSocket Communication**: Handles real-time chat messages.
- **Auto-Replies**: Simulates a chatbot ("fishGPT") that responds with random messages after a delay.

### Running the Server

1. Install Node.js and npm if not already installed.

2. Navigate to the server folder and install dependencies:

   ```bash
   npm install
   ```

3. Start the server:

   ```bash
   node server.js
   ```

4. The server will run on `http://localhost:3000` by default.

## Features

- **User Authentication**: Log in with a username authenticated via REST API.
- **Real-time Messaging**: Send and receive messages instantly using WebSocket.
- **Clean Architecture**: Organized codebase ensuring modularity and scalability.
- **State Management**: Leveraging `ChangeNotifier` and `Provider` for efficient UI updates.


