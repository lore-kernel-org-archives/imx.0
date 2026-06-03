Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA2B480DF5
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492377; cv=none; b=pTWK8mNFH2jWkjK3e7Zu2TiJCJbtDDkUOn/WlGkfsPI089T3ZjWUgKdkKdpQFuB8zJ3ouYUTtUqxNPzYvvndCnM+FB3fJ5VO3vJsptqXNDJ76HBY8cYSWkvg+DjkS0Slmpx6AmAOSNFwbqxgfhfRiC1EbOJ3Tq75Cj1wyG6j1N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492377; c=relaxed/simple;
	bh=q6dVCecc3xFS4uYzPfiBGStAnjlKRWR3BwOU/5cBW3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CunP/YmyySvbq46SXATVgoSQdDo8ZiMn3kADQPv1u/fz8IE7GuTZuX7SHpvKuOEY5/Ay2i2gPOrSMPIQx39Us2+YHJ2opNcPjOGfvL1cFMLPSprnWWsVDxkjTSLYbsQAKb6VPGPKB/JAEAhJFmGNTL8yyRHh3eXRslwzawKa6lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Si4PlkI+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Si4PlkI+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef616daf6so5244640f8f.3
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492374; x=1781097174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UVpggI6/ihWC+nmbcQ6eFom0q7lhdlvWvI95TJ5lCfk=;
        b=Si4PlkI+QESAkZMPm18AmTFNIsvM8GoStlulXVDa76o9hJy8iOVBhMtyORJhrxxSgF
         U/LSoHaDtfwec8O6GuW2hRlSdy6LSwYw0REzAhcnCLLXx06KFQxQqBZWrpuCNs6WYe+a
         7WLuo8qHrCG5LFe+7RW8aRnW8vHjZDbMlNRRl9a6IYZFBf//9iSQHF7OEMMjPdPI00g/
         dxlAMPC56Bd4vCqG6I1zMJDsjB1dx2BCxZcSsa3zDuHC3n4l3UMVby5DCedLxE0leNcH
         I5o9QVbM8DpQ+GplG96MTzFAiQo18x5BMjvmxvGKYTSRaAogbg1c7TI2XQBypTnaDb1/
         jw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492374; x=1781097174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVpggI6/ihWC+nmbcQ6eFom0q7lhdlvWvI95TJ5lCfk=;
        b=PsrZ1Cc9VwN1mVZcOv5oR0OaE5lsS/Rz7uWXsN+2dYKFynN4zG/PBfIAK7L6GkI4L/
         cyCBJRALE24XXlJfi2dfD+o0uOnqRLUT85a69yDnGT44u1J2Q1+/082L5yI8dJgxTt2M
         xY902nnO/4+iQsF/MfPmb0PMRRob4XZFtI7l18IuCyhyvBDHqTsMca2wzEtYSk0EBFIb
         GuBoReTasdKg1uk3BbAf3SpQZp/6aBm9O28ruGh3IhfvXgfur77JVqwngv1N6kvaf1qh
         dACRCIOJ6N1LGGhHil6gfWKcy1JfXYnRReU+7Y3sXNKCKJdppi8TIxNvOqa616zQerGF
         /Gug==
X-Forwarded-Encrypted: i=1; AFNElJ+2Dg6r5dfk6G0dWne2bie4C2g1CS4CH5C7715Yk/8ThoEwiWmBp4J1HSOPw/RemrYunN0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdfPkICOEWIO7HV1Ahcs1SxWORrvPXp+2n8IBYNdEHDPyeLfWJ
	fS85G3EzkJIc+jNboDFrtkn1FXtLBncE/pDyJt1J/T+swiTei27vwUHm9Ef57w==
X-Gm-Gg: Acq92OFRnGrKi5NJUChR931HJB1XiXgsFPFnpI1fBVb3Rj7ykPfSNjWFRL8nfr5xWmT
	k/3lSFdeSnPPtnyEAodepXENPu2Fax5D4EIUda+4YcPu2rErajWkH9cFE75SXarpR6JSgKVtGzK
	Q3Ho1GM4NwxaRBe0dAGPa/1sinujCEPqqG1Kazjyi0PumXMM0Boqz49a58kREJ6BoMYfgyWwttK
	y8jUzGP4MwVp6PfIE9lbjSFnejxXKJwztXDEtOqQMJ4cK0CAzubrKZpXQrTxvsuMT5HFW/nnN3s
	7DWJg/rgia3ix5jg39CqHULdFSeBlJyRTtRK8dnOKu7jZ8YkIDDkImQcUUB+5RbXAGuMmKYXbVn
	TbUZBySBqrCi4aJoW+jYgwSW90swjtbO5Ll0Wt+KD9T4j/UAlXzWE3MRUp7Dd0FwO0J6BMvgwE+
	0Jvspuhdoby58kEsM5FDIszD7guVY3knV4z8vrhYn/rZLbqcbhgeS0hCfwkWu/v5YHZH/s1Yg9E
	iIW6GZcbPqq6QQre0cHk0nkaqHZNNe1uCZ1qU10xcXirb5F
X-Received: by 2002:a5d:5710:0:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-46021844ce7mr3696351f8f.25.1780492373927;
        Wed, 03 Jun 2026 06:12:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:53 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 00/12] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 15:12:38 +0200
Message-ID: <cover.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the i.MX8MP VAR-SOM and Symphony device trees to
better align them with the current hardware configuration.

It adds the missing board peripherals and completes the related pinctrl,
GPIO and bus configuration.

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline
 - Adjust PCIe controller configuration
 - Update PTN5150 interrupt trigger type

Stefano Radaelli (12):
  arm64: dts: imx8mp-var-som-symphony: add input keys
  arm64: dts: imx8mp-var-som-symphony: enable USB support
  arm64: dts: imx8mp-var-som-symphony: add TPM support
  arm64: dts: imx8mp-var-som-symphony: add external RTC
  arm64: dts: imx8mp-var-som-symphony: enable header UARTs
  arm64: dts: imx8mp-var-som-symphony: enable PCIe
  arm64: dts: imx8mp-var-som-symphony: add HDMI support
  arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
  arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
  arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx8mp-var-som-symphony: enable PWM1
  arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs

 .../dts/freescale/imx8mp-var-som-symphony.dts | 320 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 330 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

