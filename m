Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433083B3898
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 06:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785308123; cv=none; b=NHMj0OvDAb8G2MCX63gD5sbLp6q6aeEZkAkB6SHGTEdEbK8l493EKgtHBbdJN1YkQvGJt5zxMQ95v+w2erBvoX4D36pFA5hdAECbGLM9KS3WtbKbblTPcg3Titv9jKiHiyaVi5CuNlwG5kinDqXyeu0i+vzIqe/97F8fAUNdSi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785308123; c=relaxed/simple;
	bh=7FhiUutBSd307eR3tDIUfmJSEFXHD8Px3EZKRG0fwCE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HgfBg27jAV0wH0VJ894OgWJWuiFPDN+MbG3azVAx0n9AK5GHL2pfRqtggh63HWXTLYfR2ASOQaAbaRS+a2OfxNoFANhZdrY0AOd/CjbTXVEE/qJTxu3BSeTnPtU92yd0MqdOAZYC3aS5GeJf6SOcPHVdWHe9ZrI0TUr0Ubmo5cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lv3yS+jD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lv3yS+jD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C7E1F00A3A;
	Wed, 29 Jul 2026 06:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785308121;
	bh=ttxN0hKlmC4CSDbZqC/7BbYU1Z/HN33gMR+UE7M/Tbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lv3yS+jDSNSLYHa9DiwUNhPIzxPxtjPlourIqWVRzc5yws1JcrQyx/XL/oUUsGNlg
	 R7uQIpqCsvWit0est3y4KMH1OPBmM75jSHRdvX6PlBzmWNf6ky8SdfkbuxB3239alQ
	 fRRl2p6WOfqocaEwNUZ9LBEvrTfeSaGKFdIIIEe5C1xJsE7Sz3qU6wwToTGPlmlfIB
	 iDrjQNQJz1CNx2tLESyAzEgNWnnZckTRC5F66QX/5884GyTsShZ7Rel/bsOt+X/SJA
	 +PgKaPAQVVSO/E5kGNRql0Mv9Xvy88wp6IS2QftLyokz91FomXTD/Xs0L7q+y6d2zP
	 zWUoGtB/GKY3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/6] phy: fsl-imx8mq-usb: add runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260729-imx8mp-usb-phy-improvement-v7-3-c385ee40ade6@nxp.com>
References: <20260729-imx8mp-usb-phy-improvement-v7-0-c385ee40ade6@nxp.com>
 <20260729-imx8mp-usb-phy-improvement-v7-3-c385ee40ade6@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 06:55:20 +0000
Message-Id: <20260729065521.32C7E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect error checking of pm_runtime_get_sync() return value c=
auses spurious warnings when the device is already active.
- [Low] Failure of pm_runtime_get_sync() in remove() leads to an unbalanced=
 clock disable by devres, triggering a kernel WARN.
--

--- Patch [3]: [PATCH v7 3/6] phy: fsl-imx8mq-usb: add runtime PM support -=
--
commit f054765f7ebd59735a4592c4d68b74584abdbeeb
Author: Xu Yang <xu.yang_2@nxp.com>

phy: fsl-imx8mq-usb: add runtime PM support

Add runtime PM support to ensure the PHY clocks are properly gated
when the PHY is not in use, reducing power consumption. Clock
management is moved from power_on()/power_off() callbacks into the
runtime_resume()/runtime_suspend() callbacks.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index 3a5788c609e1b..74e665525ec48 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
[ ... ]
> @@ -708,44 +696,101 @@ static int imx8mq_usb_phy_probe(struct platform_de=
vice *pdev)
[ ... ]
>  static void imx8mq_usb_phy_remove(struct platform_device *pdev)
>  {
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_get_sync(dev);
> +	if (ret)
> +		dev_warn(dev, "failed to resume on remove: %d\n", ret);

[Severity: Medium]
Is it intended to warn when pm_runtime_get_sync() returns 1?

Since pm_runtime_get_sync() returns 1 when the device is already active
(or when CONFIG_PM is disabled), checking "if (ret)" instead of
"if (ret < 0)" will trigger this warning even on successful unbinds
where the device was already active.

> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
>  }

[Severity: Low]
Could a failure in pm_runtime_get_sync() lead to a clock enable count
underflow?

The clocks are acquired using devm_clk_get_enabled() in probe(), which
registers a devres cleanup action to disable the clocks on teardown. If
the runtime resume fails here in remove(), the clocks will remain disabled
by the runtime PM framework. When devres subsequently attempts to disable
them again during cleanup, it will cause an unbalanced clock disable and
a kernel WARN.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-imx8mp-usb=
-phy-improvement-v7-0-c385ee40ade6@nxp.com?part=3D3
