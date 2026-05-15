Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716163F0A8D
	for <imx@lists.linux.dev>; Fri, 15 May 2026 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830788; cv=pass; b=Mmyb1N6zXUhTQkwr+qgWenSu1iTwfgwfEjHPkrQmNMHWFixw+GRIvPmjhWn7ugSyqmbR9U8ikhhjyV891JO9YFKhLWsCUrg1rLFn0BXR3UIaecArYa+E/sDH0v1PnBqYQa1gMvpxHtvksaEMnnqYASqHab3La5ImxFMoxqLcuQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830788; c=relaxed/simple;
	bh=DvITViv1UdcN77dGzCmSWIw/wgiaxHKidIibKZfFpOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRMliFr4nCv0XkYboXDpyoN9j+Tum6+XpGzphT58jYRdRUsLiYfhFaiBVMl9YdpqguVzSKCMVyt5pRJZn322PbSo9H9zalA5DCR+wB8sAp7F+Lj/b8jwUAYYDAETcuxLhwjEp4Uy27BWkv7UmGzugSCdBrGS8tYyD06dNX2x76U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktwczmpN; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktwczmpN"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c629a31d1d0so627281a12.1
        for <imx@lists.linux.dev>; Fri, 15 May 2026 00:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778830784; cv=none;
        d=google.com; s=arc-20240605;
        b=kkqbCmsvwsCyxSWMtkA7utxK1Nur1F8Hgh2JhVJfo+YjyWEs68hnZTLmf0YxEYuiNV
         xi/JvekAon9i7LRqimdrbma7Ht9Vkk9Sh+s/unjoVUoiv/yFAabJB63sFjvskAB9Q66g
         /QSp3a0lEMOfEZ0+w0it45ZFm3vfj4tuvKPtdTL77Kqt3WVjx73rm7DI7BxZQiIF1Vys
         KiXEIWdne/GizuB25ZuiJsn27Tfu19bIFvyd56vrIgRz27Fvb1SjvaVd6SC+Pz9Ds9F4
         NWLfrDna8XzoXefmFYLR7R/OQ4hP9ad6CW8cxRUHqtZxbkL8f4+9VbyjqMb+iNPz8ZFM
         j+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AxCLltORc5KKdU6k9QBsTr54hF7033gaoDGXRcDln6Y=;
        fh=rSOyu4vl8OAdoDpnIEylXlWlWFe5PM20gihhje/tWtw=;
        b=NHCnGhuy8RXgPrISEk6yBT0HIfC5ZQ+GvnKoSq6yvW1a8OBzsMALJ5lf6eGf1Wv5b3
         kRpXTev3pXi7iLOzzdJRsAN+yNTc4oL58r+m3yX3LJY40mTD5hzh56B4Gua6aXz1NSPX
         YIi2Q6TmU3JgSTOg32TQ4gB4JWmrbQFdP8EXjs9tsGcPPKutcIyUEiratBY3QdaJe9TE
         Rk21yskeub/7z5V+WglN3f1Nt5Bl7rS3wljLRazEqm9KRv0H1H98Bmd0gxVNNmZBC+Gm
         Yq7MTPRIWFcFR2AJcWtHx1PRMCbr3xyhoQByOIkg+RthL1/fDFeZUrmuWD4hHae16q/z
         JjkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778830784; x=1779435584; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxCLltORc5KKdU6k9QBsTr54hF7033gaoDGXRcDln6Y=;
        b=ktwczmpNMa8zOMHBSd+vNbFULrPIK610PZ98fnHspBz4SW51f4En+DV+olWZe1k1ED
         PZZ2OsfUj6e0S9IPoKag5VXQsMb/9HzUHr4XcWU38qKnxWdcCg7p/unXE63FXMw+PS9R
         U6jaKphyUtDAv+9lXTpOpYmigfh254fIveQ0NmDemVWdP2I5fwv6mDcVYFSoorxfQZYE
         Au4SFDaeRfnzBW3Pv2j9fEPH9AWASNbr41eBD49+NjsjWYpOTpfXTgBh2SFvK03TW6Pd
         WP2/9mSmiy67mzhaNq2m/5zXw5OIlSBc+m7r6UVxSgrqvvZs8mCRfsadnnHaZy5h7A7O
         kvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778830784; x=1779435584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AxCLltORc5KKdU6k9QBsTr54hF7033gaoDGXRcDln6Y=;
        b=nhSPPnffFTFvY/4Q6g/puinpHAiScjS3HC2IdfCW58k6g45aPBmEHvpAuqsEpliBHI
         WDf2hyjtwQnSknH2o3DWqQ8Oz6/i6Sn4AUbaGSNzncD4R+uN6WT9Hq+p/rAytQOS6dZD
         p7AbqLutU1RlteHNAFAcDxjjJAB0imB+FZhjzpXbmNJeZ2c5JfV7t4e0O0LPvo/PgUIP
         JiMBsb7OtPtTDZItX3ybZdVjk7wEK5p5dW2/7cnsoMM8Qq8tT60n/TAZiy0ICPq9tUMM
         T+2hvqkiAGKE7gqv2Pwnvh4PyeKyL7NINGCzJOqGiULyoJ+O2LA2IXj2ZySH1ThZwgvT
         e7Yw==
