Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793169967;
	b=2OL4zQSUhQlGKN4ekMM5WU5sHaowRQ6x3+lL1ZT/qUYW6pwAHxq1QWhprQHiOngODtt7
	 iAbmj7r17oDTM6/Xxk5bPNARJVOEG5pObk72G2esTWFi5dbtxirMAdqcfuWKA/5Hl5vVN
	 j5skLUi9MViaOgEUZiEiqi1qRDcEzcxkMEsSA0qUUgWTg44xdwgEWS/zn0Q8j8G4i2BxE
	 jc2L2N8E1lVStnJb7nXWXgTApPgI5VW7QET4+FExVvB+oM6xrg1M3wYUKEyrvvpWuUtIH
	 rCvcyw6P3SJy02w0d7gFU9/2CZKKdKZv5LM2oRv1hp9nGmVVeMfhhjLOqh4EQIHrFxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793169967;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=W6XLz0Ntqlz7gVGMZKh6RPGCkC8eSIbHg1auwfTh/MM=;
	b=m1uaILlxD78+ApdoetH+uUObBNQAX9VhOUxcMSRF0ijjy0pqmj1y69exxIyg3IsyEMhx
	 j+zIYH07TXAzZ5EJBTD8jpy59HN0fxWbi/u/Mzbd0yODN4oUJZjDiD+0dgm1xSTJ0T2Ng
	 UPx6doqDxySRyJqkC3/L7lfNGQPdf2ii1uXybtXoZjF+Y6VZFfn2aOlgSjZo/qQL0HvqO
	 UIQqe6ALdEYe/nGdD61CXn7z2/q73uJ38FpxlnvMP2LeAZfyj9uA+le2t4oadnpP8jHOX
	 ZZs+l6kQkGw7YisRhgycSZGay6SVMGf0n0xOdfp/u7qU+A8YfdfyGqxph+m/lJXCjYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agQdJwiB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62430606A326
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 06:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agQdJwiB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4E41F01825;
	Wed, 28 Oct 2026 06:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793169966;
	bh=W6XLz0Ntqlz7gVGMZKh6RPGCkC8eSIbHg1auwfTh/MM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=agQdJwiBOJkUqJHOxX5YDLqlsXjJeeNAkESSiybh9IETpbe99UWci/plZyyn8SknL
	 xfWI5AwNyfya0Prnk6hWxyXXy/XHkPl43VRfrG9yciJSAl3iZOphR+XQJVgh6tzN93
	 mHEW9ckw0AmB1oXKQGOpWUlTvS1yhvpReH/LYh7zrn7Pc+UMvN2j4pE3cpRyJxAKIV
	 1BuxOP69NlPtxq4I/KX7KyMTS0lYkRA0l7kiZ7xF0CAIPzy66psnjhO7POliZXityc
	 XzK6pjbotaPhmz1+ItXZK64BTIfUe7iAbrEwvTabQZ/R9hHOgZyBr+pfu74DC9uXh+
	 qHW3jNGMJ+KRg==
Message-ID: <sashiko-outbox-187567@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] i2c: imx: honour I2C_M_IGNORE_NAK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haobin Jiang" <lemonoutput@foxmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <tencent_E6D69775D91AD9FE45C994B3755CB1452506@qq.com>
References: <tencent_E6D69775D91AD9FE45C994B3755CB1452506@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 06:46:06 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] i2c: imx: I2C_M_STOP accepted on non-final messages in i2c_imx_c=
heck_msgs()
--

commit ab5cce0d9e41776730132143f819ba3662b29234
Author: Haobin Jiang <lemonoutput@foxmail.com>

i2c: imx: honour I2C_M_IGNORE_NAK

This commit adds support for I2C_M_IGNORE_NAK on PIO transfers in the i.MX
I2C controller driver while keeping flagged messages out of the DMA path and
rejecting zero-length reads with I2C_M_IGNORE_NAK.

Link: https://lore.kernel.org/linux-i2c/tencent_877C99956190215D644EB959DF1=
663542A0A@qq.com/ # [1]

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151f..1e2fd699f4fc6 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c

[ ... ]

> @@ -1613,8 +1621,9 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_=
imx, struct i2c_msg *msgs,
>  	return ret;
>  }
> =20
> +/* I2C_M_STOP is the controller's native behaviour; don't reject it. */
>  #define I2C_IMX_UNSUPPORTED_PROTOCOL_MANGLING_FLAGS \
> -	(I2C_M_IGNORE_NAK | I2C_M_NO_RD_ACK | I2C_M_STOP)
> +	I2C_M_NO_RD_ACK
> =20
>  static int i2c_imx_check_msgs(struct i2c_msg *msgs, int num)
>  {
> @@ -1625,6 +1634,12 @@ static int i2c_imx_check_msgs(struct i2c_msg *msgs=
, int num)
>  		if (msgs[i].flags & I2C_IMX_UNSUPPORTED_PROTOCOL_MANGLING_FLAGS)
>  			return -EOPNOTSUPP;

[Severity: Medium]
Does removing I2C_M_STOP from I2C_IMX_UNSUPPORTED_PROTOCOL_MANGLING_FLAGS
cause i2c_imx_check_msgs() to accept multi-message transfers that set
I2C_M_STOP on a non-final message (i < num - 1) without actually generating
an inter-message STOP condition?

In i2c_imx_xfer_common(), is_lastmsg is only set when i =3D=3D num - 1, and
i2c_imx_stop() is only called at the end of the entire transfer. For
intermediate messages, the controller keeps I2CR_MSTA asserted and emits a
repeated START on the next message:

drivers/i2c/busses/i2c-imx.c:i2c_imx_xfer_common() {
	for (i =3D 0; i < num; i++) {
		if (i =3D=3D num - 1)
			is_lastmsg =3D true;

		if (i && !(msgs[i].flags & I2C_M_NOSTART)) {
			...
			temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
			temp |=3D I2CR_RSTA;
			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
			...
		}
}

When callers such as SCCB client drivers (via I2C_CLIENT_SCCB in
i2c_smbus_xfer_emulated(), which sets I2C_M_STOP | I2C_M_IGNORE_NAK on msg[=
0]
of a two-message read) or userspace I2C_RDWR ioctls pass I2C_M_STOP on an
intermediate message, shouldn't i2c_imx_check_msgs() still reject I2C_M_STOP
when i < num - 1 unless i2c_imx_xfer_common() emits a STOP followed by a new
START between those messages?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_E6D69775D91=
AD9FE45C994B3755CB1452506@qq.com?part=3D1
