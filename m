Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795705658;
	b=d07ZxVzfknqpyFFFWUJZnODggPtqDHMyVK9vIf9DdB24SVEGiTCSoGsan14ocpK2Gvm+
	 IOMjeaVEoX3nNQdqvUJhoe94cyBnGJEDiJ9oaB0Mf4BVJQQH3TcIId8oc8/bQyma5x82z
	 3HxjR/50SRft9HsjW0ALg0MPFeENy7ZgG2jGB5nVFXPSDUow/yud2uPmlIagI5ETRaCfm
	 KO1AmKVEjYbxVLl8F18gMi/RBSRA2SlC3DpfE7p/BpXnej79B0nR64CLoWbKFvwobd9lN
	 tjdYr02mUfpA9hWfePtF9ShjLGdVq+SNeoooCJBWCqzfTusZaG09oohDXCv8urGM3MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705658;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=H7j8A5eYPZcGq1NpLeYgO766mpNdhrzvGbpJuWA/G4I=;
	b=0PpXOvjA+q12TQcABZYhHCowRvtjofrDN2aZRuax/Pp/zhBJ6Etk7NzPydVEwYrAaAVu
	 6g9OSP9uYEqxjFJc46O61ctwScwRgjTlZIlj6YxCeyHbvy+pp0/ivXmuWRc2hpNjgEVKC
	 YWMYr3e3qnyktt5doavt0/6sac+S07OLMW7tsDcsLyU5u/GHeYd4hwFQ5ZtDqfpH883sc
	 0LCsvW0eDWYHstg21rGx0s3ZeUxZnz2+qDpb5hxg9gr/X37A0U0MmiHIPWMEr2rGVqGJ7
	 FVi1f+3u0ASR8am5FXBuXaF++kAPLMtAPm7C2WuSqtOLkF0rYH7MCFUSaBHVHyLgi9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=PP9VRgWM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.69
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB6B606A32A
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 15:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB6B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=PP9VRgWM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSau4slq6vFc6Ye4N7tEJnrU7mRWn/BfDDh5M/2SLfbretx2taa8OqBPph/h7jtcPb0GC5WBV5tU3DBlh7eUE34BV1938LBduOu3pYxr6xmJMhCpq2fOuj0iz+L9sjF0rMmO6qE+cZKrNr/59H1yAfWTePeuFcrJKrClVZAkbJ4bfIDN/vovqEE50KtJ2nAkU2Ed0S+TwnJuvH1f93yqX9aldSUzw9M0kp8bFjYfjmnzY14cflF0eergsAcLFBALJ3/TdGyrboUnQ+dLi81FQbGYX+XvZgYVFjGe3ZRgXrpLpDcM5Lh914IfIg2kOd9Il03ry71TE+qNk7S852tmfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7j8A5eYPZcGq1NpLeYgO766mpNdhrzvGbpJuWA/G4I=;
 b=D4ZNvTyg7UhGc1TOnOHB7IR43VbEO2Ep8savDsnSTNlGlQxZuu7FAh3od9qWW7lTrj61mXRPIToQIgBSy5+5A9mO3o3r8dD65nh6H3+1MJRVA8WzMpM+0BvYvaCtR5zXKAWOqBbAAkb+vEAFNc7S9PcwhXZVBusQIjwOIGCW677s5dLspIeMlN7l3o/JgiI1wKSrFz+0uxKSoD4+b6MGfAACpn/XuoD4k+aGPefkLcxARFrEo0DEoHdrZbpaZuNxubhapdtwFZk8k925G8NrZAtmCRd9uGmof9s1tlkrjQbuwtiX4NFn9CPIAre23K92sdOPwmLuEVRRyzFD+beGIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7j8A5eYPZcGq1NpLeYgO766mpNdhrzvGbpJuWA/G4I=;
 b=PP9VRgWMpH0LYAqR6LEK3078ycsvJn5KB47D8sYX8ltBGI7eCwaZ8jPa/fP3VW40nRkrR7mNIXXZ54CzDxd0V0dtHhw9t4Fy9UXeMJJIZ5vG6gdfrKTy2atqL6EWmzRiv4Z/SjL/1vVQf4hiqdSFX8TlzKs2KRef2Q+7tdJOmyZR0g0IEkFttuckbhx1nUqwOjOfxmX8qXADaRDCn9T3goPa/VzHMU7buLyTZe4/rOB3/ZKFhfLbiqzoe1DZLW1a/7l95CsME4+0UPT3pug3fYnhu1LcOgZ8Pdpm+b3Vdpv8HreI9aQY8njhp8rIcPoxa/ouIs+xBAOxrVwrG04UuA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by GVXPR04MB9851.eurprd04.prod.outlook.com
 (2603:10a6:150:118::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:07:30 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:07:29 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH 2/5] arm64: dts: ls1088a: describe the DCFG_DCSR space in the guts DT node
