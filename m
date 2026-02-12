Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE34A192B7D
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 00:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770855529; cv=none; b=ZE2UVQ2niCZOFQVrFxMa5+G3s0NezlThiLhl1OdE8+zDYS6AtuglgGBq3GtXKb5gh3E8tMsimKLlkLFD3HtOdZ6Zr0ML8MAGMXwD4Fcc4vYbDIrcOA3WVsc70DDpZrQ2wET0ZjMl22lTcfZFi7tfnH+NtDKO3SP/Hsyus3rU4rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770855529; c=relaxed/simple;
	bh=9OODUR48P7s70ANoxxX+st9/5LE47BCK5cXc1LOs2qU=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=ZDoLbxAirGht4p/aeoXDdUlwue0+pKksaD5n7/GkbI9Kk+1Lth7DGXRjg2Jw7nWzXXqWdNcc6qg0G+3pDf6y0A+Cc1jf9pQdP657lm1b3/yElfdikp1Mf687zO/EAdJXqWgJJ0FiSb+oLLFb75B2upZgRHil0C2oQSmtpR/RlCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=GGmoLjNj; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="GGmoLjNj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g/dPLm7I5UAJCKjfkGzkcsxjUOFy/EJP1DLfT6d1RYo=; b=GGmoLjNjNPkCYfDu+72tKCarmF
	mdz9BFjz1zpTPw7dSqyBdSL4bpg2r4QzDo+TDODbsQNSW+/levMLEZHYvKhqh/sCB9kK4EPjlwPeS
	I+FvewPZLZ9lAPJsTLzs2QvUeqHxLyUighJgeTkRsTErS7j37IAHjxJyTyN/9ozcDkOEWXO02OBHB
	ngeTK+Grjpn7tA7+/zbCWKxLUcDwdVhQ2OfvTBqTB757PHfnv7MKbiCYHvL5gUJoDyf5uUhS7FBKz
	ypORCaBXnLkGtg+nqN/qpln6Rlnqe4Bnj5LQ91cDPoa3wULz/Knm52fqtxAJql8JteDxo31abNS/F
	s5rhLkqA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51176 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vqKPf-000000003qp-3XI5;
	Thu, 12 Feb 2026 00:18:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vqKPb-000000093mx-00Jj;
	Thu, 12 Feb 2026 00:18:27 +0000
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next 9/9] net: stmmac: qcom-ethqos: move SerDes speed
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
Message-Id: <E1vqKPb-000000093mx-00Jj@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 12 Feb 2026 00:18:27 +0000

Move the SerDes speed configuration to phylink's .mac_finish() stage
so that the SerDes is appropriately configured for the interface mode
prior to the link coming up.

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

