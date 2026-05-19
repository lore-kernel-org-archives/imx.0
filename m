Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E25249252A
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189252; cv=fail; b=ZaVwPn1iunlYyhNb+IdFe5B66eXftpYNDXq6R/KyVN7ML7x7yJUnwNgKgicdRWADqLzw7ExmvCfKpu9qRI47aK3a8UypeEStgy5oXZr6/eRxw6TRMDWb6//JU1kMAo2HYHiKksI+3Ci1+j4YSygbSMgb2pfUB8bOz4Iiwex1Eik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189252; c=relaxed/simple;
	bh=Nfs3Y0Ku5/B6o7VrNUvsOLZpe+1u2xSVplZxz0GVYlk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gQaU4hKdPh/2V79JG3pp2WJ5K4D7KC/R56FJ+pDY07MA29volIzLWI0qAqZEvOLB7ev+IL7GFA4+us9tjNuSKopaB0JQYPqUyTUxlHCOC0mJYLoVOEanaltM+ALm/dQa3SgvIZKiMnc+CV/O+pZDm2QZ/yJ78epZl1Zw9aFFyKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a6wxhNlR; arc=fail smtp.client-ip=52.101.66.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a6wxhNlR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtrlNzJn1DCugv2YU32AEjs4r6H4JkuaFKpE9BJx0maN/JizhBNjp9iwtTvzTGxmKdDUIIRmMZwGF/Hbg7FNRTMf0AqTt2BGcxONKtQNpu0E0WiR8aabwSiT0bFtQect2++7EGf5q3g3zSRXvoiisj8a6AnU+XNmikREER1ZzEQlT6S818BB8lp5dv9S7LcFut7u5VGfwCPmPqHMYxAqD7btpYAARn/veKZuJ2kneaBqHMmoNt7h8bpS9T8aTPMVTkdzafdfkumKUEM6kwWRF/5U+qfCMs36/+B1VA0UL9o2IeQiGyWKktgVWeyMu/c3738MQQcLkSf6FrD5Hg9WKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e7GMgU7t22Pn1/1g+T5rAyvBuxNreU5w6e4c/0B8iY=;
 b=cZCHztMMasfESC9WudXv4wdLTcNkVo1wwwpNCe8S/qfGtn27pQNazIkI8z+mOXdPN6TW7XRhIGuBiLd1GNB+deTnsGFh/8JpIgGm+fkU7fNNNYI6BGIwTBw6guYg6dWmmv6iLmloFQhcs7iWzDCNPJ1ooTfsy62s2q2OWtOMyed+WLvLMIUYqOLgGz6aQV4PaCXTI1uQ8wurQFa3lwk37VKMvxLHEWFhb3/pf8KVpivm0DNvpbwQVM3MWvTWMAd9KDy3nB5/QO37BBig/cbw/k6CUjV6/EujmyyEjEXJUnvxG6mwT8jDaFLhol1HXJwG+f+RIhdjkhjr2N9fpD8UYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e7GMgU7t22Pn1/1g+T5rAyvBuxNreU5w6e4c/0B8iY=;
 b=a6wxhNlRrLxr0iITHCIWIciwHzcX/8bRzheSjoNAXlwmu2wcxQKe0pL9eLwUONCfohHe/zwyO7mArHXkxFJwmfLR3ZGc9aLAw4xRMfo/PpRw8eSvh3jDndsL/FAgmjGEg0slm4HWXTZC3cqS7Q/c5YIx+wikO2pJT5rY77oX+aPDtQg2YOdOLgcABOYNhp51s1wYnnvfU1hW4TGY3lm25hvlDLb+pavbUGKkiullsnOee8Zu8S19Y8Rz4jdyhtD0FBJmDXaJRsY5I8yW5qjIHKIEss+Dtg4Dc2qvq2ClPmDBvQNuv+5/7dFdJqtnPG1adQ6o5hZ2SIJawWmMyPatCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com (2603:10a6:20b:ae::26)
 by GVXPR04MB11542.eurprd04.prod.outlook.com (2603:10a6:150:2c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 11:14:08 +0000
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69]) by AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 11:14:08 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Tue, 19 May 2026 19:15:19 +0800
Subject: [PATCH 5/5] arm64: dts: imx91-9x9-qsb: add reset gpios for
 ethernet PHYs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-b4-imx91-qsb-opt-v1-5-9b416d2dc224@nxp.com>
