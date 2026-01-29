Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EB92DEA6B
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769699309; cv=pass; b=O9NH37z7Bzb2JlSh8SNY/Ha0SFZaGZ+xzb14hejwTRC+YPKbZFOoNYpsy3B3himcNelRW2aGLXQieNAdfLhC0LFXERn6CT+HlSR1mx/wdsrY7DO392Onmj/A3HTPNQYsFXvCZGZdBDmR/YwdHe0SnyIVRqNwg0pax/B9hsTSjEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769699309; c=relaxed/simple;
	bh=icJfGEMZ/bEneEGHfyxw3xR/IsDT8xHGAmMQsYbh2mQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvRI45L/mQEboQ/MDeYjJjXDh4bGCzcWBpl1t1wzuKDj3xHAUvzhzuPXTeOjzMu7rCgFW86ARglG//KS0jtw30xVhrsu5197cu+5r2kf+ZgYCsfaEGfUm9dTD8imkIu44lpJN8LKpts5958Z1JTMUEN49L06pgpkDA/ZKCYQj/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=viZ5cJXL; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="viZ5cJXL"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b6f04cae6so1043253e87.2
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 07:08:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769699306; cv=none;
        d=google.com; s=arc-20240605;
        b=Ere4pzzoKG6Pou7HC++va4CHr4yGe8WG6QoOsODsd66a94jTMELxyXDrhhc4dptalB
         bZZuqp+0Dm588tuoXQ+2nLAvYYSRVijjZ+M80aOU48VKCChp+g+d1pSHYM16Ay/TmPRT
         OYHi2gF87kOs4ziDBRL8rwrQaCvld4tCq0GlHlFK7nS88GF924QI63SZNYoqJ4mJ6yIU
         XFoQ2tWMVe8gJie1hPpWI9Elf8C9wnq2Q6xUevXpoPhxYkMbu7gzFzbyARwI4cONnYJU
         aYLwRjHr/YW/LM+vyqsUGPu6nhFOJxyULfb6K/6vEZPo0eKLn8DsvtkY9gH20/yXSdQF
         Tl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mxIu4Zy59sS+vnAzfLOcX1hJejpcL3RkLwTgRMZy0rQ=;
        fh=jKmZePkxclZH2J4cXpQwz7fav2j9AHL7r05e0AdHaWw=;
        b=IMY8FSAGXZ9+VIHYUmvijhOoYq9TSptV5gfL79fLFMtctKZD0GJQZ16+HFEp0sOIbp
         ZM9hIpCMs1YfnIZ9i8QU04LaH8lAW2PzD1KhJJ4rKoRy8mIVvxTEfKBPY4gNnaUiN2M3
         rvkMJVXKJlQ7E4DGP9pWhY3iZHgKGznQzLJmVVHyUkLJsQgStd4cVo1kb6gG5JbniXCr
         3qXqEPsCdsES+8PTOlLuNzdNteKmhuYR8TIZYB3d0X9x4O4sF1qSdoGkpOgFJPTnmpV8
         LeiUg4zuKDLXpL1KDGsOO63fUWp1ULZmcytdnT8N98jeUWbOH5inq3KnpSNx9ElHeAP3
         MSwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769699306; x=1770304106; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mxIu4Zy59sS+vnAzfLOcX1hJejpcL3RkLwTgRMZy0rQ=;
        b=viZ5cJXL0gns7+xve8uO1HOJ9ZYQ7NqGtaeQxvUQ+JIFjOCSnNqooq8IjPZi6FoyFB
         Ow1s/QQH072yoF4Tuz8TKY3fqNi9ouSmw1itSW24mzVfSWSZQrTFl6ZfzsyKbvuYnSoP
         yvEY+mqyTgZp79WT8/UfH32KUTJq2oHKaj0s0z201B8n/HySmj1Z3ODkf8pITB6wyzPI
         9JbpQq1txxIkiKHXvALQ0kVpQSVkVCymOeiqixMc77L9Pm6eM8vT42c1tN0o/V6huCEJ
         qI8tJuLjQGjlA8xHZ08zHqnpHkDdyTBLz5auAp+xXWMOt5P2vXIVhwB5rsaSuwRYX783
         W2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769699306; x=1770304106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxIu4Zy59sS+vnAzfLOcX1hJejpcL3RkLwTgRMZy0rQ=;
        b=qS5oWgYL1qV4xlc8YaUgPMC5qnHoBTPLyL+OsOhDNxrKRVsnuhMmW4aqFO6G5APl4i
         C2GWIZKJmgVHBSFfXgLkE2DcjnSaqh2m0YWhgAHjQWHkdYti4YcUx3LFCeytOsI8q/MX
         FfIvmxxA5TW1kKgHrqEcE5UmyoXIjHgT1Ydkwh2BNtd6QBy8yaO+qJPwnDeyzMWREfYJ
         nHyYJQR+k3AetsCkBl7JOfPwYBn9kiuAHSVeU1ppfSHW8/0TwsWEzSlw+SZKd94uel8d
         v6tP2BzGk0Jvf7QO1+cXQD8/s92Pwjz+JSUZjOjtbD6mxa/bRLTn0pIVGMcjnR99EPMJ
         rHag==
