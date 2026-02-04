Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5431C860A
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 14:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215481; cv=pass; b=mI+fV7RVEtZNw+QRvsSXpH+VIp6kbVBlJVSkx/rh26YLdBzifWs1KQf294lV9rM10MeqBQgeKIiq7OzvA10sJvidCIMSVz4vf0WAktCKJH9typl7QPrPtwGQ7HLPyTuFKdifoecbpHNQmhXVRnxDdrPFlpyDT9u6gm5qHeiicJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215481; c=relaxed/simple;
	bh=VeU1M/+PLjDRdSdinp+x/60VrhCRA3f0z0U08KL3du0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMW9OlhgTej5hhWMxKw7k+0vASNZj4OWn31o/IZIICCVtKIRx/YP6m4dm6au2eh9c/aD384rDFh8pQNIm0E+Q4a590tkldDSu0cxHnjwB0J0ANpcDvzsdaCBp97TaPxe4JuXKkwE3DuiYSJNDrKpYF7KOHh2ScMxKiZipYvhMzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDnuwvjJ; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDnuwvjJ"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-649d4690088so1873086d50.0
        for <imx@lists.linux.dev>; Wed, 04 Feb 2026 06:31:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770215480; cv=none;
        d=google.com; s=arc-20240605;
        b=IjwUmoRjXrgn/Yw6qXHSoZMXf+YPM6Ccx7zt169TxPAgsK1w8dIjX456n1okysAHiE
         n1KyRprxarlhppdhg+w3J3YJ1GXprIttp2qHqdYngbFpj7Vj0Xhar/ohbFOIXfLdDByy
         oGm2qmzhxoPIHsu5U5V4+p8I8gxDo3MlWx9b118Qs7jDojaee6fHrZv5baHxat90JSAL
         SZasPS2AVtwNvxIm0XVb4Cpur956mNEeN0uLh5AspT12BwUyJE1j/HfF3tVeZDHMxyiD
         0Prd6y8Vvrw6RCE5YpOfsC4ySh6z5IAtDDTxSH17s1YZ6W2sVBK04au6xaVU7VX52RSt
         UJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dI+cml2Ore4hIHpIJvCr+cPhA0RJkwTrbCvVMmSJFk8=;
        fh=JbjE4iQcYxHJ8vdqZpmDyV7PLM7N2A//WjGJllQO0gk=;
        b=bDVH6HpU16fFeWKE2ES0fmzK8fPNJ9iC9KYyDP5hFQM2hOtaC/kcVp6Z1o2zY2upvN
         uCEVt1os8iomPQ8xF2vQBF+4j7lmQSsFIMHZFZ/HjkghZcNd4uFvz2+7rOjljlc2yeko
         f2Tj6ihObQgjhbn0veZkCRaMyChjYwPBzCw9Yh8XqQ6ZS5N3/duS3zK3R/ChO+eBYNpi
         yfbLf67JGWAwLTIKuhj/LTlem9aNb+aX/1TY8MEd05+IUiqElJKUeVuGFPohiiobWxxP
         6pfSDem5FMHGrBFxEzzescLF0Tn+Ax+tVz+Lf1tl6MYpSvAaufmsfjMAqXQVuQWHzdNQ
         BGxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770215480; x=1770820280; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dI+cml2Ore4hIHpIJvCr+cPhA0RJkwTrbCvVMmSJFk8=;
        b=DDnuwvjJuCgB7Jaf8LUNamK2MiwUZZRHoTB0nVQoJ1+kMYMX/ZVxcWkAjURFQ/T7jn
         6F/PmttsSZ3x0bdlFb2pMC5uWjTRTyiw9WUYI2CsTdUJkN9+IT6nDbgwNqDiWUsO4p7o
         /xGDcs/hzIfkRZ8rCZ79LDL9KXf1QU3ijxUVPiiHud4NyLpytoVLY8mACiIg3+7vy0oO
         YlTyk1Wl2sw1INkC275dxfQ5DgG1meHNcFR8/Alsbr4ob4MdH9I8KP8Tvi5gMm90WFRn
         rzK89H4yyfevLsXjsLLVMfYnFyHnGNhCVAhyj16PXxya2LUPgIvS5HKXDR7zQ1mWce4u
         oCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215480; x=1770820280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dI+cml2Ore4hIHpIJvCr+cPhA0RJkwTrbCvVMmSJFk8=;
        b=gsIJJLpYSgPc5iY+nS20/YQdHlcPCo0MwC7CZVvOG2SF0XYnEEkSBXZlt5HaBH1+kS
         pKUpJWGW2dKsUjWPW6r/7p4gP0cnFtmXhG4LsMwLOseXfdHVYLt2dQ/K9+IxwzGX/Yiz
         I+n1D99om+nxeCMatD5WQN9XGMpnjpVihVCgOBHBQrniOYMjDvEI8f0h7CvsAta0pZQ5
         C68ipprGM1AwGMhH0iF51sZcVxZEdpcTVPOSCXSt0HBcM6dqMl5oJGWm4J/ZJ2y0kixE
         fEjf+B6Nx9cA32HVRNr3N1R9t2rEiE0MDsG6+k2h/WImA8hvtokD98NRQkkv9XizaRo/
         DpHg==
