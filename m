Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572371;
	b=MaYHUfB53mZ54NRvYWk2SGml+El4UxG3aF416JGQeZ/YPK9iFwb9rCqgsYOleMVMrQUc
	 PRJoxrhhMtX+HCvhmMGhA1S1VlAOjxIiak3JFBds4LJy1gdT87VbJ2BoDP/rJjYqBAOOj
	 54UiMTWtGAsGUIHnLtcalWHGpd0scF7SsqoVU5BM6TzzqDy2w06ISdp/zcVzWxzHZQb62
	 3XeoPlQn4anLghqpmU3mRPKUTP84oaMP6rhdK62iYuMSkjXO+o9Ro+7chBVUPwq89+MHJ
	 xU76v7MlkF5YND9B2CCZ6ezUY5ZGbF3hkpwvj7rMzEQpopLYdqdfdV6vBUzqcx0xFXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cYjE70VK9dQOuYVSDX1vCeqjSSE/jR55HkQy4/7ye/I=;
	b=R30LQpk/s72EhpNyTiIp2nzEyEeSG336F1WnxynOFFBDVdpeFpBm9k4pdk6TzGeVHeKR
	 WEhfTAQxf+zHwgtWdeUqHgWxEkgyYv5gnQAdo/o6L8+5tCmuHs1JlKSCThI7IQDQjx3cU
	 7l6BFLinKkyMDgatvkvGaQXO5eHVNfhQOSiaLjrOWzhE22LW3LGWuYWq5aUC1lxUNlh70
	 C93mLf+e4kRmKNMzh37mY7sQnPW/Q9D+YkY2ba0+t3kWPfL5ofW94MbnBdfjoH9ThaMO7
	 oFULN7N8eTigG7uYj07rAJBuEcyP0ZcgdtlW7lDPFQp1DqZDWSiWPgp4OZgTmGm+LBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="DtxR/0Ij";
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9439A606A32A
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 08:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9439A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DtxR/0Ij
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06210b29fso173759b3a.1
        for <imx@lists.linux.dev>; Wed, 21 Oct 2026 01:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792572370; x=1793177170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYjE70VK9dQOuYVSDX1vCeqjSSE/jR55HkQy4/7ye/I=;
        b=DtxR/0IjVpWuoIatFhI1jf7BcjN9KRBipFDWHBCO6+EltVWtdVw/+FVYAmXGQl16iJ
         DePS6snW5YadToIm+kuSyDorhBdj1D4ppmeoe1X3LxiP4WgQ2O2BHH/AXeD/GJ+beQFV
         Dly1D4OXVkjcMsrQG8YKDwG/tZUh0X83K3Q70KPAtjKo0Jc40G2YIDqfq1ADxZEZYPE+
         NjdRbTWMGZWcoz+0ZB9/Dy7nvigVH7lY2Cf8WtPQbvuBMH2NmodVlcLJcCFSmwAW575v
         i4gNIxhNhs7EJLrjuwMGRHs0lq0wBvdhguIaOIX3wqGFQ8G4K43ImaapL3ld05CKLpY8
         z6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572370; x=1793177170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYjE70VK9dQOuYVSDX1vCeqjSSE/jR55HkQy4/7ye/I=;
        b=aDBqMs6uohmQ7rUvs9W4rd6MJTBYYIFI+8NjrM2GItCMkJ+sMbFG1ZSOcOVDeONSof
         QgPQAuSZ85OXCcikw4JrrSAfJJ6+raiover5B+7PdfM82ky3lNkQjgQ5tziMi2s2nbUK
         Sv5JWSkiLDQe5q5MJnKQ7hjClyHI4AO0DYQBqUNHyphH7LZXtHxyFbl/TOywJElPcG9x
         McK4tjmWJ2/P20C87NDPVHoBQuJxiTZEPPij1K/KLP5Y4Bo6c5FNwKPm2Cifcq3GXasl
         eeLALNJXstLNuaM2UKZbAv9S8VTgS708y9YGUVNjkZD3cC9E8DxQyvODmRHgS0JF1DDW
         CL+A==
