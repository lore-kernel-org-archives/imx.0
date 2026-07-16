Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013EA3438A6
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784187042; cv=none; b=tsGRQEHCNJYpA3hnj8+fp9t4O3NGP0E6cE2Wx3dpeMnJh+4HStaDNhvVuqHd5S5qmZQCabDpAhuPTLKNB2Sy8wMWNRWtg1MrD0DFKHfvdBI9H1TLw9ndtrgfZd6COvI+z5hvppTrDb1nzv8Ee/6pFk+dojwKCikLVpFFPCD+p8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784187042; c=relaxed/simple;
	bh=yxvPZziQrfljCaiES62miV0WEe1nb1kNyn3NkC1fOX8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RH3mfnSzLweV1SiPtkODBi5p7Gft72daWepYekyOxglFjCbM9SK9XiAMMrzaebs2H7pW+jxaxSyl2fv18mCgKasICxa7l7gZ8BZoaSOJBGzP5Cnr7biwiIiljyfxGTigYrW+mHU/4bJI9dRjkoVBAvgQorqF5N1QfrIBAkFEi3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xtus7z+5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xtus7z+5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C5D1F000E9;
	Thu, 16 Jul 2026 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784187039;
	bh=c11SJnMCxuaHfmX+o1JX+e49zH089u5l9I1/1A+WV3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xtus7z+5cErkawjHLnQP/1zjxW3FokVodj7E1hYzJWwSsMeuh0BmGphq/LdcNR8AC
	 bpBaJwPJPVJmLWcKr5zphv1R4x+i+Bmi6kVwbxZjrUMe1jQ69nwple7txYvMQtc1hu
	 zpLskrwNtq/OXfP6hwZinz+yAGIWx5dshPWId7Alg+TUGRIJI17C700ep1rZho3GiH
	 sKxhV4950C33FuwdIM8WLSyJetOYkXZo9txV4VTXTfhvAAZ6yKJSivG05Ob8Zoxt0y
	 fX7rnYzPfv1C5vYU7NbalwdDBMMOKcqubX0J6gnusvoEHnqv2ZWeBeqvyGCDpn/dre
	 PaP/Uj9ArqGTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] i2c: imx-lpi2c: reset controller in probe stage
Reply-To: sashiko-reviews@lists.linux.dev
To: carlos.song@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260716071957.2670263-3-carlos.song@oss.nxp.com>
References: <20260716071957.2670263-1-carlos.song@oss.nxp.com>
 <20260716071957.2670263-3-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 07:30:38 +0000
Message-Id: <20260716073038.D0C5D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The probe error path explicitly disables device clocks while the d=
evres-managed interrupt remains active, risking an external abort.

Pre-existing issues:
- [High] The interrupt handler unconditionally accesses hardware registers =
without verifying the device's runtime PM state, risking a synchronous exte=
rnal abort.
--

--- Patch [2]: [PATCH v6 2/2] i2c: imx-lpi2c: reset controller in probe sta=
ge ---
commit a2b44c86e6f00595e1b33e7174c800f8fdb5e7ca
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx-lpi2c: reset controller in probe stage

This commit resets the I2C controller during the probe stage to prevent
unexpected states left from prior boot stages. It asserts and deasserts
software reset bits in the MCR and SCR registers. It also moves the
IRQ allocation to occur after this reset initialization.

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index 615d9f7f11471..cfc0d108d3c4a 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c

[ ... ]

> @@ -1550,6 +1545,22 @@ static int lpi2c_imx_probe(struct platform_device =
*pdev)
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> =20
> +	/*
> +	 * Reset all internal controller registers of both Master and Target
> +	 * to avoid effects of previous status.
> +	 */
> +	writel(MCR_RST, lpi2c_imx->base + LPI2C_MCR);
> +	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
> +	writel(0, lpi2c_imx->base + LPI2C_MCR);
> +	writel(0, lpi2c_imx->base + LPI2C_SCR);
> +
> +	ret =3D devm_request_irq(&pdev->dev, lpi2c_imx->irq, lpi2c_imx_isr, IRQ=
F_NO_SUSPEND,
> +			       pdev->name, lpi2c_imx);

[Severity: High]
If an error occurs later in lpi2c_imx_probe() (such as in
lpi2c_imx_init_recovery_info() or i2c_add_adapter()), the error path jumps
to clk_disable and calls clk_bulk_disable_unprepare() before returning.

Since devm_request_irq() is used, the interrupt isn't freed until after the
probe function returns.

Does this create a window where the devres-managed IRQ remains active while
the device clocks are explicitly disabled? If a spurious interrupt arrives
during this window, could it cause an external abort?

[Severity: High]
This is a pre-existing issue, but lpi2c_imx_isr() unconditionally reads
hardware registers without verifying the runtime PM state:

drivers/i2c/busses/i2c-imx-lpi2c.c:lpi2c_imx_isr() {
    ...
    u32 scr =3D readl(lpi2c_imx->base + LPI2C_SCR);
    ...
}

Because IRQF_NO_SUSPEND is used, the interrupt could fire when the device
is in the RPM_SUSPENDED state with clocks disabled, especially for SoCs
where need_request_free_irq is false.

Would it be safer to check the PM state with pm_runtime_get_if_active()
in the interrupt handler before accessing registers, returning IRQ_NONE
if the device is suspended?

> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", lpi2c_imx->irq);
> +		goto rpm_disable;
> +	}
> +
>  	temp =3D readl(lpi2c_imx->base + LPI2C_PARAM);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716071957.2670=
263-1-carlos.song@oss.nxp.com?part=3D2
