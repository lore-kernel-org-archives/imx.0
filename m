Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A7B2E2DD2
	for <imx@lists.linux.dev>; Wed, 14 Jan 2026 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768410552; cv=none; b=REnL84l/u4o1M/0pmeOyRbac7V0D0IbaHgsYQaXyUkkWkZbovbLehjuA7rApHtAHYNxy46E55lwxh4Lqo414EXEjfxmUNYZLvbrt0IggyCUXIoqdns3mruEn2vlvD5CLAy7oN8YyMvAJFCbI8MNyJV0EnKSZm3upIXLM+jHkvQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768410552; c=relaxed/simple;
	bh=98G5EZefFkl/9hWfVjLIKGerKNrUGutT82EZGZKIFWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reMFeEuq3ASnVXPQe2XC2uLqrogeKzK+kptJK0C3r1NsUVSLPgajJucD5xgQwSmD/7d2p63I1zCspKdIBPRaSjlz5Zgf/CNx9tSRIWIhl6QQ5gmdYXYpghK0oCYcZe3wy07SzCfOVBqRlZlaNATSNsY9mp7AaoXMSAoTXbcEHVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mwtKXCJt; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mwtKXCJt"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso528975ad.1
        for <imx@lists.linux.dev>; Wed, 14 Jan 2026 09:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768410550; x=1769015350; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYBoGaWLHXCd8PqOgncqDf0BayRCOnmKkumvRRhT/88=;
        b=mwtKXCJt/P5kiYMsKcacByQH0p6nOGOetl0ijN+TGawW8fJA9Cw1YPHYneiU6RMb4G
         tCcMufeCTcEtCV1X+ck37Z1Dp/W59cilCDPSuEvMOvIbAxXrppGoBhJ8U5oekq6MfDZc
         rnNlrJgtukZxWb12gg2n8ef7P3xKhdPP3Snj1AByhzHzifm7oJCK9WgLxI2ZthlIBUv7
         /ZOx0kxrz1TzNsGdSmFTeCfEjgaWtSJj6/4RvP0CdtRfte4onVWb7RESK82GHuIq9gwi
         GEnM3y47kRomMsSG3lFYWbAK71W1Hs5XtLw5gbUJFzfWhIlk4IDfeoaDwBx+jeHcaj+y
         nkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410550; x=1769015350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYBoGaWLHXCd8PqOgncqDf0BayRCOnmKkumvRRhT/88=;
        b=DcK/cqOjCrWJZT3aA3uBoQLcJY5Z5+pw9PnDGkkBZy7R4i/jwhCdCJEEu9ZkgNrn3z
         1w51x6+Oj7rUwpAgfQhsoTuj+hkjrJU8U0AvqFV4iiyPuY1WNJiAU0/7aEusWpQX1+zf
         gdHW5wghHRB6puN3DGKzBSKDWnzmctKttQIgiewB/ynE7OzEbN4KuoQDeZ2MnG9QOddn
         9/bRDFAynHa0eNkj1yn5G9ck38NN7222fA0qXTByBkuFle/TSbKFevtV3o0CYl/Cs1WV
         InXjbq6Ieis6ldIF89ztz4nYarkk0+Ndbj5Y1RF9LiTn0TtwEMt4deQRnOLX51yTJDKj
         Ah5A==
X-Forwarded-Encrypted: i=1; AJvYcCUwakN44/2awQy9yip6wmNOsLS6g8JOziEtot4V0s4zHPn6ZTOY+pkIIpzV+anZHFpnm6I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLwk/fU2DkuUj5N4TEqUF3u1Cuznw0t8jNn7nwo/LYTLAg01sH
	9ETB9QcJ3VPa9cpdiSj/LkKUNrrIjt+no+E5ZTZY06oRfrr8fnz3zXdHpPr8lOVW1Js=
X-Gm-Gg: AY/fxX5xGm/2T9xB3hLowSUOnzjjy6KMfCt9qlRzWfmJEqsf9JtExsd4tpLmE6zvKHe
	+jgHEY/kJOg+8N/CgYF94EuOnhALg6YmSMUI3eimlgdAC6cCC+LMGfp63kgN0FmkhkNq++f/trO
	Qp4DX17Dtt2TxcitwUnqkinib0qwODyULTHR2UTQep65lCb4MCIa6no+OGLgrSSQb5R2oMAdeu+
	zQDks+F0TWiQTTfcLSwkQbil37/kzoYu70AbBJq+q+K7kfbMw6tw+4DEZ6Ig21no5/fNce8W3yK
	neqPWLsgWcm51gwV0wnM6x19orSSZ41lUKxC69vEuOlE773Isy8lG5Nja9AOB+EUXbohT0MpdWe
	05rxI40Qo/p/IgurDgbLFqFyhlMScBQhTpmR0K6iqQQVvQ1O4KubQx/89RmC8FfwC68X/ElD6L/
	dG2PEugzDRLLbLFA==
X-Received: by 2002:a17:902:c949:b0:2a0:992c:c54e with SMTP id d9443c01a7336-2a599e33f1dmr33469595ad.48.1768410550174;
        Wed, 14 Jan 2026 09:09:10 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:c447:f90e:a227:47bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88d8sm231003025ad.80.2026.01.14.09.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:09 -0800 (PST)
Date: Wed, 14 Jan 2026 10:09:06 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v6 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <aWfNsrpC5Rgiwwp3@p14s>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212194341.966387-1-shenwei.wang@nxp.com>

On Fri, Dec 12, 2025 at 01:43:36PM -0600, Shenwei Wang wrote:
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
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

NAK - I asked to use the virtio interface (in this case virtio-gpio), something
I do not see in the above summary and the first 2 patches in this series.  This
work will not move forward until that happens.
 
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
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
>   docs: driver-api: gpio: generic gpio driver over rpmsg bus
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> 
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  49 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  54 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 232 +++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  16 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 490 ++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                | 143 +++++
>  include/linux/rpmsg/rpdev_info.h              |  33 ++
>  10 files changed, 1046 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>  create mode 100644 include/linux/rpmsg/rpdev_info.h
> 
> --
> 2.43.0
> 