X-Forwarded-Encrypted: i=1; AFNElJ9SVfJocG+5t8ww8V/jK8nlFkf1tJ2CaEs14Au4xxdm+ein/oEkOvdbwmgjtdrYNpMG1OE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQbWdnVo9CM7EmLyj2jlXbsD63mnqxgx9d5v4ZkRjStCsk1LsG
	v+FUGCxOHeC+YCeX8xv3Y62g8Vw/xyX5DOFSSfiWMM8h21mn0l+EWH1/YcBBwoOwZxPFS7yj6TQ
	sMxpmk916aLT1Ig0a2GhBsT6tZyQFLks=
X-Gm-Gg: Acq92OHKw49UThxT9nsrr3di7vIM1iOaIxgTIJM+xyL3CLwNSqx53HwxV7Fd2FKyMHF
	5RvB8/sdxAs9DGAOleke1soUNcgwkzlFd1m6WuWrcTYjsRkvzcq4rT7aDdBn1xgvTf+zVNyTY+S
	pODJgC7NOkx+AjzoBTWuYNEh2djfmezfIAr9cznOdkbznV4HqMHRESOeA59+r405n43NbIiJYLR
	EaL19szBTpf29QBLffKdhvHrjGs40449uIUocy1h3DH2I3yNVyOZnoi7Ydu++cK/h+HsoI866Yz
	1WICS2CC51VR2niI3YfhjEcXjnvszNdNrOPn4Sk=
X-Received: by 2002:a05:6a00:4c94:b0:834:e09b:de73 with SMTP id
 d2e1a72fcca58-83f33dda422mr1604434b3a.7.1778830784359; Fri, 15 May 2026
 00:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com> <20260514190513.B63B0C2BCB3@smtp.kernel.org>
In-Reply-To: <20260514190513.B63B0C2BCB3@smtp.kernel.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 15 May 2026 09:39:32 +0200
X-Gm-Features: AVHnY4J-2kUxNSnCaxn1q1NJi14Qby2UbiNzsr_nf6encMzHQBB6QijVzBgdRDA
Message-ID: <CAFqH_52d3o4U_K64yBXWTHhys73nUqL1u6sM7GfUTP_6TycQ4g@mail.gmail.com>
Subject: Re: [PATCH v3] clocksource: move NXP timer selection to drivers/clocksource
To: sashiko-reviews@lists.linux.dev
Cc: Enric Balletbo i Serra <eballetbo@kernel.org>, imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

For some reason this doesn't appear as a thread in my original email.
Answering your question below.

