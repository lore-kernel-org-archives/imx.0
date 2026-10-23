Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744463;
	b=AeM069NXJYpGXXltbSl8++ZjkpZ79mroucWiF0XXGd3ul4Y8nRR1llsypqdoLc7blepd
	 PVQkV8Qm9z5scSvMQUGhLuGqhVD0wtNxQq/Q4LQxjmQiq0E788N+GDHfn9I/CVYJ/g1jB
	 CSRisVrf0Q3hyM9cvUrLV4okAN6/q/Ofq0volOYidb4qGFBc4jXbahN7oqVfMCRtJVoQj
	 Vb2+AZ5MBCp7qTWh423/2cgJA9P5pP9y110S2zKBF68ybqwg/eu5WWuOHfBwZbZC9kyoy
	 5xdEFuWeg8xSOYP+oAQFEsxPB9frpJfSSBcol5n/NzynsOm6amjbXyWNRpiuHSK6Hhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744463;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jHyrHAn9Pm9k7aVG6yFl3IocVg0ngVlwIhSuO8Q/evs=;
	b=HWxnUXmi7R1I8QEKggqKf8rKRs2OsR7tEEOXXZkvcIgtjVlYldE6MP1g735kDRffgB7g
	 MqNf6HLTocLBD5CZKZ7miwj+3TZ8vsmLoYQH1L7Q9Xecu8diVWP5agJ7nYxYr+3Lmpybu
	 2kB4MwD4JPKbu7CgNM5nLqGZ95f1acnX1LGZrDEkZ6d4ACSmHG6d1U++bRkJ0MB/K31/R
	 qIS9k9VLm6SdmdUSzMzBOIDDzQYZj2Q2cIhAONke7qbof46S3cnnbGUm4bLhks9c6mX4H
	 SOk/88JAiX3oY057iTyAK3m61bkK5SgAuKD30hxx7+6DLT37/RZVdtSTU46KxeW7OtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LHF7DI/F";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A724F606A322
	for <imx@lists.linux.dev>; Fri, 23 Oct 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHF7DI/F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E441F031E0;
	Fri, 23 Oct 2026 08:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792744462;
	bh=jHyrHAn9Pm9k7aVG6yFl3IocVg0ngVlwIhSuO8Q/evs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LHF7DI/Fg+xqsDugKsxm6SgDGHAEZaF5mABvIToYiFPJRW6yL8tSyJ0SV5030Ho3n
	 d5GWYdIppECQjJl4SbpgwF3JcQko12LsfoCZvPoxPCpjnH83adO3H52FZBsdbB1Eya
	 LjMiFNbjNfiMXWHoUpBaVRlpXiQv0OTcQq9/WIFbIrPJEBxkyU95uDF91XTdjybNMf
	 mVbsJ0ZY0hqitIxVv/p98JBNyjrBbvIW8JvChR0URsIlk8XACqKN+xc4oASHfgjXpr
	 rSqz9DW/beZT0JtgOmqQiy3Vcpsg80MyaFO0IBdE4byYr9xiZICOWTVIGbcXoeBtR5
	 ajPt4gQyNXXIA==
Message-ID: <sashiko-outbox-182524@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2] i2c: imx: add I2C_M_REV_DIR_ADDR and
 I2C_M_NOSTART
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261023-for-upstream-i2c-imx-lx2160-reverse-v2-1-03afae754886@free.fr>
References: <20261023-for-upstream-i2c-imx-lx2160-reverse-v2-1-03afae754886@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 08:34:21 +0000
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
- [Medium] i2c: imx: premature NACK on read messages followed by I2C_M_RD |=
 I2C_M_NOSTART
--

commit cc53d2cc1adbe1a23f92c25512b4a73a38c5f255
Author: Vincent Jardin <vjardin@free.fr>

i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART

This commit adds support for I2C_M_REV_DIR_ADDR and I2C_M_NOSTART to the
i2c-imx driver so that devices such as the Realtek RTL8366SE switch can
perform SMI read frames. It also adds message validation in
i2c_imx_check_msgs() and advertises I2C_FUNC_NOSTART and
I2C_FUNC_PROTOCOL_MANGLING.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 9477d814fde94..7dc9c43673eee 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c

[ ... ]

