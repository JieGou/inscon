﻿//===============================================================================
// Microsoft patterns & practices Enterprise Library
// Validation Application Block
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
//     Runtime Version:2.0.50727.1433
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Microsoft.Practices.EnterpriseLibrary.Validation.Integration.WinForms.Properties {
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
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("Microsoft.Practices.EnterpriseLibrary.Validation.Integration.WinForms.Properties." +
                            "Resources", typeof(Resources).Assembly);
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
        ///   Looks up a localized string similar to Validation.
        /// </summary>
        internal static string CategoryValidation {
            get {
                return ResourceManager.GetString("CategoryValidation", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The enablement status for the control..
        /// </summary>
        internal static string DescriptionEnabled {
            get {
                return ResourceManager.GetString("DescriptionEnabled", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The error provider to which error messages should be logged..
        /// </summary>
        internal static string DescriptionErrorProvider {
            get {
                return ResourceManager.GetString("DescriptionErrorProvider", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Indicates whether automatic validation should be performed for this component when the Validating event is fired..
        /// </summary>
        internal static string DescriptionPerformValidation {
            get {
                return ResourceManager.GetString("DescriptionPerformValidation", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The ruleset for validation rules (empty to use the default ruleset)..
        /// </summary>
        internal static string DescriptionRuleset {
            get {
                return ResourceManager.GetString("DescriptionRuleset", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The name of the property on the source type for which validation information should be retrieved to validate the value for this componen..
        /// </summary>
        internal static string DescriptionSourcePropertyName {
            get {
                return ResourceManager.GetString("DescriptionSourcePropertyName", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The type for which validation information should be retrieved..
        /// </summary>
        internal static string DescriptionSourceType {
            get {
                return ResourceManager.GetString("DescriptionSourceType", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The source for validation specifications..
        /// </summary>
        internal static string DescriptionSpecificationSource {
            get {
                return ResourceManager.GetString("DescriptionSpecificationSource", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The name of the property on this component from where the value to be validated should be extracted..
        /// </summary>
        internal static string DescriptionValidatedProperty {
            get {
                return ResourceManager.GetString("DescriptionValidatedProperty", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The format to show validation results. Use {0} for the message, {1} for the key, and {2} for the tag..
        /// </summary>
        internal static string DescriptionValidationResultFormat {
            get {
                return ResourceManager.GetString("DescriptionValidationResultFormat", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The supplied control has not been extended..
        /// </summary>
        internal static string ExceptionControlNotExtended {
            get {
                return ResourceManager.GetString("ExceptionControlNotExtended", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The source type does not represent a valid type for validation provider..
        /// </summary>
        internal static string ExceptionInvalidSourceTypeName {
            get {
                return ResourceManager.GetString("ExceptionInvalidSourceTypeName", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to No source property has been defined for validated control..
        /// </summary>
        internal static string ExceptionNoSourceProperty {
            get {
                return ResourceManager.GetString("ExceptionNoSourceProperty", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to No source type has been defined for the validation provider..
        /// </summary>
        internal static string ExceptionNoSourceTypeName {
            get {
                return ResourceManager.GetString("ExceptionNoSourceTypeName", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The property &quot;{0}&quot; specified to retrieve the value from control &quot;{1}&quot; does not exist or is not accessible..
        /// </summary>
        internal static string ExceptionValidatedControlPropertyNotFound {
            get {
                return ResourceManager.GetString("ExceptionValidatedControlPropertyNotFound", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The property &quot;{0}&quot; has not been mapped to any control..
        /// </summary>
        internal static string ExceptionValueAccessPropertyNotFound {
            get {
                return ResourceManager.GetString("ExceptionValueAccessPropertyNotFound", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to This value access only works on ValidatedControlItems..
        /// </summary>
        internal static string ExceptionValueAccessRequiresValidatedControlItem {
            get {
                return ResourceManager.GetString("ExceptionValueAccessRequiresValidatedControlItem", resourceCulture);
            }
        }
    }
}
