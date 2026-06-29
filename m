Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2A6339872
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 22:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782772667; cv=fail; b=uWP0DsH0rI1f9dWdv4hDvCO+EYDrefUjzwi5p2rRmc1F1l8Q916G4wSBp0c06OIwhZYJluh12PIWVjzBErQZbGGiUO02Mah48HVh+Auk74Gt0bBZ9yZ8Tpq920AblD/mV/CiD3QWkvPd0UpKLQjXdpEJx4kFb/C8sZW669SKb4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782772667; c=relaxed/simple;
	bh=qn3cCjc6DEDpPNH7/V3tuN3mV668wS6SDs49VUkHBjk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gFGsk2IqZwBZiR9c9AkHgzYNkc4ptsTTLJarI81VuqoYYP88BqQjDNt4MXhc4jmguUuNI63wx1vtBD36xv16u79bHJkFTNnnyOBgIcqS32oFrVVOrYNjY3i9DmDQqF4yCxzcSKhnp+dkOsm/p4nb/sRMXsV1XoNGOTqD+4Tg6sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HXZYPAIr; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HXZYPAIr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yL+DxOCsx0gOqLUnXS0somW/cykbso9x5z4dKuZa4JDypcBSGB6nlsTnINxdGxqA0knmGL3HKWcWd1YvWXROPkOPvrQWM2AhOCYObX7qwi7FXpTrd+oe0Ax7GCuu2OqOyxLkzLYFUWYDRnDR3zDczted8aWxfFsmw3UvRysQFYQst0KHXhi7NS2ZJleAL6VO8VF6edyxRv/9wZ9xKtkwZLz7exZaXIAVjcssc/EZBfvwK3Vje6csluPnU0hrcOnjwAIDVA+Z5Dh3mzyzT1uBZl0eA34eohTUchuulBKBuX045TgKIc9VZqra13Tpbtrev3WsW87+s5rmGCQXOsm0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbB0g0k+eJAAbUuCaK6lJgBquI09p/pQI6KleW+gG3U=;
 b=R+Hd9MMZM2sNWOCfhYqF74RBXf7h34oR9w8HCVYnSmWlOWeM9vSc/UH9GAVUohKbi/gHLfFdbIcTcoSatwpIqcOwAYvimN60aRkxYU2owCPPpalNBArMMKWznPWEd/IJEZNy7K6j3Ti0jbcm7JZeFUtaXvaaLzpnx3vRMDlhXrnLMNSoNQZjmCc3UAVumKrRaatnFbWNhZ6UQEzRWkOq0OWco70rLULEfP+UxSVqYnsS1oRZpi1NxScwtjVPHR+51oDEIjc5HnfSGplKi6DL4yBqiJqYzPFPEbmoUdrPsUst5YOHg/qLu//MfVojI/5Ev3NkgF/W9AoUYxiRKgnKzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbB0g0k+eJAAbUuCaK6lJgBquI09p/pQI6KleW+gG3U=;
 b=HXZYPAIrfFf+Kcb46HzPaHGURBjAcd+TpFDcbzLbqrG4qwn6d4QBkr8xJSbN4vZkKRgqMqGHGtwNas19CppT/uX950k7SHtJCAxgeXL+tM5HYpWK6f7a4xuMDSwk+THqMoIwtz6uGDqP1/X/Cv8vcWwxGuXWFux25dScYCXqSi/YCS1C3CWLv7CapdsOYI1LqAsCYzAjzDEHJ44AE9icrne5Uj916yS/kUyRYNa1e1DsjKCtfhv58hLvAdX7D4UdccrEFdQjbNWRwOe0Mz6lglOC7dAGVDPC+fR3vBvKhYx8o2NWfG+2zUh70APNGTH5OYlkMQHn7A6IGgbLN1H2vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by OSKPR04MB11389.eurprd04.prod.outlook.com (2603:10a6:e10:95::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Mon, 29 Jun
 2026 22:37:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 22:37:41 +0000
From: Frank.Li@oss.nxp.com
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] dt-bindings: mfd: st,stmpe: fix typo st,stmpe601 (should be st,stmpe610)
Date: Mon, 29 Jun 2026 18:37:34 -0400
Message-ID: <20260629223735.2559722-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0193.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|OSKPR04MB11389:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5a9ca3-10c6-4de7-43f8-08ded62f07e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|7416014|18002099003|3023799007|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	0+Q3vjsQUx741Ec2GglYUm6zWzx/ztsfOI8ugW9YX9P/LCBwH4uoQA30K0fxqaPaDI/hCYOeeZBssd0htLYqTvktEEtbCrRV1hAioYylE+cpi+MQlevGZZFSkACBjfTmLBakXogQG4l7rY7gFWRa/cLDqxm6qjqOBHZUkfDNLfZ6ifRWcG6NiS6Yn5+uFsI2AVucwsvxKSFr48YfA5IY89AVLHPwKXf6AgCA9bpF3MZzaFE1WlCBBw0HIRNC14EyS7cB5n2tQPK85xJXuUNU7FTjjyPKI8CLAkMOjiWebpvC5qKiaow7ueEVpBzNfRtxgsUJNvLk54EqIllqVnJjkB2/pPldON7/iLRa9wLV29XpeNK3mz3FD/nXS099AP1fw/JzJYPqtPLULP4B9dQixuAy6/W2/1OYu8mqa7Wb88jJ4Zmg+Zsd9lYrwvRRlVi4h82LYXn3BIcTFojxz9VA+GikS2Fpt4aXgp5VJ1MmWjjxxbn2MJTlO0xSfA4xqJ9GataCbgscVYowzr7a++88ubH28nTdHunrNkzROz381e4H4tNqjVcQ2nQURFHI1OortwZXlYw/hk+0A2pbmwfbv8Wxlh0Sw3/8dovJEk777glHPIAVU11IXSRuDPLG7M8UPcgyY3UIecsAB9s78hygfMGBM7/ar07bse5kb5AUWACWRQTh+I9M6aj4BOi28vRQASD98Dv5JYuusTuu55EubQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(7416014)(18002099003)(3023799007)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1qrlmemXaTFzQBHOsL9QdGu/3KoeZ/bHwuO0dRvc7IBbU8BMVH4Al9pzUm87?=
 =?us-ascii?Q?f8m1HwMb1n25Zo//BYfqGpwptJZEzBLk6lUN4cjobU0BnBDwM+MU8qx/rmMy?=
 =?us-ascii?Q?algQvazRW2MvSTZ6BZKtr9VMdgNwDBllF4BNMwaWmqUWcA3JjodVEIJxf/WG?=
 =?us-ascii?Q?jJ8QOtoEkevvp9cM2rB6spK0G3uMoZ0f28Z5pV4P6ne3fpyrn1m/LWbpLZSb?=
 =?us-ascii?Q?llkuSpCzc33Ux50VbwKU4NUrhiomNE+pAauSZPjAMZBHaylXo5hdGhH90MMq?=
 =?us-ascii?Q?sh9NfXjSlSF/mk345b8kGP+N7+w1V3LPQid8ASFlHiYu7kNEDbdmi3YkaauC?=
 =?us-ascii?Q?yDHeNt9+GuuW9KEhqfcMivWIOO7pRy6jaYjbirY27VUcT0EzapY146zAQi8z?=
 =?us-ascii?Q?CYMhHXDCLTXZoMFIfY7I90EzxnusXH2GMipey03ZBLof7yLVcsnEvBESSW9y?=
 =?us-ascii?Q?LMKdr4sV4tqns+85C/SzpU9wvLIhxdzDgRk+kKosS0Cx0ihI6pQic5yP1cJI?=
 =?us-ascii?Q?8u5xR2H9Atjtp6M37eQdDklwX8EIdsMaERG7tLCK3lDDThkqXs8sxHF4Dj/p?=
 =?us-ascii?Q?zzDXnCm3VHIFYz3HTsMWMB1GNZqM9TC0LzOpJW7vMhl/926sjehfegJxjzvH?=
 =?us-ascii?Q?xbEt7JHn3paVmKayisiwiR1GpeAn9cVsxuafJVtbjnZMWekT9h2FqX4P0HgB?=
 =?us-ascii?Q?l6/h9zZyUHlhRZNQ0xCkVeZJab5LzmKUgRzS0ZfZCfxcmao9Bky0XTV3QKyc?=
 =?us-ascii?Q?JOHUlzPAkO7qHHH/N3gAbED4Xdoa8GqD+cMPdZnHnTCCNVi7obRG+ZwcsKIX?=
 =?us-ascii?Q?g2o78+t9rQD/aQqNchRg4wTiQ30Bh7Dn5nbeSaNXXwlC4Vf/XX39+nEf3j1V?=
 =?us-ascii?Q?gav9LUdXR6hP4tFhTmhQhCu8fMMWkk2J3pGCJQRbk+J3VFsjTd5RfULjn4k8?=
 =?us-ascii?Q?WhMdyISX/CjdzCziHHU0pQhbLWUfrZ8xSj9bPwo74N6zHqga2/YzOkKcCp1b?=
 =?us-ascii?Q?zFnqUBS4wMQur1gE5PF66kuHPadz4N9CL73mFGMqKx7oKFIatAIM7cBceH9Y?=
 =?us-ascii?Q?iMbAtq4u6FEiFD12l/9U6y7EoySOzfnpgpQyMM067U4ctmUUSFMOvfN1va/Q?=
 =?us-ascii?Q?BW3HNuaSwoLl2S4CquKEiz+z9jIvfGAe5EHD6fIrZhVVSIMHScrUtXf0om8E?=
 =?us-ascii?Q?SQlOJDW1z0EP96lwAy+VC3TwToH+Bq9R/bZyii092+OXuVbT+mtF2Gw3wBbw?=
 =?us-ascii?Q?eqKov1o4cd1s6d9YWZyCvJPKkJpphqQdXyIvHPws+XYh1ovsGHb3XqY4sXuH?=
 =?us-ascii?Q?JPBNahORRByo+HAoZvLG4VWSaICKRmfi+d+noMf7BfRaEhOnNBMwg6fdHnwe?=
 =?us-ascii?Q?YJ0mxX2rSLALlIFORqKuHZtTHjNGO/xzOwntnk2bVtfwR6PnVGtkmpsWUYJG?=
 =?us-ascii?Q?RZkdXWEpzB9TwESFJ5q41/kKH9aqA/yuq7iQdosLlok44et/mz2i+TYHsd6S?=
 =?us-ascii?Q?TXo8Wjq8SAW57Zi+24s9OmQHpNg9xZhgVOGd0kQ6TtldKIQzVpLqbrrE0JBL?=
 =?us-ascii?Q?DEVIeKy0wSt4/MwiSDpj1tQywiM4TqXJeDbQYnoNo5L/o5kEDy4LZuAIfoR7?=
 =?us-ascii?Q?9I0iiKDAJ0hB+lr4I10gL5XpllZq7mtagWNDn4TiPd2Us5wOv8c0mbaJNUfN?=
 =?us-ascii?Q?0DzfiR4Ms5o95cuhAcVsXP21QY4ADidX7fD0+BllzQpSP1bs9e8/IsnjXR2l?=
 =?us-ascii?Q?lvukiaeZfMxutJ/VvSZJ03tEj9xZqfFNo5aViSJ3mGyeA7RL8uG7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5a9ca3-10c6-4de7-43f8-08ded62f07e3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 22:37:41.8582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5pOIEbqIu851knVdiU0nWt6udjMjYpsEoxXW46yOsYVF57b+6GiuQrT5fNA9+WdI83/L9XHkp8/Wf/tPV/o93FXxExBA9ubgw6bulk8KBMKhtNrslLTuRvwa4Ii+HYy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11389

From: Frank Li <Frank.Li@nxp.com>

The compatible string "st,stmpe601" is a typo and does not correspond to
any existing STMPE device in either the driver or DTS files. The correct
compatible string is "st,stmpe610".

Fix the typo to ensure proper schema matching and eliminate the
following CHECK_DTBS warning:
  imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed to match any schema with compatible: ['st,stmpe610']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/mfd/st,stmpe.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
index 4bb05d544901c..ddb27ae64ba37 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
@@ -20,7 +20,7 @@ allOf:
 properties:
   compatible:
     enum:
-      - st,stmpe601
+      - st,stmpe610
       - st,stmpe801
       - st,stmpe811
       - st,stmpe1600
-- 
2.43.0

