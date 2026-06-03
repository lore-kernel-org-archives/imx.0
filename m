Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C2641C2E2
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 08:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475111; cv=none; b=JhqJDVjpxRqPzKdTGCk/Vh3AUCDrHl+w0c/itedJDk7uHh5h9yU+MVBclravR5xxFQUR/CCznXQrRhN47aTOsfDL08J+g1GOFK6BMoPM4Ut1MjbcC4YA+ZcQKX1GFfKiYgEUj6dFBoBAkm3wAPgXhT75kXOGd+Z/sK1zp7Vys6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475111; c=relaxed/simple;
	bh=8SemRYEAMxCfyipP0JRkYfVN40IkkVu46KbOG90/ivQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5Pa9dPMUiRjN1zClkOuz3A90DBLXrVgRZfozmZwOZfBZRzK9+ul6g/OeI9QHUiwvww6fNh0svhxSBqLaA2m9NwBC7LD6ahDvZcn0e1yd9+x5TJ+GVuI/+RggbjPVnbtOJemEoG1O5tnXxzpymrZ/0m85sXypBRcvp3aJdqAFPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCUPv6kS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCUPv6kS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so3493987f8f.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475109; x=1781079909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aN2ZxG3DaQG/RPv69ZqhIztARyJQGFSar0GLFb/Q3f8=;
        b=pCUPv6kST+MaGGiuXq1jPpk9dTGVuJyV5u0NsUW+ynabpBkbWNqU84XQTc1aca26vr
         bW6/ILDCN+6ZxRM5OAKY+zSKiXa9y1t9J4vgaRpesTV8Na0gpCxCHvcJcITUVOBAQTgw
         Fk+TKyFhoX+Bfm7eTsHKdnEkNvAXCtqtiZ2JSxhggUmZGBTUQgxjItQYlauoIsecF0TI
         he35DtX5Acv4tw9k7EDyewMt44KR6pucrdWa6UdK0iUFuNX2dvQw4y/rsW9iFZ9NTOH4
         nv6rhtZPsEH6Jiqxpo4dpiPJRynWQjoiVSmDvFxhZyMSxr5qPZCKQh9YEM+lgLPQ/smw
         AiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475109; x=1781079909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aN2ZxG3DaQG/RPv69ZqhIztARyJQGFSar0GLFb/Q3f8=;
        b=AMK9c7guYg35i0eK8M+OEEvg7WAZppITEfx8rNYyBl2cboDsPWAkzSZ/86nOb8JIw7
         UIguxXFOLk8g61zy6ZKCD/mQ52HW3c8ZUOlQlc7OBpdxHTPPwsU6xxoNeZgaNRZqG3dZ
         vE5rsP7YgsOirbqH03pwRqwcPy/Gs4EU+62TOSgoUDh3B1tQ0u+EwT1zbFg6mrUTAOfT
         ejF+z++LbNJIa2oNAd34a5Owf0jEjjPXDpekjtp+bnGo4HjCflQ2p6rYrHl3B35WFQPm
         ALFlQb22eW7stqivIGVvPwMaG/gp0ijZ6EoVUzkzscPTt5FqC6pOg7GLLYDnd5kd1zHm
         0acQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KFGsl6B9B6SpLyKsMZgFRO42mop/F9beq0mQ0HgMdFfyOjs7gvgvdtTyRB40wGDfK73A=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl3Y8KGrmUnyPLHoPJ3CHmknDC4uqhZ8Pmc3jrnvTIu4ZhWd1l
	RKs3Al60JwU0R9HjwtnOefJCwC0SZCK5U92WKnmRs2iJS7IB0SqLgFTj
X-Gm-Gg: Acq92OFMfO+jCEHufBR6UT9CU0GKsm5u31WNCmJ/hpQnGtqLBuNFhIYL6oiEwYBbdwR
	nv+aS0rtM0vkql964YUu06fAVYxMLUvO40TscB5Q/qqoIBNwYiUa1nqyERjNmM+QRuWz6IfASUZ
	IIhfVJVjiwS6GyZAPFGsYUTVy5GB8fHneIQtueWKSplnOd26oKB7b7v9x2zGIRV//JVqiykh/zD
	U+Uiz8ZbMRkklyq8sacMIHB4v4ERLZ9P/hp7OSoSkST+Jk7blhM5UN2Pba1a2ZTR8se6/jPUOou
	TrMgk/c0S3RtKkq1+vHhPAkPXpBvcBX1ZkpKugTHqos3fC0BzIgjJUhyod1s8Rr36SEaLjf6CD/
	eEn3Yz5dyITYYX25MxqCZdQ5+Ju6mwj+nIH/0KcAU9Y3tZvvRe23h/5WZXrcu8VxSGvdy6UavsR
	idBJksiosvceYT10yB5fjdwzR8Z5lzaRsb5vs9C8OLmIxZtPQXRgkgNs4agpF2Q/WXK6XbLH7CC
	fdDZzl2tkVM3UI5kzQ3At9hR86h5tJ+jXAMuTiF3M0FenppcsDCQteFSMk=
X-Received: by 2002:a05:600c:6211:b0:490:6e12:5418 with SMTP id 5b1f17b1804b1-490b5ed36b7mr40419825e9.23.1780475108995;
        Wed, 03 Jun 2026 01:25:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:08 -0700 (PDT)
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
Subject: [PATCH v3 2/5] arm64: dts: imx93-var-som-symphony: enable UART7
Date: Wed,  3 Jun 2026 10:25:01 +0200
Message-ID: <95c0dbfea0536bc38cdc71d7451f99a3fa4aa08f.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable UART7 on the Symphony carrier board and add its pinctrl
configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx93-var-som-symphony.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c736127c7115..77377127c18c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -35,6 +35,7 @@ aliases {
 		serial3 = &lpuart4;
 		serial4 = &lpuart5;
 		serial5 = &lpuart6;
+		serial6 = &lpuart7;
 	};
 
 
@@ -305,6 +306,12 @@ &lpuart6 {
 	status = "okay";
 };
 
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -441,6 +448,13 @@ MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e
 		>;
 	};
 
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO09__LPUART7_RX			0x31e
+			MX93_PAD_GPIO_IO08__LPUART7_TX			0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO18__GPIO2_IO18		0x31e
-- 
2.47.3

