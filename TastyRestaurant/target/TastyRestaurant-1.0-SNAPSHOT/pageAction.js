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
        document.getElementById("adminLoginAnnouncement").innerHTML = "Username or Password invalid";
        return false;
    }
}
function checkAll(checkAll, id) {
    var checkboxes = document.getElementsByName(id);
    for (var i = 0, n = checkboxes.length; i < n; i++) {
        checkboxes[i].checked = checkAll.checked;
    }
}
function confirmation(field) {
    if (confirm("Do you wish to delete " + field + "(s)?")) {
        return true;
    } else {
        return false;
    }
}
previewFile();