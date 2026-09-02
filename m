Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAED249CF5B
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366028; cv=none; b=cCBdrdaTdZfGdYrP/rbuh5EVw1aMunXQwNvAKY+tgv2sMNFynd2KdSM6xgxODKRPhXlrwtHz9lru8YsLV7AqRhGvWYz2PSLJ1P7sFcL/dA7roKWRJlQcs6om7A1AxHVLuODyRo1RpcPUzsFsTduQcEGOaTxyrEXGed3L8WQAHK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366028; c=relaxed/simple;
	bh=G6I21MeRcNKDvGWUGb45NsvcT/Pnsh04t8yZ4XvNhHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsFrEMH9vgACfJeoiF1FXHFovlkWeD1D6f0RRvZyWhqn87iFjkFzlkPMUZrqDrHmSvSc4DfTeADw8zawNSKrGrl3Wr9o+3fRhwP/tvKgKUxuITClu8b14iIrtBDVEesSetuSyyJxqA0yIB8jEZ1HkIOr1zxsk6DrpdmwrDts4+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2Yfi8UX; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2Yfi8UX"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39927410578so2358446a91.1
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788366026; x=1788970826; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jf3OMAFii79DvFjzmmOgKmfE+xvffqJHuhaGLaLcFJI=;
        b=S2Yfi8UX9XWuzWMEAk9wYOtNv1PQWp4mDSpQBCrz+RhomK41QweIp0MUDKXYPWyUFb
         RRZw387iOup6//dcCZT9S2nRQJqe+7UDGhffYXOdiTsoXr/PeHTcVNhujvWXlUntinO/
         sR1V9wV9/iuFNE9MT+6qoK1tS104e4mUzAg2KzHGzNKvJJKXweiYibrioJnjFKjPKc3O
         JesPX466NfXU1TUsIIWD6mGyBf845PySlbHDfTDU8R9yfleY9QZJq1Yzrb/eD9CiSkRx
         rDNXacYCrgDBsc5/Vcoqg/n1F0s7CXhG2gBpfXQchbDleNv7MjwLQVIWuKyz1fwx0vq3
         IlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366026; x=1788970826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jf3OMAFii79DvFjzmmOgKmfE+xvffqJHuhaGLaLcFJI=;
        b=SleSJdbURln/j2xLY+1/yzI5A2EV7iJ7NMeK0nRbuhnYEw5h/Oy87mbPK7shXfT1r2
         gruQsem/hdQObJb8H00+AbgWXtIHsa8GPSBjNRk+akjR0+rg/7ialbF79mXeKR0GarFK
         hPKbsZbnFGcR/SUuyaKSIEQNOV6EeR5JEssZWFHfzf9JeK9/6OremrBkbPykLOOq2Dmw
         sL4jMFsRsvay4os+RAnWFg+jLugzxjlJwKTss+SJj4oJk6chXBBj+3u12R4W5VXO9DxW
         +yoG98W0M3l28f/WQEWn4aBsPeYq4HRfESY/0PJeRHYfx08HOPj8LhJP8Yqp4ZdJGfVb
         qLsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfgAM0EJ4fjYRt3NawQkYR7d5Khsv0GVpzGvPsyh6Ved024FozR5tz+bLFLaPyFTozJuM=@lists.linux.dev
X-Gm-Message-State: AFuF++lzz0aJUDHSb+VRvPV7cEqmJgU6Fugy8wgE1HB7985Fc5l13CqN
	7uLp12cBR6rQrgkNNUwdh3QX2ASuiX67Oq887AlPwh8TD+2llH/IcOqhFVSs5ZVgs1c=
X-Gm-Gg: AYBFou3mlOCrvnYz/DW4QJGSzAi2iw88VFR4oXkG/gF0/jp8904uqIPggPHEEey/Pa7
	E8sCn1JNMYPKD3J9h5NNFONL+R4xVIuc4pkuDUgc1s8NrpmZ2TjXA82uispZe5ZDVITqBT7ZsTG
	oCNM3F0q+GKarc7ssqADra2XTN4GljNm1BfvRvxjxgYLN0z9ntiLiXUrlLP7KeWp6nGo72W6m7v
	webXjWW1IHJRU0ETGF3ClwNbe3JTDb+/edcWm/KiKr6g5tsECXPDk4rg58TIEBfK8fz2kzr8tG5
	Mk9WXb8CkutJou9ENpiQ8oLg8ufnItnSPOej0glrA6IkYVrijDfT2LeKx4ZwZ9n3op90oQoEs5Q
	2fmdvz+/W9XSFfwPdwb+SMhVBQoVXmFd+JuWLlAWdN9GERdsZbaDPrM/8Huzl1c32X+RnRcXacY
	RgWhHpiCFh2cocb96rG1cnRx8QcVEWQuQf5BNJvl/Bh9oTWUvQQGdOjaAYo/gYQeqv
