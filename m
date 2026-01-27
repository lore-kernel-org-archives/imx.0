Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFCF29DB64
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503085; cv=fail; b=IjciMLob3SrMuH8YJg6lB5+JYEjlyt8B59DS7/OPvTZk8snnTcJ5q1liF4rtOulFor5Uf8/NuHoV+cv5ph8W7O0aVkIR2k0eIDbgxSdgBquCWFQEtokaxbtCLHKBL+E0bRLoF0ccm4M5fvq4xt6qq2fV8rRjfHnrDFNshIz/Wko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503085; c=relaxed/simple;
	bh=fO0Xo4ll8/E8o6sYo8e3VmXjTgn/XMJGRNlyAnRZ1xU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=owIfCFAxqRH9QQtT+0RQqW/bCga30kOOXoTnoZ/hzlu7tgM4jG1qvbvzVwf/xXzH+Gta3Q4xbLsseVDbwJt4lK1x4c6t97OIoAzTusJI+aQhoCq8lhlgRfsMHLGOLFCF86Uf5RnA/43bBR/OCEPC/R/i3TZqAbAq0rrp89B+JTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gZX0hc8z; arc=fail smtp.client-ip=40.107.162.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gZX0hc8z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwNzAy0ZS9hgtJP3pXw/clBjDBA3wxXkEEy6qX7qkyI7nXrFGHiuUJyQSDkZ/wZHoBtA31BvmIw+sMiSNQ+AaEunQ0xiJNi0vFs9hAuiSMwH8y5aivqKpb4WsqdIo/qXgAocdMBrs4chXWr24/swWpIP6zJmrN6QfU0kfaG3BLnkarL1noQpv1p/Rz9qr9ZEfIH1/Xi977RoLY355H0CNZOSMvQM/UKumI66Nsu+b+BYgn6TDrwUj3dk2af8xqQGesjSft5fi2eKBQdfGEhtal8Lnw8rKQJggRcgver8ItW+XnnxSC+V4HhWs3MjhVwxCLSvEzxHunk76Xi6H4QihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/fp6GIzbNYBUMfiLiiUnsj8kzZYxVsc6nHuwj1E5yo=;
 b=rAzkhK3vyXIYNmmpD+Lgr91i9dovww7yQWDbt0KTmqWpQoyQSK51rTTDv7zH1+60hlKRjdz3xdsG231MLUtdpydFTL0eqbO0e4Kz3m9CBXi2MDLW2A8TzirOKEi8ddbRwUNj9lqzaEDwB72bpvQZL4tgbL+OWBl2MATMqWsvipn7y7rrvMnw5XcdjHbb2lZlcBzuc7V9sS2m8MdZtnQLoHY6OkxcjqO3V9wvtLaF75ZzxGzEfWg+s22NlIcPNoONhQ0cMP+TsAEwtn74JyWJUUGKLNyZj1Qve1JIyzLKHd89YED2IW1qEOVMhzcbplpTH+gClr39+o2Rj80w501HxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/fp6GIzbNYBUMfiLiiUnsj8kzZYxVsc6nHuwj1E5yo=;
 b=gZX0hc8zuintc3vwXE9bhNRAljhS6CUA3mDbdoMfhth4FnnysK40cvUtKepg4XniD35fUvsxPK1Eet6kncAJVJ+QHZX/3Ukt03sgf3F6oFJW4x2uuVJGJ4f1XDQUngnTMK7XiF0TJVlBxWya7p3FlJ1EBsQ2+bNAHp39qguicYC6eFU39BzRxWcSVwI7ZxOBmOlX8XckyKunc/ajYCWIGnoLtbpW/G00vN/EIjgP/kg/Pe+kuKNjiyQvyZErSWdPzrhfbFaAluxJw9ANYDWDcAoCJ5hAZIL576CcebJbmwBbEKi8bxhz8JdED7+I3kRtg81rCxN/CoCgRiGrY02ayA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 08:38:00 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 08:38:00 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/3] arm64: dts: imx93: Add i.MX93 Wireless EVK and refactor common parts
