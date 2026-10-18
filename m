Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C35049B459
	for <imx@lists.linux.dev>; Sun, 18 Oct 2026 12:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326774; cv=none; b=czGyIFMP9Ab5mdXeoWFnoxmKr3d0V/Zqf7Xx8aTKf5CU2m3cv85oIWra0w6wdUF5uziBWjLb8rT4vvWnAjQczf9q+wAqlji8YUwiAHVFaMhKVq/kVA+lB/4m80VGUKlMkwSVSp8oeNkoiPQ6w8C1Kxdkk3aWX4OQghNd4BwwJT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326774; c=relaxed/simple;
	bh=sDeH5Aa/6RVXWRKxDt4y6WTi40kVY22vaLdAcItynqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlwloFS2g86mji5WIehhDHPt5dWx8cY/egjJyzQbMLDIVauIY54vaYYq6EeTKDlNj9Qg+U2O9rjS2yj3Z/ELYj0956KdZaQ41PpGFDPNQttfqZ7mPk3xTdeoGt9ohmDmLMOvvTWGVTj2RrcQpQr7eGUH/htHGhMsWLINOAOEZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtJZ+XyH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtJZ+XyH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e1dade31so2634855e9.3
        for <imx@lists.linux.dev>; Sun, 18 Oct 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326771; x=1792931571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=le/7ZMUGNW/GaIhf/O4ysG6KC+WhTS8gzrqG1Rpguic=;
        b=RtJZ+XyHsTJsRaAwa6isJkqYoAaxrKKNxNHWyGXTl08zLd9uhbdPlUsItP/QJG1+kU
         ENW6O5EeLfQn9yiedGJ1MrGWQmquT+zoweBDGSMHGnw+nIvrpBRpJQe210Sf//OxV1T4
         9EzhZpgX7nQfMSItI6/cjvDULcDA1sFO/aSqElZMPc3/0kffK+BHuWoCQFiedeQn+XCd
         99VhKtqd0u9a3HH3LkeMQHszFN4qIkfbcXJtJbKowv4zP9yrT11ccZ9vsCHY1KowRhgJ
         3T55G3GYDBZiqPKI06tUz7uZBIKybxh1KmQGtLMi5SOy0sf9P70IQN90NScYwoqkeQui
         mIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326771; x=1792931571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=le/7ZMUGNW/GaIhf/O4ysG6KC+WhTS8gzrqG1Rpguic=;
        b=IUfpb8nmspEo+uorpLKPaED0FEH5e6oB2ksmiANhQfm6L2Y/qDAe7HO3B1SU0ZOZfE
         6uWaw03t1UkeQwq4lejNthDuVachYeFiRsFo4RoAn63NoQ8FboOPPibJSkxCH3iDs/7L
         4MAtvzGRm4r94Mml6cKGDvHpe4So0Rbo3Ky3gI5x0VBBAJqNDTkwJb+SUSUBWBbQs10h
         V3YYKw8tSIbiTndAuTAwZOmw/dF9muiuSarytkGn/THbpmdmSbFzMtCbaUV50KdiULmM
         MTGCuzGWVWFhznIKsOaCkh8XmODnHOFVB6d16Z/DCVXrVDtNbB2qRaHoTFCpPmznMpI0
         yEVg==
X-Forwarded-Encrypted: i=1; AKwUvByVuEXQhoPP7bjTvbeUfggzdR7ZwHFxCZ+kWLanXNn+2RgWjt8KLDwiFHNRALlhvAXAOa8=@lists.linux.dev
X-Gm-Message-State: AFq9FYIwsgoEEQoafsEaEQYOv9ltXdlb3LjH3f+oqnx6nHg4VTSscFwm
	CdT4awwIld7GN7Dicic55haAiCmzjpd6r9Mqf6NF2A90NVVlFBKyopQs
X-Gm-Gg: AYBFou3OewLcXOu0qAeur/P6jN1QM5uez/r4VnN433RyCzfdM+zeuzRrzh/Jy2ZBlHQ
	mxpZips4h2XukiplZBs5Ilx6Haz1ojMiBXF4rf+XpCWLTAjaIP9oCFHz5jTAjr1nFNnotLqhDhr
	XQhTiEhHeNqANIMgbiVDCcLYAYz0a5ZBB4/nNC80Q2uZyHfpIKVyCzZ3zaU2W+FSK9gfOPuuIt1
	BRSWpa5q3n/q/SEW2tXsHO0ZZYgbQgRsqiYKfI6JvPcVFDVlx1LEyfC6AvhhfC3kz7qxYZpAYeO
	E+wR2RgDHwlXHIqr3OZBctXiWrpsG1qw4qeUrMuvB6ycj9phzKTVwbsgybwkz1hJ3U4gFMP7gVD
	8DiLTgaVWsMR3bJE54Pk6nByMNj0oxwBznyBPAEJWcf04UVvWLw92Zb31mZ4FE8PuqrA7nxpriR
	4oIOZQMqMPtSH/5JEs/VzxmMTCW1tDaxsUGv5K2ljchr5PHrZrEUjlZsf3J3S1CX3UUpibSJUva
	D4V8nbnzF4FP607dGqgHEeHoyzCxqO29CQ8EDq3X7dhwnyQ+k1YNenMVkQmzATlyCVmzYRez/KG
	TP4XoMGcq3lUxqFGpgqYog==
X-Received: by 2002:a05:600c:4e8a:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a1d7630cf8mr109051655e9.33.1792326771289;
        Sun, 18 Oct 2026 05:32:51 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:50 -0700 (PDT)
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
Subject: [PATCH v1 4/4] arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:27 +0200
Message-ID: <ec5fdbdf55d25cdcb756d16709a7011d5bbea9b4.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the SCL and SDA GPIOs used for LPI2C1 and LPI2C5 bus recovery
as open drain to match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 409c7e74ffe3..1f0954620195 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -210,8 +210,8 @@ &lpi2c1 {
 	pinctrl-0 = <&pinctrl_lpi2c1>;
 	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
-	scl-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pcal6408: gpio@21 {
@@ -265,8 +265,8 @@ &lpi2c5 {
 	pinctrl-0 = <&pinctrl_lpi2c5>;
 	pinctrl-1 = <&pinctrl_lpi2c5_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c5_gpio>;
-	scl-gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio2 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pca9534: gpio@20 {
-- 
2.47.3

