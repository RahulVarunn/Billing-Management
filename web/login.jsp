<!DOCTYPE html>
<html lang="en" class="border-l">
<head>
    <meta charset="UTF-8">
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <title>Login</title>
    <style>
        * {
            margin:0;
            padding:0;
            font-family: 'Open Sans', sans-serif;
        }
        .input {
            transition: border 0.2s ease-in-out;
            min-width: 280px
        }
        .input:focus+.label,
        .input:active+.label,
        .input.filled+.label {
            font-size: .75rem;
            transition: all 0.2s ease-out;
            top: -0.9rem;
            background-color: #fff;
            color: white;
            padding: 0 5px 0 5px;
            margin: 0 5px 0 5px;
        }
        .label {
            transition: all 0.2s ease-out;
            top: 0.4rem;
            left: 0;
        }
    </style>
</head>
<body style="background-color: #1D1D20;">
<div class="md:h-screen  relative flex flex-col justify-center items-center">
    <div class=" " >
        <div class="flex flex-col items-center space-y-3">
           
            <h1 class="" style="color: white;">Welcome </h1>
        </div>
        <form class="my-8" action="admin_verification" method="post">
            <div class="relative mb-2">
                <input name="pass" style="background-color: #2E2E33; color: white;" type="password" id="email" class="pl-3 w-full rounded px-2 border border-gray-300 pt-2 pb-2 focus:ring-1  focus:outline-none input active:outline-none"  type="text" autofocus>
                <label style="background-color: #2E2E33;" for="email" class="rounded label absolute mt-1 ml-3  leading-tighter text-gray-600 text-base cursor-text">Enter Password</label>
            </div>


            <div class="space-y-9 mt-6" >
           
            
                <div class="text-sm flex justify-between items-center">
                    <button type="submit"  style="background-color: #2E2E33; font-size: 12px;"  class="text-white bg-[#050708] hover:bg-[#050708]/80 focus:ring-4 focus:outline-none focus:ring-[#050708]/50 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:hover:bg-[#050708]/40 dark:focus:ring-gray-600 mr-4 mb-2">
                        LOGIN TO SYSTEM &nbsp;
                    <svg aria-hidden="true" class="w-3 h-3" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                    <span class="sr-only">Icon description</span>
                      </button>



                      <button name="admin" style="background-color: #2E2E33;font-size: 12px;"  class="text-white bg-[#050708] hover:bg-[#050708]/80 focus:ring-4 focus:outline-none focus:ring-[#050708]/50 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:hover:bg-[#050708]/40 dark:focus:ring-gray-600 mr-2 mb-2">
                        ADMIN SETTING  
                      </button>

              
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>