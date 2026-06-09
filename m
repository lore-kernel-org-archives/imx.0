Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C613A9D9D
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988297; cv=none; b=OyI4ASzhlAR7mu3Fj57bjakjXGOA5AAHjyC2M1/aaVTx2+LZwUiIzWp3VhcIElyZ1wdXsGKPAtXHMJ5RCJ0mqZAYlgt0mf2lXzLJNG2VitxEcPpgyyLMevCuQBtRidFg7DEwTvsPCBxNpG7Zuf6ULFBBTI66FKA9eiW4sDTLupY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988297; c=relaxed/simple;
	bh=Hy0uHrFDbNyqmmdwOUXr/24wyPe0P/xAj/kC/mDIJlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPp2bEw4jGm/cIdnRk/4LBlIrX0TBYiGC+WHYrcIo/LbTEOGoGoZtxnhV56x0791anJkUefr8iehp3YXGlab/KvsAJNTxhEgOIGpkZkjpW3B0qMcA+2MUMCN3+9eaijKCXp2Dj3opXn8RVhBL652H+jQsS6EO27RuvUXIbOcguQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KgWTIDmf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KgWTIDmf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780988294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CErMmgwjtyGkijbinQXt+E+wyTwr3hFPBwtSrU4ri/Q=;
	b=KgWTIDmfu9FbEQMcuJ3hB2gwK0Tvx54wlRg+apYepPzGuT6d7U3+S0ybY4WAYgLhzYa9yX
	EPM6m3bMA7GVH3YDTIbAPA8xatXn3BcadHsEAJCM2d3hJdQTsdbDNWx/2YiZxNSzjmzwH/
	6a9WjeO3cNGn0mEI4Gx602X7AxYH7LM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-w01ZrQC7NJezLdxdUhmnow-1; Tue, 09 Jun 2026 02:58:13 -0400
X-MC-Unique: w01ZrQC7NJezLdxdUhmnow-1
X-Mimecast-MFC-AGG-ID: w01ZrQC7NJezLdxdUhmnow_1780988292
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-39659dea96eso3283951fa.0
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 23:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780988292; x=1781593092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CErMmgwjtyGkijbinQXt+E+wyTwr3hFPBwtSrU4ri/Q=;
        b=olBp6DiyVcCHeuJKuGQlm6Wp/a6UyCFB42YkSnRs+Wtdl6t4DqYPL4fI415H2SkxCo
         AyYJL5TsqKxddI3cEWr1rio7vJrC504q9pE0pAA6TEn6DfF4N0Il5QzBFQvujp+CD1q7
         1bQuzYAHqhfc1So7cxJziGJcVhXcdDv2q1uop6WMRqZA8ksAgqmQWKFnAeWwxIWaShWq
         jOrY/xFIvx+Y9cr3X0BwmfVjIbpOQHvHyGmiKpn5Jcav/8jYYvtXgkW9VJpaZsw2NZkK
         3WK1S/kcOX20dHJhiqW2wgboWHiGeDusBDcsZTUiGbQ972R3h2yL7DT6JTCTFLgYyKd1
         DWRA==
X-Forwarded-Encrypted: i=1; AFNElJ9gxb/n3ooAiZ7pG1qqOHz/Dv2mTnxlT+yEYF3CJxvQUIoC/F7t2cxXd3v01rULLnbDylo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yys/ilIAhzhlHOBS3M/82H5Yj814WlFU/nA+MLoh4F5JMg/ghX1
	G/5N3QrnzGbL/yPbLuV5px7EpN8uoB2pN6AG1Cbpz/V5eYobD49lAI+88i8cH4A+fZG6BsGBGSb
	v0Zo6FtLkr9gPI/oyHK7nYmyJvpc52HMt9giHOxcHMv1uP8qM+E+Jt62f7yFZRXrGfB8pH9ChZ+
	E+1jq9FZ+UuqvHqD4EyDHocZ2/CFiT
X-Gm-Gg: Acq92OGswBPZHlYiSpguRDIfFXH5RNko2AjEYqnJB6lqvMQww8IU4In2xpL66t1RqKS
	8lTwel9dOFN8aAuJy6kdfbrrkBrZw9C5FWPusywlwZKOCdZ2zo7YIKahoCfTWOx4p72FZcBK3U5
	gnJh9cMecbF5xY8CpSFr2LPSYfMbxao395tmlkpCpQXHHozliw6rlnOXX8QveZhESSP9HeTANfu
	Bp9CsKzN+Et24MD
X-Received: by 2002:a05:651c:b22:b0:396:7280:1e5e with SMTP id 38308e7fff4ca-396d05b0e5amr22977561fa.0.1780988291632;
        Mon, 08 Jun 2026 23:58:11 -0700 (PDT)
X-Received: by 2002:a05:651c:b22:b0:396:7280:1e5e with SMTP id
 38308e7fff4ca-396d05b0e5amr22977501fa.0.1780988291073; Mon, 08 Jun 2026
 23:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com>
