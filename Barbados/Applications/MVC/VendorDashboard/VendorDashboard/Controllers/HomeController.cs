﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BootstrapMvcSample.Controllers;

//using BootstrapMvcSample.Controllers;

namespace Enterprise.Applications.ClientDashboard.Controllers
{
    public class HomeController : BootstrapBaseController
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }

    }
}
