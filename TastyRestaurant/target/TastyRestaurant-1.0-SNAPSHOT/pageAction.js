/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**************************
 * * * Register Form * * *
 **************************/

function openRegisterForm() {
    document.getElementById("registerForm").style.height = "70%";
    checkTerm();
}

function closeRegisterForm() {
    document.getElementById("registerForm").style.height = "0%";
}

function showMenu(target) {
    var tabContents = document.getElementsByClassName("tabContent");
    var targets = document.getElementById(target);
    var isVisible = targets.style.display == "block";

    //hide all
    for (var i = 0; i < tabContents.length; i++) {
        tabContents[i].style.display = "none";
    }

    //toggle current
    targets.style.display = isVisible ? "none" : "block";
    return false;
}

function previewImg() {
    var preview = document.querySelector('img');//Select the query named img
    var file = document.querySelector('input[type=file]').file[0];
    var reader = new FileReader();

    reader.onloadend = function () {
        preview.src = reader.result;
    }

    if (file) {
        reader.readAsDataURL(file);
    } else {
        preview.src = "";
    }

}
function checkTerm() {
    var x = setInterval(function () {
        if (document.getElementById("termOfService").checked) {
            document.getElementById("registerBtn").disabled = false;
        } else {
            document.getElementById("registerBtn").disabled = true;
        }
    }, 1000);
}
function checkAdminLoginInput() {
    if (document.forms["admidLogin"]["username"].value === "" || document.forms["admidLogin"]["password"].value === "") {
        document.getElementById("adminLoginAnnouncement").innerHTML = "Username or Password is empty";
        return false;
    }
    if (document.forms["admidLogin"]["username"].value !== "admin" || document.forms["admidLogin"]["password"].value !== "123456") {
        document.getElementById("adminLoginAnnouncement").innerHTML = "Invalid username or password.";
        return false;
    }
}
function checkAll(checkAll, id) {
    var checkboxes = document.getElementsByName(id);
    for (var i = 0, n = checkboxes.length; i < n; i++) {
        checkboxes[i].checked = checkAll.checked;
    }
}
function confirmation(field1, field2) {

    var checkboxes = document.getElementsByName(field2);
    var isChecked = false;
    for (var i = 0, n = checkboxes.length; i < n; i++) {
        if (checkboxes[i].checked) {
            isChecked = true;
            break;
        }
    }
    if (!isChecked) {
        alert("Please choose a(n) " + field1);
        return false;
    }
    if (confirm("Do you wish to delete " + field1 + "(s)?")) {
        return true;
    } else {
        return false;
    }
}

previewFile();

function showDetail(target, targetDetailDiv) {
    var orderDetailDivs = document.getElementsByClassName(targetDetailDiv);
    var targets = document.getElementById(target);
    var isVisible = targets.style.display == "block";

    //hide all
    for (var i = 0; i < orderDetailDivs.length; i++) {
        orderDetailDivs[i].style.display = "none";
    }

    //toggle current
    targets.style.display = isVisible ? "none" : "block";
    return false;
}

function showAvailableTables() {
    if (document.getElementById("pickADate").value === "" || document.getElementById("pickATime").value === "") {
        alert("Please choose Date & Time!");
        return false;
    } else {
        return true;
    }
}