In-Reply-To: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 9 Jun 2026 08:57:59 +0200
X-Gm-Features: AVVi8CcxoAX6rnYlSTy8BOa9cf_aoNVALY7D0WD4kPNY6cpfFhuFnoxfIF3bvHw
Message-ID: <CALE0LRtJemHQj7o8iV1GaWJLVfTse6fp-TFvodC=AeWov6s39w@mail.gmail.com>
Subject: Re: [PATCH v3] clocksource: move NXP timer selection to drivers/clocksource
To: Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QoyGI0dbTe3fEQDojQDyF7KMeFz9jjKxcvJFP_eyjjI_1780988292
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, May 14, 2026 at 1:14=E2=80=AFPM Enric Balletbo i Serra
<eballetbo@kernel.org> wrote:
>
> From: Enric Balletbo i Serra <eballetb@redhat.com>
>
> The Kconfig logic for selecting the scheduler clocksource on
> NXP Vybrid (VF610) uses a `choice` block restricted to 32-bit ARM. This
> prevents 64-bit architectures, such as the NXP S32 family, from enabling
> the NXP Periodic Interrupt Timer (PIT) driver (CONFIG_NXP_PIT_TIMER).
>
> Relocate the NXP clocksource selection from arch/arm/mach-imx/Kconfig to
> drivers/clocksource/Kconfig. This allows the configuration to be shared
> across different architectures.
>
> Update the selection to include support for ARCH_S32 and add a "None"
> option restricted to ARCH_S32, since Vybrid lacks the ARM Architected
> Timer. The Vybrid Global Timer option is restricted to ARCH_MULTI_V7
> SOC_VF610 platforms to prevent it from being visible on Cortex-M4 builds,
> which lack the ARM Global Timer hardware.
>
> Fixes: bee33f22d7c3 ("clocksource/drivers/nxp-pit: Add NXP Automotive s32=
g2 / s32g3 support")
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>

Now that Frank [1] has created a merge request for Linux 7.1-rc1 and
the request includes

      arm64: dts: s32g: add PIT support for s32g2 and s32g3

If this patch is ok, would it make sense to pick that patch?
Otherwise, we won't be able to select the PIT timer for aarch64 only
builds.

Thanks.,
  Enric

[1] From: Frank.Li@nxp.com

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
tags/imx-dt64-7.2

for you to fetch changes up to c10cfc952215644956284a42fa7b7860dfbcb5f5:



> ---
> Changes in v3:
> - Restrict VF_TIMER_NONE to ARCH_S32 to prevent selecting it on Vybrid
>   platforms which lack the ARM Architected Timer
> - Link to v2: https://lore.kernel.org/r/20260513-fix-nxp-timer-v2-1-533b9=
9c57b67@redhat.com
>
> Changes in v2:
> - Fix VF_USE_ARM_GLOBAL_TIMER dependency: use ARCH_MULTI_V7 instead of
>   ARM to prevent the option from being visible on Cortex-M4 builds
>   (Sashiko AI review)
> - Link to v1: https://lore.kernel.org/r/20260302-fix-nxp-timer-v1-1-af4bc=
62d4ffa@redhat.com
> ---
>  arch/arm/mach-imx/Kconfig   | 21 ---------------------
>  drivers/clocksource/Kconfig | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 21 deletions(-)
>
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index 6ea1bd55acf8..a361840d7a04 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -227,27 +227,6 @@ config SOC_VF610
>         help
>           This enables support for Freescale Vybrid VF610 processor.
>
> -choice
> -       prompt "Clocksource for scheduler clock"
> -       depends on SOC_VF610
> -       default VF_USE_ARM_GLOBAL_TIMER
> -
> -       config VF_USE_ARM_GLOBAL_TIMER
> -               bool "Use ARM Global Timer"
> -               depends on ARCH_MULTI_V7
> -               select ARM_GLOBAL_TIMER
> -               select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> -               help
> -                 Use the ARM Global Timer as clocksource
> -
> -       config VF_USE_PIT_TIMER
> -               bool "Use PIT timer"
> -               select NXP_PIT_TIMER
> -               help
> -                 Use SoC Periodic Interrupt Timer (PIT) as clocksource
> -
> -endchoice
> -
>  endif
>
>  endif
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index d1a33a231a44..d9c76dd443f8 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -793,4 +793,35 @@ config RTK_SYSTIMER
>           this option only when building for a Realtek platform or for co=
mpilation
>           testing.
>
> +choice
> +       prompt "NXP clocksource for scheduler clock"
> +       depends on SOC_VF610 || ARCH_S32
> +       # Default to Global Timer for Vybrid (32-bit)
> +       default VF_USE_ARM_GLOBAL_TIMER if SOC_VF610
> +       # Default to None for S32 (64-bit)
> +       default VF_TIMER_NONE if ARCH_S32
> +
> +       config VF_USE_ARM_GLOBAL_TIMER
> +               bool "Use NXP Vybrid Global Timer"
> +               depends on ARCH_MULTI_V7 && SOC_VF610
> +               select ARM_GLOBAL_TIMER
> +               select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> +               help
> +                 Use the NXP Vybrid Global Timer as clocksource.
> +
> +       config VF_USE_PIT_TIMER
> +               bool "Use NXP PIT timer"
> +               select NXP_PIT_TIMER
> +               help
> +                 Use NXP Periodic Interrupt Timer (PIT) as clocksource.
> +
> +       config VF_TIMER_NONE
> +               bool "None (Use standard Arch Timer)"
> +               depends on ARCH_S32
> +               help
> +                 Do not use any specific NXP timer driver. Use the stand=
ard
> +                 ARM Architected Timer instead.
> +
> +endchoice
> +
>  endmenu
>
> ---
> base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
> change-id: 20260302-fix-nxp-timer-9cb1fbd7afcd
>
> Best regards,
> --
> Enric Balletbo i Serra <eballetb@redhat.com>
>

