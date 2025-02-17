﻿//===============================================================================
// Microsoft patterns & practices Enterprise Library
// Logging Application Block
//===============================================================================
// Copyright © Microsoft Corporation.  All rights reserved.
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
// OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE.
//===============================================================================

using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Linq;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration.ContainerModel;
using Microsoft.Practices.EnterpriseLibrary.Logging.PolicyInjection;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Unity.InterceptionExtension;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration.Design;


namespace Microsoft.Practices.EnterpriseLibrary.Logging.Configuration
{
    /// <summary>
    /// A configuration element for the data for the LogCallHandler.
    /// </summary>
    [ResourceDescription(typeof(DesignResources), "LogCallHandlerDataDescription")]
    [ResourceDisplayName(typeof(DesignResources), "LogCallHandlerDataDisplayName")]
    [AddSateliteProviderCommand(LoggingSettings.SectionName)]
    public class LogCallHandlerData : CallHandlerData
    {
        private const string LogBehaviorPropertyName = "logBehavior";
        private const string CategoriesPropertyName = "categories";
        private const string BeforeMessagePropertyName = "beforeMessage";
        private const string AfterMessagePropertyName = "afterMessage";
        private const string EventIdPropertyName = "eventId";
        private const string IncludeParameterValuesPropertyName = "includeParameterValues";
        private const string IncludeCallStackPropertyName = "includeCallStack";
        private const string IncludeCallTimePropertyName = "includeCallTime";
        private const string PriorityPropertyName = "priority";
        private const string SeverityPropertyName = "severity";

        /// <summary>
        /// Construct a new <see cref="LogCallHandlerData"/> instance.
        /// </summary>
        public LogCallHandlerData()
        {
            Type = typeof(LogCallHandler);
        }

        /// <summary>
        /// Construct a new <see cref="LogCallHandlerData"/> instance.
        /// </summary>
        /// <param name="handlerName">Handler name</param>
        public LogCallHandlerData(string handlerName)
            : base(handlerName, typeof(LogCallHandler))
        {
        }

        /// <summary>
        /// Construct a new <see cref="LogCallHandlerData"/> instance.
        /// </summary>
        /// <param name="handlerName">Handler name</param>
        /// <param name="handlerOrder">Handler order</param>
        public LogCallHandlerData(string handlerName, int handlerOrder)
            : base(handlerName, typeof(LogCallHandler))
        {
            this.Order = handlerOrder;
        }

        /// <summary>
        /// Should the handler log before the call, after the call, or both?
        /// </summary>
        /// <value>The "logBehavior" config attribute.</value>
        [ConfigurationProperty(LogBehaviorPropertyName, DefaultValue = HandlerLogBehavior.BeforeAndAfter)]
        [ResourceDescription(typeof(DesignResources), "LogCallHandlerDataLogBehaviorDescription")]
        [ResourceDisplayName(typeof(DesignResources), "LogCallHandlerDataLogBehaviorDisplayName")]
        public HandlerLogBehavior LogBehavior
        {
            get { return (HandlerLogBehavior)base[LogBehaviorPropertyName]; }
            set { base[LogBehaviorPropertyName] = value; }
        }

        /// <summary>
        /// Collection of log categories to use in the log message.
        /// </summary>
        /// <value>The "categories" nested element.</value>
        [ConfigurationProperty(CategoriesPropertyName)]
        [ConfigurationCollection(typeof(LogCallHandlerCategoryEntry))]
        [ResourceDescription(typeof(DesignResources), "LogCallHandlerDataCategoriesDescription")]
        [ResourceDisplayName(typeof(DesignResources), "LogCallHandlerDataCategoriesDisplayName")]
        [System.ComponentModel.Editor(CommonDesignTime.EditorTypes.CollectionEditor, CommonDesignTime.EditorTypes.FrameworkElement)]
        [EnvironmentalOverrides(false)]
        public NamedElementCollection<LogCallHandlerCategoryEntry> Categories
        {
            get { return (NamedElementCollection<LogCallHandlerCategoryEntry>)base[CategoriesPropertyName]; }
            set { base[CategoriesPropertyName] = value; }
        }

