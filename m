Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DE313B2A4
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550426; cv=none; b=rTcusI/ZmKSdJupQNkzJYzAUjM13r+pGfsvDYFtxYfSnhpAxGyWTnq64JpmRPJfgmRKJrzlUOEAGdTVIcy+Uh6QYpKUucFp4VWQqL4G0XWH1+KnD8PMX2MvZ54htg1ZXXlEFgA9DmZ3JyfNdAcp5j1wik2EdlCbCQqqK4o3SC8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550426; c=relaxed/simple;
	bh=S6uSAFxgMusmYk+i3vZCmcqElpNigeA5L151mpjtU+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9y+qxj/4ij5/ct+AO7YI9yaHA2NckqsuwdN0eTLYehYpcUEAILSNIR1iiiBiqaArrsrOLTI9VKiGf+Z9J+uHtHtYqCsAdSHbRSeEoljV1OqLp3wONKFZ8cmElwUFgTjPAWUx6SM2uQmAHSCbREn8TGzxJrVs1Fq+bHa7rppVZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IppAcybY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IppAcybY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751550424; x=1783086424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S6uSAFxgMusmYk+i3vZCmcqElpNigeA5L151mpjtU+0=;
  b=IppAcybYPBgpQanhbrAbuMYAO90KgsRDVtV3/2RYZlFvtZ9Ohx72bBSp
   JbnKdhGngHVcfdmp13215nZ8h8hjfSYE1LqlLgUPI/AUaT2Dxly598tEA
   5dqFGsqZjlOBxJ3lsHZzo/2+UHK3oUHedbcUJtMzGtVxGqH9JNx/hGwer
   WLkxVTCQcCMyxNEeIG8LkyyLUuOStIzFX3rH+U9OTjZpwa+5Zl1N56mOj
   lKloAD3jiBB+jaa8Dn2zO64rkhNgYzMeLF37gAOu57UGM9/IIZTqKHHUK
   0cVJVvs2QnNrvEX3WsTC7XZ8A9chW+Hi3n1cLiKasuPiHpt7a2zaxplGU
   Q==;
X-CSE-ConnectionGUID: jukXJZd+RH+fpgzMi3rDXw==
X-CSE-MsgGUID: SF9LwWWWTkCV3IZhMlLIGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79312719"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="79312719"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:47:04 -0700
X-CSE-ConnectionGUID: gaDn8zDxSIapXB2tg+gNfg==
X-CSE-MsgGUID: qw2BXUjFR1qJyb9Msal+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="154945203"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:47:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uXKHB-0000000CDdl-1PxA;
	Thu, 03 Jul 2025 16:46:57 +0300
Date: Thu, 3 Jul 2025 16:46:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <aGaJ0fS25bDoLCfH@smile.fi.intel.com>
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
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 03, 2025 at 06:38:09PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.

...

>  	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> -	if (urb->transfer_buffer_length != 0
> -	    && !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> +	if (!(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> +		if (!urb->transfer_buffer_length)
> +			return ret;

This return ret out of a sudden are quite fragile. Please, move to use return 0
directly where it is supposed to be 0.

...

> +	} else {
> +		if (!urb->sgt)
> +			return ret;

Ditto.

> +		if (dir == DMA_TO_DEVICE)
> +			flush_kernel_vmap_range(urb->transfer_buffer,
> +						urb->transfer_buffer_length);
> +		dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
>  	}

>  	return ret;

Ditto?

-- 
With Best Regards,
Andy Shevchenko


