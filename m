Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402F334D3BA
	for <imx@lists.linux.dev>; Wed,  5 Nov 2025 07:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762327845; cv=none; b=KteZT6xIUqzzeqSNC8fiFFv7RvwKmCriexb18IPlDik2LUdFbwkHWMF8vxI6rs4224bVKKGbbHEb1jSWFMTyYITkC4CYw05W4aQf/4EsNprdwVurfR+rbXfoJNdztYmzCM009yR9jXa6bhkyKUQVYYdkW4OggTacRn9nztSgpSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762327845; c=relaxed/simple;
	bh=E1dOHEET+fuMIcpW2X+DT//mWVo0l6r5A9sIRy7IIxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7Xr44d5Lp9H/LqP+RD01dfn43GQ5PPzALN/rMNtawksCQIRwLSRPJNawUUfgE1cI/i/Um9kstDapjcaEnMQoyXN0ZYytuo35OEW0Y8olj/fFyNfDJs3SPf3q/KAZ1vwDA6ERCsEKXDLUK1pa+l4ioFZDXyhlDe3h+6rF9PQA1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cIkSJkVE; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cIkSJkVE"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b70fb7b54cdso333454366b.1
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 23:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762327841; x=1762932641; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ux6+i1bmVIFWhQiGDp7l9kTwV5Ptw+dOTwT3koSlg34=;
        b=cIkSJkVEOJOxyJYoO7GiujIakFoEAR31sDQ5JPOJxR7c7EGAhTmZB0JrbLjzBtxUHU
         DjgIRgf/CxUUyHVkse2u82bxNIrU0kAkVvRuXqT15MPB1me111j/icfA0wLDMo/eC0Ha
         L4odWF2TKcR2/zuzYJVsJzcYUV6sNjJilFqLrxDqc4KeTim/pMQzG7QwRvwWUWRGk46V
         qqEyFLgQDObnnwpXThYjjESoH31/86JogJJkFQMgIPeGJnEBGGAZhaaWyLZR3JA6fWFK
         Q7G9dMlj3je03tazux+v02DI9o/tos8uiSPvx3wXShCCgEO092R4lln7SK430ezgerRd
         q6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327841; x=1762932641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ux6+i1bmVIFWhQiGDp7l9kTwV5Ptw+dOTwT3koSlg34=;
        b=N/TwSkqDCVcdaiOGpdw/5aE1zbsxVbJ8b6eWyTgZJzJgZW+SBbP9Y13yL76Swd/e11
         6EWyOLPy8+WMm7x4hernHF6Jw33WzFCZ11zAo5iQVPZxO05o+oR931uApFbd6/+D+G07
         MjWC15etheyMCr0D/X158gFgz0P71brFhRd5XlfI+SI/BvDdXA9spQ+YA0PkS/eT43JV
         IzsAe0EkdIO8Mjwoy3q3I8wXbHuYV+0OpLdpNXHhEcVpDmdPDKl5YZkvIDmieg+sXhy9
         goSsRE3cgOfji3c+kqsaCg3vqCXupHDvFswoFVsUuV0rCJ0AbDUFYoMUZjdT0mwg9vQT
         VLrg==
X-Forwarded-Encrypted: i=1; AJvYcCUvS4oQQ2mOhcDxk87j/QW8vCTuM4WC7X0iUb8ibJcj9201iW8F/HCbx/bjAkkY8+tgNmM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4Wd9KeydHNLROR5nyn8JgSiurpa6ncvpM7sTuPa8EjqOQZeYd
	dQR4QVkAWq/Dw7IwyKNBeka+JElVdgeO2t09K0MYuITQKbdmpdCqBPB316J2ky82t/4=