        /// <summary>
        /// Message for the log entry in before-call logging.
        /// </summary>
        /// <value>The "beforeMessage" config attribute.</value>
        [ConfigurationProperty(BeforeMessagePropertyName, DefaultValue = "")]
        [ResourceDescription(typeof(DesignResources), "LogCallHandlerDataBeforeMessageDescription")]
        [ResourceDisplayName(typeof(DesignResources), "LogCallHandlerDataBeforeMessageDisplayName")]
        public string BeforeMessage
        {
            get { return (string)base[BeforeMessagePropertyName]; }
            set { base[BeforeMessagePropertyName] = value; }
        }

        /// <summary>
        /// Message for the log entry in after-call logging.
        /// </summary>
        /// <value>The "afterMessage" config attribute.</value>
        [ConfigurationProperty(AfterMessagePropertyName, DefaultValue = "")]
        [ResourceDescription(typeof(DesignResources), "LogCallHandlerDataAfterMessageDescription")]
        [ResourceDisplayName(typeof(DesignResources), "LogCallHandlerDataAfterMessageDisplayName")]
        public string AfterMessage
        {
            get { return (string)base[AfterMessagePropertyName]; }
            set { base[AfterMessagePropertyName] = value; }
        }

        /// <summary>
        /// Event Id to put into log entries.
        /// </summary>
        /// <value>The "eventId" config attribute.</value>
        [ConfigurationProperty(EventIdPropertyName, DefaultValue = LogCallHandlerDefaults.EventId)]
        [ResourceDescription(typeof(DesignResources), "LogCallHandlerDataEventIdDescription")]
        [ResourceDisplayName(typeof(DesignResources), "LogCallHandlerDataEventIdDisplayName")]
        public int EventId
        {
            get { return (int)base[EventIdPropertyName]; }
            set { base[EventIdPropertyName] = value; }
        }

        /// <summary>
        /// Include parameter values and return values in the log entry
        /// </summary>
        /// <value>The "includeParameterValues" config attribute.</value>
        [ConfigurationProperty(IncludeParameterValuesPropertyName, DefaultValue = LogCallHandlerDefaults.IncludeParameters)]
        [ResourceDescription(typeof(DesignResources), "LogCallHandlerDataIncludeParameterValuesDescription")]
        [ResourceDisplayName(typeof(DesignResources), "LogCallHandlerDataIncludeParameterValuesDisplayName")]
        public bool IncludeParameterValues
        {
            get { return (bool)base[IncludeParameterValuesPropertyName]; }
            set { base[IncludeParameterValuesPropertyName] = value; }
        }

        /// <summary>
        /// Include the call stack in the log entries.
        /// </summary>
        /// <remarks>Setting this to true requires UnmanagedCode permissions.</remarks>
        /// <value>The "includeCallStack" config attribute.</value>
        [ConfigurationProperty(IncludeCallStackPropertyName, DefaultValue = LogCallHandlerDefaults.IncludeCallStack)]
        [ResourceDescription(typeof(DesignResources), "LogCallHandlerDataIncludeCallStackDescription")]
        [ResourceDisplayName(typeof(DesignResources), "LogCallHandlerDataIncludeCallStackDisplayName")]
        public bool IncludeCallStack
        {
            get { return (bool)base[IncludeCallStackPropertyName]; }
            set { base[IncludeCallStackPropertyName] = value; }
        }

