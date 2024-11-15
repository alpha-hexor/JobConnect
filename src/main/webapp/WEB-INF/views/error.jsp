<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danger Error Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="error.css">
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        background-color: #8b0000; /* Dark red background */
        font-family: 'Orbitron', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        overflow: hidden;
    }
    
    .danger-container {
        text-align: center;
        color: white;
        padding: 40px;
        border: 5px solid #ff0000;
        background-color: rgba(0, 0, 0, 0.8);
        box-shadow: 0 0 50px red;
        border-radius: 15px; /* Rounded corners */
        animation: danger-flash 1s infinite;
    }
    
    .warning-icon {
        font-size: 100px;
        color: #ffcc00;
        animation: blink 1s infinite;
    }
    
    .error-title {
        font-size: 60px;
        color: #ff0000;
        text-shadow: 3px 3px black;
        animation: shake 0.5s infinite;
    }
    
    .error-message {
        font-size: 24px;
        margin: 20px 0;
        animation: flicker 2s infinite;
    }
    
    .btn-return {
        display: inline-block;
        padding: 15px 30px;
        font-size: 18px;
        font-weight: bold;
        background-color: #ffcc00;
        color: #8b0000;
        text-transform: uppercase;
        text-decoration: none;
        border-radius: 30px; /* More rounded button */
        border: 3px solid #ffcc00;
        transition: all 0.2s;
    }
    
    .btn-return:hover {
        background-color: #ff0000;
        color: #fff;
        border-color: #fff;
        transform: scale(1.1);
    }
    
    @keyframes danger-flash {
        0% { box-shadow: 0 0 20px red; }
        50% { box-shadow: 0 0 80px yellow; }
        100% { box-shadow: 0 0 20px red; }
    }
    
    @keyframes blink {
        0%, 100% { opacity: 1; }
        50% { opacity: 0.3; }
    }
    
    @keyframes shake {
        0% { transform: translate(0, 0); }
        25% { transform: translate(-5px, 5px); }
        50% { transform: translate(5px, -5px); }
        75% { transform: translate(-5px, 5px); }
        100% { transform: translate(0, 0); }
    }
    
    @keyframes flicker {
        0% { opacity: 1; }
        50% { opacity: 0.6; }
        100% { opacity: 1; }
    }
</style>
<body onload="initErrorPage()">
    <div class="danger-container">
        <div class="warning-icon">
            <i class="fas fa-exclamation-triangle"></i>
        </div>
        <h1 class="error-title">DANGER! SYSTEM FAILURE</h1>
        <p class="error-message">An unexpected error has occurred. Please evacuate immediately!</p>
        <a href="/" class="btn-return">Return to Safety</a>
    </div>

    <script>
        function initErrorPage() {
            playSound();
            enterFullScreen();
        }

        function playSound() {
            var sound = document.getElementById("danger-sound");
            sound.play();
        }

        function enterFullScreen() {
            var elem = document.documentElement;
            if (elem.requestFullscreen) {
                elem.requestFullscreen();
            } else if (elem.mozRequestFullScreen) { // Firefox
                elem.mozRequestFullScreen();
            } else if (elem.webkitRequestFullscreen) { // Chrome, Safari, and Opera
                elem.webkitRequestFullscreen();
            } else if (elem.msRequestFullscreen) { // IE/Edge
                elem.msRequestFullscreen();
            }
        }
    </script>
</body>
</html>
