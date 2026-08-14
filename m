Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829B41D8E01
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 13:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786715386; cv=none; b=i20iloHzAVpKmBMuje5bbcYDewHTUDBNv2Q3e8EsXAzDGLWWjjRhveY7s8YxaigsESQYCWEbh2IJe+F4fc/QUt7aw5tKkDYhLFL4soBUlnA8QpFZDr0q5ZYJkAeRrOFX5VLNl98N5TH9Qmw11aplj0ZM3Mdf+4Mj7PE2FqH5Ubo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786715386; c=relaxed/simple;
	bh=MGXqLsIv4kogP+TSgm0fW/HOEhhmSmnXbsjFksYIRFo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OqlLvHcWLq1eQ5vfRKQ3O+0p0ENvEEL7QAlxk4lBB6+qkx5/89QLD7OhQG33dECeDMHVOCfdRctQO+/vJ5n6EbomSRj7yPT8YF59DgLP6Xs2LtTV36qX9ZW8GwEQYLCbUU4OzPRz82AShQno9hMOEmpkSa6hFQsW6zdEkIwbVaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUf0zYgh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUf0zYgh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1321F000E9;
	Fri, 14 Aug 2026 13:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786715385;
	bh=/MJf0TlZPJoJXmuLAZ51YRWZqM+oH2nQMNA1O/ppcZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dUf0zYghgkS9TbfaL80DX4MgLlS/pd4dZa3dWbkG0yxkSI/pZqFnLNuDUeNdRtUzt
	 m3/hGqQHwMIaX665eaHuPET8ZHPhKvxI36vubM4xQGfgB8seXwEUxUYPrJICaDgvWs
	 sppBcNrJdNjYmUpIeiIvQslaRdip0Xx/JIjwPKzjO+glqyJiEhe/bA3Q88ODvpJGLV
	 Rw04xuW5SImBJ0eil+BMS1GD9NrT2B0uVfbVKEiavN5p06rlIHn0ymAXP58fpy0t7B
	 vKsn5a3FlfeHeNmyCyHXYBWJ3G5aCPmQYhQ8sSNwHTi66KvAaCF8x1N2s63alMIPUS
	 HT5+I78oqFQ7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: mxs: fix DMA channel leak on probe error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruoyu Wang" <ruoyuw560@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260814134033.1386874-1-ruoyuw560@gmail.com>
References: <20260814134033.1386874-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 13:49:44 +0000
Message-Id: <20260814134944.EB1321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver maps client-provided `msg->buf` directly for DMA withou=
t using `i2c_get_dma_safe_msg_buf()`, leading to potential memory corruptio=
n.
- [High] The driver ignores the return value of `dma_map_sg()`, risking DMA=
 engine faults and memory corruption if mapping fails.
- [High] The `timeout` error path in `mxs_i2c_xfer_msg()` unmaps DMA buffer=
s without terminating the active DMA channel, leading to potential use-afte=
r-unmap and double-unmap bugs.
--

--- Patch [1]: [PATCH] i2c: mxs: fix DMA channel leak on probe error ---
commit b8eb950d1bfe51582e811624063eaccb540a465b
Author: Ruoyu Wang <ruoyuw560@gmail.com>

i2c: mxs: fix DMA channel leak on probe error

This commit fixes a DMA channel leak when mxs_i2c_probe() fails during
controller reset or adapter registration. It ensures dma_release_channel()
is called on these error paths.

> diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
> --- a/drivers/i2c/busses/i2c-mxs.c
> +++ b/drivers/i2c/busses/i2c-mxs.c
[ ... ]
> @@ -197,6 +197,7 @@ static void mxs_i2c_dma_setup_xfer(struct i2c_adapter=
 *adap,
> =20
>  		/* Queue the DMA data transfer. */
>  		sg_init_one(&i2c->sg_io[0], &i2c->addr_data, 1);
>  		dma_map_sg(i2c->dev, &i2c->sg_io[0], 1, DMA_TO_DEVICE);

[Severity: High]
This isn't a bug introduced by this patch, but does this code ignore the
return value of dma_map_sg()?

If mapping fails under memory pressure or IOMMU fragmentation, dma_map_sg()
will return 0, and the unmapped scatterlist will be queued to the DMA engin=
e,
which could lead to DMA hardware accessing invalid memory.

This pattern also occurs later in mxs_i2c_dma_setup_xfer() for both the read
and write transfer mapping paths.

[ ... ]
> @@ -227,6 +227,7 @@ static void mxs_i2c_dma_setup_xfer(struct i2c_adapter=
 *adap,
> =20
>  		/* Queue the DMA data transfer. */
>  		sg_init_one(&i2c->sg_io[1], msg->buf, msg->len);
>  		dma_map_sg(i2c->dev, &i2c->sg_io[1], 1, DMA_FROM_DEVICE);

[Severity: High]
This is a pre-existing issue, but is it safe to map the client-provided
msg->buf directly for DMA here?

The I2C subsystem allows clients to pass stack or vmalloc buffers for
standard transfers. Without allocating a bounce buffer via
i2c_get_dma_safe_msg_buf(), this could result in direct DMA into stack
memory and cause memory corruption.

This direct mapping also occurs in the write transfer path below.

[ ... ]
> @@ -629,6 +634,7 @@ static int mxs_i2c_xfer_msg(struct i2c_adapter *adap,=
 struct i2c_msg *msg,
>  timeout:
>  	dev_dbg(i2c->dev, "Timeout!\n");
>  	mxs_i2c_dma_finish(i2c);

[Severity: High]
This is a pre-existing issue, but does the timeout handler fail to terminate
the pending DMA transaction?

Since dmaengine_terminate_sync() is not called after a timeout, the active
DMA engine might continue accessing the unmapped memory.

If it eventually finishes, mxs_i2c_dma_irq_callback() could run and call
mxs_i2c_dma_finish() a second time on the same buffers.

>  	ret =3D mxs_i2c_reset(i2c);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814134033.1386=
874-1-ruoyuw560@gmail.com?part=3D1
