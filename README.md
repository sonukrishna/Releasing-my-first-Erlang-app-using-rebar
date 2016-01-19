# Releasing-my-first-Erlang-app-using-rebar

I created a calendar server using rebar, and this time going to release it.

Lets start from the beginning, I created using the older version(R15B,the release management tool introduced in the Erlang R13B distribution).

### Creating application      
      
    1) Create calendarApp directory
            $  mkdir calendarApp
            $  cd calendarApp
    
    2) Since we use R15B(older)  --> create the skeleton
            $  mkdir -p apps/calendarApp
            $  cd apps/calendarApp
            $  rebar create-app appid=calendarApp
      This create a src dirctory which contain files like calendarApp.app.src, calendarApp_app.src etc. Create a calendar service in it
      as explained in the previous post. Now time to release it
    3) Back to the calendarApp directory(cd ../..), create a rel directory for our release.
            $  mkdir rel
            $  cd rel
            
    4)  Create a node
            $ rebar create-node nodeid=calendarApp
                     Here we need to edit reltool.config a little; point to to your apps directory, and make sure the version number matches your
            .app.src file.
                ie;    {sys, [
                            {lib_dirs, []},  
                change this to
                      {sys, [
                          {lib_dirs, ["../apps"]},
                          
    5) Compile and Generate
          $ rebar compile generate
          
          This will produce the target system calendarApp within the rel directory.
          
  
    6) Start the app in rel directory
          $ ./calendarApp/bin/calendarApp start
          $ ./calendarApp/bin/calendarApp attach
              This will starts the app..
              
        Attaching to /tmp//home/sonu/release/calendarServer/rel/calendarServer/erlang.pipe.1 (^D to exit)

        (calendarServer@127.0.0.1)1> 


Now I concentrated to make it rest api, i did something, but some bug occured. So now I am trying to fix it. Concentrated on REST api
