Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD3C2820B7
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083644; cv=none; b=vEOVkR26+MwBE9iORJJqbXic41wMHDvjnT0fhgK5On+ofIckL/3pLYuAG30O3mEI+9i0GmArlYr8+/DJjMykIruI4yArp2A3Yje05VghZRaTeF/cG7eygMiaQcl/tpeysRIXYkoJpnKRJ/iXuGZ+Z0fM8Vy86K+HV0pj1Bitrkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083644; c=relaxed/simple;
	bh=5cylBjR2JasUZkv4OpRrf94Tu0nKiuVq0okzHEArjzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fv3x/VD+roGw1ONIsmLHJk2PYARdnPEgR7lF7nyV3nUM8jvhzoWB8Jzniv+aPuHuplYJ14IRsoynH3yX9dig9OV6QE9WNkZ8dt1C8JSAt/YxyTTmOuS+ccKrTTLZ3IDYvRgkcAIy7vtlcgE38JYkatoauF/AcWciw4450pvPHFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hjL0sd8E; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hjL0sd8E"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d0976776dcso501846285a.2
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 07:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750083641; x=1750688441; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pDbQeIKQedNL3NEzD8YAm+JX1HrTgVcpjWLbIbYI9Ck=;
        b=hjL0sd8EIMldliD74GhrjTHZLudsdDe8bs8bJwLIynYAjbUABL/Dhpw30akomFinNg
         EtHrmsnP0YfTDkHrSlyHJqwZ+VynpOBg+aZAHXqT60+IxcWwyKZjqLlUgefgE+QrUkAd
         sF4cN7KBh0/N/vx90nHoz2/31GqM9SBcd4LaHChk/IE8U5bVBpYccrAoAqYe9SZj3Vzs
         /2Vg/SSAAsC4K4mW0OP6opzOnP8m3pq2NG8KMTh4MuPXrJVVYDsB4Pv5qunGdUELmIEZ
         NFqZlWzj4jf83qiVRECXIv//FPZyW1XDvriIMEMpHFoUZa0daKigU5p/AJ6hTqSpfjGX
         a7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083641; x=1750688441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDbQeIKQedNL3NEzD8YAm+JX1HrTgVcpjWLbIbYI9Ck=;
        b=oOQ+OAF1yIN67crXuX2ZDXdEwkLH7fowQPPFKKPJzNLBLAiEVfgjquy2apvUbPznW0
         mMV+LuZOzcJJUFgKqFaCzLUCqDr9zfcuOFS22ubM9uZLn0asd+NphCUDhtD+vt8tRvbD
         z69KlzIN90uihAv6jz66OBp3f0SY6tiFH1o6BM87RkcgRk1hkb+npdcTvmA9qCTTlZiF
         utWDR+mv1NMIkS/9RQMEaFnpX3YjHjskMTDUH4tqz05rglp5aBgHbltGAFhmzFtCMqUc
         ptO8Kol63uuyT94jRSl8HhnG7PqjC+vgp6/v3Zj2Remihsi9jqdGf2I/WWwidd/O4vur
         Le8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJRx0LqhNnJIz3HDVFnAZO429To23OAgrIexyKNWIohvdxGRoUNuia6rrx9wtJFc20qcI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEOiA1ARjXzQ+D3oUptidrbgWpSPRfKEhRMa5MN6y/23HfGsra
	qH4zGLRa4Ls5B/vADnhoZvT0MiwKKPlFpSziRHpf7GPyrJTEGdqhEqt9fkRJYfWo7Q==
X-Gm-Gg: ASbGnculgOWpZ8ks8Xu1BqXHBTy2VamOC/y0xS41qccZp0digdf9Apn6TA/PsYkW+oR
	FR9eoYBJHUdEL3n497/QyzOez6cE1+CN1uOiqoR+TQ194NteLtvhJX/Ycdz3aoruh2/1H8v06oD
	GCY/swKeikwiPCohHAP3+zrIe9y4US7r5bIOCoNlwJnXczHYlgQbEsbLsx0CTzjegQWFDPFYt/q
	Mw1GRHwaBMF9OqiTDgrNYtJINEAxN6An6h/TI0rdZUSNg8Haq8DYKJWVegbobWZr/w1oSsafhZE
	dZMyqgN1/01q4Ue7Arqs0rM7vc2Zmsz3etFRIMaKBnrnQ/fCKYO7YjVWsBurrN4ivpwZWp238zY
	T+yXz
