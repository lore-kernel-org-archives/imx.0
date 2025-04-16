Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA18212B3A
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 01:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765329; cv=none; b=IbSWPIqJEgiwrX8fJ2GjpN07AvPkoNyt/cv6MHQfw4/a6XG+KuwIEbhg91zeoMV4s4fSbyhMi+Pdy7eRg0b3Nrke+Vs+E5ZpfmPYNChRO1rpUUVRaROtv9yqKpUfnCgisWNlEjxIkbDKFc5BLaKB/QjRXeuNyB46TFihYvdslL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765329; c=relaxed/simple;
	bh=a/39nf79uBuqznjc8lRDd/vjaADz9shNA9MfxIkl6Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seXFbUaLGou/C+oSURLk6cYOEUOzku/+XUzyZJ5XrcJsRgllt6qemHcZ03D/11H/rN1sPJ8GuzVQ0pxqzHr3441nxB8VRYpLr7zbcFeuKvLghyvXnMIpzzo2PRbOXyemQnw6l6k2F9g1RRoh+hxaB4FjUzmPTPehNPg9WBX7g5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaLgOKAZ; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaLgOKAZ"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4774ce422easo64021261cf.1
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 18:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765326; x=1745370126; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOP+Xk7g3usaXB8DY5qKgeIjsWqmRpi7//9PYTGo7zo=;
        b=HaLgOKAZ4aStP0WFwwjbhmFzf3owxha0PLcsMtvtW5ctvPMk3dyi1kszkzeJlayNQE
         ZQip2gFlGX6+X8ySSYroHKyAHONyBz1z84DAeM2Ac+iEqNZ7Joim0+0NT4yHwWs5PLh6
         MJedebIk5kWhUVKbFViJRy63aRa2nOABmF/G4ua/2lde3T93w0aDQ42AmI6JnNg2pDKc
         UioCiTywyN8REmbyCN5MPIbZsale1Mql6PwQrMqcYjrQdBB1ISDhpRiPL15NMKhCdFmw
         MMJ+kWHg6o21CDKuDhjIp7yLiq/4wZ58+iNxwBfSEKXuVnwhiRblsCrjDbH3fbsxJ2F0
         Y02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765326; x=1745370126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOP+Xk7g3usaXB8DY5qKgeIjsWqmRpi7//9PYTGo7zo=;
        b=DmFgzNVGieTvI2+WDS4kwIDmrHjUYpulY8SwIhe3EG7dDj+BWzi5zut+3nl2H4wWGC
         bYdvhdtZRaItL2UZmEnxfG4fpE0NNI46/3wnIWyT8xbeFjV/XhkKvn0L40af20BT0pnk
         a14mUkvtxLCrWGWIjwTtulqw60qd3TNhWY8TV4PnKqNvPabrBMxyYKZKwXMYDMO8GrGi
         YMC5jcDWWxoIctmZnepI25R8x7CKSCcH89DHlhUZYxmEBoKTQVWTPRcLG2SMXnAZZIWb
         n56dCIQGBThovuMKnEeY87RBJFsFNHWlm419y5VUi/K+vT2+Zc6luuHwy5miE+1nsuAW
         j7EA==
X-Forwarded-Encrypted: i=1; AJvYcCVpq+V73HAcjJ7e+a1eDUkgl7fJhQdlKxdA+BjPpWpyHK5i+fsrHExIYeokvil38Mp3w58=@lists.linux.dev
X-Gm-Message-State: AOJu0YxynTn8s39gRBHg6Hytsh5iLeUE2SOyKjFlh2km1efPKfYum/S9
	w+MuSl0ina9N9ykr1a6sOhFh2/LU+Of3nKD5H6VBui+FYKJq4+9j
X-Gm-Gg: ASbGncvtGBitoxAlfPAeVFbOWXE1+FDE5368KhHaGEOGwoKXjt6Ll1lzX2LFrNCMP2G
	KV3kYKRbXuMujwszkrZoZEa2FlK2y69mRF0e55DW4zwclh3oZ7RBASgE41wTn/S4/WQ4/r2ToMZ
	/MTvH5r3ZSwInLlKb1jW1YDzE3KH6sBDR8G2kbTityd2ewxE+PirC7pfX3piJ+qP7w50xEi8TYy
	vB1Wb8tAKjUUr2+t/n5q2I8Fa9vVcONukpsuj6L1DSp1MeIxCxc6riv3bjpQ+zIOTJgeWalSYjK
	pQbew025++hb50s8iRV8CHM1/QHCMAcqOxPLkkqMR0ffasvKkVsSPVrIwfIoZ/30axAhI29TY18
	fWo6TRgIe9z+T2dg0uHZsVJvE+Q==
X-Google-Smtp-Source: AGHT+IEDuQm9Q9+u2jWvi1Km6PvJSKi5AhyyT3K/6Ng/ENPnCAb53xcfqp0yjXnII20xvajqm5l6NQ==
X-Received: by 2002:ac8:59c6:0:b0:477:41fa:1120 with SMTP id d75a77b69052e-47ad3a1d777mr19903451cf.12.1744765326454;
        Tue, 15 Apr 2025 18:02:06 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:02:06 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 10/10] arm64: dts: imx8mp-beacon: Enable RTC interrupt and wakeup-source
Date: Tue, 15 Apr 2025 20:01:36 -0500
Message-ID: <20250416010141.1785841-10-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the interrupts and wakeup-source to allow the external RTC to be
used as an alarm.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  New to series

 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 88561df70d03..6a62cb32e22e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -257,7 +257,12 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 		quartz-load-femtofarads = <12500>;
+		wakeup-source;
 	};
 };
 
@@ -382,6 +387,12 @@ MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x40
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13	0x1d0
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
-- 
2.48.1

