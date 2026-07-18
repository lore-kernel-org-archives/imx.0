Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE813D53C
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 09:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784367211; cv=none; b=R9sgoQ4aE4lFiv+oV2h5dtikjro+ZWKxuVWTVoo6WhbioJt1DkPzE+KpzriQv1pSNE8Vn2FK0d1lMJ0J7CeNX+CYx8GDlBVRGUDxNfJblB5/rM0fRYdreCEPdginNFwe8ypm8sQ+4zMSk23pkEu/6M2F0cuiHxiN3Tl5aqmbqp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784367211; c=relaxed/simple;
	bh=bAJDmo66F0pgHMESyl0uZ81wGHBMPQ8zfeKWLh4t1q8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iaCz07x5icAWaTV97RTgtoDdhGpc/l7FpIqEpGDYaC48dz/Qtfoq5feklBHvrOBrhQv4uNDet0hq5L/dZ4Ki+NEsL+IJOpe5z66U8Hb8vdkyFiVpSux0lo9FDGdh1fCillvYys2X4iPmY1FWdJXsb2qb+T2WysrXL3+AaTWHN8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1q5Gcc+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1q5Gcc+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DB11F000E9;
	Sat, 18 Jul 2026 09:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784367209;
	bh=zM+K+Xee3Phcwpr1RARjEkR3baAPJI6iZnMgJySpftc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R1q5Gcc+qWbqJPcUNAXkk5Mq/SmAcd/4JPbK6mDrOIVyq3aers+WoVYd2pNr3RV10
	 gxzZHugvmdOGWYA8cRmMDeddgGEGWMqPTvegQbyekfm9GBWRM0oXyBIKOTOXXqslUb
	 2B9+MNwRh3YExRtxi2hCxejxyNyzJUa4rbHWy30EK4AHgt8O77IeBSarcTlSkLt8wO
	 IkNa5TMz7iLEcycQ4mvclsRxKcMFFYYY1aQ5EOEg7IxGdu8Tid84Im5h30wIzKUp5y
	 sVkWUtkChJjqDruUeRybqV9+bIo5cDe7eUumUeyg4j10QRKRvk+2WtvP/7guF/gJ4R
	 jy69xOxF0RMzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ARM: imx: Fix suspend/resume crash with Clang CFI
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?WW8nYXYgTW9zaGU=?= <linux@yoavmoshe.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260718091917.81738-1-linux@yoavmoshe.com>
References: <20260718091917.81738-1-linux@yoavmoshe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:33:28 +0000
Message-Id: <20260718093329.12DB11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Applying `__nocfi` to `imx6q_suspend_finish` unintentionally disab=
les KCFI checks for other indirect branches.
- [High] The CFI bypass mitigation is incomplete: `suspend_ocram_base` rema=
ins writable, enabling a Write-What-Where (Data-Oriented Programming) explo=
it.

Pre-existing issues:
- [High] The kCFI panic with `fncpy` relocated code affects multiple platfo=
rms, but is only fixed for i.MX6.
- [High] The `ccm_base` global variable is written only during initializati=
on but lacks `__ro_after_init` protection, exposing it to manipulation for =
Read-Modify-Write (RMW) gadgets.
--

--- Patch [1]: [PATCH v2] ARM: imx: Fix suspend/resume crash with Clang CFI=
 ---
commit 66327a9e81a0b45dd7493d089dd60f3a912e1240
Author: Yo'av Moshe <linux@yoavmoshe.com>

ARM: imx: Fix suspend/resume crash with Clang CFI

Relocated suspend code in OCRAM lacks compiler-generated CFI type
signatures. This patch annotates imx6q_suspend_finish with __nocfi to
bypass CFI checking for the indirect call, and marks the function pointer
as __ro_after_init.

> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca498f887..b425a47019896 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -63,7 +63,7 @@
> =20
>  static void __iomem *ccm_base;

[Severity: High]
This is a pre-existing issue, but does ccm_base also need __ro_after_init
protection?

Since ccm_base is assigned once in imx6_pm_common_init() and then
repeatedly dereferenced in power management functions like imx6_set_lpm(),
could an attacker overwrite it to misdirect read/write operations?

For example, readl_relaxed(ccm_base + CLPCR) could be redirected to
arbitrary kernel addresses. Adding __ro_after_init here might prevent
trivial data-oriented programming exploitation of power management paths.

>  static void __iomem *suspend_ocram_base;

[Severity: High]
Since suspend_ocram_base is passed as the first argument to the __nocfi
function imx6_suspend_in_ocram_fn, does leaving it mutable in the .bss
section defeat the intent of the __ro_after_init protection?

The target assembly routine imx6_suspend trusts this pointer (passed in
r0), using it to derive target addresses for memory writes:

arch/arm/mach-imx/suspend-imx6.S:imx6_suspend()
    ldr r11, [r0, #PM_INFO_MX6Q_SRC_V_OFFSET]
    /* store physical resume addr and pm_info address. */
    str r9, [r11, #MX6Q_SRC_GPR1]

Could an attacker with arbitrary memory write capabilities overwrite
suspend_ocram_base to point to a crafted payload, yielding a
write-what-where primitive during suspend that completely bypasses CFI?

> -static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase);
> +static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase) __ro_=
after_init;
> =20
>  /*
>   * suspend ocram space layout:

[ ... ]

> @@ -360,7 +360,7 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
>  	return 0;
>  }
> =20
> -static int imx6q_suspend_finish(unsigned long val)
> +static int __nocfi imx6q_suspend_finish(unsigned long val)

[Severity: High]
By applying __nocfi to the entire imx6q_suspend_finish() function, are we
unintentionally disabling CFI checks for other indirect branches?

Within this function, cpu_do_idle() and flush_cache_all() expand to
indirect calls (cpu_vtable[smp_processor_id()]->_do_idle() and
cpu_cache.flush_kern_all()).

Could an attacker with arbitrary memory write capabilities overwrite these
architecture-level function pointers and bypass kCFI entirely when a
suspend is triggered?

Would it be safer to restrict the __nocfi annotation to a minimal inline
or noinline wrapper function that only executes the single unverified
indirect call to imx6_suspend_in_ocram_fn?

>  {
>  	if (!imx6_suspend_in_ocram_fn) {
>  		cpu_do_idle();
>  	} else {
>  		/*
>  		 * call low level suspend function in ocram,
>  		 * as we need to float DDR IO.
>  		 */
>  		local_flush_tlb_all();
>  		/* check if need to flush internal L2 cache */
>  		if (!((struct imx6_cpu_pm_info *)
>  			suspend_ocram_base)->l2_base.vbase)
>  			flush_cache_all();
>  		imx6_suspend_in_ocram_fn(suspend_ocram_base);

[Severity: High]
This is a pre-existing issue, but does fixing this kCFI panic only for
i.MX6 leave other 32-bit ARM platforms broken?

The kCFI panic with fncpy() relocated code appears to affect multiple
platforms since fncpy() copies only the instruction body and omits the
compiler-generated SYM_TYPED_FUNC_START header.

For example, mx5_suspend_enter() in arch/arm/mach-imx/pm-imx5.c invokes
imx5_suspend_in_ocram_fn(suspend_ocram_base), and at91_suspend_finish()
in arch/arm/mach-at91/pm.c invokes at91_suspend_sram_fn(&soc_pm.data).

Since neither seem to have a __nocfi bypass, would they suffer
deterministic kernel panics on suspend when CONFIG_CFI_CLANG is active?

>  	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718091917.8173=
8-1-linux@yoavmoshe.com?part=3D1
