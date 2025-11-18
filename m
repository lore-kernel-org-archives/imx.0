Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28854299931
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 16:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483999; cv=none; b=WLzEvmI6cZXtANuhT7s3CBPYowKpCfTlip7p3mIIyiVqvQjUNSX91EyKLJCvQv+Fhsz7op6m8vDkW2TTp6tNznW6j6VPugozc21154ZtKwz46oLWo0Ou0Ivloy9vfV66a0kRroUJQjzNE5ignIvbKjyF46kF88XUfZLn5L9SlTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483999; c=relaxed/simple;
	bh=g92a+owQQJ0oobr4+N/9Jj+4Z5cJlQRxuQ3I+2k3zpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNSbfnuRnrnKlNWkXJYmTxkrjxNhjjU7Yqsx8bQzch1vhuGHh9h4b4qBKOwWBPkwz/mdz+GLi/D0pj/uA8xEXS0YyqrEJQ7XfWt/51OuR0sZNvHglCaGJCOossv66Pxnzavs9RnXvVnE4c4l1cHRdX2wZyyWTwoMiAvBMh8rI+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dqr7QFxM; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dqr7QFxM"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-297e982506fso69349815ad.2
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 08:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483996; x=1764088796; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0hOaRCXxV1SPJvrWHDqTT1g2cG8DJ5zjGu5g8Phj524=;
        b=Dqr7QFxMQkfCQ54q6+0HcGvpP2Lclg+yh9mO4Z5GETursB/xEv0k9GIH8jQbkSKzLy
         tj8csq2ukws9xJX53PTiPfHTsC2oO8Qs/ASbFDmbQDyMAW4T5lG8X7HOM4S3mhvQ4m/5
         RM7FkFAnomeJX5hu5gQzxDCW0NRTdnWfPW5zJK9M9TPvRTHexADI5mSk8wScDcB3F+e/
         C5z+RKebcHh2E/wB5k5OgAewjbXnWZcm6UL70uP15sCNMfgKj6Ba8m1B6nmaHHm9GD7y
         S89hd4QdmtvwAi5lfc7jZ0ngWTwy0HXu57Gg9GMcEz9jq8V7L5WYsp993R1qR5G6fNr+
         9uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483996; x=1764088796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hOaRCXxV1SPJvrWHDqTT1g2cG8DJ5zjGu5g8Phj524=;
        b=p0lvALO+fsfOQTJSdWeIaALzI+n3WWUl/wWGkb6kWd1BmbaEO98nmGPwFmTZ6YKrnK
         8NaLMxFdtdvWWt6ETLOdqHIzK+cTEstqW0YS9v9SwTgec+/hcCbA/I5L8jEKTAV0euIB
         o3zNy4/BJy57tDiKziaPZT0L/U0R/R7CzYi1HovlrG+gMm1gbVMRYkd6owgrEEBgO3aU
         wC0sEMgvB7sRrjDLkGfgA01Z20wwsJ7beemFUPawo/a/NTcoO0b8pBqz4RFjO3YYnz+1
         0h6Wxj43C2IwvptuXfqCFJY8pC65oapTw7ocyDpPk+qUuRKQZophwtX55jVmxCI86huy
         g7TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ+IXLwEGpM/o4WzqZUShpb329rP/LKayXcDJEI9oXZHcEnZR7hBWh+K9Zu91fFyUs5+k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiiyrrdPNzxQ1a0s2265HqmmtUWMK/Xm+Nog7b2b53TGLIzK+A
	fFXAR6avx1GrwokH2rNU/ltTISuEmDkO4Tz5WpqmQSNdt4IXoTHJknVX+vzADOFVP7c=
