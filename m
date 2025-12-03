Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE1632E125
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764788984; cv=none; b=B/U7CDTayxykGDaHZbdlHU3tCBs9rC6MOuKdpvcibJ6QRMKmbD6omWgFKj0s6OciOSXXaFywxej97CdN+73B9AJFQ4k5cPp2j+OiEyabCKSDuhE6qX0hIl0RwVpVLdysbEAsDeXuW0dMvNIghiUCYEOaDQ965ezz1oYetHPMuwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764788984; c=relaxed/simple;
	bh=UQ9P4gpoDW6/g+aOONFllk+M86mat3ZiIaRaBBWZWHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENvYe93Lo4Wv9HJ1a2RQ7XJF7r8P+5E+PSH/3CxK+7FMbk/pDAs9BlCDac4J1pwYu5hVjx26k0Bc5ncNGktjzVsP/p9asQ5RSHtnQrANbwrbYghtfuGK8OXrSlQObVUSw3nzxuc3wOO9S61X0F51qAHUEhwlofzVOFHZMOono4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y8C2OABN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y8C2OABN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29d7b019e0eso1408155ad.2
        for <imx@lists.linux.dev>; Wed, 03 Dec 2025 11:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764788981; x=1765393781; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B3IRsPmCpiCqjml1bQ7Q4E8Gj2zFoNTCEFI1NKqRplI=;
        b=Y8C2OABNYXAfGWKPIeRvU2htJJih+qP0S6cgYbzcaj/KWn4mBDhtlTDlK6I14Fvqju
         TKM0v7V2DHPttqEC3S57GNyS9L/FzsW05b690XKruCcnxlPq76CaGAr29es1S+4l1OkD
         520TXbMRMXazspx3ihYmka/p90pQ2LjWAyPT641Bz5t/rt9JvLQ2K60xbXlyKyieeLju
         doik2jPyrUY+R02nxmRbKgy6PNvoet+r/uIeV7LRj+5LVdI7f+8TYOEF3oIxTh0uAF5I
         m8fdi+Pg+CvnWZCXuFYbymkIug14nQ6Q+7wyl6Lop7Q1v9Q3I4Vb/2dfo6vfNB8rImQA
         d+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764788981; x=1765393781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3IRsPmCpiCqjml1bQ7Q4E8Gj2zFoNTCEFI1NKqRplI=;
        b=JIv/2rmO8sFPSvByXtdbNGp2e/n1GdsVTDocUaqbhkDArZTakP4d3QMGbFs6VrDPl4
         qlOSkdzlbs9eE/ZuFcdMvFGq+37lOzh5TbAGBIO6pKoMJfoVHJCgKF3lV4uAyF7OXADO
         w8Q+uaw9scjIYXaO87SlWfNH0eZsbAB6vRzcgjDzNn3Ud3zSUpXnJzVegpM151auxzKx
         ZAzD5B+Ac7akb1bNnH4J+ODVh2h/2o164fqp8ZqisfJ7OgPWaktJ5dQQW0TjwyDtCIiw
         iAo7KuPpWUdhERRpGYXia9bI00fQ8cTe0chi4Wv1wUmnRYMWN1S/tadXyr53iwazzeI0
         2NTw==
X-Forwarded-Encrypted: i=1; AJvYcCUeGhc6wCxHbCYTYuzEBe//+H8YqtOj1QuC2TgLvQRs+qh5y41t7sQW9BSaH5YdI3Wj7Zg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6RFyPJ4oL4mfqAoqGGxdVSxBxL1bar3cjeAQYDejfG6ujNTRw
	8omLRZQ3pYDGxl/ohL7IZDMxD7S74sm9wEz7IrF7ivSXFoXszeS5lamk9i1Gc48zju8=