References: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
In-Reply-To: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0352.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::16) To AM6PR04MB5765.eurprd04.prod.outlook.com
 (2603:10a6:20b:ae::26)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5765:EE_|GVXPR04MB11542:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d91f665-6a3f-451e-f313-08deb597bf05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|921020|22082099003|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	kiAmHRjJaISXfpsZAzVw07TYnH6g2moLfoGoWgmtiSZQVUR9b3DQy4WdGJ6rZOfo+Qkzc2Wqf4yxVVouy6HsX2dMoZKofPeLaOHgm9ZNzY5t+pwSbzI1qs5zWWVOMd6vYmuT0AbWr7KBsvufjp4dMbqcRUxXFYz863vHXMtIqKmyI0jwVllfKizR2Hq5L96HqYmjB0S6fbjomfgwAQOwaj76PKa2Ceb64r3jOsRBBlj1m8kh/2aKhbQZyvbK4PW3I0BvA8LG12uR8F5ggD+jtqTJnCG0gLcrU/xPcZOEc7OuZyCx9RGFfFFc7CH1fVjH8+iEeDyNqG4oKesJloejMvzRHmkpw6lqSKjSvZ+xU4P9S6Z1Qs3gGYTGG2vIRXDXdRRbBuBPbedochFV+YVAC5su/rFSDXFuWZGuBoZBnBVzaXT8T7GOZmPcUlT/5GEUkehfhsYMzqsOHi9H4hpNVIuvjVkGM2Abg1uWAnBE8xi4JimTghZkO4Sw5O3pCvqI3rn3bClUxd7Xcn4EVbCoBL6CIsE/A4B+DY1NVnPbfzBHDgskydWSE/FpqFtzNXcspnimOkBvUIu/Uu1tIvCU4g0RHnw/1D3s2q3OT8hinL7YKgzvARQEtMYdXRsFEVPf98OrzP/kINDCXQtet73wqlKpe0nvxn0eHHIqb6k9lsCZ0xZlAtYHSjBkes8QKdb6KAR9VCBJYvj7FMISlaVL0PApbI8i6cKb3b9DUWpRVDFEYH4KtuFymSXROInggvYq+sCPX42D5tYq5KdI4MU5Lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5765.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(22082099003)(18002099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVcyTDhzbU43aHhMbVEvVXR1WU9VZVJzS3MvbGdsYjBqdUhiR052VldGYUVn?=
 =?utf-8?B?UVNZeC9UeFdZQWJ4T1BEbWduUXVXbUZxKzVwOWNCWkljU1VTdDFrWDJHSFZi?=
 =?utf-8?B?OE0zajJDY0tuNms0YnJNMElJSkd5ZHordmpxSytOYmphMjVEZmErWDlmNTBH?=
 =?utf-8?B?MitOY1VCYW95amJGTWtoOFFlakVUbEVMMDdWMXd1RG9UaWswd3Y2M2Y4VjlR?=
 =?utf-8?B?MnJPT3BXdTRNcG1pRkhZUUw1SWo1SWtyTkt0d0xuR01Vait3ek1VOWQrbWs5?=
 =?utf-8?B?OG1WUlZWbEZFRzJsMnpiZGt2MndaMDRmRjhMYzY3RE93YXV4VHJuRGFyN21v?=
 =?utf-8?B?L21EajZOd2ZLVkYvbmRvY3F3enNxZUNBaUNJTmFJOFhWaUdRT3J2RkRUZldX?=
 =?utf-8?B?MVdpK1A4VHNnaEk3R2hOTk9PQ0QydkY1QnB4T0MyeFNVUHdlcE5XSUNJZGk5?=
 =?utf-8?B?NUFNaHF4eG94U29VcUR6aUMyejJIcytaZUkyTXgyRTRRNzYvUjdxRThNWTVV?=
 =?utf-8?B?cHVFdUlFSzZGNUM3bHpaM01JbXpHdmx0QzhUNzFtNVgzeUtiUzNLZ1A2MEd1?=
 =?utf-8?B?b2JodCtpMGRrYUdBR1JibENYdmYrR3gwbU5GODVLbEMzM2pEdTBJY1JJSVlK?=
 =?utf-8?B?dkVsYnhWU3k3NDY4Rkx4cVl5QmdFa2lPV1ExQUNESWNwS2MxZE1rMFd0b2FN?=
 =?utf-8?B?QW5rZkxCNVY4NHE5cnY0RWNQKzY1OEpiMVQ0ZjNSbGlYMkJuekFPWmFMc0ow?=
 =?utf-8?B?eitraFZzSGVMYXVlTjcyZmo2YTBtY2hnWmJIbjA1bDVBdWpLK2dDNDV4eWds?=
 =?utf-8?B?bTdsd0pYanFOVGhUYStkMUt3a0JoOS8wYlN3eFZ4YjYwcC9PaTA0UkU2c24r?=
 =?utf-8?B?bTE3dWtGbmNCWHBLcGxkUVh4NTZTcDhCUUQxY25nWmN0ZXVIb2lBc3BVU3B2?=
 =?utf-8?B?WFV0dlAzYWhDQm9CUjRPdVl5OENCeGVGQjMycmhRbXRMaVZzVTdSbHM5azhm?=
 =?utf-8?B?cjhabC81a08xNWhzSUtRa1J4a2prdFQ1Sm13dFF3QktXa2thVldEMjhTU1BO?=
 =?utf-8?B?bGIrdlFHNmhGZkxGOTdxeW9SM0YzYm5VSU9KU1hmbGM4NWxvYjZ6LzcveEY2?=
 =?utf-8?B?eWRRNlF3bTIxWnBRY2RGdWVreG9DWkxiR1ZmeUdpV3U4MTJCbFZRMEhWTmdM?=
 =?utf-8?B?bkwwZDh0eWlhbnIzWGJMSFFlNnE1Mm1aUG5mSlVKejVwR3dXRXFMbVdsaWN0?=
 =?utf-8?B?cmFJaVpjLzloVXNyUytkWFAyREJHK1dEUCtjK096ZU9ZRDdaSmFCK0pEKzQ3?=
 =?utf-8?B?TEw0Q2IydWcxeHRVZzB4L2VYaFlUMXc5USs4Q2hDL2RsSXBVNGkvTHh5L2sy?=
 =?utf-8?B?Qnd1akFPY3hVL1RTRDZqYTY3OGRJaTRBUmVIVFNjYU5TbUZGbFJDOW1iN0VS?=
 =?utf-8?B?VmZaaWc4bDB1ZjNXN09MRVU4VW1jcDFPUWZWUTZ1eEk2T083ZlNPcERzdEYy?=
 =?utf-8?B?cXhKWnVyYUdxbnlKU1JOa2E2VGtQQmJaUFNIQm9wQkVQSzZPUHEzNW0wNnpG?=
 =?utf-8?B?a1NqNHQ0ZDgwakVFMVFxdy9EYnhmTFRoSWpzYnhOWHhldkNsNGZqMElZODV2?=
 =?utf-8?B?TmpvN2ZPdUNUZ1JWUGRGL3N5TkFhTEpQbDZWcWR5dGZQbXJic1BHZHVpcGFN?=
 =?utf-8?B?VlBZU2VlTzZUcWh1SUpnQTI5U2k3VnlodlppNGgzRVZ4cG9ra29ZVzY1ZlVp?=
 =?utf-8?B?ZHlIeUREczU0NzZwcGwwUnVLQWJPVzJaWlZmK0QzanY2WUEvalJtcXJVZUx2?=
 =?utf-8?B?dmNaWmsvY1o2MG1iMHNPRnk4czVKa1BkZnhnRGo5WTRvOHREaXB5bEJjNlZL?=
 =?utf-8?B?YXNXSC9rdXhnSkJiNlROKzg3WW4zbzMrSzdEZXRsVGxOZmpkNGVsaFc0Skty?=
 =?utf-8?B?M1Q5cUl5dVN6Nk45SjBRaTFRcmlQUk5zN3ViMnhrYzhtajlvZ0tRUG9VSVMv?=
 =?utf-8?B?RUVPaXpvWDN5d2JPZ1NXQ0U5QmtGSGFERXFZclZRZnBCaDNqSGZibUhMYUlB?=
 =?utf-8?B?dmlVZ0xpU0lUNHVEeWpnMGttd29DZklMdGpyeWhoRWI2WmNncy9iT0owM3lX?=
 =?utf-8?B?N1VpSUdSL1dvd1h2UFQvK0N5QWIzSytOb0VkMmhrbkJ5SWdvYkRQc2FhS1Bx?=
 =?utf-8?B?UWxQK252M3hrcnZRU1pXV054V3Vqbkc1L0VYUTJQWCtDVnJNczhtZ3Z1SGVy?=
 =?utf-8?B?QXpIc0Z6R1YwNW9XeXNyd0ZrTnBuRGE4c1dTbmNqYW5nM1RIU0pVK1U3ckxC?=
 =?utf-8?Q?iIsmHYEl1NoOFOSvji?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d91f665-6a3f-451e-f313-08deb597bf05
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5765.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:14:08.3696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bwTqKAA7sV5WmbS2pMO1/Nbo2jRS773ZrGVED67W+ghOdk8+sGZKtBcS01aXaL2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11542

The PHYs of the EQOS interface is supported to be reset by I2C GPIO
expander. So add the support to reset PHYs.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index 62549a6de1b64496ffa5cf3f543145a00dbb10a8..ea8cf14e0bc6ac434eb1e1a6aad82d9007653eb6 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -83,6 +83,9 @@ mdio {
 		ethphy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
+			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <80000>;
 			realtek,clkout-disable;
 		};
 	};

-- 
2.37.1

