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

### Endpoints

#### **POST** `/userauth`

**Description**: Authenticates a user by generating an access token based on the provided username.

- **Request Body**:
  ```json
  {
    "username": "<your_username>"
  }
  ```

- **Response**:
  - Success (HTTP 200):
    ```json
    {
      "accessToken": "<generated_access_token>"
    }
    ```
  - Failure (HTTP 400):
    ```json
    "Username is required"
    ```

**Notes**:
- The `accessToken` is required for authenticating with the WebSocket `/chat` endpoint.

#### **WebSocket** `/chat`

**Description**: Establishes a WebSocket connection for real-time messaging.

- **Connection**:
  Use a WebSocket client to connect to `ws://34.60.180.123:3000/chat`.

- **Message Types**:
  - **Authentication**:
    - **Request**:
      ```json
      {
        "type": "auth",
        "accessToken": "<your_access_token>"
      }
      ```
    - **Response** (on success):
      ```json
      {
        "type": "info",
        "info": "Authenticated successfully"
      }
      ```
    - **Response** (on failure):
      ```json
      {
        "type": "error",
        "error": "Invalid access token"
      }
      ```

  - **Send Message**:
    - **Request**:
      ```json
      {
        "type": "message",
        "text": "<your_message>"
      }
      ```
    - **Broadcast to All Clients**:
      ```json
      {
        "type": "new_message",
        "message": {
          "userId": "<user_id>",
          "username": "<username>",
          "text": "<your_message>"
        }
      }
      ```

  - **Automatic Reply**:
    - Random fish-themed message sent by `fishGPT` with a delay of 4-10 seconds after a user message.
    - Example:
      ```json
      {
        "type": "new_message",
        "message": {
          "userId": "fishGPT",
          "username": "fishGPT",
          "text": "I'm hooked on this conversation!"
        }
      }
      ```

---

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


