Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.203.77.234
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998292;
	b=N5lziWfRYxmSulvEC8ZEGqOwbZZInybXK5bbn698VW7yhACZRX3scGCtVynzyDvbH7+6
	 itdoXKKkIZT8NaeXJKmNGZ9NI+hjGbNSHE/CW71/ibjqViO6mMIyweJT0HGRvCcJ62ojV
	 ScHVinm1OnyosihwVV9DdhMe+031+4w91b0f53Uwq1hRtgKH8deQB1fFkbGzaN8R696JS
	 94mah3c/mDg1hXa1IU1D4rSTRa+JLfri+4jv/HfEZR0eh6pBYoIG7d2DlSoL8xf+e7wRm
	 A4pV2sxykRQLb8FauMTQPz1NKH1AS/0KTgVhFJQYFyDx9TdB03NPSVbJESplaEP3oIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998292;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=9nt8xObR5iGfOVZqZ1LXdnJl2RscvvpQk7zBdI7m0NE=;
	b=1wwSRX1/7MZXEWDquThqRDd6iOhDdfZSoWknGAVpcWSy5LI5ZUFW7l6zuSJoQTvXjFg9
	 RTHvLYkWYuC9G3QO4gFA9/gnvNH2ba8bPmin/gWnmQIqSncb7I6epJpLxRIAxifIh/hVq
	 oraEN/MSZmOAvpurQrs3PZH/1VdjzP9VSpJxgzr0jh9e6rggFgAtZU2q+N570bc/yZ3VV
	 10wDOFGWEpyJkX+rM4d7a+5W5vjHwo7wMp2/jAUsZo6fJt5pr8w4+AHvvzaQfgpoVHl6D
	 juy1cALnIO1FxKYYLLG/yvVo0kDaWOQcCAHkTGxZavtFTc9RQljGmkPwGZFsTDqeSig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fris.de;
	spf=pass smtp.mailfrom=fris.de;
	dkim=pass header.d=fris.de header.i=@fris.de header.a=rsa-sha256 header.s=mail header.b=iTmEMIAp;
	arc=none smtp.remote-ip=116.203.77.234
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517A3606A330
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 10:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 517A3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.a=rsa-sha256 header.s=mail header.b=iTmEMIAp
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1794998284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nt8xObR5iGfOVZqZ1LXdnJl2RscvvpQk7zBdI7m0NE=;
	b=iTmEMIApI+ENnUnTjAgJSeOvORkeeJ6P4hkFAU9HncOawE1HJGscmLgyg9FSfp9xpNBagv
	EpunHCobClYiPEFaYbWxY4c0QpIDWB4FtLMH3f0bIbEimHmjaG5LeCGo0W0XqW3ZRmOTAW
	lJz98eUzEHXw0NjDWvV2LxI8i0eLo3c854vdsZUNuqgkVv16QRzJmub1Z8cTj7T5DI2Efo
	dUROvr1lDGNqCZa02P+ZTniCoJVpNymx/2+bda2SQMv+GtNB/nzgkLlh9jREjvU0SyCO2/
	dKsE1loBb+csG+Yu90VPeDE48+GQkXzLWN21UBb2CgmQfz9b3v6V5RYEvb9Elw==
Date: Wed, 18 Nov 2026 11:37:41 +0100
Subject: [PATCH net-next 3/4] net: enetc: add i.MX952 ENETC support
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-imx952-enetc-v1-3-25721440602e@kontron.de>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
In-Reply-To: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
To: Claudiu Manoil <claudiu.manoil@nxp.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3909;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=PosBxxBGD4nPZHwKCUeIM1wqEsQgjjBXuKC1ks9mqio=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIetvA8fOvQF7IzTlz7h/6Yi98TL3Q6PSgx1p7t/ETvLsn
 Bw18WNZRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwESM1RgZbq7VzxCuYbl33cXm
 XP66mZFvfvUnCDe0HGlecttGoPneSUaG2W120SWbi077fdi9eHXfnmndFotftSuVLmJK0PL78Go
 3CwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Wei Fang <wei.fang@nxp.com>

