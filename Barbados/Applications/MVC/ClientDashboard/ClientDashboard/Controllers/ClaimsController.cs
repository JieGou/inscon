﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BootstrapMvcSample.Controllers;
using Microsoft.Web.Mvc.Resources;
using Models;

namespace Enterprise.Applications.ClientDashboard.Controllers
{
    public class ClaimsController : BootstrapBaseController
    {
        private static List<ClaimRecord> _models = ModelIntializer.CreateHomeInputModels();
        public ActionResult Index()
        {

            var homeInputModels = _models;
            return View(homeInputModels);
        }

        [HttpPost]
        public ActionResult Create(ClaimRecord model)
        {
            if (ModelState.IsValid)
            {
                model.Id = _models.Count == 0 ? 1 : _models.Select(x => x.Id).Max() + 1;
                _models.Add(model);
                Success("Your information was saved!");
                return RedirectToAction("Index");
            }
            Error("there were some errors in your form.");
            return View(model);
        }

        public ActionResult Create()
        {
            return View(new ClaimRecord());
        }

        public ActionResult Delete(int id)
        {
            _models.Remove(_models.Get(id));
            Information("Your widget was deleted");
            if (_models.Count == 0)
            {
                Attention("You have deleted all the models! Create a new one to continue the demo.");
            }
            return RedirectToAction("index");
        }
        public ActionResult Edit(int id)
        {
            var model = _models.Get(id);
            return View("Create", model);
        }
        [HttpPost]
        public ActionResult Edit(ClaimRecord model, int id)
        {
            if (ModelState.IsValid)
            {
                _models.Remove(_models.Get(id));
                model.Id = id;
                _models.Add(model);
                Success("The model was updated!");
                return RedirectToAction("index");
            }
            return View("Create", model);
        }

        public ActionResult Details(int id)
        {
            var model = _models.Get(id);
            return View(model);
        }

        public ActionResult ReadOnly()
        {
            return View();
        }

        public ActionResult Empty()
        {
            return new ContentResult();
        }

    }
}
