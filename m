Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D91125DE
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 01:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729818570; cv=none; b=eqbsC49YSFvx+F++5ce0ALRf9UumcXZvGIsMgjFyXsPcQLrmeV0EqBsTcGA9G6kRjNN55L9GNgXU2869vdlwzMxW5XeTVWULbSZ6/8s2gLkJG9qDGNLTTx3BP3PJnjTDhCG9ePJXuUG0bsZ7br/090Z4t+SOC1r0FaB2sXcm4t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729818570; c=relaxed/simple;
	bh=kwpQFCul6ljSc988E5zCOYCV2xunq5crF6fjEdTWrw8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RJOi78o+4EpGAc5zZSvuNyuz8509lCcMVHaF7D8AKiGQY9Lh2iOkI9/mYmdxf+AH7zdITZiL8fYauG8GxPfY+988AvthyG6DPhbhFBPVU+ZT4XF2+87mhssDSYyr7NLtQ6eIyA3MbW0EuGchsBjFYUdncw8WqpY93DYzUlwHW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbHknaq4; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbHknaq4"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e52582d0bso1129331b3a.3
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 18:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729818567; x=1730423367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2I/3Lu6OBvOC4tuDnDafL3hhaN2i1Q4Fcz+C2/JdxM=;
        b=WbHknaq43l4//BFZW4pS31ko5h3zHeZMrtzaelpLrnHN5ntvUb5PgCG2dLh2fm2BxE
         ggMRsNWsXPDnPjURBloAL4EH9wAJRLM/OYltwQK6I9YaTSTM2MiJyF7vpBkN02tUF6Ve
         3wGIjdyK1K4lrxupLU/M0TkrDKUxTdnLxJPEpFGbyTGfEfynyot3Y09cXSUIPGVoNbMC
         fA4EbNvXdcz8al0cWPzXG/5ajB+I7J7v19yxhYoEmciUqS459ZKZApFPPOmDwP96ohcO
         dfTK7tenEZSkboGOnsNEQkxOOKFAHlreA212niGfQk05+F8fjbtBTj4rboe5wGdnPdoL
         oInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729818567; x=1730423367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2I/3Lu6OBvOC4tuDnDafL3hhaN2i1Q4Fcz+C2/JdxM=;
        b=QkXJmxmBM9xjoUpFtavrzLw2iJLYf7ECDLzIDZm0rEIuKHBGNG5NIm/PIFUE8jaE+5
         l10Gqppv1AaNhDNOcyrpucLJFTFSztIj7J+A6/tQRUD8+KIddnnamv4K3iIO4N8cfWuQ
         Vv/HHCpcm7YiNYmsl3d8H4zIcki05UUmPG6H4LUIucsfhIPxT3ZTSgRXsJTmFM2fbiMw
         3pFp/4Fsh0H6Iwjl6sZkOB15H5jSHV/9C6oIQ7LMbhnLGT7LaHSpV9TgagfnFXAnUSFb
         u45rJvzBlP+GcKcTYCyc860iLxO5K6W7H4wy6WUsljljNiGIWonE9YVDiLmPz8Lvid/a
         NrLg==
X-Forwarded-Encrypted: i=1; AJvYcCWAJ6y8OfGaZqd6tmNZyk6bl0ERzwN6SSeR79s8JPauIyLyJuH/1eECj6C67iFw+xMwvhI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcpnY9Z2HdkFV3H5xsfrlXELbSwTi1NFLltUGw9fK17HI1wP9o
	vSuFv8bEW33i6lqKxnNiT4IpmX7MsaCVU0nBwcJx8zsz/Rsm8WPX
X-Google-Smtp-Source: AGHT+IG0dZYus0dKlZXhILQCNo4QWnAtvU9O1prTfWjP1IqAIAetcVP41UgZHVHhX+1lDBk4WUiuGA==
X-Received: by 2002:a05:6a20:c997:b0:1d9:1dcd:b22c with SMTP id adf61e73a8af0-1d978bd014amr9387766637.47.1729818567100;
        Thu, 24 Oct 2024 18:09:27 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b93csm52875b3a.137.2024.10.24.18.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:09:26 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] ARM: dts: imx6sx: Fix tempmon description
Date: Thu, 24 Oct 2024 22:08:54 -0300
Message-Id: <20241025010855.1593365-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025010855.1593365-1-festevam@gmail.com>
References: <20241025010855.1593365-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to imx-thermal.yaml, the valid compatible string
for i.MX6SX is just: compatible = "fsl,imx6sx-tempmon".

Also pass #thermal-sensor-cells = <0> as it is a required property.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index b386448486df..a4abaee771eb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -715,13 +715,14 @@ reg_soc: regulator-vddsoc {
 				};
 
 				tempmon: tempmon {
-					compatible = "fsl,imx6sx-tempmon", "fsl,imx6q-tempmon";
+					compatible = "fsl,imx6sx-tempmon";
 					interrupt-parent = <&gpc>;
 					interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 					fsl,tempmon = <&anatop>;
 					nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
 					nvmem-cell-names = "calib", "temp_grade";
 					clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
+					#thermal-sensor-cells = <0>;
 				};
 			};
 
-- 
2.34.1

