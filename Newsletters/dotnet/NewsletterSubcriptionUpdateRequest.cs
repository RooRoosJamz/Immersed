using System.ComponentModel.DataAnnotations;

namespace Models.Requests
{
    public class NewsletterSubcriptionUpdateRequest : NewsletterSubscriptionAddRequest
    {
        [Required]
        public bool IsSubscribed { get; set; }
    }
}
