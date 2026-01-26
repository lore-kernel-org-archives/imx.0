Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF93347FD1
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 16:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769446188; cv=none; b=EtjuZi0/hB/sShLpHtJwlNKXjJGvR6MKExX1wx1TwDAcjtC/C0GKNoy2WZd2bq6h/7uLqbxWSutYoajlgYLzB4xvOaB0ApoS7gqDw7mNXHECRcmZ75bE2Tb87BliP2S2T4tD9stXPwPp5Sy480zrJVhojNH28rBWxzYwfdBCiuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769446188; c=relaxed/simple;
	bh=wcDl92qrj6gtr3M+a+7Ixmj+6kaZn8WOD9ZkxcA6MLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+Mh9rE72iX8eAmLEBn3bpDKVCKfxIwOjTN08rfU6aq3ECrF0pTM3SvtMjznfO30ZPpa1cQqQd2I0YgKGKtJJne0hM7C43Y3NBukU/djSclZn0gqjhcB53J7c8fk9rGN7PCREadXwNPkzriBuPsxVfq7+D87g1/mZgYpdD7CEo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L2SLloSW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L2SLloSW"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a7bced39cfso52282745ad.1
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 08:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769446182; x=1770050982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKR5exgvtJ4nN+wmy7UGkJjcYwJf1VIP0gn7pcEz2lI=;
        b=L2SLloSWsrKUZl3kuBUvShpqYn5dfIRBPyAfttEVq39UjFRsuTHDwgelpoT5O48XpT
         jWYdKcHePCuU13miQTF2ermF45xbBV0jA06h1m+Ra3HmVEFVmDy+5GQdpnO0n/VPqzBG
         Ma8JeFh7CYurrTslxZUoJjZcP5vqQxQgjE5KVTR93ijgG/OegVmr3AQh9HXUvYfD/G13
         pxWNZFUUAuKrpM7DiT349SaHn53fnJZ+qFpIldnavXrVqisXLAyQSzs++ogrAwJhx3ij
         57TRLeTmcnuNthadgPTeZODNnwBSekjzrBlehgXY7Cwu6isa/XJLbVREfxpQT3y0oRds
         GlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769446182; x=1770050982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKR5exgvtJ4nN+wmy7UGkJjcYwJf1VIP0gn7pcEz2lI=;
        b=UhLQgH0ZRHt2Gs+HRfqNHesVfJNJZfu2V0TPtg0gF5ptbJk4/nRgkATLF/VTLi5zIx
         dW7wDHE8SHY9ScWR4b6V5VoIXKgI9PYohlGO3D8hHJ/s3hgJ9Kq4NBM9fwjw5RHvOW/x
         FMF+PHGi3Azys017Iy66pbZVc1ebKIHPzsHl1VnzkEPOxu6w2XkeYwtyLym6FSY8nRnR
         Fc6v2M+KqtCX9P9cFSN9prUyduRQtp3eK8BoNO/zIPJ1PNcVndZt7vhr2x/3DeSptSAl
         fSU+kkZtcgJcpD6T50bd0+GvWvUnOcEMewi9NCJfWMeTsMmCXRF4qSBaEZ2VNQARVFxo
         WXhg==
X-Forwarded-Encrypted: i=1; AJvYcCXzk6Eb5iWON+wXNsl2eyjiD2nKJLTm/wFeXGvKkb++X43YBgAxqF4r+NR03gFWO6RBiSk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgidUXDzSHAL+FJWI1f44HEvFMvkuwDudHZ88wp3FUGbWzQXh3
	W+Fk6RGvgG2/3dKstI8QSZnkE3aDXD5iulA7m3hNqkdsLxsApADOqjZ/a0YPT5byR+k=
X-Gm-Gg: AZuq6aIo6ejNS70Mzt+apQYRypopkT5bDCKh4+qLTW37t6rjIaQCLHsm0R1EogjrC7+
	ggQgkr6gpAooTsO8pQ1BPqGIGEc/xaFTDwjQteBMwNio6jGGQBhxnnO3T+3XcaeriWP6fr9P98d
	VQ8aZeqECiYSvbUDGDj2IxmkzzCk5YYFHPM81Q8rk17638LvEYJRoymBwdqJFHK0vkfLaVnMQw2
	4EvpWdUoqaSxx8cRG4NC+jtpvOiZtm2ZVA4N9C+/eMkxQwPOAsPYQZYjemgR849cqkNKx9hYxRA
	lS25qdH4OwXoWIIwvUDAfuC6KkRNwlUH4jzCypx2nS4lf2VTQpiCa3Mx0oqn9mf3DKDfSruoJcO
	MQJDGy7ouDa7SI8ARwq8+f3bIgUTF1GpRavUjMmYd1u1/DQDHrUmuWq/HJLBPjo7dpsokAPsn2Q
	5Eqn9BOEwrxyUQcQ==
X-Received: by 2002:a17:903:11c3:b0:2a2:caca:35d2 with SMTP id d9443c01a7336-2a845224d47mr49945825ad.16.1769446182265;
        Mon, 26 Jan 2026 08:49:42 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:6260:7bcf:7e2d:fa8d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcdb8csm94531115ad.31.2026.01.26.08.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:49:41 -0800 (PST)
Date: Mon, 26 Jan 2026 09:49:39 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_rproc: Not report loaded resource table
 when none
Message-ID: <aXebIztkPihBsLRK@p14s>
References: <20260122-imx-rproc-fix-v1-1-36cc64369a40@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-imx-rproc-fix-v1-1-36cc64369a40@nxp.com>

Good day,

On Thu, Jan 22, 2026 at 11:24:43AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When starting a firmware without a resource table after previously running
> one that had a resource table, imx_rproc_elf_find_loaded_rsc_table() may
> incorrectly return a valid device memory pointer (priv->rsc_table).

priv->rsc_table is not NULL if the DT has a "rsc-table" entry, indicating that
_if_ there is a resource table in memory, that's where it should be.  Function
imx_rproc_elf_find_loaded_rsc_table() is buggy so the narrative about a
previously running FW with a valid resource table can be dropped.

> 
> In this case rproc->cached_table is NULL because the current firmware does
> not contain a resource table, but the remoteproc core still interprets the
> non-NULL return value as a loaded resource table and attempts to memcpy()
> from rproc->cached_table, leading to a NULL pointer dereference and kernel
> panic.
> 
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> there is no cached resource table for the current firmware. This ensures
> that a loaded resource table is only reported when a valid cached_table
> exists, which matches the remoteproc core expectations.
> 
> This issue can be reproduced by:
>   1) start a firmware with a resource table
>   2) stop the remote processor
>   3) start a firmware without a resource table
> 
> With this change, starting a firmware without a resource table no longer
> causes kernel dump.
> 
> Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 375de79168a1c8d11b87ac1bd63774a3feac106d..cf044b385b58fe1e17d0fc440c243d76ecf020ae 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  
> +	/* No resource table in the firmware */
> +	if (!rproc->cached_table)
> +		return NULL;
> +

I think rproc->cached_table should be kept for internal remoteproc core usage
only.  Please use rproc->table_ptr.

Thanks,
Mathieu

>  	if (priv->rsc_table)
>  		return (struct resource_table *)priv->rsc_table;
>  
> 
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20260122-imx-rproc-fix-e206f8e6e477
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