        /// <summary>
        /// Include the time to execute the call in the log entries.
        /// </summary>
        /// <value>The "includeCallTime" config attribute.</value>
        [ConfigurationProperty(IncludeCallTimePropertyName, DefaultValue = LogCallHandlerDefaults.IncludeCallTime)]
        [ResourceDescription(typeof(DesignResources), "LogCallHandlerDataIncludeCallTimeDescription")]
        [ResourceDisplayName(typeof(DesignResources), "LogCallHandlerDataIncludeCallTimeDisplayName")]
        public bool IncludeCallTime
        {
            get { return (bool)base[IncludeCallTimePropertyName]; }
            set { base[IncludeCallTimePropertyName] = value; }
        }

        /// <summary>
        /// The priority of the log entries.
        /// </summary>
        /// <value>the "priority" config attribute.</value>
        [ConfigurationProperty(PriorityPropertyName, DefaultValue = LogCallHandlerDefaults.Priority)]
        [ResourceDescription(typeof(DesignResources), "LogCallHandlerDataPriorityDescription")]
        [ResourceDisplayName(typeof(DesignResources), "LogCallHandlerDataPriorityDisplayName")]
        public int Priority
        {
            get { return (int)base[PriorityPropertyName]; }
            set { base[PriorityPropertyName] = value; }
        }

        /// <summary>
        /// The severity of the log entry.
        /// </summary>
        /// <value>the "severity" config attribute.</value>
        [ConfigurationProperty(SeverityPropertyName, DefaultValue = LogCallHandlerDefaults.Severity, IsRequired = false)]
        [ResourceDescription(typeof(DesignResources), "LogCallHandlerDataSeverityDescription")]
        [ResourceDisplayName(typeof(DesignResources), "LogCallHandlerDataSeverityDisplayName")]
        public TraceEventType Severity
        {
            get { return (TraceEventType)base[SeverityPropertyName]; }
            set { base[SeverityPropertyName] = value; }
        }

        /// <summary>
        /// Get the set of <see cref="TypeRegistration"/> objects needed to
        /// register the call handler represented by this config element and its associated objects.
        /// </summary>
        /// <param name="nameSuffix">A suffix for the names in the generated type registration objects.</param>
        /// <returns>The set of <see cref="TypeRegistration"/> objects.</returns>
        public override IEnumerable<TypeRegistration> GetRegistrations(string nameSuffix)
        {
            var logBeforeCall = false;
            var logAfterCall = false;
            switch (this.LogBehavior)
            {
                case HandlerLogBehavior.Before:
                    logBeforeCall = true;
                    break;

                case HandlerLogBehavior.After:
                    logAfterCall = true;
                    break;

                case HandlerLogBehavior.BeforeAndAfter:
                    logBeforeCall = true;
                    logAfterCall = true;
                    break;
            }
            var categories = new List<string>(this.Categories.Select(cat => cat.Name));

            yield return
                new TypeRegistration<ICallHandler>(() =>
                                                   new LogCallHandler(Container.Resolved<LogWriter>())
                                                       {
                                                           Order = this.Order,
                                                           LogBeforeCall = logBeforeCall,
                                                           LogAfterCall = logAfterCall,
                                                           BeforeMessage = this.BeforeMessage,
                                                           AfterMessage = this.AfterMessage,
                                                           EventId = this.EventId,
                                                           IncludeCallStack = this.IncludeCallStack,
                                                           IncludeCallTime = this.IncludeCallTime,
                                                           IncludeParameters = this.IncludeParameterValues,
                                                           Priority = this.Priority,
                                                           Severity = this.Severity,
                                                           Categories = categories
                                                       })
                    {
                        Name = this.Name + nameSuffix,
                        Lifetime = TypeRegistrationLifetime.Transient
                    };
        }
    }

    /// <summary>
    /// This enum control when the logging call handler will add log entries.
    /// </summary>
    public enum HandlerLogBehavior
    {
        /// <summary>
        /// Log both before and after the call.
        /// </summary>
        BeforeAndAfter = 0,
        /// <summary>
        /// Log only before the call.
        /// </summary>
        Before = 1,
        /// <summary>
        /// Log only after the call.
        /// </summary>
        After = 2
    }
}
