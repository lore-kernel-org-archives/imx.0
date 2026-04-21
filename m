Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1655337B01F
	for <imx@lists.linux.dev>; Tue, 21 Apr 2026 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776762851; cv=pass; b=TLJ2oukVTHbdngQl56aid9T3E/zgJhBhttgRLuNMxHRTRobxPuCzUDiGwAyci7TjvH4EiIYas7zmJuJ0JSt3X5wzA0B12sdJ+sxF9XZH/Apk1PHM9MnUyyBV9Bnq6LBhFWVJkx+L4P4KXh48eK3QXR5izlOvOmGfOywODCAvYsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776762851; c=relaxed/simple;
	bh=ZzRwQS2qgmALD6SzLJul7x1AeveQ3d2kpARqQZFKsiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkFmwCnBMWnpXUJgpmzOlumoRyvXUdJoh7VAzBfDwDdsAmQYHr49sW4ypUFH5NIl9WpWV7T6911zSlzvr8E7a1jT4X1jVCTbTcitajUFnNtx4Dvhy6BHG776eZzBqimnOlAHGimvzrFhEl1U4IuZaSefKiQ8+POiANY8SXnaOYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDt9HP8g; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDt9HP8g"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b458ca2296so27168505ad.0
        for <imx@lists.linux.dev>; Tue, 21 Apr 2026 02:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776762849; cv=none;
        d=google.com; s=arc-20240605;
        b=B2nKaPfefx8tGe5sA5ekMSru9R5TqOZhCQ/2iblqTC625pz9Nh5LYebJ3b8loah0Us
         hMc2yGAEITbDphCzICAjcclCmqOw35ku9pC+BzkxOl2ytwMBJ5mVdq1qJaTZeQCPrvAm
         LdLn6HwNa7m/3zbR2970k5UfGWQlAHoFbBsu0vOx4ewFO7JzwfYlx/y02ZLEAL/7Bpe5
         4pYan242rp7GiIIUMtTt25F3dF9K26QNd/5M/6Tq/bc5iT+HVQv/UtcWoB66Jmd4crpj
         waj/3j5t2msjEDKlzFd1dHEdZRDmirO5xh5QWfes6hmIDL4wbWv/jN9PAIiFRd+Qkiia
         5EEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wuf/J2tmMgGjZTkx9qFzoIJKXecVr6IXY6lWgVYmZ1s=;
        fh=OeQvMr+uFIL+ziFwEhJencIkTOOFmh+bBaJHF9B+meg=;
        b=V8okIiTDtyMaJxBY3qRX55E97SeUGSswkExUF84Rron+IU7ws6nm0v+pSS1xRZ/md/
         R6WBrmuK+pGHXh+DVvcMAmUhf2TcgnYjUukBHgBpjmPv/g8C3ICnoxjqIIxiwd3VWldl
         TBO0pUCeoHfw8xkSMOempXfTAISYBJk2Yj4WAX7ZXYtg62TY022JZVB+ylSWPYqB67WA
         i559ZkhqJD0TDl5eJG/kj9nwy2/trSlRWJKdGveWg7Z/Nj/6D4UgAUz21Kev1yI11X+u
         19RfxVwGDRrK6uBNvzsT6Q/xF4tDTEDTZwW5Wa6ywbk/COvU5h2hQL4EjhwaAK75WSl0
         fAiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776762849; x=1777367649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuf/J2tmMgGjZTkx9qFzoIJKXecVr6IXY6lWgVYmZ1s=;
        b=PDt9HP8gQoWD3srEuPaFsvkf90zoMSEPD0wIpgxOhGHo+t4v+9TQpjCUzbo11H13kG
         hTQsD7NJXDq+OQPtUfLEoF9EA4cXDz0UotZhAPohSCEhnakN5gy9cD6twoSIoY542yB3
         rcmTNj6i85EcDYraW8HYMJbJ0pY/hwGHbZpAAs2+R6cxxIXQnagIYBLoHDvuCr4mdLAH
         96pMeSUABfO7fhp1KHZWp1X7XmovyjhIlboznaeYFNNicTdYE0RssYdnviL3MB2zCrE4
         Mscl08Iy8uQmWRi0C/80XzVhF8cg+qDZcOF4x76yUxL9l8fB6Eh6f9tO/7f8k/TZI7eA
         Dn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776762849; x=1777367649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wuf/J2tmMgGjZTkx9qFzoIJKXecVr6IXY6lWgVYmZ1s=;
        b=C4O9zyKE/VoK2eQN6y6s5yUTdsWP7VSC8lUJQoNwhVOXbOjOtXmnxb6wHY+BdQeO0a
         EuEp4bWDA4eLq5kkda8G0DOdHUo0spyhnNqc0cea+0GcUCD+bawxvAz/RvXKbG0qQJ1W
         ty9N9sbgEAvZahiEPBkdhRRtmvuhP8xmSUbgs9UR5BwV+MLHQ17pjPngZZ42+gJsRrwt
         j/rxerDL++rWBKfQyqAaQLazpsS8zVxUKnguOQpEi4m90JtEQQwJGo1aIvDUeO8u/YPO
         32//u2vdbRgE53DNGDW+qYTPDvDzrM2CpEoWeSSIA/3HmHJVhPIOxNC0Thxh8hrLYJI2
         v+6Q==
