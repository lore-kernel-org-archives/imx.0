Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8702343CEED
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133920; cv=none; b=E1Y0h47Tf28NUjjeoQf4Ae5bwLahjOoNJ6bnozM5Tg7yNlS+0pOog/Wa2GC7vx46+/7DZjHiLbllV6vDypGpKbVoitaiwW/pMdfT/O+gdXOlQ5KlE9BSfWz4sttjHZpvBwYyS+THDWZyQcVEYOTbQbFqwUTJ6hSPRNatwzfRrd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133920; c=relaxed/simple;
	bh=FhXJrZ7uVPaK65xiFPjnwZL9cmC25AwFyvS/ow5KGiY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=X/D6IkKUEOaXBUZS4DofIW0mOwLqlmh6dj4Ecys74Hsw5NuBGuJuywPBKKMS22kmeSvByo5SmjAvDwwBpgwPb2RHfJ0CsBjsn9wn0VWydATKUui7ddaZTBS0XMevYHkMfYtMdtobU8nd7/eFd2rRVjnrunQ5xywI2SYJ+IbJJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddTrG8jo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddTrG8jo"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-485345e1013so17504065e9.1
        for <imx@lists.linux.dev>; Tue, 10 Mar 2026 02:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773133917; x=1773738717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8byY2pi6aZMASU/wIMl2Z52enhJy2O8vbvW26gwVodc=;
        b=ddTrG8joqqqDyPyTijhXEHti5h/v//aqp4U1cBQBStBDJiCb3JeEO41P/FxBD9ufTo
         X+AXd1vbNlSPfjiTpvbAmb3FAF5Ygl3R1lmoe/zWPQAcn9p1o3wiPyfuIxknPlAT+hCq
         GCXZTA7YIs332dMPgIE8tJVT8Mz8xeXZ0yXscK32QBn+OBY0PGthtk5jc7ORZXmXNwJ2
         BCIMZ4xtXvli7WIZb59xI6agO6l4AdvdtAFRIL2JyQtIbjNz0Co7y9rvW1+FO7kv2EgY
         SJkLp2JMeBAgDVoJrZTHlFtvoG2MnLDi5nZ5onVL0uVUuDgRTFsjydb5ELsf0uVj+3Xl
         IZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773133917; x=1773738717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8byY2pi6aZMASU/wIMl2Z52enhJy2O8vbvW26gwVodc=;
        b=a3NpyGPCz4IXJ4MerrYqkZwaws4FAggUfhUTkVpH7yTo6+H90Cp2os+HluVdtLC80J
         /cTvsdIYxeN6f4NxdATNT/unr/6PuHmFxZaQ7ovuebwjJsOk7Kkn1C0xEJXzffuud9Oj
         Bayrw8xsUHPzt2LTu38WvvFFVEzJhI2EUQjOLQU5T4T+Jh1XPln9BGccwKESCPYxCWDF
         DVIsDeZA+Pe7CVNNjKRw+2vPXdz29UrAJLrfk0Y0eKsZIcQNXY/xM3ziOM0S/gYkPdsj
         c0AbtDdJhZryZ+TahEbkeQZEsrHJ3M2CrHVRHhUAlqpJtYd/37136ueiR0m4W8d2oA3v
         BY0g==
X-Forwarded-Encrypted: i=1; AJvYcCXiBpfcFT0Ozlc4qJtw4sUa63Ei9quV6bLfAdwv5122zXpqJ1WDUR2Xtg7ELueEAksUIb8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMg+tIN1UEhKFt9Oad2tj94r1zd1j1N8kori86A0bg7UeELxQo
	7Tmuyt5fNLNpC+BRoXt1BDnFePmdlERTxLSrboeCwLCGC/2NUtcMOcsTwmIxnzRLRxk=
X-Gm-Gg: ATEYQzyw90dvsw+3NsJRb1NcNDGjzosShGxkrRHM8MlvH+gGqBhDI2TQGeRJrEqL1th
	2HGAPBIg5utQ/8rqAL82zR7VbeORFnnSYTa68TKD23buIv4itetndCnOkyPITX9NvYkF9Wi/+e9
	f2cnG9l+hH4gdlPqwazFqPx4+7QfEXn+spbG6Zvqw30A4ANKtbWbXlxJZv6MfT0Vw/2ppaOrIwe
	G89sqAB3V8JL/A3DGtCeBswqyuGQeVC4Y8K6H+zdJHNcg7iMFZqg4P3igorW6iJmVKriY048uY+
	bEXQicXQU/tv3b+vGg6PiTvz9UGPFAMIxd7qV5325Bk4NhDlesKQNB2C2daDYETyiPDVxbBP34G
	ksdtSIGTc9NHepP2DJafdQQ8v5UDf2yFZuspORU3efyJydmILnWozT523hDDxMyJCLQDRnsyMjw
	yxbHAvDBGDVox61xlI3+HzUvrgPBp9kYsBSv0rWknhfg==
X-Received: by 2002:a05:600c:8b4b:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-485419f1614mr41410525e9.11.1773133916565;
        Tue, 10 Mar 2026 02:11:56 -0700 (PDT)
Received: from homeserver.tail6d6c39.ts.net ([82.137.32.29])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541a6bb86sm56808345e9.1.2026.03.10.02.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:11:56 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] arm64: dts: imx8mp-edm-g-wb: Use 0 for reserved bit
Date: Tue, 10 Mar 2026 09:10:53 +0000
Message-ID: <20260310091054.2029912-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8MP Reference Manual documents bit 0 of the
IOMUXC_SW_PAD_CTL_PAD registers as reserved. The hd3ss3220
IRQ pin (SAI1_RXD6/GPIO4_IO08) currently uses pad config
value 0x41 which sets this reserved bit.

Change 0x41 to 0x40 to leave the reserved bit cleared, as
recommended by the reference manual. This also allows for
easier conversion to symbolic macros.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
index 242fa930b..a78401d11 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
@@ -345,7 +345,7 @@ MX8MP_IOMUXC_SAI1_TXD5__GPIO4_IO17		0x16 /* DSI_VDDEN */
 
 	pinctrl_hd3ss3220_irq: hd3ss3220-irqgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08		0x41 /* GPIO_P253 */
+			MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08		0x40 /* GPIO_P253 */
 		>;
 	};
 
-- 
2.43.0

