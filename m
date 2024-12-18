Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2060.outbound.protection.outlook.com [40.107.247.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA9928EA
	for <imx@lists.linux.dev>; Wed, 18 Dec 2024 06:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734503618; cv=fail; b=hWPprdcnfRAv2BcuuC8s1tOaFnrX8VY3Cy1CB7JzPIptDyraRbsYxrqQsbzUfo1eZlwjqJRjs/r2fmdRtxukuUkdrfNS9JYyqeZ4BYAPmcxnRh2CZTqsuKULyr6a+N6uDLQAbKn5rOwMTn5uyLxi0Gk6NBrPW8DmOdvU/rV+dCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734503618; c=relaxed/simple;
	bh=YKQTlBweNzWtIwdENqnu2Wc/SfvmFyCr+0G1n0g+M0E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rmCyRgII1a5R9SRO1NhAdtsZJeEFP5e0zsEoa575hB1OfV5ZMREmPM7mCUbsNZ2TekdpQZV2hpOewHHn86iFD/Pu3nTmfvMjXWFIxkRhtXOVfsYIL0zaOtep9d6vih+uNxc0OzOsN9DatJDHFFQkKQf2l199Yp1ZW2WwmfZSOJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j6BCg83N; arc=fail smtp.client-ip=40.107.247.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j6BCg83N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WM92xF3ZWsSlc/MBtf/XmegZJVvLAiQ+vWNUOX5EZqcYbt3QMACVIkwxWPif7atkHCloEBZcncvIlMgaPs/1xz5JeDie0rJKMFf1uBuVqnUNHzC6nFuKbZVRBSsPkt5mij7S0WKkOCRCXhNyEOIpRxDv9ogKQP8R9Hfjf1NUI5xQ4MsYkt9jn8cqY/LAzu6R0Bbqpdh95CB69sm0/FNRQ2VxjBgBjcXXaXU3fICYgVBX+pgIn55H9bBTgvSgG1OrfSbZQKFy/fh2rZcYhbnkeXFurwf+waHtPEuqcLeEvHDyktIQAqDVLcD+HE1C4htVeKlqPFa4RyRPo+lhTREKJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nawTTcv8oM49aIcPpHF1gWEQIAb4Rq4htNYg0DOlVv0=;
 b=s18PaRZOtaK8t9x5WuIznEp9rWMI6M2pDfN0N2X79iYpiT8aiBwpzxcT76xicBER/ZKrt9WHyLCSz8rqMRCwtigCm7rKNe6gHN4DWX1dQk9XffLRjX6tWNQE+p3XrP4jzD7FBLskkgZ/xTK9KXZjKFfA2zvkk7UgZTSz4MYD8no9wHSjRcXhJizVby6ncQRwIo7//KswxgOnjR2xE21zXonU2HbuT9kiIjUPQTSW3oDUB4rX3mFv4afr6gdr/xWFHBsD2AJnhu8/EvGpi2gIVbuxdFelQYF6HJNx8YHDtUuSRKScnSnIHC/P/ulvZtAL8UMsH1ciMXyF7tO0whfVgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nawTTcv8oM49aIcPpHF1gWEQIAb4Rq4htNYg0DOlVv0=;
 b=j6BCg83NFQYO+ppiHDsDAjad5NuE4KpSaaeG9+Vz0sO0sQKXlP7TBMq4AfMAg7YFq3WRwNhX9RWqxxMf4gY7R8eKPng4bL7gJDF9mRKz6gM13lnaXZg1qvCZMOVLiLb/h0mb/Dpg6IEKDpdUjqfdWW55GW5C452amvMxy6YESnRDrD6hnEUnPoIl0r7JSBzX16wT2PjyH4QR4aG8I/kG7TZ68m7k4mGpIowFvLFpJhXxJtkhhxUoMwY1S84hF3gOo9TbJzfo6klro0ECF0UcZ406fH4MotRG12SrllffcXIOc4ou3aBsnabrLvxUvXphlfwX0rBdvUJ/+9Di0tvG9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by AS8PR04MB9192.eurprd04.prod.outlook.com (2603:10a6:20b:44f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 06:33:33 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 06:33:33 +0000
From: Wei Fang <wei.fang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add NETC support for i.MX95
Date: Wed, 18 Dec 2024 14:17:23 +0800
Message-Id: <20241218061725.1608466-1-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|AS8PR04MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd5b605-19a0-470d-587d-08dd1f2de4fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0URExys3xRuEBst9fdoR+58hVa3XYOaMpoN0Y0kzNngIPfyCQ6t1gh3B3J+A?=
 =?us-ascii?Q?M+hIzE00ECMxGESNXggD/jONdWYw+nhLQcPn1oM2U4XGyHl0ckquqtsyGdLl?=
 =?us-ascii?Q?etl/F/OY4uTq4wS3pFSzAlPw3x2sY9ejgVS9HuFX6t7sdZMTyYQQu10OC/Gz?=
 =?us-ascii?Q?PybnLSCBJCzqd8csCXACYRw2AM7RNkrlZdQxQ15ZYAuHx77OCsQdsdLxjyfv?=
 =?us-ascii?Q?mBPFkepjNP4lDugFoPC+n+O8wqyRPYLdCaaxox6smOQnqSt7KckDu7V1o537?=
 =?us-ascii?Q?Hr/xaMSVpXqGfqK5g5RXpMW30hxReJsNlEOBmk3FcZtqOWUbFPubh5AzdpxC?=
 =?us-ascii?Q?RdGGIlOyiUJgKvXK0oMVWxzXzWpNazlbZWUSoxLH1Xxm1GoZoKCkZ8cKX5Lq?=
 =?us-ascii?Q?QlvNIn5FONXKSLMGgj2zybRUtZZJquG5BbH4YCRtbc16LsxkqSIPwG2xW+/O?=
 =?us-ascii?Q?gyTpWEgHKeN4MWXoxegdSTGVdWJTTlouoxWDNtbw6kk+F+6y10Aaw8QzvXXN?=
 =?us-ascii?Q?br80S8rKo2ahvseNSGuuFNtifOUPhbxrOdYerMwVfchNCyfeZI5W/aZTp71w?=
 =?us-ascii?Q?OTlk1+hy0gBAQ8rB4694m+UrPzTQGtk14rOaQQuGJPPRb6zsPhyRFx+azasN?=
 =?us-ascii?Q?5fVekDVpaZuhvuz0MOdImHjqqN/pRXFUyqNKeZKYJKUettPlF5Ljs/GeIXIr?=
 =?us-ascii?Q?BKZeLX96Qr9//ugQpVC1BquJyPP0LNjHSLt2WZGNKCeLQec+vevaRYMg2lE4?=
 =?us-ascii?Q?+qivRpW6s9mPf9VV1/xt83ZK6dmvmDhu7jOnnST4RONZDthJxZt89WzXlpmb?=
 =?us-ascii?Q?G8xvX7i4wZyOwLolpk24vg0NejYekXyoClPa5SQQEgdFcH2qc7isARFUpXA1?=
 =?us-ascii?Q?jbCyU4pGF4RVVUg0mrAsfivP3dR5Dn7rF3yIQMRBc3ZOszbxEW6pO0bzZ2q0?=
 =?us-ascii?Q?6p7pHMnJpPoAjg/AKdjtfLRycHyDXU+9CNVhe5/qrE/Wy+Zt2qgJn9TV5At8?=
 =?us-ascii?Q?dwye5FeZKSTcGakJQQ+B52gYW/rmBV5Xh1ewT6+rBpZqvBnl0dcsbza4Qbac?=
 =?us-ascii?Q?4/p6XJi/ltwn7Hzjrcn3bjC4iyywxX3kQ/dt6IfsF3GXHPJm7Adf7N7YcJLY?=
 =?us-ascii?Q?ClIo6hjsgdDs7KU+vW2yuyHSkPTxXncrFq1XwsXs9SDNwJW7gtbvl5CI+w5J?=
 =?us-ascii?Q?bV46EgwYAOskZUoEmWJxq7oyuabaLEPjbyC2e6QuRh0AtPNDVZmuOQSl8Ahj?=
 =?us-ascii?Q?fZh2RIrCSbIux+pyqjx2N0xyUQba6Ud0BLH7Qz6QoUQngZjouoJLzLViTCej?=
 =?us-ascii?Q?g3U/AP5Ewbep5iEV+Sm3uNUD9dlr9n2IXYzF9eyZ8tstpNmnFU6fsOLwGkxZ?=
 =?us-ascii?Q?/wUgql+x4NchkErckiNsVvt9uoB+F5spuNz797k8QSnC8tiE6LvSylnnxRNt?=
 =?us-ascii?Q?uVT28iKBmcBYk9/gDYDkafeKmQH2y6cT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yE1NTS4ezI5qaQf/OPvcTeEEMQYDkqll+kb6ariRv272gfF0n2gKdU4PI4fL?=
 =?us-ascii?Q?iTQmfnJk/Z2hdJrNHpN8n4fSdoXCyl0vpzTa8lgfoFXTlaynklMa4WRYGaDM?=
 =?us-ascii?Q?AptUNetmdnp6b94ewZrsR/Azp57dwV3gOxwCcAae4tdDfKYCrN9N52ZkB0DA?=
 =?us-ascii?Q?11qWD5bSUNyG/Y82uJEnMz/SGovHzBYSA+sbs6LRA3SErCe/PyLyvDJHd3mk?=
 =?us-ascii?Q?AV23PmRVAft9HcoeHhRv+4cM6WC5BTL34KRtTQinSyO36QOJoyKS5p2Fq318?=
 =?us-ascii?Q?a2iGjt+ENhSjn97K8LbPKJWGmnAwSRst+AP3O5ydVHrHijbQLioOa8Qrzd79?=
 =?us-ascii?Q?RaCvjrJmTEdALxSko8dvo1ugNZfu1E/UfBNN/SUYVQZQ3Xaz0u3NuYFReKce?=
 =?us-ascii?Q?MFr9GOOOsAjwd6wIjyNGN7/MZ/naFmNNbatHpVeg/0uHDB4QwhXFVKK5Ji2E?=
 =?us-ascii?Q?MBW1C6a1/42ils56WM3gCzRkYfe+za9YG92RDNlu18OHScJ1kuaaIjZy1bxq?=
 =?us-ascii?Q?nMOQcRmN4DqKADkyWfTHhISj6tljsSB/N2MhwqHJZwTMr28KtDDwLKaK+/FX?=
 =?us-ascii?Q?Z85utvGIC2o1PVkx/CR9FUPE8lzgmvayJiTqxrbaqB43WyDDRwA2BrB4qqBo?=
 =?us-ascii?Q?JOXBDIu/JK22wRcme76KKzp6ggTmUsJAhweDopTs1Uqc/elTgij3IhcOakDh?=
 =?us-ascii?Q?abspkCWZYcTPN76Ctl6aoff3eor/zZ8sU6aWWJduJFnL+ByEaYohvFIa7exa?=
 =?us-ascii?Q?BONmcGH4LECbRQqwex1pIkSuvMPI5tEdRMCX379HvwKkHSulJyU+UNL0Xq3W?=
 =?us-ascii?Q?QRPpHvLoy2bhI5HU3UeLdQXW24tAVByegOdjSvZx/spUP7NQXfTWnVKq+g4W?=
 =?us-ascii?Q?LCpcnJqUYDiNuW6oIcpBsiulLssGwjlB0N5sK2NbJg0UQILAj7N46ahAmwWN?=
 =?us-ascii?Q?W0QDwEBgXlP94crwOoBZtN+y1gGtQWMHS6eJJFkjc9uhh1D0IVLTjgkXbzqs?=
 =?us-ascii?Q?hRXef3XOymN8ld96fYALOiyeX1z87djxtWdA5AU/jIxCDARAqTiIIcIQdAnt?=
 =?us-ascii?Q?jXNjVqbBVixU5KPpnKwUYn3x/IqORo2C2z9E/n0KMJIMcjDsWpfCSURSXdfc?=
 =?us-ascii?Q?c3rPuvxTCcv150jS3ZXEbsPScNKiM2hMwqn7eYK+4U7PsPLBk9nruo7ikVWY?=
 =?us-ascii?Q?yuhxZBeOSKcH1CQLiLySh0EOBnFc78rkLpc9dMP4WZGDk6djEMu2i7/4Fr8j?=
 =?us-ascii?Q?mY/IX+V6OIodMA91Up6RrO40Tb91RC7iqxWA7MxZUbbSG7/+CAn3tievC31v?=
 =?us-ascii?Q?7hn5g8lOAEXpf9X7mm0WnRrBvmsZaF1vc6JIg+/S5d8JniKdKS0WSuh7dbM7?=
 =?us-ascii?Q?sjifEV5v5neDoJ4CqXL3LYc6MsbHc0vRWDkUl55EHIqUh4iL9Gz8EZL9GD7j?=
 =?us-ascii?Q?AhFOO0zXzCVMaMMSwbmpvvp/ORPkJ7bxjgGcJksm0Su/7+SKNZ1SE/KY9Obg?=
 =?us-ascii?Q?rb6EHt/Bi3bjROh+qxoLHp17OxgH1vB3wtqEE+81cpVtskIBgv3tDA4KPU0+?=
 =?us-ascii?Q?r64LGO9UYkriAFyrLcGBdrNH8xCLMH+41BVSmTVl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd5b605-19a0-470d-587d-08dd1f2de4fd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 06:33:33.5961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHCrSZ/+XtfmrApT8AVzB36/C9gIJunEy0E7b5QxBH4R2hBgujMldIIxNqN4nXMh2DiS0MsdCGS8h1jTnkMATg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9192

We have added support for i.MX95 NETC related drivers, so it's time to
add NETC related nodes in DTS and enable the use of ENETC 0.

Wei Fang (2):
  arm64: dts: imx95: add NETC related nodes
  arm64: dts: imx95: add ENETC 0 support

 .../boot/dts/freescale/imx95-19x19-evk.dts    | 52 +++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 93 +++++++++++++++++++
 2 files changed, 145 insertions(+)

-- 
2.34.1

