Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689660;
	b=W22W/Ei91ObxOEQF2ca2EZ4XUfLnhdo01lfTSuGg4n3Wako1ltU0eax24XtwYQbncYvE
	 ecgrluZ1NEuZ/EoemLLz2LEEHkb1iWzLl6K0dyHYwIBdnkDdyHn6UAABMmCNFBy8LSwqb
	 ZwOaqcmLxLuu7eFQkJjp2lZ4e5Hk2wgWciy+yW8ZTh47X+rHRDDVZrQGm45l3trGebLuu
	 secfJDqWWpcqzsRvRze9NDAv4Z8/BonB8rdzrHjLVxr4lW4b6tRL3H8iDeV5JKAUsd2nB
	 3QBkQVbWin9VSiBhMweGZCz/u3Fd740j7Ew1o/M0gh0lCyDqvVVzik5Sfp8TznjIQ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qSKC6LmTr8AlslSEV3eV/HjwmhQt0Co2xOFmLGtEaEI=;
	b=fW9N3eDX3Hst4Zzxc10NEgiL4xQHd9awGDb93CVnpgC86o/HcqYwXxP4KgQCSWLFZlD+
	 ZuapEGnUeu2a/Lj6No1BdzVfSRMgSlCjEN/yckYym38tTO6/p8bVxv4ZAEy4qkpSwtqof
	 Wwj/gBOBK/FW9TYkm4ZvRW/wXZqs0k2aBDUSdXEr3PFO+Zbdl57E5ouClcWIe8EDDlW8M
	 NcyY1cVx89HORv9SFtIq0AkON75uxdcBnt7izrqhZ90vy78WeuErMWS1EB0+52OV9HXqa
	 xdb3UbSAbqUCGFpik9kvedX+HRm6Xqa89UqbupAPsgmO9HYa4XhEqv49JUgiHbh6k8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fHFcgbST;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7741606A322
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 17:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7741606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fHFcgbST
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e987a2ba0cso16794125ad.3
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 10:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792689659; x=1793294459; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSKC6LmTr8AlslSEV3eV/HjwmhQt0Co2xOFmLGtEaEI=;
        b=fHFcgbSTxfnLAIVUUQt3UlPUWKpgLqTKwSey4vhXnsoqK1uGhdl8fLIZpsbIUf987j
         /Yb1VjsKkBwIu4F94a3G0g7Cul88bWVGqfK0PWTxrlepOept91oS0WcAv4eEN5L5lbAJ
         ZzpQfErZ2p8uIkb+a0DZ4Nvj+IFGoCiwM/Nu/esronwv/phs15v/Xb6qC9ApZ+yCxOVw
         7DKUsRIc5XWDMBmqyviMqlZf82KfPtBLAPTBZE1B2bI2ortatBf7WN4tDuvrxQELZD14
         4ZcH60brNfhowHID2XBeJ4HZ1Jmvfu/EtRVtNba/iYL/nRHMUDSzebFzGeNh4u1k+plZ
         dKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689659; x=1793294459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSKC6LmTr8AlslSEV3eV/HjwmhQt0Co2xOFmLGtEaEI=;
        b=M3iNxtrVYdg9iVo2UQrwvrHxSTQoZWWfVq5NVfWNRzrXORAZJIGsadKvqz0TQLDcyJ
         64jR4yub0tYNsWbn4cAQHn4hqGOyJKvzP3IiXAVoeCP0a+rRFqwHd2ao1omrPorWiEUa
         c8dYmstzcRjReJRQczczdbBB0ma4xmjM2QDYs3aistaQfzO7vlm5nRYs3bi+YvvQmF0s
         n4nF4sUFH6ltokjVVlnDgsrBAW9tBwfCWOyKhlD/4QYxcBe/H+Eu44yURmVceJXKlCWw
         EnvQ1hrJiC/ZEpyE7DqcaZxekGsUipvU+y3jerEKmUOKtkwiFJ98lTjpaZGngxOqCE3E
         0JKA==
