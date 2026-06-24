import asyncio
import runtimed

async def main():
    client = runtimed.Client()
    notebook = await client.create_notebook()

    # Create and execute cells
    cell = await notebook.cells.create("print('hello')")
    execution = await cell.execute()
    result = await execution.result()
    print(execution.execution_id)  # durable execution UUID
    print(result.stdout)  # "hello\n"
    recovered = await client.get_execution_result(execution.execution_id)
    print(recovered.stdout)

    # Read cell properties (sync — local CRDT replica)
    print(cell.source)      # "print('hello')"
    print(cell.cell_type)   # "code"

    # Edit cells
    await cell.set_source("x = 42")
    execution = await cell.execute()
    await execution.result()

    # Save the notebook
    path = await notebook.save_as("/tmp/my-notebook.ipynb")

asyncio.run(main())