X-Forwarded-Encrypted: i=1; AFNElJ894xrG+ptJdlSnpx5LSujT5t6KzUOGq88uihy70uxs4Zcpwx+rGxnnCpsEs0osLtJprtQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcyLPbf25MjiLhr6yEDG6xR+9BIWe310Fc/GqwZQRJzgVTTDJs
	Tp+6umWlX2McdS3qRFod0iHXrzzj8Tztqu+iJHo306FTJxEvl+3H0IUj0P8oMSo1NFm+Hf0L6qV
	kbMyCdfqpHLyuJdcjAa/OIJULUQhI90U=
X-Gm-Gg: AeBDievPTxbeuVYjK7F3btvaBxW3ylm0GX7O1j22Y977ZTIvutm1eC0y5XziNFv1C8P
	hjebOqJRD0cIz0D9MydtlBRzAT7UcZg+Yo75uraCKc3t693aBPNCXDRiBaQQQFK3+yhW8TK6GbI
	YnIyXNKNvp5qYj8JwZc3jDmt67PQF1nGPrZtd2izBD8d4SG9qzvb+8IkaRuUlFF9LPai3lHfQwm
	6lIBjDAGbhbQDWLIxztmWt+DIJ6JQPsOcHJ9w+cGwISGdB2l+yGrwSUFsloR5f50WKWxMAgEQX0
	CRTLVVJn+w9AYBxUPg==
X-Received: by 2002:a17:903:1aae:b0:2b2:45b7:306e with SMTP id
 d9443c01a7336-2b5f9e85fa7mr170155595ad.3.1776762849302; Tue, 21 Apr 2026
 02:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420100854.2095549-1-shengjiu.wang@nxp.com> <lkwfzz4lia37wv56g6ymzpossm42epz2oylhl7vgdpp7odt23h@vszl4uu2wg65>
