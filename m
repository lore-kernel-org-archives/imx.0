Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037EF35A12C
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 15:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763047956; cv=none; b=rOLQq4L9j44GhzYzr3eLQTKDoMbkmlLrjPEi7Z/KUY21XsbsMEu9BtqaahPuDfvR1S3z4PR6rMsd9joB258Iz4a1vf0Q8lKjCR6xhoBBqrUzK5S1oNuKjSKzvNlfR8O8kQIdczHGkMSJJM1tfkN/6SN5hQp786G2zce1PjWmfGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763047956; c=relaxed/simple;
	bh=Z1vu2MOiIFQBcyrWVUVPL9kCsj3sq6loXCLsmGoUKac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOjbFEI86YUCWBajiGRedREl8yRlOLOg5JC3rQJ7ATnsyqFRMIqycF9F6J4i30TBZWvVzU4v/3Tf2CDCLGX4KILPwyoWmQrUg3uDfSXmgTVCREUXyl/20QA51+Ja5ndLCOmBN53VRtugVajeguAaMwInznAtOX9cc+Tw8q4ukdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u136mq2A; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u136mq2A"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-298145fe27eso10676235ad.1
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 07:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763047952; x=1763652752; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dc807XTs3vahOFZ04ibLRMSAJaCm4V/IMq6B1/2zPgY=;
        b=u136mq2ASKHk0k5X7IvqWWQ4mR4kB1qC/Fs3Xm/lzf5ZyYW38ru6cYLqO1gVlDMwi5
         BzCknGpQ4j/zSY8fdQqWfJdh24xXNHcAmF1GiuaPlpwTD719HPiOtXuZVkBzLkoL4KZT
         oZVGYk8eegcYa8k4nyQB4qYNZQDq4DMP16rIE0+T2AgjfZqzW9WZQP1KLZyv91yztjSK
         LFS4eUQDEYY3I8AM2HOwWdhIc+kLaMb6Rpxi1C/t1wbDI72lIySDP1B3QCwcuvxHkHHz
         pV3eCMYHF2i0yFC1lqCctckHsagmU7L84iauu37B68RHKHbxoqybReWpUruivmg/9wX4
         UAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763047952; x=1763652752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc807XTs3vahOFZ04ibLRMSAJaCm4V/IMq6B1/2zPgY=;
        b=isZkl8XPrgHJbB7oiW5USpob6G6L8tnvUKFSihHN6txs0WsbsYQRDK6VzsrV/cfXSe
         7yUAezB19j1DLZZeXNA4hDuW6rvBjVPkjBmezbePvPSUBAMPdYZ6pLYAuJCGXk7419Gv
         o9PWEAda4XsLlMBSaWaanIb/39f6a1XT92QGHFLQsJphHJHI3nH431vmXPnZCB4f9Ifw
         kIZxzpENbxnhMlWxogoOy1Qj4fzKPrZD5R8QLDWQyVlNKgO3YAXO31gdW0AoVbw2BgA0
         0njL+YcyoUDkhDxgxKUlaQt+/DwRWeragik/YZji/vOy/1mpnQ6o2QrHrq7dPO/U8utI
         sAGw==
X-Forwarded-Encrypted: i=1; AJvYcCWsVuEF++e0NzI1Aod+QnNBPFQf1J6vYlmFAJK47Fbys8fD9fiNA7N/MQIuDnKnzqteMgk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqVfM4yJ1hgixLmoRrxrCAC/7GoEDG8Tbi7GpfueVz/OQOt2WQ
	lfof6wSKbreUrvAXSh1ImCz3qHsxGOAmcdaNW3/qIonqULkX8UgI2gswo9dFTLu2+dY=
X-Gm-Gg: ASbGncvHsKKQaj1OpkR0W4gdOlmpkAGsFcS36gOwU6YChUq5giJ3FZiQJTl01OGmZTt
	OjwBURBxd7bZMx472rd6UBZIJDWnzxeTywFTLiCFKWo9LYRjRvdvaVf/yk5s6sPk3Gu5XWjL+Er
	LUUFo3WVEoTpUpB1BXd8kpxyvIl2ZwGvTFDtNjvFdJumEelkOzKDB3aPkDsCU6VMtNXs7ptFkWu
	OjBe6be1PUjS+BQxOFqv+FXpqp/UITWOqVCtSg6TiUaYXgIzylvkeWsSMpKFwGwvNVPn74CGzl7
	Ax4m2NdzG1pdyxXjFOrxyWnXvoOSgsn9d/vukHB1m0HGAkL3w+1FBJqQyRxHANLA0wlkySRNL66
	rKd3tHxOH3ARKPNmerJz5Ck3S4SSP/f9C1JQitt/5J14BIGfabidbxzKYkIvCdN+bNbfvlufwoF
	jIFvjsy7bd/QD8BJPGLSYGT74=
