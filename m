Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B93F25F995
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753352065; cv=none; b=FXwEqZmAcXCoZAKCdFX7Clw0M1VcQqi/qoWjLxCke68pjyAIt9ctFn4dkC89LH3irrSFn3hUMzWVe+b9ACb+L63xrzFx0YF2Sph2z4NvzDkmviC4Ub8/hjAwsyiLHADYAbnHHLCObNtebWHYgsLCp/E9Pyvwd7RW82ROyKxRddo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753352065; c=relaxed/simple;
	bh=j/tNROBJ9AqaM/+F/rmOXFHzO6aVOQ/0E5dPcthSGq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXY1uwk0Bca0uYIAV1HLAkY76vmpPorJPFQAlN7pXDq1az3NVpY4JyL0V3kxdyP1LIMCYmBbPhNGE7epFsUxWjJ26Yr0hMAHFoBI0VXVcF4fQdLgLmSYvGNHj9H4PbXi8nYnI3ONykAo6y2quc+PAPc0a/y9sHKam760w17ZXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ55q9De; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ55q9De"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e2c683524fso3405775ab.0
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 03:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753352063; x=1753956863; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoxQrE9BQllINJgA23hOAwgoifAhEszw6BlmYIQoAW8=;
        b=LJ55q9De/J6iC1nSmpaKzOWHPPS8cJRuN01LfwlhhpZe2izsr6qqcjQsl49tuWgnq6
         p3iaiZw+2hGW88NPnsZcYtT9joS2edOPAMnfUyI02a/or1jMcfbMNjZfMhKp7prpRC8r
         /a5TmMTMMtCUyVilg4z3ZMcSBwG4YPDhB3kBBsPEDSvwPrEtMv59Xm7zNvvHfcpx0oCw
         QaNVdfR1dkNo76Yuuop0LhuPh5qiaJJYFIo4UUDq/jV9uD0kJH5OdDlTxCz3hdGQ7NBj
         /jzmRSKm7XYmis+jgZ+drQOSLzyYeswd94aUmUEn+tQ6iXHleZ4kDLCttaI7mxU6KqKF
         E3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753352063; x=1753956863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoxQrE9BQllINJgA23hOAwgoifAhEszw6BlmYIQoAW8=;
        b=As1f2rgYfbMCR8DnPkIREDAoJHwtuZZ4JsSOJeAGqAh9oEeHr3u/8coGXaiLa5SuaN
         I/aEE10mAOkIgTEUOHoZUVu5ZzAj+hEl+J5d/lAYJJnFL5Jj00Lazr7wfweu1fz0Ys8Y
         YCC8Kv8XZJkfJDAsDOxxBLb4QeL+yLeqeSqJgQrY/2GBzBI622qgekvJDbFtCktxHYro
         M3i49bwQVzTr7J8GaKcTwmJ4/4jhYLGSXdPyoTbhn8ieZpULokzOLTVknUy1cw+y7MnS
         F0deiJTu1Asnoby69mFgasBDQFfHGTRna0Y9hOoC5UesTXLBMzK6dwXFvYwvlql8Utlh
         YfIA==
X-Forwarded-Encrypted: i=1; AJvYcCXO/Y98lgdydBaYH5cUCMVmsWKZkAfGBP/Ikp8H6ptkycvOa6u17p90vkrvHS2Pmqm2aMo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3LxaNlEW0EKCcu0yxeIF3zz8uCh1fXFM6yQXCZ9KSSGoJE+p4
	efYm+od1tYp2jH4Y5i1Z4ufoQ5s/HnzcivxSreoEdm1+capBn6sNEZZO4V6OJm1GkQ9hbE6ldjb
	Yz3G/iiFQ/WDggUvbFYoP2FvIMJXtJb4=
X-Gm-Gg: ASbGncuA789KtEVDt6TOd75NXT3Sw0bs2s2Hpc444eFlTesKddY5TByZVp7Hrc03h9a
	hP1DQX2LARsj40NzArJXraMXyytS6lwHgJd+pEhYfOJO5ixQNymqWVA6E7NDoLcfDrSTHHeFa6J
	XES8Vzm2R/pEWjivJ5Q10//UxyWCe30QZOde09l4Z0CevucoHxX8J8n1c5zLNhNwz7r0r68gXaW
	U4ODdM=
