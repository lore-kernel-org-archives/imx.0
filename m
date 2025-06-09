Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCEE25D1ED
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 14:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479135; cv=none; b=bVpfYsyZ8i2KmUwTMQFFweosJoo36Fv+t0jE2BdsGa2LHtG0Qevw7QjALorzRv1dUdbBeFnO/m2W7iHd+4cQDEcqEHFYsUzuzBjHfQzkGl2rtNiyM9kAPSq6i7c5JQbF/95QTZ499jCv845iTmmDoW62XmvMfj4/zLydxIt094I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479135; c=relaxed/simple;
	bh=7Q9lxvzufrlgaieFsmmIoaVB9+vEIKHKjtHXHbbeTcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXZu/kKjlNdryijERP0Djiq5BMerj5sH43XPR3KsBUA0CyeBt+xkvIaHCUFXWEsKEaIrCKJw0+YVch8zLyuqsqMpZYUdmfe//40QiSyRAXL5mAxgWKPR4Uu2GyIOXiELVwlas7b6DwSJIljkSLvXKZwQoK05WgnLP30/Hd0VrKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EsnuLBFt; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EsnuLBFt"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7db5c13088so3402450276.1
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479133; x=1750083933; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qs9yDBCL9OQQ2dpuHj/+WEzZXErX2MF2uYZnoNM7uA4=;
        b=EsnuLBFtXDPXvCyP05naBwaummShoFDutQgSXWevvhrezr+MtncCj9S1iwGTOB3AtW
         L4GlVQtMd8qtp2Or5d+wPaWf8BWzye4AUMSsjDgB6n9lXEsRZM/ZFJrKiuC/0s600RDE
         ccQpGhHvwWq22x5BRWjUa52Qxtsx1LNl8/Zp+7GFR1VtZyIqYkzUw+CgQ+ZhUhto93NY
         yU+kBQz+I0xW3GIKZOx8yZ7JsTa5ejiWx+s+jSibZgNxqyXiBJVtbZEYrZymdjPkqZxy
         PmaNNezZZNyMPJs6TZgmJ0xf0gHH3sUFbHjMpgDE/LhyFxGu38JS6lT3vlV2J5sD6bbN
         +A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479133; x=1750083933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qs9yDBCL9OQQ2dpuHj/+WEzZXErX2MF2uYZnoNM7uA4=;
        b=Ugt0snuOGR9YxdAtJvRBvQrPbHEbYxs3CGS5/OCfB4XkFCGr8QqmOrPTINUGoapEkJ
         QWA+2rgyQYS9Aji/O6cmJacBVzvr0j6AyKyf1+MFAXCtF/CrmuWGrcPa7sT3b58DRDbI
         vXXUZCtiO5dqRTmwKI/PE8aj6YbbEo8YtLD6g7GS+ZKbaOxHoS0Pomi087wkA+DQ/So0
         WWFaxppLoaBDZCZz2t4Xyuan6l/V3dlvEGRe0iMkySwJIyv5cJQKO4kEAOyxWR1gOBfg
         14OY08F3cWsSKiqKpAW1OMtwJznYNDgrR91/DyX2AiJhaVXoNLiP+SoTuJNqRoDyzbO2
         kCKw==
X-Forwarded-Encrypted: i=1; AJvYcCWELSL5v4p2vnyQATOqDAJ1KPFj0Ac6gk3lE55Jp+HZm7yCDr3Vglj9+2XHPijc9NXfsIs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYpaZDow/ADleBVTSeiIBVLdahfOgVOs67yoZywBSDXYWaCiZO
	JKGEGA50nVK1/HVEX+H9xzXOl7uumi0Kni5x/WgvyePqSB1oNfyzCk57DX63yw3hywUCGAP0ypj
	j37Ue9OrqiXF77nPiGNLu1VYjcCn4BxF8xVB6wZ2ykQ==
X-Gm-Gg: ASbGncuaS5BsnkuGbx0xvc/orLn5n/GNgNJp2Gd+Ufm0Ht2fDMCrkZxe7ER0IjPBUG9
	XdU6E8nvyjr0H4XCIy9EDgo5YEVqA5hMlugcVyUhVqhGsZgT4ThcsmTI/ESlDt9Wy7xBhi3EGFh
	69tJWi5BoM/ZsF0dvWyySyIy4J4UAwEVteFw==
