Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795705658;
	b=1tKfTwE9vrWFES5MN2axiImEBrPsBOKBzeJBKsj1VnjAQk/h8YvHpD7u9VQf2nDa9s7j
	 T1XcIsg1R9iQjh6zLQQ4z4rnvp4xmHogt3yqPZND9KDNX5W86lQ4ol1PP1yoi6gYUVjTn
	 iII85xoTHLg0sAcltIaO0NqtSyCPGUE+s/zHnD8USMXqG7ODN3O8BBMImY5ayJ/X5AOQL
	 RD5/GaXZABe4wy4lzBdVFMYO7mzmFh+S7f+MntPvua5KZHOaHx0ytELA+C5D7ERarCuuB
	 aYDrpGxBDuRQEpyZNHtAci1hVuWsJzFiodN5N8VNs6ft/xgtPOpoODdsJkce12EFsjQ==
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
	bh=PVgzWZsjQdj5g2XQLM26vz0au373UGvsi4en6eng7lQ=;
	b=LVSnQQzfGg7L4DesWo+cyurxpFh1vWldMimMGBX8+q5sCBD4ythK6ZymygSC/jNXK5BE
	 p2Ze6HCaAtDgCFfT1JuPOa36sS19D1/9LCkXJLTudQ8oqEVHUyfTNfZEiptZCG5u7C50p
	 GX6sb3jd3OHL55J/0sIWfvVgtOo6dCG5rHvYVS8hythOi2qy3fL8bfXHlYwLcB+GSqc7p
	 +OMOzx7JsKrInK8YKBWyl/AZ5GGGc+O1Y+9toXGsff0aKXzqwytwGHum5t/spnNL7v7zx
	 +rmc1XInOttar3njZO+Mw4yCt5uJYVxEK3u6FHDSGYZuoHV0HEx3d4wYD15SE4l1ung==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jI81Ao2u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.69
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD9B606A31E
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 15:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD9B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jI81Ao2u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lX+Zn0cJ/08xQBzbTExY1K8MoSwQ1T+EgYEfpT71Xa3OefTdzAS25RlhRbV5Af9hXnyQ3ppIgPNKKFRKDQ6xe7zU/nAozUGQdQYTYJqY0rZM4gfla4a480Xr1d6Esq0UBba2IEUJnTKXSOU0hZzoneM4svf7OYBU8hBV0rrBNVt1cbTeIfBjIAJCbLj4PvlkZTbOeWUIWvDY5+d61oIjI/Kl5Fm4uvFAYfArUBa6yITLUARULFDtxhwBRRg511f6Q4HgA1qix8mzKintDi8UjIqX5G8XGI1neU4ugqMncv+d87EK1guDV5SfBX/R0TOYKIxdxX+k6q/HqAqyCnvjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVgzWZsjQdj5g2XQLM26vz0au373UGvsi4en6eng7lQ=;
 b=LvDvq5qdJfmSBJJ0goEBJTxYTNZLY1MJcYb1YBJyHbw9wjEJJXqaTaT/tJgfza18kf0wk7oNYAeFAAT/Se6FlgVGIW87s1wf996W7n2pIXjh63y/Pt4LsMYg2vJUVM6+MzeAGk7q1UmOayXUc6uaEZYgXbxzQje0SrfpQ9WgOLA883H2HnFdhAsrLBfHZ6b8nqj6proEbWknDc4iUBC0+q/JkstlNO+N3QNs9lholyY6DQB9XuK0lhIaubWMOfMbgID8xnqLyR4BczL/UUyhRBti1Gye8/9OB+Vk5ulwjeZIcRxtFVXJk217EKtEjKcYdPVajVIdY+Lg2FdXxb5sYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVgzWZsjQdj5g2XQLM26vz0au373UGvsi4en6eng7lQ=;
 b=jI81Ao2up+zBbMSs+hZ4oDFfKMcoAP/xoU/u4/uC86/o98PGrQerWXOIUaH/7Dva8KQ69ukZhXCJLk+L+tznxHZLlXWsAr6f+6f9uUjs7cTa82PcH7YWDXPlg3claIQipHbSMxZT1I3O/94YBDxj3LZwlSFtfzynK+zGVVx+LV8lDP246Y0O+e4NLwLC1AclYZRTU/k55bqj4B6aX2Qe3b6I4uaAEiiVe1CaW4Z3C2oq36if6GY0iUh/zfPI10cP8YseOf+KdWvQ+DQYAsIUGJY9IGfKgVAkZ1OH8zYzjchZZ/2/vpCqTR2lM5Z2lYH2TG2VIpIzdWEH81vQ4xQVCw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by GVXPR04MB9851.eurprd04.prod.outlook.com
 (2603:10a6:150:118::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:07:28 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:07:27 +0000
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
Subject: [PATCH 1/5] arm64: dts: ls1046a: describe the DCFG_DCSR space in the guts DT node
Date: Thu, 26 Nov 2026 17:06:28 +0200
Message-Id: <20261126150632.1560355-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
References: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::12) To MI9PR04MB019273.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 9378d382-398f-466a-41d9-08df4bcefc52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|7416014|376014|366016|18002099003|22082099003|3023799007|260925021311599003|260925021911599003|56012099006|11063799006|260925022911599003|261102123227099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZKtpLfd86EQhlm059gDoNk0SKREDWDYy/E4b1UumKtSeVkfTqgh1ge6ibF8ztRF3aidC7GWCMu3SYIZjJZK/ePPj4ODe6BuBbXh2NqP3WJcpVmuoyJZMIt82Iz+zr7xkKp/r76jtLGPzcqEgJ7QhzN/JFcBfFCzHcYR8Y3dn3g9u4Bux5rKseN0G1o/oQCf9/7kA/72/az2M55MQ8+cAYCxpro7FEJufjZTl5h55WS5JMuiBE8ujR9thcakNOR3nDLZhq3zI5KiJ7kGPs+mKIOQlb+g4efbPNo7SUP/z5iOMsaM1SFF996u3O0uc+6JzhBNTAC7ddNMSQjz4ZCCjZw0Z5wns5Rp/D5DQr58W5oa3BKoSLAw0byOYEfW4oZpqWPGnwdln6rjAf7rseVqypZRc/9cF0tgTAsbRrRaFzYkSM+qgTKVdpkL7DmZ6eOQUkqnySV5r/aDnnaouBGby3V63Q7BWAnig7W3WlUKCYNdcP7TvA0OWx+2n8jonAuErCz3fBkBS5VD+ETXdktDrJ8Ap8RKJfULqALvrAeeOwfrWmAQp37YBC1IlagN1xviuEZXE5qLN33MxrqKxcfUR4gz6PpkCy4nM51uvS5Fvmxu07GlYmO6/fZvVK73iX4IdePIMojC9irGfNpqWmk+0+YYjImNPtRCq5pnHn5czLqo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(7416014)(376014)(366016)(18002099003)(22082099003)(3023799007)(260925021311599003)(260925021911599003)(56012099006)(11063799006)(260925022911599003)(261102123227099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nNVm/IVvcOP8qo2P0917EtS0t5bnDSAwhZt5dkYAhU3BNnGUJwmn9ls3myOX?=
 =?us-ascii?Q?wbf0e3ffQwjZrPbMLx4vg8d2uigzQC2DL5g8/gz1qhxkevAUW+unfFX99cNt?=
 =?us-ascii?Q?qMXzDOYv84L9n2H+7iIp+ZNzGxkGPj+sbAnWblraWICZhR0sC5/B/wjkaZe/?=
 =?us-ascii?Q?3hL8gPEtgA/UIk+wWARZd2qTGNQbS845JnLOmAhfkhOJp73WY8Jnhq8eydcR?=
 =?us-ascii?Q?0MsBwn+tNe5fHNjxKrFXPV35cVvf/t2mn9RNmgLOZuHzezwW05EDsJ+nR1hZ?=
 =?us-ascii?Q?ZI4s9mZkzlqiq2iteFKaRBAu7obZgCkrRwqdyIv4PjMalol8PmCWIal/W4C0?=
 =?us-ascii?Q?dI+DGT8qBXwY2zLEDvbnFkJ5NcGZELdcEQaOkIdtim4c3HgBdSjVkJiwJ3r/?=
 =?us-ascii?Q?oBmWEhkgJ6d1YSbiEHj5ESgHhhV1Dgu/seonDP1yCxL4D7+ZVLYQ/zsqdhpF?=
 =?us-ascii?Q?ZeB2K/J58HLQUfZlZdFlOiEocK3olXXKWSCh/EsNK9kkoorAISCzAqvtGpg2?=
 =?us-ascii?Q?J7OiOV902vl8D9+Rydw2bw8IRqo3fQDwJO/X8Bes00k+z5UBGnp6PYqkejqq?=
 =?us-ascii?Q?UR3JtNe3bBEmgnwY7o44Xl9lUQXZoyhIFkIpabMDlMO47url2HOJm+0Dv3xS?=
 =?us-ascii?Q?1K+x46CPRQttBqrNqyV6PgueoJ3IMoMkm4cBiOtNhAZBZE9CR86PZ7Y5qFbh?=
 =?us-ascii?Q?VVWtd1B84hz5Jm7PlGNj2iIkLq1FA+iUqq1il+uWZNRGyt82eWkW1xfSYLcf?=
 =?us-ascii?Q?VXyuVvFX+db3B5j49B09TZbb8rxmlojRrRrSO1//v7VW9rFw9jV3Wfk9EOdS?=
 =?us-ascii?Q?PPzTrq2xTSY+/n4oIJhxBVsrR78ubuTfaIzubnfg6Y4NoHAefUD/8UqvswHH?=
 =?us-ascii?Q?GkVQ9WocVLj07t4YHy2OLanDO3YXp6KDcZMzTNT4CSAWGmdAa1Z98QB3XIxe?=
 =?us-ascii?Q?KVmuRbiMQDJAIcAWQ+B25UeLwpoIME6bGPYW81QU3fqhpulGc9SnvJPjYQc9?=
 =?us-ascii?Q?4x6sOK7sHFWuKVUR3h6Xbu5rW1W3Xf9gPhfWUwtsBjTKqkWlUCAknGTV55pd?=
 =?us-ascii?Q?7an2e6SPRvWGznx4/ITAiPxQB74mkfpuoOyemDEExGlIKFp8pSf/af83ZkhR?=
 =?us-ascii?Q?ibzQdODDMXvkHAaX6z2H77ObEZlhXUlJb44G4+ZiQYP4F68Jx6a0YVaRa5qh?=
 =?us-ascii?Q?dMM1HQ0ahWPVzX9ZkWDyuw9IC58VE0Ks6ex35KIiDD+/qoH/IIirm0jsbpHf?=
 =?us-ascii?Q?R7+R9GmVZpch7T+hp2qS8MTwlsMZKK+D5Nf888jRK6mABldiqt1E+Ct3j4cp?=
 =?us-ascii?Q?Prm0/91zHSoXKC4Fd5CM7+iMhcPyIYlKJqb6w5AjmMAr/a8FWZ5ZEO5aKILk?=
 =?us-ascii?Q?i1kCH93li9/CwXLDzsMxwKRg0TdazixoIvKBa6Pl/6mqCVdaGgfbOCxUJQPN?=
 =?us-ascii?Q?AJLxsgJnpRKmkAZagNUjmZ1MezjEyPHJ0KHXnce96SoRqI9zjeQWeay86D7z?=
 =?us-ascii?Q?TMe/jzh9dn4+MHJ4U6Uu5an1joVdvF9vxlCioiduu1he4Av8sW1zjpPnCMWG?=
 =?us-ascii?Q?aFFR99ujpYsOcgZsJmOLdgee+yfwKeBatFu/wqkq2TXvR4gHrIcDG5f3I4Yy?=
 =?us-ascii?Q?iiSoabO5UF080tkNp/1jEf17eaIN0swRkRxb5zw9DQG00oxPi1SJwx0fxzO/?=
 =?us-ascii?Q?a1OLQ3mY8HN3tyXjhMv/HRzV/ADdo7iKm8lVvC0k+p0nbpVBTcfh23GJQNqB?=
 =?us-ascii?Q?R9vsXovegw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9378d382-398f-466a-41d9-08df4bcefc52
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:07:27.9062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kk9H8+FXxzVSwlSBnGG2tl2Vs7M5rhmV1tkKHqhRyirg+IVjuhorTOk3tLuKJOruqzA3dA4jL/t5bG+oohuOmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9851

Now that the guts driver supports RCW override through the DCFG_DCSR
register space, describe it in the DT node for the LS1046A SoC.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 270a97711a69..ad5590067659 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -486,7 +486,9 @@ serdes2_lane_d: phy@3 {
 
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1046a-dcfg", "syscon";
-			reg = <0x0 0x1ee0000 0x0 0x1000>;
+			reg = <0x0 0x1ee0000 0x0 0x1000>,
+			      <0x0 0x20140000 0x0 0x1000>;
+			reg-names = "dcfg_ccsr", "dcfg_dcsr";
 			big-endian;
 		};
 
-- 
2.25.1

