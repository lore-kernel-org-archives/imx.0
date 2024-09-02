Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2EB1D67A1
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725277257; cv=none; b=mH4BWp6jf6dFeWFQCJwqYiTcOCWCvmCLttBY8XQWq+ysjFIOfntd53iwiR1iXXIr+oJDBqcW40HQTVFJwjR3VswmNMV1DD8y3L/FAA6O9qpq7WLAO74WfVPu6C2NmXFP/FOgM9ROquKdqAE/rvyqJU3YfhQBv3CK8wzHFgjfCDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725277257; c=relaxed/simple;
	bh=vspvOoNdVly/5eQ+t11qHO7HcxpjaE+0iVeN2RnyGgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ku4tLB0MCLko1XbYiieJG7WrM5E/TGce1eF8Vdxcs7mQYYXBBRMTsdnSsSafax477H8D5tYWLfBy9dQ8CcVHs44BUBr1uk+ofdkhCE+Pj46ww8khKH4TlwDgzTJx5dPNQFG3UMuYDCcrioGTnz+QJ/64kqmPN4WN73442XYHN3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P2N78vpP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P2N78vpP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42bbd555541so4013175e9.3
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 04:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725277254; x=1725882054; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlxRgWvov1H8lxO/fm3fj5hhJfhOr1NrSPagnMvIdDk=;
        b=P2N78vpPQFB/pWaWUiJq6wXou/Xj+TUNOHsXTlH3qkpyr6gwO7cNO7NsKDa6VjAtEV
         z55A6gE63Uu5CDKmdrm5w2r/fk/bP10Jv1zvuJaDJcGwMeMwZdNJEu1PBkTbyUyCUI0l
         wG3wySv9+jcuFweNAeoS0HdxKzjbSx1xRrHpmY6M/ULkESRU77ncB5db1FFnCt+b6J0F
         8R8wQaTRgTzf4AJOOtgbO3J0FkbKrLeQeGA8sk34SbpmpUWg8/CMYFAuAIuATxwf2Z73
         IxR8jHCM/4BIcUmcBqzFsYbELHJ1/TLKMCueZZZKi0xfSniyGY6pftjRqKGW8QEWXTjd
         NTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725277254; x=1725882054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlxRgWvov1H8lxO/fm3fj5hhJfhOr1NrSPagnMvIdDk=;
        b=tXnOwuYoE9JYsEWp75iQIW/6FsfyOUOw7ikpoHHtExKkLBFwUxSJ6USlNeLk8KyEqs
         PztNeX0bshcwWobznMSBuzu7vehfzvT6vnSMIxJroTc8XD6FzdOMt4Xab4dwaq0XCyAo
         DAhquFKEXBRCBLcfbFqVb7HlMpwTEzZEk/yopWePclCtsUtfUfwcnWsWTMwuSaZAv3j7
         bZoAHIIqj2NcRMhBEHnSHOuSLoq/Gr6lhVCv2H/e4BzCpVi6R14DWw1EkzdvjzpRiu5G
         lzTiawT/FA53liA84V6vvjUv80ZgoYjmyPrtkv5b0SBN1EJijGGcZ5pyXbHjvWQcRCSh
         MTWA==
X-Forwarded-Encrypted: i=1; AJvYcCUnY3ekZT26QHUWnA5y761s/etCdpXq9gSrZFGf322mb/QxlPwiE1dCmPYT0sSdzvrp0a4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOeEbJTvGVKyqUp/yfxnbqY55SUGmZqnrgW8r7oIRCjc3mfGI8
	/vj+Ej2OcsxK9NfKoM7S9IIDzMO50L9XSakrRL6zo7UgZvnq/d355V4FG5tkfPCrlvyrIjHu5fx
	WLW4=
X-Google-Smtp-Source: AGHT+IGDw9b1EKKQm7fVcfvOX6mAYqU+l1DBIVuR249Lu2PCBh0n0ZTZBLjlXLeqAzGqE/3DIswjXg==
X-Received: by 2002:a05:600c:1d1d:b0:427:9f71:16ba with SMTP id 5b1f17b1804b1-42bbb44756dmr41304825e9.5.1725277253737;
        Mon, 02 Sep 2024 04:40:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm171515245e9.47.2024.09.02.04.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 04:40:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 02 Sep 2024 13:40:39 +0200
Subject: [PATCH v2 3/4] ARM: dts: imx6sl: align pin config nodes with
 bindings
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-dts-nxp-imx6-pinctrl-v2-3-ab8196baa07a@linaro.org>
References: <20240902-dts-nxp-imx6-pinctrl-v2-0-ab8196baa07a@linaro.org>
In-Reply-To: <20240902-dts-nxp-imx6-pinctrl-v2-0-ab8196baa07a@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3663;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vspvOoNdVly/5eQ+t11qHO7HcxpjaE+0iVeN2RnyGgg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm1aQ943Z66/XLNzcY4DU7uas55eZEZHBR+kh+n
 kAnokvyiZSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtWkPQAKCRDBN2bmhouD
 191QD/4pOhiHuEpyUPzLV4is/ssO3vHa99gFA10mfJOzliNQcYx2CGC6M6PLsa3kpzd2953H2yS
 ljuADbkX7OvIqbHeKGfkc+dI2T8xCBUcApCyBCIC/L/aFtlRlguc8YbRGcmfoC/3ILKQXIdqsWW
 fYi6I3Kuf+5tY/q+TXWPtYppBe5SpTbVLfGJfqfLxfUSdnzq4PJjhcl5AgaC/8FFNOJI5mVmZ3K
 q3dzet9DA3iktwAqkBsjOXt9Vd8bE09wLFR8rZnZVDUp2po+IW3ADsdLXYo+Dmup6uZ1S5LeVdO
 hVXNRRjkWn0mgvM/LCbBM7N5F4i+AfVKyHjUkfvY1U9V68nADrao1E3cCAm6ksRCmVWV3jjDpSo
 uL1EGKWiID7rHKOirNLSyOCtdoNrikMcHi1dn5Gu0JBSDF73CDsiPakOnftu6pLomQT3emQEmNt
 nYS0HGa+0U+H/q5s/M6WMUbOAWR0ze6eCd0t/QYi80yAYNx3LeFMH3GAVljjTe/3VgqWRtFvpjA
 HApEOJNSpkfI0+JXGRlavbKGXQjg5KBR0EaNyZ6VF+RAuD/FhWUAgdeYj2N1hdAbleFI78b6W0l
 UY5LcW4ShEDEcSabN1Yy17qgGFC7/RQNmFrKpBaSjulZY+gsAYgeydJ1GumN/lcVWXQoDHkWsCH
 WwFrQcGV9p9nuZg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Bindings for other NXP pin controllers expect pin configuration nodes in
