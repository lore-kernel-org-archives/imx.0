Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28702505A5
	for <imx@lists.linux.dev>; Wed, 13 Aug 2025 04:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755058842; cv=none; b=h67X2IRFm9o9WWv+87AUXaFnpwazzO7Z4A1Yb3J8zhhvjLoHByVxJyrRgccBANHrnVca1UmZQc5Xh6ucKn9XzTpgMHMHnUK1M+IRKuWAUfgPcx9qLujY9bU7vBhlzWw/ESr7qeKEy9Q01O0+uCjDO8JYVHvGdRkz6ji2kO5Uhxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755058842; c=relaxed/simple;
	bh=UB6xyrpDHos3cdB+GZ21fhtRTjvKz3yyndgjuTccWOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VLvl5VEW9HQmP6+fLBjNJxzZamAlkDnj+fEzC8gusyQyIGzJdBhm6wxqZ0Ss8BQ2EAMFy9/5mYVASGzd1YHpbOqtwMI8sv/A/f+6zqqcNAIPpN/Gwrz0W8II2Hf2beaKxNUIfNsmsHl/dDE3QxyXj23B60qsw4a+n+wklsMKu4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so10037094a12.1
        for <imx@lists.linux.dev>; Tue, 12 Aug 2025 21:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755058837; x=1755663637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiFuJht5ARBGIGVBRsBNGCQ9IzHhOcOqgth3Zl6diyk=;
        b=qnTk5B1kPEZb5TAu0GuH/eEv3FLApoVhQ+Qb3QizKkOIvtXMIhHtyEuRNcQ7f0iQVy
         9Q44VGnJvfdE8UH3QSSMOquYUJJzrTpmudsbvh8FmIdM35st0K0TB72yjOz7KbWpmiyx
         9jplRPK3E4uMFfd/z3BlZ51fKwHXAnDcvtMMXCxW4kobbd7Ws6h5L5dLHIk1JP3lQhqP
         GnGSc55oDKwHcLjQleitNppReJ3O3wRlkKSE5Yr0ypiul5ulujLtTqNNiw/JbGblvVmN
         sChZu3Qdi4IymkckU3wWPqNhiZEtZhWSvznfJGNb58RgW9xKqjPDaDR64+j0pd5dCQfw
         cE+w==
X-Forwarded-Encrypted: i=1; AJvYcCVKhAexWRlp7RSh2WFWmRzrZOdRPn+ATAk14wFM+f8UBzRM6f60Ap4tpFxtAoBEMrxNABs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjMXbvriIrVyQDyoZ/3356zdJ9P41J5VMDGm09RA8THGgJ9Sef
	yKxqaoj6itySqDCkmF5G/yPxq8JSWE45vOrkuQlENqAPnjoj0km3Umx/kgn+ktrYz48=
X-Gm-Gg: ASbGnctzwit3UQERT7Uco1UhQJSBz2SzFQtdAZ64ntnTG5CcO2cFWz+HTZiGuisnYmQ
	Fhug+enwjsIVPb1snXibwRu+hgBQMRAjmUquwXgE92asAwHoLVZLN3Xy6f+oSpWsirF2qKGMX/t
	WF8mo2oTo4+Qmkqb6sIAXolMCVnDA6Khgh6PJ3IH3g4MxOYBxQv3u6av501vZKXGIkbsf5gfPvA
	VkRVpEIpMYPgQkz+SyZzrBgcb6TQXQNDBWnhAKrzlhglSzQ+yFo1g0f6mTlrA1ejEk0o1XsSOLx
	bPLjocS9F/6MCFL38xd4jS5/Wbtt8XJZSnrFSK3x8Qx0eoWOkRJf0yg1It0K+TYpuk4HUy5RTgq
	/7H3rO/1r61TK3dN7YZP9wmJ9lxHny8D0HEFlBe+W4xV3ggMgXk+ZfvSpiw==