Date: Tue, 27 Jan 2026 16:37:24 +0800
Message-Id: <20260127083727.1839605-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0088.apcprd02.prod.outlook.com
 (2603:1096:4:90::28) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS4PR04MB9386:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b1b0d9-6b8a-44c5-e934-08de5d7f60a5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|7416014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?PcWbBTFAmN9UBQ7R4jaPOARbzLvqQCyX5ekLt4Jjf6oHmLGI+RZiTeQbdUKD?=
 =?us-ascii?Q?/0YAnZWDMUaCr9+A6XqVH3CLpDYwLej8fxZ7iu17+104MjzMFuxBcX9PSggE?=
 =?us-ascii?Q?sXYx48YWGux7YJVpN+xn5ziz+IFJXLrPHOvGJYfLVP/h2gBNAKsCgVer9d6z?=
 =?us-ascii?Q?jMhUOP8uDXx+20M/FaU9pXMmfmeMWPjk5Wtem5yc72R36tJaxDLTycuTZv3J?=
 =?us-ascii?Q?rCPnA9w7Xn4ee9xqmeXywlx14pADx/vEHEce5sX4Fkv1JqA9rp9G1t6GVk5w?=
 =?us-ascii?Q?p3kN42KH0E8fl0xX11ba7AEM7zI8knMYJw+5j4/5ApM/hZMVmWIIFeYo8etr?=
 =?us-ascii?Q?Ga2oKOesjpYYtpMmLzSkxhRgZ8Il2dyOb4i3bDNL7B0BuV9kDSsbBSpZ0zO8?=
 =?us-ascii?Q?lxE9GD/f1SqiqSfSKyEVeRpuxpBPpkDetHC3nb2AOWVhU7P1jzSJSqmEOVhw?=
 =?us-ascii?Q?CKSozYk73EDnwtQ/eivepb4GQgYA0mYXekZLrJTOiNd+MXTYv82Gff/Bu6/E?=
 =?us-ascii?Q?uRG5RKlKlKBQp3tDKcSDs7ORmMGKWduYkPFziEXWdsGWPmMBbhsvUwsOEDNS?=
 =?us-ascii?Q?93nQVVUMtYT2aI4aEN0C6HEX8yvSiHhUoh38QqkuZVA+xVi1dNoioaB6YusN?=
 =?us-ascii?Q?sB0YsR1Pd6KT8FNkIh0JSaDSazl9STRL04yre8YztYzlnTU9HdAa1TEDD3TR?=
 =?us-ascii?Q?BZmrc5uBt3uMAwoZaVXTwWX+kPcyU+NisKFxmXZrXHK/BYniI0MXGI9zqmBN?=
 =?us-ascii?Q?dAuvWc601+XYVuVFoDFX1eHlSfucP7jks9POR5ORby8WQhkwzV84Hh/mDFXJ?=
 =?us-ascii?Q?41WQy6LxGISgGpEB82pjPovyVlnzfZOXRB8c7kGi7W+xITIgo4oDZazUpQYk?=
 =?us-ascii?Q?M4S1rVXYtQWQ5lO/IjDjr/swLp6eVczWlDU6hxciMRJBJsMNOHvvB/PVI4w+?=
 =?us-ascii?Q?EJNoJlmO+GZ7ttsYktGd0N4i4XS6vECJfiNdnBGPOjFw1w58eIIp4VFjTX7e?=
 =?us-ascii?Q?o+Ikoe5CnTLXa3INTnwOf3mYJRdHhikZB0q6B7iw8VWKNFNh8RlLDyyUBMVc?=
 =?us-ascii?Q?ZkvXN3YXTE5m1rjv4snSHjuoH2xyN+NupKaGS6kkIae0XUbuNNM5YObVJTPG?=
 =?us-ascii?Q?7DfqsZepJf7kowL3WDmKs+QfJd/EkLaFUJw/KkuCiPpLkfIFV2Miem7fL12q?=
 =?us-ascii?Q?94KXIMiKFp03i0/5E0dRkCisgru+3l1q7HxGqIRz/SuOb/hbYWnqySsEdwxG?=
 =?us-ascii?Q?cNRXOgnUY1IMUGQEsep4fi3OdVXJ9AsG8L2pStBbeMQ3pGoi2x7+DbQbvpmA?=
 =?us-ascii?Q?uzX0b9gNiLi/dqOhCobq3YLSoE/ghXu0h+rNklE6Jq4H1WjpbxhmmCJlSa9J?=
 =?us-ascii?Q?CzJuKNXBvLY39+8W4Xa48AOOhWWtBTvP7cIuyCA0LGXjdwu0TMlgob8vO5C+?=
 =?us-ascii?Q?TI5JZ7oFZuayDGGmhCRUBNlXN6cn1gq5xBFy4SuOmwZZvvKMsQdjUU1wYSXB?=
 =?us-ascii?Q?HmDxFPCaD6em1dRQceGi/BjJ77J09yrVpj5Wd+GmTqp6/hDLu1UPe1p4ydBX?=
 =?us-ascii?Q?LNfPCcbi7XFLRWKwM7NOx+pVA+tU2CFph3gqY+ip0C4dS7ZrR15MbaLt2Rif?=
 =?us-ascii?Q?y9tL4GMY1COAlH9X0dVEGoQqjl1DlPGbEBCwRDvJou3j?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(7416014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?qGpX0oCDDPL8MbfOHpbLLme6FfWxktYB0PWAEEq01c0ysTZ2S1PmDLZF2TZw?=
 =?us-ascii?Q?6Tp8Z9KlOSKvS4VqoVXITKFkvyy8CRH/biX9jJYLazi9MZYtL+CzJLVRd3jY?=
 =?us-ascii?Q?TZKzC+66w8qphfkWsStH6klRq+d4uTkHbTHsP3zUR/XCAJPuVODylInFXsQ2?=
 =?us-ascii?Q?1pHjc5ajY5zzJcWqWJfqDsCfMVah9LvPanGzW9g3RtRL3XK17C5JUz3MXBYc?=
 =?us-ascii?Q?BK++zR1nrPxn77C1LLlI3lMSOadv6C3qO2bNg71zIzlhJex2WMZ3VaVteRAo?=
 =?us-ascii?Q?aAHNJX+0Q4gtipVNnNdtdZykSAPdGsEA/aMU0YUEDzMuuWXWN84h9LEihWRD?=
 =?us-ascii?Q?cuctQt0FaNFsgJIMHKGQZngdhE9n+5McaJuOFNaXu923R8RG5haBCHm5G5Ly?=
 =?us-ascii?Q?7sagf2B2Qq0f6adLkyn/PLVeannm6IDBnHIeTRA5nveuthba/TLmZg7Wm2F1?=
 =?us-ascii?Q?tmUFH97EdzTRQnbiTgWp6bmp7X5/g9mraVfJTS8IigGips2O8iDa+/2Wt+pr?=
 =?us-ascii?Q?88UV4FjeZGS35jtOcoL6kYksJ5rg3SNli1wrnKKYsaaWpqxUJYyva5CyMLCg?=
 =?us-ascii?Q?+a43Kk+LtHDdmY2kb2fmr/q4QiTrGiStc4SGsmhKsw4PqB9uS67DghvPQCeI?=
 =?us-ascii?Q?HXgLVB4/idxbuc1vrf5256WbUVx/X443FSDlP7LtX5KK3OVDNwe6921DdyNX?=
 =?us-ascii?Q?RWrAsWvdUjDCbtsT3KsXBEtI7BhY9Q66hLvq7RQ7tJhhRTx5UfjYjPSJ4wSX?=
 =?us-ascii?Q?Vu1NnaKsjxKIlnFNfSoi047PQedilITxteVpDWpGBQqS5RTHY9D3ROxoVLC0?=
 =?us-ascii?Q?6c5J8Nz8CxkjVU30KL25saxA3wio71P6R7DnQHziFWsybHLiaXmZZE92ViO4?=
 =?us-ascii?Q?4FeO8LVOjEbmsY6WcG70n2Yxh+kIBPnqM45ZlFNAhlh46MiHBvJhRo+xV8X6?=
 =?us-ascii?Q?tR7bMYwJP6buTJcFUHO4RGKgQ3VNh4F9aaCxCbGRc+ZdZpVy1uzR62acLFyV?=
 =?us-ascii?Q?wTzNlCu1n8d+mkCZda/4AHLvLykg4y9wdadLv2c1bQN0kT1mYrxRd6GW/Cnn?=
 =?us-ascii?Q?tiIbYJ96PNm31kILHL8QXxm0hyNP0IviqLpSpac7Wxk0rreX7D9G6WBNbyh0?=
 =?us-ascii?Q?ecPNbR/r2RWQQhmeqy53kAOvrF9fwPpQTmopVRo3ZTDs9JEubCIN3ytRi7io?=
 =?us-ascii?Q?hZ+3245AK9TFih7VlR6qUVyffoch2/vDCscs5BZOsqx/2L8PONwJojfZHJ02?=
 =?us-ascii?Q?yAdVfJbDD/73POLzkhV+ic609OERrcCF7uRD7ZOZEHevruzZlOeYrjZFRuG9?=
 =?us-ascii?Q?tZ99yzZ2qKjEHtL72qs/B9+d4DakxPCKVbtxCVNR1Yq5W7kND4B7ZXU6APAF?=
 =?us-ascii?Q?/0Phed1k9fy7aNK9XVQ03DWMCLIcuw7xK+k6vrJdx9QISgXUUaVmDmKVCZdi?=
 =?us-ascii?Q?IiBK4e/88ciD+xC4sNdHUwFN6jWR3R44nM4F6U6mCWEWG9qPmBbTCf5A36Aw?=
 =?us-ascii?Q?ytsg8rvTwdOGC74Zzg+e5kZ2vhaFw01Gr4i6DUDVxKAST6EbRqqxtxZhhREH?=
 =?us-ascii?Q?k7bZAd5piIEcr/7yOON+BS1YrLskGlSP8XvhQTBoshzLek7DUHDYmqPirws5?=
 =?us-ascii?Q?Yxd9EmQy0SYdVjQebqmCk2bhXlivCU3knHXrhbWSJI/3t/BcUs+P9UP15sYQ?=
 =?us-ascii?Q?fJAWxJrP9Z7Zi/ja4jzXxGuvtS/a8fiSF+OzYpK28jAaF2ksO3w8GA2m+bwO?=
 =?us-ascii?Q?lkDOMH9S5w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b1b0d9-6b8a-44c5-e934-08de5d7f60a5
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 08:37:59.9066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: so3jVoDIEzmmu1N9hMo/pUWWqJcpbTI1Ru71QvgJ275b8HPBhOMv46NFE+KinHHOeVJz+5Vfw2ruQONMY5EQmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9386

This patch set adds support for the NXP i.MX93 Wireless EVK and refactors
the existing i.MX93 11x11 EVK DTS to share the common parts via a new
imx93-evk-common.dtsi. The Wireless EVK integrates i.MX93 with an IW610
(WiFi + BLE + 802.15.4) SiP and reuses most of the 11x11 EVK design with
minor functional and pin connection differences.

---
Changes in V3:
1. Delete unnecessary parts in patch#1 commit message as Krzysztof suggested.
2. Add Acked-by tag.
3. Add patch#2 to extract the common parts of 11x11 EVK into
   imx93-evk-common.dtsi.

Changes in V2:
1. Rename the compatible string to fsl,imx93-wireless-evk which is more
   clearer and better aligned with the naming convention used on previous
   NXP boards.
2. Impreove the patch#1 commit message to add more info. 
---

Sherry Sun (3):
  dt-bindings: arm: fsl: Add i.MX93 Wireless EVK board
  arm64: dts: imx93: Extract common parts of 11x11 EVK into
    imx93-evk-common.dtsi
  arm64: dts: imx93: Add i.MX93 Wireless EVK board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 954 +-----------------
 .../boot/dts/freescale/imx93-evk-common.dtsi  | 950 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93w-evk.dts  |  52 +
 5 files changed, 1014 insertions(+), 944 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts

-- 
2.37.1