pinctrl to match certain naming, so adjust these as well, even though
their bindings are not yet in dtschema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts  | 12 ++++++------
 arch/arm/boot/dts/nxp/imx/imx6sl-warp.dts |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
index 31eee0419af7..7c899291ab0d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
@@ -457,7 +457,7 @@ MX6SL_PAD_SD1_DAT7__SD1_DATA7		0x17059
 			>;
 		};
 
-		pinctrl_usdhc1_100mhz: usdhc1grp100mhz {
+		pinctrl_usdhc1_100mhz: usdhc1-100mhz-grp {
 			fsl,pins = <
 				MX6SL_PAD_SD1_CMD__SD1_CMD		0x170b9
 				MX6SL_PAD_SD1_CLK__SD1_CLK		0x100b9
@@ -472,7 +472,7 @@ MX6SL_PAD_SD1_DAT7__SD1_DATA7		0x170b9
 			>;
 		};
 
-		pinctrl_usdhc1_200mhz: usdhc1grp200mhz {
+		pinctrl_usdhc1_200mhz: usdhc1-200mhz-grp {
 			fsl,pins = <
 				MX6SL_PAD_SD1_CMD__SD1_CMD		0x170f9
 				MX6SL_PAD_SD1_CLK__SD1_CLK		0x100f9
@@ -498,7 +498,7 @@ MX6SL_PAD_SD2_DAT3__SD2_DATA3		0x17059
 			>;
 		};
 
-		pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
+		pinctrl_usdhc2_100mhz: usdhc2-100mhz-grp {
 			fsl,pins = <
 				MX6SL_PAD_SD2_CMD__SD2_CMD		0x170b9
 				MX6SL_PAD_SD2_CLK__SD2_CLK		0x100b9
@@ -509,7 +509,7 @@ MX6SL_PAD_SD2_DAT3__SD2_DATA3		0x170b9
 			>;
 		};
 
-		pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
+		pinctrl_usdhc2_200mhz: usdhc2-200mhz-grp {
 			fsl,pins = <
 				MX6SL_PAD_SD2_CMD__SD2_CMD		0x170f9
 				MX6SL_PAD_SD2_CLK__SD2_CLK		0x100f9
@@ -531,7 +531,7 @@ MX6SL_PAD_SD3_DAT3__SD3_DATA3		0x17059
 			>;
 		};
 
-		pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
+		pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
 			fsl,pins = <
 				MX6SL_PAD_SD3_CMD__SD3_CMD		0x170b9
 				MX6SL_PAD_SD3_CLK__SD3_CLK		0x100b9
@@ -542,7 +542,7 @@ MX6SL_PAD_SD3_DAT3__SD3_DATA3		0x170b9
 			>;
 		};
 
-		pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
+		pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
 			fsl,pins = <
 				MX6SL_PAD_SD3_CMD__SD3_CMD		0x170f9
 				MX6SL_PAD_SD3_CLK__SD3_CLK		0x100f9
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-warp.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-warp.dts
index 9d7c8884892a..2545c0fe47c8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-warp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-warp.dts
@@ -166,7 +166,7 @@ MX6SL_PAD_SD2_RST__SD2_RESET		0x417059
 			>;
 		};
 
-		pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
+		pinctrl_usdhc2_100mhz: usdhc2-100mhz-grp {
 			fsl,pins = <
 				MX6SL_PAD_SD2_CMD__SD2_CMD		0x4170b9
 				MX6SL_PAD_SD2_CLK__SD2_CLK		0x4100b9
@@ -182,7 +182,7 @@ MX6SL_PAD_SD2_RST__SD2_RESET		0x4170b9
 			>;
 		};
 
-		pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
+		pinctrl_usdhc2_200mhz: usdhc2-200mhz-grp {
 			fsl,pins = <
 				MX6SL_PAD_SD2_CMD__SD2_CMD		0x4170f9
 				MX6SL_PAD_SD2_CLK__SD2_CLK		0x4100f9
@@ -209,7 +209,7 @@ MX6SL_PAD_SD3_DAT3__SD3_DATA3		0x417059
 			>;
 		};
 
-		pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
+		pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
 			fsl,pins = <
 				MX6SL_PAD_SD3_CMD__SD3_CMD		0x4170b9
 				MX6SL_PAD_SD3_CLK__SD3_CLK		0x4100b9
@@ -220,7 +220,7 @@ MX6SL_PAD_SD3_DAT3__SD3_DATA3		0x4170b9
 			>;
 		};
 
-		pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
+		pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
 			fsl,pins = <
 				MX6SL_PAD_SD3_CMD__SD3_CMD		0x4170f9
 				MX6SL_PAD_SD3_CLK__SD3_CLK		0x4100f9

-- 
2.43.0

