Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518BB29BDB0
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 20:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755722966; cv=none; b=KdaVSLgkKn0TneVszs6HSR0EKaUzZYWyNicZlIXemg/hEXipQR/si5eSt53PtBiVDDPdZb6Vq7Z+F678WSrmjw/MoqUvTWjHvyC+VHRx+fsKgCn7eNtQTAe1JT1XaFvNddPnly7kFXmuweID9u0bso71n01CgNr8nBqa+P6IDrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755722966; c=relaxed/simple;
	bh=2VLSz3wHxmzDBw+7dDQ0rcBNHyEKToxUIFKa/DJSnxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3hPQRHndA7wU76wcEF9TRvCcv8ysMoj0YtucGB1Vgw6CFiSOhcjFU5/7O8AS7umXEJGqIVlJfR3o71a2NqcHCO0FlnGec608cD+BeO2WiEThH9bsBh6DBt7LR34qhm0Kg4GRgdg+5NzKWhHarRHCgAr7+CHZl9OVhaYThbkESo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lb8tyahe; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lb8tyahe"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e34c4ce54so346107b3a.0
        for <imx@lists.linux.dev>; Wed, 20 Aug 2025 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755722964; x=1756327764; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4v/yTvx7RBI8LtWbJxBxyTglyBh+fQ/yrAxsVqZVRi0=;
        b=Lb8tyahehnB+g9+u414flj6Fhzgn8WErtnS6ICH7FFixi0cibGA+v4XAegV+oL7UZQ
         EdP3ti4godudy/liV2r/bLRYLg9J+Y5k+P/0/7AwvZaCShY3U9RJkEs28kxU6Mm+oiB3
         8D9e3Ft+Rf58f9AuZrmuH3ZyaxOj48WTP4jDAbNJNohNQmyXiE0UAT5KOqf5qDbt6U05
         Obb+R2Gq62RlaDuNKkAdyp+7FRDjdR4FgiAfJmq31/Eg7QehIYiz/kz45im4uz2HzmsY
         hIzVuOCbbraTS58Q2DRatZFOzS2Ct53ISEZcrxzA2KwfEp6LvjuWeJaHg2VdOlCxvChv
         MF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755722964; x=1756327764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4v/yTvx7RBI8LtWbJxBxyTglyBh+fQ/yrAxsVqZVRi0=;
        b=NC7VsseeELsjJXdkhEfQvjV12fIteWCdfQHWsa4Vvuxz8SvB+XG9hML8ErdENp4bZU
         DqqRI6/TijBud8kqlwgsjdPB99XKo8dxcVnogw30BrZJ6wCZ+tPAwnhjxG27HjKl1IRX
         ojWxS6J6N5fW1GBtrtv922IBXo/hEhWYONaDWBxwzkfXtJOr5MYotz6wR1VE4fSI2W0J
         W8UQnc/4xFTuPL5QTS+DDkqB0oSi0RmAdPPKuaKXuOfHS9hvCz3C7eQnOOVeMhc3EIyI
         2HtlaFc0ugv87CHvddu6r7Yea5/Z//dZrDqa8EjQGul90QGBN/troNsfmR3fhldS9eTM
         Zncg==
X-Forwarded-Encrypted: i=1; AJvYcCUSUhoEU9mUy7BYfYUxHYSEc8XduHMNJkP+bgljxkO+0c6yBn1ZpVB+B/tcrxS4QAdG5h4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcVFg1J0sy/zczABxJhb3z4Nmel9E4O6JAAHaBumrZN+B1+IN5
	IadTKsPqCFig0u3X+nZgIdjXzC4zHK3uI5IuhhuEG8gTOBbBrYbQeTC4zlQ8dVgepQM=
X-Gm-Gg: ASbGncv10PxEJaAq2ynSw5Ot2Ffka59hvCfXuo5aIz5rA/2qKRIG7HwWhixpDDOlaec
	owGulvAwPQ9q2BPKtsTCIiSgOWnPCJoEfG62Qnq1U0xo79L7O7gilTDuZaHdY0YUAkxgpXaCFU0
	qbjAD4zJd4be4Z8qKEhJUdkoHvM0Qusgzs9sPd1Oml3wSTlY+10oLzHerqxofRmTp3eEm2zs1PO
	UICNO3CB9ePFpxUuwPHUHpGhuBsLMQil3LlY0Lfc5xredA4GKhjL63DSPOXpPkHT5unmv/s8Das
	jYZpZKjlJ+RaTPOWIkDvmIUNgA6ar+CPIOTqzJS6g5fywP+3bWpyRDm4KGq8GmOAa1f7GNVnCPh
	bTIPSdgwDnET6tDmH7mDEfBbaSA==
X-Google-Smtp-Source: AGHT+IGhgPqqfmRMNGx86fAr6FlVuQIPW8YOrUg5lPs2NO14D0x2SMo+UNh8zB+5H+CHAosyVL/RUA==
X-Received: by 2002:a05:6a20:3ca8:b0:23d:7a30:a82d with SMTP id adf61e73a8af0-2432c196a3cmr1194253637.5.1755722964369;
        Wed, 20 Aug 2025 13:49:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ed3c:56fb:c00a:205e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d1522sm6263547b3a.18.2025.08.20.13.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:49:23 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:49:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <aKY00cmV0NnOlAmx@p14s>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818204420.794554-1-shenwei.wang@nxp.com>

Did you send me a patchset that doesn't clear checkpatch.pl?

On Mon, Aug 18, 2025 at 03:44:16PM -0500, Shenwei Wang wrote:
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
> 
> The expected DTS layout structure is following:
> 
>     cm33: remoteproc-cm33 {
>              compatible = "fsl,imx8ulp-cm33";
> 
>              rpmsg {
>                      rpmsg-io-channel {
>                              gpio@0 {
>                                      compatible = "fsl,imx-rpmsg-gpio";
>                                      reg = <0>;
>                              };
> 
>                              gpio@1 {
>                                      compatible = "fsl,imx-rpmsg-gpio";
>                                      reg = <1>;
>                              };
> 
>                              ...
>                      };
> 
>                      rpmsg-i2c-channel {
>                              i2c@0 {
>                                      compatible = "fsl,imx-rpmsg-i2c";
>                                      reg = <0>;
>                              };
>                      };
> 
>                      ...
>              };
>      };
> 
> 
> Shenwei Wang (4):
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
>   gpio: imx-rpmsg: add imx-rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 117 ++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  11 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-imx-rpmsg.c                 | 559 ++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                | 125 ++++
>  include/linux/imx_rpmsg.h                     |  55 ++
>  7 files changed, 895 insertions(+)
>  create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
>  create mode 100644 include/linux/imx_rpmsg.h
> 
> --
> 2.43.0
> 
