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

using System.ComponentModel;
using System.Configuration.Install;
using Microsoft.Practices.EnterpriseLibrary.Common.Instrumentation;

namespace Microsoft.Practices.EnterpriseLibrary.Validation.Instrumentation
{
    /// <summary>
    /// Let the system know that the InstallUtil.exe tool will be run against this assembly
    /// </summary>
    [RunInstaller(true)]
    public partial class ValidationInstrumentationInstaller : Installer
    {
        /// <summary>
        /// Represents the installer for the instrumentation events. Not intended for direct use.
        /// </summary>
        public ValidationInstrumentationInstaller()
        {
            InitializeComponent();
            Installers.Add(new ReflectionInstaller<PerformanceCounterInstallerBuilder>());
            Installers.Add(new ReflectionInstaller<EventLogInstallerBuilder>());
        }
    }
}
