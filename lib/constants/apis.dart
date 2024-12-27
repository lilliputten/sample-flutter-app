const String googleApiKey = 'AIzaSyBsxZl1NfSTJiWSTT7eAXchhOgqFeHFwlI';
const String googleCseId = 'a0f69bd47b89b47ef';

/// @see https://developers.google.com/custom-search/v1/reference/rest/v1/cse/list
const String googleImageUrlTemplate =
    'https://www.googleapis.com/customsearch/v1'
    '?searchType=image'
    // '&googlehost=google.co.uk'
    '&safe=medium'
    '&imgSize=medium'
    '&imgType=face'
    '&fileType=png'
    '&tbs=iar:s' // Square?
    '&num=1'
    '&key={apiKey}'
    '&cx={cseId}'
    '&q={search}';
