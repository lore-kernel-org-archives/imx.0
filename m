Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F58309F1C
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776952807; cv=none; b=DjhRqf2OKc6mR206naJj7I5E6NxteYCnLAehoPWzpMu41oC8NjWolV+nYtu335eXzJBZfPn9v7kpC0Ro+Al7xV4CuRuA5EM2RjWzGKm8ihFeLZXE9cW1YcNWaJGFPsU0x2kVdDujJwF/SK9GdO4kAUXe5xh8A6pBST4aYHq/BBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776952807; c=relaxed/simple;
	bh=gLaOZ+0CJ5XcMWDzfplO2kHNtswCLwLl1vi3S0NcV2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dudcbYZJgJkOdAqmwDb8zVwY2IkiKDcCORNAOFeo9IGCcIvlIzAX2jS83woCzGis8SUaRFG08RjNPfQZB6PXN9NK2tHwQlPH8s1w53s/JKVhF2WFoU8IUBFRiyXAtKFSG8FbC/aeOAJbrjRjalKA1pcW2w+ahS4D0cLn94soNw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qVuZUcxe; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qVuZUcxe"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a58057d7baso80976176d6.1
        for <imx@lists.linux.dev>; Thu, 23 Apr 2026 07:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776952803; x=1777557603; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=czhe1w4ZM+L8EEg+cKkl72+4034NAZ9Z42uDRZvhME8=;
        b=qVuZUcxe3zgtP2OJ8DIDmbdb0lPswvTNhZ4N/tH8lERRmwnG8k079/UZ914olcQA+r
         lw1HSwMNzx6V0gW4WXDrCprYeBU4KrDQUSDlgmjSWYQObNRXbYQbX46sq601ktAAAm7u
         h+Ssptah7BmFQ9v9eom8y282FMfInX/goHAfc/cNJSLaI02jKxRSyo89DNQ1r7deOviD
         dPO9a29DWsfZClOmjqKj2rVipyIM8lJCI2mbc3YRPPbOSotpzdo3rs4EjqNP5XGX7XDp
         PeVsYPoQUh1hNn0I9tXNZGulx9widQBFxIpFASmX7yhcZ8VecbIJ+qketKCjRKxsEnX4
         38qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776952803; x=1777557603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czhe1w4ZM+L8EEg+cKkl72+4034NAZ9Z42uDRZvhME8=;
        b=kSYD3+7VV7Hx0KxFNBGokoHrmmoaIvswe0/SUld1Xsg7X7bX2RzBPhMscOVZynU52g
         tQBmRkCeaBFuErJrFBmIRN8HgxifqXx8HmrhbtEOyHNyHl68vYYZlf3e0G1NU7nQqnt5
         VPfwYBaWT4s5eFjXwl3nYrRt9Uwe6vkBHuk0jg0BM0hGAHju6HJ49/VKpzp7x50HkP60
         BlfaNa2I19T9RAeLf+RwZ/5/gfU/PEQjRZnwR9TaoDhwtnPyzTSmex6hoNj4C2Esu3VE
         3oPvmf8ctagZs4ZLObt1NzqB/U8CfjmQ+/5dhIcQyvfmKAUZp5GNxoUlsdnfXehov54V
         t+kg==
X-Forwarded-Encrypted: i=1; AFNElJ9CG3QVXM6EyHE44gnQVgi14TUPb7o4fLB1JehIpT27SUkTNX9bVOaAsiAvdU6r4R+QXts=@lists.linux.dev
X-Gm-Message-State: AOJu0YziGcZ3sOv6cUsvxwbmFw87hC+F5eHH0uLDXne0GnellPYPaRMa
	ferB7ojVMC2bKoE6diGVGZqx2W1C87pXUzseX1b9b9n9ur4rOwTWY+G5Tk+Maiwyqg==
X-Gm-Gg: AeBDietAWWksJr9OOZcQzzzAcLF2FYKdcF//EjJtqHD0b3GvvTASn3+rmc7NTtCiP2o
	5u22P+Mcv7yyQ1H0eORHloqJ1UgomDLcLBUWMlSXuXr/bHqY7cMjT4gdeZWph+hSTdSSl3Dh7PX
	MzArJGoGtxbjmvXc0pFTkh4sERnjBfhp1kw2U9kCMdodfyIGjcOSIyM1XGIsS3gSOF2L3HEhtNk
	WY2Zws1kUb4LGIR0EW3Tj6b/TDUDE8CHaZO1j7dXvqNp4DvSNxUerrQoKH0oY09hyHHfkK7THwY
	cXwxbghFWO1nvzjQYGt+CZYHbDreEG5m0WWlz4fbpWoi8xJheq5aKClTa4ELJbKr8V3dRmMfglE
	nU7P1KKmGpUrJNiZj6peeh92chjr1UZnby1FuijfzHds7Y4AzyJu9Kaw0fgNrjKIOgVt0sNuFKN
	+T5mJ9x0oc8djLVbGnR45lTUsrPEH7mBdYh1MvpLfSIVb9vnrjTlR3
X-Received: by 2002:a05:6214:4c8a:b0:89c:a2b2:8d44 with SMTP id 6a1803df08f44-8b028112da3mr383141476d6.39.1776952803365;
        Thu, 23 Apr 2026 07:00:03 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b205cc0353sm49200826d6.10.2026.04.23.07.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:00:02 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:00:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, khtsai@google.com,
	kexinsun@smail.nju.edu.cn, hhhuuu@google.com, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: gadget: udc: skip pullup() if already connected
Message-ID: <89b6a6ca-137b-49e2-a796-443e7cb58245@rowland.harvard.edu>
References: <20260423095355.2673035-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423095355.2673035-1-xu.yang_2@nxp.com>

On Thu, Apr 23, 2026 at 05:53:55PM +0800, Xu Yang wrote:
> The device controller may update vbus status via usb_udc_vbus_handler(),
> which tries to connect the gadget even though gadget_bind_driver() has
> already called usb_udc_connect_control_locked(). This causes pullup() to
> be called twice. Avoid this by checking if gadget->connected is true.
> 
> This also set gadget->connected as false in usb_gadget_activate() if it
> became connected while it was being deactivated. Otherwise,
> usb_gadget_connect_locked will return early and pullup() won't be called.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> ---
> Changes in v2:
>  - reset gadget->connected as false before calling usb_gadget_connect_locked()
> ---
>  drivers/usb/gadget/udc/core.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index e8861eaad907..60340ff9edbf 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -712,6 +712,9 @@ static int usb_gadget_connect_locked(struct usb_gadget *gadget)
>  		goto out;
>  	}
>  
> +	if (gadget->connected)
> +		goto out;
> +
>  	if (gadget->deactivated || !gadget->udc->allow_connect || !gadget->udc->started) {
>  		/*
>  		 * If the gadget isn't usable (because it is deactivated,
> @@ -885,8 +888,10 @@ int usb_gadget_activate(struct usb_gadget *gadget)
>  	 * If gadget has been connected before deactivation, or became connected
>  	 * while it was being deactivated, we call usb_gadget_connect().
>  	 */
> -	if (gadget->connected)
> +	if (gadget->connected) {
> +		gadget->connected = false;
>  		ret = usb_gadget_connect_locked(gadget);
> +	}
>  
>  unlock:
>  	mutex_unlock(&gadget->udc->connect_lock);
> -- 
> 2.34.1
> 
> 
