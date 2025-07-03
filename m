Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F386D2E2EE8
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 11:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542705; cv=none; b=WOt+uXRFJnoucGDj5SnomdXJfEkY+/yMSzHh1eCOny+A3HYvXkcnsFXKS8ohOyU1fcx2kO+qsLiglPc/3tbNA11qaLXfpLpNow7w67rzULVPh3AL1mP6/3XQUBGWvpOXo7wtLykOHN/ul8nq90896Ywv2cLQe3EasbEzEtDrLt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542705; c=relaxed/simple;
	bh=KJzjzf9bW3qMR/ty207m83vi9+0PfbsKBzq78I8hpFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=io5wEMz30+UEn4VXFfFqeh0UFG21do4AkwV4VvYU6ZgeFC1ZmHo9wI/xRsZjL2Asq+AjJW1rDfwZUVvm9X/2smkoOFifFcbm8EC+A8aU5iKGR3UbWdgfJiJVbvsWTnyDUQtyJ6d965imkzIiMCQWlrFiKp7eWSz2wTAni9PG8ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MrdEwdUj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MrdEwdUj"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0e0271d82so1423985266b.3
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 04:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751542701; x=1752147501; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77UnFw9JQduiCE+rJYJRimYgiLY5u6VunHggtrV7ibM=;
        b=MrdEwdUjzN+G6baBtC9LaQGNOPRLl/JfmnjOeb+knbYIXughJmi3y5r2K4rChbD73d
         E1avhieGyyjqMI129c+qXKGes1NGZTasuZ3wQQrzNJwqvIr8OzOMQdISPVegfZjd1KkA
         cGw8oUAeOGxWtFLpz/Bq2wvu6NEDOafp51+1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542701; x=1752147501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77UnFw9JQduiCE+rJYJRimYgiLY5u6VunHggtrV7ibM=;
        b=RUc3YSIlYAMaCFJTOyCLmX3Gh8n3mE+p89L//ToWo+I0VpDWhdF98UzUTgT/e8X2Lw
         sc+off0ekgrTi7i0uFTrOcxrgcdfX3ErhMVDmyXgtCu/7zaGSy6E11CSBAKuf8fQ2BG8
         lYwHExL8wmAlZv+YwpgQuzjr3GBVZZQx8wob75RGXz83bnrc5igzeBmjmtpZKqeplHWr
         k8vOMLNfbQC2kPALXhKisKQoYw4hUkFwT4BRrFaLPg4VAH+d75av4tJKUtRHW5BDQePR
         n06bSaEXsTa1ovQTHLyH0J3P7BKOcqQHwLgEdJaBNpBIX+ywUU1nAPbv1dBPMZ9O0ibC
         g/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCV28VMGbNqxvYH/vP5OQj18Z9qqFcZvpRohcAkZRGhVBn6fIbfGFmBvrlWStX5Ism9KHmM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyOsblsiyhwhsA3biX5Ndp6zll4ajaylBnBWAMbrnjzMjRkyN9
	U9IlAakyBZnmbpGuqcyfT9zp2fYcUeDZeFqFxWBv2JXMItmKyK2d2SiVjCZafxlLOrP8dFlTfoe
	VyzsKyQ==
X-Gm-Gg: ASbGncvjL/SNV2WErCnXaBz1h+5JWsVuUjWTiJA69fFiZiopEtHrQt7uWQPP3eMX0mG
	Lf9ul3gbOlODfJ8RuFRlZct26CCk8A4pmebfOuC7HO42x64MK70htFERcB1Hm8Dum0h83yb0t8L
	eDBabUb+f63OIYWw8ZJCpd91hWyzyCzFfhGZNOORpZSIcikaNI68LHH2im4PWyYmLeQh/YkNfwq
	POqm/XUXFGS0Hqdgse7eAEO7WLZMPKVuBdxfNTxg3a/ZB1VUO7E+rqsbFr1ed4Ew9ezHSy+SZo1
	+UakjH/aGPDG1HkwgPKKZ7jrOR0YosOgJ4nCHxjyqeA8cYfc6R4J6wAQv6K6tiOgoLCaUHrmetP
	TL24+FS+drLBq1lMfZTm6zkYE
