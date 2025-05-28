Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDD628DEF4
	for <imx@lists.linux.dev>; Wed, 28 May 2025 17:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748453902; cv=none; b=s6T9DxD58mesmIP1a/SA7+0zhy9hbXDzCbMFepvXqBJC+dpE5NODIAxGKGeIqB9LgvwHSreEHR56CvQIenp28CiMtesueklSc4txVoVyTZuVTf9wRLT/QoK3CUlXTfspltizSd0IGI/Jz02NZVKAv2momKJJYCKh6QScLczVYt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748453902; c=relaxed/simple;
	bh=U++dy45I+onFjsonr1vngeU772ZgTI8qI+k6vKRdUN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDPnr+IbNXVjlJ1N1ZtqUH3YQkSYZAGO9zKVfIcTf0QLBwX/OnQ1F6az2WIDPNnU9yswKjCPBullUR42tGcFSB7mKveeLCeNIA+GOJcuLgeXTNj3+j7S3FW2YTueCBWOLmXDnvf/uuxuqGojrEBMFXSjBj2hQl8onrq6P/RwapM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dj4os/ul; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dj4os/ul"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52f4327a0c8so6518e0c.0
        for <imx@lists.linux.dev>; Wed, 28 May 2025 10:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748453899; x=1749058699; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XuU7vghs/Roa4fUMqe76N60+pRs9TTlZ7VpQ6fcHfmM=;
        b=dj4os/ulFbZGRGm57/vW75ump+HLpZulPDirePQYE/Hfpcgp379oVs5XHDUJ3qWVZ/
         HfU1U4zvfe6WVnFE+9LF1/m1Ke/5asdhR4qIXvyozkPUhH3fr+g3BqdGMrOgeGFu+OyM
         mOV1dEsibbijzmz+zQqxzX5OER7hvn4uCXJ8BByI02MQOnhvnp75ZVtgK9kHPgmGtZQS
         8pXeESwWHIC0t7anIzKvSGkMfqZ5F/2+iAGgjcOvmu2AZeq0Znzmibu3uUmiOk5UEKZw
         9kRVn1PDdfyKXWX1lwrQ7aMjmMKIgk4JLG0yJXJNUvZzW0jeWcGXKFe+w89Ngbu0awOV
         k5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748453899; x=1749058699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuU7vghs/Roa4fUMqe76N60+pRs9TTlZ7VpQ6fcHfmM=;
        b=lRboVQvdEn8XKNC/4lRCk9G/pVyYCozyVMkijPHvl+valbezr23m4zhZZNnKJBDRT4
         x+icGj/w3aAqdnX1pMNc9k2880kwbLu9qVFi+ndd0l5ckQF7W/pQDrrxkhoyDA5PvWg0
         FIfvT6fuM/lAO/Dujd+XLktvK6MI2XWc4xk7NpqyfONkmwUGVV+rNfI2Ua2M/HGbPWyv
         v5rAlhjjcYo2x9pBYI2I/GphI4MQvrSJIdmlZNkoxfRhK9zhKVnX64G/pvF39yba210V
         Rhhx9d8SmXHXBN5V8P2OumiokEt5brVJEcbg1XIeczBg7Xn/wiarowM6CU3cNDSEkwCs
         nY7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgF+BeMW7FcPFO8xPLkESQ4u/0whXYKsiqfLoB7JQv25ygJPfLqLZszvIQuISaY2xwstI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrVjujR25kX4yyLjj4HOHr58haKgPlYC6gjbK1d7SypLkgyqTx
	DPeeQPi2zQuYypcZW5iHslFtUGsnNYCvT4g4tdB7bigLOnQdDjC5uQJ+
X-Gm-Gg: ASbGncthyf9fLZoA4nwL6Xk1mHCcnk952F/nVtQ0zw0vx+lJ/qK2yNhs8+VLjy9mxZa
	g2yro7gHEkgYYmVz994JltXgVtXTQ/AT2f524A1DPB4itOsPEfypd3xdhdvQ/iAORAL1O/dEEqk
	OcG5g3XLBtyk38HmB6LjxZwjVto+LptY5ajTU7ytgU4cUWuBkp6YpM5mQ7nbaAV5TEJILrBpDAe
	R7UMmxKgJkkdcRJyuUWcmMvgoP4lPFt5I74xshWZfSiNdrhP0Rkvc2oM2IHHGhnw+0ahUtfjR+d
	utiC64QQ+J76OV9vqjAUXy/zl7+2C1gKnwMO26pY6V1PuRuBSFK48W+pFcTb
