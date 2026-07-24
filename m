Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B54381EAA
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 06:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784873669; cv=fail; b=oc+pUrV3qkpCGzI9Ta2XUceCeyMmobXivccEpXEyrMUnrEiZm9wMbUOUYQkHC0vj+SM1NrTc29rBaJuswABzHOcO5jq5JyNGwk5tQNlyz3OiAsjy/ko0qClapupP7pzfXNPwr25ROW9E0f+Sw06P3cjIzNMvyWZDINUrYA3dlSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784873669; c=relaxed/simple;
	bh=8tKYEGG0nmhP5kXJoZknhU/R6H1hrBa7kR5eVKLGj80=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GuZPohYwc7Q3azU+g+EPcFDNkeaHodcP8E5TXA0HWMgdLsYtkiZGxC3JNJvfS/Y42p3oMnH17QZ/Vbs5pXKH9EaDIqxIYpHWltlCBTCB/03sIyQC1kiK+oIdcxe64DStgdAdg03T/7QAYcAFp1c4w9wKPEooSZYVd3zDdVBVKY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h9tqiB/8; arc=fail smtp.client-ip=52.101.69.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h9tqiB/8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqM6hSLQGEnd51EkI5j0lWsjZRG3giED6qiH5nxXI466UKFFr4KEqOSBcE8bIHhowlJwBcmWCxsms0kW2aDw0a+u6d0uT8n+BZR/xUnKlckJMjPKp1CG+Cet9gme3Dl7unkL03NOXUn/HLFuOclHNEQUhm/MOWd5AN7W+AlYHCr+jlsRoSvwMNSNlFAgcBWrexiHjfNh+4OVWT0k4/SI9XQdnxTSTZ0l7T9ggpoFgSUa7zGhmKiHxmR3IGeDm6z1zqhu7A3aeMxXO71++gXy/FR1Z20dN7MEMWwEN7esa5iaFopVLr/dgAxu8MVPSSvjsO1OlooRkg/NJHdftAcc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xt+svqmInN98BUopZnsuFVlYB2ebrvmIlkldwvD9zO8=;
 b=fHe4GVtDke5fJ70SlSZMsRiiYAO4XDc+rFMQo0SCXs8H6397IUB/jKlVA78dJY/aYL2Mopxq6gjEqUYtz1m+/hykbIimkHYiMtw7YQCo0JfGXeucXEhjdJo0te8QF/4cwV1fE3dZgZXh5+DJExGj/TawS1cXNXhcZKf51pXM72Amar/AGfQ3ePAOQfuPk4gT+643af6+OhXyv3SxQl4uCJ59ErvaAv4+SkGPyR4HUkGDgjBqTjcey6yjcZLLGRm/+V/o4kVXEbn0rjHJcCurFPnvcloGda/XTiMQlXV9FnK3g5FunIVLraS3yATXDqQNJCgwzzmpF4dhrbnVqJ37ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xt+svqmInN98BUopZnsuFVlYB2ebrvmIlkldwvD9zO8=;
 b=h9tqiB/8q/mgEdrcMXbS1xcQwP+M2magx4TKJoT46VdZahlligTJm4Whq1VUudpcEL8RVi87VGWyVh/UeGYo1z/BBo4MC+Fr9nJ1PZibDZlgbKIuuNmX8NDYxk7XpHeaaZ4Qf0GTdDIF17K2KE+hNv7/5uwtART2QpxyR+oAi2GeQwJvpOjTcxTw8WbmaPsRYsU7nApk8C49FUMmUG8kVjC/Nxt4k2fvCnPdPAOtHbsRUAwuEfG4JHyyLUl5EAMxQxOcPkDmHTVjy6d3p7URIEeuHtLxn7i3CXuOcU9u19SFO9+5/4QODmvylINfu7xX4rLtXRXHt3lpOliIECRuJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA2PR04MB10258.eurprd04.prod.outlook.com (2603:10a6:102:404::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 06:14:25 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.017; Fri, 24 Jul 2026
 06:14:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 24 Jul 2026 14:17:55 +0800
Subject: [PATCH v3 1/4] arm64: dts: imx95-19x19-evk: Add CM7 node and
 related memory nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-imx-rproc-dts-v3-1-175381bdd02d@nxp.com>
References: <20260724-imx-rproc-dts-v3-0-175381bdd02d@nxp.com>
In-Reply-To: <20260724-imx-rproc-dts-v3-0-175381bdd02d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SG2P153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096::25) To
 AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA2PR04MB10258:EE_
