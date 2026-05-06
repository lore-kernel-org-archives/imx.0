Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBED480DC9
	for <imx@lists.linux.dev>; Wed,  6 May 2026 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077604; cv=none; b=iaZJdstE0CDyjiDm2p5YDXPW/z+EYD3hSOO4rAjGPJhSfzEkF/t2S3rB2hJqAmzdC60JlJET8kBGb56DHVfAGJdbXxAI4tUWtEUMwVjRzSyInv5L/FOpyZH4GerlzhXrl/kZZUVLzn/ID0Z1hvHbtRqV49AM3Edwktw+0EbeztA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077604; c=relaxed/simple;
	bh=YJHhuXmcmAbbsrOx/1EkRrG2CsYJcpBD2mAbpq2+4uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHug0A4UX2n1R1Hrcx1BJk0EEgm8Fvwad08B8DK1viuLnJs2XabPk2PYYxNLr/YwjNWYb+H82W0ctN08VgzRNTNvtgqXDJsu61WJfiRz8amt83vrxUGw6bPAQ0EIZP6EUl5vLE6AYrIDC86uZm4fqRdL8KRwnI8orYDgL7CwJN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-baa8c78ac7fso907505266b.0
        for <imx@lists.linux.dev>; Wed, 06 May 2026 07:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778077598; x=1778682398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGwBD/Xye3jm815Ej5TC/rh/kNzvD/6gf/0ous2Pk1s=;
        b=N9aXFWPOwWdk7feBjGPLbvQt+S3vb5fyUbgs7mwUGQGLgJB9AWrm+eNRo862x1r/0M
         9XajiiiVl2bKkHvriPFclUXILz3B6o6loFBkJNLh70f7QWqZHoCzdeJMfHj/NzURQtGz
         sMTjQmoZEa0pt3Oc2vtG1GgQIOhi44ieyIWIkmk8A9Zuvqz0ekvhq35C1eRXp1wXAEBd
         kNmgfQgmxizZSTB7nsSlXQM6UhTnQweu9EPm90HURVsuaIhBUrc6EU0TZzcn7VDH1bW7
         Gevmwee1P/A4oGo1dKiQK0Tlvlre9fPDXbypfVZahZWaZPAuAYeHRH5BBS7/6UTvBOZi
         GeHw==
X-Forwarded-Encrypted: i=1; AFNElJ/l1Mrtn9T1EV59RR8ANZMR6qtr+EaU48mJO5xvnaqvKI0mqG5g9B+yPMiBGtFIVmvPCjA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywelh0JkWnxCJb/wh+TW4tI5QQbYVJI6ZekCUD1VNqd++AfVINE
	2hQVeyJJoMZwuk5zxj8LhDh9UIKt4yfjeQPPeVrVQdywTO/LCegI1zE//82ek+Wf4z4=
X-Gm-Gg: AeBDieuKCPb3/tIjjTjAWWrW0Yx1r6rijopZulFg4AYIxs6gkfa4ewseuwg0P8PzijH
	aVqrhbISOl8pNooyJhbfcvqa4TjbJxKJqJim/DOZ1z85L2QQuJwMB27Qy2G89TilxjpJZ084izT
	ys84mYvbEVbTCEEdOGjJTpv+psb4HWMXXjLu7gNuQFsMz8wF0FiBn/3o8GWKmihp28i+ZJM9AkU
	uhGnaHBkMyiaEYK1d3xl6nNiB0luC3qecwubM9YLGWEQ7FuVeJszQNPfbxSDSIH4V/1iIL1h5nm
	DygYiJY5VmGSmmRAybIHbb9BkRBs8P9BlIT+bBIkGb3rQ8gnyxTjtb7DmCLU6lELtA3uGzfzOBv
	R1M8dqOXvhuStAdqPFfQ9AAhn7LQaO0eix3CWiIlNGrOzEUVMJajN9vNWltmK64kXmi2soU7P4+
	5FyiO4b3TjQM2+2S2o5LG7nuU2c2UyIx7c5bSdr/bXKEaaHbqjV9z6+i+tPh5yenwI2shHlludj
	U/H5XyL6g==
X-Received: by 2002:a17:907:9303:b0:bc3:cb5c:5516 with SMTP id a640c23a62f3a-bc56b028ed9mr184607266b.11.1778077597428;
        Wed, 06 May 2026 07:26:37 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55f010d70sm92434666b.51.2026.05.06.07.26.34
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:26:36 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so7798441a12.0
        for <imx@lists.linux.dev>; Wed, 06 May 2026 07:26:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8gwfHDGIp6FI45d8Cvc0hrwM+CB0X5Mxt25oT33KUBwMRm1FALMrvjus5qKCm3y3GjiB4=@lists.linux.dev
X-Received: by 2002:a05:6402:1f46:b0:67d:1e9b:990d with SMTP id
 4fb4d7f45d1cf-67d642bc4b7mr1875234a12.16.1778077594610; Wed, 06 May 2026
 07:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com> <20260413160331.2611829-10-antoine.bouyer@nxp.com>
In-Reply-To: <20260413160331.2611829-10-antoine.bouyer@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 16:26:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrvn+kwBsc96SQxWMABZv3Y6EPc3FLU7f-pOi2+J+S1A@mail.gmail.com>
X-Gm-Features: AVHnY4Jz5uRp9a-KMKa4ktgjK5kRGGM5ufVLGN1Ppw7eSDSfOOOzlRIBWUnB9YY
Message-ID: <CAMuHMdXrvn+kwBsc96SQxWMABZv3Y6EPc3FLU7f-pOi2+J+S1A@mail.gmail.com>
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

Hi Antoine,

On Mon, 13 Apr 2026 at 18:10, Antoine Bouyer <antoine.bouyer@nxp.com> wrote:
> First NXP neoisp driver version with the following contents:
>
> This driver was initially inspired from raspberrypi pisp_be driver. It
> reuses same approach for ISP job scheduling.
>
> The Neoisp driver supports:
> * 8, 10, 12, 14 and 16-bits RAW Bayer images input.
> * Monochrome sensors input.
> * RGB/YUV, IR and Greyscale output formats.
>
> The neoisp features are:
> * Provides single context to limit amount of v4l2 devices.
> * Supports M2M operations.
> * Support SDR and HDR modes.
> * Supports generic v4l2-isp framework for extensible Parameters and
> Statistics buffers.
> * Provides a `core_media_register` API to register neoisp's media entities
> into another media graph.
> * A module parameter to run in standalone mode with its own media device.
>
> Co-developed-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> Signed-off-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_NXP_NEOISP
> +       tristate "NXP NEOISP v4l2 hardware driver"
> +       depends on VIDEO_DEV

depends on ARCH_MXC || COMPILE_TEST

> +       select MEDIA_CONTROLLER
> +       select VIDEOBUF2_DMA_CONTIG
> +       select V4L2_ISP
> +       help
> +         Enable this to support the NXP NEO Image Signal Processing (ISP)
> +         module present in various NXP SoCs. This module offers multiple
> +         functions for processing RAW images and generating RGB or YUV images.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called neoisp.


> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_MASK GENMASK(23, 16)
> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_SET(x) (((x) & GENMASK(7, 0)) << 16)
> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_GET(x) (((x) >> 16) &  GENMASK(7, 0))

What about just:

    #define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2 GENMASK(23, 16)

and using the helpers from include/linux/bitfield.h in the driver code?

    FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, val)
    FIELD_GET(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, reg)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
