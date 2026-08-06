Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466C51F427C
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 22:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786056485; cv=none; b=om1eABQYULF0Fp7QN/HwrPlZEkUEc8CU/+sk/IB86Es61Yo6htyohl6QesPVUK/ssKe4TAQ8oaSdGtJHwCqsx1WczTuaS1dUdIx3XoanJ3yWE/V8Gkg2KHEqNfOXtbOcZKTg2szqhA57vw/u3kuLXn8xAn15gQZ/QGfe+/nBQWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786056485; c=relaxed/simple;
	bh=eb5z1gvncH8aDJsFICL4VqdwtDPpFVZvXzgWSJDy8GI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t1SxJAHOZm2LQVdk4TaoCFe+35fTeKGZKabClN+0ZI9snjRiKGCnetq6NlytrgAuPL6kCgPiaAYbxL0Vwr6+vQNLicm7iKF2t1gN2vGEK6+smw6e6son9fw38HhdQYToE17iZ4E36rsFYvbIo0Bhw64FaoFY24ZIJikMD/dfALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzMkLxJl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzMkLxJl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF921F000E9;
	Thu,  6 Aug 2026 22:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786056483;
	bh=j6pI6b5L27FaUnsmKupiocIshPMTVtVrg5aWgnUlYHI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RzMkLxJlU5GF/vhhbRZp3zWXmwG5QFGpt0DsM+Ij5cvgCbg3wdtHTnz4LXM53HbUN
	 nV8wi/R7v+ZJWHfa7HEuKP7ApoAb0z2nbR5GEXznDvYCBUW5qE7DoZU136bubMGOhd
	 5ZBree7utx+uJRmYJOis2xqiwAkCNIIXwOA1w4zXps/uq7PU75RDBrQH99gyC31g8B
	 WXbT9RvDNHUzo9Zr+7rTZGtmWLBZUbBIK4vVGsBfySKF28otC1uKSytxU6mbcOqLc+
	 ux9cOdhIxSTCwNLGvFiZu/62/OTM0ypwUEBP+ZfUfhKlZ+WZeuIkMJu8rZyq67aX6F
	 z/uMHyPO/ElJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260807-for-upstream-i2c-imx-lx2160-reverse-v1-1-f276ce8cb660@free.fr>
References: <20260807-for-upstream-i2c-imx-lx2160-reverse-v1-1-f276ce8cb660@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:48:02 +0000
Message-Id: <20260806224803.8CF921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Zero-length I2C reads cause a NULL pointer dereference and kernel =
panic in the interrupt handler due to integer underflow.
--

--- Patch [1]: [PATCH] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART -=
--
commit 600d2bffc8575545709ea03b9e6d37e2e2b2e812
Author: Vincent Jardin <vjardin@free.fr>

i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
   =20
This commit adds support for I2C_M_REV_DIR_ADDR and I2C_M_NOSTART flags in
the i2c-imx driver. It modifies the read/write paths and ISR to handle
messages that continue frames without re-addressing or invert the R/W bit.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
[ ... ]
> -static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
> +static inline void i2c_imx_setup_read(struct imx_i2c_struct *i2c_imx)
>  {
> -	int result;
>  	unsigned int temp;
> =20
> -	result =3D i2c_imx_isr_acked(i2c_imx);
> -	if (result)
> -		return result;
> -
> -	/* setup bus to read data */
>  	temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  	temp &=3D ~I2CR_MTX;
>  	if ((i2c_imx->msg->len - 1) || (i2c_imx->msg->flags & I2C_M_RECV_LEN))
> @@ -1017,6 +1011,18 @@ static inline int i2c_imx_isr_read(struct imx_i2c_=
struct *i2c_imx)
> =20
>  	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
>  	imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR); /* dummy read */
> +}

[Severity: High]
This is a pre-existing issue, but can a zero-length I2C read cause an integ=
er
underflow here?

When an application uses the I2C_RDWR ioctl with a read message of length 0,
would (i2c_imx->msg->len - 1) underflow to a non-zero value and bypass the
intended logic to NACK the read?

If this underflows, the driver appears to clear I2CR_TXAK and issues a dummy
read to start data reception. Later, in i2c_imx_isr_read_continue(), the
underflowed length values bypass the loop termination conditions:

    if ((i2c_imx->msg->len - 1) =3D=3D i2c_imx->msg_buf_idx) {
        ...
    } else if (i2c_imx->msg_buf_idx =3D=3D (i2c_imx->msg->len - 2)) {
        ...
    }

    i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] =3D imx_i2c_read_reg(i2c_imx,=
 IMX_I2C_I2DR);

Since the I2C core sets msg->buf to NULL for zero-length messages, does this
result in the driver writing to a NULL pointer and causing a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-for-upstre=
am-i2c-imx-lx2160-reverse-v1-1-f276ce8cb660@free.fr?part=3D1
