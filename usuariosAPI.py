from flask import Flask, jsonify, request
from flaskext.mysql import MySQL


app = Flask(__name__)
mysql = MySQL()

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'digimon'
app.config['MYSQL_DATABASE_DB'] = 'banco2'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql.init_app(app)

@app.route('/depo', methods=['GET'])
def get():
    remitente=request.args.get('remitente')
    receptor=request.args.get('receptor')
    monto=request.args.get('monto')
    nombreT=request.args.get('nombreT')
    tipo= request.args.get('tipo')
    print(remitente)
    conn =mysql.connect()
    cur = conn.cursor()

    cur.callproc('transaccion_deposito', (remitente,receptor,monto,nombreT,tipo))
    cur.fetchall()

    conn.commit()

    return jsonify({'resultado' :'exito' })

if __name__ == '__main__':
    app.run()
