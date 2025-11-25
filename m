Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572B319F137
	for <imx@lists.linux.dev>; Tue, 25 Nov 2025 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764085522; cv=none; b=J+S/4rzOYkypW61UU8t9dsXc5F2k2HI3rqZXc/2dgwiy2phXxazCjQl+IUkhQ5AH0YRqS9Ni+Q2gC4Lf+JWErWPqZGrUNRkr9G51Dg85mjRmLUC7lQ9nsf4Smj9gtfmTnzIVsQX3hWK14AISHV0iYBbSstZz8uW6K/+sBdPWBl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764085522; c=relaxed/simple;
	bh=km/mz9qhpVD26vff6W0uirYPKuEm7lGI8++2YbpRwLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldOiSBPQlaYqbNLzeR2fQ1Yw+E3uBNo/NVPH2dPERzak+cBPOxROCWVtHNdA+3FezBj/bzL3J5GZi4AQw/uuWpT4wCJAGidyovDzQ/87iYm7OacaZFFnEvxwZPj0+zHN8YYjFZu6WrqThKOtpqAnZbJKCShCaNM5ZWjOLbUlzvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zSeh//2N; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zSeh//2N"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29806bd47b5so34592035ad.3
        for <imx@lists.linux.dev>; Tue, 25 Nov 2025 07:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764085519; x=1764690319; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o4ywU1WpmLZUzY6/ONaNewtf+72w32eJPzNc0pydRf4=;
        b=zSeh//2NGKKSCOUj9I+bqkXuAx2HZSQevecuPRS8vFm4OAKSCOliTG/WYLgIOH3dOo
         pcCzmP+ARTk/1/j0WEqJkublzUTJ6UfMXZPMG5svfGZPV9kuv9JC3pFZLbLKyVEHnW++
         qdYy1yWXy/6PguAQ8ec5gXX4PF4qOnpZxGOapaUfHw/zynJJEFzmyRk50lCvjnRdu5A6
         G7lJacjIOlpiyPglFsZspK7K9wx3uk/CqwkwGZrZmlQsT2Q04ysqtRxb8fbt7Xxrq+c7
         R8gPyPMGjPLh5uEt02Q3atfu/kLZNPIbYYm9fnY8N/Jd+BCxWskWlO4bv5AN4GVpa8V0
         rMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764085519; x=1764690319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4ywU1WpmLZUzY6/ONaNewtf+72w32eJPzNc0pydRf4=;
        b=bb1JRDPdylSEElEhC04uqhMW6thXmufXRia/uSPYeYwmBOW9wMc0/paFwM6RNHl27s
         x6Noe19fPaDlRdD0JQW1ocseZi9YN0zC18XaQi8SNWXOJav40oSylC0dNOQa5qkJSbyO
         mcVz1XiiJGm7VR1Oo474Kzjsz5JtvKt75scIddrIN7UeJqNx9yU1pfkDRkY6L2bVKOu+
         O5EkiQjkEMMyjEx6FsB2xdwZk46olZFOCo2X/9lwXJX3Pi9Gso0+tdjiyH9kk7czCoBv
         PLSNQmvGbyIkP06FZV37R/4VBXIzFu6LEJ8oGOhllv72/KTXs/YnQsSfOteVpR8XJR4r
         elqg==
X-Forwarded-Encrypted: i=1; AJvYcCVMdesIP8iQ6Hw+sjaLHLUcp9QKg40jIkjaZbho4whhiJfIaCF4CQimU2FbTwfvqygwCXw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLeudXzaGFLz2V2KINhqOACrzdmpmble94NgGkNTz2ZjMbq54Y
	ZBr2UcIMDBN3tM+N4Saty7F+HCVz9rJanwIP5I6hZ1XYtwHse9VHAJUta0Pog8f7pww=
