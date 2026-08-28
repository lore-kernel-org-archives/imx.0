Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715903A4505
	for <imx@lists.linux.dev>; Fri, 28 Aug 2026 18:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941798; cv=pass; b=NP1ZE32zPI/ZNM3geS0lZ4kfAsCgmN0/T+Cfgm00AdE6xSLxLn8zZjTxk8ZAWPjZLsACL7ugeuEDApHqV4VPJm7/Jx3c6tswBC0DD/gzLZqdV4KHOCp4grnwjF4wx7TneHIfFw6SWoBpHQXdhsPEE5+OB6jYJrGC5Q711Qhy8BU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941798; c=relaxed/simple;
	bh=7s8SHlsqyt2AUfFDcYfnHSUF9xCjR4O62YhHFP5HeT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeUIXkYz9xMxX7WxWQIhHD40tJZNy7UjF6y5fLGJqZETx2KT4d5RzLP5ikhrFa0XjhfulTtVNHEVc75X+7UHfjhIs0vQflgrUhULtdV1FqS+5sexhN1dHCy16Crp+ICPQqJyNW0EWhVRcYk4esfjlyspxhj98Ft5Zl5U1arwQKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q1SoknZe; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q1SoknZe"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e1bfcc63so986323f8f.1
        for <imx@lists.linux.dev>; Fri, 28 Aug 2026 11:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787941795; cv=none;
        d=google.com; s=arc-20260327;
        b=cEYfh/HxTBmdIA4y8O16hg/ae4WLTeNFDuz48yJeCO8WM5eAbryEOLQfzj2fUf2xj2
         EMg5zchhmhpVzbKni/+QEGq9B8NusANg1UE2AJk/XAZyy+fKQ9HOArn7/ujt11e9QR80
         qFvNLBU3gyvuGgIJOyq7P4daVuZWEWMtbxUD6iFxnZpMzrgOdQOQ6OmIgG/S39uyqxlq
         5aU1PbWGjvQYLVmdlvo+pPeHLCVfJFA4XohEXBRxyVFFl6+1wBQstbl6dF1whfWNX1AS
         iUPYUwzLmOFQ4WzgxVfxe+4lgRSYEbD0AuK54+76+74dNo7gMlE26TDhnS9ZSxW6h/an
         XA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5YJ1kkWNwVyHRN4faZGYbumWsclnmyXO2DH4mLRwZU0=;
        fh=Hmeg1TjAzndw+p6wO2JgWcqswn8Otq7Ltx70fKp4SbA=;
        b=SK/mtNkIn2XI1pJNW9g/AktLqLUFnifon0TxLxbUj28lWAw8XcCSbBs7wuJ6cEqSFz
         WBMQTeDPknpGwY1dMEo1BYJtfZk4p8kbcFHfGUayGVKFkAHgq+UsocdDVRvO3FdRdxf9
         fcagR4DDlRmTmW16GPOpBlKTh99Md/Q57bcs46rAt0c2X9Rswa0DhIIbFlgMTFVXSLiK
         Na1RuwJ1WP3FYvMpj5Ay9vttDtaXXZPs3VekxcYLz7rOj4MrGnMDd37R4C5UOh/aq+Ew
         dPf+nZPIga1cx2BdfloDFmfDXPSXiCy+5oFAHTrWZtfL3L86ZSUp97FRxzzb5MDyJNVh
         nSyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787941795; x=1788546595; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5YJ1kkWNwVyHRN4faZGYbumWsclnmyXO2DH4mLRwZU0=;
        b=Q1SoknZejbF5LzZh6bM9HnZcV429G1yLRQfYZ9v+bcGx5lpS52e4YpGwBHs8DyAVK1
         mklLya+IOSeEL7+Oa9BNTB4obZoZJNzSJmEPd8CRH4noEzeK3YlHwNYwk4rLKMOo66gL
         aV8K399Z3B5/dSNVKdRXIQXRbgY/QYwGVowel+HbAKX7YndPXMGkX9Ie2xHuQeONtgkI
         H962L3H3NmowbH7eOkm3mtudTNI3fwgmkCu8D7et6mNZ0LwhlkdOcMe2ERQm5lcV3M0i
         HfLYWXYVarkupOPcW7IAmYnBAqptUM4wvo+EE42T30xkf8e7+ohBcLABvvPEsUGZ3kyV
         Zivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787941795; x=1788546595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5YJ1kkWNwVyHRN4faZGYbumWsclnmyXO2DH4mLRwZU0=;
        b=Ln7oTZjxEZPexShRELhZgIs60hStiCFZVZlRO6ml4pWdtdb9Sg9fvIPRK6NDPhiQ5j
         1V7KCucGAyD+mFrQJo98/YN8i+6mtvv8FVmlZAj4YsBS7Qs5Z6TNzdxR50a/oVfgNn/f
         fzmpCT86TnvAnalUSrAK9d9o3HDEKNjm+T7XbAAWVV88NTHJ45luU2TObiVBLARX5A2n
         mxAnX4waZNKhDt5uOOOyr75F0M9TrOukjN5t1sh4xXBfTNjZmFPQaZwmCXOXQqP8/lJP
         3VfezMR2MfBx0hl7lwEZYpAR1EXf1nQfiRZj5tfpnw7QL2j7GOo2pwCwdIr+p7/cjetJ
         slQA==
