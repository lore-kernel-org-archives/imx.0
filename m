Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83783DE453
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 16:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566407; cv=pass; b=gUGVCR8KLbwK2b42ZYqcDTHUKMJj1ZrWLh3nL8AfxsJKVSyMk7gyd4Plmry3rPRm2sIzabytXCSQQ+sg4hA3e1Uic+mK5D0ZUj6aDvdFKYJOiJkfWZPrpYN1ymzWS8VrET09BglYq7K1hXIqufdS4o7e2FfXcDro5I5IzSF45bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566407; c=relaxed/simple;
	bh=qSOihwAar06nv8h68gm4bvTuHPJpIJ55wjBa33x1Ebg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wh6JuZ1Cc5tsG5cknv/ZsQWE/D+f8ZNymOVrQ15HZxWFh2/2K4qB6AglIeIWYZSKXzDs62Ko9c4JpghoHvHlP1fqMzw3JL74+pUzl2mABzkAyuxVaXUttxseqE10Ejupe6lSZB+wmkiLTvqZ1q1qT3LKpooYO6BvDyRh7rikWT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cWyKtGaX; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cWyKtGaX"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c160420289bso1454336466b.0
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 09:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784566404; cv=none;
        d=google.com; s=arc-20260327;
        b=oTwlQNM6aB0qZouCJtnJ5qEsAWMUSuGL/7Oa0E6ORaWOcycnX/am9cTTPbPjY+OjaN
         p7G5zXXwKYn5vrHVwnpxpmtALSd89Ri6VbAo+WzZd2j58GO5pNMR3di2gVKZe2tD1qVg
         XCHgbNbRaUKXOXZMJ6kqBozoN6RHEvf8xARZnSjwMKvB6kyJdvm+Y/4bBdU2Aq9iphAN
         addVwdmmXvXr0RD0QnlWbI2nDbo8M01INdfr7eCrYTgM1uhc7t4DBBCDH2jR1ykCAfxE
         5Dk2FITG9k9RsCTb2pYScEkqCWuZLXMmlbj8h9rjIvNB6k7ciXQ5O/v5bzT1T3MTkrRt
         vr1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3TIixJrgxWFhjPBn/7cXBuahRTs588KwiH/BnLWvNO8=;
        fh=NPHlcx9QSvLAC5psbGtuXuGimvZTN/DoeuSs/cKszZs=;
        b=Ogiw7MRW6iOqgdTn0kqH1NntrR7KB3Gspr8pq7sdTXsh+9nckvJLzaZu1V1lnBGbQ1
         CaVGWt9oFMGUVcheFg/TdfEXrR8by+PeqRrM9Yoq3NmgsIJCXRpBg2NYTe/VS4Fq9eiJ
         lcnWVhj2PfbWhacfDFSagg3A6TAkiLTx2KtX5ynPxDHkoZmv82xVuJ/QLB4b8bRSNKQJ
         t+jqAVeJ04OjdOuz5qtz4G/qh91Ho+bYbjqJZMpaSctGHCUkxUqgxQgTe+pMot1ceItW
         SXO/Hh7h9EFzkXzWh3CGfni7yiJIPvq3sJVVG9Ch4WakGp6ducqA7qX5W4+vLbOuJfZT
         oCpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784566404; x=1785171204; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3TIixJrgxWFhjPBn/7cXBuahRTs588KwiH/BnLWvNO8=;
        b=cWyKtGaXj7nBVTpVHUySkJ/yHUz9bcJsunO+qORVywa7rPP931mDcR7dW6xRfOejD4
         ApwDHWfJB1QOJoDBQt6/3fwq7mP9Q7q91YdDK02Sefy7PdgnyxRh6cosINrIQI8EEty8
         OI8A8jPB/ueJqtKLWyugQvTN9Fuzd4ZtWsNAdz18a7RmmJNmWsUElG2AKUQW0C+tkc8Q
         XtIn4GcfObKFmspeuIP8Rzf1Owfp52Gr4GQelboUKdDidrGGQQ7GwwIa6nLZdoQbJ87V
         lHVQYqYm3w/gBUqIfg+ZPpppPXxhSNz+FP1bqEWvnP8rR6lEHra0tSNsm4XJKds08qSu
         Ee4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566404; x=1785171204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TIixJrgxWFhjPBn/7cXBuahRTs588KwiH/BnLWvNO8=;
        b=LxoCj1lbSJr0Qn05gR9gXC6knt/th1E2xQG7PPrNCQlqIezCp0kiyXzFYqmDHbyrGc
         qosmuM1qh4P4jh4+dOe6YC8b7jU5iiIQMFZDxtaipYeOMLJqGQD/QwCCwxXelfRwhaX9
         ks3+whlV7qgN2/o2BoIMR7GK/Q2fHESkHGAJN37nHmAR89ltDrS43swR8eIqt3GS3pdO
         Gg0BPQhNvWwPQewBxl0jIx99u04/spsOISxuBLcdj0Dad4IRbEFDwFpUaLsAqLdc36k/
         sMbhEhkeOzcV8SFHGkyjRfhlyE7ufwIxyL4TpOSPNKIKlKgpw/eS/eIX6QUtyb0qbI1g
         Yskw==
