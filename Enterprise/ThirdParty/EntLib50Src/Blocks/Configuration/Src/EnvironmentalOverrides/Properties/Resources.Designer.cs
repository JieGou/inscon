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

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.4918
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Microsoft.Practices.EnterpriseLibrary.Configuration.EnvironmentalOverrides.Properties {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "2.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    internal class Resources {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal Resources() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("Microsoft.Practices.EnterpriseLibrary.Configuration.EnvironmentalOverrides.Proper" +
                            "ties.Resources", typeof(Resources).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to General.
        /// </summary>
        internal static string CategoryGeneral {
            get {
                return ResourceManager.GetString("CategoryGeneral", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Overridden values per environment.
        /// </summary>
        internal static string CategoryOverrides {
            get {
                return ResourceManager.GetString("CategoryOverrides", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Configuration Files(web.config, *.exe.config, app.config)|web.config;*.exe.config;app.config|All Files(*.*)|*.*.
        /// </summary>
        internal static string ConfigurationFileDialogFilter {
            get {
                return ResourceManager.GetString("ConfigurationFileDialogFilter", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Environment.dconfig.
        /// </summary>
        internal static string DefaultEnvironmentDeltaFile {
            get {
                return ResourceManager.GetString("DefaultEnvironmentDeltaFile", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to .dconfig.
        /// </summary>
        internal static string DefaultEnvironmentDeltaFileExtension {
            get {
                return ResourceManager.GetString("DefaultEnvironmentDeltaFileExtension", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Environment.
        /// </summary>
        internal static string DefaultEnvironmentName {
            get {
                return ResourceManager.GetString("DefaultEnvironmentName", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to "Don&apos;t Override Properties".
        /// </summary>
        internal static string DontOverrideProperties {
            get {
                return ResourceManager.GetString("DontOverrideProperties", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The Environment Delta File specified conflicts with another Environment Node..
        /// </summary>
        internal static string DuplicateDeltaFilePath {
            get {
                return ResourceManager.GetString("DuplicateDeltaFilePath", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Environments.
        /// </summary>
        internal static string EnvironmentalOverridesNodeName {
            get {
                return ResourceManager.GetString("EnvironmentalOverridesNodeName", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Add Environmental Overrides..
        /// </summary>
        internal static string EnvironmentalOverridesUICommandLongText {
            get {
                return ResourceManager.GetString("EnvironmentalOverridesUICommandLongText", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Environmental Overrides.
        /// </summary>
        internal static string EnvironmentalOverridesUICommandText {
            get {
                return ResourceManager.GetString("EnvironmentalOverridesUICommandText", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Gets or sets the location of the file should be used as output for merging the environmental configuration..
        /// </summary>
        internal static string EnvironmentConfigurationFileDescription {
            get {
                return ResourceManager.GetString("EnvironmentConfigurationFileDescription", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Gets or sets the location of the environment delta configuration (.dconfig)..
        /// </summary>
        internal static string EnvironmentDeltaFileDescription {
            get {
                return ResourceManager.GetString("EnvironmentDeltaFileDescription", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Environment Delta File (*.dconfig)|*.dconfig.
        /// </summary>
        internal static string EnvironmentDeltaFileDialogFilter {
            get {
                return ResourceManager.GetString("EnvironmentDeltaFileDialogFilter", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Add new Environment..
        /// </summary>
        internal static string EnvironmentUICommandLongText {
            get {
                return ResourceManager.GetString("EnvironmentUICommandLongText", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Environment.
        /// </summary>
        internal static string EnvironmentUICommandText {
            get {
                return ResourceManager.GetString("EnvironmentUICommandText", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Error opening environment merge file.
        /// </summary>
        internal static string ErrorOpeningEnvironmentMergeFile {
            get {
                return ResourceManager.GetString("ErrorOpeningEnvironmentMergeFile", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Error occurred saving a merged configuration file..
        /// </summary>
        internal static string ErrorSavingMergedConfigurationCaption {
            get {
                return ResourceManager.GetString("ErrorSavingMergedConfigurationCaption", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Enterprise Library Configuration.
        /// </summary>
        internal static string GenericDialogCaption {
            get {
                return ResourceManager.GetString("GenericDialogCaption", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Open Environment Delta file..
        /// </summary>
        internal static string OpenEnvironmentDeltaCommandLongText {
            get {
                return ResourceManager.GetString("OpenEnvironmentDeltaCommandLongText", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Open Environment Delta.
        /// </summary>
        internal static string OpenEnvironmentDeltaCommandText {
            get {
                return ResourceManager.GetString("OpenEnvironmentDeltaCommandText", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Override Properties.
        /// </summary>
        internal static string OverrideProperties {
            get {
                return ResourceManager.GetString("OverrideProperties", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Prior to merging environmental configuration you should save the main configuration file. 
        ///
        ///Do you want to save the main configuration?.
        /// </summary>
        internal static string SaveConfigurationFileBeforeEnvironmentMerge {
            get {
                return ResourceManager.GetString("SaveConfigurationFileBeforeEnvironmentMerge", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Save the Merged Configuration for this environment..
        /// </summary>
        internal static string SaveMergedEnvironmentCommandLongText {
            get {
                return ResourceManager.GetString("SaveMergedEnvironmentCommandLongText", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Save Merged Configuration.
        /// </summary>
        internal static string SaveMergedEnvironmentCommandText {
            get {
                return ResourceManager.GetString("SaveMergedEnvironmentCommandText", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Save Merged Configuration.
        /// </summary>
        internal static string SaveMergedEnvironmentConfiguration {
            get {
                return ResourceManager.GetString("SaveMergedEnvironmentConfiguration", resourceCulture);
            }
        }
    }
}
