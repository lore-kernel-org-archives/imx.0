Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013012.outbound.protection.outlook.com [40.107.159.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC0D34C130
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511501; cv=fail; b=DkQQz5RN0lkG42wqLl9A+lKrb+oqSZU6b53GBT3WkNLLhrcqEv+jXjsri8R3Tqevm/jxGU1QjKWKcr1qwy05jz6fefAuGgHjGp2K1xAf9E51YveuBmq24WhqZRztB0BnlweHiaAON6bDDr0S7Z3tZkDf8v/7NMdON3eBzHK/72U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511501; c=relaxed/simple;
	bh=EfIHEg2C6mxAeuuHfb6F+dMCczTsxkIWUucji1qZMmU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rkWx3TiRbthtgb2ozHPSZKm0PtXFLmW7a0XIVDwGkVe8Sof4Hkk50df0C1NuixScG2j4KmpQnZqU4exXN56jQWx7auJkc36LPZ0EMyDCpikXe6NypMit+GF54SJo/B5clRhOk3CUhdSOrzKuJgLC8bs4DdP26mVPlPKawJXqV2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vq+t59LQ; arc=fail smtp.client-ip=40.107.159.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vq+t59LQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1ZqXx/uDK7el+IpVUD7Hm82BwxVnSpbf9I0lggiLaxhXsUSIfLH+ZBx3MRwKt34OGvRJc1HYgzD9FqodPSGRi7YEEh8W+XbqmktbBCk90JXqlhDPQRLrZqM54LrU2FaCgWLDyQi4ijsOSAOkFOm6po5C98WCKe0Ee+Njko0RjG7VRQO9Jjf55H95ax4mtyIpdr6sqJObX28esdP4UP9KnIgFu6CMn1mU6MnJrdNUqxTSFrB2xhZCZIO3bVeB3A3zuku8FVNtW9ShivA2w7JOoBPLyOxpRhm7/2vlq+db2DAXrID27DZi0j+Xbvr+yDON3pyuHgvfN3XnKq2S44Jdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29lqnbwoeyaD6qa6wv0WJ6VwrGi6roy2def4Nu38+0s=;
 b=ilDf2pMcOtT4ez5h4Qw//Nk1PbOE3bn77UFvi+WTBZS5y4IlJBF5ky6olryaqYPPUIqKSjfWplHiXCbaoMZHu2Tzd1KS4q41rkSsyIKrzQFHwfNy3d0r9EyEGi25ZSbdV0/chcdUn57ssT5/G+CtfngqMVsxHAnmMbFXgNCHcv0vHkPEebTMXK1QeiRc496+I7UjbtvgD3oQgQXzxdLDJK5bVUmwbGOVQC8Bdn9+u55N2vAqqz9ZcsJusE8W02tWRsRqAfH4DhOezHs/A9m1NTdOzooWdjTl4s5fa4B3ObDlfMLyO8ZoCVTgKOlN/ASIUzxp4Emr9nwGacDnoms3Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29lqnbwoeyaD6qa6wv0WJ6VwrGi6roy2def4Nu38+0s=;
 b=Vq+t59LQYZ0vNS0x/5wpw1IIQHkQgSVCO5VkimR7yRasEewjt/7jskGoUI3xzAdotlFBr4OYU9rcxqOAit+K/XbOwXuPM9i87eSztnYr6wCBiVvT5FIErp9QyN/F35p7rrlzI6tyRt0rk36LAvnjZIFzMoVPWDqrVpvTB5Pe6gv4J29RrG49Cxu0qIiPIxlT/ft1XukgsNsrSj1igE34G9y0ydfxvZMTmnQLNcoTKo2MCQwyMB3m8NXNERr9wyE4XeNXqTAzZAQ0DuQRRM16F+vCZ0PkcIQYk/WEp8hHro1ztElkC6vZXd5Sw3KxwFaOkflWo58G6lFOLaLWFax8QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by AM9PR04MB8413.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:51:35 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb%4]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 07:51:35 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Thu, 26 Mar 2026 15:51:39 +0800
Subject: [PATCH v2 3/5] arm64: dts: imx93-11x11-evk: remove unused property
 clock-frequency from mdio node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-imx91-qsb-dts-v2-3-b991b81639e6@nxp.com>
