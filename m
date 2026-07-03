Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4757381E81
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068383; cv=none; b=uptg8lgO/I8VscmSap8GcwE1fioUTFMY6phmOrmEmFu++um2ym+IVuXlleKrLgPnR84U9+Tk3B1jaiiq/fJkJVpdMqXsfiZPv7c6v9K5sycAZiv5OHy0XxYNzyMP9KhODM8CVm0k4GLxMGjBMiHza2vsI/Aq3fOMtjZIr1/fNqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068383; c=relaxed/simple;
	bh=M4TjwNnnExGF2NSAafTC2CjfSzRsgpBd9vrEbOOROvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFmKIvrYSdoO9DajAdKTYhBnNYEOC0KU3Db9AMVKv2+3OQCmIME+p6oaip+V616QCOCPNGWLv8DcLB8ujTLYIM4Fs7xjiBgUEK/PPg3SaANdVRYZMUdHkmk58KFZfgZD79np963Ej4aOn+PcoQAZmfUXUVLBK09j4hO4rhxVi3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZI8dmLj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZI8dmLj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493be1b9564so1984605e9.2
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068380; x=1783673180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYlLFsClo+FRePFneV/AibXEv418FTJ0Zt+d/hHSJLs=;
        b=hZI8dmLjuMoUhwbk51Rt0VlOd8onvlVTkOip05P5W3YhUd5I4hBPg2XBrmx3BaunV4
         C6GMCW592ARjAcPnfiDP5rZcfOUp2Y04HxOZUO0DAp7BxXLVEt2YS8QT8eXsZbcxvw+G
         f03HFlcdxYC6Ym3M5PhV7YYTZN9AtV+hRpD2y80oaAp50WaLkqhSAnO64LThUXbVabCK
         iab4QxEcFdYVtW8WXTSp/qFqtJQgymcAtycfYWZWQraYwXewRjkcij2H1HWe+f8GYVNG
         oVGHxIaWMAQbfJs4h3U1z1KTFmmDEXnfG8Be3Ev8YHnsX7+8y+dc5OfSHDetop3SGlP6
         jFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068380; x=1783673180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYlLFsClo+FRePFneV/AibXEv418FTJ0Zt+d/hHSJLs=;
        b=SDg4T/73GRdCC6f4LhySd/raPVVsTF9jGFVJru/g/GvetRi5+OMrTVLe8ql1PPcLns
         bbUYIvknI6OC8MJJYXqkFtlNwmgizJrOKTL2lF4ZWxlcx952CeA+yxCaBKkZuj6qCoR8
         mQpWZQJSVb6PTSqh4jaZ1tdJGQf4Ryly0nS7zqqBlQTz6lQWnI+5sMVW1q2XAerXqIkm
         mam4aHiXRNRLKfRo8MFddW9sUTdUWqB0PT+WnVnZ+pA19aEDNMmL7NeGsFSsZ4mvRKaZ
         6QbTk7XJOZNEKiA1klC1gomffrFECInYRld4TguzPV58Juy2+WV/U1ZaEGqFvoZ73VGv
         +krA==
X-Forwarded-Encrypted: i=1; AFNElJ/yjFhfdezRbldaybDK6oqJux1ws3HGLli3BcCByVawliKR+fJqY3tbYpehrIdx5PFgn+4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxkCBOOp5N9c/NB3D3hr1LPGscAIzNAGDbUAmrTyhlyMeM6J7D
	E0ygpVWIZlWdAXpXzScjVdm3KFxqPnpkSYyyxMyqmfKuwRwu2uMEBikxdu9p0A==
X-Gm-Gg: AfdE7cmiUbo1wr8eQVaF/MqK/tV1/uZ7GybrS5sNO+nOlCLfwnFzv3rzQyGRLle5huD
	yjMA/AQl5eowXysSo0WWG5mM4SMUaVCOo8e2CJed6UNhh7W0tJp14txO+7fFozxV2gkUhdarVGk
	t3ylfZVx05HELbQDSjmEhtoMS/gwaXbRnFDNLO2ANxthFXp9LOHULYCZLhoCWx4jEMPhl9ssxAm
	HwXBLj/9h9AlhzQ4Akk4eG/Zk4cxzQR6QiUutky+jKwcowDyTjOdAoqH3Duo1WuvSPn5oVv/kZW
	zOzs1XM+l+mV2YnLmeWckIBuXgfTYMZDH4Gzt5t3rSd3cWp0y2W1R/03dYeidyZrEceKsg5GEx9
	qGekhRcGEu++Ly9GtHtV8dcVJ30jNXbTzJ8WHig1gE+4vDpP9+2QqswMug0TrHLbQWB3UYSAd/P
	J0IYTrkoCW0VllUoRwK03D3PYhRA09/HOBQBzp7yChem6Cx2BA6yze5Y001jWorJO43pKzMtrAZ
	BV2clVKckvksJZUvW8BqZWEZQ==
X-Received: by 2002:a05:600c:8183:b0:492:1e36:1fe9 with SMTP id 5b1f17b1804b1-493c3df34d3mr108791735e9.37.1783068379993;
        Fri, 03 Jul 2026 01:46:19 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:19 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 11/15] arm64: dts: imx8mn-var-som-symphony: Enable I2C4
Date: Fri,  3 Jul 2026 10:45:58 +0200
Message-ID: <92d57a1af29af4b2e25d654bf7379cd96e3e5128.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
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
 .../dts/freescale/imx8mn-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 7d016ed5e911..4898018f030c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -195,6 +195,16 @@ rtc@68 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
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
@@ -262,6 +272,20 @@ MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
 		>;
 	};
 
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_GPIO5_IO20	0x1c3
+			MX8MN_IOMUXC_I2C4_SDA_GPIO5_IO21	0x1c3
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c3
+			MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x16
-- 
2.47.3

