<script>
    import { currentUser, pb } from '$lib/index';
    
    async function getRecord() {
        const resultList = await pb.collection('coffee').getFullList(1000, {
            expand: "bean,grinder" 
        });
        console.log(resultList);
        return resultList;
    }
</script>

<div class="card card-content grinds">
{#if $currentUser}
    {#await getRecord()}
        <p>Loading</p>
    {:then data}
        {#each data as coffee, i }
          <br>
          <ul>
          {i + 1}.
            <li>
                flow time: {coffee.flow_time}
            </li>
            <li>
                grind size: {coffee.grind_size}
            </li>
            <li>
                taste: {coffee.taste}
            </li>
            <li>
                date: {coffee.date}
            </li>
            <li>
                bean: {coffee.expand.bean.name}
            </li>
          </ul>
        {/each}
        
    {:catch error}
    <p style="color: red">{error.message}</p>
    {/await}
    <a href="/coffee/beans">
        <button class="nb-button default" >Go to beans</button>
    </a>
{:else}
    <p>
        Please login
    </p>
{/if}
</div>