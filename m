Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633201885B8
	for <imx@lists.linux.dev>; Tue,  3 Jun 2025 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960522; cv=none; b=JFfCGs+QwuneuNoZ2GTJpceShpiAURVgazRFKTiNaeNLPH+QBMAIoTUAqklEhF+JGSC4/uVOmntEmErv+ZDdlUn/qfz8d77U/dpUCeFwo+Sz8C19MYL1Y9uYw2oCSz0Dfw45K1B6GeRLKkxZP3J82GXIC/M6szSvuZN8m/zRfUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960522; c=relaxed/simple;
	bh=LJ+KewoxG7r/WeJ8eTGCl/7+HpY8ip3l8VhsVeTJHSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8mhI4KwS6A7U6xnmlZyVC+nLEJr46ZyNMmy2YjtuzebwKCVEUkcCdCu1KHtN6EWKMBdtBELe2i/USgTtZXKPfZkid4kvD3CpWaYvll9V3otC1dvJh3WiXT3bl5HCeuxglBbbgaqfzEsN4zK9aE8c0qn6dKxfIlpUyl7O+R2rrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEvj4Q/A; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEvj4Q/A"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72ecb4d9a10so5733555a34.3
        for <imx@lists.linux.dev>; Tue, 03 Jun 2025 07:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748960520; x=1749565320; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2uRLCXdLzb4exE9EX3UwPPfJOF++R02ZMsB9cLfhyoQ=;
        b=WEvj4Q/Aj1SqxTO/n4bBobNLWIHGkOyytgfi6U9KuHTko4MQlSqkOHY43D1WEc5ADJ
         dSU9aYN6V8j+Zkaofj++lI1O+9pY03SSdMejLxqPh/wJ7WeRUlA7Fc72zCYJZZJ3F/80
         WlYgRo7PrRUKrLYC0hO7U+6oa2LPUNPtTn+yq/CRV57gYbCj8vndPxKe9ujSftOLgmRr
         BQh0TYEP18pjCFgbK5gZx4naXK2Oo56vJTEXAqZAELTb8R3TRJokUOw8ZOd3UwSRKjHI
         DCQjy0DJgMVzrsD+g7MW0WJvSPtg75bulEaJQgiabgh8fQObdA0qazTwDuhq+RrY2Yq9
         5D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748960520; x=1749565320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uRLCXdLzb4exE9EX3UwPPfJOF++R02ZMsB9cLfhyoQ=;
        b=ZI3tajFVxWBcrUTDkDwJYEs5W9N/65rQKMQo+2pc4VhV4YoPTksMjB+C2EAFptkrrH
         6nQAbr3BAuPzEch9VuiCmCNdmVqca+XqafFrI9saLBg01SLdgzxDEFBGy8ziHb45tAI1
         8m+fZPifXVejVGIH8PIKM4JrulqDRs0x+q/M/0khXW3EyCO0ClW0YZyClm0WvWK36TIH
         PdmMWnPC/ZkXQhrLwz1K708lbpoI6FGFPSwHAHE00CZyPzyDVsyU9qv81jtOHacb2nKp
         +hGyYXXtB9UPNNPJ3pSxSH3nRwmS2zXHAUb4KweyXBt0Z3uBO7OCEWmect0ylA86Rkjq
         RxYw==
X-Forwarded-Encrypted: i=1; AJvYcCUyoAsogC+R5bjIPyUSdKJZb72Bggf1M/ZKAelhmPM04A+RQO7Y5PPjFa+ctMyz5Oo2tWQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi4eoqV0jWbldWl6V8rZNDWWXZ4+r61xjQweeR+k+rP3haRi86
	ShM68H94/eR0dEupsG2QauzAs1jPlePEPtrdxu3HmwyG19ivEs4WqeZp
X-Gm-Gg: ASbGnctq+qxOrF+DhUYIcR5w6eJx3qhVpuSCALzpV0QeihNq87+gHUquUMloN9XmOTW
	5nZrLEqxpRNUjig4NjtVAPpvHcdvtcAFeMp/e3/nHsk5BnjUvw+eKS1p4qJujb06KQZM2VXCkQ9
	8zbT7c7xSA8uz0oAYGeFQczXyW3SgsfH45+BaPA/bm94vxARX1F7izIMjqCpun4UkyhV1AIhFD5
	X1XTPVVT/kjbCT2/SR9AdDk+Z+iOOd/qGwO7M1loPKWG5U5BtbY63u5703BOcApXNYnBDkDweba
	6fC4xKoRuN/krdKoNohY3ZzFJQgTCxeJ8jSIEAD8rCNY9oUSwDrZU0Mi0/nt
X-Google-Smtp-Source: AGHT+IFkCT6KXDiNwC9LZ8x7mvQVq5dsUSOwWeNt5tI1w1w2MQsYARI+9tl0cuB6j+Q1q13EXmEjPQ==
X-Received: by 2002:a05:6830:6687:b0:72b:94d8:9466 with SMTP id 46e09a7af769-73676b969aemr12031524a34.28.1748960520043;
        Tue, 03 Jun 2025 07:22:00 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a38f77dsm7670028241.22.2025.06.03.07.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 07:21:59 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:21:54 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <20250603142154.6xa3q7gd3kxk4kxo@hiago-nb>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
 <CAPDyKFrUAF5oWkyc3mLf0+R9VAypBotNyR4B5Chr3KQFYJOjbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrUAF5oWkyc3mLf0+R9VAypBotNyR4B5Chr3KQFYJOjbw@mail.gmail.com>

On Tue, Jun 03, 2025 at 02:09:14PM +0200, Ulf Hansson wrote:
> On Mon, 2 Jun 2025 at 15:19, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > This patch series depends on Ulf's patches that are currently under review,
> > "pmdomain: Add generic ->sync_state() support to genpd" [1]. Without them,
> > this series is not going to work.
> >
> > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > started by the bootloader and the M core and A core are in the same
> > partition, the driver is not capable to detect the remote core and
> > report the correct state of it.
> >
> > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > returns the power status of a given power domain (M core power domains
> > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is already
> > powered on, the driver will attach to it.
> >
> > Finally, the imx_rproc_clk_enable() function was also changed to make it
> > return before dev_clk_get() is called, as it currently generates an SCU
> > fault reset if the remote core is already running and the kernel tries
> > to enable the clock again. These changes are a follow up from a v1 sent
> > to imx_rproc [2] and from a reported regression [3].
> >
> > [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> > [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> > [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> >
> > v4:
> > - dev_pm_genpd_is_on() introduced to drivers/pmdomain/core.c
> > - imx_rproc.c updated to use the generic power domains instead of the
> >   SCU API call, which depends on Ulf's patch series.
> >
> > v3:
> > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> >
> > v2:
> > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> >
> > v1:
> > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> >
> > Hiago De Franco (3):
> >   pmdomain: core: introduce dev_pm_genpd_is_on
> >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> >     SCU
> >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> >
> >  drivers/pmdomain/core.c        | 27 +++++++++++++++++++++++++++
> >  drivers/remoteproc/imx_rproc.c | 33 ++++++++++++++++++++++++++-------
> >  include/linux/pm_domain.h      |  6 ++++++
> >  3 files changed, 59 insertions(+), 7 deletions(-)
> >
> 
> We are awaiting further feedback on the other series [1]. As you have
> tested it, may I add your tested-by tag for it? Or perhaps if you can
> send a reply to the cover-letter for it?
> 
> Anyway, for $subject series:
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Sure, I replied there with my Tested-by. Thanks for the review.

> 
> Kind regards
> Uffe
> 

Best Regards,
Hiago.