X-Google-Smtp-Source: AGHT+IF5C4Ai6fx/Wndn2MhOQ68884xaV0u6QbrtmVh8UIplHUktupy/Ni33N6iOz/yfKl8q0mMtvw==
X-Received: by 2002:a17:907:7ea5:b0:ae3:a8ee:59ea with SMTP id a640c23a62f3a-ae3c2c8bec1mr651788766b.54.1751542700831;
        Thu, 03 Jul 2025 04:38:20 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bc2dsm1259970366b.136.2025.07.03.04.38.20
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 04:38:20 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a16e5so11168775a12.0
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 04:38:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXlGvj8Og/PhHrMuExuV5gpss8BA4S7sNVYDnemXk9vWuljB6eo5GFmX5pWvwyOKaCj6Q=@lists.linux.dev
X-Received: by 2002:a05:6512:108b:b0:554:f9c5:6b41 with SMTP id
 2adb3069b0e04-5562834a7edmr2259331e87.46.1751542335622; Thu, 03 Jul 2025
 04:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250702110222.3926355-1-xu.yang_2@nxp.com> <20250702110222.3926355-3-xu.yang_2@nxp.com>
 <CANiDSCum3xkgr1QgdvsuZ3ySNJyoLUe_RWyeSDiM0S87YJ-uTw@mail.gmail.com> <rvg5yvwij5wsegqclcwv4qnuim3mlohxpdgrd77d7mctxofbj3@r4d56gjavldb>
In-Reply-To: <rvg5yvwij5wsegqclcwv4qnuim3mlohxpdgrd77d7mctxofbj3@r4d56gjavldb>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 3 Jul 2025 13:32:02 +0200
X-Gmail-Original-Message-ID: <CANiDSCt98rP2RtUfC2EFL+H2U4TMV3BKEhAfpPK1Nm+tU=4j4Q@mail.gmail.com>
X-Gm-Features: Ac12FXyU9jtrH9KJyPUY_j3S31gGzwl5u1stIZzn0hYn0Is9alW4iNoy3AaTnF0
Message-ID: <CANiDSCt98rP2RtUfC2EFL+H2U4TMV3BKEhAfpPK1Nm+tU=4j4Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, 
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de, 
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, dafna.hirschfeld@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"

Hi Xu

On Thu, 3 Jul 2025 at 10:51, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Jul 02, 2025 at 02:30:45PM +0200, Ricardo Ribalda wrote:
> > Hi Xu
> >
> > The code looks much cleaner :)
> >
> > It seems that the hcd.c uses the urb transfer_flags to know the
> > direction of the transfer.
> > But the uvc driver is not setting it, you probably want to set it.
>
> The USB HCD will get transfer direction from endpoint capability. So
> we needn't add such info to transfer_flags.

For future me...

usb_submit_urb() set that flag. :)

