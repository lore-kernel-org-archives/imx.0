Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C220342E00B
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772200995; cv=none; b=GoAJ2g2nOzgWBBfeBCaCtYvX6PdJ+jRFhcEzsMPmK/Yss9QJtPQU8KCpNzEXTo+J9ImHHjx1NsNdiVMfhAb8cBwM1e8Bfz2jBI4vw3E3Ym9ba3gOg3i+yIMpjB7NiwmhcJGNvYtvQhm+0zvQQmm+lzS/bGE6ItgOEDqsyOoh+U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772200995; c=relaxed/simple;
	bh=B7fHy1cGZkNQ2wdNUr90lrf+1d59/jJ2MVkVEhWoe5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Gn2xpCOWExrUMJRnzjliGzyQDulZ/9IogGPyHTcSmWNvuxBEyASdnb2JKnzalxRKTsl94yPIhlPQOJCeu59HfARf1PvzdHfnTsHQ8fCVuD4XqEAE7EfI7C3iiInsdFDk6GJDzzclLSd5WLOQhHGNEJXqc5kB7PK0e8LW4M2Udaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K9VK2Csq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K9VK2Csq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772200993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oV2BIg3dhsX9PonNzGGB5cY2QemaB9h/4eyj8OI7C6o=;
	b=K9VK2CsqIh+/JIu/LqW5Rpp7ewizZw653IqlFNd01ZAtfmMycjDWyYjNEMzw7OoN3gkh1r
	jv8vkhaqpxp5R3kKpg/1XL2c3a9pG626/PnR+/RH2FzrQtgtHGj/LgAUsmLXDjfzvDw+rn
	kymMX4u8ThUdFwO2T6cCCHAOIyn7XfE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-hrkpvOFIM4CeqeTeQ60i1w-1; Fri, 27 Feb 2026 09:03:11 -0500
X-MC-Unique: hrkpvOFIM4CeqeTeQ60i1w-1
X-Mimecast-MFC-AGG-ID: hrkpvOFIM4CeqeTeQ60i1w_1772200990
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358f8b01604so7287862a91.3
        for <imx@lists.linux.dev>; Fri, 27 Feb 2026 06:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772200990; x=1772805790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oV2BIg3dhsX9PonNzGGB5cY2QemaB9h/4eyj8OI7C6o=;
        b=lzEMMZ9QghPvJ81mhNCBZ4WSMeN+D+RjnpALen4hAP8O/h/d5eqkSzxwV8Zt63+t7T
         b+38rtR/e+EQzBzwpO7GsGMrok8KvPtLIJPETuhBHoZYM2Ir+uJOf4hHV63odNJ5ATJM
         rwlTMxfS3P73LzBN7sWuebYLCjEnUo5uXllr0sQSCm28iPvzRT+ZHx0ZNAk1fwo2PpV4
         mTrrPe1xCRJSkQalnpuUe77S/EbpJHbtDvrWcHvhuqpHgRJIM5uqrCUPo9PIxnMc16xl
         q9UKIc1HIpIbRqD/sTdqLW1aVsnPyK6X1DPKxbHlkkDIt3F0xNSDGZXzNgEKjFzUkKKt
         iMwg==
X-Forwarded-Encrypted: i=1; AJvYcCXlsubGoYYWAf2CUDwRH3Nuk6TgXvUlk18hYkvXslSigseeDKTAmffyF+kCYqr8eMioaDo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn3BFtKetyuNGSH+lJSS2HyVZmr0wbklR6/l+mDxzbaIanwJBz
	46PYK0UvB9yIvpa7zgQzhKiQEWvHL8pprYBgbMSS/J+oKtUHFRktkt8hc5Q1Jo8lvQhNY98HbWh
	Pov+x2mN1/rZgjkKPv1DXg6V4OX6pdeTxdgOrUgnmAp6YJq78+BmQQA==
