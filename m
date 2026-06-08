Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602873CEB99
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913393; cv=none; b=iOVGe9OEvCB0DTIridy+N+Oc0Q685/b7P7A/LGrrR1ezsFb64vvK9tR0p/mjkoWC83nr8Mp2sQD9eVz7RqA/gthcediBHulB8qTZxQY1dSiNyUGluvQKGpv2An1ufVa2aDehXz7hRh7i9EQz9Vj5XDXISxZP5wE0M3rCTT175kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913393; c=relaxed/simple;
	bh=ypFUAnhVJLC4cQ8FT2d6Pjh3HsG2d2OBvhj5whf+qVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psuPUOh4KknP0xrNURy2LGkpcQVwxsc+BEOIG50jM9iGGNIMRrLzR0A4DuYEn6JUE7YX0CjZ5oRi77Tbf0anGp6NXTJv/acgFnwMtCtOv6A/4s8BeLyeH9LIAS9CujBq/orYY1si6EvIL6nD9Nql4q5qMZudQgLk5IWi1EBrqwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmalnG2V; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmalnG2V"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45fd464d51fso2179727f8f.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913390; x=1781518190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fjp2VWCoSiDFmRFZVwMPT0HHzuaUx5cVmqiNgG0trik=;
        b=SmalnG2VgpmURKgTPB3pqS/iDpZWuUzzOAGPk6jJD/J20+Wyx4tnvnm9CKR/TmAaMu
         TWKxkoH8hiVe5a7Sd8/2fIAfQtqssQP6HrFjxK/CQOxV/jS4mhYQwP6C3H1FuokS6wQ4
         PCpktjIWOdivdaJqBtWgNF+fVvuhAXAowqbhS8YF5nYvb1lalZzo87dVxDbEa7s0EuGX
         9OXClnCQdgKKXwoVAxbRpC3KKGhhGNYnYKxi2n9wMOkUtNFqUNGrlpUlTuFGz7lSU1kB
         XJT+eekfytDLjC3d67MwUP5+V7Xm/ui3E/0kU2x6sFK9TxpJEFsnR5XOpR5uhxYp+gJa
         803w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913390; x=1781518190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fjp2VWCoSiDFmRFZVwMPT0HHzuaUx5cVmqiNgG0trik=;
        b=itkj+rcHHfPQBWF827v7XmutK63APR3idai/bkjOVg8rxPUKVG0wJta6lKnHWOUx50
         f3vvvTgYyPOZ70hOTrisss+JzpOXhqSVfvGY53PaC3T6Lnk+jVdBrL5iHa00VKyXNcp2
         E+VkIXHUmvkYp1d3KRjDhzsQS0DyTxdnSxdXEBWaeZjOewfbLuFU6EZRcTP+sqAeyQva
         rO+WAh/BLYpMyMf2XQr2kRq2WcS58PQx9CpJRRaItcqlRWIG7BvsoLZ6Q3RX61U6sWqw
         Nq8p5sn6cz9MOhUN2fbCLtGnfGVfUuNyZ+YDUrD3ChfymfQPMiix/zXiUhJ4mB9HRxRM
         ajSg==
X-Forwarded-Encrypted: i=1; AFNElJ/INSkXEcqxkWcs1ROqfdPCknmbXf6Sd+7HO8wybrURkQa750UCeh5JkKiyvSjBOGs0hDY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw02zaOxVOVwnCE5ENYsa/LDSu63//AWIk0adBf2ClaOrrSxdFU
	hz8tjBCBZs7G7sbTwsxWE/46S54VCZDulFLcWvRCnc+h0OmGRlIVpsFu
X-Gm-Gg: Acq92OFb59QSy1EujgjLufZzugTDrhr+rvbxpgZeYql+0J3LVyY+dAiXR381N1hq+mJ
	vHJS1Se49WnwhSOxVGCjAKZp7bMYpXgLIiMTmmS61/oeg2HEWpjaDRgLCM6reUy+O/PdxgBcvjp
	sTQE9xdIk+8nShcr/69My8m+ruxDy8xDPZFuA2UQjp2OnG/Q3bxCLwwlOMD2dVRLQy5iDpVo4aI
	UJMJNyB1/9WF5Asgw7jG2r8NZb3DgAlEgn+TaLvqjkLmei0snCtEEpnL0C6RwK6bd8v+eKcjEsb
	U6EHFN2W+//6Pc99sfG+5VN4LU5+sa7CbbRwo6z4Ur/l88h6l3D6lDkzWkPGfwqKt2fOaZ10cRQ
	Xrh5T0kx735mntXF5pCzgCV4PkTnfoO55Mwhk+tHDjUaUaZe7QaS/7wO2jlCLwdrDnUCEJaSsGW
	LHEWXgj866EqMyH8DjrMhFaMc10WO+7TxXkYGHk7O3sg22ilEtXV3lPYf2pmhjDH1+Etqy8ACqh
	9v8mJIh2bm52PGjP8788IKaXrEQRdbHdzUBh53polJLNqu8
X-Received: by 2002:a05:600c:34c3:b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-490c2599e11mr270847475e9.7.1780913389760;
        Mon, 08 Jun 2026 03:09:49 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:49 -0700 (PDT)
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
Subject: [PATCH v4 11/14] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Mon,  8 Jun 2026 12:09:29 +0200
Message-ID: <04c6b83abda0bac71b14f3d7f96315a1dd843f53.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 4f1d61c55ffb..e1b78ed167b4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -247,6 +247,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -400,6 +406,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT				0x116
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
-- 
2.47.3

