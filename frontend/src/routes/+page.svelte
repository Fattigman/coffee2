<script>
    import { Input } from "$lib/components/ui/input"
    import { Button } from "$lib/components/ui/button"
    import { currentUser, pb } from '$lib/index';
    import {
        Card,
        CardContent,
        CardDescription,
        CardFooter,
        CardHeader,
        CardTitle,
    } from "$lib/components/ui/card"

    let username;
    let password;
    let loggedInState;

    async function login() {
      try {
        loggedInState = true;
        const user = await pb.collection('users').authWithPassword(username, password);
        loggedInState = true;
      } catch (err) {
        loggedInState = false;
      }
      
    }
</script>



<div >
    <Card class= "card">
    {#if $currentUser}
      <div class="card-content">
        <div >
          <h1 class = "text-big bold">Hey you!</h1>
          <p > 
              You are now logged in and can access the website.
          </p>
          <a href="/coffee">
            <button class="nb-button default" >Go to coffe runs</button>
          </a>
        </div>
      </div>
    
    {:else}
    
      <div >
          <div>
              <div >
                  <h1 >
                      Sign in to your account
                  </h1>
                  <form on:submit|preventDefault action="#">
                      <div>
                          <Input bind:value={username} className="w-[200px]" type="email" placeholder="Email" />
                      </div>
                      <div>
                          <Input bind:value={password} className="w-[200px]" type="password" placeholder="Password" />
                      </div>
                      <Button onclick={login} type="submit" >Sign in</Button>
                      {#if loggedInState === false}
                          <LoginAlert />
                      {/if}
                  </form>
              </div>
          </div>
      </div>
    
    {/if}
    </Card>
    </div>