X-Forwarded-Encrypted: i=1; AJvYcCVvBZewzNO0++nsNLUxTRbb/Wl2+RGFAOE0060/1FQkIZVPrfPSVI2o7RdQ/2JNfQptafk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYBN1dXzdkBp8Fq1TJVeZxTMpXWcxPEgjDAN91qg40H+WVDqTe
	n3vOicggDw6XuVshqAh/Rt3G0SNudLCi+/+kQ83LuOfEkQD6ElfLTAe7ynHedls3bfVnk003G8A
	7yZ33EqIavHjGqErGgX9ElI+C0elzDyxWzS9Jk2fnLQ==
X-Gm-Gg: AZuq6aLYEJ7vFN6FnAdvP5BrJIE40CGCegbOwIHHLDk8yRMltDtBVLS+sVOimKyfJ/r
	OD0eYwVKNaBgiRrJ/pNk9yMnRA9HKQGA3g9VlIeSaMLCYgmeBHibJZJurqohi+O4LEfvTXz+mH2
	Qc9Vg8zfcSllAMci1cHqFKK2JkK/3VMueMiWtwSxOeM7nDOSdNjWtpmZnuczY/S6RyM8gcR9TO2
	0yrjLQRKkRCUIIvpGDm9P425rzPBozaaLYQanGcjEahbuKkmyqIJlXB4b24IHYuFHfJRPRpfexH
	glKZxYA=
X-Received: by 2002:a05:690e:11ce:b0:649:64d4:8127 with SMTP id
 956f58d0204a3-649db33311emr2635192d50.4.1770215479555; Wed, 04 Feb 2026
 06:31:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260204034003.2961402-1-ziniu.wang_1@nxp.com> <20260204034003.2961402-3-ziniu.wang_1@nxp.com>
In-Reply-To: <20260204034003.2961402-3-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Feb 2026 15:30:41 +0100
X-Gm-Features: AZwV_QgI7Imdfxcsknmh62CBzZI03NFl9MPDU-nwW2BMZCSmMmoB66KvDFFoZiw
Message-ID: <CAPDyKFr1UhsDakJaP-W39=n-DhM4F0KTWTaEwXZRmLpnKa+y=A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mmc: add quirk to optimize certain Kingston eMMC
 secure erase/trim performance
To: ziniu.wang_1@nxp.com
Cc: axboe@kernel.dk, hch@infradead.org, linux-block@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Feb 2026 at 04:38, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> Kingston eMMC IY2964 and IB2932 takes a fixed ~2 seconds for each secure
> erase/trim operation regardless of size - that is, a single secure
> erase/trim operation of 1MB takes the same time as 1GB. With default
> calculated 3.5MB max discard size, secure erase 1GB requires ~300 separate
> operations taking ~10 minutes total.
>
> Add MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME quirk to set maximum secure
> erase size for those devices. This allows 1GB secure erase to complete
> in a single operation, reducing time from 10 minutes to just 2 seconds.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Even if the optimized performance requires patch1, I decided to apply
$subject patch as is for next as it doesn't make anything worse as a
standalone patch. I also added a stable-tag to it.

