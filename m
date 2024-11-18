Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D8679DC7
	for <imx@lists.linux.dev>; Mon, 18 Nov 2024 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731944205; cv=none; b=DiO70VNhNj/broez5LhFvTVGw45VpW6xGKz3bs4s2PfKo6SfEXjm2lQVjAUk41ZKRs4PNWQhNJ3S5sdhUl285AxS1SPWQvpAEofMbfOoX8E0tlNiZ/7rL5t7zXNiet9S/NJEBMX3CN4gGuI15UutxIYx537QJXojm6s/VtofTLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731944205; c=relaxed/simple;
	bh=/T1HO0gbxRmQuS/Tf0idE+GqQiO3iy9sEezBwtWSjyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PiVVu4TsWuFWZ2HdbshBtr5MtG5ngoQ+qc3RSKNJZfp7GRd3wgOhtac/8y8j1rbexQXIHKGfjoqXQtFR2nh6db2C1VMy/VV3SF6oV9wKZj7ivnKXSmCohmsJJ5YIHvx2VU8i6ZGirqqPKFspTUgAagqtOW5xwShHyGGbEwp9eGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmCIYCJT; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmCIYCJT"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d408e38561so19183136d6.2
        for <imx@lists.linux.dev>; Mon, 18 Nov 2024 07:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731944203; x=1732549003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEKo1LnFlWDTdn6dZMAURbf9LKsxfQWrYSaiKgMPlwU=;
        b=gmCIYCJTadXnqYHg6ig19kyP7E3DyqXSUTkQ6oksMPA259Pe03TbD7KNPHjERiRik9
         0A2C15kbbOZknoe9I/nEjKlNAA0aHIA5XtARjG5VKbsO6BjQLI+ZRm5ZHPXVRXiSiVQw
         FbOq975O0r89+3pUajvo1HgZ7Ivd93xmHl9IdvgnANt+DC0jbc+3hGHVsrPXcnuYRM6n
         RgZrf1ll53pcVyRTdWP3qk5Q6Ii9gX1pufZ7ujyBmeyKNbICPH2cEqmbfwUsHHBKRisF
         gKhOoch+TF+1a40vpaRFzkEYA+l9RNyC+efLbv8c8IgPwFnBQemVfFPvy6eFqNEAX5t+
         sYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731944203; x=1732549003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEKo1LnFlWDTdn6dZMAURbf9LKsxfQWrYSaiKgMPlwU=;
        b=a71BEmg8K4PlAC7BAMhz3nPeRzY3rRiig5Y/21eZS8NFlBFpEak9//WnchNkaQ4nTI
         roI8J7eV6FhKL1DQVjnb0R1ob4cm8ZDcssXOPsKzt9ez31ufimcR29ZDfRdU7W5PmcS+
         RQs77nYAR2zvmljHviPssHNACZCqqhqoSeE3FCwTGgLoEhGtXl9/J5IkNjyopLrCiI3j
         gtrx1Bn1yNEyiSHK7MHpPQhdARQ2Ch0lhM2vXCE58Hu1uM7ZtbY/adY8pvQZAOCs421l
         3icIIpU9cpVLObive37u/51A91D35q4snVuHoll44lVOwZwJzfRRdFR0EOOLFV++h3zm
         zgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqJk1g8hjvzLHPSPs+PySJrODoKe+V88cWc+0OrdIENBy1EIbE/hARsXhTM+VB3U0cxx0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx85VTP5cXu2fz+SZ3vxqnWhwlu4In1mvxuD50Pgaf1Ofq8+XTM
	6wrFakZJMqDyF9LD6sw8M/rS856DH/UJeMxLP3twyHDFJdIAH49t
X-Google-Smtp-Source: AGHT+IEcd95ubIBL37xxzdGe7timBRl38iQzblD35wsDcgC8b8s1bMJjKf/cNrXEIvob+2HTG/uadQ==
X-Received: by 2002:a05:6214:c68:b0:6d4:10b0:c23a with SMTP id 6a1803df08f44-6d410b0c389mr93755366d6.3.1731944202927;
        Mon, 18 Nov 2024 07:36:42 -0800 (PST)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d40dbffff5sm37044146d6.34.2024.11.18.07.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 07:36:42 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <jesse@rivosinc.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>
Subject: [PATCH v2] ARM: dts: imxrt1050: Fix clocks for mmc
Date: Mon, 18 Nov 2024 10:36:41 -0500
Message-ID: <20241118153641.3775085-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <Mr.Bossman075@gmail.com>

One of the usdhc1 controller's clocks should be IMXRT1050_CLK_AHB_PODF not
IMXRT1050_CLK_OSC.

Fixes: 1c4f01be3490 ("ARM: dts: imx: Add i.MXRT1050-EVK support")
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi b/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
index dd714d235d5f..b0bad0d1ba36 100644
--- a/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
@@ -87,7 +87,7 @@ usdhc1: mmc@402c0000 {
 			reg = <0x402c0000 0x4000>;
 			interrupts = <110>;
 			clocks = <&clks IMXRT1050_CLK_IPG_PDOF>,
-				<&clks IMXRT1050_CLK_OSC>,
+				<&clks IMXRT1050_CLK_AHB_PODF>,
 				<&clks IMXRT1050_CLK_USDHC1>;
 			clock-names = "ipg", "ahb", "per";
 			bus-width = <4>;
-- 
2.45.2

