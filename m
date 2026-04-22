Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC71A28A72F
	for <imx@lists.linux.dev>; Wed, 22 Apr 2026 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776867879; cv=none; b=a2VRsLNXnuNtTtl33zYFFtLJh7uA2ETRashODBi6Fjh7V4mnLmT0OWxPIDoJrOc99/2wWsnL/XjP4clIhxpLr0YS2gS5SQltA+KAskT0c4yNGHgQMl9cIZnCspcKP+e4k/2WZT4AeEhNrJNpHhhalUHyOl7ZcqHmmk+d5Q/IAm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776867879; c=relaxed/simple;
	bh=Uxvd0KqwaXo0u2n8Yj1F6rTUdVtaeT+W3t/FWkIUrKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eN+t8s5GRu4NGz79IjUdY1OjeARXCy2jeoBgO/7cC8z5iN/jkExx9Pi0rZnRvvBlB9h1T2edtmJZ+rbip5cMEk1xdKrTHzsJ7o6asR4qXNhaPY6jCremAMGlzYW6udOzgJ66v4mU78857t7f5RvFJyisoDlKEOY8IXGSzqviE1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wodnvFSP; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wodnvFSP"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cb38e86cf2so517286985a.1
        for <imx@lists.linux.dev>; Wed, 22 Apr 2026 07:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776867877; x=1777472677; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+YAjpkmeo8k9M81XAobtJXWA9yyNfkttkyDTeEyrG8=;
        b=wodnvFSPfhoS7ZrYHd51RbQNiJyMuJc/IssPL7GxTkCwylZbjB0ilQfljGOLAXXzQi
         PckjO+T3wstLXEVC6DSKUZTird3XERVK1iLlHBeCjCTT/La3P2oBXmfUSmHvNaHQgVLU
         sU4XskS8mzp4C7B+fEb/QhpU6j3uSfDW0nY0msopzEEyBanLy8VmW2dD2piirn2+piRK
         j8b++iU9GQutwITMGElKXRCKOBfZlcLqu4quB3EKDU11FX4LfFtsMilVRulg5G+uFNoz
         Pgr+SZoH5VsPSLrkl+8I9h6FoBPYG2JU1IDkeZTqc0svDXRvWtvwY+iOV7N9yOaB314A
         Z0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776867877; x=1777472677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+YAjpkmeo8k9M81XAobtJXWA9yyNfkttkyDTeEyrG8=;
        b=jkLds379qYLt6cXMhjhQwnqPOfu74nz4NFbUPKqfHHVgkzjdwDgpMb8OxRmRPmG0dB
         7FXaTIzDw+NlQ+DjbvmgbEMAK2VWZO6HJZp/c4zmXoF7GZamaYCeZQ2gfykDdJGOJynN
         G3Q7PxUq0fUf7snw19mWzp+/zDWJejOY3h0wMAa/cy4kO2LlCaywUb0eHzPdVp5RiOEg
         F6H8id/YGYnVg+3cbxPXgLCAJUUAS/1tlyhNBJ/pWpUbG2u036NXOgS10KanzLnpPW20
         Jnoobh741dMIX1jwHAx8SOBAJsXyzE+hxXRXNdPhU9Jl+jg3OnERjNBDoyL75E0i1Ooc
         vAhA==
X-Forwarded-Encrypted: i=1; AFNElJ/uUi1O6zGzQNwzhsTwj8+02StSbmpyiERJ82k/Ubur+R2fKRG/iY6GR761UIJaq+ou1Co=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUm/VTEA61zp1vI9wY2Tn1sG5ItekhS9pEPTySNHaBkBkQWRwB
	QyizI3M7LRpdDqPFDdcLkYv6+JL17mC422UOSrnSHAa3u7hXjmu1v+zQR92wWhNUGA==
