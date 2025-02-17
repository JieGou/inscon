﻿//===============================================================================
// Microsoft patterns & practices Enterprise Library
// Core
//===============================================================================
// Copyright © Microsoft Corporation.  All rights reserved.
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
// OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE.
//===============================================================================

using System.Security;
using System.Security.Permissions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Microsoft.Practices.EnterpriseLibrary.Common.Configuration.Tests
{
    /// <summary>
    /// Summary description for SystemConfigurationSourceFixture
    /// </summary>
    public partial class SystemConfigurationSourceFixture2
    {

        [TestMethod]
        public void CanGetExistingSectionInAppConfigEvenIfTheAppDomainDoesNotHaveFileIOPermission()
        {
            try
            {
                new FileIOPermission(PermissionState.Unrestricted).Deny();

                CanGetExistingSectionInAppConfig();
            }
            finally
            {
                CodeAccessPermission.RevertDeny();
            }
        }
    }
}
