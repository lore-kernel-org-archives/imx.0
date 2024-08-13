Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C33F1993AD
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723562664; cv=none; b=fuR8cZFiH3GFcDucJuSeP75x4AceLj7/UJvGQTS3kqWqtZdroiAkg5YrO8Pz5N/tsYTlgPcuqowLJS8/Z3U5bia+vYCzxy1SRh8ZXU5zdOoceiyTr6WdlOc6wtaIMWqKNe9/bA412KJRtyzhZkkrRv3VuyyAs50cww2nlLsKgi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723562664; c=relaxed/simple;
	bh=iax8nTB5naAhcfkw0pscNQSiKlvMu5KILn0pGkHWQKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYlB6fdDHEXBsuvES5h5zVk+hyOHHL8wI4mjxx2rTC8QjrrJP/u525H6syheEU59kkmkQ7G1zJ5P5xNu84vzGTWsN3CgszUrv/46ulJ1Z7nKOR9SGqlfnkbvLNaEA4+642rhw6mDjucTpsOjfUxqKcSYSAq5u1fBdtbCKyqUBVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ibiLnGZC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ibiLnGZC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fd70ba6a15so42663755ad.0
        for <imx@lists.linux.dev>; Tue, 13 Aug 2024 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723562661; x=1724167461; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oDUamF5J+1XHT0J4TpZt9iUNA0VNngLpHfz1pQpsQFM=;
        b=ibiLnGZCla2k0LdNqo5ge34rocHL9mipAcd55dRBM6w4GePVYaJZq3zipqtRJURao3
         yYM0MdcKIuYbbBMfDWY+1JPa8yuGHUI593B1Zzh19mn1N/O9lwH8DD7+mqsNbQx2m5+l
         F+gOaaazFTBjPrrOFB9/Cd4Bh/ngOjySxEJEtNtDm/i/f9LSzPmAM38QAkxPH+W56Lq7
         5fsNxVUQeHF46xTCoNy4DiO6MzRd7v00CZe+AdLlF2BNjyV6hsxjAzXjZy9hG+GB1IfM
         7O5uGdvTn0D9MU0F1C85ZYQ0Wxcm62zFERYrAXSHMleV3o6lemlqXUPR0IiD+kzm2wyS
         B2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723562661; x=1724167461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDUamF5J+1XHT0J4TpZt9iUNA0VNngLpHfz1pQpsQFM=;
        b=foeK0X6q6cYVXuyrk2P+hHqJn+es+z9oO9kAWortz9I3Ik8lLV18BFf3sA0ZMo3juS
         sxoeP3Ro3M9OhdBLdH3cvAohaqpJ9A7FDQCnTxlAAHbDsXuIJWqtexG8qiC4NHjAFcWV
         FR4ohVSMx9IVbpNCIIWoAYEePMvWQtBX26W5Mkf//RwFOLgOGfpL1ndiZ07uVnNb1f/a
         UJL6eA7mepsxnhoR/FKGr5ZNEgq9rRbmxhwmUVbFUnOxx/glQJUzWHoo3JSfT8uPj3oE
         QWOepgsZ87EzVHQusZv65kOa9/fMTnxoYeZkmri/N5znHsQmuKW6pPholPKbSGBV6gp/
         4QTA==
X-Forwarded-Encrypted: i=1; AJvYcCVc7km2QL6vk+/74f5j+SsMyrIaMhz5EdhnfAG7dwHzUTV7qCaQ7rV9pRlRCcuTkguORMlq2VN7NeUjoSMCzSbvKNSX
X-Gm-Message-State: AOJu0YzWSNJGo2AoEhlzj+ejOV7sz5ugGGL1vo1EUpWqi5NISYrl/BZV
	bAihd6Jfe0dFj8DW/pqU2hoq0UEoVBOTVlfkJaXzmqIjJJ2JvDQ6d9nU8UHL5Cg=
X-Google-Smtp-Source: AGHT+IHAxQb7Y6nkxCHFTuV+Yo1GDZU/jfnWNM34Zxjd3gA7zK88WOcad9xQ+GrBaPPGulVSnkAg5A==
X-Received: by 2002:a17:902:c408:b0:1fa:8f64:8afd with SMTP id d9443c01a7336-201ca127b19mr53908795ad.11.1723562661371;
        Tue, 13 Aug 2024 08:24:21 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d596:d55b:d99d:7ece])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1ab426sm14760975ad.157.2024.08.13.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 08:24:20 -0700 (PDT)
Date: Tue, 13 Aug 2024 09:24:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Use of_property_present()
Message-ID: <Zrt6oej7Dsj8KXrL@p14s>
References: <20240731191312.1710417-7-robh@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731191312.1710417-7-robh@kernel.org>

On Wed, Jul 31, 2024 at 01:12:45PM -0600, Rob Herring (Arm) wrote:
> Use of_property_present() to test for property presence rather than
> of_(find|get)_property(). This is part of a larger effort to remove
> callers of of_find_property() and similar functions. of_find_property()
> leaks the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 2 +-
>  drivers/remoteproc/imx_rproc.c          | 2 +-
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
>

I have applied this patch.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 087506e21508..376187ad5754 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -509,7 +509,7 @@ static int imx_dsp_rproc_mbox_alloc(struct imx_dsp_rproc *priv)
>  	struct mbox_client *cl;
>  	int ret;
>  
> -	if (!of_get_property(dev->of_node, "mbox-names", NULL))
> +	if (!of_property_present(dev->of_node, "mbox-names"))
>  		return 0;
>  
>  	cl = &priv->cl;
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 144c8e9a642e..8d7ecc809c67 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -807,7 +807,7 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
>  	if (priv->tx_ch && priv->rx_ch)
>  		return 0;
>  
> -	if (!of_get_property(dev->of_node, "mbox-names", NULL))
> +	if (!of_property_present(dev->of_node, "mbox-names"))
>  		return 0;
>  
>  	cl = &priv->cl;
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 596f3ffb8935..2cea97c746fd 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -1059,7 +1059,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  	r5_core = cluster->r5_cores[0];
>  
>  	/* Maintain backward compatibility for zynqmp by using hardcode TCM address. */
> -	if (of_find_property(r5_core->np, "reg", NULL))
> +	if (of_property_present(r5_core->np, "reg"))
>  		ret = zynqmp_r5_get_tcm_node_from_dt(cluster);
>  	else if (device_is_compatible(dev, "xlnx,zynqmp-r5fss"))
>  		ret = zynqmp_r5_get_tcm_node(cluster);
> @@ -1086,7 +1086,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  			return ret;
>  		}
>  
> -		if (of_find_property(dev_of_node(dev), "xlnx,tcm-mode", NULL) ||
> +		if (of_property_present(dev_of_node(dev), "xlnx,tcm-mode") ||
>  		    device_is_compatible(dev, "xlnx,zynqmp-r5fss")) {
>  			ret = zynqmp_pm_set_tcm_config(r5_core->pm_domain_id,
>  						       tcm_mode);
> @@ -1147,7 +1147,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  		return -EINVAL;
>  	}
>  
> -	if (of_find_property(dev_node, "xlnx,tcm-mode", NULL)) {
> +	if (of_property_present(dev_node, "xlnx,tcm-mode")) {
>  		ret = of_property_read_u32(dev_node, "xlnx,tcm-mode", (u32 *)&tcm_mode);
>  		if (ret)
>  			return ret;
> -- 
> 2.43.0
> 
