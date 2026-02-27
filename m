Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A4227F4E7
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 01:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772157450; cv=fail; b=NTe4eHXC9rc3is6hEFGCQo9GDS297sTmu4ucf1e8pL0ec3iT9lxUWMCUa8O+woUmXIlZUowL9FPGbTDjrCM2zrZbNtONnTIC2XaQF4dPJLBb3dFDc4QLOp4XF2exv987HzKHgQqTYp1KePrP6+RPUSaO5taFhSYvy+NFSur2ZWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772157450; c=relaxed/simple;
	bh=/j6lrhzvBI9yFxGM9bnrTVHXiMaGhQyWSDV8G+ybiDY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Na1aYueArv1LO00FA2hYXZa8WFX5raZ3ODYMX4GK0/dU/bpXugJYVf774t6Rj1KwrFfzBDmwKMXKEtotcYgMHav6gJ6ebOOPLEnQlC6FVL/rEK3FjPCShkfwpsygTe/fXo46AedlI9rBQylUbMv/jQYP99lIJCFo4gs62C6qcIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V8bBbMDL; arc=fail smtp.client-ip=40.107.162.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V8bBbMDL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVGpbF6G/HYJN8o6+ul0deDnm2aCyRL0Ur3+uikafUCPew1rGYSLu2e7XnCT4mKXbZVyT0bQfUVof82hBQlv4cAwEzvkXjFK1qHs2DZsGgHkeNfbuazaYykbZhJf2IYbi5Y6OgNAixGOYai0xs8/22l8HYPSCjmBKsKEm0U2+82Fxa9LZUZQeBQlweQgRGzYxgqUJ3yHbfYSMHaBqib/9yezMSty1y6WWZ53J7y3tlNzwQVdXayyGoIA27jQWHBdb9u7Z41OJoxwnEKAVl+bgnVCr00w6EXnvhSiU4y0Jj2zAyHvWN4mjVSE4cnaXKtnL95lo6r+co2MBY9m1W1ibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=il63bfj8yVpVhTroqyjLartiZq/WNy9Ot2PRPLGLE/k=;
 b=BbCH4DC5o0sN3flIzya4q7BNxN9zu1rWefY8NN7XFchldUVjvSboCFW1h/SXGF2V4PqcIobarFYqgh5JeQU1M+7Zrf4LjF1YjlMU0Xtzix6n9pUS5XQmZVKIlsHJQ/8eF5OZL8Rx2A1KSVhLI04acJvM9JRZZEXdmsKDwqy6c4fZicla5tB7YjBUDULN28FkvBOIAMXtYx3d0oE3oI7krBw6ygOTCQSOJvNF9vjmwV4W7L5kEeWQzoR9WcXEawtYv4nSzyVKQG3/QUt++nCeP9S8ppw0dEPsYiY4eqyT7ccL8bnDz9i163rWMzncmiWlFU8IMo+PbISD/z1zSiOLwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il63bfj8yVpVhTroqyjLartiZq/WNy9Ot2PRPLGLE/k=;
 b=V8bBbMDLdatBmZQnL875eRLnIoOCJjRgnaqWde9vdNlRNxHWmMEiCeHc47YlY43WqP25qVwo7jjiE7+gRe3nGW6qKPh4tJ3ixXLLeOOaYiLW9rv8H17iwKF0W9OPMYMN1PeSjZe/cW5tAzMcHShzZV/TdwbobKx3bVtv9mQy16czayfD4DFgSif5hurDjAP9j7JZ+nK4oiKg5kFqe/D264CCAATTSsnSONjzUKg5XUtxd0Inar01ohbR+7sQM5jynwS4Y8mC1P/2NwKXoFeBt5Ns5KL/WN2QPSkahmzjtBl3z2SOIdGDZv1Vl2v7okkD/vH8LJrcBazXbmDhSEGPWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB11512.eurprd04.prod.outlook.com (2603:10a6:10:5e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 01:57:26 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 01:57:26 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V2 1/2] dt-bindings: arm: fsl: Add compatible for i.MX8MP audio board (version 2)
