#!/usr/bin/python3

import os
import sys
import json
import time
import shutil
import argparse
import tempfile
import subprocess


class account:
    def __init__(self, id, host, email):
        self.port = 587
        self.host = host
        self.proto = "smtp"
        self.email = email
        self.id = id
        self.auth = "on"
        self.tls = "on"
        self.tls_fingerprint = make_tls_fingerprint(host, self.port)
        self.passwordeval = make_passwordeval(id)

    def str(self):
        """
        Returns string account representation used in msmptrc config file.
        """
        return 'account {account}\n'                         \
               '\tport {port}\n'                             \
               '\thost {host}\n'                             \
               '\tprotocol {protocol}\n'                     \
               '\tfrom {from_}\n'                            \
               '\tuser {user}\n'                             \
               '\tauth {auth}\n'                             \
               '\ttls {tls}\n'                               \
               '\ttls_fingerprint {tls_fingerprint}\n'       \
               '\tpasswordeval {passwordeval}\n'.format(
                   account=self.id,
                   host=self.host,
                   port=self.port,
                   protocol=self.proto,
                   from_=self.email,
                   user=self.email,
                   auth=self.auth,
                   tls=self.tls,
                   tls_fingerprint=self.tls_fingerprint,
                   passwordeval=self.passwordeval,
               )

    def json(self):
        """
        Returns an account in the json format.
        """
        output = {
            'account': self.id,
            'from': self.email,
            'user': self.email,
            'host': self.host,
            'port': self.port,
            'proto': self.proto,
            'auth': self.auth,
            'tls': self.tls,
            'tls_fingerprint': self.tls_fingerprint,
            'passwordeval': self.passwordeval,
        }

        return json.dumps(output, indent=2)


def make_tls_fingerprint(host, port):
    """
    Uses msmpt to fetch the latest tls fingerprint.
    """
    msmtp = subprocess.run([
        'msmtp',
        '--serverinfo',
        '--tls=on',
        '--tls-certcheck=off',
        '--host={host}'.format(host=host),
        '--port={port}'.format(port=port),
    ], stdout=subprocess.PIPE)

    grep = subprocess.run(['grep', 'SHA256:'],
                          input=msmtp.stdout,
                          stdout=subprocess.PIPE)
    sha256 = grep.stdout.decode('UTF-8').replace(' ', '').replace('\n', '')

    return sha256[len('SHA256:'):]


def make_passwordeval(account):
    """
    Generates a command for fetching the account password. Ensure that you
    don't store your password as a plain text.
    """
    certpath = os.getenv('CERTPATH',
                         os.path.join(os.environ['HOME'], 'cloud/Sync/cert/mail'))

    return make_genkey_command(certpath, account)


def make_genkey_command(certpath, account):
    """
    Uses gpg2 to decrypt the account password.
    """
    path = os.path.join(certpath, '{account}.gpg'.format(account=account))

    tool = 'gpg2'
    args = (
        '--no-tty',
        '-q',
        '-d {path}'.format(path=path),
    )

    return '{tool} {args}'.format(tool=tool, args=str.join(' ', args))


def parse_email_config(config_path):
    """
    Parse the email configuration file.

    Configuration file has the following JSON format:

        ```
        {
            "accounts": [
                {
                    "id": "foo",
                    "smtp": "smtp.gmail.com",
                    "email": "foo@gmail.com"
                },
                {
                    "id": "bar",
                    "smtp": "smtp.gmail.com",
                    "email": "bar@gmail.com"
                },
                {
                    "id": "baz",
                    "smtp": "smtp.gmail.com",
                    "email": "baz@gmail.com"
                }
            ],
            "default": "foo"
        }
        ```
    """
    accounts = []
    default_account = ''

    with open(config_path) as json_file:
        data = json.load(json_file)
        default_account = data['default']

        for a in data['accounts']:
            accounts.append(account(a['id'], a['smtp'], a['email']))

    if len(accounts) == 0:
        raise 'failed to parse email configuration file: accounts not found'

    if default_account == '':
        raise 'failed to parse email configuration file: default account is not specified'

    return (accounts, default_account)


def generate_mstp_config(accounts, default_account):
    """
    Reloads the existing msmtp config stored at ~/.msmptrc.
    """
    tmpdir_path = os.path.join(os.environ['HOME'], '.msmtptemp')
    config_path = os.path.join(os.environ['HOME'], '.msmtprc')

    try:
        tmpdir = os.mkdir(tmpdir_path)
        tmpfile = tempfile.NamedTemporaryFile(mode='w',
                                              delete=False,
                                              dir=tmpdir_path,
                                              prefix=os.path.basename(__file__))
        tmpfile_path = tmpfile.name

        for account in accounts:
            tmpfile.write(account.str())

        tmpfile.write('account default : {}'.format(default_account))

        os.rename(tmpfile_path, config_path)
        tmpfile.close()

    except Exception as e:
        print('failed to reload config: {}'.format(e), file=sys.stderr)
        pass
    finally:
        shutil.rmtree(tmpdir_path)


def write_account_json(writer, account):
    write_account(writer, account.json(), newline=True)


def write_account(writer=None, data=None, newline=False):
    writer.write(data)
    if newline:
        writer.write('\n')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--path',
                        help='path to the configuration file with emails mapping')
    parser.add_argument('--reload',
                        action='store_true',
                        help='generate new msmtprc and replace the existing')

    args = parser.parse_args()

    if not args.reload and args.path is None:
        parser.print_help()
        return

    config_path = args.path
    if args.path is None:
        config_path = os.path.join(os.environ['HOME'], 'cloud/Sync/mutt/msmtp.json')

    if args.reload is None:
        return

    accounts, default_account = parse_email_config(config_path)
    generate_mstp_config(accounts, default_account)


if __name__ == '__main__':
    main()
