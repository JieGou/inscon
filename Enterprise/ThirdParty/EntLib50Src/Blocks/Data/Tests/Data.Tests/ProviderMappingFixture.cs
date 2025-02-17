﻿//===============================================================================
// Microsoft patterns & practices Enterprise Library
// Data Access Application Block
//===============================================================================
// Copyright © Microsoft Corporation.  All rights reserved.
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
// OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE.
//===============================================================================

using System.Configuration;
using System.IO;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data.Oracle;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SysConf = System.Configuration;

namespace Microsoft.Practices.EnterpriseLibrary.Data.Tests
{
    /// <summary>
    /// Summary description for ConnectionStringHandlingFixture
    /// </summary>
    [TestClass]
    [DeploymentItem("test.exe.config")]
    public class ProviderMappingFixture
    {
        const string OdbcProviderName = "System.Data.Odbc";

        [TestMethod]
        public void WillGetMappedProviderType()
        {
            DatabaseSettings databaseSettings = new DatabaseSettings();
            databaseSettings.ProviderMappings.Add(new DbProviderMapping(OdbcProviderName, typeof(GenericDatabase)));

            DictionaryConfigurationSource source = new DictionaryConfigurationSource();
            source.Add(DatabaseSettings.SectionName, databaseSettings);

            DatabaseSyntheticConfigSettings settings = new DatabaseSyntheticConfigSettings(source);
            DbProviderMapping mapping = settings.GetProviderMapping(OdbcProviderName);

            Assert.IsNotNull(mapping);
            Assert.AreEqual(OdbcProviderName, mapping.DbProviderName);
            Assert.AreEqual(typeof(GenericDatabase), mapping.DatabaseType);
        }

        [TestMethod]
        public void WillGetMappedProviderTypeEvenIfDefaultExists()
        {
            DatabaseSettings databaseSettings = new DatabaseSettings();
            databaseSettings.ProviderMappings.Add(new DbProviderMapping(DbProviderMapping.DefaultSqlProviderName, typeof(GenericDatabase)));

            DictionaryConfigurationSource source = new DictionaryConfigurationSource();
            source.Add(DatabaseSettings.SectionName, databaseSettings);

            DatabaseSyntheticConfigSettings settings = new DatabaseSyntheticConfigSettings(source);
            DbProviderMapping mapping = settings.GetProviderMapping(DbProviderMapping.DefaultSqlProviderName);

            Assert.IsNotNull(mapping);
            Assert.AreEqual(DbProviderMapping.DefaultSqlProviderName, mapping.DbProviderName);
            Assert.AreEqual(typeof(GenericDatabase), mapping.DatabaseType);
        }

        [TestMethod]
        public void WillGetDefaultMappingIfProviderTypeIsNotMappedAndDefaultExistsForSql()
        {
            DatabaseSettings databaseSettings = new DatabaseSettings();

            DictionaryConfigurationSource source = new DictionaryConfigurationSource();
            source.Add(DatabaseSettings.SectionName, databaseSettings);

            DatabaseSyntheticConfigSettings settings = new DatabaseSyntheticConfigSettings(source);
            DbProviderMapping mapping = settings.GetProviderMapping(DbProviderMapping.DefaultSqlProviderName);

            Assert.IsNotNull(mapping);
            Assert.AreEqual(DbProviderMapping.DefaultSqlProviderName, mapping.DbProviderName);
            Assert.AreEqual(typeof(SqlDatabase), mapping.DatabaseType);
        }

        [TestMethod]
        public void WillGetDefaultMappingIfProviderTypeIsNotMappedAndDefaultExistsForOracle()
        {
            DatabaseSettings databaseSettings = new DatabaseSettings();

            DictionaryConfigurationSource source = new DictionaryConfigurationSource();
            source.Add(DatabaseSettings.SectionName, databaseSettings);

            DatabaseSyntheticConfigSettings settings = new DatabaseSyntheticConfigSettings(source);
            DbProviderMapping mapping = settings.GetProviderMapping(DbProviderMapping.DefaultOracleProviderName);

            Assert.IsNotNull(mapping);
            Assert.AreEqual(DbProviderMapping.DefaultOracleProviderName, mapping.DbProviderName);
            Assert.AreEqual(typeof(OracleDatabase), mapping.DatabaseType);
        }

