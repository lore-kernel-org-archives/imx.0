Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FF83A5E7C
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674180; cv=pass; b=mi2rOAF6W71wxKBkeoiaVGpe6ngcUd6lDABRcCMkzo/QDnFgnIhyNyQeTWHSVCdDjAjhgxFaXsWeJkXVujTDjL8+kuRTXTz/F7oNY1xlHxxHE6MIfEPVAWOQCIW76+L2HMdGrLlA04H9Ai0qxz6o9f65ocWyz/mBgo/KZiXxek4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674180; c=relaxed/simple;
	bh=W3xI0co27+/OMb311suaehYAB5dKPN2jLUw6zN284vU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oa+XNQyZnnnFf5tiqYQ8/ahhEII7iDUCCgxPT7GhqX3KYWkGAavwMMH1ghrpliikpcmV6/dLOl8DaG1zTvZ3Z3FJrXYHUnmrMBL3yrTjrlI1NE64r6zU7qYMwDdJ3NtOZ/N+coJT7jU+X3y5D863sJvILhscddvR95nVLtDFJnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZKNp6tjV; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZKNp6tjV"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a12fbbd9d2so7271968e87.3
        for <imx@lists.linux.dev>; Mon, 16 Mar 2026 08:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674177; cv=none;
        d=google.com; s=arc-20240605;
        b=e2DLPBAVlDLOv5QqVWYRgqdLcGEKfhsTknzuhJNlFTmUmKNesTKPAvc+naBrd1Nx2D
         02MDC99AOLdAakMDKTw+7mHwfzd0OrJBlRcj5uP2xV1zt1jDW+0lw3iUryZ+lEGbuxnl
         vFEbmIztGchf86E7kqKheVGqFAcqNUTL+Z8Yt25zxxK5huL0zqQECmf1Up9Xk5Z6GGEL
         CwcuWCffeSQBUAlIC8m+nBZscUMmjcfAIv21KQ8vucEEfpikM/k68DygTPu9ZIbHco62
         wG9o5QxrOesH2638NcbcxDU+AMihX4hOQwSqgm/XHxZD5q7yEqtcWihieqcWCLVjRbi+
         4J7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RfmS9UsPgTPMXyC6QLAQIz9yZtJBVekf+/MAtbCUFs4=;
        fh=qrCQxaZUbyVYK8JLJUBTEWKazRHS/o279BeoenH/xmY=;
        b=TQ/mNasQilN+MzNdjg2SBh0NyGs9UDmFh9YdAb8teM7PAhJXLmpKIXuCeiPN1NAJfl
         x/wui+kz+wqI8wAkFZD89DaVjW+EcB1KpqWcmNV9LjwK4jbhbOKNELHps/dU67iHRKPV
         awxX2lj4U7jSDmtksDUJv3kFuWxCcWGpAWJW5SPEHAbmOTodBGXfMoxhGiOhZ2WjycYd
         ENm4KjeLjVHMHMvHY3rHhj1bjX7CR5KSI9ce3jAtnXJCNR9ACpNBMnTu2241hyMlFUrd
         uR2/nZm/RfMIFzoG6Vu0u+6fQeIKDXmFhIqD7xy87lR5/YXh5mcqCisQgvsNVSWTJHV0
         +u5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773674177; x=1774278977; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RfmS9UsPgTPMXyC6QLAQIz9yZtJBVekf+/MAtbCUFs4=;
        b=ZKNp6tjVkL4g7718BU6hzUn/0ff2/h449YV8h43KUjNFdo+9fjmZ+d89BTUh4PQQEk
         k7fBR0tvuLPYR+4EtEUKdpuNVLWJ+2LnpGSG/pvC8ykrB4EIbSyUx/7ensuO9y/2qYfC
         4nBrFqaCWbnzNs/at/jzMXNGaw4jmbcSw9Gu9hUJGbOkC2aBZXF3uu7RMj8JeuBhHFNo
         wrFufXutuYUjwQ3xig0h+d87gosxtwpEs/yHiDdFHV9jbQzBeCyW49h6mySnuWb4NCeE
         uV4G+lIfGyQiPYxc28Z0HXeLlXMc2BYoJohRdzMkod/+MnUqd508bgGcxmtwV99/guEi
         9wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674177; x=1774278977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfmS9UsPgTPMXyC6QLAQIz9yZtJBVekf+/MAtbCUFs4=;
        b=pitn80LAH7tCG3zLhPFD8UEaS1ayo/7niXKv9SmkfQFQ56nmvGQQD6s9AuRvAWnChU
         xvW530Fi/YSS52KSvUf4RIEch0AWn3+eODn5jqQ9/+L5BLvHAUG6lzAWkP6CP3vCNrwA
         lqNK8lkv0PbK03NG6DMI8tsdmlHdIJNDx0+Ih/bva4shsvL+WEKvAe/ggVfN8O1/Go5L
         AWUuzPgvb4BogfmlK3oPRnJxCqS07t/BFBwQfQw5D1ip3cLb8VLCLrbvFSSESjYmopFq
         757t1mDAIOG0qKKb8gPgqUCw5sIZOUbd76vGQ18ZlzBl6W/XK7MV7aEUhLdgFh838pTY
         m+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBiS5tTOxGAnNcjUucl110qIEwAndrs8SSOOPZpW0Q+E0FkqOQLl9O+kDKTENOjqoybeU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyY9fuJJ9vRhiFKr+2ZaeLpi/LB5isD5kjv2AvCsoMHT0n9WztO
	JWsvMm/Xzz70M+eqzu+3KPyD1j4tuOl7pOaFnE2e5toNpFEF2pmU2kZRhqoql68epZQfOJ/Mbg3
	NrGLRG8hmP/klYxSyKvi7xFB0AvAoC+fsmNbh8HElVmb77+6cVId8oaM=