X-MS-Office365-Filtering-Correlation-Id: a646a449-7ec1-4157-6ebd-08dee94acf52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|7416014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BOSHtVhbEYkWib1dx7JQ45efaZ2hDI9wEUuagyRcBzhgccM986z7L7Aef5dYexJMSQsNKOYmOI4VKwx6aIUoxR5oh/ATSASvuJ0rYvz9HuvW4yx3BmaUGnfa0rAtWb962dg/OWXeOuXeuPwB29HNtXRDYiFqlbt2+5kHd1LNlxifcAxOP2ehF3PuZnVbHMD/2rAWq/+bwfupi5fpVuis6vxLAwFZ4ttbUsKObdNroTmVMRCDj9myh6/KiL0NRKA11sGKdHQRV077pWZWgvEtCyqZ4KGgVE+PvBQQxplt7WQ8ZMU34gIESbHvU24DT6q6bkY+M0f6STkrcREyjwRLtHMGrhS3S3NPMR9LZXpbcBhcFcj6kmz2KYh1tvkFrwmOWpU+BYRV2XTuuMGjVUI8tKFjZi+huqgvq18Q+Ew4y8erbYTEoZxvHXI788E5z6GSrG2Vs83H7S1V4C7Qz/kePVv0qb3qiYl+hXrP8fnHY9+entlbWGK+cRR3T+wrX7sydxXc2CXMoj8J8BvubJEm6f0P+MmbS98CmgiqlTFig8KsSGFTbKkJoGnR/6KgbeKX1EPpmg+TalNrfzIJcxxMv36bbcyV0w1Zsed8FjXnh+mWAh4DngQOCyx4fBCT+j6EA1yQkh6WpmQ71HpG7OGeeWsG8V5SXetXTtk8IksNLcA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWVES0ZrUFplTjFNb01KUStuS0prZEZDV3pFa09saVh2ZzZ6cDJjTm9HRUty?=
 =?utf-8?B?d3hVMkF2bUlLZVk4REpXclpTZ1dOVXN5T2RndFF5aURPR01oNDl3SE1DZ3dH?=
 =?utf-8?B?KzRtUHlMSlg0RUFWYWFtTE1OMjRncmd1K2FJaDVTRHRmbHcrVSt5cWFoSkJP?=
 =?utf-8?B?V09FOVR3SERpaGlrdDlFdlZuTWV6Um44cWNYb2xqbTJaSmRFRHRIcEo5V2pF?=
 =?utf-8?B?WjR5R2JHNE43VDBKMWtOMk5XQW9RN25QVWZBOERQdi9mcGM3SS94cHZmdkY2?=
 =?utf-8?B?NTEzRWZuZS9wYUpyemR5Z1lXVzRBa3cxUlJ1eXkrc3Q5T2thQVo5UkhGVUJ1?=
 =?utf-8?B?R3MzNitoamY1ZXhndlFSVm1BUW5hNkZMTUZEeHdTbG15TE82WHNXNFhoQUVN?=
 =?utf-8?B?M1RTc2M2ellaaTZOc3FlbGQxWGhlcUNmWkh3dXRDMGRtTTd4clhialpma1F4?=
 =?utf-8?B?cEJURGdSUmd1Ym9sOVdTTVg4cC8vcTFONkw0TWtES1JRUjJ4Y2pzZlcvVWhG?=
 =?utf-8?B?Y2ZpMjAzelI5NUxwWFZiWXRmbzdyYXpvLzlDbjR0QUJCT0hHZkc2dDBsSUxl?=
 =?utf-8?B?ajl5TWpHVi9yYTRISVZjSXdFNWdHeGVCemdmNFRIN204ellpYUY0OG94SW9r?=
 =?utf-8?B?Sy96Z2tCbGhBaHpVYjZJMnVMTmxzajRQL1NSUHNWam4vcFRpaFlhTXkxdFE0?=
 =?utf-8?B?eUVYZUNaM0RDNHF2cVRGc2RsdUZwSzlWNTR4cGUzcWdtbjFCWk41N3VKeXRr?=
 =?utf-8?B?ZXc3bjloNnVzc2o4STErelpTTEt0UzVIdHhhSkFtSUZjWVk2VUtrVlhXbytt?=
 =?utf-8?B?Rmw5T3pGb2tmWE9OajZTOTBodTE1UldFb2pNODhwQktabGhRdGg2NURlcXBI?=
 =?utf-8?B?L0F5bWt5ZkR6L3pBNm1IQ0VjWlZQMXJYVUJjNGN1WFgrNitBNzdBcDNZaFFV?=
 =?utf-8?B?anlnekR4U2JHdVZkbmtVd2YybDM3ZXlVUmRlNkd5MmptUFBUbldiWDE0Ykc2?=
 =?utf-8?B?cnF6MUwwVnVOUEZRQUFuSllyM1BuZm5FZnp5ZFV6WXZwa21EUUFOMmtqb0tU?=
 =?utf-8?B?dm1KS3NaWnNkUDhpb0dXQTk1KzBPU2hGeTg1NXJPYStON2piNGNVZ29IUmdF?=
 =?utf-8?B?T3BvN0doWWlENHQ5MVVxcitIN0wybEd4cUIrWjh3bkthU2ZrL1VPcTJuaE9x?=
 =?utf-8?B?ZEZYRUJGNm0yRVErTzAxcXk3eFRybnpIaEVZcjdFM1k1S1dSQVFnaFoySFpz?=
 =?utf-8?B?OVF2OGdLQ3AvTXZrc2ZIbDlxNGdueXA0TzJiWFJjNENFMnFNWmphZXpSK3RI?=
 =?utf-8?B?NG14V3FGbGhET0trY0RxSm9kTDZjQWFZY0ZTRmp2dWt2RTg1by9mR2ZubXJj?=
 =?utf-8?B?M3o5UXlrL3ZoTm5XV2pVcmVGNWU3MGwwRmpIalEyRlB2Q05CYkErV0F3bU1G?=
 =?utf-8?B?MlpLd3dlUHEzNlNiUzVtdWZOUzByR3VZQjdWM0dJSVVOWmhpM3lGNW1PcHZW?=
 =?utf-8?B?d3BIQ3BjZHNLZnJoQzA5Vm56emlsVDJ5WTRUNm54YXNpYWxidzJUdzZOOWdB?=
 =?utf-8?B?NUh3eEZQVkVnS3dXTXptVGhvTWx1VE5NdmtnUEt6M0c0bHZrbDcyQnZMTHdX?=
 =?utf-8?B?L2lXM3drbkFUTGZWbFRwRlFVNHBPL25pVFVpU0VYRm1GbFZrK2ZpM2pUQXlS?=
 =?utf-8?B?YXFFQzAxMHZERURtdlZmY1FKWDhJSnhPZ29ZMWUxQ0RHdmo3NC85Zi9laWZK?=
 =?utf-8?B?Tm9DTEpxL1FUdXZmUmlqakRQSU1xOWZySmtCMEJIeXlZdXBMNWtIZEhMN0Jw?=
 =?utf-8?B?WUFtb0FoenF5eTNTV0liUzBQQWJiNTloSG1Zd0tSWSt0ekpaMDMzeDFHOFVV?=
 =?utf-8?B?TmRObW5OVzdmRWtQWjc1MTJUOS8wdUhUTXRtMDR3TkhvNCtBT3JrTkthL3Qy?=
 =?utf-8?B?SDVaSmxsM2x4QW94OUVrNHNXZlErdEplVVQxYW5aeDE5OWw5ZWhEYkJmL25r?=
 =?utf-8?B?blBjNlBwWGxoL3NzQS9hWGVoazQzL004cEkzUDh3bHBHeDdub2kxZGJmZEdj?=
 =?utf-8?B?NGNVYytmR2UxTEZOU2p1VjE0Q25HT1A4bVZNVFpzVFIxMXhnNjQ3ZUc2QjRF?=
 =?utf-8?B?SlpsQWlhTnFSeDVCR01pb1hlVmQySWNvdnRiUFpJQ2F0WGRnZUZrNUJnY2No?=
 =?utf-8?B?WTBtbzl6U2tZN0ZoZFJpQTJVMmc2eXA4aWhuekVaNWF6TU4yZWVFOFBFTmhi?=
 =?utf-8?B?NHNUYjBad1lQb01GTmoxdElpd1lnKyt6dFpkY3BjYkRWRnMxQ2dJcXUwMGp4?=
 =?utf-8?B?dURxOEhFZElVMUZnQldBU0l0cnR3RWNrRlVsLzh2RS9mTVZjOFVRQWRKU0pr?=
 =?utf-8?Q?njvXv2QogXV0wzrU/+9IK3veMI+/f72o+Qn9m?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a646a449-7ec1-4157-6ebd-08dee94acf52
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 06:14:24.9737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXhF6IIh/645lyNMrNurZo2GJcORX7bjVtcZ+mqh4Wg1Qr9IE1CxAaDqxM+/st0kWS/FhjGt7/xtdDSl6qCHR6xiyRUREBlmMlpWu16HPR8mtSbW0U+B4mrIHxSvafnu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10258

From: Peng Fan <peng.fan@nxp.com>

Add remoteproc CM7 node and reserved memory regions to enable the
Cortex-M7 remote processor. The reserved memory includes firmware
memory, virtio device vring buffers, a resource table and a shared
DMA pool for inter-processor communication via the MU7 mailbox.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 340ab0253ec21..814da90243b21 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -76,6 +76,42 @@ linux_cma: linux,cma {
 			linux,cma-default;
 			reusable;
 		};
+
+		m7_reserved: memory@80000000 {
+			no-map;
+			reg = <0 0x80000000 0 0x1000000>;
+		};
+
+		vdev0vring0: vdev0vring0@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	flexcan1_phy: can-phy0 {
@@ -185,6 +221,16 @@ reg_usb_vbus: regulator-vbus {
 		enable-active-high;
 	};
 
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu7 0 1
+			  &mu7 1 1
+			  &mu7 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
+	};
+
 	sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";

-- 
2.34.1