In-Reply-To: <lkwfzz4lia37wv56g6ymzpossm42epz2oylhl7vgdpp7odt23h@vszl4uu2wg65>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Apr 2026 17:13:57 +0800
X-Gm-Features: AQROBzBWcJIwpzrKFBZScNTFM92k2xv5PUM8F5xurNN76m464r4UBrs-7HGJBag
Message-ID: <CAA+D8ANwT0GKusZtvo6h8mzVf=xXSEkHXsb6nwHGZ2YQzPm5ZQ@mail.gmail.com>
Subject: Re: [PATCH V3] dmaengine: imx-sdma: Fix SPBA bus detection on
 multi-SPBA platforms
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, Frank.Li@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	dmaengine@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 4:57=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> On 26-04-20, Shengjiu Wang wrote:
> > i.MX8M platforms have multiple SPBA buses under different AIPS buses.
> > The current code searches the entire device tree and returns the first
> > SPBA bus found, which may not be under the same AIPS bus as the SDMA
> > controller.
> >
> > This breaks SDMA P2P transfers because the SDMA script needs to know
> > if peripherals are on SPBA or AIPS to configure watermark levels
> > correctly. Using the wrong SPBA bus causes DMA timeouts and transfer
> > failures.
> >
> > Fix by searching for the SPBA bus under the SDMA's parent node (AIPS)
> > first, then falling back to a global search for backward compatibility.
> >
> > Example device tree showing the issue:
> >   aips1 {
> >     spba1 { sai@...; };      /* Correct SPBA for sdma1 */
> >     sdma1@...;
> >   };
> >   aips2 {
> >     spba2 { uart@...; };     /* Wrong SPBA - found first by old code */
> >   };
> >
> > Fixes: 8391ecf465ec ("dmaengine: imx-sdma: Add device to device support=
")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changs in v3:
> > - add fallback to a global search for backward compatibility, which is
> >   to address comments from sashiko.dev
> > - update commit subject and commit message
> > - add comments in code.
> > - add Cc stable tag
> > - Don't add Frank's RB on v2 as there are several other changes.
> >
> > changes in v2:
> > - add fixes tag
> > - use __free(device_node) for auto release.
> >
> >  drivers/dma/imx-sdma.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > index 3d527883776b..592705af2319 100644
> > --- a/drivers/dma/imx-sdma.c
> > +++ b/drivers/dma/imx-sdma.c
> > @@ -2364,7 +2364,18 @@ static int sdma_probe(struct platform_device *pd=
ev)
> >                       return dev_err_probe(&pdev->dev, ret,
> >                                            "failed to register controll=
er\n");
> >
> > -             spba_bus =3D of_find_compatible_node(NULL, NULL, "fsl,spb=
a-bus");
> > +             /*
> > +              * On i.MX8M platforms with multiple SPBA buses, we need =
to find
> > +              * the SPBA bus that's under the same AIPS bus as this SD=
MA controller.
> > +              * First check the SDMA's parent (AIPS bus) for a child S=
PBA bus.
> > +              * If not found, fall back to searching the entire device=
 tree for
> > +              * backward compatibility with older platforms.
> > +              */
> > +             struct device_node *sdma_parent_np __free(device_node) =
=3D of_get_parent(np);
> > +
> > +             spba_bus =3D of_get_compatible_child(sdma_parent_np, "fsl=
,spba-bus");
> > +             if (!spba_bus)
> > +                     spba_bus =3D of_find_compatible_node(NULL, NULL, =
"fsl,spba-bus");
>
> And yet the search is still broken for i.MX8MP case since this platform
> has two sdma engines below the bus@30df0000.

I tested on i.MX8MP. It works.  Above line is for backward compatibility

The search has no dependence on the number of sdma engines. It searches the
spba-bus, not the sdma node. it will find the aips5 first, then find
the spba-bus for
sdma2 and sdma3.

aips5: bus@30df0000 {
      spba-bus@30c00000 {
       }
       sdma2: dma-controller@30e10000 {
       }
       sdma3: dma-controller@30e00000 {
      }
}

Best regards
Shengjiu Wang

>
> Regards,
>   Marco
>
> >               ret =3D of_address_to_resource(spba_bus, 0, &spba_res);
> >               if (!ret) {
> >                       sdma->spba_start_addr =3D spba_res.start;
> > --
> > 2.34.1
> >
> >
> >
>
> --
> #gernperDu
> #CallMeByMyFirstName
>
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    =
|
>