X-Google-Smtp-Source: AGHT+IFqzRGJqYGQg4yJiM8U84wCL/duQX8XLvigOUPns72/Qf12C1K4Y5MWMFnDxbFMv7KiKWQLFA==
X-Received: by 2002:a17:907:3f0d:b0:af2:b9b5:1c06 with SMTP id a640c23a62f3a-afca4d72d91mr148752466b.14.1755058836592;
        Tue, 12 Aug 2025 21:20:36 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23fec4sm2321608066b.121.2025.08.12.21.20.35
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 21:20:36 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so10037087a12.1
        for <imx@lists.linux.dev>; Tue, 12 Aug 2025 21:20:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMwtKxwfBCkR5HuWbidmvptKZkqXr/SEKI6OE/pwXnMDtqlr9AEwL4KFJEXCcTAgf3KZA=@lists.linux.dev
X-Received: by 2002:a05:6402:2105:b0:617:9bff:be16 with SMTP id
 4fb4d7f45d1cf-6186bfd2ca8mr1202681a12.22.1755058835436; Tue, 12 Aug 2025
 21:20:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-5-will@willwhang.com>
 <CAPY8ntATfq=yqoYkpuD5Ga-7yUb8C-_k=wSZJBpz0p9PLjVk0w@mail.gmail.com>
 <CAFoNnrzHhJVbR1yQrr6o1+1JhyDB6y0NNfyJkK=by9YOJRGusQ@mail.gmail.com> <20250812112817.GM30054@pendragon.ideasonboard.com>
In-Reply-To: <20250812112817.GM30054@pendragon.ideasonboard.com>
From: Will Whang <will@willwhang.com>
Date: Tue, 12 Aug 2025 21:20:24 -0700
X-Gmail-Original-Message-ID: <CAFoNnrxonvqzszYKEh5Sh3xx1dnMrqYA==378vbFLLniSBjQ+w@mail.gmail.com>
X-Gm-Features: Ac12FXzTCOMqByKsE0wmQhJWPn6s_h89Xv-W4iONcQBHU9aJfaobHOmfpO4eiuc
Message-ID: <CAFoNnrxonvqzszYKEh5Sh3xx1dnMrqYA==378vbFLLniSBjQ+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] media: docs: Add userspace-API guide for the
 IMX585 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,
Reply inline.

Thanks,
Will Whang

