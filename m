Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26F740B0E2
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692093; cv=fail; b=cUgHqupmi9/x+wyDNyp2G4owz7emT0s4JanQQRwoMWqC3vaVKIw+VubFzLpQemJu8iqgn8pBFd9xd4kq/XH9SfLvP3UfJlKSdT5Bk1JalbgCywPmDU+1nE3XSQFkAH3tnBA7zMrinMeEY7w/rP+3cX5RjSaWM9Kki7C7H8r5pLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692093; c=relaxed/simple;
	bh=NrMqJsOgUvqTtjdFw2F912ElwEL1chtCGOjoPPAdQLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D6mFz3IW7iNgo59VRXB3+mBGwKNE9XabWKkwHlNs0uxsb4nId79IGx61E4c3EeC0rVWg9pgAQpK6medQjHorKSL/upf1oCsNydEux1UWl39ejp8kyV0T7Kj54cNG1IkQx+Vvp3QTf/3Ey8jXPPKWfxuWn7Vc/TTrP4m9zBQuqSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p0qXoynz; arc=fail smtp.client-ip=52.101.69.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p0qXoynz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSGuKkN+onMhld0vwiM6HHdUOnD97su0M03wQgmyvyOHwsOCvHrI0uexsyFxcO2HQH6RZlFllqtPQDvs4zqzHEDrR8zOdOv5DeIsnlaSxtYYY14TrIwQZ+aJyC7150sxURwfqCF0jlD+vu9V2eVMBTSCGfTuMgiVW6teNGND7fP26dPczpXfJgfS2cFfucRWgDKObcJnIvbdETvqx9YPTmaxExhS0/bxQnptoKb3Hak6GoSPIV2+e4C3lAxWSHHuTms2+0uGWwvOkr+3RqOmFiRDj+CC14A4HYA8DKte2Jq4XlBowbWlAnjewhJigOGtO+I9eE9eUQhGK3F0tNlWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YHfs9yWiZxo7TubBkw+D60OwWfNMpPSFEFhCfRsQjQ=;
 b=NRDwFI8AeLwQCc8psQDxqI3IoJaz+0bRRS0K4V7DpfvnnlJPqxoK1WKGHDCZ5e/a6Cv6BVdCeXl36eatwcbGb2bxNwxl9SkH4uNf3vJlFJDrMs4T9q/2ddazRCKUxfahs0WpreNANKsXaQQsc6XFoeeC1HuVuiDc6cwjs54N4AC38ISXAaufXXAD3uVknODnZd8MB/1dPw6v+yRYqyVjbKrSRCL8tmMlGlSucEzW8kVXkHX809REsuKxHzvFZHBjqpbkWptIWPBjZuHCnhh+rja7zhHxPmOmrIql9gDZmhdPbYY8iy3wmOVGsb7c4Y6uM0lIJ8EWGcfF34uFl0PFTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YHfs9yWiZxo7TubBkw+D60OwWfNMpPSFEFhCfRsQjQ=;
 b=p0qXoynzij9eVQ4bVQj8Z8K/4wOBivsBQoXUF88J9PnQ/Q6RxWpTlLQoUEtxA57y4IeI2ejpDvw/mUBgy7x/joGRGKtGvJ8WKhKgvIHZPbkATsXZPmAFWeQir2Gmon+EjgO7iAcx7DtYHrq3ua0rmhJYYlcx23OrLQYonc98opc0BqKyA8Mx7HYzEAFJHtkAWSRtR13yMe5PbsWM9Z5j6fQEEj0m5Y0ckSoLL4UPytZwpebGQlxN2iYLAGECXRIYJeOhGe0UvKy3xAoD856jU4bDcr/3aXZOOWM5hFnz6LDAExbjihbw+z9ruvd6hOJLy1AI8MA2FvoXWJdX6sWcCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:21:29 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:21:29 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/17] arm64: dts: imx94: Add clock and sound-dai-cells properties for MQS1
