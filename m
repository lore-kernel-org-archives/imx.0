Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754922E718B
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466732; cv=none; b=ZdZGOOlLGAN7oAUX/DDPJEs7S0+xN02zxs+iFy3WQ+Z5LmInmGKhr16yN9ciIx9qUfsBtadT1Cgy0/uIoRsmZpdBqiTj8qRtt0EvZGGUFCP4BzfTkXAZZLLCMP+dRd/ype4FKAr2EBhA8nmQurudxSV0cree9uT5DkjSszR00KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466732; c=relaxed/simple;
	bh=kNyuH7WLAtOiZ59gEXSG0VtJ7ygKLG7MtztYM37F/Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVwa7Jt5qxEg2V7SCwfHVCczhF6BJE4RpGDtIWKB7TB28zrgJJRamMcvnPwbPbN24lj99ojTI9TRT8YwMsCUqk2tec7GouDGGmKaLt+xI0viJBNRnYWu8Dm7Qmy+WCaaQ0rPhYvncf518HwVtNnaZG3X7YZtrmRwZlsfCOR4eZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=urEPfCl4; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="urEPfCl4"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6facc3b9559so60108266d6.0
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751466729; x=1752071529; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OM0zfei5f0inErN/uNSMXzIQ9/mBfPLCdVqE3t8DrBI=;
        b=urEPfCl4LvR2529FMUR1lGtGQVkJawbCt9gGir2y0erbXTxNXgSpvdYKsEfsDzQrgn
         7oN69bOzYfZBC6vB1iqZ2DpThtWWiie3oasLTBOTQy/LUPbO/yyzMT2Dk0E6gMV3/KUr
         NxJQaG3AEC1qGp9bbyh2NnYLgpqNhEg6RjWOCjjhq9s0sXucB/9lRqhgBryfVT2RZ2tg
         CQzQHDlcDL1UPkR0K3XLHap+ISLVmb0Gm//nY64fax2UZLv6BzsNOoYp46JnphAfS8yH
         TX5veVr3AmocTyWIyvr3hstVJe2NJMsrZsWuJxwqg282ii/8k9RMsaYx0S9L9nm1RvS4
         DngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466729; x=1752071529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OM0zfei5f0inErN/uNSMXzIQ9/mBfPLCdVqE3t8DrBI=;
        b=JrRylI8aB0LhM3eW8NoFW9JjBkL4lMjDcn3mQ4LittuIOkZCwnaMudQF6erqslvqgl
         pIXgXtaGF8N7siiVjwPgqq3r/ppvJrUgYVRlvurj/dIpavi0S97DGaEQwfPTbnR2NmkM
         sJ4I34irKjoGxm4hpO8OFiTt8Znhx/wqQWkgN0KAzI7SQgKKf1d3ZcknbPwH7mIUkECZ
         3k20pqiBbWPwDAJ+LXkAyaTqHMDCNFv+Bc+VbTF8+NGvrS3vGKPEfNhXUiiVfUiJ1IfZ
         IXPhN7k15k0DTbu+mFbIgrQTtVwyHSqzv3tK+uQMsHZTn+edgT84yXcbqyYK078rXCiI
         L15w==
X-Forwarded-Encrypted: i=1; AJvYcCWUtfn6GdGKC2CLRmDnwrcPKNNgFFw9M5bvs2w3Wk3ajR1Nvuuwjll8cYJzY4KCab4GbIg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeKKYm3oza0ntYffsb9GuTYE4kxORVDWIVrXpXcRouWdm1U65K
	VxJ63VfBPfJxQXW9Zk9jVQxaGwAKB2T0WE+wZeHhe2rSUhgiQNKA1VcY5DUNkEpGhw==
X-Gm-Gg: ASbGncve4piMpWpqkA+/BB6lwsO3hB86AQzG2H4vaeIMJoGoRrbTTXeN2EC9Hw2+DKm
	JplfzQMLMBAICP9R+2aLTbQ9fzog+Vc1EExoX6NaLu/NAIM+7dnngcgERUPD4ptky9UoIyuEo1W
	SokOjgXd7N9i4vfMg5jkj9A+qic91fLyEtXtE3dq3UfMZVABF7w0hUaQSy0+ACY5RgbMbhyaqKJ
	pfZ0KYHgzanvqUEoFI1UJ0Lq8zgJySFaWG7kwmihDZMy8G4SOtOqaG1lsxK2iV27/tDybi0wJp/
	BVTzJEXlyBDdEJdL1wLXpRVuRmF192zPZbDyq+1K0hNThYupUerynoahbL7IZzTccIoEhVcGUEH
	LmqCN
X-Google-Smtp-Source: AGHT+IGUPShe/+yBmwn3/UQ4X2UjDVvrgr8iJo66Gp3M0ocSLCxEcEabV1oGRD+eHhzqQPhNVXK6Ew==
X-Received: by 2002:a05:6214:1c08:b0:6fd:75e1:16c4 with SMTP id 6a1803df08f44-702b1bb187emr42595926d6.20.1751466724441;
        Wed, 02 Jul 2025 07:32:04 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e4fddsm101024496d6.65.2025.07.02.07.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:32:04 -0700 (PDT)
Date: Wed, 2 Jul 2025 10:32:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, dafna.hirschfeld@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <198ddef7-8623-400f-8e2e-ffd6c4bfd2cf@rowland.harvard.edu>
References: <20250702110222.3926355-1-xu.yang_2@nxp.com>
 <20250702110222.3926355-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702110222.3926355-2-xu.yang_2@nxp.com>

On Wed, Jul 02, 2025 at 07:02:20PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v3:
>  - put Return section at the end of description
>  - correct some abbreviations
>  - remove usb_dma_noncoherent_sync_for_cpu() and
>    usb_dma_noncoherent_sync_for_device()
>  - do DMA sync in usb_hcd_map_urb_for_dma() and
>    usb_hcd_unmap_urb_for_dma()
>  - call flush_kernel_vmap_range() for OUT transfers
>    and invalidate_kernel_vmap_range() for IN transfers
> ---
>  drivers/usb/core/hcd.c | 19 ++++++++++
>  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h    | 11 ++++++
>  3 files changed, 110 insertions(+)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c22de97432a0..e0fa6d6d273b 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1366,6 +1366,14 @@ void usb_hcd_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
>  				urb->transfer_buffer_length,
>  				dir);
>  
> +	if ((urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) &&
> +	    urb->sgt) {

Shouldn't this be "else if"?  There aren't any circumstances where a 
driver might want to do two DMA mappings for the same buffer, are there?

> +		dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
> +		if (dir == DMA_FROM_DEVICE)
> +			invalidate_kernel_vmap_range(urb->transfer_buffer,
> +						     urb->transfer_buffer_length);
> +	}
> +

Alan Stern
