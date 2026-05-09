Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667A2282F19
	for <imx@lists.linux.dev>; Sat,  9 May 2026 01:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778291537; cv=fail; b=q9zy6lLS7hOc2QVvAjJr7HmCV/qn0ARLO2wANQm04N0AX68xwh7SqY20xaJAqrDaeHaL34FwU2vm6GgrV/vH2T8IqMUAI/4qlAYC8Xv9Cg/7M/anuyi90pgQI62XhsnR1WOK109rs7B5+LAlUqGT4Yq1FNCfBRiHutbSw4Rno+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778291537; c=relaxed/simple;
	bh=piGMzQPObvo52PORNV6EIVWtHyTKBg0cmYLEXoHSoSM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VR4ns+SgbNPnQ3qbOGsMefsKdyd5HK3SFy9O51ukzSo5U+IWfj9pTAgxvEe+7huQslswtj77PDyZSUIkLjvBj+uVBL90VbdPn2qCzGcsskj/JHr42NVnQJO26nLyUj1lqmmXv2/JzmXlDb4NW8gJHVEWWcwXc9Dv9W82LXexMVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PaNYwLbK; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PaNYwLbK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAgGF2OLORO2JBLhJdZH/KrfOAMhwztuQ8ZuHu8PacZZchlGtQkW8B1uynvoqN3s9Q8e58mCvfLEDkuI8rN2FeEGKztH77YHADb/qgYT/PGohStHWAlfwlFNf5Wnp4yqE7vsUxaK9uV0flfXYqOQ0REjpX36nJbMs5LuLFknuS5wOvb9vAjemVXA+6/UeipfZ8qHM861iDRTns73YrGxX3LRxlyTVDuH+R5FsrJBdJRFPy2yarEo+muUcX1WGQRA7H/+BwBkGyUgdRJ6ErCNyqERYkCsmDu3dQkX1kl8drJG5kES89CKu8KdWAXgoeAm/nb8zW3jiqyrVAX/LR1QFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjGo3JV1Fb8xPWfbNV4eZH4grcRqfC5EShyFBDgkasI=;
 b=x3VKSPLwuFB3dAlsoWPItSFWNmxWfK7Rko+CJFKseWfmdeb1ohuVY3fUXq7vqq+jcM2pptVCUVFhzkYnkYbJYlypsP2W4EzGf3xx075y3JDghvFcvp7TKMZgEA6mrE3b5bwkNBmBmwSCz36ZHD2PeJM9Ereh0go67gwDsLP03fE+lL3ON+ZSQCfiInEDsy5p7WsS0WImLuAXlQsO6MGdnYQYIORBV3M6OY7yEQeJPsSvCrTYekefw+S9063pbq2O87Ng7KMZ4sEuzVvC0J9W6+fUGw+VqF0Zew//R5J36qmb+CogMup1I2ZyihLD29e4RmQohM1ivm+jcTSybJIV/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjGo3JV1Fb8xPWfbNV4eZH4grcRqfC5EShyFBDgkasI=;
 b=PaNYwLbK/0bCRpc2lTQD550ptU3l1wtkj3pz9TTn06QcofR3os7Ju9Jn0V5KCOEdeNPNXvrxH4GuTrWPhDZ0CEK/o85wFPH93D7KK7NgAEDYDcVW2dNp0hNPGTT8RyPzbLvxa5wrSKwDg4p2LPN4Z8q5BZjP5Tfln8O3GJESIScRk1XUv2cXe4zZyygPqevz+yjgrHaIR02QknYUDO2hOrySsnycSiDHYZJkgHJ5m+krgRtSNK1oFUrh1UoiKfvU+bWkg8TGS+Po8x22v+bYLszB1Vg8koIvk2gRcD/oG0W/nmtp+zw8lh4PbHjMMdM57jVHWYDGfJLc9BNfwXWFmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI2PR04MB11027.eurprd04.prod.outlook.com
 (2603:10a6:800:276::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 01:52:13 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9891.016; Sat, 9 May 2026
 01:52:13 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com,
	shawnguo@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: imx8dxl-evk: Remove unnecessary PCIe EP properties
Date: Sat,  9 May 2026 09:54:09 +0800
Message-Id: <20260509015411.3218700-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260509015411.3218700-1-sherry.sun@nxp.com>
References: <20260509015411.3218700-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|VI2PR04MB11027:EE_
X-MS-Office365-Filtering-Correlation-Id: c7031b32-e088-4818-5a7a-08dead6d970b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vAawD4klUHUaA3Err96XtEAPsXEWl1jO2Y4MJ/UFfgPAac15EUOngwGYHj1kpAe3K6o55+YbnMPEPnoXk7WiogkcNOCXBG2mouvhezfj5FGBv0JFADyYggChIh17GcD0pxoJasIADrrBDIDdAXgq6oxQ6/TGgfZrJeeNkF/F+/8a9fPDJAvgr+JG/NcvYjfAaWTj/5iBKBzVhD3X0kj/XQ96nOGlT/gQq9k95aKl6x9VHmD27n4tBUYTh6go+VlcxYw+j9szauAqeFGlu9mlRuGHT3Oul2ymLCjlWvJoGw8hT8glgTm1cBAOchswI1aR64j8rU4/XT/tQX30YaDssJ9U9e/WLicUdATStGU7s1BChShjsWn9KNM5N7ylus1vz6UyEgfa6mIyoVlstS8Evyy4weF94wyJ9qS8wRscppd7CuUio2eGG/N0c+/RC8lhOOjTHOXIYwuxJpFyzJnd2nJSHB+vUAeimHdJ76OS6cmlHbdFVZBJUmz/jqR9bQ7cqmCPlfOVhBbSqTp9pak4yv95XFY5ol79frZCgw18wzw1X7Seojk+brVTBbOGrwnGb9YNb6HT9H+JcWkdkuY4qR7X4pDzIfHg5JiTRS25DbfPy0QFblgfKKHC/8tgQnZiaOAhu5F41ZAJ3EGrgHpMb9QjgnOMOWUep6H21zGdKWFaADLn47yRgwExxoa/36yK/cQ9MKemuIp34OH1VKiiE3GtDrMbd5wBdnFSNPA5eG9RCX2NX7krNumgUOrAg6dc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HH+G6U6tnAT6Q9+R5V2IY2lcLbq4Rbegl81/FC0trAaVjll/RivVwmnPomTJ?=
 =?us-ascii?Q?NjWdJqVYbvMPsPNvL8ZwQ9iIE8a8CKzW0D2akKyk7umxeYrE9k3SQtSXIG92?=
 =?us-ascii?Q?Pcc3k8YM/X6cBWQFE2XdMLy1+etLv551NI93GFAos20Erg/wbnelotN7EI/P?=
 =?us-ascii?Q?wMHQMft2cSGd25JedtaZhpQsKRALptyvSojepLY4+QzdsvNgipYWJl7uqHL2?=
 =?us-ascii?Q?wzrtRRDxb++86uSqaoGrYIfPEH4FAYGkcidah8pcNoAFaXQfAZXunOFm9oZo?=
 =?us-ascii?Q?mwkWPzHA/Ah51KPncIxCsBBSZ1vJqZXaYQRbnmvpi2KXhFTK2Sz9rSnBLzmu?=
 =?us-ascii?Q?vUPdpvYgr0Z+vRKdhPUQSis6jSPW2BYQ4Uzk4S66SJDO5+f7lSCfJ5y6AYfp?=
 =?us-ascii?Q?8Kcl5oa1V+uW7u6Qp9hA2ndTO5D7tX6Pi0xjuWUI4qrqCMkCjMEhqo59yFNg?=
 =?us-ascii?Q?ZoBgBt6MhELtjjoGGh7ZdoCYQxNw3p+XEChKk+xeiwYXSAf7ZBOVi4Kl1hd3?=
 =?us-ascii?Q?wmrJo33htYF0fEuhc+r4gmWCGEm+iisAsFEXNx4T29QVBn4ivEGJWQrEvc7r?=
 =?us-ascii?Q?9GWotqP3yh1BRRNwCbYm7GzsAyT3aWNhoVAObZwZUmH1/qnOO2LN8hlN8NVQ?=
 =?us-ascii?Q?IBjlQznQcmyOB2OIE6jDgrlwwCQCPa1sour45p0rAsZEbWx20JPYibVvsOSt?=
 =?us-ascii?Q?5byTrOmLxih9Na8HLFvMO+ACxxS2Mv/OgivDUDYZ06q9zFvcpO9uN7dvepTb?=
 =?us-ascii?Q?eCWlX1xbi627kK0ymtpVG/AH0eVjJzZgo+HvExJax4UHkoQ/5AKk73qwl6Lz?=
 =?us-ascii?Q?FOk/HVc3LA90BTWMDrYixHCuYKVTN60ntc1gp3urzeILdA9iq1U3TmE2bO6A?=
 =?us-ascii?Q?ksirtKJXkH2Sl/GodBfjRBGjGFroFk/jRKntYi1mkNggROkbBVz8qKA1u6zg?=
 =?us-ascii?Q?U3YPpWv5CmwNKdRFP3NnK/qy5vC4GfI/+v97A1V6DcM2nfRr7PGOygDfFqi+?=
 =?us-ascii?Q?9/6gG8LNr/Ss41evo14tSUh9SVQLxlHCctx6VIHh4ul0atgjoLunJf7DVP0j?=
 =?us-ascii?Q?xJ8QznfT1gtangcacDNDv9v5tjRoCMaMgX8mk/W4hIY3JbSly3Xh9d66mzav?=
 =?us-ascii?Q?nh2s/A1Q36XklKIdsrlA9MG4I5kT0nazOAWwsEBG+7WJfiiJsBLBKRSaJzSL?=
 =?us-ascii?Q?sBw7JIaOeN6b3JfWVL+kyjuq0jnGaiaLgCoTNRX22Duwg4NkqOgGfUudcnpG?=
 =?us-ascii?Q?bx2fmDHUL7fGwBnAEXwOt9swhZmjlPNLajJVR9yL1Y81mT7/cpJ9PFDcPonY?=
 =?us-ascii?Q?xD5Pem3gVgMrbGeCQlePkZiJ4j4ktaVZTvQznseTKbKyIekNq2kZfG7Sqy1g?=
 =?us-ascii?Q?faIJTyCC8D0urHKkHtmQulJxgsB1ZWVgJBD0fmWAiYKoDnTkwDGmZuAhOAOD?=
 =?us-ascii?Q?Ixcyr1WGaEzjZ8QErrVfgnNKu7CCQTKs+Z7jyfhu01AheFwLh+28kAxo156/?=
 =?us-ascii?Q?n4aaI1pheJGOMZG/cf2M+SJWGl21lfWighJAAQhQHk61KHSslRmVhksNHJiS?=
 =?us-ascii?Q?7b1EV4lGebQYGEtq3iAZeHUnY705XGKNAoDRx7pAJFCuXS3uhv77bav7J6S2?=
 =?us-ascii?Q?DE+WOaJ/M3LN2nRrTJrhcQzF1T8SeAOrmFfuIwbew6GPJWizDQwcKbX18azd?=
 =?us-ascii?Q?v+SWHOQydvbLAcItoJiezEdNtR54ccGQGl9snvPcCaA3HFELvzTv5h0RBUcc?=
 =?us-ascii?Q?LMoJOQIayw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7031b32-e088-4818-5a7a-08dead6d970b
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 01:52:13.2831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVBJnJjlrwlEKSMFUhOGL+/+CU90j+Ko6dzu8EP2dEnsuf3YkGiBJEw801SeKUeOtyAM6F6bC0fLN4o8bHZCgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11027

For PCIe endpoint mode, only M.2 power supply needs to be ensured.
On imx8dxl-evk, the M.2 power is always on and cannot be controlled,
while reg_pcieb only controls the M.2 W_DISABLE1# signal. Remove the
unnecessary vpcie-supply property from pcie0_ep node.

Also remove reset-gpio as PCIe endpoint mode doesn't require reset
control.

Fixes: c1c4820b60d7 ("arm64: dts: imx8dxl-evk: Add pcie0-ep node and use unified pcie0 label")
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index bc62ae5ca812..441e00903029 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -686,8 +686,6 @@ &pcie0_ep {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_pcieb>;
 	status = "disabled";
 };
 
-- 
2.37.1

