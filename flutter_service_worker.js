'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "3e3a129b46df4dd27dd0cc4c7e5af557",
"index.html": "5cd583ad91f6f774282a7e5f74ad2f8e",
"/": "5cd583ad91f6f774282a7e5f74ad2f8e",
"main.dart.js": "4dcc442cc0ec11812f631db9d827e1fb",
"favicon.png": "279ca5d4828640ab2616122cac8a65c3",
"icons/Icon-192.png": "53e9003262386996782285982a8be2dc",
"icons/Icon-maskable-192.png": "53e9003262386996782285982a8be2dc",
"icons/Icon-maskable-512.png": "a38d4381650944df1a0c43a1227bcf54",
"icons/Icon-512.png": "a38d4381650944df1a0c43a1227bcf54",
"manifest.json": "911a013d499d11b4475c7ce9bd9f3f35",
"assets/AssetManifest.json": "37c56f477bd5045f45d2955027e03278",
"assets/NOTICES": "3b80fecbbbc76cd540af5a864c142805",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/assets/images/wechat/me_ic_tx.png": "b4d56608c6cb758cd7d47440ff4f8aab",
"assets/assets/images/wechat/pangyuhao.jpg": "6dcce1e719dd7e6dd34d89fddcfda630",
"assets/assets/images/wechat/face1.jpg": "56ab8f27e3571a78ad4ddc97aaf9115f",
"assets/assets/images/wechat/face2.jpg": "90394ba37624a7fd497744f24e212e31",
"assets/assets/images/wechat/face3.jpg": "33f49f397b6c97cfb31e20620291e94a",
"assets/assets/images/wechat/face6.jpg": "9b8a45585347897e23635c7dee91929f",
"assets/assets/images/wechat/face4.jpg": "a86e97c3046d291fbe0b23170b90429b",
"assets/assets/images/wechat/face5.jpg": "db64399429557637b12ae98449e04917",
"assets/assets/images/ins/pangyuhao.jpg": "6dcce1e719dd7e6dd34d89fddcfda630",
"assets/assets/images/ins/face1.jpg": "56ab8f27e3571a78ad4ddc97aaf9115f",
"assets/assets/images/ins/face2.jpg": "90394ba37624a7fd497744f24e212e31",
"assets/assets/images/ins/face3.jpg": "33f49f397b6c97cfb31e20620291e94a",
"assets/assets/images/ins/logo.JPG": "4e4adf84109f776099dcd92ce8042539",
"assets/assets/images/ins/face6.jpg": "9b8a45585347897e23635c7dee91929f",
"assets/assets/images/ins/unsplash.txt": "e2081e52c9e4fb4ce0da16683957f0d0",
"assets/assets/images/ins/face4.jpg": "a86e97c3046d291fbe0b23170b90429b",
"assets/assets/images/ins/face5.jpg": "db64399429557637b12ae98449e04917",
"assets/assets/images/ins/4.jpg": "1a2df9ccd5ac4062f0a68ea97d272f0e",
"assets/assets/images/ins/5.jpg": "c4ed1dc2f518cc3c4f56e1c78fc9602b",
"assets/assets/images/ins/splashbg.JPG": "fbca0b1d776bf408d8f8b8fde5facf59",
"assets/assets/images/ins/6.jpg": "cb000a859dbca5c428738cb2ae078b25",
"assets/assets/images/ins/2.jpg": "ed8b71a3fd0b57166acab13a0cebfc81",
"assets/assets/images/ins/3.jpg": "7fa9abbd723c9fb6be8449cc577639ce",
"assets/assets/images/ins/1.jpg": "b51b4e42ccba1b538dc49f7aafc14248",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