X-Google-Smtp-Source: AGHT+IH0yWuJoUrC0OxGQWzTqljadyq7cuFUTOFbkQW4fn/ETHGhWue+swzwXlHVyYeAv2NimJNc6A==
X-Received: by 2002:a05:6122:4286:b0:523:dd87:fe95 with SMTP id 71dfb90a1353d-52f2c5919c0mr15157933e0c.9.1748453899161;
        Wed, 28 May 2025 10:38:19 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53066973c62sm1439097e0c.44.2025.05.28.10.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:38:18 -0700 (PDT)
Date: Wed, 28 May 2025 14:38:13 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250528173813.rxqu6pzqgu4m5joo@hiago-nb>
References: <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
 <20250521041306.GA28017@nxa18884-linux>
 <20250521041840.GB28017@nxa18884-linux>
 <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
 <20250523191713.nylhi74jq6z4hqmr@hiago-nb>
 <CAPDyKFq6HG6iTZRnBSN25vhCU8Zj1c+r_ufGbiBsJ16N+1bJVg@mail.gmail.com>
 <20250527000510.fofehmsdhifcwlys@hiago-nb>
 <20250527023921.GA14252@nxa18884-linux>
 <CAPDyKFqZkcaGfss=Oi+H9UERFU29jY2t5uTPnGVGQgSAJSeCoA@mail.gmail.com>
 <20250527134525.f7yzs4ww64xxmjmr@hiago-nb>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527134525.f7yzs4ww64xxmjmr@hiago-nb>

On Tue, May 27, 2025 at 10:45:25AM -0300, Hiago De Franco wrote:

[...]

> > 
> > Thanks for the detailed analysis!
> > 
> > This is a very similar issue as many other genpd providers are
> > suffering from - and something that I have been working on recently to
> > fix.
> > 
> > A few days ago I posted a new version of a series [1], which is based
> > upon using the fw_devlink and ->sync_state() support. In principle, we
> > need to prevent genpd from power-off a PM domain if it was powered-on
> > during boot , until all the consumer-drivers of a PM domain have been
> > probed.
> > 
> > I had a look at the DT description of how imx describes power-domain
> > providers/consumers, along with the corresponding genpd provider
> > implementation in drivers/pmdomain/imx/scu-pd.c. Unless I missed
> > something, I think [1] should do the trick for you, without any
> > further changes. Can you please give it a try and see if that solves
> > this problem?
> 
> Cool! I can give a try and provide an answer soon. Thanks!

We are making progress ;-)

With the patches you shared Ulf (I added them on top of the current
master branch), it works as expected, dev_pm_genpd_is_on() returns 0
when I boot the kernel without M4 running and it returns 1 when I boot
the kernel with M4 running with a hello-world demo.

However now I tried to, if dev_pm_genpd_is_on() returns 1, put the
DETACHED state, something as

if (dev_pm_genpd_is_on(priv->pd_list->pd_devs[0]))
	priv->rproc->state = RPROC_DETACHED;

In this case I used 0 because I understand this is the
IMX_SC_R_M4_0_PID0 defined in my device tree overlay:

		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
				<&pd IMX_SC_R_M4_0_MU_1A>;

But in this case, the kernel does not boot anymore, I see the "Starting
kernel..." and nothing else.

I am using the pm_runtime functions before rproc_add():

@@ -1146,6 +1154,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
                }
        }

+       pm_runtime_enable(dev);
+       pm_runtime_get_sync(dev);
+
        ret = rproc_add(rproc);
        if (ret) {
                dev_err(dev, "rproc_add failed\n");

and calling dev_pm_genpd_is_on() after dev_pm_domain_attach_list() has
been called.

With kernel not starting I cannot even debug it. Do you have any
suggestion on why this might be happening?

> 
> > 
> > [...]
> > 
> > Kind regards
> > Uffe
> > 
> > [1]
> > https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> 
> Best regards,
> Hiago
 
Best regards,
Hiago
