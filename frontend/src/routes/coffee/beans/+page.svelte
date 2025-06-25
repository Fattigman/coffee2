<script>
    import { currentUser, pb } from '$lib/index';
    import { Button } from "$lib/components/ui/button"

    async function getRecord() {
        const resultList = await pb.collection('Beans').getFullList(1000, { expand: "countries"
        });
        console.log(resultList);
        return resultList;
    }
</script>
<div class="card card-content">
{#if $currentUser}
        Here there will be beans

        {#await getRecord()}
            <p>Loading</p>
        {:then data}
            {#each data as bean}
            <br>
                {bean.name}
                {#each bean.expand.countries as country}
                    {country.name}
                {/each}
            {/each}
        {:catch error}
            <p style="color: red">{error.message}</p>
        {/await}
    {:else}
    <p>
        Please login
    </p>
    
{/if}
<a href="/">
    <button class = "nb-button default small">
        Back to the start
    </button>
</a>
</div>