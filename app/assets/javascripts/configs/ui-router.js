(function() {
    angular.module('app')
        .config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
        debugger;
        $stateProvider
            .state('home', {
                url: '/home',
                templateUrl: 'index.html',
                controller: 'HomeController'
                //content: {
                //    template: '<h1>hello</h1>',
                //    controller: 'homeController as homeCtrl'
                //}
            })
        $urlRouterProvider.otherwise('/home');
        //$locationProvider.html5Mode(true);

    }]);


}());

