Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17A0358363
	for <imx@lists.linux.dev>; Wed, 20 May 2026 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261625; cv=fail; b=m6cyf3EMv5nB2rTai7Ry0t7DHLll/Q/RwlRS2rS+THSOi3iGQ61R7MxktIatucDUrpYG59GZjnIYUWhRKXqLFj9y5iw9smV5jlirrf8fJpuSscXHT7LGgjL9r787FV4pqjxx3UVJk79+Rj6OxxPbQExkylsQObnABBjI8YjT990=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261625; c=relaxed/simple;
	bh=VvJ/7XeGZNJ7xRNB7qJMvGYFd5jXAHrTzTaDqxdrAL8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mYeHwBmuIwzXQ56aypZ6yL+gHeT3oqfAf7IWJ1WYXmLzHfnWmj3tBd5qMJPBwARtkLiMSQSaZb1+YQsmJRDBJlbJI+xuHPLVHG9fwSDyaLJmsBzqsk9eGsSQ+UsgKFUJOzNp6424M9I6mNR71+dalFWgFcZ09IOYSGU542SjbwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GphoN63s; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GphoN63s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waPrQCba/JKJf4sMH/aLmbIoSR7IIL8KoqWJBML3Ivmy3z7XFtFx/4pOKr+GS855CfHECOvpBjw8cfd3vsQRn7ctBqXt7ClBGjU1wgeRIaz2gcjKef068Wit6PNnPKkQumhTJih85SxqK4XLFCzrUjKWQHi1gLrkYS+fyMBKm5UGzy2PKrbnwEh+x+kmfX4u/53rLGInnwwY+Vmr1d3ugDcSg3ab+6Va8dRR/FYmM7S5NsI3RJiAg3ix96Kaws4q72xJYe545JqwwOhYr6FG8GZaVxtOce+EuR8JCdcv4mEQg95h2ro9DPAw7WjgRGnAKpEej51yvOCpJeflEBzkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvh0wIco7kYYWYvMmKN0sPfccTPBnSRz0UdS2KXrzhU=;
 b=FfYcnEuF/MKBIp25AV5PTdMA8wj9yHCMBpNuPXYRZwMVq3hfLMcl17CvrsDydOixMzgRzik1ohYkjPAzvsvtwlAwT1PR11b9Awuo5nr3e+4gx8LAPfmkjGiHaBgWFG3GQRBN4W3d6WFcYItoZ9igRrjbzxEzlRokwHiVoTtqNra6bmpcyHsizsoyvGO9SHM5kexLfPq7pfSg7cD9AxFJBIFaxGkbfQvSDnwhB25vPZgHlzuBnktFDjRYSUMFLwmMb1/xKL/RLcPnKR3cqnMXBs+dOXk+abv/uhGz/oxVrj11z98fbGObbZ+wAXC7XJJ5MvURkvs2+6862Dig5lu/pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvh0wIco7kYYWYvMmKN0sPfccTPBnSRz0UdS2KXrzhU=;
 b=GphoN63sBAkCjGHTmjZGz4bj4Efgklvi1Fc0lAZ6aacI3GW9XvpoKxUULY9yqwb26IePsAgQCZHgnSQNOfls0iMVPHYotvtJUl/T81rFy2s2QbV00222F2mK7yjkimDYDJIfax2ylpQzQudR0CebrUyGued5BfDMkXZAMlu1b3PmLgOfxkLynNoEpx2u2nT1k4tImfBluzFTHxNFILzajoL/ul6W7jgFEgyv62zs+DnHEFCd8HtzcKGMJ9Q22yKBxPg+KO92Rg5Agu4uv6VkatRrtYKjITLi01MQQdOaxjXP9IFbIPeS1lCMktU5HbACULGf0U88QUuhqaYFHgISCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by VI0PR04MB10392.eurprd04.prod.outlook.com
 (2603:10a6:800:21b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 07:20:18 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 07:20:18 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v8] arm64: dts: imx95: Correct PCIe outbound address space configuration
