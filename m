Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C821AED4C
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 11:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635166; cv=none; b=JULvgzTnxNrkmFKVrFAWRA3KRX/b9t8yRRkrrKUpyTPoZ5kL1ne4frVEDQXecUZ8zxU+hFi0ZwT601ZN0bE+d43bQT2JXyZJU7MEz9c0+M6vZXeYS42ykseFs3oHrQ0OTYoOA1Ir9CVcLumz12S1EywP/aErYMzVO63L4RSoXIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635166; c=relaxed/simple;
	bh=Q6INoOsKAoKQ6mKNN8/pzE1KcZaYtIJB5EmRTEmk8yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXksOk7UR7MeD7VvHKFFAH2UA0JIGgCWRT9H2rD/6GMFWPKNy+sGAK4OVSHpqYd4jdV9IkQDHd5yBvkkocbdyEKgf+VLjSSZ2t/JKjOknKqiWGvhsCAm3/lV7V/ITUeXLHY9Y1x0JszroabwS84esfpKc3Jg31MmE5CKUilPEr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oKFZ7FUP; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oKFZ7FUP"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e1157e88bc9so734002276.1
        for <imx@lists.linux.dev>; Wed, 14 Aug 2024 04:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723635163; x=1724239963; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6INoOsKAoKQ6mKNN8/pzE1KcZaYtIJB5EmRTEmk8yE=;
        b=oKFZ7FUPfvDIgtcK1P9XwXcoRCT9v7x06XvoCwUU1wpleHRGM2X6WxXp1yPMeybUvA
         A1iU2ubn8xCqcrKQrI78iSnMwl6xd/sGwmQ9aAE+0jAxO592DcIHBgn8bTekaJSuSxgC
         vujOzLirscrW/XvIvR6IeQW86F9ot5z8oADTI5JvstMTYLY6y8RkQK8/8SZBL0Qjk5Ze
         8p16tTwG/bJOF6qUl6+CoztGBGdgwCwXaioiWJuzSZAg/RO3RmKWCNf9a/gEkQ9wHrAo
         AZZz9DjK9Zf8OZTCfcpSl6ojNMsCDynXY3GpoxhG3mrgh8sAgGqyVR17hSF82NApwclI
         c/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635163; x=1724239963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6INoOsKAoKQ6mKNN8/pzE1KcZaYtIJB5EmRTEmk8yE=;
        b=B3O7jlc9KFKLfAky9mrgt+wTTx/3mvMt+ihu/go8SwCaEi8YmMEjqZl5yu02OsIlcT
         +ou6yFlC/og/l+YQlb8OfR6nXbYhCxq8P4/3bsoUecKMMSFu6YZZ1VBwftNtoMntOGxZ
         D0r06VYT45qqNAL/seDBbKDWATuppusDy3EuBiGs1h94h+c5OJvkuK4KyGiRh8ICXqIV
         LOyBSu98emt4t96k8h7/VxVU4Wx2ALHoo/I1S/n+t9UwGPmYcazN0FhE6JClz1zuybje
         d/27+/HTaVIW/rayr6EIxNhZJcFlF83iJpTVjmRwlp1IcUyI1F0u1aYLr7WTerj49BAQ
         IMDA==
X-Forwarded-Encrypted: i=1; AJvYcCVNWfX0009G6uWMP0zNl8feYmBycge3yq/6RPR/d3iOjt28Y/D4gnhxzsJ0nmqoDMaCnKhfn7j1QeUtukIovH4aSmFW
X-Gm-Message-State: AOJu0YymhNwtRhj82zrrJ+iaD+sV2kzvjvG0Q6TaC1pR+7pwFCoEkrxd
	vMMsBJSO76c3YQglQJigB0bAG7jHWziCWrnnvv+ou1Xl9IBN5tujvXoLQ0n4zHfkCDjqf/oXUKh
	Qfnx9r+KgKVmxGijnGiPfmf/O28JO5OCxOjSfqg==
