Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690979;
	b=ndciMYFE3XHSHpee8x6JoVPTtrPVZBW2wc5+eJjTZr0gJvxtkxO5LVKO4rCJnX8/pTsD
	 sHxpF81mg981Ix9dzo7ueZ77WHSMYw5V6+ot3bmRkXxYsoHqrrakEqdPYCLtigTfBq07l
	 QX29ldJwx3XLV1IXQ9ldCB5oJ1oGIu46OMuBQcXwjVEtP/W8T0EtK6x6w5q7bv8R7FrxC
	 iCUyQJWt34H7l5BvvFKg1u+082sQyFKPL4YeiWaw8XIWyx599ysQagRDWhyDumOiugrzT
	 GnRC55fyT9DjNzzE1SLRk1Yj/ZDmB6VmNB9KIqNTpdYHjd1+VB+NxxVXAY1xN0xAU9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690979;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2fB2d9MyTQF7jCP81vybIK9pxCDJJ95bED8R+qvM5f4=;
	b=vmKPWNw6Pq/E3mx4S7/OZw8I4SgGlJazRQF/aN4MP2eOJY/tvVkam7Npeb0hHonNDvJl
	 1Vu9Jry2HFMBy7mXAZd3tVUW/xNk+zvkHTkCUsRqF2ejm0cVKKii75aNOLgEOhWXmbQsQ
	 ykDKeuvhTw+C0swt6mfItbs1wGgYvNzoZgtliPRTCCFdTmmXtGwfl4nmZvpkShkRg31Aq
	 J7joJ6tLaWAU4wwk1DX0FZbU/zhb5bDMcYO8D7XCfq5wRFNUSCLH0fqH3E2dybCrSR/SF
	 SnZkGWE7RQr+d1VaMuD1brkBySZAKvjnOHo4bTvNBTRev9ykBjraV2lTE0WWIC7sWaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=dFyto6uz;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F8606A33A
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 11:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE0F8606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=dFyto6uz
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xWXFa-00000003rRN-2IM5
	for imx@lists.linux.dev;
	Thu, 26 Nov 2026 12:02:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=2fB2d9MyTQF7jCP81vybIK9pxCDJJ95bED8R+qvM5f4=; t=1795690970; x=1796900570; 
	b=dFyto6uzRo8fIx4qiNeg0Ykfr/R8uIrHGuY9XQrkE/qmLsdJRiL0WqzHQ1cVKnL3fSCj6YGrpkw
	7YPHu0M+4KYupRs8GIsB68g7AQ9zt6QE3bDFvPlRZqPvfJv8+KULe4gW0/n+tb8URnQ56pVyP7gjI
	zy856BjAWD/ypl0e1IeSRNvU+Z6b0VY4owO08GBAq0RjJMPopnMQOjG5+uQQdwDX5EObyYI4dBztU
	wvi6hlh6sUtTV7fsDRUre98ArD38LeKZ/hLNDk/tuCd7fUxjKpbOaA8Jj0cBoVncN2KviEe9pdAcv
	b2jplu8Y8mQOGFl6O4q/bEDdH+fppzwCWsFw==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Thu, 26 Nov 2026 12:00:56 +0100
Subject: [PATCH v2 3/3] ARM: dts: imx: kobo-clarahd: Use 32K clock for the
 timer
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
Message-Id: <20261126-imx6-idlestop-v2-3-c6987e7a392f@kemnade.info>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
In-Reply-To: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux@yoavmoshe.com, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=TE2zpYr7D6tueCqMdj/GlDbIYgtArbHlYHvdQ6KtMC4=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrCBHACZkPmg2RebgXVzb9oxwY7kNO9vpCvk9e4
 DI9TVXITWqJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawgRwAAKCRCEYUX6QCjc
 8eZQD/0e8M6REzMmZyyXSvymM+PQe/nS/UjoGIOIEB9BallaCRMqYC77PF7vxvFHyKK8Kq77idi
 8uFehEYpLVt8dN1uYiCNiffj/97d5Klj5chOspRgIlIsBhgFPUXYFeaKJk4bPgtvfRBVu8K4zgy
 YXYgNYsKDnC5nfGJtHSJQAHdD+GxEh1v9g6MQvnnM4/4IQk3Zz6ycuSMlbbk4b8EQ3vqmpDrKZu
 uCgkI6KcXCNELPErz1dS2M7nAxorewA5Z4mU53G6Qsgr+cFXRBszLnQeQXufrH23zD+h/Fflggo
 vsKPN3wqyA9cEvRsDUuA9/eUJfHQwYSm5G91Rsk1b3ftSwMIDANEe4yD5aKe9pBo2FkyBOnp91K
 BOv8NxYTYKsiN4Kxuxik7zc4j501nUwUnmzEYe/Z4qnmIUrw1UPS23rnxlPhzsXGfsagF7rAn+R
 kx8BSh7Px9whWhoOc2UyXuXuCCyJTYnI3sUxK5ZtY3FM1ll0Zj349a3SZlDwvg2cFB26r75dGlm
 qwZsrTsWtnfWICe7IxizEDQ/VwUW4M7rRfzzLcfXgocC9bgEJM/kgCi2nvicLl5rxtaNgTFIfCq
 65II4o9QoBFIMqtb395KTmBjp96MZLDYgt/gYA9/kHtOWnaRc8t7Rb9iMO3SLy0J4h6gD24ItKK
 85IvCKUwg+F1Nwg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

To avoid depending on PLL infrastructure for timekeeping, use 32K clock
for the timer. Avoid changing the clock globally since other boards
might not profit from a slower clock in the same way.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
index 1000ee8b807aa..2e907c4163629 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
@@ -46,6 +46,11 @@ &gpio_keys {
 	pinctrl-0 = <&pinctrl_gpio_keys>;
 };
 
+&gpt1 {
+	clocks = <&clks IMX6SLL_CLK_GPT_BUS>,
+		 <&clks IMX6SLL_CLK_CKIL>;
+};
+
 &i2c1 {
 	pinctrl-names = "default","sleep";
 	pinctrl-0 = <&pinctrl_i2c1>;

-- 
2.47.3

