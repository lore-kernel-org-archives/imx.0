Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.121.32.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582960;
	b=JX4KB9ffmsHd9nxsEV3sVPqjZTSstsRd4s0uBnl7wvpbqV2cuhT8PEKwePERXInSGQTc
	 hUlVTwTk5+UBxW14CvFhH1umluV7mRuAxHa+7Shh6BEXrPyO8pXPhu6wMUHxK27dzFjdJ
	 fPsivEm/Mpn4HdOBqEWAMYQg3YIZHsuwQQspfb8tsZ4pjKSp6cZEqi9f8iyP7eb9aM46S
	 M1hyNTdGjHZfUD9A2Q5okmDOnWdLSvsJ5p9JoXcEU2P8KPYCYIeAbNfhxmo0Ff95z4ghR
	 TKlH5yCQmj1+cLANW6+x+aTo/HIZmo1W5CivFe0k7pgSklpCVbya1mpwZ2bfz6eVqNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582960;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3Nya1KSrvobXnumd+w894vKJxdCnwbZg0vMhgegdGtk=;
	b=icE6mEKK/LodWxQG/HrvSnBq3D9P+NRC3Q8/ukSQTLi6f4s4sn+kLneHbEoyOIv+D56s
	 t7PZPp0X+xVcrFEfGfiOMvjWjm6MAQPR7EuKV0lo3Df8hitM+ABKb8o70EF9gXD3U/dEd
	 4JXWM/cRBNKUIrY+O6haSiLCcORTEvoqJd+K/8Ga4Kd6wJeYeWheJdiwGajT6j4Oo/IFU
	 WtB/BomBwCpy5aG9bbuSO6Hyi9O0ju+wIwkoRwpgTsdYBlH+nG4WLTwwkQfY0jV6LoXKT
	 S98Fc3cZU/hSU3k0tqufr+afxBlVVw3VL1dm9X2xyGaM/i2lb4zpzzD3AKd8w2mLfPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=nselector2 header.b=qBO07gG2;
	arc=none smtp.remote-ip=92.121.32.54
