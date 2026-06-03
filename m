Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3A247277D
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488006; cv=none; b=CAU45jKkbgDYadxk76y/mvV/7IDPAypJzGYGz09Gs6U1wpRqw5jACoWz2kDe//XXMWUPlIl2r11PWKjW2i8g3EYvEaEQPgQ+3yHERcMk0kERDb+iLX9K5wH6szj3NQWGNTyy6k/uVr0DwI0HUl3GDM0SlES4RUvyYKeAXhVA/sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488006; c=relaxed/simple;
	bh=fNiGoUSJqSEmhz+n3sgUNFoIYqnWXFryu5rSRIxkBEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcN8pK4Xl6t9EArtiWBJMsFmHDVQWh1A37MaegpLzNhDOhc3rdK8+r1kk7tWspSZFPEvY2Gm0pDwfokHZwF3nUGCW+E956iTOH0xfE/UNEzaOJsUVviJbBNuf7jXMS61VzXp7zdy4zntxEg72QCzf0rj7W/2m+Dj4GUPsrHN3To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2ewrdzj; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2ewrdzj"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eee266c6cso4878140f8f.1
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488003; x=1781092803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mk1r/Chz5tySwG2DZgKv8FwEIvhKShhxz5WRxEuPP38=;
        b=R2ewrdzjIQ9a01wYU3sNrA0ENf4iqaxkZduNlHo0tqmWQIGSI8ICpKO3pdu2p/s8sB
         6m8GuVbV7bxL9KwPNaI3Ar+OCGDe9gIHgFeTkA1zuilJUfLYoJstAQFjk76lIVNSpCrY
         5N6bZVlN8qfHxpKgSvJVXWuIZ3Y2u65RdCSeeFuYbkPYe7lQ0Pc6/DrYdIvdeCYq28T5
         jxKlhBo3ZNG0PID4dhiPw7/BHIIm55wo+wNMFmi0MXCeYQOobAQixyzrEW+H9dxUiWdK
         FaeZdPwINo8XGLN7F2lyML0+YkIs0rkD8p3fG+paHqiC9BMNNbxe1wn03t98ROwZR2UD
         eSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488003; x=1781092803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mk1r/Chz5tySwG2DZgKv8FwEIvhKShhxz5WRxEuPP38=;
        b=fMB7RNoJu+vfPhDXP/ErzQGYU1Hgmc0MxYM+cZfoWHwh0gUeJfr8ISVOBM7bhkuBoz
         HEWJCk1D1Vkjv383D47npW0Pk5E3UnnhiCQgwc4wDAfMbFJlHEI9MKXiKYtBXluDoEaE
         jaMm0RZ+qaRhcPcUDxlZGf+M5kvUWezOZYVa+gHhCs09K08S+OgD0s2j+PRTQUyXv10R
         LMSrPnnoNSpkQksFOuejKLb+cg3kNAHTng67jXHWg5FkQvHg4cq9VjRs/gLbG8lxl3ri
         V3XschHKOEsleY+MIU/Wb9NcjFPl5ThYUnCDqULEYN7J/aRVy3P1OirKJJmW3fsX9zvT
         e1jw==
X-Forwarded-Encrypted: i=1; AFNElJ+BexdRuVqndPfB1GODMZGW2qxAwB4T6Rw8f1irR63RQOzW+PLtNkuEwx4ddbP7BdTQg/8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaKsYBk2gU2swY6NadfCTh5ouDYfOu5FS+Y7fdE3h/jK995Xiw
	s0FpzFT3mtprwqctEwri4tvIbTn3buiK0Pcu+uvK1H7Uu71e1sHPdWMb
X-Gm-Gg: Acq92OFQYYHqjuQpyzic2gHXBa3WdzwxLJkClyCUWUnngdbNKQk/St0GTkVy+Saf5FF
	oNTmwm4Rkq5X97RC1i5AL94GNiL+GFx+VODVRHBEiTtawSB4xFlbjTH9A+9a4ryKy1OrgycVlfK
	LAToVnVCS9LI/cmxJpCK2bJEGQ+/4cyl7OoSEkxRRHs9/RymGUV72erbiJ42mPbsyxZGpSx9kR1
	YHDqUJSgRNlBrr/KgBbTtPAFaZx7CEApqyRH2Igy7iLpUeG8XfQHcBBOqSK/qLW/HyT6YjMSz5e
	YS49kOfQBhqLyJIl3gQQrjRV3bVEq47vHZLdCXkUepVzfhQjBS0bZ4+sYujx81wBI8ZQqbgKxqb
	rXdQrFSapA4ro1Knf4AashS6HbQCA8V9Aawu4TdOhpxmAKdY0AcyN/d1JzGWPxcYeyrzIQz8Knx
	R8vGZ5wJflRusZ6b1o3zR0Yvss6BnQNOl+owyIlMRGfAj7Lat5Io/0jECUmBfBsmr9VQmXvUlWE
	43VWmNuCzdLYSAGIFRS/PpKgPw5Zql32qzfWB5N2zSTzc3QhJNVqfbpEzQ=
X-Received: by 2002:adf:e014:0:20b0:452:11f9:bc40 with SMTP id ffacd0b85a97d-460218abd41mr3075579f8f.2.1780488003205;
        Wed, 03 Jun 2026 05:00:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:02 -0700 (PDT)
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
Subject: [PATCH v1 03/12] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Wed,  3 Jun 2026 13:55:41 +0200
Message-ID: <4bc5e9bb6c7e136113dd59afc6ae44be2c8c30d8.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index de1b8b842848..935bc71b6ee1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -116,6 +116,31 @@ typec_dr_sw: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	pinctrl-2 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -201,6 +226,20 @@ MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x1c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-- 
2.47.3