Date: Thu, 26 Nov 2026 17:06:29 +0200
Message-Id: <20261126150632.1560355-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
References: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::18) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|GVXPR04MB9851:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e5d818-a9f3-45d6-9862-08df4bcefd87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|7416014|376014|366016|18002099003|22082099003|3023799007|56012099006|11063799006|261102123227099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	0Gc6w1uEC2vtsohSu80v6Rlc2QGbj115PsuH5qR4FL50g3QrzFaXVTnHKLF7AmcRb6rb3LWQUV9xqHvsbnaytG4L+gCRrFqhNDBuWVus2Fmek2o33hyJi0tdZpiiVwm3aDEdoRG35ayShybHsc/6FsW5Wq7eF56CJIIXysL4C/kGH/rK7l52toJcu9FpN6O5UpE/lWGZ18DwFXfTOdN7BxW9nFWpDkuIPAJp0/pc+3ZN7xelhEq5Ivm22V+98/VIIoAtmv0Uh3Pe2pf/bfHZC7LiNCD+texDcqdRAkFoSrFqHGR9u+4HYyNoxjiUE5rhMXAsRC+oD0DBfc5cL/S1clvOQBBv9QWv2rzcyd9Q2IcgWCNDcLJfUmaXrxmiJctqGA4hUgTrom16zA5DAlammmkBzMkrYdU1fW73ej6l9ZcvQoTc0+ObXbFxRDUBCu85DUsnZR046SopzybFjEYmZ2xcq1kppjLQ4zqPPNeo2ZcXHXJ1poZj+mhguD/AgUXjzpkSMAhwiV8/r1Q5ix56WbTEI7gsl4S8iU6rKmoR1BCJVEyToIgOm0MH4jCafBVeUbVHKBgf/WWmjaSbw/Yox1CyuxoceIJf6WHqlqHdQh1KgcOl8EAajWwvnv8cygdhEsBd/nr4Ac2CPuqYTZvX6UKCRXO4roOAQO+fadefw38=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(7416014)(376014)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wXLn43kiZKUo9QfMymHVtHcXjQG7UGJxnz1loS2NTgnwgy5V9vsQ8ET3313p?=
 =?us-ascii?Q?+Dj3Lgq8zVE3br261LpKAi3d0MEt2Iz33DFn03OGt2x2wtdBTriNbGnSOHdx?=
 =?us-ascii?Q?TNkF2AwI09eZ7cXuRi9/aBl4sMHmJk6OxfmQQJUBcRi69tym7Q/5DufZaWjm?=
 =?us-ascii?Q?Dp4sy05Hu8OYbwI6ScOXjQxPqFvbFkWgL00lb/BqrpeIh7sNGTPvE91nhH05?=
 =?us-ascii?Q?5eWHFWg5OjZdpknUOU68RX6xNe+ZakWVBGpHOz5YBGgbjs7HOJZSyzOS8KVg?=
 =?us-ascii?Q?8BNmh8iXSL+FXgFhjRdhX2l3sD7BgnBo9n92BeuXpiil3v2KOph2KbsplzJo?=
 =?us-ascii?Q?dfr2DP/hnh5KB2YFMQmFzSl5j9VCwL5c9dvp8ie4Es9M5pfSlFKI3tI/Ohqd?=
 =?us-ascii?Q?zuXfVb0/sbBTTXKToGNjqYU02oFY3b9BrmOz3EwD7751wIVILylMScn7X2PP?=
 =?us-ascii?Q?G/QcFGSf6tjU0AXiqpTA9PVMTMw++vQhBmgpZzwmfAAA3tTeTy9nBjQy3AG6?=
 =?us-ascii?Q?LPlKZQE6CYPq3PfCjDNdZyw4t6gUbGGax7XxCOFkdOAfOcHRCKde9/BRbRxv?=
 =?us-ascii?Q?fSFGyPnk5pGMgxYESQOeiwCrT337q9N1NnZo/c6ZTi7Ned6c7OTtB0cyTYy9?=
 =?us-ascii?Q?9UOzYXcVSVm0xk8dCBugHFOz9lFV+Yi4np8UKx+aZi/QT9PvXV84+h1Uvegs?=
 =?us-ascii?Q?eJkTPJ3qhtrV7ap6PFDTmPFMMN7fMnPL61aVMCTPaLnhaTniaOjm3ldemLLB?=
 =?us-ascii?Q?b1ws3wsEev671q01lhc9CCzOd3xKnztL5yvlqe2hzqTdxddfzRIJjJxsI+pl?=
 =?us-ascii?Q?oRIw4joYnH4j3RD2rBU5PoYJF6vUPfFAXiQFyZ/kGGVJ3V84MWEyR5VbLMNR?=
 =?us-ascii?Q?LA3ZsCu/0gx7AU2IGsrancrUaE8a4VzV/9ZFMtNVdeDOyzu4IiDT5gsf9qUw?=
 =?us-ascii?Q?yrOEf9MBFUWzDsOkhEJ6mdUC1BhoQWC9B5HJqsR6Ryf7Yee5AOdbYwoLsBge?=
 =?us-ascii?Q?/4Xdbo5TMrLZq69o3cW0ppyYNJT7iFH+PJYvCnuar07Mo2VnoxhPLmAwB0Ym?=
 =?us-ascii?Q?9EgrY/5AkSgG+JDw/Dd9xdX0Ohzp25DyBA5kvLW/QhbLZU6t9rEFfntBBHd6?=
 =?us-ascii?Q?feTv5lXM7LYgnagVoeKCR8filiKv/WQ3GB0/nq6f/Gu77yZ/up1GGVuof31N?=
 =?us-ascii?Q?Ab5KMk6Xgnpg5r24yGOOKdMHRIWcsG9Bp+3k5ikWl7Mc+h93Xzb1HnR7rC00?=
 =?us-ascii?Q?SHAMIPpDuUdAiFEjvbaqlZEtj9MXp4AbD9eCku1KUbAuwrEP5rIMXOhYMUW8?=
 =?us-ascii?Q?QwYx+fBLrh2/H2cwpWQt6aziM8qdKUOxhM9K3YxjCGEuJblT7BZ9ml6p7HXt?=
 =?us-ascii?Q?plzZU7wiiqw/JZE5TlDl0KPh8vsSxAIGXcvihXhMreQXkGpQlD/tbp2QljK0?=
 =?us-ascii?Q?u50+ZD8XUBw0HFuZQC3KsEFEurTOHBqbhhRHpARjsjWlvVfkBC3eMFjjKK+r?=
 =?us-ascii?Q?PIY382vlkSN8uw2SP25/F54Zro7YUuC/bDMIEUcN0MWfVPXNSqMgt8p4/wm4?=
 =?us-ascii?Q?B75pmSSolyk96wRiV0lYPiaBc2kViY2TzemUw9MOV2OD8ISM4RS1RESPbo8a?=
 =?us-ascii?Q?aCx7a2r1ILOnxQkhR2IXz4r+VOhziKkQnik54m6M03KbUNXTCfPez76z6M1k?=
 =?us-ascii?Q?+nZiXsvBJG9w5t+4RvgwevfKTGsTm5G4KYOglh0fxcWSXlJzNGKrqR7kNnbU?=
 =?us-ascii?Q?fliFgJax+w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e5d818-a9f3-45d6-9862-08df4bcefd87
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:07:29.9383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwuI/peo0klBY5sZHhYUP4X0tdAVYkBhnpFWoa7/Bh+g/Q/nlogGFN2w7v4Orcf5NekrQBFkITSSV0aBITD+2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9851

Now that the guts driver supports RCW override through the DCFG_DCSR
register space, describe it in the DT node for the LS1088A SoC.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index e02f34329988..a0ea76a0be86 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -230,7 +230,9 @@ clockgen: clocking@1300000 {
 
 		dcfg: dcfg@1e00000 {
 			compatible = "fsl,ls1088a-dcfg", "syscon";
-			reg = <0x0 0x1e00000 0x0 0x10000>;
+			reg = <0x0 0x1e00000 0x0 0x10000>,
+			      <0x7 0x00100000 0x0 0x10000>;
+			reg-names = "dcfg_ccsr", "dcfg_dcsr";
 			little-endian;
 		};
 
-- 
2.25.1

