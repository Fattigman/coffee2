<script>
    import { currentUser, pb } from '$lib/index';
    
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