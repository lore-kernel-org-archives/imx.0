Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2321E1E03
	for <imx@lists.linux.dev>; Mon, 17 Mar 2025 18:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742238001; cv=none; b=XDxUUKGbl2az1Kkn75/uyUk3wBU6ShL/a/5wfuAgS4XLFyXmWDowcAvAs8/QSOx1OtG7z9QtSNB7nmiWqQCoxrmaGpZpO6sQ22lscpqqRWEuIEkN4g925pmRQ/Y0MJAe07tV+NvxziUAqImd+80GNgTGE7d1scE8Gduu+P21Ngw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742238001; c=relaxed/simple;
	bh=pX225uXGVkAghWGBd+3tEfc1RLklNoyG7i5BFjEc+OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCYAJ0YN+Ey0P2xiEZNBbsXql0TyP2C5JAA1X4QjxvxHyE87xW5edt4IAZ4xV9XvhqlmWznHp2nk8L+kleU1XvFD4FnUFRpfCcrnZ6rUgiAzH9W54YPovqrhjWkX0w4xd+mRJx76Wvny93TZSFommCZyVCpuSiHDAdZ6h+V+taA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vnn58IaV; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vnn58IaV"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so1067081266b.1
        for <imx@lists.linux.dev>; Mon, 17 Mar 2025 11:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742237997; x=1742842797; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQDBp5VUuXQxeHvKepRV8hD89886c1C3X6r4opw27cM=;
        b=Vnn58IaVjJ4Smds1IezIp7W1a8WKYh80L2Y8Q9wRC9+7ZT5GXaYYNVHYQRR6Sr6ZHw
         DBT/wC6U4L2+mFeg7jTqM6O1KDrZJPFDhv5dJ2guEinwDtee2UzPNeMZupGLArUXldwW
         IPNONoX+1R4GeWiXpjOcbgB5xri6BaFRmweuqvowEd0ExNbBcoL0KMCD5XD0tMOlyBSJ
         xSA/0hMhDXzaTN2XmkjJQTxh+B+7HFnPHMS7uGFXzL8L95PQCory/e7mr1X10fyoVSzs
         03pkbsb07ShdYisiM0OeW/rPjddhM8FwMALGh8oLC1oZDaIBHkLPlE3djdgc3p5UtTeP
         r5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742237997; x=1742842797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQDBp5VUuXQxeHvKepRV8hD89886c1C3X6r4opw27cM=;
        b=EBiV6hLBaoLKr2MBxCex84IAAdq8J8qK+naWy7s2I8dOgXPPNASFfzcgRbDxw2nTKn
         PtZrzka+Do49asjqWSt4YSQtdtDPLVrqJ//V8H4/PJhdpvTGkS9dBXjfjr+LIsNNXdCF
         xb7f/mcib0EGl3CjfpuBgfikdY+542kDi20i63L3eTBoAWJ4xs/s4rO8d2434u2OLjVX
         TPNKxYKsMtTozEj54RHIEpeWMpyuUrQwm4RSU5zVcxDUmi1ck1EYGCmOpTQzNs8oxRcp
         cxj58YNjWO6zrs3zrPm6TZ+eUPKCE971nLhkVQUheyuj3ZSOE4/ISp9X+VzCL1bt9SQd
         NB/w==
X-Forwarded-Encrypted: i=1; AJvYcCWQf1YfFQbUTCsKdx9DAoGT7w9hYhjL180xr5mwhFcPBVxAY5sBwdQj79YqufiYeAF0fq8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlQFNCpJAWxy/YW7+UGUJ8AXMad9o6U2QyzNIjI++JhVGDLjCK
	4hma4Q3sUfqKfVy7XmtsD19kX0GM/B9bEgZMTXLXKbrkIshJBhCu
