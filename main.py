
from flask import Flask, send_file, request
app = Flask('app')

# Servidor de prueba en python
@app.route('/<codigo>')
def hello_world(codigo):
    print(codigo)
    if codigo == "1000":
        print('Rompiendo el pipeline')
        Exception('Rompiendo el pipeline')
    else:
        print('Todo funciona correctamente')
    func = request.environ.get('werkzeug.server.shutdown')
    func()
    return 'Hola mundo'
app.run(host='0.0.0.0', port=4444)