X-Gm-Gg: ASbGnctJ9yi2Yk2ixx76uGuY2PuKZk2e+gQW8fW84Bun5UrEyl1D1sUwlHT3jtohxmx
	YSbVmYgrPCw9yJjEM4RYXfLXebkxsadg1lP1nc5tNHobNbtRtl/nQtRQ41gOeJCB5dVjRM+CPBQ
	5MOM3hlxaLYl0eYmkDVqiu716uZb1ryqqHMn/DmoQ4tsg9LhqTtVGS83WJ4qZ7HbihFaG6dF18r
	4+b8EsFN5gaghXsCAS+YswnFzB+SOQT54/TOYbeqR9rGmq7MCA6490wyW1Fxpcmk1c5/d5onSMs
	LbtWeiUQnLKjHgM6aRNRhT5qCCHdR5npQwV8u3DXakqI8Qqf2LoyzGUocJUlNHEw74OvuwkGPin
	/zMVavMCtTuNX657+eUz5IMgrwnoVy15VrCjSGsgJ0GgM5p7GIp8HXeATxU34em87STmOlC9dOl
	PoUKkyO74h3VO3SA==
X-Google-Smtp-Source: AGHT+IF4Z39tdBwbbzTMRpDJUt9P/ptkzqi1eF1iOdtCWCbeCbOmCHd88OE2YgBLVLBryIJTdoazkw==
X-Received: by 2002:a17:907:2d0e:b0:b6d:7742:c20c with SMTP id a640c23a62f3a-b72654e1f17mr170440066b.36.1762327841465;
        Tue, 04 Nov 2025 23:30:41 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b724034ade7sm414148866b.69.2025.11.04.23.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:30:41 -0800 (PST)
Date: Wed, 5 Nov 2025 08:30:38 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sherry Sun <sherry.sun@nxp.com>, "esben@geanix.com" <esben@geanix.com>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"ryotkkr98@gmail.com" <ryotkkr98@gmail.com>,
	"kkartik@nvidia.com" <kkartik@nvidia.com>,
	"fj6611ie@aa.jp.fujitsu.com" <fj6611ie@aa.jp.fujitsu.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [BUG] Suspend failure with nbcon + pm_debug_messages (Linux
 6.18-rc4)
Message-ID: <aQr9Hgx-AAP9i1Td@pathway.suse.cz>
References: <DB9PR04MB8429E7DDF2D93C2695DE401D92C4A@DB9PR04MB8429.eurprd04.prod.outlook.com>
 <87tszamcaz.fsf@jogness.linutronix.de>
 <DB9PR04MB842977523C92FDE8AF4B714A92C4A@DB9PR04MB8429.eurprd04.prod.outlook.com>
 <87qzuem7bo.fsf@jogness.linutronix.de>
 <DB9PR04MB8429F50811DDC648DD8A7B8792C4A@DB9PR04MB8429.eurprd04.prod.outlook.com>
 <87bjlhz8pw.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjlhz8pw.fsf@jogness.linutronix.de>

On Wed 2025-11-05 00:25:55, John Ogness wrote:
> Hi Sherry,
> 
> On 2025-11-04, Sherry Sun <sherry.sun@nxp.com> wrote:
> >> Thanks for confirming the fix. I will make an official post on LKML
> >> with the patch today. Since the i.MX nbcon-driver is already
> >> mainline, I will CC stable. I will CC you as well.
> >
> > I'll keep an eye on any fixes you send later and verify them if
> > necessary. Hope this fix can be applied to the mainline and the stable
> > tree ASAP.
> 
> Even with this patch [1] I am able to reproduce the problem on one of my
> test boards. I am using the following extra boot arguments:
> 
> no_console_suspend loglevel=8 initcall_debug
> 
> And then:
> 
> # echo 1 > /sys/power/pm_debug_messages
> # echo mem > /sys/power/state
> 
> This generates a lot of output and leads to the same suspend
> failure. This may be due to the out-of-tree nbcon-8250 driver I am
> using, which introduces extra irq_work usage within the driver.

Great catch!

> Could you please try the above boot arguments with your i.MX board?
>
> I am wondering if blocking the queueing of irq_work during suspend
> should be generally implemented rather than just printk avoiding it. It
> also seems to only be a problem for ARM32 so perhaps it needs to be
> addressed at the architecture level.

IMHO, we could not _quietly_ block irq_work during the suspend a
generic way. We would need to warn about it so that the callers are
aware of it. Then the callers would need to explicitly block it
to avoid the warning.

I want to say that explicitly blocking the irq_work in printk() looks
like the right way to go. I think that it would be needed anyway.

Best Regards,
Petr
