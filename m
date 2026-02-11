Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013012.outbound.protection.outlook.com [52.101.83.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4F934575A
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 22:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770848394; cv=fail; b=cvZaU7z6OALqiJxuh2YIp15qVU0rJIRPtFRQan/bu9+lw3BN66WwapVNABJS7ARo+rD6P33Rz+v0OQOUVHcg1BQPk/Q6a09E/iq4RjSvl86Uls5yzKnfOqs8911Zb1J9y9zGvPoBoB8+zXLqGuIwq9/plkygTIoWNJgU/TGfMb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770848394; c=relaxed/simple;
	bh=SlHfh+IP1/K7gSMH6absdFig3r/z1fy/PBBZzdI/wNs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rYyE20aod+gVnaYgOnpOmLytKTEgrj/rrfCdNup+XSDAZwEa+AoNcB+Pm9MYZzW7U7Ppbz6wUGTqIild2yrIdynnyL16F6HxDUAazVqmuPIy28EH5ku4rvJ8uKE7h1ZU53xT0rWmt2ZgGJVR/yFZQP2Xly7GkIildck9/5XsSuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P1ZXJMf9; arc=fail smtp.client-ip=52.101.83.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P1ZXJMf9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWEeUSXioDe9dLISQOVXnYHPCwDQQK6qSjPhVFGZ+KaSTOvCRza8txmVpn19nCXbHb6bRNunJq+BJMPHUCphfVWY9/PoTH0JV8kBzBkpKzXWIYW6I7rA3icHe+xHQFtGrN0u9UXnaKEDrIixKkl9aW7H3BmEobIwzWOKgDO835L9VHizNHW7SMLKTPU88JrGAkY02mU8It9Nv+Vp7/+APvfj3dN87IzUULDKAiiFfpqphGjp+FQtF2IVfAIC4ifVPiFx7/l8PUy26pBBxhiRWJHa6Z9QVk6yy11iJIj1blRl8Dy/ZncJDl8gtrHSL29+hrLj6hvqqL6YswPfeVoWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gHrbgW3wpLWpFZeLoArIBhl9tkHR0sbTQdEl2iAww0=;
 b=RUPhJTL6kees8uiRPy01CrG6DJ6OnUmrP4h0JAvzV3QRGvZuB5lPtCAOUoZklvGh2qczwNdmpeiuSjb36X0Wc8DhIM26h/q5oGSYuH/V92WD1hfm3W+mOC9x2NwQTegBV8mV1a99qjCLDUQ4xIwbnPGVY90nasWvrEMO+cnakq4raPubQ5N4M3gh2VL857i5edsxG4qiuYxGqL9Qz+HazAlBE7o4ODwc6YR0zP/ipD95/S9jLWHc8DMkKZO3/9APJBakdc7cLhhtIdFkC05EjNzKN/AWtIG0hpVi58TC6XTb7ns5jexOgnFTdzYoU/D6dv+vMVUF40VC/2s7TBIJAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gHrbgW3wpLWpFZeLoArIBhl9tkHR0sbTQdEl2iAww0=;
 b=P1ZXJMf9TIRcgej8N/gC22r69mW0pY8x+BWGLM7FvKZIjMsZ7hgdQmss7WcarUryQT4GwpCd5zQPBm3BYb0xfMkVnKgy/nfEyHqg8ptFb53YNtDnwjxdSWcd6tBLFNw561HSNIXnVn03w0Fn6c2KGjggdKsczghs5zbVlwb5E2ewZCZG7U7ahqjv1jegGJQFt3V4+fD7f/1E2CWE95BdAJuInHpcX54CoUBC6iN3R4eT9oIf3NUhMAttV/ka+hAu0rHqgzS2vOQ0Syn5KphMXUylTwMq0wijhv0vN9oTj49XbIwu9D8HIkAOixFJxQGbHXnxLExwF8StQNawnsyPEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8193.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 22:19:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 22:19:49 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: soc: imx: add fsl,aipi-bus and fsl,emi-bus
Date: Wed, 11 Feb 2026 17:19:35 -0500
Message-ID: <20260211221937.3752048-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: e64116b5-832c-42bb-3690-08de69bbab27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SMt/cYbAVGQ1u1Cfi0wO/UDn8PQ1q0uic25Qy0SPvkp5JCTlOSvK9XiERWwd?=
 =?us-ascii?Q?k9pQJrxqJhu4noOEmVtf+eMfXu5F3V5HO9XdOvAB0JPNXXIhC3XDfwqxDTYB?=
 =?us-ascii?Q?sGEuVTjbaZjU5feclnLHPIgIuzelTDrQ6+jhuIVgi/9KieB7hSGEIiFCKrkg?=
 =?us-ascii?Q?9KtFwTskyY0j2R7N1lwprMrbhSDZbu2iIsTQLJ/h1EYJZT+XnMvet6e6sHrc?=
 =?us-ascii?Q?qYi/CNd8A6zHQSZq7gJlEaWapN6SPcuf8IsOygpUr4jPg35zKGZLSt50O/ur?=
 =?us-ascii?Q?LH1kLGdfWDXrrj0NWlt589YBJefZfGKproCB4CrmGe40KfWephJl7iNKxLpn?=
 =?us-ascii?Q?O0ozzR0y+dXtQFk7LYsP50IPeG73SV4DItn3EeqQKtlJryuOp7LCLTtNcCrP?=
 =?us-ascii?Q?zj4xC3NDE84J92I6uXOIH2xkTvaKfNMrE4wOnXf0NY9gDbWhzyx3MMfhKedk?=
 =?us-ascii?Q?xmQ+Cg150ImrAloXNLh4K7UYas7hOxmcb6O5EvIrruWlVRb4YkNfmsMzlLGH?=
 =?us-ascii?Q?Kq/FjGOvTtjCCtZzcbCczH0k/rd04LmiYF0BfrS7teenMPRQXwO5khHhVTDk?=
 =?us-ascii?Q?zzDSAUAoHGqLeJcsA4pGm0Zhxiv0ygMTPGtV4ZVlVklNXwHnL9MSszscmAIW?=
 =?us-ascii?Q?HGKl5bDGr8vy7Da8E2osIIFJryry2b6/oXlX9ulgZWrzpvYiGgVoRqIobQOr?=
 =?us-ascii?Q?34qP7s3fmCixJZqG+D+iwuJ9ZpPUKv9TA3uTlyVjsJY21gt6jlttyqnOFm8V?=
 =?us-ascii?Q?YGT/m3Rj1djFOA0Ayv5/ky3ZGWLwgQZQBVYRysD3nQDk4JaMMelZ8I/+A8cY?=
 =?us-ascii?Q?j95gS7jF0iYcdLwHLqW2GnlnYYncc745+1K7plZ2ufYTHlqKyEVkd7xNXdwE?=
 =?us-ascii?Q?mfkUfaVNh2q2jKja7pb8Rtgs7Ymt2VBM7NWXThZZDlKUy5dwb6tAhAW3Sk82?=
 =?us-ascii?Q?E0ZE4FYR/ijAukl7psBldSA8ukGPyZCDvxqEq8u0tf7WiekGqnDDQnpfztw/?=
 =?us-ascii?Q?xMBDXJEqtGUT5pqf7EfoF/Lrm6xUxCLPjhNtkA6qCYyh+3WHaW86trlaVyD6?=
 =?us-ascii?Q?TUxvsHsF8+1ND0wITzZcQCZntTC+AWDUePVcQm8t7Crx1vz6xcb/7dcvibPU?=
 =?us-ascii?Q?EhaEjxca0vdc5EUp811h9RPOtgnfJHvuFnB8G00kHUhmwYgLE5FfXOtuJttq?=
 =?us-ascii?Q?YNfZo2WGYi+WDsBA6c3upHUSZbhW4A4XRA5sJzRuaQocNlAQxDKuNkwq13bK?=
 =?us-ascii?Q?yuS4LOqa7aWPXkWrPWBSPFIz++jmDeHdFcXLRTzzq/f+3s6GhtSPBTYjfwW6?=
 =?us-ascii?Q?rmzzK+yV1m5aP25u5mEt03Tdw6XxuPfK+TcDFzD501LBg5iLNI/IdBlrGc9l?=
 =?us-ascii?Q?Mu45iJMuyS5cIAD3FjzbjYhdYD7d97qgsFZm6Z7o/p2KAGJRn01FitbeBcAM?=
 =?us-ascii?Q?NhVomSoEWHSy/4Wd7vUPsDCmTM5bIimhHklSPqP8SxaHpqpGSiZ747BE+uja?=
 =?us-ascii?Q?iS9uekArxFiFeHvc9SnPMwka0Mboq4FQchxF5DI3dWYTsRR7TmOQrg9ztHG+?=
 =?us-ascii?Q?tq5qV7NvQfWLcXN6kUdr3dQqhj2E+Uez5A3h7A+yVU6fHdA/x/ZowcCvwKNr?=
 =?us-ascii?Q?9b8ija1y+Ln+Qqk1G6WTrAk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vCWxL0Ghhi6YcGjwkgVXYsrym2wa4ogr4AqlammiIAijBS3r0R+iWA0K9cYk?=
 =?us-ascii?Q?J1/aLMCp5EZYmpM6dvEyFa45DPhcMo1Mj+EwV74Tu5Vyq3XaCHtXxcWKP2Wm?=
 =?us-ascii?Q?BSKoNlc+uf9NL2xXyKNAfNCme8ubc8mmWmQWy/+B/YdISpYJvsVG/LQyQXWe?=
 =?us-ascii?Q?OGQsnt7KWQT8BitiyNf16zZJYlIrZdsU6TeaacrXziuqA2Y9g4IAw+uYB7ej?=
 =?us-ascii?Q?Lv/btGBeE/aZ0XYFCFLn5Lim4oe9yRM31sCQyjOo2WfTCDbYV4yaTth9VNMC?=
 =?us-ascii?Q?GGeTQ4LchyqXBrhQx/a7oAfcjZMlLXlq+HEQvv5LvMejxBW79yiA6Tk0AN95?=
 =?us-ascii?Q?FGLJ9fUbF9p5BASXHklq0HnfUM3SOPAyi5aAuG7wLsQBbq47GKvaqjtG5Q0d?=
 =?us-ascii?Q?fqgcQQCDOim2phg9W/q7kqLlFxcyFKTASbdr2UZ/Ur7FazdaRDZiiPcmOMSZ?=
 =?us-ascii?Q?xuyrssHg54yNcf5aNgrZdH2V7HobP8L9Wt5LVmGouDQa/npQcJA4740rlIsE?=
 =?us-ascii?Q?JOivIqnNNGBvvjYTKod/rvkqkH/Z1yoLe6filZWa/WfYNeRnQ8XMGQZDCTNg?=
 =?us-ascii?Q?h59a1T9PoW2Ed7jtKHqXj5pkKRQQAvO3nnsINTWOEION1XwELbTqxaQObxTM?=
 =?us-ascii?Q?4vJjEsbevtK94tTRQzzp4iGWbSMnduOTtdW1JG+HjDgubMaVtTY4Uq0uABbq?=
 =?us-ascii?Q?sXzKJ51QgmNf+zW+zFRAFX6xqGLGsEmpETFBsJIVe9XeyLOrDrHTzXj8aFRh?=
 =?us-ascii?Q?pwPQtBTnb9UFs8qG3NF9xO5p5JNtmZe+X3D5XSXxCc1ybNsey60PWAewtg2w?=
 =?us-ascii?Q?TBD1SMpin5FaC8oNX/mQsaaty73haNXn5LwznKQFEG2/GdgV6yBEZtMCytaE?=
 =?us-ascii?Q?zsySGDEK2UWpoXlzFojsWQAXWcgsoh5m8z4J16CySMIhOrcOeF7Vvw1tQR1N?=
 =?us-ascii?Q?VDA0YcT2my9Hx2YFbYJCVfYi3yngrswsSKKT9uqSVt+uaoOLwXiS1VNflQB8?=
 =?us-ascii?Q?Er7XH8zz1zgr1Pv2eerKNjZcsKYOifMAPzvhFtapkdChZTr/+hRI6hoPdgLv?=
 =?us-ascii?Q?tpmkw5Jogi4ilJpYvAQnlpRhI8WAj6auX6D3DO18tTPHQVzdX3uxUNe1xhhp?=
 =?us-ascii?Q?kwp1uLiTf/rM3LJiOeiSgpDmHwG74kwLIhpMKr4Y1ely9+n+NWheTI2srlx4?=
 =?us-ascii?Q?AqxEk80nXwCgZeXKj1HnoOvDowPe/g7MQGX0U6Uxm2XPcgQnWlJ14FeVSKxT?=
 =?us-ascii?Q?ZXD6HmFcgl5ceqgczqRZcfkOWnZbkoMeRr7gZU9jZzRYl4Xpz8KikDG+QL+b?=
 =?us-ascii?Q?DNlEUtpUokvZCURtJa+g6XZZf+ceYD/CqzgbuzrTVIlJK8Nru2VRkTKD8xBO?=
 =?us-ascii?Q?iE8cT4g4MctkfKGxDfyAMq+W8JDpL/P7r1hLD0qZ18bfo/M+gYaAL/O5EThC?=
 =?us-ascii?Q?WnaWQPcpZTYGCaNMqMz1iAocj4gRWg+ieYl48DOINZ1yD9kDAAkDx4lgFdeL?=
 =?us-ascii?Q?vIlsoiL0lYPBEKHqf5r7/+513KO3IWeSjvVUb6wzLf1pgGY36XNrd4s8reOW?=
 =?us-ascii?Q?VCuosvRMosP/MWJGXg1TB/fEd5MhifVX7ZZQYLt1eXi0dNYk4G7Dst9YVbV0?=
 =?us-ascii?Q?tRj5mJ3M4GpG2sR2JE79tDTLnTDBd3vIRQW1FrF6D5tFvd4qe6YV7mDOwqZe?=
 =?us-ascii?Q?DaNQ+qJiaw3/XTQFQB/upWzpwaYvo2gXVGrQ/RhANCIuSBSX2p/V40+ExQlK?=
 =?us-ascii?Q?Vyr9k+eA4w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e64116b5-832c-42bb-3690-08de69bbab27
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 22:19:48.7436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aONUDr7Gxk3xwJY6Ca1cQ8OZ21IVdHRyeycGj/GoxjoKYKnzckScAJvn7dyiFkptSF9RO4bioiYN8W7deRayKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8193

Add fsl,aipi-bus and fsl,emi-bus for i.MX1, i.MX2*.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
index 00bbde203f598..4808065fc9115 100644
--- a/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
+++ b/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
@@ -26,8 +26,10 @@ select:
     compatible:
       contains:
         enum:
+          - fsl,aipi-bus
           - fsl,aips
           - fsl,emi
+          - fsl,emi-bus
           - fsl,spba-bus
   required:
     - compatible
@@ -39,8 +41,10 @@ properties:
   compatible:
     items:
       - enum:
+          - fsl,aipi-bus
           - fsl,aips
           - fsl,emi
+          - fsl,emi-bus
           - fsl,spba-bus
       - const: simple-bus
 
-- 
2.43.0

