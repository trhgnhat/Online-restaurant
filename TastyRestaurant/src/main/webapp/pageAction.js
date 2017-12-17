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
}

function closeRegisterForm() {
    document.getElementById("registerForm").style.height = "0%";
}

function showMenu(target)  {  
    var tabContents = document.getElementsByClassName("tabContent");
    var targets = document.getElementById(target);
    var isVisible = targets.style.display == "block";
    
    //hide all
    for (var i=0; i<tabContents.length; i++){
        tabContents[i].style.display = "none";
    }
    
    //toggle current
    targets.style.display = isVisible ? "none" : "block";
    return false;
}