X-Forwarded-Encrypted: i=1; AHgh+RpTLxKFdRbNWHTJSCdAl6iMepbzLaFQwxcukHum9bGlAsu1Dz4AYxFHxoSzggfygsNb1/Q=@lists.linux.dev
X-Gm-Message-State: AFuF++lmEVvo3Si1zgSvyoVeqKddhc2kI1xoIxADeQpCosjEDWsaKM1Y
	QKd3SX0WVdOlaA/e3MH8e/9NNQehDT9YeuVLxN3dkiDH8NGa10rg/nATwnYHD/JNeIKoJYSpOqT
	ZyZSEPQh1UUWIWbo8dtkjfszns3zUEJ/ZZedJo5PP
X-Gm-Gg: AR+sD11ieeDvsZ2lq3hf/U43bnyI6X7d5ziB+eLOGIYlO2AIaJ4+jaoHBGFkbqlX7fZ
	praRJr7Z6iQ85l6sFs12h/EHB8WGrYYgSrPL/BCuAG1inDLlcq51m67XbxMxpvJRVwEqSGXzGS5
	x2pxCdf5lPCw1hXP63UXLajGaDENGFAArgwlFm1JJXN34nvThw32aJZxJszDidkIpZ7X2qBUZLg
	oSwvVBIfLyy2+Np6AcB2398fyP2dOiiPdbYRNuarP5nqbXaPM3BwBPzhNzz6ETkF7zlIPQE9xJ3
	qVBEdTJ1bLUOI08/CKTnK3fStmNCr9oAEQD6iXMPhNNWJgok8Mg8Md2DjQeYXoAfkoiEwvkihC3
	bNJA/84Mamu4iJygK+GHxHpCQP5g8ZPFMKkIUywtLczzv2fek86KR2hd+0w==
X-Received: by 2002:a05:6000:25ee:b0:482:ea3e:882a with SMTP id
 ffacd0b85a97d-482eab75e7dmr25940329f8f.6.1787941794160; Fri, 28 Aug 2026
 11:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
In-Reply-To: <20260827194508.446733-1-linux@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 28 Aug 2026 11:29:42 -0700
X-Gm-Features: AcwNN1Wo8FotnJAZ3x2qyZAW16XADYe-Cm0K9lnOHcg75ObfT4YQxREeCDOy8I4
Message-ID: <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 12:46=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com> =
wrote:
>
> The suspend code that runs from OCRAM is copied there with fncpy(),
> which does not copy the kCFI type hash preceding the function. With
> CONFIG_CFI=3Dy the indirect call through imx6_suspend_in_ocram_fn
> therefore panics.
>
> Keep the call covered by CFI instead of exempting it:

Nice!  This is a pretty good progression.

>
> - Declare imx6_suspend() with SYM_TYPED_FUNC_START() so a type hash
>   is emitted for it. fncpy() requires the entry point to be 8-byte
>   aligned, and the macro's alignment applies to the hash rather than
>   the entry that follows it, so pad manually before the macro.
>
> - Add a cfi_type member at the end of struct imx6_cpu_pm_info, which
>   directly precedes the OCRAM copy of the function. It fits in the
>   struct's tail padding, so no sizes or offsets change. Fill it using
>   cfi_get_func_hash(), putting the hash where the caller's CFI check
>   expects it: four bytes before the function entry.
>
> Also mark ccm_base, suspend_ocram_base and imx6_suspend_in_ocram_fn
> as __ro_after_init: they are only written during __init, and the
> function pointer in particular should not be writable afterwards.
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>
> ---
> Tested on a Kobo Clara HD (i.MX6SLL) running postmarketOS
> (clang/LLVM, CONFIG_CFI=3Dy): suspend and resume work.
>
> Changes in v4, all following Nick's suggestions:
> - Drop the v3 __nocfi wrapper; keep the indirect call CFI-checked.
> - Store the hash in a cfi_type member in the struct's tail padding
>   instead of open-coded pointer arithmetic.
> - Use cfi_get_func_hash() instead of reading the hash manually.
> - Use SYM_TYPED_FUNC_START()/SYM_FUNC_END() instead of ENTRY()/
>   ENDPROC() with a hand-rolled __CFI_TYPE.
>
> Note: linux/uaccess.h is included before linux/cfi.h because
> cfi_get_func_hash() uses get_kernel_nofault() and cfi.h does not
> include uaccess.h itself.

Ah, no, we (you) should fix that. include/linux/cfi.h should IWYU.

