Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678184;
	b=MmSe/3vZPRfZ0ya/pT2twRB9/gW2QQwL3ozop/Poy35XFEN8UuZa/ejEVVUw+bw4VCP9
	 LMGPD266W6djUyCjkhumPrPr+KLoC+ZLuBxPjMZ7CUqAGR6OQy/4RzxU30k4p9XCCzDlL
	 6HUY8jznbK8jzMuXhcoCmWiXgoQtaTjpJhGOGOMWeyrUGk95S9voyCHbNfuYK9e7c7EDp
	 evihh4sKqBNzfcUmD/Od2e05IIAFzWo5wRqsdt29aFelptBjZSEL94bA/J7bWK+ydW69R
	 Vkd1jzyIbpvybI4M9z9gSJKK3W78O9f2rnDSK2T6YEDjvFlJIGGMEwWPKTAlmfvahQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ao/tRbZr32qcHB0KVI6iOR1WFXceFhMkLS8qN8SkWO0=;
	b=iNtIehPjnL9v1Q4sT0fBP+D9EPom1h8u02x2jap2eNRoXZwn1s/oq2ASbtGpAUDy8cz5
	 BF4fojdKWjDtxg4gj4qZU/YGzpd3HPP+T/dD4O6CiNXFtLk3o5NT0OQt5jP8/eWsy/9qT
	 oTT0qb3SgY2sqkINr4aNeRD19XyktvFJY9kKLP/NJZdzSnGAjI/Bp2wgJ/FdtZnoA2g/B
	 QTcb4OMpWfnbvDESia/Ysl3hCz+Mb1lb+ix3DiBPLklazSIHIiL7uF9RAr6hupvr7l7yj
	 z73+HlRcD+OB1OnAZ2BIKrs/+a3JGH0tqAGsuNMQ03z7AFeEv8H/nVtooqFRyYSZSCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CbDtWxPn;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EE560A261B
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EE560A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CbDtWxPn
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso5607805e9.1
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678183; x=1793282983; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ao/tRbZr32qcHB0KVI6iOR1WFXceFhMkLS8qN8SkWO0=;
        b=CbDtWxPnfBDtYHpIJ1ZOA0myEqGUFgSNQMXE7mij112wzVvcIXlkc79JFBoyf1p+lF
         MED3gRm6O3wD7NA+M5+ujcqlyh0sELmMO4AhCQKMfwtaUOHwkijqyXvP8Oa3FALGwiIl
         KBVImYef/X6h5cC3jp1QxT2yOcssUXSb4LEvqb7ADivm0P/APUEQbmdUpG4gsSCAqrz9
         SCscVtY6pvicJ4EyoFWWseamvnmTAjU+WiMtBUd6u9CogIOcwS/1TSREqDys/NDq/aEi
         mgslz0tHPGswAnE2s+p/eatCYO+0jKuKh/II+rSXu6UIrPqtJ4ieq9DDd+A+xZHV8pTe
         KP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678183; x=1793282983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ao/tRbZr32qcHB0KVI6iOR1WFXceFhMkLS8qN8SkWO0=;
        b=dGjOdzkBSi5yH73lyfYmQLYWeML8QOTFRF4iBj6CNVxTvqeChS9W9MQTKT9RmwKifr
         hL843p+HVGBxhC5iobrW34MKfWy2hcOxJsJPoykB4bQa28gkobn5XcPA+/uG1Q8xcnkO
         bH0h/+5PEmGXBSLOCI0LkitvxZJFluHK/ngZ1GlEo8AxOMiHZCml7a55hGViFQ415Yy0
         qSfXbLGDigivtvIGutE8aKvwgFtr3cRn+GIk/dnVHlgwO57H8mE7UxoWegkF5UUy8PZ8
         LTLUFnCv1AhRVIow8UvI179D6ALOXXVEFk95g4alZPa/F8hJQuGFZwxu66JsobImfyO6
         t9ZA==
X-Gm-Message-State: AFq9FYIuP8AsBGqquVxTvVshjwAdsj0hPWXK05W+FjHJcSIB9tX23lBa
	PtvMplawKim/htlXzZM7Pr9recbpIAYjosF9YrL6hXp+fsBUsVnG51R9
X-Gm-Gg: AYBFou2tJ0NLcKQZPkZDhyIfJVknKQWrroIZPX++JRKMtNZmtAwv0tS7LYCRT+KidmS
	p+rGlPIJSaoDn7fud2bQreDPo39ZWy2SqE/gMXKAy17Lvw14bfx0Qqq5GoXyjATZorGX1bzvaV1
	LIx0YJr9b0KHMGl4mPiVDRgRTUaDl3Ddf2ocwLiod+YOECUzfF0QcK85Uen8P5wpwT4MqfyR4nt
	5UrT51GKrXk7iGzDskan0u4yYT1tBrcbefkWF9fz/fkcStIF4PpmKLRZk/ylfzO62w3+lLqxJy2
	J58SDweKCVkF2BmTgeQYyfcPncRd4g8IS2F6aV57y+7/yoSYZzE2ubmlH8/aL+Ei/9k8MGTeGgR
	cISKE941Mc70bPzs23ze77lzbiADy4Xvkmq7xzD7M0zUFSw60kLQCNHR2Ar9LwLGnaOW7ixseIe
	gG0DoH82c0+D3kKHaiez7aNszuYsuYwsaCKLDnocmDfIXXKsoqy2r0d3Gx6oiYxQ02naN4adXTd
	1B0ohrt/Y6it23rHJNqtvRaIVI0+nTQ8zqcMurHFMDCLfHUIpGFEOOeTk9MPqKv/jU2iXwaSBKb
	qumnjL6v285EqSlddrMdv1qq46bS1PRPdYyz1ofLjRX4MZeuesD3f7c=
X-Received: by 2002:a05:600c:1c09:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a1fdafd654mr107712815e9.14.1792678182521;
        Thu, 22 Oct 2026 07:09:42 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:42 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:35 +0200
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx95-verdin: Add Cortex-M7
 UART_4 overlay
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-imx95-overlays-v2-3-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M7 firmware. Label it uart_mcu
so the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Verdin iMX95 Development Board device tree to provide
a ready-to-use DTB for the WiFi SoM variant. Firmware must configure
the UART and its pads for the intended MCU application.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile          | 3 +++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 5ee9fa583515..f957797d90a6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -982,12 +982,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
index 72e7f1e88409..9aa4e8b23ceb 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
@@ -526,7 +526,7 @@ &lpuart1 {
 };
 
 /* Verdin UART_4 */
-&lpuart2 {
+uart_mcu: &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 };

-- 
2.43.0

