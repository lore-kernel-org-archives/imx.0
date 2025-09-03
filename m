Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46432DAFDB
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 07:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885138; cv=none; b=sCDh90TBUgy1h5t4atDoGxKUCrwSthZ26EoIWHmVeHSJP3+yTMdR9ik9bkEBMSQmb1naGP2Wkd6y3r8dedMevFlDOQ90HjA8o6uBZfPNMQ0tiZmS8JO2OWI4VVfWEWb4fNSgvYb39GVeDSJkjsTboFfmPT0V9MV2uu65Yqh9V9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885138; c=relaxed/simple;
	bh=5R1W8LWzThf0lefJvjX7dgtNUQ87EdiwGUIQXxLzwL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RP3GKjZt6VrpKMtnGpSPnP89hdGXsdMfZkJjvJGIWMcq+KiGRdXBJQROOqsWheAXckwegwGOCGT02ZP9UXXURMwnY2ITfKEAG+Ng1/mYhRp+rW73/ydQpKx6IHW7X9gRBA2kh/cAik6PEprMEbW8DCyWuH2CaFkCEXONVodp4Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ofZ8ORYW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ofZ8ORYW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3d1bf79d758so3251558f8f.1
        for <imx@lists.linux.dev>; Wed, 03 Sep 2025 00:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756885135; x=1757489935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mp5T71lPvUAjJD5COGIsnq0220IphycqvLkiYGEuO38=;
        b=ofZ8ORYWy1vYS6nZQYHEUSmihJb3SE9vGvzh2Div0pR9FNJ23gxx6pjTIWg2QqgtB6
         64yyRE3ksCwk+nagdiEnWLblpUfcUYXB6/puieTzp+1kiNJztNyJqteNY7xm3ktQUx7m
         kY6LMfrLIn8epEDPY3jVCD3gbpfVNDidw/POTx3yDShz9Zm7WdO26t2HS5Hg3kPgpkof
         wMZPvQ46Q5MqDn+ni2J95gH/QN7bLQLidM5k7Fl7ByWp1SQhAOgm/NqNUHMCghfFo2Ms
         dH0RaR/UsodFT08a8+5BoW+vFeQ8i6s01NIi+GquLrYC1z8bc6VYUFk2sPhDiq5mvy/V
         9Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756885135; x=1757489935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mp5T71lPvUAjJD5COGIsnq0220IphycqvLkiYGEuO38=;
        b=H2mZdhY+NVsXuoT/e2lOMhK9mDNc13H9dH5qXaXPTquBLi+UjUMbLAEnsoxYIy9l7L
         nc4fO2NnkCpwT7jQOWrYe9aCO5hbJXzqU49Aa/IDJ8EGYmy8m+gaQDYTjZm3tRWcxJJS
         hYpqRH1MSmQx9l9NKVwN0bqf96G4gAIgt1PWiS0ucBij+LyUNuZ7U2ZflLkOrZqm17Mh
         AyofF4bc8WIXPci1p8c1Cl729JYQjzq74KOf9zqeekFJzukQuxKiBshSaxo8eqQqoqOA
         qxULw5Jf1Ax7OutxH/xfL5AmiNsLq/cfDl2hgblwlne4axogxAuRd2ilUy0Z/50bGv2u
         RIag==
X-Forwarded-Encrypted: i=1; AJvYcCXVjs9EeJhm4QdzTsxku2XDiioJdP42BMsrMC9adeENZ1vWFXfcEx+mk/f070hFsgllfSE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yynv5IXKStw144oFVZEteAKFr6VhRc3u+vfhjSj4eVYdvIbfwsF
	kkrwQwqSf0oH6kJZ8v2CMwPsxkPKyoWfpOzXdnKHePSOMzYMyL+Y0H221nAp1Hv+wu0=
X-Gm-Gg: ASbGncuku+QD9bGWeyEdEUMkghfrtNvoyLBX+i/4XNiJgT5oToLQOeS38hxVJ9eUPZG
	pvWPxQgIPZWYUCcV6lPy0PPz0axf/b8Kg3UBFMzuMfKSt5KydnTLUo3EF7/a2LwLYWqB6KFZJl5
	xbK9XC07wO4WvQ19idVjeGxzLaew8fPLi+iRTTK0vnonrua9eBTMTYpW0tSqF3Yf2ZpciwAolU1
	Zd9IEGLKKjxT+X/JoBgnp9hB+2ZTdCBiR2Znq8uMouTrsNpeE4v+u4IxCDCFRCBMShKUr3wQgkM
	Mn4fy3EDz6ePY75/2QR4ABKpHNiX8UMDWTvzvzvj08a1kguYiNEFsBWs/QKPrHl2Y5yuvgBNLPU
	8O3WD8yIKHPHL0K2CQUxhLIY=
X-Google-Smtp-Source: AGHT+IFkZYEPWWCkKse2PQo7g1HVYHPWt9iUadycuLD1iYe9gFsnwRwmTjB2wHvwzo04UWlct/Y1jQ==
X-Received: by 2002:a05:6000:64f:b0:3d3:1ad0:e8b7 with SMTP id ffacd0b85a97d-3d31b2c7c54mr11268847f8f.12.1756885135098;
        Wed, 03 Sep 2025 00:38:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d53fda847dsm13417216f8f.0.2025.09.03.00.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:38:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Yang Shen <shenyang39@huawei.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] gpio: replace legacy bgpio_init() with its modernized alternative - part 2
Date: Wed,  3 Sep 2025 09:38:51 +0200
Message-ID: <175688512868.10115.1073812305846607850.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 26 Aug 2025 11:35:01 +0200, Bartosz Golaszewski wrote:
> Here's another round of patches converting GPIO drivers to the
> modernized generic GPIO chip API.
> 
> 

Applied, thanks!

[01/12] gpio: xgene-sb: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/38d98a822c143a4a7337d08f50968cbd7b701ca2
[02/12] gpio: mxs: order includes alphabetically
        https://git.kernel.org/brgl/linux/c/d3332dd1f6e2cf82744dbab37d05857e2d028fa0
[03/12] gpio: mxs: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/c7357c8b6703d4bc0db6198782fcbf0cf3033844
[04/12] gpio: mlxbf2: use dev_err_probe() where applicable
        https://git.kernel.org/brgl/linux/c/7cb9086790a0de526ee40508a4deaebfd82a5bca
[05/12] gpio: mlxbf2: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/72fdbf35ec7273bb1c885696680e611c47b261b4
[06/12] gpio: xgs-iproc: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/6821e5d5877ca80b6989dfba2648a7ecbe3d9a64
[07/12] gpio: ftgpio010: order includes alphabetically
        https://git.kernel.org/brgl/linux/c/cf0257d3ce05259a74265fe0a0bd7de063cc6793
[08/12] gpio: ftgpio010: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/3ff7ab070b4804aad5b1d3e3d82a793710ef1f27
[09/12] gpio: realtek-otto: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/b9dac8251e7e6aa433f54a7da45cb05c66627695
[10/12] gpio: hisi: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/c0378e59a6af2efa470a384b69fd24d3f3f3dd97
[11/12] gpio: vf610: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/656dc0c6f725a29c9e48657ae3db78f9016f518c
[12/12] gpio: visconti: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/a6f03347debb7c2c6d04cd4be67ed766e19633ba

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
