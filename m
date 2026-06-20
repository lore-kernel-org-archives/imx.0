Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB10346A0B
	for <imx@lists.linux.dev>; Sat, 20 Jun 2026 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781945881; cv=none; b=O7N/QvSyuvpSnBRQpMgfTiZCE8dTmEL21KtGVwG4uVMXisDb+QL4VdhknpRsg0AeJWkaR+5kWj8yPE/+K26QBolxsWqM7hpOtge2itk0wUdxKvef0Bxt6ype8O0Q2alHBqfG/O084JUaHx69JM5jJlmLwYw3o0JIKPBhLdZDTK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781945881; c=relaxed/simple;
	bh=/JPdDvnquPn9Ns4asP7094qYTHj9fD3WpVO6j0seVDA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jSAItJ8XalmlsVri+T5Zy35byMEI04hxIv/RdK6PkdGYbmiYgyiLNwx+n2FE78VmTHfv5DwypcqAecDJ3KFoYBcEi2OJc504ms5scf7e76Kr6Ey4JmjU9ZfsrV8cFj9AAQPpXIdlEfEDWF+151hO9c4xjd+O+ae4zuGKeYb8j+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vx6PV/Fd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vx6PV/Fd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C133F1F000E9;
	Sat, 20 Jun 2026 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781945879;
	bh=LBLB/Zdocb2XFh+wNclpEynPi3cMbZtLNNfpPh6oT2Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vx6PV/Fd67rupqZM5i+8gFslG1+SSFnTdJqq2lnumdlkbq2w5nrzW1G7c2wXQ+J7t
	 dDhJxiM49d+/9qA98RLdfkutrLcTbb7yOqMp+6/c/GaZCUrLJ2y28qiVtF/4CN18nD
	 M5gNhINlcUXxjHn+AVPYX1b12w+0j0dlJMGTkX3pACnWBHG4kUZqWFvR1OA1JfWe4j
	 JU2OOObFlJNeeB84SBVIWGbwxTyPrg97+22/NRLSVHOLTd95X7x45cjZ1mmfrycG2U
	 gEQf1PBU/P5MSb0VnwVuIgHG+G0i6arsDqk2fvGJBzEMOzVuMxToyr1CB2ItjiMxso
	 MaNWuLOVdT9GQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] spi: nxp-fspi: disable runtime PM on probe failures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiawen Liu" <1298662399@qq.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <tencent_8FC0B8DFAF4AE67AEBA20548045D53A77707@qq.com>
References: <20260620083931.1120616-1-1298662399@qq.com>
 <tencent_8FC0B8DFAF4AE67AEBA20548045D53A77707@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 08:57:59 +0000
Message-Id: <20260620085759.C133F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Probe error paths leave the hardware powered on and clocks leake=
d because the newly added cleanup path cancels the autosuspend timer withou=
t suspending the device.

Pre-existing issues:
- [High] Unchecked pm_runtime_get_sync() failure in nxp_fspi_cleanup() can =
cause a synchronous external abort (bus fault).
- [High] The ignored return value of nxp_fspi_default_setup() corrupts the =
clock enable count and causes a kernel panic.
--

commit f84d61f342ed9ba0fef9a6eeb2fb3c7129154065
Author: Jiawen Liu <1298662399@qq.com>

spi: nxp-fspi: disable runtime PM on probe failures

nxp_fspi_probe() enables runtime PM and autosuspend before several operatio=
ns
that can fail. Some failure paths returned directly before the devm cleanup
action was installed, leaving runtime PM enabled. Route those failures thro=
ugh
a common runtime PM cleanup path. Use pm_runtime_resume_and_get() for the
initial clock enable.

> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 1e36ae084dd86..d94a2a7b98d44 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
[ ... ]
> @@ -1362,18 +1364,24 @@ static int nxp_fspi_probe(struct platform_device =
*pdev)
>  	nxp_fspi_default_setup(f);

[Severity: High]
This is a pre-existing issue, but does nxp_fspi_probe() need to check the
return value of nxp_fspi_default_setup()?

If nxp_fspi_default_setup() fails, it leaves the clocks disabled. Since this
return value is ignored, the driver proceeds to register the SPI controller.

When the device autosuspends, nxp_fspi_runtime_suspend() will disable the
already-disabled clock, which drives the clock enable count negative.

A subsequent access to the SPI bus will increment the count back to 0 in
nxp_fspi_runtime_resume(), leaving the clock physically OFF.

Would this lead to reading/writing unclocked MMIO registers and trigger a
synchronous external abort?

> =20
>  	ret =3D pm_runtime_put_sync(dev);
[ ... ]
> @@ -1389,6 +1397,11 @@ static int nxp_fspi_probe(struct platform_device *=
pdev)
>  		return ret;
> =20
>  	return devm_spi_register_controller(&pdev->dev, ctlr);
> +
> +err_disable_pm:
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);

[Severity: Medium]
When execution jumps here due to a failure (e.g., in devm_request_irq()),
the device is still in the RPM_ACTIVE state because pm_runtime_put_sync()
only scheduled an autosuspend timer.

Will calling pm_runtime_disable() cancel the pending autosuspend timer
and freeze the device in RPM_ACTIVE?

Since the devm cleanup action (nxp_fspi_cleanup) has not been registered ye=
t,
does this leave the hardware powered on and permanently leak the clocks?

> +	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but there appears to be another unchecked
clock enablement in nxp_fspi_cleanup():

drivers/spi/spi-nxp-fspi.c:nxp_fspi_cleanup() {
	...
	/* enable clock first since there is register access */
	pm_runtime_get_sync(f->dev);

	/* disable the hardware */
	fspi_writel(f, FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);
	...
}

If pm_runtime_get_sync() fails to enable the clocks, the hardware remains
unclocked.

Since the return value is ignored, the code unconditionally proceeds to
execute fspi_writel().

Can accessing unclocked MMIO registers trigger a synchronous external
abort and crash the system during teardown or module unload?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620083931.1120=
616-1-1298662399@qq.com?part=3D4
