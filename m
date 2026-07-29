Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B588540EBB2
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317732; cv=fail; b=Eruo1GpHz+TrGf9vJC8r7W91umOnpDq2q+Q5rp8tlxZjjncgA51Pozevlb5yNswtWJpysJ7q2x+6iQPLiMOrfOqPGd7ckRXesjnfoqL8nIuhU+NMArULG0Z7FVYJKoAtIPTPX1VXA3fVG2CiGz4J74HLxZCHX6KsZoylT+pTSJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317732; c=relaxed/simple;
	bh=98+YkJvCLblFi2xdKVFIEjtlZmNkGq3BcUOZYOg6kxo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pJ8Di+v/JslSJdi0phrt7CQ/f+cnGzoRCU4kVpR1/QHbtdiuQ4PNxY60aDnaP+VPRYa2dlWB/LVcAAQRF4IfpQoopaGsYAFH9uVYs/dGPQQg47b4R3IwfjrUpYWtzBdqNuXcL4epApBLBShs3QmQv/Wb6R538xzO1El6tDqaw9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CMJADkop; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CMJADkop"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E50RKM/+NNaH2ZCj6xcFUsxw3UuYY0cycqTuLcBKTClnH4uoHKNriEgRxt7i6+Nlbnuj3IqALPB9zctD3V/MukKYxgBPOwZLIpAVlcEJulyzH7ZH2yv2K+HWWVZo3ZxzvgmSncN+BIwDPDS73PUUx8xPHxVOXxp/eYMK0itSKPitLoFv3kDRjHTb0LoWo87wXXf7d3nlB3igyD8JtEHEdi4wTnDbZ1t1xy5S+pBj0tThua0dxWPGkJyHnfNRBBmLskEUYJiPiTu2NkBt8iIExx+/HGz6cb3FfOFoIPdOEKvQbcdvzMGTC5VbldBdrqXjwRzsfitQg8D6b/5wn/nsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsPfv+xlC87+GJPssFF7iI74S8Cs8Iv4KgtryWVmGaI=;
 b=WRR3w9H+UZUrpCGJRTUym5tjpmHyfG+k6VMG/6s7cAbMumUqGoS89IS6+Gf79Nr6MtsHLZnOnOYsZHqOCUxNKtFm7ff9QSILOepx0M2YqXrfOFjBa19UBdMgNY3SN7CxpBA+228VPMwA6yA4FtcoFw4TsstIHJ42fgYhiXowHFkGfIp5PyKnx2Rq4CVfX0MHwyYHDHneH68DwWB884fbvcz6XD+YyY5WssDGE5qYsgn7JK/lmA9V5howsb0UL2/8Zc5Z7WVt6zqZSSwm3pOZjCfZ7ascT57AzFi/wtWl7aFwdUwGXfQo+Q7uPAagY6H9LYRlPa5bMsiiHNahVXPkrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsPfv+xlC87+GJPssFF7iI74S8Cs8Iv4KgtryWVmGaI=;
 b=CMJADkop1GWWNvyqCIPjqQm35A+Pn6gpi+WNQUvGJ4u2rS+9ezd3IIARKdyEmiejm9S2Ce8S3+MNNCJx9m96JuBXAwMQ459hOX9rDPUhZdJf45FZNA8w4hQQZwtVpR6tlQlbFAMhYhFTEgbq0L9ak+tn9sSiOgqB+P/102x9eQKYB8LKvRPThdDuBKxWFm7GLOIyDML4I49+jgvNi8ERsj3n/TZnXtjYNXzy+GYqBYHPFEhWhiswq5XLHLi3gwfTfb226yzXzqUk6K+lwZMaOhaTs7EVqzAScUjvpqAhFfXcN2OOHc/Val+4r5ZP1s0mOAc/k5iFbY4/zvnBwFcfFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:35:27 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 09:35:27 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Wed, 29 Jul 2026 17:36:27 +0800
Subject: [PATCH 1/3] arm64: dts: imx91: Override dpi_bridge's compatible
 string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx91-9x9-qsb-panel-v1-1-4d22fac95e24@nxp.com>
