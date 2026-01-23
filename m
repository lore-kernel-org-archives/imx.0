Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE2F22339
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 19:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769197877; cv=none; b=BFLBSft10oOkOPDHWsTbAY2FSbY7ggYDuvX0EExU2+QOxxG89qI8bfKTNiDYwKoLnSxrWlB7RLeyhFGzpO212CXmiX71MxEh0mG2ErTjvSOu5A16o8ZnpLGCi6ai2jh2DlEoMY5SXO94gOn2h9imR145smR5HMz06hjQAJJh3ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769197877; c=relaxed/simple;
	bh=4cqSz3lY0LahuG/j0CMYaZzp90KYqJNiS3dbc0Xv/6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Acny3rirpdL2mVUIz9cqAAu/rV+Sk4UzLe3sBAdWWQpIx7tPV99BhIbF6hLRIMAzS4X17qyUnlx74Z/L5e6PY5P6NazhGkBZxQg1V6XVfdNRrk7hhYOklgAU1C20tuJlEqsa0aJxWhAI4L9riSvDKA0mNi/LUqajVlN+3A5g6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x+/fHXwn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x+/fHXwn"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43591b55727so2336803f8f.3
        for <imx@lists.linux.dev>; Fri, 23 Jan 2026 11:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769197874; x=1769802674; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UmphJA0oiA6TDyGHVSdklpPRPAEFYSyTBQggvAD3gKE=;
        b=x+/fHXwnalcuzrjnMSATO6WECpjUwQnGofqgCQvI/79en3zowGCDkIrgYhPu/fd7l9
         mEE2RHcrABQdsVjITp5gQaLcWg3x/71VJxw9Ma8TBFU6AytYR4G7UquBDm3nIrORAmsk
         QBd5Po8OVdeZbJWYWMsF25GqTJeNKO9ucNXk6+EisHhi4nglHNRPE+WBkOcs+eXjE7Za
         Nofti7YWFC6mJPMi6iqjBUMIxobveqAnumGs2mFAqHI87/uSujzoVf4CTIAQUQqMfXW8
         TptV3JzcYorP1vZh2YRUDk+bK85ZM63BjxYHS7hyucd6EH5bvIXYW9hgd46DuwGLmfYO
         46Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769197874; x=1769802674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmphJA0oiA6TDyGHVSdklpPRPAEFYSyTBQggvAD3gKE=;
        b=dw7HoY0rPSoo2JFBE28ZzpIlKpoU00x5va/UR9qsawmqjL9dmaeGgpSTthIZHlfvDm
         AYbQrQ04L5KFOa3mHHAFd+8y32n5RFPsG4m/+2jM3Ldbqg/ZZaGGvThjluchK/GjDCDy
         +oZLGovW8JzSDC9pjJ3VmkbhSvfZ6902gBE/q8FFzar9hTUFlsbRDBbN7ZSLPCa4mTCF
         wQgJtM/ux/m+Cyr6KmhPevAbE388JsRliEcLyWhW2BvPuHQrKjIVBwFkjdabAHnmu8yx
         LgU7Fn9OZLty7j1mLzlCaefw5b9tTE9LzdbjQhOvq265pdqzmSJDfjNg0KSP9Jnnj+ET
         WNYw==
X-Forwarded-Encrypted: i=1; AJvYcCXdicDxfC5BzNrxxLZ1Uwi0utljLTBfjpUVWCi5A6l4YTMk/7TSNzAQMmyt7HV1+kBwnIo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiWOju+DeQFXQmIrgWiIh3YbNQOsSLC2MHsZVMELjqiJ4md3Xy
	0USzfhiy5p88sjo9ioK8hh6q4ePHO3f5qX0rwqiUUglp4QSmv5HbsYcj2P3kIvG7HvhXksHaIMJ
	C1QeFN8Y=
X-Gm-Gg: AZuq6aKKXneca8lJZwadm4bY2OSgKhXhS0/Dz04PDL2k/rMLaAUSNs+6pETmMNqFNMA
	zckIXlnrlpBMYg+RLyEbyPFXTT6DHZJR+jtIsnMUZg1A1lq4tjcIPG47u+ZAZm3KL0XmfDDTouo
	tO14tJpD4kj4703yvUt4GPPGITD4psLi2BNaF0afSM37uNZPONtlSJFPiQO3LZ2SnUVwHlM3RVt
	7uLb3bSpofqQmXSOEoIs1rg18pOw8mhpSCLwD87hqDvjtGsX00991HIJZNMc3gBxPs2JBs4lKRp
	ZUFlGyQOuvh8sO0EydodUmQjwPYm9qHvDPGtcoaQkcuxo+ogC9fFsgTMl55qrvHY/PQB7TnUqXY
	J+e8r/GmBS60VAO5gdEqo1u7utaOzmBACjgJ5GMcWOaNgqCoAB30gM0STvcVGRgi4GFQ+ODycjV
	tjclNGNohluh2Pshzx
X-Received: by 2002:a05:6000:22c1:b0:42f:b707:56f0 with SMTP id ffacd0b85a97d-435b1605719mr7557722f8f.37.1769197874256;
        Fri, 23 Jan 2026 11:51:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f742d6sm8529079f8f.30.2026.01.23.11.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:51:13 -0800 (PST)
Date: Fri, 23 Jan 2026 22:51:10 +0300
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
	Frank Li <Frank.li@nxp.com>, linaro-s32@linaro.org,
	imx@lists.linux.dev
Subject: [PATCH v4 1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <8f2139e8adf02b485a4c84d558fc23f78cf04add.1769195864.git.dan.carpenter@linaro.org>
References: <cover.1769195864.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769195864.git.dan.carpenter@linaro.org>

On the s32 chipsets the GMAC_0_CTRL_STS register is in GPR region.
Originally, accessing this register was done in a sort of ad-hoc way,
but we want to use the syscon interface to do it.

This is a little bit ugly because we have to maintain backwards
compatibility to the old device trees so we have to support both ways
to access this register.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: no change
v2: no change
v1: Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/

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