> @@ -1529,22 +1561,29 @@ static int i2c_imx_read(struct imx_i2c_struct *i2=
c_imx, struct i2c_msg *msgs,
> =20
>  	dev_dbg(&i2c_imx->adapter.dev,
>  		"<%s> write slave address: addr=3D0x%x\n",
> -		__func__, i2c_8bit_addr_from_msg(msgs));
> +		__func__, i2c_imx_addr_byte(msgs));
> =20
>  	i2c_imx->is_lastmsg =3D is_lastmsg;
> =20
> -	if (block_data)
> -		i2c_imx->state =3D IMX_I2C_STATE_READ_BLOCK_DATA;
> -	else
> -		i2c_imx->state =3D IMX_I2C_STATE_READ;
>  	i2c_imx->msg =3D msgs;
>  	i2c_imx->msg_buf_idx =3D 0;
> =20
> -	/*
> -	 * By writing the device address we start the state machine in the ISR.
> -	 * The ISR will report when it is done or when it fails.
> -	 */
> -	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
> +	if (msgs->flags & I2C_M_NOSTART) {
> +		i2c_imx->state =3D block_data ? IMX_I2C_STATE_READ_BLOCK_DATA_LEN
> +					    : IMX_I2C_STATE_READ_CONTINUE;
> +		i2c_imx_setup_read(i2c_imx);
> +	} else {
> +		if (block_data)
> +			i2c_imx->state =3D IMX_I2C_STATE_READ_BLOCK_DATA;
> +		else
> +			i2c_imx->state =3D IMX_I2C_STATE_READ;
> +
> +		/*
> +		 * By writing the device address we start the state machine in the ISR.
> +		 * The ISR will report when it is done or when it fails.
> +		 */
> +		imx_i2c_write_reg(i2c_imx_addr_byte(msgs), i2c_imx, IMX_I2C_I2DR);
> +	}

[ ... ]

> @@ -1574,6 +1613,33 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c=
_imx, struct i2c_msg *msgs,
>  	return ret;
>  }
> =20
> +#define I2C_IMX_UNSUPPORTED_PROTOCOL_MANGLING_FLAGS \
> +	(I2C_M_IGNORE_NAK | I2C_M_NO_RD_ACK | I2C_M_STOP)
> +
> +static int i2c_imx_check_msgs(struct i2c_msg *msgs, int num)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < num; i++) {
> +		/* Reject rather than silently transfer */
> +		if (msgs[i].flags & I2C_IMX_UNSUPPORTED_PROTOCOL_MANGLING_FLAGS)
> +			return -EOPNOTSUPP;
> +
> +		if (msgs[i].flags & I2C_M_NOSTART) {
> +			/*
> +			 * NOSTART continues an already open frame. The first
> +			 * message has nothing to continue from,
> +			 * a 0 length continuation leaves the controller with
> +			 * no byte to clock.
> +			 */
> +			if (i =3D=3D 0 || msgs[i].len =3D=3D 0)
> +				return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
What happens if a caller splits a read across two messages, passing
msgs[i - 1] with I2C_M_RD followed by msgs[i] with I2C_M_RD | I2C_M_NOSTART?

In i2c_imx_check_msgs(), that sequence is accepted as long as i > 0 and
msgs[i].len > 0. However, the read paths for msgs[i - 1]
(i2c_imx_setup_read(), i2c_imx_isr_read_continue(), i2c_imx_prepare_read(),
i2c_imx_atomic_read(), and i2c_imx_dma_read()) unconditionally set I2CR_TXAK
on the last byte of msgs[i - 1] and set I2CR_MTX before reading the final b=
yte
from IMX_I2C_I2DR:

drivers/i2c/busses/i2c-imx.c:i2c_imx_isr_read_continue() {
	if ((i2c_imx->msg->len - 1) =3D=3D i2c_imx->msg_buf_idx) {
		...
		temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
		temp |=3D I2CR_MTX;
		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
		next_state =3D IMX_I2C_STATE_DONE;
	} else if (i2c_imx->msg_buf_idx =3D=3D (i2c_imx->msg->len - 2)) {
		temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
		temp |=3D I2CR_TXAK;
		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
	}
}

Because the controller sends a NACK at the end of msgs[i - 1], the target
device aborts transmission and releases SDA. When msgs[i] then runs
i2c_imx_setup_read() (or i2c_imx_prepare_read() in atomic mode), it clears
I2CR_MTX, performs another dummy read of IMX_I2C_I2DR, and clocks in 0xff f=
or
the remainder of the transfer.

Should i2c_imx_check_msgs() reject I2C_M_RD | I2C_M_NOSTART when preceded by
an I2C_M_RD message (or conversely, when a non-final read message is follow=
ed
by I2C_M_NOSTART), or should the read state machine suppress I2CR_TXAK,
I2CR_MTX, and the second dummy read across the message boundary?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-for-upstre=
am-i2c-imx-lx2160-reverse-v2-1-03afae754886@free.fr?part=3D1
