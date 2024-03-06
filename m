Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2077.outbound.protection.outlook.com [40.107.104.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E268313A87A
	for <imx@lists.linux.dev>; Wed,  6 Mar 2024 17:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709745857; cv=fail; b=ALPWxrb6GQdVF2MA4CLPO0DZvFWd1vLgby8Rcb3Mg3uYZXNZCH+7C+7c9LMKIjK6yQkZj0fHqthUM6in7vzm1U3C+8o0gxJqdyXbEK2FW+s7VbqZa7BlF9Gpj2bK9dOFFjjgP2dDGPa3HOBfH2F3DSG1gakIxWCINwxrADKgEHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709745857; c=relaxed/simple;
	bh=vcgWp5TJBXL6cOh9tIhKWQvVOFHby8gvNZQwRIBVgk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1INtQUWZYT7I5cTWHThE1yGRZnqmIXLVnNU9tcPyhYAD85nXBqlJserrcPWCwSN8cm0i17VGrXJKgCm3ibdyxuRhSrMKyNiWCod04wvHoUWyKg1UpjQyVQfL70auMqK0IQXhYaaKahn5PSZrkzMeQRW7/19GpMIJYGwciAyaRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=lU4DMf7b; arc=fail smtp.client-ip=40.107.104.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="lU4DMf7b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RprWLgDo/hXWFwcwK3bJBGC4YKwyRgsRBGXC/11f3aCZRPtlDpVvgmKz4iKdamnN+XRCX007w3Ling2IZlScQ9SHXU82QMTIMNsCIHQZsa16MbK4wAt8v96b/VXvdMbu9fzJzpXPLou4skcPSF/Jxq4Zd8JBWRwfwbpCE2dsXbXBOU7M9zmPMC+a1mFhcRO+6UWAXgrzqq/TC5rjSkOKZEvGJsq2ecD8XifkHH90upXQcf13jB0b3vzfwix6qVxboxIm27UUpXYCv9KIWNIVbHqBK+bmuQCwmB5aS5D6+aMOPmrw4mmw5ze5EiLKwx7pEX6zT+kIAuau1TEFQsdgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGaeE1bYJJpRe+mBdhfHv5qwBoRinQKyAbpJJwn88Tk=;
 b=myAY95OjZrVKO85payh30tcikMMw+cgfBTDiVQzKjGgCvoLnocctjonDGURP0kQhpdsa/bSE0wl12fcFUPP91VdGOUZH8Vi2cPLvFrj+ReQX6U14CohpK8Ufv4vBygCHbVL9NtWJcGzKmUNXIMdmnL+CQGh1UYqN12hpw0u9hWJW9iKKk+Ay3/H2lUwCKh3dghDyJ1KCqaJKElAt23LQUGV0P0FxlIGsf1DEkNwLtaEU8FrbDuXhUXp14si7cseiOdQKvRBiMHlPV2f4oIVUJITxDCk+sczg/7uh3fL2l7XOOVOMGXRFQ1ER5GuHQ2STYWd68X820t/w58QdOTdMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGaeE1bYJJpRe+mBdhfHv5qwBoRinQKyAbpJJwn88Tk=;
 b=lU4DMf7byJmChVWyYz7oyfikMizNi5RYReyBqCXWYmKjYyaf8tUTWjhkyhbZSTx02Dw1UEqfdmqlYtSvO4awPTFbPRLptPE86z+EkCy2ORAQvJwOPradRs76ckMda27vyUSO9r6/6UGByM4Femjtl1tPg7pFOFVdtUKxndRrP9c=
Received: from AM6PR10CA0032.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::45)
 by AS8PR06MB7910.eurprd06.prod.outlook.com (2603:10a6:20b:3c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 17:24:12 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:209:89:cafe::a3) by AM6PR10CA0032.outlook.office365.com
 (2603:10a6:209:89::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24 via Frontend
 Transport; Wed, 6 Mar 2024 17:24:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 17:24:12 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 6 Mar 2024 18:24:11 +0100
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiaoning.wang@nxp.com,
	linux-imx@nxp.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	bsp-development.geo@leica-geosystems.com,
	m.felsch@pengutronix.de,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [PATCH net-next 2/2] net: stmmac: dwmac-imx: add support for PHY WOL
Date: Wed,  6 Mar 2024 18:24:09 +0100
Message-Id: <20240306172409.878928-2-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
References: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Mar 2024 17:24:11.0885 (UTC) FILETIME=[1AD279D0:01DA6FEB]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|AS8PR06MB7910:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b43a14bf-458a-44a8-c886-08dc3e023d9e
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zYi397f3YD2sytzCXKwiG8EeW73le0VNRCE37zQD6dBYDnIILVbGrUuwIWpfPQ7gQGJl9eOsSgZlJZV1nPe8Ugp8zCOEmr3de2/tviMiOPpm6Y/Dce/d/7DrrftKZzSS3m5rB1aFRg57i7KQsbQIrbr/+StpZH/iD8kQxlmPEZGALeHDkUoZSqgvWBZVwnMkpUSm4XA0ir/7bQTGZTu71Skshp4O9NmMYow8IaDzUpYzz/N7DyQPxTSuRM75OVL+h4E30z4zaiBMpyT8qK8k453qVaGyqWf1wlcQbL9ov/1X2rd4bjW6vI+1BcjyI+Mpu5ztbXA+j+yMy+3KG2LpvTVDPO+1EZdkFqDHiq+4KhYAsXgQvB6FFZvkgICuL6K6uNlwL/idy9UmyjGSjtWX6Tc9eTjm/sT8BcpWLQ9a19zorY8/H1pQj2XEn7inhpgPdSTtyGaND3iz8LJAiGTSEBTdXMfJya0SwCabnbX3fb1F5I9Q5PJngpqv6j6/Go/Nfhm2Y4uauejJ3+AyhVNow+QMytsUVJZCvJcQBar+Q4vtu1NkX/2CHWv6G3n6/SNARO9qGoizEUUvRMCsjdX8zyYFA88mxhIZ7MdeHOdNP5sR6xNLGv4crEPyqDmTUaTARcVdbosDHo5wzCqknrXvNO9XmiIUB2awOLq04LQQSV7Daai5MFQG+d+nXZTfQpi58J/lhgvtmg6GT+Sbx5uxnOZbxSMCODYD/3SyUSszTbOIqEOKCx/0ddIhp6GA00mem9o85AcAtNiZJRt1/Cd4wQ==
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(921011);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 17:24:12.4128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b43a14bf-458a-44a8-c886-08dc3e023d9e
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7910

Add support for PHY WOL capability into dwmac-imx MAC driver.
This is required to enable WOL feature on a platform where MAC
WOL capability is not sufficient and WOL capability built into
the PHY is actually needed.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 6b65420e11b5..9d7278c083bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -59,6 +59,7 @@ struct imx_priv_data {
 	struct regmap *intf_regmap;
 	u32 intf_reg_off;
 	bool rmii_refclk_ext;
+	bool phy_wol;
 	void __iomem *base_addr;
 
 	const struct imx_dwmac_ops *ops;
@@ -312,6 +313,8 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 		}
 	}
 
+	dwmac->phy_wol = of_property_read_bool(np, "nxp,phy-wol");
+
 	return err;
 }
 
@@ -353,6 +356,11 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	if (data->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
 		plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY;
 
+	if (dwmac->phy_wol)
+		plat_dat->flags |= STMMAC_FLAG_USE_PHY_WOL;
+	else
+		plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
+
 	/* Default TX Q0 to use TSO and rest TXQ for TBS */
 	for (int i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
-- 
2.34.1

