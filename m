Received: from mail-ed2-f26.google.com (mail-ed2-f26.google.com [74.125.228.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A3349CF20
	for <imx@lists.linux.dev>; Thu, 24 Sep 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261694; cv=pass; b=rGzeQ9hqAEIqXnhZ7N7OoGbKIF7msBFsufG03Zu2wkz+X6qoSO+GZhyhUBehoKdUv4N/Ihgs5qp7odui34O7NLW0D7XjA2uUGIB9jghotjEJFu7IKnVTJJsz9wojioh6SErnZC6RwJhClztc1jvP8TgLibpzAjbUSGbzQf0BB1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261694; c=relaxed/simple;
	bh=Dw9t/OY5XtdoJNFnVnV3phV1v1Dmx6nMPDcxT0P4VfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2zo0BtUFhUKPg+O9hAQ3jPjuY9jwIrOa7dFB910WLEq+LNG6MGt8NKL5XWmptW/ZveokWnkobKI5a4eaAt663aJLjmQcLVbZEfxegmQQjG8FDuCzMYXThMCsFi4vlfMHv2iY1Cjzm9ZrSBeQ6j8IRWwflpv69HZni5VIpboyUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HC5cOjHd; arc=pass smtp.client-ip=74.125.228.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HC5cOjHd"
Received: by mail-ed2-f26.google.com with SMTP id 4fb4d7f45d1cf-6aa13e194easo3415673a12.1
        for <imx@lists.linux.dev>; Thu, 24 Sep 2026 07:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790261680; cv=none;
        d=google.com; s=arc-20260327;
        b=kEGr+g0l42LJ5tn3RgMXq36PSLLc5VrgNILBpIAFn9rtmoNkAF5+JKn/Y9Dm3mrs2V
         vc0VNBXTDnpP9pOAPsVyeOiW/fd+wlpqWyuESVrnZ7B3bNi92weAbye6WNn+IZ5kt4qA
         Jh5tQUUAlBbgZBJ1JwLz0DpOMUQLQ9AwPFzH46e/FTLmNfwINZt7N9iKglQBQuEwTWXq
         s9pr/mEXUZVBis94TaOwD3Iq9Xb9WhePLnd76wt17fx9rna3+u8bbaxDort0DJbbsSgS
         uvkg9olrEXu2olesYJ1lJ6IM0tYIH1SMohL9vZFoosTjzLqtfjfIeFo0cUtb/4PgxQJo
         C0JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=;
        fh=KsakXJaut4Y5duoTNoXJ38nUhYs3ac3KVTLHhp18Rak=;
        b=PxIHHrFZpaTsPqLMNxaOWxt7QKbVwkNNiVkKGdYXKB8bizlPJADxlVXyAUKoEtjeYx
         bvT5+kIeuuoohzWGy1nTncUwNoOo1iEB381ix28JZorHr3GkX8CYzMbjQQRUR9tszPri
         XAG/fRJ37UqTKFNdFqAgt6XHGOMIrKgJzwZqF2Qq2GbfgRuNfVInHZ2Ey5hJws5HMAsF
         2oervKFEPwJAr7UAIptmR+epFvOxUKx1QrqQehKZgJYVZxkn35n6wfmIK2ZDIBimUgjp
         9Ik96w51kvl/YcAfVyQZD4S/kGHXeWBspkedJw4vW2OhIQ4eIMCyLH1JzTeIpRKTb757
         UIVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790261680; x=1790866480; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=;
        b=HC5cOjHdk0ODnI+GyMBP9pMenLN7uUIZdzxz3OzSEuskNg5iPJpCy1bmEpFYvETbvC
         mHfArHNpeBVLs+OGoy8irBoLEtVRYUONyzhDtMHChviqNT/YH1z9H43AqeaGMNxk6Iio
         Bm0tgBb0ZMizxj8u1ByTQckdMqqOqQJQ8szqfvvCsP3Xct+s9a0F2UyrCtDlH05HO13i
         Jmd2IDcQMr1dLSxEZvpFTtWLxk5n5+pODXptftEE6fkTP3Vy92RvbSNES22K0ASkbhTI
         WysxM7p4hrXgWZjsApwrVDTqCiCgsRFam4d0uFz6iNqkso9+NQHSy32+XmIsjeD12yyx
         zSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261680; x=1790866480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=;
        b=fHmzkEnMS1XxsM6O4L77Np44Uf5kZq8d6eKgNxAyGDZmilQuoE411IjJlyG9TtiDDt
         tXMac2QFLy3mUuWFyh0jpLKNN+iU3WS5sNHMHmotTWLYJbAR3aI0HDs+iULNufU/rsBD
         4MBmm92UncB2lY/f695uuTkmnuqWt4RPt9J44uJ9HBgsXgD1wvYY/KYH6rAJowGrSbGJ
         ZFG58yvAAUlSYBmKmz9EuTYSPW2op7MuOeAHEuWTJPcyJKoCCPOvShd+lnK6TMmCBb9Y
         ZM64KOv1x7LYWWbn9ucrsG4CpC05K6EHPi3JBOhrW6S6Ir5zDnMnRuzrrhhGaaz1X5I9
         WYmg==
X-Forwarded-Encrypted: i=1; AKwUvBy15WyPBubxa7Dibk6E0CzVhQabcV+iCVkM36f0snewUBjp/mho8ncE2qzzDvxH8pM/i28=@lists.linux.dev
X-Gm-Message-State: AFuF++nDJlS5xUvgSSpCH7wM6tTgCCWl3dLznCmzYSbQBhcMWzSOJDfV
	A1YuMiI6rHW7u3fCcE9YCnwkkBK9cN0yauapIO+Ng5XlBP9v014kPUpXCWlAx+XlB2B18qeQd1L
	HDE4vbkbA1/HNi2nHWrs7JqnkQnk/ao4AIc+1Pr0c6w==
X-Gm-Gg: AYBFou32SNG3RObbpmdYSYmdouLYCIcWgHtPggUeO23dzHDTG5328eiJ85J+Mn49e6c
	lfbkCYH72GK69RorAkRcqjptOMVA5ncmOR/MoVBZ3Yn6dR/4m6Sfn/rRosqXCcA9I+wvfdrPl5E
	+FvlgdlC29nknInYKSccYTbLHqdEcA3Nn7rKX1QuESXX0/TjeDbqQeXbn0yJ4zZ+ip/BwfslVki
	0xCoKRtG5KDUb0T4jFuXlJmadOLzrpmhNPMkmZ+xW4rvRXFWo7+bvQY50CYe7kOgbBYLMEEcQ3C
	c8BHwqJ1xXLUXYgdhzuCXVacDOo2aktCBVT9vHrMIgNaCv146m+GL7WoF/y+pKm3Nu4BscQ6Hp+
	STphUABZRcoIIiKUcuZlGLK69
X-Received: by 2002:a05:6402:5110:b0:6aa:932:7b51 with SMTP id
 4fb4d7f45d1cf-6aac90c8a6amr2540369a12.28.1790261680223; Thu, 24 Sep 2026
 07:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 24 Sep 2026 08:54:29 -0600
X-Gm-Features: AclHuK8a_-TqJQY1w6hSbt62KYLX7bNKh0_jYOMr-qlDR34nbomWXG0un97vMAU
Message-ID: <CANLsYkwCE07uV1fa_R3ztmErd7pSDh5_OG=-W8N5bsuhqnJ34w@mail.gmail.com>
Subject: Re: [PATCH v16 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Sept 2026 at 12:43, Shenwei Wang <shenwei.wang@oss.nxp.com> wrot=
e:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
> Changes in v16:
>   - Removed linux/mod_devicetable.h and an extra comma per Uwe's feedback=
.
>   - Added the "packed" attribute to struct rpmsg_gpio_response and set
>     "can_sleep =3D true", per Sashiko's review comments.
>   - Removed the channel node from the rpmsg node in dts layout.
>

I will not review any new patchset on this topic until an agreement is
reached on the DT bindings.  Rob and Krzysztof haven't replied to my
previous email, which leads me to believe they have questions or
comments from earlier versions that haven't been addressed.  I suggest
looking into that instead of spinning off new versions.


> Changes in v15:
>  - Update Kconfig description per AndrewD and Julian's feedback
>  - Enable the GPIO driver even without a DT node per AndrewD's feedback
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback
>  - Code cleanup according the new gpio-rpmsg.rst and sashiko-bot's review
>    feedback
>
> Changes in v14:
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
>  - Modify rpmsg-core to enable prefix-based matching of RPMSG device IDs.
>
> Changes in v13:
>  - drop the support for legacy NXP firmware.
>  - remove the fixed_up hooks from the rpmsg gpio driver.
>  - code cleanup.
>
> Changes in v12:
>  - Fixed the "underline" warning reported by Randy.
>
> Changes in v11:
>  - Expand RPMSG for the first time per Shuah's review comment.
>
> Changes in v10:
>  - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
>  - Add a kernel CONFIG for fixed up handlers and only enable it on
>    i.MX products.
>  - Fixed bugs reported by kernel test robot.
>
> Changes in v9:
>  - Reuse the gpio-virtio design for command and IRQ type definitions.
>  - Remove msg_id, version, and vendor fields from the generic protocol.
>  - Add fixed-up handlers to support legacy firmware.
>
> Changes in v8:
>  - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
>    by the kernel test robot.
>  - Move the .rst patch before the .yaml patch.
>  - Handle the "ngpios" DT property based on Andrew's feedback.
>
> Changes in v7:
>  - Reworked the driver to use the rpmsg_driver framework instead of
>    platform_driver, based on feedback from Bjorn and Arnaud.
>  - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
>    Rob and Arnaud.
>  - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.
>
> Changes in v6:
>  - make the driver more generic with the actions below:
>      rename the driver file to gpio-rpmsg.c
>      remove the imx related info in the function and variable names
>      rename the imx_rpmsg.h to rpdev_info.h
>      create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
>  - update the gpio-rpmsg.rst according to the feedback from Andrew and
>    move the source file to driver-api/gpio
>  - fix the bug reported by Zhongqiu Han
>  - remove the I2C related info
>
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
>
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
>
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
>
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
>
> Shenwei Wang (5):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   rpmsg: core: match rpmsg device IDs by prefix
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  46 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 242 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  23 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 585 ++++++++++++++++++
>  drivers/rpmsg/rpmsg_core.c                    |   4 +-
>  9 files changed, 973 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yam=
l
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>
