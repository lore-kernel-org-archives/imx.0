Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A62E2BE7BA
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 07:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769585612; cv=fail; b=OGgH5pvE7F52xrtPuy6lGfdWFtbHUm4UXK1q1mb3EEh7iFA/wo7HjhdclyclY808MjkddZSVSMGhq4rbtiV0aU3JdmSBOez7HkQfl6wbC4TAkef/gCPxCZKxJagAXyDFidbBpxPeZFKk1M6VcHwuVitoZ26fqHSOsgLje0N9Zlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769585612; c=relaxed/simple;
	bh=6msjIUyM3puBwuRsHQIxBRJno6wtwW2uC3uD9rBPlCw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hz4zfZfeo4B/rPJpJ0k/WR+w+F0ImU3/SyCtP2IkmBaqh00V7MOIRTL2xyigZ5eewFk7quOYYJPTNxTzKIPhofc1q+gx7byqrbWlQTx3PeSu813imtMi7wxg1elGIbo5E2LynKgzn1otQf7jhxZfZc2wy6hqb7tRL+2tXe2XSoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KHu2EV0s; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KHu2EV0s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQIfV0nLkKwnjpyCwkmim7mULyy34v4yXHfnF7uUGy6wTBD7Tubg8SwpG67aJr6sqytl8LODDCKw/GNQwnBIHPDY1cdPEuix07GEBVei/l82AtK31N/ToLhN67iO1eKPA7P53WcwpfstU4uk4w+h3weHJPSGUByNytif/+od8sGKknl4BUZM5rdyNW7pzBet57xODTAzCsKVm9Y4I020uyVNIQItkbXvik2ZDpmYHBNVELXtNNRWjLOdAIWcOpZ/GDbQICd+SFvDLZP+WVEDXIu6io5xxLjbrDDKncCdxD0j7W+qBxleMhaYCfoo+qf/xrDP6meT41vvGHfR+8T3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1VC/YfFaiWT8qxPUv2AIItUbLnwq0ciAURcX4g1A2M=;
 b=Qkp5AGMSdSgjLSKSmYm/7KmmvxeO9tcf4CFB8PJkh6boXWFo+ozrO5DMEmsR0LugR6MV9H7Tx1i0WWkM3gwpH45e0ynLANh1UnjtZ7j0lO538N0oacpExEnbQ+Vhehny2+L88BIGoh700AYZ1cBCYoxSBatJv+xhFmP2l8z2oL/PU5HZfAlUdQ0Wcyr3/HJfsImAJBdcjkYkBiYZr0uE1+4twF9FhtV53CUydU2m2ZwRSYdTqPJdNpV9uF7pgloLnHEI4F1QlrDhIf2wktU3qKPK/VbJM9ZhUvVANz7lcRXnAqzcizhJbXsFBMkEN3KlnCQwxuYppRd1UohsiQmZTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1VC/YfFaiWT8qxPUv2AIItUbLnwq0ciAURcX4g1A2M=;
 b=KHu2EV0sNd/ugDq5E3GrnxFxceQ7dfxBxuQ2gaxf8qyP6764vLHJ3EjZ2pp8/dN5mAJ+t3DmZ+GSQp16NVdPmlHB3SG1Rb2e8MsUQtWpfjURJAFu3LzfK0j/2P8shqK2rEbqFveAEHKoJFkz4TId30Xz7/iGc79fEINForPp3lRSzsycdUD2FndY/etS554xSZtlCI61HXt3YxW5VHlmAA9n3QQ6uTsotP66iLDYn1uAcHXfwvO49RPE3asb16BCxzoMue9FLWg3v7wZUZAnvKlkU4NDQ7mMwo4ABUcVqTHCgofFr39rSdvfhzztYb2bcDGIQfJOVqH8lvrx54pDng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by DU7PR04MB11234.eurprd04.prod.outlook.com (2603:10a6:10:5b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 07:33:25 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%2]) with mapi id 15.20.9542.008; Wed, 28 Jan 2026
 07:33:25 +0000
