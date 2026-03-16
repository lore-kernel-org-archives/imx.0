Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C203A3E97
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674168; cv=pass; b=FJWHFu5U5ApFmkjRMXS2h0ICl+8HvDvDIlP8jLelFtx+vhPr0IMPA017H/C6Z/C85bU1j+62lpAmW7QTcSO4tkG3BLQ3/lYhIMbeNswQ+1adJnOnv14mH/HEbhTpomvZzawUjq02jDUiIOyCxJkiP6ZhWLrcJCz81Ws8jNtH8Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674168; c=relaxed/simple;
	bh=MlbPjgkbDjZzy97rL4tyaIWnLS+hi31RbU0SxYxTQpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SjSoawNz1HvSLlg4lqCKqCPJsaWmidAOfsL6C89pKlHmK0Trrk3zqsw8LTRC3/jkpuynhmiv8tu6tD5MEc1fV/vYo2tKS4YZXfdqeRWazawlVFnrYBwOCCw7ZU66q9PsYRmQOHBugm15Z8GK7HVt/W7+KzxrpjGKUq4g9TXlVmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OH+3iXtp; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OH+3iXtp"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a1362c9a3cso4876772e87.2
        for <imx@lists.linux.dev>; Mon, 16 Mar 2026 08:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674165; cv=none;
        d=google.com; s=arc-20240605;
        b=fp5p7mHP4/Sh9vp176NOxkbqhCPz1IFU74z6xfmF/yaxzxsGmVfUXqOJS9pJUYqrcw
         PjJ+LKfuWB5tuShahuh9UcFZVxwZQSFn/4QiicFSJ+aKROrQ86uRa62nFUDsz6oY7F3F
         BL9mIifNbu/NB0TPa1NRrhU5sbo5VNXE8wNyDjSrm3Esm93WQg5j1IqxDk9u0znbpec4
         B+L35Ux40ng3l8McVUQ9QnFs/0Yj7sWwajkOaL0JIs28vAljLxyX4O/AtdhCLu70VqkY
         x4VQkZ5oHbthV8KNA/gNy7DKhsjOkFfLdNnJAnp748WwynKT1+4ttC01/nreqoc4lhTq
         WBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KlM6cFVmM/SaOx6burFPACi9y9V71qm4hfXUPER/Krk=;
        fh=jnwsTdJDU95BpwGKfHerBQqAMD1tXwVUHfpVFCXme3c=;
        b=LA0BUertEU9+dumraT2mAEbWVOkWBycxfmZba2RsXgOkod6HEnAfOrt+KyJsJi3444
         ZMfDFoavevEsVl7imARA0bxrvPFw0h0+LR77GUGBzpFH2Vcsn4T5xePzYsqNCrB2vxAY
         2k9Wq1F8sQtX9fQFuwnbn1HlQtG17j8BNItWZmIJRBXxn9Zf3hwIFB1TgN+LzHfjsb8e
         wiA1WdbTXwIv+RkAbcXr4SdnExP0w/Wv/ylhrcJiCkXAPBA14FrHe26E1xKMRNlNIUAH
         YCh4UiXqAB8OA0zbPS5oZLbJZA6Am9KtoOgJM3r3/92LeqP/V674IExs+wEQkdej19Gd
         i0/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773674165; x=1774278965; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KlM6cFVmM/SaOx6burFPACi9y9V71qm4hfXUPER/Krk=;
        b=OH+3iXtpRDd+n0iURStbT8NWz+bTiBreQAkV/gwxtAKRse98bzZ3IWUZK54QEqn7aB
         zh+N0T396cnT+W1TpBw6OgpyXTs0qICeY3I9gEmLANfdK2Qfhlq6iZARo5yItu79ti6L
         d//d+qwnrXz+UcVT1S5yhjlglU03Q7wuGjhF1Odf/bQIInOKHNZUf2e3xwoDmSxB+3fj
         H09kXh4jWNFoWI9ZRW1bMtoNTJrzD9Dx0K9tLP6rVS3jJAsxvEm3t6otz70tD38SK17L
         qNGRSFJfJsG6+QBtSN+ah1HuVm2kikNi8Hwq+WH4hjcioZiLfeYXZLhB68L3bQMeqemc
         XhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674165; x=1774278965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlM6cFVmM/SaOx6burFPACi9y9V71qm4hfXUPER/Krk=;
        b=hKkhiG4st9kjntPbTE+Ti0YkA7Ed2bLZGh8RjO8bwjZE4JtK0JDDS4L9UL5Quw/kT8
         auXRtISEkOR3Z0PjQuIDzqgfDbAZDuMh3N/70ySrTmTPnnT9TbLV+bWo2BitEnatmXpq
         unlQJ2a+SwxaJIbGEyUj9+6xK7IkPu64mR7FBFqzV54ytFLWYSABCa4M1ZWNxR9yIRMp
         MX1T2Y3kvUwmvkezKoIImjrHAnNodiPRjq4251mfJeOLQ1aOOVywbtkr3nTU0dgnlIsr
         KD5SLKINP1siI2IsSWS2YH9UW9kn7Vj5ib49qgN9T6TjD8Rx2+NrMU6xBew1Y/lCPywh
         vThw==
