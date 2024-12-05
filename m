Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F3622258D
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733413044; cv=none; b=VvX0KNhkqIAYBreW6/JJWUtR1hoqj9dle/RlH23cs/VuQAGplf7mHuQawyZBpYa8IvPpplqqrDLVG1fRBy8TYtC6SCCnJ3hyV/cHGrmyFMBLCPkqvZRcuj/rytwevzsdtK+NVmYLNqOfQYSbgzgSUdjFXPZxNGlkG8nlvsUu+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733413044; c=relaxed/simple;
	bh=gEmoxYmjGVmPKVZnUdOndVWFvRpv2PDnwsBJ/5OLNnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wzbx6JmyOI5HeOfl2akClFPyQ3mefPZAFHVlySBPcbjjpNbYrzPqgs8bGmVftFWtQBO81UCdtD6dfXNQs01RMfLk7aneJ4E/Xu0BUqnOwiplgjQ+L34CXQn5phB5+BYIEqvc1Nvhw1fvWt8px0xwnSsKaJBcRmP9lm/tmgZL6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=tvkpfFw5; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="tvkpfFw5"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e398823d6aaso2397681276.0
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 07:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733413041; x=1734017841; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cvnuwz6nzd9J+v7i/2glRxiW3BDpNySZESBXX3gw+HE=;
        b=tvkpfFw5zOwWG3tAffGQ3HaJMUzIHJAZdO+8pV1kxfVSSJhAf+zs5Q2FqXtdYdTpaV
         i1kdSRnr0pqpsBYtyUijdL21Vycv0cBu/x/mg9emg8aInu4Rna1jnvQqbE16PRIP7jH+
         seKyXyYqfkDhbCADksXDu4EpVT+Uku8jp1ZlfKvlerZ9qzxqC5mJoF3x07tXlXiVp4J0
         d8T97mz+bfYSbot/v5vX+7o9HeDF4ZRqdfWK+sNXQqKGLIzxrVhGGsyHeIJszIoZf95V
         GfQVurxUGMMUl7xeAS9+1O+0LNOoapvXF4D+Kw5tnn6dS9G+8DO4pGp3FXTP16I5aDr0
         rHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733413041; x=1734017841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cvnuwz6nzd9J+v7i/2glRxiW3BDpNySZESBXX3gw+HE=;
        b=RgUw3JCkOI3H+7ioTIQvG8Lb6jUnWywp5zygTN38qwTXe9aLQBwjVcCXuPp7gFnNej
         8FLPL9G35M7v6mWyjr/wIDPElkb8fB63MD6+0+Yik/3SmHvPdOZKn2UjwYTgveDpcG+R
         wobYTGF1DrZGfPjxlmlO2jnHppL4vAuhS4P3nRONO3jpdTI3dH5nqD7AhyYzxlvysSdy
         G+6Q1I1xoEdVUCGYQ9CCJka4/7Vr17iGx+5jDXksVu2+wvCFP7gpf78v8resCzGLQT3J
         t8dufraebbWW1gBxucec8/k9tycBwUMLJvHlg9MQcWRedL0tS7wmCApCfT4mI1JJJ2/r
         vlZg==
X-Forwarded-Encrypted: i=1; AJvYcCWTgXgiygomJZw/3QE8/gAbdnuxJcYxYOuUi69Ms/neE8XWUY6/XNKeFtMk/75wwRfklFk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx40k3wRSAVpmEqUMTOQKsBtcvwowObZUbi1lEBW9dF/+PHhcL+
	lwqEBNA2QvjpWAbW/SePm/oWQWVCihkmA9CBBNfukL5+PXX9Kuy0Y131kJr81vb0Wn7VtC41Aym
	ZhvzpEOnHCUpQ47pQXZ1ZDmqkLtuVzyfUlg9KRA==
X-Gm-Gg: ASbGncvzWRjxFBH3IHv7+h67ZG1wFTrqZ6Ez+QNxxJF1+N7f5aoRHjMxKNRSJq3Lm82
	lxKrl25R6KDdFSB/nBMi6PkuRHsr0tTI=
X-Google-Smtp-Source: AGHT+IFpaAlwyFG/o3y6U8AoYyYaH4HrVsIRutKcp/sQ/k2hjoYuqd/E0RRbh99HY/5KNXQ6u6Of3iU8Fjlwm/TBpEE=
X-Received: by 2002:a05:6902:2387:b0:e38:8e02:1f15 with SMTP id
 3f1490d57ef6-e39f22ab27bmr3592909276.17.1733413041665; Thu, 05 Dec 2024
 07:37:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
 <20241120-media-imx290-imx462-v2-1-7e562cf191d8@raspberrypi.com> <4950196.GXAFRqVoOG@steina-w>
