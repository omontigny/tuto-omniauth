Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

 * Deploy [Keycloak on Docker](https://www.keycloak.org/getting-started/getting-started-docker)
 * Tuto Global omniauth with Graphikart
 [tuto Graphikart](https://grafikart.fr/tutoriels/devise-omniauth-859)
 * Gem Omniauth github
 [omni-auth github](https://salmaeng71.medium.com/devise-authentication-guide-with-github-omniauth-for-rails-application-220aa52d5b82)
 * Gem Omniauth keycloak
 [omni-auth keycloak](https://github.com/ccrockett/omniauth-keycloak)

 * Keycloak [client config](https://www.keycloak.org/docs/latest/server_admin/#_clients) 
  * config devise.rb : 
```config.omniauth :keycloak_openid, "vanilla", "", client_options: { site: "http://localhost:8080/vanilla", realm: "myrealm" }, :strategy_class => OmniAuth::Strategies::KeycloakOpenId```
 
 * RubyDoc [Omniauth::Keycloak](https://www.rubydoc.info/gems/omniauth-keycloak/1.1.0)
