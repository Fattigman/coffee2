<script>
    let x = 0;
    let y = 0;
    let result = null;
    let error = null;
  
    async function calculate() {
      error = null;
      try {
        const res = await fetch('rservice:8000/calculate', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ x, y })
        });
  
        if (!res.ok) {
          throw new Error('R service error');
        }
  
        const data = await res.json();
        result = data.result;
      } catch (err) {
        error = err.message;
      }
    }
  </script>
  
  <input type="number" bind:value={x} placeholder="x" />
  <input type="number" bind:value={y} placeholder="y" />
  <button on:click={calculate}>Calculate</button>
  
  {#if result !== null}
    <p>Result: {result}</p>
  {/if}
  
  {#if error}
    <p style="color: red;">{error}</p>
  {/if}
  