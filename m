Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011036.outbound.protection.outlook.com [40.107.130.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C473B583B
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716694; cv=fail; b=X1AIEczjCbEWhsNTTJTBHlnqc2+m6AH5Wv1LT2TXKCOuLhsjGFC1xrE8iex6j/h7hGZV2GH/CJkBoo+7i+HGzFQtp0XWlAtVMcxvx4RZSvhA3EX1VJ57hXxmHaY/+WGYBtagKliXeZfNzNhFNT8rsRyFe/urf8GUdGN8j5Lml0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716694; c=relaxed/simple;
	bh=rXCz+RjRryPw6okSsLS2gT1n2zw3GWgVY8tsmT6TdRg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XtaJ4y5O4Txk2hA0nn1evbsWpRs6cxW2xZVXoV3a37BDmVAX1GuImEJYWTvSXWVaoG8yK+1nV0r3HgyGqsUhPxXr76Ahf83l9cyh5OawG2gcLRbp/HRcV6z4T08jTiKkgMOQzqnPyhPLvAgy0gsHxJ2cIl7KuDcsD7RoBvHfXuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NC4wHAa+; arc=fail smtp.client-ip=40.107.130.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NC4wHAa+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNx9senVtvYifbZF3Nfbbn8vdSu3luU88gPSrK2GF8fGl41BmB9qTkRbPNNxVfrejBopvj7HiJaj1YNN3Z3+BxItNWd9w1TOyQszzAuf4+9P0fSOfNRO1klN9O036p0rGGTvlXXOJChegsQFc0SGq54AVao8dcPrSFjSAr9Ul+6Ersg/582Y7NdR6BiiWC7vx8qoS4qLBV4kD6o0tm38dUpCnJ3g+ZxhpApTf65SQI5VscmZnfb+nQu53ezZwbxw9POFx9BsbDa3XvhBohPu6HIrwDGdWnE2UxUzi1Pg35fyYo/6fCBLD+ZOHnK6oUGnRdyLbBPPrOQh9gXMgYiAXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuCQjnIjcHcsCbC4CeSNrKK4n8UqQjP5j6wVuK5Frmw=;
 b=hSJEjcR4jogleYhCizz+dkH/dRJR5XoLw9AiYv0dulx2EmVYw00jDqnLycixMfab2FOcGtDwRL4b6JfiU0F/8wViqbEZcn9rgTFRsdOPoANg+XT8mH6VCEcnJakuHBlFnOu6oVGy7hfjfIlNpKAuV3nAJFxWM21Tw0cko3sTC4EUSRf0+VNZMTRdzCBkSXY3Th+TlA+L52Kf5M7dkudqPakUSTF+/xwxptxPdAv3HWYrG2K8WmobZAVHKJ4vWjyIhtuq0q9luQmGtC6Wk3rC0AoNE7hseoWhaeDZUoPjiU11pXFlhhMmmEz43ucO3ba94hRbZ3jxlpmUcBUMgCrmTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuCQjnIjcHcsCbC4CeSNrKK4n8UqQjP5j6wVuK5Frmw=;
 b=NC4wHAa+/uQ0kjiYdVvPWK4HkH/fH0dU8YV9Nz0ckdp2KnRXW4leDQ3uCrE6sbbdpMOoTZr4cu5EGkPZu0ZxVwuxtabYFPTzzNSBmYsO32Z6ST3zPx3xU3U/yhW4l/+Z/o8xNJCdtQn0DvcQI1KcLh2F0zynFh2XyIb21oTkckC9cYkELAN0ecwRLnkozckdv6ZoRpqmRfwnHO5vy81ET6Xd36QYZDGdndMztVD4Inn0yeSdu0daNwLLQ1eXcMGa8+HLwk6zvORQW+vayj9JlXQwnElW2ucDbVVdw9N4phuOx9JpIQAUMTtUY5x70rbrZWMPFA4b+xXybDXzeg3l5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:04:50 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0159.013; Mon, 29 Jun 2026
 07:04:50 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 29 Jun 2026 17:52:03 +0530
Subject: [PATCH v26 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-imx-se-if-v26-7-146446285744@nxp.com>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
In-Reply-To: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782735844; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=hnPFsRK9/RoyluFDiCjFX7uqhb3SO3ctyv+6dqueb4c=;
 b=I/ycPXAOYI7YZzxpNJogVa3mvsGItSKFiwYXbKJ4dKkn+EwA4H0lMbg0NCKGOXudDg30ffrUj
 woi4OaZ3z94DEctuccKX08jEmVXgvGgV4zjUmePEmnd+WfuXVTN7Glr
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2PR02CA0134.apcprd02.prod.outlook.com
 (2603:1096:4:188::14) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB9853:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a396803-231d-4c4d-b9cc-08ded5acb647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|7416014|1800799024|366016|11063799006|22082099003|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	DuFeq+LLRMAIP+wxR899fviWZA0sjJ/Lzi3+4azFkHm7I5/mrWACeW7PeMNoX9HKPs+798bQnegM9yLuMgeE213e2lu/aGVywyqU0m1ekRV3eHVA9y5YiwlT952MGyk9eH00p/TwFvQPUdXWOP/X1SxJKlk8ewG6fBcZSRhKZwGoCe4Ee3XXh8thl9SjDzSC9PfIR1GH/DsXkSsQNZsuxlliYGyhFLn2RGfwM+M2hLKjE3zREZyHMPjw+wuNIu75zt0j9eRflIH/mw+9f8K8Qy/o6qPxViI07QVH5j3sAE56tsgcZJ3Ezj5qXMC7iLcFiSSsdfpK0v1QvkhwWMLoyNo/dg9pFM5iUTfLepux8YSzirnD0lDj6YeENSz+l2J7LbYKVq0AS/oUMiQcE8oSpgKk3cvo3O9veWwdwTfHrjWQby+ovvdd6waCwg5jYNOkdKwwuElvgXehfe2dtJmzE5ECXtLQJjcuPGeaEE0Dl4t4G/YP3WnwzB0KY1tVIaxSd3L+PVTvm1ksFoBRFFeGn6TTYNMiScrDylJ/424dMCy9j2Zq74eh/RxyTXnE2s5yvwSSLUyuX5+ICi10hy3f6r+taiyTJ50S7I5Nw8gxDV4HLO130oKO8qQ85gJXjhemEQiohvZDpC4QVzrVrmh7ZvkLRm9NXur9i3dPIp861EumUdJw/pGI1ogBCREoQfk0D736t4ULi5bG3Jl4ZAl8TQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(7416014)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0RNeFBINUEzRXNURmI3YWM1ZmxBYVVnVWNIZFd1SkVzd1pBYWJHQ0FuZXVm?=
 =?utf-8?B?QTk0WDA0eWhiS0tJMXNpeXNwUnkzby96U1FZdnh6WmFucjVJVU9KdThZT2Nr?=
 =?utf-8?B?R09oY2hVUCt5V1BhTlFyR3BkUVd3TWhLMTRSMS9EUVUrczM1aHpLN05reHFm?=
 =?utf-8?B?cjRCSzZIZ1c3Um5YWDJlWHVNbUwyMHNiVzZjYjRCNzBpbUtGSEptMG9aWHU1?=
 =?utf-8?B?bFp4QlRZbjAvYUVNeDl5aVBlZC9zMkUvUkpINVNWNUIyQzMvZVJSWnI5M1NI?=
 =?utf-8?B?MEhINXFSNmhRbGNteTFsQnN1cW1WeDlzN3NEeDhSOXlwOW9LYlJDRGZsWU53?=
 =?utf-8?B?b1hTVzVNNUpUYmVYVFlMV2JIOFZreDJaSHkyL3JUTVpqcGsveElsSEoxbDhl?=
 =?utf-8?B?OTZZVHhIczAraTRYNUxjMGQwLzYzRW1hNm9LU21sVmV0NDFsd1pNNCs4U3ls?=
 =?utf-8?B?bkR1a2huSGZIWjYvKy9vb0o0YjR6dUlOTnJsL21ZWDNIajhRZnRUM2ZUZFZx?=
 =?utf-8?B?a2xtKzE2TloyTVlVY29TZFhsOGJ6Mm5USEtrZ2hKUS9CYVhBUUJKWGRoNmlm?=
 =?utf-8?B?V0dGOWRnMHN5ZzRKKzc3ZUltaTY0SktLdXZWNGliQ1UrN2JmSTN2c2FFYW9M?=
 =?utf-8?B?MUxYdGE2VCsrSkhzYit2dFZwcVptMEYxVDhGdlpzT1lJdlQ2MjZZdDY4Y0JP?=
 =?utf-8?B?eHZDZjNlWUdwL2lueVZOcHpCeFJkaFdoM3NXZ3Z2b2plTDREU3B1LzRIc0pz?=
 =?utf-8?B?VGg0Ny9JbzJRWkJVdGtYRVVUdGxhRS9TNFhxVFNQNkh0RnV6TmYyK3JDajR5?=
 =?utf-8?B?ZXMvTy80UWFrTHBrd01SYVpFZ09HUmprRy9iRjRoU1p5bmc1RE12bzBwdm1a?=
 =?utf-8?B?NStWeDgxblc3SjlSRU43VHFVZ1NUbVpLV2w4VEI3ZkF6emxlU2Y1ZDNTckdC?=
 =?utf-8?B?aUlrRk50ZXR4RUtkSTNOY0c0bk5rM0p0ZDNLbGxibmNhdUpoQmZTZkFjKzFv?=
 =?utf-8?B?RGhKQjYzWDgyOGVNczk3N2hObUZWZTJTUUJieGEyUUIvYTIyckJwU1BodERa?=
 =?utf-8?B?dXJUdnUrdFBmSWFFY3MwZWowaDYxU1l4bzZxYkFDN2FKUXJCdGJrc0FqaXps?=
 =?utf-8?B?Z3FnSEtkbndvWEx5Ylk4Z2NOV3ZBL3JDYU5ZUXJBT2lXYmxLaVUrbHVIeHJP?=
 =?utf-8?B?SlgzbXQzTnF3YVovN0VXNXJJMGY4UUlGWVQyVDBMcFA4cDRZMFJoc0hXNU85?=
 =?utf-8?B?SE5uS2Z1WHRBQ3pLc29tREdwSEdrZHl1VjYwR2NPeHVWUzMvMm5IcThOMzRs?=
 =?utf-8?B?RTNoYVFGRFNpNHRsNFl6Vi9sb0wvbkd1bGgvaklxTUtPRXJJY21iUHJlbUsw?=
 =?utf-8?B?T3hLRXA0WCtvWXBVVTdBaEtucWhwWHh4bVdCMW9GWTI1VWxiVGxLVndEdHVD?=
 =?utf-8?B?MTdaOWt3b1pFdVZWbVFPbXJMckExMHZRYXJnWWxaNWp2R0t5cVFhZE5TdVNR?=
 =?utf-8?B?eU0rc1llNHBqcDVVNjhKVi9nQTFtK1QyUW9OdWlTbGpsNlhwTUxhaEhHajhL?=
 =?utf-8?B?Mi95THhTaGR1M3RMZGlUN1hlL3g2WFZpbThVekx6R0RnSkhBbUIza01jdzcz?=
 =?utf-8?B?TWZoc0Ftbnk3SUZHZzNnQkxSdDUvZzFwSWNvcG1jdlZBTTcrbFNFQVlybUI0?=
 =?utf-8?B?MUVHRklSV1FNbTV1dXloTC9wUGNPb0dNbnl5aHA1WXBqUUZad3lGR1FsVnhu?=
 =?utf-8?B?UkRhQS8rV3BjMVd5ZTJnQjdEZzAwcWxZaWdybEQwc1ZGbndEKzI1ZDNSVWNV?=
 =?utf-8?B?eGlqSlpBSlJrckdlaENZRFJkbHR4RDlYSmVTU1NibkpYamk5RkVISHVLSmdz?=
 =?utf-8?B?RlU5WG9pUVRXNkhBOEpWMDloem93ZklUSXZ3ZElZbzlEQnBid3k2eUcwTVBS?=
 =?utf-8?B?VDFkcEExRjlVZ1ZuWVBrRGowb2xIOTBocCtRYWozV2Jkb2NscWNwWnUzY0NX?=
 =?utf-8?B?Umh3WW9MYUVRQVhSWXhkeHhLQ1EwQXpMRTgvZFk1MzA0K3ZqY2FTM0ZjYjk2?=
 =?utf-8?B?VE5yUHI3MjF4R1pGSnkvdndPbkc5TXdWM3RvNDlpOXk5Vmw1TGk3RGdBOUpI?=
 =?utf-8?B?K0JkN3RrZkRudjdoRjRIM1pHeTRlTGJna0E5Tm5VUGExSXo0cGg3MDFTd3Fo?=
 =?utf-8?B?NXp1eS9JK244OHdrV1c2bnErbXdRSEhqNERKUjBVSmpxUjI3RHUxYzQ0UzVZ?=
 =?utf-8?B?dm4xeVhCcWtuMmJtOXpSeTVhTXNKbEcwa0JxNzJJUU9RSjVXeUthYi91WXZj?=
 =?utf-8?B?Y3RLaENFYjhIVlVIRE13UmRaa3Z0b1RMODF6V1c0SGdxRTdoM1dBbXNGb0R4?=
 =?utf-8?Q?dW0BGjoScrgOjtbo750tvTlxNFc1mxzcqmyBT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a396803-231d-4c4d-b9cc-08ded5acb647
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:04:50.4118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGzTd63B0G0GoAwyqANXnSv97cdBvK6iOllNStTWtPVc4fZQUrwIPXt6yQnSoklYvtQqRLXJ4L4DF1x8vEJHRJFAx2b/FZ5gGSM8d6Eet3mCvzjsHLtfnuRssjT4Ehvi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa..16399d921e04 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0