Missatge de l'adre=C3=A7a <sashiko-bot@kernel.org> del dia dj., 14 de maig
2026 a les 21:05:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Shoehorning ARCH_S32 (ARM64) into the Vybrid scheduler clock cho=
ice block risks replacing the native ARM Architected Timer with a slower 32=
-bit MMIO timer.
> --
>
> commit 37ddcc4eb82e3bfe1a0ebf5e407f22b4f2b1bef7
> Author: Enric Balletbo i Serra <eballetb@redhat.com>
>
> clocksource: move NXP timer selection to drivers/clocksource
>
> This commit relocates the NXP clocksource Kconfig logic from
> arch/arm/mach-imx/Kconfig to drivers/clocksource/Kconfig. It updates
> the selection to include support for the 64-bit ARCH_S32 platform,
> adding a "None" option to fallback to the standard ARM Architected Timer.
>
> [ ... ]
>
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index d1a33a231a44c..d9c76dd443f8a 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -793,4 +793,35 @@ config RTK_SYSTIMER
> >         this option only when building for a Realtek platform or for co=
mpilation
> >         testing.
> >
> > +choice
> > +     prompt "NXP clocksource for scheduler clock"
> > +     depends on SOC_VF610 || ARCH_S32
> > +     # Default to Global Timer for Vybrid (32-bit)
> > +     default VF_USE_ARM_GLOBAL_TIMER if SOC_VF610
> > +     # Default to None for S32 (64-bit)
> > +     default VF_TIMER_NONE if ARCH_S32
> > +
> > +     config VF_USE_ARM_GLOBAL_TIMER
> > +             bool "Use NXP Vybrid Global Timer"
> > +             depends on ARCH_MULTI_V7 && SOC_VF610
> > +             select ARM_GLOBAL_TIMER
> > +             select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> > +             help
> > +               Use the NXP Vybrid Global Timer as clocksource.
> > +
> > +     config VF_USE_PIT_TIMER
> > +             bool "Use NXP PIT timer"
> > +             select NXP_PIT_TIMER
> > +             help
> > +               Use NXP Periodic Interrupt Timer (PIT) as clocksource.
>
> Could this replace the native ARM Architected Timer with a slower 32-bit =
MMIO
> timer on S32 systems?
>
> Since NXP_PIT_TIMER has no prompt of its own, an S32 user needing the PIT
> timer for other valid purposes (like clock events) is forced to select
> VF_USE_PIT_TIMER from this choice block.
>
> If selected, the timer-nxp-pit.c driver unconditionally calls
> sched_clock_register() during initialization. This automatically override=
s the
> existing scheduler clock if the new clock's rate is higher than or equal =
to
> the current one.
>
> Because the PIT timer is typically driven by a high-speed system bus, its
> frequency will likely exceed the ARM Architected Timer's standard 25-50 M=
Hz
> rate. Overriding the heavily optimized 64-bit system-register Architected
> Timer with a 32-bit memory-mapped PIT timer introduces massive read laten=
cy
> for every sched_clock() call.
>
> Would it be better to expose NXP_PIT_TIMER as a standalone option for S32=
,
> and modify the driver to avoid registering as sched_clock on ARM64
> architectures?
>

This is pre-existing driver behavior that applies equally on Vybrid
today. The choice block defaults to VF_TIMER_NONE on S32, so the PIT
is only selected if the user explicitly requests it. The choice prompt
("NXP clocksource for scheduler clock") makes the intent clear.

Decoupling NXP_PIT_TIMER from sched_clock registration on arm64 would
be a worthwhile improvement to the driver itself, but I think that's a
separate change from this Kconfig reorganization.

Does it make sense?

Cheers,
  Enric

> > +
> > +     config VF_TIMER_NONE
> > +             bool "None (Use standard Arch Timer)"
> > +             depends on ARCH_S32
> > +             help
> > +               Do not use any specific NXP timer driver. Use the stand=
ard
> > +               ARM Architected Timer instead.
> > +
> > +endchoice
> > +
> >  endmenu
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-fix-nxp-=
timer-v3-1-a3e68fdb505e@redhat.com?part=3D1
