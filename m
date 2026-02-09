Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD4D2BE7DB
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 05:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770616637; cv=fail; b=I8O8YNuLETgwkcrF0w/uVFrFAEXCG0vMovGDmMygK/IX3n30bom7//5E9V6tlHPO6kunL249q1TXUbwNAFG6g3CZ52QQg3n+rzS5uWuA8V3dTEUW5UQC3q0F0xhIOSAGSz4ZTu6b803U9jIHZoYb6gviNWDsYyTaj9i6o911ltM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770616637; c=relaxed/simple;
	bh=dOUeBU0eMlBDEjw1tbuLzOzZV9PsGrEgvzKSRpXYkbM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FQZeNpOWEfsqABFk3mAgm6FSVOQfTGhnyqa++IjMAD7NxuB/m3MEauwOJklTtwJlzQ7PEbqv3SJDibv9KcIdR0XldMc/YVz9h0DeaLuLHkffWpN+TKA9EMO96tb+a60A65aotKvLup6q3do3wudxa41plvKUJ3MMCT6ExbDGVJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GBR+K8ie; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GBR+K8ie"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJ6WtOE5pa5nievwijQ9K9LO44+Jzr2zKUYsivvkqou1qEzo80WzsOB6Oyn0rA4TUfVBuJ26ZAT0SAoMrpYLbu1bR6Z/CrfiXOHurfLtgslRUjkPowLEP+NKnzCkLTP59YgPoznIZyd+N5Bb0wewdgBbiZMSN1LnSRLuQpV4Gyl4NYoyeL6ZrB+JelFRSn9iY6vBSC39kowuCxc60KGy5vNYF0pMoAGXtncG26GRp0CL/VMHkyxcMj/KlvN+flw/lm4dgaUUl3zgzxe/B7LbleboMkB5/wOXK6Nlj4BVNS38taHQS4GP34DbEfhLVXZlfG6xey/4+emS5tqZUaF/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZL/uYyG8BypsA5Xs2XGTkVnQyCqPv3Ig9eGJlZGjKk=;
 b=PMnVjSucb38d5adlMN+zb32y4Lg2YYzGMiH+ehL6Y+KX9HOI+nBHJSFd4Bq52IE9sxfdXcXKBhJ3lDwzk93WWp0u1xlVlWc0wMUgbrzqsrCg2Ih9shAOWOkx67sRPAGJM2HY0r0oX4uay3eBULVeR4pjK04dY3ObuDTybUA1aclTmogTZPMfns5FSOnqZGbcE1HYZp24PhLxwX1yg583Gzno0rR9uhaeOnHd4Hw/zvl+NhFEckaNiMdzMhZCqPOG8B5FUXXsxJtQWDkFQvOQGYjnp3y9XVcu4s8Q14IJd032GBtsIsCgwm2a2k94Ld0JRMIFVc93MUINBCYxP7xIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZL/uYyG8BypsA5Xs2XGTkVnQyCqPv3Ig9eGJlZGjKk=;
 b=GBR+K8ielOkrsrS9ew7KQfFpYQkvzfUgKev0MN0Fn7PD+B0H9PPDAPiFOlu6rxsyRvJ8GFwB6jBnsfYK7ho39ARwGLY99ei8iW3mUIeRvSm3RC2NEfgBwrspKlEZGUTjt0LwDcrMVm46dV6zv716i/cYQtqzli5lHXME/2ThgrmuD/hAmQuKZ/MtxqqgWuK6XRYV3tlYl8DdFkPhDQvIWNt9zfKKkcTV303eKh5VmP0Wdkt33070LHJbtdjdnr3Tqq+A52GZYfawlR04M+28nFUc8hrgBnymo6waDG9lnOlT+JSfExDZTdunS8zp3TAsPNCDQSwP+okTbWKUbFsTcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AS8PR04MB8994.eurprd04.prod.outlook.com (2603:10a6:20b:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 05:57:14 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 05:57:14 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	sherry.sun@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2 1/3] arm64: dts: imx94: add pcie0 and pcie0-ep supports