X-Gm-Gg: ASbGnctjwGMLoCFb4N4g4NKL5PdJWKyrOwghfqRZjOj3hl4tOOm4fiYUuFtZs7qJxEb
	qskAuthKtIuBwrrsHN01sWyNLaBtRUI3I+Wv6tnuSV189fIcv1uYR4PYc6K+tueAPr1JalpQmim
	acKHRmcjXMhfQ6wlXR1uZoMirgBHRZ8bGnGr7lJHQlkmPONZq9pk4kQ2y2kEJSnBwUNxpPSVzng
	SlAywv40tBmx3VoV8oAWq/SpUXgk5CopzXbmc6QR/ZixxNM5NCUW/gaqyf+/e5AhyDJSlzAk6Co
	qIUFKLhL2eIyhHcD2iHpOe429WSK5p0YUBkzPrEbYrz0pNaAgS+MiPptd+KfXhdNc7q4Ns2C283
	VoMOmelFCBiedvDd99ZZf5S0of5Dnmx1Z0XbD5dlenU8=
X-Google-Smtp-Source: AGHT+IFI1RWc9drtLC1fsHugfGd+lXgvlP4qcKYD8ut0s0vnKJhFgSJfeW2USHvPBOFlVUHFJkS8tA==
X-Received: by 2002:a17:906:99c4:b0:ac2:b8ce:90d5 with SMTP id a640c23a62f3a-ac38d514ff5mr69895366b.44.1742237997088;
        Mon, 17 Mar 2025 11:59:57 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-95-252-211-62.retail.telecomitalia.it. [95.252.211.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147e7f11sm704655566b.42.2025.03.17.11.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 11:59:56 -0700 (PDT)
Date: Mon, 17 Mar 2025 19:59:54 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: shawnguo@kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
Message-ID: <Z9hxKlrrqW4QyzdJ@alb3rt0-ThinkPad-P15-Gen-1>
References: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
 <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>
 <Z9hkDqcKG1xOmIB5@alb3rt0-ThinkPad-P15-Gen-1>
 <ef163f08-35f9-4d1d-8082-c826c6cd0aa0@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef163f08-35f9-4d1d-8082-c826c6cd0aa0@linaro.org>

On Mon, Mar 17, 2025 at 07:12:55PM +0100, Krzysztof Kozlowski wrote:
> On 17/03/2025 19:03, Alberto Merciai wrote:
> > On Mon, Mar 17, 2025 at 05:07:26PM +0100, Krzysztof Kozlowski wrote:
> >> On 17/03/2025 09:47, Alberto Merciai wrote:
> >>> While playing with linux-next and imx93-11x11-evk via NFS and TFTP
> >>> I found that the dwmac-imx, nvmem-imx-ocotp-ele drivers by default are
> >>> not builtin then the I was not able to reach userland. 
> >>>
> >>> The following configs were needed to reach my goal:
> >>> CONFIG_DWMAC_IMX8=y
> >>> CONFIG_STMMAC_ETH=y
> >>> CONFIG_NVMEM_IMX_OCOTP_ELE=y
> >>>
> >>> is that something expected?
> >>
> >> You mean they are disabled or you just did not put them inside your
> >> initramfs?
> >>
> >> Best regards,
> >> Krzysztof
> > 
> > Hello,
> > 
> > By default they are enabled as external modules, then until we don't
> 
> So everything is as expected...
> 
> > reach userland they are not loaded thus eth and all the mechanism behind
> > that are out.
> > 
> > I'm not using initramfs just tftp and NFS as follows:
> 
> All arm64 platforms are supposed to use initramfs on defconfig with
> necessary modules.
Thanks a lot, I was not aware of that.
Do you have any reference?

> > setenv loaddtb "tftp 0x80400000 imx93-11x11-evk.dtb"
> > setenv loadkernel "tftp 0x83000000 Image"
> > setenv netargs "setenv bootargs console=ttyLP0,115200 root=/dev/nfs ip=dhcp nfsroot=192.168.1.3:/tftp/root,v3,tcp"
> > setenv bootcmd "run loaddtb; run loadkernel; run netargs; booti 0x83000000 - 0x80400000;"
> > 
> > Do you think that initramfs can solve that?
> 
> Yes, that's the entire point of initramfs.
Let's proceed in that way :)

> > 
> > To be honest I was expecting to have a builtin driver for eth by
> 
> No, why? We built as much as possible as modules in defconfig. Otherwise
> it would be impossible to actually boot that image because several arm64
> platforms have limitations of boot partition size.
Cool! Now is clear.

> Best regards,
> Krzysztof

Thanks,
Alberto