X-Gm-Gg: ASbGnct8qwnKxFYEfWLACvcw9CLJ41QhDLNBJUjx5lPZDKghR5HULVCE65zLq5c4ynU
	6lCoLsOIgD414OgTLsXW1XJm/s09FLZNWohv0awjf3RGMMiZF6YZlkCDgNXas6cr/ajehjH/ymm
	yDDiNN+ZBGdqxo055L4z2fGmj9ZlrZfBsn21pIHTD4UVbRidDzX+7p46ABEuAykXbIh+smeCOsd
	ROQZFwE0aAPAdgxuG+o5UJ+qAejeasCLjkoJElWFEP1NoIVy7FSROfJoAEozXGT9b7suMb55UpI
	pTHVivwa257HvQ+tkYsiddvA3VhB98/zDvumsvvyND898qBz4NfvielEn+jiz5boPeILgRxDews
	CFZINs931jyJHZ4+gqiXhwnZtNQ1Z6glml3lTJ4EcWlXfu7ONpPhIRuhTn9MWsPBN+0agjAXe2t
	LBEeg=
X-Google-Smtp-Source: AGHT+IFFlRKqGN0EFfOvRr2kyUDj7RRlM7hPl1xppO9T/OtL5bWQkM7hLz3RHkgvILrGF6je2OfB2w==
X-Received: by 2002:a17:902:f607:b0:298:1f9c:e0a2 with SMTP id d9443c01a7336-2986a76f992mr206752045ad.54.1763483996482;
        Tue, 18 Nov 2025 08:39:56 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5650:f012:168c:76e0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986e54f019sm143681775ad.15.2025.11.18.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:39:55 -0800 (PST)
Date: Tue, 18 Nov 2025 09:39:52 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 01/11] remoteproc: imx_dsp_rproc: simplify power
 domain attach and error handling
Message-ID: <aRyhWF5Wh5GxXsCg@p14s>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
 <20251111-imx-dsp-2025-11-11-v3-1-d05dcba737fa@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-1-d05dcba737fa@nxp.com>

On Tue, Nov 11, 2025 at 09:41:12AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Refactor imx_dsp_attach_pm_domains() to use devm_pm_domain_attach_list()
> directly, removing manual detach logic and simplifying resource management.
> 
> Also replace verbose error handling in imx_dsp_rproc_probe() with
> dev_err_probe() for cleaner and more consistent error reporting.
> 
> No functional changes.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 29 ++++++++---------------------
>  1 file changed, 8 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 6e78a01755c7bdc28cd93f00fe6f74affc3d96b0..c466363debbebe8f91b908b3bffaa32e9bf8b9a6 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1062,14 +1062,12 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
>  {
>  	struct device *dev = priv->rproc->dev.parent;
> -	int ret;
>  
>  	/* A single PM domain is already attached. */
>  	if (dev->pm_domain)
>  		return 0;
>  
> -	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> -	return ret < 0 ? ret : 0;
> +	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
>  }
>  
>  /**
> @@ -1186,35 +1184,25 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  
>  	/* There are multiple power domains required by DSP on some platform */
>  	ret = imx_dsp_attach_pm_domains(priv);
> -	if (ret) {
> -		dev_err(dev, "failed on imx_dsp_attach_pm_domains\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed on imx_dsp_attach_pm_domains\n");
> +
>  	/* Get clocks */
>  	ret = imx_dsp_rproc_clk_get(priv);
> -	if (ret) {
> -		dev_err(dev, "failed on imx_dsp_rproc_clk_get\n");
> -		goto err_detach_domains;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_clk_get\n");
>  
>  	init_completion(&priv->pm_comp);
>  	rproc->auto_boot = false;
>  	ret = rproc_add(rproc);
> -	if (ret) {
> -		dev_err(dev, "rproc_add failed\n");
> -		goto err_detach_domains;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "rproc_add failed\n");
>  
>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
>  
>  	pm_runtime_enable(dev);
>  
>  	return 0;
> -
> -err_detach_domains:
> -	dev_pm_domain_detach_list(priv->pd_list);
> -
> -	return ret;
>  }
>  
>  static void imx_dsp_rproc_remove(struct platform_device *pdev)
> @@ -1224,7 +1212,6 @@ static void imx_dsp_rproc_remove(struct platform_device *pdev)
>  
>  	pm_runtime_disable(&pdev->dev);
>  	rproc_del(rproc);
> -	dev_pm_domain_detach_list(priv->pd_list);

This patch is giving me a compilation warning.

>  }
>  
>  /* pm runtime functions */
> 
> -- 
> 2.37.1
> 
