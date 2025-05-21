Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381C02153E7
	for <imx@lists.linux.dev>; Wed, 21 May 2025 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842691; cv=none; b=dfW+RiVBy+duyH6FMHaEoArWBpbvkfwR5njbpm5/b5FPjU8glJHLojRXJ9mrDHyBh335h52Fwxrwwg/YlYELBp3icQO+yVDMXbojf5L4XwCciKUKkITEjeABl+xcqAFIza5iJ98MMTJ/o7941HRCDGJL/ZtE2QlHm1ZBXd6EXCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842691; c=relaxed/simple;
	bh=eiAaBv74i/CT4/xN4zsTzuWn2wgfVrrhiK3KxXjzMyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iy+OsfjiGF+7zg1gV9gqLcc88bYI5AUE+y+0AHc8VVt0imaQQeIFxJrlLJsqWoiQkiB5g/PrkGj+R7mNE0zOKMqcDOvUiK6nGqMRk2gM9N672xqAGwCcwA2gPIBDvLX+eaBDQpPUBKpG1WzRNPGVMO2UOp7Vugjcj8sz5BRHpFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=U54NVr9f; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U54NVr9f"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso69690215e9.0
        for <imx@lists.linux.dev>; Wed, 21 May 2025 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747842687; x=1748447487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALPXDBC4VOnQSYjOJhu8mMUA1ahkHYVduSlJiXRjoA0=;
        b=U54NVr9fpkd4itWMGG4iA3oTMkqVvFwo4TzeA1CiZ6FfC2xqKggtQp4+SuzdyQekBT
         HPiE4ESLrjHLmETtyO/F7iQJlD+KRTFsaYRqbcKUirMCYELbByupZ8xp9QYDzjkSH7oq
         u9x8naBT/EBvXDTvTQdxSZ1hFdiuNFb+H6L2fR/jjsd1iHpmqCtcZ8YnLusvMUUS1/Vx
         Mx50tsrMstB3CIuMtRmfVTmiMbhYcOV2KPxNdN5r99X+jJjYTiZuZZDE00sM8tMb9HOq
         zIGHxtl3DzuftLIjaoCbI4UwYeYRKEC2M4jn5HfY3Pop0hc+DTzl6daJfwOeIdWZBN7T
         CLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747842687; x=1748447487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALPXDBC4VOnQSYjOJhu8mMUA1ahkHYVduSlJiXRjoA0=;
        b=W4izKxPHTnb6SA5XHqpMiUOSGv2i87ht1MvmDcbcOJ+cE3Zt+l4la9FBgjHJyWkgz5
         XZrt4kTPLC/WsmqBtFO79HkOI87oMNzc7yN0ACTqqCU6rScmO4gXnG2UtWAc3fTy5w33
         ijQ/GTOLTqtfT4rmVcKC2uMYZn2w1wG7rrXhhwZaLOQn167RV0eD6hjPlk30sOKCdTEV
         b834zLeYFijIBWZ8uHPWDQMyILcIho/pW6JsaytVI/voE2djiGg1lNPTpg7UivXl8GGC
         KYBhzfidSRvBrr+DsI4ZYvHGyEe0nnbKBImYsmnYn2y51o2x8ZDMJpeKS+tDEK2kwtFy
         RRpw==
X-Forwarded-Encrypted: i=1; AJvYcCWtRJmXBZ04Dcj7qnwfMiBOavctUbGL9FEoobk/xdUcRRfO6oIZiFkakkiEo7s5AHEBEfs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVjOXH/9mxbEudjmMjCwLonV3eJ4NnWUdEm8cESjoIPHPGogRr
	UM5fjSS8/VP9qoO+fipXFyAL94i7qMMS5Val7jeanVqimW4rZ8QSPyAAOCJ7Dgec2d0=
X-Gm-Gg: ASbGncvh4RulYMYBcBaIvUk/xMkW/M9sFHrvnFO4/kmAi3O6H3m2A195o/w1wltajol
	uBKv6LgafTf+Uh933v1tlLF6EzKh653myUT06CSnvzjjS/dUV6Oes/ZdHz1+FVId3O7tEaxm65p
	1c3PFTCy9qbDyDM3FFVaFgT8ox8qtWSwR7fpQLJyuD47dKg/CHUkA2+3osqefb/GKqmKPFe1JFS
	j9/Vp0kxMTncDVCoB7KOHyQfz/cMmoOZUbAz8F6bfWF7VXFbd/D1clbwnQiVS4dW1tyKSPLpkq4
	UPXEXnIUxS8jQa2vtfLr4A9gjzK/J1MnAEnpmIu1foErhNfyTpBT
X-Google-Smtp-Source: AGHT+IEqZ+pvs2qnbXKikjx3bqPhev0Cos2vwclP7j26sP/JdZ5sUoTbb2O4Vt1gGh0WRqouqxSmSw==
X-Received: by 2002:a05:600c:3b94:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-442fd60a517mr194344195e9.1.1747842687246;
        Wed, 21 May 2025 08:51:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b545:3055:5b24:d6c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f38145eesm72488205e9.26.2025.05.21.08.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 08:51:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Haibo Chen <haibo.chen@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	peng.fan@nxp.com,
	wahrenst@gmx.net,
	conor@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: (subset) [PATCH v3 0/3] Add 'ngpios' and 'gpio-reserved-ranges' for vf610-gpio driver
Date: Wed, 21 May 2025 17:51:25 +0200
Message-ID: <174784268330.124259.6614015290533617892.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 20 May 2025 11:46:11 +0800, Haibo Chen wrote:
> Not all GPIO ports have 32 pads, so add 'ngpios' property to specify
> the number. This can save some memory when alloc bitmap for GPIO,
> besides GPIO tools like gpioinfo will show the correct information.
> 
> Some GPIO ports even more special, e.g. GPIO7 on imx94, it only support
> IO0~IO9 and IO16~IO27, so add 'gpio-reserved-ranges' property.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: gpio: vf610: add ngpios and gpio-reserved-ranges
      https://git.kernel.org/brgl/linux/c/4e9d73034196ac8ab496bb47583197b36ba13327

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
