Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CA8F9C0
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 06:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045852; cv=none; b=iAmpb56FbjCAt/K7yudogzvv/0AVoJ1NpL9aDmM/UQEnKS1dQ+hyj/kLNV//AU68tU1GaafWjdZGe2PyB7mocGPOQ12zCx1MutDiJtyDZAei8JIp/tsI+wJyy33l11b7beFvMsvwJFXxe3LacvAxpB6TBkGWJCaFUzykDY0V/tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045852; c=relaxed/simple;
	bh=HET7f1IoT72oIH30DgcFcjg1SUs4AA8ymiUtWbWjSAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pNHKXXl0UOvtdukyUFH6LbEKM3MhD7EXsNsu7CEXlbTe5tJVjRt1CWNYgGRiNFajSgPS6eKHxzG78p2Yo7l4x87kpuh/qDS+589pHgFN4xnhI8WytYfdUWBfvsI8BYZsbGJZufSMQqAPZXp4sOWpgRr7RpnhuXL/sE53P6FJs5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXH+HGP+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXH+HGP+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8411F000E9;
	Sun, 26 Jul 2026 06:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785045851;
	bh=mkPtwlim6H0d3cYfZA48qh9hQo0AlAWvvp/MN/FhkDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JXH+HGP+X/zImlxgknxdSNL9AU8cjP1xSvkfYPJVRtPyKipPQvD5cGGCbkpEb+wPX
	 nub3I0duuN53Ut4/8DIKBe5+BvHaytkJALgehsQ0H3AcknivYQFEw/GdZENctwwB8D
	 OPmK+iGPdA79YCL8IYjbGf2Vry+Iq9QUVZlCevdUuBFZeiuKZqermgRDO/ez/4GziI
	 AtN/BdAtlw+Yt4Jb5baBWk0uuHz51ZoydlKJ7tAVaTwkUTBxQCCnQO758RAd2haPPv
	 07bseQ34rAogG6PaVFNPXFOhXXrjBS0hRTyukl8HoZ//Q9TB/XE0rS7OB9LrPfswl0
	 dag3CFmHySHbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] spi: nxp-fspi: fix runtime PM cleanup on probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiawen Liu" <1298662399@qq.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <tencent_D74B48085D60A729C0BE5FD64A87FAB9A207@qq.com>
References: <tencent_D74B48085D60A729C0BE5FD64A87FAB9A207@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:04:10 +0000
Message-Id: <20260726060410.CB8411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of `nxp_fspi_default_setup()` is ignored, which c=
an leave the device in an unclocked state and cause a system crash upon reg=
ister access.
- [High] Unchecked return value of `pm_runtime_get_sync()` in `nxp_fspi_cle=
anup()` can lead to a bus fault during driver removal.
- [High] `nxp_fspi_irq_handler` accesses hardware registers without verifyi=
ng the device's PM state, risking a kernel panic on late or spurious interr=
upts.
--

--- Patch [1]: [PATCH] spi: nxp-fspi: fix runtime PM cleanup on probe failu=
re ---
commit 8285d0b4a15f14a23608e3bcf58977aed6bff9b3
Author: Jiawen Liu <1298662399@qq.com>

spi: nxp-fspi: fix runtime PM cleanup on probe failure

This commit cleans up the runtime PM state by dropping the usage counter
and disabling runtime PM if pm_runtime_get_sync() fails during probe.

> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 1e36ae084dd86..c6037f3209c5a 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
> @@ -1352,7 +1352,7 @@ static int nxp_fspi_probe(struct platform_device *p=
dev)
>  	/* enable clock */
>  	ret =3D pm_runtime_get_sync(f->dev);
>  	if (ret < 0)
> -		return dev_err_probe(dev, ret, "Failed to enable clock");
> +		goto err_pm_runtime;
> =20
>  	/* Clear potential interrupts */
>  	reg =3D fspi_readl(f, f->iobase + FSPI_INTR);

[ ... ]

>  	if (reg)
>  		fspi_writel(f, reg, f->iobase + FSPI_INTR);
> =20
>  	nxp_fspi_default_setup(f);

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to ignore the
return value of nxp_fspi_default_setup() here and in
nxp_fspi_runtime_resume()?

nxp_fspi_default_setup() disables the peripheral clocks at the beginning.
If it subsequently fails to set the rate or prep/enable the clock, it
returns a negative error code with the clocks still physically disabled.

Because nxp_fspi_probe() and nxp_fspi_runtime_resume() ignore this return
value, the SPI core might later call nxp_fspi_exec_op() while the PM core
believes the device is active. Subsequent MMIO accesses to the unclocked
controller will trigger a synchronous external abort (bus fault) and panic.

[ ... ]

> +err_pm_runtime:
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +
> +	return dev_err_probe(dev, ret, "Failed to enable clock");
>  }


Also, looking at the driver removal path:

nxp_fspi_cleanup() {
	...
	pm_runtime_get_sync(f->dev);

	/* disable the hardware */
	fspi_writel(f, FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);
	...
}

[Severity: High]
This is a pre-existing issue, but could this cause a bus fault during
driver removal?

If pm_runtime_get_sync() fails, the clock is not enabled. The driver
ignores the return value and immediately performs an MMIO write to the
FSPI_MCR0 register. Accessing the hardware with disabled clocks will
trigger a synchronous external abort.


Finally, regarding the interrupt handler:

nxp_fspi_do_op() {
	...
	if (!wait_for_completion_timeout(&f->c, msecs_to_jiffies(1000)))
		err =3D -ETIMEDOUT;
	...
}

nxp_fspi_irq_handler() {
	...
	/* clear interrupt */
	reg =3D fspi_readl(f, f->iobase + FSPI_INTR);
	...
}

[Severity: High]
This is a pre-existing issue, but does the IRQ handler need to verify the
device's PM state?

During a SPI operation, if wait_for_completion_timeout() in
nxp_fspi_do_op() expires, it abandons the operation without masking the
controller's interrupt. nxp_fspi_exec_op() then places the device into
autosuspend.

If the hardware is slow and finishes the operation after the device has
suspended and its clocks are gated, it will assert the interrupt.
The nxp_fspi_irq_handler() reads the FSPI_INTR register directly without
checking pm_runtime_get_if_active(). Reading unclocked registers causes a
bus fault.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_D74B48085D6=
0A729C0BE5FD64A87FAB9A207@qq.com?part=3D1