>
>  arch/arm/mach-imx/pm-imx6.c      | 25 ++++++++++++++++++++++---
>  arch/arm/mach-imx/suspend-imx6.S | 14 ++++++++++++--
>  2 files changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca4..2d3d3cd 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -4,6 +4,8 @@
>   * Copyright 2011 Linaro Ltd.
>   */
>
> +#include <linux/uaccess.h>
> +#include <linux/cfi.h>

This is a bug in include/linux/cfi.h; don't work around it. Fix it.

>  #include <linux/clk/imx.h>
>  #include <linux/delay.h>
>  #include <linux/init.h>
> @@ -61,9 +63,9 @@
>  #define MX6Q_SUSPEND_OCRAM_SIZE                0x1000
>  #define MX6_MAX_MMDC_IO_NUM            33
>
> -static void __iomem *ccm_base;
> -static void __iomem *suspend_ocram_base;
> -static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase);
> +static void __iomem *ccm_base __ro_after_init;
> +static void __iomem *suspend_ocram_base __ro_after_init;
> +static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase) __ro_=
after_init;
>
>  /*
>   * suspend ocram space layout:
> @@ -229,8 +231,18 @@ struct imx6_cpu_pm_info {
>         struct imx6_pm_base l2_base;
>         u32 mmdc_io_num; /* Number of MMDC IOs which need saved/restored.=
 */
>         u32 mmdc_io_val[MX6_MAX_MMDC_IO_NUM][2]; /* To save offset and va=
lue */
> +       u32 cfi_type; /* kCFI type hash of imx6_suspend() */
>  } __aligned(8);
>
> +/*
> + * The ocram copy of imx6_suspend() starts right after struct imx6_cpu_p=
m_info,
> + * and the CFI check on the indirect call reads the kCFI type hash from =
the
> + * four bytes preceding the function entry, so cfi_type must occupy the =
last
> + * four bytes of the struct, i.e. fit into its tail padding.
> + */
> +static_assert(offsetofend(struct imx6_cpu_pm_info, cfi_type) =3D=3D
> +             sizeof(struct imx6_cpu_pm_info));

on this IWYU thread, shall we also include linux/build_bug.h for
static_assert or linux/stddef.h for offsetofend?

> +
>  void imx6_set_int_mem_clk_lpm(bool enable)
>  {
>         u32 val =3D readl_relaxed(ccm_base + CGPR);
> @@ -568,6 +580,13 @@ static int __init imx6q_suspend_init(const struct im=
x6_pm_socdata *socdata)
>                         mmdc_offset_array[i]);
>         }
>
> +       /*
> +        * Mask out the Thumb bit, as cfi_get_func_hash() expects the
> +        * function's actual start address. Returns 0 if CONFIG_CFI=3Dn.
> +        */
> +       pm_info->cfi_type =3D
> +               cfi_get_func_hash((void *)((uintptr_t)&imx6_suspend & ~1U=
L));
> +
>         imx6_suspend_in_ocram_fn =3D fncpy(
>                 suspend_ocram_base + sizeof(*pm_info),
>                 &imx6_suspend,
> diff --git a/arch/arm/mach-imx/suspend-imx6.S b/arch/arm/mach-imx/suspend=
-imx6.S
> index 63ccc2d..f60c4e5 100644
> --- a/arch/arm/mach-imx/suspend-imx6.S
> +++ b/arch/arm/mach-imx/suspend-imx6.S
> @@ -3,6 +3,7 @@
>   * Copyright 2014 Freescale Semiconductor, Inc.
>   */
>
> +#include <linux/cfi_types.h>
>  #include <linux/linkage.h>
>  #include <asm/assembler.h>
>  #include <asm/asm-offsets.h>
> @@ -148,7 +149,16 @@
>
>         .endm
>
> -ENTRY(imx6_suspend)
> +#ifdef CONFIG_CFI
> +       /*
> +        * Pad the location counter so that the type hash emitted by
> +        * SYM_TYPED_FUNC_START() below ends on an 8-byte boundary:
> +        * fncpy() requires the function entry to be 8-byte aligned.
> +        */
> +       .align  3
> +       .4byte  0

I still don't like these assembler directives inline like this; this
feels like we should have perhaps a new macro in
include/linux/cfi_types.h. Thoughts, Sami?

One that garuntees the 8B alignment of the symbol for w/e that
function patching routine requires?

> +#endif
> +SYM_TYPED_FUNC_START(imx6_suspend)
>         ldr     r1, [r0, #PM_INFO_PBASE_OFFSET]
>         ldr     r2, [r0, #PM_INFO_RESUME_ADDR_OFFSET]
>         ldr     r3, [r0, #PM_INFO_DDR_TYPE_OFFSET]
> @@ -329,4 +339,4 @@ resume:
>         resume_mmdc
>
>         ret     lr
> -ENDPROC(imx6_suspend)
> +SYM_FUNC_END(imx6_suspend)
> --
> 2.55.0
>


--=20
Thanks,
~Nick Desaulniers
