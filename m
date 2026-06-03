Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D5A481A9A
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492392; cv=none; b=kuBFkuxXajh5Ox5UWAapW5ZV5C7RbI9zTqZC0z7cPFbjEAJzeYI4epZlQF3MulA0ia08GRPV2MUzxRuncNehcfRF5oiCEtGhd/jXx9U9KdUSeqk5dF/NzXnH/X6KZwUSRjWmHNRnyWg37RqR7GCfIffj7vyTNH1ymAxlmOcSQfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492392; c=relaxed/simple;
	bh=klvLMbcrvp0spbZcM/iGJWrKF6UuDDMh15N2Lb9kHt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ntgLDeR4P2HK0cT2BmjURVGu3PhQK0a+R4hMIAWc3Qy/tTGOjEepOmRpT3BNe3hth+giWtj9MRzeAOsD/hwKfMFwFqbCHDoZt16z3Z8VDvfddlGzWn4DjKsAUsA0nI1/GdYGSJKRsQxtXnqbtIHJn/AeRuHpaM20RWLYk/IJ2rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7xPqTWo; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7xPqTWo"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso4527619f8f.3
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492385; x=1781097185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uIGJv06tp2fYr3qME+4/5ks9JXN0Cpu9SA6dXG0aL4=;
        b=m7xPqTWo7sUroPNWUzpHFQAf2Eqs0BCu+s6s5Gxlvyi1mvIV0p0gKac+oOwlYkm3oR
         2GFcsbWwdZHG/xS6zehfpHCMhDF7o/klQm+suYlawyf447dI2RRGvx0EjiEtWV3dnZeK
         /vf/avz2WD7bSlVcq81n/OcsZ8z0HfyDRyadWB0w4Kc6oJDhQ3fjCuYHXyvAas8Lg5+h
         fUNNoNYMvakUHdjv6s9IHLY3GQhbDckeAq70k0d+AFqJgDtaq8tRf8Q1XXT/jEfhaQZN
         pPJt3tEhcM0hMLmir4FZserhzhTECQSzlxZ70qRPVWOtK7SuxXKP68n25aDgvR5A4tfU
         +tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492385; x=1781097185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0uIGJv06tp2fYr3qME+4/5ks9JXN0Cpu9SA6dXG0aL4=;
        b=qOh6nug31//sA+zVV7z2sYHOKzNkwdYEb1+jtayf+N85rIBh1/Mlwyqh7kPS1+ME4R
         xjbA0B6CFyOrKi6pMP1EBiUtEFdi+DdfKEAxU/oGEW7RLYa2wBP6Y/kGAuEL2Nn6yNXV
         tUKBPsQflNl7wkP9U01Ru3M1fwimP36uLuiCqE8nzaAMwsN3lBicPKnalkgByouZj/mh
         NHqVP4YuCJH+pSbudmCyfxf0GKyoxWPxglGFDXyEDF1n9Zj2t1F/Hq1Qi0+4WPV8GOuG
         nVNZ9L4KV8ZgQWHgRbJmKk2nKyDTgUMSPnVpSzGix+CFqB5NG7sEJzTVA8ZvEcNyEdQm
         PVIA==
X-Forwarded-Encrypted: i=1; AFNElJ/2ZOtAAjxt6RdyNxMHOOG6hCJFg3vkIRdfKlfdcveAHW99FuTNvilikUYTJEa2I7lF4GU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkPth97E8+EFp85rBT3bkFBBVtjqkqkbOI7X/2APfHgDsCxGgn
	764lQ90K+Simm5R++X0g8d/xFt4JsT3v4tGQpvnrxmIoQJLxKmuz0SBs
X-Gm-Gg: Acq92OHVtr/elpW0mjZkq0b5avjudURYFmWmQg59ZYoMIdZATCOfFbIP3z4SHyKGb9i
	PKea/Yy9czpuOEc576V2LIGK+pa1ytSzZSZSG1gdWAHkJxLf/b90FtH/bfOdWoD/DWdpsonRfas
	uF2UkdUJm/Q6V9jOvZFVWMfiswTq9SoYGkDGrrlYDQCwJJVz3BLERoFghIS3kcajwWt+DvcmG4/
	ggFMxlbyHCB+u5uxUd/8wq+zqwv7xz0bSC1N8m7NLXMuFacazigmn1OZqLNFMR6aoHwNCiiO2Fz
	elseEqCWuyYFdLH5h7HQRsd7bP+/uLjdcG/w9J1h8+ukztc3aOsQCoJd3fNUvqNn5NaW1RBdOgO
	aAZftvmE3AWbxE1Fo15kjttYcK2DuXhFfHwGJSaQx9jfjCnB5r3puqNH55oZDXoWGgqQni7arXl
	VsLJpivJFH3WTFNU+xCLuq9sB6BNXZicOfS21srnJ2BAySGCe9d3QOp7tNrFkcZXqh6/su+Eoy4
	7LuYNbAiSsJfdZHoLBTwcycRBoRapylCebwxG0MtCL1okLF
X-Received: by 2002:a05:600c:1989:b0:490:b9fe:e64a with SMTP id 5b1f17b1804b1-490b9fee832mr34646215e9.2.1780492384590;
        Wed, 03 Jun 2026 06:13:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:04 -0700 (PDT)
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
Subject: [PATCH v2 10/12] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Wed,  3 Jun 2026 15:12:48 +0200
Message-ID: <aeec2a409aaf8e80d882fde9af76a181dea072bc.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 98aea97e9438..91d24110a283 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -193,6 +193,14 @@ pcal6408: gpio@21 {
 		reg = <0x21>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

