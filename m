Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147F145BD7B
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827135; cv=none; b=uEOkYd2ze3p79MplfTec31iEK11SaYtdXiZ5FgQMgkmjdnz6kv9ql9fLXgng3LNpDRmcchzrQ1SI3EOC0Ae7GeryV+1Z5Aa7xXZyC5bkbDfoT9dR6DvT4Bi6MwZ5vPkCpCeYpC5Rv/3pEE3/JvJ90/hhalEFIE+ZezZWDdmKPHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827135; c=relaxed/simple;
	bh=4aVrNgDRvufpaoAAyHRbFgNpLX99+RxCXZtMDwCIHnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlWzectwA91hP7QKd3SSB5AIEK4d1VR2Z1iMR1C/fcMYh7fbj3z9V2VbkPBd1dhR3IkhdP/ZSDyPAY1TnURhLXK1rscRwn4N2CRVUW+ZPvTxXl1RYs2vW9iGSaT9uQsjrZUtJMniGikHI2/1hA1FyKnGcS2ImfQH26X0e+87ZeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0Wr5OUY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0Wr5OUY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso115055e9.0
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 11:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827129; x=1773431929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQyi1SlQ7yqSFVYKOlrAnDhopzWugvynZ+QL9xEDhOk=;
        b=V0Wr5OUY+J4HJ2+hbt4k7MnPnmnu+ZH8iudw+6rjLH1McN1brVa5n8tLFxb1cctMWG
         Xnm4LjAJQPUe6O4MOZLBggSlStGWW2cMZaVSI6FycXwXAvgnH71gJs6t3OVWXz6lbRWo
         fmp8L7M9MT96etxeqaue2yu9NsdSTTxpFPXo0IiG+oXrzSRWR4yNNKq4//YoU7BIH/++
         dLyd20jVZ1F2OmUHdMDNU4YSZ6zPze5Ou7suZI+UviwPD87ud9l8jZXPsWnF2X+62Z/E
         HMdN4PiDe4j1inY6/zQUv9Cv2vOH+JaWLNdV7/qnyIdzbQdvzQcBCbL3GdqyyDk8hvD2
         qQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827129; x=1773431929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DQyi1SlQ7yqSFVYKOlrAnDhopzWugvynZ+QL9xEDhOk=;
        b=uGt+JLxbzMG5TDE0kpEbArPrWTNNN64dBfiYmgNM8cE86FE4sCmbCKNxkJswidzX4m
         dBLfq8EfYjJqxaeyq/pf4EpR7dQhCLCkLGZlp0lSoiNQ31Mw+XfByjlL0fYQVa+KSLsq
         qsUnp7s/I7MAkSMSNSXzxndwFH61+8mzShckBsDrGCgS5EKxfpFwUGv6KQp2TEyMBLFa
         qEtJXri3vRDqv3nmAG1hngLce6S6tHWx0eOcPPbKVWhamWB3td275b+HKgeCBL7o4nDP
         5/MxvyQ46uU8D4QCoyCBeRfziifdbCRmXNBnqwZ3B5ZFCw0F1Ubps+GsOAQm6+BhjRPP
         dL8w==
X-Forwarded-Encrypted: i=1; AJvYcCWoePboKTxUS5wsPJkAGYx9IVdE1etSSHxGjU/K8U7Jx2Lc9jqe6ES+Mly9FUpDkm3ZJhw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxVIJ7Ff09YW79hYZwLPtfOtqWb7le0PNOiTQQeRnoN5r+YCvp
	68cc0Z1aKcPNNHHMDz2MxvelDnmANZjSXaJxUkAeLJV31FDbiHPmdk+8bv6QJA==
X-Gm-Gg: ATEYQzwj2vjs6pB1iMkPWaAL4Xz12yP3imLz/HnXmG/LEf+6TiUFWy2okc11apTtS/S
	6CXY6SF3A8RCgaId6g5IKSDHLDr5+q9rqX/1qx0L1TwXo6Zcm1NZeKgYsETi2hhJrnQ5S648ghH
	6eNgG2oN0gw34YequXMna5/GZecU/lrlV0www0IcemDAshdfB/vlOzjTDhETWBsNjcEQV2ewYz/
	9KcQt1ajwWAbJia6YDcNvG6//IpoNFV+V7rwAwG7sLZz2uE7j71DokfE2xTlKUBhqvgRUV4c+2v
	41UTlo1rMbmtj0Q/wMDrVQ35Jgt9U4jtDP7JHKtsfEpL9wcfnLPPd1NLVcU5bSnovBGDUdEhc1g
	C3CGW5ElTH3Efaym1WO92HQ5HaMwKv0jrkB/U+ZrmpY8kppUAhQ9m7uKRaniwj+cZ3SiKCp91aS
	HLguVihjRi6CSkMcOClGeEuUsjqkXmYihUIVK3Z+8lTQMMRpy98rC4kt2lX+80Udv+XiClhTfXP
	/0Q9+Zn1G+3d9hrXYtOu53UMtYvozgny4bPkVy9+3qQNyjH0A==
X-Received: by 2002:a05:600c:1c03:b0:480:1dc6:2686 with SMTP id 5b1f17b1804b1-48526930d92mr60341145e9.13.1772827129080;
        Fri, 06 Mar 2026 11:58:49 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:48 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 09/11] arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
Date: Fri,  6 Mar 2026 20:58:28 +0100
Message-ID: <72e21074031d16153460e128f8f37b8c942aaf30.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM2 device on the VAR-SOM Symphony carrier board.

The ST33K TPM2 is connected over I2C, and A PCA6408 GPIO expander is
used to control the reset signal required to release the TPM from reset.

This patch adds:
- The PCA6408 GPIO expander.
- The ST33K TPM2 device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 66c306f755af..a77085b264e5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -160,6 +160,20 @@ typec1_dr_sw: endpoint {
 };
 
 &i2c3 {
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5406";
-- 
2.47.3

