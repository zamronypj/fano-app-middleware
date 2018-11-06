(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app-middleware
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app-middleware/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit HiController;

interface

uses

    fano;

type

    THiController = class(TRouteHandler, IDependency)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

    function THiController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    var strName : string;
    begin
        strName := request.getParsedBodyParam('name');
        result := TJsonResponse.create(response.headers(), '{"name":"'+ strName +'"}');
    end;

end.
