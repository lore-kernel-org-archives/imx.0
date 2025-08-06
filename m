Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8366B1A23A0
	for <imx@lists.linux.dev>; Wed,  6 Aug 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754491716; cv=none; b=lBmM6w9EsJrm87AJfdamI0TlaUB4V7eBeYGHvzlbBeTWVGj3qFWiBWbN33d5/kwjNkm3wmvb3OciUN71FvpVzN8bUfpjiBa3ZM2vaGLLalmoR8H0oHLZBz2vL/ZEJlfgzX1Mj3qXQVKIRX7d/A2lKdJ2HKOYjzQHjdcNYuv//UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754491716; c=relaxed/simple;
	bh=/WaxHr/fcNNvwBMyYXeMTnOq8nei6iL8c2DAY83YZms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzkFBHpCkXxyTHMCCuRiCQm19pU2HQ5XI24zOSsiOmYvJB4a2bCArd1fzJ4bA2gvMRvWhtF6inHTV2SktHPmjAhn6UWAc+r5yjHLllnNJjqA3JD+K8uSkcUUvcxEyfWuqVXPUJalNhVHGXujD6L5hXDb9HjIDHBZPLzTFFxapZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=W5/NmI/J; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="W5/NmI/J"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e6696eb422so678493985a.1
        for <imx@lists.linux.dev>; Wed, 06 Aug 2025 07:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1754491712; x=1755096512; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+IXGiQjY6etL1HijGeumViSvmoghZhD/MAbBHOTCY8=;
        b=W5/NmI/JrabXPrd8c4kXoCg/0U5XJz9M2VmKt6QCDh0wFGafawIh74fnIEzkgYaeoK
         cVC7hcbTVl83TiMWxglFRNMTxTW80HYBOgC8N2wIx4uAXkSZXlZGnpntCGE1iveYOwon
         3VazlqD+jJ3tUcBMrksi7TF/v6aR1Vl93vG1XYqgkfcPtM+4bWXFsgw7aITlwLLaTtU3
         zH1dsk5cfgwxA29wWiqayl/FpwmXyPVRCBKouPf2saX7sVShlZUDXk2vTkXDbXqW1DVN
         IEJnFleC3Kleq0lm3o4lxgweFPuzxWbly3mvIYyupOkvPDT3DInMschuUp40EZLf9Gmu
         tUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754491712; x=1755096512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+IXGiQjY6etL1HijGeumViSvmoghZhD/MAbBHOTCY8=;
        b=czWpKwoqcxsGUOcAL4ptSIHR7AtmnJxgYHwYK1EDbu5g901wLy+wBzEsxXHMQxyrEc
         oXTOzUIUH4TdbbCz5tKrqquvSsPrXFJSjVfprfRMZcOsmH5M/c50CFKNvK8i6n7PrYT8
         QlawvTIpSvSbV4M8ATXQ44GkUe4OD+Epr7tbFHlzxHslM0KT1bpXnduBZJoxMtOjPLuf
         9+kK0Oon8P4Y+EkHJSUqC9bbBTCgr3IXwBxMNGaSV9qvHj5Q/GBFF77U7JKsof+Gzsgg
         ASb3Rf9vhHAeUCrd0oOqjqFrxMIjqRPXTOGzbJNp1UZOynL7AFxsy4gpc+WCvxq2N4jn
         ceSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxPkFDcLnjnMwHJ3t/kgpp3RzZJRpoItnsMl0Z8hLPtLpXtXls1cHkkC3EzDwj3jWeMMw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1w+QGxgHW3wCiL5jeaIvU6xCgwRbYAwUfMTWks70zswY70erD
	lQv0G1AQSsm66JrgEpFxk3V5+Ct5+vK4qy+ZByn+rInLiFEQY7PpSxCAWI4wmr8vXQ==
X-Gm-Gg: ASbGncthI7c3ZeDPvWzrqN3LvHSp+vk2JXc23O7DKhvIvcv2FO3cpkIOKrDKeRqbpLE
	1CTFLHBzYUWC0S3KkwKCxqE4sOgCAkHBrCCQA/lweEryQrpTQvTRWOw3Xlhw3vWLx1WjTLp/ZPy
	1kCqsEmQRaJCSxLZ+HPaRBpssJTgmpUv1HGi8Jac38gC7BAlLUUenduWXxL1UbnbhcPiPiVxUWG
	TkSow7KdQCkdDqN6Tj/7YPKfDprUjz3JcXSM9QHjRS+MAZHb9vSt16sRYrHJla0cUa1oJEwJeb1
	KKpCJUD4daBsnHgUtVZLrMV5fmz0xVTYyu9z4wlZvNV3PrFRvAf53uHpBbDL//dVpjyh7SwwMYf
	8rNM9DMPreGQ/YePcLggbcbAzlwXAbjBVgz8NRek0
X-Google-Smtp-Source: AGHT+IEoV2J1KPJpYzF/n7at19yY+noWoVgVnUNgi+OTjlcXhUx/F0riVfkSgi2p1CxUP3mVELiYww==
X-Received: by 2002:a05:620a:2914:b0:7e6:9c12:f0ce with SMTP id af79cd13be357-7e814ed1dadmr517512885a.66.1754491712397;
        Wed, 06 Aug 2025 07:48:32 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm445254285a.82.2025.08.06.07.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 07:48:31 -0700 (PDT)
Date: Wed, 6 Aug 2025 10:48:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	jun.li@nxp.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, andriy.shevchenko@linux.intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] usb: core: hcd: fix accessing unmapped memory in
 SINGLE_STEP_SET_FEATURE test
Message-ID: <2f0148fa-ba18-4711-81dd-89da3bdd1627@rowland.harvard.edu>
References: <20250806083955.3325299-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806083955.3325299-1-xu.yang_2@nxp.com>

On Wed, Aug 06, 2025 at 04:39:55PM +0800, Xu Yang wrote:
> The USB core will unmap urb->transfer_dma after SETUP stage completes.
> Then the USB controller will access unmapped memory when it received
> device descriptor. If iommu is equipped, the entire test can't be
> completed due to the memory accessing is blocked.
> 
> Fix it by calling map_urb_for_dma() again for IN stage. To reduce
> redundant map for urb->transfer_buffer, this will also set
> URB_NO_TRANSFER_DMA_MAP flag before first map_urb_for_dma() to skip
> dma map for urb->transfer_buffer and clear URB_NO_TRANSFER_DMA_MAP
> flag before second map_urb_for_dma().
> 
> Fixes: 216e0e563d81 ("usb: core: hcd: use map_urb_for_dma for single step set feature urb")
> Cc: stable@vger.kernel.org
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

I guess we both overlooked the fact that the URBs used in this debugging 
pathway get submitted in two partial steps.

Alan Stern
