Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFF22BEC2D
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 17:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003977; cv=none; b=tdx1qlwY4x0Jqw5Vu5FLp1bz2QciR/6P7/15dRHIsX6nbMZVmQKwWjNVoG6V6WDBKKVU3aCV/f0fixcAGuhJtmHTNneGSiClvgXNRv9WjeCIYXm9rVFEwiw7tcKmjtITYNWbWQnJO+mFOUUZ8vly2xvQ9MaFYHVnnFxRA/yONCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003977; c=relaxed/simple;
	bh=JYk0DlsmrYkHa9pnunJP5MMBiIh8+pvQoxXtIvOuszA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUBTHXFRwYtCnnUXTGBgXQNGcUwGvOOf6X666/12qavmARk9x79raS7v/4ZbZWuStU53EmR7HBBwsZwcpzIARi8wHg55mKzBLVPjpN7wb8hZp9uA4lWQY/XOW6HA18OWm0aKd0VzWrhiRaZdawWgA/OUHGyF73fiVnv8uROx3ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WU2zcq8j; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WU2zcq8j"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29568d93e87so42261055ad.2
        for <imx@lists.linux.dev>; Mon, 24 Nov 2025 09:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764003975; x=1764608775; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gnHv7SSUkVZXm9MlHQF7vnbKRHnkGY//zn2BWH6fbi8=;
        b=WU2zcq8jeUenoMBbu3pdbMGcFYC621qOhu82ab0SPS+RhKGcCfQKJGj8VPLCo1wLnu
         2s+3T2q4Cp2KwvjNO549NkS/OpEtqDJbK4FfL6XdjvfiH26fBA6EP2jOIy1abTuwfge+
         L9cz4ThlNRxXfA60kMgOfb/l/xKvLWasfFN1fOcxs+QVnlVe4J13PlPnVSYPUmrBLgku
         s4uu0AH9sbW3UTdx+Z/8sL2UvFFcaLHrP2Rhp9hyVpuFVWfnx3x75cSP55B19SnQs2eK
         WTl6yLOwdN3phwNJEW9MyOV5UhG026OADgDPmRH8Eivo1T+88kUDkMJacqYd0Q8nRcQw
         LqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003975; x=1764608775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnHv7SSUkVZXm9MlHQF7vnbKRHnkGY//zn2BWH6fbi8=;
        b=lWWb1Ii8HoxmGRM/yZcT3mjKhzyFiYTtM1cDK4jCB8244cf61JNLbPTUF3vTYgRHnN
         abco1rSjHloLpNY5BKxamrU6dce7VAN/yI5k+QYFPDjvo9nTH75V7p/u+FyWnbcvZYcc
         ylF1mllkhvs8sV2FI2YkaelXeUDT0W3gOH/bFm1qkVkPdgdNKwGpJUaRyLUYxz7pOfhq
         EIhpnW7z0R7wxj9fdaHKzoIfWP40hC7R/CIuiRiDaa6TFjOapqXttXFe/3hbKXQPXGkd
         ggPp8LewsbYPEDgDaRqX5cQKYrIwb8hlCKQW8Z0WCAcotecZNeHuJabnMWjhMcCHVrtt
         by0g==
X-Forwarded-Encrypted: i=1; AJvYcCUSLMQ6TDqbSyCSftvYxmHZi610WOSdSJmnPMQsgxL/IAok5VFC4/A/Ecee5xO/Fsr7Agc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRJY/TyiYfYRFImq2+RW4zfPqXMucqHOo6XZL9G2ATxpeKPINf
	iTSsgLDMqD7xrnRQalN0z7p1sqxYH5oxw9+k1zwlOZOic18nBx4waRYWBEuebdP0O0Y=
X-Gm-Gg: ASbGncuxPEJIbaRcu2VaoAcsYxLeR/NoKW30Ja03unXYpvQ23qzMjZ9zVmu6l/HxA5o
	1w58pHrBk+GqfwtPXQWV8VnOfSuc/VgY6SNeJ8CZqJmnJRcAqZy82ApOmge6Gli5KYzp5noVJjj
	2YjDCjDcOP+OdqZt+Q3dC147BAKBPJBFPVPNffbdZNfeC563FOYrqOkgeEKXhXmr+/DDkvKqHBd
	gAlgs3Vy5SfDhHYKqeBzFY4NODR7rjBvG5Sp5N1si22cr0suV1X2zNvePCiroNKY49PDE7CnNvH
	rKPUqdjMoDlRH2/yMFffXQKn6fqd+4nOSTzzYWTf2WH0BnJjVHGBG68jv74+ezuFysavGmqQrcb
	n90bDq3vDnGpJFJ08WSdLYhZmq9rZWD4e0rdq9dMNfKgGohewKKPO1v4ZOYkA+aD7LfT2z7eZW/
	ZnogRTf8LQw8rLllHz9Z45Fsjy
X-Google-Smtp-Source: AGHT+IFFll1ZBv/7+NTNtf66eRKGB3OEh6EXFU3EYSb6koOyW950nZNuI/PfU8U/2nZsnDgImLDneQ==
X-Received: by 2002:a17:903:384c:b0:27c:56af:88ea with SMTP id d9443c01a7336-29b6bfa1f66mr134598965ad.60.1764003974768;
        Mon, 24 Nov 2025 09:06:14 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:aebb:f23e:8a7c:d95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13965csm142296595ad.30.2025.11.24.09.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 09:06:14 -0800 (PST)
Date: Mon, 24 Nov 2025 10:06:11 -0700
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
Message-ID: <aSSQg22Kt-565T8S@p14s>
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

I started reviewing this set.  Given the size and amount of comments to go
through, it will likely take me several days.  I will tell you when I am done.

Even at this early stage of review on my side, I can already confirm the only
way to move forward with this set is by reaching a consensus that includes
Andrew, Arneaud and Linus W.

Thanks,
Mathieu

>  create mode 100644 Documentation/staging/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
>  create mode 100644 include/linux/rpmsg/imx_rpmsg.h
> 
> --
> 2.43.0
> 
