Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E913246AECF
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488003; cv=none; b=HuvK6HCT6UcA0qUYHEf2VWhvce3/ugJ780GVU6GJSS0GAgTLlPbF4P8/uerOXy8rrORVNibqeSfBwXR+svFwc26qybfICNrkO0O1W3rrvP9Pxs/ijWfiN7KYEmo2dvR+pQNcj381SBe46Jt9tmbGUNdVhIJB6C1kkN0seyBYK9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488003; c=relaxed/simple;
	bh=2bztmfxRC35dkpNeUlC+LLm2zp0z6m5Fiy6if2HTKc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WNO9kYFmDvXUNna+j7FPQWzMExGpfE7b2BYU/3xMpc1yIFzNl//4gKXnFwXZwscrO5lDTDgIKVT1hF9BFdv4/aR80S1qzncFTadXcZuuBZKXN3nFiTdZ8AXDvXOurKLluSn9OWWwqSmtRiuQlZ9cF2IpeADQCwLx4ol9mDSYQ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxeqvJif; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxeqvJif"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4908b92904fso73056225e9.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488000; x=1781092800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDe3rLy4zwbLWq8QIOjW3QNgCqdLF/T/ByhSBBeRxlg=;
        b=HxeqvJifkCAvBzlsyMkTa5HBsXKlXpv9wCL/hbD6azrWipF8wSmFZZfhGWc3Qrskky
         JL6dy8kMnPmCXlcOduV2OaRE7I0LwpH+VgnTOJzdbsXd8UjdIEZpRC+WSd/hS7XyjdP0
         V7U39VM1v7iNMCeeqo1OktCYFl3iLto1RGJLDp+/4rVoNNSR6NkXWh+er5BIBJ+Xpqaw
         g4RC3wfRTgY1xnBAPDvTijLEGJSv7/kRITix3b4dJpWIcKU9djA2NiY4N92TRoMz+mZO
         ON6EHh28BQHSfG7ONuFYVbKbKZIEYDiQKtmDR7h08uQSfetM7OV+QOA6rlF4fEg/K4LF
         KH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488000; x=1781092800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDe3rLy4zwbLWq8QIOjW3QNgCqdLF/T/ByhSBBeRxlg=;
        b=I+mtsYL6CTYs3ErPro4cGnxfDdZ1ASohX04KCpdEmDjo0IWQTF8vqL9qN49DEpr1Th
         wRRVydnQ1Ufro8JEJzaz+fqZFhjZfGL4ViVLOryGS+vNapfi5B/wkP2NFc4wMOuJsPo0
         wXNxv4IBfz4PevBU+FDmbJJPETT0YFRQOB436YSIC31b0mU4J+Ivc9SozCgnroPWXjyA
         moXcTpUspZ1L//Vf6uZjVJZpGnaLwkAdRsJPIXEc5jLNzGqQjshX20wq6tb4ruHIah0I
         OfHqgghwyXXGIUx5rRZ5q4reRFUQ250rp2IBXD0N0I8rje1/rJK1cTPCbUE+bo/VPZCu
         mwsw==
X-Forwarded-Encrypted: i=1; AFNElJ/IQJThlv2R7seypzHHiE2zFZvel6zBkENdVhyvLeOtYXDNcSou8PgYQQXGxxOZSvq5UgY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOx+lgRieKuqzTKioWFyLjxNCKp394bALBBSsdVnyN8mAXwBVs
	U99qXeOthDX1j3NZz/csZI72AqBDLhTzfy7HO0IyU6KuJrzeFPBh2G9J
X-Gm-Gg: Acq92OEvQ6kGihOFWS+0IgmpTyCCE16C/aqT6hfSDRR27eEG1NLpTiucvakWM1m/nX5
	XpZCKx57M/yDSKSkV8PdaNa8u+TY5x9DUN6LriBtGgRfA1as1HAgO9xeCG89FbFTsGm1wBq8eua
	vw4wuSJ9x/ZM9c76UaNrPHIb+F9FoGxIPXL3m6gS8TUJHsqvDR6OmPb8ilZmKV9ms7Npq/GyRzL
	Dy79qSiHpLcYrt/zwhHw6tts5b8i5+kaTHOZQkqXFA5rUBxaoH9pRa9dLp8rJoZJTafgIYRGmpR
	b6fF3CPWHNxAfxWAC06rn6GomQqZ7qGbaDBNxEGAIxVPZoQyTfzAvcZCnTfOYt0xFHxMhrRtRFU
	goClm08nwW0lQ03EAWC3N4WsXioIl6FhSfT9pShkQOec+gC3UxW9JBVTPSEzRY+tcbdBIwegq2d
	h1VvHAlwkbY1XxTogfRyAB0Zduk2VPhiYjIJvcG5AaNPXWyPoz0TGI6rd9x2+50IszOzKdkF+S4
	jq4WkJpcw8jvWbThR8TBByGx3ORzwCeTodzR45WWpHY9RXe
X-Received: by 2002:a05:600c:3ba9:b0:490:b072:1be6 with SMTP id 5b1f17b1804b1-490b60f6d03mr55331115e9.25.1780488000209;
        Wed, 03 Jun 2026 05:00:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.04.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:59:59 -0700 (PDT)
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
Subject: [PATCH v1 00/12] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 13:55:38 +0200
Message-ID: <cover.1780487415.git.stefano.r@variscite.com>
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

 .../dts/freescale/imx8mp-var-som-symphony.dts | 307 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 317 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

