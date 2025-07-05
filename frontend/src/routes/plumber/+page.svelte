<script>
    let a = 0;
    let b = 0;
    let result = null;
    let error = null;
  
    async function calculate() {
        error = null;

        try {
            const res = await fetch('http://localhost:8000/sum', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ a: a, b: b }) // <-- note the keys here
            });

            if (!res.ok) throw new Error(`Status ${res.status}`);

            const data = await res.json();
            result = data.result;  // <-- ensure JSON structure matches
            console.log(result)

        } catch (err) {
            error = err.message;
            result = null;
        }
        }

  </script>
  
  <input type="number" bind:value={a} placeholder="a" />
  <input type="number" bind:value={b} placeholder="b" />
  <button on:click={calculate}>Calculate</button>
  
  {#if result !== null}
    <p>Result: {result}</p>
  {/if}
  
  {#if error}
    <p style="color: red;">{error}</p>
  {/if}
  