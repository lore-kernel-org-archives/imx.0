Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F772E06E6
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769779189; cv=none; b=lE1YduGiPCrp/iI9k6YUQHHnhluPMouAiZLou4lZex3ZsowYndM2g125dLfLz/SRYCw9DM7GGBAUs65k2nUUnL7h5MvVC4e6GYWMUx2wVm2kIJwVnJy1ieT+A0+cCqFg4+xh1RpExqsBKxiLuDrbn4ygO1ZsSofPG080PSfvGK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769779189; c=relaxed/simple;
	bh=JIWN/nz8WfABssRSPSTUU++BJd0SMkAIZLvPDkubCn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfYIXAKok1Cb8+zWV/MFDt4WB+0BchjaCvVdr1H0HyI1REy5IkL7YGwSzhLhn/3hGHQuDwRIhvQ7lXWBFd+8JkVlHT/h//JdUIYnRo3eZZdKfj00bWAqgLMcJTlv11/QBe/rAl+byJhuV824j0Xp9bBVYwjOU+iQR9/mT83biXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SNA9ULHY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SNA9ULHY"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso18850785e9.1
        for <imx@lists.linux.dev>; Fri, 30 Jan 2026 05:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769779185; x=1770383985; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LftfxHAZaora2yPEdmX+khpJwn0jgto61bYSOyCgE0=;
        b=SNA9ULHYkUxSmKG93ea6e8DLuM/NMj+WJmSMJsKPqKgQQqnq32TI9UJQTSk+JGLnLy
         2H36wTbiO+ibD4mSdlBt5qDexMLu+95yNyj2zqXLIEeHzDjlWL/sTHY9HKz8V8S7UTj4
         TM74SMtT1HoQgLlhXlpsHWet6huGtnV3My2FtgBj1okHSYeAUHJhXMyBkrTKGExLH4Cg
         5SBhvUK9pF3mY5r83NBxFT2PJ9q7Qn379kmrZ+xOa9k0Wh72Qaml27WE9XCXEg5RicxA
         YVhILyauYf64yku8x4abZHLzL4FKPmqhanOKicd5QXCqLOkhwBguQFaftqSIUOx4kkE1
         ydXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779185; x=1770383985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LftfxHAZaora2yPEdmX+khpJwn0jgto61bYSOyCgE0=;
        b=FJeToAKx5lLcGQAyD/iCnw82e8ED3SVmpAM4MH8ZORJlLVVN1bKOOWRQ/u0GIRxCar
         44Yp6FU0zD6zOQBkRP5K5kyE0sOurJABx41S2O47k5pAgexHdlDAXicaVVN3tpsRkFuG
         0hWv41hEUvVHcNnwDAyj9SBBooGiOpoMjqNd9+CKMKgjol8ZuYb+1LthohCnxQckuC05
         isj19V7AUcNgCZWgJZw0KiHrBTJ3sqQyY1Oj/pDYTnHkHmIVxQ7IHUXxutV1ix4CBR6v
         624nZzgBssAXOu6fC03QkPaevP6VvvaicuhYUMx5yx+vdS+E0t9UV944YdqT0fUbGYH6
         h43A==
X-Forwarded-Encrypted: i=1; AJvYcCWiU3EF4tJ8PPdY5qSNhVCPe0EvpxlIRVwk+mhhvaRLuIZvcYM2F5eB0VNyEtd1AJxyKb4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuLwUvHynC3glnpaanLsx/Y9IH34ndILaM10ao1lYze7qTp3x5
	EzDzMXSHZZlatSCPHNbU4CUuLpWd6qHvRrjRguAFS811P+WePq3f/2bjHzr1JsOmxnE=
