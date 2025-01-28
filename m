Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8621E1A32
	for <imx@lists.linux.dev>; Tue, 28 Jan 2025 21:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738098991; cv=fail; b=N18XYul00YyIsuDhaTIyG/ZjxG1OQwsBeKxY0MEcZjEVBtn3JIBnDWewqw+FIE0yBoCf/ceFE0VcG0de299cs5+raNLoo1k83WcEcNEM33QFBigbnUcDB8XtkXduiiqSvnV6qEZrIDkXEP2injxi2iOokwKTbK6EX3bUTnsk8NU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738098991; c=relaxed/simple;
	bh=WlUA0+IGQSZC6+XWBP0RpSW1tnp7oTzgyZmi3AE7BcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ifyixEo0lQ2cA5cmOW/sDDZcJ1AaAQh4o75nucRU6vfp6uzngBKwqVSE5CGVQazhnzbRZDGhOi1UyPXRMbD/SQGc10m4bKqM64sZqPpWbLLSWAisk/LxF9H1cCxCkd0nPvPxaAQEHgkxAl5/0CWMs/Ib7gS6Bq+EKh3qjlgaqqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C8DLeJqQ; arc=fail smtp.client-ip=40.107.21.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C8DLeJqQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwF0Z+K0QHyUHwHAnuP9niO+3csg1Qcnzjlw7HMwD3LIyTZukqbgN4bQM1KgMEsCIFaThK2DBgaIanQeNV+aOMl7RLJSUuZOY3yntz9xbiKhA3gYuIolsrt7HnPxHIZUv7TMh2PfW0bbJdJJnX0l0+UmXEDcCk05C9Dd41q6/Hw1zgIesnK5GPugQ96lsj9RCF5LF/cg8GOT/eludzgsvHGB2NgHxoY2Q2UbOBFtxxJ2pGIwr+XcmORp+oVX0KPnc/JIRux6bqaBu74+mQsNbyT6ovnPUzf47D/KcuCvLy8OjTIoKueitTe6Q4lREJRZ2BddY7GbANh7Vyba/H9MHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6T9kWBNyBiClVHmQ2F3cGxKOXSNXvHqW8j4SgGl0GE=;
 b=EPawPmXpKWO6fWZS/qTeUoM5Nb4Kozj2nhq14m4yGhsV+ZJf77BI7Zp2euZVLbknDiJk78/TKrgxYemyYHh2QMvCSpsWP9hn4Zny7iuIh6O9a5U0qkbeskXiNsdr6K/pR4fjhKkSywYX4um3SSwnfqcxxLmIK7CUlBcw2gMBHyvZO5/a5SKtMGF1v95EqqcDlJgZB3bfuV/rnvakuhcpf1n1aIUIjuMDi9yqyfqa7syjwI0fC1YcyfgICwWY417tISUNZu3VkqoNet2gzNCMbHO+TquaBvC2Op8yfvFl4kJU7nkM5/USBUHAd/cai+V75YEqd3UfU05prLGe/6UgFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6T9kWBNyBiClVHmQ2F3cGxKOXSNXvHqW8j4SgGl0GE=;
 b=C8DLeJqQUAJFOP1IRge0ENZC18SEZ1CFVOorHFbd1yN+rIGYsEKDRp7epNXUGA0iil0JlxtoaNY8ryjBb+DCYsSq9UX7+qDZeg+M8gyL58CYpOOWp0ix0uSTtcvzgje2hbrLAxX05cKpluKe+cC9Z6w6AE6Go1KR+SZ9zeZDhbtjSywpDrSD0nZwdDb/gAbwQ0gaZxPD1YsfxKzQ8IrcE/wT+8XiYZvc7AD7n0jKH8IdofHHYP3/LCMXo+sD5qxK7+Oilp+k60gtN3HrwpliTsb3xJxpmQhJ0ur6dOwC1VPf0178mgZYO82mHlzfQ3SWUrH+9tdUBROnwy8gCgj9Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8490.eurprd04.prod.outlook.com (2603:10a6:102:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 21:16:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 21:16:28 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	hongxing.zhu@nxp.com
Subject: [PATCH 4/5] arm64: dts: imx95: add PCIe's msi-map and iommu-map property
Date: Tue, 28 Jan 2025 16:15:58 -0500
Message-Id: <20250128211559.1582598-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128211559.1582598-1-Frank.Li@nxp.com>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a8245c-13ca-48fc-279f-08dd3fe10789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Kxlc8dn0MmIDlhkGnkHgwk/v/Qpcg/1hFlKYd1Ym5YqUzqRG/YEUCCPwCYNg?=
 =?us-ascii?Q?mZTeNGzuPNd5Sf8dySNfcYvhAF58JVSO+YMFoagVf/yzg0lK0jB5z2BwUUWj?=
 =?us-ascii?Q?TqKyilbqN04GvL0sJKfdVoS3e6Kwa+wYo0BEAi8t4rM0biLHK2Yt/TmcqV/+?=
 =?us-ascii?Q?XqxnfcDmN1NAQSbrhbMHp5i4YS4cWyp2+ZPBMPM6YusvDOYfvi6Vfh+etlY2?=
 =?us-ascii?Q?CklysGStYaI7Xg423oCxNxf5BJFjsEx6MoofB9n9hhFe1vUiVCKLTybiG0zw?=
 =?us-ascii?Q?fWuGlxbLqrOfKJfhkMD0ZJJsNeRWvbLDfbxjQZOkMYl7hH939AJNs5nZQP+3?=
 =?us-ascii?Q?1JPhyvpgBrNkkzlkNEkFeNzDx+e698sC7HTTuAx9hcCfY/BXrvb6PyNnlz4C?=
 =?us-ascii?Q?rF1nuPw2Q8b8pD+5qMMT+IPu4wwRU9LaTkUSYpWmNhCuvwurQIBIlixntbkK?=
 =?us-ascii?Q?OtrM+mOedKmqNNZTZJ/f9R45cWo3YD4YhB7ekW0SdvOBKBPCGdE+CvthJLxu?=
 =?us-ascii?Q?M1cd6aT+dFYiLQmfMjjto8XRnEwCms3f4mwpRgGcP2l4FN2pZM8QsOGsiNO6?=
 =?us-ascii?Q?VOD7U4uhpljJqO/V11Fekw5iIqbOnA0ei6psHCerrKLPMteg+tslGB0GG+U1?=
 =?us-ascii?Q?9v04vAB88PPwma4Kxxauw6JxxlL/rZOuLhQlDNQ0w7Y4hgDPOM+Lv1uxKmOc?=
 =?us-ascii?Q?JnPSwBCnAcREsOtt1yPC/2VYmzHPYfReiJO3X+jxJJZf43urgk/3FtWU8wOg?=
 =?us-ascii?Q?sLFcEfb7yEpAd1m5IZgTWEuaNKrOUHs4gc5WW3vGwX99KmaHV8G+kR7lb0K3?=
 =?us-ascii?Q?KzBkIPvKD5yAOBYiZMa/vIEBmxN0B+GA76eXgMDJnZ3bDhkVVzqEEaruJqid?=
 =?us-ascii?Q?dygz3rDkXDQ79bOlvHE4EJKtk1hskgQQGwE0Byed5G2Ur7t6Bf0uFBCA/1ES?=
 =?us-ascii?Q?X4kInbLoS08xdyn/YRVq8jg/lZOfV+r0IS0ph7Rub32tGuXG4dIFJsGa04TX?=
 =?us-ascii?Q?W3Y/e4AAj6utfxS8VekuV8m3iXy9rpkKv3tb+ZYcyxqRuhkjKgtp/cSN9IZ1?=
 =?us-ascii?Q?TnhhQJlJ4SeoULpE93mOrLY0tKuWy/o6TFCmDyx6zKLUVD/fKlPVf+I5rsIq?=
 =?us-ascii?Q?FG8yMpLe1WEK9Cm3ZnZ/go8DEG05LqNqwREqaOh1AZXeEVajEfW/ufDJQXoZ?=
 =?us-ascii?Q?tTHTJt1EIgFIKGprFQLjYl69xN5kidzQovSbx+l51cg9ayxz8K1FMtXkxkup?=
 =?us-ascii?Q?TCfQxVpWeTGoM1THjOp/U2SyA2zt75WI2isLKEiFM3AD8DZWLVivUCqfBZ+D?=
 =?us-ascii?Q?FqDf1ZNyHBiEKnWecejEVh0zfs3pH72D3hqs6YuWw4q0UtZeqnDdyXnjC+6M?=
 =?us-ascii?Q?DPNJHXkTTSme73hXxUn1gVWBv6aEsBWLgZv4e4M89T+2WvO5lP2QSDcRkCP3?=
 =?us-ascii?Q?xHhtkB/rJhc9uOm2AsuVjQUIVoXWVccoPg7kJlG+F3GjO4cyrsMPIA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bYhnRj+HzbDw0gsAsQ1EAAHz3FZCoQk4TCQSL9aAyrWK4IJh+qScbyKydGFw?=
 =?us-ascii?Q?EB2ACX+2jVA7hw3dySptxpiQX6Il/1k67jpORM9Rj1HeHYBTa235Rnmd/qrI?=
 =?us-ascii?Q?rTsYAcIVnAtZfmcACO+R8jGQj91W+04PoPER0AQW7QHOO4uArg7rYjh2H23i?=
 =?us-ascii?Q?OFeRiqSCfIJaONYcI3iI7aei6sRXIvyQFEWmGB+xfR+wyY0zqQ89AJxnWy0q?=
 =?us-ascii?Q?u+C/oDYKEStwH9OaaqBiXgGILiAj9mcI75+THKMml843czIPuQUBdRANUixb?=
 =?us-ascii?Q?vDXVhEmHIS2vcqtxjZeGNmwM2KDPz/ONwNzcrbo3x58J6uWTtYXXYCp4s5bh?=
 =?us-ascii?Q?q2+nu+11I5FWSBf4MeNK7y9vWgGJ1LHKvIaIc7wyoRNAXeeFL10AmtK5vQeO?=
 =?us-ascii?Q?J9LsQnQC6rCeuV+FFv0ZFCf6JNf+tHDbIhjuc+GrwLM3+8DZRbZzxdh00Bfb?=
 =?us-ascii?Q?HqA5gyDTPhlt0c0MCNQHjWl1OfZuttze82W25NDDFNf1UZgGzWa5Jd/cB898?=
 =?us-ascii?Q?5McPNzRKF/dJecpPNc9iEJZoIjVmJsu4Hd6PSXX3VBUd47GL8uN2w1sLhSmA?=
 =?us-ascii?Q?pNprpwkDq5uiVWVK/IyBKUvahlJRsmYw17Brvkf7Tg+3lAocNrfTni0NOd/Z?=
 =?us-ascii?Q?QFQI6270qBrCxDCi/E+JXPsr/4x4GP6/3iZWBDO1zuSI2rlL9a7R7Cp5bge4?=
 =?us-ascii?Q?GYb4kF4AhGkIY57AbTThC9GsVYRJtMvRzAWiuECYsHph0e7RUqxMPuRj4Tfg?=
 =?us-ascii?Q?mDwr18V4VSdnFrD4Plg7fn5LxMlWMHtw29D1htKsW66i4j7h20S/DJbdvPHn?=
 =?us-ascii?Q?uO3ACoXI68oMj6x8Gg9zPAwWBP9B7wIz3TzZCyHJV0iZ4BVT3yvA5wF+egvj?=
 =?us-ascii?Q?Fn3//UIbP9Z/5RvTPQ/0YUA4BoeQy/UCpiydNXt+liX82U6pd2BMMbiaRvjt?=
 =?us-ascii?Q?5MtwNNNxxMRJhbpuw7M0fSVDidBjLxw9KgKNIJpve1p1tg6UGsugsy4Qbq4J?=
 =?us-ascii?Q?/op61ZUeI4KVMqMEyJOmLTcjqlbfbnorT1gUJ1d+0Ljzmww87P+n1/LxWvXk?=
 =?us-ascii?Q?t95JSRXpr93IdgyaTomeOAkf8r9JFUnedSR7b7IaNhRjYl94L+Vy0387BtDq?=
 =?us-ascii?Q?d83cy6QYnY6QdUsNBh4aRLQ8TIH1pKc7wkj+M6feahElkdPGZAA/ucX9kxAw?=
 =?us-ascii?Q?Ya74mgnSvzFqOSp6xony23PEc+HlqCPqs9Bh0U9T+JzgcxGIO58n+4AVpn9Y?=
 =?us-ascii?Q?88RGIp5QJ8BOP/WjOJFPJMXLZLLocl4/3WzSuZ3PlvPRdn6StWClDxr6ZsNV?=
 =?us-ascii?Q?kqslKODRyhMU4Zo7ECq+mHxRm+uwoERdT8GoOd3WyW/cfLw/5moEZGG+ECXP?=
 =?us-ascii?Q?XLUG4/D8f5rjnBqk/qPQY9xbIg2/iVYyzoVQmFWExIaEDP03/uYllvUzv9eA?=
 =?us-ascii?Q?qF3gJYrXtYFhz6xwSfRVoxp1TyCb2fr4HZ0B7v/L5NZAZyou7IewePuoyD5u?=
 =?us-ascii?Q?7j6d0m/QoI6+2ZAkEQpQx/BtUjRY/FnMcgjgG5eW3TmZjvJDrxY8vwBces5A?=
 =?us-ascii?Q?xkZ2TXmgfomLIiSOd4k=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a8245c-13ca-48fc-279f-08dd3fe10789
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 21:16:28.5119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2AJqVOsKWAMQBN/jjQDgIIHastlEE69srhO2ECFZRlguEAvMzoOrqk/55YLOfk8yjEiW4DCP1Bf1DS+6fss4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8490

Add PCIe's msi-map and iommu-map property because i.MX95 support smmu and
its.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 6b8470cb3461a..2cebeda43a52d 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1573,6 +1573,12 @@ pcie0: pcie@4c300000 {
 			assigned-clock-parents = <0>, <0>,
 						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
 			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			/* pcie0's Devid(BIT[7:6]) is 0x00, stream id(BIT[5:0]) is 0x10~0x17 */
+			msi-map = <0x0 &its 0x10 0x1>,
+				  <0x100 &its 0x11 0x7>;
+			iommu-map = <0x000 &smmu 0x10 0x1>,
+				    <0x100 &smmu 0x11 0x7>;
+			iommu-map-mask = <0x1ff>;
 			fsl,max-link-speed = <3>;
 			status = "disabled";
 		};
@@ -1640,6 +1646,14 @@ pcie1: pcie@4c380000 {
 			assigned-clock-parents = <0>, <0>,
 						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
 			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			/* pcie1's Devid(BIT[7:6]) is 0x10, stream id(BIT[5:0]) is 0x18~0x1f */
+			msi-map = <0x0 &its 0x98 0x1>,
+				  <0x100 &its 0x99 0x7>;
+			msi-map-mask = <0x1ff>;
+			/* smmu have not Devid(BIT[7:6]) */
+			iommu-map = <0x000 &smmu 0x18 0x1>,
+				    <0x100 &smmu 0x19 0x7>;
+			iommu-map-mask = <0x1ff>;
 			fsl,max-link-speed = <3>;
 			status = "disabled";
 		};
-- 
2.34.1