Date: Fri, 14 Aug 2026 16:20:12 +0900
Message-ID: <20260814072022.4064009-9-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::16) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c2bfaa-a406-47d7-c3d5-08def9d4a88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nI3vd6ar3QvzMfndoXXLOj8usE3J3QllxDGkAkFa76ZhfB8lt24jAmELVlvnq7drUqgSRUZfEOIEOypkzahBnya3TEZuYQQ/KFM1LUG9PmqXqOS47haIGkCgpCBtLO/TBHcWyhwBzdHzO+bVRqX0rI/f5leYncGjUpXTjNVE+GUi9xj4xy80Sbdsx2Wj8JdaqFGFUfN3mowu+Cgh/N3p1SPBY5xiuMTz22h8ZJ47QUpdF1zht5vIaYW5k+EhzGNbO22ZHoIkKL0Xd7W6SmZT0bT94y3Ue/mt7Vx/Rc5rzdQlfNJYPC0M3BPwQqzWUk6yBm10BZJbuk1Yh4HGXVzjpVCajD0NyqHxvFu7MIW2wi/UJO7Rw7LRjLl+Oe56TLJmB4ObfXpoVWat6iWYT6XW+cS/x1vOEpyRR4yN7VY7PA90ZazJOW3BZTdPI1Qu0aFokg7YM5+5TmKhIzNoDWXrc5w4O1eDo2j0PoJEZWuTFrigwuTV07+7lMkbs3AHNz0B8UDNfdKQIjzwc2etVpaRGbAKI4ZJO3miUEcxXVhl6TUAehDSyDE1SZOXJVKFoXUmKQWu5M3IP+JpeKZqfHQ+Jl1K+4/DdzngoB8+HlBnsv9WVl3JjHeA7bRkImhoOHl5raN+iKVNEae+jP6NQ/6AmyR1AkiotKKdygLK4VKX1Zs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xe/cM5DJ8uoqAcy2r5V9UrJDIjCA15j+0amhq7Xm05+CYC83Xv3HFoj/8h2J?=
 =?us-ascii?Q?60WKlFC21f7m4rUefipARXJJjO6+0dPaQgGk+bL0AqzuSjOqIls6MJjhY7Tz?=
 =?us-ascii?Q?B3MePWKAtkCTiafsQQWEHqkT+2imz0eD3HFyQyIUsPiF1i+ZwUmAzy44GzDe?=
 =?us-ascii?Q?fPVawwwJ+9lV7mqtev0UPc5K0WteLsaInsGDrSQZysXMcqYiii52fJw3LUiJ?=
 =?us-ascii?Q?nWYAcpG8oVDGKoKxn7rpJKYtAj3fi7im+FOYNfe4DWrOyMK0bQ3rNvNX4X0P?=
 =?us-ascii?Q?eoQoEm72VEi2AfdhRd9gyeI+tePKHo3MFOqYVSu6QVUzxGsOzUHWpNKOWnlN?=
 =?us-ascii?Q?Mk4iUs8TixsBeGZ3xnMO1XFUE7LobWkRGV71/n03oIe2/KecsiDTtiE4gZme?=
 =?us-ascii?Q?vmB+8Ywjuaz0TZv/dlB1I8VYdA3dgeCJPqA7VqBVAkVZVb+h14mLuE0OmWy1?=
 =?us-ascii?Q?1u5IcUDprFlsZCZ5amcosw/edCmTkfyscPVNC1NjF3a9ArpZG8XHMBloTtih?=
 =?us-ascii?Q?4fatPnuQ4W8RZMAwIHGXHakMeNbGPeEOkFaat4IjLIeqRWq55DjSJGt4bRVK?=
 =?us-ascii?Q?l2S6V4d2/o9t5eut1F8/AzPGQnhNo2sP+M4OEQtl7pd5Oye6XwZpG6gwoXjF?=
 =?us-ascii?Q?YeNMp9VeLKL6ynYYd7ddfUn/UF9UehfXGm2DP13jTqMTreEAQP1PbD7dVSBx?=
 =?us-ascii?Q?qv9e6KizYx8tUjrunfoe4T1alkSNv2W/yjmtDgOj/b4tUYdUs8+dsYq6R9Tl?=
 =?us-ascii?Q?41zl5AQbZ3Beh/GtEkYOrBWsOUJho6lJi5yQ7ugwr7CKii97jOP6TseqHk+e?=
 =?us-ascii?Q?wvj333Zf1Y4Gdb86YQPRds5btdEGbd+Q9pc61G6AGYQGZIOJDm2TSnpLFgoI?=
 =?us-ascii?Q?ewgAgViXLqETp1uo3SoNTq//hTj2ikrSE0nsmV8hiRP195cD4rsHI6mE981u?=
 =?us-ascii?Q?SCksMZwmU8ZAx+ArirEsw+7s7QSvvhi8U9kgQqXZyqDaM2Mgn6aEiC6WRzIc?=
 =?us-ascii?Q?6304BGEc67VOXy4UmVKAvwykitwNDUPMOIgSSy7YcTLlt3NOrnnPi0TpdfR5?=
 =?us-ascii?Q?XdGPb2A71rA+gE5dzY8l+DTUFjtfP47Q2Gav8G/0KOaedw/6iRglg0iT2jzd?=
 =?us-ascii?Q?zG5tY04vGjsUlbK6S1tN9WkdiF63jolwrrQB2SDYYfBzp0AJi2aUyXLT1dca?=
 =?us-ascii?Q?OQq4hCMuCJ3aHgnF7E1KODZD2Ak/MpEWhjxlkv8tD285RAwXipBdk66J+6xS?=
 =?us-ascii?Q?Fc+Oz/GcdVijqEKjYER4ODNug7wi90lfKjtHQoOS2UXRBbHLbK7AoNywAOdS?=
 =?us-ascii?Q?Qn1N12jak8E/VduLH3WfZcoOGaaAhblxpRnaVjWFbjY4FTOZLSiE3NU6jgoK?=
 =?us-ascii?Q?blKHy3GSPujzmxpmaXFI9nvQ2hkfQAGJzwc/w83ZdqpKxs9YCDij21Kjbj9b?=
 =?us-ascii?Q?n8ZIBf062UB9hQcgOOP0rV9RNsAWqKU5ikOHnvHnMVlyN9lQaJgQiuyoQw8G?=
 =?us-ascii?Q?dRjpX1NUKFCdu0pbOLx76LUH/+Krl7rikSVovu1Bf++GErztiAx4dxcBviXt?=
 =?us-ascii?Q?sM+bOEtphOjzaSn08CtFT7bKFX0X2rdVyr67I563vvLL+LEnKm7uS1Gfox2c?=
 =?us-ascii?Q?xFQ1M9Of+fPJuFm9f2bw0lyWjwGAvYZyV4Zaq8pPOK0WlxU98OlFVPI2pcSF?=
 =?us-ascii?Q?57aomuRbs6RfAeX2F7wPlzYLA27sGjzWlZzKRnQdNajJYedFWCjBvRuc08kf?=
 =?us-ascii?Q?uFhwspMYeZRgC+u4KN6vjKJhhLI/48iqdunGxA/YeP2Su0vn2TYy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c2bfaa-a406-47d7-c3d5-08def9d4a88a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:21:29.0629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4fkylePlQAOBm8GhylU6x0+/eXOsoGtJZ0tU7d5zEL/GnbKzfL/Yb2hbQEgFlEhXG8qrL7A6osb/5Lv0nxo3eGK0k77OgAzc018PvBfLyP9guK1dI/PH0AzTm3CLU08
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 MCLK input is driven from the respective SAI1 MCLK output, and
sound-dai-cells describes the node as an ASoC DAI provider. Both are
fixed SoC integration properties rather than board specific, so add them
here in the common dtsi instead of duplicating them in each board dts.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 34833e62bd79..a0d1922389d6 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -131,6 +131,9 @@ scmi_misc: protocol@84 {
 
 	mqs1: mqs1 {
 		compatible = "fsl,imx943-aonmix-mqs";
+		clocks = <&scmi_clk IMX94_CLK_SAI1>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
-- 
2.50.1

