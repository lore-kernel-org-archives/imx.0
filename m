Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D773F7E9B
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945724; cv=none; b=XQGNYq/cTBbaQw3uJQtq8jenR4UomeA6CjrlO4TS9ofa9/Br6WxLlEILfQDqEL6ksT/HIFcjCaz0dj7Iq0EW9aX0Uw1ClVv4bIulQgWcFfgXfVRgMrCviKwZiNE4C1S2immruNsuBNMEHtg7KBxesHje4au50tHSympCzLkqQoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945724; c=relaxed/simple;
	bh=IOTtpJojSI3G2ZqY5Hv+ZP40HG0ICyUBjBpabVDI79w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E61CCCNB36ph0G224+mMoVY6OVnLyppq6kloGPpEfur4Foev7h0OGv1JN8TWc+s878sRc+6CrOc7VuGTS4gsLT6f8HrdAgSs7IVcQThLShPA+LVMPJSxAHnauTk/uC6GMmDkZ55jWVELXQbqDV66aedzNxf0rfrAd372Pcf2PT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOPe+rFQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOPe+rFQ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso14048405e9.0
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945720; x=1774550520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePp2cj3QsqbKFBEYZr7yHg7hIpe6bh9vkoKNgnuo7Og=;
        b=FOPe+rFQl4hKs1TIKCTmF7yySANKqcMpuq3PKZccCOT1VZfHFMVDORykw3ulLgetvF
         mmmIGDXeSq94xZ8u23zwsCDvFXQCZQPLjKheQZhWseBgJRZfOWnf22qzDduJvM65nmnc
         7mlbXGROcRiFbxznZRUg4le19lvVQOLzOVUXBABXb/BczRmU2QBUpATclUaoYQVvf5pr
         8u+MaSYs97hN67s1SueQ360U7/cAk5cP1o/recTk62B5wmK3yjbfE/vGKGT3rLmHuzSo
         H+2UXrPBf/J0O2G8yaNVUHQxS+76Mr+R3mtzA2se2Tu65BkY1d4jwhWiVpDVfcm4P09N
         QudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945720; x=1774550520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePp2cj3QsqbKFBEYZr7yHg7hIpe6bh9vkoKNgnuo7Og=;
        b=DaRl/xGYgYEa+uW5lM9gURV0NTogQYJO98a5m5/lMFGkAet4y+TLYQVfgTmj17JTtd
         zq4rwIQ7EaNC7K6d1+Ucxfe/62zE4KN+CGP4BHNRoOTOMTm84oEsUZXrkv5vZpa6elvM
         ob7yY9HZ+dUS00pOL6Kfp07UqDsUY8oGVYrqn3aONJ6tPmSOHrcO/JJ3nFJT83STgcU/
         9S83TQXh6nBood9i5YuVvyslMTnA95nWTk0qEIvE94M41pt+sWxOSHj7EQvN3hJTxit/
         bX5jl5SZFMHiblwNRqkjjV2KVX4jqwvJOHogefXxIMswcnPlK5khKXkS9sEo/UpJdpPc
         C0VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpVLZQLLz28JbcHE9uNy2mscGw5o/qyMyTQJ3oQjOwUXXBOX52ew8e64d4/4MLsnZHq90=@lists.linux.dev
X-Gm-Message-State: AOJu0YznViNJYHBGPIx1oNnHaL7hHQHx40qnOb5KxfZYwhHhcLs+WRdY
	MWfUEL/ZGJQSnDSS7z7lyWyjG2yM9Yvz/9RmtlaZkh2MVjRtczGv3pfl
X-Gm-Gg: ATEYQzyQbvDCQtJ+Bi2+FFtZkvwHmr0y00JUIY7FgAuNJM73AEBVNaTlgzj8QuvgIGQ
	WHr3AIXCaFV/aF2VxthivvOqVcioGceSx6U4vkNIvbwwb1UBuKMaEFCJcRqp2NgFFdNWjRkUOrq
	AaxqMSGlqyRgM2B306T1FLV9+RhBaYrf9H/Kflm/KXNj3+lzPtqT/JaRr0cpxr1A/9YD6YwxX4p
	k7M1lNSsixxmcPbjOSgJtWOTQ9RlP6rLvu+9PDg+vE9koHM+fgPNt8NjjOiTc5W4yXLypNqoVlU
	I9YnKnX9rmEBiLjieAp7OhWopZezd0Jd9z4Q2URCASco4LUveXWc+1zko/H1C7GwtHNZ9/dfaeG
	MIUeQuDjq3JevCOgUwA3qoJxGa2eXTv8deuPnUVSoieaJ4SzQWDkjHnufCP0+N1Sy+15adEf8T1
	fHk23LbMgik3J3NMm/XblEOWue3aiM+tDTVHuKZpSaL4ZdU84zRR8p2uGaHXjAbmaO85Pw7X+8o
	dxrkD6YxPsCkakOJZ9ag6wuDsRfmPSF8mEATfkiVLmN1aLrUw==
X-Received: by 2002:a05:600c:5248:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-486feb5d82emr3683855e9.0.1773945720197;
        Thu, 19 Mar 2026 11:42:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:59 -0700 (PDT)
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
Subject: [PATCH v4 10/11] arm64: dts: imx8mm-var-som-symphony: Enable I2C4
Date: Thu, 19 Mar 2026 19:40:30 +0100
Message-ID: <ba867b28e52cd1ed934a988d2c9e46542992c788.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
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
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 6112e4392c59..fbad5d2d4a97 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -188,6 +188,16 @@ rtc@68 {
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
@@ -281,6 +291,20 @@ MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
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

