Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833969;
	b=3z9huZQhoSIN2aIw7hKoBBdLubwKlcy4F/IfH8iUv3rVXY8p6QeWywKnSGA3SMhRHwBp
	 wb/7VyB2Ovn28hQ0+NqdqRaWCR9CoJcsCV6KsMXQwCAT3tlmjKadrcZscIfKVjt+XXFBQ
	 DE4oaRt/3E8ICDZwpGN8RP0LXElGELSFiAyGD9//LwRjZdxiDPnZ88ElwcZk2PWSsQvEi
	 aMJ/BOsOqPNAPwToAH/wczPo3U12z5U+UhfrUvSc622dPIK4IEuomSz/ulYXK/JzlADiI
	 Ffr6IFUfGgqAcDj+fQ/8ZxLcWCl2Ph0sfCeGpBOyEHpgpOFeUcSqjFIZdL4I2LEJTKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833969;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RP2v8VMnVbC8Bc0Up8jOE+Ht8vJx2XQA1xzWuR4I494=;
	b=SUp0318fquEhhDqCL2wxq4+LutvxhN615rh5zJps4JuS1LimC0pJuocD3YXx4Mq3Mf0o
	 qSwBEQ3JdP+vXI+FhbVH9H2+T170oFdFyz0DMZufdRqqz3npy/Cq5Usz09readMlFZO23
	 z1N/5ah4lJZBYZE8cjvRVO/pKwfapAV91J2ve2zyRFbdCVkK1GQK7hhqOMUEaTKZfyrqo
	 vIB9sZ0O80iEYGPlqI0tgS1TO76IjHK242JAGs4tFHYDPXhv/I7NdKXHjDLMyHF4vPSv4
	 rMoOXtSs2ycSBK2LznCs6guljOLq/j2RXYQkwb0NyU2JtqYILvACDCqfAdqNsbo3g7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WHJoBqNc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C578606A32A
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WHJoBqNc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701FF1F000C4;
	Mon, 16 Nov 2026 12:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833968;
	bh=RP2v8VMnVbC8Bc0Up8jOE+Ht8vJx2XQA1xzWuR4I494=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WHJoBqNc28uBW+sbaTztcpStuuk5ghRtTE82++FAynqmxEPMc207u+RcKGT4y6IYK
	 FguKrHMOOJuM4SzOqo+jBb/GVCwF1bWJLA+tiqQiBJJ+OdvIB28pcAo3xNeNnt7smB
	 rt70z0KTO585qwN/SS8BgZALA2SvTiqt4M7WMfriY0qsQ7/5KHPYx+blCH8uGeayP9
	 h5BYObXN3xws4a92+9ZF69CKyun8ZxktltJLxdZMDev8mZQKCsH1GJ9oRQgdavhR/z
	 Snv8IR8zdfgS9iDyqHH90aTQLS6hfhI/H7LesDte//u8n5Jllv7hKKZu6bbbtI9Zxw
	 Cavk6Qysg1WRg==
Message-ID: <sashiko-outbox-217028@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx: do not acknowledge the last byte of a block
 read of one byte
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261116124430.1358948-1-mehmet.fide@gmail.com>
References: <20261116124430.1358948-1-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:59:28 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] i2c: imx: premature NACK in i2c_imx_isr_read_block_data_len()
  with PEC
--

commit 5f9d6cebf7f9ee55cbfb82a72f126d816180c9da
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

i2c: imx: do not acknowledge the last byte of a block read of one byte

This commit sets I2CR_TXAK in i2c_imx_isr_read_block_data_len() when the
received SMBus block length byte is 1 so that the following byte is not
acknowledged.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151f..0a59ebe70eb00 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1095,6 +1095,12 @@ static inline void i2c_imx_isr_read_block_data_len=
(struct imx_i2c_struct *i2c_im
>  	}
>  	i2c_imx->msg->len +=3D len;
>  	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] =3D len;
> +
> +	if (len =3D=3D 1) {
> +		temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +		temp |=3D I2CR_TXAK;
> +		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +	}
>  }

[Severity: Medium]
Does checking len =3D=3D 1 rather than i2c_imx->msg->len =3D=3D 2 premature=
ly NACK
the data byte on a 1-byte SMBus block read with PEC enabled?

When I2C_CLIENT_PEC is set, i2c_smbus_xfer_emulated() increments the
initial read msg->len from 1 to 2 to account for the trailing PEC byte.
A block count of 1 then updates i2c_imx->msg->len to 3 (count, data[0],
PEC), so data[0] must be ACKed and I2CR_TXAK should only be set on the
next interrupt in i2c_imx_isr_read_continue().  Setting I2CR_TXAK when
len =3D=3D 1 NACKs data[0] instead of the PEC byte, causing the target to s=
top
transmitting and the read to fail with -EBADMSG.

Checking i2c_imx->msg->len =3D=3D 2 (matching the i =3D=3D (msgs->len - 2) =
check
at i =3D=3D 0 in i2c_imx_atomic_read()) avoids NACKing early when PEC is
present.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116124430.1358=
948-1-mehmet.fide@gmail.com?part=3D1