X-Forwarded-Encrypted: i=1; AJvYcCUyE3PjEfgzcF597NoyaMzCscFyFMCz+Vk0BvrHngt/yH7GQC7u8Bd3R6GEVYYdUKk4loY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLbPVwaOoNPwZVd0J5FpYju/WHXwjOyZcWhX2W9YKOY84zitQF
	RuY7W5m5ByDA2+v38HPY8+LgGQ4GpMJrZ1EZ9zwD7RM6bJLNFqXW9uulHAs/JbCc6w0I7VcuofL
	wmpKl+TQvYnxcZ2/df7UIjn+q09K+0hNXiDUBQaAt6Q==
X-Gm-Gg: AZuq6aJugoeRp+Pv+NrHGA/rX1ou8+NTRGtyF211DgBBlsU15+7DUs5kRem9SPzXtaW
	owMW1KurJq8AmotCIpK7PSA3i7YKysBnH9hLyeNpxXemKseaK6XtGOssd1SAy6zBaGFpPlprVn8
	sf6roWZ+ivL2QcC52ADvvXLG8lDrC2UvIjATtAv3IN1vs4E1ky0CVxhVFng1A8rURYq0xq9VCGp
	9r4mvOfYlirn1TPpVuNY/6u/APYpXi2PhH+3ZpO6y3ldmmrRCoqFj21wSh/F+7nYr+nJiWL
X-Received: by 2002:ac2:4e08:0:b0:59d:cb35:44ab with SMTP id
 2adb3069b0e04-59e04017b54mr3697288e87.14.1769699305914; Thu, 29 Jan 2026
 07:08:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215102010.608421-1-ziniu.wang_1@nxp.com> <20251215102010.608421-3-ziniu.wang_1@nxp.com>
In-Reply-To: <20251215102010.608421-3-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 29 Jan 2026 16:07:49 +0100
X-Gm-Features: AZwV_QicTnxYZa9_aQJZVlGxEGtVj569eS16RX-pa4PTkAgIzD_uM0U5gBRdqC8
Message-ID: <CAPDyKFp0mDkLXOCh8gDzHt4KkCreYOFk7-Hzsfb9ySy14nezXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: add quirk to optimize certain Kingston eMMC
 secure erase/trim performance
To: ziniu.wang_1@nxp.com
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025 at 11:18, <ziniu.wang_1@nxp.com> wrote:
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

FYI, this looks good to me, but I am awaiting a new version of the
series due to Christoph's comment on patch1.

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
> index 1200951bab08..0a198a2c2616 100644
> --- a/drivers/mmc/core/card.h
> +++ b/drivers/mmc/core/card.h
> @@ -305,4 +305,9 @@ static inline int mmc_card_no_uhs_ddr50_tuning(const struct mmc_card *c)
>         return c->quirks & MMC_QUIRK_NO_UHS_DDR50_TUNING;
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
> index c417ed34c057..1f7406c0ab03 100644
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
> index e9e964c20e53..1882267ef201 100644
> --- a/include/linux/mmc/card.h
> +++ b/include/linux/mmc/card.h
> @@ -329,6 +329,7 @@ struct mmc_card {
>  #define MMC_QUIRK_BROKEN_CACHE_FLUSH   (1<<16) /* Don't flush cache until the write has occurred */
>  #define MMC_QUIRK_BROKEN_SD_POWEROFF_NOTIFY    (1<<17) /* Disable broken SD poweroff notify support */
>  #define MMC_QUIRK_NO_UHS_DDR50_TUNING  (1<<18) /* Disable DDR50 tuning */
> +#define MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME (1<<19) /* Secure erase/trim time is fixed regardless of size */
>
>         bool                    written_flag;   /* Indicates eMMC has been written since power on */
>         bool                    reenable_cmdq;  /* Re-enable Command Queue */
> --
> 2.34.1
>
