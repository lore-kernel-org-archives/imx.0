Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DB128C5BD
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428462; cv=none; b=fzm+i/4hw3hUDBpzmCo9EdpAzt+OFfleCpsUldeuVzQpLFRginCMvUklhiHo9p2Lco/IH9lW37tXum2KeiivsHRg1RZ9uF3gha86OVW8sPhSsG3vG4GhO0i/iEJf4JTFr9d91sp4BU79d3K0RTOmD+c2lmmkHUMWWxAFMMqqUCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428462; c=relaxed/simple;
	bh=ILiHc9/+BLsPr+gKDiQnsPeVsRDiCp2pGP2GK0KliFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqDzbzbbL0gd4soZDNsI6Xqze0iCTOrY1NHD2LqHj6HsA5yDlTlvt98nJUpPvJVNc6IcosJwjRI1ixdxC+kQWes1okhOwuq+8XD8jQufuz/uRPd4djjnIE8NFPRNjZZeXWg6BPta8dXYMBy43W/BM6HzY3oPgi0jsRKpu7b5uOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gO5nS+gl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gO5nS+gl"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so26841b3a.1
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745428460; x=1746033260; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QLeLRBd3ajsa68hrbyTw6z9ffqfpFHy6lvXZYFIJp+Q=;
        b=gO5nS+glo6N3oyIJqxnLTvosHS4LeC5lZSeU5EO0rahJYO9yvF1fhJeS1buB0wujMO
         UgXL+9L6tyfgccfwhvdFHRSQWZVq2Ftc3sKuyP2bbkCs/aBkZIZb6+N/PDpECENO3xgM
         mdZFO6bFoaTYA0zIIi/VbdMbE6X0rGJHHYMrh6Tlze4l0ceyACcvGLnyoiu7hK5XyOeT
         5mllFFljjkURQd7kpEkLWbXwMCcBm2BKimE7vHHDSg6YQPpr0iBjXlJuSJlL0iTtF1DA
         nv8fZ9in68t5ApBBFDdxDY70jmrHAm00NlgmaudPwVv+A7e7GlH4DrWBfr6tS/hVScKa
         RloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428460; x=1746033260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLeLRBd3ajsa68hrbyTw6z9ffqfpFHy6lvXZYFIJp+Q=;
        b=tJOp4cbQ7aEnOKDZ61cQrkUzHul4gxQb3b6PNWgftKxgXyBeqSycHy33BtcYM2JzOA
         CiIkVUHEPPqCkEp3dkJhxpP27j8RkmwiAGZK7/ruCpSyuWCfcq59DyQeEQ+qjw6xgkBD
         z1uJheVJWlQCUthDxVbUS2Qn7hGI5wuj//dIC7qFreGhPKwlhG31aBCpl7+aG9mkAjIg
         r7AlQ6I7OYT/fS81XaHgAdFCw1OXaEkn/6rbEm672xc4FZk2M89sXWRZzKO1yBUVavNR
         KQaUbVO9F8nWzhzS0jrfBwhA/FPvOIWB8v41MGzrotutJSQbAJF6gpZrfRXzpd37+6z/
         oTLA==
X-Forwarded-Encrypted: i=1; AJvYcCUFyUjpFg/xjLKw5YCdPYH3xhFrnP2QhQRnwTLYUQPaz8+0mjVnEauhfkPjvvMIHxxidCU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlgOOjUfJaNGt2u+M7s8d/SDTDmfoOG84dNnm0lQPhu7gKguno
	uFskQVPeilJ/HdTHwQWTx0XFIL+ZLqDl+aJLXpNqdR3HW6tYXeL8XNoYpNbXCFY=
X-Gm-Gg: ASbGncuHfjiq+dAy8mq1CdBHAJzP/Rh2jwVfpRNF19MhCPh4v5RDMyArSngSaP2Yx7f
	hRwya5YIWafpir5IwjBmNyTYdKzETDhogsvK3aKUKkoB20ggFwYVn0p/yGVDO0oMMtNZhIG4czo
	t2OsXWfJuXSmJI2qdDTQGzmexJ1CLhxY4CHObE4eaOoaB4bGheORi1xnlZHYwcK/7symo8Rgutt
	13eH+7ZI4VCDzaXjjbgUq9WxWhj27O2cTW136/Z1JCEqFiU+TCnTcGzeQwrMvkswzPkaUrc+hcN
	4E1GgViJJCfksPPQ/avTLs43/yyKgrNYkjsIZDaZKGQ=
X-Google-Smtp-Source: AGHT+IFAdKiHZtT60k9AyVm2AcUDq81Ye1OBOZptRf8Zz0DnworMkFqtL7ZoS2eCNp44RT+dD3uaJA==
X-Received: by 2002:a17:90b:3a0c:b0:2ef:31a9:95c6 with SMTP id 98e67ed59e1d1-3087bb56439mr32154912a91.14.1745428460444;
        Wed, 23 Apr 2025 10:14:20 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:11cc:1a38:e0c:9482])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa0a9dasm1908698a91.16.2025.04.23.10.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:14:19 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:14:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com
Cc: linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with
 devm_clk_get_optional()
Message-ID: <aAkf6bxBLjgFjvIZ@p14s>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423155131.101473-1-hiagofranco@gmail.com>

Good morning,

On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> The "clocks" device tree property is not mandatory, and if not provided
> Linux will shut down the remote processor power domain during boot if it
> is not present, even if it is running (e.g. it was started by U-Boot's
> bootaux command).

If a clock is not present imx_rproc_probe() will fail, the clock will remain
unused and Linux will switch it off.  I think that is description of what is
happening.

> 
> Use the optional devm_clk_get instead.
> 
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..45b5b23980ec 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	if (dcfg->method == IMX_RPROC_NONE)
>  		return 0;
>  
> -	priv->clk = devm_clk_get(dev, NULL);
> +	priv->clk = devm_clk_get_optional(dev, NULL);

If my understanding of the problem is correct (see above), I think the real fix
for this is to make the "clocks" property mandatory in the bindings.

Daniel and Iuliana, I'd like to have your opinions on this.

Thanks,
Mathieu

>  	if (IS_ERR(priv->clk)) {
>  		dev_err(dev, "Failed to get clock\n");
>  		return PTR_ERR(priv->clk);
> -- 
> 2.39.5
> 
