Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903923FB07E
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 06:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417786; cv=none; b=cMHrwA7g1Fjw1ozKhxJKB06Ymjxv+ZVtwqnOpO9UUpBV2YKqFEsLDRo5KBNWwg+D6/WhYs8wp1cJ6kzOf5OX1fIh+4fwxpQ0VRTOLzWItC4MeQLVhEthYtVjGapiFmja7ivBqdhoLaNBNzVMEGE3DgSDX0hFy2Egof6JSGEAt70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417786; c=relaxed/simple;
	bh=WBtYj87zdjrwF/MOCOa+deEXOzv4XFTuMBoC2NJnDWc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F8oOLLAeu6B7DPQ0J2fhfx39PctW/P/u7Cm1dJ+P2hQXdbUinFW0DAGQt7ZJoaNaNoGVZi1KjHWWiPHsprZeuMPDQ8Tdb2egqx4Kl5j0a5Tw7884Iv2QCiJ4LrvAgfabiiJTeSKM9E2EyxGOwDoS+0fFmyZAzM+qLXEgdETGYfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmjZ4Xq/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmjZ4Xq/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85A81F00A3A;
	Thu,  3 Sep 2026 06:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417776;
	bh=vKbcOt1AJWbUW+VtKHyfxrAg58sVmaLT070Gc/leiMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FmjZ4Xq/h9xqEB7iH2JjPh8kAtnbxKZrAyJ9pYzv4YojHSkUPQ5xLAmTxn5XARfic
	 C+E+G/ggwNGKZE4E5gDavM+GNKl9lo4RFs6uihlNcmQgQ7AU+PL5MztfMKXOy6D2MZ
	 Oy48n5+zUO6jRPiH+PhuxH4/wfOq0MFKQaTxcrOkTnJcGqiCKYG2b9YN2zWtdGRbME
	 rNF1hicmsbQ5hTdvtau6R2bif+jCsVR09NiV4kVgJVpPXEkL1e4XpA6G0xSQ6c81aq
	 10igkikLQJ3+FK1rN7Yz3ihlNQP7mVQCycRwFqUsIv8auzY5p8MYFCdniMBoB7f/IX
	 nqrkeG9PDk0lA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] i2c: imx: honour I2C_M_IGNORE_NAK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haobin Jiang" <lemonoutput@foxmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <tencent_E6A52FBBB25132C90B8E296FEB96E2C8CA07@qq.com>
References: <tencent_E6A52FBBB25132C90B8E296FEB96E2C8CA07@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 06:42:56 +0000
Message-Id: <20260903064256.A85A81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] I2C_M_STOP is silently ignored during multi-message transfers, des=
pite advertising I2C_FUNC_PROTOCOL_MANGLING.

Pre-existing issues:
- [Critical] Out-of-bounds write (NULL pointer dereference) in i2c_imx_isr_=
read_continue when processing a 0-length I2C read message, leading to a ker=
nel panic.
- [High] DMA mapping leak on timeout in i2c_imx_dma_write() and i2c_imx_dma=
_read().
--

commit 1b0aa275631abf14132713ff5c98382e23b787c9
Author: Haobin Jiang <lemonoutput@foxmail.com>

i2c: imx: honour I2C_M_IGNORE_NAK

This patch advertises I2C_FUNC_PROTOCOL_MANGLING and implements the
I2C_M_IGNORE_NAK flag for the i.MX I2C controller. It rejects unsupported
mangling flags but allows I2C_M_STOP, continuing the transfer despite NAKs
when requested.

Link: https://patchwork.ozlabs.org/project/linux-i2c/patch/1467900229-5262-=
1-git-send-email-tharvey@gateworks.com/ # [1]
Link: https://lore.kernel.org/linux-i2c/4D46D571.5010907@armadeus.com/ # [2]
Link: https://patchwork.ozlabs.org/project/linux-i2c/patch/1378857490-30968=
-1-git-send-email-luka@openwrt.org/ # [3]

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 28313d0fad37e..5b22a497a7917 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1002,7 +1009,7 @@ static inline int i2c_imx_isr_read(struct imx_i2c_s=
truct *i2c_imx)
>  	int result;
>  	unsigned int temp;
> =20
> -	result =3D i2c_imx_isr_acked(i2c_imx);
> +	result =3D i2c_imx_isr_acked(i2c_imx, i2c_imx->msg->flags & I2C_M_IGNOR=
E_NAK);
>  	if (result)
>  		return result;

