﻿using Thinktecture.IdentityServer.Repositories;

namespace Thinktecture.IdentityServer.Web.Areas.Admin.ViewModels
{
    public class MenuViewModel
    {
        public MenuViewModel(IConfigurationRepository configuration)
        {
            this.ShowOAuthClients = configuration.OAuth2.Enabled;
        }

        public bool ShowOAuthClients { get; private set; }
    }
}