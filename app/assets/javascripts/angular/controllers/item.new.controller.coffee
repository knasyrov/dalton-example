@dalton.controller 'ItemNewController', ['$scope', '$location', 'growl', 'Restangular', 'Schema' , ($scope, $location, growl, Restangular, Schema) -> 
  $scope._ = _
 
  $scope.schema = Schema
  $scope.item = {}

  init = ->
    _.each $scope.schema, (v, k) ->
      $scope.item[k] = v.default
    return

  $scope.submit = ->
    Restangular.all('items').post($scope.item).then (id)->
      $location.path('/items')
      growl.success 'Элемент успешно сохранен'      
    return

  init()
  return  
]
