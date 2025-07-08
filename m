Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EAC2E3717
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 12:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978036; cv=none; b=JDeKvZ0ERHn+NhLtP7Nm3Fx9lZPMbdpI4hbtp4gpZ0lR3+sq0bqHg8sXmUYt0CJNpVcGg44h2qX8M15b+/ZpETCKHrYNNFnSmQrk4fmSwOjzt8As54tPsdu+y0WAkMcVNOPAFpo40r1atIUk4rXKKBFwDcqu/qnhyHQNZJb2AKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978036; c=relaxed/simple;
	bh=Q3tJWIilQ0iJY5+kliXfDSnxi36CekbAmJqE7zcWYeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q0QKT0bJZbNDNUIh1jexLYJb/DQZGNqPcaTbUhkLATSkn548zfgE2dCcYhNYuNUPp8FPATs94w2OXJ2BgvAvsfL+ujNQHlQ0CBfchpjvm5rEqkqZJ7dTu5mTOLE+OHQlEzMYlfzMuiF8WbCJPpvHND1amELKD+r/Ecgw0+3ygq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=TNRJk09U; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="TNRJk09U"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 975D2C74C1;
	Tue,  8 Jul 2025 14:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1751977608; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Rp56DHgQi9XN3i0LEDzYAoCZSiBnN1Rn4E3S+pjit7M=;
	b=TNRJk09U9t0QZ+9wGXAay+FMGk2pHDadpBKz+mFUBbZ96kue5imLy3YG9iEstvxPpOgAgR
	mnJLm2VlWrhPPpQm2qbk7Ny+j+guPm5op7yoqsSkauRMg+UYxd5VyNtwTZpIqILcFtGsOd
	82NHEfCOi9c9QSxd/07vNsreHn4ylPJtQljwyAOot0rTTtVkA5Z+/lGBz4KZQjuS5MWoe2
	q9QkYUVJSjgnDyYejT7blpVEabjWONQuMfvhAanN0FuU7TAaOlpm/jq+HaRX7GJvbWZAkw
	UY0Pnzl0NRv9xQsrhbxEFD+OcxnKRMUeA0K8QHotUkDeExATzpZll8jfnb6lPw==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH] ARM: dts: imx6ul-kontron-bl-common: Fix RTS polarity for RS485 interface
Date: Tue,  8 Jul 2025 14:24:41 +0200
Message-ID: <20250708122442.53829-1-frieder@fris.de>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Annette Kobou <annette.kobou@kontron.de>

The polarity of the DE signal of the transceiver is active-high for
sending. Therefore rs485-rts-active-low is wrong and needs to be
removed to make RS485 transmissions work.

Signed-off-by: Annette Kobou <annette.kobou@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Fixes: 1ea4b76cdfde ("ARM: dts: imx6ul-kontron-n6310: Add Kontron i.MX6UL N6310 SoM and boards")
---
 arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
index 29d2f86d5e34a..f4c45e964daf8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
@@ -168,7 +168,6 @@ &uart2 {
 	pinctrl-0 = <&pinctrl_uart2>;
 	linux,rs485-enabled-at-boot-time;
 	rs485-rx-during-tx;
-	rs485-rts-active-low;
 	uart-has-rtscts;
 	status = "okay";
 };
-- 
2.50.0

