Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52B61A4B69
	for <imx@lists.linux.dev>; Wed,  2 Oct 2024 23:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727912211; cv=none; b=bDMlTV1mJ/9wnfc9w5FFlReYVgmab2SNTErFL+LnKr/wbZRerZhLdSOzM3Iqp+pEU0N1I+jAmFd5xLgbBQzNFEwlZ4kT39X00vniYSFLcYzjeMoSsrtbwqDQCw8qXot98zDRvoI5f2aGvljbyWHdJQZYm7yw/M8H4VF0ULyKQB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727912211; c=relaxed/simple;
	bh=Cy8jm79kKyoeyBVmUKmg0vqDck5145Jib7RrRvUb+lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTQtbzF/uQ2tq0da1Bu4XwqnIb4vrBhRbLhwgBkASoB4ypkGHj0j1LI7Lg4JPDYi2K8QP5+htKwYPS/YDe/8RYjdw27jpHH4Uva9OnMaZUBvPVTuZMVVJVVvUrVmUhAG/rSDXKHYf72uF1carDBwonlCTsJcAYlL/enyhWE2pTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lrrNLfQt; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lrrNLfQt"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e25d405f238so338632276.3
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 16:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727912209; x=1728517009; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cMmIsSIqxw2lLS9EL8ZWnjAaMUTml/AJZkW1/YN3TRU=;
        b=lrrNLfQtgV87fVPDMb3pRa1uUUtYKBHVMfplQC1lOblXzJgOFxxosxfU1YzAzc0CEP
         //942oWWXA3pdIzJDc+6zVeukK+oQcAHky2WypJlGOXXfprTtJ+EfGUZUxQJJVwQ/S5i
         sHT+JUNWhnwvFRqmT3dcD/ERERmJhFh0hRwEtWkKVZNz8++EY0MBa9tzfqVd+2ZdNVRM
         i/PzZYBLH9GsY50jEkxptxxnf/6HnwEqapOFTGlhaOe7W4t+FZQYZAh7chDypRCN/d7a
         8M6Wjr2MR5ezlDFacSV7GrdrLMKdPVz2xB+RX8Wi9wIG6QWxof0MQzERbsvSLH/Sptg1
         yNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727912209; x=1728517009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMmIsSIqxw2lLS9EL8ZWnjAaMUTml/AJZkW1/YN3TRU=;
        b=WTiYCxY+Nj+Vc0Ev/mhZ2yk8NS/3rRvFsv34fWNosJ6+undEDDuT6RyUfi3P+zDArY
         aJ3DNIXsU0vYUvatXm8lobnFyIvddLumUOmwqS+ZjpW238HfFCDPGgF3J3+KFCmlcvc2
         UHRaW6SOv8LMkseB+8uqcw9TM8xsGvFJycslrdX12OXX2U2cICMdSS8D3ui4cRAMZkz2
         ZsT+pvdx0ZTA0W6N/1JX8isvb5cF772/LBvZprZELUw1CYu5YuMkQSyi2eYUE9XA8Kzo
         Xx9f2NI61wES7XfcXGLlPRXZgNLuhat/8RECFna8EozkoDnsdA4hhK3t+lKfJF+ocpVX
         lObQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKal/Hp/gsts0tzpB3lPf7dedGhWRSmXqvgVcafk3qUbb9MaSbL3Pr5PQZwi7K5Sj4aXc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQS4i35FEjt1yMF0PIggfY7Iz1ezHEV1dXgRHTvjjTTuuNY1Vc
	3nPLMAgk8bp/wPAmun8Vv2iEgYYS8DJpBnCiavnKtMJyxmu6Ch0o2GBybM49j789lqKAUz/Tv8d
	iF1a5TXS1iMNYul1fSlGkQRN2UHUYJ+b5+9mgxZ30kYpX1mzD
X-Google-Smtp-Source: AGHT+IEtfDZUzgk/RKfYheURMvQhUbLGY40ln0Wzu7T/i625eC/l0Cs8uWSg5Wr0L3A5nhmvt0c8ctP6sFH0lfC4icc=
X-Received: by 2002:a05:6902:2389:b0:e25:cfc9:489d with SMTP id
 3f1490d57ef6-e263840ca01mr3890390276.34.1727912208827; Wed, 02 Oct 2024
 16:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240923062016.1165868-1-peng.fan@oss.nxp.com>
In-Reply-To: <20240923062016.1165868-1-peng.fan@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Oct 2024 01:36:13 +0200
Message-ID: <CAPDyKFraZUQu0hawOK1owNNNjA3WD0Nhq9_zwvcYzGy0rN+nsA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: enable quirks SDHCI_QUIRK_NO_LED
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: haibo.chen@nxp.com, adrian.hunter@intel.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Sept 2024 at 08:11, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Enable SDHCI_QUIRK_NO_LED for i.MX7ULP, i.MX8MM, i.MX8QXP and
> i.MXRT1050. Even there is LCTL register bit, there is no IOMUX PAD
> for it. So there is no sense to enable LED for SDHCI for these SoCs.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 8f0bc6dca2b0..ef3a44f2dff1 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -238,6 +238,7 @@ struct esdhc_platform_data {
>
>  struct esdhc_soc_data {
>         u32 flags;
> +       u32 quirks;
>  };
>
>  static const struct esdhc_soc_data esdhc_imx25_data = {
> @@ -309,10 +310,12 @@ static struct esdhc_soc_data usdhc_imx7ulp_data = {
>                         | ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
>                         | ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
>                         | ESDHC_FLAG_STATE_LOST_IN_LPMODE,
> +       .quirks = SDHCI_QUIRK_NO_LED,
>  };
>  static struct esdhc_soc_data usdhc_imxrt1050_data = {
>         .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
>                         | ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200,
> +       .quirks = SDHCI_QUIRK_NO_LED,
>  };
>
>  static struct esdhc_soc_data usdhc_imx8qxp_data = {
> @@ -321,6 +324,7 @@ static struct esdhc_soc_data usdhc_imx8qxp_data = {
>                         | ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
>                         | ESDHC_FLAG_STATE_LOST_IN_LPMODE
>                         | ESDHC_FLAG_CLK_RATE_LOST_IN_PM_RUNTIME,
> +       .quirks = SDHCI_QUIRK_NO_LED,
>  };
>
>  static struct esdhc_soc_data usdhc_imx8mm_data = {
> @@ -328,6 +332,7 @@ static struct esdhc_soc_data usdhc_imx8mm_data = {
>                         | ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
>                         | ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
>                         | ESDHC_FLAG_STATE_LOST_IN_LPMODE,
> +       .quirks = SDHCI_QUIRK_NO_LED,
>  };
>
>  struct pltfm_imx_data {
> @@ -1687,6 +1692,7 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
>
>         imx_data->socdata = device_get_match_data(&pdev->dev);
>
> +       host->quirks |= imx_data->socdata->quirks;
>         if (imx_data->socdata->flags & ESDHC_FLAG_PMQOS)
>                 cpu_latency_qos_add_request(&imx_data->pm_qos_req, 0);
>
> --
> 2.37.1
>