X-Google-Smtp-Source: AGHT+IExGtwG81uwzj9JgnEK26nwTkuowQ0TGIoI/B/ng4jHpuOWuk3RVAjeNdIAjjrFddHoISsZ3w==
X-Received: by 2002:a17:902:d54f:b0:295:34ba:7afa with SMTP id d9443c01a7336-2984eddf6a5mr85532495ad.43.1763047952195;
        Thu, 13 Nov 2025 07:32:32 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:aee4:3fd6:a52:8e9a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed4fsm29590765ad.75.2025.11.13.07.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 07:32:31 -0800 (PST)
Date: Thu, 13 Nov 2025 08:32:28 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v6] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
Message-ID: <aRX6DJoaP4MXG3fN@p14s>
References: <20251031175926.1465360-1-robh@kernel.org>
 <aRN0fdOAV0B728qo@p14s>
 <20251111195923.GA3629535-robh@kernel.org>
 <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
 <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>

On Wed, Nov 12, 2025 at 10:59:42AM -0600, Rob Herring wrote:
> On Wed, Nov 12, 2025 at 9:43 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Tue, 11 Nov 2025 at 12:59, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Nov 11, 2025 at 10:38:05AM -0700, Mathieu Poirier wrote:
> > > > Hi Rob,
> > > >
> > > > Please see may comment for st_remoteproc.c
> > > >
> > > > On Fri, Oct 31, 2025 at 12:59:22PM -0500, Rob Herring (Arm) wrote:
> > > > > Use the newly added of_reserved_mem_region_to_resource() and
> > > > > of_reserved_mem_region_count() functions to handle "memory-region"
> > > > > properties.
> 
> [...]
> 
> > > > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> > > > > index e6566a9839dc..043348366926 100644
> > > > > --- a/drivers/remoteproc/st_remoteproc.c
> > > > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > > > @@ -120,40 +120,37 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> > > > >     struct device *dev = rproc->dev.parent;
> > > > >     struct device_node *np = dev->of_node;
> > > > >     struct rproc_mem_entry *mem;
> > > > > -   struct reserved_mem *rmem;
> > > > > -   struct of_phandle_iterator it;
> > > > > -   int index = 0;
> > > > > -
> > > > > -   of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> > > > > -   while (of_phandle_iterator_next(&it) == 0) {
> > > > > -           rmem = of_reserved_mem_lookup(it.node);
> > > > > -           if (!rmem) {
> > > > > -                   of_node_put(it.node);
> > > > > -                   dev_err(dev, "unable to acquire memory-region\n");
> > > > > -                   return -EINVAL;
> > > > > -           }
> > > > > +   int index = 0, mr = 0;
> > > > > +
> > > > > +   while (1) {
> > > > > +           struct resource res;
> > > > > +           int ret;
> > > > > +
> > > > > +           ret = of_reserved_mem_region_to_resource(np, mr++, &res);
> > > > > +           if (ret)
> > > > > +                   return 0;
> > > >
> > > > The original code calls rproc_elf_load_rsc_table() [1] after iterating through
> > > > the memory region, something that won't happen with the above.
> > >
> > > Indeed. it needs the following incremental change. It is slightly
> > > different in that rproc_elf_load_rsc_table() is not called if
> > > 'memory-region' is missing, but the binding says that's required.
> > >
> > > 8<--------------------------------------------------
> > >
> > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> > > index 043348366926..cb09c244fdb5 100644
> > > --- a/drivers/remoteproc/st_remoteproc.c
> > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > @@ -120,15 +120,19 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> > >         struct device *dev = rproc->dev.parent;
> > >         struct device_node *np = dev->of_node;
> > >         struct rproc_mem_entry *mem;
> > > -       int index = 0, mr = 0;
> > > +       int index = 0;
> > >
> > >         while (1) {
> > >                 struct resource res;
> > >                 int ret;
> > >
> > > -               ret = of_reserved_mem_region_to_resource(np, mr++, &res);
> > > -               if (ret)
> > > -                       return 0;
> > > +               ret = of_reserved_mem_region_to_resource(np, index, &res);
> > > +               if (ret) {
> > > +                       if (index)
> > > +                               break;
> > > +                       else
> > > +                               return ret;
> > > +               }
> >
> > This looks brittle and I'm not sure it would work.
> >
> > Going back to the original implementation, the only time we want to
> > "break" is when @index is equal to the amount of memory regions _and_
> > ret is -EINVAL.  Any other condition should return.
> 
> @index equal to number of entries returns -ENODEV, so that condition
> is impossible. We can simply it to this:
> 
> if (ret == -ENODEV && index)
>     break;
> else
>     return ret;

To me this needs to be:

entries = of_reserved_mem_region_count(np); 

...
...

if (ret == -ENODEV && index == entries)
        break;
else
        return ret;

But taking a step back, it might even be easier to go from a while() to a for(),
the same way you did in imx_rproc_addr_init().

> 
> If you want to keep the prior behavior when 'memory-region' is
> missing, then '&& index' can be removed, but I think that was wrong
> behavior.
> 
> Rob
