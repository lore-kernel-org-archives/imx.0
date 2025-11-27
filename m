Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946DF3358D5
	for <imx@lists.linux.dev>; Thu, 27 Nov 2025 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259355; cv=none; b=Faclyb24r81aoBE9dd5MkpFgxCJ68J/MAGW8EZeWWoJoO+foN5MeIgV/DL9J2AsF8IMHsOKgxaYOWICnQ9GUKA+6YDNmQxsU6xhdqiCBsxC2UDP3hjTmiP2beRuycuL5E+G2ZNN10oZYjnVNqEJzFzBGPs06QI1oc4nvMt+B/mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259355; c=relaxed/simple;
	bh=vyTrsB1e+2MkE4MM/o0IDxBEJy6eYzaBtOBs5fod1Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gO1GFtweiIVyn5yMDpFE1yZh38Rcjc4kuAWCvRkTzcjJk0Dio8x5lV++s/Ziu9qIAHSuXDfLDOMKBkWOXYCnKvbPh/xmaQH2RTbsSz9UANK7jo8umzlhBsU9Rs78DxOEwnWTpegXeScWXOaUPhdnhH/nYZHb2pBH+8/90FCUQUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gIr9BfAW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gIr9BfAW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297f35be2ffso15503745ad.2
        for <imx@lists.linux.dev>; Thu, 27 Nov 2025 08:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764259353; x=1764864153; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mY7k8e6rh86X1KFsb+QPer9lTYgSo+le4387o1pHLfg=;
        b=gIr9BfAWzq6531RczLucjB9gAoi/RLD1efpEOfj8uR854aICzx2oL0mD2fG+FjKrKj
         ZId/8T+zVL2IFtuJBj4lb4xuxsZggPBm1lEBwIFknpePgNkfjKNVxeH1tAnRSlNuCpu/
         HVk6FQ62avfe+dcIC6f+MVl4JZenWvHtmOCqAVe95v0bAk53mQ4G4qZesPShvbX1cTXn
         zTLM1/reN6MCsCp0sVrSHDmaxGYJRw6ee975iiJ7r+hLE6qpBv6js7uL6IHwKQTatgVR
         sdJwTjzGPSz8/h/lbGRyYk9eyfv3tk+L04ykDdyZ15f21QJ8SNK5rocfr1bM2se9t4dW
         l4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259353; x=1764864153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY7k8e6rh86X1KFsb+QPer9lTYgSo+le4387o1pHLfg=;
        b=JlJxDm0dnBeVxjjqtAHOVajkqzV6InkaszWTxTkTiQlkJJpzCifziaGvcQBMKquqV3
         VYY2P0CER+bErY5t2MwMmBmCym8CuYCiol5g+dcAThpqycDBzKIm+UMDrpUUQV4Uz2Wy
         dhOUbVBzZJ3J5gugnnfAwwW4rflrvnXTJc4n3SCV8Rf10izZcigU55Hml7DpFDWbvMBU
         yIygDTpgcjm+tGGuA9Ke4L2Dgj1QBvYQ/EgJTOrm0pb9vegD54gsHsX7enWvwNizLkaj
         QCX2cGvwZOXv+EDcxsgANYUqZnQGyum2umqQSO1bwFQdQ18mj4Yq1z57dDWoFfS+4x/n
         iJOA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ8LPZwOOuOsDfYPZ/X/K7HehkZVRh35DdVy6wh3GU5JUs4dzS+prwlnF2BpnVGwpp+2w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDLDVoOgHUt+1+tNMXNcW4Zq/pmqCxTEydTNMxLcBQXlqYlwBk
	cFg33E20bgz8m4+UoYV0JoAzWSqz+VcZ4KPvzkhZ+N18f+48bpu2CGMWQmv0huFa3XQ=
X-Gm-Gg: ASbGncswi4rz9hvPhSXVFcGnRTwUhBiTbvTp0ouuLGVnLlNZk3wx632179ELWTyPLrf
	2Nrd3Tsfy1wphlcICUqKpeYBGmYCzg79Twy5ZRr7iSaRJ0VwPgzx3KY1RFZctaKvu4mukSauxhP
	mq8NQm1Cakh9iLRcUvHS6fdNDP76RJ0eXRaIhUt//HS0mb7v8rgBXKpwsjWcR0uMMCCjKrUY3AF
	HYBt11TjS84T7HkLzJG+Pwoi7RVVEF3uO1DRLurJnAFhXdp6FYYl012JF25Q2BhxnYtbkFpKakA
	geGf5NGiUL2S7DcAzyIWzSMsyE1Wj/QOrsarBHkreeoZ5d8b/W2zO6jmgGICE9vkR58UxunlylS
	n0a2/WUjGifq0AYijpr8zbLwz1I1I0Z0l5RbTtYiGY5/aT3TyAG04D5b9WUNpouy5wceNaYYST9
	iSr30h1LBFJxMjQEKziSVNQ8D1
X-Google-Smtp-Source: AGHT+IEBS49WXHa1OQkXmOSzrd/2INN0XNe3pKmNT4J9ufCzVEdO1kJQ5meC0md/PjmvEoKECkjFdA==
X-Received: by 2002:a17:903:292:b0:290:2a14:2ed5 with SMTP id d9443c01a7336-29b6c3dc29fmr271962935ad.4.1764259352803;
        Thu, 27 Nov 2025 08:02:32 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9ef4:efaa:23ae:f181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce4703a9sm21523835ad.42.2025.11.27.08.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:02:32 -0800 (PST)
Date: Thu, 27 Nov 2025 09:02:29 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] remoteproc: imx_dsp_rproc: Fix NULL vs IS_ERR() bug
 in imx_dsp_rproc_add_carveout()
Message-ID: <aSh2FVTS8jGUSInR@p14s>
References: <aSf6OerBbPcxBUVt@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSf6OerBbPcxBUVt@stanley.mountain>

On Thu, Nov 27, 2025 at 10:14:01AM +0300, Dan Carpenter wrote:
> The devm_ioremap_resource_wc() function never returns NULL, it returns
> error pointers.  Update the error checking to match.
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index be83b5f20f15..5130a35214c9 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -710,9 +710,9 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  			return -EINVAL;
>  
>  		cpu_addr = devm_ioremap_resource_wc(dev, &res);
> -		if (!cpu_addr) {
> +		if (IS_ERR(cpu_addr)) {
>  			dev_err(dev, "failed to map memory %pR\n", &res);
> -			return -ENOMEM;
> +			return PTR_ERR(cpu_addr);

Applied.

Thanks,
Mathieu

>  		}
>  
>  		/* Register memory region */
> -- 
> 2.51.0
> 
