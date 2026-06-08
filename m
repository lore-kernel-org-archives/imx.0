Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1F23BFAFA
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913379; cv=none; b=mJKs7fSUnKj/gSkW+KsrNwyabyk6SdpVUlzLsaMHfwqT8vDGSZUR7+Htexa5PcT4L1i3oFhin+7XVdNR5XhIFK+56hBgBxOINzZQwK6wq3J31pNlj71omXqq5r6UMVOjTHGj0ZMPt7TWJ9ozgFAk0KzxF/Q1eCJlZ/k3ueZ2P0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913379; c=relaxed/simple;
	bh=9EHqG1xL2evbdMdVoRmlB61K/kkPe59jVtYVBRRzyAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZ+Sr5tx2aHpDj2MTHf4e+HJ6XwLVofuUtX9BEya8AxWDlqNEsu2Nlyl4TL15bTY9Rreakp4zKtTPSxrqDAH9+5nOKVnD2lQ6lfLCikf7ErJajwU3YCGqoahfGJqkvtqnMJ/YZde0hgkEE+pkX60AWEPt+FWahR1WYVDQypQw0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVng2QMj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVng2QMj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso2914975e9.1
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913376; x=1781518176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8fz5rrixxcXBSE5i7ASUW+eSqUQor3TCtORJAa6UrU=;
        b=GVng2QMjKmsKleRqK/1WTARlqxSwnKrhJ1X+uA+9ZCd7qZCxFG9YIfkf2WeycP7AEt
         uq5rRC83wipBMzO9Kwoe9F46t0hJGuuxexr7QyYBc81tf1Trc3WLlyM5zTq+nZXo+W0w
         I4Zl653qmoNq6ZEfUwTGr4d2u7rv4oxsykFxr5dTHiETEb7RKtY2+G5FFv5y/EVM5sRB
         /GA6RW5nv4s7snNZVzM/Wa+zIKHS6Jk67MjWu1lI75AYZXoWfLt0F8wUE6wD20fUnZUG
         EtQujfsZXbG7yZAs+Cx59UemmJcHrEzL/6e/Fj2U6GH3UH4/O9yyj5srUDN1gNhodQjS
         ZRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913376; x=1781518176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8fz5rrixxcXBSE5i7ASUW+eSqUQor3TCtORJAa6UrU=;
        b=F5ma83mb3XWAUtiInohswzdhVq3iB2k+A4Zc/hnxANuFSw3Yh+Vh30xs15Bq+A1Akt
         qD/vgoIMMFwJ28TYaMD3+hsi5IK5g10VcxBbhC3ZNYTVzrdHrUss62U5ctrx0MZU8/F8
         ni8w/n2jTx1HmczZPQJibDfxqzJVD1/i2fKLcaQsgzQiyVs0AbY2pAHMIQHAnN1xksal
         nbFH4srw+fxcAnNzS4TBShOPK4t8VZQgsMt8+kE2ASOn0XJALgbCFONOQiSjKe2jqxMX
         1GTGThd7Jgu4OF/vCRTmeZYxySVtYi4WnlcGRsgTjTZ/Oey/8QcMEzJG7hEd7ZYFm+ry
         4usg==
X-Forwarded-Encrypted: i=1; AFNElJ/b2dBDi9VwTJyYIrl6VKMSdvismysyRksu2eIdxbVuARFGKnB24bU1c8xLBwrK6VMuQzw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws7IGbpWlIvaYxQHOE0EPbQajQqw55ZWG9VTkLXSBaJS1uQ9tM
	ElX9XuA18JHkkXpakRlvXLGKsY8RPbs5WUernb7bLPQuTTBa03iHRdZ9
X-Gm-Gg: Acq92OEimS3mvO+6Yhd3XyjuyXIv58x0HHX+IkP2ADmcNFvlVPzX95r82ughLBvUW+O
	rGvYEOODV46qe22sRtvm7wO12iDOlPQPVtVIAlV9PrcE7zx3inN4tbYCc8spHNOPZfUI7+Uulfh
	J2MQCZJs2la8IwnCQByJGCI04GI/nVNtb7rv4grcmhp1/So1zXo2YBpK6at6dKn0q+bNqrWDRMN
	Q3CFKYwiwamZT9M7m17r2yyCprDfWnlq/q+CM7R4yfpq1GzYZQ86n1cnzjJQymoI8q6hRjs/57T
	ZJzvbUh5e2tFqkj0TSWhY/+05UEyVKCbcKyCjdeON1cAIIzje0tULZDNLLm7kFkrvDhspGO5sJr
	oLIgFz5YNkyg5vdo8e7pAw+HylLhXPZLFWvFoztATQ1vFH6+Bq+j8smJgxy7KP1ahlC98IlgG/t
	aptTfby5OXecVHq4tFbITPnweQHw0N5vw7UU7K9zyW1OTNVo8rVyvndUS30H2PWrEB0DVqwbeda
	VyHtyqroie+ZNMmq73AtkY9cdvpslgHm1aYb2vnIeClgi1b
X-Received: by 2002:a05:600c:8183:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-490c25c6625mr215034015e9.25.1780913375963;
        Mon, 08 Jun 2026 03:09:35 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:35 -0700 (PDT)
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
Subject: [PATCH v4 00/14] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Mon,  8 Jun 2026 12:09:18 +0200
Message-ID: <cover.1780912893.git.stefano.r@variscite.com>
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

v3->v4:
 - Fixed USB irq edge type
 - Add HDMI HPD support
 - Add pcie reset-gpios instead of deprecated one
 - Fixed eth regulator

v2->v3:
 - Add FlexCAN2 controller support
 - Add FEC controller and MaxLinear MXL86110 PHY support
 - Describe PCIe PERST# reset GPIO

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline
 - Adjust PCIe controller configuration
 - Update PTN5150 interrupt trigger type

Stefano Radaelli (14):
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
  arm64: dts: imx8mp-var-som-symphony: enable CAN
  arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
  arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs

 .../dts/freescale/imx8mp-var-som-symphony.dts | 397 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 407 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

