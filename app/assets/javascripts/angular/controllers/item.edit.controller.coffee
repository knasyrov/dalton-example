@dalton.controller 'ItemEditController', ['$scope', '$routeParams', '$location', 'growl', 'Restangular', 'Schema' , ($scope, $routeParams, $location, growl, Restangular, Schema) -> 
  $scope._ = _
 
  $scope.schema = Schema
  $scope.item = {}

  init = ->
    $scope.id = $routeParams.item_id;
    Restangular.one("items", $scope.id).get().then (item)-> 
      $scope.item = item
    return

  $scope.submit = ->
    Restangular.one("items", $scope.id).customPUT(item: $scope.item.plain()).then (id)->
      $location.path('/items')
      growl.success 'Элемент успешно обновлен'
    return

  init()
  return  
]
