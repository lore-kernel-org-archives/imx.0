Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9592640A92B
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692116; cv=fail; b=uBuxSfiQRsjUJpDLisecQbj/4wK9OJM2LJf/0s+98s+94ztDEk1ernf/iliuvsoKTsEylI2iPR1zZneeMBeeMkeX1CIhGVs7G158kuQS60L245TgkKaTtIE+7lIMUCub+3bbXIH7DjuXBeGAeZMQ7tjoOM1LTGcPx+WixbcmnOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692116; c=relaxed/simple;
	bh=9sQR5JnghbkmZPgDURM5Qg7szg4k6DgO8IIgzJhj9zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=atFJaLdvlYwgjCj3mgSQ09TeBtaSlcGAVy5ZLJyp4r+uWA6HwwuqnAVqckMoMp6EIuwT+jtTgVXJ4OILBJOh5fa6f8dzPCj8Knx5lB1ALTaDyrPZXQpajX/6kY0VCEl1Sjvn0SVfka1mqR+5vaFtxKf3ay8G+WmtCoLoMSTFje0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Dquwfgtk; arc=fail smtp.client-ip=40.107.159.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Dquwfgtk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSClz1shqr62jv/mu8ec69fr5DPvazVTrigzjn49FMyFAeqTbPjfmJ35kz46qC2yOzOrzChkDyPHJr+P6c5mQVyqXEmE0PltWmQEbCgE9K99dVMXuXM0mMb4F47BT+qqVonHPHskDEbiPOYAdZE+UoKclskMOBW1NrZNb4WCkH5sAD4DgqXW0QGG8SS57yfz5BSwREcoYqE0aSI8myjCk1fjRc9zJQhYK0DXP1mLxhpwwyNWwmrz9gh0c2yRO+OaWdfs/OG7Zo8QE2y2s8lkILMsU0QIP6qCWpaN48AywMnfAvKyC5yS+TU15Z0whx16Fzoa1ncxkxjsRChe6H/MUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3mGJ+j9ubShg5mg1kZSjaQMFHH6RfcKxAl9eubIFj4=;
 b=gcKBFTmRx/CM6RzImCb0pw91vdcdt9ozrq89aCECpvLpzmB0X37vCIGn+Q85nJpMQqr3aE6eCs+vXETrSUs6ySMRzcO3vTFDAyS1IsIoAT3PGPg0y0ZZSJbbc8N7vB3xJO2B2WJXHFsLWnqFCMQIUrK+eQb9v5VubGtu5j/68Lyfwqa6g6GV3WHLy3ZrRsqMJUoVRf745rWsUJOyNwFs+r7rxvabvrwnLQmqw/3YvrtIMjZitmxDbVJZtld465xF5gCNCQqB7Hzj84inepnDmSraIiid4zOG9rZR/g+YDIm3EP65FmvNb+tUkS2S9/rL4bZWfgXu1b3UOy4dmeJnHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3mGJ+j9ubShg5mg1kZSjaQMFHH6RfcKxAl9eubIFj4=;
 b=DquwfgtkrfYhDFz6ls8LTFZmkLN9XydVME2kZvurIXd2QXGY7/3fZ7piX0dj+fJ3deEmuvHuRyaU87h0Zu46IEnHsw2PRyn32ZSixvpQVUXcrbXPTKyETgelKH+bWqoJerB7GIqXmnozOkJ6GGQopEWvEoKIxCoETFZueiclmE8TscNiernhua+nSSwjD4yBImhHKq8pSVFlvqIQMSiOnSEfDZ0iFiWCpfGDLmElVJ4jrzpwWvDbUYCc30tpfW5w6OCaHsjxavKUSU+FCDvC5vwnzH7KqPFSs6CYd3qYGc5AX2TMbPzpjGVZaZNZAk/FbDYgV00SB8LTnLXQGV3qXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:21:51 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:21:51 +0000
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
Subject: [PATCH 11/17] arm64: dts: imx95: Add clock and sound-dai-cells properties for MQS1
Date: Fri, 14 Aug 2026 16:20:15 +0900
Message-ID: <20260814072022.4064009-12-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0074.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::10) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: 783e10f1-60c9-4436-fde8-08def9d4b5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	y0CjMVce2Lhm3OMfNtd+akBR9ykdnQBGD9Fcq6whJ46O2qPWFRgWT4dYejE3RI1UNH7GfHcPCN4C1/qYawtlSrv6UHPRAwGe46Q8Cevfa/y/wwx/M9L/vsLuKXOiFduF8QjKOG5vtamvr7Ge1m0iuals55fUXAW0ahhghmWhtCJElSuBdIBtDfdTRKXF18b+xVcLYzIM/khEYs7sZNvtNKuI0uHDHi1k0m1Z0GC2pQISfZr3tR8tvlsJOC8U6ZFJKgIupgaLrbavOoYWHIhHHtNJ2SLEts30bECbLx6kaSnF1l9DZovtQY6uJuoPWV+zBfJw2zkXOH2s5vxXguW5Jx9GE4zxmFINX/pbWN/nc5Cv/8h3AJQCEj6p6rn4uIvC+tpQuwTu1g/vY8u5N7dLsBM21KDl9MgspDm/hgZBtjAGqEN8RyccFSTR4vmxWVchY39qeMeBQV8LQ1YeJKBSE07CYxWxh7ITccjwQRgwrwJK2yYUOdfKvb1AJ2s4YHF5ffupK5RrXqvTZ94Sl7tF73ORr+BzlAfXg7WOJuHtOkcnZJuOT94Flqac489O1rhl1Y7pk6v11NnX2G06OjDKj0aYaSQjRuBKCa3g2uYESUXCPytBRxgmJ1DzDm721VLZ75aKUZ4KU2Y5IaGbXhVQcMHOCUoRhlfBXd/hh4cB7uw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ICLBXH4rvPEnh2yBT8tBUjQZ2Ws8AqksW28Kgp1fUBZwfRm/aIzN2d8s24mv?=
 =?us-ascii?Q?Gd1qALRcqlFL5Ry2saG7gw2slNONd8nOflDVF/MJcLYwnazAcEtH9nNCIYp5?=
 =?us-ascii?Q?w/fcP7sAEohdE7Jwh7I0Gjp1voB04UaOIUII0108h2tWI63+wjZpQGW6LuKJ?=
 =?us-ascii?Q?DJ5S6zlw9Lo1PqM377hSh19Hmsou5/7xsIC5TOJSzS4AGBXxqCdn+cXrl7bX?=
 =?us-ascii?Q?BDSYOs8KSnmXZaZqrx4sBJzZkh8PA6gPU9Gk7ZWCKHFuYtGekL8AJeqNur7S?=
 =?us-ascii?Q?sPkPja/cjbupS7chSUk/cyQ8ifTbocYYZH16ETqXO82d0XWEiS+qBo+Q3/bG?=
 =?us-ascii?Q?4HemK3wbX1Thl/R5TEegSnIUjfOex9sHxdBqMzLXvmjQMbwHhr/GwC2q62bp?=
 =?us-ascii?Q?eiUY0ROKiGkijnxAGemCpimFFP0MzMsIHh1kRc71rEsOxQdyutlNUDlh+pnt?=
 =?us-ascii?Q?c1Z3tWlbNCiOXpnld2oFeYFbQjkWZeM/ufnC4o5lpjxHy4ENB9cTKaE/BSnq?=
 =?us-ascii?Q?6Xhwv8K9Hf9FShFFYKneGlQNOIFc6IBjtSTVSOrG0hfbdRccvIawCaonypBo?=
 =?us-ascii?Q?n56N5UN1TSTN69GJDhZG60lti7tur+ddi2k+kBZwvg+2OICzJbuwsmpxF87Z?=
 =?us-ascii?Q?AryEh5UimA0ljKLGVUm9nZpNxlHbWnaDCwvMabA+Qf7+K0+qNuf7toO9oJJG?=
 =?us-ascii?Q?Tpu1C/Ob7hqUq4neRweulf+8dnkYw1vti5eWlHVKsKmyrATigimkW30hO1+g?=
 =?us-ascii?Q?oKQHBAAAiPTEJi9SgYgmE/uCAJ6TTktuDZ2AG3nj4ihZIH3NorFm6VCt6Vg4?=
 =?us-ascii?Q?MuWHfpma/F+oytpL7gS30QEHg5rJtNE7U/ccYP45TpceeB20nXCb7B0eJ4cP?=
 =?us-ascii?Q?fZ9jlMTa7GW05tmtVLnnXZHOe1NRyQYp0HtBvgC6CaLvp2Q48Rm+BeWINBLB?=
 =?us-ascii?Q?Ls0JA1SBbOXZCfByi4e9FK/V3pOaO9NqU3qyY5jml5q2Q4lbtlnt8wxzF9qd?=
 =?us-ascii?Q?qrr89reVecqTzRHZ5H1RfegRi/3lyUGai9FdVSKqJnngigAfDj8cPAJLQ1mm?=
 =?us-ascii?Q?RD65xuMot4ANAlBlB++gtckNIaBusVrNyRC2wvRI6lEJIX7X4gFl5E/JL8b9?=
 =?us-ascii?Q?ocfq65HD3FL8//DC41cgCpe9VlszMKD3fa2vxGCA+DN/BOUMuSUCNkWOv3HL?=
 =?us-ascii?Q?jIv2L7VqWMb9CtkmN+uOVA4Lse1GRqUfBcwSpc8HXiewedBUsSNJqu23lIHI?=
 =?us-ascii?Q?OvyGYY5cP1L8Et0LimxZFwxHkIfTgmhBLGPjkKachb1tT9a+GC1XkP2nkx5E?=
 =?us-ascii?Q?gUyfLB7Ipye7dzPDb5o8SuPanuzGNaN8uoaz0CY9d5vskOuq6POkfR/IZpYO?=
 =?us-ascii?Q?PQKzvRVFPy3BIb9gKNZ0GEKIJ31AoJp8Lym9cfIazdPmV+ERRyMSUT6Bup9z?=
 =?us-ascii?Q?Y5v2H8oRj0S8egjQfp31z+x7Ccr0cV7Q3cNRH6OSluduh8uxKjK6diipg7h7?=
 =?us-ascii?Q?T7eVoF8vMEwK2k9cFhJ61IgQCVtLEEM+acbZwHccGqZo5GtFzxfe/DjMbs5w?=
 =?us-ascii?Q?Ql4cqPG6nq9ZCSQLAqtHQ031oii04ZnYUW4KjWBx5uWQuffSyJmz4mtjPsBE?=
 =?us-ascii?Q?FxAVc7nxkhursTagwvrKzxzerUestZni0+6fuu/c51THi6UDYJI46Az2wKd7?=
 =?us-ascii?Q?fUqJzLGWjBQXWZ4BlCBbgNuWzJCDXExX86vp4NUiLK09yidoYO6UCwTgzZ3t?=
 =?us-ascii?Q?c6jTBqjGE8vx73Xve2gmUm8ZxkGvcTVDoQSXEz1ywtmXbCLbhSr0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783e10f1-60c9-4436-fde8-08def9d4b5be
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:21:51.2112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nRPBPKWOWYXtOXM/bbAwVZfUz52kikoppns18d0eytj0LhhgECAoKzXBQeAN110/RUrOMQ/xAMdgj4bXGumdfvexhleu+6kwvr3IyxvyYIpQBDsJnxEwxxtRMhUnQNo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 MCLK input is driven from the respective SAI1 MCLK output, and
sound-dai-cells describes the node as an ASoC DAI provider. Both are
fixed SoC integration properties rather than board specific, so add them
here in the common dtsi instead of duplicating them in each board dts.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 38fc47024841..7bc74307d9ae 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -439,6 +439,9 @@ hugo_funnel_out_port0: endpoint {
 
 	mqs1: mqs-1 {
 		compatible = "fsl,imx95-aonmix-mqs";
+		clocks = <&scmi_clk IMX95_CLK_SAI1>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
-- 
2.50.1

