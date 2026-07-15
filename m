Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4524C449ED6
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116368; cv=none; b=uq0R5ns1/8AOHfnXHRu09IZneZjk9MTLNi5xjdJDwh3MObcDvLqzHGTCGuHPVKPAc83G+M1d4znjwJ/fbL5ad6I41o90axu7rvPgjU3d8ylktUqIZZ9gwtXHyTfQiEsUEUcmKUucvXfFiR8D52JX0RRl/IuqgPMnl9oAnuhIT8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116368; c=relaxed/simple;
	bh=Thb61blW9JD4adfpev5hpA87KH3ldj9SOmcmA4e/D6c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gveMjadCkZhnpcOL+18b5dMYZ85d070Si7m8V5J64uX77avYuIwVNAkfjiBAg9pVUQXJdc9I5BEu/qrC6gjzPixicmysZI2U0VByaOIc9f2YQlzVdEOwDYBzAEEokdtcfK6+cqwY0hOaiVfFaRCN6FqIh9yWWBEeYH8zr8raumY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fa5eJh0G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fa5eJh0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0271F00A3A;
	Wed, 15 Jul 2026 11:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784116366;
	bh=8WqZ8bb1F26TclUSKsQJWwuIFfBQNPQsGug8Bxh2k0U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fa5eJh0Gk0fbGSed649s/i4stEPtZd2Wbup2S168A0DOSD3zrywBKMsKCjvXI/0d8
	 soPqVT5UlO5n/Q7nJ6xaVsWm7YKiehf3TBlb/3e369sDYRb/gID3YaEOUk59xU9+0x
	 aaoCE8f4SMgEnXGPwLLF27facOx91qMMp6MT/B4RWJtKy1Hizolp+tqFL7LyplkEnT
	 Ilp9hnP3lJ9n5ViA5KRy0WanAhSJA2StsvFRX4+CAA5D68IasjBEkLGz+pAEDVTfSQ
	 doCoC9HLsnXZMKn4lbeoK0O3SFMHjQuS8VqNxzrPWFacpZBkvhOxQl9ufjIokE0ynz
	 Bx7CDJsYv+W1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/6] phy: fsl-imx8mq-usb: add runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: neil.armstrong@linaro.org, imx@lists.linux.dev, linux-phy@lists.infradead.org, Frank.Li@kernel.org, olteanv@gmail.com, vkoul@kernel.org
In-Reply-To: <20260715-imx8mp-usb-phy-improvement-v6-3-00d95e270e4c@nxp.com>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
 <20260715-imx8mp-usb-phy-improvement-v6-3-00d95e270e4c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 11:52:46 +0000
Message-Id: <20260715115246.7A0271F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] `PM_RUNTIME_ACQUIRE` falsely succeeds when runtime PM is disabled =
(e.g., during system sleep), leading to a system hang when disabled hardwar=
e registers are accessed.
--

--- Patch [3]: [PATCH v6 3/6] phy: fsl-imx8mq-usb: add runtime PM support -=
--
commit d85e441d52a7fee829fc860ee8795964a99e4555
Author: Xu Yang <xu.yang_2@nxp.com>

phy: fsl-imx8mq-usb: add runtime PM support

This commit adds runtime PM support to ensure the PHY is properly powered
and clocked during register access. It guards register accesses in PHY
operations and Type-C orientation switching.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index 3a5788c609e1b..bc804d2b5aeeb 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c

[ ... ]

> @@ -136,17 +137,15 @@ static int tca_blk_typec_switch_set(struct typec_sw=
itch_dev *sw,
>  {
>  	struct imx8mq_usb_phy *imx_phy =3D typec_switch_get_drvdata(sw);
>  	struct tca_blk *tca =3D imx_phy->tca;
> -	int ret;
> =20
>  	if (tca->orientation =3D=3D orientation)
>  		return 0;
> =20
> -	ret =3D clk_prepare_enable(imx_phy->clk);
> -	if (ret)
> -		return ret;
> +	PM_RUNTIME_ACQUIRE(&imx_phy->phy->dev, pm);
> +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> +		return -ENXIO;

[Severity: High]
Does this check falsely succeed when runtime PM is disabled, such as during
system sleep?

During system suspend, pm_runtime_force_suspend() disables runtime PM
(disable_depth > 0) and turns off the PHY clocks. If a Type-C orientation
change occurs via interrupt at this time, PM_RUNTIME_ACQUIRE (which wraps
pm_runtime_get_active with RPM_TRANSPARENT) will return success despite the
device being suspended.

The driver would then proceed to tca_blk_orientation_set(), which accesses
unclocked PHY registers, potentially causing a synchronous external abort or
system hang.

Could PM_RUNTIME_ACQUIRE_IF_ENABLED() be used here instead to safely check
if the device is active and fail appropriately if runtime PM is disabled?

> =20
>  	tca_blk_orientation_set(tca, orientation);
> -	clk_disable_unprepare(imx_phy->clk);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx8mp-usb=
-phy-improvement-v6-0-00d95e270e4c@nxp.com?part=3D3
