@dalton = angular.module('dalton', [
  'ngRoute'
  'restangular'
  'angular-growl'
])

@dalton.config [
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'angular/home'
        controller: 'HomeController'
        title: 'Home'
      .when '/items',
        templateUrl: 'angular/items/index'
        controller: 'ItemsController'
        title: 'Items'
      .when '/items/new',
        templateUrl: 'angular/items/form'
        controller: 'ItemNewController'
        title: 'New Item'  
      .when '/items/:item_id/edit',
        templateUrl: 'angular/items/form'
        controller: 'ItemEditController'
        title: 'Edit Item'   
      .otherwise
        redirectTo: '/'
]

@dalton.config [
  'growlProvider'
  (growlProvider) ->
    growlProvider.globalTimeToLive
      success: 1000
      error: 2000
      warning: 3000
      info: 4000
    return
]


@dalton.filter 'capitalize', ->
  (input, scope) ->
    if input != null
      stringArr = input.split(' ')
      result = ''
      cap = stringArr.length
      x = 0
      while x < cap
        stringArr[x].toLowerCase()
        if x == cap - 1
          result += stringArr[x].substring(0, 1).toUpperCase() + stringArr[x].substring(1)
        else
          result += stringArr[x].substring(0, 1).toUpperCase() + stringArr[x].substring(1) + ' '
        x++
      return result
    return


@dalton.factory 'Schema', ->
  {
    age:
      type: 'number'
      default: null
    city:
      type: 'select'
      options: ['Moscow', 'Novosibirsk', 'New York']
      default: null
    profession:
      type: 'text'
      default: 'No profession'
  }

