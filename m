Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F6515EFB1
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635342; cv=none; b=qzcCq9rgpwb2gosA5EK9xqxA+6wXQq1P/AVtMlNBO2oRvKXXaOTKgoyOXcSXFhabDSeILtFRcOFyPwYnb/rx5QCHK1Nzt0I8W1av5OWHMdx3IWVixRCntQtbiFDzjbIuvZFPvW28ad47SR1PU6pfPiph2xXet9j+wSkPapSLR8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635342; c=relaxed/simple;
	bh=JR4bM3IEVw9/uptU8LIQo4w5Uach0rp8uHcOdCmDgt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vwby05f1twPpQtIlJjvPUx7xws+aZ+pHIJ7tSuQPF5ccJ+kbwo1GMK514AHtqx8Zh9wWSJmB7bwfoGJwJWoPEYCjtyuewBPGB+UW96A9m/5zUke7WZIA0hGGJj00774//T0kIgzYObyli3P/PycqNPd0V9Yiy4IhJBDPuFKNmLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k/p2yCBv; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k/p2yCBv"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-37597eba356so17136435ab.2
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 07:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718635339; x=1719240139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PEZjeteQXfzQdcWVQrn0yV9Qj7kNGp+WUXl9yT7pJIM=;
        b=k/p2yCBvTUx4Isv6qhzRsXaUPRxrSehYyl57jI9yeCue+uQB9/+5vhY4nayNlbP+lY
         Br0HkmGh3nDCUhPebxxAzw34xd5wbVLMZrKU+hJz9HzGi/fn/jpwMgA1EqI2Z6vy091u
         pHR+stRYWPKniUPtT1pT7H91eRGRv26izk8OkylDTgh+iS/u3VnJccyME5HBuR9iGUP0
         E3rj1Xy5U+Ob03eJIaOI1dvu+zlQwFb/2j6FB+tC9QE/jO94dI+R7nCOCiseYSISiduF
         n3KLkjYmX9zhtLnTlUSrv6F3xGyiFD628tZdQBHLeQAMQsgYuImIuyafI95W7WB7OE2s
         xj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718635339; x=1719240139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEZjeteQXfzQdcWVQrn0yV9Qj7kNGp+WUXl9yT7pJIM=;
        b=JjfkAZ6+cCx0k+wZOZNg/46mUAZD2R6tfYA9Ti9wHNKXEyDAK4gquqPKh/e5EyIEua
         n7RZgCq070n8CXH8FGaymMV2Kqw9bNbMOfOcfjfkeI6pmseAw5kx+gRHwOqZqSrUcLMd
         anaHeMl6+L/PHK1RAojx1TtVtETena6Hdlu9P/oOSLLHWJw+wOS7iSf8WGB1TTjzABaN
         fZ2cSX6aZYDzMoXhITQs4lBz3VKD2XSe2U4ILlPwSSzkpra6lLL9HBzFxwwpd29doMX0
         TxbdSe4qAXy5JGH6xGlUM15pTl+fdAttXzAi7j8gnweJWsQp3Bjz4g1QO2RZS/MQDin+
         h73A==
X-Forwarded-Encrypted: i=1; AJvYcCWOQgaC6ceN5m0SdnvrfLkFFxzY8wEVqah2GzEu2dgp5SuL6bm0HNO1iETYB1Kcvl1ocdkyiCOKG4f3WQ57sDaQvRtg
X-Gm-Message-State: AOJu0Yx9aI51bu5irrDXSyuBxXmtrxQEwyJE/nHvSsohHIR9PA0/qtqo
	zB7vXAddy0u2kddnwmpoXW8gAfSWUUQy1Y2BZGlhLu8mH02fxZ17+lozA2Etp34=
X-Google-Smtp-Source: AGHT+IEYXBLlZaTCF/KozlYWXmX+1dC92NpMDk5cKK1l7LyVT2phM7sLrhcf7MZdinEAwBHySA2uwA==
X-Received: by 2002:a05:6e02:152e:b0:374:8928:83a4 with SMTP id e9e14a558f8ab-375e0e30792mr118277925ab.14.1718635339363;
        Mon, 17 Jun 2024 07:42:19 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e681:7328:24ae:62a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fede16ad2fsm6720686a12.32.2024.06.17.07.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:42:18 -0700 (PDT)
Date: Mon, 17 Jun 2024 08:42:16 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix refcount mistake in
 imx_rproc_addr_init
Message-ID: <ZnBLSG/Yy1E4A+Og@p14s>
References: <20240612131714.12907-1-amishin@t-argos.ru>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612131714.12907-1-amishin@t-argos.ru>

On Wed, Jun 12, 2024 at 04:17:14PM +0300, Aleksandr Mishin wrote:
> In imx_rproc_addr_init() strcmp() is performed over the node after the
> of_node_put() is performed over it.
> Fix this error by moving of_node_put() calls.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores booted before Linux Kernel")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
>  drivers/remoteproc/imx_rproc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 39eacd90af14..144c8e9a642e 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -734,25 +734,29 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  			continue;
>  		}
>  		err = of_address_to_resource(node, 0, &res);
> -		of_node_put(node);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
> +			of_node_put(node);
>  			return err;
>  		}
>  
> -		if (b >= IMX_RPROC_MEM_MAX)
> +		if (b >= IMX_RPROC_MEM_MAX) {
> +			of_node_put(node);
>  			break;
> +		}
>  
>  		/* Not use resource version, because we might share region */
>  		priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev, res.start, resource_size(&res));
>  		if (!priv->mem[b].cpu_addr) {
>  			dev_err(dev, "failed to remap %pr\n", &res);
> +			of_node_put(node);
>  			return -ENOMEM;
>  		}
>  		priv->mem[b].sys_addr = res.start;
>  		priv->mem[b].size = resource_size(&res);
>  		if (!strcmp(node->name, "rsc-table"))
>  			priv->rsc_table = priv->mem[b].cpu_addr;
> +		of_node_put(node);
>  		b++;
>  	}
>  
> -- 
> 2.30.2
> 
> 