Patch1, is better merged via Jens' block tee.

Kind regards
Uffe

> ---
>  drivers/mmc/core/card.h   | 5 +++++
>  drivers/mmc/core/queue.c  | 9 +++++++--
>  drivers/mmc/core/quirks.h | 9 +++++++++
>  include/linux/mmc/card.h  | 1 +
>  4 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/core/card.h b/drivers/mmc/core/card.h
> index a9619dd45270..a7c364d0030a 100644
> --- a/drivers/mmc/core/card.h
> +++ b/drivers/mmc/core/card.h
> @@ -311,4 +311,9 @@ static inline int mmc_card_broken_mdt(const struct mmc_card *c)
>         return c->quirks & MMC_QUIRK_BROKEN_MDT;
>  }
>
> +static inline int mmc_card_fixed_secure_erase_trim_time(const struct mmc_card *c)
> +{
> +       return c->quirks & MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME;
> +}
> +
>  #endif
> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> index 284856c8f655..eb1053d8cae7 100644
> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -184,8 +184,13 @@ static void mmc_queue_setup_discard(struct mmc_card *card,
>                 return;
>
>         lim->max_hw_discard_sectors = max_discard;
> -       if (mmc_card_can_secure_erase_trim(card))
> -               lim->max_secure_erase_sectors = max_discard;
> +       if (mmc_card_can_secure_erase_trim(card)) {
> +               if (mmc_card_fixed_secure_erase_trim_time(card))
> +                       lim->max_secure_erase_sectors = UINT_MAX >> card->erase_shift;
> +               else
> +                       lim->max_secure_erase_sectors = max_discard;
> +       }
> +
>         if (mmc_card_can_trim(card) && card->erased_byte == 0)
>                 lim->max_write_zeroes_sectors = max_discard;
>
> diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
> index f5e8a0f6d11b..6f727b4a60a5 100644
> --- a/drivers/mmc/core/quirks.h
> +++ b/drivers/mmc/core/quirks.h
> @@ -153,6 +153,15 @@ static const struct mmc_fixup __maybe_unused mmc_blk_fixups[] = {
>         MMC_FIXUP("M62704", CID_MANFID_KINGSTON, 0x0100, add_quirk_mmc,
>                   MMC_QUIRK_TRIM_BROKEN),
>
> +       /*
> +        * On Some Kingston eMMCs, secure erase/trim time is independent
> +        * of erase size, fixed at approximately 2 seconds.
> +        */
> +       MMC_FIXUP("IY2964", CID_MANFID_KINGSTON, 0x0100, add_quirk_mmc,
> +                 MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME),
> +       MMC_FIXUP("IB2932", CID_MANFID_KINGSTON, 0x0100, add_quirk_mmc,
> +                 MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME),
> +
>         END_FIXUP
>  };
>
> diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
> index 4722dd7e46ce..9dc4750296af 100644
> --- a/include/linux/mmc/card.h
> +++ b/include/linux/mmc/card.h
> @@ -330,6 +330,7 @@ struct mmc_card {
>  #define MMC_QUIRK_BROKEN_SD_POWEROFF_NOTIFY    (1<<17) /* Disable broken SD poweroff notify support */
>  #define MMC_QUIRK_NO_UHS_DDR50_TUNING  (1<<18) /* Disable DDR50 tuning */
>  #define MMC_QUIRK_BROKEN_MDT    (1<<19) /* Wrong manufacturing year */
> +#define MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME (1<<20) /* Secure erase/trim time is fixed regardless of size */
>
>         bool                    written_flag;   /* Indicates eMMC has been written since power on */
>         bool                    reenable_cmdq;  /* Re-enable Command Queue */
> --
> 2.34.1
>
