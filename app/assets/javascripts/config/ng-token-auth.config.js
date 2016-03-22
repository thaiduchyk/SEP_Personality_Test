angular.module('ng-token-auth.config', ['ng-token-auth'])
.config(function($authProvider) {
  $authProvider.configure({
    apiUrl: 'http://localhost:3000',
    emailSignInPath: '/api/v1/auth/sign_in',
    tokenValidationPath: '/api/v1/auth/validate_token',
    signOutUrl: '/api/v1/auth/sign_out',
    authProviderPaths: {
      facebook: '/api/v1/auth/facebook',
      linkedin: '/api/v1/auth/linkedin'
    }
  });
});
