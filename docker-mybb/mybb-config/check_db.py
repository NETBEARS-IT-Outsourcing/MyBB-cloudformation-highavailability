import os
import MySQLdb

# Simple routine to run a query on a database and print the results:
def doQuery( conn ) :
    cur = conn.cursor()

    cur.execute( "SELECT count(*) FROM mybb_adminoptions" )

    return cur.fetchall()

def main():

    username = os.environ.get('MYBB_DBUSERNAME')
    password = os.environ.get('MYBB_DBPASSWORD')
    hostname = os.environ.get('MYBB_DBHOSTNAME')
    port = int(os.environ.get('MYBB_DBPORT'))
    database = os.environ.get('MYBB_DBNAME')

    try:
        connection = MySQLdb.connect( host=hostname, user=username, passwd=password, db=database, port=port)
        result = doQuery(connection)
        if (result[0] > 0):
            f = open('database_exists.txt', 'w')
            f.write('random_data\n')
            f.close()
    except :
        print "shit went wrong"

if __name__ == '__main__':
    main()