Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D783EE1E0
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948807; cv=pass; b=uOD/dhI4vraGr/URh879m2PQvkpNzMxtNXUVS3PLOG/q1ZcoY/TVxKqVgTIBoIFW9PRrZYyCO4I5VcyJFcIWOGliZd1Ps/x8P0PzImtaEtxDQcP53Dy359NXMVhSOZ2p0aiOyxhbTd0GvKjH0irCZ079ctofaICJt434ilFvEA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948807; c=relaxed/simple;
	bh=F2lKZ/qSN6SIkBL+rAQMZomA6ldD6Jeu1f52cfpnYWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqzNgN+oE88kgkL4eqti+2d7TXg/eyGk2xvUzKpF2G7zAK1QkdwZnN1ieHt7VinAQTxgjkzQpRKlvAn3I61ItwMav3DkUgDC30Ig/9vkbJdRKnOthZXfv6Cp81kGRcccUbnc+mDVOV0VLF9AwSahUYpR9MbhQXjRvTCfpQMdz6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X8tU2pT0; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X8tU2pT0"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so96215666b.1
        for <imx@lists.linux.dev>; Thu, 23 Apr 2026 05:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776948804; cv=none;
        d=google.com; s=arc-20240605;
        b=XdEPMDl42zv3+CyKnNWRDW2UX2tq1EsuoWa8Ru8TuWpl50GDaxkakszuLKSTIH61OO
         PUAIdp9QY3CPMb61L6VjgA53LQtioamr2t1snj/qiJaBHxrPGezkiCrGaDGhZirvXcvp
         emGSwzDfDCbIvkzoTsywrEGawyHIygM4Epc7yV0ciFv7PeMPPMfJIYsmI9WSZqJMsull
         BV2DmXeHKNpCiAIcutWruG0/Fq7hKmcF4XQ+fLJDgK8Q+hh5Uj1Xy++YPMz0FdG/PlNq
         WvwVUNrpjMg0HzftABvojNduwyMe+qAd70jvyRo3EvnUW5E2CV2Tmx0wodZHfizCEi0/
         T+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        fh=q3meoiGsxR1Hzg/LB83Uc8oixYDEuipBe0MSuPcAEPM=;
        b=BZDrxM6ljTdrhBu0I7kxi5j4gxLn90thoxp205QmNEy6Dkxv9+HhHJnxBK1HRbFFWi
         HJUio/aTZ5yxwL1rJnUycfmvx2wONjA+Gm+NlrtTv4ucL4hNyYWXTlliA+1eBnSPCWA6
         Nlk2fFUPLtHLSUFi7Zs6Rdd52tZwpMVAHHACXxaL7zVCS04EUj2UkkKkmlGka0XsiUUj
         G1lFKTIpXwZ0lEIw81jU8ZRmNO0jv0sNgyyQClvmxI2Zq3rC6mBYw/dDsn638D1Egd7m
         Du/nxR8qXn3VNiooSGCKsXPTzamuhIxRNLnHjfNiUNqeRKMyZuq+3RYRBHVzp+9sYe/a
         2hhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776948804; x=1777553604; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        b=X8tU2pT0RiBYulLisNdj55MfXZaVH5OYY+mAEj7w4vcGZu8z/JGxjNVcHnrxhMJo/U
         H89jU1TcnBqlt3OnRpTVaZxwFfNvsqhXheX/mj9kp8WX2gob0BFKmZ8TfhSHJIHZ7fh7
         gNt8mfbnW3zevTl12RgAh5EodOEGJHB+MdxfGZk6ErY9JDBH92wt+BOy8f6cKZIpmGyZ
         XTquerflu6zJTEy/BLV5wY7gbxxutiFrHRkXs+MXB/XmYWzeQb/vmNjIB2ymgBwvRbOb
         Atbeh5fMyyPPI/D1pmVV1u3PWzyed1sj9xHfav7BkNXrLvPwyxE0UqIh1Na4B3GxlCt0
         BRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948804; x=1777553604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        b=sznoFVjhwRn+2HAFvYFUkSWSgbIuD3Fdh7t6/6LqTGSwgsYxbuSurnStSTH10e+zYi
         rkloL08uRIVfWHBq2uJd2dw2ZHw7UJcNWB9267EAk3AI/QZAEWnyfdBhZrUOhqe6vCYP
         /lO3VZqpez+Tyq7kSWKaef396j85+9XRxodNjjTYnPhcpzekBB4wfkktLSkqwekgk1rP
         5tZ96PJULkc7YE/vkukgy/Q16C6Xlq9+tfWN28SZhsSwVW3tLdBMBYlr4NJbdMdMI3BN
         C0aIq3aPaxGUW9WQlN5T1VCZEDmwKJz+yxoTuDaM4FRCjeXg4TRZ18uRzdPjipd9datR
         fYlg==
X-Forwarded-Encrypted: i=1; AFNElJ8uJ2Nw5hUiw1PStWljnpcl7UW0aMRKNBjdGV4P/id77cuKE2FSvbTemc+c/ncydQd7304=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx89+fYho4l7fKCo/S6DdDkW36DJlZIOXJPm6ADegxajNys6DGm
	EVcMyIdiZltLGSflIWwac/Bk/071D9THgYgzqgG/T14FOzHP38Og3IQs9bKyZk+rDUP2C0erNWj
	eEQsBMBnggrTLQwqDb2eDrxXjLA3e/ftklP7JQwTKfw==
X-Gm-Gg: AeBDievsH65rBXdLFGwvn5wL9a32vt5VDF1IB3jJM5YYHpQAEMdi2OWctF8T298IDeW
	LCU8RDizhCPCo9Qvj9Ic2lUWP15ZfqGY4F3kWQWlHmbntnfUaP3tSuMVRRuN9bdCV5Ga7ORVETb
	XWoPXjRIe5zVqqBh7f2Ip43SIaxQIiLc3TxSp+W8mKoxh224X4pLBXB6rpYVq/9E0zzZlSYBsxn
	AIx0gjWJfzAGhqs0lmGDUm4rPTXvMbmgnYiaVR69HRe1/kypenIY5RWCQW/kwgt4xrlemv9f/ht
	RsjTb/ZlQlv6D2/vHZDHe+3dEosSLWO+5l5dpqa02vQkOYcHVywJ
X-Received: by 2002:a17:907:72c5:b0:ba5:bef2:2aa9 with SMTP id
 a640c23a62f3a-ba5bef2333fmr1133294666b.35.1776948803573; Thu, 23 Apr 2026
 05:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
In-Reply-To: <20260422212849.1240591-1-shenwei.wang@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 23 Apr 2026 06:53:12 -0600
X-Gm-Features: AQROBzBDIr-bn4DX0ExOJm0nVY72516bKXS1r-ubIMnAcS6p_qKbuXjU_FLZ6Pw
Message-ID: <CANLsYkypRaFTTP7MLLLR+=AB5JnRTA4i130qvWzB1qoAuM9FWQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"

Once again Andrew Lunn was left out.

On Wed, 22 Apr 2026 at 15:29, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
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
> Shenwei Wang (4):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 266 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 573 ++++++++++++++++++
>  8 files changed, 991 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>
