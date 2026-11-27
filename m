Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772982;
	b=lisQ98szESFKMTGTwTGrMX/G76+Y/tcRNW8sP6nTZMx5kwSCqwtGw2Q5KxBSUeEv+8se
	 74zp4hkHEZTNAjYz3yTklAADxDODjKtv8TpB6YLLH7M07XqNe5QoWbePp96jmZ1YA82mG
	 I5ddsE67v2KfmXEHyTUWNQfW/WREqJytpx3dji/CNg0FZZ/D5NMcpuh2+EhlPIEqqwCZr
	 TSsJPWZnl17jeYUVGbHGowVvDsgxS4tLhj6Pya2LdeyYjRPO3pck4Y0ohDs1S9W/Psvwx
	 Y2ZFMM0wNroi65tG3B4ShLHkti7PUDdGBMX/vD2eJQOujWpulUMFcsgCxAOSytFukSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772982;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=L/SQvd/OGmNQmeE+NmNNC5UIvgRyYXac+0G92liMpxE=;
	b=CiBuYGrVJ4OThcbrRt7jTNmKKVG+iln6y3lsf9pBsDrY9jeWGHxfE/XWdLDzfF4QqUR5
	 Zm6X8OvX1OczjU1GcDNPacp0hjT4ytrGbYIBijpMjy8mGPehtCaJvtMFZ54wnO6NymXg1
	 Pba1T639ZGFU8prCPFOdhdhg0phCyO3X09Zb3Mo2eWyUP4lzIOJjeB0dKEC9HirsozIHp
	 9e81Es0RzK+vqHvllsLQooE3bjrh07t0ICSML/qzx3jLgaD7bsGsLODeo6K7XEKRMfqkK
	 SCcBXR054JiokBwE/oFLr9OyZqxQda2b1jUQHWkv2MtFpcuwPQL6R1mmfz2JZCZrnYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AsUKR7oz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.1
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F1606A321
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 812F1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AsUKR7oz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHfQL6W+Dwq6SbyUt6NpIqKOlJognziCuYhuG/e+XTMmmcYmdN9LqDt7LFZ1dbu8tWCD0SZ0ZhWzN6r4wNXb1h6Kt7YVhifxsyHQOgQXj0gZKMIFI70X48qG8KQS6FWOFJ3Onurwd8lfGFwOo77jYDleDLcPKbKY/2xtnT6wHEov9glAFUjGv+n1uAUQLJW4hNueYuJqH1J7MKq+7ClWJVdriFajx+4eDpLXH+hEAwiWje9NJyTLlpec91a6VZK7pstFJatfdTkRU7+X8g0n9usK2m1WtMgVcGE6gSkmIDMzfyiB9v2NeKczI1lEena7QvX8tXqYLyQIENFUlEFzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/SQvd/OGmNQmeE+NmNNC5UIvgRyYXac+0G92liMpxE=;
 b=cGzWqKf8EdvdePGBzi6ZTi++BnOi+/7fZ8EbQnjzoG9lcGPZ6HTfTBbrSl2n+w16/Ud2Ss8lpYZUU5LJiiU54or0YCGvurudpB/LKRZmrzkH5whFRDNP8TmToHBqFioUgQrmN39jSfN5T1krS9YGpzfgx8cZlbeXFPkdbMVjtSiBhgYsY83BPBS9OsLUxERIoklhKqmT2VM7cmBG1YwRyvlz8iNBP0cDDVSxM2DIyc6LpIOy4eozhFOVebH0mzS3pfPRbQLRjM5T2ivKZuM83z+zQLFtpdCQM5MDBPD3J3T4RjTEM2VVfa3lWSBBeUWbY3KvkK2wRtH5KAZOzP+naw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/SQvd/OGmNQmeE+NmNNC5UIvgRyYXac+0G92liMpxE=;
 b=AsUKR7ozJklkIW58OsYKgGO9/qutAhKPVjikkgvdMc7EhBzpXpl1oWBkc9fwEN2kDloe+jxRN8ySpp+55cO86Kb+12gvpDWfa1+S5qUWoxbAXE/xk7TMAKDMYzw6sg8HGRYmgzcaLQcNHMeexgh2rEbE8ixWTAFohOPUN99TdS1ebZhLkJWCY6EuDyjGZJukey65+O6vzkrUkHs4ODa330g952AOwT3jlkEE7OP7wCZhGaG+YTT4lBs8fduIpZUneQLK9fydhRW57xJ8BVApoNag+aCGGq/ULMDw9UVRL97swO6NttKvAZdn5wj/fytX0E7CBUqpyFR9QfqzR25NUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com (2603:10a6:2d0::cd)
 by MI3PR04MB088318.eurprd04.prod.outlook.com (2603:10a6:290:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:49:38 +0000
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd]) by BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd%7]) with mapi id 15.21.0639.012; Fri, 27 Nov 2026
 09:49:38 +0000
