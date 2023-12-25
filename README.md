# README


## Amazon Linux 2023環境構築手順

### 初期セットアップ

```shell
sudo localectl set-locale LANG=ja_JP.utf8
localectl
sudo timedatectl set-timezone Asia/Tokyo
timedatectl
sudo dnf install -y git
```

### Docker インストール

```shell
sudo dnf install -y docker
sudo systemctl start docker
sudo gpasswd -a $(whoami) docker
sudo chgrp docker /var/run/docker.sock
sudo service docker restart
```

### 一度ログアウトして再度ログイン

```shell
exit
```

### Docker Compose インストール

```shell
sudo curl -L "https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

### 環境変数作成

```shell
touch .env
vim .env
```

### .env

パスワードを変更して下さい

```
WORKDIR=app
MYSQL_ROOT_PASSWORD=パスワード
```

### Dockerビルド、起動

```shell
docker-compose build
docker-compose up -d
```

### DBのセットアップ

```shell
docker-compose exec backend bundle exec rails db:create
docker-compose exec backend rails db:migrate
docker-compose exec backend rails db:seed
```

### Nginxインストール

```shell
sudo dnf install -y nginx
```

### /etc/nginx/nginx.confにプロキシの設定追加

```conf
location / {
	proxy_pass http://localhost:5173/;
}
```

### Nginx起動

```shell
sudo systemctl start nginx
```

### HTTPS化
```shell
sudo dnf install -y python3 augeas-libs pip
sudo python3 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
sudo /opt/certbot/bin/pip install certbot certbot-nginx
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
sudo certbot --nginx --agree-tos
```