X-Forwarded-Encrypted: i=1; AKwUvBwB3iqoj0zLmnjEZwyIlwdJKF+5VCj4oSQLazMXRyGNUEJNoGFv3FOhBPd/QRPnvLr+KhE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIja7H3a5fWdXJUK04ME7uVCJIKkSTRR9XHfZCrEzV7t0QpeCxn
	0Yspp/NQXAm7Ke18c/NzG84j9Bdg25npySQlsIK+2mLjM94mz1FSFMBkdSmJXIV6dbQ=
X-Gm-Gg: AYBFou14AcjodtTQo+VeihVo3yYr/nV6LKmIED6+22iw28p+JVx7lj6OgElBffRCMPL
	oraK6hIyhQte3+YCDolE3rwWZt12GtQ8oTPno1LUNYWQoVL+bOEtuuGkyae0DtyibUSMoiHkbkp
	83mVrGR40H/Zp6Ua8+RTnHwanxfNcV/Se8zMR+FO6CtHDxmigINM7GXn3/g+IThmU8TFeIZhrkj
	USXvlul7vuVfPlCvwSBdMlseyjdcOah39IgoRCXXGoat6Mixdi0aXUjx/proASx0g9wL4S40co3
	7wBC6DPtrpjJ3meZuGnXtEQX2f6DFB7JTj+7zc6WfUhB2pcmOosMwu0wF+m1jiiiCbPr/TsTnP8
	zA2XhGB8AxY8605Z1u5yXuCmH3UDnsfgJoMvjLHHxl24fmvH2ASPkKdA2QCvcB+dR2o97yleBFG
	W5jDPs6oWx4ym1l9/Ax2wzrK17fsy1bfR6/kWvriV7SFNQz86waef6MYroL9mzuf+MB7vaJOGRc
	4RmvgO59DI4RUxjrDSbJ8TAX02tG4KMZ7AHJJZtICpE5aRMFRv9jYdTXPv/Blo7SWwyYRgGxP26
	7rYD
X-Received: by 2002:a17:903:2f89:b0:2e5:54c6:e5c9 with SMTP id d9443c01a7336-2ea437b4bf8mr47547695ad.2.1792689658924;
        Thu, 22 Oct 2026 10:20:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9e85:9169:41c7:bc2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b366766sm1137285ad.31.2026.10.22.10.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:20:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:20:55 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH v7 2/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Message-ID: <atpF91weFU11Fu4m@p14s>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
 <20261020-memory-region-name-v7-2-1413d5928340@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-memory-region-name-v7-2-1413d5928340@nxp.com>

On Tue, Oct 20, 2026 at 12:50:22PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Parse memory-region-names to identify the expected memory regions and avoid
> relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Francesco Valla <francesco@valla.it>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 581bb07f5893f..1647726893d1a 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -635,6 +635,25 @@ static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int imx_rproc_rmem_to_resource(struct device_node *np,
> +				      int index,
> +				      struct resource *res)
> +{
> +	int ret;
> +
> +	ret = of_reserved_mem_region_to_resource(np, index, res);
> +	if (ret)
> +		return ret;
> +
> +	/* "memory-region-names" is optional */
> +	ret = of_property_read_string_index(np, "memory-region-names",
> +					    index, &res->name);
> +	if (ret == -EINVAL)
> +		return 0;
> +
> +	return ret;
> +}
> +
>  static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -648,7 +667,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		int err;
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>  		if (err)
>  			break;
>  
> @@ -823,11 +842,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	if (nph <= 0)
>  		return 0;
>  
> +	if (!of_property_present(np, "memory-region-names")) {
> +		dev_warn(dev, "using node names for carveouts should be avoided\n");

Get rid of dev_warn().

> +	} else {
> +		if (nph != of_property_count_strings(np, "memory-region-names")) {
> +			dev_err(dev, "invalid reserved memory name count\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/* remap optional addresses */
>  	for (a = 0; a < nph; a++) {
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, a, &res);
> +		err = imx_rproc_rmem_to_resource(np, a, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
>  			return err;
> 
> -- 
> 2.43.0
> 
