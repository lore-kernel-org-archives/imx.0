Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30465425CD0
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475114; cv=none; b=sWvAi9GO+rC1Aoih3Hw6Sh5paQDbYyr18IFwXdTzlCVAcAzsJFUtpCYctAsVvufAjhBAHrRehhD6Rg1YIONri9cHs/6s0emTU8PfbKKEV5WO4tKDDOyAQtZ48cgvRwVXSTkr+Hk2Mn7Fy+NR1P6Liw68wWerWOhQN3gwVlot0to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475114; c=relaxed/simple;
	bh=wCTv9t/eAHxgUJDdwGWsiCEJeGB6I/2bR3Uvigxlc7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gk701oe9ZK0mkpca8cz6NxQeVEG55c/TCW/RHqAhke9ac/RoP0ewIrVv9hdsyrjFgwEQ8xLgwpLEc9Vq9hb63TeSaESCHkzZI+znK5Nzz6plw+XCWGEsfa6IrcC8EMVYiV/AjavBkbPb7ktlEIE3jpZ2IxhYzLATaHNdvGdDDNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbvzHm6b; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbvzHm6b"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso119351775e9.1
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475111; x=1781079911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcGkW0H9irEIxVXfdMp6cTeDl8+VAERT3UWa1me3dnI=;
        b=YbvzHm6blL5QAJeGnOmHRr3KfwqcTkoGauqNwszscaCWcwdYaGoxARBxYZ5z10wYZY
         N2OWIxRKux04ChaZBww7g/hJOlSuxFS0S9gCNalf9bnoxnlz+jsKFCW3WDvsHRHxmL2f
         A0bpRh//oL8nwILohWl7CFYwcE/JGLCdqkXSsVeftmgXt2qWWEM3JjHmP/zgKH2fbi/x
         mDcE0w5gWeeTv61Hmxp1JA1g+eHy4/05CflPsuRK8wflCmqBijzsd2QlzN50yd7mF4wT
         qkc6SrjfS+W4xEQRmtsOKJprC6KPFzjPmYm3E+StFUrLMffdKwDydIJwWbZW6Q2aByiH
         Tcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475111; x=1781079911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qcGkW0H9irEIxVXfdMp6cTeDl8+VAERT3UWa1me3dnI=;
        b=VRJ5Gxa3XFuypXBns4lxuxO5pR2dv2GOXSa7YKUuIloicuWTNDIoXkOkfnOBvi0cbp
         qD8sDOTVW5Zvb+Duo46xrZEgmfFUl1R7SdKDYHHYgzKKKGNmZF8gqj7Ylz+do9fMwULW
         Hd7CGo0dGiy9BIZcDhQOTf7Ygd6u+TtB5Wg9R9yFpG4+V199yZUZKWUPCNabHsf7X3Hq
         FWdYmobYhIgkpMjiXj+cGxA6r+Zg9EKjGJrgcIzAyJ2lVy+Zq/i5eL1peu2s/tgoPUjV
         ZsSbkPn9edeelnzU/aZ++HYf4okY/hrZERUFm9t461D8PngceKKCiTKWjzhV+q4n6pop
         2tPg==
X-Forwarded-Encrypted: i=1; AFNElJ/AXIPaTPKZ21cTlEEnU+ExPv4NnSQII7mEUxbf6vEUrMtp21jgqPwFDGhYcAF4aXBWRHQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbU0WuImGhn6zteVZ8kBVVReq59KW33/bVSQLLudGbV1jWSaUb
	qihMm9OcVkxDVJBWfMD3CGecDp2UnADMuIede3rIwg8rYbIsjG1pCVeu
X-Gm-Gg: Acq92OHi9+tBGaLYYwjv/NS6zedSWW2XU//ZTq1BoU+k3n2cdeoNQ97lNkVYOsgdYKr
	Qc3WTLnZCfYZnxux1RBx/FS248ydgd2Xf6n1Vu4f+qXSt+o/WB4LkMGsJbuNzst6j76ggmc3uXC
	Bo5HPj143HvLNIWO+QFu7heiCT4BvhrS1NyBui+zBTKWyB7pAoKP7j1zCNuznxSZTImdwYl+8Vl
	TiaGtZskMC5LPI38lKot1rUcof/aE80zViirZcPLG53zEj1C2dqkwc+eiAV+RxQYhyVi1KLTbBw
	kFFWRTMDC8VTo+gcszle6BhVb4/zN0w7ywFQTfbcHgKeJlor2p+TzvPsPeMc3FA7kwwMNUZYPyJ
	4m2uV3wFR4IY8pyNoUI62lL1PpYJ9J7xJU9ATNPRhk1qMe6brsth0b4+sjSyWFbn0N7WHFu+lL7
	yCMTG6bttpeUHqYV+F50nW21X7NiunUIbyEOsfWVGVFVk08shYBOx99HXSiSOQwQmMEqREvG2l6
	V7ff40Mwfnz/O4/Zz0opYj8VmevwVPx1xj4oSGm7DcjsMHi
X-Received: by 2002:a05:600c:8184:b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490b5eb64c9mr31845095e9.7.1780475111459;
        Wed, 03 Jun 2026 01:25:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:11 -0700 (PDT)
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
Subject: [PATCH v3 5/5] arm64: dts: imx93-var-som-symphony: enable ADC
Date: Wed,  3 Jun 2026 10:25:04 +0200
Message-ID: <fe924e4d6f7371d21eb9c2414daa7448396803cc.1780474803.git.stefano.r@variscite.com>
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

Enable ADC1 on the Symphony carrier board and describe its 1.8 V
reference supply.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Add ADC1 support

 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 56f8744c861a..409c7e74ffe3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -159,6 +159,11 @@ led-0 {
 	};
 };
 
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
 /* Use external instead of internal RTC*/
 &bbnsm_rtc {
 	status = "disabled";
-- 
2.47.3

