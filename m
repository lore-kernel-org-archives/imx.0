Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0ED2777FC
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383661; cv=none; b=Li90U2/3GzUvu+h0l2jbHi3wABbFGFlVVCmVq+0u/acDLDmsfd5u3pdd6L1zyoRCJVoEGdgUcfJ68fjDQiYbUuWKlk2lTO8sMRqYiAxebxefpL6JPRErH6ccR/iPjoN9Csaaax5gGRWRfMjMyNUTE+6/7CPobYH2wWZ8i62wVZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383661; c=relaxed/simple;
	bh=9liZjkpuVRzepUk67tgGkXDJwUW2A930piJLEnM5Yb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyreBEIKx8jKUM3MNTlDRPNA7uU46niyBecbXc+zIXZ4mmXyR7ncSGIh6ZRKuoa4g0uKeg2sLKJOIBY6entqwUR3vl6pYVYe/1/tXKtOJoR5KRZuhDxINRWNVrZeCLr+dkartbHV18FUQ92A7jjAe32p7QxHgNUTA/9KFGv2uBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LW0TyWCD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LW0TyWCD"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so5850572b3a.0
        for <imx@lists.linux.dev>; Tue, 01 Jul 2025 08:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751383656; x=1751988456; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/0SAjT3Kg+X8y37BzmTeLChqfzpi9tbPWxRH4vKr8Jw=;
        b=LW0TyWCDNRm7SyNUiytZOJoJFHgGTD4BV5PwaK7WNRc6aRtQox1iyN3wijEKJWT4YI
         X0/wPpwanbEA+23eLxdBYhFZqZyUhT/J3VCKrN1JZSaHZrVeA9e3r89tKuAM1fUK/zSc
         TtOH2v6hVz6hjCBJA6Zm0ITzJagxCK/AlhgrGJHM6EUWsdyRyIvX7t8MnvVBsIhfdZm5
         u3ngNnyJmbmAC8qKjQyHMH+KSCXC7L1VbQMAqM+77nV731qZ+Mx6sN0stlH67jd4HERq
         yjM0Tkh14sJ08uOWSzqFjci1iVkPoJsvb5rEkvJ7yHhblnGM7cu9A8GR7RTXqwp4QKzq
         FdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383656; x=1751988456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0SAjT3Kg+X8y37BzmTeLChqfzpi9tbPWxRH4vKr8Jw=;
        b=g+m1jtLkN7jugDjzEEZSRduoF0PBJR5Sg9RWpm0oVqS/s2c/Awc+9rJGxv3m6WJZ9T
         l2IjwDCvsGiNFJ77co2+9aeKJXGI2mIVTudmnyB0NYT38ZJwjV9VACWKPCR9K1kxuaT6
         Q27RNvREEC3lJpy7amqwKlfL/PZddWHaJS0fbgOox+ykqRmHzvsPPcGxKJpUU29nX5Vg
         b4y3SkqN8E3SODeBy4Yh8UEuiXqrDFcVuYVA27W+fqGgJnfDh7vLxfxmtim50B2Y4YgX
         BbN1+XCP1urLcchO9IiPKEa7dETw7en8AHTa7uU6TcVt+NhyZzkGJYQKqqg5etac08cl
         uEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEve8U2ZpMRXgR90wbK5AB9XxpRVPGZ8y9EMDoa3NpEcY9uOfn3MlRpgunpE7fFoBmb9g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxafk3tHkzXUbaLMhj538l16tzsttdsFb7EEErRgGCJQ8MWyKnm
	b2YzCXmtqpd+6sZ6ooxMBwuhsQFHqf8EpIqqcoVcHqELVGhLPhIEQEO1na7rFW5BTxU=
X-Gm-Gg: ASbGncsjchctP1uqOsat/8SAa+V87y2lC27S6yyzXGql/ToNk0pVUfbOD/vLYvNPVPb
	RJmGUOQEu6pPQIzGmUiKRCH/wncHUVWJmeM6ZTHc9AURDEvmGEEsGvR846wQBugD02zBH5xVLbU
	3qiJ3BVS6jGi4m7m/5852497ufldAIhsZS7MohbDqWZlnODApICBOXQOc2E9p1/FtiEN24x8trN
	Lhit036inP9AA/ZL1qgr/vWwXFI09yqaTagAkYhka9xrR43UNYS+Isn6WbYbHkO0B06IwC1NyXU
	CqoiaHAm0SJi+/faIfuayuzMC9KpND62vSuey6+/XSDzvGaSfmjlSjUGIk9W13qx4A==
X-Google-Smtp-Source: AGHT+IHwXE6TtTbogZXGrSWNeH17X1Eg9b1iMZBmFtEaqZg3w/0LyLCHYU1l4YImcwX/ylYXOnxCQw==
X-Received: by 2002:a05:6a20:914d:b0:220:8ccc:2feb with SMTP id adf61e73a8af0-222c99ba442mr6683521637.12.1751383656024;
        Tue, 01 Jul 2025 08:27:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:94b9:2bc2:7ead:7a72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef4dbsm12287004b3a.160.2025.07.01.08.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:27:35 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:27:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iuliana.prodan@nxp.com,
	daniel.baluta@nxp.com
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
Message-ID: <aGP-ZVuhBdd1GPLe@p14s>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com>
 <aGLBvXtSRlaKujqM@p14s>
 <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>

On Tue, Jul 01, 2025 at 10:28:33AM +0800, Shengjiu Wang wrote:
> On Tue, Jul 1, 2025 at 1:05 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > > Add call rproc_coredump_set_elf_info() to initialize the elf info for
> > > coredump, otherwise coredump will report an error "ELF class is not set".
> > >
> > > Remove the DSP IRAM and DRAM segment in coredump list, because after
> > > stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> > > index 9b9cddb224b0..9e7efb77b6e5 100644
> > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
> > >               mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
> > >                                          att->size, da, NULL, NULL, "dsp_mem");
> > >
> > > -             if (mem)
> > > -                     rproc_coredump_add_segment(rproc, da, att->size);
> > > -             else
> > > +             if (!mem)
> >
> > Flag rproc->recovery_disabled is never set to true, meaning that since this
> > driver was introduced, some kind of recovery was available.
> 
> Actually since this driver was introduced, the recovery can't work.
> We didn't test the recovery function before. sorry for the mistake.

Let me see if I get this right:

(1) Almost 5 years ago you sent me a driver with code you did not test.
(2) It took all this time to realize and fix the problem.
(3) I should trust that, this time, you have tested your code.

Did I understand all that correctly? 

> 
> >
> > I worry that your work will introduce regression for other users.  Daniel and
> > Iuliana, once again have to ask you to look at this patchset.
> >
> > Thanks,
> > Mathieu
> >
> > >                       return -ENOMEM;
> > >
> > >               rproc_add_carveout(rproc, mem);
> > > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
> > >               goto err_detach_domains;
> > >       }
> > >
> > > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> > > +
> > >       pm_runtime_enable(dev);
> > >
> > >       return 0;
> > > --
> > > 2.34.1
> > >
> >