X-Google-Smtp-Source: AGHT+IEVYMlVLZl1GJHYSgxm7olBwvP5eRzOw4TjS/5Exafj4XCBFHcDqZGPBvS0sv3Vrq+Nr2AT7fwfqo9yleqL0TM=
X-Received: by 2002:a25:bcc4:0:b0:e11:5f3c:1324 with SMTP id
 3f1490d57ef6-e115f3c18c5mr963371276.57.1723635163293; Wed, 14 Aug 2024
 04:32:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808042858.2768309-1-make24@iscas.ac.cn> <20240808061245.szz5lq6hx2qwi2ja@pengutronix.de>
 <1b04b8b3-44ca-427f-a5c9-d765ec30ec33@app.fastmail.com> <CAPDyKFqd=haDWB3tATZ_E1BMpCReNh=hLa5qPGATc3h1NUx09A@mail.gmail.com>
 <20240814105847.tise4jzneszdxetb@pengutronix.de>
In-Reply-To: <20240814105847.tise4jzneszdxetb@pengutronix.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Aug 2024 13:32:07 +0200
Message-ID: <CAPDyKFpcyP5t447twkKeRkyPQ-D3ucdOPLQ_kS4X7TJv2mR=4Q@mail.gmail.com>
Subject: Re: [PATCH] soc: imx: imx8m-blk-ctrl: Fix NULL pointer dereference
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Ma Ke <make24@iscas.ac.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Peng Fan <peng.fan@nxp.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, imx@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Aug 2024 at 12:58, Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> On 24-08-13, Ulf Hansson wrote:
> > On Thu, 8 Aug 2024 at 08:53, Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Thu, Aug 8, 2024, at 08:12, Marco Felsch wrote:
> > > >
> > > > On 24-08-08, Ma Ke wrote:
> > > >> Check bc->bus_power_dev = dev_pm_domain_attach_by_name() return value using
> > > >> IS_ERR_OR_NULL() instead of plain IS_ERR(), and fail if bc->bus_power_dev
> > > >> is either error or NULL.
> > > >>
> > > >> In case a power domain attached by dev_pm_domain_attach_by_name() is not
> > > >> described in DT, dev_pm_domain_attach_by_name() returns NULL, which is
> > > >> then used, which leads to NULL pointer dereference.
> > > >
> > > > Argh.. there are other users of this API getting this wrong too. This
> > > > make me wonder why dev_pm_domain_attach_by_name() return NULL instead of
> > > > the error code returned by of_property_match_string().
> > > >
> > > > IMHO to fix once and for all users we should fix the return code of
> > > > dev_pm_domain_attach_by_name().
> > >
> > > Agreed, in general any use of IS_ERR_OR_NULL() indicates that there
> > > is a bad API that should be fixed instead, and this is probably the
> > > case for genpd_dev_pm_attach_by_id().
> > >
> > > One common use that is widely accepted is returning NULL when
> > > a subsystem is completely disabled. In this case an IS_ERR()
> > > check returns false on a NULL pointer and the returned structure
> > > should be opaque so callers are unable to dereference that
> > > NULL pointer.
> > >
> > > genpd_dev_pm_attach_by_{id,name}() is documented to also return
> > > a NULL pointer when no PM domain is needed, but they return
> > > a normal 'struct device' that can easily be used in an unsafe
> > > way after checking for IS_ERR().
> > >
> > > Fortunately it seems that there are only a few callers at the
> > > moment, so coming up with a safer interface is still possible.
> >
> > I am not sure it's worth the effort, but I may be wrong.
> >
> > It's been a bit tricky to keep the interfaces above consistent with
> > the legacy interface (dev_pm_domain_attach()). Moreover, we need a way
> > to allow a PM domain to be optional. By returning NULL (or 0), we are
> > telling the consumer that there is no PM domain described that we can
> > attach the device to.
>
> Other subsystems like GPIO, regulator have a ..._optional API for this,
> could this be an option?

If we were in a position of re-implementing the interfaces from
scratch, then probably yes. At this point, I am not so sure the curns
to have it are worth the benefit.

Keep in mind that the legacy dev_pm_domain_attach() is already
optional and it's used by common bus level code.

Kind regards
Uffe
