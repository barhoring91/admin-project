//debugger;

function generate_route() {
    var s = 'http://localhost:3000/accounts/';
    var app_key = document.getElementById("app_key").value;
    var url = s + app_key;
    document.getElementById("text").innerHTML = "wait...";

    function HttpRequest(url, callback){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var myArr = JSON.parse(xmlhttp.responseText);
                //var str = JSON.stringify(json, null, 2);
                callback(myArr);
                //debugger;
                //document.getElementById("text").innerHTML = str;
            }
        };
        xmlhttp.open("GET", url, true);
        xmlhttp.send();

    }

    HttpRequest(url, print_info)

    function print_info(arr) {
        var out = "domain: <br/>" + arr.app.domain;
        document.getElementById("text").innerHTML = out;
    }

    function all_features_hash(arr) {
        var hash = {};
        arr = arr.features;
        var i;
        for(i = 0; i < arr.length; i++) {
            hash[i] =  arr[i].name
        }
        var str = JSON.stringify(hash, null, "  ");
        document.getElementById("text").innerHTML = str;
    }

    var url_all_features = 'http://localhost:3000/features'
    HttpRequest( url_all_features, all_features_hash)

    function account_features(arr){
        debugger;
        var hash = {};
        arr = arr.features;
        var i;
        for(i = 0; i < arr.length; i++) {
            hash[arr[i].id] =  arr[i].name
        }
        var str = JSON.stringify(hash, null, "  ");
        document.getElementById("text").innerHTML = str;
    }

    var url_account_features = url + '/features';
    debugger;
    HttpRequest( url_account_features, account_features)



}