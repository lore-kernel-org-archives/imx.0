Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5E3A4F41
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 15:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674178; cv=pass; b=oimqygJYFH43VszenCsHOcD+rmJ9rsH0ROQ5up1TVr1iGekdx5lRvlZGY1qU9rTHpl4qCQLRiuW4AzmFpAtRnzLMqd/IaYkN2xAUKOgD6Vx8WcogZ1ySCeBTeWT3SaeZPINzC/Wt3gDY6coQB8Bjgcx795Qdu/y5QmZ3EoGYKQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674178; c=relaxed/simple;
	bh=anhBm3gdqY3+LNbvg44+Sh4cHy+UdLyAmxTWGOFH/gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YbA8rA7MlEPuRlUWz8O2/6SXDYCtBXDS+qM4Aduza2kWKajnnhoWEZaC5B/skPK0axEk53eWNOPe3YhKbn9R+eyvrwxFX67yr4jzrY31kYE+/jiayb8BeJYrgr3zdsn0OFiyt6H/txr8jx9Iq/LD1GxEpJzuoBeGjZCMg74gzPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hi+TKiW3; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hi+TKiW3"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a133b686f7so4221346e87.0
        for <imx@lists.linux.dev>; Mon, 16 Mar 2026 08:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674174; cv=none;
        d=google.com; s=arc-20240605;
        b=AbDJ3ue3L34uyqbSGc02T+Duk6uG+YUClsmRfScWgC+/8X2QdB71Z1eWowvhJPywaO
         RAp4MHo/to3GDDJsaot3N9x502RSDuzF5uIdHpkZtkHVmmm1889yxwqcedJkxOuF+K67
         pHQaltkQLkzDl59Kpmq1ryhmK+d+CJm3NjDQlbAIRzQQwRnQcUSK8zvye4K3ydWnWKvM
         yEVDJ1eAIJgJbWsJDIkCNyNrCv87oNLPMlsglNQlO6DCCERBfVBpX/MgSGvHyTvg9KOG
         LwEV7anaQmm4dwDg51HGqGyeyjS7gFrYK/ffgBCapvXYlXqeJXCvu/SC5IV3gxZV+WnN
         eP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pRG8t2fwa53hb2NLk5hHr7swK0mnrB3Ou8aFpV71p8Q=;
        fh=GEZ3QD4mEmDRz9gi6/t4Ree7iQRmi3n6+hgcBdkjUNM=;
        b=ecOKMmBCU+1YM+BUU3AjnTTGXW3m9jAHJdWU0DbxCvkMRecRAm+kg79np5W41Glwqh
         Lsr0/m5+G7/YlfQcv7aHEFFLM6P3suQD9sOVC0FS+j5BB67aBt73i9VvAe/Jj21fSdpA
         0le+9pWyJR4xyb4kmcNpn9Ptbf6pPyFXRgoMXSHQ7ui4oaJwp2o1mOjwRuYZ3ON3Gh+G
         fMD5nXJtRC680eARFLGucJpkwu1n2jM2QSULLnKNrqNli+kSVmaAz+xwaWRjn2Ew0I4l
         dvd6OyPIEAwQz87I3q3NSR+2cAGQEaeFmdoB1ih8L0CcWkTaF42/fBFRp6BQ8tMsy7UD
         C7Pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773674174; x=1774278974; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pRG8t2fwa53hb2NLk5hHr7swK0mnrB3Ou8aFpV71p8Q=;
        b=hi+TKiW3VSGxvYU3gRkSzM1v3ioKmv+5Lii2FixLophKoeSicPiIp/58U0wbGRPYas
         njyr9cAl4+376n7MfHfled42YlrUuSL8owawRFgxIsf8QsXYlGSlEg8OGKQ51XBHpOcM
         OvzLludkI/f6D4lD22h2d62KT89DdsyjTKy0cHELLgu/4/2F2QsWsVJ727l86OkcOv5w
         gCBHQCnMjKWx50OjDMLFxzJlvpzCvZ6wCqHLsQsTwiJ4m6CHnwjRDGAMgADLnsPjNRya
         w+JzsaKbeqGqF4egQiJBGAouVGOD/l1BrZGkhKZrb7YtN08D0GZyD88fbR34LqLlg57H
         ghXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674174; x=1774278974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRG8t2fwa53hb2NLk5hHr7swK0mnrB3Ou8aFpV71p8Q=;
        b=EuXyJoCvmevZ9qNfAopi4WN84rcdqFUYL+G4p+SD0/pMP0Ep62imbcTuYRTCcZUm4P
         xXTcMY2wefG/UMmdlChkBzVpZpbVNYfVZ+I4ld5AfmHXMhSrYhSnzydV2OM4cBs3wIPE
         jX16piDBG4BScGwIkV5ayQDATH+uBAdnVnk4TgTCGoUSxBrBSHHEuCvAIyW4NcDP+weJ
         /iB03qAhfqJG8jBr8pc+0LMLK2Erx+7NkLpGIxHPjSfyUp/DobqAvPs/PmhK0LyY8Lt/
         ik8rbAwOK5Joap9URStiWRTjkJkmXaSo2wehCkmAghGmzgfQMwLBXKuCHUAaX7TEarF3
         vgVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKhEnptZiKJqZyglpxJvMbBnenDWGAmiGHcbOTs4WCGCg8ewzS5Zu7sG7vN1HHz1dfq8o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDAsmrWiVMQE261gDWlckq9upXjQ/bxAVIvpxWySUL0fGqYQ1m
	h+Mj720gyEOpple5J4e07mmvn+AFZz26k2qSVdkMd0G80aFIfU7hYyDZ/1hlozmNOwMm01u0ul6
	DQvKieomXH3cT/qYAWxGa+0Cwlo4DMXSfaK8neMX15G/CIC7an3BeV4w=
