Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3099447884B
	for <imx@lists.linux.dev>; Sun, 18 Oct 2026 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326768; cv=none; b=Qo04tVzKAX+r2MOMFaxMPRfzsf4T5ApyHX7d7wsCbnhn76qNWfjtV/C+VfUQGM04nf9hpoEEGuUYvl1z6FN68smlZQwoYv46P51EITyA8o1/Ki0OrlT21UdyiE6r0jmiY7YVJ6/9QI4n4B0BQgwTYDkK55Y29eI2wHuT4NNtt9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326768; c=relaxed/simple;
	bh=jK42QSJLlFCZiNAkrZ4uWt8pBppxkc2bz1zJLNGahFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NXEstSY8PL+iJmmQrFrk+bn2eMDR1uV4MFEIcMEU+ge49g/9Noc0+SNZ8lu8SqJIgsGlG32sCexBHAD37pZnbaj2U0DeV/Bsi8GAZ+DqJIWrrQlojF0qys46NOVa0cLeYiAwkXOjz7qxzW8N+JGmGdv+C82oT87mEEMj1kLTtQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXtqBhpg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXtqBhpg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso14182225e9.1
        for <imx@lists.linux.dev>; Sun, 18 Oct 2026 05:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326765; x=1792931565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpPqZvPlIP3fXy4tW9d7V+mx955z5cVsFSY/eblWfwA=;
        b=FXtqBhpgc70KfLuc8L0c2maaxQAwSfB8VoKdFcgfzRGgXS0lhB8Q9KAVEtsoLnAi7p
         DQzMSr0gPNbFAIjKf47N0CMarIxKDMk3/IRbk9Z+kJID8Q20yudGh4Ykbw6IewF7zSoM
         bH1D1r7Mfp10I/K4DVp5UWKrwjT3n2sH+2FhyFWtysUzW9zZLwrAofq1RuTu8DzJ/G/E
         owlAK2MRBB0EOEaTl898MJCBmrTmFmk5O27pwSO18oEEt10S3xnP8XJe8hIMl3nSOcB3
         fRDwCUICowdJ1Wvf2Cof31bZ8W7BlYqm0lRXUSMxZIgusujTsECD7vRse9IKIP3X91Xk
         Nz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326765; x=1792931565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpPqZvPlIP3fXy4tW9d7V+mx955z5cVsFSY/eblWfwA=;
        b=uTNZ/hZ4iSuLySCI2poStt+c9Y3BKIvWFIpdwDmSvL/DEVxc5JxdLwxjYX+YCsV7/7
         XYM8vevR3BU/VkG3byb7T2/fpwIOITDeRHohRaySI1wy/1/UpqwK9Ki3JXHlSbT7Ht1Q
         Jcfal9F8uxJKtP9rFsG5gnNe6Q/CZwC8CsVliqCq4t02Wf01lPqfg69U3PSWTFBv8v5r
         Wuw03RJQTiYaOv0v+PUsjBXfyBrTqXVAsUVXeGmDii2Szsq5JC2ALgR6gSsalzOiLx6I
         uOaJaofWefcgkFy/6dfiD25059yII8oYq75NZPU6Kk7Ny6RCvtI7qrk31+YMePkw+6nT
         9M+g==
X-Forwarded-Encrypted: i=1; AKwUvBzUGrq83cEYekoZJ9TPkOLJ518dh49J2qzjLbWqy1Y26a0/2W91hdhf+A0/abeamQUlk2U=@lists.linux.dev
X-Gm-Message-State: AFq9FYIWxwuB0+pgtD32MEBiXxRk0B8o7M7FDOPgIIGLPb1ABkQwO5zR
	pytx6lpHcXu/11uPsKVlGMXJq/0pW5XxqX+ohMI2z6AL0g/HF3B9uHRP
X-Gm-Gg: AYBFou0fICr4EIUIJCtdLLjsXG7xj8DfgoLtPeUY1kccm42H/Bg6/pc+Fc/mAQ9bnRt
	yttRugIvNs4rybhyzImqFqeCyf1HKkAmXgNvFxktN8bQEZyZobBIuOTfni0eDPSQvhoA46e2YfF
	vvEVZiJT1Gt1xhZH2BRiTc9VRDudtNpiwC7+R1QleF5uWSskrXpWmYjsFkjDtvRyPcB9BJ+/QkG
	zet+ZWhzrwMvqcRsx1F3xji2TcQQES2qFF2G7qmvvwTf289eQ7M1MqKGsuscfJZ8xeZTjFS+2oe
	mvIhaHPZzdvXQxsNW4JyocqT5kYOAhmfcwqPze81x2cO1/IjdIXLbW5U15NtTIOtXwDgd6uybsr
	z4prvwOVOm7IHD1CJJChDad+lCtJ6KyCxwdRTJ5IHpMEYqbXynG7NH8hYNwL9mmCWlr1wXIScJ7
	HB7oeJeZs9PeDa3KM0Fx1uIUxZpyXh6n19e6tkymDagXIRWNgiPDnmXo7C5a4K+l6IJmKypSAfO
	x2g33EEWwZUz7cYdkc320i90bzZKYBg90mpJ2eM+7tJpJJH47MLwELywMVDfVRylOocLCpgp6Zq
	kY+bSsFD7z2KwW/I5by/Qg==
X-Received: by 2002:a05:600c:6992:b0:4a1:d7c3:d3d with SMTP id 5b1f17b1804b1-4a1d7c30dd2mr96288465e9.10.1792326765173;
        Sun, 18 Oct 2026 05:32:45 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:44 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/4] arm64: dts: Mark Variscite i.MX9 I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:23 +0200
Message-ID: <cover.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C recovery GPIOs on VAR-SOM-MX91 and VAR-SOM-MX93, including their
Symphony carrier boards, are missing the open-drain flag.

This series adds GPIO_OPEN_DRAIN to the SCL and SDA GPIO specifiers to
match the I2C bus requirements and avoid the warning emitted when the
I2C core enforces open-drain operation on SCL.

Stefano Radaelli (4):
  arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
  arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open
    drain
  arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
  arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open
    drain

 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi         | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi         | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)


base-commit: 31f9ec9f38735f42e1f0ba57347c420e56b99824
-- 
2.47.3

