Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3737E34D38B
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840220; cv=none; b=mjXuMD786wH7LBplEaCTkhcrd6H44fewiemHY+TBPrDXu2b7tophhfpTGnoM6/CJZ5UMs0mU5Rq9NKVvpE2wyFUTs3eBJcTUBIvRZ+FQtSh/zd594jH2yuLJ1HVNpavh/nMAbWK8s+Q3JpYVBniA0rvBCQyPgisnIDI/nz3Qtzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840220; c=relaxed/simple;
	bh=hoAdNNQI7FmI2xcXA1yk3dZBgIYDfssS4iSSl9UyKZo=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=g+xXFuloVIYABzM0rr/vQkALti+ZG0vFg3Opnr2zaeBlHKWBjlUsBxB5L0+l5/UETfo5XUvQjye0uPjJyQB19ZCs5eUOgwhyr/b5/nnVHK0DUCTHvozj8liaDlwVcSlyiPdeVda2WyGuFjnMwjR794oSV0PHo/+bHTUeJtAgpEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=cGMfUOBA; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="cGMfUOBA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GS33NRxkv+fgttCEmLVEkBJYtvp9t8DVlhBawrutpAw=; b=cGMfUOBA/3A5BvLZ44fkXyFZoa
	5eCqfisN59sqEy8xi7Wi31AWSw/yUV8wLBhQbB23wNCO07H9fehwjmxXHxHhlMivxvsr6WeO3eY0X
	0xMc/qy49qfMt/XKL+v5l5ItOSH5ESpzfXIhM9Xr85yGsIXaE2QHOaf1nxaDZET9ImTh0SY/EsUuk
	cwIlecb5pOms4cxJQdxRpeJvfshL59O6qkHAXscumm0Ec8Msk51BH/fmcpFg0ehuP6DJEWbBgcslD
	I9OdGHEcWcL6JUsCBBuwxxIN0ESUW950ABnNadB5a5w2cibc/V3xP5rJpsEbKf2x15QtNAIhQIMo1
	8UGQCjJA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48936 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuSLJ-000000003oF-05YF;
	Mon, 23 Feb 2026 09:35:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuSLA-0000000AScc-3RFf;
	Mon, 23 Feb 2026 09:34:56 +0000
In-Reply-To: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 09/10] net: stmmac: qcom-ethqos: move SerDes speed
 configuration
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuSLA-0000000AScc-3RFf@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:34:56 +0000

Move the SerDes speed configuration to phylink's .mac_finish() stage
so that the SerDes is appropriately configured for the interface mode
prior to the link coming up.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cd6d1660bdb2..153f6abc77cd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -629,11 +629,6 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 		break;
 	}
 
-	if (interface == PHY_INTERFACE_MODE_SGMII)
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-	else
-		ethqos_set_serdes_speed(ethqos, SPEED_2500);
-
 	ethqos_pcs_set_inband(priv, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
@@ -692,6 +687,11 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		ethqos_set_serdes_speed(ethqos, SPEED_1000);
+	else if (interface == PHY_INTERFACE_MODE_2500BASEX)
+		ethqos_set_serdes_speed(ethqos, SPEED_2500);
+
 	return 0;
 }
 
-- 
2.47.3