X-Gm-Gg: ATEYQzyzkUu3nHJEdMVq7w3hGHmO0ezzxyntJ1RLEMDCjn2F4t5hmkzlDO89OHS06tx
	xTJTx7eP2GHxwJFncSxNGFrWgwfbBQmUpWveMDkQs9wODsVguqBgfKa5pniqR6Kxs9je+mHAF2l
	3P/2wvP8orK5CkSeOTdPHH1QX3qzSXME25vufDqJkLdVW8ykZPtq1i5qYmvJVQH+MOvHc/uX9fv
	Jgqz3UM+OqwM49sdKmu4peVtXedNvR0t7tZWXwHHrO4b6GEQ/Y4AwS1dPvId309GL9PH4IUX6KU
	MiNEcahI
X-Received: by 2002:a05:6512:3d28:b0:5a1:18ad:b55a with SMTP id
 2adb3069b0e04-5a162b14fedmr4185167e87.40.1773674174186; Mon, 16 Mar 2026
 08:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311095009.1254556-1-ziniu.wang_1@nxp.com> <20260311095009.1254556-4-ziniu.wang_1@nxp.com>
In-Reply-To: <20260311095009.1254556-4-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 16:15:37 +0100
X-Gm-Features: AaiRm52ArtuP-ygMvRxB8MkKlR8r_NeTZwYYmgYJ41n5nYfFvCkoTG5n4kfwkpY
Message-ID: <CAPDyKFraNEd9UG8QO5PEGkgRxS_43Szt+2vwXtqAP2CBjYSCpw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] mmc: sdhci-esdhc-imx: remove duplicate HS400 bus
 width validation
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
> mmc_validate_host_caps() already validates that HS400/HS400ES requires
> 8-bit bus width. Remove the duplicate validation.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index b607d4ffc562..d49069986efc 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1833,10 +1833,6 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
>
>         sdhci_get_property(pdev);
>
> -       /* HS400/HS400ES require 8 bit bus */
> -       if (!(host->mmc->caps & MMC_CAP_8_BIT_DATA))
> -               host->mmc->caps2 &= ~(MMC_CAP2_HS400 | MMC_CAP2_HS400_ES);
> -
>         if (mmc_gpio_get_cd(host->mmc) >= 0)
>                 host->quirks &= ~SDHCI_QUIRK_BROKEN_CARD_DETECTION;
>
> --
> 2.34.1
>