From: xiaoning.wang@oss.nxp.com
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	daniel.baluta@oss.nxp.com,
	frieder.schrempf@kontron.de
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Clark Wang <xiaoning.wang@nxp.com>
Subject: [PATCH net-next V2 0/7] net: enetc: add i.MX952 NETC v4.6 support
Date: Fri, 27 Nov 2026 17:47:22 +0800
Message-ID: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0012.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::12) To BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 (2603:10a6:2d0::cd)
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
X-MS-TrafficTypeDiagnostic: BR2PPF9D47B45B4:EE_|MI3PR04MB088318:EE_
X-MS-Office365-Filtering-Correlation-Id: d78dfcc0-08db-430b-fac9-08df4c6bc063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|7416014|56012099006|10067099003|261022113327099003|261022075727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pu6JHl6hNV0BzUWwHfjUJ3cMoVVYD47OD0xJqCWvhAYbgYcam2FkRca31ogMjDWrUY+e3eVctFrrtQ9BMxsv+KPksZEH+CCI9JwDG9hKMboS9j0uyJwHcusvXFZwD7eDjNV1pBD4J9jDqPUPZCCb5RYqU5tjD+MOV6xN7LEuNJAvWtSsmVPHG0ovnxfeeLVAoSVP0dvAOqZmxF0l3aOtnrcHixbRcWGoE8ZcyiN1Iw4iMyHxDAjqGCH4CffVO7BdVLfrMJ7ui7oyR+Nb5+N+GTSN2BlwcWg+bmuMuyR4ncXPN9qNZyZBcXAkR/o/B0bRBEYzvZQfPXxVQ+2Zcy7NRMMQ9VVVkfdwR/RDNuJk2nG+wY2WCm4HJeek36qtr6OwxKPOCUzpg/ha+MMs2lideN/Byr6r30EdlEvvnHtqn/O5rod2IrrzkkYgYPHp7nvJSn9WqvYEGK7y7Bice4EaMqXvemD0Gw/tkCTrW9gMO5YI4zdgzUonrnipcxDfpkwHLEl9JoolefM4TNuDkm9MQAbdlJFg1Hm8/wDwdk+lKpIub7TbZEzg7pxpUwAPSy00TvUk66LEL++qS6koAvyScB/zd6l1rtnH7ll+eU7bO0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BR2PPF9D47B45B4.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(7416014)(56012099006)(10067099003)(261022113327099003)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3/f1A34c58U6u1xOUbdpGthLQXA54CdYrTfnMJWfnrPUky0mcH4gU9r8H4/E?=
 =?us-ascii?Q?c/2vINV/JAdP28bTVhsDsnXZvkXXmlpD//0vnOrwrCPn5OIy+lM57mx9CuHY?=
 =?us-ascii?Q?8E5L+jamhl48Z418JyW3l3JjFfVIMhbmLVhIWxB04436RYWoIpgsQOEZDrS7?=
 =?us-ascii?Q?jAScs/UuzogDxfOiAfnGk2Y38Bp7RnxUIs9+NYffWsbMR/I56mqCFZUURIy8?=
 =?us-ascii?Q?HU6mkh7Q2C6ug00pekxNLIV/z83DIyP1rt0JfMOMX8MUatwOG79XtCYuMmN0?=
 =?us-ascii?Q?O8Gchl70fHZ0TiVl1aZSVrHovRksS3Sb6wTDVy5OAlbU1PNdD617Ay4iFtSo?=
 =?us-ascii?Q?qZ+ZD4IsDkoUDJ/d8VnIBTaUOOr0sAK04wwubyUMoZw8IQhCwZvgQn4CP/O/?=
 =?us-ascii?Q?Z3JFJL4raNlxdtrvQTow5P5FgN39J2RyPR4yDPGInnObssMb1taVnZjwoE5H?=
 =?us-ascii?Q?+gxkrYAsi2Y6mSdMHMZP/xZc90LoUNIrzqlaXuHFFoJ2qkzaKiOEX6+MB71T?=
 =?us-ascii?Q?a/TXLQjWNc1fY0f3lEQufDcmtkjysL72qZ+hh28yF2FWaMbC+96vnz1XI0SN?=
 =?us-ascii?Q?idJ62w2dTzv5XgXKJ3Xrz7f2R6+WLz0B8yDcanln5amLwSyUZSy0Ne+7CB3p?=
 =?us-ascii?Q?2Az1jiim0je4H8xKQj5kQIcTraCC2KiV58kq9F69PiIfEkieHyakCgGTc8iR?=
 =?us-ascii?Q?B0Rtp5vNT9aQFVH1Y5IPW7rzMIye4ORu7kqCyVsXscGSPKq0H0xrwn+SUZ7b?=
 =?us-ascii?Q?nrejoASNXwke9xEmBpYcaUZDgDBwB2tiUU6LRgIIxwG+ZjM7zwlRgGf5f1yW?=
 =?us-ascii?Q?2UnbmDjrn61YG7GZ/UCYRhVUjrlj4gclAEd4MSvxahqGO8Cv4agNehbYsSoq?=
 =?us-ascii?Q?BqTkSqE+/yACoH2RxhLgbxKfSKlD2NTR5mzXHQEgBcdneGNEJbdwRMZ5iTwD?=
 =?us-ascii?Q?rgCBJKkzHZxWkLksUlHpZKdtEK8x1P/pwa04WqsV6F1plg1wkFm+681Ve80u?=
 =?us-ascii?Q?8RlYBYIfB9rlC/EF6I5FL7uLKdyG6+IBwh8Y0dODIJ3E9I7N/zTzWS2cRhsp?=
 =?us-ascii?Q?HuSSj2rwarcPxwFCRWB+1hdXlwLJfNacqRPAh6wZfVe751s0gWMWJ97c5xWf?=
 =?us-ascii?Q?TD0mBZE9WnOKeY17v/p04LDas6nDc8yaZL5Wlh69tRin1O3vEuaF5bchJkzs?=
 =?us-ascii?Q?r8UvARLylU6g+ig8m44WHTgHqdppU/VCQHdWGUf0DGxj4TIhwig1FJTOb5E1?=
 =?us-ascii?Q?UmBCEPa7sJtnQXkKtCNOui3ajLG2yEQjDr75vERqHW+GvltBU9T1GEG9ZbKE?=
 =?us-ascii?Q?vgBGtu9OXSTsDbzXzCcnKIUTZkQOoTq4hzlaGRSjYaMTRF/+RD6jp8BMMl64?=
 =?us-ascii?Q?6X7/WiqZjQWPu0UA/D6eDhtI7LMUMxGzaHr5Oz6K6t+OTli27VwGRMrr10E0?=
 =?us-ascii?Q?6RWtQIdYsqIa65Dq3o4SFlYiLhlG+Q1k7wl5+6L06u5BjHyh/9ovwRRvlyT4?=
 =?us-ascii?Q?jJnM/QD1cd/W6rzp48pDsEy6Vd5oKm85C3XLp5R4ubzV1QbkS5Ly1rtWUvqK?=
 =?us-ascii?Q?c6+oWhSzyP4pxQQUhPdnWIdvol76/UoKHJEIXRqTovmLZ15bx2PRNhk8P8X9?=
 =?us-ascii?Q?+cK/3kh+zrWq7XNY/zlqkB0Mug8FCs0r1fDNaIesEGIKULQ/+txMQVV6rQTT?=
 =?us-ascii?Q?vh0rc6plqkjd/gkS7k6XgPaZkRmB/dFC80yrHrjaAkKpawxIYFaUmSjUIb2D?=
 =?us-ascii?Q?LbO1Dhg8jAmaRei1cLf3Mje4+jAl2qgx5LY/O1OLUVbl1KMJHiPKhyEGAu4L?=
