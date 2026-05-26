Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201AC3BB66C
	for <imx@lists.linux.dev>; Tue, 26 May 2026 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806254; cv=none; b=ppg+4DdwjM/kUcA/mcR2rOov3n5GoUotDt7tokV2PxMsWpvOhoOeyKtKVUiWdXW0lLbPrStf0YQwGIzNxhDC57q3lo0a25GFaNZeBWGR5vVxAs4Oz8wTPjWUp2oVlE+Tp1mIfUpxGsmLThg4JjK/LtahsOGD54xc3IJuyh0WeP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806254; c=relaxed/simple;
	bh=oXGhJHtn4nuewfbu/FUrIXGrSvjdsxHUN28rYJIud/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNxLpV8nMifhyL/+5lxDYqQaspGVj+pTHkgXtVj7W02/bhaCcnP3iFolPWlX584HibXnapj5xnCuqHK7EJOQEwTE/t2zYOOYP7i01vYToSfQC9b90TtPafKi285qSNSor2us5ePc5QlgObtU4d4DWbVXqbEDPSK62DIGLXsvsV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AE53nsQJ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AE53nsQJ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8026aa4d53so7838962a12.3
        for <imx@lists.linux.dev>; Tue, 26 May 2026 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779806252; x=1780411052; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1yp634tqUfo6PBP0qI63tXI5mNKD5loNgpNN/yTOqwI=;
        b=AE53nsQJ28y2qATmtEy7mTxo0HgqGJSawAB04dPs+DqtSi7ksO3UDDZ51CelOqEOkk
         bjTgEQ5zNrqgGZGZ6I5pEtJnt+/n3R8ohWMssqGCmZqhUOzmkveiUGRl/6dMOiwEjT2S
         mRDXBXbDg2Jbifyn+DtYCZQeBjHl1u5ybWElCMY/gL1mZlIUUZOT3uAU0ArufMF8i5ko
         nQRwABGmmB65u6O0kspxQSiUAxo7WKC/44d6sAlTSlngf1z2JwAoeMdY8ifsNMMtEGLi
         CA0+s94jJXJ9hVw4n6/IsAhMXUdnwPd4Dy9DajFlyG81jgRJ0jlgHHEgQejbpcZRM4l7
         O7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806252; x=1780411052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yp634tqUfo6PBP0qI63tXI5mNKD5loNgpNN/yTOqwI=;
        b=FgYRSE04w3XzDzUUpFsQO+7fwvxkb56C9+dmvqmplvBKSs658tizA9UGZv6p/e9U5n
         HCLDXIj0vjU38UQ9WdzfGzZn8tRYnNWZk9mcXaYOp+8+bNtMRpJapGMRJW2k3y7jwMVh
         tNsOnudHF2lwEbO916MceiCJi0d3H3MjIzvC/iGoAPTsoab4LkIdT0hhlWaTsXFNaL9d
         YemgDWTtxoPyGWTVZpbs70ztW+4TAvaWf53HkCpdewOiSHiZgE9faVOW6GnwiEe1GAkr
         WdJMM2BsG3donDR1BNuQy0yzhXqjt/stved/aml8y2ki+jPeyw8ryHbLb4MdUawNQOv7
         8Eug==
X-Forwarded-Encrypted: i=1; AFNElJ9ymRQXUE6bPQHZ2ytY3rFIUD5tnjo1XCrXltmXSpkPzKsv1U0ZoujHvP00gcaDSZi14WM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaIH6e95O5epaUInn2MhZPKekaf4s9ANInWjaoYcsqErUgRfOW
	kedIVMdI/G8wkN965m0ppqbJZGKF9RML2bJkpGb0KGXCkQvjSlwq0pU/erCmNZzfHzc=
X-Gm-Gg: Acq92OGbNuSuQqxK18oAjr5ChN2gSRTrQ/t8Z2/vAVhHhx/EooKODF++NgzJ7B8A31g
	WYVINAIsS53HOcRMrowoytBwkYTGgBmTv1VPMf/dJ8IuMkcQ8Ghcm/kV7+DBGt8QVefTGJh8s1e
	jjphRikhcGCJLINAaSqzoMrkUl3WFpderpwKfm9gPmAFjznQOT1D5kmG+N8a8YTZ14nEtBKcKzk
	Qszch8j1/cUgqrIH8bsQjYomoFu5rVpqvwA/eUsjC/EjRTO5Nme6YuJYIt4sWTVcs1ETl7YyfjF
	7JCY9zuL9GklaVH/q0SHAZgLO2Y9F7eIlI2ynhJOUlQMzWSQzRc4BYJDjrWQzQMutRoCbnB0U77
	JLiL1JdzJwLM5f/gsk32WW6uXZNIS0qZ0o/SmxMmHP+2em29e/AiJhRpgM6wPRC2T2vlb/LTjLp
	lAGX6SVMvcIZJr5nzPDxYo9lzHpMI+MLkwbmzDsw==
X-Received: by 2002:a05:6a21:38d:b0:3b3:2703:11c with SMTP id adf61e73a8af0-3b328f4a929mr19843539637.37.1779806252410;
        Tue, 26 May 2026 07:37:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c09c:6784:4cd5:a34d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff3e00sm14900919b3a.54.2026.05.26.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:37:31 -0700 (PDT)
Date: Tue, 26 May 2026 08:37:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: daniel.baluta@nxp.com, Frank.Li@nxp.com, andersson@kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, peng.fan@nxp.com,
	s.hauer@pengutronix.de
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Use device node name as
 processor name
Message-ID: <ahWwKB0i1pjrr9RH@p14s>
References: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
 <20260508032016.27716-1-Jiafei.Pan@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508032016.27716-1-Jiafei.Pan@nxp.com>

On Fri, May 08, 2026 at 11:20:16AM +0800, Jiafei Pan wrote:
> As currently there are maybe multiple remote processors, so change from
> using fixed name to using device node name as remote processor name in
> order to make them can be distinguished by through of name in sys
> filesystem.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> ---
> Fixes sine v1:
> * Update patch subject to aligin prefix name with existing patches
> 
>  drivers/remoteproc/imx_rproc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index e8d239bef5c9..38713f6f1c50 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1356,8 +1356,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	unsigned long cpus_bits;
>  	int ret;
>  
> -	/* set some other name then imx */
> -	rproc = devm_rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
> +	rproc = devm_rproc_alloc(dev, np->name, &imx_rproc_ops,
>  				 NULL, sizeof(*priv));
>  	if (!rproc)
>  		return -ENOMEM;
> -- 
> 2.43.0
> 
