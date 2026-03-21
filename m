Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0705F2D8DC3
	for <imx@lists.linux.dev>; Sat, 21 Mar 2026 03:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774062619; cv=none; b=ZiAoEj7zM2Kf32BsIXTdqN6aykmsYAC7uK66dxsHOmWQoqLslQKSZhv0eR4heql284iMYoOBJOEtu66QqP7j3+KmksBFkWRHNClZqRxxJZbeydCZ5ufNcRBR+BeEn+w77YKLwletUCA1poi6SIfiIcCoXjIGexvsxEBHMJDmJH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774062619; c=relaxed/simple;
	bh=KCouMn/Dg6hm0eYmov7z8hH1AZtJwHW0P50SCpJ5vto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T2bJRjXoEuksNsqrnsjh3LR+pFe7ingCoyBy+fhMhR2IXPXB1IyZESX6UEuijlHMx/ykALz6NQEPK3Xf00Gw1urUZKRDB3DTd+EL6V6QetJ5rHL10Ar/rOsD4NryXKUuMba6WyENY6OjovjPQO6lOWZ+YXKyY6+iDJqGSu3wLjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KmpdxzrH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KmpdxzrH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-662b5bf4b10so4944736a12.1
        for <imx@lists.linux.dev>; Fri, 20 Mar 2026 20:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774062616; x=1774667416; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/RSF0E6FhLD8wutFoB7bxuZrdpYQYvN1Rthj0xeHEY=;
        b=KmpdxzrHGA261m0FxJUWYHJPurr02FUZdHuIMT/AGHjvm5HfDLLw71TrmLSHPCzIpz
         u6V9HZmOiKBBk0OuEevNMG4yZkczmoJ97B3AQjOmBIJExcHfWKzFcNpxc3N7yGoInfht
         YkfEoMbuhA/Q5W0LTm9VNRCFIVaZXxm2yVUwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774062616; x=1774667416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8/RSF0E6FhLD8wutFoB7bxuZrdpYQYvN1Rthj0xeHEY=;
        b=UC5d5Qh6EChma2VeFbpJgOoeMpoP1UsyczvNYhgkdJxEnaT8a6QXK4eTHH1OW5cq7t
         uHFUMASXBbWAgFCjtiKhVriAOCWcLP65sX1oULJJAEyzRKLx1P/8MtCrgbD6VgxwpR2z
         spFQWXlWoPPyZ9ZLYJu0YI+8jiH0gwfA2BqEUuSxerdJpTYal90EepXPGDA2fmX0cECd
         1Rh1K6/q82ri/XOrSNp2dt0bB+lZNmovL1L/gSmp4+Y5nqn1Rz3dTPvErtNj6hEPm+y/
         7E9YWv8nRcKPZDu+o7UlnKJHe8JignKLwd6YXeUVl9XtKTEYHWPipsOxVXMVq+fvS4oA
         AZNw==
X-Forwarded-Encrypted: i=1; AJvYcCWr7qOApiXTkljdfZdcyTmyg+Qeo4Qy7i7Ekir9IXX+3cl7bgQgvaKKSHmV9Kz58zhC8qg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAn1YmFpCQflRr4TJufg5UY9viTS79kY8jO1zvHdDy0Sv5Rfvs
	bUrgxxte4v3wOg1SPNVHl6TAzXdXVpyOhUXcnAjuh2eDtRVyO1/WI0f8gFvMPt7JG344ZL5/Lzr
	amryFsw==
X-Gm-Gg: ATEYQzwujcWZ5YPj2LHtdg65e5tzPyfse56/rKGwOorbzGVsB0WZl8Mpawem9hNxGe9
	4sFL9J8dkaCmGb+LFaAf8wFTVfV67YcBIqmz7cuAju+Xc49WzyM0BtJNinK9LJxZpOUFfiWGgd6
	x409eQ8txSCWe7aGTdLhnrcKmkcycTL1F74KyBaauZu8WoQvHxVvFMgyBzkEPDui7hTfegbN5nu
	C9HExMOHExIbWyibNAiio4bzTAYp6uL4OpFoVkKvPHxO+rfyLUWoyR5ujbZeeCipj/vMWeP8boi
	uX9uVXLxPdm0adCmHRDNXjPdyHuMwOeqFpLAb/jGdZfYd0k+yVR4omzQxoYA8Vc3xs0ukIfWbIC
	ouPlUt/Fk+kjRdreaCSRtWfgxOhr8U9SwpOxS+lnWMMN6Eur/zZue+0D/vLwclewqSGEIl/lZnU
	7qfTbmRLlj6KJYyifdzFGYoBpNaT8mLIFpGoTlMGZSLFhTRoYXswIEsUyED+LHDw==
X-Received: by 2002:a17:906:782:b0:b95:2b77:75b6 with SMTP id a640c23a62f3a-b982f26ed28mr290416366b.19.1774062616178;
        Fri, 20 Mar 2026 20:10:16 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983387085fsm221899866b.52.2026.03.20.20.10.15
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 20:10:15 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b48ac2727so1909744f8f.3
        for <imx@lists.linux.dev>; Fri, 20 Mar 2026 20:10:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKnWWCtmDPc8h6UY8zSBv4daq81rlXX45DBv/ataBpzVa0GTOQ6wF245fsv2ZLmU0CxLI=@lists.linux.dev
