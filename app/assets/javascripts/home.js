//debugger;
var h_all_features = {};
var h_account_features = {};
var disabled = {};
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('submit').onclick = generate_route;
});
function generate_route() {
    var s = 'http://localhost:3000/accounts/';
    var app_key = document.getElementById("app_key").value;
    var url = s + app_key;
    document.getElementById("text").innerHTML = "wait...";



    function HttpRequest(url, callback, method, params){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var myArr = JSON.parse(xmlhttp.responseText);
                callback(myArr);
            }
        };
        xmlhttp.open(method, url, true);
        if (method == "POST"){
            xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        }
        if (params == undefined) {
            xmlhttp.send();
        }
        else{
            xmlhttp.send(params);
        }

    }

    HttpRequest(url, print_info, "GET");

    function print_info(arr) {
        var out = "domain: <br/>" + arr.app.domain;
        document.getElementById("text").innerHTML = out;
    }

    function all_features_hash(arr) {
        arr = arr.features;
        var i;
        for(i = 0; i < arr.length; i++) {
            h_all_features[arr[i].id] =  arr[i].name
        }
        //var str = JSON.stringify(h_all_features, null, "  ");
        //document.getElementById("text").innerHTML = str;
        var url_account_features = url + '/features';
        HttpRequest(url_account_features, account_features, "GET");
    }

    var url_all_features = 'http://localhost:3000/features';
    HttpRequest( url_all_features, all_features_hash, "GET");

    function account_features(arr){
        arr = arr.features;
        var i;
        for(i = 0; i < arr.length; i++) {
            h_account_features[arr[i].id] =  arr[i].name
        }
        //var str = JSON.stringify(h_account_features, null, "  ");
        //document.getElementById("text").innerHTML = str;
        disabled = {};
        hashSubstruction(h_all_features,h_account_features);
        //var str = JSON.stringify(disabled, null, "  ");
        //document.getElementById("text").innerHTML = str;
    }



    function hashSubstruction(h1, h2){
        for (var id in h1){
            if(!(id in h2)){
                disabled[id] = h1[id];
            }
        }
        //print_table(h_account_features,print_table(disabled));
        print_enabled_disabled(h_account_features, disabled);

    }

    function disable_feature(){
        id = this.id.substring(1);
        url_delete = url +"/features/"+id;
        HttpRequest(url_delete, remove_from_list,"DELETE");
    }

    function enable_feature(){
        id = this.id.substring(1);
        url_add_f = url +"/features/";
        params = "feature_id="+id;
        HttpRequest(url_add_f, remove_from_list,"POST", params);

    }

    function remove_from_list(res){
        document.getElementById(res.method[0]+""+res.id+"tr").remove();
        add_feature_to_list(res.id, res.method);
    }

    function add_feature_to_list(id, table_name){
        debugger;
        var table = document.getElementById(table_name);
        var other_table = "Enable";
        if(table_name == "Enabled") {
            other_table = "Disable";
        }
        var row = table.insertRow(1);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        cell1.innerHTML = h_all_features[id];
        var idname = other_table[0]+id;
        row.id = idname+"tr";
        cell2.innerHTML = "<input type=\"submit\" id="+idname+" value="+other_table+">";
        var method = disable_feature;
        if(other_table == "Enable"){
            method = enable_feature;
        }
        document.getElementById(idname).onclick = method;
    }

    function add_to_list(id){
        document.getElementById("Enabled");
    }

    function print_enabled_disabled(enabled, disabled){

        print_table(enabled,"Enabled",print_table(disabled,"Disabled"));

    }

    function print_table(hash,table_name){
        t = document.getElementById(table_name);
        var other_table = "Enable";
        if(table_name == "Enabled") {
            other_table = "Disable";
        }
        var content = "<tr><td>"+table_name+"</td></tr>";
        for (var id in hash){
            var idname = other_table[0] + id;
            content+= "<tr id="+other_table[0]+id+"tr"+"><td>"+hash[id]+"</td>" +
                "<td><input type=\"submit\" id="+idname+" value="+other_table+"></td></tr>";


        }
        var method = disable_feature;
        if (table_name == "Disabled"){
            method = enable_feature;
        }

        t.innerHTML = content;
        for (var id in hash){
            idname =  other_table[0] + id;
            document.getElementById(idname).onclick = method;

        }

    }









}