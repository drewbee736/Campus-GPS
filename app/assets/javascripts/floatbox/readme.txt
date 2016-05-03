Welcome to Floatbox version 7.

If upgrading from an older version, there are a few things you should know.

1.
Do a clean install into a new directory and change your floatbox.js and floatbox.css include paths accordingly.
Re-using the same folder from an older install will create browser cache issues for your repeat visitors,
and your site may fail for some.

2.
If you are accessing a single instance of the Floatbox package from multiple web sites,
you may not be able to do so with this new version.
Icon fonts are in use now.
To allow remote access to hosted font files, a server needs to send CORS headers with the files.
The problem is, some hosting companies strip out any CORS headers from font files,
thereby preventing most browsers from accessing them.
1and1.com, where floatbojs.com lives, is one such hosting company.
If your host blocks fonts, the current choices are to keep using version 6,
or to do individual installs of version 7 on each site that's using it.

3.
The old options.js file is gone, replaced by a similarly named but differently structured fbOptions.js.
Upgraders will need to manually enter their global customizations into this new file,
including any license keys from the old options.js.

4.
The 'custom' colorTheme is gone, along with the custom.css file that supported it.
If you are using the custom theme, and your customizations are important to you,
you will need to define a set of color options, probably assigned to a class in fbOption's className section,
and change your link markup accordingly.

5.
It's important that upgraders read the detailed change log on the Floatbox download page.
There's a lot of changes made to both the options and the API.
Being aware of those changes can save much grief when dealing with something that's not working
the way you think it should under the new release.