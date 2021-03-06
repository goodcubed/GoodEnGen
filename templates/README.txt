Early notes on suggested guidelines for working with Engines :

Really. I haven't reviewed to make sure they totally make sense yet.


1. To keep things clear, make sure to use a different name for the engine/gem, the library contained within, and the models you plan to use, and don't let them feed off each other or try to be clever and use pluralization, as it will undoubtedly get confusing, either to you or to others who are trying to figure out what's going on in your code.  For GoodEngines, I am tentatively recommending following the naming convention:
    good_[identifier]_engine as the name of the gem 
    good_[identifier]       as the module nameto ensure that they don't conflict with any of the models contained inside, which can then be simply named  'identifier' if it makes sense for your engine.
    
    As an example, in the base for this project, I used 
    good_blurb_engine for the gem name, similarly
    GoodBlurb to identify the module, and
    Blurb to identify the class within...
    
not only does this let me simplify naming conventions, but it also indicates which project the engine was originally designed for compatibility with.    
    
- 
- 



2.  When you're namespacing your models/controllers/views, (if you're namespacing, which you should be for all engines designed to be used with GoodContent), keep in mind that  engines don't do any fancy handling of namespaced m/c/vs, so make sure that any files using that namespace are contained within an appropriately named subdirectory of the parent directory in the same way you would manage them in your main application.  



3.  Mark your controllers as "Unloadable" to ensure that the constant is removed between requests, so that it will be unloaded and won't gum up your engine.  Note that some sources have suggested that unloadable has been deprecated, but it doesn't appear to be the case in the Rails3.0 docs.  Look at http://strd6.com/2009/04/cant-dup-nilclass-maybe-try-unloadable/ for more info.




3.  If you want to gemify your engine, make it easy - install Jeweler.  
    gem install jeweler
    
The rakefile should theoretically be set up for your app already... all you should need to do in order to install the gem is type
    rake install
    
    
4.  Include your engine in your application by including the gem, either using the installed gem or by specifying the path in your gemspec... just make sure to require the library.  Personally, even if I'm not checking out a branch in my engines, I like tagging my engines with :tag => engine .  It helps me keep track of what gem is serving what purpose, and for those cases where I decide to use the same gem as both an application and an engine, tagging the engine as such just makes sense... for now anyway.


gem "authr3", :tag => :engine, :require => "authr"
gem "authr3", :tag => :engine, :require => "authr", :path => "/path/to/authr3"