X-Gm-Gg: AeBDiev8weOnb4xT9Z3KNmqe3aenPzwm1zZc51OM1p7lArWz9UopCItMGGrQ9AchenC
	/sCWdo8izunW4M6s1qGf9lgpqbNSvNtb9nw+QoT+Wb8emvBwmKAvHfWqUwDI2rGWWNYcpc+X7hE
	3/RS5TqgDPX2KMXu8j2P6Xcrm991+RbqLcRJBwRHLjE6kfYQPcLKdpVRVPZy6zOgmZdT32k6pof
	8gwNwjMicpVPdAVVuJCS0AtfBg7ny3FMPalJ+7n8HI7S2XXC7l9nZL5JYIfvVC3rzjgljfZtPCY
	yRRSz4lP5RUpcrxFcWWcooUAdEdMEcfQ0nuBcLvBrNXjcRx6vfrIKFPddyuWY9SIq8yYik5uA4g
	2YBDmyF8WLi4X2GHUfyp9H7vJ28IOxFMFgOfPNQMpMwsbGoa5Mu+YtPi4iuJhGD5ZWEcLuD5FYs
	tMuKjEXPpM3v/gIGP6n/ai3R6eb2s9Uazc845wm5NXyPeoEJ8AYwy1
X-Received: by 2002:a05:620a:40d6:b0:8ed:2b66:9eb2 with SMTP id af79cd13be357-8ed2b66a1f2mr1490304485a.15.1776867876500;
        Wed, 22 Apr 2026 07:24:36 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ee67115aeasm467576585a.44.2026.04.22.07.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 07:24:35 -0700 (PDT)
Date: Wed, 22 Apr 2026 10:24:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, khtsai@google.com,
	kexinsun@smail.nju.edu.cn, hhhuuu@google.com, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: gadget: udc: skip pullup() if already connected
Message-ID: <9832a30a-ee4b-4e94-94d4-36bc1e658d9a@rowland.harvard.edu>
References: <20260421082050.1260823-1-xu.yang_2@nxp.com>
 <e431e2f9-ce24-491a-9447-1b872099ab25@rowland.harvard.edu>
 <5ybgpy342zdtcudp3brizuxyisrv5zxsfegwawtaxyvlncnvcn@htqd6bnqdv5j>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ybgpy342zdtcudp3brizuxyisrv5zxsfegwawtaxyvlncnvcn@htqd6bnqdv5j>

On Wed, Apr 22, 2026 at 07:31:16PM +0800, Xu Yang wrote:
> On Tue, Apr 21, 2026 at 10:37:53AM -0400, Alan Stern wrote:
> > On Tue, Apr 21, 2026 at 04:20:50PM +0800, Xu Yang wrote:
> > > The device controller may update vbus status via usb_udc_vbus_handler(),
> > > which tries to connect the gadget even though gadget_bind_driver() has
> > > already called usb_udc_connect_control_locked(). This causes pullup() to
> > > be called twice. Avoid this by checking if gadget->connected is true.
> > 
> > This patch is wrong.  To see why, read the comments just below the end 
> > of the patch and see also usb_gadget_activate().
> 
> OK. So it breaks usb_gadget_activate() as usb_udc_connect_control_locked()
> return early.
> 
> I think usb_gadget_activate() needs to set gadget->connected as false before
> running usb_gadget_connect_locked() just like usb_gadget_deactivate() sets
> gadget->connected as true after running usb_gadget_disconnect_locked().
> 
> Then it will work correctly, do you agree?

Yes, that should take care of it.  Don't forget to update the patch 
description as well.

> > (Also, is there really anything wrong with calling pullup() twice in a 
> > row?)
> 
> It depends on the device controller driver. But currently only a few drivers
> call usb_udc_vbus_handler(), so I think the issue hasn't shown up.
> 
> When you look at the pullup() implementation of some UDC driver, you may see
> they do more complicated thing than just pulling the data line up. Such as
> cdnsp_gadget_pullup(), dwc3_gadget_pullup(), etc.
> 
> Therefore, I think the UDC core need to handle this well to avoid calling
> pullup() twice in a row.

Okay.

Alan Stern
