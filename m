Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5419B446846
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785517893; cv=pass; b=JuyqnnQ4K2eiI6LwUIW321ei4M83BJMNXZSunEUDhohIrJmRCal5fV48o9P3l4f4OEqx9iL+LNgz/ydFf4gszpIuBdm8+8PRhjiQlENhReryW1J4BKf5Yvt7BbtnoC5Ejue3ipMXUnSRH9LrJ/vi8gUoXGlDZa0YwgGW4LrZjBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785517893; c=relaxed/simple;
	bh=Uhh8q41hmOlByjiX1nPXF362Jh+d49ZbfzvIl+Q5Sug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRNAWbWzRMkmf4I4y7qEfjae+g0AstFnWEa6HlmLPtt+yR8XyKa1btNb2GejesWWwBXnuWcxY9XJJ4DFQ6o3Bl3yqFafsVwH4EDeo91Z38IAAI+rSnnE9IoNNsLn6Tw3dG0fA8NsLH/dT5WXTG5o9MkLUj8mWUGRe16upObwlYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OtpSMuDD; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OtpSMuDD"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a063d211ebso1806545a12.3
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 10:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785517890; cv=none;
        d=google.com; s=arc-20260327;
        b=nirmz5S6K8D5pUCOnVLqVsfM0CjCIYws9PKvKHCui9Hw19UlqiFC6OPPi4VURP6csu
         Mjm00uwYockctOs8E0WaKp4SWa+39lyTur2l9sYsoHvbTDUrfl2YrTvnF497Q07RV3tB
         DLN/7AlJvxrX9axi6Jmq/+YK6USSiOLucKeozN2SlKfrufZjzB3ccayA5tzTPajPyD69
         1+UfEvzTo7hwDgqjS5bzf9y9UmttzaZHucwmlIG24B0U8fWGqBPbbmGXcJPBwfxjzft4
         Epo29+jBSS8au+wCcJ+iHu1nbOmCMOeSCy7wRWVK2UAH1gQlQwqxtcWR8MIM1xYKQh8i
         YQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        fh=g3DYSSb6y8EzOA9iTQzgYqnUV2yG67DoVposxGaDeCE=;
        b=WqVg2B060goyKdngX8KQMPyphVMYU5TmHJZDA3PpyPE2GV6sDyJrM+x3JRn+Xoe+4P
         6WZpMN7AprdsZqu/FPYWtMSXCTq1tjWg35zuPdgW1MjBNKDsxovHOZNYqzWbKZVcxVL7
         pVDj7/ctlxXlcx8XTvplpigXrh32EHMLZubHDRt+Y3cZFZrEensi8aswtFWqRaUbC5gv
         IEzwM+bmC7XpMvw1CXYBNxAXy6bhcwvzGYtWKrrMwNrIPg/LydY79QDPq4aJnnAQ4/CN
         kCFUxfoW3J12htWMs2WA9CoP+KpknF1eSblZigTEwuPD7o14op5Q08d8V+BbnwzhRK60
         iqpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785517890; x=1786122690; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        b=OtpSMuDDjrzVWAbaAHn6Df0Lw8sJiR54gYbrm67EOccFO7sx/0T3uyROLldY9mhcTi
         Y3/1yDmbdzRqeDUrNBjQxG7sYqDiKKaLnZcP47wOzyZeJjCUDhW1H0Px4O4+KAfu+cFZ
         OYAA4HISNd2E6xh1FHoWTpBj9JIMQl1k4sK8/MkoterbTmuQekZki9lnjccD024k9qs7
         vnyJMaPdhnsTJx87y0uJZmzbw8ndOAHs9y9BV3qgKqUE9ppjfo5ZTTgO2N3p8MA4mZYx
         95YiAVAxV3I4ueZAZ7jvuIk3OcGbZEz+CYjXB+ONTP3zFRTfP3eXlfN2kzEVRLBWU22C
         FKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517890; x=1786122690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        b=aoiJfdSIhXezdDU1pJ3qtQQndD+rwbMml2YpPkTqX6+lO0i437IqXKVkuhlcgiUVzz
         k+pCe6h/Q7TJf+3PGW9Em98SqKwLJEiL6is29eJ9KxfhaoIawsgOObg/hAq3Z4Eq3H69
         hlVMYiC3MsOvyJHCwq0Xq/jRcRvoyetMcBXuv0TBuReWchUFEuegp0BeJTSU9wmu66R2
         wECVhuFC0ra+oSSpcyjeGehhXxotQoIbhJsH0n0NMIiyr66ps1+Km0q1l3rzArQh0FfU
         A629BtuP2OYF4AXVr28Egi3bHwIagUXWAGoUJZtWwYUuCXog+lM8d8Iz5E4n+jA4iGub
         FMCw==
X-Forwarded-Encrypted: i=1; AHgh+RphwaidufErVNeZbyrcgVvpaYo8Tlj0FGk8WKJgVPlpm2BzjbnLNgaz5t96hWDmCWr8YWs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzmm16UhZtPxGFOIAdDex/XDF7qmUr9e++mH54oadsXm7MJ+2iX
	7mDuB6COafR1Kau6xx10NiEivWlD0CE021axrLZW08kNAotN8NXAhCYTWXk/HwE32v3khiKizb7
	ohPXQd0EG1Ta4Sxp9IrewjwWgZASORRVvMtfnGjue9A==
X-Gm-Gg: AR+sD128y5ptmYxfE/zvje6OBOOEzObPgJw3hYgczTSLOVi/5XJQui5uOJeuzNsuufJ
	t4qDns+MIXD2YzJFFiyCeVgTWjqeaw9+tzQp58TZsgjkjsHPnws+dGjpgU9rN/lVeNNinczoPX5
	PLSsdbgGcTidgv+9pWi07Bdx+zchl7nb+4AaVlXyU6fgyi4fhWcvnEsgo1/CCIH53HEGEmb2vbi
	j3fLLRp1UEXQusR918QDkkft3W6m3Yhc1IDawKoNbaIXRWVHU2lXBFWJ4UP3P5BYg2tP6OKoCqE
	gftxMzbPDRy+voULLirjyfXlj3tpas2OiZoqpvihgipyQ+TTu3a7areCIeq9HOvf/iYbtHt7TiX
	U8ta/NMfnfxNlNQ==
X-Received: by 2002:a05:6402:449a:b0:697:de29:c802 with SMTP id
 4fb4d7f45d1cf-6a0a7ccb364mr275774a12.18.1785517889487; Fri, 31 Jul 2026
 10:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2026 11:11:17 -0600
X-Gm-Features: AUfX_mwyptmYyOf4p0ZyWTJXkdByXi3n4edVXueGHxTjG-w_nq_PAPMefUUmQKw
Message-ID: <CANLsYkyJ=qOz_7x8igcwkiHsJQWP8JizB4-q5QV5gv-s+e6eVA@mail.gmail.com>
Subject: Re: [PATCH v15 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
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

I won't be able to review this patchset until the week starting August 17th=
.

On Tue, 21 Jul 2026 at 14:48, Shenwei Wang <shenwei.wang@oss.nxp.com> wrote=
:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
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
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 242 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 587 ++++++++++++++++++
>  drivers/rpmsg/rpmsg_core.c                    |   4 +-
>  9 files changed, 984 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yam=
l
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>
