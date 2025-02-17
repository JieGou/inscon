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

using System;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Unity.InterceptionExtension;

namespace Microsoft.Practices.EnterpriseLibrary.Validation.PolicyInjection
{
    /// <summary>
    /// An attribute that applies the <see cref="ValidationCallHandler"/> to its target.
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method | AttributeTargets.Property)]
    public class ValidationCallHandlerAttribute : HandlerAttribute
    {
        private string ruleSet;
        private SpecificationSource specificationSource;

        /// <summary>
        /// Constructs a new <see cref="ValidationCallHandlerAttribute"/> that uses the
        /// default ruleset.
        /// </summary>
        public ValidationCallHandlerAttribute()
            : this(string.Empty)
        {
        }

        /// <summary>
        /// Constructs a new <see cref="ValidationCallHandlerAttribute"/> that uses the
        /// given ruleset.
        /// </summary>
        /// <param name="ruleSet">Ruleset name to use.</param>
        public ValidationCallHandlerAttribute(string ruleSet)
        {
            this.ruleSet = ruleSet;
            this.specificationSource = SpecificationSource.Both;
        }

        /// <summary>
        /// <see cref="SpecificationSource"/> determining where to get validation rules.
        /// </summary>
        /// <value>specification source.</value>
        public SpecificationSource SpecificationSource
        {
            get { return specificationSource; }
            set { specificationSource = value; }
        }

        /// <summary>
        /// Derived classes implement this method. When called, it
        /// creates a new call handler as specified in the attribute
        /// configuration.
        /// </summary>
        /// <returns>A new call handler object.</returns>
        public override ICallHandler CreateHandler(IUnityContainer container)
        {
            Type factoryType = null;
            switch (this.specificationSource)
            {
                case SpecificationSource.Both:
                    factoryType = typeof(CompositeValidatorFactory);
                    break;
                case SpecificationSource.Attributes:
                    factoryType = typeof(AttributeValidatorFactory);
                    break;
                case SpecificationSource.Configuration:
                    factoryType = typeof(ConfigurationValidatorFactory);
                    break;
            }

            return new ValidationCallHandler(
                ruleSet,
                factoryType != null ? (ValidatorFactory)container.Resolve(factoryType) : null,
                Order);
        }
    }
}
