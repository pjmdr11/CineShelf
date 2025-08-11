const appThemeLight = "light";
const appThemeDark = "dark";
const appThemeSystem = "system";

const viewTypeDiscover = "Discover";
const viewTypePopular = "Popular";
const viewTypeTrending = "Trending";
const viewTypeTopRated = "Top-Rated";

const viewTypeOrder = [viewTypeTrending, viewTypePopular, viewTypeTopRated];
const supportedLanguages = {
  "en": {"label": "English", "locale": "en_US"},
  "he": {"label": "Hebrew", "locale": "he_IL"},
  "hi": {"label": "Hindi", "locale": "hi_IN"},
};

const storeCollectionUsers = "users";
const storeCollectionFavourites = "favourites";
const storeCollectionItems = "items";

enum ContentType { Movie, Tv }
