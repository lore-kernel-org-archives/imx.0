Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99581FBBEB
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736782685; cv=none; b=BTnlnXHLpIajpHgtZMcKTBA9lvyBQt42f/qSg0+FLntOGLV+pgSr+v9k3tQhMuMHNOEF3WO0N1nmINqELb7F0O+8FBTLrBjL9sZ58eCLpk2280E9TplNJP4EyQ8spnuiMqchfyx9wA4Dm8eSe0Wl7pqgpSo4ML2OkEI2IzblskQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736782685; c=relaxed/simple;
	bh=n2GWWrpePzNulQeQ8lZLK2FaByIUzza7i9a/Wuwpvpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MrQPnAC76AXOL0Gh+XxJ1l/FSY9kdwF7mxT4MuyGLDrTWmH0dp3nKvAKSCq6QrpRpzmz1ByJgeLd3jZboj6bT/vvEH+4U/upvQoKPQJwzdq7OB0EFEYtG4I22n5pnr96SBZ1V3U+JLHCWjbRDaMwW+nn3AoANL/3zo9FohCs2x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L2lEq1Nk; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L2lEq1Nk"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e5447fae695so7601262276.2
        for <imx@lists.linux.dev>; Mon, 13 Jan 2025 07:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736782683; x=1737387483; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VH4Ljw0lA5sqSWylbksASfV+tDTzuOkHLk1j+OVHBqk=;
        b=L2lEq1NkbajIb0s2uk+DUpsY8mfr5DHDMRKYv/vbQJPE4mttJR8K+Qm2h3qSwqcJ4v
         0rMpNjluPwdphYuGISV4vPP/6oAaOq3rBhxkpczBwZeqnhvVHntxp/rmfg8vR/1hdbrC
         jIhq+a3qVGyDR0OWQcOaMQBa5fiobwx+auaATDpy3UUiEqlIzVg1C6mHczg4Eo+StWVC
         9mec8OKpneAnMkyD37ivPorsEmmNOoMs4VfuD1VefXOCdrN6JNiv/vsAY0jLI1UD1HxW
         IQ4N1EmsmATvmC5n3EjNzjzxA8WSaecJTrn+IcYy7gLFt9POiottRZYv10qZ3XmXgEWg
         adww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736782683; x=1737387483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VH4Ljw0lA5sqSWylbksASfV+tDTzuOkHLk1j+OVHBqk=;
        b=cT5Nz76pSxbXQYqRfA0msnGUI2gKzq09ck7e2EjTRqooQ6RiFC+R6kQI2ma2IiF5F7
         9i9/ymNiU7D5HRteXfZNjiT2nVD/p6HHFcdmllNEPfqbI9Ylg1GjTMlW6w9xy9jFE266
         DUnG0/ediCaXLbw5BMNEqkVzl2xtmnYksDHaJef0MJuH613P27UWroE+x3GEodugT7li
         ptY26ecwuMXctRVvhQdiELwM5P7M9N3JjqPArS4T/RB6iGYgJuGzoA6NYiViyCrb+SRP
         u2Gh4pQ3x4zBTuXZTzjlbLwTuk9Rs9Qn+WJoFvB4WURBcC0LFWzW8U4tMepx4I+nLhrK
         51gA==
X-Forwarded-Encrypted: i=1; AJvYcCVf6v4cHXVffaHIWflw/ZcdFXjr7fJnfvnJYpSjmN0w28r9GCZveoQOEpeWLbL3Sj5jD/U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNnQmS4KfAqspIJCIUg61+FPQLA92tlViEnvONJgmCJNXWkVKH
	BEiHaEd4TJu7qkQF8MUk/EhFAR19BfbS7xnopHQf95pTdkrW0eRFM2caP9Ew527JVRAIU5Dls2C
	5LpQnKMcCHJENAlTfNU4GIGm2CGzQNLFwtnw7MA==
X-Gm-Gg: ASbGncvTlOZN89ZiX18NyB+WIEaO5DsXHqzIjSDeHdedQ2AwTEu1LvFP2RC69Odwn1k
	6Y446AHgjebRpBsrc4KVtmqjcTKlSYXxSszklXlo=
X-Google-Smtp-Source: AGHT+IFAIkS2Z8ev5ESTCzuaARgkLxMkSS7mawcnRpdDng9xAPRFBPJa8hXfaPAKe2aLptbdzrTd2lhyEVWCfYs6MeQ=
X-Received: by 2002:a05:690c:968b:b0:6ea:8d6f:b1bf with SMTP id
 00721157ae682-6f530eea554mr168333797b3.0.1736782682941; Mon, 13 Jan 2025
 07:38:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250109155255.3438450-1-robh@kernel.org>
In-Reply-To: <20250109155255.3438450-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 13 Jan 2025 16:37:27 +0100
X-Gm-Features: AbW1kvYfxaP_KIAtRJ8ddiypXayufpQw7AFPlstt8F8TqoOMhlOX5qWAO8Gx8_g
Message-ID: <CAPDyKFrPB-Sw2Un1tx_POXc_wRD-A9B_6Syhgu7NNeK9qEomsA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: Use of_property_present() for non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dragan Simic <dsimic@manjaro.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jan 2025 at 16:53, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
>
> Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v2:
>  - Drop initialization of dat3_card_detect
>  - Rebase on next-20250109
> ---
>  drivers/mmc/host/mxcmmc.c          | 8 ++++----
>  drivers/mmc/host/sdhci-esdhc-imx.c | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
> index e7a286c3216f..0a9affd12532 100644
> --- a/drivers/mmc/host/mxcmmc.c
> +++ b/drivers/mmc/host/mxcmmc.c
> @@ -995,7 +995,7 @@ static int mxcmci_probe(struct platform_device *pdev)
>         struct mxcmci_host *host;
>         struct resource *res;
>         int ret = 0, irq;
> -       bool dat3_card_detect = false;
> +       bool dat3_card_detect;
>         dma_cap_mask_t mask;
>         struct imxmmc_platform_data *pdata = pdev->dev.platform_data;
>
> @@ -1048,9 +1048,9 @@ static int mxcmci_probe(struct platform_device *pdev)
>
>         if (pdata)
>                 dat3_card_detect = pdata->dat3_card_detect;
> -       else if (mmc_card_is_removable(mmc)
> -                       && !of_property_read_bool(pdev->dev.of_node, "cd-gpios"))
> -               dat3_card_detect = true;
> +       else
> +               dat3_card_detect = mmc_card_is_removable(mmc) &&
> +                                  !of_property_present(pdev->dev.of_node, "cd-gpios");
>
>         ret = mmc_regulator_get_supply(mmc);
>         if (ret)
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index e23177ea9d91..ff78a7c6a04c 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1648,7 +1648,7 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
>          * Retrieving and requesting the actual WP GPIO will happen
>          * in the call to mmc_of_parse().
>          */
> -       if (of_property_read_bool(np, "wp-gpios"))
> +       if (of_property_present(np, "wp-gpios"))
>                 boarddata->wp_type = ESDHC_WP_GPIO;
>
>         of_property_read_u32(np, "fsl,tuning-step", &boarddata->tuning_step);
> --
> 2.45.2
>
