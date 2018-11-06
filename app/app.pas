(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app-middleware
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app-middleware/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
program app;

uses
    fano,
    myapp;

var
    appInstance : IWebApplication;

begin
    appInstance := TMyApp.create(
        TDependencyContainer.create(TDependencyList.create()),
        TCGIEnvironment.create(),
        TErrorHandler.create()
    );
    appInstance.run();
end.
