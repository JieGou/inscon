﻿using System.Web.Routing;

namespace BootstrapMvcSample
{
    public class ExampleLayoutsRouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
           // routes.MapNavigationRoute<HomeController>("Automatic Scaffolding", c => c.Index());

           // routes.MapNavigationRoute<ExampleLayoutsController>("Example Layouts", c => c.Starter())
           //       .AddChildRoute<ExampleLayoutsController>("Marketing", c => c.Marketing())
           //       .AddChildRoute<ExampleLayoutsController>("Fluid", c => c.Fluid())
           //       .AddChildRoute<ExampleLayoutsController>("Sign In", c => c.SignIn())
           //     ;
        }
    }
}
