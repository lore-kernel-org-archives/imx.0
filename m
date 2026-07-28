Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392D63CB56C
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226714; cv=none; b=tR8NNLRrL6X423BpIW2uYjm9xDHNXFZ9luG40tydTGLV53TP6ed/dbJPsxanLs0psr4gcmgevgBuYWSL26ZKWsA/gISmOSAc7RR7/ClSwwBxtzlV1ZAyfBpxPqbmFFBLJ8N1j95BsdKY1efyBjsxZvpJefEpTkhpl8WuvyYY2p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226714; c=relaxed/simple;
	bh=U4auexe6tsrgiDpLtA8k8VTUn4WsVeuh5cptUPdVlRI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ke1w/z43Tst9zYNoHK++XL5j0J88owo5cO8ajim/8sXyAIdZhiNj0JSwBf6Bwd3tzAh7Hh/YknuJXCZCk8EBnRcQ0jicDgGfhZnRdGzQV5ZD4JNjJGvowLWpgXPcdhsEXpY+iRtJ/Mk/XTG6LYJNtc3Wnccvb5pUaFQWPE85Urw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAdJdyiw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAdJdyiw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EBA1F000E9;
	Tue, 28 Jul 2026 08:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785226712;
	bh=P7Ojelg+srxYIimKzpcmD+DSjvlfd5GE9/BYPxlQ0nI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AAdJdyiw/rxhi2QQ5l/TIYL2xj1cEYCtTFImVp16VYOtLdnVmbUlS9E1afLatbnIB
	 gz88g9Be/wMyV8dSqywF8aEX73YNmGBYte6j2f73u3U420C5h6t2f79/gbs+O+SVhz
	 e+KnmRok/3zDcvoEqw9+kjVCHGrPTxomHGn8LChImIYBNY1W43D3xSFbblILVX4e6D
	 dyJ3S5NfQlknX3C8tj2toD8iNZaWdzDNqp9OYg08jUrItnOtHy21P4z9/PYuwng8C1
	 /lRtR6hvrG92oFworjAD5rlEQrjP8AJfsUerWAGq54iCNetpz/7J7Rjvdbtst+aMIN
	 THK1lr+g6o9tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] spi: nxp-fspi: propagate default setup failures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiawen Liu" <1298662399@qq.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <tencent_F25742D45315ED400AEA2E39210242FCFE0A@qq.com>
References: <20260728080443.153827-1-1298662399@qq.com>
 <tencent_F25742D45315ED400AEA2E39210242FCFE0A@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 08:18:31 +0000
Message-Id: <20260728081832.91EBA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Failure in `nxp_fspi_default_setup()` during runtime resume leaks =
the hardware clocks.

Pre-existing issues:
- [High] Probe error paths following PM runtime auto-suspend guard acquisit=
ion cancel the pending suspend, leaving clocks permanently enabled.
- [High] The PM runtime usage counter is leaked in `nxp_fspi_exec_op()` if =
`pm_runtime_get_sync()` fails.
- [High] Missing error check for `pm_runtime_get_sync()` in `nxp_fspi_clean=
up()` can cause a system crash and unbalanced clock disables.
--

--- Patch [2]: [PATCH v2 2/3] spi: nxp-fspi: propagate default setup failur=
es ---
commit aea7011ea2d11337a5d6f21669233c5dbd4bf29b
Author: Jiawen Liu <1298662399@qq.com>
Subject: spi: nxp-fspi: propagate default setup failures

nxp_fspi_default_setup() may fail while setting the controller clock rate
or while preparing and enabling the clock. The probe and runtime-resume
paths currently ignore that return value and continue as if the controller
was usable.

> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 6be78712b5343..3f1c3ed748eba 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
> @@ -1361,7 +1361,9 @@ static int nxp_fspi_probe(struct platform_device *p=
dev)
>  	if (reg)
>  		fspi_writel(f, reg, f->iobase + FSPI_INTR);
> =20
> -	nxp_fspi_default_setup(f);
> +	ret =3D nxp_fspi_default_setup(f);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to setup controller");

[Severity: High]
This isn't a bug introduced by this patch, but does returning an error here
leak the hardware clocks?

Earlier in nxp_fspi_probe(), the PM guard is acquired:

	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);

If probe fails and we return an error, the guard goes out of scope and
queues an asynchronous suspend.

Devres then unwinds devm_pm_runtime_enable(), which calls
pm_runtime_disable().

According to PM subsystem guidelines, pm_runtime_disable() cancels any pend=
ing
async suspend requests, which might leave the device powered on indefinitel=
y.

>  	init_completion(&f->c);
>  	ret =3D devm_request_irq(dev, irq,

[ ... ]

> @@ -1408,7 +1410,10 @@ static int nxp_fspi_runtime_resume(struct device *=
dev)
>  		return ret;
> =20
>  	if (f->flags & FSPI_NEED_INIT) {
> -		nxp_fspi_default_setup(f);
> +		ret =3D nxp_fspi_default_setup(f);
> +		if (ret)
> +			return ret;

[Severity: High]
If nxp_fspi_default_setup() fails here, does this regression leave the hard=
ware
clocks enabled permanently?

nxp_fspi_clk_prep_enable(f) was called earlier in nxp_fspi_runtime_resume()
to enable the clocks.

If this returns an error, the PM core aborts the resume and the device stays
in the RPM_SUSPENDED state, but it doesn't look like
nxp_fspi_clk_disable_unprep() is called to disable the clocks before return=
ing.


[Severity: High]
This is a pre-existing issue, but I noticed a potential leak of the PM
runtime usage counter in nxp_fspi_exec_op() when pm_runtime_get_sync() fail=
s:

drivers/spi/spi-nxp-fspi.c:nxp_fspi_exec_op() {
    ...
	err =3D pm_runtime_get_sync(f->dev);
	if (err < 0) {
		dev_err(f->dev, "Failed to enable clock %d\n", __LINE__);
		return err;
	}
    ...
}

Because pm_runtime_get_sync() increments the usage counter regardless of
success, returning directly on failure without calling pm_runtime_put_noidl=
e()
might permanently leak the counter and prevent the device from entering run=
time
suspend again.

Could this prevent the device from suspending in the future?


[Severity: High]
This is a pre-existing issue, but is it safe to proceed without checking the
return value of pm_runtime_get_sync() in nxp_fspi_cleanup()?

drivers/spi/spi-nxp-fspi.c:nxp_fspi_cleanup() {
    ...
	pm_runtime_get_sync(f->dev);

	/* disable the hardware */
	fspi_writel(f, FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);
    ...
}

If pm_runtime_get_sync() fails to resume the device and enable clocks, the
driver immediately writes to the FSPI_MCR0 register on unpowered hardware.

Could this cause a synchronous external abort on ARM SoCs, and subsequently
cause unbalanced clock disables when nxp_fspi_clk_disable_unprep() is calle=
d?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728080443.1538=
27-1-1298662399@qq.com?part=3D2
