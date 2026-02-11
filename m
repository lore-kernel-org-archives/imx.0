Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD7D1A5B9E
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770822280; cv=none; b=kp4lQdQ71OnPjj6K0d1VFK76g6fMfB3syB13crYki52BOJOQ4wMy/KmRhpk5vhBMj+drh/9YxR7PuFi8KtNXiiztXpZ9WAC4aZxQ6NQw3yVoMQv9xal1hMovf+ASxhbE7asa3p/2ISXyQi2pmNgHCXTMBaII0XBUB9njKTFbWmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770822280; c=relaxed/simple;
	bh=AmZMzOclZ8x0kbRdv+6orlxHCTBrmpBGJ67CosDnpSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvGPSI4jLoFTzSZa0uAhHtKrZ3XF63mQBF3QbSVr+YrdxrLEQ0X5uzf/ibCj5878tHE6kTZT2MlAh7N6MUgfaLXAuB3bgCOGA3V4wYpkLJUgGZGc3gKuSBFREvPjTHGgmztwZauhlSMJYKHXEx//2RbDeC6KQLM+MdJ3t1ZPEu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=TtOKodBt; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="TtOKodBt"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5014b7de222so69123641cf.0
        for <imx@lists.linux.dev>; Wed, 11 Feb 2026 07:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770822277; x=1771427077; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQ2XuMNlJ0VrBoxBJpOB6BdQH/fRgWhyXV6P5UB4GYc=;
        b=TtOKodBtCt5ZnJHcdBuc2YpWTFUyLRY9VGKGX/Y5Ziw3iXOAzvEWgw0udjNk5Qybc/
         lG4WArIlkNf+f/kVwhaJeXjXGLvLDjSFqxF+9mjNs3Lwk8V4yvH3lYKeXJBHbKYVnBAt
         FM7iDbBJOOCx3EoPzymVuqjRJC2QcivDxmdjDWiv9P7ynEIn+qt46GeZoYMamm3RexhN
         frtui3g7joH60lj3baEcGmf/+BNDAGLkuoWv6dVFcU4MuOtpoca8Cy9qg1gTdyrrI4Eo
         mAT+1qEa9mqjoi600/zepJvwWLucZXIYv3cXTDf1i+5/WMoef/e/i8cWfsrThKIEXbt/
         5/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770822277; x=1771427077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ2XuMNlJ0VrBoxBJpOB6BdQH/fRgWhyXV6P5UB4GYc=;
        b=Oas8Hvofbc2sH4GYvfDk9XaHbho67DKPAngE3zZZTMB+F3fF9kL6UqPtqeZgBSiFZY
         h7rM8/RbGaj60t21+U5cyJ61pOtasEZW6cjxTZy8px90/s+tdL/o0kLEH3k73pUQ6ZiX
         ZUf4RNsXh+mUnNPZHztEXuTYpiGBffY+cJercoum/1Fgjb18yYs97vVRKAQX6P5nv4Ns
         jp0xZ7JWLmWDHKbYQt64s/1ENfYDLBTnA4W0RN6lsni+uggkvBxrlMISirCk7Xcl4kDE
         LG0+itlONrnv1qHs2gIWGdm6OmnBALwJQvF671JuLVcB+RA+d+HqCOZYzHvFLIjk6Z+y
         wClw==
X-Forwarded-Encrypted: i=1; AJvYcCUzuTeBkgQfifBUt7o/48sevARhuNdK0VvjCsgOQBAtXfiyj0QG4/q5x9oYerIFXY4u1pI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0fUGCd8J+Bj1gg5a8wXYxpVaEb9PrNKVZfdnreBAvNdL+Bz5x
	eoXWJr/WxDHi6uiGqHYVP5ygfwiO6DKGhrBfDrSGKOzQ+ubQPGORud+L4q5NYtmSLXLH3zCtYyg
	gdeA=