X-Received: by 2002:a17:90b:268d:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39aee023191mr10058955a91.10.1788366025577;
        Wed, 02 Sep 2026 09:20:25 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fff4:86c5:8d86:9e93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0861e54csm169061a91.10.2026.09.02.09.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:20:25 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:20:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Marcel Hofmann <marcel@hofmania.de>, peng.fan@nxp.com,
	daniel.baluta@nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at
 region boundary
Message-ID: <aphMxtTvcvTqgqCm@p14s>
References: <20260827123136.438798-1-marcel@hofmania.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827123136.438798-1-marcel@hofmania.de>

On Thu, Aug 27, 2026 at 02:31:36PM +0200, Marcel Hofmann wrote:
> From: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
> 
> The address range checks in imx_rproc_da_to_sys() and
> imx_rproc_da_to_va() use a strict comparison for the exclusive end
> address of the requested range.
> 
> As a result, a valid request that ends exactly at the end of an address
> translation or mapped memory region is rejected. For a region
> [start, start + size), a request [addr, addr + len) is contained when:
> 
>     addr >= start && addr + len <= start + size
> 
> This occurs when a loadable ELF segment fills an entire mapped memory
> region. This can be produced by a linker script that extends the
> resource table section to the end of its designated region:
> 
>     .resource_table :
>     {
>       . = ALIGN(8);
>       KEEP(*(.resource_table)) /* Resource table */
>       . = ALIGN(8);
>       . = ORIGIN(m_rsc_tbl) + LENGTH(m_rsc_tbl);
>     } > m_rsc_tbl =0x00
> 
> This produces a ELF program header like:
> 
>     LOAD  0x010000 0xa4220000 0xa4220000 0x01000 0x01000 R   0x1000
> 
> In this case, the segment size matches the mapped region size exactly,
> causing the address translation to fail with:
> 
>     bad phdr da 0xa4220000 mem 0x1000
> 
> Rework the upper-bound checks to allow ranges ending exactly at the region
> boundary while guarding against integer overflow. 
> 
> Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
> Signed-off-by: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
> ---
> 
> Changes in v2: 
> - Reworked the bounds check to guard against 64-bit integer overflow
> - Use u64 for offset instead of unsigned integer
> - calculate offset first and then validate len against remaining region
>   size
> 
> v1: https://lore.kernel.org/r/20260826155123.AEB731F000E9@smtp.kernel.org/
> 
>  drivers/remoteproc/imx_rproc.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 745ce52cd822..ea852ca143bb 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -540,6 +540,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  	/* parse address translation table */
>  	for (i = 0; i < dcfg->att_size; i++) {
>  		const struct imx_rproc_att *att = &dcfg->att[i];
> +		u64 offset;
>  
>  		/*
>  		 * Ignore entries not belong to current core:
> @@ -552,9 +553,11 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  				continue;
>  		}
>  
> -		if (da >= att->da && da + len < att->da + att->size) {
> -			unsigned int offset = da - att->da;
> +		if (da < att->da)
> +			continue;
>  
> +		offset = da - att->da;
> +		if (offset <= att->size && len <= att->size - offset) {
>  			*sys = att->sa + offset;
>  			if (is_iomem)
>  				*is_iomem = att->flags & ATT_IOMEM;
> @@ -585,9 +588,14 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
>  		return NULL;
>  
>  	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
> -		if (sys >= priv->mem[i].sys_addr && sys + len <
> -		    priv->mem[i].sys_addr +  priv->mem[i].size) {
> -			unsigned int offset = sys - priv->mem[i].sys_addr;
> +		u64 offset;
> +
> +		if (sys < priv->mem[i].sys_addr)
> +			continue;
> +
> +		offset = sys - priv->mem[i].sys_addr;
> +		if (offset <= priv->mem[i].size &&
> +		    len <= priv->mem[i].size - offset) {
>  			/* __force to make sparse happy with type conversion */
>  			va = (__force void *)(priv->mem[i].cpu_addr + offset);

This looks sensible.  That said, I would like to see someone on the NXP team
test this patch in different configuration.

Thanks,
Mathieu

>  			break;
> -- 
> 2.55.0
> 