X-Gm-Gg: ASbGnctLmq1V5aWqn1dc2R7ulC0DH14x0FSwq+3LUQpH+BGqH2MHhxP5ZcIMTWwBLWk
	clMJdiUFTbGlv6FeqvQmslZVdqOrZgCozlkzIZ4xKB8Vvi9HHjwRwxsO/B7clZs48tCny+kHrqw
	h8acfp8qtrqFp1u2GGCPoRzSqUugncp5EFa0jbFc1dvTT4kwNQYvMAYysl70npNVl3EPw01QvK9
	YQ7fPp1ydxvbfjyS+I2+L32BcTngxN0MCdUG4C0jM4AJQ834MxEgkjzFWfw4KDXzR5IYaEuJP2c
	0SOqOaGtsN1XIpvCNF1G2cmjIEqvbK1FUbOZzWbPPH1QAlj0Xllfp1XkaN7SMUZAFeCr/3Lp0vQ
	IWNlnQGQNBuwlH/fMAi0lNv+AHLGlhEvKXu/0PP31ew4+A/tl8BIVzXXrClVz663CWILy3eDY1a
	RvqyyJaJtevVpoPg==
X-Google-Smtp-Source: AGHT+IFgEW6WceddZIHGZ94X0sQHww9NEf+WBU8+5GhU28dgZEyAjGt1Asj1eEN0oG0UWIF6ZhWrdA==
X-Received: by 2002:a17:903:2f10:b0:297:f793:fc7e with SMTP id d9443c01a7336-29b6c3e4c3amr154770345ad.19.1764085519248;
        Tue, 25 Nov 2025 07:45:19 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:c0c0:5a6c:d170:84a1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b273c16sm171412895ad.72.2025.11.25.07.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:45:18 -0800 (PST)
Date: Tue, 25 Nov 2025 08:45:15 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Peng Fan <peng.fan@nxp.com>, Beleswar Padhi <b-padhi@ti.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v7 1/2] remoteproc: Use of_reserved_mem_region_*
 functions for "memory-region"
Message-ID: <aSXPC-LskWzn_fPa@p14s>
References: <20251124182751.507624-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124182751.507624-1-robh@kernel.org>

On Mon, Nov 24, 2025 at 12:27:47PM -0600, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar
> Tested-by: Beleswar Padhi <b-padhi@ti.com> # TI
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v7:
>  - Rework st_rproc_parse_fw() loop and maintain existing behavior in
>    case of no entries and error paths
>  - Split QCom to separate patch
> 
> v6:
>  - Rebase on v6.18-rc1
>  - The error in v5 was fixed in v6.17 commit aea70964b5a7
>    ("of: reserved_mem: Add missing IORESOURCE_MEM flag on resources")
> 
> v5:
>  - Drop some inadvertent whitespace changes in qcom_q6v5_pas.c and ti_k3.
>  - Fix error handling in adsp_alloc_memory_region()
>  - Drop unreachable returns after 'while (1)' loops
> 
> v4:
>  - Rebase on v6.17-rc1. qcom_q6v5_pas.c conflicted needing s/adsp/pas/
> 
> v3:
>  - Rebase on v6.16-rc1. Move TI K3 changes to new common file.
>  - Fix double increment of "i" in xlnx_r5
> 
> v2:
>  - Use strstarts instead of strcmp for resource names as they include
>    the unit-address.
>  - Drop the unit-address from resource name for imx and st drivers
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 47 +++++++----------
>  drivers/remoteproc/imx_rproc.c          | 70 ++++++++++---------------
>  drivers/remoteproc/rcar_rproc.c         | 38 +++++---------
>  drivers/remoteproc/st_remoteproc.c      | 43 ++++++++-------
>  drivers/remoteproc/stm32_rproc.c        | 46 +++++++---------
>  drivers/remoteproc/ti_k3_common.c       | 28 ++++------
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 53 +++++++------------

Applied - thanks,
Mathieu