References: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
In-Reply-To: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14)
 To AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|AM9PR04MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 421caf88-3662-43ff-f071-08de8b0c80d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	44PW1x3LbEgSQgGyrqg5T50RhBrpIm4i/5ELmqVsRBsm9t+S3CRemZ6xOGcpVQWFGEMDOJZOd+1kkjuTwHXYfNJd/P3UmBIQRYExdIDANb5K6e01jRu8SV9Dw+mlJa02Y12Jo3SxHH3EmOslVAteNfq0fWuBolXspxBPUxPwTYkBqQL/pC9fPV5CCDRa6AmE9fk5m+Ug2Rh8w8oNVX1wUS6bSVFnoeHa8Eo7IYB8Xbhwy0z2QWeeuebVBA1QKMPQVdmY0hX8L5XkOuhlGhiRx2r5VcdzJICk4j8CVx+lPe2NJ5EBVYZA30CdSbplbgHjwvD3uV34VSY00vJ6WghAVoCBdQ3SVRlUY4KlqRVn4jCYLqEWwARNS3aa1bpYi6wX6EwHdCobHYoL40LbjsrQ1V8rvz5+ft3rtfzEcDudlyPP1BIwCpIcALmj1xew8sUYCPJlbjL5TW78mnUrlwLyKKYdXkV6zhsK7VYk1puQneCtJ1VDdpewjOqShLEVs3mwu2lIrzc9TrWFh0iQPIthLSteKeukqqYayDg+WzfRYsB7M1Nknysx3ilblBcsu6iAIio4+X/kDjTBpTYgwIkl/hkW35/DGagd0saD06tUjrajIpVc6Z5IS2uX+o6BO0xLztlaBiX0s/ms886QBMmvMRDf6zB7mHbBskXaaWgvLOPhvEukHomCX7tN9Iy/K6XO5U//5Dg4FVHUC+JxGK7Xcs+pYYgNOv1+fdgqDjXK+Ue3OsAf//3pdiVtUNsbbG4hfEPqY1ofm6zd9hxDdNpDOXnKOx6kFTmRZoucPzrAdZBr+3nPxWFIJOoB1winPOaC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEM5TDQ4YWRPKzgvN21GUWgzckZJSExoSDBMc3lDZW1IN2V0YnEwT0toTFVF?=
 =?utf-8?B?VXI5Rjh4a2RGMGttbFNGNjJJRXZaK3BBU3VaNUxxR21kN3NoV0N4TCtzaG5s?=
 =?utf-8?B?UWE0cVVGK1BFNmxtdjB1N0VXZmNMSUowckVxU21CNlFEMlBqQW5wbC9zY0No?=
 =?utf-8?B?YUtyOXkvMERvZmtTNUJPRFdSTDdCUUJ3aFFCWHNHcUErWThiVmVmWmxqdW1S?=
 =?utf-8?B?ZDVqaFhuWWRkTCtITTd4TXQrWFdHWkkrRGdod2YzS3BXZlRIS0luWDV1SGt6?=
 =?utf-8?B?TFJCemlITHYzM1cvZXJnTHB4allPUFRkbXQyLzBhL0Flalc0SVcvYUhiUWFH?=
 =?utf-8?B?VUh3RWxBYXdiTEgxYVY4aThyMEJaaGtlS2FITFBUNmxMWDJuTUhDTEJOMUxE?=
 =?utf-8?B?dGtrRHB2VEZZa2tTRzhKM0ZXNTdHZFpWOWFwMk8zbkpTNE9nMWlucE1EM0lI?=
 =?utf-8?B?Z3RJY0gxMXhKbkMvM1h1ZUgrVWJJLytoZDBLR0lJRS9GWGlDZ3NRVFh6WXhv?=
 =?utf-8?B?S1BSNzN4ODFXc3czUG9vRWo0Rysxa2VTV0dhZGVFNEllVzVvTWFkVnZNY01h?=
 =?utf-8?B?aW41a0ZlaGpiNTVtMisrWktNcnlCd2xzbEppZVNrcW5CMW5ja01NTHk0V0dO?=
 =?utf-8?B?SGduMVhpM2ZtcXhxaXp2UWlYQkhXUnM1SEJBdFFtZEZmcERmd3BsSXNBNC9T?=
 =?utf-8?B?WGxpeGFWZ2FybTFlK0x1R2c3eGFsaTY3VXFQRUZwcU92Nkc5ZTRwbzI3dVh4?=
 =?utf-8?B?QnJRMXRzb0k3ZkVJd3Z5RVR4QTIvQ3IxL1VjRHZyY3BkTHBBM1VwRFQwczFz?=
 =?utf-8?B?am8rSXNKQnAxbGNCa0Z1RmVHNE5HbDAremdKTFZoWHRmZmZpaFJnTmlUWllT?=
 =?utf-8?B?U2hjdnp4NXpqSmllWVFrZEd5UUUwa1M0aXdXVjEvUUdQR01UVlcyS0VEcTh5?=
 =?utf-8?B?S1lvRGVIcTJNQW1xUVJ4ditJdDZld2VNK0l4ZE1FNEl3UGx1elRaeUJWSlNF?=
 =?utf-8?B?R21pMXh0SmR2dS9vWEo4NmpJVysyRWtZMGFPdEhRenY0NVJsWDYzSkhPM09C?=
 =?utf-8?B?V0FXVlpyRGxHN0YrcUJLTU1idEZoTTd5QXJMUFQ1ZlhQVktVQWFZODl0RXJK?=
 =?utf-8?B?ejE2NGFtREZZK1Q4VklKNGNmS3ppbExxQytkOTBnNjg1UlhTV3BWVXRQQXRG?=
 =?utf-8?B?REh4OHo1SjhuMWpacXlOVHZwa0swUEk4ZXMrT1ZQczA0MWpDQXNYWWZ1ODcr?=
 =?utf-8?B?LzlUNTd6akw0ZXIrRlg3TzNFdEZqclpBcEZ4enhYcGUzZUV5ckNsU2tVVVh4?=
 =?utf-8?B?aGpWY0pJeGFLQndDNDYxZDdNOVFuN2NmWmhBTkhJbUNUaEE4dFJNYUVEbDNM?=
 =?utf-8?B?UEVXeHVXdUZubW43ckVTVjB6L1luc21Tb3JQdVVJUFZEYTBqWUE1RWdQSFZC?=
 =?utf-8?B?NG96NGVpZDczYlpHUi9GL01JNVdkYTZKM3AwVWg5ZVFTN2xaZmZvaFp2OGVl?=
 =?utf-8?B?QldFZFlCOTJwMXk0YXdxM3NBMzFtU1YydmZuTlNqeDU0OThBODQ5djFIblBN?=
 =?utf-8?B?T00wWlJwQnUwR2h4RXhrK0s1eVdFRXpkSW5sRnFrMkIrOHozaTkyc0dBcm42?=
 =?utf-8?B?dTlXa0xRc2MwZngyekVPT1VEOTJaMmRQR08raktpaEErN3laWVR0cWtBanVu?=
 =?utf-8?B?QzJEbFhVYndySkd5Q2lERTdIaUxuR2liclE0U09IZzhEWFVDUm5VeUMyRVNO?=
 =?utf-8?B?dWZaNFVkdVBYTGt2Yk41c3lmTkViRGMxZlgxaXhzUmIxUFZEZm1nT0c4VGk0?=
 =?utf-8?B?d2F6VERWTEFka043RDFKOGc1cDFaVHRRMW54SThQRHdiaFJBWXpCOS9SenNL?=
 =?utf-8?B?TjcvejA5SU9SLzU5ajlxa2puNk5OOFZFc3lHWCtvOXgvWkVVdmNmQUVDeGJB?=
 =?utf-8?B?VlVHbnBIUU5sTWI5eEdQcUJFK3BIQU5BSGJVbWhaaGE2NVdQQmZ4MGI5S1No?=
 =?utf-8?B?MnVDWk13MjFTbnpkM09mVTVRWGMyWHlJYzJyVzBIVWdqY3hvdzd3THJ3UHNj?=
 =?utf-8?B?SGUrdnN6bWRxZ0VDc2szek1PbHB6eFdyMk52MnRmRSthY3hYRmZZeXh2WG55?=
 =?utf-8?B?czZncFZEZGxwcUpINjZQQlNtWEczUGtKdUdsMS9JV0RLTGZYaFB4NFJuRFlT?=
 =?utf-8?B?OHluOUFvYXpoZkNCdjJRYmlsWUJPT1BlWTZpMVQ5NTRJWWM0MzhQWGdnb1hp?=
 =?utf-8?B?elVIMWxFMG9wQ0N6bW5sNVhHMmEvVEZyYTNRVXVLdStVdDVYVTgzdVhzeElI?=
 =?utf-8?B?ZmpwNVNrUmgxMDk2amx5Y1orbWo2bW9LYnp4VWltR2pvSUZLZUZhdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421caf88-3662-43ff-f071-08de8b0c80d1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:51:35.1426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/OJGEhsaUtSkXtJupacRdLiyC1G1aYQx3UVS5fqWT4wDkuErrcKmuOiGhZdVV3j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8413

The clock-frequency property is not implemented. Remove it to clean up the
device tree.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
index 7d3fc4ad7b8b7cf213e8ec977589509a7419a04b..f48e7947cf647355c57c82a42a5c0807f53f3a55 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
@@ -187,7 +187,6 @@ mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clock-frequency = <5000000>;
 
 		ethphy1: ethernet-phy@1 {
 			reg = <1>;

-- 
2.37.1