X-Gm-Gg: ATEYQzzjgC+YBXwN2ZEeBek5PTISxtIDWDbjU8xse+8syWoQicv17Ny8lTeuv2YBITq
	Vw8yBZbpTgp1huZM/cOxhsLGTakUsyAVtNzstc5zmVY2xy77+7n8ecW2zmvDXg5rRIEovh4zhOg
	aywIVZxYErUxGRz8rFhOzbsN7nO2MVvMmcAW1YdWKrEdeLWOZ6uTmv07s9ZOz/GnMediiSxBvtl
	j85bb9N59kl3kHAbRnHy+KsvMhNJ72v+QZxH/up2rykZ0751vCzCCVp6AYS0A8kAoMfde2n31Zn
	/Vf2MOZs
X-Received: by 2002:a05:6512:124b:b0:5a1:1e44:8682 with SMTP id
 2adb3069b0e04-5a162b0d510mr4888825e87.34.1773674177264; Mon, 16 Mar 2026
 08:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311095009.1254556-1-ziniu.wang_1@nxp.com> <20260311095009.1254556-5-ziniu.wang_1@nxp.com>
In-Reply-To: <20260311095009.1254556-5-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 16:15:40 +0100
X-Gm-Features: AaiRm51cPffNhAKRkrzoz3tQeIb3HHrML_LJWGZPPVi46bwXGd0VkLN3oL3c85A
Message-ID: <CAPDyKFpFoZZv7b9jGPpWAQxYiCdxVc4e6fYYj5=16UPFi7WzSA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mmc: sdhci-pltfm: remove duplicate DTS property parsing
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
> The "keep-power-in-suspend", "wakeup-source" and "enable-sdio-wakeup"
> properties are already parsed in mmc_of_parse(). All sdhci drivers that
> call sdhci_get_property() also call mmc_of_parse(). The only exception
> is sdhci-of-hlwd, which does not call mmc_of_parse(), but its devicetree
> does not use these properties anyway.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-pltfm.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-pltfm.c b/drivers/mmc/host/sdhci-pltfm.c
> index d4fb60c1ef69..933fafe0a0ef 100644
> --- a/drivers/mmc/host/sdhci-pltfm.c
> +++ b/drivers/mmc/host/sdhci-pltfm.c
> @@ -95,13 +95,6 @@ void sdhci_get_property(struct platform_device *pdev)
>         sdhci_get_compatibility(pdev);
>
>         device_property_read_u32(dev, "clock-frequency", &pltfm_host->clock);
> -
> -       if (device_property_present(dev, "keep-power-in-suspend"))
> -               host->mmc->pm_caps |= MMC_PM_KEEP_POWER;
> -
> -       if (device_property_read_bool(dev, "wakeup-source") ||
> -           device_property_read_bool(dev, "enable-sdio-wakeup")) /* legacy */
> -               host->mmc->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
>  }
>  EXPORT_SYMBOL_GPL(sdhci_get_property);
>
> --
> 2.34.1
>
