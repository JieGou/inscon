﻿//===============================================================================
// Microsoft patterns & practices Enterprise Library
// Cryptography Application Block
//===============================================================================
// Copyright © Microsoft Corporation.  All rights reserved.
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
// OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE.
//===============================================================================

using System;
using System.Security.Cryptography;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration.Manageability;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration.Manageability.Adm;
using Microsoft.Practices.EnterpriseLibrary.Security.Cryptography.Configuration.Manageability.Properties;

namespace Microsoft.Practices.EnterpriseLibrary.Security.Cryptography.Configuration.Manageability
{
    /// <summary>
    /// Provides an implementation for <see cref="KeyedHashAlgorithmProviderData"/> that
    /// processes policy overrides, performing appropriate logging of 
    /// policy processing errors.
    /// </summary>
    public class KeyedHashAlgorithmProviderDataManageabilityProvider
        : ConfigurationElementManageabilityProviderBase<KeyedHashAlgorithmProviderData>
    {
        /// <summary>
        /// The name of the protected key file name property.
        /// </summary>
        public const String ProtectedKeyFilenamePropertyName = "protectedKeyFilename";

        /// <summary>
        /// The name of the protected key scope property.
        /// </summary>
        public const String ProtectedKeyProtectionScopePropertyName = "protectedKeyProtectionScope";

        /// <summary>
        /// The name of the salt enabled property.
        /// </summary>
        public const String SaltEnabledPropertyName = "saltEnabled";

        /// <summary>
        /// Initialize a new instance of the <see cref="KeyedHashAlgorithmProviderDataManageabilityProvider"/> class.
        /// </summary>
        public KeyedHashAlgorithmProviderDataManageabilityProvider()
        {
        }

        /// <summary>
        /// Gets the template for the name of the policy associated to the object.
        /// </summary>
        /// <remarks>
        /// Elements that override 
        /// <see cref="ConfigurationElementManageabilityProviderBase{T}.AddAdministrativeTemplateDirectives(AdmContentBuilder, T, IConfigurationSource, String)"/>
        /// to avoid creating a policy must still override this property.
        /// </remarks>
        protected override string ElementPolicyNameTemplate
        {
            get { return Resources.HashProviderPolicyNameTemplate; }
        }

        /// <summary>
        /// Adds the ADM parts that represent the properties of
        /// a specific instance of the configuration element type managed by the receiver.
        /// </summary>
        /// <param name="contentBuilder">The <see cref="AdmContentBuilder"/> to which the Adm instructions are to be appended.</param>
        /// <param name="configurationObject">The configuration object instance.</param>
        /// <param name="configurationSource">The configuration source from where to get additional configuration
        /// information, if necessary.</param>
        /// <param name="elementPolicyKeyName">The key for the element's policies.</param>
        /// <remarks>
        /// Subclasses managing objects that must not create a policy will likely need to include the elements' keys when creating the parts.
        /// </remarks>
        protected override void AddElementAdministrativeTemplateParts(AdmContentBuilder contentBuilder,
                                                                      KeyedHashAlgorithmProviderData configurationObject,
                                                                      IConfigurationSource configurationSource,
                                                                      String elementPolicyKeyName)
        {
            contentBuilder.AddCheckboxPart(Resources.KeyedHashAlgorithmProviderSaltEnabledPartName,
                                           SaltEnabledPropertyName,
                                           configurationObject.SaltEnabled);

            contentBuilder.AddEditTextPart(Resources.KeyedHashAlgorithmProviderKeyFileNamePartName,
                                           ProtectedKeyFilenamePropertyName,
                                           configurationObject.ProtectedKeyFilename,
                                           255,
                                           true);

            contentBuilder.AddDropDownListPartForEnumeration<DataProtectionScope>(Resources.KeyedHashAlgorithmProviderKeyProtectionScopePartName,
                                                                                  ProtectedKeyProtectionScopePropertyName,
                                                                                  configurationObject.ProtectedKeyProtectionScope);
        }

        /// <summary>
        /// Overrides the <paramref name="configurationObject"/>'s properties with the Group Policy values from the 
        /// registry.
        /// </summary>
        /// <param name="configurationObject">The configuration object for instances that must be managed.</param>
        /// <param name="policyKey">The <see cref="IRegistryKey"/> which holds the Group Policy overrides for the 
        /// configuration element.</param>
        /// <remarks>Subclasses implementing this method must retrieve all the override values from the registry
        /// before making modifications to the <paramref name="configurationObject"/> so any error retrieving
        /// the override values will cancel policy processing.</remarks>
        protected override void OverrideWithGroupPolicies(KeyedHashAlgorithmProviderData configurationObject,
                                                          IRegistryKey policyKey)
        {
            bool? saltEnabledOverride = policyKey.GetBoolValue(SaltEnabledPropertyName);
            String protectedKeyFilenameOverride = policyKey.GetStringValue(ProtectedKeyFilenamePropertyName);
            DataProtectionScope? protectedKeyProtectionScopeOverride
                = policyKey.GetEnumValue<DataProtectionScope>(ProtectedKeyProtectionScopePropertyName);
            // algorithm type is read only in the configuration tool

            configurationObject.SaltEnabled = saltEnabledOverride.Value;
            configurationObject.ProtectedKeyFilename = protectedKeyFilenameOverride;
            configurationObject.ProtectedKeyProtectionScope = protectedKeyProtectionScopeOverride.Value;
        }
    }
}
