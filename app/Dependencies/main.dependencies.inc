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
        extractFileDir(getCurrentDir()) + '/app/config/config.json'
    )
);

{-----------------------------------------------
  register middleware list for application
------------------------------------------------}
container.add('appMiddlewares', TMiddlewareListFactory.create());

{-----------------------------------------------
  setup basic application request dispatcher
  which support middleware
------------------------------------------------}
container.add(
    'dispatcher',
    TDispatcherFactory.create(
        container.get('appMiddlewares') as IMiddlewareLinkList,
        container.get('router') as IRouteMatcher,
        TRequestResponseFactory.create()
    )
);
