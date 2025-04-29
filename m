Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DC92517AB
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 17:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745947823; cv=none; b=MrVuVlgvAYQ0jFrk80ekyNkqHlnBvDi4T9fo8CRXFasYGumGte7Fv0+m9MGS//5fhBoDtBr04H2aSKaBBXGEybmYpnKNiKHAg933M2ji9+8FgcVqneJP7FWvDDnoZ0VmYSAWaPG0BTrNbdAqpFmNhorylSFObnqdXMgPAZP32qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745947823; c=relaxed/simple;
	bh=iH6Owlhwo7/obpVoLUxLDGUT633M4A804YexIcc3OFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uxm0x7yApKyABY5PG8i2xftK25cHHegYpPhcb1SLMcN2Vzziz5ojzG0xQ0EyUnlk6KaUWo/31eBS84tXhP8Q50fvkwqPMMdCUXaw1POxBTHhNKDxnZ89y0uHjCMVtzZMc9AFKG7feyqH0lCwzbMVHZhWeu3AXzxN4XsV/CF4Yzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ycL1QQSN; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ycL1QQSN"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso757974a12.3
        for <imx@lists.linux.dev>; Tue, 29 Apr 2025 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745947820; x=1746552620; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc4+TzSowcDRl7hLIypowfP7AcQ7Rbov5yPrrWksHAo=;
        b=ycL1QQSNhHFHUyxKRcca4BFaqt+yS+O+FBemzeag8d4+9HSZnHJSO4dMK9cZwsOka1
         PP4A7mpe8nlwzNaQec+FDgmD8fV7KWeTFGj+GYbVKJAD8dsp4qlV39UI4v+rtQZuq6FF
         fSaKoXN10xf+dyu/AavE9XVEcSyqJRLeIWxDTXGc2mo5eozGXF9xQu+iGCwB8PAiwJXb
         fBjjarXd564usI+OxjhEs7yuVWW75a3bTjITnPLizRpF2lpZrJHjIA0HiKIqFVx/l/a3
         fYdUqfYwwXfhs/IMgDpAeOPJSJOvdZnQ6BIl5WtBBQ7MszPCV+l7E6bhQEw7U3xnu1a0
         qrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745947820; x=1746552620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sc4+TzSowcDRl7hLIypowfP7AcQ7Rbov5yPrrWksHAo=;
        b=JWI6oucECfABHTvAwbrey2gA8c78m76r8H7Npwk2z8G2LZFnd6atLKSvI8yt0JGk+z
         4k2R4eAmn/KzYmKvaKmqdHHDvKmOynpwWE9ae6ejqGgtcooqhn3qGXj+zZMqgiXtYgMK
         6AYTNmbNID65Piz7WvRDLzAAJ3totBS4ABtb6Orcr00vIixYfTbMNpwU2DFXzUFEk6Xq
         DBwqbt5rLKRk4TaOzJ13Y2kmgVq3S6ytousWjH/yNNT/T87royU1IBIOqrw0WZ9lZ83o
         f3QoJx+bftLv0U9luTwwr9h0mdhGhX65qJenfb9t0+kF2GavjEEQgFUA4va3wxonQVQy
         EJsw==
X-Forwarded-Encrypted: i=1; AJvYcCXFrUKZxE0TpWR6CeWomNovjRHnxAHxk8IDnVgwFZ3AGkUFokf86QaibVd3sgU1OyFUEOY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZdWlGTb9Jj2Ten9GwmND3PbZslog6hdCHp4CkjUTQfXzF2Jdi
	uRn45tkNwx2YzbuX4HNnxiwsCU3cUHTdASlFysRWs4DbUma7+o5rjgOwHNqZ4uwaZryjRNNNS4L
	FUWIDoPFmxVxThWnQVFj0WEzXGFkk/6zz0GXvmQ==
X-Gm-Gg: ASbGnctyknV/fzq777BRMo5tY7tJePGK2Z2WDe8syKgwoFiCPCkbrl+cKD+pUCb4NMk
	vDyjLvzFPPrXn76xQyo5zwxebSBTcwQNgKG/7tEvFqz8mI1xcfC563sqDEgRgB+VzBpoeSGpmfj
	67kL/PYgxOEk34LjeOk+CfbFOuTBJcO2645pqTNerAFin961cMnsk1V5Ck
