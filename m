Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4026430595C
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765809718; cv=none; b=DkztCEBW9b8KftgmB7u+m79ZKlYiBuy5zTerv4jHZOH40Cnh29WRz/eqzRpeQg6rypz3PKcwf6nDXWe/LQ6khaYC2PpJZDA8prPC1hChaLchq+UM8wzhXUbtaNEWw5bETtr9ZXQ6saX6ceDYosrUl2JFlSC2V8H3QPbIr8hNF+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765809718; c=relaxed/simple;
	bh=RDwklFHaFNSV++/BoiPNwCn/lAhftfIyvmWeyKBJWJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vs0sSMvt4MJ3rFZBEWSFDpVYfmTszC7zz7UFCReRQ4E/cXvp4XVxoL9cCRDY0vjcjkfjej81WDk+9tBjXJu7KVqOcHnfK6mTGhc3sMEwFTfFoFjVi5xYY0SaG13XFB3PBMIWQ51QMxlnO2YqxRdE2j71ZCd4VQovuojpK0Ea7iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QdJW+hdK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QdJW+hdK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so21303925e9.1
        for <imx@lists.linux.dev>; Mon, 15 Dec 2025 06:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765809712; x=1766414512; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYKorhS7YGhwUqCGDk14PflDiZGeXR2MSlBlFfYQc3I=;
        b=QdJW+hdKSygY62D6TSFyDVLAFWR3UxwMCnWIWOcuZK6Ye4oR1T5K/M/yggzytRclhz
         L7l/A6tbxEH2Q9s6z29yzBPVNSjloUbFYrszAev1IzyeG9/+FL89p+1E2K/KUW+MZUmL
         54IPWdr2kF2isb9EbhL9p/OKnGQcCAuv65rAz+LTn2cELvtD+Bg3OJvu29hVj0dTOvIE
         000jPMR4GjnCEzOvCsezkBiK6P75hLxBaCA6J5bKFGhFIAXoID3nu7TGBWtLzbhkJAJV
         d8Be8TTVqMGJASR92wd7C1A9JZYWRES0tSPOJRwfUDzB6VUWyKOOShlMlN+tmHaaDxyd
         mmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765809712; x=1766414512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYKorhS7YGhwUqCGDk14PflDiZGeXR2MSlBlFfYQc3I=;
        b=C/hXvCiXAoemdocvOg6xdMQx3TeGMXJGfuC5A3RgNnVTIlMgxtO74LmvYClgvOOj5j
         vcWNFruxBcyE573P3/DWniJU/QSEsokinqRoKA9KRrft5Ms7GktUFsGAFaBK4mSl+c1W
         X/KK8hmMl/udxpCsw3yLixUlI8CcY55Mlms9ygBgsGmouviyFvIZ4P4pWUx8G3Vkq24D
         p8/ln8bZ2OJ5s0AG1P7iN/wGks3p7voQG7RLZvsvhCf9FX2jbIqCk60oetzG9YDd3pxh
         g26dXaESNux04QkpAwPvEkWFlHUiRBJ+HwZYiUz/XzVA81w2uRObtrElG2B5W+qnWflG
         spdw==
X-Forwarded-Encrypted: i=1; AJvYcCVC+U2rNMeXJ82x6qUp94bp00I0Qe5Wqitm0vag5WEXLiU+X5aB28D75gLNUA+dk3eaGHQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGY01pTnlmYlyP9Q/3BFwoAbQJyUYixpfH2xqD8SDZA6mL2riA
	114lnvtGYRXScD7gYi7jOhvXkMdcXdUxCpDtEpM99sntvvt7VRWE6gFH3HCLlegWhUU=
X-Gm-Gg: AY/fxX5H+Zgc8ptELk5AfLjgNBv2pyU1GIoHNs0648dUEs/9Svg1p0QwDZFM69I/DRg
	9H9jTpQ76jnKDjupV4grDlWIFbDos2vQOydCw8JwTg1jM/8UK/+pu0eLNRQKPvzYzVyaBtddkE1
	1Qh379v13e8RaYjTnnkkFzdR16TWZxyHcDfj+D5Ys1pxgimwl3/vgajv8jFsnsYIf/d/xaQ/vUu
	wayyENRa4/qhRyiDJchBQWxevFAxEKHKC3v47vd9JWBOKNy8WSyL8omGrQZwggnykFYMW9Jor1J
	owCIAmTQfCCKxWf2+WGJBcejh4KO/UJ9y0d7oqdQ3byy6WzCVWdKwpYqczjrbRbbW20b60v4qsR
	BJSAUSdwBwvGSzm8fJTBgkFWQY3qGHJ0l94P1O+SatqRDuAriJzCI2NUWa3QGfFAYHl4Gje6WUJ
	0Nc3dy9GXzPwM4ew2l0qAVHKa7f5U=
X-Google-Smtp-Source: AGHT+IEW/XhvEhUWKukxpWXuAbDWYWTlu7iooVXodta81YuWRVJW/8nSpMCMutfNZkEu59rJRR8Kmw==
X-Received: by 2002:a05:600c:35c9:b0:479:3046:6bb3 with SMTP id 5b1f17b1804b1-47a8f906f07mr122335555e9.23.1765809711699;
        Mon, 15 Dec 2025 06:41:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f8d9a06sm187528625e9.10.2025.12.15.06.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:41:51 -0800 (PST)
Date: Mon, 15 Dec 2025 17:41:48 +0300
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
	imx@lists.linux.dev, linaro-s32@linaro.org
Subject: [PATCH v2 1/4] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <f7ee93f0a8c6d6b9de3f2b37da9e038bfa7f290a.1765806521.git.dan.carpenter@linaro.org>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1765806521.git.dan.carpenter@linaro.org>

On the s32 chipsets the GMAC_0_CTRL_STS register is in GPR region.
Originally, accessing this register was done in a sort of ad-hoc way,
but we want to use the syscon interface to do it.

This is a little bit ugly because we have to maintain backwards
compatibility to the old device trees so we have to support both ways
to access this register.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/

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