>  7 files changed, 129 insertions(+), 196 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 6e78a01755c7..477e4245a426 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -689,11 +689,9 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  	struct rproc *rproc = priv->rproc;
>  	struct device *dev = rproc->dev.parent;
>  	struct device_node *np = dev->of_node;
> -	struct of_phandle_iterator it;
>  	struct rproc_mem_entry *mem;
> -	struct reserved_mem *rmem;
>  	void __iomem *cpu_addr;
> -	int a;
> +	int a, i = 0;
>  	u64 da;
>  
>  	/* Remap required addresses */
> @@ -724,49 +722,40 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		rproc_add_carveout(rproc, mem);
>  	}
>  
> -	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> -	while (of_phandle_iterator_next(&it) == 0) {
> +	while (1) {
> +		int err;
> +		struct resource res;
> +
> +		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		if (err)
> +			return 0;
> +
>  		/*
>  		 * Ignore the first memory region which will be used vdev buffer.
>  		 * No need to do extra handlings, rproc_add_virtio_dev will handle it.
>  		 */
> -		if (!strcmp(it.node->name, "vdev0buffer"))
> +		if (strstarts(res.name, "vdev0buffer"))
>  			continue;
>  
> -		rmem = of_reserved_mem_lookup(it.node);
> -		if (!rmem) {
> -			of_node_put(it.node);
> -			dev_err(dev, "unable to acquire memory-region\n");
> +		if (imx_dsp_rproc_sys_to_da(priv, res.start, resource_size(&res), &da))
>  			return -EINVAL;
> -		}
>  
> -		if (imx_dsp_rproc_sys_to_da(priv, rmem->base, rmem->size, &da)) {
> -			of_node_put(it.node);
> -			return -EINVAL;
> -		}
> -
> -		cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
> +		cpu_addr = devm_ioremap_resource_wc(dev, &res);
>  		if (!cpu_addr) {
> -			of_node_put(it.node);
> -			dev_err(dev, "failed to map memory %p\n", &rmem->base);
> +			dev_err(dev, "failed to map memory %pR\n", &res);
>  			return -ENOMEM;
>  		}
>  
>  		/* Register memory region */
> -		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)rmem->base,
> -					   rmem->size, da, NULL, NULL, it.node->name);
> -
> -		if (mem) {
> -			rproc_coredump_add_segment(rproc, da, rmem->size);
> -		} else {
> -			of_node_put(it.node);
> +		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)res.start,
> +					   resource_size(&res), da, NULL, NULL,
> +					   "%.*s", strchrnul(res.name, '@') - res.name, res.name);
> +		if (!mem)
>  			return -ENOMEM;
> -		}
>  
> +		rproc_coredump_add_segment(rproc, da, resource_size(&res));
>  		rproc_add_carveout(rproc, mem);
>  	}
> -
> -	return 0;
>  }
>  
>  /* Prepare function for rproc_ops */
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a89..eb133a6622bc 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -490,50 +490,44 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  	struct device_node *np = priv->dev->of_node;
> -	struct of_phandle_iterator it;
>  	struct rproc_mem_entry *mem;
> -	struct reserved_mem *rmem;
> +	int i = 0;
>  	u32 da;
>  
>  	/* Register associated reserved memory regions */
> -	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> -	while (of_phandle_iterator_next(&it) == 0) {
> +	while (1) {
> +		int err;
> +		struct resource res;
> +
> +		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		if (err)
> +			return 0;
> +
>  		/*
>  		 * Ignore the first memory region which will be used vdev buffer.
>  		 * No need to do extra handlings, rproc_add_virtio_dev will handle it.
>  		 */
> -		if (!strcmp(it.node->name, "vdev0buffer"))
> +		if (strstarts(res.name, "vdev0buffer"))
>  			continue;
>  
> -		if (!strcmp(it.node->name, "rsc-table"))
> +		if (strstarts(res.name, "rsc-table"))
>  			continue;
>  
> -		rmem = of_reserved_mem_lookup(it.node);
> -		if (!rmem) {
> -			of_node_put(it.node);
> -			dev_err(priv->dev, "unable to acquire memory-region\n");
> -			return -EINVAL;
> -		}
> -
>  		/* No need to translate pa to da, i.MX use same map */
> -		da = rmem->base;
> +		da = res.start;
>  
>  		/* Register memory region */
> -		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)rmem->base, rmem->size, da,
> +		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
> +					   resource_size(&res), da,
>  					   imx_rproc_mem_alloc, imx_rproc_mem_release,
> -					   it.node->name);
> -
> -		if (mem) {
> -			rproc_coredump_add_segment(rproc, da, rmem->size);
> -		} else {
> -			of_node_put(it.node);
> +					   "%.*s", strchrnul(res.name, '@') - res.name,
> +					   res.name);
> +		if (!mem)
>  			return -ENOMEM;
> -		}
>  
> +		rproc_coredump_add_segment(rproc, da, resource_size(&res));
>  		rproc_add_carveout(rproc, mem);
>  	}
> -
> -	return  0;
>  }
>  
>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> @@ -664,47 +658,37 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	}
>  
>  	/* memory-region is optional property */
> -	nph = of_count_phandle_with_args(np, "memory-region", NULL);
> +	nph = of_reserved_mem_region_count(np);
>  	if (nph <= 0)
>  		return 0;
>  
>  	/* remap optional addresses */
>  	for (a = 0; a < nph; a++) {
> -		struct device_node *node;
>  		struct resource res;
>  
> -		node = of_parse_phandle(np, "memory-region", a);
> -		if (!node)
> -			continue;
> -		/* Not map vdevbuffer, vdevring region */
> -		if (!strncmp(node->name, "vdev", strlen("vdev"))) {
> -			of_node_put(node);
> -			continue;
> -		}
> -		err = of_address_to_resource(node, 0, &res);
> +		err = of_reserved_mem_region_to_resource(np, a, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
> -			of_node_put(node);
>  			return err;
>  		}
>  
> -		if (b >= IMX_RPROC_MEM_MAX) {
> -			of_node_put(node);
> +		/* Not map vdevbuffer, vdevring region */
> +		if (strstarts(res.name, "vdev"))
> +			continue;
> +
> +		if (b >= IMX_RPROC_MEM_MAX)
>  			break;
> -		}
>  
>  		/* Not use resource version, because we might share region */
> -		priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev, res.start, resource_size(&res));
> +		priv->mem[b].cpu_addr = devm_ioremap_resource_wc(&pdev->dev, &res);
>  		if (!priv->mem[b].cpu_addr) {
>  			dev_err(dev, "failed to remap %pr\n", &res);
> -			of_node_put(node);
>  			return -ENOMEM;
>  		}
>  		priv->mem[b].sys_addr = res.start;
>  		priv->mem[b].size = resource_size(&res);
> -		if (!strcmp(node->name, "rsc-table"))
> +		if (!strcmp(res.name, "rsc-table"))
>  			priv->rsc_table = priv->mem[b].cpu_addr;
> -		of_node_put(node);
>  		b++;
>  	}
>  
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index 921d853594f4..3c25625f966d 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -52,46 +52,36 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
>  	struct device_node *np = dev->of_node;
> -	struct of_phandle_iterator it;
>  	struct rproc_mem_entry *mem;
> -	struct reserved_mem *rmem;
> +	int i = 0;
>  	u32 da;
>  
>  	/* Register associated reserved memory regions */
> -	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> -	while (of_phandle_iterator_next(&it) == 0) {
> -
> -		rmem = of_reserved_mem_lookup(it.node);
> -		if (!rmem) {
> -			of_node_put(it.node);
> -			dev_err(&rproc->dev,
> -				"unable to acquire memory-region\n");
> -			return -EINVAL;
> -		}
> +	while (1) {
> +		struct resource res;
> +		int ret;
> +
> +		ret = of_reserved_mem_region_to_resource(np, i++, &res);
> +		if (ret)
> +			return 0;
>  
> -		if (rmem->base > U32_MAX) {
> -			of_node_put(it.node);
> +		if (res.start > U32_MAX)
>  			return -EINVAL;
> -		}
>  
>  		/* No need to translate pa to da, R-Car use same map */
> -		da = rmem->base;
> +		da = res.start;
>  		mem = rproc_mem_entry_init(dev, NULL,
> -					   rmem->base,
> -					   rmem->size, da,
> +					   res.start,
> +					   resource_size(&res), da,
>  					   rcar_rproc_mem_alloc,
>  					   rcar_rproc_mem_release,
> -					   it.node->name);
> +					   res.name);
>  
> -		if (!mem) {
> -			of_node_put(it.node);
> +		if (!mem)
>  			return -ENOMEM;
> -		}
>  
>  		rproc_add_carveout(rproc, mem);
>  	}
> -
> -	return 0;
>  }
>  
>  static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index e6566a9839dc..747bbe7f6f7c 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -120,40 +120,39 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = rproc->dev.parent;
>  	struct device_node *np = dev->of_node;
>  	struct rproc_mem_entry *mem;
> -	struct reserved_mem *rmem;
> -	struct of_phandle_iterator it;
> -	int index = 0;
> -
> -	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> -	while (of_phandle_iterator_next(&it) == 0) {
> -		rmem = of_reserved_mem_lookup(it.node);
> -		if (!rmem) {
> -			of_node_put(it.node);
> -			dev_err(dev, "unable to acquire memory-region\n");
> -			return -EINVAL;
> -		}
> +	int entries;
> +
> +	entries = of_reserved_mem_region_count(np);
> +
> +	for (int index = 0; index < entries; index++) {
> +		struct resource res;
> +		int ret;
> +
> +		ret = of_reserved_mem_region_to_resource(np, index, &res);
> +		if (ret)
> +			return ret;
>  
>  		/*  No need to map vdev buffer */
> -		if (strcmp(it.node->name, "vdev0buffer")) {
> +		if (!strstarts(res.name, "vdev0buffer")) {
>  			/* Register memory region */
>  			mem = rproc_mem_entry_init(dev, NULL,
> -						   (dma_addr_t)rmem->base,
> -						   rmem->size, rmem->base,
> +						   (dma_addr_t)res.start,
> +						   resource_size(&res), res.start,
>  						   st_rproc_mem_alloc,
>  						   st_rproc_mem_release,
> -						   it.node->name);
> +						   "%.*s",
> +						   strchrnul(res.name, '@') - res.name,
> +						   res.name);
>  		} else {
>  			/* Register reserved memory for vdev buffer allocation */
>  			mem = rproc_of_resm_mem_entry_init(dev, index,
> -							   rmem->size,
> -							   rmem->base,
> -							   it.node->name);
> +							   resource_size(&res),
> +							   res.start,
> +							   "vdev0buffer");
>  		}
>  
> -		if (!mem) {
> -			of_node_put(it.node);
> +		if (!mem)
>  			return -ENOMEM;
> -		}
>  
>  		rproc_add_carveout(rproc, mem);
>  		index++;
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 431648607d53..c28679d3b43c 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -213,60 +213,52 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
>  	struct device_node *np = dev->of_node;
> -	struct of_phandle_iterator it;
>  	struct rproc_mem_entry *mem;
> -	struct reserved_mem *rmem;
>  	u64 da;
> -	int index = 0;
> +	int index = 0, mr = 0;
>  
>  	/* Register associated reserved memory regions */
> -	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> -	while (of_phandle_iterator_next(&it) == 0) {
> -		rmem = of_reserved_mem_lookup(it.node);
> -		if (!rmem) {
> -			of_node_put(it.node);
> -			dev_err(dev, "unable to acquire memory-region\n");
> -			return -EINVAL;
> -		}
> +	while (1) {
> +		struct resource res;
> +		int ret;
> +
> +		ret = of_reserved_mem_region_to_resource(np, mr++, &res);
> +		if (ret)
> +			return 0;
>  
> -		if (stm32_rproc_pa_to_da(rproc, rmem->base, &da) < 0) {
> -			of_node_put(it.node);
> -			dev_err(dev, "memory region not valid %pa\n",
> -				&rmem->base);
> +		if (stm32_rproc_pa_to_da(rproc, res.start, &da) < 0) {
> +			dev_err(dev, "memory region not valid %pR\n", &res);
>  			return -EINVAL;
>  		}
>  
>  		/*  No need to map vdev buffer */
> -		if (strcmp(it.node->name, "vdev0buffer")) {
> +		if (!strstarts(res.name, "vdev0buffer")) {
>  			/* Register memory region */
>  			mem = rproc_mem_entry_init(dev, NULL,
> -						   (dma_addr_t)rmem->base,
> -						   rmem->size, da,
> +						   (dma_addr_t)res.start,
> +						   resource_size(&res), da,
>  						   stm32_rproc_mem_alloc,
>  						   stm32_rproc_mem_release,
> -						   it.node->name);
> -
> +						   "%.*s", strchrnul(res.name, '@') - res.name,
> +						   res.name);
>  			if (mem)
>  				rproc_coredump_add_segment(rproc, da,
> -							   rmem->size);
> +							   resource_size(&res));
>  		} else {
>  			/* Register reserved memory for vdev buffer alloc */
>  			mem = rproc_of_resm_mem_entry_init(dev, index,
> -							   rmem->size,
> -							   rmem->base,
> -							   it.node->name);
> +							   resource_size(&res),
> +							   res.start,
> +							   "vdev0buffer");
>  		}
>  
>  		if (!mem) {
> -			of_node_put(it.node);
>  			return -ENOMEM;
>  		}
>  
>  		rproc_add_carveout(rproc, mem);
>  		index++;
>  	}
> -
> -	return 0;
>  }
>  
>  static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 56b71652e449..32aa954dc5be 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -470,13 +470,10 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
>  {
>  	struct device *dev = kproc->dev;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *rmem_np;
> -	struct reserved_mem *rmem;
>  	int num_rmems;
>  	int ret, i;
>  
> -	num_rmems = of_property_count_elems_of_size(np, "memory-region",
> -						    sizeof(phandle));
> +	num_rmems = of_reserved_mem_region_count(np);
>  	if (num_rmems < 0) {
>  		dev_err(dev, "device does not reserved memory regions (%d)\n",
>  			num_rmems);
> @@ -505,23 +502,20 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
>  
>  	/* use remaining reserved memory regions for static carveouts */
>  	for (i = 0; i < num_rmems; i++) {
> -		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
> -		if (!rmem_np)
> -			return -EINVAL;
> +		struct resource res;
>  
> -		rmem = of_reserved_mem_lookup(rmem_np);
> -		of_node_put(rmem_np);
> -		if (!rmem)
> -			return -EINVAL;
> +		ret = of_reserved_mem_region_to_resource(np, i + 1, &res);
> +		if (ret)
> +			return ret;
>  
> -		kproc->rmem[i].bus_addr = rmem->base;
> +		kproc->rmem[i].bus_addr = res.start;
>  		/* 64-bit address regions currently not supported */
> -		kproc->rmem[i].dev_addr = (u32)rmem->base;
> -		kproc->rmem[i].size = rmem->size;
> -		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
> +		kproc->rmem[i].dev_addr = (u32)res.start;
> +		kproc->rmem[i].size = resource_size(&res);
> +		kproc->rmem[i].cpu_addr = devm_ioremap_resource_wc(dev, &res);
>  		if (!kproc->rmem[i].cpu_addr) {
> -			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
> -				i + 1, &rmem->base, &rmem->size);
> +			dev_err(dev, "failed to map reserved memory#%d at %pR\n",
> +				i + 1, &res);
>  			return -ENOMEM;
>  		}
>  
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 0b7b173d0d26..a7b75235f53e 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -492,53 +492,46 @@ static int add_mem_regions_carveout(struct rproc *rproc)
>  {
>  	struct rproc_mem_entry *rproc_mem;
>  	struct zynqmp_r5_core *r5_core;
> -	struct of_phandle_iterator it;
> -	struct reserved_mem *rmem;
>  	int i = 0;
>  
>  	r5_core = rproc->priv;
>  
>  	/* Register associated reserved memory regions */
> -	of_phandle_iterator_init(&it, r5_core->np, "memory-region", NULL, 0);
> +	while (1) {
> +		int err;
> +		struct resource res;
>  
> -	while (of_phandle_iterator_next(&it) == 0) {
> -		rmem = of_reserved_mem_lookup(it.node);
> -		if (!rmem) {
> -			of_node_put(it.node);
> -			dev_err(&rproc->dev, "unable to acquire memory-region\n");
> -			return -EINVAL;
> -		}
> +		err = of_reserved_mem_region_to_resource(r5_core->np, i, &res);
> +		if (err)
> +			return 0;
>  
> -		if (!strcmp(it.node->name, "vdev0buffer")) {
> +		if (strstarts(res.name, "vdev0buffer")) {
>  			/* Init reserved memory for vdev buffer */
>  			rproc_mem = rproc_of_resm_mem_entry_init(&rproc->dev, i,
> -								 rmem->size,
> -								 rmem->base,
> -								 it.node->name);
> +								 resource_size(&res),
> +								 res.start,
> +								 "vdev0buffer");
>  		} else {
>  			/* Register associated reserved memory regions */
>  			rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
> -							 (dma_addr_t)rmem->base,
> -							 rmem->size, rmem->base,
> +							 (dma_addr_t)res.start,
> +							 resource_size(&res), res.start,
>  							 zynqmp_r5_mem_region_map,
>  							 zynqmp_r5_mem_region_unmap,
> -							 it.node->name);
> +							 "%.*s",
> +							 strchrnul(res.name, '@') - res.name,
> +							 res.name);
>  		}
>  
> -		if (!rproc_mem) {
> -			of_node_put(it.node);
> +		if (!rproc_mem)
>  			return -ENOMEM;
> -		}
>  
>  		rproc_add_carveout(rproc, rproc_mem);
> -		rproc_coredump_add_segment(rproc, rmem->base, rmem->size);
> +		rproc_coredump_add_segment(rproc, res.start, resource_size(&res));
>  
> -		dev_dbg(&rproc->dev, "reserved mem carveout %s addr=%llx, size=0x%llx",
> -			it.node->name, rmem->base, rmem->size);
> +		dev_dbg(&rproc->dev, "reserved mem carveout %pR\n", &res);
>  		i++;
>  	}
> -
> -	return 0;
>  }
>  
>  static int add_sram_carveouts(struct rproc *rproc)
> @@ -808,7 +801,6 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>  	struct device *dev = r5_core->dev;
>  	struct rsc_tbl_data *rsc_data_va;
>  	struct resource res_mem;
> -	struct device_node *np;
>  	int ret;
>  
>  	/*
> @@ -818,14 +810,7 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>  	 * contains that data structure which holds resource table address, size
>  	 * and some magic number to validate correct resource table entry.
>  	 */
> -	np = of_parse_phandle(r5_core->np, "memory-region", 0);
> -	if (!np) {
> -		dev_err(dev, "failed to get memory region dev node\n");
> -		return -EINVAL;
> -	}
> -
> -	ret = of_address_to_resource(np, 0, &res_mem);
> -	of_node_put(np);
> +	ret = of_reserved_mem_region_to_resource(r5_core->np, 0, &res_mem);
>  	if (ret) {
>  		dev_err(dev, "failed to get memory-region resource addr\n");
>  		return -EINVAL;
> -- 
> 2.51.0
> 
