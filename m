Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D103224B13
	for <imx@lists.linux.dev>; Sun, 16 Aug 2026 05:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786856905; cv=none; b=QDtVpC7QPspiO2ACDwqh1/iDI/57QthVlBJq2Ab63UYXP98o7RT6oRgXms3rSgX9VS5mukDP7z8XOUS4IVGdDAb8FY6Y+IfIaLObTwIVJn+oLEeCvcSDV4477/EssBlmac7izJVmT/cP5fpQVSfNwqMLwdafZ029+x5BCRs64z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786856905; c=relaxed/simple;
	bh=K1+6ZfM3X7b1ZXo4/aHurUoKhIdCkiaITB6aDZA59gM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=F/jDwAn3XVylWWZbyrR2lxD+3FPR43tKcYctZcwschupvxl8jw8CtVbo83m3AsKHuhujEXf/0os+cLVGFIYv6CLbAFTFFe0F43MR98sHj9RFnxoYxJaicQjRe7KyLhIB2/M4nE8Tn9nmAkfj7QF3wKHcL4jKJRkDWtMeD7DLJIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCEMQ2wU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCEMQ2wU"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2020421077so389745766b.3
        for <imx@lists.linux.dev>; Sat, 15 Aug 2026 22:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786856902; x=1787461702; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3EGv/bCwZGVn5e0LnVQX15hxgKZ01RYRO4qrI6Efvk=;
        b=nCEMQ2wUl0SUkxBJBauYyzNw1cDT7u6jhyW/2o46+Gnzs1gRt5gyLBi+bpOUdJ1r/z
         8WxJhXfNoqvVG/gyBCMh9iD1oFpSFNZ4NlW4kziIgVKixiv2k9YNRyNCQwO5Mki0R1Wt
         5PmHz+5ZdGGU3l+wA7yGEir2pQInEYKStfaoIqxjMnyu7BbT4AEByTUTlmGXY7eq6g8b
         XaCP7hV1pxCh1jA+6cRgtd+DZDHxrDeCDnzB/yXU3VxjAHxFegSQ7zVEzYLxHQ8yISdY
         9sbo8csYpVCCaPC28T3eZSEKxg0CWFtMiHu/xV+k1/Pl/pIUluo8Yq6y0bMLxMd6+lvq
         kyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786856902; x=1787461702;
        h=content-transfer-encoding:content-type:mime-version:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3EGv/bCwZGVn5e0LnVQX15hxgKZ01RYRO4qrI6Efvk=;
        b=EJ1e+1ZISlK1FU6nwe2M3d5U77saDBHLzurfWS0ZFjnvhCTQD1mV85ANHLh1Ypg8KB
         BiQzFN1R/40VplAXXq7r9w+CVqr6Z5kcQkzgADZO7CjrtOzvmYeD6dXO4S1BlWlfdVcj
         eL1sK56YltmVLvhlmVej9jxqEHRE0xC2ixuN8+VARghSXmAG+n9sKVpJw3i1woeEatoN
         pAYWTIk/gzD4AdELph+rAAuEjl18InQqjq/ay46oolvIJXZlKbqibaXNrytJSU4j9UaN
         FrofIolIEu5HEjJ1fPIiTLtMTrc2eqrH0BTK3tHRNeD51AgoupVM1pH5VmK8UwemHM3X
         okBg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2nFC2/QbFtpB/EJtKnt9vxnJf7IEwGiYoKlmSiDN6HVvACvA+SmWcFxnWQJvFz8Vvd5w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQLDP8HisSW5EXtibG8hTaPOg3EuhU7QrMehmrldvfftD3MHBb
	Ce43s79a+lufRgv4ZLS1aHA65KRopFM5jmGeReLAelb1t5ckWmGtpZos