On Tue, Aug 12, 2025 at 4:28=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Will,
>
> On Mon, Aug 11, 2025 at 07:31:13PM -0700, Will Whang wrote:
> > On Mon, Aug 11, 2025 at 7:24=E2=80=AFAM Dave Stevenson wrote:
> > > On Sun, 10 Aug 2025 at 23:11, Will Whang wrote:
> > > >
> > > > The new IMX585 V4L2 sub-device driver introduces several
> > > > driver-specific controls for configuring Clear-HDR blending,
> > > > gradation compression thresholds, and HCG enabling.  This patch add=
s
> > > > an rst document under Documentation/userspace-api/media/drivers/
> > > > that details each control, allowed values, and their effects.
> > > >
> > > > Signed-off-by: Will Whang <will@willwhang.com>
> > > > ---
> > > >  .../userspace-api/media/drivers/imx585.rst    | 122 ++++++++++++++=
++++
> > > >  .../userspace-api/media/drivers/index.rst     |   1 +
> > > >  MAINTAINERS                                   |   1 +
> > > >  3 files changed, 124 insertions(+)
> > > >  create mode 100644 Documentation/userspace-api/media/drivers/imx58=
5.rst
> > > >
> > > > diff --git a/Documentation/userspace-api/media/drivers/imx585.rst b=
/Documentation/userspace-api/media/drivers/imx585.rst
> > > > new file mode 100644
> > > > index 000000000..9f7c16f30
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/media/drivers/imx585.rst
> > > > @@ -0,0 +1,122 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0-only
> > > > +
> > > > +Sony IMX585 driver
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +The IMX585 image-sensor driver provides the following *driver-spec=
ific*
> > > > +V4L2 controls.  They are visible only when the IMX585 driver is lo=
aded
> > > > +and sit in the sensor-private control class.
> > > > +
> > > > +HDR data blending
> > > > +-----------------
> > > > +
> > > > +``V4L2_CID_IMX585_HDR_DATASEL_TH``  (``U16[2]``)
> > > > +    Lower/upper **thresholds** (0 =E2=80=93 4095) that decide whic=
h exposure is
> > > > +    chosen=E2=80=94or blended=E2=80=94for each pixel in Clear-HDR =
mode.
> > > > +
> > > > +``V4L2_CID_IMX585_HDR_DATASEL_BK``  (menu)
> > > > +    **Blending ratio** between the long-gain (LG) and
> > > > +    high-gain (HG) read-outs.
> > > > +
> > > > +    .. flat-table::
> > > > +       :stub-columns: 0
> > > > +       :widths: 1 5
> > > > +
> > > > +       * - ``0``
> > > > +         - HG =C2=BD, LG =C2=BD
> > > > +       * - ``1``
> > > > +         - HG =C2=BE, LG =C2=BC
> > > > +       * - ``2``     # duplicate ratio present in the datasheet
> > > > +         - HG =C2=BD, LG =C2=BD
> > > > +       * - ``3``
> > > > +         - HG =E2=85=9E, LG =E2=85=9B
> > > > +       * - ``4``
> > > > +         - HG 15=E2=81=8416, LG 1=E2=81=8416
> > > > +       * - ``5``     # second 50/50 entry as documented
> > > > +         - **2=E2=81=BF=E1=B5=88** HG =C2=BD, LG =C2=BD
> > > > +       * - ``6``
> > > > +         - HG 1=E2=81=8416, LG 15=E2=81=8416
> > > > +       * - ``7``
> > > > +         - HG =E2=85=9B, LG =E2=85=9E
> > > > +       * - ``8``
> > > > +         - HG =C2=BC, LG =C2=BE
> > > > +
> > > > +Gradation compression
> > > > +---------------------
> > > > +
> > > > +``V4L2_CID_IMX585_HDR_GRAD_TH``  (``U32[2]``)
> > > > +    17-bit **break-points** (0 =E2=80=93 0x1ffff) that shape the 1=
6-bit
> > > > +    gradation-compression curve.
> > > > +
> > > > +``V4L2_CID_IMX585_HDR_GRAD_COMP_L``  (menu)
> > > > +    See V4L2_CID_IMX585_HDR_GRAD_COMP_H
> > > > +
> > > > +``V4L2_CID_IMX585_HDR_GRAD_COMP_H``  (menu)
> > > > +    **Compression ratios** below the first break-point and between=
 the
> > > > +    two break-points, respectively.
> > > > +
> > > > +    .. flat-table::
> > > > +        :stub-columns: 0
> > > > +        :widths: 1 4
> > > > +
> > > > +        * - ``0``
> > > > +          - 1 : 1
> > > > +        * - ``1``
> > > > +          - 1 : 2
> > > > +        * - ``2``
> > > > +          - 1 : 4   *(default for COMP_L)*
> > > > +        * - ``3``
> > > > +          - 1 : 8
> > > > +        * - ``4``
> > > > +          - 1 : 16
> > > > +        * - ``5``
> > > > +          - 1 : 32
> > > > +        * - ``6``
> > > > +          - 1 : 64  *(default for COMP_H)*
> > > > +        * - ``7``
> > > > +          - 1 : 128
> > > > +        * - ``8``
> > > > +          - 1 : 256
> > > > +        * - ``9``
> > > > +          - 1 : 512
> > > > +        * - ``10``
> > > > +          - 1 : 1024
> > > > +        * - ``11``
> > > > +          - 1 : 2048
> > > > +
> > > > +Gain settings
> > > > +-------------
> > > > +
> > > > +``V4L2_CID_IMX585_HDR_GAIN``  (menu)
> > > > +    **Additional gain** (in dB) applied to the high-gain path when
> > > > +    Clear-HDR is active.
> > > > +
> > > > +    .. flat-table::
> > > > +        :stub-columns: 0
> > > > +        :widths: 1 3
> > > > +
> > > > +        * - ``0``
> > > > +          - +0 dB
> > > > +        * - ``1``
> > > > +          - +6 dB
> > > > +        * - ``2``
> > > > +          - +12 dB *(default)*
> > > > +        * - ``3``
> > > > +          - +18 dB
> > > > +        * - ``4``
> > > > +          - +24 dB
> > > > +        * - ``5``
> > > > +          - +29.1 dB
> > > > +
> > > > +``V4L2_CID_IMX585_HCG_GAIN``  (boolean)
> > >
> > > HCG stands for High Conversion Gain, so we've got Gain repeated in th=
e name.
> > >
> > > Spell it out as V4L2_CID_IMX585_HIGH_CONV_GAIN, or call it
> > > CONVERSION_GAIN and use an enum control?
> > >
> > > > +    Toggle **High-Conversion-Gain** mode.
> > > > +
> > > > +    *0 =3D LCG (default), 1 =3D HCG.*
> > >
> > > An HCG / LCG control would also be applicable for IMX290 [1], so it
> > > would be nice if this could be a generic control instead of imx585
> > > specific.
> > >
> > > I never got a good description as to the benefit HCG was meant to
> > > give. The datasheet for IMX290 says the conversion efficiency ratio
> > > between HCG and LCG is 2, but not why that is any better than adding
> > > 6dB of analog gain.
> >
> > What I've learned is that HCG is actually a 2nd stage amplifier, so
> > instead of using one for high gain, you can split it into two lower
> > gain stages that lower the noise.
>
> DCG as a term is a bit confusing. It was initially used to describe an
> inter-frame HDR technique, where two different conversion gains are
> applied to separate frames by switching on and off an extra capacitor on
> the pixel's floating diffusion node. I don't know how it evolved from
> there, but just adding a second amplifier doesn't seem to be a very
> effective way to lower noise.
>
> If anyone does some research on the topic and finds clear information,
> please share them.
>
From my understanding, DOL-HDR (Digital Overlapping), multi-frame HDR
or stagger HDR are all using different exposure times to separate
high/low brightness image frames. DCG with multiframe HDR is kinda
weird because the main reason to have DCG is that you can have two
gains with one exposure/charge so both high/low gain images are
exactly from the same sample and not time delayed. If multi-frame HDR
is acceptable then using two exposure times is way easier to implement
then DCG just for multi-frame HDR.

