angular.module('ng-token-auth.config', ['ng-token-auth'])
.config(function($authProvider) {
  $authProvider.configure({
    apiUrl: 'http://localhost:3000',
    authProviderPaths: {
      facebook: '/api/v1/auth/facebook',
      linkedin: '/api/v1/auth/linkedin'
    }
  });
});
