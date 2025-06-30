Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA051DF75D
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 06:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266122; cv=none; b=bJ3T08XI9S61P36XMfvImQGk0geJR8yUOV0iirzEHg57NUFXNyCor1lAw+XSTC3boVEwJHjt76hMRaZ63cFu/DotAfks0M/5irl86ZpQs0pnRSUIukWg+RyzqLWDslRBWoqoqXSgBZaioneeBuUWHUKMuQEL9Z79G/L/9XUvUjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266122; c=relaxed/simple;
	bh=W3/qUmYR6QyOvmumbF5zNgCLQg69m81T3y9dtD4rHzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqGRd9M5MGkRMjGqQVahbfYRiUh4qQj40EZvNfkMfZMKF/3TqJaL1vK1jUU9v4HsDYAcbRfmoLw3DZhopOLwuHoeFMtrASxhIzXOEHcsq7fy6aznFbpn1hyRzC5V82AcrHKT6s2tIoy8H7pQgpooF+oQHTOsXbdYh1mFI+GmjmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=equHvcZQ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="equHvcZQ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553bcf41440so4105489e87.3
        for <imx@lists.linux.dev>; Sun, 29 Jun 2025 23:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751266117; x=1751870917; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pku19sNVP6VuOr/+3IUAfIt54nYSogJc7sn5HCCxY5g=;
        b=equHvcZQfggOhIKvm2ykHivSnAf/XiHBZgaPI03DXZMLeDtRP7DsKEYpXD3bdzvyr0
         ARLcEelxYNUTeDtQ0iIolaY4C6Gjh3JIPKhJMbzKzMHf5wtWFSzDjQyxoWbmdjNG0uXY
         RGr2T4IMlt87fCZcSLVaURNxjnHJZAPvUXXtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266117; x=1751870917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pku19sNVP6VuOr/+3IUAfIt54nYSogJc7sn5HCCxY5g=;
        b=U6c5JLofvpVhxN2RDIZRC+sQkuPOeFx/84tpS8Q+7frXrQGSwQrr2u4x7E78o04IK5
         FJ0fAuBUyyTerRsMMtFRDbQm5afQHgV+1sbVQhC9gQkGtPPNqSLCKWmnautpcS66+XLV
         gs0mroriDREH/sWi0shiXmmoVbHUH54Q/oUP75SASzd12b/CXSPzsWJob+OySAOzTLO/
         X99Z651joynNxFfv8bvCVbLvMouRhc8WJc6e9fapZz9uWdFVjBGxN5IDsS6G9GYNL8Dt
         1nZR6a0nr+U4s8RrveuscasFC0oDYJdFOAH668rtSfk9BJgMxIbo1xm8uQCzx1viGqn7
         GywQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjkMaNhwHq/9pAnnPJDsIViw+4114eb+Fjd8LI5RE9L+Wpsck0AI8Vx6pMb2Jptk4TNvo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhElPpS9FQCDQ5ESK2HUT8pja7w5+8TbNVeJvARRWkeI4fW6V/
	HmP0oO/vAzfcWiGhupqcvEV89ijVv02V6zRRyTWh2KmfqKVzn1H3pMJc9+kiNK0RbNd0LiLxhQa
	SQCg=
X-Gm-Gg: ASbGncseudRHuolO1kTJJNl/gKkgjNefNf+I4cPDU1sdUY81zPNNkaCALIttIPQsdc7
	0Z8YaNn2fLurejUwe24uErVxR4XciXqtwt9/oz90XvIZiGZXgtJGkd+OToZlctRcH4zGvklDoHi
	2qfkw7V2GeTNO6faPkIjBR5GWfai36//6mr+1MZp7dIdo84mU/Teu9BtNrkxnY1JVonjIQyc2Hi
	OhdEiN+nvleMXRGOj9xN38zu42fuk8GGAxXMX3oN8fNQclRnOBXLXAGzNW30gCf13gIHDxDm2WG
	rCb3renYNW0nYGC1NtuFQRW8rAId1A03TI/Vg4lnUJCMddvk2qS+HDFjlYkje7wnjUInUeJfHVZ
	Aoz1q+o34BTF28F8ABKZ+C+p5
X-Google-Smtp-Source: AGHT+IE3NXKw09DLULZcrbLKqd8rQMYajvQnGZV4iQVCGdMqq3PenTYtrphUfpU/aUW3ybpUwH7VEA==
X-Received: by 2002:a05:6512:224b:b0:553:25f4:695f with SMTP id 2adb3069b0e04-5550b889f53mr3716548e87.20.1751266117062;
        Sun, 29 Jun 2025 23:48:37 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1322412e87.248.2025.06.29.23.48.36
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 23:48:36 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5551a770828so814091e87.1
        for <imx@lists.linux.dev>; Sun, 29 Jun 2025 23:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGf9LQOZcfdpejRPv19CMVu8FJmV5qeILKuhGDLPOz/4y9DCiRhRUhvkn25pUD78sDJd8=@lists.linux.dev
X-Received: by 2002:a05:6512:3e2a:b0:553:3770:c912 with SMTP id
 2adb3069b0e04-5550ba2bc7emr3296124e87.47.1751266115614; Sun, 29 Jun 2025
 23:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250627101939.3649295-1-xu.yang_2@nxp.com> <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu> <20250629233924.GC20732@pendragon.ideasonboard.com>