X-Gm-Gg: AZuq6aKFh1QpGDkV4q56MtxOspykj4p9wx5rMJfQEmybnePB18gL82SayCd6AYJLM1n
	JPAWX1vrxvmg3TfDVN/+HHBAf72K9UZO7nsxl6WDgu8Lvvr9telRCwMO+ath7MGJDjnQ4xZPrL5
	e2Styv5BrPSkaAOP3zs1PbJysjOFMV+4Uno6KexmPRkv+HB4+lo4M8ZcBQT+xWKeu38cjPwxugu
	XubiyvuBYyLji/NH22EWqXkTjk9AQs/yjksY6zVlvtfjv2R4qhKfpOIplJvIoBEszUThAzpvRsH
	fLNk3N9cONnNd4GzlXpKt38kDeS0YyXDK+tI20sMX6+v2nTP9AZG+RHpj5QApgnC2mEiLY9RB4Q
	VHxiG2+CVvSnPPQ0OU3TmrPwEvk/O8ze7JXugY+hU8CH9Sxy3A1Gv7uOGv4YOfgeAXxxfWLldiG
	SfgEVe4pG8VpW1uTo727TZ3ysXzlHZ883h4zRHFv1AuA==
X-Received: by 2002:a05:622a:11cf:b0:4ee:2984:7d93 with SMTP id d75a77b69052e-50673cf1ec0mr71711981cf.17.1770822275252;
        Wed, 11 Feb 2026 07:04:35 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cda750dsm18472026d6.35.2026.02.11.07.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:04:34 -0800 (PST)
Date: Wed, 11 Feb 2026 10:04:32 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, m.grzeschik@pengutronix.de,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <1be3ca8a-032d-487e-92f4-67b2070be213@rowland.harvard.edu>
References: <20260211103628.3265850-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211103628.3265850-1-xu.yang_2@nxp.com>

On Wed, Feb 11, 2026 at 06:36:28PM +0800, Xu Yang wrote:
> When disable the root hub port, somehow the device is disconnected and
> re-connected again. This happens because usb_clear_port_feature() does not
> clear a truly happened port change. That says, in fact, port change event
> may happen after usb_clear_port_feature() is called. Then the subsequent
> port change event will have impact on usb device suspend routine.

This is not a very good description of the problem.  Here's a better 
one:

When a port is disabled, an attached device will be disconnected.  This 
causes a port-status-change event, which will race with hub autosuspend 
(if the disabled port was the only connected port on its hub), causing 
an immediate resume and a second autosuspend.  Both of these can be 
avoided by adding a short delay after the call to 
usb_hub_set_port_power().

Alan Stern

> Below log shows what is happening:
> 
> $ echo 1 > usb1-port1/disable
> [   37.958239] usb 1-1: USB disconnect, device number 2
> [   37.964101] usb 1-1: unregistering device
> [   37.970070] hub 1-0:1.0: hub_suspend
> [   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
> [   37.974412] usb usb1: bus auto-suspend, wakeup 1
> [   37.988175] usb usb1: suspend raced with wakeup event         <---
> [   37.993947] usb usb1: usb auto-resume
> [   37.998401] hub 1-0:1.0: hub_resume
> [   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
> [   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
> [   38.118645] hub 1-0:1.0: hub_suspend
> [   38.122963] usb usb1: bus auto-suspend, wakeup 1
> [   38.200368] usb usb1: usb wakeup-resume
> [   38.204982] usb usb1: usb auto-resume
> [   38.209376] hub 1-0:1.0: hub_resume
> [   38.213676] usb usb1-port1: status 0101 change 0001
> [   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
> [   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
> [   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> 
> To fix the issue, add delay after usb_hub_set_port_power(). So port change
> bit will be fixed to the final state and usb_clear_port_feature() can
> correctly clear it after this period. This will also avoid usb runtime
> suspend routine to run because usb_autopm_put_interface() not run yet.
> 
> Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port power")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/core/port.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index f54198171b6a..a47df5d32f7c 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -141,6 +141,7 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
>  		usb_disconnect(&port_dev->child);
>  
>  	rc = usb_hub_set_port_power(hdev, hub, port1, !disabled);
> +	msleep(2 * hub_power_on_good_delay(hub));
>  
>  	if (disabled) {
>  		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
> -- 
> 2.34.1
> 
