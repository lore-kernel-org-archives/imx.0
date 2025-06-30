Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0808242AA4
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302595; cv=none; b=RSS23QhJ/mw7aO142mV04oh4jEAuoHMeihID9VTuMx1yqE30wGhvL5e+ZOKxthockGlwqJLO81m0n2Co8s7ou+XOQoPPBaGk9kKmHhx/sAnwE1iTXcqqGpmpdq3c8r7HMg1QWZ5INES2JY2taFklFVxrmxXh/mQ2FYfI2fkEuQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302595; c=relaxed/simple;
	bh=QvWVQDEMrJPEoKCjlEPBqgdJEtzpm/ZPTWF2ZHyA28Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DW2Xn0XVyCK3h32upMjSNlc6SBk1PDlGSV69ruNgKGTk3JFPo8hN5oK03w9Es6bm6L89U5bV9ZeWX+WQK/WHM+bP/pLOH0N3fkyy222z8tMk2PTT8/TXCStXFUfPg2FNoFh+iczWNRVtkcve9aYQj5vBmiQTxRBSdbhag9+4JLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TA4rjftU; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TA4rjftU"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b1fd59851baso1906865a12.0
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751302592; x=1751907392; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WbkSOKv1c6+ZeTPPDtxvzHXfz9bRwbs8SlvC2AxNK4U=;
        b=TA4rjftUHQkCt8q2OKgOPxDl0tIsUyQGXPDaMSHxsfLA4Co7OzWkTwDg9Ifeq5JYX/
         G1bOswPtsbAzbazvbtSrAgbY2G1NzQFdcvvRlQagHAk+WfS2ykko+69xMcdtdgvQ2Aiw
         xwCRRMRKdwHH0ODgZkKc6YWy/QcS9HWBzIG48zeGSOBVaKC209K247s6dAI2wbYv6AOl
         41rJ5LQNBw7jG3oqhmpux/VTr8+0WfHc2e+BS2nsJYHjcOQZ5U04GgdSkUgfGRB6ZAeS
         sVAdR8mLHJp2f1NquONTUdpZ07H6p9BsDm2m7rtTQMzAZK8Licf6F0PnkaaOAwZTxekj
         bYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302592; x=1751907392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbkSOKv1c6+ZeTPPDtxvzHXfz9bRwbs8SlvC2AxNK4U=;
        b=J0wP5pf6uQkhwGphIwtPJOOPUFSCGdxjiDoKCh33sr5A8HM7Jy1dVVI/mdzL1fNml2
         b0h+Uddy9HZ9JaAYl8Us8v7nEf+sJIYML+YPouQPPfhgwYMxl2Ksa6JoQkL5ax0isGS+
         PSLqM9nRFT21H7fVO2PhaFE0FzWWRcSUrL5By/gpb2es7Yzsi5PUJMgV5O+Y5Qt7yjbe
         Owi4HxE4ImGw2bx5EWUl+L8oMnP26/zV2iU+uvEpPoZ4enHYvT6gOoclSjj0dLwYE7Jd
         rn3XydjF4EYqJmrL5OPXgSGjmqHT7CfVybTcz9p2P1c91OzAK7QGRVd6T5/zuGeoMsFO
         DG4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+0Mx8lFvsKtYve3trjUS/a8JVvSNzceV5l9Tds3WA41MNzbxGGkF+GS3LAoAUQOwb0KE=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb1boAX4c5NdCJhMnTMXMriSgOO66N/+Adw4oO7VY5fTj3SDNs
	5TS6BozrQNdMtuwItUknVT1w5An7WFPmnRmt2EHX7niYDLZRkxy/r9AKmrDW3il32qM=
X-Gm-Gg: ASbGncsTjY1EBJARZWm9M2MQqogrHfIGH6SbPNwATyJAO2o04u4PR2LfEHJMUFvhrbn
	m1L3JO+MzKXdTpWCpbyoz3VCPHSi1qQiHzG9Bcs1+oYQcEGKOSGTFsI6WXvHtyCeHKjkUbB+mHM
	nI3Jen2yj1GVcxSsQpCXj3uzM7EjI/QTqeWgNYx/PdKhl5NkkHDMeET86lC+nO6cTvaLs9CnaZb
	meXvNuyI1nSol5gMXDbEJn7sWyuIcjCcyeDybVgnd+2hygGB/Z5m5idigJMFdioQIqtTCn1J74p
	SzlVdzRzpDExX4GkvbjdLGtTzKboQfQ63xD9bM39uoTZVPS1sLvw3rvo488aYZ842g==
X-Google-Smtp-Source: AGHT+IGWDgD+VJi4svWBlq3PHDkqo771atH5H1zxELbsknAHDzHX9IJdZF8QLWZ//OrPu/7q7cX3qA==
X-Received: by 2002:a17:90a:d2ce:b0:312:1ae9:1533 with SMTP id 98e67ed59e1d1-318c911beaamr17432196a91.1.1751302592257;
        Mon, 30 Jun 2025 09:56:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3274:25ba:45cc:d85d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14fd6a9sm9115056a91.40.2025.06.30.09.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:56:31 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:56:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
Message-ID: <aGLBvXtSRlaKujqM@p14s>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618062644.3895785-3-shengjiu.wang@nxp.com>

On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> Add call rproc_coredump_set_elf_info() to initialize the elf info for
> coredump, otherwise coredump will report an error "ELF class is not set".
> 
> Remove the DSP IRAM and DRAM segment in coredump list, because after
> stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 9b9cddb224b0..9e7efb77b6e5 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
>  					   att->size, da, NULL, NULL, "dsp_mem");
>  
> -		if (mem)
> -			rproc_coredump_add_segment(rproc, da, att->size);
> -		else
> +		if (!mem)

Flag rproc->recovery_disabled is never set to true, meaning that since this
driver was introduced, some kind of recovery was available.

I worry that your work will introduce regression for other users.  Daniel and
Iuliana, once again have to ask you to look at this patchset.

Thanks,
Mathieu

>  			return -ENOMEM;
>  
>  		rproc_add_carveout(rproc, mem);
> @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  		goto err_detach_domains;
>  	}
>  
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> +
>  	pm_runtime_enable(dev);
>  
>  	return 0;
> -- 
> 2.34.1
> 
