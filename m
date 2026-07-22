Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323C83C98A2;
	Wed, 22 Jul 2026 08:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709491; cv=none; b=aPHgHlsN+8ym6WNwrz5U9G7HE61gJm30sR/473s9+2K1s1kGg2gk6y7Dxe03Tc09NWSwavsLaq8oGYaBFQRj/uM+PNHECWJoyyM1SdR/U9XkPPqYffK0aiv27OCb9mTu1B42YUp2yTsR0/JIlvxiS61v4p3cQKZ7VrxntJ5et78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709491; c=relaxed/simple;
	bh=7n2N5ah6p9UmAFfN/VKypiwAQSpxSDhYWnFuiFGVftY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P08C4XKtPSdRwrmFnLlc+QcAvjN8fWp8e4qPTW0iiq5XGVwxakVaJ3i/+RpUBH/lqliQZlXksGcjUGF1mJtuTfdAUmm7Q90P3+ZbmWZw6z94rJQFahfLrqhythmyYWl80SGR2layC8gmkAw6FeBpdESjChbH4cMo9EEH8Rr9uOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUrMANnx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUrMANnx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8E61F000E9;
	Wed, 22 Jul 2026 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784709489;
	bh=JmsRHAU3g79H6inAxObeIt3haqnurTwuuuWJh8Upyng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UUrMANnxppe2e2w/S1yx/ZtzXlDYiua69fQprxG2pXtT7u8PEbD7g0dFeDk3rIe/C
	 7zxRjWK71GoAqQzlEDRrzA65OsV8BiChHsttOWwPA7TPj+txDjzeL9jtKQV/tCPd+m
	 2RDUka+LcDxeAQUPM0Rp56+gSgJxTeZBTW+75ePxH6fzQqDZ/1Ym+wOX2dXEwn+tOT
	 Js79bp5HQM8gpFemMx4ulsQlLxKeZX6Ann70cBo9ejUAW+0yjvp/AGpfPl6NFm+Qhy
	 +vVJwfjb18EpeU6XofmsAswDH7JovqMG8NwxIGHYlBV5BBIanPVJ2q3qq/sq20qnJb
	 JUxUsG33LwZyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] pmdomain: imx: scu-pd: allow building as a
 module
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260722082522.3747962-3-Zhipeng.wang_1@oss.nxp.com>
References: <20260722082522.3747962-1-Zhipeng.wang_1@oss.nxp.com>
 <20260722082522.3747962-3-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 08:38:09 +0000
Message-Id: <20260722083809.7E8E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Converting the IMX_SCU_PD driver to a loadable module introduces a=
 critical probe ordering race condition that permanently breaks SCU clock i=
nitialization.
--

--- Patch [2]: [PATCH v4 2/3] pmdomain: imx: scu-pd: allow building as a mo=
dule ---
commit 628d94a1fc8f8e8847b2257f097c88ea5e22ffe7
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

pmdomain: imx: scu-pd: allow building as a module

This commit converts the IMX SCU power domain driver to a tristate to
support Android GKI loadable modules. It relies on subsys_initcall() to
preserve probe ordering when built-in.

> diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
> index 3ec33667a308c..e3f9e741daf76 100644
> --- a/drivers/pmdomain/imx/scu-pd.c
> +++ b/drivers/pmdomain/imx/scu-pd.c
[ ... ]
> @@ -540,7 +541,12 @@ static struct platform_driver imx_sc_pd_driver =3D {
>  	},
>  	.probe =3D imx_sc_pd_probe,
>  };
> -builtin_platform_driver(imx_sc_pd_driver);
> +
> +static int __init imx_sc_pd_driver_init(void)
> +{
> +	return platform_driver_register(&imx_sc_pd_driver);
> +}
> +subsys_initcall(imx_sc_pd_driver_init);

[Severity: High]
Does converting this driver to a loadable module break the probe ordering
with the SCU clock driver?

Because subsys_initcall() behaves like module_init() when built as a module,
the power domain and clock modules will be loaded asynchronously by udev.

If the clock provider probes before the power domain module is loaded,
it fails to attach the power domain but proceeds to register the clocks
anyway:

drivers/clk/imx/clk-scu.c:imx_clk_scu_alloc_dev() {
        ...
        ret =3D imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
        if (ret)
                pr_warn("%s: failed to attached the power domain %d\n",
                        name, ret);

        ret =3D platform_device_add(pdev);
        ...
}

Since there is no fw_devlink dependency (the clock controller DT node
lacks a power-domains property) and no symbol dependency, the clock
driver will not defer its probe. This leaves the SCU clocks without
their required power domains, which causes hardware faults when the
clocks are later enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722082522.3747=
962-1-Zhipeng.wang_1@oss.nxp.com?part=3D2