X-Forwarded-Encrypted: i=1; AHgh+RrsBA0petoAU60tJu8rhNfDoJ/prz49L7p2nl5V/IITH9QXCpGBwa/CMhFRQZPh/nbCCBE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl2QWNrKLhwintjr5KXvTn22cWqMMsl2r388XQmNnDaJUI8k2u
	mAWq7nSaWKrkR4HySvJN5e9N2yGmHhAHYOZkpUJWs0z6WwbreIb3wCNT9RnssM6FjJYYye+kIfL
	qn59DteFzRCxGCPqO7GyYZb/GL1vr0vVF75S2/9yJ
X-Gm-Gg: AfdE7cnXggxRu0g/nc1C6v79K/a9AUejyo/PdJbSsX2TA0g/TRBkecEK/SbdvrloVLU
	PrO9/ZHQhi4Rc90yYiJHJsbcAVESo0pVqCP6acb44rIny1zzp0OzfQ9KzYSz0CRQ4191Tw0wOxK
	tmK40sD3vSDRyGpxBXuIdmDgyhskK78jvaEj0OvoOUlSP8JVwjzQwSHHH7xAimIVVrDcTYsZrIw
	uWTowMVUBmeXPOT+J/hpC7gx7uizM3HbasU17+tCfjcyn9mVW0Nd+C8DJ03W7vARv4IKNz4+jc/
	2YqD3dMYUwAq277JCRIns7ISaGyp55cwW0HgC++5U07uhvsKogyEA+JUhvaq1J/cBYyrMudLcGP
	DfbEFs3BQYdU=
X-Received: by 2002:a17:907:6d14:b0:c15:e137:d57f with SMTP id
 a640c23a62f3a-c16b48678d9mr657987166b.54.1784566402947; Mon, 20 Jul 2026
 09:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com>
In-Reply-To: <20260718111340.159896-1-linux@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 20 Jul 2026 09:53:11 -0700
X-Gm-Features: AUfX_mw9O2p0DT6-W8ngt0co6elfl4BwN1-CYf_F0Yc57cKNxMjDlorSGTBkHkI
Message-ID: <CAKwvOd=eAC-Mz0kZhbHQMFOY=ba=WXDH6X_Zzh6KGfuq5PmJ4A@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 4:14=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> Relocated suspend code in OCRAM lacks compiler-generated CFI type
> signatures. When CONFIG_CFI=3Dy is active, the indirect call to
> imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.
>
> To resolve this safely without reducing CFI protection scope:
> 1. Create a minimal wrapper function imx6_suspend_in_ocram annotated
>    with __nocfi to handle the unverified indirect call.
> 2. Remove the __nocfi annotation from the main imx6q_suspend_finish
>    function to preserve full CFI coverage for other indirect calls
>    in that scope (such as cpu_do_idle() and flush_cache_all()).
> 3. Mark global variables ccm_base, suspend_ocram_base, and the
>    imx6_suspend_in_ocram_fn pointer as __ro_after_init to prevent
>    them from being used as target vectors for CFI bypass exploits.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>
> ---
> Tested on a Kobo Clara HD (i.MX6SLL SoC) running postmarketOS edge.
> Before this patch, suspending the device caused an immediate silent
> hang requiring a hard-reboot. With this patch applied, suspend and
> resume work successfully.
>
> Differences from v2:
> - Restrained __nocfi scope by adding a dedicated, minimal 1-line
>   wrapper function (imx6_suspend_in_ocram) for the OCRAM call,
>   avoiding disabling CFI checks for cpu_do_idle() and flush_cache_all().
> - Marked global pointers ccm_base and suspend_ocram_base as
>   __ro_after_init to fully neutralize Write-What-Where exploit bypasses.
>
>  arch/arm/mach-imx/pm-imx6.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca498..3d5b960c5 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -61,9 +61,9 @@
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

Are we able to just put __nocfi on the declaration of
`imx6_suspend_in_ocram_fn`, rather than bother with a wrapper
(imx6_suspend_in_ocram)? I don't know if that works, but surely you
can test that quickly?

>
>  /*
>   * suspend ocram space layout:
> @@ -360,6 +360,11 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
>         return 0;
>  }
>
> +static void __nocfi imx6_suspend_in_ocram(void __iomem *ocram_vbase)
> +{
> +       imx6_suspend_in_ocram_fn(ocram_vbase);
> +}
> +
>  static int imx6q_suspend_finish(unsigned long val)
>  {
>         if (!imx6_suspend_in_ocram_fn) {
> @@ -374,7 +379,7 @@ static int imx6q_suspend_finish(unsigned long val)
>                 if (!((struct imx6_cpu_pm_info *)
>                         suspend_ocram_base)->l2_base.vbase)
>                         flush_cache_all();
> -               imx6_suspend_in_ocram_fn(suspend_ocram_base);
> +               imx6_suspend_in_ocram(suspend_ocram_base);
>         }
>
>         return 0;
> --
> 2.55.0
>


--=20
Thanks,
~Nick Desaulniers
