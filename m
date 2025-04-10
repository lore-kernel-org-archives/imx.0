Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2070.outbound.protection.outlook.com [40.107.247.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1AE18FC9D
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 06:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266438; cv=fail; b=rkl4vgiyeLCk7cEHHxIzo6/ujrl1F8T7qL8BJI9o9gwvLO3i9aL2/k2ZOf3CCkSi4O2JsWmS0TFKQgR2wiZWbI2PVkVsciKKmlDebWrJ8PNB31gzS/4AktJEXg4wBvtHDi9dejkKNqcwNSac1FQGyJuMpox+zZ+VdRPcExtqqec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266438; c=relaxed/simple;
	bh=zjVvCSpH4cA7rW1GlKOBDP3SwYauIP9QOKDHpsQontc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hcL9EUIA0l1RrO9O+hzbEC/gpCs7rKzVFeum7PMi4jzdWRzbyawxvlCBQU/5drKWHElFe24OQs4QWO1msE+wcXEOLK5rLjt02fkdYMx/+f71MzrC590Y3W7Hq8dfcazdcPArq5frvZ2I3+Hgu+ACMPZYu+Jcehf0xLATvUjFjgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FwOpOh4h; arc=fail smtp.client-ip=40.107.247.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FwOpOh4h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1gW9PDHKkb9Ja4nBj38/jSm4ksYzyrkBEFIMFdCBmE37C8rdhWNHHjxq4Qd30ekkvK0nw+2GToiI7KW0GmzwkTPXeZt77phBCYp6Gzz1wLciv5MhEFtotG4ScWCbZWLO8mRjNxh5t9mR4UfccD1jm7VqAAvSPlhGyAspOB4ISKzljPMlRH9lm07r9eMEkw+YISnKTVoETJAJKBaEAWja9w6OHPvOeNOIzgmi0IFMsn7AKLuc/DRwZTqUG5y43dTXYvFveBD0W9RhqMUBoPjoKPSgKT1AEqgqMG6+C4JlKkryoFDahTV6IsJlEV9Neo/mH1PkGKX9itL8C4VanU5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oho3PFIAVO71sVNjUvqst8m78JcET+eOTCumHWx+phs=;
 b=udvi0EUGAXN/n/s9LF/sx6mkSHJwf4O8J+5RM2UQY3G1dHinPQL9zclH7g/Ll+q+MlFkjDyPvT7FDQ2kRo/7L1XvPFijzxt/pmhqpj5icUJyt5o9kgBDLXVy+6zTeGDS3qxTsXZcfcATOkfq5ZAupn8NdQAKIdAUHdbwbxG9foQtzpWjx1naFVNY+BwJm+b4HZAkxaTYmLnkkX1brsPtIoP4HKp5oXJWcrXH2Lw6kv7mtUif45K1edLr+9E3Jz06gJsx1fxm79CHzkaUv/lEdvfb6BkDE56pZWhshQJ3sKoYgDqbhMu6RRiw5x5WRJVm3gNx4Bx5dO/KDk0yh07hwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oho3PFIAVO71sVNjUvqst8m78JcET+eOTCumHWx+phs=;
 b=FwOpOh4hSuc0rfPERKaPTsE9QiRfjNWN9sJGdVZmNW2NkBxG9PC0eNkwdRhgeKDQjfvNiXNUbXC1qYz4PP6oPqOOO7pCqTuzW1fhoM9lgVw45/whM244fmZ9/o6ty2Vmeh+7snO6d2C6oFbfzHiP4MUYnhaDqTq27ZyCYHIOH90NHUSeUMivjhiLDMpsWeaHxBTR+UdWsbHe9h++6OEiEVrGYfX8yhE0tgZHvZHH0WKa8/4/o6WENOpv7Zhx0iVG/axnZe/PmlmlrNzCIz/C/413n3Osy4762JN9yATU6Dx4+gg35r3rYCYDZPee2gDROag6uN1hxTOw6Ejn6LuaLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AS8PR04MB8801.eurprd04.prod.outlook.com (2603:10a6:20b:42c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 06:27:13 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 06:27:13 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add i.MX943 EVK board
Date: Thu, 10 Apr 2025 14:28:24 +0800
Message-Id: <20250410062826.3344545-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410062826.3344545-1-ping.bai@nxp.com>
References: <20250410062826.3344545-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:54::20) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AS8PR04MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d60fd8b-496d-4a9b-c90c-08dd77f8bb33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uNm3Xw0M5vXt5l/276QomtWsDahxp9QejRvUa974C771DCVTU9KPF57Xul8C?=
 =?us-ascii?Q?l7ps2WXuK2OBdzpvtL+xBOLGDYLpTws6Ev4MTw8cXXaDQTM0OHQVFhKSKvy1?=
 =?us-ascii?Q?4wYKr4un+omOjJZP4pMMXxBomYbSAHT3x+yXJQBCuPEaS5qpcTgmmGdFWi82?=
 =?us-ascii?Q?d4bxiFQtzTVoSO7p/1wi3kXeb690ag0rcpPL0uq9YA+Ph2KAqjQh7d+FsRzI?=
 =?us-ascii?Q?W6g0te6JpPvfWKt44pXoxjqwSRTAv3POd03AYWXlXwWc0Dz8rnrkTUfHyPaH?=
 =?us-ascii?Q?bkxUZC0rfRIcEDyprK/+YTUSYSXClzmDT6fJB8wRYpYHx/+xTrbUOi8DSOcW?=
 =?us-ascii?Q?M8pkJDD8ZZU8OywKxjJ6usjspKhsrKNQPmz9VOHjN5fUi+5iIRaLB15cPn+l?=
 =?us-ascii?Q?XA27UlgyyBzXl25ilnAdaMFxB+uu44AnCEWnml/vR1Nm6MyCJL7kDJA1XzbQ?=
 =?us-ascii?Q?ntqa5eXjvbeqz64BJC2Oho8nus49yLmvx3H686EaBkkiiaehQlCfuXU6i26e?=
 =?us-ascii?Q?Ny7VvAumE+ZveI2Wa2wS7pKmBYQtwuP2IAPkK4m1VQRjxVvcvzKH2BC3GCo7?=
 =?us-ascii?Q?tJ83lZULTO5cn9Y9yb6euk75j/c32rWSDsLYydnGQ4sDPlavxEFHldzooLR4?=
 =?us-ascii?Q?IPnQP0kcHHFGxLn7LUbNhSLFYWkGGlUcNAHTDQIm88MGnVOpK3A9TlAsdwsF?=
 =?us-ascii?Q?TG7nBg0wdnNoW93I1US/rAJER0RJWgi0p/TaN2niRcEtT1O8z4gNugC+tR/N?=
 =?us-ascii?Q?Sk6QiHcEeID3QL/mYkZXp744RVVe7JrD0N7nK2aGwmATCLnY9va/hvLExNhA?=
 =?us-ascii?Q?IjN/ApaJNjTyn7cPXVhxck1RWwA4qWukX1cliJnuBNy+moAOLSXE2g6XKMFb?=
 =?us-ascii?Q?0JY/eoPYF+u5QySTRKrOVt0YXIWrO5TQasPgCrI69qGBmo8wMzPlHo1B9rRA?=
 =?us-ascii?Q?Bb+w15vr51N43BeE1BHj08SaKUMi5tRxg1IdV8+/eqMb7Sc9I5CfQU+wvdYm?=
 =?us-ascii?Q?sFUz+HHHlHzxvOx1rFu18MAV6zkGg3UFZ2/CwJotwz7wIDpGHgPBgmysT4GM?=
 =?us-ascii?Q?tlB+PDBquEmUW8Nt8IhDuqxXtwwbAlX2c+FScOq8pW7M4nlSXYXVL5yU1GnE?=
 =?us-ascii?Q?mpBcM5cn8sx5dTl7z3LFPOKOziqh4A58k2oOt9+n7CS7lk4hH9khUz1iBHMv?=
 =?us-ascii?Q?SDv8yjLxw3CBQd77MqBoAI0mQi27b/o1JnkCgrw5iNELMBmFSv8+Dz0KJQLV?=
 =?us-ascii?Q?0xKt6fzf84V/2Q4lWWdpBGcmnU5aDNgcW+kCYfZ1vGJnRcAvisI67T8DhiZ4?=
 =?us-ascii?Q?c47GtA3izxQ0/+6cx327+QOG+isN/H+AXDyJQmBZNjl6+k5kIz3Yc31MIt4K?=
 =?us-ascii?Q?LfrdaDtMzCwN1w+0E9q1gPp1RM80KAH4/PQ41xQ/AEEdxJlcw9NXEIQ59mCP?=
 =?us-ascii?Q?4UOe3uakK6Dw1CiJrGxYHSBsl1ezKUbG6yUHYdNOxzpOAMRmiCFnog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7kiRrgblEV16i10QVuHmyJzTXa32YjimJtwDtw7g5K3VXh+dIPZ/8+3y5Xoo?=
 =?us-ascii?Q?RZK5wkBwp8tvJ1oeqKOSxe1GrxIE8p97YiGg/VzH4046zb/w0LNfFzXt/Ert?=
 =?us-ascii?Q?HyjTDoivrN97Kbkdz9fgTYnQvLOOmwOPI5z+amGQ+CZMbT597L+n2zLtBgoX?=
 =?us-ascii?Q?qwRwwc8QKR76+GiS+czlcKkN8Rlxzwc0Pap3oC+x1N4uXGtzvqHPparcj+6I?=
 =?us-ascii?Q?zpxsxlRonUtwvuvshlT7LdwnhjT/LtVcxs5lOxgsc9Ha7gj+rHterIT4HcRy?=
 =?us-ascii?Q?nDDYdo1BCOjAIOx1mjuO7wxDkD03JmPmoZxVBE0+7R+aw72s334GD+dQN2Df?=
 =?us-ascii?Q?hUrPOkS/nirkyAjvD8pqXTTQPKgIbtU/PkiKVb2w8vO9a2CLKFftwbL52qH9?=
 =?us-ascii?Q?XyNjnfc62zK6WSW4OvG62EX4NbhiTrDBN+JMASWz2FkKWeLBRVIaBRRPuOyR?=
 =?us-ascii?Q?QbzDh/K58//56JAz5U/Nq/fXMN34kXIF1+Hu2bFsg06j9f6ixUxNxf7u0fsZ?=
 =?us-ascii?Q?CgmBsgk9RD8oCDltZXvgfoujMnipTFQBC0iDW/N6FfDYq0O/HIVWXy76WPJV?=
 =?us-ascii?Q?iqYRmxABev6D1fQy80qxV39qdgTQ7xzrwYjVex7Wgue8jiFFUvJbfvkNqy+t?=
 =?us-ascii?Q?ISgv0yUq/75TXddQF98scV5doejpVD3hhWI0v0WX85bZJOQ6bwa9hqWxV8hN?=
 =?us-ascii?Q?TNIJIwVrZaB11MfFS5N9qtIzwlKrDNsiudvTOQKJkqTdEHgAXm+GuReP27LY?=
 =?us-ascii?Q?za9swr8pqFXqGQAcKGYDIHpEf+jIsNEZbf4DYXEha5qFALFLyC48DOi+mwo8?=
 =?us-ascii?Q?aePRPaOYDWmMNLDWvwEOIw6C/5qJ84kOHliUrCJGYt15P6VCuNMaywk2gHCO?=
 =?us-ascii?Q?1hKBXbnRMq/khYFqMrDrpsWobShdJrxwUQwulybTIvAOTDLkapKakzGYEI9O?=
 =?us-ascii?Q?eDWRydpjqIe2uEq+i0XCjclJKY1PZk/WjKQ1KNbFkEw2CcfTxEWMX2j0Du/0?=
 =?us-ascii?Q?JmL9gNI2+x0DKFIH2LYQnjGnYlxfhMwkFfIel2PDGxrxvqUPCyFDCXsn0maX?=
 =?us-ascii?Q?5Vdxubwy7nU0bFodZGv1zP0xknkcwUXDTq/Mv/ZZKEqpjqzsKq2MDvbFF8c3?=
 =?us-ascii?Q?Lx8r8fJGxlryo5hiY4u+AEN6zxaU/2OMUH0LS9i0Ki1wxhTSLkcj+0KHBS6G?=
 =?us-ascii?Q?iiD9SoxO/qqfDt33HWtvX920flxDUu1N5GiIH1X+Uy0jhsLfIjDpQoYEvk2L?=
 =?us-ascii?Q?4Tl5iIVa6OCQj/BS6jsPIdaLG62YXVwSvYnzKqaR/vU27RbiimrkkvHe5uLB?=
 =?us-ascii?Q?835u12WtN42ssojg7GIEpGY22UUHUrqJwQFoiNATRNaOpjoUfR68kIQ+/KX5?=
 =?us-ascii?Q?LkwwjexKnMDBLp7u0m45x18GQp0AHEhxZFH64L5H+TPZMdq//35U8X+qBsI+?=
 =?us-ascii?Q?GmKQ1xM6ibH6cxSHQpNM1wo/usGItzqRo0IeEhBZaO1TAiw23jQl01zPc9tp?=
 =?us-ascii?Q?oBCCJBfNfOLNBrxpgWxyQrpLiTNlhkAjQx6t8PKrvucieSb/pCd410GiiCF9?=
 =?us-ascii?Q?qCPTO4gH27y+wWqYkhNjzCCe7VBxQ9GYhoPDfW8T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d60fd8b-496d-4a9b-c90c-08dd77f8bb33
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 06:27:13.7420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEl/xGM2GbkDcKTVm4hoVtXjzUYH3SCdItcXBI3XpWg8r4iQOSuz+gYf4o+4cCzIsnTPXAw9H+YntokV5MUzNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8801

Add DT compatible string for NXP i.MX943 EVK board.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 - v5 changes:
  - no

 - v4 changes:
  - no
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a2..873f9eb25cda 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1347,6 +1347,12 @@ properties:
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
           - const: fsl,imx93
 
+      - description: i.MX94 based Boards
+        items:
+          - enum:
+              - fsl,imx943-evk            # i.MX943 EVK Board
+          - const: fsl,imx94
+
       - description: i.MX95 based Boards
         items:
           - enum:
-- 
2.34.1

