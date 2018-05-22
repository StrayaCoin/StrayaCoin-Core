for /l %%x in (1, 1, 999) do (
   echo %%x
   strayacoin-cli.exe generate %%x
)