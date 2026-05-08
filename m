Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D28389E1F
	for <imx@lists.linux.dev>; Fri,  8 May 2026 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231448; cv=none; b=kGAB3D2TglfCVmuoBJVytIa2jpLTWRHmi1Lm4PhFmeoFiqPd8nQASohkzjRaYliWirkd2U4lkzZusGJhDgV8nbZrw6cP0/1mXCv5qMG+qd6aeJqj3JDaoK0x/0akq7dCxpbqPN6xDjTn1ZyJzd1UpIqU/eFdla8EihipWPyL8XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231448; c=relaxed/simple;
	bh=Xc5j9CDKlFuLtIb9mG1NWd0Wa+Ic7rYDHKf0WsXQawY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1+EO5zHcw69XaIct3fjptkeFIgMexDtXtygqgF0yWAP2bxOAujU0Nioeiry4Codat99lXX+VSJjzPwFSSb3qSBFq4rnUq34ogellCkhQYjjvhi1WWnt4XlUcSMA0ehUmRo15f9+4drQRGdUwbzYYW5x3lOvMwVcpuZ9rV85kQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5752b279662so573110e0c.2
        for <imx@lists.linux.dev>; Fri, 08 May 2026 02:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778231441; x=1778836241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=freA64yN3LTk8GeI+Wxty1utrJRjkdarC4+05051tIg=;
        b=f9bhTPD9xH7CrD+q4OUzH2Nr+Jioc1Nh06aN6iBHme8JATx5v8a1nf/UKlXZDfJr3L
         napzMAQF2TtT2oOcU8OuvO+K1UPnBv5yR8Lek79mDe5qWjdsAKHjqCbQezi+xPevIJpN
         rOe6Dq5GqWGtOW3d6IOWUZffB9chtw0CzyIr6Wh8BkL0iHyRgt7jQaHZyB1cUn2O7Bhc
         W559NOsXr9VPsYyuJ7DyXESAfWuY2znJK0v4WvbfaAjbnOfWMd5ikLwCBWn4joTFFPZH
         l9pckk6dd5wfBUdENpUcXY60pkz4G/EUMwul6XCtcc8qW5MmXV+HQ2YFOkaWlhBDqw0w
         JurQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nmn5n965nXmo4qYEjLAzqBgIycSTUUWX6DTOVNUKHLM3OTY6HUs0Q8AqGUrezVMi6lxc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx6QGnSJCwsys5XsJCVN3l8XGwc7SSHHFJB+xvTyhh+jSwO6/4
	roF0dLCNl7e0Q3Ooa+DimsvCQJvhZ+E5ZCTv6BonXih7dByAVT87kELszu2TswIMVCw=
X-Gm-Gg: Acq92OHDlv0sNPML9Vy45Y6jFl7h/VmYBQyPUZ2yseZiyLg1B6yNxtHccF1ygw/KdAr
	oE1MGu3sQD2a5D1uxXMDvLd52JVs8aTTt+dazznX86ASkqykoaPZKzHpEpaRYsoh6//Cxm79sc8
	pS9Whu332+TxKe5Rcc6bGcui8cJbkmKj3OEKFSj++/b/2Q5mlwbYnOeUqjWFz10wEiGwO4QGInq
	wGXkVoVp9A6BtxIcUfmd613ZuBed8hNr08kgOI6dnXax/CSQbLZFklu62s9rG/FzHmo9XQ1ZiOd
	Ij74VoYdASooZhfd6VSB//HxLOiFU7f/0BHYHoegHeEhC/+ODQTaZ+nzA3eUxU3nbOBiwIcuyNx
	pAX4n1lIfd6+rsvkZIIeQ3a69DDxTpx8bbG5wd7VV7aiUlA0EdHtc6rK7wyVw47ZjNVIpF7bNiT
	nsIkIhJK3IBPVlz91bjXbZItwVljoIUdqKgm5Xd0CyW1ZK96kBM5g/Ui8CO34L
