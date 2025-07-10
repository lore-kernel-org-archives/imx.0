Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C312727E5
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752158888; cv=none; b=Khuzzr4LxAAE8u9ElDMvRHD2vRAxnR2FNM5j63KEp+epKdKSMHQlnC9nQTkNEQF/kwDttWZ4p4qCKJKO5zbU2gpvf3LXvh/HD5Q/WXzYFIO15D3TRPHY6D9n1UKZ2ZJK3ImzqSDSXvlYQT1Y4JVnRE7sp4OusF0p5vAdMciIxEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752158888; c=relaxed/simple;
	bh=2cIMHUhX+1c5+mkwL7rxFG92dv6iIfSQwLBq+uKyI9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dn3ocplUppEiJTzPp9lzbQInfvULvE0blB1+Fq4/vc+as+/oc3m6IsHX9Cr5i5CcS8D1hhC78fGi6YZOmClunUr1+xCddnuJRx9gJ6lsR7YFJ3wH4/+e3j1sxGh2b/TSaS9Ds/Zys9JOMdslgwdVEtPVEMtgx3q+1CL0i7507dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HzFhNP1+; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HzFhNP1+"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74b54af901bso760668b3a.2
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 07:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752158885; x=1752763685; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ccNFb5decGRIhbzkAZ9bEAXhYiv4SrqNXeSyqn4xl9E=;
        b=HzFhNP1+xX6OrSh9VZ7gbFRz4SXIuXtpYrVPj3d+x5HGR3HDODuxalb+IpFNGqbrOA
         CpAVzUyLY4GLgxwYsMCXNwgHV5FwzjNh6cMMDGjEqFc6Th5snM4ttiWBEXNTgEvC3rbT
         2Zm05tUsbuFiFH+WUtdzHTRDSrrfaBeqEPs41qvZ3dIO/TdfstmyktG9HzR8d3Ld04k4
         3zzsgzF/oKj6/dMYcIDpCZrLyQvjaqvrcrfzkCYKCsq55bRVelA/Tr9DpvvD2esG+2kh
         o5CEZ3TV2t3BVN/gVeHjYl7QzSpaq3DEC6OAUqoNsWHwc8OWCpyJlUw/gRG3FpelRs7S
         BFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158885; x=1752763685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccNFb5decGRIhbzkAZ9bEAXhYiv4SrqNXeSyqn4xl9E=;
        b=WaH2FLMjD8eISK/9SbFymjDLpqrdMA7dkzCJpkETxy+OlIxrogYBR20CEqfL/NxTFT
         ShSl5liGvM7CXde2gK3XSLEtoyfDHUrK4jdt12K9slr46Hw5A+uCKw2fMkoKystAMSEI
         O//Bz3Fmewr3RxvuQVkzcM/x/BWM8nRgoIoZnr5y9B7eM+yVbzNuDAHECK78VOZL7GuV
         LgJdLsj2W2cONxUiQK1XOVVXmrW3dkh8jkr+NGAvX4xf0Owx4WBs8IQR7e+w5wUmiAlC
         gYcVeFbRs0cbgc58HEsFcpSpr4s5q8NZfRJpE2syiXgfWnlKbQ44FXSqg2Johz0PU+qW
         gp3A==
X-Forwarded-Encrypted: i=1; AJvYcCVFuUHfdP3ybZ7DsB8AAJu6pqLoBhaO9Qhh60zRX3hGmPlb5tNODH7KsA/t5wr2SUkHNjw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8LXDs2/iJfesX8OrbW2xQA+o1ARmEEv7/8Af0xihKV+P1ojiO
	BSX0IEJBAYrNMucbuN5JmYLGUyAe2O17G4zNhK/zAQ7ascvRL5dPwxerdM6cYE+N8QE=
X-Gm-Gg: ASbGncuvFikbBFmFWekz0zQZE/kF6H54HeASTg5izT0UobnFEm4J6Zxr7QQhKqLVduJ
	DXW4+je32NDnUGB/9g8k2jAAeg7qz8T8UBkU+3W63ZrHVheMFlLSDMLdloZmUJTdG1Cvdtd88Qm
	mGKyemSQ4jIkTv7kYi69lwY5rMT9MCGaZxf4YqyDoVnhSRsEMxvg5TgoCQ4x7bEWc6WBZt3UYYG
	xNVcbxWUIBF+WhYJewg87g7JKwMr6nYZ4jN3DyCGkqkiCiriFvlCZ8eLNzpt+iBf6im5CsBhkig
	LzIlqi1HXjvQVhtx30dmjd4Fd7MzLwO4ZAVNZ4EX8BKKUSjfvYzqVYKyUFas1dtjDag7UKtfz5o
	=