X-Forwarded-Encrypted: i=1; AKwUvBzpnWTUlN62knvoYyo3ZtXej8JzwfQHwwJ484Izs+iZb+JGeqZeny6S4mq8R3cPZvHE8pw=@lists.linux.dev
X-Gm-Message-State: AFq9FYKAGwhRfNwEMrakG+OTF7OzpnasvL98uGKNI7SjcwDkIcxvsBfV
	u2A9xqb+pU0JsML9NcvTLcjbqdYWXkxkYGWxXGnw8qb7rcSSTCvKL2XA
X-Gm-Gg: AYBFou1cuj1tiDVBqF+00QyQt7NGFL5AtSGNmiqB4guy7sDNwI4s+jqAFpS34TN0MHp
	KT2LS8+Y8iJ2ZTlPoaJC/xK9Z+wLY0yiIFmF4skx5CzFMRRc0nB8vgg9Rbc8hrqUK/UvmbbX7B9
	xmdnKiw94f4ybFulcxCCMG7RhnOI1bP6f+RJHHs5gky8oPVQ5ZUXpNc7dbr5oIg9oGtTYEekynx
	zjjeW9swLa3kijNoSxXEL4InFqv7kA05ss19+kGMiq6stemKiWznLZYHMx5D+I6GPvAUzrUOM84
	e4bc6pAV/yTCMIzsJGsiaO6T90vEGBOenB9h9IR1YiUnxNxskiHjboK24MmuUDxORhFQO75m8K5
	ABsu+0xIpubXB6OZu/PIxTy8vssV9K8i+qxAE8+yMWv5Q7Zug7i81Al7Jx/NvNE/cV2fnKLACwD
	j6+eHFXttWg9fbeKzVn9kIRgYhmnoNIG9RwixAemGr9+qEaA/X0hYOetH8kwXsZyrrgBDrh6m3T
	5sferFsu1iPUuW8yR57zWjdYsnlQTvp9V2+Q3HEQZcTU8a1Q7W069aHNNcJ5oNojffx1lvnBlKr
	XlddDsI=
X-Received: by 2002:aa7:8887:0:b0:89f:129a:9590 with SMTP id d2e1a72fcca58-8a089ebacf3mr1029844b3a.48.1792572369847;
        Wed, 21 Oct 2026 01:46:09 -0700 (PDT)
Received: from FLK-B04Q314.global.tektronix.net ([87.58.102.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895c08c8sm604998b3a.25.2026.10.21.01.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:46:09 -0700 (PDT)
From: Krzysztof Kaszubski <sympthicode@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kaszubski <simpthicode@gmail.com>
Subject: [PATCH] ARM: dts: imx7ulp: add "tpm6" pwm node to i.MX7ULP
Date: Wed, 21 Oct 2026 10:45:59 +0200
Message-ID: <20261021084602.121087-1-sympthicode@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kaszubski <simpthicode@gmail.com>

Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
node to the i.MX 7ULP device tree.

TPM6 is located in the Application Domain (Cortex-A7) at base
address 0x40a10000. This enables PWM and timer support for
peripherals connected to this domain, such as display backlight
controllers.

Signed-off-by: Krzysztof Kaszubski <simpthicode@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 39e37ae9b2b1..f5ec5e9d65de 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -216,6 +216,16 @@ tpm5: tpm@40260000 {
 			clock-names = "ipg", "per";
 		};
 
+		tpm6: pwm@40a10000 {
+			compatible = "fsl,imx7ulp-pwm";
+			reg = <0x40a10000 0x1000>;
+			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
+			clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		usbotg1: usb@40330000 {
 			compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb", "fsl,imx27-usb";
 			reg = <0x40330000 0x200>;
-- 
2.43.0

