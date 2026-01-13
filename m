Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6439234575A
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313620; cv=none; b=Wdt7I480DiE3OTa8jVz6S1BwEvvS0JfaNiDNjw9zGslPXvlMlT0nyeaAWWvLRXkaABjeKaVSg0f7ATqfcIKPCJswF1s0rWhbIA4MlhJazI3hq4lXcCD7IAC6XmKHNnpGrp2XTtVN2KTO6wJ3Wykk4I/5wmrrfYwfAa8Gg4eFe5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313620; c=relaxed/simple;
	bh=aFzpFhk4WB8ER8iXc03ENFWqRvSrvcCN7LPdyY+0lyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibOdhfBujPcLD/LijMBein5/mwk3U2W2xDFiN8VuinBw8FBuJmrk45qYtOack5TOKL72J3Hm1vOyO5xFMPKOTu6ChyDBnlUVzEebja3xXhsbk1xYurelMaH63UaMNMEjpMvBeBc+3qPxV91CxD5Pf4fkDYXzEfADlyE/Kn9553E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dfKguZJ2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfKguZJ2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so76618615e9.1
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 06:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768313617; x=1768918417; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TyN9CjZVHq/sRLIyiaBUmdg0t2143/50j9chMJQ/vMY=;
        b=dfKguZJ2snCDjsk2dxu4aoQlOKB+ySMQI6v8j4PRW269eM/xoru9AwXFhJ/AVAzuYP
         Vz+/vBmsYOMR9Rw9Wq93UzRFnt83d7d4Qgc60UR/nB0/EWgeamdp/S2tnWEO4uSfBeCm
         KJuyHDOTrbFye3002Ac8B/oHKu+sIIvUgiuytBpw0R9Y4AcCEW7HtLxZ5HwbicyOXnag
         zqdj08DdoMArrcSjcHHIRwQaTGkdxbm8aXAm5/D3/gVRltADxUMaXnTDClMstx2tPFtP
         Dc7rfRKA42QN9EjfTz5ZBkccPMYx7h4mmxkB3GG4K1sA8X0xOzL9Zh+7DWSI9CrAY0zU
         1v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313617; x=1768918417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyN9CjZVHq/sRLIyiaBUmdg0t2143/50j9chMJQ/vMY=;
        b=ASEehvXNE5AQUBNVGqAO6HZq86PDPKmy/qkynEbXydIKBY4pcbSpqGTQgP1Z1YHKpJ
         HmKj40d+NxFHIhIsJMd3zzd0jyeM/llhqXJGPl9/j/9+ANGKIgGAmjExreBXkm8c6qAN
         sS91oyvhzri3sqzKc4KGBd1wv/TthwspPVPZrLdhAPIFOkhPJ1aML9PiXZvR9ZsjDUco
         kDIOxrEObrLyzkn/2ETC79DtvChgWjBjzlXnsdACPl6JOpGbCeMwCNlgdymVGbytDRy3
         IVCiJEnNsRCctMsOVO5341eed4eWDZI+wtkTOfCZ5pRkg/Vm0bb03SpMr9zXK7TUYdTz
         byfA==
X-Forwarded-Encrypted: i=1; AJvYcCW4MWJzmKmFOBKdwxyZb9YjwxlolJNcT+08aLx6uqxiQW+tdJaUjqlhqwE6IdU264bXm+0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu1VRTEjPHfc8uzdXaxkUP20T3GcR+EfVhiWP2Q7PM6PpQPYqr
	aic3zv7M/vobvz8npiPDS6q1G2QknBMEOj+cDFkMFN/VQlH0JGu2KZ8s3a3kIoOePw0=
X-Gm-Gg: AY/fxX6zGFejstonDDeFKflFcW+h3FiPby/acFcqJBQKY+zevFI3CexyiPjREVw+V1j
	3VvpFOp3o6B79TEzDOK3VlVN9+bv+eaB5Bn80+UmbptCGN42acZf52h9DJ3NDTCfifvdSWinltg
	8YzUCKdlVmm29K+E+s/ZNm+9WdOaXw6kmLj6S/+cAPfeCyKID39gAmDKWQgunS4z9Ulj5FZWup4
	PNWERxPAi/wERL+5BrGwoyTqUA7omZKQJRCEa2FHgsMnHGCDZrOQApjNwH4qxlwJRMBsRMkEEIt
	b1qmVUCMEtmqBzeXoar9DOCUrIwJ1V4jBJXuYS/rSp/6hZqsW3lp6siQkuchyudVbr2rpd9h9qY
	smcJZdmVpBtdw3xxtkhXPVOSXD5vmCaXc/Tjk7HSwGImbGoxtEj6m863jXvdHVZX9xw10Fy2Km3
	Ndqe2w0GJYDFx0LTzh
X-Google-Smtp-Source: AGHT+IEV6roObAcijlx4iVb9hdZfVlmXIQUK0U2XACejoOBJ5fxJJv4g1ZBGNz5KDAWxxOTyVwwC4Q==
X-Received: by 2002:a05:600c:45ce:b0:47d:264e:b371 with SMTP id 5b1f17b1804b1-47d84b30d79mr233877785e9.18.1768313616542;
        Tue, 13 Jan 2026 06:13:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47edb26792fsm33518525e9.14.2026.01.13.06.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:13:36 -0800 (PST)
Date: Tue, 13 Jan 2026 17:13:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>, Frank Li <Frank.li@nxp.com>
Cc: s32@nxp.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, imx@lists.linux.dev
Subject: [PATCH v3 1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <30e6a67514e97e798905872e2907b5b005ff2292.1768311583.git.dan.carpenter@linaro.org>
References: <cover.1768311583.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1768311583.git.dan.carpenter@linaro.org>

On the s32 chipsets the GMAC_0_CTRL_STS register is in GPR region.
Originally, accessing this register was done in a sort of ad-hoc way,
but we want to use the syscon interface to do it.

This is a little bit ugly because we have to maintain backwards
compatibility to the old device trees so we have to support both ways
to access this register.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: Unchanged
v2: Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 5a485ee98fa7..2e6bb41f49e1 100644
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
@@ -40,7 +44,10 @@ struct s32_priv_data {
 
 static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
 {
-	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	if (gmac->ctrl_sts)
+		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	else
+		regmap_write(gmac->sts_regmap, gmac->sts_offset, S32_PHY_INTF_SEL_RGMII);
 
 	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
 
@@ -125,10 +132,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
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