X-Gm-Gg: ATEYQzwL4MEuyyx5ZjIPCs1IktUpaSdLtlr/9xNMWe2YvV5b9SDTN/YS5iNJtK8ErjV
	tRoaIz8L/8hwhrTmoGrWtqEbUmIlbYnXXuM1IWZP9xPCDaUdkM532po5imXEfKgcQIEFk3MHp3u
	Su0rNJa0zux6DGmy9UbCIfnulObuXQISvxYWRZMd0X87X3apkkcy4wK7uI5fMVR3EnvfYe5QYqf
	MTNAHYbOe3jBbGgz4qAA2SAy3Tp+pnu6kyhblOM3b8zuy3rDQzlZ6T6oMso6XmLUAbr/cFcpU+5
	D2YCzVwVWRZGQx6ECzhQBjGJEVBGiMCkV35Ld+O2U0hEQahhnt1Od0uGivg+J8oeV1DL7CMI9hS
	alGf9VFfR0m+kPVgyPtEWneTNeByy/7pOm1/iBngY4fhi9+3p0aiDuQ==
X-Received: by 2002:a17:90b:5710:b0:341:88c9:6eb2 with SMTP id 98e67ed59e1d1-35965c3385fmr2137025a91.1.1772200989860;
        Fri, 27 Feb 2026 06:03:09 -0800 (PST)
X-Received: by 2002:a17:90b:5710:b0:341:88c9:6eb2 with SMTP id 98e67ed59e1d1-35965c3385fmr2136984a91.1.1772200989423;
        Fri, 27 Feb 2026 06:03:09 -0800 (PST)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4400:eb20:99f3:ffd5:11da:6745])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35913269232sm5305497a91.5.2026.02.27.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:03:09 -0800 (PST)
Date: Fri, 27 Feb 2026 06:03:07 -0800
From: Jared Kangas <jkangas@redhat.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
	christian.koenig@amd.com, chester62515@gmail.com,
	cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
	stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com,
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com
Subject: Re: [PATCH 00/13] Add DMA support for LINFlexD UART driver
Message-ID: <aaGkGwbk-sh0YJqj@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OnEzDRfrp1L5hulPsv0yXt7PcJ_v8SLIlQ6PmNm0SwY_1772200990
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Larisa,

On Mon, Feb 16, 2026 at 04:01:52PM +0100, Larisa Grigore wrote:
> This patchset enhances the LINFlexD UART driver and its device tree bindings to
> support DMA transfers, configurable clock inputs, dynamic baudrate changes, and
> termios features. It also includes a series of fixes and improvements to ensure
> reliable operation across various modes and configurations.
> 
> The changes added can be summarized as follows:
> 1. Fixes with respect to FIFO handling, locking, interrupt related registers and
> INITM mode transition.

Tested this series with the default devicetree configuration by booting
the board to a login prompt about 200 times. Without the series applied,
I was seeing a bug roughly every 30-50 boots where the kernel would
would hang in linflex_console_putchar() waiting for DTFTFF. In my tests
with the series applied, I didn't see any regressions and the bug no
longer appeared. Thanks for the fix!

Tested-by: Jared Kangas <jkangas@redhat.com> # S32G3, interrupt-driven

> 2. Removal of the earlycon workaround, as proper FIFO handling and INITM
> transitions now ensure stable behavior.
> 3. Support for configurable stop bits and dynamic baudrate changes based on
> clock inputs and termios settings.
> 4. Optional DMA support for RX and TX paths, preventing character loss during
> high-throughput operations like copy-paste. Cyclic DMA is used for RX to avoid
> gaps between transactions.
> 
> Larisa Grigore (8):
>   serial: linflexuart: Clean SLEEP bit in LINCR1 after suspend
>   serial: linflexuart: Check FIFO full before writing
>   serial: linflexuart: Correctly clear UARTSR in buffer mode
>   serial: linflexuart: Update RXEN/TXEN outside INITM mode
>   serial: linflexuart: Ensure FIFO is empty when entering INITM
>   serial: linflexuart: Revert earlycon workaround
>   serial: linflexuart: Add support for configurable stop bits
>   serial: linflexuart: Add DMA support
> 
> Radu Pirea (5):
>   serial: linflexuart: Fix locking in set_termios
>   dt-bindings: serial: fsl-linflexuart: add clock input properties
>   dt-bindings: serial: fsl-linflexuart: add dma properties
>   serial: linflexuart: Add support for changing baudrate
>   serial: linflexuart: Avoid stopping DMA during receive operations
> 
>  .../bindings/serial/fsl,s32-linflexuart.yaml  |  31 +
>  drivers/tty/serial/fsl_linflexuart.c          | 972 +++++++++++++++---
>  2 files changed, 846 insertions(+), 157 deletions(-)
> 
> -- 
> 2.47.0
> 

