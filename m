Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA7F43C06B
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 19:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827133; cv=none; b=J4C4OezXkZx9shBv3vn2XlTSb7uASSmycBKJdY8kjgy/FVOCQKZIOLE/fG/L1NPRSbnDbVmoDa+sotoCQMgUTnTQOmKwYOz6kV4E36Hzcf6Gv2hH8nFi1uYJ/1IrRJE80G6VjcXVYgvJK0zei2Glr8WYVF7j87viqYZfmQlzwAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827133; c=relaxed/simple;
	bh=BA9cogNYcNoWcdmou1Wz18kgD+Qk/UIO8+CaouQp908=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNnxvAtuqzdHJCuOA2Knw7kW1xiCZ817VIjHHg1EET34ih2ls93vfsADaKwfDOIN0JRecC8wYJweSEwdNCQ6zU6On9I7+qJZ7ruPPvMXeCzxRCQujetm1EBpLIirUCJa4au7mX+tQ13RybmJLlBNYldyZE4ekI0Wif9E4pOHj2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4hYoMTs; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4hYoMTs"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso115285e9.0
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 11:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827130; x=1773431930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opNBN+DL1CwCTEmCmfQVU04W6S+7jcXxdGJnG1le+IA=;
        b=I4hYoMTsc0d6COFm5F0t5CceC31CPj8+fv5mo0wxvdlAS7LQejf8zWRDRKMvllUd6P
         zlMt0QZZ3US9y/VpDdI8zAaAlrn+06ZcytIGkbGCl5jZA2wkERkhGvUnoTJQMDrrUjrh
         jiE7s8Jp40kNeJQzhtm18Ikp85CZhUWvFxpzhCVy61XA9AfDb7b5YZwImqz6+7fL4bGa
         H9Ibo3Bb7k2vLV973d5bIRhXPy2ksiPM4UJJm896pYts6nSg5TvQWrEjo1PyBM7VwyAg
         M2ZrJhYIot0j6vTe4jSpOkQhdUpTOvuyYtxLzd150WtLxIWJJjaiDrDVRwg/MaqbArC7
         2TWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827130; x=1773431930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opNBN+DL1CwCTEmCmfQVU04W6S+7jcXxdGJnG1le+IA=;
        b=QAgSzuwrn3VvitQf0QRNKU9acM7X8UkoYACLdsQC/1YEmDBHLYtGk3tJemSw/mlSnT
         krAo9UhZgQ7UyQpocyRH12B7E7v6nzFh/Zm7f36+x3cu2JS/P1Vu2EWWEME8mBlXf97j
         r6wkaOHCBT7C1mhJEMpiFzCsoOsGhNDbTkmYKDkbbPjWXmWdELedFVmP8TzJfmfpO8JI
         jG0Z+JClJfTyqW1HFdKy0j0qH25R4JnlorE5fb8vxbjlku3/ZI9xN95HBjrX4DoZmIcb
         msddI9sjdyDsyJHJCJ8MtE2DUYgOfhXCTavmdpaNQ7MR31xi88u1PohQguslUYPKJl4z
         n8CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSIyNsbFUtsEBUZRbrKChZAaIPyc1a3Jw7Z30cQWaYpUL+aySYBVWTCLXi5nZ/tMfMW1k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPSDeKXWjMqQB/xK5MlTQNdxCTGBrWGjsFv7t5AMrFKDdzhJQg
	c9fD9Ah1oYUzsS4ecYcoZ3vjJZ9PsweX84d6ls1s604YUCkaetcz8LND
X-Gm-Gg: ATEYQzy3oImU7bzqgRO4Q1e44AlT/E0CCyoSM/35iPWYruTMzsoClGU/w2F50URFT9w
	nz0llmMpge8ieCtvOohGEKFkpBEb5jV0KIcFsgovBkTe0cDu7sITH6B0ebbjEAO452FO7RKvHCp
	2Y1AKkiQDv5EtliXGxNQqo4bkIOsNv4Opbe2Zto3ZLBiATsfpvBElA1w1k5ms9jwTNfw2bByOFe
	7LrufifV6Z4aqiyAeRbjCpyolDi6JKPbVt6NH04kupzlnWO95mNf6hJ2wZE+hwM6S3y43icf9mK
	RYRBVST04J79Vxb5SsOdx9J6hX2snlJ0aJqy3w40bl8is4UcF6zl2gp51iU+MwhnzR9n4EzbY02
	VQTauDmNv8txUpjG+sjoWtUBzB0ZBLfQ78BVn2omRfZNKleLxQ3rPnDJShoYS9X6bmfL92PzN3T
	6p86uX4VthrSBGpDipmgfFre6EosAs4/5079noxtC13bSFj+e9xLJerlGCQ03yZEkFwXz6cWmMZ
	CM8GVeTJauiUMLheWGND/Xq8LtwMH2GXJRyLis=
X-Received: by 2002:a05:600c:4f0d:b0:483:5a29:9678 with SMTP id 5b1f17b1804b1-4852691967bmr59464725e9.2.1772827130125;
        Fri, 06 Mar 2026 11:58:50 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:49 -0800 (PST)
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
Subject: [PATCH v2 10/11] arm64: dts: imx8mm-var-som-symphony: Enable I2C4
Date: Fri,  6 Mar 2026 20:58:29 +0100
Message-ID: <02dcc47d59674a9945ade8a6f2c42f4c0908942d.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable I2C4 on the Symphony carrier and add pinctrl configuration,
including GPIO-based bus recovery support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index a77085b264e5..9a29c81b06eb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -195,6 +195,16 @@ rtc@68 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -288,6 +298,20 @@ MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_GPIO5_IO20	0x1c3
+			MX8MM_IOMUXC_I2C4_SDA_GPIO5_IO21	0x1c3
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x16
-- 
2.47.3

