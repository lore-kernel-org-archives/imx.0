Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6A53CF046
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486433; cv=none; b=o0aNPZUX7xYjD/Fk0v4hWQw8LY7HW9DswjBEW6gQf4T+l1AQQ+oCy8M2eubhOIt2kZF+9nIoB4T3P5AiuucAiSk+4UPyYwdpunDA/SZaL0eBlimUa+0VLAbYEeo6mKMNxb1u9FfwzECyOFjrsE5Cih9/WJghCQhAq0T+YkiNHgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486433; c=relaxed/simple;
	bh=meFG5u2+LnKEenmOSe/MHGL8oqg/Jf8N3AFOcqCE1X4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sRpTihHQCRFRwksifJZKxA4S1RukJboWhyUESPpM5uXaf5DRuNA59sXpLsIZY5wYA4qyxERUuG5OgxG8GToBUahV4HpSGIuJYncKXFliK7ZzRH6Fn3USJ4TT9XO4TtmRfJhC3IZDfyDPUYo06hVbbZKmKINVAvgxKlHkozMkQkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eU+xh8uO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eU+xh8uO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5161F000E9;
	Fri, 31 Jul 2026 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785486427;
	bh=bQVRuWb1aHpzhKsj7xdRF2ObnZLDP4QmknPPX9xxqBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eU+xh8uOpxYeChxNhX+mLJq2a0l+K76XJyhGUq1SUhbTwY9ZUvXgH8zEvb/EYOmp2
	 FgyRg//RfGsE5rjHJRcBvRfT+PQr/6MQxiDAtEy+ZRFTvXrHL+dStyGVH4f6Obo0vE
	 UlAGFYcaQyeYPswk3JsJyko0BC3FvtroQd8oHBFzevuxYwMjK+rJg/yGkp5KxCos3g
	 BO0fm1r8sRHj7igSDtWuVCs6hNIWA+2brMMby/2OREA2e+mY2bFMQIffoOeHb9ZlbD
	 ABYyhUhVpgl7jDozg7oA2+ikFOXfLzLIEJ1XBXl2+yi2EkEGM893xtIaxaI8sgoAIZ
	 aryvKC1jMhXlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/6] phy: fsl-imx8mq-usb: add control register regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, imx@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260731-imx8mp-usb-phy-improvement-v8-4-2ec8d6b3854d@nxp.com>
References: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
 <20260731-imx8mp-usb-phy-improvement-v8-4-2ec8d6b3854d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 08:27:06 +0000
Message-Id: <20260731082706.AD5161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing PM runtime protection during probe allows mid-probe suspen=
d and double clock disable on error path.
--

--- Patch [4]: [PATCH v8 4/6] phy: fsl-imx8mq-usb: add control register reg=
map ---
commit 0c8e2a6389c47dd36275e3aecba6491f3f4c70ac
Author: Xu Yang <xu.yang_2@nxp.com>

    phy: fsl-imx8mq-usb: add control register regmap
   =20
    The CR port is a simple 16-bit data/address parallel port that is
    accessed through 32-bit MMIO registers for on-chip access to the
    control registers inside the USB 3.0 femtoPHY. Add control register
    regmap and export these registers by debugfs to help PHY's diagnostic.

[ ... ]

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index 42de2cff4d5f3..e03f9dafd69e0 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
[ ... ]
> @@ -696,6 +708,13 @@ static int imx8mq_usb_phy_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
> =20
> +	imx_phy->cr_regmap =3D devm_regmap_init_mmio(dev, imx_phy->base + PHY_C=
RCTL,
> +						   &imx_cr_regmap_config);
> +	if (IS_ERR(imx_phy->cr_regmap)) {
> +		dev_warn(dev, "Fail to init debug register regmap\n");
> +		imx_phy->cr_regmap =3D NULL;
> +	}
> +
>  	imx_phy->vbus =3D devm_regulator_get(dev, "vbus");
>  	if (IS_ERR(imx_phy->vbus))
>  		return dev_err_probe(dev, PTR_ERR(imx_phy->vbus), "failed to get vbus\=
n");

[Severity: High]
Does imx8mq_usb_phy_probe() need a PM runtime usage reference before enabli=
ng
runtime PM?

Later in this function, pm_runtime_enable(dev) is called without holding a
usage reference via pm_runtime_get_noresume(). After that, it registers a
Type-C switch.

If the Type-C subsystem (or TCPM) immediately configures this switch via
tca_blk_typec_switch_set(), it acquires and drops a PM reference. Dropping
the reference queues an idle request, causing the device to runtime suspend
and disable its clocks.

If a subsequent probe step like devm_of_phy_provider_register() fails, the
code jumps to disable_rpm:

disable_rpm:
    pm_runtime_disable(dev);
    return ret;

Because pm_runtime_disable() leaves the device in the suspended state if it
suspended mid-probe, the device remains suspended. The probe returns an
error, triggering devres cleanup, which calls clk_disable_unprepare() and
disables the clocks a second time.

For a shared clock, this drops the global enable count unexpectedly, turning
off the hardware clock while other consumers are actively using it. On SoCs
like i.MX8, accessing unclocked registers typically causes an AXI bus locku=
p.

Can we acquire a PM reference before enabling runtime PM to prevent the
device from suspending during probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-imx8mp-usb=
-phy-improvement-v8-0-2ec8d6b3854d@nxp.com?part=3D4