X-Google-Smtp-Source: AGHT+IFuX+HkjjMmIqfOcPi1Vf9XVVv1BJDb7TK2k3LjKb0AvDjYDmsh1XyejNfF4igxDfky969ahsCQGQoG5Rin4/s=
X-Received: by 2002:a05:6e02:1945:b0:3e2:a40e:d29f with SMTP id
 e9e14a558f8ab-3e3418d71c5mr88504975ab.9.1753352063278; Thu, 24 Jul 2025
 03:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
 <20250724072248.1517569-3-shengjiu.wang@nxp.com> <87jz3ykpju.wl-tiwai@suse.de>
 <20250724-fair-sheep-of-success-e02586-mkl@pengutronix.de>
In-Reply-To: <20250724-fair-sheep-of-success-e02586-mkl@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 24 Jul 2025 18:14:10 +0800
X-Gm-Features: Ac12FXy8l34qKKJsPON1hex-xaVDf1J211wM6fAeHOddOjpvI8f17HQ8iYSYGc8
Message-ID: <CAA+D8AN2B_RZ9iZ3qE5zMBfs7BMAkruSRQupoXyrsr7Tt+Gfkg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ALSA: Add definitions for the bits in IEC958 subframe
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Takashi Iwai <tiwai@suse.de>, Shengjiu Wang <shengjiu.wang@nxp.com>, imx@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, 
	festevam@gmail.com, simona@ffwll.ch, robh@kernel.org, rfoss@kernel.org, 
	airlied@gmail.com, tiwai@suse.com, jernej.skrabec@gmail.com, 
	p.zabel@pengutronix.de, luca.ceresoli@bootlin.com, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se, victor.liu@nxp.com, 
	s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	linux-sound@vger.kernel.org, perex@perex.cz, 
	linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org, 
	lumag@kernel.org, dianders@chromium.org, kernel@pengutronix.de, 
	cristian.ciocaltea@collabora.com, krzk+dt@kernel.org, shawnguo@kernel.org, 
	l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 3:40=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 24.07.2025 09:37:09, Takashi Iwai wrote:
> > On Thu, 24 Jul 2025 09:22:44 +0200,
> > Shengjiu Wang wrote:
> > >
> > > The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are us=
ed
> > > in HDMI and DisplayPort to describe the audio stream, but hardware de=
vice
> > > may need to reorder the IEC958 bits for internal transmission, so nee=
d
> > > these standard bits definitions for IEC958 subframe format.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  include/sound/asoundef.h | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> > > index 09b2c3dffb30..7efd61568636 100644
> > > --- a/include/sound/asoundef.h
> > > +++ b/include/sound/asoundef.h
> > > @@ -12,6 +12,15 @@
> > >   *        Digital audio interface                                   =
   *
> > >   *                                                                  =
        *
> > >   *******************************************************************=
*********/
> > > +/* IEC958 subframe format */
> > > +#define IEC958_SUBFRAME_PREAMBLE_MASK      (0xf)
> > > +#define IEC958_SUBFRAME_AUXILIARY_MASK     (0xf<<4)
> > > +#define IEC958_SUBFRAME_SAMPLE_24_MASK     (0xffffff<<4)
> > > +#define IEC958_SUBFRAME_SAMPLE_20_MASK     (0xfffff<<8)
> > > +#define IEC958_SUBFRAME_VALIDITY   (0x1<<28)
> > > +#define IEC958_SUBFRAME_USER_DATA  (0x1<<29)
> > > +#define IEC958_SUBFRAME_CHANNEL_STATUS     (0x1<<30)
> > > +#define IEC958_SUBFRAME_PARITY             (0x1<<31)
> >
> > I'd use "U" suffix as it can reach to the MSB.
> > Also, you can put spaces around the operators to align with the
> > standard format, too.  I guess you followed to the other code there,
> > but following to the standard coding style would be better.
> >
> > With those addressed, feel free to take my ack for this patch:
>
> Or make use of the BIT() and GEN_MASK() helpers.

Is it acceptable to include the headers in this file?

Best regards
Shengjiu Wang


>
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
