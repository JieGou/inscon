﻿using Enterprise.ApiServices.DALServices.Helpers;
using Enterprise.ApiServices.DALServices.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Enterprise.DAL.Core.Model;

namespace Enterprise.ApiServices.DALServices.Controllers
{
    public class UserController : ApiController
    {
        private readonly IUserRepository _repository = new UserRepository();
        private readonly ExceptionHelper _exceptionHelper = new ExceptionHelper();

        [HttpGet]
        public List<User> GetAllUsers()
        {
            return _repository.GetAllUsers();
        }

        [HttpGet]
        public User GetUserById(int idUser)
        {
            if (idUser < 0)
            {
                throw new HttpResponseException(
                    _exceptionHelper.BuildHttpResponseMessage(HttpStatusCode.NotAcceptable,
                                                             "The ID for the user must not be negative.",
                                                             "Negative Value Not Allowed"));
            }

            return _repository.GetUserById(idUser);
        }

        [HttpGet]
        public List<User> GetUsersByOrganizationId(int idOrganization)
        {
            if (idOrganization < 0)
            {
                throw new HttpResponseException(
                    _exceptionHelper.BuildHttpResponseMessage(HttpStatusCode.NotAcceptable,
                                                             "The Organization ID for the user must not be negative.",
                                                             "Negative Value Not Allowed"));
            }

            return _repository.GetUsersByOrganizationId(idOrganization);
        }

        [HttpGet]
        public List<User> GetUsersByOrganizationIdAndIsActive(int idOrganization, int idStatus)
        {
            if (idOrganization < 0)
            {
                throw new HttpResponseException(
                    _exceptionHelper.BuildHttpResponseMessage(HttpStatusCode.NotAcceptable,
                                                             "The Organization ID for the user must not be negative.",
                                                             "Negative Value Not Allowed"));
            }

            if (idStatus < 0)
            {
                throw new HttpResponseException(
                    _exceptionHelper.BuildHttpResponseMessage(HttpStatusCode.NotAcceptable,
                                                             "The Status ID for the user must not be negative.",
                                                             "Negative Value Not Allowed"));
            }

            return _repository.GetUsersByOrganizationIdAndIsActive(idOrganization, idStatus);
        }

        [HttpDelete]
        public bool DeleteRecord(User user)
        {
            if (user == null)
            {
                throw new HttpResponseException(
                    _exceptionHelper.BuildHttpResponseMessage(HttpStatusCode.NotAcceptable,
                                                             "The user must not be null.",
                                                             "Negative Value Not Allowed"));
            }

            return _repository.DeleteRecord(user);
        }

        [HttpPost]
        public int SaveRecord(User user)
        {
            if (user == null)
            {
                throw new HttpResponseException(
                    _exceptionHelper.BuildHttpResponseMessage(HttpStatusCode.NotAcceptable,
                                                             "The user must not be null.",
                                                             "Negative Value Not Allowed"));
            }

            return _repository.SaveRecord(user);
        }
    }
}
