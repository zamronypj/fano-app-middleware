(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit AjaxOnlyMiddlewareFactory;

interface

uses
    fano;

type

    TAjaxOnlyMiddlewareFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    AjaxOnlyMiddleware;

    function TAjaxOnlyMiddlewareFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        result := TAjaxOnlyMiddleware.create();
    end;
end.