X-Google-Smtp-Source: AGHT+IEv+f3ZtoaV0bo+Dcs1xLfwwB1HrNMEo6Pfx6jOdLikPtpJR0gYvmJsKVgbMy7nAFyaoNhS/A==
X-Received: by 2002:a05:620a:3195:b0:7d2:1a54:f646 with SMTP id af79cd13be357-7d3c6c0e558mr1751582285a.7.1750083641177;
        Mon, 16 Jun 2025 07:20:41 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8e1cf5esm528554285a.49.2025.06.16.07.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:20:40 -0700 (PDT)
Date: Mon, 16 Jun 2025 10:20:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
	hdegoede@redhat.com, mchehab@kernel.org,
	jeff.johnson@oss.qualcomm.com, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, jun.li@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] usbmon: do dma sync for cpu read if the buffer is
 not dma coherent
Message-ID: <d5a3e6aa-73e2-4086-908f-e95b522112cc@rowland.harvard.edu>
References: <20250614132446.251218-1-xu.yang_2@nxp.com>
 <20250614141647.GM25137@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614141647.GM25137@pendragon.ideasonboard.com>

On Sat, Jun 14, 2025 at 05:16:47PM +0300, Laurent Pinchart wrote:
> On Sat, Jun 14, 2025 at 09:24:45PM +0800, Xu Yang wrote:
> > The urb->transfer_dma may not be dma coherent, in this case usb monitor
> > may get old data. For example, commit "20e1dbf2bbe2 media: uvcvideo:
> > Use dma_alloc_noncontiguous API" is allocating non-coherent buffer.
> > 
> > To make usbmon result more reliable, this will add a flag
> > URB_USBMON_NEED_SYNC to indicate that usb monitor need do dma sync
> > before reading buffer data.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/mon/mon_main.c | 7 +++++++
> >  include/linux/usb.h        | 1 +
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/usb/mon/mon_main.c b/drivers/usb/mon/mon_main.c
> > index af852d53aac6..b9d5c1b46b85 100644
> > --- a/drivers/usb/mon/mon_main.c
> > +++ b/drivers/usb/mon/mon_main.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/notifier.h>
> >  #include <linux/mutex.h>
> > +#include <linux/dma-mapping.h>
> >  
> >  #include "usb_mon.h"
> >  
> > @@ -142,6 +143,12 @@ static void mon_complete(struct usb_bus *ubus, struct urb *urb, int status)
> >  {
> >  	struct mon_bus *mbus;
> >  
> > +	if (urb->transfer_flags & URB_USBMON_NEED_SYNC)
> > +		dma_sync_single_for_cpu(ubus->sysdev,
> > +					urb->transfer_dma,
> > +					urb->transfer_buffer_length,
> > +					DMA_FROM_DEVICE);
> 
> This will result in a double sync, impacting performance. Futhermore,
> the sync code in uvc_video.c reads as
> 
> 	/* Sync DMA and invalidate vmap range. */
> 	dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
> 				 uvc_urb->sgt, uvc_stream_dir(stream));
> 	invalidate_kernel_vmap_range(uvc_urb->buffer,
> 				     uvc_urb->stream->urb_size);
> 
> The difference makes me think something has been overlooked here.
> Finally, uvcvideo supports output devices, so the DMA_FROM_DEVICE
> direction doesn't seem universally applicable.
> 
> It seems there are quite a few issues to solve to merge this feature. If
> the DMA sync operation can be done in a generic way in usbmon, then we
> should consider moving it to the USB core and avoid the sync in the
> driver. That may remove too much flexibility from drivers though, in
> which case it may be best to let the driver handle the sync in a way
> that guarantees it gets performed before usbmon inspects the data.
> 
> The issue doesn't seem specific to the uvcvideo driver. All drivers that
> set URB_NO_TRANSFER_DMA_MAP seem to be affected. A more generic
> mechanism to handle that would also be good.

Handling this in the core does seem like the best approach.  Waiting 
until the class driver's callback does a DMA sync won't work for usbmon, 
because the usbmon callback occurs first.

It also won't work right with OUT transfers, because usbmon will read 
data from the buffer after it has been synced by the driver.  (While 
this might not actually hurt anything, I think it's still a violation of 
the DMA API.)

The places where usbcore does normal DMA mapping for URBs are okay:
after usbmon during submission, before usbmon during giveback.  But it 
doesn't handle unusual mapping schemes, only the commonly used ones.

Alan Stern