        [TestMethod]
        public void WillGetGenericMappingIfProviderTypeIsNotMappedAndDefaultDoesNotExist()
        {
            DatabaseSettings databaseSettings = new DatabaseSettings();

            DictionaryConfigurationSource source = new DictionaryConfigurationSource();
            source.Add(DatabaseSettings.SectionName, databaseSettings);

            DatabaseSyntheticConfigSettings settings = new DatabaseSyntheticConfigSettings(source);
            DbProviderMapping mapping = settings.GetProviderMapping(OdbcProviderName);

            Assert.IsNotNull(mapping);
            Assert.AreEqual(typeof(GenericDatabase), mapping.DatabaseType);
        }

        [TestMethod]
        public void WillGetDefaultMappingIfDatabaseSettingsSectionDoesNotExistForSql()
        {
            DictionaryConfigurationSource source = new DictionaryConfigurationSource();

            DatabaseSyntheticConfigSettings settings = new DatabaseSyntheticConfigSettings(source);
            DbProviderMapping mapping = settings.GetProviderMapping(DbProviderMapping.DefaultSqlProviderName);

            Assert.IsNotNull(mapping);
            Assert.AreEqual(DbProviderMapping.DefaultSqlProviderName, mapping.DbProviderName);
            Assert.AreEqual(typeof(SqlDatabase), mapping.DatabaseType);
        }

        [TestMethod]
        public void WillGetGenericMappingIfDatabaseSettingsSectionDoesNotExist()
        {
            DictionaryConfigurationSource source = new DictionaryConfigurationSource();

            DatabaseSyntheticConfigSettings settings = new DatabaseSyntheticConfigSettings(source);
            DbProviderMapping mapping = settings.GetProviderMapping(OdbcProviderName);

            Assert.IsNotNull(mapping);
            Assert.AreEqual(typeof(GenericDatabase), mapping.DatabaseType);
        }

        [TestMethod]
        public void CanDeserializeSerializedSettings()
        {
            ExeConfigurationFileMap fileMap = new ExeConfigurationFileMap();
            fileMap.ExeConfigFilename = "test.exe.config";
            System.Configuration.Configuration rwConfiguration = ConfigurationManager.OpenMappedExeConfiguration(fileMap, ConfigurationUserLevel.None);
            rwConfiguration.Sections.Remove(DatabaseSettings.SectionName);
            DatabaseSettings rwSettings = new DatabaseSettings();
            rwConfiguration.Sections.Add(DatabaseSettings.SectionName, rwSettings);

            rwSettings.ProviderMappings.Add(new DbProviderMapping(DbProviderMapping.DefaultSqlProviderName, typeof(SqlDatabase)));
            rwSettings.ProviderMappings.Add(new DbProviderMapping(OdbcProviderName, typeof(GenericDatabase)));

            File.SetAttributes(fileMap.ExeConfigFilename, FileAttributes.Normal);
            rwConfiguration.Save();

            System.Configuration.Configuration roConfiguration = ConfigurationManager.OpenMappedExeConfiguration(fileMap, ConfigurationUserLevel.None);
            DatabaseSettings roSettings = (DatabaseSettings)roConfiguration.Sections[DatabaseSettings.SectionName];
            Assert.AreEqual(2, roSettings.ProviderMappings.Count);
            Assert.AreEqual(DbProviderMapping.DefaultSqlProviderName, roSettings.ProviderMappings.Get(0).DbProviderName);
            Assert.AreEqual(typeof(SqlDatabase), roSettings.ProviderMappings.Get(0).DatabaseType);
            Assert.AreEqual(OdbcProviderName, roSettings.ProviderMappings.Get(1).DbProviderName);
            Assert.AreEqual(typeof(GenericDatabase), roSettings.ProviderMappings.Get(1).DatabaseType);
        }
    }
}