X-Google-Smtp-Source: AGHT+IFehYf0d8PpH1R2BJB2r7eFTKl8u51pe/GzhtkLgjZNrelsbpFr//PxWWkACriX1/8jtoRJQERGiEtx1uS0LIQ=
X-Received: by 2002:a05:6402:40d3:b0:5e5:bdfe:6bfb with SMTP id
 4fb4d7f45d1cf-5f83885f55bmr4196335a12.16.1745947819729; Tue, 29 Apr 2025
 10:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-3-xiaolei.wang@windriver.com> <09bab7ab-badd-4a7d-9ba5-5dd7181f6a6f@windriver.com>
In-Reply-To: <09bab7ab-badd-4a7d-9ba5-5dd7181f6a6f@windriver.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 29 Apr 2025 11:30:08 -0600
X-Gm-Features: ATxdqUGGH1oEM35wjSVapCU_wc_NAw2TKa6cQrQ2zmSrZZbypcsXceaQ3lXxPSI
Message-ID: <CANLsYkynk4wogcEAvVQ-MTyCGRF3CyqSjxaKUS4eYCbGsL7+Kg@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] remoteproc: core: release rproc->clean_table after
 rproc_attach() fails
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 20:20, Xiaolei Wang <xiaolei.wang@windriver.com> wrote:
>
>
> On 4/26/25 14:53, Xiaolei Wang wrote:
> > When rproc->state = RPROC_DETACHED is attached to remote processor
> > through rproc_attach(), if rproc_handle_resources() returns failure,
> > then the clean table should be released, otherwise the following
> > memory leak will occur.
> >
> > unreferenced object 0xffff000086a99800 (size 1024):
> > comm "kworker/u12:3", pid 59, jiffies 4294893670 (age 121.140s)
> > hex dump (first 32 bytes):
> > 00 00 00 00 00 80 00 00 00 00 00 00 00 00 10 00 ............
> > 00 00 00 00 00 00 08 00 00 00 00 00 00 00 00 00 ............
> > backtrace:
> >   [<000000008bbe4ca8>] slab_post_alloc_hook+0x98/0x3fc
> >   [<000000003b8a272b>] __kmem_cache_alloc_node+0x13c/0x230
> >   [<000000007a507c51>] __kmalloc_node_track_caller+0x5c/0x260
> >   [<0000000037818dae>] kmemdup+0x34/0x60
> >   [<00000000610f7f57>] rproc_boot+0x35c/0x56c
> >   [<0000000065f8871a>] rproc_add+0x124/0x17c
> >   [<00000000497416ee>] imx_rproc_probe+0x4ec/0x5d4
> >   [<000000003bcaa37d>] platform_probe+0x68/0xd8
> >   [<00000000771577f9>] really_probe+0x110/0x27c
> >   [<00000000531fea59>] __driver_probe_device+0x78/0x12c
> >   [<0000000080036a04>] driver_probe_device+0x3c/0x118
> >   [<000000007e0bddcb>] __device_attach_driver+0xb8/0xf8
> >   [<000000000cf1fa33>] bus_for_each_drv+0x84/0xe4
> >   [<000000001a53b53e>] __device_attach+0xfc/0x18c
> >   [<00000000d1a2a32c>] device_initial_probe+0x14/0x20
> >   [<00000000d8f8b7ae>] bus_probe_device+0xb0/0xb4
> >   unreferenced object 0xffff0000864c9690 (size 16):
> >
> > Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> > ---
> >   drivers/remoteproc/remoteproc_core.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index b21eedefff87..6226e2d12a97 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1656,6 +1656,7 @@ static int rproc_attach(struct rproc *rproc)
> >   unprepare_device:
> >       /* release HW resources if needed */
> >       rproc_unprepare_device(rproc);
> > +     kfree(rproc->clean_table);
> >   disable_iommu:
> >       rproc_disable_iommu(rproc);
> >       return ret;
>
> Hi Mathieu
>
> For this patch, if I use devm_kmemdup() instead of kmemdup()

I don't think using devm_kmemdup() would work in this case since the
memory is only free'd when rproc->dev is released.  So if you have
Attach()->detach()->attach(), we'd only keep accumulating memory that
is no longer used.

>
> in rproc_set_rsc_table() function, is it better? Also delete
>
> kfree(rproc->clean_table) in rproc_set_rsc_table()
>
> thanks
>
> xiaolei
>
