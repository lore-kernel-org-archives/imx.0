Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9302E2EED
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034224; cv=none; b=kuruDxwFqCJ2JNNvjG7UAwwqHKN3nk6YBlXrr7YVzVG/KkScXqc8MRIhj5dE2GBE1bZJstTllwz2pyUXBREKdUQVwher1GGKUbxk36EpjMYKcIVqvFPlSIcyFS2RkW5I/QAi/MWMeGHH1p2R8UVWnQIE+O6j/5+7rczdBvnbRUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034224; c=relaxed/simple;
	bh=QXCsL7vS7mFvhzNXf8DjS7hrvdMO+odeJz0t39ie72o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCPVK81N6ibs0GMYwmyEpqoqgaRDgKr2Jp4xzcs5ZqjAX7T3FcOntxjE7tEUxYDz99ORYP0Lp5SouCGwo4AVuzP2QXc4IEDfGdi9hSTAiTEp/qjKKav8ZaS1NyebXaFFACYRRlU0+dskDRWmfdLO7ewG+uJYLkZU9UedkeQiDfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=o3Op93C1; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="o3Op93C1"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fada2dd785so26345556d6.2
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751034220; x=1751639020; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A9NXmX4vbwGCbqn6D1k17tKEXOD0obRo+KVbdSlDBXM=;
        b=o3Op93C1gHaqIL0Bv5mzV6PpzQ6h+iR1PPRFScvarDP+HS9+6/E1+AETbGJN7VecsA
         nrUG8zXWtHgI4N5/7nsWpQ1/46yl/jZz0lPtILwC9hsxEztpO+y0H9KXppus9qqakiLu
         HERk4lOPnrjai0gwVCLgmDhK+QO9WMKDz479Meo+Y3KkGJGcnByTWJpDrhe4JJv0zvlh
         mP/ziPjw8BukKB3EKbXC/z37H1Ae/FgGGRAHq5gdpym/I4hdQuECYhATe0tMP86Okk/E
         ka0DxZp+4Ek3zSn31BPXBMkATGI0AMQJtH0zKj6ZzXOnvPmzD0udQOomUx/1avrCD18D
         uaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034220; x=1751639020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9NXmX4vbwGCbqn6D1k17tKEXOD0obRo+KVbdSlDBXM=;
        b=pd1rykkOwMxALm53nhUA8Lv8Xk2Uqv5ssXl2NH7OqJXnr5T6g0hjfSR3tvk5RVySfN
         gkEXQxQavzKftIK65XT1E3FNeoJR5azTtKRtdVJMw5I8aJFZbKHdoTZ6C5trO/f1G17z
         u+exUJJ3p4yqTpeNGIjPiedICCLGXdYxe5SXxHqCqWwt7iUQsagyIse8Euy9paJThGc2
         J2bwIyWLiHDXv0N50o0hg+vYKPLSGLy9B4NMLHMBKx0tOa7/TDRYb2lVBARHUxJrQSCG
         +yUmDqIOn9VJia0THvJnaPxjLQ5XJup/nWXrLJgrOsoE7VY44Zd9Ec3s8HRf0Cma4e51
         Rhhw==
X-Forwarded-Encrypted: i=1; AJvYcCWLv2joCvi0Z1qQgFqmJUC0IcZ39n29gLlogGZP08l54tlc9Ov1n3TVYgCcAZNsMV0XI/Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+n+v1DO/qk38xfJgOZRACA118EI/dKwZUoWbsN7tQzLa7ABuL
	8D+f4fD0gmVam4jOIoajO5wm03+slavaBhljX9pNCFvNQedq7fdCp7Iv8X7q+G+FiA==
X-Gm-Gg: ASbGncvCvW2adOccKof6iM/CyHQhmcsqi2YzKMty5c+oL+Y7C6bjr6E7sMx3wL44rR+
	SsL2rPLGn8xRXfqdrE1FUcxAtQenHMC5klHDJI1OUawG+6xJyvreRKeLklGmYIAF1gQmXMZ1ooV
	X+OvtJJN9PRjKAsvCNqL4NpOEIx26AQvKveDUROzw527Uhbi3+IdVLtuAeMYwOSi5YaytLVEZqa
	24UkAUBt8CShzQzNdEyDix7Yu+NP+3FAQw5rTdW+DmgYRf3/nMppKYb9JPWqlgzWDMVGaFJFzuu
	R7sb0+Yba26OsEY/KtDesZQRXQWldz5YnFMxzPF9vYL62spOlX3xQS8/gSN1QBZPe8tzBL7CzaT
	gWbA+
X-Google-Smtp-Source: AGHT+IGuzlQ4coveIb3aJO1JXLxRiAQiyFnfLoJRnxBPJ+E7GV+Z/ZfFSQcDG+29Z/ZESK2AT9OPdg==
X-Received: by 2002:a05:6214:2468:b0:6fa:c5be:dad6 with SMTP id 6a1803df08f44-6ffed7a55fdmr51444156d6.6.1751034219846;
        Fri, 27 Jun 2025 07:23:39 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44313926asm137703185a.22.2025.06.27.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:39 -0700 (PDT)
Date: Fri, 27 Jun 2025 10:23:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627101939.3649295-2-xu.yang_2@nxp.com>

On Fri, Jun 27, 2025 at 06:19:37PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/core/hcd.c | 30 ++++++++++++++++
>  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h    |  9 +++++
>  3 files changed, 119 insertions(+)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c22de97432a0..5fa00d32afb8 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1496,6 +1496,34 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  }
>  EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
>  
> +static void usb_dma_noncoherent_sync_for_cpu(struct usb_hcd *hcd,
> +					     struct urb *urb)
> +{
> +	enum dma_data_direction dir;
> +
> +	if (!urb->sgt)
> +		return;
> +
> +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;

Are the following operations really necessary if the direction is OUT?  
There are no bidirectional URBs, and an OUT transfer never modifies the 
contents of the transfer buffer so the buffer contents will be the same 
after the URB completes as they were when the URB was submitted.

> +	invalidate_kernel_vmap_range(urb->transfer_buffer,
> +				     urb->transfer_buffer_length);
> +	dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
> +}

This entire routine should be inserted at the appropriate place in 
usb_hcd_unmap_urb_for_dma() instead of being standalone.

> +static void usb_dma_noncoherent_sync_for_device(struct usb_hcd *hcd,
> +						struct urb *urb)
> +{
> +	enum dma_data_direction dir;
> +
> +	if (!urb->sgt)
> +		return;
> +
> +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +	flush_kernel_vmap_range(urb->transfer_buffer,
> +				urb->transfer_buffer_length);
> +	dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> +}

Likewise, this code belongs inside usb_hcd_map_urb_for_dma().

Also, the material that this routine replaces in the uvc and stk1160 
drivers do not call flush_kernel_vmap_range().  Why did you add that 
here?  Was this omission a bug in those drivers?

Alan Stern
