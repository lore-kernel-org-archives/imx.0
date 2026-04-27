Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013036.outbound.protection.outlook.com [52.101.72.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FCB39C651
	for <imx@lists.linux.dev>; Mon, 27 Apr 2026 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278323; cv=fail; b=NwzQBITfGT4fgUyRrvzlWJKiMWbH5HRH++dtZdamLBwcNxR7rnDO4o4X1TTGFAKvclQ+8PF8cB2fHvJimuQZdlAIomoGGeF9q0rfK0HNDfIaY73ohix7NLlgTAGuLYA/cIGetCuxD7xVgLMrbzet7RpO3gOW8vlpVXa1N56k7RQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278323; c=relaxed/simple;
	bh=3E8drSd9PIbKvDXseCp7vltU5y23SFLzC3Kz8+9ua3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ACVJhCXwuv+6wd9NVeGqhTWOVL17RC6cPhRrEnqY0WoYek5WB9zii/hwbjzlfS5zVs3Bu/WlVIL7bWG03yK/MoNaqpBEhju+YzBDGDZx3Uq6TGCFBi1qN+OyJ+wInsMWuV9r2ECkLGiuG1LNdvdurCHoue3ZMpf4WkF2mCIY8tU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J5wPCn33; arc=fail smtp.client-ip=52.101.72.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J5wPCn33"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYb5lhfjFtHvE0NKlwqxFrAVpRZM3JS0T8hac0pYuHgrPNCaKxh4ZUekVTsozhaFZQw3iyk6MFAR3eJe/Mnz/X8K7X6UJl+wWN0+h4A8MPfnYUPg0DE+z436Y+XxuJOCnYcsxh83rxcB2FJTsjExkjB57cFnsd18sfDgMtooNyQJuDkg+tIX0B+0fZ/QbRLfMQa+FyPAi6lC011XO/2qXIyecYEZfuzu3o14LulfSvsGnff1yVLjkGNjLypDWhZRGUybfuQoU7hjjmNhZc2dXXF5fnO9OxtItxkteby8s66UIfFwwZc103CNSyOEk4XMoGq5heIKTdDfwaEivC2osQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yW4AduaqgJ5VrlwVeQqvQVXZRwNxZrTwo72FFjZcEfg=;
 b=N7SpXM3H+CjQANsnuin/S4Bg8Or1FGrLkM4GTM9jfgqCRdgOKqJzO2eymxBuWGJGs1CzddSu08vaK8QXZyQAE7unocuOA/SFPsy++MXXxKxDw33WMIQIfkU7hSx1G2iKrRuYz25L+GXlh09d40PtN3e6Nemmt6pG1Jvu5ybCUhSFlcNFQWaBCQXA4tiF7dvf/HOMatzQVQPeFdIcGwC8lnWzBcTI6bIxHBXHj999EhUTMF1jmygaIfp33ySGICBLRII3fkVpF5w8/rXvoqbEN2C1ztTS4dX+Fw0BuZqRUDbwEY0FYpBbTqE5eSRkMTs2xp3i3z/MCUT9BsFnGyWBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yW4AduaqgJ5VrlwVeQqvQVXZRwNxZrTwo72FFjZcEfg=;
 b=J5wPCn333TH8f/JVoYdq5QZXOkUr4Uy+YuxjSWJhsqi9Wc0SngyiAFrr+cwg/2tFpgsAzSYOSyqJxGP+Pr0/enC5I/M5XPgSDzaAn8zRf7vVQ7n/UJH4Ie1NYU/ZRf/9cg4zANwM9odY2DjegAtiODlJoZBvl/aaUq11qFcgI5h6nsbh10wOO1+Rr6+9y1cBch45hlKtnjs/5732Jb+CHsxlA83ctz//I7saR0UyMp4auVz2/NvEP9WNXnx5yCRHbNYpRnsZUdATuzRwmbkRTIj8azUw1jVYw1vnerOWSdXezVK15QlfbjwZQYEF8DFawXCG3qeao8HIcYcdG93s3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10806.eurprd04.prod.outlook.com (2603:10a6:800:262::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:25:18 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 08:25:18 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH v2 4/6] arm64: dts: imx8mp-evk: add usb3_phy1 tuning properties
Date: Mon, 27 Apr 2026 16:27:26 +0800
Message-Id: <20260427082728.3641872-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427082728.3641872-1-xu.yang_2@nxp.com>
References: <20260427082728.3641872-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10806:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ec03d7-3984-4cc0-3e3e-08dea43683e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	JjkwybJmPpkoX9Nf+rIbMBomhT1VPUcRru2pQbQ0T/Vqhs/xe1ugG0E+QSSjcvTL1D7ldFdq89opJnGFj+Y6/wWGVi8OfYf0Y72ttJ0YZjdlt4KEqRJ6G0IHSugBCAznLqKXiE+0GGfei+Gbnf+YPrZiHBpeNJ9emMidmgYyZGEukcMLkXy9CkFzdOSWR7NGtLkn8Aqf3NV9jTYzcoPKalDN8xyDIHGrieTODzj/o940tSbizoMKorpVD/yhKqa6gt2xQx0x94iIxR0axMaTDV5o6K8UwjOY+QGZeDtwL++vDg1NfwtsxqeYKnmP9GCBge850ezaiu9LtygEeq7fXxDJQj6adl7PHqwX5KkUbc9dJW9tPeqU3m55ii84hNnNrU8V9boz0tIT8tos800W+85M5onxfxfVV8oD0aWksCtoTcuJoJ5Ve9BQSWtrJ8snr9NW0vdS3rrE1AtrXd/lYCKf8IpbXGTx7iwmHGGZLVWYegV1DRVdDufQ44FxrA4arPrAzwCmMG4kqdaiewffIWvZt/fcT9G52WKOwbRyyGWUYCOtCPlIc2tBs1wRrm1g21u46TWJZy1mHP4m1DygBIMUQ8hxGznIVk/Njiw396jy4tupj+um5SlvIaeEu5O+5SwjyJhRgnGuibQlnOeG22c5CO7Fpq1G+bM4RULFsJsvkDA/4/ZK7k1lwphdTZNgtMsMWYRlLTOU873K2AXUGTK/MegT5QvSUGa1SnkWr53HiHC76t0ctletYuSlUuDuwwAFRVS6Q7g8d5MHYasKmxzpxcGJsCnITnzqpyb9be0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9JHzjOQ+pXOAKPDyiExMkE02amf68mX+EKJmKRy0y923ar+57BskPS3plXe8?=
 =?us-ascii?Q?S9s+AOBmCsbdQ5tctF+I5FQYroSk9sfdcuVxh9LH9YxbfkPx/CGOgyOHbgDu?=
 =?us-ascii?Q?WFCBOwqbLoTgHQ6syDfIznuxUFC1LCl7vF1H81nFCBlUloaGioN+RKQt6XBa?=
 =?us-ascii?Q?2C4m5Z9VSiHD9vb8pTw9QAnHGrVWUD2ATRrDNbThMELEDvDdY7EkXLBc3aCM?=
 =?us-ascii?Q?zRBW0VnvUFGZyZL1eekuxX1mvXr3iyP4Fw9uykq2Rm6ic2smSrAS01QXmYtr?=
 =?us-ascii?Q?Qvq5xPgXHuyDz3KRlKj3x/WJOFk2WR1tU6g91GAaHXdW/hAwFeVd2+ObkanE?=
 =?us-ascii?Q?drQUsCy0Xnjdd4G5WzWXL6ZMQrFzGoq14OEvcgQS4xf0hQ4Rj5VeRQJhNTku?=
 =?us-ascii?Q?bYz8yRyn2AtYx6aN+bz7TAFV+XZBKxYFCDZP5dqADWlCK3AA9hfDKHe/kMMa?=
 =?us-ascii?Q?5YF4ZRRpvVV2eqrpK3FtY3uSt0q+SIf6YAAjX7C31XPYwOC5HcdV0yhKi+8x?=
 =?us-ascii?Q?tb0g7s14WvjNuVB5ksLt7bDXCqFk9lNfeD0/pFKPwKrIXloY24Fq5h/yY+AW?=
 =?us-ascii?Q?Js4vvBTm/XdLE5hvaS+LPRjtXZqH/6r8M0NCdbwP90Ww1usO+4CK1IdIuHHV?=
 =?us-ascii?Q?oczVpZtEozobXMunVRDVTjOfYzuj9H9UEPraf1UxWsvjQYWLaYiRtLuAKuWK?=
 =?us-ascii?Q?BeMWekmg3C3ho4W2Gy5GHvd6oVkBt+rbrV1sz+aK7hiwZsFdcu7hnxRym6u1?=
 =?us-ascii?Q?6Lpwgucvjfhjj2pohoBCrC+4TlsvE9o2OotS800x1qEaTb8aNO3e9qU68S0V?=
 =?us-ascii?Q?FwDEcwDxq9ucI59DD6Bci7GAHnIvPP8+kXTBBpas0FSSLAwPXV+7kKRH6mz6?=
 =?us-ascii?Q?VqU0qxJqplnTUQ3rKCbPLg4+I4BHbhIEjD1lFPOiwU7pNRe/msvBV8jtllbx?=
 =?us-ascii?Q?74F8QLcrgoTj08/EAYYAgfv1uMgCjZZAeS3xFzEMq2/T0/tj1BTfWYE/XyEP?=
 =?us-ascii?Q?sAUINNMNZG8ngewXeY0+vGGCFHQK56cTmQlGI2z6EGxP2bgZ9TkrIniB1TGY?=
 =?us-ascii?Q?CrYPrm5e6T0oEYNpul0zxca6+ULb6ohvKBVeVuk1AJJJFd/QIfmHZJOun6i7?=
 =?us-ascii?Q?4u4MLRKDw8DmP1cb3uxGqgq6lWHXXT4Xa/XoUPtdcFYg92eVF24BbXsr4puC?=
 =?us-ascii?Q?z2IUFq7X+R843tnR2NBTgW8x6PyfJ8wjF7v2DXmohmsf2HS3kzP17ZuGrL8D?=
 =?us-ascii?Q?8TS8B+t+bYca//ARC7Jk/eXNSLJ58hofDuFi/4pt/XNbcdsRVLOm+7F8gXZQ?=
 =?us-ascii?Q?Uf0XmeDSJwjSV49+BquosNu8oLGGOsU3dodVXjHafuubhU03GEGPe6OxtCi2?=
 =?us-ascii?Q?m2B+NhUyd9oT6ti442NyLj2DP1hKUlCz1nWn70Ssgeuk9fQOA9uT9DY23LxA?=
 =?us-ascii?Q?1vpH79P0Bhy6PSoOW1v5VZ8P8S21TwzbvEEr8tZje56Ahhkjls0w8WPBFweO?=
 =?us-ascii?Q?Lwdi9LdSRZI27d3nysDOjk0b7XEX0SLlLoGJgnp8aJhSUBZ0Qtog5ut8CsjE?=
 =?us-ascii?Q?VEYAmiSdbtRgtfjTbVrTiAsnf2wB0NxYJbZdOg95uq4jnMH27AqM0F3XI3+h?=
 =?us-ascii?Q?LfLeeX2GPCAYwRvarqW72FAW1EtA6/YaB4SUkHV3HozkBa381xPWAILcSYwN?=
 =?us-ascii?Q?RxtnV8w3NZnY/6iQ8slxEQaBzvfuy95DlwxQoxS91Q5kZ2j1+BwGUCzamUT2?=
 =?us-ascii?Q?a29+jX4dJA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ec03d7-3984-4cc0-3e3e-08dea43683e0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:25:18.4655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/Bd73D7/MgEI+GkvrVJFYbLtJcm0w1+U7lfHRw6kJkn8wp0M1scWrVt0ebjjHZOsjR9ukEfrWfsLjRSm5rn4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10806

Add some tuning properties for usb3_phy1 to improve signal.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - new patch
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 9ffbb5c04f69..9dab374e425a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -909,6 +909,8 @@ usb3_data_hs: endpoint {
 };
 
 &usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vref-tune-percent = <116>;
 	status = "okay";
 };
 
-- 
2.34.1

