Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9BB3CCFDB
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913395; cv=none; b=rbtthPgcUqYMs4l7VwKA2qG0LjOsKbGsxbjIGgX7KLlOXjvhE4VbFofNls8pwpkSd0Oue449nxqhAgA+dOefB9S80SWQ4zJVz8e10GfsZ6zCoelXsWto1EXnVI8nKxuWej7Vy2CsDGsZb2VmfHx9EnPtqel5FvzrG+Mdv3m465U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913395; c=relaxed/simple;
	bh=Lg2+v69DI9Kp2ph6ue3jXWaExpaKxXY++sEeHMlzTG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQlZAbfjdPGcucUtbngBb/VVyfgnPsWYYUXtkC6ok/Bkl5ou5zDL8OlHwoSz2UtIyZSJKL2aaXKf7EQR1Xo1y6MmNv/lpxLBEz1eaNWNifHtQGQ5LJ78TjvueOSznymINF1Ff1+scopS/tvU5eLHLWeHAHXkGO8FCNsYiQaohuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKq+E6IX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKq+E6IX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490be03d47bso33949945e9.0
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913391; x=1781518191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUVpVy5XUta9JdZvVzQyX6tIcChkXtYHbn7XRIvfDZE=;
        b=aKq+E6IXXZFMUdVKVzxNF/F+ws6dLdR2KV0Ig/T8K4wgY5ftlL61f1QEzhJsxruNvJ
         9TJ3MT5Ox8nfq1JtAaQkXccVlbFqXot0N2DXylxEiD4LHp/IpJUpzsGNqYUUGq1zQr2M
         k+a9c2dCz/R/K7f9kjuEL8PU3MlcG+WTEolMafs9t79G8uZTCoijt2oovnyrUg8/O18C
         BY1ZnbKa4Lrieu6emxlJOwFNEG8J4dLm4T60AGOYVGdAcu+pfNo3QU6dCsI135g6vQ11
         wptD96gyZJMHs/JDAus/VUz7A4LeEN3W6QjvTlQxdJEjrWmDAWkKw8x+IzHlucE+X5OQ
         ms2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913391; x=1781518191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TUVpVy5XUta9JdZvVzQyX6tIcChkXtYHbn7XRIvfDZE=;
        b=ryMWfX6ZnYVewS6SlrnnFKu9X1K0a3jYAOQi+FgL9eEdXiuSIjgW4wBRCfXlBdxrTo
         xjXoBWODjc1V5wOcz2PFyjOXZAHaA0+YdIV96LBr5xmaorFnTXSE/sF8qxG8Ox8VO0kp
         2T/t96tVnRndYJmC162PZ4HT1RskItTa0oMfySQuiHATN+RKnFeOBOiOFRsZS92OMBGi
         6HXa1Bj3bIpQZ9Bh60g6Sceayu56IeIS1d+WJxA55USWKn+CqaNHTnRPXhMjUbpSXVw8
         dVxm3b90Ja1o0PqvjAsSBdIo2m/2oybIC7tr+rkVAjTP+1z2SbW+bkZe1BU1IwKV+TKB
         G7Zw==
X-Forwarded-Encrypted: i=1; AFNElJ+X5kBX3qYLW/1lp0sbYVOd71puc003X8vHpJ+FSWxtgIy5Rnj9lNli4l4p/91/YCLilQc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYvdBF/aQUxcslqB8fFHaBcECVqeDinn6oz8inzpy5JYrv1+Kb
	99bauLlfu4mYc5RL+INXnKdJGcwPxXiDumVqOyla0RlQa6svGdinHHJT
X-Gm-Gg: Acq92OGYCbwwsUoP6VJPxPHwZXEDTYKkdp+xNjQff4gvjWcQJvOvfuoRvWi/4HTQxLN
	4ipzLarpPS8cmMMr2iwHtZ6ZttsQdbErIfRkLDVrCxBWFgIdAvhBzjl76VvLOt1giFSVCWzRor1
	D18lykxYx4/+d6s0PK3exRuUt+1JpQKhb7MNebo1xJgxjgdbvI2HofvtyShuFDGioAXzAFUQUiI
	IGxhZfYsqWR24sgH1Mvhw/E8DMXgLRXRBkPPL5UMCsIgEy0vf6BMAyV0LOssQGGWU0HicMADTb3
	zdTbe1IODIRzULMrdhROV713jUXjX+PHfROkB4WLDkIPIAc3m4RaZeudk56Ir9zxgsdvBT8NiqV
	0PiudZRV05GHPHuBnhgdeUrkx/ppqMCMLtHPKGQnEftElywG2yqRBUOvp6O1KywLHjVZJLxxJpo
	p8wSjE2mue6DOgAiKEwDCJPOPpFX9iP+LQH7cab0dKHZjxsnnRzsfPR7Sn02VKD5B/sQwMFY4i9
	cSIF/NtkksDWVno+hH1MyBKxY71a9BBynfsDSySk1h3IkSC
X-Received: by 2002:a05:600c:8b68:b0:490:bad7:3634 with SMTP id 5b1f17b1804b1-490c25e1104mr257657185e9.19.1780913390925;
        Mon, 08 Jun 2026 03:09:50 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:50 -0700 (PDT)
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
Subject: [PATCH v4 12/14] arm64: dts: imx8mp-var-som-symphony: enable CAN
Date: Mon,  8 Jun 2026 12:09:30 +0200
Message-ID: <1a5c91460de799f89a4f18547b044e0257035fd1.1780912893.git.stefano.r@variscite.com>
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

Enable the FlexCAN2 controller on the Symphony carrier board and add the
corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - Add FlexCAN2 controller support

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index e1b78ed167b4..7ad57caa0f1c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -106,6 +106,12 @@ &ecspi2 {
 	status = "okay";
 };
 
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -357,6 +363,13 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
 		>;
 	};
 
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART3_RXD__CAN2_TX					0x154
+			MX8MP_IOMUXC_UART3_TXD__CAN2_RX					0x154
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