Date: Mon,  9 Feb 2026 13:57:43 +0800
Message-Id: <20260209055745.1545129-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
References: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AS8PR04MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5dddbf-fe99-4ef9-aa13-08de67a011f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1JR1zlbPvdd1Gp68XzZYpWHczFNCH4qLxg8KsN3ls9estSYm7vF0elAL57vO?=
 =?us-ascii?Q?yygdhP8IAppKAgR1vJu4ZrAi10iNXGlRCJ/YjDL6yqrewxHgZt/Wb0ffvCH3?=
 =?us-ascii?Q?vyl4brzRV76BRkQSkJFcGvKRGIMLeNWqyRJWmfx3CQECKa7cCP2eextWjgHI?=
 =?us-ascii?Q?4maGVTGN+5I6TqHlkoIQHPP69ResAWEDDJZWQkqqjeS+KpqzYuRaQDfY4SEF?=
 =?us-ascii?Q?aHwgpbPyH8baVyeCm5mxp0S9SvCGP25V1NvdJbTfNNml+wvlUq3T+5C61t/W?=
 =?us-ascii?Q?zh6m5+HXsEsvVupbNrPLQU2sSkVywFc1PtFO73s2pOBlrLkSxNiL9mfktJfb?=
 =?us-ascii?Q?E3uS7TZ56oVi++yD4NPmoJmYC0U9tIGdLHuDMUzpJlxLXQE7CTGUQH1gQZxx?=
 =?us-ascii?Q?ZCiD9fItF1s59S12qZwIezy079Qr6je4ZUJCUC43Fq1QVkxxh/tw7rKmSvty?=
 =?us-ascii?Q?Bt/7+Dd9zjgfLVTUKKpFedYHMzAFFowv4cUl+EoUhF21q3IJN/itOfEzgYai?=
 =?us-ascii?Q?7QCqqj87YEAEElF8Hex08QgcaeBrkPQkH/EUE++uN65hxFvbe93NnBH7QXZo?=
 =?us-ascii?Q?wx47RD7TO+8Q9Ssf7IhzMQf4rSvRUb96XDvpdGPNbTNueiCT1DwdvTi7+EDN?=
 =?us-ascii?Q?HWvSw5HWXj64UdM3bungFVukBWGKn9DASNuDtQOP98fQSv3mGmxh/pIqNoyL?=
 =?us-ascii?Q?UedK4tRvj1OsI/yPdoRLDBYePTH6VufH3HyRfgUaVQ7XJeh+1h5CratTBJEd?=
 =?us-ascii?Q?B0zESn0B1ATIKBTurfGNM1v1DEjE7e83xG06LbVhc21PnIOKptITdzfv9phb?=
 =?us-ascii?Q?d2ogKpq6bwZev/l+Z9uVjCDWdM6o/z4g14fSfWxNhZVjVuDnmZgg/PvJmj5F?=
 =?us-ascii?Q?k0fihLnCAfj95n1Br8Df3Tqm3Ss/HNi5fW2pnvuhijw+SLZb6w3dd+rz491Z?=
 =?us-ascii?Q?AwEBro75gOpOPalEaT7+kqeZeDp92vC7r1bEMo1RY/FP/fOc/k43XV0ttrlA?=
 =?us-ascii?Q?GdQrZJl5JxwxuSEtSSAF6Q8Uz3wblb3oxp50yv+iIKjA/faYvYttvexrl7iP?=
 =?us-ascii?Q?EZmz4BROwjgKkartWziIU5F89HPu7uW8MlqllWilPsQWbNhd7QNJm6RuCb37?=
 =?us-ascii?Q?tPAOru9brWkDxlKRL7pz+is5jq9rvF26z72Tr/FX19hUGByE0TNfAiN3YFrs?=
 =?us-ascii?Q?Dhy6/tJzA9Wqli/K9JTxenRUrCCGBB7JtQ2HejYahRezzpt8bPGhrbb/u312?=
 =?us-ascii?Q?g/JbNw6IiCeXlpMMCGYrQIotR4iokZ2MYA49P7ERURA9Y8bLQ9YB1ORsnYP5?=
 =?us-ascii?Q?/b1FgtnCeUcpdRJ4+gobGLH9LNGyxyyZAATb5FHkSaZDruwTIpqaSJWUsGpJ?=
 =?us-ascii?Q?enmtVAz3SU4BzuplZwTs75bVYp+ptP4t0BJPaGe8YL19mMxKQkNaPmiAYYsd?=
 =?us-ascii?Q?9nte4a3oO4FnB2x2L8DL23qdp+xcfmp2rO2ajIy+6Wl912jt1m2/+FZrygGA?=
 =?us-ascii?Q?NB6WzVzP6xXO0X5394qILGcUydq5mTX8e3qCQdCAsxn+jNPsCeFbr/DtoeiQ?=
 =?us-ascii?Q?iBzGddfDCupL8TeqtdPeCIDm0sFXIltTXY+hIVnXyG4bom1Pl7qwsKMKhGFL?=
 =?us-ascii?Q?T9kmIJ0Ta09nshoCb6jFqQo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vAUnHj4f3yp9yDWnqozepwokTrDFsTJJxnbiX0IPHecaw28uHyJFcOGFN8AA?=
 =?us-ascii?Q?t6gp2i28IGiy/Q4t3XCWHbdr4myP+asEllr+wVMSmzUCc7l/lei6P64rTGWL?=
 =?us-ascii?Q?JOC53sGvXzgzX/az0ncXU65xh0hgKP09gY25CCas4hsmnGX57nuHxcB1YuAf?=
 =?us-ascii?Q?Eda1EI4rriEZ1L/t7xq/HaCUYFLXlhU9QFujpCfgCKypE9F0O+k4M1pAN2Jy?=
 =?us-ascii?Q?ECyE5zJVJTBeQN38j2At6omFFhSKhUYqzI3Q8SHCvGi/UvUS7r0AjJP+NiVS?=
 =?us-ascii?Q?jZVUgMmYMHDkI98QDH05b9FRo6Plz//iTHHrXt1c0Y7OfSvLR5zOqdJanIKh?=
 =?us-ascii?Q?9pH81D3tlGQt0bmT71cUWMVd+b3kgBowlqEtLKij58NKJ/9RwHmCOtgxE0kW?=
 =?us-ascii?Q?evbMpCe2E052WbEFC5KTdAk+iKWcsIACIhFJOEPx+6oFP5tuvYVGwHfxvAva?=
 =?us-ascii?Q?xNF5qUNYXlXaWBRqpSL2XjZS0bsp8Tf4Q2d/50jNYFuIrG/5fKeU4xdpLMZD?=
 =?us-ascii?Q?V7Cekx/ymrdAp8QCWi2sootILxEXIeenm5gRA2NL5rbzDU8jvLHCyNVJpKFs?=
 =?us-ascii?Q?KJInV2g0qUnubiMIxudaMp//41zh7Hk8cm2ZFrvO5X6IMc51yNwpx6DlfADU?=
 =?us-ascii?Q?nVH4BNBoTCz5pTNNMmMofzB5Qbd0QlhdLcIXPjIXDRYPZ8iD8GA0hDQDGGZX?=
 =?us-ascii?Q?OsPGsIMfs4rPMGuQWkIbMg935v1TQ9n5yn4ip23j4E7M4ftF/pNpi+N0LKfb?=
 =?us-ascii?Q?wVpntuKJYd76D/7+AwRVebdqlUN5y7mg02Xeok0/9PaxDs3B0FQcmjmbT4Cc?=
 =?us-ascii?Q?NHnU+R5bLkNKBoLbXihbk/qWCH+oW9+ezMv9cQWNyTKiXu2uIbWFJ/2K8HdA?=
 =?us-ascii?Q?Mb4co1Xw+1DlJCPMzKNbn0o7gSH6xgY4AgOeNq9P45UBn/HK2uSfBBejdBzG?=
 =?us-ascii?Q?aqTba9n64ANMegxpB2zk1lnKTvM8GZ9XWaG+5n1haN+qTlZxTKRj88R9P0HF?=
 =?us-ascii?Q?giSBLLzgSqMz+JpEwEIAGrGqrGlnM1+hpOWcZdwI+yFKtgpzdbpz642k18n5?=
 =?us-ascii?Q?qY4rAjAyozBGL8U3g1XsXDPNNlGruP1To3YwFe+hvFRPxxUSXP0vfzpLDvd7?=
 =?us-ascii?Q?TMLNqwNb4Mo9P1pYTRFtHCHAadMEXoF+kYPkj3Jdf1rKw3QVDpy96bLiGxif?=
 =?us-ascii?Q?RRr1vTvnL+KZ7yuVU9uNIcNddpR5B6MeveFmoTdb8Idf+QcN6qntXt3ajHLK?=
 =?us-ascii?Q?Ds9GnIcc1ld3v5XSNgZ5wUadbTudmS1aO21xN0zeW6Nx3Nxa64mW9Jdw3uhJ?=
 =?us-ascii?Q?JbTSvgPwRYvHlDUVkwR3WPjyHBnuWpURRg4jdq1PdQcvjfYN5bLEymvhHXqp?=
 =?us-ascii?Q?I9XDWjtaxniBdHoyrlmA6JdGhRQ9Vufz0bind0ZLZeBnnIN3wdbIrqwA4yoj?=
 =?us-ascii?Q?aymwGqhsO+5DWrDP3QqSIRKwEo3qmmsMzWcNpblPgNH4TKeoWhyYXWOg1Ynt?=
 =?us-ascii?Q?nKJeHTOpe0zXznpkgbfVZ80ydWiAGJ7S6kgk3DQDwXp4Y8JNL2wUh6CIc49d?=
 =?us-ascii?Q?eQSr1ovDr3s3++DpJHeJXm09fsqCSM9Amwd9cM39UC/JE/B18eRhxw1fNwHe?=
 =?us-ascii?Q?a7Zu1dpE9JOYaPRBvN/Mcr8bm8rZKedZxozxcusBVLY3XGQlJXRGY3zgNdoR?=
 =?us-ascii?Q?GeekMnjOK6lz3+tZoyZuK98ktX/dTnQtA1WwdESMaCnGxRpnvsdCuvpdL5x/?=
 =?us-ascii?Q?38kzELNfuw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5dddbf-fe99-4ef9-aa13-08de67a011f0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 05:57:14.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1IB/wlzhUUIExJ9+vBmzgttnuZXCk4ZFq+v2+QGDYXUsY2BfhOTefdAhcgPzCQUcxM81Q2MsTJ7u+hCnhXWL2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8994

