Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720428;
	b=i15Fgze3em6St29j0lrgwDLs4wYsHFQyh8Z7QObJ72EUoZBfq3kZZrflv9dMagBldhhC
	 67Fpgqase+4/eWSe3Pzr9Sh56JMU8cY6DAzToTfdUzGcaRQSzDn8bfHrAYERZHboNEr79
	 VY35XNs8h4fex0AnzsMVjcSDEocy+r0gCfAXHsIEproQZL2Mz1FGOD/GcHTvTSJxoRLpy
	 dEozgaXUedB7IKJWuidHMsG4RkvaXpFcnBIf/tplE0SjLcS5cHANU+EDL0ttVJwl17hP5
	 +U1uZVUHTJFyziUuQiaKhQpfZr1XLGIwy21H+wjPVOG5dfJByRgisPOxVOUenQl3BDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=EWOQO4/BUeLCAM60Oj14E4iA/D66uZxulDoNLysenrQ=;
	b=qHR3NFnGrROQEvPfmIpvL4NQFxq9HwEORy4jkDVr9q5JumN6fzCGViOtZN50R+/WEAln
	 4eWEmWnAht8JG5XHahEpACRo+FgUk8L6uSNtPoXCuNebY2qbVPbBRYHaECVZn/ULEW9j4
	 SRzEAI0aXzhDKAgS7HaQA/iHbTqH+YHTrMudGD+LEU7Wms3UC9PQt0VDae4gVwNEcPSOr
	 QgY0CuCYmwuwMxj4McaSp4wx7kg4O1vxK49TPkVPUSFtFllU+89bu0fHNwThQZOhVcKro
	 Cn0qZ2vnMfprs3Af746qQ2thjOoKdsa5OvZNX5lhwnBERs/Eenny6oT5M78TZPM35KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LSHYy5Md;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D42606A327
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 15:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7D42606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LSHYy5Md
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so3148736b3a.0
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 07:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793720426; x=1794325226; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWOQO4/BUeLCAM60Oj14E4iA/D66uZxulDoNLysenrQ=;
        b=LSHYy5Md6ANc9E/GezJlILsFzouBlHzl4p9s4w+rmYilEJoUQb/vze86xJDHIK/5Nu
         4k7DPEtRPrRePAtbaptd1jdI3l8Wb5DZRShVX4ZoIt1JDarGwjs7GX5FjbUZL8Da49nv
         n7WOFURejdHF+N6nJtKjwKJj1ZpM145LmDl4v5xfFCOF7ipIc+uHHEhFVNbVBqyz0PfM
         jpeZ9lcAWJ8uz7v4lJU25zBrOc9N8SEmm80HbyLHftROyCgMEouruLAMjZDzEiggVG1a
         nbXpaIAsY+cuhcNtQaOZ+yDvKtHa12EucRuL3aH6rDi6sVGHz+3+CzrXtaFQ4hH5oARp
         XzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720426; x=1794325226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EWOQO4/BUeLCAM60Oj14E4iA/D66uZxulDoNLysenrQ=;
        b=fXNI8G4GkU9X0cyc0NY3qBgxdp5NHq/wKp4G0kpPaJ6POEkU+AYJtGVX0EQhBXEXxj
         VfbjE2xbrJj+njBfVrSjqKoLyVtd0ON3RPGod+spUy7mVSfr+qvilChxWA0MlQxDOpwU
         00r184ViJoSDLztWGteM06VIYOxlgNyL7Je0FsFT+FQJ7qWA0Zc4JYxaJI1h6nWuUeiQ
         7Fv3JJn9yO8ugQgR/9fKXzUdOPMs1nuiPQkvn2zt9HnPL+UEs3c1w5mnTulPocJY7fKO
         SAoofBjq6nD2TiGEA21FbWOsZ2vgc+EfElpAYVJRXaWvPvfkbdhEr0qfFBeRsf/nKIZB
         FPDA==
X-Forwarded-Encrypted: i=1; AKwUvBzTMLAmK2LWi8ZBKPgBuGVNA/y3qgj8HHnUAs5kwLBCgC7jmHx37BVkpEEOx4aME2/UVQc=@lists.linux.dev
X-Gm-Message-State: APuU4Z9QxC+lKX+9FlcyAC7i/3ZECwwnQxbSLdTPE21xJ9t6Ds87W/Fr
	zYuY/GjiJFXQs9kNY4NbUZyh2f/02yInq/O3jdRz3m/1EN6pK8cr9RMKSleHWlrMjPU=
