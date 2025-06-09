Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5A525CC6F
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 14:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479132; cv=none; b=ArSaMu2nOQc/i8rxRACbaAhNP0DI0Vmv4+OhMKCdNY1Hd2d+UInaCDupaeTqFmT5s2eE0ssAuNYlQbR+LKQDZMFXShCHnFIpqpJ8wJH2U1DUiMKMpcEoT5PmyEsjujgoGv2lWDfpvxU4G/aHkvNc5wU0opmU9erykOueBQLzWNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479132; c=relaxed/simple;
	bh=KBeLUMh2iQI2RMf+hlDrl9qPxrBpsEO7zs58t+tgiRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3VeucLvWr3Z9jvXcWNBOf0zP4wQKVBzauTybEGIoSs74Yx1k4Rrw5smt9D+I7PFCNWSyFRxuN4yv6Sn557B5Zi/uIW0SB+eXK7j7BVPnNuxFU1zD+F+Eb4Yj036jM7+ldwBpMZFhlMnk+D4TUrVQ9RECW9TGwl07AuD4nrT0/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QeCLbIZe; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QeCLbIZe"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e73e9e18556so4139934276.0
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479129; x=1750083929; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZykcNbDimAS4m5zQC6qPpRpEexn6V57y3u83AlFoEMA=;
        b=QeCLbIZeJtxLgG3rNYutCBD4rYaPQLNcTxS2FRFHvr0ZomugFGG+HW47VQKZVEk1Fc
         Fp+7FnIKqWWXzoPWwkid1p3vbiuPkSERd3EsXzoLktX9nj4U3PjrlEhE5+oCuSBHQDvU
         +hmv36h9FhAFzdHYClYA7NkFGXedKpZg47z8kxJsAkGK8aYuHw0G/BiCiUD2y8CuLzl3
         Whg+CzzxxfpI+PyPTvVl8Khcd6blAIlQ5FhoIQlHDvNymlEz7d+LmMlyGcGf5HI68Eep
         DFIu8zTu6AYH99v53a+elSr0/nAiuZbtTTHkEzuFayKXSdHb05aZ1G7diDF9+YrfUHna
         wcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479129; x=1750083929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZykcNbDimAS4m5zQC6qPpRpEexn6V57y3u83AlFoEMA=;
        b=R/mxF1VIjXB93L9vx2v4bTiQR05I1IKZzoeUQK+J7QgPNRxLWvKG18rxDwwuxwPkRM
         p1vI358cKDlMJR0PaJDn3/dqS8Q3YsZjSYFD3sfmIqA9xkMKp8fwTNLuSq4Taf9QKOru
         4ArpKlJ/kKP2fzqySUa/PypfKpeRYuwwHA6btcvgwXIxwSPMMJ6W32rVvbGKpvcJU3fR
         dIHI/1kOiudRhBTgYK2oUleViTo7N9UQ0PZFcKvt/qpFqGb3NilGhQU2nu86N4M17EBV
         oUXWMO0eZWCDs2DUDs/UW+Mrq9wlRu1BL8yE9Ew4CsM/Cy4HF4uju453Js6DD62KBaEi
         1dHw==
X-Forwarded-Encrypted: i=1; AJvYcCUMTI9kEgCoSr4tpZrc8xPfv2G/vkJQxyWN3YzkNevDCHENCEWFaguRYmvfzrllCbkM8PQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdpSX3gIQltyULYx/ugb8tfNBJqvvi9G8/A2kGKPJjrJujQtxb
	G9Ah13BB3YD0vQBR4SPvU12YH1T0t4PWFG67V6ib89Vw5Shmff67lWiC9Te0fq2zAe05z7/8jR6
	5qJlbKxYzrPrI6+6mTpDUjjArbVgMLerZDitmOVLDDw==
X-Gm-Gg: ASbGnct2xIFAyJ7AD8pl54woMGOoVh/YMVqj5a31+2mC5Vq9HnmsUsH//TH85CEXTmA
	fCdrgVBFCmHMapObvGqI5pV3MppOTFbCh0tKba8F9lsZvPBmbVhu3hP4B/YcyEbLM3FJ60pxQBb
	S6AwHZxE7jdxJWQA8tCuRFtuXRH2GXQPGUCXlvA89Shl7/
X-Google-Smtp-Source: AGHT+IFWaAnhSSW8nsxLfCEosbsRw/tkQutL1OqIK5lEepaSoyu2whvGXaIfcmmuI2AXH/opMexpg40eXSqxjteyUS4=
X-Received: by 2002:a05:6902:a86:b0:e81:8305:b8d9 with SMTP id
 3f1490d57ef6-e81efdccd06mr92199276.1.1749479128789; Mon, 09 Jun 2025 07:25:28
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250521025502.112030-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250521025502.112030-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:24:52 +0200
X-Gm-Features: AX0GCFstYtrysknkf_NKK6FH3sANBz-IA2dFPtq7J8l2XlDrZ3cHyVOBugoqvZI
Message-ID: <CAPDyKFrk3B-ZSTgEGqtfuTNa8yqcq55ueUGfoGdTLk6139Rrgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: sdhci-esdhc-imx: refactor clock loopback
 selection logic