X-Google-Smtp-Source: AGHT+IGKNID1gQGS7oI+kpuFVzsANRPvMDcUoQn73a5qDrhqS0bdqghfssNgK8KQOfs1Md97STuJ/A==
X-Received: by 2002:a05:6a00:1795:b0:742:3fb4:f992 with SMTP id d2e1a72fcca58-74ea64572dcmr9520507b3a.10.1752158885496;
        Thu, 10 Jul 2025 07:48:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3c1:4dff:9df5:b97c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe727e33sm2514249a12.68.2025.07.10.07.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:48:05 -0700 (PDT)
Date: Thu, 10 Jul 2025 08:48:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, iuliana.prodan@nxp.com,
	daniel.baluta@nxp.com
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of
 recovery process
Message-ID: <aG_SosukEqUxrHvH@p14s>
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
 <20250704052529.1040602-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704052529.1040602-2-shengjiu.wang@nxp.com>

On Fri, Jul 04, 2025 at 01:25:28PM +0800, Shengjiu Wang wrote:
> When recovery is triggered, rproc_stop() is called first then
> rproc_start(), but there is no rproc_unprepare_device() and
> rproc_prepare_device() in the flow. As the software reset is needed
> before DSP starts, so move software reset from imx_dsp_runtime_resume()
> to .load() to make the recovery work. And make sure memory is cleared
> before loading firmware.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 43 +++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5ee622bf5352..ba764fc55686 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -774,7 +774,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
>  	struct device *dev = rproc->dev.parent;
> -	struct rproc_mem_entry *carveout;
>  	int ret;
>  
>  	ret = imx_dsp_rproc_add_carveout(priv);
> @@ -785,15 +784,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  
>  	pm_runtime_get_sync(dev);
>  
> -	/*
> -	 * Clear buffers after pm rumtime for internal ocram is not
> -	 * accessible if power and clock are not enabled.
> -	 */
> -	list_for_each_entry(carveout, &rproc->carveouts, node) {
> -		if (carveout->va)
> -			memset(carveout->va, 0, carveout->len);
> -	}
> -
>  	return  0;
>  }
>  
> @@ -1022,13 +1012,39 @@ static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw
>  	return 0;
>  }
>  
> +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> +	struct rproc_mem_entry *carveout;
> +	int ret;
> +
> +	/* Reset DSP if needed */
> +	if (dsp_dcfg->reset)
> +		dsp_dcfg->reset(priv);
> +	/*
> +	 * Clear buffers after pm rumtime for internal ocram is not
> +	 * accessible if power and clock are not enabled.
> +	 */
> +	list_for_each_entry(carveout, &rproc->carveouts, node) {
> +		if (carveout->va)
> +			memset(carveout->va, 0, carveout->len);
> +	}
> +
> +	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +

This is a much better approach.  During my last review I said that I would not
move forward with this work until Daniel or Iuliana provide their R-B and yet,
they have not been added to the recipient list.

>  static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.prepare	= imx_dsp_rproc_prepare,
>  	.unprepare	= imx_dsp_rproc_unprepare,
>  	.start		= imx_dsp_rproc_start,
>  	.stop		= imx_dsp_rproc_stop,
>  	.kick		= imx_dsp_rproc_kick,
> -	.load		= imx_dsp_rproc_elf_load_segments,
> +	.load		= imx_dsp_rproc_load,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
>  	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> @@ -1214,7 +1230,6 @@ static int imx_dsp_runtime_resume(struct device *dev)
>  {
>  	struct rproc *rproc = dev_get_drvdata(dev);
>  	struct imx_dsp_rproc *priv = rproc->priv;
> -	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>  	int ret;
>  
>  	/*
> @@ -1235,10 +1250,6 @@ static int imx_dsp_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>  
> -	/* Reset DSP if needed */
> -	if (dsp_dcfg->reset)
> -		dsp_dcfg->reset(priv);
> -
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