Thanks!
>
> >
> > On Wed, 2 Jul 2025 at 13:01, Xu Yang <xu.yang_2@nxp.com> wrote:
> > >
> > > This will use USB noncoherent API to alloc/free urb buffers, then
> > > uvc driver needn't to do dma sync operations by itself.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > ---
> > > Changes in v3:
> > >  - no changes
> > > ---
> > >  drivers/media/usb/uvc/uvc_video.c | 56 ++++++++-----------------------
> > >  1 file changed, 14 insertions(+), 42 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index e3567aeb0007..614cf4781221 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -1280,15 +1280,6 @@ static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
> > >         return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
> > >  }
> >
> > The uvc_stream_to_dmadev() function is not used anymore, please drop it.
>
> Sure.
>
> Thanks,
> Xu Yang
>
> >
> >
> >
> > >
> > > -static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
> > > -{
> > > -       /* Sync DMA. */
> > > -       dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
> > > -                                   uvc_urb->sgt,
> > > -                                   uvc_stream_dir(uvc_urb->stream));
> > > -       return usb_submit_urb(uvc_urb->urb, mem_flags);
> > > -}
> > > -
> > >  /*
> > >   * uvc_video_decode_data_work: Asynchronous memcpy processing
> > >   *
> > > @@ -1310,7 +1301,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
> > >                 uvc_queue_buffer_release(op->buf);
> > >         }
> > >
> > > -       ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
> > > +       ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
> > >         if (ret < 0)
> > >                 dev_err(&uvc_urb->stream->intf->dev,
> > >                         "Failed to resubmit video URB (%d).\n", ret);
> > > @@ -1736,12 +1727,6 @@ static void uvc_video_complete(struct urb *urb)
> > >         /* Re-initialise the URB async work. */
> > >         uvc_urb->async_operations = 0;
> > >
> > > -       /* Sync DMA and invalidate vmap range. */
> > > -       dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
> > > -                                uvc_urb->sgt, uvc_stream_dir(stream));
> > > -       invalidate_kernel_vmap_range(uvc_urb->buffer,
> > > -                                    uvc_urb->stream->urb_size);
> > > -
> > >         /*
> > >          * Process the URB headers, and optionally queue expensive memcpy tasks
> > >          * to be deferred to a work queue.
> > > @@ -1750,7 +1735,7 @@ static void uvc_video_complete(struct urb *urb)
> > >
> > >         /* If no async work is needed, resubmit the URB immediately. */
> > >         if (!uvc_urb->async_operations) {
> > > -               ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
> > > +               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
> > >                 if (ret < 0)
> > >                         dev_err(&stream->intf->dev,
> > >                                 "Failed to resubmit video URB (%d).\n", ret);
> > > @@ -1765,17 +1750,15 @@ static void uvc_video_complete(struct urb *urb)
> > >   */
> > >  static void uvc_free_urb_buffers(struct uvc_streaming *stream)
> > >  {
> > > -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> > > +       struct usb_device *udev = stream->dev->udev;
> > >         struct uvc_urb *uvc_urb;
> > >
> > >         for_each_uvc_urb(uvc_urb, stream) {
> > >                 if (!uvc_urb->buffer)
> > >                         continue;
> > >
> > > -               dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
> > > -               dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
> > > -                                      uvc_stream_dir(stream));
> > > -
> > > +               usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
> > > +                                    uvc_stream_dir(stream), uvc_urb->sgt);
> > >                 uvc_urb->buffer = NULL;
> > >                 uvc_urb->sgt = NULL;
> > >         }
> > > @@ -1786,26 +1769,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
> > >  static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> > >                                  struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> > >  {
> > > -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> > > -
> > > -       uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> > > -                                              uvc_stream_dir(stream),
> > > -                                              gfp_flags, 0);
> > > -       if (!uvc_urb->sgt)
> > > -               return false;
> > > -       uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
> > > -
> > > -       uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
> > > -                                                uvc_urb->sgt);
> > > -       if (!uvc_urb->buffer) {
> > > -               dma_free_noncontiguous(dma_dev, stream->urb_size,
> > > -                                      uvc_urb->sgt,
> > > -                                      uvc_stream_dir(stream));
> > > -               uvc_urb->sgt = NULL;
> > > -               return false;
> > > -       }
> > > +       struct usb_device *udev = stream->dev->udev;
> > >
> > > -       return true;
> > > +       uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
> > > +                                               gfp_flags, &uvc_urb->dma,
> > > +                                               uvc_stream_dir(stream),
> > > +                                               &uvc_urb->sgt);
> > > +       return !!uvc_urb->buffer;
> > >  }
> > >
> > >  /*
> > > @@ -1953,6 +1923,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
> > >                 urb->complete = uvc_video_complete;
> > >                 urb->number_of_packets = npackets;
> > >                 urb->transfer_buffer_length = size;
> > > +               urb->sgt = uvc_urb->sgt;
> > >
> > >                 for (i = 0; i < npackets; ++i) {
> > >                         urb->iso_frame_desc[i].offset = i * psize;
> > > @@ -2009,6 +1980,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
> > >                                   size, uvc_video_complete, uvc_urb);
> > >                 urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
> > >                 urb->transfer_dma = uvc_urb->dma;
> > > +               urb->sgt = uvc_urb->sgt;
> > >
> > >                 uvc_urb->urb = urb;
> > >         }
> > > @@ -2120,7 +2092,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
> > >
> > >         /* Submit the URBs. */
> > >         for_each_uvc_urb(uvc_urb, stream) {
> > > -               ret = uvc_submit_urb(uvc_urb, gfp_flags);
> > > +               ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
> > >                 if (ret < 0) {
> > >                         dev_err(&stream->intf->dev,
> > >                                 "Failed to submit URB %u (%d).\n",
> > > --
> > > 2.34.1
> > >
> > >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda
