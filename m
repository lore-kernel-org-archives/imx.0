Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013036.outbound.protection.outlook.com [40.107.159.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC26039C627
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904814; cv=fail; b=Lyl3V+uz77ZecZRm56qSTGMlEq3R6GNFsfNzf/LCifY+NtXVvctd/QOzgeMdsEIQaTP4k+WSU2m8fbeEQn7V/MwmGSRcXvOsStJ6Wy0I8A7rN7sGnQt6w4v+1D3dPW7eQZ6zVAgk5Zw48V9KPqpihavnnakca3Sn5Ky0m9i5CME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904814; c=relaxed/simple;
	bh=X9sJdPoSdY0tpS5vQUXuEaQ4GqknMuWAdcElFefC8k4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TZLm4LZjAUtuyaTJGDTyN5HQtTOlcKkbEpdtCc4JD3I/4LuFtpv89OhGVgr8hLlnwaK70MgszW7ln74r3QBTyJWMg1i26/lVzBZKdi4f2zhuRS7uYc7Qnu2VTO9oaqJ/gK0bfzRuffAoss5DU9V6iQozhwhVVhuM6Yx76jDv+As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RYJF9tId; arc=fail smtp.client-ip=40.107.159.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RYJF9tId"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYXouJnruZRVlfrAlrFKaZ5xf0ysumKC2Ed6FIzkKAAGt//hMXT/vqgfFKPMJN9cNHix7IMeWbzdbTGlQUU/kgVNAWNyGjF53xWCvjzlgprVYtFqO1+NST1si/pFX8XZJonZqoR25q+3QmeaYdpruSBkdVxB8h4EULorsYVFJlHL/kDm9tpKIznOu4L9cameLJ4rFPSDDp209GLCEmNB8qqG/E14E6uXGfvVruGzbJrBtDPnkZS44Q1EhiryFMOz9ypcU1LZVrEU/NX+CAKMjzmKg1BWLFNPd0qw+fFrydGWgdZDIx/y4YDklOG8HpyWalgp5gvS0Mc3RhAFTx1hQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JwjBESJFuEdej6bZjldwOugggZD1GeR4GyAvJvzCmE=;
 b=fDlvRdZI6qzx/GTltVQKSi2giMZ0KXNIMcJZP2PiLnZ/+niWQb+ULqaYYarSu/ZARZYpSRu0t2tAx48OIFGDioG5n9vMWOmF4TImIN9XvjA+7lSZdR/l+9K+An8fg4STV2C7ZmASVXn/1cKvfci1lKrgHXtat2DdqUno+dxbGeBMenro3m7sabGRC8CpdTuF8OZD6wKeJHwZcxBd3EzetrQUcLiANt12GZDXmUT02HEFXO/xzFxGfTiu6WvUe/WxxPdiu7qpxl1qPR/ICXhr0/eT04Xk/RFlT6aorAvmPa3NA5t7rtrlYRGr2c8st8JdrXvtIHrz1SpGesVX9o06eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JwjBESJFuEdej6bZjldwOugggZD1GeR4GyAvJvzCmE=;
 b=RYJF9tId3OGH8PR2FhDv+k+iUU3rmJiNT2p1K8REW72rUX1iwk9QO7ComSYP85qTMamOts+R9utIyyA8AQiXAF9JpmuQufcCX0nrdgC0PjCXVVU06FwUt3Sxu+mWbZekQwZno4B2N7S43/rfC91n5QRIMPbbHoUGIJL6p8BapTU0/PIwws/m58dhBOwxSAkc+KTjOADD6rf6dfYxVQ5kznYzvdEE1Wx8hqs++v9Gx61X4zQ4kZwvf7WJ6B+vZuqaXKzzdfQOc90EufYgv8k+ADfxAMVnYXukzEsJMi2Bl3ezUx2I9fg5RmxgwTGwlqINe1PhQTywhwOXpdOtVFqMDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DU2PR04MB8694.eurprd04.prod.outlook.com
 (2603:10a6:10:2dd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 10:26:47 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 10:26:47 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 0/2] Add i.MX93W EVK board support
Date: Tue, 20 Jan 2026 18:26:02 +0800
Message-Id: <20260120102604.1989725-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DU2PR04MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: ae098b66-58fe-41c6-1e6b-08de580e6a74
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?LF5QrVH8J0An7PrHqLdLy5H2FgvwbJ3hi7CiEES8RRqRL212Z3cZtPA+ORPV?=
 =?us-ascii?Q?O80pIaDo0JISkY56FUy94ELrGDrB+6hRl9Xmpl8BaQni16gOkG2KfkuSCUUv?=
 =?us-ascii?Q?sy2pKNmbjesEQp9iMpnLEeffFPsAeqT9IUEviDyO0GjHKdDGjK4fLCfxC4Lt?=
 =?us-ascii?Q?GgkCZ2M+u1OIVFoHtkvXd8t+0m7UaSf9x531NNM/kYUMU1UPr7pV7xs2C7NR?=
 =?us-ascii?Q?HanCajmvueVm3+75vt0tePQrvox3/DHkjecC1M6CQZwN9NVMLYU2q30BpJuf?=
 =?us-ascii?Q?mORoTd6U5O/Fzpw7ljsYorl12eJ09HI5qmedh4K7Vr/lTHWqr+ILISNEbaPg?=
 =?us-ascii?Q?0iwHePZ0VTjg22vq87mYL3D/bZPUYMEnYH4GzZyLuNYn+cfoRdfCf/Hn813r?=
 =?us-ascii?Q?Q1sQ+SeLD+X/St+iJBL6T3uaLDHd6Rip74gMWRcimv3nYEfhD/tRra8MrFZX?=
 =?us-ascii?Q?o5bUPpSPRt3gGkjtYisgkz/HKJXguSEnlCi2NUUYFJbkxJUagL9YC8s9/TEA?=
 =?us-ascii?Q?k/VyZdmJvQCHYbwtHuHQoG0OFWbYrkprjO2BRljRpzWUd43DD+5I6VAYBVY6?=
 =?us-ascii?Q?hzHwdY0wNCQQlXGz6pPSAzhllqq8mfTYS1r0cfZ7VkCd8y7NPHoehE9HKtUz?=
 =?us-ascii?Q?KnEKJ20AvuGs8FNm7dwj5lSIrqulmDZZyiftDeqgytTuXlwaOfEQvImhLQGN?=
 =?us-ascii?Q?4kYOhIvoqtKNWOOJ8MHONaxcgBfvyKjYMwXXyJGap66K5LERr3hqKiuJ0ZFH?=
 =?us-ascii?Q?OpcqsHJqZWs7oiVwCgazPS6gRBmrLuvs32YORglCUK/Ypg/haJ0ndmXnfW6A?=
 =?us-ascii?Q?hzRK5MsaFcWGktoZcfa6+nyXcYGlnszlXY/NkQP4lRL+NYPZFMYy9EfCbWAg?=
 =?us-ascii?Q?iLvr9S/UfzM9hA6WPg2V3APphKTTAEDeuLrvu4OR7E5Xl+2F2PEFEselVdvm?=
 =?us-ascii?Q?67367q7g26OUW6AIRmdT68ntZvVuRugJsQR6XHNFMCI8tzkXlQK6K9gWb9ij?=
 =?us-ascii?Q?gDpdP7MU9AfpNpOr795kRkrSgtvZNz+8jcUnxMnePzjHR1kOmQBiUSVYOTGR?=
 =?us-ascii?Q?ygIDQbQVTriHKumE04KK89sI9jIYv2VXJkt4ZigPv4kLV90W68tS5G2MtJ8q?=
 =?us-ascii?Q?BqHECc40JahqYtgOH5IUBGoWLHwPFK6usxsH1yAMJodflcUz1DHSWmlmRsTM?=
 =?us-ascii?Q?vuZwho/rh6oggIR8zvc/bawmIFlhCYznrJNZux+TS6LJQgJfgabzbRn7ZP+k?=
 =?us-ascii?Q?p/GTWsL+eC+WCkPl+NDiCkiBXxif/DfPoG3SIYdbH7lDKdw8tvJ9EUuZf7HN?=
 =?us-ascii?Q?8QQ8amUvagG/e2VOEcCvC3RN5PkO92uwmhJTy57FYoTG99DjoDNO5lfwTvfq?=
 =?us-ascii?Q?hTVQs0O9/EPktWj7mtOlN/cgkrd8vnETL2MQzy5i/x4qUNafuxTpB/CoxJc0?=
 =?us-ascii?Q?sZZg7ZeosSv63KRJp0OZNRo6EG/ohh7LP+0UCQmzApeUfod4DIuEZz72wFov?=
 =?us-ascii?Q?3n5VcbBqxD+dIhTTdloVVFaRd2Mvc66cRSpWe5p+9AyR/1Tsb3AYXPEFHSKC?=
 =?us-ascii?Q?msFqPj+M2/Vg4Q43aAOwp+HWa4yfGyeFTs6UHX6vcaZ3VPvf1nZItAs1RNOE?=
 =?us-ascii?Q?OMkuD5CvVB13wLDEkEx9p+/fF6knLjYcLlvGrAoE8sKp?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?si3OZmGeBCJYQhbmFFaaL8Jte4M12mDKyy63Hpaq6cEPLQkjKRqenR7HFJBt?=
 =?us-ascii?Q?33LR735p8M3hWSWUnugNOt9+6ZQPRpkq1WyrBcUd3KeiZ4fpZ1qhqHUMpn+o?=
 =?us-ascii?Q?tuT8Z+z7OXwAvP/kT5NijIEi+2a3Cshz+30xr4qYoL22Osv5IitYS3Sm7p+G?=
 =?us-ascii?Q?cOJn4t93l0nRK0of3GcrC0UjqUnSA7QdExNvKGofTkG+Ag1krqGiq7KOVk4w?=
 =?us-ascii?Q?tBNYIJAFu9LX9QfcNNZDhIgmqvxcGoLbKLMz8TFSuDgllC056SLNbqIk7Uec?=
 =?us-ascii?Q?GmzdlImy3NG/vnhY9+KSlwLRA7s3ky+yNcNgbcv6W4jCfPKvadV81lJWlfpt?=
 =?us-ascii?Q?ykx1Z4o5L6NkS8JfxMCY8swSZvMOqVrFNWnsM8ns8Tv00UKiYtUBB2pCCIrV?=
 =?us-ascii?Q?THIJEGwXLtexJulKzht6dynF9T3vCOSCEklHzfvX3xqDgZXN5t20mWDJEkQ7?=
 =?us-ascii?Q?+piD6z9Z5+VnMXkcdVXPCe8ZKNlH88TiYvjMxfmK3Ao7hhQmSIsp2Q+GDUNK?=
 =?us-ascii?Q?GFNdgiKHKLYFvpAsryRS0fNhH4JWK68nDCud259qVFw8gd8UWlhavkBQQg6L?=
 =?us-ascii?Q?PXldwQzK3xEXwVjTqtdvqvOlylbCKeYFPsLWKX/Z2kYZ4jGPBY8XayDzoVWK?=
 =?us-ascii?Q?W6lRsonl6XM/eby8KfwZmD/9cWwq6gGI/yAic1ePCs9Vx+LX4CaEmMvyMxmt?=
 =?us-ascii?Q?GFPMPC1UTHtBaq1ue2gXUBswPgqeQbNGSMN7nJSGezIkaQqBd3B2QFOtVRKT?=
 =?us-ascii?Q?BAoJrSI473b0lyIcpVTUBpIvAbalu1doxF13kMSZWaGr94XiunsoqI2j5UOo?=
 =?us-ascii?Q?+I9x1hiv+OSBseNLYZxbryCuaugBo0qA7Dk0ZfxzXUoPEXd7hbeAoSpLrkWz?=
 =?us-ascii?Q?HpgzeXAP+WLdoL3dWYM0ojdzzWfkb2t9BOYkeKSUx18jhnDZ7qX3sfGHSOtK?=
 =?us-ascii?Q?pMn+aqGmtrgITLsgWWGaQbwxMHULATSiKLqgQXP3WCZqKh5gaF+uML++nCUq?=
 =?us-ascii?Q?dnREne9OQWA6DL8+f5vmmVDtQ1scUfV39J16U9+1x0oh9DuZV9l8/aGVLIJ1?=
 =?us-ascii?Q?9UnUKN5ZgxLbwH3GSBLYUJ9PcwiCDzzPd7cFlYb/WYqHLOMpse+Z7kSqOMYV?=
 =?us-ascii?Q?JjYPsZ8ISVKavrOzfMQFBm13U+giod96fTpEHsdfBoi9E4YBxjOnMZB7qPhN?=
 =?us-ascii?Q?63ZdZULC+OBrlZp53zYRTqm+DPDPlSLvMsCYEYDEw6tAEtsDAGdzxONERTtV?=
 =?us-ascii?Q?7qETtcIKu1C+HS/T1s/for3zX2P5DMdLl5Phgwgm5E22JwdlXLqJvVZGOJFm?=
 =?us-ascii?Q?LLODW1xzzyB5Xl2HP3xiiuZmzG3983dpfHaLOWEOUZY1Io1sN8wd49GYgU7q?=
 =?us-ascii?Q?/dMA7LjSwhmpLagxRJpQP89isrNeH/WN1ZtTCE8UxRwYDZ/M8k1C9ehwc/JQ?=
 =?us-ascii?Q?Dqa8553nPmNTUVnwCu4rOkYb6eNyPJDhxnKnAaOwrUvkOO58TACpdV8lqWsh?=
 =?us-ascii?Q?gqmPomxUs0cQNtjfNrZksIoDv/UZ38Qb/2xLNd5x0VdzUbwAjS6DM4wHV38s?=
 =?us-ascii?Q?gWeSlXYAsjd9YZDOVMXE3csFe7bSs+JkpzTYH3U0APgoAEK8uypezoc4Td2K?=
 =?us-ascii?Q?OVQV5yeIVDqPwSiQWc3/cCiaGXgJpZquVTD6HW/AxTlCjLnahWoiIogEHHgK?=
 =?us-ascii?Q?q4QIGxArZr3f083W6l27Sd0BF5LMaAnAmgL9EcPlkGEYwcJN3vQj3EK6xafT?=
 =?us-ascii?Q?0ZK1r2+GiA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae098b66-58fe-41c6-1e6b-08de580e6a74
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:26:47.4867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiwE8dn4sctXPpGxTbZn6Ppt1aKO4TjjpiALkaiQb5YQOMwI0xA6e3jtaaokiKY/4On4aXw2U5M+FoUoqoIyvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8694

i.MX93W SiP is created by integrating i.MX93 and IW610 WLCSP (Wi-Fi +
BLE + 802.15.4). And i.MX93W EVK board with the i.MX93W SiP basically
reuse the i.MX93 11x11 EVK board, with some minor functional and pin
connection differences.

Add device tree and dt-binding for i.MX93W EVK.

Sherry Sun (2):
  dt-bindings: arm: fsl: Add i.MX93W EVK board
  arch: arm64: imx93-wevk: Add i.MX93W EVK board support

 .../devicetree/bindings/arm/fsl.yaml          |  1 +
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 arch/arm64/boot/dts/freescale/imx93w-evk.dts  | 73 +++++++++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts

-- 
2.37.1

