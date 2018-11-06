(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app-middleware
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app-middleware/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)

{-----------------------------------------------
  register application configuration
------------------------------------------------}
container.add(
    'config',
    TJsonFileConfigFactory.create(
        extractFileDir(getCurrentDir()) + '/config/config.json'
    )
);

{-----------------------------------------------
  register middleware list for application
------------------------------------------------}
container.add('appMiddlewares', TMiddlewareCollectionAwareFactory.create());

{-----------------------------------------------
  register middleware list for each routes
  need to be use factory so each route will have
  different middleware list
------------------------------------------------}
container.factory('routeMiddlewares', TMiddlewareCollectionAwareFactory.create());

{-----------------------------------------------
  register simple application router that match
  exact placeholder (without regex)
------------------------------------------------}
container.add('router', TSimpleRouteCollectionFactory.create());

{-----------------------------------------------
  setup basic application request dispatcher
  which support middleware
------------------------------------------------}
container.add(
    'dispatcher',
    TDispatcherFactory.create(
        container.get('appMiddlewares') as IMiddlewareCollectionAware,
        container.get('router') as IRouteMatcher
    )
);
