(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app-middleware
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app-middleware/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit AjaxOnlyMiddleware;

interface

uses

    fano;

type

    (*!------------------------------------------------
     * middleware implementation that pass request if coming
     * from ajax request. Otherwise it blocks request
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-------------------------------------------------*)
    TAjaxOnlyMiddleware = class(TInterfacedObject, IMiddleware, IDependency)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader;
            const next : IRequestHandler
        ) : IResponse;
    end;

implementation

    function TAjaxOnlyMiddleware.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader;
        const next : IRequestHandler
    ) : IResponse;
    begin
        if (not request.isXhr()) then
        begin
            response.headers().setHeader('Status', '403 Not Ajax Request');
            result := response;
        end else
        begin
            result := next.handleRequest(request, response, args);
        end;
    end;

end.
