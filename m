Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E222202C3E
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 14:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921849; cv=none; b=GEvuCvb5oxAjr4tuxIbJaF4n0PnOQc0EqZ8M3uY1N+wzEbKkVEw070QOLsbMtaS6km6fdlV5StiHe7TusQzCOo9RiMPQ4Rj33GHYEskRxffK7XfFBGaT4yZEHawp2xqDMpoXhYVz3VdErkELg+oEiBZiG1o3hOnND7FYoZRbfb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921849; c=relaxed/simple;
	bh=cq3eN/N8maQVg/jZ8Uvaj4tz4pvvqrdpCcOjFhtVw4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5V4pHHSn2INm4jIhWCym0p7bWUCxuS8RHtYbWDiZipZJWv61lvRr1D0erYL9e5Et1s1I0ogVFp+0bbSVmOPHoXu5T6s9BJjJlxQ91KaBV9EYKFYhVs06WHTaosNeCvm70c/eSh60GwdVivLFMoYAwOoNExeDvxOq3o+IagmtCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=sYh9pytX; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="sYh9pytX"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71bce78e14fso45528747b3.1
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 07:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1754921845; x=1755526645; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puwxtPHVig0pLcGPa5PtlxSBrKX59zqgWPMSUINI7LM=;
        b=sYh9pytXVs1RflcpfoZkOITnS+Nx6s7cybnHYqq7i7qaPksu8cDD/LdmHuI12pbKjS
         i/tDxEpCrt/Ryaa5BX84/vHj/5YwSwQOBnpSK82o1oL+paAkTTERH6lEnbQMRH6pJtzi
         SDsGiyeJl6nL8wDBIDsuTHi6zRJdQbxDXHgOXNjxRDg1hLeArgpKYMxl9Xd80ohgt1dY
         RpqX4NdcBg8+PfRkWAorFxlF3Vrt2uCl72hWCKY2WhHsUQUH8YgOYZ6ekTVyRawqRHde
         tsx2TL9WhJDim/LPpsnaX7RY0Bi9KymFI4R9Yb65/UeFOviNle/uYMbVAHVpSYHQV1OT
         6Crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921845; x=1755526645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puwxtPHVig0pLcGPa5PtlxSBrKX59zqgWPMSUINI7LM=;
        b=gdOHTjhND4mntNfDeC9mfqspNuv1xA/Ett47wLmOrulKQZ8voZegUn3Rl68CEFdSo/
         NIwVVIYvDaxVqQvYaBQHMdhzbJ2CK4rhCvtwQDWelRhICeWMJ562WouQxKZc7Jiic4vF
         ZsGwAvTK5DCWy9k57Ya7Pg7dEg+mb+QLm5of0pbp5DQ2tIBqmkGRtnwlQkL/RfMYdaFO
         lpIrnwrPmIHoxi3VAHudaewJNe52fPrD9H9O7n7xOqK69Ao0CZLI/FuysUyvjgwDLxA3
         Sd1Nuy6qRjF1YwaOcH6kFDHVaPXaieI+cw6f60RHexShayVv3Psh1APm1GgqG0f9LuRQ
         OsUg==
X-Forwarded-Encrypted: i=1; AJvYcCVjTt9/hmyAY2897HNPd9XdXkNmUfd8phVZ1FU8PzKnkMuBZKe1votEhiDjjovSAJF+bIg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8npncewk6NSVJoO4FaAQz7HTOrL0sUo5+BY9K4G8Z537/l7ms
	UrHaEY7bKkQC1SS9YGg7Bsjx0TWIcFMyEjth+LhTi1wW8mDIWJ17pqqA618c5EKNQFAqjWO7rpq
	vM7Bg0bfDk1AO6GLpy/86/LY9TVry+k/Ijmv9VV5vvA==
X-Gm-Gg: ASbGncsYybRvVmEOT5iS4J2QDluUwpO4MFyU00Mdcxh93pZvBZVorEWP0NkX2yUJXCP
	OoNkUCLA3wNMuv638tDIBT4cnwXYW2u6zwL/qL6mnUbwCwT1PT5SCi3tEnWk2VYrahVBpCAWQaA
	rz2X2qMbC4xaSjw/5ktWdULDzhIlB2EdRM9FRJvjmNKbhOS8+pKAwc8o2wl1gFdKX/00Dq/EwBa
	A2N8Q05AN6yAzLn2A+OM09llCCoccc8ClrEyDwiWN/1l3ac3g==