X-Received: by 2002:a05:6122:a07:b0:56e:f071:d4ef with SMTP id 71dfb90a1353d-575595be49amr5880938e0c.8.1778231441012;
        Fri, 08 May 2026 02:10:41 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57576d13773sm2077174e0c.16.2026.05.08.02.10.40
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:10:40 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6314a0eefb1so25682137.2
        for <imx@lists.linux.dev>; Fri, 08 May 2026 02:10:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/DP0Q5kekvlQDV+VlFVwCp+/wwcqzq9KJDOf5we6LXK+9XvBdks22+9eKUCNfUIZ+FpdY=@lists.linux.dev
X-Received: by 2002:a05:6102:854d:20b0:631:2f82:c3ce with SMTP id
 ada2fe7eead31-6312f82cdadmr1563743137.10.1778231440310; Fri, 08 May 2026
 02:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
 <20260413160331.2611829-10-antoine.bouyer@nxp.com> <CAMuHMdXrvn+kwBsc96SQxWMABZv3Y6EPc3FLU7f-pOi2+J+S1A@mail.gmail.com>
 <96bff2f9-04ef-4272-b408-fefc7d1d5e11@nxp.com>
In-Reply-To: <96bff2f9-04ef-4272-b408-fefc7d1d5e11@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 11:10:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_O-75kxbqEjLKQ1=5OZpvyCkuWo8CBzpvymzj0i2uUA@mail.gmail.com>
X-Gm-Features: AVHnY4LHFQ2cNB28JlB_QeYS4eHTz1eigCbditGi6HUZBbCkr7_rXaltq2vUwkU
Message-ID: <CAMuHMdX_O-75kxbqEjLKQ1=5OZpvyCkuWo8CBzpvymzj0i2uUA@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] media: platform: Add NXP Neoisp Image Signal Processor
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, daniel.baluta@nxp.com, 
	peng.fan@nxp.com, frank.li@nxp.com, jacopo.mondi@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, michael.riesch@collabora.com, 
	anthony.mcgivern@arm.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	ai.luthra@ideasonboard.com, paul.elder@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antoine,

On Thu, 7 May 2026 at 15:48, Antoine Bouyer <antoine.bouyer@nxp.com> wrote:
> Le 06/05/2026 =C3=A0 16:26, Geert Uytterhoeven a =C3=A9crit :
> > On Mon, 13 Apr 2026 at 18:10, Antoine Bouyer <antoine.bouyer@nxp.com> w=
rote:
> >> First NXP neoisp driver version with the following contents:
> >>
> >> This driver was initially inspired from raspberrypi pisp_be driver. It
> >> reuses same approach for ISP job scheduling.
> >>
> >> The Neoisp driver supports:
> >> * 8, 10, 12, 14 and 16-bits RAW Bayer images input.
> >> * Monochrome sensors input.
> >> * RGB/YUV, IR and Greyscale output formats.
> >>
> >> The neoisp features are:
> >> * Provides single context to limit amount of v4l2 devices.
> >> * Supports M2M operations.
> >> * Support SDR and HDR modes.
> >> * Supports generic v4l2-isp framework for extensible Parameters and
> >> Statistics buffers.
> >> * Provides a `core_media_register` API to register neoisp's media enti=
ties
> >> into another media graph.
> >> * A module parameter to run in standalone mode with its own media devi=
ce.
> >>
> >> Co-developed-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> >> Signed-off-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> >> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>

> >> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_MASK GENMASK(23, 16)
> >> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_SET(x) (((x) & GENMASK=
(7, 0)) << 16)
> >> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_GET(x) (((x) >> 16) & =
 GENMASK(7, 0))
> >
> > What about just:
> >
> >      #define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2 GENMASK(23, 16)
> >
> > and using the helpers from include/linux/bitfield.h in the driver code?
> >
> >      FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, val)
> >      FIELD_GET(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, reg)
>
> That file was auto generated, so I did not want to change it.

Oh, the pleasure of auto-generated files ;-)
Perhaps you can fix the generator?

Here you have 3 definitions per field, which is worse than the
auto-generated AMD header files, which have only two (MASK + SHIFT), and
have been dominating the changed-lines-of-code statistics recently...

> But I agree, these macro would help to save a couple of lines, and
> probably ease readability too. I need to double check the impact, making
> sure there is no regression with such update.

You can compare the generated assembler code, it should be more or
less the same before/after.

> Could that wait for a v3 ? as I was about to send a v2 with other
> changes first.

Sure, thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
