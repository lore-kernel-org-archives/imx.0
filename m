Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013040.outbound.protection.outlook.com [52.101.72.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADD3186E58
	for <imx@lists.linux.dev>; Sun,  1 Feb 2026 01:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769908879; cv=fail; b=e89iiObEHRGYZBAtXCUnHS1LCmODT6mHKaD0Tn09oPxU2W35Ji6kPgt436U9B353xgt7ghZKT7tsxFVb8tBFOPDIY1n/sNgPujHmSqEyK7E4O7yGlHHBXBM1YXSKtzcAYLSVebOdsN/PfIFHd9u6nJXsGVzvfSfEy0ocg/3lv/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769908879; c=relaxed/simple;
	bh=a8D25jQtLEO3qCkKGhfVwKZjUd6Ga8FXQU/dxD15edU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=a0+4tSZv6Tr0dOD+ciqOV/5Vg9w+Fg+/cPzAhbWBUfZG/rt7lyxNBIspwPY3qUrVTRfmXL4QqXsQN3bLbwBf/T6U3Ee9YbTP3ZQ2FSYFjlZo99hBiE6Bvp+Bz9ltsbnZDAqPXQdnhjuK/IVEld5Y97vDIHAscU8B7evDxlA9IdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LmzXUeSB; arc=fail smtp.client-ip=52.101.72.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LmzXUeSB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifMCOUvy+9RNTAdQh927JCQ+aNUuAYTls19vk1Ugw1YejT6qD1YNDJlq4/2GEa//2hisWnCtPLJzfgtDFTjpqMtF08QaV8IU17Hfr+CRhxb0bjid2rcG/3MQ2NC9Zd4t48T9GK1gWe/bHUH+lz9D83NR4R+F/S16ChuReKqAi11sTmWC0DsbBhcXnfqa6rx3NBE7/Sz7uSHKJGOQaBy4TpNXgfiIhS/pxGm3bir7tg0J2ce0PwexqjbXBhA5wCAUyT2lhF7KtdE5ynGuXgZcrXBGHUnK5Tx9j3b4RftQmCRR+UPSBLSLSiz3tcUtycuRuIjWryJEqnQYmH0HGowigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W53heZOQQXpq5ppX13se8ezWJVhKzCppEuSu50k+5Uk=;
 b=sFZFAkB7T9iHchRNdmvhGspiyjSkuvxWFOiK+ELMJJ9gnbOAZiUd/Jvcgs9q+65KIAEWNQD8IOtWLkYMbZZP45YXYBSbbYVgytXhtn3WopxsBtA85ttMwA9/ELC0PXVIa7OSCO6lz4j95/8Wk+fAdlrRNWF8GKUQVicHt404aEvEMZh7duWsI2tC0Hta/pgbEC0MdYpGvtw6awJr7yrCGJUlcoJK6gaWTcm9K8dOFieUtQ0QX4k0NGEU1nOySMCr+A/3Rwy8z/Q5RFovGSK/B2liS4rW6h7lULwCgY/g4QHfASEEhX88SCHlBsNBFKon66x93yDei79/CbTNsMaNqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W53heZOQQXpq5ppX13se8ezWJVhKzCppEuSu50k+5Uk=;
 b=LmzXUeSBo7ZYej+9cANp/Su2SCZZMPc9Q80vmvVbXTSW4GowLxTQqjnBM/In9PP4WxAgJhHl7mIxLPxIgiDD18vuuK8rwqGIEXG2bvph8vULcQHJFgWZAjGiPE7uM4Gxpt805J+gFHA0Ok4OEoEk/SRoIp9D4Y6XKYhCaG3WNRs0rNWpFELNh4BGwRxgx/deuQoPU0hZhdFbl/v121G0PAHEU99C+FvHGIh8mpYgYsoO/Te83GvZN11EgvNi4ZqFyjW3B/hZS7tGegahSEFjfPzxYxF2YUcgAGEgT8wc2Th7jMEa/BircXPs6xWCc1x/sJk+f6JFZLA/lfNy2SQ5Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB11037.eurprd04.prod.outlook.com (2603:10a6:150:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Sun, 1 Feb
 2026 01:21:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.010; Sun, 1 Feb 2026
 01:21:14 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: interrupt-controller: Add compatiblie string fsl,imx3(1|5)-avic
Date: Sat, 31 Jan 2026 20:21:02 -0500
Message-Id: <20260201012103.2422917-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0056.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB11037:EE_
X-MS-Office365-Filtering-Correlation-Id: debc6c8c-ea9a-4d94-e153-08de61303135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H/cFj8UbPJjwMRg/zqFxCdEnToUJNJ2xQTOJc6uYpHufQERtN363qjYmK/zw?=
 =?us-ascii?Q?0+5zIdK+2KTIDyK9N+eatfaeqiOvCOkzj/vyJYs62mmdbRa08LNJXb8Ui8OH?=
 =?us-ascii?Q?b5NhQXyrY3g23hHiB6TQnTD9ZUptWxKgYdsXkfFlCXLnr0Vk2M3MFMJHMUS6?=
 =?us-ascii?Q?RdO6ukgb3BMYN6zwfYByetv5AnJ59oYsToxov9jFKfH0AqW2hXPTggYnx0ki?=
 =?us-ascii?Q?Y8OwGltUR7t8d0WhuRTrY4B5d45QmmBMIJmFFg2h9etVeI8UBiyc5p1NZylL?=
 =?us-ascii?Q?whlh11wRs4Q/DFIg0KBia05ji3Llh3P4itOo5kePj5xUg8FvKzotXiL4gEq/?=
 =?us-ascii?Q?0kyXQGjY7oLNsLrB5ufBOzGbwK+nbSiXbmOSURjLceciaUUqz2fp/BYjUOor?=
 =?us-ascii?Q?4CA7nVQoF8Wun2H62UbeGISBnnGuyqqSuL9uv32ORvdTckV0YN3OBBa+dO3d?=
 =?us-ascii?Q?3JiVTbO+GuYMh06urTXRIV/bGmqzJrqeqkOLbdF38+oZVISLpMq0/Q+MW6PC?=
 =?us-ascii?Q?usNEys/aNLNbBwzx2da73WdhO7ogHlLntYo9o1i8QbXEl/uaXSO96y7qlTaM?=
 =?us-ascii?Q?VsiBBZMPs796cpErGAKpQM9iEUU5wQOJw4ynOElU2y8ACoAAIPGhiTC25H8j?=
 =?us-ascii?Q?s2qPvMNV4y4TUl9tQ72lRNbu2EQFcRCYFEG6ufD8ISoiP0lh6YaOJzDlqXqb?=
 =?us-ascii?Q?QIGpNAOtK5i9hU57qU/fEQLlIscLwNiqXdk+wCIpbRq2oHucAGyS0MfmtlDO?=
 =?us-ascii?Q?jHK/U3Z4D24ObuIzTDhyhhPP4DRN5hdNJv/Yk0n5GK3VDJPEXK0A7KQ7Y/q8?=
 =?us-ascii?Q?lQiq52PHEvV8MHn+us8sEa2r7A3JDBaskj9NbXKw7q7pcVUNrbCzaOK9Uwda?=
 =?us-ascii?Q?SYpJIIm8KwpYS01vu/lPzoffQ6bd0IkWdvk5Ki7bGioflt6hrneu1msQ0F8l?=
 =?us-ascii?Q?hIj7LfOfH+BFCalR+ka4teR8I0YGVqszZYOVmcnkY4DwhbAbIbBg4NltvbMq?=
 =?us-ascii?Q?4xmmlpxIqYh0RDwdspgdwqh10eCqa5vYhX1Fm5cq+IH5uUA7U5HQl/PDBEmk?=
 =?us-ascii?Q?RFPGOrriu3xYEN+r4IPJohmTUlmRI466fPzf/0xjMFMi1qY4pLgqlZdwrlnC?=
 =?us-ascii?Q?NEFpooMqZjcsBjVXIsRKWc+e8RPxMzTgKvLXNKGgUvverx1JJcW5t2VxKmGv?=
 =?us-ascii?Q?PPtlVMdJQA8Ldy+ggb50cKbpBzNERuVOYtlabPmg8kKm9JG252QrkoNPAixO?=
 =?us-ascii?Q?XkW7b4qaBioX1G/pNJgoEJlJVdSi9rh13dCCIppZjm1wi3vLb0dwtEJBnGIi?=
 =?us-ascii?Q?Ug/TvRZWfPku+l6FHWAhnp9rl4grSuW8096hYpk0V9TlYAi8wxJXiMvAwPcC?=
 =?us-ascii?Q?td6f+ymCyx7JUOD0xI0A6odPWaSFVlM4C2I1bDhdaryo/+TozUVv0/4Vzwjg?=
 =?us-ascii?Q?Me956br6n39sG/fodDgIu/ck8Huta9OiYvuMm6txBiotGg0I1LqSwQZFbx4i?=
 =?us-ascii?Q?S6YmtvF5QRCOcgI9us+1PA59J385bMcM4+8r7u71o/A0wbhrQKTH3n3b+eXR?=
 =?us-ascii?Q?WPiieMyA9z6QM1pky+oXx9bL/SyFy+6IZFAYNDkASQCjfF0dPPjRCGZdADuI?=
 =?us-ascii?Q?KQsZBAqHMvlImlJlVmVNt8w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pFXFkR6OQDKBfpWZ4n0LOF/V8KR7J8pCMtJtbA49KpHwEyzUnRPfacY3Pg7I?=
 =?us-ascii?Q?rMbI1bBtUW/ei5gxo9rV0WIJDUR8KGgrM5Z+myvOKIB661PLb5ZnMEXmsTxF?=
 =?us-ascii?Q?MwUMItqC80lM1b+HPPa24OBKnmmcLtnpeTPNu/Uc5LPNT1TP4GeEggvZQk1J?=
 =?us-ascii?Q?IAg3p2p4Jo6Wu7FBkyQRDx7LT6W8Ttb/WF4ASRoCto6tZ4AoSr2+qtks8KJ7?=
 =?us-ascii?Q?NFPnRbDOLEFbTxXbfEDlAluCxkbPCS3YCN5+oJNVakTAJwCmuy3rHCaYQTYe?=
 =?us-ascii?Q?5pDz+tO29o7IMkhNV+fcECMKmAZmynKWxFC6itdtd3Tbzr6rGDfG38hGIHqq?=
 =?us-ascii?Q?Cq0CP74Ykp7swEsC12FGdKInEf+243aBZatw85gaputvO/rU9IImWHmzfkSQ?=
 =?us-ascii?Q?7yfIVHVg77LE9ztXE+t+nJX+/qf4ELMFhiT0AdLxbqqLPrmpUkPOQxB0XD9w?=
 =?us-ascii?Q?1NWXgf96hLM6S7SkmofY9mc2kndhXOtowSl7aUr+ln/0oyLy0o5SQ7/2xWaY?=
 =?us-ascii?Q?6zG0odAlpWiCNNI05BC5pYD/2zB3Mp2wlPrThxwi8MOFgYUMf/5lNBP2Nsob?=
 =?us-ascii?Q?bofNXG8kbXUUkq32ILLg4AG8DolQg13d4sBUiywWcVrdOWnNC4fD9EFHFIhj?=
 =?us-ascii?Q?rIESJyU/kdWkOj92sngYpHLCCZpWWcHtSgCmdLPXaRASUJ+48LoT5h5v0hQ6?=
 =?us-ascii?Q?xAPTRncwzu0XdRRP8NNljcsXXTiqhZGZIMyWPI00U1Ug7Rs2df6LmFzc7vwk?=
 =?us-ascii?Q?bWafgUYxTk9/TLmRGf39UHu1Dd9o3b3ruLTkmGB5pq6cl9q4SEcJDcZPxrTq?=
 =?us-ascii?Q?+bWvSMC3FM+bXad9CZ3SfGEpWG9TrT4zwnwMD5fP90u+k/srlQctsR9CBfkr?=
 =?us-ascii?Q?nempdfi0YwV81sxYbzuFZqx/JnKRBY9/knJjFdHQ0CURmDFOurWlmXRn8NLN?=
 =?us-ascii?Q?zbEA7vZDZ81tYXHwcgOh/j06fd5NKFeRCOPoC8Icvb9/GQHFGQclgFhz5pBX?=
 =?us-ascii?Q?6R7KYKPd4YGdVYsoJLixpzxWFAX4VWByBMJf5Z6bfZJKA4eYJQbp93T561S/?=
 =?us-ascii?Q?9aauPAS+55vxXeglFEtK1XlyXmhT8oPo2ge7Y4J3Uhj+TPehB++t3P8WYPPG?=
 =?us-ascii?Q?qIqZomSmQjqaAbDDEp1NEv5nr5/szHALfQxyiVSxZdytLR1pHX86KOP5OH6h?=
 =?us-ascii?Q?SOr0vbwuRJszaR61oMnvcxCu9z7wAh5pY9/l1ynROORoV4WFlGYxWrLEyttc?=
 =?us-ascii?Q?0BGgttkCDCDQjYIElIOdnmFdFUAVmtccx1N355hljytNuPbiw7/OB4SSHdSA?=
 =?us-ascii?Q?Gzrdo3vowKNm/kMfzzb+y3rNmMrXyCKTNRbs1giKmbKMfLOQdvtvSduEOxHw?=
 =?us-ascii?Q?yiCfs5XbUVdXpOOekm7eAkOzCLGLs2/4mi6keAUf+WtLNTEFiEMXUAiSMrcD?=
 =?us-ascii?Q?a278JfxXv6ICUnm0LdmFa4bBeLMQEQ4X5Wk9FNT+z6NqA6BbBWfbmdybQe75?=
 =?us-ascii?Q?2LI96ulgR10m2bIdt+ptBifxx1Ux9TKvMHqO4sRJFYCq1fkyIVv61pCVYDsg?=
 =?us-ascii?Q?fKRDpx73toQToKUdXmyHExVH3OzszgwBGtTh+jVqLWIA4Fot8MqXusxLf9Xg?=
 =?us-ascii?Q?RW6d2W6C4Bo4DqJLXjw62WmU7pn5DmSv3rmY0jFDHHyoizKIvNqiq6krJwkF?=
 =?us-ascii?Q?F73zCurHi3Q+rv3dpwVZpKs9buskIMY/LuBDlxOiT04QzGkI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debc6c8c-ea9a-4d94-e153-08de61303135
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2026 01:21:14.8346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTaxFiyY0jhMK0LmHlcLUVIYllF5mua4dKN3Rm7Of8XWmfgjjxDYT2tRbgjTSaUgDtTUJqHylEXYYWjWAy+hrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11037

Add compatiblie string fsl,imx3(1|5)-avic for i.MX3 SoCs (over 15 years
old).

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/interrupt-controller/fsl,tzic.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
index 5f2c8761a31de..34aa6b0517633 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
@@ -12,6 +12,11 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - fsl,imx31-avic
+              - fsl,imx35-avic
+          - const: fsl,avic
       - items:
           - enum:
               - fsl,imx51-tzic
-- 
2.34.1