To: ziniu.wang_1@nxp.com
Cc: haibo.chen@nxp.com, adrian.hunter@intel.com, linux-mmc@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 May 2025 at 04:53, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> i.MX reference manual specifies that internal clock loopback should be
> used for SDR104/HS200/HS400 modes. Move ESDHC_MIX_CTRL_FBCLK_SEL
> configuration into the timing selection function to:
>
> 1. Explicitly set internal loopback path for SDR104/HS200/HS400 modes
> 2. Avoid redundant bit manipulation across multiple functions
>
> Preserve ESDHC_MIX_CTRL_FBCLK_SEL during system resume for SDIO devices
> with MMC_PM_KEEP_POWER and MMC_PM_WAKE_SDIO_IRQ flag, as the controller
> might lose register state during suspend while skipping card
> re-initialization.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 7611682f10c3..c448a53530a5 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -728,23 +728,17 @@ static void esdhc_writew_le(struct sdhci_host *host, u16 val, int reg)
>                 writel(new_val, host->ioaddr + ESDHC_VENDOR_SPEC);
>                 if (imx_data->socdata->flags & ESDHC_FLAG_STD_TUNING) {
>                         u32 v = readl(host->ioaddr + SDHCI_AUTO_CMD_STATUS);
> -                       u32 m = readl(host->ioaddr + ESDHC_MIX_CTRL);
> -                       if (val & SDHCI_CTRL_TUNED_CLK) {
> +                       if (val & SDHCI_CTRL_TUNED_CLK)
>                                 v |= ESDHC_MIX_CTRL_SMPCLK_SEL;
> -                       } else {
> +                       else
>                                 v &= ~ESDHC_MIX_CTRL_SMPCLK_SEL;
> -                               m &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
> -                       }
>
> -                       if (val & SDHCI_CTRL_EXEC_TUNING) {
> +                       if (val & SDHCI_CTRL_EXEC_TUNING)
>                                 v |= ESDHC_MIX_CTRL_EXE_TUNE;
> -                               m |= ESDHC_MIX_CTRL_FBCLK_SEL;
> -                       } else {
> +                       else
>                                 v &= ~ESDHC_MIX_CTRL_EXE_TUNE;
> -                       }
>
>                         writel(v, host->ioaddr + SDHCI_AUTO_CMD_STATUS);
> -                       writel(m, host->ioaddr + ESDHC_MIX_CTRL);
>                 }
>                 return;
>         case SDHCI_TRANSFER_MODE:
> @@ -1082,7 +1076,6 @@ static void esdhc_reset_tuning(struct sdhci_host *host)
>                 ctrl &= ~ESDHC_MIX_CTRL_AUTO_TUNE_EN;
>                 if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING) {
>                         ctrl &= ~ESDHC_MIX_CTRL_SMPCLK_SEL;
> -                       ctrl &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
>                         writel(ctrl, host->ioaddr + ESDHC_MIX_CTRL);
>                         writel(0, host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
>                 } else if (imx_data->socdata->flags & ESDHC_FLAG_STD_TUNING) {
> @@ -1177,8 +1170,7 @@ static void esdhc_prepare_tuning(struct sdhci_host *host, u32 val)
>                 "warning! RESET_ALL never complete before sending tuning command\n");
>
>         reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
> -       reg |= ESDHC_MIX_CTRL_EXE_TUNE | ESDHC_MIX_CTRL_SMPCLK_SEL |
> -                       ESDHC_MIX_CTRL_FBCLK_SEL;
> +       reg |= ESDHC_MIX_CTRL_EXE_TUNE | ESDHC_MIX_CTRL_SMPCLK_SEL;
>         writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
>         writel(FIELD_PREP(ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK, val),
>                host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
> @@ -1432,6 +1424,15 @@ static void esdhc_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
>                 break;
>         }
>
> +       if (timing == MMC_TIMING_UHS_SDR104 ||
> +           timing == MMC_TIMING_MMC_HS200 ||
> +           timing == MMC_TIMING_MMC_HS400)
> +               m |= ESDHC_MIX_CTRL_FBCLK_SEL;
> +       else
> +               m &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
> +
> +       writel(m, host->ioaddr + ESDHC_MIX_CTRL);
> +
>         esdhc_change_pinstate(host, timing);
>  }
>
> --
> 2.34.1
>
