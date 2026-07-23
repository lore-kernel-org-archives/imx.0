Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422E342538;
	Thu, 23 Jul 2026 02:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773227; cv=none; b=uxTV6gB9YFCnxWmpMSls5bCw+smj8s0n/3Gqrua5oIUZOvg1E7X6BxYk7/XKm1VlwE8XY47qGiZRAUNtYI42N3JX5MLq/V2rXWNF71bRT0+AxQA+eBGGrO8gHrb1NSGSReWbXiVonC+bre7t5ens5F4BCM+Iqjbjdh/6MKUmsBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773227; c=relaxed/simple;
	bh=evNTHTrTeRV0/n9ZhCoNvKqtWcNfNB1AFi2JRAX07Dk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fLpp2+lB1YFzb3kBohZOoamk3g5Bo/pakITuPo1efUWPAG1ssneM0LElr3ju3tvnKwrYEUVAU/lcVl5DfaF37rGrTRr2bY1HErok4atQf5n/JcI6HwArjzx92EMe/N/m1CNHuwJh89xoC6cv4gJrGS6tAnZZhkFBg7GQiB162DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SibmB9xR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SibmB9xR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C557B1F000E9;
	Thu, 23 Jul 2026 02:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784773226;
	bh=Zyp2wAZyneJd7XSSK9apZqq9Go93b+XhNGHjxeRdWJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SibmB9xRbQ/CPrTSylFcy0WkTV+svs+81/a4gQ3+VLhFxUdKq+5rDMb/rcMYg+yvP
	 mWjkUwYOJvMBQ4CuSpQOGHGYJ6IBuWkFZlLj1hJRm5PQqeEV0eSBzTxiQ8FG6dxnZl
	 zzANsIv2sy3z3ENY0VnBHBxS8jwCxzn6pd9vwcp2RqYY1WCTs1UsfgDuqGwU0FduRa
	 mZz3SvoOvArUYf0SZwAR2MkoejBtLapfvF4ThcIgPqUZndKQ16kwxu8PHEPCI5fZVS
	 nLmk64LYW8S+p47GUQIwsiD5mOuoGgptPlqtKGeyRo06yLhYJeJpAgXftnVdBQuisF
	 Z2aYwsUV7dlCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] clk: imx: imx8qxp: add soft dependency on SCU
 power domain driver
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260723020524.1886806-4-Zhipeng.wang_1@oss.nxp.com>
References: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
 <20260723020524.1886806-4-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:20:25 +0000
Message-Id: <20260723022025.C557B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Relying on MODULE_SOFTDEP for driver probe ordering is an anti-pat=
tern that fails to guarantee resource availability and is completely ineffe=
ctive in built-in/module configurations.
--

--- Patch [3]: [PATCH v5 3/3] clk: imx: imx8qxp: add soft dependency on SCU=
 power domain driver ---
commit b23cf3ab8ab04f852f48d1fd72b4b4fa914a8cd0
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

clk: imx: imx8qxp: add soft dependency on SCU power domain driver

This commit adds a MODULE_SOFTDEP to ensure the SCU power domain module
loads before the clock module. This is intended to work around failures
when attaching power domains to clock devices before the provider has
probed.

> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> index c781425a005ef..17302ee628b76 100644
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -373,3 +373,4 @@ module_exit(imx8qxp_clk_exit);
>  MODULE_AUTHOR("Aisheng Dong <aisheng.dong@nxp.com>");
>  MODULE_DESCRIPTION("NXP i.MX8QXP clock driver");
>  MODULE_LICENSE("GPL v2");
> +MODULE_SOFTDEP("pre: scu_pd");

[Severity: High]
Does this softdep approach fully resolve the issue if one driver is built-in
and the other is a module?

Relying on module load ordering doesn't guarantee resource availability if
the kernel is configured with CONFIG_CLK_IMX8QXP=3Dy and CONFIG_IMX_SCU_PD=
=3Dm,
or if the power domain provider simply defers its probe. If the power
domains are not attached, the clocks are still registered and exposed.
Accessing them without an active power domain can lead to hardware hangs.

Looking at drivers/clk/imx/clk-scu.c, it appears the root of the problem is
that imx_clk_scu_alloc_dev() ignores the error instead of propagating it:

imx_clk_scu_alloc_dev()
    ...
    ret =3D imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
    if (ret)
        pr_warn("%s: failed to attached the power domain %d\n", name, ret);
    ...

Would it be safer to propagate the error (like -EPROBE_DEFER) when
imx_clk_scu_attach_pd() fails, rather than registering the clock hardware in
a broken state and relying on module load order?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723020524.1886=
806-1-Zhipeng.wang_1@oss.nxp.com?part=3D3
