﻿using Enterprise.DAL.Core.Model;
using System.Collections.Generic;

namespace Enterprise.ApiServices.DALServices.Repository
{
    public interface IAddressLocationRepository
    {
        List<AddressLocation> GetAllAddressesLocationRecords();
        AddressLocation GetAddressLocationById(int id);
        bool DeleteRecord(AddressLocation addressLocation);
        int SaveRecord(AddressLocation addressLocation);
    }
}
