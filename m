Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CCE2E1F0E
	for <imx@lists.linux.dev>; Thu, 25 Sep 2025 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813934; cv=none; b=OWBegql2FFvcAZGamGz7xfoK28OLdAzPC4VloohlxuVTPswDqQ+8NPfAdchLLMjWqsrRTtyV2ocQEKi+SxADFFxbRUJ4iqs3wmjt3JEaWwpsAg1KdyUXmv6wP9WxmnzacMICJk0YGG1Q1rM/UnZl3F9W/sW1MLS4QOT2kvi6F4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813934; c=relaxed/simple;
	bh=Sfnu02sWQqqJf145CrIFLmP+gKZbUM6UT9GMZg+gyLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ9Dr8/5eUlgGuYQMiOnw07yrgOrx9Fd6eLTua0LpulwIPxEZsRm2uyU2zNcVpSMvHPTwvSNrRX7lgJ4id27Ck85J05M+JWLA9psxpZ+Q12Nu7kmeZUaUxp6vG/C1E/aPqE5/UM1oBWK/fExflJhj6xnFcwzuMlTQ3ud1hLqPSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iBM4jSLX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iBM4jSLX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27ee41e074dso4497975ad.1
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 08:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758813932; x=1759418732; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pfAVQsJMCa+08II6sZx8nLAvAG7+m2m1wBLI5CKcaxE=;
        b=iBM4jSLX3tRjUFjEZLz5H8XbNoPFjpxBqi/ynNeB3g9bBnJXDeqMDH/3OOgbu14dWH
         jNf/ei7MI4vKApiiu6giZJNB2XgYwEULVK0D8kpZ5M/UJGV1GcHs5R7CpBTnex1zLB7i
         iD9W93TsprR7QoN/L3A+bQnJPvAYDUbdCasCPU2173ZySG7tiXrcq7VAhtTWWDS31tbo
         PApMeyW4Po8/dVwMpBPY3iUV9bDF7ehHgOnY8qlwPQfY86L2BTyMqyDg2P3oACpPdvLA
         WRzPg4TXD7KtgHdh4OOhXBzE3YwcLSDTOtK6A531XcqSyO7Vf9N+qB1Mna9ASMCck9X5
         P9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813932; x=1759418732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfAVQsJMCa+08II6sZx8nLAvAG7+m2m1wBLI5CKcaxE=;
        b=egjI5kv2k5xkTFPA3lz7xB9HYv5IzuiHf1BfYCvN4CPrqGKGVGc2zT8A0F+Pd/fTLw
         aK+t0nv0b/gSOJ77twQkp89yH5M6+RY9QFcSBnpCasByvAuHQkPKQs1w6i5pRZBNF/zk
         05WehZs+5t72ICD1bd7NLA3D17URNSwWGiJL6HHJKczLhzKHT7Acvt8CdhjACCdgprFC
         ZkWQhTrqXCAW/j3NLDW8uyoUd8HLXD/cJm7ta8NEjLCF1CnR6UNw3YJM2Yd154WgFTiU
         M8lPlBTDx0mDkyvbB7WD64pBHNmpFyZbwgoXVqfXdj3q0Gnv0gtWEu8sgug10bU5ITew
         cyPg==
X-Forwarded-Encrypted: i=1; AJvYcCX6p1BU5iMMnKeRbHb1Unybfk3AdF9EjidkTfHpc/BjbTltTWVOKC7xIn7f1RZ3u/4sjmw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkdsQmz21ESC8g7lt2akFtu+BMYYYqrnQBvnix58o+yLvlaUEQ
	fmm30ETa1l0bIElYQ0j+/xP3mycPaNaDliTaGCKZA8CCxkYFvRwlxnUUpV2VIw4SkTc=
X-Gm-Gg: ASbGncvZh+Cggzh3+hO8f1O4CVD/U2J+Eus3ptTJO/yhGbWNRLc5f+SGrCwWJvrOISf
	quX2isac17pY+3ppTFbp0INtsCUgVPtJMQ3y57lnObwj/v7iFFGlKyov1s3DSeoK01BeBQ42eoN
	T/xN4FDlO3mHHQ0MdtqOXNNGnPzrRXmaiTdxP970Us/CslV60BuekCLxmgkCYOUiEzEjo4oOwYn
	m1uXLAsqa8I4kjJ2tYzkFbHHsYqqlg9OpigAQp4E7qDxnMrxNpFvU3JtFAHvUwbB3o9QXmtWzaA
	d+a39m9Izq4BDXjyoX2HhK/d67ORNMnMf2R3I07znysF3c5MyvOBb7cVtx1u6knTvvJI9nzIkff
	OHqbUiXI8r/XQCC6GQZGBTG/awfhoJuzMh1S4dJjGh2tlxMJcahXB3KMzAD/VN0YDeYdYaQMdlW
	wrMZ8ZASe3Q1QuKRgXw1RdaDA=