X-Forwarded-Encrypted: i=1; AJvYcCXqJJ6VahbtPjJmNdFmE8wvymwWI+zWWVDa8POHTgFCG3rtV2kz1/Kob1j0hYNnAtjpd6Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzM4LI1uu6ndYkpzNl0zuzrVxnqGApsvJy4iOAGG0L5h0L+lxju
	phw3xKhDtAoUy02e1TgYpMSkfsl2vCRWCJvbp1ROR1zeDH/cz3aqOIuODWCu9+6Lu25NiDCzg31
	Ck1GVEH4T1lqydc+Y+v2ddZaDXOQGVYV69+aJyMcyDA==
X-Gm-Gg: ATEYQzyRKuPNnPiM2tH7UjlJjDN1w/YBWo4qO7+3FECeA359/t7VvcktNl2ohF/1f6B
	U9A1P67/NasnLZcEl4YffhyCvk2IJ7X7NWXzFFTkAeBvRkdCS9Xj8tIv3XLuaW+KsAnq4xJ6zUF
	AKaayKs+A0f28HjENhF1ntrNEGYvbvqfZsxpFftyKUMWiUsJnxJWkCisM8OvS5DW8N3XyATgm9f
	u3ItYtSIgNwyMEHB1fvQFTBvo1N+A+HzTPR+eAvb5g+YzmApigWlCBVbc2aCRR/bsemf40zhME/
	UYo6s5I/
X-Received: by 2002:a05:6512:1558:b0:5a1:448b:317b with SMTP id
 2adb3069b0e04-5a162b08ea8mr3109007e87.42.1773674165204; Mon, 16 Mar 2026
 08:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311095009.1254556-1-ziniu.wang_1@nxp.com> <20260311095009.1254556-2-ziniu.wang_1@nxp.com>
In-Reply-To: <20260311095009.1254556-2-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 16:15:29 +0100
X-Gm-Features: AaiRm50g4ixBgJVGHgml85tjVL8FL6K6omKlK_jwEmgNVXMLTx5qLAygbxIzv3g
Message-ID: <CAPDyKFqbNj0vxNNRoZQ=xSijASA1eWCHfZVabPznQqJ-vrBUYw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mmc: sdhci: fix timing selection for 1-bit bus width
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2026 at 10:48, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> When 1-bit bus width is used with HS200/HS400 capabilities set,
> mmc_select_hs200() returns 0 without actually switching. This
> causes mmc_select_timing() to skip mmc_select_hs(), leaving eMMC
> in legacy mode (26MHz) instead of High Speed SDR (52MHz).
>
> Per JEDEC eMMC spec section 5.3.2, 1-bit mode supports High Speed
> SDR. Drop incompatible HS200/HS400/UHS/DDR caps early so timing
> selection falls through to mmc_select_hs() correctly.
>
> Fixes: f2119df6b7646 ("mmc: sd: add support for signal voltage switch procedure")
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index b1a3cd574c84..605be55f8d2d 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -4539,8 +4539,15 @@ int sdhci_setup_host(struct sdhci_host *host)
>          * their platform code before calling sdhci_add_host(), and we
>          * won't assume 8-bit width for hosts without that CAP.
>          */
> -       if (!(host->quirks & SDHCI_QUIRK_FORCE_1_BIT_DATA))
> +       if (host->quirks & SDHCI_QUIRK_FORCE_1_BIT_DATA) {
> +               host->caps1 &= ~(SDHCI_SUPPORT_SDR104 | SDHCI_SUPPORT_SDR50 | SDHCI_SUPPORT_DDR50);
> +               if (host->quirks2 & SDHCI_QUIRK2_CAPS_BIT63_FOR_HS400)
> +                       host->caps1 &= ~SDHCI_SUPPORT_HS400;
> +               mmc->caps2 &= ~(MMC_CAP2_HS200 | MMC_CAP2_HS400 | MMC_CAP2_HS400_ES);
> +               mmc->caps &= ~(MMC_CAP_DDR | MMC_CAP_UHS);
> +       } else {
>                 mmc->caps |= MMC_CAP_4_BIT_DATA;
> +       }
>
>         if (host->quirks2 & SDHCI_QUIRK2_HOST_NO_CMD23)
>                 mmc->caps &= ~MMC_CAP_CMD23;
> --
> 2.34.1
>
