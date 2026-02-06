Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A124C288B8
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770356949; cv=fail; b=NNA+cd8uPqioia+MSijF9p8tHDH/nFlPpq2QrS+5UqmGT+2CA6AzzrbtMWSIgQwIkCHfHRLGn/Q+vOiPFOX3DzYXgDPck12xYKxryfzCSjh/GfK1rzXwjXLIg7rL8OtqD5/2SKMaLDY81LCfGHnsYNkO16OYJHLDQjxULzEFxcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770356949; c=relaxed/simple;
	bh=bWIVfFTTHuL3APR1WSTriEtWucxMu4DKrwmfzD3Oz64=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=oXrEAprt5suXdPCmq8AtAGWVDHxRmgCdECB3xjUAd+D6nkYepIpJqnX7F+2jJdj5RefiRpjUvAFWxXNTea5XbgqYrcJ0oPHj/xI0lJm/ris+rCq1mSkYKO72EbBUD+777NyTXuu+2ErkoV933UtaynNotpxUfYjxGgl75zdBDXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eG4XEWk7; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eG4XEWk7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6RXs5lgoZUXZFdjYlkwGpLIPLkKYucuU63aLOm1NHxOpRs7C8YYnnrSg3+goHLFHEkEYrwms0rgJiBkZUFB1vGG6QWek6e59gzR410//fH576T7+Cfg3aJKUjrt/DLRnUKyL+RQI+YGJlBCXWHWbxcu7ioDHf14lOZFYe5r/JtmW7u+vdjC6J/88e/WCM36bM8fIXnzR6HbE2koPepHOWx2qJI3tjtjcAoGwGiF1gG6j5Wbd3VtSSInslV3Esug52ix51UVaoDpbxaINtp2Dhn9iQWYEFYQZQMWcHGrlm7pQbgCINfIMOCQABbIr/Tll2ToprcsGgPnyo9dL6C1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtSEXX8H2V86iwjULnoNZOcsrreeaLcFbckJEikyROI=;
 b=pGD1CevFvT+uqrNAE3tbTwptEnp1hCOOsBYbcbMGpUNACE/aG2hRv/DnTQzcOo8Clzfl3jHApkpCCqByHo+w6B3pMvqFMRD3mfLZK0MwOqaIh34BHp8zJul4AU8HfTA1tOBHaAnjEojZRs9PmPKbMDhixr+2xQwDSwG3votEwESTcSHFq0QR2rKiBa/miXZF+q5UF9MevKmOm2WYziDkkm6k369c1ySOyQJBRCfHhszLZ8jKZQPYRNIxPNBPD0ow6mE8PmLR8/Wd9rbzWcqfVK7O3QcexfG/3+qoszls+E2ieNSTuC+tEKk5sSQQGDolMe7f6JDE15px70Z7iwwGoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtSEXX8H2V86iwjULnoNZOcsrreeaLcFbckJEikyROI=;
 b=eG4XEWk77ODmmMUJOoUCYRRlxU4o7/XMFVcBXtg0fz6rWd5IUPFVVay7lb8rj9H97DOJAJsV1HXMSQABROVxBKHiz62Cljfx4/IwlPbokMKQZdyNXnyA1u0mPW5ckiQz5JScm/0AWiSMgER0PoVYGnnvuKWnUX62RQZJyBmhL2aeJBblQwHtjbm9FWSdKxePD+ZsLSYCPrNttOf1sanf2ncApPir+VrtJOeaMRGin6Y9dJBrJyHz4mmczN2DO5JTfrAqE47aE0KPXlrNsP4u9amk4kwSsndTSjpa/5qu1LPA4+Cr/eJQYAK6cHlmIspe3LQjyVp4rE0RRp0xonq9Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AS8PR04MB8803.eurprd04.prod.outlook.com (2603:10a6:20b:42e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 05:49:05 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 05:49:05 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Add i.MX943 PCIe supports
Date: Fri,  6 Feb 2026 13:50:04 +0800
Message-Id: <20260206055007.3995679-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AS8PR04MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c76889e-7670-4827-4307-08de65437014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9/urVMaretAhRa7LhTSDYEhuiZGmVAk0ECT0+tE/DUNT6S026VKMwtlAYDxW?=
 =?us-ascii?Q?g6RNSwf3hH2UZMI7nItHXGdlIN4X2TOPnlNhOLBU36FWu6xns/g0pZtvFKNc?=
 =?us-ascii?Q?QpxbN4xzKWX3p9EZFL+1sKyW8Qojyj0pZE3Gq9FH3xiCd7swwjNE3hUz61aM?=
 =?us-ascii?Q?8cBTAP7VRFbjiq3vskvoQ3nMS4MPSRIXSq/gpBnZoeGVmtxzx0WnwF1DgCet?=
 =?us-ascii?Q?7NqLI5p8TrgDoWyQP7vifD9UUwThmkRm4Gqfc4F0UrSeqLFvJz9mCLdek9x0?=
 =?us-ascii?Q?bu18A4Ak4qlHAqmM419Y3uR7zqSsMFFlsGuWrXm3QEBN4SM87M4hcgD5zwu4?=
 =?us-ascii?Q?Qjx+Awu+65RBViUfQx3oNUNi0GqSDYH5LSrmUv8kxKWMl9WED1L5uiyD+Y7C?=
 =?us-ascii?Q?tvM5iwmfY4AzkD2rDeuSqLqXzeZnetsGD+PKfUF9aW11rJVeINFtRLY0/2E9?=
 =?us-ascii?Q?Fy+ymm5SpqPByywEvPtz5B8TV7Kl8f31/0q/xt6LrvAusuAuIwQLNIE4YVsV?=
 =?us-ascii?Q?1IW/kWh+za2uVYbg/aahjnZZYPJE9H3XFPcmioGWqnDu5vNP/cCuWENHDuED?=
 =?us-ascii?Q?wOtgY3W8GWQ6BSpbWq26X6aZNMIJbVV3MW3Gi+M/RITxW6+alsChE4ArNdH5?=
 =?us-ascii?Q?m9lTX9BCxlGuHX7aWhI8YPAuE0wqJUbcf6xaal3f9BULZfvb4xFOo/WTi4fp?=
 =?us-ascii?Q?BcOKWdoJVkW88ccYUdpnr1oecqWc0PWD2sCPFPLG9qhCzBGxWvaTPO2YZJcG?=
 =?us-ascii?Q?lxlqoxI9IvgMBvWE1ueyWIqXbQB+jg1xelkT3dyzL8eO/rkYoRXspyqFo8Nb?=
 =?us-ascii?Q?rFi9TK2c50MK0Knxjt/UlxUrGnfRVfYMbUynFJqlx+j6cOSVZ1WAKHuZTu+K?=
 =?us-ascii?Q?ANf5g03bNoArxqef8JqmW7zjbxGBgdRMJ5CeehzvE2qAPeGIrhHT8yCYgpX0?=
 =?us-ascii?Q?HFdHiOPsC9x178woEZVSmxcuQrYCuUdsAA8oZDhckbyqtWR5ix4Fys/qZ21H?=
 =?us-ascii?Q?AYLcj+K3Cc6cvp+PbmMUPhYmr0lKya2tmdO/oTVoe7OrE2pZZyt14aczEJFT?=
 =?us-ascii?Q?n1O66A3ts4pugiuflePLzlXfQEU4He1/cMdJIkrYtM5AiVXlEh0mVkbFaOBo?=
 =?us-ascii?Q?RWkSqobBJQxn13sKnTv46k6vN6H1Re0wpQvpOwoyelryOb8BSWXEKHdpXPS/?=
 =?us-ascii?Q?hoTGGyA0SBAG22JbGeQh68QnOnphSRt21wHGHBlhCNgD7iJQWZOShMxOTXuP?=
 =?us-ascii?Q?Wwy0CvEl50KkYOoVKZw8eQOZDR1ZUxGg2sadqyC/4pptuencHS/QHE3mTd4w?=
 =?us-ascii?Q?LtxZYv3HIf6MLxzurHQ6A+Icc+6XSdz3q4tnDuG2ejOnh7LLN8hI8MSbqYdZ?=
 =?us-ascii?Q?79bypqdJs3dxOgABlPyNCUAmEr/6DNcCnpwl4Na2Mb7rpEBAo1MfKSsT7TjW?=
 =?us-ascii?Q?3hWiwSEs72ogh8dX2KAw8IGChbfUoSGU5h4NtMDJHYuVocKV5FLhlzK8Yzzo?=
 =?us-ascii?Q?TlT5CVoa3gblbATvopMm/unIIVDIcqZ9z5z3KKk4G9LjBldyOWsIT7Y+XHEx?=
 =?us-ascii?Q?K22eR3ReYPw1htmOxdFehwEVeAxS5D2AZdl5lFdRW6Vbl2S+oI1YHSpPE+Dm?=
 =?us-ascii?Q?AwQXciDNGVxO/KbLhYfUfII=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ILzMHcEdvFB2EUcgnHtWfQgjCuwDvNsZqfGbPQUnTtqkb1AkkdOH5AXNlBfo?=
 =?us-ascii?Q?uv/spgU91BWb/8TDo7y1A7rOX2akaQ/AxR/hLaIHsLaEMcbNYG09mSdjbMQM?=
 =?us-ascii?Q?yvx5cuVsLYfPJrgMQdjtky4e4cM3Qb/Hq4s/MvrXE8Sm7i3d3+7IotSZe1IO?=
 =?us-ascii?Q?KaRBaYA7K14j6Ai4sY6I/hjPb5NqQAby2W2C0X0SQ9stTbbzH5TMBYUP1Al7?=
 =?us-ascii?Q?DSbh1Jgx8K6vHnGULC/g7ZuZcULOGnExbj2Rhyt6NqrIraZkffbTzpm5GxA0?=
 =?us-ascii?Q?prXH9HaYMRCoHWuYizGiB3av6llk6eUZBhCSna4q9l/CvWCDhjmlOJESS4/e?=
 =?us-ascii?Q?d+CIezXLOjBEi4KR/Y9+Q/9/ZerIKXnOGoMby3Vj3AWlvxo0V3diQxGMH/KA?=
 =?us-ascii?Q?v4ZWyjzRzFkS2YZMiYdIY7FUf54J6O/w6wHG+DYSrUnXLaZ9egecIIopvr92?=
 =?us-ascii?Q?PhPgu0b2/Vf9SjhDhiY63dZSIWGSGLX4tZVvjeZX9CYe80u4pdHfQvbI/CAm?=
 =?us-ascii?Q?Y1aBlCAfaWoSP9MGbaN5sv/Kd7Tu7lgfugVfwQ4sOi7SZFgfKg/shlVFwto8?=
 =?us-ascii?Q?Oje91+AobNZjAvIXcnmgX2lMM7Deb6ChOAIi2mMKG2CfF8MhjdfxkIR4eS/r?=
 =?us-ascii?Q?pi2zkV2sqpT+a0n0auDq1Sp5rKYhQMjwMOb1jhGIwwIDFSDorek0X0vLPj0I?=
 =?us-ascii?Q?CGwZh+h9FWwIvErA+xM1UeryAsILZKkpVl9vCxM4Rc+qpVdApkxMoJhm3Rt1?=
 =?us-ascii?Q?i08XipvHCm5WY1ZPD4FX2vPhofDcsR83HsPPp5o4F+kRJOE0ig+aGXWzA3Qv?=
 =?us-ascii?Q?Nzn2Tni9qn2l1UIDe4+i+J2ZCgegtYvHIrJDC+1Mc2Y+b7HbzAHrNTMo2b2C?=
 =?us-ascii?Q?xqe0ogMZ+s25MomkgjiPHdFEvIQlEAUOQ3DiAK+5MHzDN4o7BEW/ykGTXpMw?=
 =?us-ascii?Q?N6CT1i2G5+FRCB6m4UWe+3bgdLJFpgYYqEwg3jLn2HHFqtEqlloDDbn2lele?=
 =?us-ascii?Q?9q9rXyVoHbm+M+L/SCxcNIm0hvl5ESCPUNuWvPFSGuq+uw6pvUM4wJniQjVs?=
 =?us-ascii?Q?dh9Ll1TAkMZ1/Szt8n8yQYJYmJ2Mgv65rJ+bCJ05UA18RDgIrUVLRFuy8Yqb?=
 =?us-ascii?Q?g1F9rq+GbMFJo05yo8lUxYoZ578iu0QIW9E/PK24LWklU9038hgT5jDUU1w2?=
 =?us-ascii?Q?/YAIJJj5p8ZGeQviuC9aymAi1SGVgDnkVyUh/Kkwq8F4WwUIQ2WdXm5ebiz+?=
 =?us-ascii?Q?OT0MeUrVuzH1r40tSc7Cq4E25NDbeaHJ3ESGQ2Y5n3xlnQ+WdcCjUO/1HZ3J?=
 =?us-ascii?Q?Vo/dRtILireMBJUv9xnbxh4P1hZ1KdMdKVGmT+GO32JoTvpsN8ax78vcS8HB?=
 =?us-ascii?Q?P9DZL6iQNxtMG4MuQa7jBW3ecshQ5bKD3ygnHeu4+N6r069fzng3SmH0gGxw?=
 =?us-ascii?Q?Fh8+Qbp+1X7bwghm3IPE6s8z9h/xdPCEObKIbFwfr+o4Y2CkeO/fhWPIQlLn?=
 =?us-ascii?Q?HAeoKis6RlAPMoG1S4GzCN92Y2e2W9J6Dh3sqdePzRquWcLa2HXX3y4AG4Jf?=
 =?us-ascii?Q?EWjC1deJ9YrO658EE8Av02ntPjvoyKZMxbkInshgJQgZYUBXmaibp8MhN0ir?=
 =?us-ascii?Q?isw/A84LBcNJ+xdc+Vg3YfEllHTQE735aiuBskVXgZEAvQ8FF88i/F28k5sp?=
 =?us-ascii?Q?97va7pQniWur2bOZTVOwoIcLc29WmVZHj99/Y/H4UDCpyqBTLdhkLd3ktCaj?=
 =?us-ascii?Q?MKYIZT0umg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c76889e-7670-4827-4307-08de65437014
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:49:05.2281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcwLB6kRDhHNd5age7/DjanKRrbub31+72hA/DAmQuO2B9P7NMLPwcWv90XTJuKhmXwwJzP4A3SFn6Rkuj5WUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8803

This patch-set adds i.MX943 PCIe supports on EVK board. Please pay
attention to that it relies on the patch-set[1], and the PCIe1 port on
the EVK board relies on the {2].

Both of them are queuing up to be included in the coming 6.20 kernel.
[1] https://lore.kernel.org/imx/176649331066.523506.9443864112044699350.b4-ty@kernel.org/
[2] https://lore.kernel.org/imx/inzg46tc2fwsajxq4vzdyuiq7krzy6xtcg2mjaieninz7zsmgm@mtdjr4tuegpq/

[PATCH v1 1/3] arm64: dts: imx94: add pcie0 and pcie0-ep supports
[PATCH v1 2/3] arm64: dts: imx943: add pcie1 and pcie1-ep supports
[PATCH v1 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1]

arch/arm64/boot/dts/freescale/imx94.dtsi     |  89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
arch/arm64/boot/dts/freescale/imx943-evk.dts | 108 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
arch/arm64/boot/dts/freescale/imx943.dtsi    |  76 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
3 files changed, 273 insertions(+)

