Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FEC3C4141
	for <imx@lists.linux.dev>; Fri, 29 May 2026 10:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051975; cv=none; b=C4NrzPoY7xUiWwaw9qWGZvJ8hKbMFnauDVicdBZrtPrnBzxMH4Dhbt25sA6xbcAM55Jip9RElZ/x4TaAN7mbgnxgSgvndIAEH2m4FTcWELHseHzJWnzRu+AWDJ3gBLnBXNHI4fhT4eMMmipKTnZ6n+Tz4wHjUonzvSZMDz1XFpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051975; c=relaxed/simple;
	bh=1x3vnUCnjS8a4R79aThJypMCQj9fwOnt1ShYkpyxugY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cezm7IUXb7Y1fYx+JydeIaCDvJ0uGqc83b8DbXx7gMHI6+geAU9A4Ni66Ycz8++wPNrnc7iG3mBRUI39g51fdhHMekwJ7vcGftZikSuWqrOXj+89TBcBKCRJ45L/LSrIdnW/IW52xrTdHK2gVCC+PUBKcL7/uLlDMZP4dvA0r2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSDJrQQT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSDJrQQT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef372c58aso248613f8f.0
        for <imx@lists.linux.dev>; Fri, 29 May 2026 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051973; x=1780656773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfF+RXqoejGgiWqoKcAHP3fk5A5vKuoY8Cwpe8kKlEI=;
        b=eSDJrQQTwKqMWYIqfqJgaXFzpaa34Q2FaALFtc4f/uxOkT3e9fp0wfMI7BsaHWVS4E
         cf/Tbll5hfPZTuO9lCcCTXiasurAn/fTnNb/SzAIytSMm0f29eoCHhun3q5R1a9fhEK9
         ssrWBycddk2wPLj1b/HIxrYrvOl7h0OJl7lIDC2+toopS02Aq45rWWLljyT5HQNcG4jn
         faLMW/Cs8YSghUobPVwoZpArxDz2vQ55umSGGeUX8X/E5je18SL7Blfm/wx1jws3Dbeq
         X0FUqbwqG3iFce7e0aGcqW5oBZ8hcd4Gy07eqbf1tdTMg5HBriqlsMrg6ZTBqPkFj5Ur
         U/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051973; x=1780656773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JfF+RXqoejGgiWqoKcAHP3fk5A5vKuoY8Cwpe8kKlEI=;
        b=V+FGPe8+4vCi119CGu4biCeSVEgtdQQmA5Wifs5jaVL6MBg0TSzl04zj9/uouQl4Zk
         nQNbcPyf9But0pFqyJhVl9VgvzbYVQySCKoacMASOFy6wm98WzqXEXlEANvQkEIV+4tR
         SpShLmFifennYXdP4Oo2uVOeeYaM6yvEBulLNCeMnW+QO3y64hs/GJSwIWgG7yM6GIeu
         Mol9TQvIXcHp0EoePGGs6VS0WdmPtOUsvAaKHlz5Fk4S0QduIn0z/WOCuH2+HzfH3SeH
         cIWRDnCNRnx8Erm31fgc2Bgj+/2PCBzMo7RYhW1aCRCSHCLIGRveWDTPCV800YfemJ33
         nu8A==
X-Forwarded-Encrypted: i=1; AFNElJ/Zb9p/15ngPD/c6RYILSfvlUuTsW5HeOJ4/dnYdacQVMuKWfhL8OdBl+V5q/mkt+Fi4Ik=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCfjWvYNgchvQ5HCjmUYQs0kselOsehEVKgN45L0yi9QBG6sFR
	rX0WESmWYEITOZnDG1FDwfSnKtgdn0veaK2lzCCC2CYLkU2Gfus3Cwd0
X-Gm-Gg: Acq92OEu0X5UKgRWYWJh8O2SZxQwJ82tfVBzEVXPsZCkbfOQq6h8gtFu2cPihMLCpwp
	xR89IDfr+mIhyfEkfy8bEgkQIwSBjuiphu8hj3KXTHmljBAePpPM13YI1Lwojv1ZInOE3JD3DZ2
	ELIZlHNRQAslS5k+y5HV/8NIhiPxEBsKvyLry6A0PpY4FtucAOycY+nwKsNd3JTcv+t9HznAUsN
	tpPWfZHBcrFRJeDa9nnW7QsL48vPBGdy6/c0BmlBtcq4kF+Imcdp6KdbTnWfudK2jwZGeL1u8uT
	lKwdyOgoBG/hEpcAr6Q3iIz3NTGHR6mK5gkjbcSL6aVQnFykXZ/zXCg8pcLqPVVRI5XCi1yF08o
	JgwWXshrBaCCW7EvKS9pcG/JHPHEr77iTVPOZe8VzWLeZ77UDGaqcSTiI2zZw5y4GyuO8Kkb6y3
	DxQzLbiRPse12s6B0j07SyYAr17BD+0CKcBeOQIBbRDHN8jZs1xgBIhn1GixR8rA9vhvMjfXzul
	5hnCcht0EZdeSDHCdbdC2GddVdXgYaICI4crUA5MxJKhNA=
X-Received: by 2002:a05:6000:40c5:b0:45e:ec27:b4ad with SMTP id ffacd0b85a97d-45ef143eff4mr4491582f8f.24.1780051972829;
        Fri, 29 May 2026 03:52:52 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:52 -0700 (PDT)
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
Subject: [PATCH v2 2/4] arm64: dts: imx93-var-som-symphony: enable UART7
Date: Fri, 29 May 2026 12:52:45 +0200
Message-ID: <d7cbbae223dff7ad797b715d34eb79db9ee54203.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051874.git.stefano.r@variscite.com>
References: <cover.1780051874.git.stefano.r@variscite.com>
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
v1->v2:
 - 

 .../boot/dts/freescale/imx93-var-som-symphony.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index f541308ebf6b..f313f168cfb4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -35,6 +35,7 @@ aliases {
 		serial3 = &lpuart4;
 		serial4 = &lpuart5;
 		serial5 = &lpuart6;
+		serial6 = &lpuart7;
 	};
 
 
@@ -310,6 +311,12 @@ &lpuart6 {
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
@@ -446,6 +453,13 @@ MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e
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