Add pcie0 and pcie0-ep supports.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 89 ++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index d2f31c8caf6eb..0b9f4ea7859d6 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -66,6 +66,13 @@ sai4_mclk: clock-sai4-mclk1 {
 		clock-output-names = "sai4_mclk";
 	};
 
+	clk_sys100m: clock-sys100m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "clk_sys100m";
+	};
+
 	firmware {
 		scmi {
 			compatible = "arm,scmi";
@@ -1223,6 +1230,88 @@ wdog3: watchdog@49220000 {
 			};
 		};
 
+		hsio_blk_ctl: syscon@4c0100c0 {
+			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
+			reg = <0x0 0x4c0100c0 0x0 0x1>;
+			#clock-cells = <1>;
+			clocks = <&clk_sys100m>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+		};
+
+		pcie0: pcie@4c300000 {
+			compatible = "fsl,imx95-pcie";
+			reg = <0 0x4c300000 0 0x10000>,
+			      <0 0x60100000 0 0xfe00000>,
+			      <0 0x4c360000 0 0x10000>,
+			      <0 0x4c340000 0 0x4000>;
+			reg-names = "dbi", "config", "atu", "app";
+			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
+				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x80000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			msi-map = <0x0 &its 0x10 0x1>,
+				  <0x100 &its 0x11 0x7>;
+			msi-map-mask = <0x1ff>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			num-viewport = <8>;
+			interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "pme", "intr";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+				 <&hsio_blk_ctl 0>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
+			assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					 <&scmi_clk IMX94_CLK_HSIOPLL>,
+					 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			fsl,max-link-speed = <3>;
+			status = "disabled";
+		};
+
+		pcie0_ep: pcie-ep@4c300000 {
+			compatible = "fsl,imx95-pcie-ep";
+			reg = <0 0x4c300000 0 0x10000>,
+			      <0 0x4c360000 0 0x1000>,
+			      <0 0x4c320000 0 0x1000>,
+			      <0 0x4c340000 0 0x4000>,
+			      <0 0x4c370000 0 0x10000>,
+			      <0x9 0 1 0>;
+			reg-names = "dbi","atu", "dbi2", "app", "dma", "addr_space";
+			num-lanes = <1>;
+			interrupts = <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma";
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+			assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					 <&scmi_clk IMX94_CLK_HSIOPLL>,
+					 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			msi-map = <0x0 &its 0x10 0x1>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			status = "disabled";
+		};
+
 		netc_blk_ctrl: system-controller@4ceb0000 {
 			compatible = "nxp,imx94-netc-blk-ctrl";
 			reg = <0x0 0x4ceb0000 0x0 0x10000>,
-- 
2.37.1

