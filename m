Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871D62F0689
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557549; cv=none; b=BQFpQ4AYKYbzY344xrhSi/J/QMtbXIPRp1q5ZSDtFEpyC0EJCxWXWCiIpr2w0bnkatTWV47oNhqr/8Ar5Ru0gdK505Daxx3ZD7PnHqt4IPFYni8uKAq3cPoT+tTAUvV8kmMZnG9+rlrewNlqiU48gQovZeJnvQP2YkmBsQFJ+dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557549; c=relaxed/simple;
	bh=72/KDI0ED0WOuGQa9wsAl7If0x4o4qq3O0o6SEkbMDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sUFVWaoVNaOXX6gS7yAHg1xR/13iXvjtHtHfGz/R2C3SaswOLr0TXCXZJrZiKB12UawipwXHajXDU8DwI+mnSLzGMvq+hgDUIMkOHKMwqItkqbCbPspZ4i3M4xMcCbmSx64+ztH1UFsyMTsJyv1uK/Xu5HiCi7dI2nfn8g7goWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/0tduY6; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/0tduY6"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b6d5b756284so937384766b.1
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 02:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557546; x=1762162346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCQDnPWqowHG59QXmb0jLVkKI2rjRu35406X3JQiDVY=;
        b=e/0tduY6L5TaebJj15ZDDFWmuYEScKb6OmhgKZmvdszRDDgf9ILGmdmiPnv9C0jCAM
         +UlADmxfS/7+ldgtOkfmuRh4aEn2WrlCIZuDBqVrJx+JseVJmnS+hFX9MXtghjpmtjSw
         YJSxeCxkG9o9U32n1oju7lUP+b0Rn231pyCZyy8vSzm2TuD2flbeBuPO9AehICBD9sGM
         K1VZOBJupVf/ZHUA+Rb/eX4Wsebhu+triPHDdIHk3s+M9zf0dt/Vv9B6q0osgL/7+g1k
         CNcT5gV9/uRViBORSi+axsQoIIWBn2cqnh3IMLSVXZqRSzZSFZyi0RO02DxE6aD01MUj
         /C3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557546; x=1762162346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCQDnPWqowHG59QXmb0jLVkKI2rjRu35406X3JQiDVY=;
        b=TM+fmOZvm8Cgdhq362+6D6VkCBlXThD6uX4vxhdTMyanB5RiwC0t+cwbYmFPAFEaMy
         +ksgVqB489pY9NDUMe7KFFmMKQyXSb+yY6+EGs19NKgUz7j2HUxglJjKjBRoPjnjP135
         pz8QVvSz6SpLFJbwnULRTRV17Y2KHh1pycIpihyAzJ4/qsL4leYfBjfq85E3wQ8BCIRr
         knJfVgndjuzaoEbEEO2n/1gnbSRsuStCeC/N7QsZuFshLm4HQza3nDFiFIbfSmNsuL8o
         Nc26DUi+AKjFyrLNDDBmDdC8HlvbE7UKHf/+61mVAFxj+bDh7YGgpbaPztTYoLmwcppY
         jTDw==
X-Forwarded-Encrypted: i=1; AJvYcCVaD/w1iH71MUhz/ODVcyegQrq9pTfpbdkBtc0V7bLc1Ra2nHh9lOJ1Ac7QujEYgVpaQbw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7YafzNJ6DLzDjuHmyoZZiF8C5ngRKqlQZENEhuU3SWeV7UsFX
	1pV+UzRrPIjcBv3TBK7VsuHanixjGAzU7Mxps/JLmepPNqRzoTLo3GLy
X-Gm-Gg: ASbGncsSD3F2nbPhTJH3chg1Bv7S/QNn1PgU87Agw/2E/HmP+CDLUIibUu9Fdclj3Ef
	jPNvnUNcYt88dM5h2kjoWqzcS2G5axIeqCgaqI7TSfzHWktaw9NSDTry6ezTXqEp3O+wzmkWVfC
	O1WrDNIYUZFu8idBETEI0JvSXIwcLACVZgR4G/AHpnaCQsJa4f+VY1uVfPBOMJ6N22ToewGxM6m
	qVzOqxZQQpQxNEAwQPzf9xmppnz/XAZxNf5SAJHW5BzXs8j4u5/L1O4ZgzqE37W+9g/qFFJBQ49
	29bvJTlSJHfrrhN2gI0/SHZo6cDmd2F+j7CvcFyHVH2JU2hmZhfFpzR1OQcxEQ7Obx22VNojyzr
	sTxhxMx/s+fSNYVG0/taNH+LIkIkNaFmaFHwppYWoPDdOE7eeI2Gkc2BYHlzl0aRLiFsN9z/plU
	DCjlxikI3giFRZlybjVPuIj3Zy7j1Jnc+4GQrkFufqj2kq7HaakONO1ByH8Cgkb0ccXDR+lFIYp
	Rjx/w==
X-Google-Smtp-Source: AGHT+IGjcZLCWHusJQ+RRTOnS62EVI4AzVgjShANu+qiEsSh8iA493hRxBFjM7nRHQfw9gIc6kKZYg==
X-Received: by 2002:a17:906:4fc4:b0:b3a:b22e:dd35 with SMTP id a640c23a62f3a-b6471d45a69mr4222583766b.2.1761557545758;
        Mon, 27 Oct 2025 02:32:25 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm5681014a12.2.2025.10.27.02.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:25 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] arm64: dts: imx8-apalis: add thermal nodes
Date: Mon, 27 Oct 2025 10:30:08 +0100
Message-ID: <20251027093133.2344267-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251027093133.2344267-1-max.oss.09@gmail.com>
References: <20251027093133.2344267-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

Add the thermal-zones and cooling-maps nodes for the PMIC device.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi  | 30 +++++++++++++++++--
 .../dts/freescale/imx8qm-apalis-v1.1.dtsi     | 10 ++++++-
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 6ebeade2ce72..686fce7443bb 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -226,6 +226,34 @@ sound-spdif {
 		spdif-out;
 	};
 
+	thermal-zones {
+		pmic-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <2000>;
+			thermal-sensors = <&tsens IMX_SC_R_PMIC_0>;
+
+			cooling-maps {
+				cooling_maps_map0: map0 {
+					trip = <&pmic_alert0>;
+				};
+			};
+
+			trips {
+				pmic_alert0: trip0 {
+					hysteresis = <2000>;
+					temperature = <110000>;
+					type = "passive";
+				};
+
+				pmic_crit0: trip1 {
+					hysteresis = <2000>;
+					temperature = <125000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	touchscreen: touchscreen {
 		compatible = "toradex,vf50-touchscreen";
 		interrupt-parent = <&lsio_gpio3>;
@@ -833,8 +861,6 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Thermal Zones */
-
 /* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
 
 /* Apalis USBH4 */
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi
index b1c3f331c4ed..8a37cbe922ac 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi
@@ -11,4 +11,12 @@ / {
 	model = "Toradex Apalis iMX8QM V1.1";
 };
 
-/* TODO: Cooling Maps */
+&cooling_maps_map0 {
+	cooling-device =
+		<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
-- 
2.42.0

