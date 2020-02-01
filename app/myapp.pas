(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app-middleware
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app-middleware/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit myapp;

interface

uses
    fano;

type

    TMyAppServiceProvider = class(TBasicAppServiceProvider)
    protected
        function buildAppConfig(const ctnr : IDependencyContainer) : IAppConfiguration; override;
        function buildDispatcher(
            const ctnr : IDependencyContainer;
            const routeMatcher : IRouteMatcher;
            const config : IAppConfiguration
        ) : IDispatcher; override;
    public
        procedure register(const container : IDependencyContainer); override;
    end;

    TMyAppRoutes = class(TRouteBuilder)
    public
        procedure buildRoutes(
            const container : IDependencyContainer;
            const router : IRouter
        ); override;
    end;

implementation

uses

    sysutils,

    {*! -------------------------------
        controllers factory
    ----------------------------------- *}
    HiControllerFactory,

    {*! -------------------------------
        middlewares factory
    ----------------------------------- *}
    AjaxOnlyMiddlewareFactory;

    function TMyAppServiceProvider.buildAppConfig(const ctnr : IDependencyContainer) : IAppConfiguration;
    begin
        ctnr.add(
            'config',
            TJsonFileConfigFactory.create(
                extractFileDir(getCurrentDir()) + '/app/config/config.json'
            )
        );
        result := ctnr.get('config') as IAppConfiguration;
    end;

    function TMyAppServiceProvider.buildDispatcher(
        const ctnr : IDependencyContainer;
        const routeMatcher : IRouteMatcher;
        const config : IAppConfiguration
    ) : IDispatcher;
    var dispatcherSvc : string;
    begin
        ctnr.add('appMiddlewares', TMiddlewareListFactory.create());

        dispatcherSvc := GuidToString(IDispatcher);
        ctnr.add(
            dispatcherSvc,
            TDispatcherFactory.create(
                ctnr.get('appMiddlewares') as IMiddlewareLinkList,
                routeMatcher,
                TRequestResponseFactory.create()
            )
        );
        result := ctnr.get(dispatcherSvc) as IDispatcher;
    end;

    procedure TMyAppServiceProvider.register(const container : IDependencyContainer);
    begin
        {$INCLUDE Dependencies/dependencies.inc}
    end;

    procedure TMyAppRoutes.buildRoutes(
        const container : IDependencyContainer;
        const router : IRouter
    );
    begin
        {$INCLUDE Routes/routes.inc}
    end;
end.