X-Google-Smtp-Source: AGHT+IG9S1xNruNzhNFugEoEcohrFQLqoxTMTaqwCUIforBGu07/WXI6ZQ6WYR+jbUueu4Zz7wktb1J3/XAbxy5DAZ0=
X-Received: by 2002:a05:6902:1005:b0:e7d:a290:9532 with SMTP id
 3f1490d57ef6-e81efde986amr99713276.6.1749479132960; Mon, 09 Jun 2025 07:25:32
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250521025502.112030-1-ziniu.wang_1@nxp.com> <20250521025502.112030-2-ziniu.wang_1@nxp.com>
In-Reply-To: <20250521025502.112030-2-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:24:57 +0200
X-Gm-Features: AX0GCFto9k3Gr4YCVyXjpM_DIPE3WFVihsUYF7aq38OAJZNQC3fiKNoXcigrZNg
Message-ID: <CAPDyKFoHqhgWqy4EeQ2vr0eQgCnUkSf6SLyKEVLzar30Sy7OHQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: sdhci-esdhc-imx: optimize clock loopback
 selection with dummy pad support
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
> For legacy platforms without dummy pad:
> When clock <= 100MHz: Set ESDHC_MIX_CTRL_FBCLK_SEL to 0 (external clock
> pad loopback) for better bus clock proximity.
> When clock > 100MHz: Set ESDHC_MIX_CTRL_FBCLK_SEL to 1 (internal clock
> loopback) to avoid signal reflection noise at high frequency.
>
> For i.MX94/95 with dummy pad support:
> Keep ESDHC_MIX_CTRL_FBCLK_SEL at 0 for all speed mode. Hardware
> automatically substitutes clock pad loopback with dummy pad loopback
> when available, eliminating signal reflections while preserving better
> bus clock proximity.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index c448a53530a5..5f1c45b2bd5d 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -212,6 +212,9 @@
>  /* The IP does not have GPIO CD wake capabilities */
>  #define ESDHC_FLAG_SKIP_CD_WAKE                BIT(18)
>
> +/* the controller has dummy pad for clock loopback */
> +#define ESDHC_FLAG_DUMMY_PAD           BIT(19)
> +
>  #define ESDHC_AUTO_TUNING_WINDOW       3
>
>  enum wp_types {
> @@ -348,6 +351,15 @@ static struct esdhc_soc_data usdhc_imx8mm_data = {
>         .quirks = SDHCI_QUIRK_NO_LED,
>  };
>
> +static struct esdhc_soc_data usdhc_imx95_data = {
> +       .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
> +                       | ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
> +                       | ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
> +                       | ESDHC_FLAG_STATE_LOST_IN_LPMODE
> +                       | ESDHC_FLAG_DUMMY_PAD,
> +       .quirks = SDHCI_QUIRK_NO_LED,
> +};
> +
>  struct pltfm_imx_data {
>         u32 scratchpad;
>         struct pinctrl *pinctrl;
> @@ -392,6 +404,8 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>         { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>         { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>         { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
> +       { .compatible = "fsl,imx94-usdhc", .data = &usdhc_imx95_data, },
> +       { .compatible = "fsl,imx95-usdhc", .data = &usdhc_imx95_data, },
>         { .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
>         { .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
>         { /* sentinel */ }
> @@ -1424,9 +1438,10 @@ static void esdhc_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
>                 break;
>         }
>
> -       if (timing == MMC_TIMING_UHS_SDR104 ||
> -           timing == MMC_TIMING_MMC_HS200 ||
> -           timing == MMC_TIMING_MMC_HS400)
> +       if (!(imx_data->socdata->flags & ESDHC_FLAG_DUMMY_PAD) &&
> +           (timing == MMC_TIMING_UHS_SDR104 ||
> +            timing == MMC_TIMING_MMC_HS200 ||
> +            timing == MMC_TIMING_MMC_HS400))
>                 m |= ESDHC_MIX_CTRL_FBCLK_SEL;
>         else
>                 m &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
> @@ -1678,7 +1693,9 @@ static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
>                 writel(reg, host->ioaddr + ESDHC_TUNING_CTRL);
>
>                 reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
> -               reg |= ESDHC_MIX_CTRL_SMPCLK_SEL | ESDHC_MIX_CTRL_FBCLK_SEL;
> +               reg |= ESDHC_MIX_CTRL_SMPCLK_SEL;
> +               if (!(imx_data->socdata->flags & ESDHC_FLAG_DUMMY_PAD))
> +                       reg |= ESDHC_MIX_CTRL_FBCLK_SEL;
>                 writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
>
>                 writel(FIELD_PREP(ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK,
> --
> 2.34.1
>
