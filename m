Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3246F422532
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299340; cv=none; b=AVB3IKblt8AjQckQydj/TbZUNxrM4tRMkPEO2R7Ldas6wZlNS5Nim4+ESLfIJfPrYL25ICex7pcf9h/gh3Y4BOJ510WOC7+h7ZEbgMd+ALvIXmkI6A+sSvhesAGfjltS7lksNviCPfddlw4FrjB8KMYn26CAFi4acgZa6r1Oo50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299340; c=relaxed/simple;
	bh=fPh7o6c2x7gOcOLMv+HBFn1lltlEWMe7k9DiWxoCRko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WsBOB/RwllSmT8/iLbNWnAvj85bpN6h7i78ODi8Jpq34WdClyGAqMh1zQYtAQgbsZJFIV/ImAy9U/S4zMZiQp565NaxzeiIHreWku/wfDrRO/7II80rX2b2hJtapfebj0pKeiYr1OuAXJu///bsJTefPxn5MkX/sXg8/40kq05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NT0ZbaC5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NT0ZbaC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9514C1F000E9;
	Fri, 17 Jul 2026 14:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784299338;
	bh=vhLRC5CNfUjlIU0d3j5Xz8gKGivHdxOYs1bM2s+5an4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NT0ZbaC5G5GlVa3PsjBZDMWVMEdup2Wt8qcZ6iNq9YS+6PmarKbYMWlqPHDvskz3k
	 wmmWAEDpgDCMVRZKnFaty3AKVUJwxGJ1Yxxo/kCAODPH/bmGGzIu53AxRQ4CMzHfk3
	 kwLIp8ODa80BjjSnYzErlOF3Jm74GW0mxlVRzlwz8aOHxiwgPyGVf5QRlKITm57IdH
	 L1pRUAwoQ3J/q6778BN5vR/Up1Vh4gyxr5RwbnzkO62ZJ8misCwIhG9J/8pfYrrauP
	 k7Trv6oevsPfDIJt0gQnbz3b7zaPF9QKmJ4lUkwGkm3Y91ATYhcpNY/UWd3LFJTk2Y
	 wT0PqKBx7OIgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: imx: Fix suspend/resume crash with Clang CFI
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?WW8nYXYgTW9zaGU=?= <linux@yoavmoshe.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260717141648.1007059-1-linux@yoavmoshe.com>
References: <20260717141648.1007059-1-linux@yoavmoshe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 14:42:18 +0000
Message-Id: <20260717144218.9514C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The `__nocfi` annotation on `imx6q_suspend_finish` creates a KCFI =
bypass gadget and unnecessarily removes CFI protection from standard kernel=
 indirect calls.

Pre-existing issues:
- [High] The KCFI panic bypass for dynamically-copied assembly routines is =
incomplete, as identical patterns exist in other ARM platforms that will st=
ill panic when KCFI is enabled and suspend is triggered.
--

--- Patch [1]: [PATCH] ARM: imx: Fix suspend/resume crash with Clang CFI ---
commit aea4e29393049bd454bac337e0878d861ebe299d
Author: Yo'av Moshe <linux@yoavmoshe.com>

ARM: imx: Fix suspend/resume crash with Clang CFI

This patch annotates imx6q_suspend_finish with __nocfi to bypass strict
CFI violations during suspend when CONFIG_CFI=3Dy is active. The crash
occurs because relocated suspend code in OCRAM lacks compiler-generated
CFI type signatures.

> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca498f887..d9b0c18032c68 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
[ ... ]
> @@ -360,7 +360,7 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
>  	return 0;
>  }
> =20
> -static int imx6q_suspend_finish(unsigned long val)
> +static int __nocfi imx6q_suspend_finish(unsigned long val)

[Severity: High]
Does applying __nocfi to the entire function expose the globally writable
imx6_suspend_in_ocram_fn pointer as a potential KCFI bypass gadget?

Since imx6_suspend_in_ocram_fn is defined without __ro_after_init:

arch/arm/mach-imx/pm-imx6.c:
static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase);

Could an attacker with an arbitrary write primitive overwrite this pointer
and bypass KCFI execution validation when system suspend is triggered?
Also, does annotating the whole function unnecessarily disable CFI
protection for standard kernel calls like cpu_do_idle() and
flush_cache_all() that occur in the same scope?

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
This is a pre-existing issue, but do identical patterns exist in other ARM
platforms that will still trigger a KCFI panic on suspend?

For example, mx5_suspend_enter() in arch/arm/mach-imx/pm-imx5.c calls the
dynamically copied imx5_suspend_in_ocram_fn() via an indirect C call:

arch/arm/mach-imx/pm-imx5.c:mx5_suspend_enter() {
    ...
    imx5_suspend_in_ocram_fn(suspend_ocram_base);
    ...
}

Similar patterns exist in arch/arm/mach-at91/pm.c for
at91_suspend_sram_fn() and arch/arm/mach-socfpga/pm.c for
socfpga_sdram_self_refresh_in_ocram().

Because fncpy does not copy the KCFI type hash located 4 bytes before the
assembly function entry, will these platforms also crash on suspend when
CONFIG_CFI_CLANG=3Dy is active?

>  	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717141648.1007=
059-1-linux@yoavmoshe.com?part=3D1
