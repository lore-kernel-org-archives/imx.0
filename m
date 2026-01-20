Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E6F3EDACD
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 10:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904822; cv=fail; b=Dra7WwlSgH3g4LpZru6NpZvDl2qr7PGQKxM59T9bJ9l68o0h3iyFzyCUQo0coCrrwaBmAvBTd2gikhzREsGOa85Yp5eRUUFIkQkjyzn3gFl89KDGUbaQ1J8gJHiKEiaRaC3YUzywIWxmqEajy0XrUQ/rmE8YE6970Zt7fPPSvjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904822; c=relaxed/simple;
	bh=MGV68rAPmkK8TvEAR7rD3p11RL3a+oqsB6Y33TjYMdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uqw1EZTXMEaQ98Ze3On3I2q1WG1Av6pmsUVYzHU/c8pXfb8eGGvZseK22ohh6EORpfkYAkSvMieC5Ff5SyqFdBHKfG5FevE1Yj2RFtF6By/+jCZKU6GyA0B/71wPg5gYjk10BmdbIRQsBhsUQcyRO8flYMYBmq9TOyOL66GRWLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XUM0AI99; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XUM0AI99"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cm7KyKHwCa0U8RtPRRIrSsGXb4AzjBj1qPw2gK09QGeiCMaunW/zevSmrBAD/EzgJDe5oqG255upjJaxyoo+cS8dvi2rS2jS6k0pCGFXEh4MUaRLtNVcrhZzSNuoC9rT7HEiu0lEYlFwCQ2DKBBNBlbH9n0mtKNy4QuSCMRDBRZXyFZeDINHjx0piLIHi8e14CNyRgRmAPiikuaIJMaLbkd2OGpLplJC6m+I5etd3VW9q3NSsysJVg6KFJcuZng57znherQtVm35Roz2LS3QciaSCdTEne3/+OYiG5u6qdwAnHuHxw9+a59YqKBmXOs8KbrF7ArVviOaKKxnikC06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/r2UrEQUrtC1ML5aC8LkCHhC5gS7kDRigL7kfCyrXcg=;
 b=Y7FiIyDOBnRn2p3JdbO+yWNTmJUXPf4oGKgzj4wBj92/TurFr5Y0Dw8cFIipAe8tVy9m8Crn7qBnk+fcprobLUKQA2vh9KhL4p7d7i+dp3Gap7eF3GJRkyDFoqcgSPrZoxN22ioG/haxI/HuzhrqEOEh7IPkLqOwsRjw3q0FxzE4fYFiLuzZjlLUPe5gYcFSSK2LYijgrE3Hjzrb03idg5VtE6p7vxtVWddhGyPw3RqszIPXjjZYHsv8d7ZMOQWziOfRNq+J/lAN/gqvlkDs3k8ZdgS64knNjQDh5IfjWM8gr84MS/0IPluUVU5CGhngxRPdw53gdIR0ZH3w4NnSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/r2UrEQUrtC1ML5aC8LkCHhC5gS7kDRigL7kfCyrXcg=;
 b=XUM0AI99KS576l3RZdaiTbG/2QvgUyq/a0G1ZAzJnATfWmucHSKwOOpl7ntKed5kwzlz2PTbfpzINKCm+qOj8oXuK96uvAKk+UJ6NVsRFT6X2sUg3okNyeQtywLl8ImtZr6n48J0f900UPh8wcrDmMiLvYohjqogsnGW2lVzcmUdzmvv+4rS0T+cgLidqz0nwEt8JQkHl6Im+Gq6pw0saGhuMCcmiba1Gdjknw1CvoGbrPG1hPh0vUQq8Lg44PA1AT52k4ZnpPzwKXuRF6jhaE96+qsGEx8Ox9tSNXbUJs2ZiVcPOdm0JHnBnKsFbplsY6AXUnKOLZ1PCXpX2tRYFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM8PR04MB7268.eurprd04.prod.outlook.com
 (2603:10a6:20b:1de::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 10:26:56 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 10:26:56 +0000
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
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Date: Tue, 20 Jan 2026 18:26:03 +0800
Message-Id: <20260120102604.1989725-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260120102604.1989725-1-sherry.sun@nxp.com>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
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
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM8PR04MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0fbeb8-08f5-434a-ee9c-08de580e6ff1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|366016|52116014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?SiJeU1eeaYV16CpaOA0gceDPJ3c6g2mKabeLF8X6xlFzZWAMc3KFgFsJUNA3?=
 =?us-ascii?Q?EpuyMYGJ2CRa0Y6wko7Cnzp69w82Dg2nWUnEpQxr1voO/OLz+V15Rwm0nwes?=
 =?us-ascii?Q?SKLuAlB88vpuwSC2wYsNduldM8aQpei19K6QBNLcVNlPwYpF1L6i8lpULVtk?=
 =?us-ascii?Q?bBjfTqyOoALtc8ZfxvQ7x4hfdM/0AUDeyfW5YKYWnYOYGLcue1iEMRpnd8AJ?=
 =?us-ascii?Q?oPrioWIGOcRP20lvmx+kLuFYLNWAxnsO4uqEVOgFwEkxZWy08AmZ02dHNEzx?=
 =?us-ascii?Q?Wt2JOG0Az55ku+Ej/MVYorawgLVmJXXEd+ZnPK4KBHahQs7O+Q92PNlZMnPm?=
 =?us-ascii?Q?4piR4kN3rlfcbwaJxSAjscICol2T1ih0YF6PSz+4jPd8o35U4xGDo3vfV+fP?=
 =?us-ascii?Q?c+BbBXCrw4XQ1HJoPNkjzNTYNsukuyiUFVEeEnB/rAaKl6OzybZlCxIdOp7d?=
 =?us-ascii?Q?KRIEaJnUQElzH4WsLYkM3SfBTMUQflOHVvL40Ei4zNkhfFe3ZmjBykzuNwis?=
 =?us-ascii?Q?6ovtTvdcGzqOh44OVy6eNThg5eeUVz9HPNWSvyIZwSpzNezb/dx1W/96KuCI?=
 =?us-ascii?Q?/anvMKhTCghOkBYfNeMHNba9gAp14qqahrPAUgCWZTdZMnHcABqzVbHmrFs9?=
 =?us-ascii?Q?AZGrvT/mwhp1f5H+WwVneOIixQrjPJQ2Md8sVQcHeM1OL72PujGB8BBlRrnA?=
 =?us-ascii?Q?snVa9zDZ+azbNii/JWiRT5mHOq3gvqf9B5wf1WSaY9iIF7gDqxkJv9sB7wAd?=
 =?us-ascii?Q?GqXvZPgThNb3qkuWXnKceXrHg6av8YhMfVxAxAhkLD0d12/xzuAygumD/Bqc?=
 =?us-ascii?Q?TTviR5sAvUhHAUTfTIkn0XWgLQIKy5MSxKOuOiKy3vMRGAtu/WiYfQ90Afwo?=
 =?us-ascii?Q?E3pg1Uac8HtlYcV5ksa0cwd4havVqX8kHh1adeKfcmbauF3GdZ4SPE5HFLGi?=
 =?us-ascii?Q?OpESOagp7KG7O9KRvWofpPTHFuuFFt3sHekeT2Lvqg4jLMflTTXUQGuFaGHJ?=
 =?us-ascii?Q?sRxlWze9X8XMxHgMU44T6/yt3swmtXI0UsmIaEe4M8Tw+itakwDtWL39p2Id?=
 =?us-ascii?Q?eXMAVlzwLpEIBqaO0eHxc+wUWfJwj2JXTQ/pxXuz4deA7pNDoYCb5GNTK9tc?=
 =?us-ascii?Q?zoVw/uq/Krtu0S7YR4zV0NbVDyxpnUNe0bADCHeNk/6Tjw7LMZA5YWyUZsVp?=
 =?us-ascii?Q?juXM8zqAceShCgpN1QLnjwB8VDSnmSBQoIPOBG9Lj6ZxX1cSpRo/Cd8u5hGd?=
 =?us-ascii?Q?ZU+xDt3ncs/C1OJLGEQjF8zNE2v7eYaTAVDt4OaEwlUTazCjDBJWW9PL0uP6?=
 =?us-ascii?Q?qIp6JvCUvH1HRqP10B5S06TNIV6NBbRSVl7C1yg+7hZScPcwOurSFDDexFLp?=
 =?us-ascii?Q?6T7mqtIVYoG03NM3Jcj/pKBSyyu5V1xmJ1y6EgBo5B7RWozx2lzUiy3fstUY?=
 =?us-ascii?Q?FGl204h7qZLl2HzFesVAD91SHLCzjzTMejCTepPQ2/yiW0c9AC4urNczTUXH?=
 =?us-ascii?Q?8VoNA3Byh7nQKRm2xQJ+nc4vpcYHhVrJvxj6mlMcF0LC2LcR8HSJzYSkBlLv?=
 =?us-ascii?Q?anABCEEeDUcXsivZpESgkatUUV89lXQL6aOX8N4Mrd+U8Tydgqhv/cEGg0/X?=
 =?us-ascii?Q?QcLiAess5cHBJFhdq1of64Bp625hJMaQ2ErkEJCWgKIo?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(52116014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?kxUguPpYAUY7YPQTwybTH8YDTf7DnZCTeGeHJEZ2Ft9tYfSb7gOut2AVyc9B?=
 =?us-ascii?Q?1xXTZUGJCZlWN9jH2CI8qVlzjqUMkPrTaCm4R02j/zT3J72a62JR4syTHbR9?=
 =?us-ascii?Q?YkKtnTL9NlFC6VVIBVW2s9doBlWXb6CyyD0iXJl2u87IUvHks8OLe/aAkx+6?=
 =?us-ascii?Q?NpQ8NaH17rOc5WrrxPzHzEmjjA4CqQBHpcPlm+ll8nhhqiyredAhTS/1IuXK?=
 =?us-ascii?Q?/p+RTVFHMY8FmgtsVGoHXz4jTQr+T5uzLoCTJpiEawBe/ifyS2t6j03PsEVz?=
 =?us-ascii?Q?hm4GKNFcqizjEkZQIIkQr1m+4zvLiGnSjdGM0TCj+dUi8CIAGcLmYj/mFQec?=
 =?us-ascii?Q?6AZc8YeVQFEVaz0PcgE4ZTo4YpuoVgcw8nHKAoOlaPqpS4omHvnNAi/eVTnf?=
 =?us-ascii?Q?EMPfC4/qE5YSaB9fgfCyau1UhnnXj4g+WRVGWnbef91FfykuZ55GVrSjpx1O?=
 =?us-ascii?Q?mY/TUoBH8lix6dJn7bLO8Gty16eoulKNEFzhSck9Jyc2szFQ14XBgOjROykD?=
 =?us-ascii?Q?ak8ULXC+o+kj/huTCS478MG9uT4OZJt9LiN7MY9WTkh0UsWPxsrGJbHynlZB?=
 =?us-ascii?Q?fSURrvQJaX0ysdoqc0eiU5JCdUUL+155VYAGaZNFs4z6u2H2hhmnOHpn04CY?=
 =?us-ascii?Q?ZSfw6W2dJ9r/zQRXrOqFVXS+1Hm0V3ScZPomtLK68iiaKvxGKfX486QPqA5D?=
 =?us-ascii?Q?VptfBPMSfvQ/1dtzBLVJABhjLa9S6nS7hXnI8vFqYXhdQyvQidPrugDSiwkK?=
 =?us-ascii?Q?yd5sgw+/JyA3fdxr9vxTLCt8+7HuTYg9SPMtBp2FmrEH50wUqkzIutamZ9Dq?=
 =?us-ascii?Q?MfXXi7gg4+0wbMBHCi3PDA3VbHOmqIkOPSo+Cf1+yPx0/kUaZm5lR5HNzbV/?=
 =?us-ascii?Q?Iz/cWMFgHIfRwcEJUmND3hn1PGaEb9nPcgNULpKtUOwucpczbJvzCovdcCBx?=
 =?us-ascii?Q?hLTl+UF01tG9DukqLNoiPisTEgFxsdfy2VhR7xzMxeRoiovoSlZ8T23OBCom?=
 =?us-ascii?Q?G+lI6ijy8ulhme1RsM4hIoNRFK13cqa/fn4vZ4gNb79Qcu1NdSWPbGNJYoLw?=
 =?us-ascii?Q?4SQ9zwsXDmanEjkT50lpPcdfWqXvzz57dvlaotH1xHj1X2FCsoeM2AZde6Lx?=
 =?us-ascii?Q?mSvQdpdtNdVqyClnXuqtYKGUlCIX3BLsXAEJIZUl2fJtUQo/6nqGXLONHfwn?=
 =?us-ascii?Q?hwIMPxbtHK7/N+8UHqxUceVmX+YfPGdqSrq1Aal2N49mATv3vvgL37gPgX6s?=
 =?us-ascii?Q?tCuNFSGHxdjzOfr13CCaD6HQ+5ooxhkAJ6p3W7ck6YnoDLkg8RIhxA2X9vUv?=
 =?us-ascii?Q?8UiblIHo3xaRdX+7OvHyaOxhvhqfH5q6uReFqivtkc2hvhTzY5PtbeQR49bc?=
 =?us-ascii?Q?kJNlXoHL1I3FxXuGv4OslPccv9UAenZBRD9VGtq3AIiaIWWFNzaxSB3D4t9S?=
 =?us-ascii?Q?ooRc7cHrhQxYEbG/jQR8C+GD0R1rRtPen7agSF7g/EzTyWZOKu3WZyY5uVKD?=
 =?us-ascii?Q?OmH2j/BeoOIALyj56ROiKKwQZMuCw9gFtucSZNUZedYcLoRaKdIMldvUdJbL?=
 =?us-ascii?Q?ZFo8i5hDf1SHZNOTSBUIoMh4zRx41Btmd3HCrH6sUlueh7Hm+q2DA/xdZHfm?=
 =?us-ascii?Q?lIL9nq7d0bchnwHoso3VkJn+tjCR+wnGcIGG+MBSDgzuSOUeXHwFDAc6wy2p?=
 =?us-ascii?Q?0RaoKmLvcrwIPA+DU9IEy0Cd/sfkRON1G0e+A3nqj2NCwvkD6BzrR98jGuUi?=
 =?us-ascii?Q?Lj61dJWWqQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0fbeb8-08f5-434a-ee9c-08de580e6ff1
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:26:56.6904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QG0iIONty3Yvjw+mfCnUPPFgDjXATVFEct7Fu5RTFgYsOOJ3M9NIfTCx3GWCAotNd7PlqTV2It8GJGA8D3FGMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7268

Add DT compatible string for NXP i.MX93W EVK board.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 93ad6f0027d0..1769f243d70f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1432,6 +1432,7 @@ properties:
               - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
               - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
+              - fsl,imx93w-evk            # i.MX93W EVK Board
           - const: fsl,imx93
 
       - description: i.MX94 based Boards
-- 
2.37.1