X-Gm-Gg: AR+sD11Cy8dc7PWiPplaZEhCfld2Ye1c/B25Lo2AM71N0E1ilvPNXzIDYApoyUE/Jho
	RMTng0kgSgMTj3SxXel4HEE0p0KUhazJb11YfWAsWIvc7d58T/cgiwKanEAKSrwFxK8pYwtsU/F
	6+2XICFyHWViXFI3dlF4xMbqTHvIanus9UIeS8/U54/izoVONwhOW9k/NFyiFllW2QeJM9rRzvW
	Tw0KkecwmmnbS46NsVmaklGEi7c9/dNK/7mHGuJjq/TUUIsCmSigvnK+Wnpk9Y/KBx8HNqKFLQE
	N9A8KGHKyZ4VlAfrcVdwu9YVvzzmUhdeFuwZTgdwxuZFAujGtnTY0yQ7qLgHX0ByZ4WKy6VfWde
	igVnRu4wxreVO8NkGA6KAa++usz5CINZNs5WDLctqi9VOy6sGEVEh9Yi23QxWlo+diFCZU0aVV4
	UI9yDxWNtlcFJfIyQE+VwdUZGtuUiGyo3bvq+sB8Fz5kqK9UnLGzjwc9bl5OXQp9BTPOg=
X-Received: by 2002:a17:907:ea93:b0:c20:f871:1018 with SMTP id a640c23a62f3a-c212a127aebmr838653266b.21.1786856901726;
        Sat, 15 Aug 2026 22:08:21 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21238700aesm296472666b.63.2026.08.15.22.08.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 15 Aug 2026 22:08:20 -0700 (PDT)
Date: Sun, 16 Aug 2026 07:10:44 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: frank.li@nxp.com
Cc: corbet@lwn.net, dmaengine@vger.kernel.org, hch@infradead.org,
 imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 lizhijian@fujitsu.com, mst@redhat.com, rdunlap@infradead.org
Subject: Re: [PATCH v2 1/1] docs: dma: correct dma_set_mask() sample code
Message-ID: <20260816071044.331a2c51.michal.pecio@gmail.com>
In-Reply-To: <20240401174159.642998-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> There are bunch of codes in driver like
>
>        if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
>                dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32))
>
> Actually it is wrong because if dma_set_mask_and_coherent(64) fails,
> dma_set_mask_and_coherent(32) will fail for the same reason.

I encountered similar driver code and found it similarly suspicious.
I arrived here searching for reasons to convince myself (and relevant
maintainers) that removing this is indeed the right thing to do.

But I have a few remaining questions and remarks.

> And dma_set_mask_and_coherent(64) never returns failure.

No realistic chance of the dev->dma_mask check (below) giving -EIO?

> According to the definition of dma_set_mask(), it indicates the width
> of address that device DMA can access. If it can access 64-bit
> address, it must access 32-bit address inherently. So only need set
> biggest address width.
>
> See below code fragment:
>
> dma_set_mask(mask)
> {
> 	mask = (dma_addr_t)mask;
> 
> 	if (!dev->dma_mask || !dma_supported(dev, mask))
> 		return -EIO;
> 
> 	arch_dma_set_mask(dev, mask);
> 	*dev->dma_mask = mask;
> 	return 0;
> }
>
> dma_supported() will call dma_direct_supported or iommux's
> dma_supported call back function.

Aapparently, it may also use some 'dma_map_ops' and there is a bunch
of those spread over drivers/ and arch/. But I gather they are expected
to behave similarly as the functions named above?

> --- a/Documentation/core-api/dma-api-howto.rst
> +++ b/Documentation/core-api/dma-api-howto.rst
>
> +The standard 64-bit addressing device would do something like this::
> +
> +	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64))
> +
> +dma_set_mask_and_coherent() never return fail when DMA_BIT_MASK(64). Typical
> +error code like::
> +
> +	/* Wrong code */
> +	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
> +		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32))
> +
> +dma_set_mask_and_coherent() will never return failure when bigger then 32.
> +So typical code like::
> +
> +	/* Recommended code */
> +	if (support_64bit)
> +		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +	else
> +		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +

This text is unclear. Two sentences begin with "Typical error code",
then some code is quoted, and the sentences are cut abruptly without
actually making any statement about the code in question.

Thanks,
Michal
