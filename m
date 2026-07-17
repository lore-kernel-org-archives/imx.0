Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BA93EB114
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283056; cv=none; b=qvExtbvBVso54wkcZKYKj+AMwO4NFeUh2108Gi06t90ThNBCBLtJ4NL8CM3uUGlfj+gn1gIKUbB8jAdWJAvZ9JJuXBoz2zxwAisJXOowEpOzpECTpmMY2Wb8yqSe5wUsdDNnurQBG8x7MxIS2XsAg62J/QSNwFQZ3u4Q2BPUYUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283056; c=relaxed/simple;
	bh=ldQ/iUGMrGHxKXxkUXAQa6J8x3uVZmvW1Kddq04F3bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VscKVuIJPmltslJ+vinRgk67SS8Tf8zCVV0EoavNAIGMUPmDiwpC7NxiC0BO7LN8uLkYUjvuD49GhV+uibertiCiNO8VlnTMFNA0mi2kWrMj089RcTs+4VmqSHh8hoxU/Au1FvPXMJJH5PNM+Ax4WA8CLz32C0xIo4RTVvau/Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6Eh4e2H; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6Eh4e2H"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4566a5bc186so927114fac.1
        for <imx@lists.linux.dev>; Fri, 17 Jul 2026 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784283053; x=1784887853; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vijqM8KLfxoJ7zWFWIhaauEg3BKDHA3EobwX8Ha/oEk=;
        b=e6Eh4e2HB9onGrSjQw156aDCWbs05BepmR8E8eEl7gH1mNoGjPum/k51wDTppr8Z6z
         TjM6sCq4MEAxDpBmfkY64m2+x/2dAIX83LOCtpRUD7nMjvannn2BDho4ISEgE56Mgn03
         u8kBxRk5RxqzEyA3UNqNSIxuMPkjff8ZpFYz7KZ/4n97I1f+yDJ3kG4AU4Uq5pgq/gOL
         ZEliHNJ+TN2UBt19KfgRopKb5hZswDsS9p2cG1hIkXPrDsKu3PBuq3dKLV27Z4x+f18j
         mwk9aHuB9UlwHr0VPaNtAVH/TpcJgo9WjXXCMWcprQixblMfsAiLIoTU35I3pRHLhX7s
         WHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784283053; x=1784887853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vijqM8KLfxoJ7zWFWIhaauEg3BKDHA3EobwX8Ha/oEk=;
        b=SWU1vfmepj02M+McwU4/z3+vCqVpWMm2pnjGEfyBdvMMl3VGdKjwYzFO4FhKSeMWh0
         fX/r/Yaa97h6mlqNsYL6D/VsXr3hIQ3MrP0uOVk1Y8+ko1n2+7xkFXfe3XUvULxaDIN7
         7Co0xoBGBloE0TghkocY9qapMIaODpdW4qLYXKPe2YSWKoxoumfabdN8FPiA2zYBL/hk
         BaOk+dlkJP+Wkc0jfllKY6/7BsEJK96bwMLQE+CL+GXvZBZY3XuP2psep9WtxmAgx/id
         xXImHx8bd0d5VHxOsu+5d0H7+Eiam8qtGs98LvmlA+/PXtUJx1Ghosr1i9XVmVOSPwwD
         chaA==
X-Forwarded-Encrypted: i=1; AHgh+RpboNXYaSyW/OcnMMjdkI9bH3UEFiQK5VpJndGiSmf93siKNBSqe0udBQ+3rA/DOpV0kMA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWzqUwWxE0TECaVCzJQQaLtQ+n+hKF3H0mUPLC1eP5zwKlFc/f
	r+xnS8Xrcn7Cn9Zs+hTyDA/MaJu/1H+L34xU3FGjMnJFqgQSFHoe7zRZ
X-Gm-Gg: AfdE7cn0Cbow2MjO8iucds/28SaVy8n1beE0n7KR9qMBGNz+VqQDuzXaXh5q3L3jDeG
	kBWp0rprMkkAceQl8+NNeRoQwp0qbOQnHZn1M7mVLHx57giKiWZ0CCfYdS3xdZAYY0rd5LkHR+S
	LajCAhAum+5uEkJEHL4w4ZHA5MPIWVQxdO9atlAMWUx8iLxj1ZlNndXU1x/X3rY6b6ALgOEsk7B
	4iEdtJbUQQfkdhcEaWReCGS75F1D7CcE1gNDbhHJ7coYiWbV66mnNyOgdet+fPxtgYNf6r4mHZE
	DKURSMDBOT67rjbGSucF9/rryuACpSJdCvTEgtRmrnnOkuCDMsN3h1KaIwgsZPfwpbzqqMAtASO
	pDsZez1gm6pjcDdSIRwh/EnQY3g6qhabsd9JBlb64q812XP1+6nmW2AV+Ef6HA4O8IP5M0w==