In-Reply-To: <20250629233924.GC20732@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 08:48:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCswzMouJrRn2A3EAbGzHTf88q_qQ=DC_KX7dbf_LJzqBg@mail.gmail.com>
X-Gm-Features: Ac12FXygHhnlFKiXR-4gqAGeNFFl6ex4EPtMW2SIZttm2I0yNPjkXicKbD_z69Y
Message-ID: <CANiDSCswzMouJrRn2A3EAbGzHTf88q_qQ=DC_KX7dbf_LJzqBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Christoph Hellwig <hch@lst.de>
Cc: Alan Stern <stern@rowland.harvard.edu>, Xu Yang <xu.yang_2@nxp.com>, 
	ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, hdegoede@redhat.com, 
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de, 
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 01:39, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Jun 27, 2025 at 10:23:36AM -0400, Alan Stern wrote:
> > On Fri, Jun 27, 2025 at 06:19:37PM +0800, Xu Yang wrote:
> > > This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> > > functions to support alloc and free buffer in a dma-noncoherent way.
> > >
> > > To explicit manage the memory ownership for the kernel and device,
> > > this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> > > and call it at proper time.  The management requires the user save
> > > sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/core/hcd.c | 30 ++++++++++++++++
> > >  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/usb.h    |  9 +++++
> > >  3 files changed, 119 insertions(+)
> > >
> > > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > > index c22de97432a0..5fa00d32afb8 100644
> > > --- a/drivers/usb/core/hcd.c
> > > +++ b/drivers/usb/core/hcd.c
> > > @@ -1496,6 +1496,34 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
> > >  }
> > >  EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
> > >
> > > +static void usb_dma_noncoherent_sync_for_cpu(struct usb_hcd *hcd,
> > > +                                        struct urb *urb)
> > > +{
> > > +   enum dma_data_direction dir;
> > > +
> > > +   if (!urb->sgt)
> > > +           return;
> > > +
> > > +   dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> >
> > Are the following operations really necessary if the direction is OUT?
> > There are no bidirectional URBs, and an OUT transfer never modifies the
> > contents of the transfer buffer so the buffer contents will be the same
> > after the URB completes as they were when the URB was submitted.
>
> The arch part of dma_sync_sgtable_for_cpu(DMA_TO_DEVICE) is a no-op on
> all architectures but microblaze, mips, parisc and powerpc (at least in
> some configurations of those architectures).
>
> The IOMMU DMA mapping backend calls into the arch-specific code, and
> also handles swiotlb, which is a no-op for DMA_TO_DEVICE. There's also
> some IOMMU-related arch-specific handling for sparc.
>
> I think dma_sync_sgtable_for_cpu() should be called for the
> DMA_TO_DEVICE direction, to ensure proper operation in those uncommon
> but real cases where platforms need to perform some operation. It has a
> non-zero cost on other platforms, as the CPU will need to go through a
> few function calls to end up in no-ops and then go back up the call
> stack.
>
> invalidate_kernel_vmap_range() may not be needed. I don't recall why it
> was added. The call was introduced in
>
> commit 20e1dbf2bbe2431072571000ed31dfef09359c08
> Author: Ricardo Ribalda <ribalda@chromium.org>
> Date:   Sat Mar 13 00:55:20 2021 +0100
>
>     media: uvcvideo: Use dma_alloc_noncontiguous API
>
> Ricardo, do we need to invalidate the vmap range in the DMA_TO_DEVICE
> case ?

That change came from Christoph
https://lore.kernel.org/linux-media/20210128150955.GA30563@lst.de/

"""

Given that we vmap the addresses this also needs
flush_kernel_vmap_range / invalidate_kernel_vmap_range calls for
VIVT architectures.

"""

>
> > > +   invalidate_kernel_vmap_range(urb->transfer_buffer,
> > > +                                urb->transfer_buffer_length);
> > > +   dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
>
> In the DMA_FROM_DEVICE case, shouldn't the vmap range should be
> invalidated after calling dma_sync_sgtable_for_cpu() ? Otherwise I think
> speculative reads coming between invalidation and dma sync could result
> in data corruption.
>
> > > +}
> >
> > This entire routine should be inserted at the appropriate place in
> > usb_hcd_unmap_urb_for_dma() instead of being standalone.
> >
> > > +static void usb_dma_noncoherent_sync_for_device(struct usb_hcd *hcd,
> > > +                                           struct urb *urb)
> > > +{
> > > +   enum dma_data_direction dir;
> > > +
> > > +   if (!urb->sgt)
> > > +           return;
> > > +
> > > +   dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> > > +   flush_kernel_vmap_range(urb->transfer_buffer,
> > > +                           urb->transfer_buffer_length);
> > > +   dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> > > +}
> >
> > Likewise, this code belongs inside usb_hcd_map_urb_for_dma().
> >
> > Also, the material that this routine replaces in the uvc and stk1160
> > drivers do not call flush_kernel_vmap_range().  Why did you add that
> > here?  Was this omission a bug in those drivers?
> >
> > Alan Stern
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
