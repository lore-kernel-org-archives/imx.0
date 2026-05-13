Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4E7399CF5
	for <imx@lists.linux.dev>; Wed, 13 May 2026 20:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704117; cv=none; b=uDw/pZYBIFDg3ZWyoLdNKEifbwX5xqmIG1rTSDW+E4DpPC047jDrzT0uFR0BN4kSPXFVjAEbz7fQZmcOYAmo76+QQ3vOZoE0WLcicr8P+DWk6HUVRlTieBGR4BFazIW/neoScG7FcDHah0LnOl88pifwc3Fcc3FyRf8/Pu+eFnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704117; c=relaxed/simple;
	bh=Afno8vvfsJoHRFhuXhOEXKa/Zyq0ccYhyblQf2HRREs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SqyNpl3rfujN2VJKQZVqkyWb06D7REoqG7Zutgfyw4vGXPUP79q8/gCf6ImtcP4b5xfxqSGbtPxqMtYffqldYRc2xRCZ7SH2WVTHU3nl95UAXAiKMQ3ZFSNbzEqLDEiWMVhr14YhNj0bSNuRqC4QI5btEUzRJT2dzF6Ov0w91pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lk7BOo/G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lk7BOo/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F5BC19425;
	Wed, 13 May 2026 20:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778704117;
	bh=Afno8vvfsJoHRFhuXhOEXKa/Zyq0ccYhyblQf2HRREs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lk7BOo/G5oMPSveY7pElLLbYBAR5T0gVYw+/r8ihmUxhD+sMn1BS0J40LVIxjOYWU
	 RnsQ+Mi+GY1NviUVy4nxbrMYiRgzXc7cC845Z7IRNAv+UKkjHDcEd15BSERCt5yb2I
	 TpX5XdsLNGNMoAX1nO9YfwRtxU1bIUHwRc1yhEV7zt/LYkqwESf+5Yf+HfVysgh/pK
	 jQriowEEbLTIs9X3SLIUNgsKVlXtyv3ZVkmx2jg9tepG3qwmDSxUlVm9NpaTq6ho9v
	 28L43M+KXFiTuMJ7G9j+yiYf7qsfCcNVOJlq025Qr6hMusD7Lhb9C4uPWvyQ7b3Khe
	 nrhYMXfWQxlvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: set usb phy to be wakeup
 capable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@nxp.com>
Cc: olteanv@gmail.com, vkoul@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260512101046.1498096-1-xu.yang_2@nxp.com>
References: <20260512101046.1498096-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 20:28:36 +0000
Message-Id: <20260513202836.A5F5BC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Missing error handling in the probe function leads to a Type-C=
 switch leak and a critical Use-After-Free.
- [High] Using device_set_wakeup_capable() fails to enable wakeup by defaul=
t, causing the PHY power domain to still be powered down during suspend.
- [High] Failing to enable the clocks in imx8mq_phy_power_on() leaves the v=
bus regulator permanently enabled.
--

commit c0b045ff9746b6affbecc02df5970fc02bc6a3ed
Author: Xu Yang <xu.yang_2@nxp.com>

phy: fsl-imx8mq-usb: set usb phy to be wakeup capable

The patch intends to keep the PHY power domain active during suspend
by setting the PHY to be wakeup capable.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index b05d80e849a14..b2e1e3749fc19 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -733,6 +733,7 @@ static int imx8mq_usb_phy_probe(struct platform_devic=
e *pdev)
>  					"failed to get tca\n");
> =20
>  	imx8m_get_phy_tuning_data(imx_phy);
> +	device_set_wakeup_capable(dev, true);

Will this successfully enable wakeup by default?

The PM domain framework (genpd) checks genpd_is_active_wakeup(genpd) and
device_awake_path(dev) (which depends on device_may_wakeup(dev)) to determi=
ne
if the domain should remain powered on.

device_may_wakeup(dev) evaluates to dev->power.can_wakeup &&
dev->power.should_wakeup. While device_set_wakeup_capable(dev, true) sets
can_wakeup =3D true, it leaves should_wakeup =3D false. As a result,
device_may_wakeup() returns false by default, and genpd will still power off
the PHY domain.

Should this use device_init_wakeup(dev, true) to enable it by default,
or should the USB subsystem dynamically propagate the controller's wakeup s=
tate
to the PHY instead?

>  	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);

This isn't a bug introduced by this patch, but does this code leave a Type-C
switch registered if devm_of_phy_provider_register() fails?

If devm_of_phy_provider_register() returns an error, the probe function exi=
ts
without unregistering the Type-C switch (e.g., via imx95_usb_phy_put_tca()).
The imx_phy structure allocated with devm_kzalloc() would then be freed by =
the
driver core, but the switch remains active.

If the Type-C subsystem triggers the switch's set callback
(tca_blk_typec_switch_set()), it will access the freed imx_phy,
potentially resulting in a use-after-free.

> =20
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }

This isn't a bug introduced by this patch, but does imx8mq_phy_power_on() l=
eak
a regulator reference on error paths?

Looking at imx8mq_phy_power_on():

drivers/phy/freescale/phy-fsl-imx8mq-usb.c:imx8mq_phy_power_on() {
    ...
    ret =3D regulator_enable(imx_phy->vbus);
    if (ret)
        return ret;

    ret =3D clk_prepare_enable(imx_phy->clk);
    if (ret)
        return ret;
    ...
}

If clk_prepare_enable(imx_phy->clk) or clk_prepare_enable(imx_phy->alt_clk)
fails, the function returns directly without calling
regulator_disable(imx_phy->vbus).

Since the function returns an error, the PHY framework will not call
imx8mq_phy_power_off(). Could this leave the vbus regulator permanently
enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512101046.1498=
096-1-xu.yang_2@nxp.com?part=3D1