X-Received: by 2002:a05:6870:b3ed:b0:455:c1d1:9cc0 with SMTP id 586e51a60fabf-456901aa97bmr914974fac.19.1784283053390;
        Fri, 17 Jul 2026 03:10:53 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4568e61cee3sm970024fac.9.2026.07.17.03.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:10:51 -0700 (PDT)
Date: Fri, 17 Jul 2026 13:10:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: ziniu.wang_1@oss.nxp.com
Cc: adrian.hunter@intel.com, ulfh@kernel.org, haibo.chen@nxp.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev, linux-mmc@vger.kernel.org,
	s32@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, harshit.m.mogalapalli@oracle.com
Subject: Re: [PATCH v7 8/8] mmc: sdhci-esdhc-imx: fix resume error handling
Message-ID: <aln_pFNqL8495Y_a@stanley.mountain>
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
 <20260715071818.272318-9-ziniu.wang_1@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715071818.272318-9-ziniu.wang_1@oss.nxp.com>

On Wed, Jul 15, 2026 at 03:18:18PM +0800, ziniu.wang_1@oss.nxp.com wrote:
> From: Luke Wang <ziniu.wang_1@nxp.com>
> 
> Check pm_runtime_force_resume() return value in resume. If it fails
> (clock enable failure), return immediately since accessing hardware
> registers on an unclocked device would cause a kernel panic.
> 

The commit message says "would" which implies maybe...  Is this something
that happens in real life?


> The early return intentionally skips enable_irq() and
> sdhci_disable_irq_wakeups() because the IRQ handler reads
> SDHCI_INT_STATUS, which would also fault without clocks. The PM runtime
> usage counter leak only affects this already-broken device instance and
> is an acceptable tradeoff to preserve system stability.
> 
> Remove the return value check for mmc_gpio_set_cd_wake(host->mmc, false)
> since disable_irq_wake() called internally always returns 0.

I kind of agree with Sashiko here that keeping the check is better future
proofing.

> 
> Also return 0 explicitly on the success path instead of propagating
> stale return values.

Unrelated cleans...  :/

> 
> Fixes: 676a83855614 ("mmc: host: sdhci-esdhc-imx: refactor the system PM logic")
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 290a3172931b..18f4905c15b9 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2123,12 +2123,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  			dev_warn(dev, "Failed to restore pinctrl state\n");
>  	}
>  
> -	pm_runtime_force_resume(dev);
> -
> -	ret = mmc_gpio_set_cd_wake(host->mmc, false);
> +	ret = pm_runtime_force_resume(dev);
>  	if (ret)
>  		return ret;
>  
> +	mmc_gpio_set_cd_wake(host->mmc, false);
> +

copy-paste-checker says that similar code exists in:

drivers/mmc/host/sdhci-tegra.c
  1879  static int sdhci_tegra_resume(struct device *dev)
  1880  {
  1881          struct sdhci_host *host = dev_get_drvdata(dev);
  1882          int ret;
  1883  
  1884          ret = mmc_gpio_set_cd_wake(host->mmc, false);
  1885          if (ret)
  1886                  return ret;
  1887  
  1888          ret = pm_runtime_force_resume(dev);
  1889          if (ret)
  1890                  return ret;

In this case we are calling mmc_gpio_set_cd_wake() before calling
resume so it's surprising that that doesn't cause a panic..

  1891  
  1892          sdhci_tegra_program_stream_id(host);
  1893  
  1894          ret = sdhci_resume_host(host);
  1895          if (ret)
  1896                  goto disable_clk;
  1897  
  1898          if (host->mmc->caps2 & MMC_CAP2_CQE) {
  1899                  ret = cqhci_resume(host->mmc);
  1900                  if (ret)
  1901                          goto suspend_host;
  1902          }
  1903  
  1904          return 0;
  1905  
  1906  suspend_host:
  1907          sdhci_suspend_host(host);
  1908  disable_clk:
  1909          pm_runtime_force_suspend(dev);
  1910          return ret;
  1911  }

regards,
dan carpenter
 
