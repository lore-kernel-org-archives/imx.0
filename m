Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEE030B500
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 07:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489154; cv=none; b=WIaS+pFfN+liKM9I9Ys1wv6VPWGFgu31tPDJ5lB7pkNXAeow7QlOx33WNw+2qn5ScFIqAj0Feu69/WV1vOYUPeN+sCcjO9OfegOwY+sbnpzm4TgSNt2kcl4HFHQppNX3EWG6i2tuDX6jcIYvakqdiOfCWsyJaZF+auv9xM0L+mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489154; c=relaxed/simple;
	bh=mbaKzHcgj41PgNucTuXNTRRDYpWfb/AcMMrNDA/c0O8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=frnYZheSjxfsCLajRfTG6j5FrdoF8ZK/upK9h5MANz4AW6NJ3/wINeuDsYkV7+dCeCrwa/TShrqQjIZoN1xb9RcdG/8WPtRnpHD3Z7Lt1mb1Z34gWG4tc/LNJ0yXhyHMAqNq390nxqQKbW9gYXkWiiAr5Q0dawmMptDTu4L1zsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kaVE/4Zs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kaVE/4Zs"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so46660535e9.3
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 00:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489151; x=1758093951; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAOVD/NXoo6Qinrlhcnn2ltKwFLoKauBP77YUEELpDE=;
        b=kaVE/4Zs3WndZgvY1kdZH7ZhC98ZSgOu1UeigEI4xDih6auaoSRq8cJU/+dpDITfLk
         JL/OHsBo4oHobw98kuNf3AkO0js0pACVQtyPWvCskxS50g9yJgesB2OULhus8UWQ0sYw
         xGiCj5GTYXEjLeVNBvcTiBtXrd+ausRjh8XpIR6nOVGeJBgsKC3syib2yrxVM0vCy7lO
         ERjSuL0aGN1aJtzZn0P1Q+8u/eeDZpARUqzR51OEGP5es0JDQlEWPS3FiGFaPR6yEkA5
         dZwA4VnG8ej42P/i2mm1xUu0CcBlTrjmzOYZQpFCEnW6Ljnv2CeKO8nnKJT3CZL82wGk
         2/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489151; x=1758093951;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAOVD/NXoo6Qinrlhcnn2ltKwFLoKauBP77YUEELpDE=;
        b=cQHjkISkWU429C1QTlcShbm4wAQ0vZxZGRvgU7DI7thZmmSqwXolH5CAfOjI/mFMp7
         3F2itthqsjONHykHT24fsj9Qxemaf5Hnd148gIFuvAz5K+Ca3rJWAHPrQfrKqGq/VdHb
         PlXbEUBVvOP76xD58xNx1+sqXMjhLSB5pa6RsoGmbUiRRiRZFksrYMkwELzszHPHLVHc
         RP+zIRbrahKgLxCxd7qJbCXvhvS8zhTSk8sI3+dr/7Pu5pOI/8yh2CKbMZ1QT0aTZGoP
         Fnjt3t2kTcTQ7pZhFFCYeg91oUnA3v9Jshl9BG5o/NKRv4+XTToLlv5BgHEuALBdO9Bw
         IvBw==
X-Forwarded-Encrypted: i=1; AJvYcCVFJ/wWm0Q9/PgiO+eXgcZ8+gyWSxXDzd6Uz5UVEYvV+awtDIljM3sE0XdE99ZdxD3zf/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzBYMgRb5Qfh06m0eR+4VxRafT9TyMq4gKbFQUAv4Rj8td5rmq
	CIMcigxVO34Vz7zbKjM3f06e4g+bhQpB5u59MKMhvEfFs5LpRox+ljluxpjyg2dI8Ws=
X-Gm-Gg: ASbGncsY5tIkE9VWmQOX0H06g8BrdCdY9SqqOVG9FjR0l7SlmGnHgOp2YeZD6pwFIPM
	vHQ7CRUhOCG+cLYSlnvKLZbz0vjVpCZ8+M4Y6fcxB4ih38ZpaDTK1Qj58CVRffI23GlNAWpFxf6
	2OZpFkRD5dzpnU49iQFB+K4rhWlYKdsdmKVgM+1K2X8yvHgRzU4tAqytIUn6QMpK7gbSAcIyNrS
	3w6sGybcE7vZ2HA5FdAz/xAM1EvKQbYKqOovyewbYpRwHm6u/Qrybdc6RV6GKUQghfbT1PQFvzg
	eCQv260+c8LvAPCoACluu3q3cHLHS9ahOnhpHiRKAIkq5Ya3WUGrb+GLWfxYJOJ21zrNDcgh7+F
	27bmYF3NzzYk3Z4ybK9pzRQcCbwoJ
X-Google-Smtp-Source: AGHT+IHGcMRUmLBYK4SgC+8FxVXfL1XsZk92Y0HumCVsdD0bP05sNhcUQfhnESNzNcG8GqNwFSRO+g==
X-Received: by 2002:a05:600c:1393:b0:45b:7b00:c129 with SMTP id 5b1f17b1804b1-45dddf021a4mr111254435e9.35.1757489150984;
        Wed, 10 Sep 2025 00:25:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8236428sm16729825e9.24.2025.09.10.00.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:25:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] gpio/pinctrl/mfd: use more common syntax for compound
 literals
