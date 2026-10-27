Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125141;
	b=Vth8piJA52FbGl/qZ1FcPcltHaSARbphoJNmLCEWxFXW12CbRh2lm18Ydh65ftCILZcE
	 YgaSxzyQph/jDJru0O877E8EC2LKVrVww4X60oP9Wes9FITAudamCIKXqJ6HGMV30D3Vr
	 wWN9RYGgzAS5rgwfC8DA5EQbPc/2DyhHEQfLWuryAx/bLvhhW5ddr9QU/sLnH0BSTAEwk
	 6RXRA4w6V7uQk8x1x48As1W6Iowvi0+lomyZmbAENYJbd3OQ4rJnTsB1LyoJQLlcn6Fmu
	 j5xNIVBBwm3h6SOueZf8yZ4v3qXSoUy7ijzx1e3U/i6dxSelJ1Q4T1kYwUXEhPBrHmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125141;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pzwE4136bPxhbecYAmodZrZXgOfxuMwE7vVB8kRl5og=;
	b=XtMiitpVkAJrhUhgMuTvo3OeOeJ3hvc3fuawcpluH3DPn8Veb4TuDVzc9rPpZeXyKoux
	 CsDFVLi9NZTLATRcskdxqTLsc+tEtd9WFt2EIs5ryeAEgAxMRDUTHJkI+CxrPKnxo1Zbu
	 aIlsdSuBd1kMNINpVmZuORJqgm1qSdI5hQGEDOCKieupMXfc/VscP2Nn3PtNqJCtgKomy
	 ZUiJJ6bkiPyr/+Jms5OspOpb3xvZwLLNSaedm1X9gp1OWVy5pWUQ3UkJqk5/ZUmM0Xiov
	 FoYF9MTrflvEqV76OFIg28eNKFkNmj0kfhlgvHQXr1YG9PKUvsSMxieS0jbDHSayy1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mmZPw9L5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCB5606A31D
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 18:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mmZPw9L5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F7B1F031E0;
	Tue, 27 Oct 2026 18:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793125140;
	bh=pzwE4136bPxhbecYAmodZrZXgOfxuMwE7vVB8kRl5og=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mmZPw9L5MuvBJNODfLs8OgYpNPAXk1jrRbhYNb6r+HbUjGRteXv3oD6sYHGYW+qyk
	 dDOCskS0a412GlTkIzMgs0CsthfNC1NSBVkbhV44RhQ3EUWYTni9nBKkno0OyRdiq3
	 HFlg4n5cbQhPpxLdqEoqBUyMGje2cWPRglHB+Qc/72E1LMAK7BiNvvesbnZPMa33o+
	 ak55Lb8Wfa0CajT5JuRtGZzS5cwRLZmIwe6fRceYH5u2s4D5ocADyJNVHY2Oq/Tnef
	 jBLbSon3A5zdMZUmU9J5a9rq/sAFyKXfa/M8m3DI2xN9WumNLfPRTzycb5uVLVdepO
	 3ZmEFs1hgiklg==
Message-ID: <sashiko-outbox-187010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] i2c: imx: honour I2C_M_IGNORE_NAK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haobin Jiang" <lemonoutput@foxmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <tencent_877C99956190215D644EB959DF1663542A0A@qq.com>
References: <tencent_877C99956190215D644EB959DF1663542A0A@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 18:18:59 +0000
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
- [High] i2c: imx: out-of-bounds write on zero-length read in i2c_imx_isr_r=
ead()
--

commit 9dd0c3d38f0968bb16ae7d2a6e9822f507de880e
Author: Haobin Jiang <lemonoutput@foxmail.com>

i2c: imx: honour I2C_M_IGNORE_NAK

This commit honours I2C_M_IGNORE_NAK in the i.MX I2C controller driver by
removing I2C_M_IGNORE_NAK and I2C_M_STOP from the unsupported protocol
mangling flags and ignoring missing ACKs when I2C_M_IGNORE_NAK is set.
Messages with I2C_M_IGNORE_NAK are also forced to use the non-DMA transfer
path.