X-Google-Smtp-Source: AGHT+IFaUWm0IMFuhwxwZ6ZVuoRzGDUplyarDIAkk4+v9ajtIq9wSLIjRgUT3UbBtMTnindWS3TDDQ==
X-Received: by 2002:a17:903:19ef:b0:274:3db8:e755 with SMTP id d9443c01a7336-27ed4a7ec49mr43070925ad.30.1758813931703;
        Thu, 25 Sep 2025 08:25:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:491a:5e5:2a2d:1b96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d37casm28336435ad.8.2025.09.25.08.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:25:31 -0700 (PDT)
Date: Thu, 25 Sep 2025 09:25:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Message-ID: <aNVe6MG2HiWNJZQP@p14s>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
 <20250924164650.GA2711@nxa18884-linux.ap.freescale.net>
 <CANLsYkzWQEWKM-_iff7wY-sk_OERFiAMSrXP6Cyf8vJfXqunjg@mail.gmail.com>
 <20250924203115.GB2711@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924203115.GB2711@nxa18884-linux.ap.freescale.net>

On Thu, Sep 25, 2025 at 04:31:15AM +0800, Peng Fan wrote:
> On Wed, Sep 24, 2025 at 11:10:33AM -0600, Mathieu Poirier wrote:
> >On Wed, 24 Sept 2025 at 09:35, Peng Fan <peng.fan@oss.nxp.com> wrote:
> >>
> ...
> >> Sorry for early ping - I just wanted to check if there's any chance for this
> >> patchset to be included in 6.18, along with the other cleanup patchset [1].
> >
> >It seems very unlikely.  I am currently looking into how the PM
> >runtime framework behaves to address my own questions about this patch
> >[1].  Furthermore, I am worried about the usage of the device
> >management framework when it comes to freeing memory.  I will get back
> >to you with comments on that front when I know we are doing the right
> >thing with the PM runtime framework.
> 
> I see. Not sure Ulf could help clarify or review, then you might take less
> time.
>

It is fortunate that time was taken to understand the problem and fix it
correctly.  Otherwise we'd still have a problem and more patches, possibly
wrong as well, would have been needed.
 
> >
> >I dropped the 3rd cleanup patchset.  More than once I asked you to
> >submit only one patchset at a time and you still refuse to take notice
> >of my request.
> 
> I apologize - I now recall your earlier request to hold off on submitting
> further patches until the table_sz clearing patch was clarified. I
> misunderstood and appreciate your patience.
> 
> Could you please clarify whether there's a general rule in remoteproc that
> developers should only have one patchset or patch under review at a time? If
> so, would it be possible to document this guideline in the kernel documentation?
> That would help avoid confusion for contributors.
>

Most people tend to address one problem at a time, especially when subsequent
patchsets have dependencies on the previous ones.  I'm not sure there is a need
to document something like that.
 
> I ask because I have other patches queued that are independent of the current
> series, such as:
>  - Reintroducing the table_sz clearing
>  - Misc cleanup in remoteproc core

I'm fine with those, as long as you address just one proble at any given time.

> 
> I understand you may be busy and have limited bandwidth. Would it be feasible
> to offload part of the review work to Bjorn? I rarely see Bjorn reviewing i.MX
> patches. Alternatively, could we consider bringing in a third maintainer to
> help accelerate the review process?
>

How fast do you want to go?  By and large, I reply to patchsets within a week,
sometimes two when things are busy.  And when I can't meet those standards, I
send out an email to the mailing list with the review order of the patches in
my queue.  What else are you expecting?

Bjorn is maintaining over a dozen subsystems - I stepped forward to maintain
remoteproc/rpmsg to help with the volume.

 
> Thanks again for your time and guidance.
> 
> Thanks,
> Peng
> 
> >
> >Mathieu
> >
> >[1]. "remoteproc: imx_rproc: Fix runtime PM cleanup order and error handling"
> >
> >>
> >> Both patchsets have received Reviewed-by tags, have been tested, and
> >> successfully passed builds (arm64 gcc) with each patch applied incrementally.
> >>
> >> [1] https://lore.kernel.org/linux-remoteproc/20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com/T/#ma16bb8a38300f6eb333ee04f00d57805aee3c114
> >>
> >> Thanks
> >> Peng
> >>
> >> >
> >> > drivers/remoteproc/imx_rproc.c | 128 ++++++++++++++++++-----------------------
> >> > 1 file changed, 57 insertions(+), 71 deletions(-)
> >> >---
> >> >base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> >> >change-id: 20250916-imx_rproc_c2-2b9ad7882f4d
> >> >
> >> >Best regards,
> >> >--
> >> >Peng Fan <peng.fan@nxp.com>
> >> >
> >
