Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80032BF3E9
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 10:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745921230; cv=none; b=MK2fbSqKMe7eQir7F6keMVeiVbQVW28hdSsKtNLS4bTAgvQGVOe41WjShnuHawzcClT9jXvu/Bg5bdGs8VOqGWpz6il05ZvIXsWgLn4wkiHCA8hLwSHnL/uwd3fZu9vItSQZuOIwCvY8+lFOMEJ32Zojy44A88XYOOh5T2lBHSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745921230; c=relaxed/simple;
	bh=g1tVxbnLGk3i5P6Pxoj8Qjo6872iN8ITjCbgI2W21Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOxdJoJCosuSJgTEUKznbMHrCogrMdCUAxpL9ZCVYPV+XBAz7SbBPQOT/htczoogBXSX/sRClBZxvt5LjbE2XMJjjCdYe17ruzh+T759Op0xnfpEcELHzl8Qjpn6/LdDunVTRt3TCov0ouEvTf2y77eWTx58/iV1boU62qY6TtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cR/18fHu; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cR/18fHu"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7082ad1355bso49184677b3.1
        for <imx@lists.linux.dev>; Tue, 29 Apr 2025 03:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745921227; x=1746526027; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=emtwuLYFhq/+dXPJNX/QT8Hgt+pr1K3s+G1bwQ8o3u0=;
        b=cR/18fHubKJaoDyJnjXsipnSFZl5yKqDYJ1xkueTLw0Nt6TgWuYt0rdYMjBCKwBXVJ
         I5oyQXi7G2g+ICBPJQ/lDKH42FUTNCsEXlBRl58s6h+W3qOTgyj+YIV8DesOEZVvGMJ8
         ZCCiTRAaZipAbg1TCIpV8pch6f73IEgk4Du7mOUtt0KoiJ+HWmKYb4cc0xgm9SMv9Ixz
         8K0hlw6E9bwOpMC88nVSwyulbuzaozE5BXK7bHlmF9T7pVTRnnhVOQ5i7c7mok9K9WbB
         obTw37yHxI4qMPH2F4X1j68F/dRSdNmeUB5cNL2XdLyoN8ZnYpyEe4sjXIC+dn7Ag3nW
         ZMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745921227; x=1746526027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emtwuLYFhq/+dXPJNX/QT8Hgt+pr1K3s+G1bwQ8o3u0=;
        b=XCfzOrPtIpi1MtVEMZh9kGMJaf9pLhtO0HISP2xu8ZLsuictWeqAM+agby8SW7Gapi
         aqWaSSJduHCPa6yl+mJODDaF65YvAx5GpPChYaAwG3YhtbTblVf6STk+fN1maU33qbIC
         i1lLXr0Dk8qHfqYiZIxDjIM9YhqUuU1z4D0ktuikaSoR3H/vfScns+/pQVDIVr2VVwzz
         z1ny462tXMbSiZ5hTep+w59RkAH+oYg5lhYhg+tLM7sqkModPCeLlx5RQ/vYFUAp0l8v
         E6hbqWM2cftiHNJgnHguohtl9uA55zHt2G98DlioGsR1KP/6JYowBRkB4kOYcFHKhGXm
         bN6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHWw0N3DxJLl7Mf0EGsr6/XoQzu8NkhpRbJJxApU76yJpqlipndJ+/haFIR0HrDHyVD4Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBzgf15ze6iTFl6T/TPWgT1LBt3RKi9C/VC+5Lxh3pWx7gNjuA
	d8xx6q+3wojEEVUV0eERC+54w08LYDglFX+pxqcrV+pAlecpHyrDLAy8kcIw1Ry78V/KS5LPEEJ
	gn8u3cjIhoIMAM53rSNfFNfWKgPuR4JQuZmbKQA==
X-Gm-Gg: ASbGncv8icnyOVJwtRZiClKuOh/IBg6DamlP5Uw3RYP/MmEzZxbF8zwJ0jG/P9FEMrQ
	DDCokRrHPTeKho5+7/4fZd8n3KMYAkI200/sVlV2Lp+Xm8MrsHU7TzWT23tTrhpZ6h87DbHXWuO
	ZwDe649YU16Rb8eUJRpCmv6SY=
X-Google-Smtp-Source: AGHT+IE+KQ5mhqCdAicmf7a28zsguJznUEdy53WKuiHnYymLVfd0/ONr455swN8mCtn+15YDbEpXrpy4cOjvjDDAfZo=
X-Received: by 2002:a05:690c:a90:b0:6fd:33a5:59a with SMTP id
 00721157ae682-7089af99460mr31745177b3.18.1745921226784; Tue, 29 Apr 2025
 03:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424034610.441532-1-rdunlap@infradead.org>
In-Reply-To: <20250424034610.441532-1-rdunlap@infradead.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 29 Apr 2025 12:06:30 +0200
X-Gm-Features: ATxdqUGe1f7BXwgk8BKhjbgMOwlPjLa7A1c1xzU9Uqd9tqasf9-fMmdsvIXz7aE
Message-ID: <CAPDyKFr3EN+Ss5qaFmQ1+42=t_cZ55PtggXMq8uVHPkYQy-uyw@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: sdhci-esdhc-imx: fix defined but not used warnings
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Luke Wang <ziniu.wang_1@nxp.com>, 
	linux-mmc@vger.kernel.org, Haibo Chen <haibo.chen@nxp.com>, imx@lists.linux.dev, 
	s32@nxp.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 05:46, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix warnings when CONFIG_PM=y and CONFIG_PM_SLEEP is not set by
> surrounding the 2 functions with #ifdef CONFIG_PM_SLEEP.
>
> drivers/mmc/host/sdhci-esdhc-imx.c:1659:13: warning: 'sdhc_esdhc_tuning_restore' defined but not used [-Wunused-function]
>  1659 | static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
> drivers/mmc/host/sdhci-esdhc-imx.c:1637:13: warning: 'sdhc_esdhc_tuning_save' defined but not used [-Wunused-function]
>  1637 | static void sdhc_esdhc_tuning_save(struct sdhci_host *host)
>
> Fixes: 3d1eea493894 ("mmc: sdhci-esdhc-imx: Save tuning value when card stays powered in suspend")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Luke Wang <ziniu.wang_1@nxp.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-mmc@vger.kernel.org
> Cc: Haibo Chen <haibo.chen@nxp.com>
> Cc: imx@lists.linux.dev
> Cc: s32@nxp.com

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c |    2 ++
>  1 file changed, 2 insertions(+)
>
> --- linux-next-20250423.orig/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ linux-next-20250423/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1634,6 +1634,7 @@ static void sdhci_esdhc_imx_hwinit(struc
>         }
>  }
>
> +#ifdef CONFIG_PM_SLEEP
>  static void sdhc_esdhc_tuning_save(struct sdhci_host *host)
>  {
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -1688,6 +1689,7 @@ static void sdhc_esdhc_tuning_restore(st
>                        host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
>         }
>  }
> +#endif
>
>  static void esdhc_cqe_enable(struct mmc_host *mmc)
>  {
