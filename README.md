# sd-workshop1 2022-1
La imagen que se creó en esta ocasión mostraba la página principal de facebook 
![proof](https://user-images.githubusercontent.com/47454213/169409979-4f1e7aa8-b82e-46fa-be6c-5f6d0fecb8aa.jpg)

## Diferencia entre CMD y Entrypoint
Ambos especifican programas que se ejecutan cuando el contenedor comienza a ejecutarse, pero:
- Los comandos CMD son ignorados cuando hay parámetros establecidos dentro del comando de ejecución.
- Las instrucciones ENTRYPOINT no se ignoran, sino que se agregan como parámetros de la línea de comandos al tratarlos como argumentos del comando.