Received: from inva129.nxp.com (inva129.nxp.com [92.121.32.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BE5606A33D
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 15:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18BE5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=nselector2 header.b=qBO07gG2
Received: from localhost (localhost [127.0.0.1])
	by inva129.nxp.com (Postfix) with ESMTP id CB1496080E53;
	Fri, 13 Nov 2026 16:10:14 +0100 (CET)
X-Virus-Scanned: amavis at nxp.com
Received: from inva129.nxp.com ([127.0.0.1])
 by localhost (inva129.nxp.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2K1XU5eukMn; Fri, 13 Nov 2026 16:10:14 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva129.nxp.com (Postfix) with ESMTP id BFF816031FBC;
	Fri, 13 Nov 2026 16:02:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva129.nxp.com BFF816031FBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
	s=nselector2; t=1794582162;
	bh=3Nya1KSrvobXnumd+w894vKJxdCnwbZg0vMhgegdGtk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qBO07gG2Yzx5nbmL3yDdnG4emipABTIm0j7hOS+G8X0tcZlCa2yrCTbWxrQPiVaez
	 L4162OBuP78Ors2DMch1QPrWNIJ9ULfEsquTPiIqc6nXc39Fk6FDW3ExOgS6yVmP+0
	 pEiSgsPfHU3Rbeep2ZfR6r98HkqrtFnixvAA35kmmB7At0apMNLzEJW4pbZjZ54LzY
	 XtBMPdJzw0YPbX092l82cLlDfRlmC9hv2jpMQHoOuH4Qnrq8iwj+8UURtdMCQmBLud
	 pY8wQADqJ0RMXGLZ8/3rdodr7ZjCZRRZWuN0DXMaalxJSuzv4OPnP8DP+MB/1RMBVV
	 SqHjQYuPWF9Qg==
Received: from lsv15141.swis.ro-buh01.nxp.com (lsv15141.swis.ro-buh01.nxp.com [10.162.246.138])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 96C0B202B6;
	Fri, 13 Nov 2026 16:02:41 +0100 (CET)
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: netdev@vger.kernel.org
Cc: s32@nxp.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 3/6] net: enetc: Enable probing of version 4.4 devices
Date: Fri, 13 Nov 2026 17:02:34 +0200
Message-Id: <d783ccebf4b38bfd1e2ede44c36682269a5bc68e.1794581338.git.claudiu.manoil@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794581338.git.claudiu.manoil@nxp.com>
References: <cover.1794581338.git.claudiu.manoil@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds driver data and platform info entries for ENETC v4.4 PF
and VF devices on S32N79 SoCs with a 500 MHz system clock frequency.

The ENETC v4.4 devices are present on S32N79 SoCs and feature only
Pseudo-MAC ENETC ports, whose PFs use either the 0xe101 or the 0xe110
PCI device ID, and the VFs answer to the usual device ID of 0xef00.

While the ENETC PF instances are usually designated by the 0xe101 ID,
in newer IP versions the 0xe110 ID was introduced to indicate the
power-on reset default NETC switch management interface. These IDs
do not indicate any functional difference between the designated
ENETC instances, and can be interchanged and re-assigned at boot time
(i.e. from firmware).

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
v4:
 - Added a leading sentence to the commit message, stating that the
   patch adds driver data and platform info entries for ENETC v4.4
   devices with a 500 MHz system clock frequency.

v3:
 - Added sysclk_freq info for the v4.4 ENETC devices.

v2:
 - Described why there are two ENETC PF IDs in the commit message, as per
   review.

 drivers/net/ethernet/freescale/enetc/enetc.c  | 26 +++++++++++++++++++
 .../net/ethernet/freescale/enetc/enetc_hw.h   |  4 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 855b2d3b8718..e3aa117d323d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -3840,6 +3840,20 @@ static const struct enetc_drvdata enetc4_vf_data = {
 	.eth_ops = &enetc_vf_ethtool_ops,
 };
 
+static const struct enetc_drvdata enetc4_s32n79_ppm_data = {
+	.sysclk_freq = ENETC_CLK_500M,
+	.tx_csum = true,
+	.max_frags = ENETC4_MAX_SKB_FRAGS,
+	.eth_ops = &enetc4_ppm_ethtool_ops,
+};
+
+static const struct enetc_drvdata enetc4_s32n79_vf_data = {
+	.sysclk_freq = ENETC_CLK_500M,
+	.tx_csum = true,
+	.max_frags = ENETC4_MAX_SKB_FRAGS,
+	.eth_ops = &enetc_vf_ethtool_ops,
+};
+
 static const struct enetc_platform_info enetc_info[] = {
 	{ .revision = ENETC_REV_1_0,
 	  .dev_id = ENETC_DEV_ID_PF,
@@ -3870,6 +3884,18 @@ static const struct enetc_platform_info enetc_info[] = {
 	  .dev_id = NXP_ENETC_VF_DEV_ID,
 	  .data = &enetc4_vf_data,
 	},
+	{ .revision = ENETC_REV_4_4,
+	  .dev_id = NXP_ENETC_PPM_DEV_ID,
+	  .data = &enetc4_s32n79_ppm_data,
+	},
+	{ .revision = ENETC_REV_4_4,
+	  .dev_id = NXP_ENETC_PF_DEV_ID,
+	  .data = &enetc4_s32n79_ppm_data,
+	},
+	{ .revision = ENETC_REV_4_4,
+	  .dev_id = NXP_ENETC_VF_DEV_ID,
+	  .data = &enetc4_s32n79_vf_data,
+	},
 };
 
 int enetc_get_driver_data(struct enetc_si *si)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
index 2c9d9042eb0b..8e6a9d366d40 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
@@ -414,6 +414,7 @@ enum enetc_bdr_type {TX, RX};
 #define ENETC_REV_1_0		0x0100
 #define ENETC_REV_4_1		0X0401
 #define ENETC_REV_4_3		0x0403
+#define ENETC_REV_4_4		0x0404
 
 #define ENETC_G_EIPBRR1		0x0bfc
 #define ENETC_G_EPFBLPR(n)	(0xd00 + 4 * (n))
@@ -1048,8 +1049,9 @@ struct enetc_cbd {
 	u8 status_flags;
 };
 
-#define ENETC_CLK_400M		400000000ULL
 #define ENETC_CLK_333M		333000000ULL
+#define ENETC_CLK_400M		400000000ULL
+#define ENETC_CLK_500M		500000000ULL
 
 static inline u32 enetc_cycles_to_usecs(u32 cycles, u64 clk_freq)
 {
-- 
2.34.1

