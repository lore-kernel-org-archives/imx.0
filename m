Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D589D2D0620
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766132942; cv=fail; b=XeLpr18ByPfDLFHYE//wqNnYOafEw7j9gfwfirwd512yG6ucFtybp3exS0iQxTZuOcvWbgZMsXnpeu8AhMKZ6kAO5VpFpwOEMG3CoKkTgCo9kZmEHnmv4AyhrRrEFf9LZxmUXEOP4RAoy9eJAJzgRgCinDRTnVFoIy0hKTqKwa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766132942; c=relaxed/simple;
	bh=eRgnCvKSJI67ZO/KDZkcUlPfoEbAw63Ykw6wkHP3r7U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZzQXFtyqygXo+ksEGYqg21RRrc6om3OkkxvaeZBBxjhJHmYTps1GBswYD1DhvRMX0LC85w9rXgOluC5XMD2TOQmnYRB35fDVNdWIXMNJhBlMobaChS/47hBu/NR8sCVXubyuhBzD7DOFH6+3VKDaq/kgRm5tJoIDUajDNs3p0xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fcJB3P8f; arc=fail smtp.client-ip=52.101.72.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fcJB3P8f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ce/cMap5FfdvZYkjfkyBjdHieKeSSzImpIhIWKZcMmxD4kZcaEb6k2kgBuuQ1PvpKJ5vwP+zuUpG8JE+A5z74iHjntYn5WOWM1fdJ88pRIIb46VkzXFnxPLTrQg9XWEYhOb93Xb8oQfB3B5bIcwh3briY+vOHpzfWhSe6GIMp2mJqFN//+6lwB6se1KNQwkyoOXtG70Eapebai8oNif57t640mDN+Zm8tJVpLprdCk9k0xarN788Qs+JP7s8BQKulGndBQWgqzkI//5NN96lfXDDkMgRoiYT5HvthsolVFe2saBit59rc3UN7Az+FPMyFQQiLyUeBv6NRzt8TGMCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2Wc9OM7ZPRVxNqwXJRb0ujKr+cEDnXCiRQCkPE/gGo=;
 b=fzou48NeX0cIMVVZ+WbFdI9Iyp0TVP9Y4Ch6yFPV0TGX2/QU9KNFA1k0sHIAEbQwzpGKXCOb+F+Z79SGZ1IjI7e8HWkyTwWlCsuJby/okpjkhxnWW+pF4/O+F5G0Fn4yJ5mTPdjZx3hkxwMfBP3YkSQV2kOCFzJGDiKgIWeQXSdwakiblj8wT5A1/f5hquDXDKDpRXl92xQsjZDEhwpcrLU4RdxeRh8MPZPOitIJwqA0Vl3sSH7XG1elX+aRoTrEsjf+NadVMYNgt1DmYzLmItCpuC+dTKXolsoScDuTj7e2NdPwZvIQ0TmbhcIZdGonMCpojff7d54yzu23Pg8YLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2Wc9OM7ZPRVxNqwXJRb0ujKr+cEDnXCiRQCkPE/gGo=;
 b=fcJB3P8fhMFewMQZAxX4YnWeGHarFg0rrgY0kT8zzVHkERla7YVhqv04HhdtRpcBj8wF/S/A7oNyCvph08Dq1ZviBX2agFyvlU56QuqVgPejNRrgqFeGlyWhrWaYRHLZEl/LHhvqIiUZpCVWcw+nBnbmbu1Mr7ER3AN5HMYPV/ez1thT3zdqUc05SP81ngGsA74Hg6Sy7h7tJG4yvdqwnySj9WS6BRGkeNWFkI3hE2tedN5V9Mv/XTdyDecZIIi1HYI14u4/a/KGHqSTkdzXUdBzNbTOQBDTWohhGFHmSd4iERJ1j9K5gaoBAKMGMAItN6PG2A1HVYpkbr1wrpg8ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7443.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 08:28:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 08:28:58 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: fsl-imx8mq-usb: enable RxTermination_override_sel
