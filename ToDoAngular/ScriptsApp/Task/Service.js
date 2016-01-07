/// <reference path=""../angular.js"">
/// <reference path=""Module.js"">
 
 
app.service('crudService', function ($http) {
 
     
    //Create new record
    this.post = function (task) {
        var request = $http({
            method: "post",
            url: "/api/Tasks/",
            data: task
        });
        return request;
    }
    //Get Single Records
    this.get = function (taskId) {
        return $http.get("/api/Tasks/" + taskId);
    }
 
    //Get All GetTasksForUser
    this.GetTasksForUser = function () {
        return $http.get("/api/Tasks");
    }
 
 
    //Update the Record
    this.put = function (taskId, task) {
        var request = $http({
            method: "put",
            url: "/api/Tasks/PutTask/" + taskId,
            data: task
        });
        return request;
    }
    //Delete the Record
    this.delete = function (taskId) {
        var request = $http({
            method: "delete",
            url: "/api/Tasks/DeleteTask/" + taskId
        });
        return request;
    }
});
 