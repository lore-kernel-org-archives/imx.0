Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD7F303C8E
	for <imx@lists.linux.dev>; Mon,  3 Nov 2025 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762170615; cv=none; b=m6f+CDAsj3WW6q3/r6SusHZvGpQ/FawmRMzjBF4YLkNlYcYcKbkYDF3fBNFgkaIUZFICPx2dG7n0+O3MAaDS7+mOe0iVOYHXmbSG7teyJbflfg8rGRWKqAAhs6MVNyEcYmuaGpmU3lc+4m18/RJXQCpJ2iJtlMz4qIIGEA3Ya50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762170615; c=relaxed/simple;
	bh=Nteud9/oOCc47AIU8V86BV7cVTyWkt1OwtA9ow7w+hU=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=nnqvi/VdDpp/yXbWMWGEPvsuitypwfaegLMZmEletC1xonZzk9A5N3jjQu28SuC0ZcVtuJgOzIhVzjXF/+NTUrKZ5suc0LzyMzK6T8/DZYehvEmJlLeSNa5s40lF9jv0S4JhwgUEpSpb+WG7SwUOi8vkXl9evV/XFI64laz3AVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=KgKlwfhy; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KgKlwfhy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4HA3ZOxKKxeIzqI7dq1d1qs69VYJLm1ozupEioRiy0s=; b=KgKlwfhyQUwztSrcLVCljvWo2g
	eSasz6BGPb5FLPB86aOCXq3YS4zZ+/5giHhALu13eqoLuSgAF8AnlXBlTNef0XS5N9FoNpX/b0ISS
	O6hzmJ4UTcF4ov5CQln5+4igQUBYnHOFhyanPYEbLTCU0BmqjUlPYYaHzdnGLpllGuuqmi2lgz7MJ
	61ZgIUECGBDC5hzDf+Rys34MCmwKHE1iN3ZRJgklNPkHHMaqRx630jtTCgi6f22s8CW9cPVh5SKsc
	shgK65cWzfMR0mFYpmKJBGbH936485mwSOnZGIultXqPAB8GrMEeezoxtJm1wz6tyaatytTWH2EYr
	Jn1PeUrg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39016 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vFt4Z-000000000fi-02ml;
	Mon, 03 Nov 2025 11:50:07 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vFt4X-0000000ChoY-30p9;
	Mon, 03 Nov 2025 11:50:05 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH net-next 03/11] net: stmmac: add phy_intf_sel and ACTPHYIF
 definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vFt4X-0000000ChoY-30p9@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:05 +0000

Add definitions for the active PHY interface found in DMA hardware
feature register 0, and also used to configure the core in multi-
interface designs via phy_intf_sel.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 27083af54568..7395bbb94aea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -313,6 +313,16 @@ struct stmmac_safety_stats {
 #define DMA_HW_FEAT_ACTPHYIF	0x70000000	/* Active/selected PHY iface */
 #define DEFAULT_DMA_PBL		8
 
+/* phy_intf_sel_i and ACTPHYIF encodings */
+#define PHY_INTF_SEL_GMII_MII	0
+#define PHY_INTF_SEL_RGMII	1
+#define PHY_INTF_SEL_SGMII	2
+#define PHY_INTF_SEL_TBI	3
+#define PHY_INTF_SEL_RMII	4
+#define PHY_INTF_SEL_RTBI	5
+#define PHY_INTF_SEL_SMII	6
+#define PHY_INTF_SEL_REVMII	7
+
 /* MSI defines */
 #define STMMAC_MSI_VEC_MAX	32
 
-- 
2.47.3

