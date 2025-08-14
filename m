Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D567E26E153
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 07:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157981; cv=none; b=bd2GxTcIys8U5P8sdLmWHRF/jskf2HpAeWeG0/13B+nFVEbawH6VcoiQV6GrZG7t32jd8+COONbyr4DPKlalQOhCJ9SZ0c2/GzGEVRL2pXpTroP+v+VSahfITNXvYs61LMR6waexAAx1Ipc2VetQyJSdfX5Q7RdhtjG9RzNylzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157981; c=relaxed/simple;
	bh=Uzzj93Rq8ZnwcjdfSHcSIR8zGuEDTE4U/dOBn+K+4rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkVL9nl9EUIWN9vwYEACjqHZ5OY2lyKu5r1AR8KHC5LjDVxN/mAjX4WI8W1Ky87MU82qrQk1/BmCh5ZFnOBai/5qYbx4CkznuMyZXg7IxwZYFXSQGzG0+HMu5FY1RGbOTTxnguxB5+7/mKf3GILRH5xXPX0jcCxwZmivVch3X6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-50f8b94c6adso180643137.3
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 00:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157977; x=1755762777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1Ih+GxrJlx9WnOtqCehCJ3Lo5kUOBdBINzHA4pU3lA=;
        b=eM3MBLPcabYPk+mkpQhwY0cdTzXAR3Z5ylcDW7v9oFZaIMTnY1ZhIQxpfgT01IEGny
         nPRFv73acAsEc+9BzuK7rKG9nyCfhe4xdKk/AUKBLOxsMtAsCOxiFvTG8ICk7i7q2ogZ
         xThE9+uTitJJr3ExpfEIIiiTTklOEL4jvA1/M+vGluM4o7lZ4uTk0LRjuYz8B6+0ihUT
         uYNqvLJTbtdPkjpHJGgTUz0UUPsjtCr0U1j6qmkpl6vNZqoFFAGIUHk7NbFPjLHOQCKV
         AUmOyu9+t0HYw2OPn94IE9ycSCRf+HMIa/jZnOoVhYRzGS/KcxDJXDIbg8IDhkASoL8a
         9Wkg==
X-Forwarded-Encrypted: i=1; AJvYcCUwRdm6J/tqJ7ZLuvmZ2HdVzQzCOkqcKZEcQclbGXT/F2I4EgJ5S52zBRPBvLhMUdy9Els=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrRYMAdLoNm051OHkmzX9IPWsA9wpcXTngIvfeNC0dfndnFeB7
	Uzc6C5H6TJuvMNRHAX4DUIECNGgx0cy6YnsKk7RqAPg3gWrpT7fVrrOfJvL35PB1
X-Gm-Gg: ASbGnctGGa1MRZpu7X3zVNY5JSuOMSqckf28aTDBC/kCai8K3snx7UEE7wqSuyXfO23
	6ynk89d79rFzqIDrQYbJpQNXk1mvy/hJAlKeO/xWj62YZXj7RhgONxeL4uA0XzuAnTTmI/9Lnah
	ZeFZoQcFHH5EJgXJ92bMjSiV9BXZHo7O6N6l0JRLjHzf9yK+wWLWxjkSX5epK72M6OVxduXiwiN
	3CQz30SRe6d/fLpBXtBLIDphH704TqifphqAaduEubr1ROGB5XxuM64szdDLuGOqgSwkqRWaw+M
	x1XO/nXSR7UZA0Cx09YPRDbOcTUAEFoYX0FehH/lgRLGcP8DUPydFYE51Y8T8VoU522WMI5HXAD
	23te3WCEgU5dOiZ4OPnLPqDXsT2YNmZUij57396BpoI4YzZNeCXAx0vI4Bd2b
X-Google-Smtp-Source: AGHT+IGR2QCMLRymY4uNNnoPEZUrhLVwrFSzGTHZ7+ukba/NHh2l6g80X/dchgoXzrAvgqhrUgBs1w==
X-Received: by 2002:a05:6102:3fa9:b0:4fd:b71b:c66b with SMTP id ada2fe7eead31-50fdf4dcafcmr806281137.2.1755157977280;
        Thu, 14 Aug 2025 00:52:57 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e56e00153sm878228241.25.2025.08.14.00.52.57
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 00:52:57 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-89018fa6f6dso174572241.1
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 00:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQIU40d9IbUfNQhyGCJq3yz5TQH4w6iMvyWoCuYQR3BjLBi+AC77jRMHubObXN1yF02Gs=@lists.linux.dev
X-Received: by 2002:a05:6102:8011:b0:4fb:def3:d27c with SMTP id
 ada2fe7eead31-50fea4aa249mr676943137.22.1755157976795; Thu, 14 Aug 2025
 00:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250813214808.895654-1-robh@kernel.org>
In-Reply-To: <20250813214808.895654-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 09:52:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXk4rsv5YEj5kJ4+tu-n_11rXOHe1zJiy7KYnvBwJZ=eQ@mail.gmail.com>
X-Gm-Features: Ac12FXx9pwnYSd00OxlZFeC1ex7P8HZ3DAupd0C5lnYndVT3t4qqLZV8fVUeU-Q
Message-ID: <CAMuHMdXk4rsv5YEj5kJ4+tu-n_11rXOHe1zJiy7KYnvBwJZ=eQ@mail.gmail.com>
Subject: Re: [PATCH v4] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Wed, 13 Aug 2025 at 23:48, Rob Herring (Arm) <robh@kernel.org> wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
>
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar

One nit below (which applies to most drivers).

> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -52,41 +52,33 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  {
>         struct device *dev = rproc->dev.parent;
>         struct device_node *np = dev->of_node;
> -       struct of_phandle_iterator it;
>         struct rproc_mem_entry *mem;
> -       struct reserved_mem *rmem;
> +       int i = 0;
>         u32 da;
>
>         /* Register associated reserved memory regions */
> -       of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> -       while (of_phandle_iterator_next(&it) == 0) {
> -
> -               rmem = of_reserved_mem_lookup(it.node);
> -               if (!rmem) {
> -                       of_node_put(it.node);
> -                       dev_err(&rproc->dev,
> -                               "unable to acquire memory-region\n");
> -                       return -EINVAL;
> -               }
> +       while (1) {
> +               struct resource res;
> +               int ret;
> +
> +               ret = of_reserved_mem_region_to_resource(np, i++, &res);
> +               if (ret)
> +                       return 0;
>
> -               if (rmem->base > U32_MAX) {
> -                       of_node_put(it.node);
> +               if (res.start > U32_MAX)
>                         return -EINVAL;
> -               }
>
>                 /* No need to translate pa to da, R-Car use same map */
> -               da = rmem->base;
> +               da = res.start;
>                 mem = rproc_mem_entry_init(dev, NULL,
> -                                          rmem->base,
> -                                          rmem->size, da,
> +                                          res.start,
> +                                          resource_size(&res), da,
>                                            rcar_rproc_mem_alloc,
>                                            rcar_rproc_mem_release,
> -                                          it.node->name);
> +                                          res.name);
>
> -               if (!mem) {
> -                       of_node_put(it.node);
> +               if (!mem)
>                         return -ENOMEM;
> -               }
>
>                 rproc_add_carveout(rproc, mem);
>         }

The "return 0;" below (out of context) is now unreachable.
It may be wise to remove it, so the compiler will complain when someone
ever adds a break statement, and people are forced to consider what
is the proper value to return.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
