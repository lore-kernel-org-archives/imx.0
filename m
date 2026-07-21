Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A4A47F2DB;
	Tue, 21 Jul 2026 10:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629231; cv=none; b=PC+sMnoF3itJMr6PTxZBlZok1/vXWGYEZmA/1BY0c6VswhSMv8rO86FjeRr8suzJuised0KYgrjDkEHnWGfq7NxSK0J4j/dW2A3nZ2rmL1vvD9m1E/Ht3HBienj96bDnqBgl797lVtZoZIg62R3RpCSJ2WrulHa2a+6K/f6i2l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629231; c=relaxed/simple;
	bh=9xYzo2wXLpH4q80LvLyIcebPf6OZAp/Ra7z71XtJcXM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jZooMYjkRdaZiuyDRHMulxPPFLXam2XLDrvXOGDlaalvARDPPgoVZZO8wvgZY3RHgKFV0LfDWjtIaz4FP4ivBgjrhMC2HEJ2AsGPaf/F10mnGadnfuDOFFcY8u8NVUFfO2/q5CUFmUzsFf/dZMlf4UixBZt1S/JOUkJWGdeNEf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsZaVQhZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsZaVQhZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E82A1F00A3A;
	Tue, 21 Jul 2026 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629229;
	bh=8dVy9R9LQshtl+4XNKnIBADxLLhcmOFZwX5qes4XMx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AsZaVQhZ/dEDXbQ2fUO+Ry0glV9bAd4iiSYgqQPlrwHTBkQcrwYFLYtD6ajF/ixIY
	 dZMUoO0nuwPVKwqROOVltPEH6bQoxFrQW0rr/nU/fHDUm/wqWLagHq5x6C+peg4/md
	 WOggVUCOZP4eZd9arztdsoXrNI1Dg8owlecSEKVvAtXoHBzYYiyohDSqadl1wc+A8I
	 MgGv+dHPlIimVZa+CcJ2XRRo3jfNyg+vqaS6NRw15zwWOHKQodHMVAQGAYRGV040eO
	 tWyY2BqsFG5rI2TzpmgK3U+xXt5SM1R59zNMoq6UPG/UPfC70/eP4chVbzQrKFeDeO
	 YAjvbOv+B7w9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pmdomain: imx: scu-pd: allow building as a module
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721100917.230923-3-Zhipeng.wang_1@oss.nxp.com>
References: <20260721100917.230923-1-Zhipeng.wang_1@oss.nxp.com>
 <20260721100917.230923-3-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:20:28 +0000
Message-Id: <20260721102029.0E82A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] The driver lacks a `.remove` callback, leading to a critical u=
se-after-free vulnerability upon module unloading.
--

--- Patch [2]: [PATCH 2/2] pmdomain: imx: scu-pd: allow building as a modul=
e ---
commit 9ee376c56f6aaa5ab08fdfa655c63a9fb45c2d0e
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

pmdomain: imx: scu-pd: allow building as a module

This commit converts the IMX_SCU_PD configuration from a boolean to a
tristate to allow building the driver as a module. It also conditionally
registers the driver using module_platform_driver() to support dynamic
loading and unloading.

> diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
> --- a/drivers/pmdomain/imx/scu-pd.c
> +++ b/drivers/pmdomain/imx/scu-pd.c
[ ... ]
> @@ -540,7 +541,12 @@ static struct platform_driver imx_sc_pd_driver =3D {
>  	},
>  	.probe =3D imx_sc_pd_probe,
>  };

[Severity: Critical]
By converting this driver to a loadable module, it can now be unloaded, but
there is no .remove callback registered here to clean up the PM domains.

When the module is unloaded, devres will automatically free the memory allo=
cated
for the power domains and provider data.

However, since pm_genpd_remove() and of_genpd_del_provider() are never call=
ed,
won't the generic PM domain core retain dangling pointers to the devres-fre=
ed
memory in its global lists?

Could this lead to a use-after-free if the PM domain core subsequently acce=
sses
these freed structures?

> +
> +#ifdef MODULE
> +module_platform_driver(imx_sc_pd_driver);
> +#else
>  builtin_platform_driver(imx_sc_pd_driver);
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721100917.2309=
23-1-Zhipeng.wang_1@oss.nxp.com?part=3D2
