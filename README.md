# hono-trial

https://eclipse.dev/hono/docs/getting-started/

新しいテナントの作成
```
source hono.env
curl -i -X POST ${CURL_OPTIONS} -H "content-type: application/json" --data-binary '{
  "ext": {
    "messaging-type": "kafka"
  }
}' https://${REGISTRY_IP}:28443/v1/tenants
```


取得したテナントIDを環境変数に設定する
```
echo "export MY_TENANT=f00fb4bd-3462-437c-9d85-1a60856d549f" >> hono.env
```

デバイス登録
```
source hono.env
curl -i -X POST ${CURL_OPTIONS} https://${REGISTRY_IP}:28443/v1/devices/${MY_TENANT}
```

同様に、取得したデバイスIDを環境変数に設定する
```
echo "export MY_DEVICE=b80f2e70-2ce5-4451-a4e8-df79860a29f6" >> hono.env
```
さらに、デバイスパスワードを登録する
```
echo "export MY_PWD=test001" >> hono.env
```

```
source hono.env
curl -i -X PUT ${CURL_OPTIONS} -H "content-type: application/json" --data-binary '[{
  "type": "hashed-password",
  "auth-id": "'${MY_DEVICE}'",
  "secrets": [{
      "pwd-plain": "'${MY_PWD}'"
  }]
}]' https://${REGISTRY_IP}:28443/v1/credentials/${MY_TENANT}/${MY_DEVICE}
```

```
HTTP/1.1 204 No Content
etag: 7715128e-91fb-423d-bd89-308c7a27a613
content-type: application/json; charset=utf-8
```

エラーが無ければ成功