References: <20260729-imx91-9x9-qsb-panel-v1-0-4d22fac95e24@nxp.com>
In-Reply-To: <20260729-imx91-9x9-qsb-panel-v1-0-4d22fac95e24@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA0PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::6) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|MMZPR04MB400504:EE_
X-MS-Office365-Filtering-Correlation-Id: bae2d9a4-700c-4fd3-b1ad-08deed54b91c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jHb9AeM4Okp2WYvJIuR5p/nQBb7cT+VGXqEnUnBGWPkNbBrjo1Dai2dICSaGwx8j8BqafN97fLdSk0gQjK3oVHBSv7kZYsGItbxS7iPmvNc+KVYHGzaRnjZUOLkzJa/pDkyAg4aY120W5OtyVDsNQK1Bs3L1fhf+SzgMCEvxLnB/xMQ+YcKLFwoNVxB2zKx0nC4SjzLtzAaFOmkVM4LozsSjnxGDYga1aaNq04kSW4d1FaO+Qw5cY02nIIrH/k0Kr3IKZvycbeZ7x7rilg4+GqQIwkvFqF67iPxv9XoM5P8EsfhFAjhwo65B9a6U2osN6iVheHW8zD70Lhl5yrBrKnM3HLajyt3fy+YVfNvTcb5uoBdIHk32Yr//WphnDD//56osk1LiYCygzhCf1ZoU8ez52FQuaFF8gjkbllM0bvx3rmjC1wuIzclWvdW/B9YlyXcM8ZBsCc4X2Aa1sEI9Nq+MJqoCj+iy3ejtUgBXOfXCg6fAL0Bye+Jm62nPjfARyD7TNAipnAxo3vOh4rgepAOOeL9FE8Piy5WacDbxtdevua6LY4W1zqnF+ryHKN94RbXRldBjQnV0VUXoAOjYdU15DHdzHRsyR9LJQEVR5yi36IaQEPtLXzVre0iEgLoE0jL56+nKx1tx+f8OELuy1lgzLL6FXVY+Nly/TQ6mHok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eldKRHVRSnZGeW40SzIvRU9QY1JYeXhjOERCUmdiK3k5ditUb2xrUVREMDZD?=
 =?utf-8?B?RyttbThFaEV3bFdmMFlKRmJMZWdKd21aZ2RxYTc1SmVPSzZtaW5KdlJaeW5t?=
 =?utf-8?B?bXU5NjNGekhFT3BmRlF3SWpIR2IrdXRvS0JSMWV0TGJVMktRdVVyZTczZ2RG?=
 =?utf-8?B?YWdyUzduMWxNN0JpczgzS1phclZaNE0wN2FtL0pwb0NLM1ZlZ0h3blhZY0l6?=
 =?utf-8?B?Q3V2bEwxbmM1MmlEUVIwajdiSlNUYndJa2UvaXVOZHh0YXlzcmR0dzBTL09D?=
 =?utf-8?B?VXY1ZWVZcWRWdHpTYWNHZThQODVCMlJORlU1eDNrRUtMVTljZEtHdDQxK1ZH?=
 =?utf-8?B?OGFuRFgxcGRha25xYlNhd2RLcU9FMVpJZGpJNGJLaHczMENQSjBEM0ZrbEY5?=
 =?utf-8?B?dDJqdytJWlMzNFhqWFMrdEJVMGppOWl0NXVnRVZWOHRZMVV5NkpWVmFsQ3Nr?=
 =?utf-8?B?QmhQNTV5RXdJOVZPTUlHWXZIMkY3TmI1NG1lYVNXSzZxNkV5ekhsZzR2b1JH?=
 =?utf-8?B?S3V6RTR2VitCMkpGQ1U5ak80M2ZkbDhKRGN4MHp0ZjViRDRwSnBMZUJLaWdy?=
 =?utf-8?B?Wm5hczdQditleDkyMjZZYVdXN0t4OGMwakFleGZlNk00MEJsVzJLNDVITCty?=
 =?utf-8?B?enIvS1BvVzlVMVhaL2l4WE1UVTFYSEN5dTh4dkdsUlQ4VmlYcTVqK2tXRUFJ?=
 =?utf-8?B?ZklFZWxYUFplVHFoc1dHZzFrUCszcWJ3WmVXanNvcmFsRGhlMzlXcGN2cU5s?=
 =?utf-8?B?WGxhQzI4TEdQQkNTVXdhNmVWNzZkTE1PVk1QVFI5LzN3OENabncrRlBROG9w?=
 =?utf-8?B?ZWNDZ1ZVUjA0bTdrL3YzZ3hSRjI5Q1NNOEZPazJlaWdFbmlmMExIV2hUWWNM?=
 =?utf-8?B?WEg0WFZDSk5qNmxURmN6YTNML1BGQkxvQXJNUUQ5eHFEZG56N2NDbGQ3bEg2?=
 =?utf-8?B?OUE3Rk9lNEZnWWFYRDBjS01lZ3hSUjNtVzVQMzJCTlNnZ1V5N0dVVVJ5b1Ny?=
 =?utf-8?B?RTVVZEdqaE1oTk9vd3hoT2pMbUdnQ3pMUW1xNnhZdlJ6K09CcC9YcXFCRlY5?=
 =?utf-8?B?a2g4MVRRaklBR0NwZGprMHJVNEhWZGZqaW95SW9oQUxyY1pnbENUK1hOSGNT?=
 =?utf-8?B?RVdRcFNNdHNLL0dQL1RsRVVGOEIwQW4xeElNb3EzTzczcGp1eXhRNkJDVXBX?=
 =?utf-8?B?a2NvR3FaT2U5QU8wK3llOUJ1UFhkenRzdWRxeWsxWE5NYXVUbTJVbjRoN1cr?=
 =?utf-8?B?L015Z1EvSFo1SmdVcS9vU3ZoSlhBQzNFSTR0dERwQldhTGYxQjlkTitwWUVi?=
 =?utf-8?B?RFhhOXNxMGdTcVBpL2hZUGtzLzBWZGRwREx4NmVERzNNWkp5QllIY2ZEaGdU?=
 =?utf-8?B?SzRhVXo1S0lHWGNqK1ZkY1dxVEVXaksySTJoRmhFaDZ0Y2hVZVFZbHoyRWdN?=
 =?utf-8?B?eGJxdS9QOEdpVURrLy95VVkwTTlGOHYwS25Od0VNVmhvRS9HdWlzeU9HOHZx?=
 =?utf-8?B?YUxmZGcxNnVLTFJCdVVPcmpzeEJObW5lOWtkbjRUSjhvd3J1Y0thbnk0NWMy?=
 =?utf-8?B?b2RVVEdNWWorTkZkVE1MaFV4OUhqNEZCcmx0NUwzZ3Jva0w3aFVXa0g5YnVH?=
 =?utf-8?B?VG94ZTg4alpXYTMyTFdYRHZMUTdnM3BCNi9MVHNwdEdzdXFtMkZKRXhoVlEv?=
 =?utf-8?B?YlJTcEV2aWlEc0ZiZG8za3BzY0lPazExcEhSemR0K296UHFNWUg0MjZoZ28x?=
 =?utf-8?B?dDZ3MzQ5RWVzSXlSWE5BSW9JMHNKR0k4SWVTSjJRYWprdDlWZEQ5OWx4dEd2?=
 =?utf-8?B?TmFZa3ZpY1F2d0R5QmtRYURmN3FNUnp1TUZMTTRpcGRKMzk4bDlycFJ2SG03?=
 =?utf-8?B?WTJBamQrQXowSytmKzN0S3U1dTUyOFJlSjJ4Y2huc2xudUtCZVJWRXo1TTJw?=
 =?utf-8?B?L29xY2p6RC95MmhXWEJ5a2RoRGxmaEowbmtrK055MnRUeXFORFM0bGlNV3or?=
 =?utf-8?B?dXZoNkJCWHZBWDJoVzIzNy9FcjV5TWxLSG93UlhsSmx5eU9nUko4QlNkaGUw?=
 =?utf-8?B?U0ZVUFBnQUhEMDFYZCtPY0kyZWJMNDNGWG9BSlIwSHhRRGxRclYvOTNPMEJU?=
 =?utf-8?B?RzFQZUR2d2RIbVpUSmhwM01tWGozaytUZTJlMnBrNi9Id0Q5a0FsT2xld2tq?=
 =?utf-8?B?TUdIUWZVLzVkRURHTXlYZEp5bEU1SnNOSWk1amptZms4V0QyR0hucTQ4cGZm?=
 =?utf-8?B?bEw1bnR2ZHNqbjZ4VDZWRU1LY0J4YktaUGpleFI1czVVOVNVRUNGZitRem5S?=
 =?utf-8?B?SkZqNU5nQWFPYytud2hUT0tTQnh2alZRTmVHNFBxY3dzcU5CNHp6Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae2d9a4-700c-4fd3-b1ad-08deed54b91c
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:35:27.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KYF0b496oui/6h2HiILjY84NcyL90WwL4poEQ0UZFCckBjk2xzxYjbl2xwwd7L9qiibwGNSjl+bk6K45kYi+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB400504

i.MX91 DPI bridge has a dedicated compatible string "nxp,imx91-pdfc",
use it by overriding the original one "nxp,imx93-pdfc" in
imx91_93_common.dtsi.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
index d63569b39bbc..df2532835bb8 100644
--- a/arch/arm64/boot/dts/freescale/imx91.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
@@ -62,6 +62,10 @@ &ddr_pmu {
 	compatible = "fsl,imx91-ddr-pmu", "fsl,imx93-ddr-pmu";
 };
 
+&dpi_bridge {
+	compatible = "nxp,imx91-pdfc";
+};
+
 &eqos {
 	clocks = <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
 		 <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,

-- 
2.43.0