X-MS-Exchange-AntiSpam-MessageData-1: ScF2QrPEyrzm+A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78dfcc0-08db-430b-fac9-08df4c6bc063
X-MS-Exchange-CrossTenant-AuthSource: BR2PPF9D47B45B4.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:49:38.5500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJ4lNtGyE2DwB72L2rVJq95sEh7p64yiNSgSVf40EMBtvbrxkR+TJleYayzUtdIM6WHn7AaarQIdNZgjxeFu4t13juknXs3ahsiRpheTzSAnTZYQhqDB4yMvIlCHC8Wa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB088318

From: Clark Wang <xiaoning.wang@nxp.com>

This series adds Ethernet support for the NXP i.MX952, whose NETC is
revision 4.6. Its NETC integration differs from i.MX95 and i.MX94 in
the following ways:
 - there are two standalone ENETCs and no switch: ENETC 0 on PCIe bus 0
   (RMII/RGMII) and ENETC 1 on PCIe bus 1 (RMII/RGMII/SGMII), plus a
   single IEEE 1588 timer;
 - the NETC system clock is 133 MHz instead of 333 MHz;
 - the reset value of the ENETC 0 Tx byte credit registers is too small
   for jumbo frames.

The DTS patch set will be sent separately after this series is applied.

---
V2 changes:
 - Add preparation patch 2 to factor out the common NETCMIX link ID
   lookup, 'phy-mode' to MII protocol conversion, and i.MX95-style MII
   protocol register setup into shared helpers, reducing duplication
   across i.MX95, i.MX94, and i.MX952.
 - Add preparation patch 3 to share ENETC port MDIO PHY address
   configuration in IERB across i.MX95, i.MX94, and i.MX952.
 - Rebase patch 4 due to the code base has been changed.
 - Add preparation patch 5 to look up a VF's 'ptp-timer' phandle from
   its PF device node via pci_physfn(), so ENETC 1's VF on i.MX952 can
   locate the shared PTP timer on PCIe bus 0.
 - Rebase patch 6 due to the code base has been changed.
 - Adjust the order of NETC_TMR_SYSCLK_133M definitions in patch 7.
V1 link: https://lore.kernel.org/all/20261104092217.1730351-1-xiaoning.wang@oss.nxp.com/
---

Clark Wang (7):
  dt-bindings: net: netc-blk-ctrl: add compatible string for i.MX952
    platforms
  net: enetc: netc-blk-ctrl: factor out common link MII protocol helpers
  net: enetc: netc-blk-ctrl: share ENETC port MDIO PHY address config
  net: enetc: add i.MX952 NETC blocks control support
  net: enetc: look up VF ptp-timer from its PF device node
  net: enetc: add i.MX952 ENETC support
  ptp: netc: use 133MHz as the default reference clock rate for i.MX952

 .../bindings/net/nxp,netc-blk-ctrl.yaml       |   1 +
 drivers/net/ethernet/freescale/enetc/enetc.c  |  23 ++
 .../ethernet/freescale/enetc/enetc_ethtool.c  |   4 +-
 .../net/ethernet/freescale/enetc/enetc_hw.h   |   2 +
 .../ethernet/freescale/enetc/netc_blk_ctrl.c  | 336 ++++++++++--------
 drivers/ptp/ptp_netc.c                        |   7 +-
 6 files changed, 224 insertions(+), 149 deletions(-)

-- 
2.43.0

