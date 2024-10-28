Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6F81DF738
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 18:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138967; cv=none; b=DrqGgJ/8Sf+w7aCX1srSvqIt1nFrwbrwlpYehFFP9Kjk/7+dQSKNZkwLgi1C/GbHtgmfR6lfyysVi4FIlY+8r7SQEgkaR8dHmdpNWfVqq60zvizklgsBBYqXwCgT9hfkU1yAvnuM2lWvZcH6LUY0cbsIN/O7LtNNfZpX6Ak12Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138967; c=relaxed/simple;
	bh=dMJuO+qu4mpCrDNRKJhLtNNK5f0JM9Q1jWozG+IgfM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Brp7CCD+fEZlPU/qmpZJXqNJNycvhqp4tiKg3deAbady2ZcPXu62TJW8PKzPyfx4jIXW2N7XB3+fTJR2dIsGegwx4OIxxAeE2ViVt0NgJnENFQjLqNkoFdoY4K45VJgJCrQ6nt5bjkBJ4N4DLFkmLLdQbIMIz52IscBlSeR6CrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xcoo3V3M; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xcoo3V3M"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e2bd347124so3498113a91.1
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 11:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138965; x=1730743765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eoe5fq9cwx8Acx4SnxJBzM/rUpD7RA4Aod7FbAKZ16A=;
        b=Xcoo3V3MG6Uw0sioTWx2XCG7INkLpkjweFFQMjVyTRFvE6Ou6uq2ZPV3i4A4s/gYFN
         E6MWGm1A44qn2Tx/ujnPMpVfwuK4HMsL+93L+xZEg6JhzYJnGyfXS+G2Dx1irJ0Ij8tR
         aiLnBW8ovZr0lTlW5EwVLj5i0jyKVKN8/meTUCeW8m7Ah/FXEVF4UEtQEvGxCYNFYuGn
         +svq+ETM6tMHgBwfJCTbff6L7SUxy/FxKmsTalyaFpBLfgMlur9cT+BEZkkE7J+3ZGJx
         IvRiN2HCYV8qYoSlr9Gc4FD3xmw26824ab9rAEQAuNhbOIa68GygrVX6gahVzxTwE6ou
         g8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138965; x=1730743765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eoe5fq9cwx8Acx4SnxJBzM/rUpD7RA4Aod7FbAKZ16A=;
        b=wnhTo52QlBMxa6W8aV2CeCZ+BabKCLyC4dTBVvJHnGzWbCJGgin3fohE7fpiK6jNsn
         Tln9sI0meZyQ70ofsc9oozC8XOfLkvAteM4m3wTN0hCamcltycPkvkAHx0iaG4nAhh5V
         JV1Iqm8p4Pmq6YttJuu8wLL35XXolvf9pRHlo8CmFD/oA/x3i5ZpGSxR8I6OMn1ImwI3
         +tt4PwStGNAVvzhEt0mdr7vFXHJxWFY15qUQxiu1KqNNYrIm1Eiraz155KO4u3fUTIRP
         2xwb+35bdHoK3H6nWuaJ3zTAx+D8eJO35qMGMaVlOauk/uQHXGsCYpdF3Oeldu5HhZRY
         LIiw==
X-Forwarded-Encrypted: i=1; AJvYcCWzJAnfh/vvde90PSxF/K5yqXLu6sdBnayT4MvVoZXaCziA49jN9PkpaEY2fogMBOjrja0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8+fQ8B/Vvwjy0pmYxrRy4AASdOMw1XgYJHAmIDNbNwHXuhgNu
	dI64hbj1JRroD7RPv8Uxgmgk45+EwDuSekYNAn1u1FlLCPEpTERg
X-Google-Smtp-Source: AGHT+IHSVF2TnOsPfO2+2FQhmWlLkKWH1RrgNcPWEjH8nM80YwzMmdGX1r3fDq6rR7zvn3hmH2wXaw==
X-Received: by 2002:a17:90a:6d26:b0:2e2:bf7f:3363 with SMTP id 98e67ed59e1d1-2e8f104c90amr9424883a91.6.1730138965152;
        Mon, 28 Oct 2024 11:09:25 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:325c:8d87:ee5c:f04e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3572efbsm7690441a91.22.2024.10.28.11.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:09:24 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	andreas@kemnade.info,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] ARM: dts: imx6sx: Remove fsl,imx6sx-lcdif fallback
Date: Mon, 28 Oct 2024 15:08:44 -0300
Message-Id: <20241028180844.154349-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028180844.154349-1-festevam@gmail.com>
References: <20241028180844.154349-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to fsl,lcdif.yaml, "fsl,imx6sx-lcdif" does not have any fallback.

Change it accordingly to fix the following dt-schema warnings:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index b386448486df..e56fcd9ee6f9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -1301,7 +1301,7 @@ csi2: csi@221c000 {
 				};
 
 				lcdif1: lcdif@2220000 {
-					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
+					compatible = "fsl,imx6sx-lcdif";
 					reg = <0x02220000 0x4000>;
 					interrupts = <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>;
 					clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
@@ -1322,7 +1322,7 @@ lcdif1_to_ldb: endpoint {
 				};
 
 				lcdif2: lcdif@2224000 {
-					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
+					compatible = "fsl,imx6sx-lcdif";
 					reg = <0x02224000 0x4000>;
 					interrupts = <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>;
 					clocks = <&clks IMX6SX_CLK_LCDIF2_PIX>,
-- 
2.34.1

