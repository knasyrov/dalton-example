@dalton.controller 'ItemsController', ['$scope', 'growl', 'Restangular', 'Schema' , ($scope, growl, Restangular, Schema) -> 
  $scope._ = _
 
  $scope.schema = Schema

  init = ->
    Restangular.all('items').getList().then (items)-> 
      $scope.items = items
    return

  $scope.destroyItem = (item)->
    Restangular.one('items', item.id).remove().then ->
      $scope.items = _.without($scope.items, item);
      growl.success 'Элемент успешно удален'
    return

  init()
  return
]