Date: Fri, 27 Feb 2026 09:58:36 +0800
Message-Id: <20260227015837.1915384-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260227015837.1915384-1-shengjiu.wang@nxp.com>
References: <20260227015837.1915384-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB11512:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1eea80-d1bf-4bd7-b86f-08de75a38e28
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 Jfwu3dBMHk0Trax/cuKAWfm7kS5/neSyjJr2fw41z8hkPnu5mFpMjgf4Of162DjhQQz7eHjT2itxMHLq7NJ8GnlIpLVcQgMqlfziHi6iPlQM2SE/LY6KkCEhXy5dtZqNH4mYC30s47j28jzkrPn7aVJR0SAMIixIiRCtvzyNNCOSulaBrV1OnW7TKvi8STR45X/pSJN3JMo0eI7FsfqNqBumcwy+XFR+4ENFt6dCwi32utojstMHRuhdimm93jB/6P3+h/hZ1pELX5fPVNjQJeftKMg2rBPG2a8EXcFur/YKe5uWDC9Jqx/cDTQYwyIjao004GwvHvJH1FAWfVQmD3wH6duHUS1W0Uer12KKl7F9rZxI9CMXp6a9xU5D54cHnyYVzO5X8Za708Hlq3i3lKAX3ShYJjR7ARSu5EHH0QZtm2fmutPjACReRr6bUHXLvMaDKMdut5rlDQ+AHkeZl3MKkcCQDBsZZOuKSAMoIPEF5wYulG9CVkXSCuqt5H6ZqoqYuaxn/H3On07t9YtN+iiiKwzYeaUcLM0py5v3XIaxdHcN3CqqrYJW0H5KtxeC6ZWN9LwPFTBdwhBJSO1Yq709+1iKytR2cmGRZpwDSR5W0Gt1oNHpBaJXuZ/CHJAghUwnlQxMiJiNMLuMt9n55dtfiJ2bdI0l19fMFCcYvhqCqZJQdnVdEo6BrmgY7tUVXdLbU1tPKYqRkXMya1VCygu92BFpXuftr+NnxTHemLauTp0N7RYJLxczhHoe9wOAH/7+PymiGRpeOyznvXGOlMRcfN1fVinths8eFjeWiqOyvQ6dz8Q3N7Adg2S6kxiP
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?mX/O8ebeY7kfcQKKjmN+vJg3jBO4Y3NG8icdAQgscN08K3MFkOAgh/Bcv2sb?=
 =?us-ascii?Q?UEKa0xGW68rzlyxZpcD7oscFbYL4YlRH5V+03SWZuz+SPgJR4M/Ez7aRZQ9L?=
 =?us-ascii?Q?oxi1sIjbVKjRukzyozngLukDvawlheBQbzVpyX3l64mxXhAIPU1Bp5Q7VGOn?=
 =?us-ascii?Q?V6XjEzY/iHhtjvzGH77Yhn/N14y3jheqv55cwYpeD0on5AhwyWofyMbKktUp?=
 =?us-ascii?Q?xaoAieRm2OFlvE1ktMJk6viYBYMOlBvBBH/l8CHMutpzlNTSOdayDfhS1QwM?=
 =?us-ascii?Q?JdebPYnE8fHeVqe9ers6Bd9Zd6ktoj2TuYpNioSSrU5DR3uXtRPfjrx90QSH?=
 =?us-ascii?Q?cqazIAQVQrZURlc15wl6T4GrbyqUdgH/BT94oh56Y/OZU7AvtSgKKafCyksQ?=
 =?us-ascii?Q?Mb38MmQ638h4462i8qbZMWyZnX6ZT6AT6E1iI3uhx+BTLsWNRGgBw9o3nniG?=
 =?us-ascii?Q?JGVxUtNbC+tueYuIVy9n3W5Wc/vcm+R8zoQ/tiCHxBPY8J1qasX18nIX5/Cl?=
 =?us-ascii?Q?EitJxmWAjwZdXOzaKLuMfiR4M5VOUrg3+LbbrrrEDpWy4CTN4XLhd/bzGmhq?=
 =?us-ascii?Q?S2h5NtNNekgdKWfw8EnCeI60XAB/0Pe2Hir0vbUiE5MyTJ1TYylA2T00WQHK?=
 =?us-ascii?Q?2lB21FnTb8fBBaBwxq83kxkHRVebLhvcty0axpQ9FWCUpstq1jZdOLujqRb7?=
 =?us-ascii?Q?dUR5vU4KIwPKQreInvo1ipW4uEUmTMaITFeRZTx3j2hpWuspYr8weH8goroq?=
 =?us-ascii?Q?lkHRwPbw7QheHxxHVTEmC37VfG79a64mx8Wvot7Hr/TpAuQEQaiEKP5VxyNA?=
 =?us-ascii?Q?9YxDGZrgomsxyz7lTo9vQZySDtTtMsH6PNeZNzVVZmZgatiBlU5L+YdMjkOm?=
 =?us-ascii?Q?n1oUUjF3az42H+wtp8NYdvh/YyzDMk+cj3valLdtXs5QrTqy6HSnhtUTKdts?=
 =?us-ascii?Q?pA52DG0GzqT6ghJ9qTpbTIPfKENJqLXX7gkTFpXlG/FNQeS5miJ6jgb+qG8M?=
 =?us-ascii?Q?Jim7DwUj9EnljaG8d1u1769AoCunfzfmbfEdrrZrdhglQ+t2udGiszoeBuBG?=
 =?us-ascii?Q?cG1ymLdiveZAwuQsztlpj6Q4tnEAoTAXh7/zCitb3xP3uZkq/2ptMBgn3DGM?=
 =?us-ascii?Q?j9ZrvWcUqA0FUmOxgwuHXwADx+m1qic271TdEaQqtA3s/sjrRWEM14hSCzCm?=
 =?us-ascii?Q?p5nWxXbwaDdRfmOytrdtcrA7VY1S0xJjKkR3SZyM0HTVBIlqaesvwNIw+D+D?=
 =?us-ascii?Q?U2Ez8W+Rt+DzQUhj1obqsDY+j5ijVqSGX6U00duLA4kvm3Z9I0rwAPfSyq5e?=
 =?us-ascii?Q?oArwSxrWe1016E7bBY0HrK2b7qjyOWELruQ34w1SWDZPqc48CRXQBBNcVg+2?=
 =?us-ascii?Q?wrSHrZegWawFqXGlSbSsiwwscpdIAQ9Dx84oADANgSIBSzTQHqyo4rg5uW72?=
 =?us-ascii?Q?WEei3cAn7n5pc2xk+hEjl53O0iEL7RZ8hY3i8WcqXlg+pZlwYtRpH/Hjrt8l?=
 =?us-ascii?Q?5VrEQZGBfViF9m/BBpnPEJVWByClTRB1R0ld+wVFDBIL0FSk4tY0K3eJNWZB?=
 =?us-ascii?Q?sbQzur+qwLBVfS6CXMUL+/Qu3+FJGTsKOXkTUQkByIh3n71WKM0tDxMd9a1v?=
 =?us-ascii?Q?uyim9mAZpP5eRcTNiJSDPXB5WO0dm1trhByT+gL2+1WSrVWh05Me4I0jeEYG?=
 =?us-ascii?Q?JII2fXtfyIQrC0BgcYjh/sDZfbIBYvw1Bz581GWAJfnLN2WXOMqmPh3opAKF?=
 =?us-ascii?Q?WdQhnYV4gQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1eea80-d1bf-4bd7-b86f-08de75a38e28
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 01:57:25.9524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31FQALT5g0e29jHe39MbFi3pFAq1e3ZL2TPIWjaGSAlQRgjKjhdU69UN2iOj8eoorxR8/2zJ99nizz82NPJGlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11512

Introduce a new DT compatible string for the NXP i.MX8MP audio board
(version 2).

i.MX Audio Board is a configurable and functional audio processing
platform. Integrating a variety of audio input and output interfaces into
the system, the i.MX Audio Board supports HDMI input, HDMI eARC,
S/PDIF I/O, 2-ch ADC line-in, 24-ch DAC line-out and more. Based on these
features, rich audio application cases can be realized.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 15c5d3a4737f..7931a8988ae6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1106,6 +1106,7 @@ properties:
               - beacon,imx8mp-beacon-kit  # i.MX8MP Beacon Development Kit
               - dmo,imx8mp-data-modul-edm-sbc # i.MX8MP eDM SBC
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
+              - fsl,imx8mp-ab2            # i.MX8MP Audio Board V2
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
               - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
-- 
2.34.1