[Severity: Critical]
This is a pre-existing issue, but can a 0-length I2C read message cause a
kernel panic during the ISR read sequence?

When a user-space application issues an I2C_RDWR ioctl with a 0-length read
message (len =3D 0, I2C_M_RD), the i2c-dev subsystem allocates the buffer v=
ia
memdup_user(..., 0), which returns ZERO_SIZE_PTR (0x10). The message is
passed to i2c_imx_read(), starting the ISR state machine.

In i2c_imx_isr_read_continue(), the driver attempts to detect the end of the
buffer using the following bounds check:

	if ((i2c_imx->msg->len - 1) =3D=3D i2c_imx->msg_buf_idx) {
		...
	} else if (i2c_imx->msg_buf_idx =3D=3D (i2c_imx->msg->len - 2)) {
		...
	}

Because msg->len is 0 (a __u16), len - 1 promotes to int and evaluates to -=
1.
When compared to the unsigned int msg_buf_idx (0), -1 is cast to 4294967295,
so the condition evaluates to false. The subsequent len - 2 check also
evaluates to false.

The driver then unconditionally executes:
	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] =3D imx_i2c_read_reg(...)

This writes directly to the unmapped ZERO_SIZE_PTR buffer (address 0x10) and
crashes the system.

[ ... ]

> @@ -1213,7 +1220,8 @@ static int i2c_imx_dma_write(struct imx_i2c_struct =
*i2c_imx,
>  	if (result)
>  		return result;
> =20
> -	return i2c_imx_acked(i2c_imx);
> +	/* I2C_M_IGNORE_NAK messages always take the PIO path. */
> +	return i2c_imx_acked(i2c_imx, msgs->flags & I2C_M_IGNORE_NAK);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does the DMA timeout error p=
ath
leak the DMA mappings?

In i2c_imx_dma_write() and i2c_imx_dma_read(), when an I2C DMA transfer tak=
es
longer than DMA_TIMEOUT (1 second) due to hardware stalls or faulty devices,
the code aborts the transaction:

	if (time_left =3D=3D 0) {
		dmaengine_terminate_sync(dma->chan_using);
		return -ETIMEDOUT;
	}

Calling dmaengine_terminate_sync() aborts the active descriptor without
executing the callback (i2c_imx_dma_callback()). As a result,
dma_unmap_single() is never called for the aborted transaction, permanently
leaking the DMA mapping.

[ ... ]

> @@ -1549,6 +1557,16 @@ static int i2c_imx_xfer_common(struct i2c_adapter =
*adapter,
>  	bool is_lastmsg =3D false;
>  	struct imx_i2c_struct *i2c_imx =3D i2c_get_adapdata(adapter);
>  	int use_dma =3D 0;
> +	u16 mangling =3D I2C_M_NO_RD_ACK | I2C_M_REV_DIR_ADDR;
> +
> +	/*
> +	 * Only I2C_M_IGNORE_NAK is implemented; reject the unsupported
> +	 * mangling flags.  I2C_M_STOP is the controller's native
> +	 * behaviour and must not be rejected.
> +	 */
> +	for (i =3D 0; i < num; i++)
> +		if (msgs[i].flags & mangling)
> +			return -EOPNOTSUPP;

[Severity: High]
Does this code silently ignore the I2C_M_STOP flag during multi-message
transfers?

By adding I2C_FUNC_PROTOCOL_MANGLING to i2c_imx_func(), this patch advertis=
es
support for protocol mangling flags, including I2C_M_STOP. The new check ab=
ove
intentionally allows the I2C_M_STOP flag to pass.

However, in the multi-message loop in i2c_imx_xfer_common():

		if (i) {
			dev_dbg(&i2c_imx->adapter.dev,
				"<%s> repeated start\n", __func__);
			temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
			temp |=3D I2CR_RSTA;
			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);

The driver unconditionally emits a Repeated START (I2CR_RSTA) for all
subsequent messages (i > 0). If a client driver sets the I2C_M_STOP flag on=
 a
message, the hardware fails to emit the requested STOP and will emit a
Repeated START instead.

Could devices relying on a STOP condition between messages (which is the
explicit purpose of I2C_M_STOP) malfunction or lock up due to receiving a
Repeated START instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_E6A52FBBB25=
132C90B8E296FEB96E2C8CA07@qq.com?part=3D1