X-Gm-Gg: AYBFou2tSh8jCboQwllS5Aw43JihtjvxLCRk/ivGAq1Ozp982tmD3ylMq854z+x46WE
	mM45BeoM+TdBI7fIHeFY2IUykx06gltBURtdlb+MZ5BCofremQChtLx6uJbBO5AsVttjYiJ90U0
	H2njUtwVjYPdKDs6Ybb5VcTdU9ccdKRLxqBgQGSfCZ/LLbSN65dr6MRPHxHwgtoBLD0PCQYXEc0
	+2Rh65OpScZVYQIHOR2X9G3UiRl3lQ3M2H/oO4qjxcA5lrWXtEb8FYokrr5HyiK8H7BwY92dRVh
	almqbiEaHks5QEO2OWMK5aI8yTmZcQc6ftGvjtehGtsE3qbNXsgqZypv4JvlcjaUEANK3P3bOwu
	LSLVxZeJf31Y2dHKtBjl9Tx8xOXrllh3OUSN5T3HpA9/DRKZNlwyw2g2DqHrOLUPZxWU7XDY2Q0
	VbCCUypS4GAKgqR0qgFfF/9r3j1s+I02qXP9CKdVFUX4Zpq1N49tI/G3zl9LkZ9C6Bgwou3U9Ua
	w+/bqO8WvbwgnsT6pCO28wlpVBk6MTzUknYmPZ/8nrqbszdwfQ4RZzHJOFkFxnR9QB5K6U/nESu
	1rPfFqTCcM2tG2Pv7W/ZwYJ1UODW3g==
X-Received: by 2002:a05:6a00:3992:b0:8a0:1acb:677a with SMTP id d2e1a72fcca58-8a9bffd381dmr11899872b3a.57.1793720425872;
        Tue, 03 Nov 2026 07:40:25 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9b3e:1037:bf8:ee7d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d3603sm3345314b3a.37.2026.11.03.07.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:40:25 -0800 (PST)
Date: Tue, 3 Nov 2026 09:40:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <auoAZs66RA5OYjJo@p14s>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
 <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>

Hi Uwe,

On Tue, Oct 27, 2026 at 05:25:20PM +0100, Uwe Kleine-König wrote:
> Some devices have special needs about how an Elf segment is copied to
> the remote cpu's memory space where the default implementation using
> memcpy_toio/memcpy and memset_io/memset isn't suitable. An affected
> mainline driver is imx-dsp-rproc which includes a near-copy of
> rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
> accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
> directly accessible at all and DMA must be used to copy the data.
> 
> The new callback can be used to implement just the driver specific
> memcpy + memset to increase code reuse.
> 
> The patch only appears big because of indentation changes.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 64 +++++++++++++---------
>  include/linux/remoteproc.h                 |  4 ++
>  2 files changed, 41 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index da3cddbe7d4c..3c749a39e5da 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  			break;
>  		}
>  
> -		/* grab the kernel address for this device address */
> -		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> -		if (!ptr) {
> -			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> -				memsz);
> -			ret = -EINVAL;
> -			break;
> -		}
> +		if (rproc->ops->memcpy_tova) {
> +			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
> +			if (ret) {
> +				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
> +					i, da, ERR_PTR(ret));
> +				break;
> +			}

I really like your patch, but I'm wondering why you decided to move
rproc_da_to_va() in ops->memcpy_tova().  Right now it is called in both path,
i.e with and without ops->memcpy_tova().  Wouldn't it be better to
unconditionally leave rproc_da_to_va() in rproc_elf_load_segments()?

Thanks,
Mathieu

> +		} else {
> +			/* grab the kernel address for this device address */
> +			ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> +			if (!ptr) {
> +				dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> +					memsz);
> +				ret = -EINVAL;
> +				break;
> +			}
>  
> -		/* put the segment where the remote processor expects it */
> -		if (filesz) {
> -			if (is_iomem)
> -				memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
> -			else
> -				memcpy(ptr, elf_data + offset, filesz);
> -		}
> +			/* put the segment where the remote processor expects it */
> +			if (filesz) {
> +				if (is_iomem)
> +					memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
> +				else
> +					memcpy(ptr, elf_data + offset, filesz);
> +			}
>  
> -		/*
> -		 * Zero out remaining memory for this segment.
> -		 *
> -		 * This isn't strictly required since dma_alloc_coherent already
> -		 * did this for us. albeit harmless, we may consider removing
> -		 * this.
> -		 */
> -		if (memsz > filesz) {
> -			if (is_iomem)
> -				memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
> -			else
> -				memset(ptr + filesz, 0, memsz - filesz);
> +			/*
> +			 * Zero out remaining memory for this segment.
> +			 *
> +			 * This isn't strictly required since dma_alloc_coherent already
> +			 * did this for us. albeit harmless, we may consider removing
> +			 * this.
> +			 */
> +			if (memsz > filesz) {
> +				if (is_iomem)
> +					memset_io((void __iomem *)(ptr + filesz),
> +						  0, memsz - filesz);
> +				else
> +					memset(ptr + filesz, 0, memsz - filesz);
> +			}
>  		}
>  	}
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 00019b1895e6..e750a127cbc4 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -75,6 +75,7 @@ enum rsc_handling_status {
>   * @detach:	detach from a device, leaving it powered up
>   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
>   * @da_to_va:	optional platform hook to perform address translations
> + * @memcpy_tova:optional platform hook to copy data into remote memory range
>   * @parse_fw:	parse firmware to extract information (e.g. resource table)
>   * @handle_rsc:	optional platform hook to handle vendor resources. Should return
>   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> @@ -99,6 +100,9 @@ struct rproc_ops {
>  	int (*detach)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
>  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
> +	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
> +			   size_t filesz, size_t memsz);
> +
>  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>  	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
>  			  int offset, int avail);
> -- 
> 2.47.3
> 
