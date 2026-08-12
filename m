Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320A9339388
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 19:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563036; cv=none; b=mdDsYyNYvQxOYQlCndalgskPRoOce1mDBjldhSUnnpKiW3ZGYWI/2/gS/rc+PZ/+aPKQIxpGMSRIvOwBn/Mesr/PF0gzH7kRdlhwFXKnhq39+leGJvIxKuIStIR2+vpS+bg6deA7n3YzV3Etw1cGFHVbg1LXQHR/1dkFF4g9P7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563036; c=relaxed/simple;
	bh=zMatOVT6kCVHkYmNGw2U9Cqh+AI0TR63Lodo+FEwXus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UKb/9pLK/0ZDydSV3cCufzOzX3GF1DZx2v3dbB57TKia9ZkVrTEFelTQD0heLPEUP4JZl91wNNzimXIjgpc04L+UzF6xlQG4NLgdJzs6Dl2z/358LNPGi5PBOqqboMnKzgnM4v/hPm4SW8sMsPqyDfFfWxzzGIov/O65LTz6xgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6iethv6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6iethv6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8AC1F000E9;
	Wed, 12 Aug 2026 19:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786563032;
	bh=nUyIVcwP7Q3o1r9Unp6NegT2cD9jLWYsQV5ME8E69O0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W6iethv66+5tKbv/p/v8BqXt4QNvwRxaWCNQs7A1lTvkkiwsf1fAYpGmmpCUx7jPI
	 uyeqgNDuxFmq9V5bUoKlOtiD+nfrfzswh+pu7mJX8O4dL2m4J5Izd+LmzeLS8sG8+8
	 Yk4a2jNeCtEf7v2JR3x2KN0vCG6EXv8RT55QCatbl0TRsyrR2Vt3dn+UkLSuRfWF01
	 Dau092eUPdejd+0O0d0kqKyR0+GXagU6f4ycGELmB5918R0/oDR2Sw463PKrtSyoe7
	 VQR0Mc8cplPQGQvwajYp6KM4cXYoJAGbWLbaH+hWUvhmYCXqHXqWM/WAhZ+bo3eVuk
	 Df+6vlTn13c6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr>
References: <20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:30:31 +0000
Message-Id: <20260812193031.CD8AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] 0-length standard I2C reads cause an integer underflow, leadin=
g to an infinite read loop and catastrophic kernel buffer overflow or NULL =
pointer dereference.
- [High] DMA mappings are leaked on the error path if wait_for_completion_t=
imeout() times out.
--

--- Patch [1]: [PATCH v2] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTAR=
T ---
commit d4f0c04249e7ead7a9fd8aedf2465f7f1895d284
Author: Vincent Jardin <vjardin@free.fr>
Subject: i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART

This patch adds support for I2C_M_REV_DIR_ADDR and I2C_M_NOSTART flags to t=
he
i2c-imx driver. It allows inverting the transmitted R/W bit on a write mess=
age
and continuing a frame without re-addressing on subsequent reads, which is
needed for devices like the Realtek RTL8366SE SMI switch.

Link: https://lore.kernel.org/r/20260807-for-upstream-i2c-imx-lx2160-revers=
e-v1-1-f276ce8cb660@free.fr

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 9477d814fde94..7dc9c43673eee 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
[ ... ]
> @@ -1000,16 +1000,10 @@ static inline int i2c_imx_isr_write(struct imx_i2=
c_struct *i2c_imx)
>  	return 1;
>  }
> =20
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

[Severity: Critical]
This is a pre-existing issue, but does a 0-length standard I2C read cause an
integer underflow here?

When processing a standard 0-length I2C read message, such as I2C_SMBUS_QUI=
CK
with read intent, i2c_imx->msg->len is 0. Does subtracting 1 trigger an
underflow evaluating to 0xFFFF?

If so, does this cause the driver to incorrectly clear the I2CR_TXAK flag
and instruct the hardware to ACK instead of NACK, leading to an infinite re=
ad
loop in i2c_imx_isr_read_continue() where msg_buf_idx increments indefinite=
ly?

> @@ -1017,6 +1011,18 @@ static inline int i2c_imx_isr_read(struct imx_i2c_=
struct *i2c_imx)
[ ... ]
> @@ -1200,7 +1216,7 @@ static int i2c_imx_dma_write(struct imx_i2c_struct =
*i2c_imx,
>  	 * Write slave address.
>  	 * The first byte must be transmitted by the CPU.
>  	 */
> -	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
> +	imx_i2c_write_reg(i2c_imx_addr_byte(msgs), i2c_imx, IMX_I2C_I2DR);
>  	time_left =3D wait_for_completion_timeout(
>  				&i2c_imx->dma->cmd_complete,
>  				msecs_to_jiffies(DMA_TIMEOUT));

[Severity: High]
This isn't a bug introduced by this patch, but do the error paths after this
timeout leak DMA mappings?

In i2c_imx_dma_write() and i2c_imx_dma_read(), the buffer is mapped for
DMA inside i2c_imx_dma_xfer(). If wait_for_completion_timeout() returns 0,
the code calls dmaengine_terminate_sync() and returns -ETIMEDOUT without
explicitly unmapping the buffer.

Since dmaengine_terminate_sync() does not invoke the DMA completion callback
where dma_unmap_single() normally resides, does this permanently leak the
mapping and IOMMU resources if the I2C bus hangs or times out?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-for-upstre=
am-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr?part=3D1
