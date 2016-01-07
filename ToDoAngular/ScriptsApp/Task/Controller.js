/// <reference path=""../angular.js"">


/// <reference path=""Module.js"">

//The controller is having 'crudService' dependency.
//This controller makes call to methods from the service 
app.controller('crudController', function ($scope, crudService) {

    $scope.IsNewRecord = 1; //The flag for the new record

    loadRecords();

    function loadRecords() {
        var promiseGet = crudService.GetTasksForUser(); //The MEthod Call from service

        promiseGet.then(function (pl) { $scope.Tasks = pl.data },
              function (errorPl) {
                  $log.error('failure loading tasks', errorPl);
              });
    }

    $scope.save = function () {
        var Task = {
            TaskId: $scope.TaskId,
            Name: $scope.Name,
            DateAdd: $scope.DateAdd,
            UserAddId: $scope.UserAddId,
            UserId: $scope.UserId,
            Done: $scope.Done
        };

        //If the flag is 1 the it si new record
        if ($scope.IsNewRecord === 1) {
            var promisePost = crudService.post(Task);
            promisePost.then(function (pl) {
                $scope.TaskId = pl.data.TaskId;
                loadRecords();
            }, function (err) {
                console.log("Err" + err);
            });
        } else { //Else Edit the record
            var promisePut = crudService.put($scope.TaskId, Task);
            promisePut.then(function (pl) {
                $scope.Message = "Updated Successfuly";
                loadRecords();
            }, function (err) {
                console.log("Err" + err);
            });
        }



    };

    //Method to Delete
    $scope.delete = function () {
        var promiseDelete = crudService.delete($scope.TaskId);
        promiseDelete.then(function (pl) {
            $scope.Message = "Deleted Successfuly";
            $scope.TaskId = 0;
            $scope.Name = "";
            $scope.DateAdd = "";
            $scope.UserAddId = 0;
            $scope.UserId = 0;
            $scope.Done = false;
            loadRecords();
        }, function (err) {
            console.log("Err" + err);
        });
    }

    //Method to Get Single Employee based on EmpNo
    $scope.get = function (task) {
        var promiseGetSingle = crudService.get(task.TaskId);

        promiseGetSingle.then(function (pl) {
            var res = pl.data;
            $scope.TaskId = res.TaskId;
            $scope.Name = res.Name;
            $scope.DateAdd = res.DateAdd;
            $scope.UserAddId = res.UserAddId;
            $scope.UserId = res.UserId;
            $scope.Done = res.Done;

            $scope.IsNewRecord = 0;
        },
                  function (errorPl) {
                      console.log('failure loading Employee', errorPl);
                  });
    }
    //Clear the Scopr models
    $scope.clear = function () {
        $scope.IsNewRecord = 1;
        $scope.TaskId = 0;
        $scope.EmpName = "";
        $scope.Name = 0;
        $scope.DateAdd = "";
        $scope.UserAddId = 0;
        $scope.UserId = 0;
        $scope.Done = false;
    }
});