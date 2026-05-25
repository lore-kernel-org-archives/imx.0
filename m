Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508A6188CC9
	for <imx@lists.linux.dev>; Mon, 25 May 2026 18:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779733461; cv=none; b=te8dlCVSrqOruReSORMVwGSWOvv2nRs3LuSq/448W66je93hPplAqO4G8LBEO/Zt5Csr98PCMhOtRK6435y0joccoikh/cEQ4GrbvT5W0UXM0h2gd5YTNX9cjXhWiFk+HIHc9jHOrTkUu5r00sP5rEBx41EaWdEoZF38N/7YKBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779733461; c=relaxed/simple;
	bh=NQk+oMG5m3QFukfwJzSIPE0+apaOr3io1PM2fs36h9E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=txPAZUD2r2hRRZ2kyT1D8wp/Bqi3Y3ownnhMCY7M1rSOsfOGoMLXZpVVKyZbaFtZ4ItZHFDrBVfMJGK93cTDDsCz/o6HS42qSfA5V8j1lHxa+40LMuPdr3gxlR8W4ndd88/+8Y0jTXneCU+z0b82JDnjDX88WrWIceKyxw9e4xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyxzOxwP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyxzOxwP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AA01F000E9;
	Mon, 25 May 2026 18:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779733460;
	bh=7nP2/up9CUKbjq5X7AtwDnet1Lgq/dwNG42KZB+wg9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RyxzOxwPN3jDYOJp0jnqGIett0RU7g9lfjsmP6HZ7c1MZEFFc72r/ILFnG9ToflGm
	 K3vKmRL5q4p8sm3h4oiaX+ideianiPMwEoW9o//H0l/KC6Tv4wKfcaZtmL+C7d75sW
	 oJbCDtU9kJgJGjFxdWD4oDXu7Jtr/dO3IT7R68ge9Dxq1LAY8j1h9gZsgOyPv19Awb
	 X/Kat+jKpHx+T/WE1B81CexmJPN9hTqFbEZXLAF/+fvuA0TlqYMi/Hh44qAT3RQDYL
	 pr9BrSJFWufU6rs3GCI9pp6lTAEszjVrhMFMLmQi5kmph4taZDfVbn686gkc8kpZpJ
	 TN/71majUQjCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] i2c: imx: fix locked bus on SMBus block-read of
 0 (IRQ)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-2-26a3cc8cd055@free.fr>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-2-26a3cc8cd055@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 18:24:19 +0000
Message-Id: <20260525182420.05AA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to set the NACK flag (`TXAK`) when an SMBus block=
 read returns a length of 1, which can cause the I2C bus to hang, similar t=
o the bug fixed by this patch for length 0.
--

commit 3601c9783ae8f09fb48838879c5dca5379ed7e27
Author: Vincent Jardin <vjardin@free.fr>

i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)

This commit updates the interrupt-driven SMBus block read state machine to
support a length of 0 bytes, setting the NACK bit for the in-flight dummy
byte to avoid bus hangs. It also safely aborts reads larger than the maximum
allowed size by setting the NACK bit before returning an error.

Cc: <stable@vger.kernel.org> # v6.13+

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 14107e1ad4138..8db8d2e10f5c5 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1061,11 +1061,28 @@ static inline enum imx_i2c_state i2c_imx_isr_read=
_continue(struct imx_i2c_struct
>  static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct=
 *i2c_imx)
>  {
>  	u8 len =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +	unsigned int temp;
> =20
>  	if (len =3D=3D 0 || len > I2C_SMBUS_BLOCK_MAX) {

[ ... ]

>  		i2c_imx->isr_result =3D -EPROTO;
>  		i2c_imx->state =3D IMX_I2C_STATE_FAILED;
>  		wake_up(&i2c_imx->queue);
> +		return;
>  	}
>  	i2c_imx->msg->len +=3D len;
>  	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] =3D len;

[Severity: High]
This is a pre-existing issue, but does this function also need to set the
TXAK bit when len is exactly 1?

When the length byte is read here, the hardware immediately starts clocking
in the next byte, which is the first data byte. If the block read length is
exactly 1, this first data byte is also the last byte of the transfer.

Because TXAK is explicitly cleared earlier in i2c_imx_isr_read for length
transfers, the controller will ACK this final data byte if TXAK is not set
at this point.

If the slave holds SDA low as a result of receiving an ACK instead of a NACK
on its final byte, would the subsequent attempt to generate a STOP condition
in i2c_imx_isr_read_continue fail and permanently hang the bus?

The atomic path in i2c_imx_atomic_read appears to handle this safely by
setting TXAK when reading the second-to-last byte.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-for-upstre=
am-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr?part=3D2
