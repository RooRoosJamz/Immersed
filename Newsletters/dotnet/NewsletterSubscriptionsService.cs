using Sabio.Data;
using Sabio.Data.Providers;
using Sabio.Models;
using Sabio.Models.Domain;
using Sabio.Models.Requests;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Sabio.Services
{
    public class NewsletterSubscriptionsService : INewsletterSubscriptionsService
    {
        IDataProvider _data = null;
        public NewsletterSubscriptionsService(IDataProvider data)
        {
            _data = data;
        }

        public string Create(NewsletterSubscriptionAddRequest model)
        {
            string procName = "[dbo].[NewsletterSubscriptions_Insert]";
            _data.ExecuteNonQuery(procName,
                inputParamMapper: delegate (SqlParameterCollection col)
                {
                    AddCommonParams(model, col);
                },
                returnParameters: null);
            return model.Email;
        }
        public void UpdateSubscription(NewsletterSubcriptionUpdateRequest model)
        {
            string procName = "[dbo].[NewsletterSubscriptions_Update]";
            _data.ExecuteNonQuery(procName,
                inputParamMapper: delegate (SqlParameterCollection col)
                {
                    AddCommonParams(model, col);
                    col.AddWithValue("@IsSubscribed", model.IsSubscribed);
                },
                returnParameters: null);
        }
        public Paged<NewsletterSubscription> GetAllPaged(int pageIndex, int pageSize)
        {
            Paged<NewsletterSubscription> pagedResult = null;
            List<NewsletterSubscription> list = null;
            int totalCount = 0;
            string procName = "[dbo].[NewsletterSubscriptions_SelectAll_Paged]";
            _data.ExecuteCmd(procName,
                inputParamMapper: delegate (SqlParameterCollection parameterCollection)
                {
                    parameterCollection.AddWithValue("@PageIndex", pageIndex);
                    parameterCollection.AddWithValue("@PageSize", pageSize);
                }
                , singleRecordMapper: delegate (IDataReader reader, short set)
                {
                    int startingIndex = 0;
                    NewsletterSubscription model = MapSingleNewsletterSubscription(reader, ref startingIndex);
                    if (totalCount == 0)
                    {
                        totalCount = reader.GetSafeInt32(startingIndex++);
                    }
                    if (list == null)
                    {
                        list = new List<NewsletterSubscription>();
                    }
                    list.Add(model);
                });
            if (list != null)
            {
                pagedResult = new Paged<NewsletterSubscription>(list, pageIndex, pageSize, totalCount);
            }
            return pagedResult;
        }
        public List<NewsletterSubscription> GetAllByIsSubcribed(bool isSubscribed)
        {
            List<NewsletterSubscription> list = null;
            string procName = "[dbo].[NewsletterSubscriptions_SelectAll_BySubcribed]";
            _data.ExecuteCmd(procName,
                inputParamMapper: delegate (SqlParameterCollection parameterCollection)
                {
                    parameterCollection.AddWithValue("@IsSubscribed", isSubscribed);
                }
                , singleRecordMapper: delegate (IDataReader reader, short set)
                {
                    int startingIndex = 0;
                    NewsletterSubscription model = MapSingleNewsletterSubscription(reader, ref startingIndex);
                    if (list == null)
                    {
                        list = new List<NewsletterSubscription>();
                    }
                    list.Add(model);
                });
            return list;
        }
        private NewsletterSubscription MapSingleNewsletterSubscription(IDataReader reader, ref int startingIndex)
        {
            NewsletterSubscription newsletterSubscription = new NewsletterSubscription();
            newsletterSubscription.Email = reader.GetSafeString(startingIndex++);
            newsletterSubscription.IsSubscribed = reader.GetSafeBool(startingIndex++);
            newsletterSubscription.DateCreated = reader.GetSafeDateTime(startingIndex++);
            newsletterSubscription.DateModified = reader.GetSafeDateTime(startingIndex++);
            return newsletterSubscription;
        }
        private static void AddCommonParams(NewsletterSubscriptionAddRequest model, SqlParameterCollection col)
        {
            col.AddWithValue("@Email", model.Email);
        }
    }
}
