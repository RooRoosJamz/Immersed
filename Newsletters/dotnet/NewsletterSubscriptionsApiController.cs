using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Models.Domain;
using Models.Requests;
using Services;
using Web.Controllers;
using Web.Models.Responses;
using System;
using System.Collections.Generic;

namespace Web.Api.Controllers
{
    [Route("api/newslettersubscriptions")]
    [ApiController]
    public class NewsletterSubscriptionsApiController : BaseApiController
    {
        private INewsletterSubscriptionsService _service = null;
        public NewsletterSubscriptionsApiController(INewsletterSubscriptionsService service, ILogger<NewsletterSubscriptionsApiController> logger) : base(logger)
        {
            _service = service;
        }
        [HttpPost]
        public ActionResult<ItemResponse<int>> Create(NewsletterSubscriptionAddRequest model)
        {
            ObjectResult result = null;
            try
            {
                string email = _service.Create(model);
                ItemResponse<string> response = new ItemResponse<string>() { Item = email };
                result = Created201(response);
            }
            catch (Exception ex)
            {
                base.Logger.LogError(ex.ToString());
                ErrorResponse response = new ErrorResponse(ex.Message);
                result = StatusCode(500, response);
            }
            return result;
        }
        [HttpPut("subscribed")]
        public ActionResult<SuccessResponse> UpdateSubscription(NewsletterSubcriptionUpdateRequest model)
        {
            int code = 200;
            BaseResponse response = null;
            try
            {
                _service.UpdateSubscription(model);
                response = new SuccessResponse();
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse($"Generic Error: {ex.Message}");
                base.Logger.LogError(ex.ToString());
            }
            return StatusCode(code, response);
        }
        [HttpGet("paged")]
        public ActionResult<ItemResponse<Paged<NewsletterSubscription>>> GetAllPaged(int pageIndex, int pageSize)
        {
            int code = 200;
            BaseResponse response = null;
            try
            {
                Paged<NewsletterSubscription> page = _service.GetAllPaged(pageIndex, pageSize);
                if (page == null)
                {
                    code = 404;
                    response = new ErrorResponse("App Resourse not fouund");
                }
                else
                {
                    response = new ItemResponse<Paged<NewsletterSubscription>>() { Item = page };
                }
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse($"Generic Error: {ex.Message}");
                base.Logger.LogError(ex.ToString());
            }
            return StatusCode(code, response);
        }
        [HttpGet("subscribed/{isSubscribed:bool}")]
        public ActionResult<ItemsResponse<NewsletterSubscription>> GetAllIsSubscribed(bool isSubscribed)
        {
            int code = 200;
            BaseResponse response = null;
            try
            {
                List<NewsletterSubscription> list = _service.GetAllByIsSubcribed(isSubscribed);
                if (list == null)
                {
                    code = 404;
                    response = new ErrorResponse("App Resourse not found.");
                }
                else
                {
                    response = new ItemsResponse<NewsletterSubscription>() { Items = list };
                }
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse($"Generic Error: {ex.Message}");
                base.Logger.LogError(ex.ToString());
            }
            return StatusCode(code, response);
        }
    }
}