Date: Fri, 19 Dec 2025 16:30:04 +0800
Message-Id: <20251219083004.3883898-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c8f98b-11ac-42b3-5031-08de3ed8a780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|19092799006|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UYRhGse47M3n8VyhM4EVVMYlBY9m4be5uBK8pqzVasiI+QD8xvQ5Gvb1gO0N?=
 =?us-ascii?Q?/tAQcu9q7wwaZCaLWANxKgMvvXRWL/k2r9ZP/Y/2gOXbKhE6qTeljisjXXEL?=
 =?us-ascii?Q?ScBqWvGRV0aoIW8bA3JjJdfmSqOsT37B1sLzPaVjo2CjpXzN4MBIo1IGiX1W?=
 =?us-ascii?Q?6BJR1QCC+nkgC5zuSFEa+qY80VfA2m7I3EfIHG5/D9ZTgLVdPaz3PxR4NLmv?=
 =?us-ascii?Q?oT/TXjCC40vRAcJg9NrNC0u5rMU2BrlUo+pnFtdQSTC6P/9mZjfIyuKCKDKd?=
 =?us-ascii?Q?H4AlG02nSs5inAx8hYhrFZvSxHlfUH2g6blxZs+w6hGxcqvb7umRjrvwIIrw?=
 =?us-ascii?Q?+J0I6WaAOEpLFY8Mk7gmqZW7xyVphmDQfTduFRK6nT+HyKVWkDjDIC9YwJXf?=
 =?us-ascii?Q?qKTTCLSsXvh2AsU0c3BrVHXzXsnu1/59+rS/3tfjcWPC4v7O7nnNTIz/qmWT?=
 =?us-ascii?Q?JYkeLxbxleGdSGWBe8G6Ms/fszcbXYaD2eY0tGys98+s4iEjx1hqQq+lk+9l?=
 =?us-ascii?Q?rQ16ojORHA/pYVTrDXkJPr6JdVxV3+LIf812LfOe0oBC5+yEbPGqF28aClv5?=
 =?us-ascii?Q?8ohgnfkrvx+pdazL20ApiKJHmET6CK+ZyV/AoeOkOTfkG4kbNt/n7nd6/lKf?=
 =?us-ascii?Q?S9NAbXMeYDiQQI7Jm22cszfitn5uNlTIVWk/HcA6gr/B7qDPz27hxLWtvVUf?=
 =?us-ascii?Q?CG+YYN0StVZuC4OC4/h/Yrf/1faHTgw73T2Bo7CFzAx+V8Taitst6/GxfEQz?=
 =?us-ascii?Q?sR6uXm/DPUUQr6vD6OINmoj9wYhwGZLS8obs2sIHc5zy8T0iFVNttLFDqNsC?=
 =?us-ascii?Q?8Yf/r8n+zIPsRUbynqvk6Kpg50zVnK3hh0KZKlI1V+NHzGNV+zCnxGmQbsYk?=
 =?us-ascii?Q?t81epFMeh46496tMCUORmOyqvm1xP3gYCOvQzVQ/NHquW1LMCOcxp+bY+je5?=
 =?us-ascii?Q?8tm+jmVD3Bz/QgYThfxsKxz3xKIH0BaLrZFMt6Euy6/5pB6VmuaMunxSBwP8?=
 =?us-ascii?Q?QP4jH/Z2EnBAzyDh+d5gTaWojgXksnXVZ0A2NCTukZCUADsVmHChMmJPhKhj?=
 =?us-ascii?Q?ueQgo3qiR4NgCzNNaSWixRXdNKBpG3ySb605cvuFtry288RPb6i0R1imKdYt?=
 =?us-ascii?Q?ROv+I7rTkysJ9pAHnrNGSYrOEWFXNAPy7vmH7ws0DsMF/9YJpM9ArZa0bQWC?=
 =?us-ascii?Q?aokGDSnDw9avsZ5RagbLIXzQ8/Z9mzaSIvBEDTUw4CqRs0LDIeFmXJd7pPP2?=
 =?us-ascii?Q?XWiupGIrug0Nnjsh43B5dj/cfIyYQQpLLnhwxvWHd9RV8pG8B3hrfBxL0LEY?=
 =?us-ascii?Q?l3tzaJpufUUPoiSOk/XNNlz2VsCFsUhjqeHmgJXX2Iz6olivIFOhKhDXqK2R?=
 =?us-ascii?Q?W76A/gKeU0VhlfNHYed7838U4j/M7M/SFR1tn7iv9Ko3M/kIaHeMi6rLsky/?=
 =?us-ascii?Q?cPULP6qLByh0UgJ50Zol3CUl1eH31cWRQiOCl0WpCjzM6EQu5g+G2SbNtWti?=
 =?us-ascii?Q?IHJeDPv+0/BVi8AwRd3O+GXYzQ/mgm3AYVAo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WO7vfvn+yXhUvYdXetTHhYsxmKuKT5QxEzozylf2pa0LeF4rEYn8ZxZ8xWCG?=
 =?us-ascii?Q?7uqvJEc+svYTvIDHrx8zMs2AtOik1JQCHqUrpeEkxvlzzV0hLrNyS+DQ4T7l?=
 =?us-ascii?Q?9LrH3kclB+B1j/UQTTVRAQTxmHQPNRGRB74bVr1kuAod52saaeBPkpEkfGPt?=
 =?us-ascii?Q?Lu6snL6ypJzc6SAbIUgu0zFTFdOjYsDVMw2nsjSLRL8f8pZBSuAn/t82yiLQ?=
 =?us-ascii?Q?CNXs/vpalL4awc1ZBWiC29ZrIQgJPAcJbb/RgTp0T1ZNBgRbygJ7U57+9dzB?=
 =?us-ascii?Q?p7OQRLlnmpPl0Xs6hkZ7EjUvMKcSplMRfPc9aE0dkal+TRfvMiyvADPdAjna?=
 =?us-ascii?Q?xGSpKRlBC4ZdAbng2e96z21O382Ys1VNBGhGgsEEVlYP6b4R4mkrUe59Qq6S?=
 =?us-ascii?Q?5DVMvuuG3WGMrIQUUiYjDmpMkjemdIrDZuW/IGdlYjHC6Pc4Ls2EDFVenOpf?=
 =?us-ascii?Q?AAhA2JHdgEIpnzS6qyB14PyL5jMl0mVGfXanGK+uec5RudKCDWjHbUJCsJTp?=
 =?us-ascii?Q?xnEDC870Aa/fLrsc6e2Tuj2uVsYJm3PWqXoNuxDw53zkbY0lMnfN5co409De?=
 =?us-ascii?Q?NL7Oke0/I5LwKEva+AJxabHtl+fNdNgKP0MxPbBnCvvSNUYhsZLM74QjULZX?=
 =?us-ascii?Q?MfNWfBPim4bNA8l/JzVRmPVzVA4MXNnisZsCwptropTAuIb6knVpZ62Nxd9Y?=
 =?us-ascii?Q?7c7efLBufVj5KKaOGjpFfLC8Pjxt3d6jwBdgffyGUDgQlP9K8SQAG1bibKRw?=
 =?us-ascii?Q?PjHiw/RuzJh6VatCq7siKO+DfNtbaE9phSajzqh+fMexzaxQ+wO0wOQIiY/b?=
 =?us-ascii?Q?WzMq76fwotQhr7Osx1CNlKQqHoKBtAu0kLvN7D7UIFAB+U90DLXSJwMc9s1/?=
 =?us-ascii?Q?/dDQK5DFCj8cmQnZk67JQ2mBlYhqWp3inNPuZd2vE1lGMAtocp2ywQL/zSeP?=
 =?us-ascii?Q?4AhtxlE1oNvHEUd7z1oRDP92WBhhRyiolS3/YmN0OE8KB1D5Kf252vMyyGTc?=
 =?us-ascii?Q?7s9oXvUvEdRV7mMODhHokDV1FpTLT40OpkCZjhTws6vY58S/hfEzVLDmJEbc?=
 =?us-ascii?Q?uKt4zOjQLOFtiK0/RUN38FlwKfBpJIB72oBPIjt9F0yGDoB4xDssP15GiChI?=
 =?us-ascii?Q?mQ7SQZ9XqYxiabrN33KZ2/NJtLNvMiPyq5Q5KwPusURcPzJ7ueXFdpe3rTxs?=
 =?us-ascii?Q?8CQTwDN3+ycXcRCwuezWQgPsLCda+n6l7pZ6wjSpAQNCtT6ZatGd257arIpz?=
 =?us-ascii?Q?wWlmUtaekbH8mK6trqkFEoO+8xQxQ4/80aQBz9eEH1VBhMrKG/fPDpL3BCS3?=
 =?us-ascii?Q?m05i9Xa503HHwde9THh1Iom33KSiQef/P8ylU9GZZH3ox/gWBGnJhc98MXpm?=
 =?us-ascii?Q?44AVgiISK9SeYPAaCxo0YKFMLDxfM7t2/24/I9pAHdLIoqEa8JEufe42DJK/?=
 =?us-ascii?Q?jC20UA+RDnSSvEpabDyUg0VmeQ9nEsfbFvFr7Vo5IiotcBy61u6kynDMf3Q7?=
 =?us-ascii?Q?t824rCz70+eymSTjQF1CwNtpX/K/hqHofkYOJfSsUyjajDQvMAt9dhFmw2O3?=
 =?us-ascii?Q?y6gmTJIqr/hxq/gKsdikxRk2E3OqJGSiOS3FyPxZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c8f98b-11ac-42b3-5031-08de3ed8a780
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:28:58.1189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwSkHO2g4NbrHjEMeVzRiK1gfROyMM70+rfgbfVDhaA3xP8WL8OOeKBopXSxyjkurNroFrrGLWLEUTw4rBKz0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7443

