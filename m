Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370CE2FF169
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594049; cv=none; b=KPle/Rj1MkH+hU3R1OHp3HsyoJdBk4hyXlpKcUYVjvfqYY2Y2sqLoWUgI3DGDfTdBoucPwWL1ty7g2a/NAsvHBjP1T2NhymTSPPbFdaSEAp7t5oRPENanI2xK+6pn91xYUJf0/Af+FfX4boF3h3f4pDJV/ZPb9mBOVVeJuRVYQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594049; c=relaxed/simple;
	bh=iUYNzaQn+dgqqmhuq2Vji7cyU4pKHLtBGG8gHzmw9NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uV0naeObASW5gyEOse9oj9pOevNHzXn0hjaO0XdXJoUxAEADkK/JRuupNlJ4y50OzQPa6JzzptWx7EzOMIyYWAyu3CllREPRwJb/JDs8wcISXoERM9jDkFfhDNkspfXmJfBIg+Yo5GxgJe+NiY3htVQUsN0rGsR/04p8FGxG0HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+gIDbsR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+gIDbsR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4807068eacbso2553985e9.2
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 01:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594045; x=1770198845; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/27C/CNBZB5U2mainQlNU7Fdsq/MruiST5P1Ff/65Ew=;
        b=e+gIDbsRZbLOZf6/YpcOSu0g/HDzcveiToFnCb2WHOcFrPQHw1B/B6PJcFazZkd7UX
         Q+pBlxU9UMJA6KWOKGYIAUWWFGFSzAg27Jjrsp+YWasWAoj2AB7CWXfDYHx4dPTBBm4W
         XA7H++1aROeD00jhg5Pw1bGSctEdUzxqBqQyhXJ8qOOFQwXn//pCg9w3N7N7dUDA7W4S
         AviV+I4tUl/+rS1QN8Ro/NJT0OnnlakaDcd+FEdDt7oejD1npD+jZyKgfwV7rbPONSYJ
         Xawh0QKTZWPOKlnFKP3DtxO7FfNHj45ZRNvg/eo2I+ASrd0/vLtAQwBOdp07Emqd6gK2
         DRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594045; x=1770198845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/27C/CNBZB5U2mainQlNU7Fdsq/MruiST5P1Ff/65Ew=;
        b=GdVfCrqF/FsHOuH4CpC7xzDZIk8ggN1UJJlit8+k3y8MpyJ6zrvG2+VJiYHIB4NV4p
         WgBZ90nkAUIlB9zFzKRceQf/Bv39knusv1JhTxHKm/HQV76rRWCtmmJKcXOXsUEG5zbM
         5V0d6udOw/eNamh04zd7lKk8ysxhsursS/pjlSkU71c7+VjB6CqZIt0ywCCyS9dIKRWl
         6WkWS7AgHDVcQ38xtFqMADK4ejRuq3JWTNqts79PDPskcipMbKpkQUO9nJQMJjT1XN3c
         R6HKnLfP+UX55e+aQZR9ozBlE/QJ9NQQ3OXow4KK/SOojNSkW7u2eQ4sKGJVIvBePqSy
         uD3g==
X-Forwarded-Encrypted: i=1; AJvYcCW1WgHuC7XSD3P6QCzf+2cMrv+qPBKRCJb1UwivtYs02AmgMV9XSMkz/D8Qh93jpUmLtdg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIeOJhbnc1s9iW8YIE/9jAv0pMhfnbA6t9pmyUNGXWqnUjoZPT
	F7ZEuIo8jsXy+rmlYqvCLhErcmQVFRN3+BO4t2C5szy6sbA36GqMp58e/+Bqx2fpLt0=
X-Gm-Gg: AZuq6aLXPZ9cOSdLRgWA/4tvu9GM/AJbImnsWaV4Z9Ywpesrw7zQdu4WJeq+s6S6nQG
	Fp92FaFFaN8MidoFM/J74gEnlImzxxHZe1GCdsBC7Lgx5udMiGQ7aYtzyF3wxoxPzLS731kPH3z
	ZlCu7x/Pg529OuxgB4gz7T676Iz9cXLy7HH0rxLMaw5RDIT97d/h5wxPjdXLuWap47lIKZaencz
	DH+lRmx0etTKQNrpN5fhpd9dKjU8D2UkuSwOmwwbsCWkNH8W9GfDoTlIMf7ehf3BcDiORoB5zHk
	uuwmhil6I0IxOPiSSYepLwYf181IZsSv/m0ByzvgJqAeia0aImL1KdEbxWqqzw5SWbhGyn+OugY
	ARsdWHZ2bvxNQh8MjwDvAqvrP7Y5rj7wxeJrwJQbdjvxU6hEMkSdQoWcSoa4gFpX6jXKng2uzv/
	i02czrsHsniE6vpaom
X-Received: by 2002:a05:600c:458a:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-48069c6970fmr53235125e9.19.1769594045452;
        Wed, 28 Jan 2026 01:54:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3d1sm51986545e9.9.2026.01.28.01.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:54:05 -0800 (PST)
Date: Wed, 28 Jan 2026 12:54:01 +0300
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
Subject: [PATCH v5 1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <b38f1c628cdac8e87271e5fa4e2b71110c15b42c.1769592679.git.dan.carpenter@linaro.org>
References: <cover.1769592679.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769592679.git.dan.carpenter@linaro.org>

On the s32 chipsets the GMAC_0_CTRL_STS register is in GPR region.
Originally, accessing this register was done in a sort of ad-hoc way,
but we want to use the syscon interface to do it.

This is a little bit ugly because we have to maintain backwards
compatibility to the old device trees so we have to support both ways
to access this register.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
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

