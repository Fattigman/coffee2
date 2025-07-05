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
          {i + 1}. 
          flow time: {coffee.flow_time}
          grind size: {coffee.grind_size}
          taste: {coffee.taste}
          date: {coffee.date}
          bean: {coffee.expand.bean.name}
        {/each}
    {:catch error}
    <p style="color: red">{error.message}</p>
    {/await}
{:else}
    <p>
        Please login
    </p>
{/if}
</div>