Date: Wed, 20 May 2026 15:22:28 +0800
Message-Id: <20260520072228.2274790-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0240.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::12) To GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|VI0PR04MB10392:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1ec807-1c4a-45f6-a43e-08deb6403efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|52116014|38350700014|11063799006|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	s+jGk1p2s0jntGe4VzC0PxY6XnkJ6eoNEb1F/0n1JQf/D7hmGNA+8FPpvSiiWSLsn1ORs1O6pWk3lhKY0WU/9k68+RugSLlsFxr+1djeUdQZucmlAPKPOXAyg2mGLFot7mshmlNXVGwscmwWfF0bPqqw1yheFHC7IPnq/LS60B+nT+RLXFIQcNzCCDlpCtIGpno2pYxTfqrNCvF5tk3zYLRkvJ7iXz1281k9XEKJWW6ct/nDMJZaHJeQPdJMKPQx4TC7WG+NojB8KuRzNuqzoGP+GfsgCa+/qh7ueWiKTGo29iKLkINq9/WhLZtKffnJD+JpCJSIqSh/xkO+aQEEyEDITl/YvHgkQ+eAVUhNYfwWOjYG7d9o6mHnRkNZxlVQjTjbY1EBjKQYCNTq0jtyZG0VoOdEBWs9mlv8yaFge66jKUjfw9QFHFaaRLMz1cMAZok0Co9nB6TgjW6K7QX4ArlKLOR+nRZBNSulK5bp5qLiVQiVWdp6KOcB3+8MmUewRr3k336GOhP9IBQjVvFdfag/4hWu+V8eqBMbsrR4WcKWf9mjdPe6PCG0XW4upCGAstbKmdYuJUAiVw3Dsu3z+MBGVslMldOUxRDxT06oOQol3XL53CNpKpgfOUA/AFw1CMzSYv0VuvLLdf1JFK4mKdmgv4YgP3iZUcJUw0QlTDmEMisyAANUKSfIEiUpnzwV5S/luG6zJYZbLzKAcYxZLTZd6+gWTDiG0tMlgglCyUPQJ2mjhWUWx2kVwup0Nyju
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(52116014)(38350700014)(11063799006)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4oO2sf0sMpmEH5P9WKQq/84HTWoCWC1qGMIGlC0cPv5sWSC3+l6Nhmv+YQqv?=
 =?us-ascii?Q?Hv1c6cTiO2f3Xphdw4xITpjxEm7nhIiwwYAw88LR4HEsqptox10S+6ZF+uew?=
 =?us-ascii?Q?arDWQq0cgJfahW/XkC0I5d4zoFsUgX7WIDdVepC0RhiCSqoWs0abqrL5DLEp?=
 =?us-ascii?Q?HMEPhBeiYmND6m14RuLjkqZXhmDKXsAwFh47krgl3BqV57utAm/LvtAxxOor?=
 =?us-ascii?Q?bbRmfr6gM1gD6DH9NhLDhe5babd6LuSfe+HnquIhRLr7+s2zNiTIzjSqIV8F?=
 =?us-ascii?Q?512A34Yb/gGoYKyV38xHPQxH1p9JlTBjkRloNEIRgH+ysyuAIW4hZ6pp+AVA?=
 =?us-ascii?Q?mL9k9uaJwhPau2ueIjGXN36GQumsrMAGsUKnI5oxvnltEx+G7ZBb65/Zan5n?=
 =?us-ascii?Q?lHM9r2pEKd+XbGyjRv/TuDZLEY8sQ986aO8dZr30dgRwO0h7xG0oc1CCPe5v?=
 =?us-ascii?Q?o6QJtIeLk/LDiFLyDYyRDbRwGqQQBJvnQUqorOBZ1uI6dt0H3a5xzPuD/nwI?=
 =?us-ascii?Q?TKZeiyiynrgZ57xYCj/yCY8TMfmaDdsvB66R1WB2moU4ys6wEcsXw9L/Ik8u?=
 =?us-ascii?Q?PC0gC+HeZgjY1mDoq2BX+pfYw63W0x/BjlQVVQ9wYATOdtzkTBq5elxMbJLJ?=
 =?us-ascii?Q?/6rroclBC5PvXH3b9bKy8XF0SdYOYu7ZkL9UBrr3QHzk08i8cR2qPFdwLkb4?=
 =?us-ascii?Q?GqzCCn2o7rWZrlIYcZw78Bi11ZnvYd5ujzFMa9Q75G6ptmqD6LCQz+4NJjvG?=
 =?us-ascii?Q?Fou1cZABkhZSmi9e7DhCi1grtesh9r+/18K63R+WIFV7oyLh/82x6jzPnPsV?=
 =?us-ascii?Q?sAN/VP6gN1TGUJS0CH+ObYJ7de0OAT7m1tcqGXzZhNr8ViM1UERveSrniC+L?=
 =?us-ascii?Q?xzG/IYUI1IeYxrDHXjqE+cOiV8c7//6nDDGpten05WlnhsH5z1ABtXRNoZ3c?=
 =?us-ascii?Q?e/FMmlX+7cwabcSD7kLaWvN8M41V12LqVJDUg6P7dw4+WwvaCF8dHGO3Hfjn?=
 =?us-ascii?Q?y/HVzbwjd1jh1F+V4sRj4JF/aHNYt2b19WuTqhOs1hqcQ35sDqhjchBiOI8k?=
 =?us-ascii?Q?GDOZZybHb4EFb1LdVx+sZs9FippPQH7il3exw78Li39mMzYdaMAkoyVzLhIc?=
 =?us-ascii?Q?Ty4QfUYZOFXnWGJEBXro7Dfp7UN8tjHXLEktz+w83N0KksRLEEn3+Y1Ll4mW?=
 =?us-ascii?Q?QXzA3HEEy9PrrRXlAk5zKqdCuDaSq5FgoXVzAzjXTTSWSNl00FrAslc3emOn?=
 =?us-ascii?Q?xQrNftdOe356ktXzOaTjpj9PmgR0UaNRlUzD0jlJnmXhPcnJhfUuYbN/nW+i?=
 =?us-ascii?Q?rN2x4lJ2tlbe+HMKUGyftSBc92nD9OpksbkD5oq9QQm2SbncM+lmLHnD3zkR?=
 =?us-ascii?Q?7E/We61ftrGbXvhtjyeWAqK5CUrzTV5deK1K4qhXJytHeaZRac4Qw6JgwUkS?=
 =?us-ascii?Q?uVhQzMeKy5U5Aj7sMPzRZ0x0tU/MKlFsExFksFoUv03XsAf1e/wRuBwHM4sU?=
 =?us-ascii?Q?MSqSW+MjJMFta6ImG2rGEV8A+CNtHer+WbtVfC5MAsTeTqUli4rgU5XpEl4A?=
 =?us-ascii?Q?RO5HSE6IH4MjmPZLgoeoOcLKAeRohThPdPZdetYQWa3HLDszYUWrh0ptjfzm?=
 =?us-ascii?Q?+w1ugDgmIN3Ng+UhcKOUUShrc0oesSpmOAb61qS5pYK2t/AaDvuCNx482zn0?=
 =?us-ascii?Q?VjuJ8itFDCbYtgCZQ9PT3ALT345uWgFtG1yX3IQv6u06HYXIayshKAW41Uiw?=
 =?us-ascii?Q?zPHQ4wEUHw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1ec807-1c4a-45f6-a43e-08deb6403efe
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:20:18.5672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhZpB8cKgK/rf9VYEhOyNUhIvzKEMijo5vWda5md3YjkoRCBzM/9dNi2cEVLIJl2aQq12VMjUScJdi4/vrDsKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10392

