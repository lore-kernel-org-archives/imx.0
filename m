Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B3023A6
	for <imx@lists.linux.dev>; Tue, 27 May 2025 00:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748304320; cv=none; b=ebHV2U3Xa7K/ptSGgsmzVTHCDPvjgsgZySpSnKyXRIgxDdobkjlqzSxU2m20WsibFfQHjznRSvYdhnHRFfLPVTvu/yxKAJs1rzv/dogxAmOyhXTF416dTsenhhvlH93o8K6jl2J/zkvq9CNRDb8pXtSwbnv1sKrLPIfB+RZWRlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748304320; c=relaxed/simple;
	bh=r1xxob3cHvQ50YeOPa143G4Cs++QqeFJ5fmfOzctg5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXptfkrOxaTwvJwqewfJCBbfU5NNuKE3Y/TB88otfkK9FaN01cPqb5YHATMr4NL+FePzklPoxXsKdE9LP2l24lhFgyUCAHPBa+tHj+1F2q695mAZdjZw+za2yncYktOHFnyCV3QNDjczJCtLDbHgdUmUbgD8PRkh8L/ugRXNaTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtI3vEj6; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtI3vEj6"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52b2290e292so821531e0c.3
        for <imx@lists.linux.dev>; Mon, 26 May 2025 17:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748304317; x=1748909117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Addthv64Q3TTSQf/2nFhVGk8jr68iUDk2g8AigrRaGQ=;
        b=EtI3vEj6tJKov7Y5IeQokZjwDTfSz/0HYEezP7EgcwCjqbqn9hhHzEhVvLRCZY1oob
         CrvHknSn1TVFlD9mnFEzsWxhXL9SAeLeJZ+NvLRBmi1VQMC+aoDrrLIZkjvchh5klZHX
         k9/ih0dLGYWjys7nLDbrrdHlxsLvWM/yk9MQVFpEoT7OMzIorysVHU4E3wrxLi8fbNz5
         +edlSd5xf4dSY02VwMvZTfw7ZTVP9yhZcOJB1qqhEm3eB5RtwT6OF1eB0NFl5OSSJPrg
         pVBqavkzLP4rXDxgzp01Q8iiQqY/ot+og4GOQKEXUr1meSXuTiLs5iysl8a5QZgkR3gK
         NmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748304317; x=1748909117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Addthv64Q3TTSQf/2nFhVGk8jr68iUDk2g8AigrRaGQ=;
        b=LmHu+pn1X+i6iKBxfnWDQGFge12t1s3PpNixWqsFovLcA4fZv6zxDWTPxnY7nQ7E3D
         vuNGND1aaM4fWy1eUh2vOtQ+IUR7Z1OQoPhFTL7NV+9bpe48cwtOUW+oS34jeY60w3r7
         FSBdI3a4hFLbKdnc+4XYIqwigczb3PetfMkRgSjq3lifOGfpqlxhN5pmzSNEqhmcfKPV
         Hon3a8j1dY71hkFyn06n/cYbWkY/zbjBqVC75mGZ2z2yIdqRM9BPVEnwl75G6V0DRh3G
         zHJyMbrZQv43jf+2LEAtO/wojQZZTH0CGfYnVBrF4Zt5jsi6bOzFaE1RKC97w4jKZuFS
         iD1w==
X-Forwarded-Encrypted: i=1; AJvYcCXZ28tV1wHV7RFZaHAFzZF5wA3f7PmnF28JgmxCp0MbXvefzclJ6rbux3K/8ZbPXS2853k=@lists.linux.dev
X-Gm-Message-State: AOJu0YztqIhbfUOd1VbLiW5QFMnW0OpZJdcDhVr+KuMRfPQQW7NddHBs
	iLvVAgz44JCmCNlXd6Se82Bcvp9bjDh/NY1ewNelgAr8kkbIxNa6zJG/
X-Gm-Gg: ASbGncuRY6rfqPSS38j3qcb+rTEUpGMzgR49u4o0iKYMu/jf+53iHTWU2CL8dgPReVd
	pBtGCa73RNsw6s2kCJ9d1E1GYx6G/W3ZYka+yFNYbja1hbZCsv+k6RIp8ncy1NqgT4dSZADjbPD
	eh+L6zuSzCsaz2OKTZUL4iveVCQbcLg8ymzUvYyj7cOvY3l3snXHjbPM0KrY/ygedYuS35cIP59
	2cvvq8VCeC/cmxRzE3nb/FQ/Z1AbQ/T7BZlnffJjwBN++RPzq1Bi0imBECdD2EZ2u4SZF+rQ4Vd
	baIDzBNvypf/zufHX1OOs2O/DCaY/yhOwSd/kd1mo3COw7Nbcjk=
X-Google-Smtp-Source: AGHT+IHEjq49q8FhVaC/VV5WmHQM/CAYARQEncGZ9g1VnXXQ7c/Eg+DEVGvPVjcXeeAr8+7lupfz7w==
X-Received: by 2002:a05:6122:169b:b0:52a:863f:4189 with SMTP id 71dfb90a1353d-52f2c5923f8mr7340486e0c.8.1748304317399;
        Mon, 26 May 2025 17:05:17 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c1:78c2:1931:19db:1830:5cf4])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52f2f73d4b4sm4433946e0c.20.2025.05.26.17.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 17:05:16 -0700 (PDT)