Link: https://patch.msgid.link/20261023-for-upstream-i2c-imx-lx2160-reverse=
-v3-1-a07b249df381@free.fr # [1]
Link: https://lore.kernel.org/linux-i2c/tencent_342A87BFCECA70C9982E68A79AA=
D878B6909@qq.com/ # [2]

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151f..8e422b45dc2bb 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c

[ ... ]

> @@ -988,7 +995,7 @@ static inline int i2c_imx_isr_write(struct imx_i2c_st=
ruct *i2c_imx)
>  {
>  	int result;
> =20
> -	result =3D i2c_imx_isr_acked(i2c_imx);
> +	result =3D i2c_imx_isr_acked(i2c_imx, i2c_imx->msg->flags & I2C_M_IGNOR=
E_NAK);
>  	if (result)
>  		return result;
> =20
> @@ -1017,7 +1024,7 @@ static inline int i2c_imx_isr_read(struct imx_i2c_s=
truct *i2c_imx)
>  {
>  	int result;
> =20
> -	result =3D i2c_imx_isr_acked(i2c_imx);
> +	result =3D i2c_imx_isr_acked(i2c_imx, i2c_imx->msg->flags & I2C_M_IGNOR=
E_NAK);
>  	if (result)
>  		return result;
> =20

[Severity: High]
What happens here if a zero-length read message (msg->len =3D=3D 0 with
I2C_M_RD) is transferred, particularly now that I2C_M_IGNORE_NAK allows
i2c_imx_isr_acked() to succeed even when no device ACKs the address byte?

In i2c_imx_check_msgs(), zero-length messages are only rejected when
I2C_M_NOSTART is set:

drivers/i2c/busses/i2c-imx.c:i2c_imx_check_msgs() {
	...
		if (msgs[i].flags & I2C_M_NOSTART) {
			if (i =3D=3D 0 || msgs[i].len =3D=3D 0)
				return -EOPNOTSUPP;
	...
}

Unlike i2c_imx_isr_write(), which checks whether i2c_imx->msg->len =3D=3D
i2c_imx->msg_buf_idx after i2c_imx_isr_acked(), i2c_imx_isr_read()
unconditionally calls i2c_imx_setup_read() and transitions the state machine
in i2c_imx_master_isr() to IMX_I2C_STATE_READ_CONTINUE:

drivers/i2c/busses/i2c-imx.c:i2c_imx_setup_read() {
	...
	temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
	temp &=3D ~I2CR_MTX;
	if ((i2c_imx->msg->len - 1) || (i2c_imx->msg->flags & I2C_M_RECV_LEN))
		temp &=3D ~I2CR_TXAK;

	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
	imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR); /* dummy read */
}

When msg->len is 0, (i2c_imx->msg->len - 1) is non-zero, so
i2c_imx_setup_read() clears I2CR_MTX and I2CR_TXAK and performs a dummy read
of IMX_I2C_I2DR, causing the controller to clock in a data byte. When that
byte completes, i2c_imx_master_isr() -> i2c_imx_isr_read_continue() runs:

drivers/i2c/busses/i2c-imx.c:i2c_imx_isr_read_continue() {
	...
	if ((i2c_imx->msg->len - 1) =3D=3D i2c_imx->msg_buf_idx) {
		...
	} else if (i2c_imx->msg_buf_idx =3D=3D (i2c_imx->msg->len - 2)) {
		...
	}

	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] =3D imx_i2c_read_reg(i2c_imx, IM=
X_I2C_I2DR);
	return next_state;
}

Because msg->len is 0, neither (msg->len - 1) nor (msg->len - 2) matches
msg_buf_idx, so i2c_imx_isr_read_continue() writes out of bounds into
i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] on every interrupt (dereferencing
ZERO_SIZE_PTR when called via I2C_RDWR ioctl with len =3D=3D 0, or overflow=
ing
msgbuf0 on the stack during an emulated SMBus Quick Read). Similarly, in
i2c_imx_atomic_read() -> i2c_imx_prepare_read(), the controller is switched
to receive mode and performs a dummy read even when msgs->len is 0.

Should zero-length reads be handled before calling i2c_imx_setup_read(), or
rejected via adapter quirks / i2c_imx_check_msgs()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_877C9995619=
0215D644EB959DF1663542A0A@qq.com?part=3D1