X-Gm-Gg: ASbGnct4T4UQGRCGZZUpdxi+hdQDyMUCiu8MoJW9zQkbVDuSAHNJVXosesBGOipcwV1
	ACMVf7z8BcBBMgBbMKtr/0zl6/IzffZCWyCSTdVGJNFTVkipXYjRsACWqfH/P3Amds/IWD4TfHA
	sp6uEvNIQrLkaWfhz3LQa5d29NNU7mz/WavImmNWqSNuhj3m2eZmMgnEQiO7ktsVxwcfehiDLxe
	0NlVNLyW3FIWOCHtLWUJJSnViuavctNQ6sKtvxm63wQni1Mg5zHUY1m7WpO9SRTHmDNigI7XRQg
	4nUiMkb78aS2lIASUogu6tOJgrZ0oZlrBcpCLA8V+WAi3yIJ6mx9v8kOjI4b0zEefxLenywR++2
	B04hbQvDY1ZCbpRnx9J9JBps8a4y8tRmBhXyXc5TfkPTZJPsWX0ohY8qyDjcjvmQWe0fBaYnPhY
	njbmA/RBrOtW/aWhjBxf0Yf+bC
X-Google-Smtp-Source: AGHT+IF06RISZgnSJBztNS3j4oN16EtI84xL0/NkOjF0OCvNrCJXb3n/r6sR5sNc/4qd+kbVJVFsEA==
X-Received: by 2002:a17:903:94f:b0:29d:73cc:c9f6 with SMTP id d9443c01a7336-29d73cce8bdmr29319365ad.1.1764788981186;
        Wed, 03 Dec 2025 11:09:41 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:dc26:2c67:b58f:e40a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb7f69asm190635605ad.102.2025.12.03.11.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 11:09:40 -0800 (PST)
Date: Wed, 3 Dec 2025 12:09:37 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com, Randy Dunlap <rdunlap@infradead.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <aTCK8e1SJA7Uh3wL@p14s>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-1-shenwei.wang@nxp.com>

On Tue, Nov 04, 2025 at 02:33:10PM -0600, Shenwei Wang wrote:
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
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
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> 
> Shenwei Wang (5):
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
>   docs: staging: gpio-rpmsg: gpio over rpmsg bus
>   gpio: imx-rpmsg: add imx-rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 +++++
>  Documentation/staging/gpio-rpmsg.rst          | 202 ++++++++
>  Documentation/staging/index.rst               |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-imx-rpmsg.c                 | 475 ++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                | 146 ++++++
>  include/linux/rpmsg/imx_rpmsg.h               |  48 ++
>  9 files changed, 1040 insertions(+)
>  create mode 100644 Documentation/staging/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
>  create mode 100644 include/linux/rpmsg/imx_rpmsg.h
>

After reviewing this patchset I come to the following conclusion:

(1) Other people have pointed this out multiple time and I will do the same: the
only way this work will move forward is by adopting a generic solution.  This
proposal is not (no need to try to convince me otherwise).

(2) The right way to do this would be to have a separate set of virtqueues for
each component that sits behind the remoteproc, instantiated using the content
found in the resource table.  This would follow the same approach as the
namespace, with their own VIRTIO IDS as published in [1].  That way we could
re-use a lot of the work already done for other components, such as virtio-i2c
and virtio-gpio.

(3) Some environment may be too memory constrained for option (2) above, hence
using rpmsg as a transport protocol.  But as with option (2), that way also
needs to look like virtio devices to the kernel.  It also means that protocol
to interact with components need to follow the OASIS specification.  As such
you'd have platform drivers for rpmsg-i2c and rpmsg-gpio that would register
rpmsg_drivers.

I don't mind which approach is taken as they both represent the same amount of
work.  Lastly, your next patchset should contain an implementation for GPIO or
I2C, not both.

Thanks,
Mathieu

[1]. https://elixir.bootlin.com/linux/v6.18-rc7/source/include/uapi/linux/virtio_ids.h#L38
 
> --
> 2.43.0
> 