Date: Mon, 26 May 2025 21:05:10 -0300
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
Message-ID: <20250527000510.fofehmsdhifcwlys@hiago-nb>
References: <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb>
 <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
 <20250519172357.vfnwehrbkk24vkge@hiago-nb>
 <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
 <20250521041306.GA28017@nxa18884-linux>
 <20250521041840.GB28017@nxa18884-linux>
 <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
 <20250523191713.nylhi74jq6z4hqmr@hiago-nb>
 <CAPDyKFq6HG6iTZRnBSN25vhCU8Zj1c+r_ufGbiBsJ16N+1bJVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFq6HG6iTZRnBSN25vhCU8Zj1c+r_ufGbiBsJ16N+1bJVg@mail.gmail.com>

On Mon, May 26, 2025 at 12:07:49PM +0200, Ulf Hansson wrote:
> On Fri, 23 May 2025 at 21:17, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > Hi Ulf,
> >
> > On Wed, May 21, 2025 at 02:11:02PM +0200, Ulf Hansson wrote:
> > > You should not provide any flag (or attach_data to
> > > dev_pm_domain_attach_list()) at all. In other words just call
> > > dev_pm_domain_attach_list(dev, NULL, &priv->pd_list), similar to how
> > > drivers/remoteproc/imx_dsp_rproc.c does it.
> > >
> > > In this way, the device_link is created by making the platform->dev
> > > the consumer and by keeping the supplier-devices (corresponding to the
> > > genpds) in RPM_SUSPENDED state.
> > >
> > > The PM domains (genpds) are then left in their current state, which
> > > should allow us to call dev_pm_genpd_is_on() for the corresponding
> > > supplier-devices, to figure out whether the bootloader turned them on
> > > or not, I think.
> > >
> > > Moreover, to make sure the genpds are turned on when needed, we also
> > > need to call pm_runtime_enable(platform->dev) and
> > > pm_runtime_get_sync(platform->dev). The easiest approach is probably
> > > to do that during ->probe() - and then as an improvement on top you
> > > may want to implement more fine-grained support for runtime PM.
> > >
> > > [...]
> > >
> > > Kind regards
> > > Uffe
> >
> > I did some tests here and I might be missing something. I used the
> > dev_pm_genpd_is_on() inside imx_rproc.c with the following changes:
> >
> > @@ -902,7 +902,12 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >         if (dev->pm_domain)
> >                 return 0;
> >
> >         ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > +       printk("hfranco: returned pd devs is %d", ret);
> > +       for (int i = 0; i < ret; i++) {
> > +               test = dev_pm_genpd_is_on(priv->pd_list->pd_devs[i]);
> > +               printk("hfranco: returned value is %d", test);
> > +       }
> >         return ret < 0 ? ret : 0;
> >  }
> >
> > This was a quick test to check the returned value, and it always return
> > 1 for both pds, even if I did not boot the remote core.
> >
> > So I was wondering if it was because of PD_FLAG_DEV_LINK_ON, I removed
> > it and passed NULL to dev_pm_domain_attach_list().
> 
> Right, that's exactly what we should be doing.
> 
> > Booting the kernel
> > now it correctly reports 0 for both pds, however when I start the
> > remote core with a hello world firmware and boot the kernel, the CPU
> > resets with a fault reset ("Reset cause: SCFW fault reset").
> >
> > I added both pm functions to probe, just to test:
> >
> > @@ -1152,6 +1158,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
> >                 goto err_put_clk;
> >         }
> >
> > +       pm_runtime_enable(dev);
> > +       pm_runtime_get_sync(dev);
> > +
> 
> Indeed, calling pm_runtime_enable() and then pm_runtime_get_sync()
> should turn on the PM domains for the device, which I assume is needed
> at some point.
> 
> Although, I wonder if this may be a bit too late, I would expect that
> you at least need to call these *before* the call to rproc_add(), as I
> assume the rproc-core may start using the device/driver beyond that
> point.
> 
> >         return 0
> >
> > Now the kernel boot with the remote core running, but it still returns
> > 0 from dev_pm_genpd_is_on(). So basically now it always returns 0, with
> > or without the remote core running.
> 
> dev_pm_genpd_is_on() is returning the current status of the PM domain
> (genpd) for the device.
> 
> Could it be that the genpd provider doesn't register its PM domains
> with the state that the HW is really in? pm_genpd_init() is the call
> that allows the genpd provider to specify the initial state.
> 
> I think we need Peng's help here to understand what goes on.
> 
> >
> > I tried to move pm_runtime_get_sync() to .prepare function but it make
> > the kernel not boot anymore (with the SCU fault reset).
> 
> Try move pm_runtime_enable() before rproc_add().

Thanks Ulf, that indeed made it work, at least now the kernel does not
reset anymore with the SCU fault reset. However I am still only getting
0 from dev_pm_genpd_is_on(), no matter what the state of the remote
core. Maybe I am missing something in between?

Peng, do you know what could be the issue here?

> 
> >
> > Do you have any suggestions? Am I doing something wrong with these PDs?
> >
> > Best regards,
> > Hiago.
> 
> Kind regards
> Uffe

Best regards,
Hiago
