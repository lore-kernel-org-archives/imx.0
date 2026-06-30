Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243E436C9ED
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 02:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782786595; cv=fail; b=PmYI69DjjVOjBrOI7Vd/8m3otICKyMx5UjTZvguHM8+JIs2ynIWiFGJ/nlruNYT1C/SZBZp7RKLXfEpeuB4gHjSiJ3tJqOnauNRsjeAWbqVxCRGKn/mo6M7AIWiGRD0q8t/4KB2xB8lgYo3ivA8FkWYEGL9WEIZWsNclt38DHO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782786595; c=relaxed/simple;
	bh=9eS8H05/lvXnAIbqlHfAt4BmtbKAqVAoLLMCy8Dc19I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sOBXeZAe0MJ9TaORMYLTfHeovJIWJkoWSHLmfMy1w/aNVpSLkcz1bcBGsrdY9aXNBhU8CLGBARlnKEKBTjbtlB00dzpY9j0YMXK/LaYp+jhW4IHFYdpJ6vdHHddCd5VBzmVaKYWETwvQ+wwIQe7nmkHQdqSP3Mw6PUOD1rW6CK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YQhgYiaw; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YQhgYiaw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+Brh8olRsogn6qXJ621Kktpiob3X2WNkSFk0vVKcFXY7Txpws61AyUZHfT1QH5zMot1JPxIZho63pzwrv2bq9uqekW8Iv/Ch9XsmdmyTmpOG9wp5kwgAnDQTG7jH8N1F/qxpk1mFSgXbSXT4FH0Y9KUklN1P62IdQy7mRFrCyZfS7xmCH8c3UA8mV1qwJ5ryZ2YcaTVW8uEt60Fcn/+N+WmaIKxesxHVW4z8JgHt9JTVoslAYTW7uCr+sPy5StmhpSNDn+GCjzofju4LQipwzryjN9sUV2LZJHQsIjDsJIsYt0HkFdtvOkkXBohOayseZs0l46oAMks6AOU+s1EmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QkISQeXrMgzJU+FL//ySPlWgWQVe0TAfqwCRSoGF4U=;
 b=T/+nsMePUo7c9DaU8/11XHtos62GMmd1S4xbyRMD9K8fGb2IbzdkJFzdA/A4rSrcWF6eqLyxx4sxQe3jG+ows79UJf1lExYA7Lgim/aU5vJJF+uM4qUh9Y1vQTCXdhtmy7gv5dJlOHJ0z65w3TG1I/dsEgw4ubYTG5RcYlLu7n/+7G5UFPBJ62pH8S5betAhaSuD1dMNdG5R5jCPAs60fZw3/yZ9fGRX/yQsVxgIWWbr7TKWrcGHLgARKVfvs+3/yDpSDV0xz5idKB3JXFZcfot46yUchlv8zUWmPZFIqUPviUvXMl2BbzlTu2//bmDSFw3koMF4hSOL/aNkUfilIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QkISQeXrMgzJU+FL//ySPlWgWQVe0TAfqwCRSoGF4U=;
 b=YQhgYiawBdVTw7f2aYNIU71yX88tq935MI1ylrbH6ed6GHoQXPIslOzZPU/iZuJJYLhI1OtBTrIJDmh/gKM/d1nz6VdWEB01oQb0428/mpNHm9mrSFeQLP5D826uefjeEpbqeXO/veKF3zMIYN9T1UZuYiN/PouI/Q0L9LVK6ivBNXVWoXbxXgTHvzSnqV74rONMDZz7kKXCtRgPzgLpuAfYky8nRx9L2ZgDC06ACsFALJUZz+VHOEvsj8SbaxnXiv6uwRsb9ljj9mFkl+sO4tBUW02lsut3q1A2nXrjhmiA1qt/aWrTcDEsGxGMy24weiXksAYV5nI5gskA/K7iXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by DB9PR04MB11661.eurprd04.prod.outlook.com (2603:10a6:10:60f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 30 Jun
 2026 02:29:47 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 02:29:47 +0000
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
Subject: [PATCH v5 1/2] arm64: dts: imx94: Add Root Port node
Date: Tue, 30 Jun 2026 10:30:05 +0800
Message-Id: <20260630023006.3247578-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
 To PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|DB9PR04MB11661:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9aeec8-d6fd-487b-6af9-08ded64f73f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|19092799006|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/+IGTJjlaDm4DvCFnREudVu9rRoZtA1ymsz85ZNaz19MqDJ492l/nv55VFrZH9D8fcLx1/J9HYHZbsqFydin/Tmtk7jrvz3rvzWWpCPSJBkPrQutx5BNufvMfWZPRiBqtsudOYcv5wrZK4GfFkHoRfS1SUJ6npWXnb76ExemmqE1YjOeOncL3J43b1Ue+yMf2vo2PGVirRb8oE3ILeIyTNEVF3ixtkLzvcxO31p0LYVNGFyUsXDqhOOPLZpKlPJRxjQhcZOqgq87H7z7If1JplkjbL+kpuYm7hQhxCG8Yn4RM18V56yEROl/M9NDRe2Kjtgp9PJJNYVAYwgqSWWJAAKcNzVs+qpH96OG7Pqd7dXVPYvnshT9GBE9Vldd8eN+/n21uyaN5f/VFs7YEfkhOBq9BSJ+sJTUkOu1fHjWhPA+ZgdH1Lr0w+yQXfXLHDQ71C24v20dzn+K28m9s9YEoiJH3qI7AVvBuqp3fy9L1u50ZbuEvdEBGDjCjU1YeEzSX3hl+V4DqEu2FsGB1xp1AldA13CW5zUzkGgskN3zckBggcympivyTf3SDrEWuTiTt0weRGCDVGY0GQecBDde+Mat6jnBCCXXvKzxLogatfIBDlR8khci0hZC/AM30jnAxyOuCTzm5U4VHePt0JCGaVjCmEr1arOjI8wqTJnkBm8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(19092799006)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tn6xtyfRGmx+7sEpz1PdvOJNDFcmsR8fDasd0xlPSp6hYEe1jfDJv4ksOk32?=
 =?us-ascii?Q?w5XdXQD1GK2vaePmXtIMu+mQ5WKnS6LNpAvB/wWTgnWNpqt3mba6ZKVET2lG?=
 =?us-ascii?Q?oJuefFnoxDHX7A5gvKiwbBy68FST2WybtOitwFPJ5KXEVTUm2ts4xl1jUaLg?=
 =?us-ascii?Q?9waAy05VUR24XnppKEJ9pBgHIxpVGINgzDW5DgCjlGbEJ/Qn2yapRzAcvMXV?=
 =?us-ascii?Q?qmgPzJ+yqTYU/965XaGkShvYVuF53O5RrLELCpX5axubqZeca/omLI1b7Bru?=
 =?us-ascii?Q?tLyxTyCfpuxhiwlvUyuCSHhGruBc4Z7Ohx27sSS/NUx6dknF5vNGPOxjIvgJ?=
 =?us-ascii?Q?bjpZ7m0o0ZUIcFLz0dkMjNGWLEk1UlCVWtIYitn+bttoMNdOC90hioCQIQk0?=
 =?us-ascii?Q?sPBRBrUX99+Tyr34O+WnmYBC/ke/+ctd/MeUX8loCAZ4L0nd+6nu5MXvhPUS?=
 =?us-ascii?Q?/Kun8bv6XZojLBS+YQk+4Oca2ILfRthd8Qqn6hFH31ujuosiCydgIF1LmGgC?=
 =?us-ascii?Q?wknEe6sgtws90hDDdeR/baEGSfbunfmSt11tLEuVVS+ioQmH1ndI/aqboLUe?=
 =?us-ascii?Q?/aB1U+7Di1KnVHW363/LNzxWqKmT1r/tKkhBPeLdbUdntqSfgzvMC6uM+Ewf?=
 =?us-ascii?Q?nMgzSwqMicvwJ9RIrsYfZek8fgauYxzfTYnESgOjO2ONijNNOqVFjnASKk0h?=
 =?us-ascii?Q?pqKA9DF3GqRhAEAiovDu/d4FkIf+M0Tcg0wvZEkQLkyTIksXTz+JQmSZaz2m?=
 =?us-ascii?Q?3SsSUMszrFmbSFIQKHvhIufUhJXc/8XzhsyK3bYIVyF6XYzhVEAkFQ6anZOx?=
 =?us-ascii?Q?ugGVZnbtYY3IENWu3RcC08AFu1/g1aWz2B/J1Qsya/rYBTXkKcDs/GWNbF/N?=
 =?us-ascii?Q?s7Q2bvNQ8rwKkvjEZ4A/YYyM5Va3kVRMULmDmY9r3n2lQgsEswwfQ5p3O2Dl?=
 =?us-ascii?Q?qd09hO4TSqltWs7mJpkVpjHmEgzNpLOngIAAZ4ceVn8nhls/Myo+CArADsXc?=
 =?us-ascii?Q?2/F2xK33NEzuAJ39qp5OiioHvvTNLGmPbvsKmWm5XDn5p2r1i/SX4u/MFTOT?=
 =?us-ascii?Q?Kg7btjPxGT9X+WKX5+M8Jy6orXXdLD2L6z1VZBIGPeRaawx4ZU0TTQwQK/Xd?=
 =?us-ascii?Q?XgpR/OUMkgV/+KkSiG9El3/Ehw4PhD/O99DXg/zrssUd96ZSVnz1CY6VZOAw?=
 =?us-ascii?Q?O097iY1NtY+yWIEpm7clVB0MIkFFt1UGB+DL32wFaU2pF6zuB/EOl3CsY0QY?=
 =?us-ascii?Q?6LRtWyJPEfi9AH0y89iOaROdQ5N0UE8H8JY08xnN+QqRXYzQ5SoF1RpoSUl4?=
 =?us-ascii?Q?2zjXpTvVtBy8BCuJ9QNP4OhbaTJk0gPyObHh2tDyCuDiA3WLilI4L2BM9of/?=
 =?us-ascii?Q?deMOmRpnrWsewZXcrPcWxviaAoDq+ikQQ2yOt4ImfYnBaeWM8dGHj09TtCpv?=
 =?us-ascii?Q?+QxtgIXKK0lGiTtaEotuLK5ShF2Z0VwI8Pwy17MMx5FvimEBbxKmUm0ZSqR2?=
 =?us-ascii?Q?zAsuUHtd87T2A4o4z6/MXTLQtxo5CmqlWlHwjMc7rpeITQhHJdmyFFk8q9RU?=
 =?us-ascii?Q?9skZ/pL/42O4SW6g9hwKi+ov1vKx1rZV1yAUAk9xsVHZlESdcE+7wv2jB4h6?=
 =?us-ascii?Q?aB8FeFbdsGaOqwBEb9ppBFbrtQmOZADSiG9YcmHmM4uKRirPclXy5WbIXNcF?=
 =?us-ascii?Q?DcXkiIWJQ+77nYZBQr9fLf7HBNmTAxHWA6R5jYz14Vk8N4ZDrmtaupMH75aR?=
 =?us-ascii?Q?7cycq5CG2NwXjYxOwGk4ptwI/2Ud7JIyFqSxxddlJiM5jo8Wx9l5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9aeec8-d6fd-487b-6af9-08ded64f73f7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 02:29:47.1769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGV9mxR3JfBawnhLMd6bHe1vLK9p0ZrDcF63SKlI01UWGjmSygZqV6txZprl9j+m5tJO/fO2YjFLtk6mbTAxDsE3tp22HBpTQ7fLt2dM5XK4nPhknsthtFaNmMIhC7iS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11661

From: Richard Zhu <hongxing.zhu@nxp.com>

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and pave the path to add the reset-gpios
and so on properties in Root Port later.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi  | 11 +++++++++++
 arch/arm64/boot/dts/freescale/imx943.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 1f9035e6cf159..dfbb73603cb24 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1411,6 +1411,17 @@ pcie0: pcie@4c300000 {
 			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
 			fsl,max-link-speed = <3>;
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie-ep@4c300000 {
diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index cf5b3dbb47ff7..01152fd0efa5e 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -255,6 +255,17 @@ pcie1: pcie@4c380000 {
 			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
 			fsl,max-link-speed = <3>;
 			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie1_ep: pcie-ep@4c380000 {
-- 
2.34.1

