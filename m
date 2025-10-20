Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B680D26A0C7
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760974652; cv=none; b=fXbfspUOOu4c4etU3WBFZJaz4etCJowhMlDSLZJr1isFX2+NfeESM0UFUddNi0NcbGyOmEMdA7R7iMqbahPcR8Lf66F1Nn9E9oCRwQrkFuoG9DSEXcZ0hgM4EcrNP7IQAKvg1LxFzC4/SR/i8rW7zCj3m1j3G4GxqBkL7JHvSHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760974652; c=relaxed/simple;
	bh=uvtKdw8fhD9Bm/d4sfVL5BsOH6AlqthiaBj+rlosuKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emuL04huXAy5FWG8m9WHCgVaXmp7B7xHKokXW2RVtDeCSRlOnqRL1U4Ufn5SAAtwqdbNYesr3nZc5egIImOJqAkaRxZWIlQxrmQtnicIfzYUiqqfa09Kk0+UOr+WR79Bmcf6+42wj+ToL1QTTDBdtTy2/MkipWb3K7Ah0HCFkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eDuOHdf1; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eDuOHdf1"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-33067909400so3435094a91.2
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760974650; x=1761579450; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=An/szO/oyH3jWEETz4FjiP4MsyHyMfmUEnCotuUe/9s=;
        b=eDuOHdf1pcGPEPm2i50v0lmkV8Dj1Oy2t4v9L/k3Lip63ebX4xtMpjxxwR2ZLQZafb
         1YrNBQ6QxKTE4TTMfvyK4frzA+con7OOPz5SKQ5GknTBrXbT4MH/xR09hLeBNVCkOm3/
         hUF5GN6T802EvwEMRL2ntETmF47Dj6TExFz6YewvQ+DVmX1ahbQ4hpInC+UbPsY60wa1
         aCCt5+oGke8NODy7cVK/usi5WSlGmZXNsGrCRwEiFb2MbIO64Ex5QGO/9YqeWn9fncEl
         iOyl1JOn5UGZ0GgVqa1MWTN0wccmzOMvtA5kOFpDIk6v4TeDIK+GBDt6zYv7R10IT5uJ
         TwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760974650; x=1761579450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=An/szO/oyH3jWEETz4FjiP4MsyHyMfmUEnCotuUe/9s=;
        b=ciatZPHE9VSmai/Mxb3JS1WKSOmBfFh/HjQ9unU90k1rX6e+8g86MogmvqAmZaDBKm
         xdBGdIexqrwjIRsJDjhwK3twfrLUhHezM3BYelg4fi8uyjD6tXW7Eu+r1ggwkkTJBPz/
         D7csIa3lCTQP8lHcTdImcVOti92d/ApmXpAqx8K8pxkJrGsjpyNDdmfyc4d9ZyqdKtHi
         XoFBY4POfHwkCP8R1EntoTnkaLKl6ELjHYAuad8Kywtme78kMVc8JHqc4xMtpCq1OHH4
         pHXIv+ItNIy/C0SNVkD3m1iOKz+edtiJamQmGL2OCQt5qSr3bbwfuQghaAdQk1ALbBGr
         IfdA==
X-Forwarded-Encrypted: i=1; AJvYcCV1DDk6sjOWMhpUDwU41nmMR52ZGfqOT0ig58MTqU/1YdKojoxdKKK/djIfu6RQXwvssaQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkjThFjFkbnWfK2mdMvGr/6Bh0v2RqluDR8AmCY0ozvKOri0iQ
	qBIlCplM8Nmg2HrxTPuKShZykf2lNQ8OxqMmgW8PfEhNxp0xdzcUQ9Pg5PcjfmZI67o=
X-Gm-Gg: ASbGnctx13QTOEPX8gUjCYn+Wpi7zYp25KOhYpL2i7oVGChfaYYTNajZJNPZVty1LlD
	5glXCG0BamQLkpWdw3vJYteSavdhWHgnwqPftZwZPjIhU9mnaNjBfW2A/hiBoHldV1BXhXUrejj
	BqWcq88XxRwHE7rLP4ix4UOYYg1Qe9e93tnXaLqD6TbreQlRGSfDt/di93cS+yTkvyAw8VrquQd
	sMSyDhw6RUFvDc6VsElylgLGjtCtfBPjq45UbjlZJnv+AY0BriM4jFX8aihz8CTlwHRPeplgrtG
	mp+8FGfw7rwTZhXn6kHWKDC2jfHVzcGcTyo84T5ETFphV/9zb2QkErXcfef6CNyzKjvmE4ci8AB
	53BZGl3USf1j5kb8b5X8mm7ZgMMT9RE/mGyr/sDuWrBsloHfBUldDBxKphDeUJcWCZdNMsgqFnx
	4VIcLOAWIZBfqcyA==
X-Google-Smtp-Source: AGHT+IEmsmD6amTLvHHE+2cwS/e0HUauPuXtYyoBUNl10cvdG4E4NSTe+f3ScOSD6PoiCIK82vESEA==
X-Received: by 2002:a17:90a:d44f:b0:32e:96b1:fb70 with SMTP id 98e67ed59e1d1-33bcf880809mr18130535a91.12.1760974650080;
        Mon, 20 Oct 2025 08:37:30 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2360:6c8a:189d:ae5a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33ba93cbb7asm6652052a91.1.2025.10.20.08.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:37:29 -0700 (PDT)
Date: Mon, 20 Oct 2025 09:37:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Enable PM runtime support
 unconditionally
Message-ID: <aPZXNlY1MK4--Q_g@p14s>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
 <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>

On Wed, Oct 15, 2025 at 09:52:57PM +0800, Peng Fan wrote:
> PM runtime support is safe and applicable across all i.MX platforms, not
> just those using the SCU API. Remove the conditional check and enable PM
> runtime unconditionally to simplify the code and ensure consistent power
> management behavior.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 820b0cd5adbb17ce5665e7ec2786bca23f1a67ea..25f5cb4d414eabed7a166eb2a8ae5e20b6b4f667 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1119,12 +1119,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  			return dev_err_probe(dev, ret, "register restart handler failure\n");
>  	}
>  
> -	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_enable(dev);
> -		ret = pm_runtime_resume_and_get(dev);
> -		if (ret)
> -			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
> -	}
> +	pm_runtime_enable(dev);
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "pm_runtime get failed\n");
>  
>  	ret = devm_rproc_add(dev, rproc);
>  	if (ret) {
> @@ -1135,10 +1133,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_put_pm:
> -	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_disable(dev);
> -		pm_runtime_put_noidle(dev);
> -	}
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
>  
>  	return ret;
>  }
> @@ -1148,10 +1144,8 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>  
> -	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_disable(priv->dev);
> -		pm_runtime_put_noidle(priv->dev);
> -	}
> +	pm_runtime_disable(priv->dev);
> +	pm_runtime_put_noidle(priv->dev);
>  }

Daniel - what is your take on this one?

>  
>  static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
> 
> -- 
> 2.37.1
> 
