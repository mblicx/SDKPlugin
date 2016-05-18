# IOS-cordova-plugin
cordova plugin for IOS


Manual Operating Instructions


1. put the plugin in where ever you want, normally it should be in the<br/>
	x:/../your project/platforms/iOS/your project/Plugins
2. open the project with Xcode.
3. right click the ‘Plugins on the right’, chose ‘new group’ to put those plugins documents into a single folder (optional)
4. right click the folder(or Plugins), chose ‘Add Files to …’ and chose following documents :
	<br/>libStimshop_SDK.a
	<br/>signal.momd
	<br/>StimshopSDK.h
	<br/>StimShopPlugin.h
	<br/>StimShopPlugin.m
5. even if you have the ‘real plugin stimshop’, you still need to do the step 4 manually with the first three doucments .
6. chose the config.xml in the Staging, not in the project, and add the following code as the other plugins:
<pre>
  &lt;feature name="StimShopPlugin"&gt;
    &lt;param name="ios-package" value="StimShopPlugin" /&gt;
  &lt;/feature&gt;
</pre>

now continue your work.

you may delet the plugin.xml in the floder to make sure you can build your project.
