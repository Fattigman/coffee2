<script>
    import { currentUser, pb } from '$lib/index';
    // How to fetch and expand data
    async function getRecord() {
        const resultList = await pb.collection('Beans').getFullList(1000, { expand: "countries"
        });
        console.log(resultList);
        return resultList;
    }
</script>

<div class="card card-content">
{#if $currentUser}
        Here there will be coffee
    {:else}
    <p>
        Please login
    </p>
{/if}
</div>