X-Google-Smtp-Source: AGHT+IFVaCpRCBxFG1bqxCNzdUSGe+eBkPCYYYPh+0MTbmkvki7WMFlCxRN6Cm4uIxlvBCrJrXYceQw4QvoWX2/rRPw=
X-Received: by 2002:a05:690c:4512:b0:71a:2093:3558 with SMTP id
 00721157ae682-71bf0d40397mr149493517b3.10.1754921845142; Mon, 11 Aug 2025
 07:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-5-will@willwhang.com>
In-Reply-To: <20250810220921.14307-5-will@willwhang.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 11 Aug 2025 15:17:08 +0100
X-Gm-Features: Ac12FXyDoyByiEv3fe1CZgzKXSdSvgFu4Jp68WuY3Fc0Vbm1z6eeV1MD3juzIy8
Message-ID: <CAPY8ntATfq=yqoYkpuD5Ga-7yUb8C-_k=wSZJBpz0p9PLjVk0w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] media: docs: Add userspace-API guide for the
 IMX585 driver
To: Will Whang <will@willwhang.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Will

Thanks for the patches.

On Sun, 10 Aug 2025 at 23:11, Will Whang <will@willwhang.com> wrote:
>
> The new IMX585 V4L2 sub-device driver introduces several
> driver-specific controls for configuring Clear-HDR blending,
> gradation compression thresholds, and HCG enabling.  This patch adds
> an rst document under Documentation/userspace-api/media/drivers/
> that details each control, allowed values, and their effects.
>
> Signed-off-by: Will Whang <will@willwhang.com>
> ---
>  .../userspace-api/media/drivers/imx585.rst    | 122 ++++++++++++++++++
>  .../userspace-api/media/drivers/index.rst     |   1 +
>  MAINTAINERS                                   |   1 +
>  3 files changed, 124 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/drivers/imx585.rst
>
> diff --git a/Documentation/userspace-api/media/drivers/imx585.rst b/Docum=
entation/userspace-api/media/drivers/imx585.rst
> new file mode 100644
> index 000000000..9f7c16f30
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/imx585.rst
> @@ -0,0 +1,122 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Sony IMX585 driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The IMX585 image-sensor driver provides the following *driver-specific*
> +V4L2 controls.  They are visible only when the IMX585 driver is loaded
> +and sit in the sensor-private control class.
> +
> +HDR data blending
> +-----------------
> +
> +``V4L2_CID_IMX585_HDR_DATASEL_TH``  (``U16[2]``)
> +    Lower/upper **thresholds** (0 =E2=80=93 4095) that decide which expo=
sure is
> +    chosen=E2=80=94or blended=E2=80=94for each pixel in Clear-HDR mode.
> +
> +``V4L2_CID_IMX585_HDR_DATASEL_BK``  (menu)
> +    **Blending ratio** between the long-gain (LG) and
> +    high-gain (HG) read-outs.
> +
> +    .. flat-table::
> +       :stub-columns: 0
> +       :widths: 1 5
> +
> +       * - ``0``
> +         - HG =C2=BD, LG =C2=BD
> +       * - ``1``
> +         - HG =C2=BE, LG =C2=BC
> +       * - ``2``     # duplicate ratio present in the datasheet
> +         - HG =C2=BD, LG =C2=BD
> +       * - ``3``
> +         - HG =E2=85=9E, LG =E2=85=9B
> +       * - ``4``
> +         - HG 15=E2=81=8416, LG 1=E2=81=8416
> +       * - ``5``     # second 50/50 entry as documented
> +         - **2=E2=81=BF=E1=B5=88** HG =C2=BD, LG =C2=BD
> +       * - ``6``
> +         - HG 1=E2=81=8416, LG 15=E2=81=8416
> +       * - ``7``
> +         - HG =E2=85=9B, LG =E2=85=9E
> +       * - ``8``
> +         - HG =C2=BC, LG =C2=BE
> +
> +Gradation compression
> +---------------------
> +
> +``V4L2_CID_IMX585_HDR_GRAD_TH``  (``U32[2]``)
> +    17-bit **break-points** (0 =E2=80=93 0x1ffff) that shape the 16-bit
> +    gradation-compression curve.
> +
> +``V4L2_CID_IMX585_HDR_GRAD_COMP_L``  (menu)
> +    See V4L2_CID_IMX585_HDR_GRAD_COMP_H
> +
> +``V4L2_CID_IMX585_HDR_GRAD_COMP_H``  (menu)
> +    **Compression ratios** below the first break-point and between the
> +    two break-points, respectively.
> +
> +    .. flat-table::
> +        :stub-columns: 0
> +        :widths: 1 4
> +
> +        * - ``0``
> +          - 1 : 1
> +        * - ``1``
> +          - 1 : 2
> +        * - ``2``
> +          - 1 : 4   *(default for COMP_L)*
> +        * - ``3``
> +          - 1 : 8
> +        * - ``4``
> +          - 1 : 16
> +        * - ``5``
> +          - 1 : 32
> +        * - ``6``
> +          - 1 : 64  *(default for COMP_H)*
> +        * - ``7``
> +          - 1 : 128
> +        * - ``8``
> +          - 1 : 256
> +        * - ``9``
> +          - 1 : 512
> +        * - ``10``
> +          - 1 : 1024
> +        * - ``11``
> +          - 1 : 2048
> +
> +Gain settings
> +-------------
> +
> +``V4L2_CID_IMX585_HDR_GAIN``  (menu)
> +    **Additional gain** (in dB) applied to the high-gain path when
> +    Clear-HDR is active.
> +
> +    .. flat-table::
> +        :stub-columns: 0
> +        :widths: 1 3
> +
> +        * - ``0``
> +          - +0 dB
> +        * - ``1``
> +          - +6 dB
> +        * - ``2``
> +          - +12 dB *(default)*
> +        * - ``3``
> +          - +18 dB
> +        * - ``4``
> +          - +24 dB
> +        * - ``5``
> +          - +29.1 dB
> +
> +``V4L2_CID_IMX585_HCG_GAIN``  (boolean)