From: ziniu.wang_1@nxp.com
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: imx93-9x9-qsb: change usdhc tuning step for eMMC and SD
Date: Wed, 28 Jan 2026 15:35:30 +0800
Message-Id: <20260128073532.2904161-1-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0013.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::20) To DU2PR04MB8567.eurprd04.prod.outlook.com
 (2603:10a6:10:2d6::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8567:EE_|DU7PR04MB11234:EE_
X-MS-Office365-Filtering-Correlation-Id: d42a5e0f-5f7f-418d-5a6d-08de5e3f857d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|19092799006|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EnvtiR2ngnPGGvy9/bjw0ivftomH0BdBliFoyTA1h9TurtyuIrjuDOiYnJ6i?=
 =?us-ascii?Q?yKTljwA4f0URs4kIjUYvgWRWyRfYniNQn1OGnSEeGApqEb3VTcmGnU0eHozp?=
 =?us-ascii?Q?PjMwPz0YHiUp3wU9X3Qaiwhg6OgDiGR0Vfz0b/0aVGOB51HYejDwhWMOld7I?=
 =?us-ascii?Q?BDPVxUvW3l/fNMsNU2TrSoLI++nDEgb5a5YyyTDdu5sfPXoqW/VL2dzgob/+?=
 =?us-ascii?Q?YOX15/KVs5VXJUewese0ZyhmVVlP57anJafo2+PALvnyxAcJO1XuzHnWFKlf?=
 =?us-ascii?Q?Leq/0g2RN3Pf57BeZFj1mvysuLQD+wWQexQBeaBazlwyGfM6DMsUXV8Erv+z?=
 =?us-ascii?Q?7fgDVa2wpYEwSSLiIZsgLTJDykhNNq+8M+D2WsQiH/UXuh9C+563MDmZSpET?=
 =?us-ascii?Q?+280z/aGgCNurl/2L25N2H5wJ332Ons6ct9n6WJ7wwrhLCC6y/5eZjHVRZEy?=
 =?us-ascii?Q?xC6inVd/tH/K+yID0VraAphhQDOnv5loTXX/zfHu+abQq7n6cOmNt2AFai1h?=
 =?us-ascii?Q?sCKdeV/CzN7ekRCdKeOudWuQ/WRKlPUs0ncs7gBRCL+cyUC6Kuvq5T74Nc3p?=
 =?us-ascii?Q?mx2Jk7IwIYCN91MG4q0zVJV02NUzmDNfMBqbUvDVUj0k2T1Eyebz4HC2rAv5?=
 =?us-ascii?Q?NBZM9wIKhF7913UfJaoN22/9kcOq9ypZs7dLKumwaGO3QXQ1X8OyAYu8dt4g?=
 =?us-ascii?Q?vrzibFQv9ThifP60CNbOzX6hUnmc49D4l0oPm4gDerZNEaf9Nn6LrJKq61jq?=
 =?us-ascii?Q?PjMeoCVdA7srgorf/gbS3AJ755avGDWEuzuq4aUsbpsztRNFuYNU+6j1ttrK?=
 =?us-ascii?Q?QPeIGKsOg6vPoRP76NlJqc7CcZ13L/guuVD7QB4gZ5VN5/gNveJ8xTiVBrs/?=
 =?us-ascii?Q?jDYhdhgEm24nTRcusP5RmUlT5AWJO2wpXuNfMZgnA+oSLGaHr1p+A+3jO4hu?=
 =?us-ascii?Q?E8z5jshfEhuXUqKQC/jptDni7ienv47GlraK59tenJxos7UeByrPebOcJ+zm?=
 =?us-ascii?Q?mB/kn5yZNBMhZR5apf+zKGNSvbVbnghBVbMHyFFOBJnnUAeRAXhb47zyoO7p?=
 =?us-ascii?Q?T7tIpq1+Ar4k/zIririh9knFnQwiNc5Re07FoO5wyhxjZJMIa3m0qANYUmYv?=
 =?us-ascii?Q?OScC9FsyKAg3jGxOhTfgNso1g1z4W7J+52Ev3+pPX3QYJGEzJSltO/1qCUo7?=
 =?us-ascii?Q?Zd/HQMBQs9vFFvpj042KK+JQF+mbqnNJLHZgdQhjaC0qVXC1U1zsDXKAoswx?=
 =?us-ascii?Q?My2GjANK1mZR1CZRbLO45K/+xHyXFkWQ6v7bKLXwMX8OIFtQxowax3dkzBsa?=
 =?us-ascii?Q?7S28E6zsdZkywbMvsa/L/QDjRUMSF2OQbVtNznWI/uthmXltDojUObbI90i5?=
 =?us-ascii?Q?JAsbxCgPdcYEU4wEnbmlxt04VQvnIQ4Mi7eBkTjGRLLvgGu+JhE9nBT6BZpz?=
 =?us-ascii?Q?yn19EmrhN3AeNcJ1wbTgAPCxkbIrHVxBZUjUC3DbqVTug1p75IRFekkFsifn?=
 =?us-ascii?Q?MbvkitDKKlPd/b3P3wOQSV7/sdVP5Y3TNZJTx87JGapJP5h+ENGGjMmH61bR?=
 =?us-ascii?Q?UMLYEJcT5lV3dcZJpayQzyoli/5+snYx1ErYhTzTOe4SeTSVmqxd4jcfBoFS?=
 =?us-ascii?Q?bhLFtfQ5lDijhkotf5anRc0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P0C3W0eAwzf+1AfHfLsDTs4U+iPW8eZwAD9Z9qw4waXJ+7FNJHg9VXWVsQfr?=
 =?us-ascii?Q?7J9O1TgoMCgrEf+CebI6PpmONlFdL2MGUweza4FbHU5antuSlJT2ZX0PWdzF?=
 =?us-ascii?Q?dHVKHAEJfv3RhKJG7iNZkPfPF217wQf206mmSf6srQYcluafj7tyTS4fwYY0?=
 =?us-ascii?Q?ztumytsBold5m4chaKG54CjKTtE1YvtLgfEq4hOjLK/h5uAb7VTsVglH9stf?=
 =?us-ascii?Q?My7DDuesjrjYGL68eoiyIkEARIv3WMb6WQnedMPF0FGZus+vUqJJQ5tLVrqO?=
 =?us-ascii?Q?D9XJrGiNj+5M5w9THeN8DGw5n85FqaiSTfCqE+YC1vwNBCuGMQFEMFpoeHNO?=
 =?us-ascii?Q?Jza4KAE3mQ8lmPdRONHWGqahIXYqNK+KnUU9gtX1y8YONUgGVV6f0QTozwgw?=
 =?us-ascii?Q?XdzpDxG0CAerdq4sbvtvjuN6dRC+EwDnwSGL/LOkVmSPHbGyplrp+3gxnzhk?=
 =?us-ascii?Q?M61SfD245p7SiZE3m1c4U/4owB2G1kxKpXTLcrSaWQLyxTi6gItmpVHgMfNE?=
 =?us-ascii?Q?ooYslekCoAaazulxXTajT+sYKSvw0kd/96rQI8emES3YbvC5vyan+jD7ep/p?=
 =?us-ascii?Q?d0FW04jsgnf2MA6R6FvJwpXG94LpAmPTNkbjo2AgSRU0O7XmiUjUTs6onB3z?=
 =?us-ascii?Q?heclH/vAIkevkoPNJikLdLiflMeDPBMJEDjCznQ6UqLgK86JyqUnH5yqmNqE?=
 =?us-ascii?Q?egXDU9Y8WVa/+tIl6rDgtTtKbrqu4H+xic2d+GwWOjmvf497x6g1tSRZt4YR?=
 =?us-ascii?Q?8egwO73G/yOg/ACMp1hkdfUEHuWqNtHq7xJeMPkdbSjyUATzojvybtuRqsCF?=
 =?us-ascii?Q?rIF6OUByPC8Ckh8BD+/6fxD/AVhdCkK7yM8dXcFMiOrp3Vw1dCxaTM1elv58?=
 =?us-ascii?Q?QljkpwpUv7lm3Ig8gwzw9dIyWGhszYYx69RXSwjNybLTGUPBZ9E/E9ZRrdk0?=
 =?us-ascii?Q?YA4IijC9m22NL82WHEF5E61H5rUj3xnEEVLQd+SXDd/rFJ0gfpjImFsb8vlv?=
 =?us-ascii?Q?/M+WULpCFVE5Y3qOFy64zuohu7YNMRVxHMwiQs1XIkt1OnMBNhIMvU2yGeoe?=
 =?us-ascii?Q?YTkdAD9odO8xFztXkCEFV26V1jJ/a/Dh2F6U0iYj+ka/b72yQBCcR8CRx1ky?=
 =?us-ascii?Q?U0h8ubpg7wVYMZkemCpTE5uCujddJ8DW9u6B50UKC+0JBIcpe7ep9CR4jzi6?=
 =?us-ascii?Q?QC1Or9Pmby2yDCCiXfQAZ6QRRdAqJN7VdIj1xL4dX8EunjOROxqVfOMedfuJ?=
 =?us-ascii?Q?0seXOBuQGjX5TshtGXYiGYVZyvcGQ5wA1gM69n6OqZ6dITNk4jVGTS2NmkV0?=
 =?us-ascii?Q?FRgLDYs42Hn0xvChUFd6UsKLcoCdNDq2b6Ho6OoO6OiO3aZT9jOjFdN77gp2?=
 =?us-ascii?Q?oaI2hEWPdWbgFs/pFVmDt3gVrzpg1WhqkmkZoUwyZMKrPYOwUHvznHe2+jIi?=
 =?us-ascii?Q?mNFdget3fuwvsn81jzRdzEitnXEhgt9cddavOGFW9w0/jmHNzvizLSOuS6PO?=
 =?us-ascii?Q?/thheSi7Sl9zLHKSzZ6Mx1Gmxb5lKtSc3Veml1ZGY7Jlw/fGS5tfud0YPDJi?=
 =?us-ascii?Q?JibGjBHysyR4t3+XAOggbA+yYifaZwvhBhbkLMUcwYNhhwCpFTziByUMDnYu?=
 =?us-ascii?Q?fRjYc9F82/sEap1NrhvPwlbW53a5hPQgNjBduH2fzdVZ5N1pFJm2eW/sMsE7?=
 =?us-ascii?Q?OKNVGmzm0uTXmw+JvXnoZalLL/JpLA43Fnz1RU2hpfwMfMguImkfxS2smsGT?=
 =?us-ascii?Q?wyN1Xiy9+Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d42a5e0f-5f7f-418d-5a6d-08de5e3f857d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:33:25.2642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWjZGDwzy84w99O9NWepHHMJNSMQCqls7cSV/YSl2ooii2fcjQA7/NKXIbqV45/Q3+s25/UHgcJnyB4iTOeiCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11234

From: Luke Wang <ziniu.wang_1@nxp.com>

For eMMC and SD, there are two tuning pass windows and the gap between
those two windows may only have one cell. If tuning step > 1, the gap may
just be skipped and host assumes those two windows as a continuous
windows. This will cause a bad delay cell near the gap to be selected.

For SDIO, the gap is big enough, default tuning step is fine.

Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 0852067eab2c..197c8f8b7f66 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -507,6 +507,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
@@ -519,6 +520,7 @@ &usdhc2 {
 	vmmc-supply = <&reg_usdhc2_vmmc>;
 	bus-width = <4>;
 	no-mmc;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
-- 
2.34.1