Now that I think about it and see the register naming, I think HCG
control is for a DCG enabled sensor to select between high/low
conversion gain channels to use for the SDR result.

> > This is also why ClearHDR and HCG have the conflict, because it is
> > basically sampling after the 1st gain stage and 2nd gain stage as
> > High/Low gain images.
> >
> > I have thought about making it more generic because IMX662 and IMX678
> > are going to be the next patch once this one passes that also has this
> > function (the two are basically stripped down versions from IMX585
> > that the driver can be adapted to easily). I intended for the upcoming
> > IMX662/IMX678 driver to use IMX585's V4L2 HCG control also.
> >
> > But given that I'm new to Linux kernel developments, or more
> > specifically, V4L2, I really don't have an idea how to do so in a way
> > the patch will be accepted.
> > Or I can make this more generic name to replace IMX585 for STARVIS2,
> > for example: V4L2_CID_STARVIS2_HIGH_CONV_GAIN
>
> We should really try to standardize V4L2 controls for HDR support in
> sensors. See https://lore.kernel.org/linux-media/20250710220544.89066-1-m=
irela.rabulea@nxp.com
> for an attempt at doing so (for some of the controls at least). Could
> you share your feedback in that mail thread ?
>

My counter argument will be that HDR controls are way too diverse
vendor to vendor and even sensor to sensor that having a sensor-series
based HDR controls would suit better.

I think it might be better to focus on how to handle multiple image
channels from one sensor because what makes this (IMX585) sensor
unique (and thus, the implementations will be somewhat unique) is the
capability to merge the image on the sensor directly and output as a
12bit compressed or 16bit linear image. Without the ability to handle
multiple MIPI virtual channels for far more common DOL-HDR or
multi-frame based HDR sensors, there isn't a lot of need to
standardize V4L2 HDR controls.

> The proposal doesn't address the sensor-side blending controls. For
> those, I recommend considering how they should be handled from
> userspace. We don't want to have per-sensor code there if we can avoid
> it, and that should drive the API design.
>

Can you recommend a way to handle the blending controls from userspace?
I will be glad to move these controls to module parameters then V4L2
controls if we don't want per-sensor code. In the worst case I'll
remove the ClearHDR functions and HCG controls for this driver so the
patches go through.