X-Gm-Gg: AZuq6aJsMVM2DHI05KcQLbNvrE7pPmO2MDrsaAAWMWJn94E/JBHuGRdx9G2E8PKQHmq
	b10sjFBRTHK5ij6WokWZ6FFzgJAM/YTLVVpNqLJCT0GfUzg1Ekrtsq0nDwJ66BtIHwUC64Ywopy
	fFnA+DfxHqS1//eCy65RTGTAQtrbFJFdSvI41DWRzopw1Tk6zCDVxHuB9TIhoLGP6XknbS0/tHX
	dtH7lxaI5WxG4TuT4lB5eJaSSGFtFx6bDLVBmMvf0ebR7Wx8HQKEsV2FdeyI7M0adWwWOxVnMBH
	OQ2rPF3rdrpquuZ86n2QQhLYbR0GzArIzBfFSCZPG4HbotTZihiaXeLGTCaitpeU0awi34ZS4OE
	IjzIr9dhNm0hcspC/SMX9ufnWUvCqPzEsn7U8he5pB5b6dHdJBvFxW5jJR2fl8lLMZ366PVH2jk
	1Xx6Zr6lKh8MMj4Yyv
X-Received: by 2002:a05:600c:680a:b0:47e:e051:79ee with SMTP id 5b1f17b1804b1-480828745d7mr89683285e9.3.1769779184609;
        Fri, 30 Jan 2026 05:19:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd77b8sm200882875e9.3.2026.01.30.05.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:19:44 -0800 (PST)
Date: Fri, 30 Jan 2026 16:19:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Cc: s32@nxp.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, imx@lists.linux.dev
Subject: [PATCH v6 1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <b6b60d03344d070b2b4db7f0f00527f166e594e0.1769764941.git.dan.carpenter@linaro.org>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769764941.git.dan.carpenter@linaro.org>

On the s32 chipsets the GMAC_0_CTRL_STS register is in GPR region.
Originally, accessing this register was done in a sort of ad-hoc way,
but we want to use the syscon interface to do it.

This is a little bit ugly because we have to maintain backwards
compatibility to the old device trees so we have to support both ways
to access this register.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
v6: Add Jan's R-b tag
v5: Return an error if regmap_write() fails
v4: no change
v3: no change
v2: Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/

 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 5a485ee98fa7..af594a096676 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -11,12 +11,14 @@
 #include <linux/device.h>
 #include <linux/ethtool.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_mdio.h>
 #include <linux/of_address.h>
 #include <linux/phy.h>
 #include <linux/phylink.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/stmmac.h>
 
 #include "stmmac_platform.h"
@@ -32,6 +34,8 @@
 struct s32_priv_data {
 	void __iomem *ioaddr;
 	void __iomem *ctrl_sts;
+	struct regmap *sts_regmap;
+	unsigned int sts_offset;
 	struct device *dev;
 	phy_interface_t *intf_mode;
 	struct clk *tx_clk;
@@ -40,11 +44,17 @@ struct s32_priv_data {
 
 static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
 {
-	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	int ret = 0;
+
+	if (gmac->ctrl_sts)
+		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	else
+		ret = regmap_write(gmac->sts_regmap, gmac->sts_offset,
+				   S32_PHY_INTF_SEL_RGMII);
 
 	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
 
-	return 0;
+	return ret;
 }
 
 static int s32_gmac_init(struct device *dev, void *priv)
@@ -125,10 +135,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 
 	/* PHY interface mode control reg */
-	gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
-	if (IS_ERR(gmac->ctrl_sts))
-		return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
-				     "S32CC config region is missing\n");
+	gmac->sts_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+					"nxp,phy-sel", 1, &gmac->sts_offset);
+	if (gmac->sts_regmap == ERR_PTR(-EPROBE_DEFER))
+		return PTR_ERR(gmac->sts_regmap);
+	if (IS_ERR(gmac->sts_regmap)) {
+		gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
+		if (IS_ERR(gmac->ctrl_sts))
+			return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
+					     "S32CC config region is missing\n");
+	}
 
 	/* tx clock */
 	gmac->tx_clk = devm_clk_get(&pdev->dev, "tx");
-- 
2.51.0