In-Reply-To: <4950196.GXAFRqVoOG@steina-w>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 5 Dec 2024 15:37:01 +0000
Message-ID: <CAPY8ntCeYOtBhEKCcygsT-aAHJ8rxo5qP0NdjE9DMJmHCxZzsA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media: i2c: imx290: Limit analogue gain according
 to module
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander

On Thu, 5 Dec 2024 at 15:22, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Dave,
>
> Am Mittwoch, 20. November 2024, 20:17:03 CET schrieb Dave Stevenson:
> > The imx327 only supports up to 29.4dB of analogue gain, vs
> > the imx290 going up to 30dB. Both are in 0.3dB steps.
>
> While I agree for 30dB on imx290, my (maybe outdated) Rev0.2 datasheet sa=
ys
> up to 27dB in 0.3dB steps.

For IMX327, I have revision E17Z06B93 2019/03/25.

The revision control section for Rev0.3 lists
Page 1: "Correction: Max analog gain 27dB - 29.4dB"
Page 74: "Correction: Max Gain 69dB -> 71.4dB"

The graph in "Gain Adjustment Function" (page 74) also shows values
above 27dB as being purely analogue gain. Certainly 0x62 is red for
analogue, which would be a gain of 29.4dB. The next dot is 0x64 (30dB)
and blue, so we have to trust the text for 0x63 being 29.4dB analogue
and 0.3dB digital gain.

So I'm happy that the limit is 29.4dB.

  Dave

> Despite that this change looks good.
>
> Best regards,
> Alexander
>
> > As we now have model specific config, fix this mismatch,
> > and delete the comment referencing it.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index ee698c99001d..da654deb444a 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -176,6 +176,7 @@ struct imx290_model_info {
> >       enum imx290_colour_variant colour_variant;
> >       const struct cci_reg_sequence *init_regs;
> >       size_t init_regs_num;
> > +     unsigned int max_analog_gain;
> >       const char *name;
> >  };
> >
> > @@ -876,14 +877,10 @@ static int imx290_ctrl_init(struct imx290 *imx290=
)
> >        * up to 72.0dB (240) add further digital gain. Limit the range t=
o
> >        * analog gain only, support for digital gain can be added separa=
tely
> >        * if needed.
> > -      *
> > -      * The IMX327 and IMX462 are largely compatible with the IMX290, =
but
> > -      * have an analog gain range of 0.0dB to 29.4dB and 42dB of digit=
al
> > -      * gain. When support for those sensors gets added to the driver,=
 the
> > -      * gain control should be adjusted accordingly.
> >        */
> >       v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > -                       V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
> > +                       V4L2_CID_ANALOGUE_GAIN, 0,
> > +                       imx290->model->max_analog_gain, 1, 0);
> >
> >       /*
> >        * Correct range will be determined through imx290_ctrl_update se=
tting
> > @@ -1441,18 +1438,21 @@ static const struct imx290_model_info imx290_mo=
dels[] =3D {
> >               .colour_variant =3D IMX290_VARIANT_COLOUR,
> >               .init_regs =3D imx290_global_init_settings_290,
> >               .init_regs_num =3D ARRAY_SIZE(imx290_global_init_settings=
_290),
> > +             .max_analog_gain =3D 100,
> >               .name =3D "imx290",
> >       },
> >       [IMX290_MODEL_IMX290LLR] =3D {
> >               .colour_variant =3D IMX290_VARIANT_MONO,
> >               .init_regs =3D imx290_global_init_settings_290,
> >               .init_regs_num =3D ARRAY_SIZE(imx290_global_init_settings=
_290),
> > +             .max_analog_gain =3D 100,
> >               .name =3D "imx290",
> >       },
> >       [IMX290_MODEL_IMX327LQR] =3D {
> >               .colour_variant =3D IMX290_VARIANT_COLOUR,
> >               .init_regs =3D imx290_global_init_settings_327,
> >               .init_regs_num =3D ARRAY_SIZE(imx290_global_init_settings=
_327),
> > +             .max_analog_gain =3D 98,
> >               .name =3D "imx327",
> >       },
> >  };
> >
> >
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
