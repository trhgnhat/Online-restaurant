
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <SCRIPT LANGUAGE="JavaScript">
            var timerID = null;
            var timerRunning = false;
            var startTime;
            var expireTime;
            var distance = 0;
            var isEnd = false;
            function end() {
                isEnd = true;
            }
            function stopclock() {
                if (timerRunning) {
                    clearInterval(timerID);
                    distance = 1000 * 60 - distance;
                }
                timerRunning = false;
            }
            function startclock() {
                if (!timerRunning) {
                    // Make sure the clock is stopped
                    expireTime = new Date().getTime() + 1000 * 60 - (distance); //= 1 minute
                    timerID = setInterval(function showtime() {
                        startTime = new Date().getTime();
                        distance = expireTime - startTime;
                        // remain days, hours, minutes, seconds
                        //var days = Math.floor(distance / (1000 * 60 * 60 * 24)); // = 1 day
                        //var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)); // = 1 hour
                        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                        document.getElementById("timer").innerHTML = "Time remaining: " + (minutes) + ":" + (seconds);
                        if (distance < 0 || isEnd) {
                            document.getElementById("timer").innerHTML = "TIME'S UP";
                            timerRunning = false;
                            changevisibility('content');
                            stopclock();
                        }
                    }, 100);// 1/10s re-run
                }
                timerRunning = true;
            }
            function changevisibility(controlId)
            {
                var control = document.getElementById(controlId);
                if (timerRunning)
                    control.style.visibility = "visible";
                else {
                    control.style.visibility = "hidden";
                    document.getElementById('showanswer').style.visibility = "visible";
                }
            }
            function getCookie(cname) {
                var name = cname + "=";
                var decodedCookie = decodeURIComponent(document.cookie);
                var ca = decodedCookie.split(';');
                for (var i = 0; i < ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) === ' ') {
                        c = c.substring(1);
                    }
                    if (c.indexOf(name) === 0) {
                        return c.substring(name.length, c.length);
                    }
                }
                return "";
            }

            function showaccount() {
                document.getElementById("fullName").innerHTML = "Full name: " + getCookie("fullName");
                document.getElementById("email").innerHTML = "Email: " + getCookie("email");
                document.getElementById("userName").innerHTML = "Username: " + getCookie("userName");
                document.getElementById("password").innerHTML = "Password: " + getCookie("password");
            }
        </SCRIPT>
    </head>
    <BODY onload="showtime(); showaccount()">
        <p id="fullName"></p>
        <p id="email"></p>
        <p id="userName"></p>
        <p id="password"></p>
        <hr>
        <button onclick="startclock(); changevisibility('content');">Start</button>
        <button onclick="stopclock()">Pause</button>
        <button onclick="end()">Finish</button>
        <p align="center"><button id="timer" align="center">
                You will have 1:00 minute to finish the questions
                <p id="timer" align="center"></p>
            </button></p>
        <hr>
        <form method="post" action="ShowAnswer.jsp" id="showanswer" style="visibility: hidden">
            <pre id="content" style="visibility: hidden">
            <h3>Answer the following questions</h3>
            Question 1: What is your name? <input type="text" name="name" /><br>
            Question 2: What is your gender? <input type="radio" name="gender" value="Female" />Female <input type="radio" name="gender" value="Male" />Male
            </pre>
            <h3 align="center">Submit your answer</h3>
            <p align="center"><input type="submit" value="Submit" /></p>
        </form>
    </BODY>
</html>