Fix the PCIe outbound memory ranges for both pcie0 and pcie1
controllers on i.MX95.

The memory window size was incorrectly set to 256MB during initial
bring-up, but the hardware supports up to 4GB of outbound address space
per controller.

Additionally, the ECAM region cannot be mapped as I/O space. Use a
memory-mapped region for I/O space instead, and relocate the 1MB I/O
region to immediately follow the memory region at offset 0xf0000000
within each window.

Update the outbound address space layout per controller as follows:

  - 3.5GB  64-bit prefetchable memory
  - 256MB  32-bit non-prefetchable memory
  - 1MB    I/O

Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
---
Changes in v8:
- Keep low address free, set the 32-bit non-prefetchable memory regioin
starting at 0xe0000000. Since PCI address 0x0 might break inbound DMA.

Changes in v7:
- Map the large outbound window into 64-bit PCI address, to eliminates both
the  inbound DMA routing conflict and the IOVA exhaustion problem.

Changes in v6:
- Set the PCI I/O bus address starting at 0x0000_0000, while keeping the
CPU-side mapping at 0x9_f000_0000.

Changes in v5:
- Expand the outbound address space from 256MB to 3840MB, starting at the
base of each controller's assigned CPU address range.
- Use a memory region to map the I/O space.

Changes in v4:
Update the flag from 0x82000000 to 0x83000000 to declare a 64-bit PCI space.

Changes in v3:
Update the commit message, and set the region size to the max
hardware-supported memory space 4G.

Changes in v2:
Add the Fixes tag, and rebase to latest imx/dt64 branch.

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index adcc0e1d3696..60bf0932c6f7 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1939,8 +1939,9 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c360000 0 0x10000>,
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
-			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
-				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
+			ranges = <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
+				 <0x82000000 0x0 0xe0000000 0x9 0xe0000000 0x0 0x10000000>,
+				 <0x81000000 0x0 0x00000000 0x9 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -2014,8 +2015,9 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3e0000 0 0x10000>,
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
-			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
-				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
+			ranges = <0x43000000 0xa 0x00000000 0xa 0x00000000 0x0 0xe0000000>,
+				 <0x82000000 0x0 0xe0000000 0xa 0xe0000000 0x0 0x10000000>,
+				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
-- 
2.37.1