function chooseOrderTime(time, table) {
    if (time.value !== "all") {
        var x = document.getElementById(table).rows;
        for (var i = 1; i < x.length; i++) {
            x[i].style.display = "none";
        }
        var selected = document.getElementsByName(time.value);
        for (var i = 0, n = selected.length; i < n; i++) {
            selected[i].style.display = "";
        }
    } else {
        var x = document.getElementById(table).rows;
        for (var i = 0; i < x.length; i++) {
            x[i].style.display = "";
        }
    }
}
function checkSelection(selection, field) {
    var radios = document.getElementsByName(selection);
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            return true;
        }
    }
    alert("Please choose a " + field);
    return false;
}
function changeAccountDetail() {
    if (document.getElementById("inputPresentPassword").value === "" || document.getElementById("inputPresentPassword").value !== document.getElementById("presentPassword").value) {
        alert("Please enter the correct password!");
        return false;
    }
    if (document.getElementById("newPassword").value !== "") {
        if (document.getElementById("newPassword").value !== document.getElementById("confirmPassword").value) {
            alert("Please enter the correct confirm password!");
            return false;
        }
    }
    return true;
}
function checkConfirmationPassword(password, confirmPassword) {
    if (document.getElementById(password).value !== document.getElementById(confirmPassword).value) {
        alert("Please enter the correct confirm password!");
        return false;
    } else {
        return true;
    }
}
function searchBooking(date, time, table) {
    if (document.getElementById(date).value !== "") {
        var x = document.getElementById(table).rows;
        for (var i = 1; i < x.length; i++) {
            x[i].style.display = "none";
        }
        if (document.getElementById(time).value !== "") {
            //alert(document.getElementById(date).value);
            var selected_date = document.getElementsByName(document.getElementById(date).value);
            //alert(selected_date.innerHTML);
            for (var i = 0; i < selected_date.length; i++) {
                if (selected_date[i].getAttribute("value") === document.getElementById(time).value) {
                    selected_date[i].style.display = "";
                }
            }
        } else {
            var selected_date = document.getElementsByName(document.getElementById(date).value);
            for (var i = 0; i < selected_date.length; i++) {
                selected_date[i].style.display = "";
            }
        }
        return false;
    } else if (document.getElementById(date).value === "") {
        var x = document.getElementById(table).rows;
        for (var i = 0; i < x.length; i++) {
            x[i].style.display = "";
        }
        return false;
    }
    return false;
}
//AJAX reference
//https://www.youtube.com/watch?v=WJ1h0pqvBZA
<<<<<<< HEAD
function changeTableStatus(form ,action, idObj, id, methodtype) {
//    document.getElementById(form).action = "Manager?action=" + action +"&" + idObj + "=" + id;
//    document.getElementById(form).method = methodtype;
//    document.getElementById(form).submit();
    alert("ok");
    var xmlhttp;
    if (window.XMLHttpRequest) {//IE7+ and other browser
        alert("IE7+");
        xmlhttp = new XMLHttpRequest();
    }
    xmlhttp.onreadystatechange = function () {
        alert("FUNCTION");
        if (this.readyState === 4) {
            if (this.status === 200) {
                alert("4 & 200");
                document.getElementById("tableStatus" + id).innerHTML = this.responseText;
                if (this.responseText === "Available") {
                    document.getElementById("changeStatus" + id).checked = true;
                } else {
                    document.getElementById("changeStatus" + id).checked = false;
                }
            }
        }
    };
    alert("out of state change");
    var params = "action=" + action + "&" + idObj + "=" + document.getElementById(id).value;
    if (methodtype === 'POST') {
        alert("POST method");
        xmlhttp.open(methodtype, "/Manager?" + params, true);
        xmlhttp.setRequestHeader("Content-type", "application/x-ww-form-urlencoded");
        xmlhttp.send(null);
    } else if (methodtype === 'GET') {
        xmlhttp.open(methodtype, "/Controller/Manager?" + params, true);
        xmlhttp.send(null);
    } else {
        alert("else");
    }
=======


function changeTableStatus(form, action, idObj, id, methodtype) {
//    document.getElementById(form).action = "Manager?action=" + action +"&" + idObj + "=" + id;
//    document.getElementById(form).method = methodtype;
//    document.getElementById(form).submit();

    var xmlhttp;
    if (window.XMLHttpRequest) {//IE7+ and other browser
        xmlhttp = new XMLHttpRequest();
    }
    var params = "action=" + action + "&" + idObj + "=" + document.getElementById(id).value;
    alert("begin");
    xmlhttp.open(methodtype, "/Manager", true);
    alert("open");
    xmlhttp.setRequestHeader("Content-type", "application/x-ww-form-urlencoded");
    alert("set header");
    xmlhttp.onreadystatechange = listener();
    alert("state change");
    xmlhttp.send(params);
    alert("send");
//    if (methodtype === 'POST') {
//        alert("POST method");
//        xmlhttp.open(methodtype, "/Manager", true);
//        xmlhttp.setRequestHeader("Content-type", "application/x-ww-form-urlencoded");
//        xmlhttp.onreadystatechange = listener();
//        xmlhttp.send(params);
//    } else if (methodtype === 'GET') {
//        xmlhttp.open(methodtype, "/Manager?" + params, true);
//        xmlhttp.onreadystatechange = listener();
//        xmlhttp.send();
//    } else {
//        alert("else");
//    }
>>>>>>> 3ef85d08ccfbdbae450a2baf98ba0e2b9f245b45

    function listener() {
        alert("FUNCTION");
        if (xmlhttp.readyState == 4) {
            alert("4");
            if (xmlhttp.status == 200) {
                alert("4 & 200");
                document.getElementById("tableStatus" + id).innerHTML = xmlhttp.responseText;
                if (xmlhttp.responseText === "Available") {
                    document.getElementById("changeStatus" + id).checked = true;
                } else {
                    document.getElementById("changeStatus" + id).checked = false;
                }
            }
        }
    }
    ;


}
previewFile();

function validateFileType() {
    var fileName = document.getElementById("fileName").value;
    var idxDot = fileName.lastIndexOf(".") + 1;
    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
    if (extFile == "jpg" || extFile == "jpeg" || extFile == "png") {
        //TO DO
    } else {
        alert("Only jpg/jpeg and png files are allowed!");
    }
}