X-Received: by 2002:a05:600c:8119:b0:485:345b:ccb1 with SMTP id
 5b1f17b1804b1-486ff031f5dmr63989995e9.27.1774062615176; Fri, 20 Mar 2026
 20:10:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317090112.v2.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <CACRMN=euZzwDpCQupzth-J1z9qWXPenmy_bu727+R-kt97zexw@mail.gmail.com> <CAD=FV=WEWMdh+SuSE-5P81g7NhV8KH_4u_FxcRdBFRTAaASqhQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WEWMdh+SuSE-5P81g7NhV8KH_4u_FxcRdBFRTAaASqhQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Mar 2026 20:10:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VsAi-K9WnkT996WExfividTRi-aVcyLVD4Aicif=D=dA@mail.gmail.com>
X-Gm-Features: AaiRm53JJySLwTXCCA6qh8x4Qo2JwYxEnfOViwtwDhVjyjDx4WswvOZrKm9fsCw
Message-ID: <CAD=FV=VsAi-K9WnkT996WExfividTRi-aVcyLVD4Aicif=D=dA@mail.gmail.com>
Subject: Re: [PATCH v2] device property: Make modifications of fwnode "flags"
 thread safe
To: Saravana Kannan <saravanak@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andrew Lunn <andrew@lunn.ch>, 
	Daniel Scally <djrscally@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 19, 2026 at 10:52=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Thu, Mar 19, 2026 at 10:25=E2=80=AFAM Saravana Kannan <saravanak@kerne=
l.org> wrote:
> >
> > On Tue, Mar 17, 2026 at 9:04=E2=80=AFAM Douglas Anderson <dianders@chro=
mium.org> wrote:
> > >
> > > In various places in the kernel, we modify the fwnode "flags" member
> > > by doing either:
> > >   fwnode->flags |=3D SOME_FLAG;
> > >   fwnode->flags &=3D ~SOME_FLAG;
> > >
> > > This type of modification is not thread-safe. If two threads are both
> > > mucking with the flags at the same time then one can clobber the
> > > other.
> > >
> > > While flags are often modified while under the "fwnode_link_lock",
> > > this is not universally true.
> > >
> > > Create some accessor functions for setting, clearing, and testing the
> > > FWNODE flags and move all users to these accessor functions. New
> > > accessor functions use set_bit() and clear_bit(), which are
> > > thread-safe.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: c2c724c868c4 ("driver core: Add fw_devlink_parse_fwtree()")
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Acked-by: Mark Brown <broonie@kernel.org>
> > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > While this patch is not known for sure to fix any specific issues, it
> > > seems possible that it could fix some rare problems. I'm currently
> > > trying to track down a hard-to-reproduce heisenbug and one (currently
> > > unproven) theory I had was that the fwnode flags could be getting
> > > messed up like this. Even if turns out not to fix my heisenbug,
> > > though, this seems like a worthwhile change to take.
> >
> > Reviewed-by: Saravana Kannan <saravanak@kernel.org>
>
> Thanks for the review!
>
>
> > Thanks Doug. Hope this isn't the cause of the hisenbug. If you report
> > it here, I might be able to take a look at it too (no promises).
>
> I don't _think_ it fixes my bug, but I'm still not 100% sure because
> the bug can take a day or so to reproduce and it appears to only
> reproduce on official kernels built by the builder. :( This makes it
> hard to say anything for certain and also hard for me to inject extra
> debug logic.

Just in case anyone out there was wracking their brains based on my
description of the bug...

I've made progress in getting the issue to reproduce even with debug
information added. With that, I've found that
device_links_driver_bound() is getting called where `dev->fwnode->dev`
is NULL. That prevents it from running the ever-important
__fw_devlink_pickup_dangling_consumers().

I can see that device_add() has started, but it just hasn't made it to
the `dev->fwnode->dev =3D dev;` line yet.  My printout next to that line
shows up _after_ my printout in device_links_driver_bound().

So obviously something can happen to cause the device to probe before
the call to bus_probe_device().

OK, I managed to get a stack crawl for when `dev->fwnode->dev =3D=3D
NULL`. It looks like this (FWIW, it's a 6.6 kernel but issue also
reproduces on our 6.12 kernel, and I see no reason it wouldn't
reproduce on mainline):

  Call trace:
  dump_backtrace+0xe8/0x108
  show_stack+0x18/0x28
  dump_stack_lvl+0x50/0x6c
  dump_stack+0x18/0x24
  device_links_driver_bound+0xa4/0x4b4
  driver_bound+0x48/0x1c4
  really_probe+0x244/0x374
  __driver_probe_device+0xa0/0x12c
  driver_probe_device+0x3c/0x218
  __driver_attach+0x110/0x1ec
  bus_for_each_dev+0x104/0x160
  driver_attach+0x24/0x34
  bus_add_driver+0x154/0x270
  driver_register+0x68/0x104
  __platform_driver_register+0x24/0x34
  init_module+0x20/0xfe4 [max77779_pmic_pinctrl
e09198e651272bc5df70245355346d6eb1ba3a8f]
  do_one_initcall+0xdc/0x360
  do_init_module+0x58/0x23c
  load_module+0xffc/0x1130
  __arm64_sys_finit_module+0x260/0x300
  invoke_syscall+0x58/0x114

It looks like what happens is that immediately after device_add()
calls bus_add_device() there's a possibility of another thread
inserting the module holding the device driver. That means that the
driver can start probing much earlier than we expect.

I've posted an RFC patch to fix this. If folks are interested, please revie=
w it:

https://lore.kernel.org/r/20260320200656.RFC.1.Id750b0fbcc94f23ed04b7aecabc=
ead688d0d8c17@changeid

Given the stack crawl I got, I'm fairly certain that this will fix the
problem, but I'll also let reboot tests run over the weekend to
confirm.

-Doug