Date: Wed, 10 Sep 2025 09:25:44 +0200
Message-Id: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgnwWgC/x3NTQrCMBBA4auUWTuQ/kiJVxEX03Ssg8mkTKoUS
 u9ucPlt3jugsAkXuDUHGH+lSNaK9tJAeJEujDJXQ+e6q/POY6I3Y8hpzR+dMcrGRrGgZksUkRY
 SxbZ3Yx/COEx+gFpajZ+y/y/3x3n+AJ5+BqB1AAAA
X-Change-ID: 20250909-make-compound-literals-normal-again-13073cc74b94
To: Lee Jones <lee@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Hoan Tran <hoan@os.amperecomputing.com>, Yang Shen <shenyang39@huawei.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
 linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mbaKzHcgj41PgNucTuXNTRRDYpWfb/AcMMrNDA/c0O8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSf8fAuHxdMgXnxNQ6BJ55Q2hyWr1ftxMskiL
 dcle+ZX0s+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEn/AAKCRARpy6gFHHX
 cr6ND/99HqQnU9BaJ0rG9nmyHWz9UVNShxsHcidnTQYDpvGwd2PHnJcJdwpjGZC1msq3r+GB/ga
 /zA5bR2ZsRzfO/XKfM2IjjN6BaSGRl3qj9qX5cxH5gT86+KMQWrzjOYsJhcIldkm+B/vxqqMHom
 MFHfiq0n0NhdzWqe4O3C1X7fVIpRgGSXVSYfka6cg3On8jzmA6PyhkaYa706xoCHPHckqJaKRk1
 P+NLmTJxoupn2H21plGDEESji9GS0g3dXUS7H/uHSv5ILsR67EA6A21k4utyvCfQNrL/27uhiSm
 hxO4JygFgiZBOLGyX7WXgmTyFKtFZ9mnl5Y10vpz7itfuPUJWQk0GJ594d7f3ZIDJqZueax0J1e
 Z9CFk6U3ZT1jZ/oMIJAydNph0r1xH5OHAbczLcvLOoR5GkxxP5NePvsyr7k0t2+6Xw2Nukz4n05
 aQ1qzE7sNjWX4cxaqeRfInnYZHQy89Qf+mTyJKVrx3MAz+sXZHhtN5Q74xMDTydQMOhKX/iaZic
 YfBgTRRt9OWEIaiGrlyxYGj1whz5lTrSdziP3ZNQQRyBqFA1bYzMOGHlTHK2/1DSVLM6EOMheNZ
 QVH65EM200UB4DiHwbgDAcSSaAhQ2UUoYc/mi5fX28HetdMG3CdC40i4ZKPvnCNmCf7Ld3NAZoi
 Tx4rK9U0Rc28ZCA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

As discussed[1] with Andy: it's probably better to use a more common
syntax for compound literals so fix the commits that converted GPIO
chips to using the new generic GPIO chip API and make them explicitly
spell out the type they're initializing.

Each commit in this series can go directly into its respective tree:
MFD, pinctrl and GPIO.

[1] https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      mfd: vexpress-sysreg: use more common syntax for compound literals
      pinctrl: use more common syntax for compound literals
      gpio: use more common syntax for compound literals

 drivers/gpio/gpio-amdpt.c                 | 2 +-
 drivers/gpio/gpio-blzp1600.c              | 2 +-
 drivers/gpio/gpio-dwapb.c                 | 2 +-
 drivers/gpio/gpio-ep93xx.c                | 2 +-
 drivers/gpio/gpio-ftgpio010.c             | 2 +-
 drivers/gpio/gpio-ge.c                    | 2 +-
 drivers/gpio/gpio-grgpio.c                | 2 +-
 drivers/gpio/gpio-hisi.c                  | 2 +-
 drivers/gpio/gpio-idt3243x.c              | 2 +-
 drivers/gpio/gpio-ixp4xx.c                | 2 +-
 drivers/gpio/gpio-loongson-64bit.c        | 2 +-
 drivers/gpio/gpio-mlxbf.c                 | 2 +-
 drivers/gpio/gpio-mlxbf2.c                | 2 +-
 drivers/gpio/gpio-mlxbf3.c                | 2 +-
 drivers/gpio/gpio-mpc8xxx.c               | 2 +-
 drivers/gpio/gpio-mxs.c                   | 2 +-
 drivers/gpio/gpio-rda.c                   | 2 +-
 drivers/gpio/gpio-realtek-otto.c          | 2 +-
 drivers/gpio/gpio-tb10x.c                 | 2 +-
 drivers/gpio/gpio-ts4800.c                | 2 +-
 drivers/gpio/gpio-vf610.c                 | 2 +-
 drivers/gpio/gpio-visconti.c              | 2 +-
 drivers/gpio/gpio-xgene-sb.c              | 2 +-
 drivers/gpio/gpio-xgs-iproc.c             | 2 +-
 drivers/mfd/vexpress-sysreg.c             | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 drivers/pinctrl/pinctrl-equilibrium.c     | 2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250909-make-compound-literals-normal-again-13073cc74b94

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

