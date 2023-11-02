import subprocess

compilador_autoit = "AutoIt3\AutoIt3.exe"

def generate_automata(automata):
    ruta='TCTX64_20210701\TCTX64_20210701.exe'
    # Código AutoIt generado desde Python

    codigo_autoit = """
    Run('cmd.exe')
    Sleep(500)
    send('
    """
    codigo_autoit += ruta + """{ENTER}')
    Sleep(2000)
    send('{ENTER}')
    Sleep(1000)
    send('T')
    Sleep(1000)
    send('0')
    Sleep(1000)
    send('2{ENTER}')
    Sleep(1000)
    send('holita{ENTER}')
    Sleep(1000)
    send('{ENTER}')
    Sleep(1000)
    send('{ENTER}')
    send('x')
    send('x')
    send('exit{ENTER}')
    """
    with open(automata.name + ".au3", "w") as archivo:
        archivo.write(codigo_autoit)



# Inicia el proceso
proceso = subprocess.Popen(
    "cmd",  # Puedes especificar otro comando o programa aquí
    shell=True,
    stdin=subprocess.PIPE,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    text=True
)

# Lista de comandos que deseas enviar
comandos = [
    "cd AutoIt3\Aut2Exe",
    'Aut2Exe.exe /in "D:\GitHub Repos\PycharmProjects\TEA_Proyect\mi_script.au3" /out "D:\GitHub Repos\PycharmProjects\TEA_Proyect\iuda.exe"',
    "exit",
]

# Itera a través de los comandos y envíalos al proceso
for comando in comandos:
    proceso.stdin.write(comando + "\n")
    proceso.stdin.flush()

# Leer la salida estándar y la salida de error estándar
while True:
    salida_estandar = proceso.stdout.readline()
    if not salida_estandar:
        break
    print(salida_estandar)

# Leer la salida de error estándar
while True:
    error_estandar = proceso.stderr.readline()
    if not error_estandar:
        break
    print(error_estandar)

# Cierra el flujo de entrada estándar
proceso.stdin.close()

# Espera a que el proceso termine
proceso.wait()



archivo_autoit_compilado = "iuda.exe"


# Configura las opciones para ocultar la ventana de la consola
opciones = subprocess.STARTUPINFO()
opciones.dwFlags |= subprocess.STARTF_USESHOWWINDOW
opciones.wShowWindow = subprocess.SW_HIDE

# Ejecuta el archivo EXE sin mostrar la ventana de la consola
proceso = subprocess.Popen([archivo_autoit_compilado], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, startupinfo=opciones)

# Captura la salida estándar y de error del proceso AutoIt
salida_estandar, errores_estandar = proceso.communicate()

# Imprime la salida estándar y de error (opcional)
print("Salida estándar:")
print(salida_estandar)

print("Errores estándar:")
print(errores_estandar)

# Espera a que el proceso termine
proceso.wait()