HCG stands for High Conversion Gain, so we've got Gain repeated in the name=
.

Spell it out as V4L2_CID_IMX585_HIGH_CONV_GAIN, or call it
CONVERSION_GAIN and use an enum control?

> +    Toggle **High-Conversion-Gain** mode.
> +
> +    *0 =3D LCG (default), 1 =3D HCG.*

An HCG / LCG control would also be applicable for IMX290 [1], so it
would be nice if this could be a generic control instead of imx585
specific.

I never got a good description as to the benefit HCG was meant to
give. The datasheet for IMX290 says the conversion efficiency ratio
between HCG and LCG is 2, but not why that is any better than adding
6dB of analog gain.

Sony's website [2] states
"Sony=E2=80=99s Super High Conversion Gain technology is designed to amplif=
y
electrical signals immediately after the conversion from photons, when
the noise levels are relatively low. In this way, it reduces the
overall noise after amplification. As a result, lower-noise images,
compared to conventional technology, can be captured even in a
low-illuminance environment. Lower noise levels in images also help to
enhance the accuracy in visual or AI-assisted image recognition."
From that one would presume you'd always want it on (lower noise =3D
good), unless needing the minimum exposure time and the image was
already over-exposed.
I'm guessing you have no additional information based on your description t=
ext.

  Dave

[1] Also IMX327, IMX462, and IMX662 which are in the same family,
IMX678 (ratio of 2.6), and quite probably most of the Sony Starvis or
Starvis 2 ranges.
[2] https://www.sony-semicon.com/en/technology/security/index.html

> +
> +Notes
> +-----
> +
> +* Controls are writable while streaming; changes take effect from the
> +  next frame.
> +* HDR-specific controls are hidden when HDR is disabled.
> +* Inter-control dependencies are enforced by the driver.
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Docume=
ntation/userspace-api/media/drivers/index.rst
> index d706cb47b..87912acfb 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -32,6 +32,7 @@ For more details see the file COPYING in the source dis=
tribution of Linux.
>         cx2341x-uapi
>         dw100
>         imx-uapi
> +       imx585
>         max2175
>         npcm-video
>         omap3isp-uapi
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 175f5236a..42e32b6ba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23183,6 +23183,7 @@ M:      Will Whang <will@willwhang.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
> +F:     Documentation/userspace-api/media/drivers/imx585.rst
>  F:     drivers/media/i2c/imx585.c
>  F:     include/uapi/linux/imx585.h
>
> --
> 2.39.5
>
>