This is to resolve the problem of wakeup system by USB3 device
insertion if HSIOMIX on, in that case, the USB3 device detects
RX term on so doesn't downgrade to USB2, so DP/DM wakeup can't
happen, with this override bit we can force the RX term off when
enters system suspend, and disable the override after system resume.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 02d9af409b08..0831ed465775 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -52,6 +52,7 @@
 #define PHY_CTRL5_PCS_TX_SWING_FULL_MASK	GENMASK(6, 0)
 
 #define PHY_CTRL6			0x18
+#define PHY_CTRL6_RXTERM_OVERRIDE_SEL	BIT(29)
 #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
 #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
 
@@ -847,6 +848,7 @@ static int imx8mp_usb_phy_init(struct phy *phy)
 static int imx8mq_phy_power_on(struct phy *phy)
 {
 	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
+	u32 value;
 	int ret;
 
 	ret = regulator_enable(imx_phy->vbus);
@@ -863,12 +865,23 @@ static int imx8mq_phy_power_on(struct phy *phy)
 		return ret;
 	}
 
-	return ret;
+	/* Disable rx term override */
+	value = readl(imx_phy->base + PHY_CTRL6);
+	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
+	writel(value, imx_phy->base + PHY_CTRL6);
+
+	return 0;
 }
 
 static int imx8mq_phy_power_off(struct phy *phy)
 {
 	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
+	u32 value;
+
+	/* Override rx term to be 0 */
+	value = readl(imx_phy->base + PHY_CTRL6);
+	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
+	writel(value, imx_phy->base + PHY_CTRL6);
 
 	clk_disable_unprepare(imx_phy->alt_clk);
 	clk_disable_unprepare(imx_phy->clk);
-- 
2.34.1

