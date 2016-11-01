# ip-67-caelum
Desenvolvimento móvel com iOS


# Troubleshooting

Error: `The app's Info.plist must contain an NSPhotoLibraryUsageDescription key with a string value explaining to the user how the app uses this data`

iOS 10 - Add Info.plist
```
<key>NSPhotoLibraryUsageDescription</key>
<string>$(PRODUCT_NAME) uses photos</string>
``
*Reference:* http://stackoverflow.com/questions/38236723/ios-10-error-access-private-when-using-uiimagepickercontroller