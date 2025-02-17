﻿// ***********************************************************************
// Assembly         : Enterprise.DAL.Core
// Author           : Michael Roof
// Created          : 01-26-2013
//
// Last Modified By : Michael Roof
// Last Modified On : 01-26-2013
// ***********************************************************************
// <copyright file="OrganizationService.cs" company="Mortgage Specialist International, LLC">
//     Copyright (c) Mortgage Specialist International, LLC. All rights reserved.
// </copyright>
// <summary></summary>
// ***********************************************************************

using System;
using System.Collections.Generic;
using Enterprise.DAL.Core.Model;
using Enterprise.DAL.Core.Types;
using Enterprise.DAL.Framework.Data;

namespace Enterprise.DAL.Core.Service
{
    /// <summary>
    /// Class OrganizationService
    /// </summary>
    public class OrganizationService : ServiceBase<Organization>
    {
        /// <summary>
        /// Builds the specified reader.
        /// </summary>
        /// <param name="reader">The reader.</param>
        /// <returns>Organization.</returns>
        public static Organization Build(ITypeReader reader)
        {
            var record = new Organization
                {
                    OrganizationID = reader.GetInt32("OrganizationID"),
                    Name = reader.GetString("Name"),
                    Code = reader.GetString("Code"),
                    TypeID = reader.GetInt32("TypeID"),
                    StatusID = reader.GetInt32("StatusID"),
                };

            return record;
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="OrganizationService"/> class.
        /// </summary>
        public OrganizationService()
        {
            IsCached = true;
        }

        /// <summary>
        /// Gets all organizations.
        /// </summary>
        /// <returns>List{Organization}.</returns>
        public List<Organization> GetAllOrganizations()
        {
            return QueryAll(SqlDatabase, Procedure.Organization_SelectAll, Build, CacheMinutesToExpire,
                            IsCached);
        }

        /// <summary>
        /// Gets the organization by id.
        /// </summary>
        /// <param name="id">The id.</param>
        /// <returns>Organization.</returns>
        public Organization GetOrganizationById(int id)
        {
            if (IsCached)
            {
                Predicate<Organization> h = h2 => h2.OrganizationID == id;
                return GetAllOrganizations().Find(h);
            }

            return Query(SqlDatabase, Procedure.Organization_SelectById, Build, id);
        }

        /// <summary>
        /// Gets the organizations by type id.
        /// </summary>
        /// <param name="typeID">The type ID.</param>
        /// <returns>List{Organization}.</returns>
        public List<Organization> GetOrganizationsByTypeId(int? typeID)
        {
            if (typeID == null)
            {
                return GetAllOrganizations();
            }
            if (IsCached)
            {
                Predicate<Organization> d = d2 => d2.TypeID == typeID;
                return GetAllOrganizations().FindAll(d);
            }

            return QueryAll(SqlDatabase, Procedure.Organization_SelectByTypeId, Build, typeID);
        }
    }
}