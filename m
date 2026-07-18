Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD5B279DCC
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784374153; cv=none; b=B0iO+CnQFeKjuuEPDeIhFK40cRyQfBHPIhB9Mcfc+emlNopV3hUnTFW17+9B22bIlYftA+e7fjQI8djXeo4DHLmXWtcoZua9R+O8oWtUYFlI+sbijKmgiZ3AgJVvq2IJzFW4VVLhCxNn6BQ1nDAMhYKEhb/zisDmbbOC4WETeFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784374153; c=relaxed/simple;
	bh=lbWqwrP6XgBNTgAa1+wMPlKnT+OLxlF6nc2GGxIoUng=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FRSzEj3n2Sa4SNvUknW7ahJKHUP+dhwUKIo9NDxnaAv1BEEfwOhPDFAUsnT3/xqiRwznFCQb8PVg6bPY22pj3MXNz0gF71H9TH+fsHqTrw4iN6HF/nps4HrPrOh09CHd5jX0q3M6cGELlPY3hNHsqmngCbBni9g+58oK/5J9ShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bbw5pK72; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bbw5pK72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922C21F000E9;
	Sat, 18 Jul 2026 11:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784374151;
	bh=Z1J4OYh8wEVqzIjHo0tSVIPx+HImDrm+QxUff7X53j4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bbw5pK72Wo3Imruc/nVYgMFbmafi2VqJupmupcSx3aqL86LkpUUmz9jDCjGcwh/Yo
	 Oz/T3AC5X+9ZcqyuCjPPcNPCnvgCtvD3awOYgOxOAkouGvOdYBEbGqcVt7PoV8tqrj
	 LuWvTP2UnL4+pV3Wm+nXkFrlJD3ONm3GDhraKQYZC/SxuiFOGzz5sowzjYamkqGnnn
	 GKhKnh8h6yVLLq0RsLMHV0/YUCuREh9mVzBst8WQFTgLXVX8s2a+pJfJLx/Byqxv6N
	 tcYIDPvmIGkRPgZe+mautDH3ZUzmPcJPVkiUQWtbsFcI5NPFY6RGcSx1ZglxKlqGq1
	 df8fEOt0czeig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?WW8nYXYgTW9zaGU=?= <linux@yoavmoshe.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260718111340.159896-1-linux@yoavmoshe.com>
References: <20260718111340.159896-1-linux@yoavmoshe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 11:29:11 +0000
Message-Id: <20260718112911.922C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] W^X Violation / Exploit Mitigation Bypass via Writable OCRAM A=
lias
--

--- Patch [1]: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI=
 ---
commit b6dc32274a7f40075998a9c67f552a3982169e81
Author: Yo'av Moshe <linux@yoavmoshe.com>

ARM: imx: Fix suspend/resume crash with Clang CFI

This commit fixes a suspend/resume crash caused by CFI violations on indire=
ct=20
calls to relocated OCRAM code. It introduces a minimal __nocfi wrapper for=
=20
the OCRAM call and marks relevant pointers as __ro_after_init to mitigate=20
potential exploit risks.

> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca498f887..3d5b960c583bd 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -61,9 +61,9 @@
>  #define MX6Q_SUSPEND_OCRAM_SIZE		0x1000
>  #define MX6_MAX_MMDC_IO_NUM		33
> =20
> -static void __iomem *ccm_base;
> -static void __iomem *suspend_ocram_base;
> -static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase);
> +static void __iomem *ccm_base __ro_after_init;
> +static void __iomem *suspend_ocram_base __ro_after_init;
> +static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase) __ro_=
after_init;

[ ... ]

> @@ -360,6 +360,11 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
>  	return 0;
>  }
> =20
> +static void __nocfi imx6_suspend_in_ocram(void __iomem *ocram_vbase)
> +{
> +	imx6_suspend_in_ocram_fn(ocram_vbase);
> +}

[Severity: Critical]
This is a pre-existing issue, but does adding __ro_after_init fully protect=
=20
this memory from write-what-where attacks?

Looking at imx6q_suspend_init(), physical OCRAM memory is mapped with both =
a=20
persistent writable alias (ocram_base) and an executable alias=20
(suspend_ocram_base):

arch/arm/mach-imx/pm-imx6.c:imx6q_suspend_init() {
    ocram_base =3D gen_pool_alloc(ocram_pool, MX6Q_SUSPEND_OCRAM_SIZE);
    ...
    ocram_pbase =3D gen_pool_virt_to_phys(ocram_pool, ocram_base);

    suspend_ocram_base =3D __arm_ioremap_exec(ocram_pbase,
        MX6Q_SUSPEND_OCRAM_SIZE, false);
    ...
    __arm_iomem_set_ro(suspend_ocram_base, MX6Q_SUSPEND_OCRAM_SIZE);
}

Even though suspend_ocram_base is marked read-only and its pointer is now=20
__ro_after_init, the initial writable alias (ocram_base) appears to remain=
=20
fully active without being unmapped.

Since this patch introduces a __nocfi wrapper to execute this memory, could=
 an=20
attacker still bypass CFI by writing shellcode directly into the active=20
writable ocram_base alias?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718111340.1598=
96-1-linux@yoavmoshe.com?part=3D1
