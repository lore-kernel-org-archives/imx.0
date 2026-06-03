Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E7F48BD5F
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497462; cv=none; b=VvxL/yswMCrMuDdAPvxq8PSLhmWDpEBizVo55+jr7vgJFEhey+ZhiAM+oqTGoeZELoCPWmfH9iXZ0+DQ0vmJUB6uckBZNYq5IL7q1bESXCl/+vBqSOrjs7Juh+n452bP7P7deV/hSUIguejf1L6Isircp4CtjzRzJKXzafeBCmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497462; c=relaxed/simple;
	bh=gRX9YWvTLqFGNIkTB28dou3D98Jv5aCkUXjaYJYXU+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOmmtcKyShFyA0WsYjUG1E0NE+8JQFi7f7/cag+UKNDALYkxGEFAdR43tBz/7zcOM0jx84jXgB9hH6Koh8g4/hD6IuYTop4zPw08zCztWupNrNcaaS28tPGc/Tn8PlPBVDGPUOcp8czP0sL3BesLVMwc+A+QqABT3y1y58CUKuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOYAQcpD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOYAQcpD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso11276865e9.1
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497460; x=1781102260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3i7F1X9p+/0lWqZkki+er1i0WQJXJNWk+O9bJqudV0Q=;
        b=FOYAQcpDxzUG4/rEgKjHjvw4bXA5z7Wgq6By9DTIMmJlKvhSAJvwDB9zQb61QrfucV
         5OpA5hQzeqOPsJHIV/QkdRvS+aniKuM7G0Q6WiOeJfFNRulyNZ35JqAicmG93OSPhpkq
         yGQSMG44gHuyqwyMb5z0LTVFn1LZgrGIvlyM8I9PgygF+6yAQAWm29HArieQfIos1zJV
         ZJlU0K2dtSXdf6IdnUie76gsYQzHb2OjPgdhTQdD4I6Mrt/aPH8+425JqwrxIoIcvRpM
         JyDaEhiL+KTOYC3wWd2hw6YYUi9x/AJDKVAGelm73QBrMJlyiIEinDAIZGu0jbRfn6jN
         K0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497460; x=1781102260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3i7F1X9p+/0lWqZkki+er1i0WQJXJNWk+O9bJqudV0Q=;
        b=I/6KLHEXLiL2lw9p15jLJiuvtfWhDBl7d54BAyW/n3cUcE+UOUhnVIyq3TsFVktKub
         NPq4mGNAhocIt90bpsJ4iGONV0/7ASQPOheLRCthbM/MnP/Pd7w+bMUqPMPoHIf8xnKu
         FY1vmRvudByJKrgC0NHB2sXO5zwMPNP7GyIlmVF19HVUbwLuae316J5kwYO3ePZ5c5CJ
         0od7+qtFRmvjazXD4OVr0eB+xJA2IXYjPgUoKS7jDiQ+6/DkPu5nMbMNoq/cG2cKtqST
         6ABTh+uWcNG7Gz6Bxv07aQV/R9iLRYfIgUlSVQdMoP7fl5RrTNAkfyMcK0yQPfo0P5O7
         4w0A==
X-Forwarded-Encrypted: i=1; AFNElJ+MLCOE4HErrnCD7cS4iexN+Ph2Wie77FU5gG+ORzwFJj1eBUSlrQXAJK530UhwWKUWyNQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzS9l0KI+OHLG7NkoZTKpaVpQFqvVSKhCDpxhLE51dPra7Oow6
	a/odp5u3LhXt6ImySthO2wYP5N7xlsz6/xlF3Qg0v0fDFfimpIBQtPac
X-Gm-Gg: Acq92OGKVQfYd4RVfnarnYvn1SRmqY2TpfWe6qAiP71kE5M1+EK1fwlRX9sDPdzsa16
	zL3feIhbmvDWwrex7YlDi4PLe6YsCSS4S1yRhmoupWwnZju1cXZElqxNryZjteYnc/vpuyEa7UE
	EnX6bgPbZK+jkNyjP5LMqXadQp1zQ695aXqlayLxYMDaKqfM1E/FHv+Ot8tguCW5v/jTKVS5ARK
	dRxcxuKl8WD0Lp/YXEJ1o/FwiCauclpaZ0W2QapWIRvhKIj5NMLVpIIwbK3gdwuvn8p3bHtuiLr
	NS0UYPilT1nHzDHJ8OTNOBj/mwcjhdFF+vAmHAhIgm36YHJB9nsX1+f8ldm+iPZa1QOL25J3Al3
	p6qFt/wPZFrlD4KBXXpLkiTnCyP81O9yTrEComUtPjtw7jPlCrDbJtYuNv7taSlUxWIiskk67MM
	pewk9XJYKnIaH559Huk+oKxcTMFWwxp/lOhqyB1UsheWYK2mAe4DTk+reznVQpNA8CwXyi6lR49
	lgjEY91IO2fcNmi86ciHt3AB+tmjhpvlNK3llGM4dTHWuRbz9Z5Xx3Ptt0=
X-Received: by 2002:a05:600c:871a:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-490b5d3fd8amr66017905e9.12.1780497459695;
        Wed, 03 Jun 2026 07:37:39 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:39 -0700 (PDT)
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
Subject: [PATCH v3 12/14] arm64: dts: imx8mp-var-som-symphony: enable CAN
Date: Wed,  3 Jun 2026 16:37:19 +0200
Message-ID: <164f8be4e0c1260130c024a47739de6cc96f94c8.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the FlexCAN2 controller on the Symphony carrier board and add the
corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Add FlexCAN2 controller support

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 28424c2405cf..6b2aaf6bae07 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -106,6 +106,12 @@ &ecspi2 {
 	status = "okay";
 };
 
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -357,6 +363,13 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
 		>;
 	};
 
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART3_RXD__CAN2_TX					0x154
+			MX8MP_IOMUXC_UART3_TXD__CAN2_RX					0x154
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

