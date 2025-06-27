Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A5227FB31
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035805; cv=none; b=aHrZvWPVj2tmLnTcz9wxtnRS7MZq9lRJBEYBTP5bbjF91HB9xDicgoAXZKBhoUe/rkR5Ea6gSFsKbWIxeagSWkyjnIRH4z88JPUgFUNXMCTdMRkh/YgrtiM3+/8AqZTkYK3loaS1dS2xR6+6hqgygMGqDYzhwGykUItLADK/z7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035805; c=relaxed/simple;
	bh=azHHeXfhNZdcGMpuROaZijRlH/fb/S19enbMkZXA6PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nk5hTRgZZZ0WC/6cwuFOnJqMFt2QROAZRtIUTLCKjBRQrzSiYtbod3Z16l3dqNBSrX/CX+an8IVQcr2y6KIPR24CbXUwduwSye0Q1aJljwe5wfMBgMkHGk9PDZGnUxJfGspkrAHHWxeNXuB0hhYnUKcVs1HS3bxd+4JKg93JUfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3s7GZum; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3s7GZum"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d3900f90f6so218915585a.1
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751035802; x=1751640602; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6PoA3nqPOfL5m3FPUgvFlM9WYiufmmjsQSygs6h2ec=;
        b=T3s7GZum4XnkgaCIGl9daiWHO+c6sv0YZeFSTmaDipRn9I7STN9BqJU/NPO5OJIywq
         cArDD+HupiPRJc7qxOPI1uf2A6TsT67gvh2jeSQwCuI3/nB6LruVbHCrCeU+VjvLUrG6
         eGhU+T1vTPE1+f84FWCU3smjtFoh3aYbjMw4jC7/4edoAnL2ylsnw2yQ0EVBFuHdxGBW
         51z0UgFffLY1X8gJ4or2HDC8LwaRKRi6+hEEIVb0DZ6R/Pfu/EBV4nAfEPJPjjOc4bxD
         PNfsef9R8zY4JoWc52U9FRPWm1aNsUQjA4z66PuMn82tJWwNc5M2wl1xz5OKlfOWseT7
         olWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035802; x=1751640602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6PoA3nqPOfL5m3FPUgvFlM9WYiufmmjsQSygs6h2ec=;
        b=S4PaHAdaF9qzHBiim7jJxueAOJtXVWiUOmhP5asQniPNjV3FoY1srwXCJzJu/r4LxP
         Ik+revZZLJc2xdiTCkayug7HraJLaEBHLfto5ENjOIbhtnQa0fvRIWaEY931gF557Tik
         6ZYBoUXhi2p5XdtRl9YGF3k7eh8N52adjG0BT4URnltwuOdO/sGoY1dSyfyG9SkEToXw
         3U7vp4BmpH+Jssf4rW4lceI2Cumxp4l/szU4IBQRvbrd01R7jVd+rcAWe4tUI+S9p225
         OUkLAosc1nnmhqSgaJHqRdhmD2dpmev3K/PQiFJn/uRng7JlloruX6PvNzYRgtLyQjRf
         uXGw==
X-Forwarded-Encrypted: i=1; AJvYcCUPaKO17cfpK8LICM3508kaqFxt0z+euF/I3Rts3gm1oD0nHHc0KNCstS7oW//D3KTFMJc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkmVRl47wEsZtHjwh4j+90++nXpIMyNvN0+eMYmsKj0fhNH68A
	MoNyU+1/+KFyTmtGLw66BmA2sIfNK7uG3gcthsaJlYyDYRWQ1pOU1oYE
X-Gm-Gg: ASbGnctefgxsE49LAyt5OXmNca9US+EQ0cCVzzRkfdcAA1FNJ3Qjlh9ztN7dSUp2Uh9
	YVaBCtAxJp7YINk3opt1Q3IwPDsxbZ6UZAdUjUIxDHMg0gFXzibkeoYh/G4PwLhr5VT2mDJSdnA
	wN0183IMQMbhcKoYD1wG3R29wIRjzoS2kcCRO2iZ3lkrMqQ6EIsPD6PXFy38aQpe7d9WA4rTMn6
	sM11/psTuM2u8d95745JiMO6bz2RCeR8vdkVu0vGgelk/DydVNsWk7rV1NtFS+YoP06ERT4msNJ
	JLH8RyUr7W9gFYcvcrw80b/GJAkIqY2sdzFqXdwocUbzZaxkXWh7bv+2xh7E
X-Google-Smtp-Source: AGHT+IFbou1xMk6JMnADPBUd4fd5n/7zRvglAq2fEyrggZQzPKVtz6a6tLxCnjDbX4s4r2fLBp1xBA==
X-Received: by 2002:a05:620a:38e:b0:7d3:b5ff:fb22 with SMTP id af79cd13be357-7d443994d26mr429693385a.32.1751035802120;
        Fri, 27 Jun 2025 07:50:02 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44321a706sm139134585a.81.2025.06.27.07.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:50:01 -0700 (PDT)
Date: Fri, 27 Jun 2025 11:49:55 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <20250627144955.tbmk6ako3rgv3djo@hiagonb>
References: <20250626215911.5992-1-hiagofranco@gmail.com>
 <CANLsYkzo32BHkxRzSLY1U_PcidMPOaz7xZjDs8HKtTCQ0ZpF=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkzo32BHkxRzSLY1U_PcidMPOaz7xZjDs8HKtTCQ0ZpF=g@mail.gmail.com>

On Fri, Jun 27, 2025 at 08:31:20AM -0600, Mathieu Poirier wrote:
> On Thu, 26 Jun 2025 at 15:59, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > This patch series depends on Ulf's patches that are currently under
> > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > Without them, this series is not going to work.
> >
> 
> I thought we agreed to repost when the feature referred to above and
> the work in drivers/pmdomain/core.c will be merge.  I'm not sure what
> to do with this patchset.

Sorry Mathieu, my goal was to update the whole patch series with your
reviews from v5 so you could take a look and then I would resend
everything again once the others have been merged.

If you prefer I can wait for the other patches to be merged and then
send the next v7 corrected.

Best regards,
Hiago.

> 
> > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > started by the bootloader and the M core and A core are in the same
> > partition, the driver is not capable to detect the remote core and
> > report the correct state of it.
> >
> > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > returns the power status of a given power domain (M core power domains
> > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> > already powered on, the driver will attach to it.
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
> > v6:
> > - Added "reviewed by" from Ulf and Bjorn.
> > - Fixed and improved commit descriptions of patches 2 and 3.
> > - Improved the comment inside imx_rproc.c file.
> > v5:
> > - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> > v4:
> > - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> > v3:
> > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> > v2:
> > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> > v1:
> > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> >
> > Hiago De Franco (3):
> >   pmdomain: core: introduce dev_pm_genpd_is_on()
> >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> >     SCU
> >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> >
> >  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
> >  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
> >  include/linux/pm_domain.h      |  6 +++++
> >  3 files changed, 73 insertions(+), 7 deletions(-)
> >
> > --
> > 2.39.5
> >
