Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6163211A26
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 01:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765326; cv=none; b=aXWOMHIjXT8sNDhSNtt/iRMJu+W8ngesXtG37cKkxOY+eYAeSVEas0eVtsbcdxNBb1QAhClGqF3TVH4bd8kw+aIFn7j1wJc2C3O8IgusH468Z08aRI4Y/TNWysmF8lF64xB7YigjNP3CLIHbqUWFOeOLbETCznvCYzo1zaLfgqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765326; c=relaxed/simple;
	bh=2YD2jBYzpPEnztLRYvPwkJtYaviF9h1IlLac7IXBp0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abo0umxX9BCrF38t9U0/XXeXfh3b5fe38/9LLLjdR5dyCQ7G4s5fqRaLhdNHq7TCpyPs+1AdyAspCRm2aYF1ypZ/BQQjwIHiZhsfeoq5i8COf2kT+CE76QbXnkLW5MjzcXdtFgOB+Kw/L96Ekrd0rDykgqLIEjAmqmrFQtFx6zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVY7td+d; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVY7td+d"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476ac73c76fso62495871cf.0
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 18:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765324; x=1745370124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYDNr8z0j6kvzKO3dAyJ0NuELH4gcjDFUxtK8W/MH+0=;
        b=mVY7td+dIu5XTJ7U/udd82hwPlnSP4J+a9Fk0FifQAsZWBWOgAYTMSL+mRmrjAU92/
         DcCUU5UXv4dyhTEg08X3/WZkVcsbdD2OFg5HemQcnZUL9dRPwHlH5loIHmHgbWkV6Z2p
         hxHraoHlj6H73VHT5bBu4psLk+tnPS2cmu9v7lN5rOFs2YMn2u0ZLuuXRBvzaxs8ynCI
         b+6eoCZcFw55uizGWJsd7LIIYkjEWokjEPZK9GT4Jt+ny71O6cWNH3q573RRhFBpjM+y
         xoeroGnDeWV/y6Sz0ioTMtty/Ha51iiuzWSRne6e9JGZcwho0+eFhVHzlGc+lV3K/Nxy
         2klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765324; x=1745370124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYDNr8z0j6kvzKO3dAyJ0NuELH4gcjDFUxtK8W/MH+0=;
        b=AhnSGnncoAtxi6vSH5Gj5JkyIkP1CDydm2Gt1lETDrglaAzvpx9VXaX2E3PWr2BEwN
         4Mrpv+ZxPlbuNJXf9rpkTcO83MGSf5am8uSlDxyxwm2jbO71t9Ez2gZujyK7P3QY7s9B
         5G4QfIf4peTrVgUa61/lwPaR24eJkuBhp5viyJ1H95tMJL1N27crIpxV/t077jv/6vdL
         SRjITboIP6RKbhF3Xw/24WRYeyDkIo9P+W2QtcCwP9rHRtGi4As7nmtUOJ91hlITvGo7
         jsolGVi1/e+u5UWYdZnPylgdYtLrwkheK+aZO9YIRHJ8IakxYp+KDH3ZzlxrwHqQuZ2U
         n40A==
X-Forwarded-Encrypted: i=1; AJvYcCUXVLNQ+Da44+EXKaYUp7g8quFfY9/4vx9onhh5duuv+s1jEUDdngNFGdXMCW4ftfS0HbY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwovUwgpNlTOEXskuMGKMx+f8Lyw5S/1BhOEVnYHtMwea9EGx41
	npEv2Rc6sO7bIb0fZpYI1fdap17r81bt0XS6Ak7S2tpHt+F9ye73
X-Gm-Gg: ASbGncshAcllsHaSmAhrGC5cccBYGBtu5NuJyBPLoRHfkQzt+vmVm5EZhlmoli0uEML
	sKFHeLt6HsVLg1qfNNUkmnGpJEYRVlWjM2j4V79ogaRdwpx0LJYHXCTGb8iECYht6spcvOQRly9
	88YsK4i79akd0Nqzt2x+9UkuPpKqkOA6X6WETtDhXRIJRhv8Ib9IGcO14TUx6DkEkxiQzOgHa2B
	jq2mL/tdbhqDzadedPK5SV/ix7DBnLkdagU41PhOr+EtlrEY7tkaRRRcs2puD7OgIQW5XX6XmqE
	Wvs2gSSltO7GgrArGX8qhRMKKIVc3RNkx7EU+UlXlptu+XzwnU4epU+Z9bWHpfGlNWqY+woFsP+
	M6FWqCeO9V/fyl1Q=
X-Google-Smtp-Source: AGHT+IEepn+UeOPUMPtQ+Vo5vkRhE7eJ7bdIjEaG8YR8t+Jzk2PtaJNwLyufGdL/vXQbzGFnzLR9Qg==
X-Received: by 2002:a05:622a:18a7:b0:476:a90b:986b with SMTP id d75a77b69052e-47ad3a40319mr23332801cf.28.1744765323709;
        Tue, 15 Apr 2025 18:02:03 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:02:02 -0700 (PDT)
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
Subject: [PATCH V2 09/10] arm64: dts: imx8mn-beacon: Enable RTC interrupt and wakeup-source
Date: Tue, 15 Apr 2025 20:01:35 -0500
Message-ID: <20250416010141.1785841-9-aford173@gmail.com>
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
V2:  Update commit message. No active changes

 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index b3692b367a42..987c14d3af9d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -245,7 +245,12 @@ eeprom@50 {
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
 
@@ -365,6 +370,12 @@ MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x141
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
-- 
2.48.1

