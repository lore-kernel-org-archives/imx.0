Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C414F30B51D
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 05:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781068438; cv=none; b=MN4Ak5aoHOy+ZdBw6K4xK6FZdy3AJwBBXNsFFge8ExgMDU58lth2TwEuTqH9zZOnXZb+e9CeTunGwA0jBcdiUgN/3dZzVClaH7hTuyQ/nMlSHb6e/ogutDCnQnA+qT/HOsIzR3AeztNHqY4tL2rYXZisgwR7eOuI6tUjmi11xHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781068438; c=relaxed/simple;
	bh=cxlAxJCtSyqYT8vBKQXzQj+dVs07KZx5yrCCIuis7Wc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f/dgq2vkqjW28aW05LhMaQcRMUEL8qEewBcJP7WqP9uvfUAxF/UVqsEOnSLjNAg4Egp7fPdnA9JW89suUAEq3BVXBAFXx1/4o+zlzGFDNYdukMTz9IIzrXGSR0RAZTTaQrWEvmRvZ3MTQavp1vDU30cgKZxOQ9tzCebCQ32cr9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1k4biCj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1k4biCj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6221F00893;
	Wed, 10 Jun 2026 05:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781068437;
	bh=C0evjX14jKflUtbiLJAIqHD0iuctjLCStSzkBBedmjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b1k4biCjGOnFX0kNiTarlH3qBNjasPX/szL/8tbeEVCF2usA56zafTwregKpuJUg5
	 LJl4JloqBaK+WCaRtUZTTqgD3Y7x9zOj/qBRoYDrOTuyYYeROfE2LTsTi7qAUjgcYo
	 kJ5O3OLWiAqj+N4LL9gzg7sfuRPetirQPu69mTEXyzBaEeHmNqDRywCBu7vzt7Ft7D
	 65Xf7HRcZ92hAvu4Ejs+9gARNYPZbHfWmEt32/szQzqNMIZJadYJ3HJQR35Yb80EeR
	 4Cqncfb5pS26JkSqqqnaOhzckPIfEQtBIeo/tFg60vxIZgWszfiB7GzwX18M2ENVZj
	 VSOT7JDS/oSeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: imx: fix device_node refcount leaks in
 imx7_src_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Weigang He" <geoffreyhe2@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260610050625.2229221-3-geoffreyhe2@gmail.com>
References: <20260610050625.2229221-3-geoffreyhe2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 05:13:56 +0000
Message-Id: <20260610051357.1E6221F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing error handling for failed device tree mappings in imx7_src=
_init() leaves global pointers NULL, which are unconditionally dereferenced=
 later during SMP bring-up.
- [High] Missing return after WARN_ON(!src_base) in imx_src_init() leads to=
 a null pointer dereference if of_iomap() fails.
--

commit 0e3cdec3032f0f9a0628861c081a3260cfa7ce52
Author: Weigang He <geoffreyhe2@gmail.com>

ARM: imx: fix device_node refcount leaks in imx7_src_init()

This commit fixes device_node refcount leaks in imx7_src_init(). It releases
the references acquired by of_find_compatible_node() immediately after
mapping the base addresses.

> diff --git a/arch/arm/mach-imx/src.c b/arch/arm/mach-imx/src.c
> index f28bfb653a88f..c3c80b4c3d53b 100644
> --- a/arch/arm/mach-imx/src.c
> +++ b/arch/arm/mach-imx/src.c
> @@ -196,6 +196,7 @@ void __init imx7_src_init(void)
>  		return;
> =20
>  	src_base =3D of_iomap(np, 0);
> +	of_node_put(np);
>  	if (!src_base)
>  		return;

[Severity: High]
This is a pre-existing issue, but returning early here leaves the global
static pointers src_base and gpc_base uninitialized (NULL).=20

Later, when the SMP subsystem brings up secondary CPUs, imx_boot_secondary()
calls imx_enable_cpu() and imx_set_cpu_jump(), which unconditionally
dereference these NULL pointers:

arch/arm/mach-imx/src.c:imx_enable_cpu() {
    ...
    val =3D readl_relaxed(src_base + SRC_A7RCR1);
    ...
}

Will this cause a kernel panic during SMP bring-up if these mappings fail?

[ ... ]

[Severity: High]
This is also a pre-existing issue in the same file, but does imx_src_init()
missing a return after WARN_ON(!src_base) lead to a null pointer dereferenc=
e?

arch/arm/mach-imx/src.c:imx_src_init() {
    ...
    WARN_ON(!src_base);

    /*
     * force warm reset sources to generate cold reset
     * for a more reliable restart
     */
    spin_lock(&scr_lock);
    val =3D readl_relaxed(src_base + SRC_SCR);
    ...
}

If of_iomap() fails and returns NULL, execution continues and triggers an
immediate NULL pointer dereference. Should this function return after the
warning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610050625.2229=
221-1-geoffreyhe2@gmail.com?part=3D2
