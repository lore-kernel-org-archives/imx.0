Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F242F5A13
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 05:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781068565; cv=none; b=W4BvvlaknmbLaa9x8ON6/F0kBjWVGnEXN5AEeWEx70KlShNYBHTgVtTUeUhkSRXCDKTflW2TwAP8kK6Nuh9I8WJFwkxuWtDR7adppQOdUvdQpHBqB5GoSVxY9uDU+fmp/f4n0NsvJdHoySdSvt0cUt3K781mgXwAqSocptBeK60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781068565; c=relaxed/simple;
	bh=1gcaaSiPFs5CQo8rk6460/LkcQXL9sDOunDe/gtPPjE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iUjVap4vhpSRe9lGyUAbc5CHvzGPjRnVn4Fuy4YiVrnplZfR8tV/VJb+OVgUKUPRwaZc2M/g+kiNWl2MqLZPY40+ac48fdTaX0fyN1pYqNE2CipCraRBUO50+i4Ra52qx+apxhFrnOR9FSC6eZrokAlE9LSO9HKzy+yqN1Sydio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJkANW8Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJkANW8Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B001F00893;
	Wed, 10 Jun 2026 05:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781068564;
	bh=LkE5maH9UnSkyMdYanGQOfS2LI3I8vq1JtxQylNQ2DU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJkANW8QBncm/DjKVgJ7fvt82FJIBrPYQE5wNiSbaQ8ckdN9IzXEfC0T12P3ebLTZ
	 F73AeOdt+80zW/YzsJs3B+3rpOjEybk2bCplnEO2F19Jx8X4GzqUgr4+OKMfJFvXIC
	 iG1jv5myCUiOS6FiX2bqndeI4OLXWbcuK9Zb4uJ+CghPD+O/gmYQLElDxpIUV+E9Wq
	 4flnV17lUO9nUz+MlZ3UIFTr7GcWhvgo1+MeYNLL6qkGjExbA3g7rfVvM3Vc48cdak
	 +XHioU9s04cqaqLDVjrCdr80lEGH2iFwmXlH4tMXOro14c03C/P/0Nzop45vwxmVgQ
	 vBpJvsat4PhSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ARM: imx: fix device_node refcount leak in
 imx_src_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Weigang He" <geoffreyhe2@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260610050625.2229221-2-geoffreyhe2@gmail.com>
References: <20260610050625.2229221-2-geoffreyhe2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 05:16:03 +0000
Message-Id: <20260610051604.43B001F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the `imx_src_pro=
be()` platform driver blindly registers the reset controller without verify=
ing if the global `src_base` pointer was successfully initialized.
--

commit 3a8b3e9f6b1a902d26351b0e93daa81ca748d342
Author: Weigang He <geoffreyhe2@gmail.com>

ARM: imx: fix device_node refcount leak in imx_src_init()

imx_src_init() obtains a device_node reference via
of_find_compatible_node() matching "fsl,imx51-src" and uses it only to
call of_iomap(). It never releases that reference: on the success path
the function returns at the end without of_node_put(np), leaking one
device_node refcount on every boot of an i.MX5/6 platform.

> diff --git a/arch/arm/mach-imx/src.c b/arch/arm/mach-imx/src.c
> index 59a8e8cc44693..f28bfb653a88f 100644
> --- a/arch/arm/mach-imx/src.c
> +++ b/arch/arm/mach-imx/src.c
> @@ -171,6 +171,7 @@ void __init imx_src_init(void)
>  	if (!np)
>  		return;
>  	src_base =3D of_iomap(np, 0);
> +	of_node_put(np);
>  	WARN_ON(!src_base);

[Severity: High]
This isn't a bug introduced by this patch, but the imx_src_probe() platform
driver blindly registers the reset controller without verifying if the glob=
al
src_base pointer was successfully initialized.

On platforms like i.MX50, the early boot initialization function
imx_src_init() is never called, leaving src_base statically uninitialized
(NULL).

Despite src_base being NULL, the i.MX50 device tree contains the
"fsl,imx51-src" compatible string, which causes imx_src_probe() to execute
and register the reset controller:

arch/arm/mach-imx/src.c:imx_src_probe() {
    ...
	rcdev->ops =3D &imx_src_ops;
	rcdev->dev =3D &pdev->dev;
	rcdev->of_node =3D pdev->dev.of_node;
	rcdev->nr_resets =3D ARRAY_SIZE(sw_reset_bits);

	return devm_reset_controller_register(&pdev->dev, rcdev);
}

Any subsequent consumer request for a reset via the API will trigger a
structurally guaranteed kernel panic on a NULL pointer dereference because
imx_src_reset_module() unconditionally dereferences src_base.

Should the probe function verify if (!src_base) before registering the
controller to avoid exposing a fatally broken API?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610050625.2229=
221-1-geoffreyhe2@gmail.com?part=3D1
