Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCE92C0277
	for <imx@lists.linux.dev>; Fri, 12 Sep 2025 07:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662025; cv=none; b=SBmOyaz4+fJMu0xQhiBM7OZq9EPTkkz5bHsha957w4VK6Rdi1sfBQMQ56I/eth7JAcdNS9I+Bb6Z9GBRPtl7h7mkRgljbtBuOE4DBPTLl0TaX+vYCkY4Lum9UO1pwtdI+HKljxQ3p9ZDj11Xt7CrkMXfXPAEd9dkY2HnHP573Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662025; c=relaxed/simple;
	bh=xdcRbwNQYyPOvei/iOTBM/TyZ63L1Uwke68lF4T6tVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eyV7vsO01OR5dlFeOldmhTyWi2mShmEoPi3b6KhSmoR9DjTz+ZVEcbilzQqQIFxzCaXMtKwCqDr4ZKUmoPyCw5u0EqhFz960qWL0dLeJ+NlHSWEv8r6zy/RtFk2fM/UnHLsgOBasbqSebZiN0cEG72jpcLJu7k5b0rIDVOTVPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tC0gWq+C; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tC0gWq+C"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45dec1ae562so14690665e9.1
        for <imx@lists.linux.dev>; Fri, 12 Sep 2025 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757662021; x=1758266821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3tI11OAkSN7RqNGcTXf8rRvtsdFAfZUpl45jMI60AM=;
        b=tC0gWq+CwTc+ErxMwszJf5MIgQk3ui1oFnrvT7G3pEKYT/gahcjn6zcBFFGG20ivC8
         /3TgBQADDL/gwMTtwly+8ScoXpd1Kff9QpfsiLpVKLuVm964nrDOUgsZa6r6Kz07nrKx
         N/9JBx8RLIBfKz8FZZ75MTTWpfxZXIRNsNjpn08DaIy0wxcR39dieI6tbjBcgBXjLwkm
         nuL/cT6u8RQv/ScIsymMymPtfgMUGkB73LFpx0nABHB2GnSDg4bbSdktCdpHut8ojn1D
         Bq/tGcRV0BA1f6xotrNxlCrvcukLtXJk5HI8I65FYZ0xIP/A719/Se+wA/EbwGvaWOVt
         jqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662021; x=1758266821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3tI11OAkSN7RqNGcTXf8rRvtsdFAfZUpl45jMI60AM=;
        b=faWhjtKAT25pUsyuyIQhzZRzXQ3VsZ4uVN6+pdbGW2bZZYf+IwUt1fXp5f5eiL1qc+
         TbyiM4O6Czd6ejl3JhqodW1IuBd5XDPD22t53irqVzs/zYKfMYuD8xyqyDbwbvlhbsYf
         tapUHQyDxZpBT/B6bvjay4EcijI4IMaDL4w2mZLbTLqJGt/vPIXihvl1pOFzmYS/m6LX
         L8NcGuHzfa0QOiEk3oiHUJjwbwHAVgD1zWSnMKM9jtbyNDgjU/hjUTQhbDkWAAIluBkC
         68xdsqYqM295aPCPr8wLuYJM2LegMnj402aXwW/WHpL7Ut4jFjPxsHljeTSwX9V98Axy
         wa9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTVv5/f5qsisRWi1GXBSAXvjxpBmGwzFD9KBx30vyRCGsm4exKjosQLbkMecU4Yzl3+z4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy48uftfUlcBVIwsZ0cMvbD/SU/1tvNGK032hRRa0GwhDyB+aUY
	S3kbOgPXToKGfRN7jlbYJjpe1CbdLJToFtk0RlE/lRMdYGvGf9T/48IeL7BDLOSYhpk=
X-Gm-Gg: ASbGncvHt+xPR68WxZ7P3A959xe1Twyxw/4VnBmn2HCAukUC7imX2egPKy3i1O3vMGn
	hJel93wOG8Ci88gDpJykr00Zxfrt0bNSqKgSyk/3bheIAdo4vblSwE8lVkIVe00+boIyamA92xI
	pgcDr+OXS2uJXj+5PlTu8iuO3W5lfnjblSJZb25V02CfBEGnH7xao7gn8+jIsXv8ppRQ9K9p0Fv
	Uv2ZacT2V3+Yh5a3hOs96QHf7saU2ImEykMnU/QNtAjMTjPUDbZePJtFQMAn4Fbk5ol3Kfi8HNr
	d+DpYNztgSxyqjTEl8TAW+2MN3NIfaDNaCQ1dwMSNHucSaeBL3s+4IS+BHUhPxwKcpMbtfcD3cd
	iMOLyVGCPxtgTlyn8BvT9eao=
X-Google-Smtp-Source: AGHT+IGXpoEAuIYw6/UluyUVnBbgfJgpGf6NHBYCv+YqFkoz5Fkn4jAGq9fRMx7AKxy66hsY9dDhlg==
X-Received: by 2002:a7b:c04b:0:b0:45b:81b4:1917 with SMTP id 5b1f17b1804b1-45f211d5d6fmr14759865e9.10.1757662020614;
        Fri, 12 Sep 2025 00:27:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b6ab:4211:ebab:762])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e774a3fb5bsm730202f8f.58.2025.09.12.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:27:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Yang Shen <shenyang39@huawei.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	imx@lists.linux.dev,
	linux-unisoc@lists.infradead.org
Subject: Re: (subset) [PATCH 0/3] gpio/pinctrl/mfd: use more common syntax for compound literals
Date: Fri, 12 Sep 2025 09:26:54 +0200
Message-ID: <175766186357.9646.17039178132060352918.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 10 Sep 2025 09:25:44 +0200, Bartosz Golaszewski wrote:
> As discussed[1] with Andy: it's probably better to use a more common
> syntax for compound literals so fix the commits that converted GPIO
> chips to using the new generic GPIO chip API and make them explicitly
> spell out the type they're initializing.
> 
> Each commit in this series can go directly into its respective tree:
> MFD, pinctrl and GPIO.
> 
> [...]

Applied, thanks!

[3/3] gpio: use more common syntax for compound literals
      https://git.kernel.org/brgl/linux/c/7eee64e8be51f9ff0393b5bd0752a6e8f9252bf9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
