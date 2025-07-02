Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55358266B72
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 12:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459842; cv=none; b=tFAwJmw09t27Nd++xE8Bv3H43w1wj7V9wN1KdcnpQPk8nliQnqE+ULdrBLPitwnbekVZJTILH/yn0NqFjb1A4TT+R3D/alrwPZwOEtMuuqSacpUVjCzotP9FRqkruoABAPts2T7zVQPh93OX6HyyrQPxu7zDAi5VA/3AN5TuVCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459842; c=relaxed/simple;
	bh=3jVBuetEQaE9y3rWF5YWJVyzPa0BCvXjKpAA4Ev7OUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEnmDGCZUEc4G30tP/pyJebGZ3/sj8W8Pi3WqzAQcr/Si6YLaYFQ6c147ki2m6cbbObORlKTLbdCk3tpdnOp7zabjw/6r0hdIPZr5IwFY3cpUetBRv0x6NufpNzq6w2jTlTFdrvcxq+SH1DKmD6Jd9u2m/JfZQ+dawWCtNT2ozk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=erzgjE4L; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="erzgjE4L"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so8759010a12.3
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 05:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751459838; x=1752064638; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5PT9is2pvFA0KpCrDjVS0+5mGqE0uBCeYvu5bKfsZsk=;
        b=erzgjE4LLoDpZawfQfa8KQ4nj5HvjeEtb0nYwUMJ8uMNqd4qWakBCluvFcBU4qbtlO
         QPAQrqZjDijfhUOsIXG8oTifKN4IRlkFcNVYu/F2+CMhE36uizFI+qdWeSLElN+E0oUo
         JQyNfx4LCqRLlZvzQPhqHO/qo968MTMAdyYpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459838; x=1752064638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PT9is2pvFA0KpCrDjVS0+5mGqE0uBCeYvu5bKfsZsk=;
        b=uAo1Wwpp8+JAyrTD/G6R395MFlDgDlx1aZG2oAwH+t7bsv9MrS7HExVKWVGGWO77xF
         RiBfjq0eQgttlvC6kq5vblG98Ixfq8kyUkOmb6EQ71yNb/Y3MzXI2UBlsbOh2ECwkF3Q
         gjCZX1UH8oBD9wqErWsOURuau6l5dLdXLgkfuq6KN3UjrOtPkWcTfqMJQK+17+q3m0Xe
         JrmRYN9iDtsnGjGOJnQegMvMiaq5+tRxOtc/BRlan9XnBQpit+Y0P6NL1hWHtQ0NAOmB
         tAV9L2SZ7i8lGdtR0mNIoi5jIOm2f/SHxKV655NFZxf+ok+D4Kg2Ye++YX/uWm46S7rX
         aPKw==
X-Forwarded-Encrypted: i=1; AJvYcCV/V/RSqg1hH6N956yRFCxKdLFRBZ0/7CGi+KYstf4H1SkU65qwtGblH4DAYXb4NUpXq08=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhDZEpBhsNjt60Wdb6BgeQkXLGhL0EhMpv+xsuybkZt/R/t0uJ
	tinvbYocNt13VGz4UWgNGwPlD+Zly0/ye7xqI4fW40pMNCvkKTM6/+2jvRKBKxegLHnzbY9HWfT
	dPdsDXQ==
X-Gm-Gg: ASbGncugvKZEe5pgxlmZX+Q6VoAWdlqZhmUZoDGq4X2KlIp+QcfL5RCuOn0jd19GYY2
	nsJk1ExhNurBauBpL4ithONrE1Sc96GbhZ3PETLGY8e47NAsk1szf2YaKYXvy4a0F6nmJXn9TBf
	u7u2RWHwZoKDcsy7+krtHZyNMnn/d5+Qzl0Xk6RalIvLiBI0d3rlApz0iL+yjZ1Yswm1Mk1J9D4
	RRZK6lhS6K+S3/cLCOmZJj6y4X403W5vbDTfE9W5sOwO9BiQ3MXIa3bvgHpHw0/g/iRKvK/5MGU
	QWrOJb/8erw3corXc7bLbtpj+rLQReuJQbAYCxS0GZaJgPs6RmvYxSTQzDaHdf85aQSfmxhwMhR
	Olq12JQ3U39zxOkE6A17ZVKjE
X-Google-Smtp-Source: AGHT+IEdkgaYIJoLQptQUwyGbozYzlCLfNXfbchWOVp/RosttjP8lk8Ac9LAAGyH8Hd8GzsWRlJefA==
X-Received: by 2002:a05:6402:42c2:b0:607:f64a:47f9 with SMTP id 4fb4d7f45d1cf-60e52cb3f21mr2556247a12.3.1751459838338;
        Wed, 02 Jul 2025 05:37:18 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831d3e9bsm9107545a12.61.2025.07.02.05.37.18
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:37:18 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so41509766b.1
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 05:37:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAg8QZVVoruCI4MvLRVCuXx2U5WfoxBJZh1sXJI/Ubc+t2XgYGtRbdpJE8ewFRa85SSRs=@lists.linux.dev
X-Received: by 2002:a05:6512:3990:b0:553:2ff8:5e0b with SMTP id
 2adb3069b0e04-556283700e9mr1016619e87.42.1751459458668; Wed, 02 Jul 2025
 05:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250702110222.3926355-1-xu.yang_2@nxp.com> <20250702110222.3926355-3-xu.yang_2@nxp.com>
