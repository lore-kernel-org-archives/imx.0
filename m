Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B7471278;
	Wed, 22 Jul 2026 07:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705738; cv=none; b=QDE30xBxaaOTSvYQ37ziPtt2dfTKTuVZ5hF4qKgkRhgN4J4ZH+SOdqU2JP19Ylveap41CG+Y9Y0tt7x3br3gg6A7861WNXsz0MHNUWDbdpyyXDAPqGBk+fFkGeQLjkOMy2yTQxRgImrtSHIA8rdJE1gC+/h7w3khA9OPquRS2rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705738; c=relaxed/simple;
	bh=OQlDAqNMzBnMNxKlPLFJMdLMy7aMkmaCxhyy2qr7RC0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E83EsAOvjhJj5oAuyGsxV9J2MjaVdWN75fb+KnmSEhrfa6PNc5v91WqAkSrT03amOPjvzdHN3reOL4tb7lFvdD8WkCm0ut0YORvtgjcA3qChuTkKo/rmEKX+1Zxeam2risacsmvor9NMH8B3NamqrSR2n4ClvCnEB0dJ75O8Qfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bX+bKTzf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bX+bKTzf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C031F000E9;
	Wed, 22 Jul 2026 07:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784705733;
	bh=ovqGqpb3eBbk/HLJ3etOQ1MN4umBeB0gtovmd9nWjVw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bX+bKTzf93c6JJ1rEABqbqftiNBs+YaMVggJzEqO+PQb1xZuxLKx7IGhaI89awDLI
	 U+zjnLs/cmGaCvURoZiotfNcVyyowf85UD+MyBoNC6P3rDY8/31CmlcWt7BexBb0KI
	 tdy2Pt2vzu8AgKikOpw4RegntYbLG1V9d4HFDE1foj0IZIuRgQ9VAWIYt1UpnwOrmw
	 dbO5PnCTbILKJeEXfmyiMVM0u71pW9K+bfb4Laqz4yRRkMha007zf866wm8FBQBwxG
	 V7U5lQ5tEyD8Aym8mcZ/pK365Nrw6FWl8sBtXb7BAtv4hwmJQe/25+uDnzcBQnhwkm
	 iak6OQsJr2ruw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] pmdomain: imx: scu-pd: allow building as a
 module
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260722071512.3494011-3-Zhipeng.wang_1@oss.nxp.com>
References: <20260722071512.3494011-1-Zhipeng.wang_1@oss.nxp.com>
 <20260722071512.3494011-3-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 07:35:32 +0000
Message-Id: <20260722073533.04C031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Building the SCU PM domain driver as a module breaks power domain =
attachment for SCU clocks due to unhandled deferred probing.
--

--- Patch [2]: [PATCH v3 2/2] pmdomain: imx: scu-pd: allow building as a mo=
dule ---
commit 8b0026aca4b6a877c269d6333189db725f3c6d76
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

pmdomain: imx: scu-pd: allow building as a module

This commit converts the IMX_SCU_PD config from bool to tristate to allow
building the SCU power domain driver as a loadable module, which is
required for Android GKI kernels.

> diff --git a/drivers/pmdomain/imx/Kconfig b/drivers/pmdomain/imx/Kconfig
> index 00203615c65e9..472e9dec6bd4e 100644
> --- a/drivers/pmdomain/imx/Kconfig
> +++ b/drivers/pmdomain/imx/Kconfig
> @@ -21,7 +21,7 @@ config IMX9_BLK_CTRL
>  	depends on PM_GENERIC_DOMAINS
> =20
>  config IMX_SCU_PD
> -	bool "IMX SCU Power Domain driver"
> +	tristate "IMX SCU Power Domain driver"

[Severity: High]
Does building the power domain driver as a module break power domain
attachment for SCU clocks?

If IMX_SCU_PD is built as a module, there are no explicit symbol dependenci=
es
or softdeps between the SCU clock driver and the PD provider, meaning the
clock driver might be loaded first.

Looking at the consumer side in drivers/clk/imx/clk-scu.c:

imx_clk_scu_alloc_dev() {
    ...
    ret =3D imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
    if (ret)
        pr_warn("%s: failed to attached the power domain %d\n",
            name, ret);

    ret =3D platform_device_add(pdev);
    ...
}

Since the consumer ignores the return value from the attachment attempt, an
error like -ENOENT (when the provider is not registered yet) will not
trigger a deferred probe. Furthermore, because these software-created clock
devices lack an of_node, the device core's standard deferred probing
mechanisms cannot retry the attachment later.

Will this leave the SCU clocks permanently registered without their power
domains attached, potentially causing hardware malfunctions or continuous
power waste?

>  	depends on IMX_SCU
>  	help
>  	  The System Controller Firmware (SCFW) based power domain driver.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722071512.3494=
011-1-Zhipeng.wang_1@oss.nxp.com?part=3D2
