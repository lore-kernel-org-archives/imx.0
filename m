Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011071.outbound.protection.outlook.com [40.107.130.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE8525228D
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 02:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780540522; cv=fail; b=AxcG/5o47M7YbqbR8GI1VPmGLDuEHuvAK3jTdmRyilpZOFUNdymtRf4Kcku61fDgar0O+/34MtAnCoMlZZr0nXkCz918+ZsK2I7qO6sK2na7Nd7go00Q4fmDtFssmpOSp/h07A83d0tiE3U8SpnYkNKburxPxtcgiIaVMpQnkgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780540522; c=relaxed/simple;
	bh=ZDdehxS/Qm3SydC7w+J2jglL8jYvfHeSGSTmRzjurcE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uZUtU1tP0wLXOe+wT5TLHJf5cmhtQ/ed4nW6xgQlvxrB+IjDcKc82CV8AxUa1oCKRMmb0rAwcWgvZurn0262yp9w8V38mtDhqoD8CWXnPmhJ5eVBUm8LYQuide9U9z+p6LkUXC/mRmubzb6OxUCsvc/z/qWKi8YQEDWMp6gbw3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nSfcmF6C; arc=fail smtp.client-ip=40.107.130.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nSfcmF6C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytutnSTyu2L8GF3RyZkBuYt+ZZkr7DZuiU5fUc83vH4v1lPKE7vWt/TTqoPNg15/jUFEuq4VFLnP2SPVIvyplahAKzUFwrTec76O0s+cUz9xNzYnuJaMsQe3ojfNJewZFZ5suBSSbSqvth72UrPGPBVZld7C68ALIQc3th6KYr7dB1gB9YYvVUt4twl3xxcPXLMgx3E21qkH+Pv87tYDEVsQMN1VWEiAmMAqejkqhAqNyli0Q5USeqs96w4JctRy+l22RPD3jFHAzCyBqOZCZO7bzRKyEoo68I8Vvr1kM48NlJqCdwoW97f+8mXHP+dnY4S+vSAsA8G2vGjocWwB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qL5aaAzMOWVK8k4mHm0l8wS09cUWe6yiYUxb+iqINTk=;
 b=giDvezEMZj0CXoTc2WOc/3IexRR1KuLXddTXpfkXCwvbSlsZ7+rTipAREnwGKZlzg3O1q1BwWwNpelY6sttqcGcPiDMi4V9Km8ib5q68bS8Rm7bDhfN1WforK8Z/t485qQS+yZTcRUtECWMzT9JkLL+4NeHJ1TTk4R1m8OaS29fpP8rwYAP1XyYIWr8xGQHNYoOKIbp8uXvY/lcqjW7WEiwiZ5qaUSvj1QKHKWK04FET7RrOZZAMwqWIbHJz5UqplIRVjTFIJIhH9m7AjUApyANOfggiEXhRCRk3fkfp0PWOLQixDRu0tQR4Yyze+ndoFnNeR1D75sgQbwyaDyXADQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qL5aaAzMOWVK8k4mHm0l8wS09cUWe6yiYUxb+iqINTk=;
 b=nSfcmF6CYQIpOAIgGGK0KP1YDg+X0uEkPvgzPGL0Or5fbzJlrvbTtr2hntrS9NaRq7qYO1iNIusLME8T3YrNiynOgP9Y2z5Ls0Oqu1KFwQPUI0b8G+H0XMp9Hex//y0fFvgiE38q8/Q6Uao04N7IQWyDj/BZTiKA5ZX+q/7+ir6++xFh7gv9v2ghWgLka7VkqYmH2pbe2/Jt2iZst0snbxog4DzDy2vFvoF93WUHqfJqbTwVSvVORpXZMvf0vboAFVajIXJZVzTLXgJoVijoC8zNilwBRwG5B6A5Raztm2mBxyd51L72pWIC3t27YGxRehT6g3T6zORdkAio0so1iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by DB8PR04MB7052.eurprd04.prod.outlook.com (2603:10a6:10:12d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 02:35:16 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:35:16 +0000
From: hongxing.zhu@oss.nxp.com
To: sherry.sun@nxp.com,
	robh@kernel.org,
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
Subject: [PATCH v1 1/2] arm64: dts: imx94: Correct PCIe outbound address space configuration
Date: Thu,  4 Jun 2026 10:38:20 +0800
Message-Id: <20260604023821.134372-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|DB8PR04MB7052:EE_
X-MS-Office365-Filtering-Correlation-Id: fe20f334-f504-4863-cad2-08dec1e1e997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oehGEJyiqvz0e9f1XCnH8fXuGZCDCHmqcyym4gn2iqS/8Bh3TO61EnuJb0G8T+Y0zyw76PQOU6y7fi2ee5VgcZF0Lk6BErw8VCfVlMBQhJUjc1kPT75mvTFUV5fb32g4oaY/Iymp9A/QrmN3v9HpnZfl5ilZ+dOn3jzSLHRI2i0xsBsz/S3J+4M5NE+C/zEQoSwM7Eaw3GH8r1/JT/wO6LS6RTv9pipDPueB9L7bhR0auJC+JkXUjnJu7/RJhWpip1y4Ek+1TalOvKuurk4QW6KKSmAbIfuKKFwUZv4tIvSCEPQuex5aM0Xb4zLcy646aVF74B3rZnLk0SEEkwJx6G1DOImT61e5i+jqpCKp53cP7q2nZGz2+23eIzWW5FxCwrNJ8+iMSjaKvx4XcxzZc7I1ZxTY5ZVph3ex7ZtTALT8XKo/cH3zEXp5p3PIas+l02+h9019loHAWFO3CzUwQpvEEoxpvSUu1XI1NRpf51QvfXT3x3mW7vNLULVFhq0YB4PL9WG81czLegQ1NI06BO7wnMsv81TJqecTJsXMMaudTyysqiJVIO8bpMQLqrX2wpI1RDOMP7IQ8bu6+imVrVhAvY7tRibSN4NiSMACyJ8cmqJlt1DHRXeVXalrC9SX+cT+UyWoXLfYJoJpkDU4NkCRhybt4dwvmJHCA8+nHuoInO7IKz/Efrr8e7Hwh0TI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8JAHaXlX7ule8V7dWKmW9rUcQYuN8UQGO8Y/GuGBOh5YhOjFrUnS0KWqKL6Y?=
 =?us-ascii?Q?IEOLpZxvWOjEkerukQWGQh0uQ/u/WwcGpLv6+thS2v+Oyklz9FG/n75NVQCy?=
 =?us-ascii?Q?IvsUeq0Qi6iY/nTpRB+InHNIsnOJMp+cL92hIxFTA5RXrXFzZLK/IWEnsIkq?=
 =?us-ascii?Q?Oa/dYfQoqURIUV3fo0K6p+VTtOYlwGK85OJtENFzbOHe1Jg/OTcNZR4LRF6E?=
 =?us-ascii?Q?QyNVozq01b9EEEuv8zBNUOH3eu2HnsML5GfqADhBmcW7Bg4hzbTvwXON2Yzn?=
 =?us-ascii?Q?OZRY+bJFsCPZ3WYdaOsSfIRexrYTnDaQM80fRxZamse7HTTNLw4pcqQtHs1U?=
 =?us-ascii?Q?Ja8kyHTvZu37gSteE0f2j5pEWIpvUXinXfJV1rqPmbqYSPnnn9Bmi38zUsM6?=
 =?us-ascii?Q?kPLONgn4ezxB6JWfBJhkOSux9B1m5dCl8jvDjIud/VEUp6XEuQHxU8tNgZ00?=
 =?us-ascii?Q?0G1o0sQqb9lLOLlgocYD8PgHCVyrlBfh5STuF8mVhczy+UFBrhTj9EiXkEBV?=
 =?us-ascii?Q?og3g6396t5zu4dAzQ11pACGVK8BkciYNoN8JJfs3vFDMT/Rn8STjJ7zVrtXp?=
 =?us-ascii?Q?7QNQTEvhwG4T0Rh7k0Aora/O0OhZR75Z3420yzbJmKDFmwtw/gBDe9R/RA90?=
 =?us-ascii?Q?zPyqa6Q2N6u2w5roeGqxmgmDy3fQms1lXk/kL5yl7LZzJ9An1fZLWpLEpiQf?=
 =?us-ascii?Q?mXukBBauR7ENoEh0e6tlcZHbd1SzgIP5PuQcZXpWFMFU1fNtXd9rFo+wJiYW?=
 =?us-ascii?Q?B3KonGNCY1fAYjvZ+yemz1gTr7Rt6qr7fhOqNywuet3I/ZRRFMnGf9bG8/mn?=
 =?us-ascii?Q?WXmEgwl3zY1toHneLwB+VJsS+WbYRB41jfNZE1UVMzTn9a98r+LDITpDmvIq?=
 =?us-ascii?Q?q0VXNp5RlCza+QEVw4zj6l3Om6GVIt+J/vD1L5HOeIPmXfZBey+ceTFfj8sO?=
 =?us-ascii?Q?YTWt20fY0xef7WqG5LakDoQ+MMPGeP9//557xpNiHktwf6eO7F8szKYar/jl?=
 =?us-ascii?Q?U3LXtWqNd2wxEgPnImml7Z/LPwtLHID0I3JchXGAvbmCoSViItJqjK+D16JN?=
 =?us-ascii?Q?On7A/6tz/1WnS+NDXszOxtUuUOKV7NLPaw4RiUVPkC9Oi6qLEEMNv73B6xcS?=
 =?us-ascii?Q?Ch0aoIwdbjlY38FQzXt5DLUFg0t02eKHM5b4B3YADJoz1DsPggmUeW++WmoW?=
 =?us-ascii?Q?Tpi5FLCrgYm7wSrFKMnfXaMZgxWIZITx4sHbCwjRmV0HlI/OcUZEnY7UtlZ9?=
 =?us-ascii?Q?byHzflNsbucIy7jFvFrgwZTDWgxd74WWDWFD8jerukEqxDgETRWTvPtmUkeH?=
 =?us-ascii?Q?ywXMzV2n8M2Prcn999Ys1PTD8qjsloxlXV+/cXFh2ZNM1fH58p0UvQoI+wY+?=
 =?us-ascii?Q?ND5v25DXIfFgrvY8M3iG7wAYrbTKba7OZsOXg6SaRQOn+7FeJcDUIlSY4qJW?=
 =?us-ascii?Q?EOGJ72oQydGqsuqrml4HPXFBB4FwcvFZDQDNrD+xXRyMHxFnZ8gH8LoDk9rj?=
 =?us-ascii?Q?Ilxtb/2HmxZgweVO1VZ2XTXiGtmocRxexP7NtpgOI7Gcz9rCMZcao+nI5qKA?=
 =?us-ascii?Q?ke9wI6/bGw3c2Uwb2DssWUPcYsdGFn8B33IZtjSRH2ZmYD2jiC4yPDCsKGbE?=
 =?us-ascii?Q?W8Z5NdIPYezh3+cBRks9vdPPjzrpWc3VBqSvRhiJlziCDsdALQoOUnHMn59z?=
 =?us-ascii?Q?p6gw68A5ccZSFxBb3flfUV+jl8Pa90mpuX0mO2v7UcoU40V0nEaZY0oXAhHc?=
 =?us-ascii?Q?ZwbjyVFpZDXW1gNpJqv10V7/C82onerGSQ7CSKQKn/bQsZAs7wVA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe20f334-f504-4863-cad2-08dec1e1e997
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:35:16.4977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBqfg9tdRHnMD5HYHkvQ+atpGnQ0/5eod9FxsdxjRKyqEK66A9G/ljFp/m4Krqj6oVvh/KxcV1nql+bi/XEkJbvC3Sz7DqHrCUH28o3qJfRWe6WnBbm/paH5yZNTiuQy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7052

From: Richard Zhu <hongxing.zhu@nxp.com>

Fix the PCIe outbound memory ranges for both pcie0 controllers on i.MX94.

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

Fixes: 8cd439f17758 ("arm64: dts: imx94: Add pcie0 and pcie0-ep supports")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
Since the correction of i.MX95 PCIe had been landed. Add same changes
for i.MX94 PCIe0.
[1] https://lkml.org/lkml/2026/5/20/427

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index a6cb5a6e848b3..1f9035e6cf159 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1374,8 +1374,9 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c360000 0 0x10000>,
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
-			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
-				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x80000000>;
+			ranges = <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
+				 <0x82000000 0x0 0xe0000000 0x9 0xe0000000 0x0 0x10000000>,
+				 <0x81000000 0x0 0x00000000 0x9 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
-- 
2.34.1

