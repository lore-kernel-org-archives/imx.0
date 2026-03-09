Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAA137BE9D
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049188; cv=none; b=quEQ3xgIwqU6U3NQsfEaVHLJwSGh8eekfU8k3o29knWpfpagiZmRoda538Jj8i0ZFnRu3Rz1UPvr01xGsiBb7NmgfI8nQbTTxLSvxU/sahd20UnFWx/+kLwW1O3esg4H/PbWa2xI1LIcbk3gex/+II4NOvqBYxJipHcMtV1coIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049188; c=relaxed/simple;
	bh=INMNKE8le1EXRM/Gy+YDncLeGSL1UEoQe4AI13RNp/M=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=YnUvSJoJK6282xR7qkAmC7q+r0H/uR1+QJTiQqF+3sjq9xqBtW0+EhBXbg7Vq2OM8hTdp9UxPeUs31mPg8rAYKNlidrY14r8yxzKynaWed1p0TK/Oc3O5/BYzJf9O559nXmA5rXnoby4/os3z8NWP/hqz50AiGlusz9X7Emfd0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=q5g/Q0OS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="q5g/Q0OS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y0sz0jfCf5fn52CP1Am1XmKInKjkiBUk+d0U91h+UQE=; b=q5g/Q0OS9VK7JItXUeZ270WcY9
	S2prjCcsioDQiwNlG4cCLU3j/Bf/Z70GDbyc6jdsuaNnZHe4QPP/R1dIrLtU1HVahHJy2XIdFjzdU
	ng4B8/t6UseEjoQsWxFFkdi9zHPa3GbpFBptKdlsnKE+wgt/HYtNh9mo4p/dp1O/1ATDaaLszDpA4
	xjWrDzwh2/M4X1b/qV1C+vItm3DClU+dqXv1rOeMZ47V1eERlsycWspimQbz5wZVOV0gClcdFy9J3
	kA2P6vy4Z5xfict7J4XV1SP6d/9Wvb/ZK8Mg38EvHfFxb8PTtQOkpArLKQFcZ8QK9zt5Jb5Qzjdoq
	umzH32uQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50154 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vzX5G-000000003UW-0e3c;
	Mon, 09 Mar 2026 09:39:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vzX5E-0000000CVs8-40w4;
	Mon, 09 Mar 2026 09:39:28 +0000
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Yao Zi <me@ziyao.cc>
Subject: [PATCH net-next v2 3/7] net: stmmac: reorder structs to reduce memory
 consumption
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vzX5E-0000000CVs8-40w4@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 09 Mar 2026 09:39:28 +0000

Reorder some of the stmmac structures to allow them to pack better,
thereby using less memory. On aarch64, sizeof(struct stmmac_priv)
was 880, and with this change becomes 816, saving 64 bytes, which
is an 8% saving.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/stmmac.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 9420da96a4ff..411cdd3ea034 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -108,37 +108,37 @@ struct stmmac_dma_cfg {
 
 #define AXI_BLEN	7
 struct stmmac_axi {
-	bool axi_lpi_en;
-	bool axi_xit_frm;
 	u32 axi_wr_osr_lmt;
 	u32 axi_rd_osr_lmt;
-	bool axi_kbbe;
 	u32 axi_blen_regval;
+	bool axi_lpi_en;
+	bool axi_xit_frm;
+	bool axi_kbbe;
 	bool axi_fb;
 	bool axi_mb;
 	bool axi_rb;
 };
 
 struct stmmac_rxq_cfg {
-	u8 mode_to_use;
 	u32 chan;
+	u32 prio;
+	u8 mode_to_use;
 	u8 pkt_route;
 	bool use_prio;
-	u32 prio;
 };
 
 struct stmmac_txq_cfg {
 	u32 weight;
-	bool coe_unsupported;
-	u8 mode_to_use;
 	/* Credit Base Shaper parameters */
 	u32 send_slope;
 	u32 idle_slope;
 	u32 high_credit;
 	u32 low_credit;
-	bool use_prio;
 	u32 prio;
 	int tbs_en;
+	bool use_prio;
+	bool coe_unsupported;
+	u8 mode_to_use;
 };
 
 struct stmmac_safety_feature_cfg {
-- 
2.47.3