The ENETC driver gets some IP information based on the revision. If the
corresponding revision is not present in enetc_info array, the driver
will probe fail. Since the ENETC revision of i.MX952 is 4.6, so add
relevant data to enetc_info. In addition, update
enetc_get_phc_index_by_pdev() to ensure that PTP related functions work
properly.

To enable SGMII 1G, 133 MHz is required as the sysclk of ENETC on
i.MX952, so the driver data of revision 4.6 uses a 133 MHz sysclk_freq.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Co-developed-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
[fs: squashed NXP 685950f45e25, 4f7689081034; dropped enetc4_tc.c hunk
 and shared_tx_rings]
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/net/ethernet/freescale/enetc/enetc.c       | 23 ++++++++++++++++++++++
 .../net/ethernet/freescale/enetc/enetc_ethtool.c   |  1 +
 drivers/net/ethernet/freescale/enetc/enetc_hw.h    |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index c6571b5cc8425..4ef387578b1e4 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -3812,6 +3812,14 @@ static const struct enetc_drvdata enetc4_pf_data = {
 	.eth_ops = &enetc4_pf_ethtool_ops,
 };
 
+static const struct enetc_drvdata enetc4_6_pf_data = {
+	.sysclk_freq = ENETC_CLK_133M,
+	.tx_csum = true,
+	.max_frags = ENETC4_MAX_SKB_FRAGS,
+	.pmac_offset = ENETC4_PMAC_OFFSET,
+	.eth_ops = &enetc4_pf_ethtool_ops,
+};
+
 static const struct enetc_drvdata enetc4_ppm_data = {
 	.sysclk_freq = ENETC_CLK_333M,
 	.tx_csum = true,
@@ -3832,6 +3840,13 @@ static const struct enetc_drvdata enetc4_vf_data = {
 	.eth_ops = &enetc_vf_ethtool_ops,
 };
 
+static const struct enetc_drvdata enetc4_6_vf_data = {
+	.sysclk_freq = ENETC_CLK_133M,
+	.tx_csum = true,
+	.max_frags = ENETC4_MAX_SKB_FRAGS,
+	.eth_ops = &enetc_vf_ethtool_ops,
+};
+
 static const struct enetc_platform_info enetc_info[] = {
 	{ .revision = ENETC_REV_1_0,
 	  .dev_id = ENETC_DEV_ID_PF,
@@ -3862,6 +3877,14 @@ static const struct enetc_platform_info enetc_info[] = {
 	  .dev_id = NXP_ENETC_VF_DEV_ID,
 	  .data = &enetc4_vf_data,
 	},
+	{ .revision = ENETC_REV_4_6,
+	  .dev_id = NXP_ENETC_PF_DEV_ID,
+	  .data = &enetc4_6_pf_data,
+	},
+	{ .revision = ENETC_REV_4_6,
+	  .dev_id = NXP_ENETC_VF_DEV_ID,
+	  .data = &enetc4_6_vf_data,
+	},
 };
 
 int enetc_get_driver_data(struct enetc_si *si)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index 7965dfd06f5f6..3c6c6fc0ab8cf 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -1149,6 +1149,7 @@ static int enetc_get_phc_index_by_pdev(struct enetc_si *si)
 		devfn = PCI_DEVFN(24, 0);
 		break;
 	case ENETC_REV_4_3:
+	case ENETC_REV_4_6:
 		devfn = PCI_DEVFN(0, 1);
 		break;
 	default:
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
index 2c9d9042eb0bb..339691cdf44fb 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
@@ -414,6 +414,7 @@ enum enetc_bdr_type {TX, RX};
 #define ENETC_REV_1_0		0x0100
 #define ENETC_REV_4_1		0X0401
 #define ENETC_REV_4_3		0x0403
+#define ENETC_REV_4_6		0x0406
 
 #define ENETC_G_EIPBRR1		0x0bfc
 #define ENETC_G_EPFBLPR(n)	(0xd00 + 4 * (n))
@@ -1050,6 +1051,7 @@ struct enetc_cbd {
 
 #define ENETC_CLK_400M		400000000ULL
 #define ENETC_CLK_333M		333000000ULL
+#define ENETC_CLK_133M		133000000ULL
 
 static inline u32 enetc_cycles_to_usecs(u32 cycles, u64 clk_freq)
 {

-- 
2.56.0