In-Reply-To: <20250702110222.3926355-3-xu.yang_2@nxp.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 2 Jul 2025 14:30:45 +0200
X-Gmail-Original-Message-ID: <CANiDSCum3xkgr1QgdvsuZ3ySNJyoLUe_RWyeSDiM0S87YJ-uTw@mail.gmail.com>
X-Gm-Features: Ac12FXwZ_BR0qOSlJcIB1oB_o-14xQ1JZQnu8mI8P7iUMcywnlv20QQJ74Gt2Y0
Message-ID: <CANiDSCum3xkgr1QgdvsuZ3ySNJyoLUe_RWyeSDiM0S87YJ-uTw@mail.gmail.com>
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

The code looks much cleaner :)

It seems that the hcd.c uses the urb transfer_flags to know the
direction of the transfer.
But the uvc driver is not setting it, you probably want to set it.

On Wed, 2 Jul 2025 at 13:01, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> This will use USB noncoherent API to alloc/free urb buffers, then
> uvc driver needn't to do dma sync operations by itself.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v3:
>  - no changes
> ---
>  drivers/media/usb/uvc/uvc_video.c | 56 ++++++++-----------------------
>  1 file changed, 14 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..614cf4781221 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1280,15 +1280,6 @@ static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
>         return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
>  }

The uvc_stream_to_dmadev() function is not used anymore, please drop it.



>
> -static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
> -{
> -       /* Sync DMA. */
> -       dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
> -                                   uvc_urb->sgt,
> -                                   uvc_stream_dir(uvc_urb->stream));
> -       return usb_submit_urb(uvc_urb->urb, mem_flags);
> -}
> -
>  /*
>   * uvc_video_decode_data_work: Asynchronous memcpy processing
>   *
> @@ -1310,7 +1301,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
>                 uvc_queue_buffer_release(op->buf);
>         }
>
> -       ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
> +       ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
>         if (ret < 0)
>                 dev_err(&uvc_urb->stream->intf->dev,
>                         "Failed to resubmit video URB (%d).\n", ret);
> @@ -1736,12 +1727,6 @@ static void uvc_video_complete(struct urb *urb)
>         /* Re-initialise the URB async work. */
>         uvc_urb->async_operations = 0;
>
> -       /* Sync DMA and invalidate vmap range. */
> -       dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
> -                                uvc_urb->sgt, uvc_stream_dir(stream));
> -       invalidate_kernel_vmap_range(uvc_urb->buffer,
> -                                    uvc_urb->stream->urb_size);
> -
>         /*
>          * Process the URB headers, and optionally queue expensive memcpy tasks
>          * to be deferred to a work queue.
> @@ -1750,7 +1735,7 @@ static void uvc_video_complete(struct urb *urb)
>
>         /* If no async work is needed, resubmit the URB immediately. */
>         if (!uvc_urb->async_operations) {
> -               ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
> +               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
>                 if (ret < 0)
>                         dev_err(&stream->intf->dev,
>                                 "Failed to resubmit video URB (%d).\n", ret);
> @@ -1765,17 +1750,15 @@ static void uvc_video_complete(struct urb *urb)
>   */
>  static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  {
> -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> +       struct usb_device *udev = stream->dev->udev;
>         struct uvc_urb *uvc_urb;
>
>         for_each_uvc_urb(uvc_urb, stream) {
>                 if (!uvc_urb->buffer)
>                         continue;
>
> -               dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
> -               dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
> -                                      uvc_stream_dir(stream));
> -
> +               usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
> +                                    uvc_stream_dir(stream), uvc_urb->sgt);
>                 uvc_urb->buffer = NULL;
>                 uvc_urb->sgt = NULL;
>         }
> @@ -1786,26 +1769,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
>                                  struct uvc_urb *uvc_urb, gfp_t gfp_flags)
>  {
> -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> -
> -       uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> -                                              uvc_stream_dir(stream),
> -                                              gfp_flags, 0);
> -       if (!uvc_urb->sgt)
> -               return false;
> -       uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
> -
> -       uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
> -                                                uvc_urb->sgt);
> -       if (!uvc_urb->buffer) {
> -               dma_free_noncontiguous(dma_dev, stream->urb_size,
> -                                      uvc_urb->sgt,
> -                                      uvc_stream_dir(stream));
> -               uvc_urb->sgt = NULL;
> -               return false;
> -       }
> +       struct usb_device *udev = stream->dev->udev;
>
> -       return true;
> +       uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
> +                                               gfp_flags, &uvc_urb->dma,
> +                                               uvc_stream_dir(stream),
> +                                               &uvc_urb->sgt);
> +       return !!uvc_urb->buffer;
>  }
>
>  /*
> @@ -1953,6 +1923,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
>                 urb->complete = uvc_video_complete;
>                 urb->number_of_packets = npackets;
>                 urb->transfer_buffer_length = size;
> +               urb->sgt = uvc_urb->sgt;
>
>                 for (i = 0; i < npackets; ++i) {
>                         urb->iso_frame_desc[i].offset = i * psize;
> @@ -2009,6 +1980,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
>                                   size, uvc_video_complete, uvc_urb);
>                 urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
>                 urb->transfer_dma = uvc_urb->dma;
> +               urb->sgt = uvc_urb->sgt;
>
>                 uvc_urb->urb = urb;
>         }
> @@ -2120,7 +2092,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>
>         /* Submit the URBs. */
>         for_each_uvc_urb(uvc_urb, stream) {
> -               ret = uvc_submit_urb(uvc_urb, gfp_flags);
> +               ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
>                 if (ret < 0) {
>                         dev_err(&stream->intf->dev,
>                                 "Failed to submit URB %u (%d).\n",
> --
> 2.34.1
>
>


--
Ricardo Ribalda
