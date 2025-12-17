Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C18338926
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979159; cv=none; b=JnQeVmkSdc4APGUowB6grjx3UTNihE/wg47kD4IJtk+Zr/X8Ut4w2seec26jN7cwWD38LASdbT45+gvSp2Z8tDjUX2PR2p/LbnwPdrMlO5K78nKKghapWpkLaXizKPu82t9D8qCGr39zlGP4TcUUn00d4X/aGSF1YOtMKmLLw3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979159; c=relaxed/simple;
	bh=RulmqSaiOURezsD4cu1+MRR95cud3v1lRvrkSGGSSZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yes2liAAdArjcTvlJpmTeaKIEQINl/kvHs9gLrRwPa9ASEwt1P2hF8QiqYlK/Sy5LZm3sVJ/9LhwMPQjJm2ee0CgEANz31s3BqlA8srGhZQZej2L7/FCX+WCQRWzA32xtdNr96Qjn5gM2FotqZ7WapL8RIKoppync6oYgethaZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kYYu/tqq; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kYYu/tqq"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5957db5bdedso7183914e87.2
        for <imx@lists.linux.dev>; Wed, 17 Dec 2025 05:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765979156; x=1766583956; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HeFvcwPuMBzJwPtY2IZ75UX9BR5Ij/OppFp2JBnCGZk=;
        b=kYYu/tqqvCZmnqyYKZo1N5iire5Aq6sWefzNJ9fTMEcRI5DhL+wIEPE2iinPlPDUmz
         RkVywTkCR+mOfID3M3uVPJcjMDXAn0+HF/rkvUKnOjkHkfVBIchSYCpragjKlelrg80G
         boux46/iQnH/oYDWDbOWYHjCOplCMnxGp/0fKi9IAMBObbKtnL1IArU4hc+7DY+XB443
         rvU9xbfMPATgS24ewD91UNYBkqLtWYQICp+QZr7Rfzzv6s/AAaZnkbUc2uQZe5f4hu75
         ktWpioY7kRbtFJy5DBJEMKuR8I40qRaSvtQn9frEmb6AYJ4ZdZhTqW5ZGVOekNmNoeiD
         bUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979156; x=1766583956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeFvcwPuMBzJwPtY2IZ75UX9BR5Ij/OppFp2JBnCGZk=;
        b=A3QPRcd8ejdu6/K+H+Zdqnv2zBgC0YGrwS8WDW+5f066Vf6Jpe4YMncI1BPRaljFF5
         iMaAb2VlsbPs9FyqJWxKibGzf430GPcYzcUij506Vv2dFWbXDqBCSQtFcxm6xELoHWkH
         Z2dN8xwjNCxdFMu1s79CkM67TsaqPnYUdxtHVcfTjD2oLkuRs1r+daB8g2HfPhs5Kj43
         CZxpDyv2eYvFcBfUePeDVbr8IvW3cdL4lONUJkzqefx7v2DD86VHR/fqJwl6sDHfw5bW
         j3EJAw6R4mohyj61zcM6W/elRuZRBeopXKyfEL6nsS+60u17V90IYdD+ev0zc1iTVN/p
         c2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOG71ah2OumnN1KOGh78NtEiFP7WdaHnrCauG9F6hl7GnhergRLPgrtmU2Mg5KRx3TuDQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsMRUo+f8uPnIZ5dMg4IDkBKFj7wt6GC/28liat6+c7mck3NFg
	EkVROtiDIdVjidY/3tQyouqF0LcMqTsLth7miFRtb7o3lA8jRp8FZkv/Ufjjc6S3oztIOD6HAZX
	C6B34rOenTxhLWv0lsZXEQMejq+ir3RrOqyqGQxyM2g==
X-Gm-Gg: AY/fxX4h4z4e4w6LC0LZdC3n+sYv+QR58bVihR53mujAm7yJFlVsyr7TpP80wBQK/wB
	QtRUp58Gw9pLfYEWw1kQwYWYfm0pIXW5vT83T2RedrtFFjXLwP6uWlhVZfB5FEin0hScu9bOZV3
	7DnkeMKcM++AfZBxk2Y5wDMwKN7Lg7eJkGADw4Ssl6+IdKQmxuOri4N0ZEKa1pnMwL9f5OdcT5B
	91iAch53ApN/U3p5Hw50F6MhdLNQ87GzV7Y3Ax8IXK+/8/95Gc3Qri/CFv4Ef3+SKkGNVQ=
X-Google-Smtp-Source: AGHT+IF8DUR3iFEJEHIZVoppRZ2LJ1i16lHQ3Olhnesdn9YtIYVJQ/fNEdH4vIoS5b8Lw4dMFXsWFN+VTySF0wVdcVI=
X-Received: by 2002:a05:6512:3b86:b0:597:d7dc:b7ce with SMTP id
 2adb3069b0e04-598faa3bd8amr6408543e87.30.1765979156040; Wed, 17 Dec 2025
 05:45:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251212-s32g-sdhci-kconfig-v1-1-8e278c8d7f78@redhat.com>
In-Reply-To: <20251212-s32g-sdhci-kconfig-v1-1-8e278c8d7f78@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Dec 2025 14:45:17 +0100
X-Gm-Features: AQt7F2p99M9efU4Kabtz6odZdNhny0sq2J-1crHyiipLb65xYIkOxCPnes_s36Q
Message-ID: <CAPDyKFp++OQFxkY_zqkZSJz2R0sqxBnd-6U+VLsyZYDQ4H9MeA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: add alternate ARCH_S32 dependency
 to Kconfig
To: Jared Kangas <jkangas@redhat.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Chester Lin <chester62515@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Dec 2025 at 16:04, Jared Kangas <jkangas@redhat.com> wrote:
>
> MMC_SDHCI_ESDHC_IMX requires ARCH_MXC despite also being used on
> ARCH_S32, which results in unmet dependencies when compiling strictly
> for ARCH_S32. Resolve this by adding ARCH_S32 as an alternative to
> ARCH_MXC in the driver's dependencies.
>
> Fixes: 5c4f00627c9a ("mmc: sdhci-esdhc-imx: add NXP S32G2 support")
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Applied for fixes and by adding a stable-tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 10d0ef58ef493102d3586d7a31d755543297999a..c94ae4794545de1c818ad50be7f91331862b6acf 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -315,14 +315,14 @@ config MMC_SDHCI_ESDHC_MCF
>
>  config MMC_SDHCI_ESDHC_IMX
>         tristate "SDHCI support for the Freescale eSDHC/uSDHC i.MX controller"
> -       depends on ARCH_MXC || COMPILE_TEST
> +       depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         depends on OF
>         select MMC_SDHCI_IO_ACCESSORS
>         select MMC_CQHCI
>         help
>           This selects the Freescale eSDHC/uSDHC controller support
> -         found on i.MX25, i.MX35 i.MX5x and i.MX6x.
> +         found on i.MX25, i.MX35, i.MX5x, i.MX6x, and S32G.
>
>           If you have a controller with this interface, say Y or M here.
>
>
> ---
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> change-id: 20251211-s32g-sdhci-kconfig-585b6909f7b4
>
> Best regards,
> --
> Jared Kangas <jkangas@redhat.com>
>