> As for what you call gradation above, that's not strictly speaking
> limited to HDR, right ? If my understanding is right, this is about
> applying a compression curve to lower the bandwidth by lowering the
> number of bits per pixel while preserving more dynamic range in the
> lower and middle parts of the pixel value range. Is that correct ? If
> so, the term "companding" is also often used for this feature. I think
> we have three needs:
>
> - Enable/disable companding (which includes configuring the bit depth of
>   the output format)
>
> - Obtaining the companding curve applied by the sensor (as the host will
>   have to apply the inverse expansion curve)
>
> - Optionally, modifying the companing curve.
>
> I'd like standard controls for those.
>

Let me describe the data flow here:

           +-----------+              +-----------+
           | High gain |              | Low  gain |
           +-----------+              +-----------+
              [12b]  |                   [12b]  |
                     v                           v
         +-----------------------------------------------+
         |              Linear merging stage          |
         |           ( DATA_SEL, DATA_BK)        |
         +-----------------------------------------------+
                                   |
                         (16bit output)
                                   |
                                   v
         +-----------------------------------------------+
         |       Gradient Compression stage      |
         |        (GRAD_TH, GRAD_COMP)      |
         +-----------------------------------------------+
                                   |
                         (12bit output)
                                   |
                                   v

So both 12 bit compressed and 16 bit linear are all based on the HDR
result and even though this is exactly the same as companding, I still
think we need sensor dependent control here.
From what I can see from the public datasheets, OX03C10 has a similar
data compression algorithm called piecewise linear (PWL), which acts
on 24bit(!) 3-frame HDR results with 32(!) curves.
On the Sony side I don't see this capability on any sensor other than IMX58=
5.

> > > Sony's website [2] states
> > > "Sony=E2=80=99s Super High Conversion Gain technology is designed to =
amplify
> > > electrical signals immediately after the conversion from photons, whe=
n
> > > the noise levels are relatively low. In this way, it reduces the
> > > overall noise after amplification. As a result, lower-noise images,
> > > compared to conventional technology, can be captured even in a
> > > low-illuminance environment. Lower noise levels in images also help t=
o
> > > enhance the accuracy in visual or AI-assisted image recognition."
> > > From that one would presume you'd always want it on (lower noise =3D
> > > good), unless needing the minimum exposure time and the image was
> > > already over-exposed.
> > > I'm guessing you have no additional information based on your descrip=
tion text.
> > >
> > >   Dave
> > >
> > > [1] Also IMX327, IMX462, and IMX662 which are in the same family,
> > > IMX678 (ratio of 2.6), and quite probably most of the Sony Starvis or
> > > Starvis 2 ranges.
> > > [2] https://www.sony-semicon.com/en/technology/security/index.html
> >
> > Yeah I think Starvis 2 series all have this capability.
> >
> > > > +
> > > > +Notes
> > > > +-----
> > > > +
> > > > +* Controls are writable while streaming; changes take effect from =
the
> > > > +  next frame.
> > > > +* HDR-specific controls are hidden when HDR is disabled.
> > > > +* Inter-control dependencies are enforced by the driver.
> > > > diff --git a/Documentation/userspace-api/media/drivers/index.rst b/=
Documentation/userspace-api/media/drivers/index.rst
> > > > index d706cb47b..87912acfb 100644
> > > > --- a/Documentation/userspace-api/media/drivers/index.rst
> > > > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > > > @@ -32,6 +32,7 @@ For more details see the file COPYING in the sour=
ce distribution of Linux.
> > > >         cx2341x-uapi
> > > >         dw100
> > > >         imx-uapi
> > > > +       imx585
> > > >         max2175
> > > >         npcm-video
> > > >         omap3isp-uapi
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 175f5236a..42e32b6ba 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -23183,6 +23183,7 @@ M:      Will Whang <will@willwhang.com>
> > > >  L:     linux-media@vger.kernel.org
> > > >  S:     Maintained
> > > >  F:     Documentation/devicetree/bindings/media/i2c/sony,imx585.yam=
l
> > > > +F:     Documentation/userspace-api/media/drivers/imx585.rst
> > > >  F:     drivers/media/i2c/imx585.c
> > > >  F:     include/uapi/linux/imx585.h
> > > >
>
> --
> Regards,
>
> Laurent Pinchart
