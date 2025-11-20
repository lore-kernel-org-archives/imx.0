Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011045.outbound.protection.outlook.com [52.101.65.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19081E5B95
	for <imx@lists.linux.dev>; Thu, 20 Nov 2025 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675018; cv=fail; b=karvXOiCUjEQ7lw+gT0p8FboHUE0sFiPlY5/3B95CKWLxL9Ja06okbk1xZE5nIfigJ5bgmh3uJ1cmmTg7/q8wo2PRsW+oyZHaDNgf1RxzWxF34wa+XvnSwyqWuufc8/792MS6mnUZx42vKllBMRA+x46K90dOdTN7Nkt0xRM15U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675018; c=relaxed/simple;
	bh=5IS1t5pk2A/2HpKHIjGnUOon/SSdivpIUHOh9dZBjos=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=quAlBhyqLY2K2lJhOrsR2R1xKGwXwhunjLkrvIDnufq/NMnISLX6pYcb2DnJ9cjvp3eI2Uidys7e6VYDYhLe5AC+zVhVwSHzhmoejIwqzqOfpTsFYng3u66uE6Co3a1lx8X4G2NF//wjKE81FvnQl08k2k15yt35XNdfdGfk7H4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dF6PFKne; arc=fail smtp.client-ip=52.101.65.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dF6PFKne"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPeWOZmTvN1MjxkfuxmTcDIYXkNxahJHE7cm4zslVwsjHuOeknqrZ7QRKBCZ19eXG1m0mR9l4fmFWFGF/CSQnmmPZGRQb9JUz//WZ5NHwhojoLYiHkNP3xGOv9QP+gY4XPATMq03I7P4S0VCAUzKGf2Go9HpBRTDQDwPtYgWtAwtxVpJcDKjXVq+MfIJtaMjLjxzXr0lW0JJwcPa0VT3cWVHJqW5wMw5cWuQ66SqF2EtbJKfdPl8pfAQo7IZe8Q1Rr6izSeFgFhu6AEvXS6VHHwHUKcz1sT6D/XS8iuOntq+eyZUkPqUErmC+WVG+qgLKHomzytngs11ecMRYWJPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/raptrK/wR9e6ikZ0UGxS1gIJi9T4usIWuECY9aqDxg=;
 b=xpThdIacVshIyr1qUSIzJn6FNlxQYHUVYV3E7AsbOt9/k8yB3fbxB5iUbEtVjfrpJbRZ5qXG3f6ek3PSROTz5RrbDGLU1hV2k/dO2g7wWt9JLUZYB4FyN54cErjSi713itR5uFvcqmvuXaJGhdZ/7pz8clGgh4xm0g6njMc1IRFPr3x0AwlsK2OqUlQ0c0a/HeG1Q54HWh95fccmZYIexn+S/ogTdnspXj2sc9AKMsUOGoJ2Ut8j7I4QF+x7txZKKVZelOrpsrd13+akFwJBizj43kt5FdRRqLB88Qzdwm5DPr8F961f9BIiOzAW9g+/8XIkWBmjRd95hwLiTO5lDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/raptrK/wR9e6ikZ0UGxS1gIJi9T4usIWuECY9aqDxg=;
 b=dF6PFKnezG3aSANBg49sb++Ogg+8n7z0LgITuRG0VFzVTxaeklrPVcrKCecQGs1iQ5BceRRyivh3iuH6u3lW4ZqHlpb03Ndkjc8JBx/c82KTbrma1RdtCLV5IMbDbDqk7wZOTN4uAayWBW9LUjOu8xLDhB6kQ4trLab7VN8IwRYv+kWn1Ugu3f2dIHECsISq9Qvbc9niiKy2P8kECGvXNzJKEPkYwR3X3x1Qv7SFtAjcup+QSMAuxjXHsp6jXleUNdMrm9xHVuMzYjwjpGQbRB0fJ+CSj1DTCmKELwALjGOOK9OXdJfqHSdiUAC0PXUyugV1BzYChp+W5H+dSRqRQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DBBPR04MB7721.eurprd04.prod.outlook.com (2603:10a6:10:1f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 21:43:33 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 21:43:33 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux@ew.tq-group.com (open list:TQ SYSTEMS BOARD & DRIVER SUPPORT),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] arm64: dts: mba8xx: replace 0 with IMX_LPCG_CLK_0 for lpcg indices
Date: Thu, 20 Nov 2025 16:43:18 -0500
Message-Id: <20251120214318.347483-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DBBPR04MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a10aaad-8bbc-460e-6338-08de287dda75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hCoXAnh3nYiTlE+pXVnnOUnMy6Wi4A+5s5m8r3Tz4U2RZGRzNEuUp6MAnvqw?=
 =?us-ascii?Q?bmv2nz9aa+0XpO+OOwj1fUE/2V4o/F5MAtR0goodT8k4R7YRSyN4sfFgDe4b?=
 =?us-ascii?Q?1yec8qYEd93w+iZFLFtBC9dYCfalOeMwlpjt5u1KpIS/AO/dpms4y5Q/G7Rl?=
 =?us-ascii?Q?913G71XfEhSqKPwCLKdlQkq9qLhp3kYQBSi1SM1DFA4ZWKlCwlNyq/KUvWFS?=
 =?us-ascii?Q?bA7PvKKcaByMJZHFqEmA3gqvxuci3VVWAMMIRjUmcAUs3e0HuZ7jj3uWA1Ls?=
 =?us-ascii?Q?spmMpL0ex2CFVSRoCNC1WyJxy/s9MRCDUEAQgx5/xoohxuhIaS5DulUVIrnd?=
 =?us-ascii?Q?E3ITP6QDgXss4ppmQ81OPE390Sno/JUo+vZqGbLoYpkZs6W0j8IfUGa2lUja?=
 =?us-ascii?Q?iJCcZz4qC71aF63K4MglDTXpjm2H4GwzGobw0Z5GbeYMixRGkSPU4Nsmvu78?=
 =?us-ascii?Q?G5USfM2l1EFnw8PEouxq6h3EOoi0z9ouq2wCu7/ZeeY8ycboyG5UxcRaTaGp?=
 =?us-ascii?Q?Kh8uR2467SesGvKYEKO/Fc4zT2CKmSk6v2uZCHJJ31aFAQEFLM7kzo0s0vmt?=
 =?us-ascii?Q?9xmTmIXvTd1M7EboKgk/urlBQi/0/ONkqA76xJkz1iiq1lr55g7KNHqan/iZ?=
 =?us-ascii?Q?snCYtFEyUS/j+SgKH7EZyZNeNRLHcQgSuhffedI4BeLMEY3fZ8TaMj9X9WGE?=
 =?us-ascii?Q?HaORDWfSVyPFO6I/ZtG7RTbKFq4wyOFWnwwwg0xBrFYQVdpwtoaTLJrHlT9H?=
 =?us-ascii?Q?KQVE/UxKYkMpmH44lr6fhefcbTQh+vEqbIWyzvzxOQe1dmZOjbRuuD0dIKdY?=
 =?us-ascii?Q?+NkWEIoWLmrDEhJZlwm84KrytAYwxYkl/eFoqo+wudkdL0Lj8z/cgYFrhsQO?=
 =?us-ascii?Q?bNy7Y62A1YzbV0mI/VgEVU5nvuNS2mDPH1RJKm+c4PYHjKH+XMwEWcdF7kqM?=
 =?us-ascii?Q?kd82Bpr92RGzXXacYJVdMTeRHJIgbNpA+n0TknV+tc1jSl6PD/tENsAa72wV?=
 =?us-ascii?Q?PHQFVxtGwwSiB3GH1/+usi09WSsLnfvddQzYmLxQCOk9QeOFhmlHsPxT2MTC?=
 =?us-ascii?Q?tZ8HrR4G6rNgJlOOUNG85CmnfnUUbgSUNcXVBj+l3B3rhjymvezhFIipcqEl?=
 =?us-ascii?Q?0fO7xnbhGE9PQ5qewGsvrwske3qQMTvp6XHrnRvpBCMJ/jWIufR++8d3MV6X?=
 =?us-ascii?Q?HYlQHGV8SMom2QkHpmh+jGAxxpqPqBzc5J43+fPaqiahMn7U9LhpmU3pCEku?=
 =?us-ascii?Q?+xzmqRlsDQZcmpL4ak1fjNf/T1w+AkZch8mgjPm0SkfYsLAIdsM0/v5RIGFt?=
 =?us-ascii?Q?MqHA6QjNSDUNtC7Bt4NdezO4ya/Ab4TOyzOEC3hiu74PmV5ZncK5VQytN159?=
 =?us-ascii?Q?SiMuCFcHi0KNwr5CdSzMJWzQaX7ozew0k48lp+MEa9TFWgNSGzAP8flXeW0A?=
 =?us-ascii?Q?28gPIdK8R1LOJM/hXJluQiNMev0+/fr9oUaHMFnBvHhA6fToPhJVwbU/qFl0?=
 =?us-ascii?Q?72knp2PvUJ3SnE/5qCybM8Ltt4uZsyw9FEkqFvTZcOMTmqNnA4DZ+y7AsQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5CT5zn54pJOUO5BaEwmjSTY8rPK554bUGMDhoJQHKSClTuZJl5JSN2w2vO5R?=
 =?us-ascii?Q?v1b5+GRyYxmkstT/rE03GrnY1N3gnWEMlZUNNjunTkIM1F+WHWgdleYV2D8X?=
 =?us-ascii?Q?cnCtRuy/LkSu2hmiDEErwriE4F/BU72T3VXwHARqoCzU7ahxLq9Fv0C7pAGB?=
 =?us-ascii?Q?HVkWydFNSHeWdYVvHea4kZe2sw08laG74EPO6iHfOF2rGNMKjrGdnSdkRZ5s?=
 =?us-ascii?Q?tqJ3F5bWdQ3vPnZCZ9R0L92qhXxLisoUi/VKt6eyeHAPaeuzHGj2oVs5OQuK?=
 =?us-ascii?Q?4tk30dovHgJyWa+fJkC5cz3TIbJQEIG8BxCCTFwQqqrhYAgPt/YNgAE/8RW+?=
 =?us-ascii?Q?XCFOnaIhdnVOzr1o4066JTsPD+5bFwg31hxdsw43fealo7JRpJmukYaAoID4?=
 =?us-ascii?Q?ejiu5gDcspEGeiYcmIChjUIvVJSpevcso8FtXtAv/qa7kvLRVff8ZStUnNnd?=
 =?us-ascii?Q?AeeApa3mR03oDbfEn/b2FCuqw0QKEuNdq0UdhDYhdADytk/IybgHcgl8bgXR?=
 =?us-ascii?Q?NNixhuY99Icj+cmLNYbVWfjY3DuvptRzhlFkNsd83UAvmLqd58YQ/tU0hygQ?=
 =?us-ascii?Q?118h3GY59rOKpKjN2NykT25Zm1+sGeHqisTS6NOrOhAzR+xEpAw5jo8tgJv5?=
 =?us-ascii?Q?5wFnGd+4hBbY1bAYzQwVE559sUXuPQgK2pbwjwLV+qvue/+uVW2kdb7y3w2d?=
 =?us-ascii?Q?JRsfOcj3duTLojy/1nVj+iPV4SVcNUz3TRoIO4j+OXYM3PeivTNWWYKX3zCG?=
 =?us-ascii?Q?p14nGWMKiLFaXoVYHvh0lJU0kB/aRRDJv5PuV1ZGcnP7UA8Eaou/cg/vF0iK?=
 =?us-ascii?Q?Kp8yraHdNDbzpb7TOSYQntw9bX5pdsGF9jMN2PriEcnha97T2FJmDVx5m03a?=
 =?us-ascii?Q?gAEAzmAFpvdNQoLRjhRuTK06vXXX4//l0dRGpbL3htDfOafTNyrZJyV36oQD?=
 =?us-ascii?Q?BlsMZiifGdofqAosOFQLo8DkxIhgCPB4OT68HdWdJIlcoHmzbho1PwQH3GFY?=
 =?us-ascii?Q?+iyudJyWjy21jhu1o3kUg2PwxUv9Qv3a5K0nx4KCnSLRxVlaWjeRdB4OwR5q?=
 =?us-ascii?Q?ef5rmA19wqoQAgGXM7IuLyYKUFwM4VSApT0UA5GVM3CVkcTgjHDz2f00EUmP?=
 =?us-ascii?Q?Vbmnc7km9gLorP+d8Qh75y2vtyvfynCQxjqx6zYJ+v/P30Wxu+r+mnJDF3oe?=
 =?us-ascii?Q?jIFjMXwNeb1FJiImXQ8t8GuJPw0692x4jkv7vuu7HnI+HH0sz/vdnPIzKsYM?=
 =?us-ascii?Q?OTcSf2rOJYGfm+2Pv/0Y7C1HsRgwM6xiMCitcWi0+bRUibftOXTwAOndGK5r?=
 =?us-ascii?Q?hcAv5o48tGC4Yo06/itxtDluZ2tMxAzxLsrigi4UcIKTmGW98ZOYKEX8MRcF?=
 =?us-ascii?Q?n/d5rFjjTxA2gQr/Hx3FXxU+Cb3jz80w6vXeegpcsBzt7hGriNXZ+osdHPaE?=
 =?us-ascii?Q?ImaGFGyVxuL2LlSL4nkZssk6TogIn5+B3z4D9dMC0FCwrRyEz6Hafa8HXAnC?=
 =?us-ascii?Q?eJz6uM43IS0DtR9KA1p0KXfzh6uNZBS8C0jVd8OoVvumYhVOKt2cS+J4mOHH?=
 =?us-ascii?Q?VHSPyYRaQMyFHL0DOUc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a10aaad-8bbc-460e-6338-08de287dda75
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 21:43:33.7855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yi+6zgIxrXU92Q9CoqJKUIR/gL0gwUgfLgG9URiLIqLE/Hi0Cx5dKwVgkEBz2lvBhcfRTxARNlqjQh1TxuvwYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7721

Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
numerical value is identical, the LPCG input is defined as
IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
consistency with the LPCG clock naming convention.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/mba8xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
index c4b5663949ade..78f5dfdc5cc8a 100644
--- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
@@ -225,7 +225,7 @@ &i2c1 {
 	tlv320aic3x04: audio-codec@18 {
 		compatible = "ti,tlv320aic32x4";
 		reg = <0x18>;
-		clocks = <&mclkout0_lpcg 0>;
+		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "mclk";
 		iov-supply = <&reg_1v8>;
 		ldoin-supply = <&reg_3v3>;
@@ -336,7 +336,7 @@ &sai1 {
 	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
 			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
 			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
-			  <&sai1_lpcg 0>;
+			  <&sai1_lpcg IMX_LPCG_CLK_0>;
 	assigned-clock-rates = <786432000>, <49152000>, <12288000>, <49152000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai1>;
-- 
2.34.1

