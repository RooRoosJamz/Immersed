using System.ComponentModel.DataAnnotations;

namespace Models.Requests
{
    public class NewsletterSubscriptionAddRequest
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }
    }
}
