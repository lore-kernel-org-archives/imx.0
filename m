Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC1433E7F
	for <imx@lists.linux.dev>; Sun,  5 Jul 2026 00:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783211299; cv=none; b=U2361wyXk4W6D/Pq2tL7uYnEVFM4W41OM4JOhda6vK7BpZJzIX7TZLMr4t7eNZJ7sPOFhm9FXZPUnAFzA3FJcmZUGiuuJcP9f0aCb6oheArW4/OdPy4Ic5QkvYJzosdRsyM+vWcaXcV9VzTkdlBEv++qZaXlpXPXlUR93wHnPww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783211299; c=relaxed/simple;
	bh=exsc8ny4mD7hFk2pjlbbMyouFjDA7k3TWS7XDdSKWUE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IawAN/M7zWafo1WAuAH4Lxoo9jE9zSpwab6OQ7PlTgcPOARlPmEQcvUmj8fE/tIoDmiXxEwa5UN+PWsZ1Bu7C3Bzxqrbq3Trxes28khypff9fW0QrDF+3DeTQL8cJWfl514uYrKtGbJkFOiniY/xwuRQ7ewCrGyoYUMYJRlRzI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2DZs+vS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2DZs+vS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F4E1F000E9;
	Sun,  5 Jul 2026 00:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783211298;
	bh=krpJ+QeQWrgZJr242P9jedQbDMKjqg3/QcigcTtQl+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U2DZs+vSntwFh+BCTMduWeDLdbAqrnGmsEH/1gQLrlJ5PsSmawQ9b49/RGKFBdkTW
	 43bsjyNRhMLMzUqM9+51R1WzWDdubuntHrTj/7hMBac2RrIEWZkbqiX7E5lRqFJOuK
	 JLFRU58/D05fFlvTcFclAxBikikkmGIVuodV6tx8FyTmtUtBtoD42Fh205hXHJkUOs
	 0NMNPczbFk+JFZjZCBszbhgFEuhaSJqf8lAa/ocIvpzuCKKwgk0uIN070Fs03i2wJJ
	 iZiTGdLvNiLBOJ5gpWaOnrscMVlMD7w0FqN5R11VYJ7XDDjhiR5lXjp1XPPfOWuQnX
	 yYsE/CSV6xxaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
References: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 00:28:17 +0000
Message-Id: <20260705002818.59F4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver lacks a `.remove` callback, which leaks CCF clocks on m=
odule unload and creates a use-after-free condition.
--

commit 61eb45335ff77dbb9e15e46999a551625f299716
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()

This commit adds the missing MODULE_DEVICE_TABLE() export for the driver's
match table. This ensures module alias information is generated, allowing
for automatic module loading.

> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -337,6 +337,7 @@ static const struct of_device_id imx8qxp_match[] =3D {
>  	{ .compatible =3D "fsl,imx8qm-clk", &imx_clk_scu_rsrc_imx8qm, },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, imx8qxp_match);
> =20
>  static struct platform_driver imx8qxp_clk_driver =3D {
>  	.driver =3D {
>  		.name =3D "imx8qxp-clk",
>  		.of_match_table =3D imx8qxp_match,
>  		.suppress_bind_attrs =3D true,
>  	},
>  	.probe =3D imx8qxp_clk_probe,
>  };

[Severity: High]
This is a pre-existing issue, but does unloading this module create a
use-after-free condition in the Common Clock Framework?

Because imx8qxp_clk_driver lacks a .remove callback, it does not seem to
call of_clk_del_provider() and imx_clk_scu_unregister() when the module
is unloaded. Since these clocks are not devm-managed, do they remain
active in the CCF?

If they stay active after the module is removed via rmmod, won't any
subsequent access to the clock tree trigger a panic, as the clock .ops
pointers will reference unloaded module memory?

Looking at drivers/clk/imx/clk-scu.c, the imx_clk_scu_driver sub-driver
also appears to lack a .remove callback to clean up CCF clocks and memory
when unregistered.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705001705.7040=
0-1-pengpeng@iscas.ac.cn?part=3D1
