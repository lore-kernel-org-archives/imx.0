Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C433453365
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751553329; cv=none; b=aREj4f92YLoxmh28TnT3bUXmEyrw7HaixFGVOBGTdy9uJuAJfSDSm5viPpx4RS/3EX3SORoPg+JU8f2Gm4VVuDeomW38Eek1MRFgKZPCXqwG/NpqgTzyn2vXN3bNnkmINeHMTNMPYbWJhN/fsKdi+N0g8mEq0SdvnCvW4adGXIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751553329; c=relaxed/simple;
	bh=Y+evtO57jDRO4cx5S0JrB8XOjRXeEqoQzMPAkDgXmEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HX9UVvDD5bH0TmqP2x933qjvYHSt1rAvYGo8ADJLDJJQdwrCwseu+n+gD19d/U9wFOGcqlY/Vj7LJWXqOmG0S7cVFWFUzGvxhLAeN3PL8wau0lT4ipOeOv3fFkNTm65STezmCSow9tkryCpcPIJI0v4aX7/Z4fI0qKHF9IZC4o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NjHlz1f6; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NjHlz1f6"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a76ea97cefso55616751cf.2
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751553327; x=1752158127; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kgzlPHtDsUP2XFZstpiCKw99h73zAxNOOZoeiHHd4NQ=;
        b=NjHlz1f6MUY/A+NO0tyT5pvRdA7ThPgBzrJH8zpFh26MAA3oN1BCUd9C2lf8w4hDMs
         DOo7B1vGX2O/DJwO5IX/jiw+Y9QpMd5e9sRgyzpxxekv7xSqXVa17Vm1y2SIOQhPzhUR
         VXJgfCHeInVzw4Mr5pSr4pNaTygdMXbMDPCOBd2ZYEmHDfcKU/MDnsyK5HevPNZdo9RG
         CdjUL0MalTJp1yjUjouxqvWv33Y/lBp49Jqd0JIHnMY6m5y+oDR4976/vwQ/IEKtXFQp
         0BcIn3NIwNvMNKcofjNRU6EoC1mmjpJpXymY0l4IAbl2nei+qwHOdaCrL3vCvoEPvz5n
         Evyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751553327; x=1752158127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgzlPHtDsUP2XFZstpiCKw99h73zAxNOOZoeiHHd4NQ=;
        b=duvt3DqNB30HtDpNoQ5feXbPT+efQlkmAJlnLqRHFGhwxhzV3YuTc/Hcq5nT54It+G
         m3oB68UjZmmTVDerRZtZwaBpo6zNs+A9i/kLd3EKnZ2YOPKXoNjtGiaYNBoBivNQamFF
         iMdjiTSVkVozGTXJZcG6/hynj5dCKUKg9HdxtkCcXaD1U0CCqu7wqew/Hh068GH9BBps
         6kPdFbPimraXKR89binSPmadmqlWoU7QiW5UV8MifMegaFE/oSX+ie15z6a6VRe2N0s1
         mM5Y0Nz//ND0PV7uk/KC+rB1xGKXewsDVypbh3vneHNEAoVqR+UOeYjP6rA5fn2Y+FEU
         Nx1w==
X-Forwarded-Encrypted: i=1; AJvYcCVmPOWlQLjFpLdVeZFfiiolqvII19w683OPsQd7BhARvvrNgQ/hfvRcrdiq9KzY34Q8vtA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/bd8xqOq/PzkjNZ9+seLJ3q7tQHsbeoM5Q1Ygoj5r9ivA/3yi
	eLrP8x/jQCKoIBjVv6r/b4lHAZNuoUKSfb4c6E2PHw2ZlumJx1xH7Hd247yDe6i51A==
X-Gm-Gg: ASbGncusvpQQD/2qZBb2Itdect8j82c6iDSfpI24CymPQfClMHccpBMn8sYrINeX2Kl
	WR8+AlLGdoDKQsHYEYcy0Y+8HdVVnIkur3P1qPc81x8DBDW3Fk9a9oNmdZjgnlkB3/A+zkQouBa
	di2amyFWYwMb0aZQmC5XM8t4recBHfKZ8Gv5dKEx+Qbm847l3Jgy16WxqHLMYrVCE2uD32+vsQx
	6Jpfdmfb1DkJsy5vannYfu94fntNzn5RkQD4//mGYt+MZUvmcdey7v0LaaUTbAIvZHpTpfpdRoW
	5gyuLG5THlJ4OzDBu5pwfmexGEC+jS40FIw6/2y5Ca5wYYOgsk8pZwM/BVrxuQChYk9R81eLfb5
	NINji
X-Google-Smtp-Source: AGHT+IGK8KAo4mpA+JVTB3ZTXwVBkpsgEauagc0TG5bpf3JShjIVuuf8H4Nd2foOv6ZumStKh0znCw==
X-Received: by 2002:a05:622a:5143:b0:4a4:2f42:a668 with SMTP id d75a77b69052e-4a9769765b0mr144026911cf.31.1751553326431;
        Thu, 03 Jul 2025 07:35:26 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc55d92esm109947251cf.49.2025.07.03.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:35:25 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:35:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <30f04c8e-5074-4262-bf5a-da022b89c276@rowland.harvard.edu>
References: <20250703103811.4048542-1-xu.yang_2@nxp.com>
 <20250703103811.4048542-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703103811.4048542-2-xu.yang_2@nxp.com>

On Thu, Jul 03, 2025 at 06:38:09PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v4:
>  - improve if-else logic
> 
> Changes in v3:
>  - put Return section at the end of description
>  - correct some abbreviations
>  - remove usb_dma_noncoherent_sync_for_cpu() and
>    usb_dma_noncoherent_sync_for_device()
>  - do DMA sync in usb_hcd_map_urb_for_dma() and
>    usb_hcd_unmap_urb_for_dma()
>  - call flush_kernel_vmap_range() for OUT transfers
>    and invalidate_kernel_vmap_range() for IN transfers
> ---
>  drivers/usb/core/hcd.c | 33 ++++++++++++-----
>  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h    | 11 ++++++
>  3 files changed, 116 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c22de97432a0..42d9d8db0968 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c

> @@ -1425,8 +1431,10 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  	}
>  
>  	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> -	if (urb->transfer_buffer_length != 0
> -	    && !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> +	if (!(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> +		if (!urb->transfer_buffer_length)
> +			return ret;
> +
>  		if (hcd->localmem_pool) {
>  			ret = hcd_alloc_coherent(
>  					urb->dev->bus, mem_flags,
> @@ -1491,7 +1499,16 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  		if (ret && (urb->transfer_flags & (URB_SETUP_MAP_SINGLE |
>  				URB_SETUP_MAP_LOCAL)))
>  			usb_hcd_unmap_urb_for_dma(hcd, urb);
> +	} else {
> +		if (!urb->sgt)
> +			return ret;
> +
> +		if (dir == DMA_TO_DEVICE)
> +			flush_kernel_vmap_range(urb->transfer_buffer,
> +						urb->transfer_buffer_length);
> +		dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
>  	}

This could be done a little more cleanly.  It's always awkward to read
an "else" clause for a negated test.

Instead, change the "else" to:

	if (urb->transfer_flags & URB_NO_TRANFER_DMA_MAP) {

and move this whole section to the top of the big "if".  Then you can 
change the test that's already there to:

	} else if (urb->transfer_buffer_length != 0) {

Alan Stern
