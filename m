Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22BD394476
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770194131; cv=fail; b=BnUUfy9KUbGqPsKET5Eb5eFsPcsiv+UYqpGMOYVJ4pTduGnIgDPSD+eWpDYDIntCt0JWuWvnyW5PGYuYrVzIZTw2L+qQ5rGfmv6SK44u44xhf/1F0C5lMGdDasf9iutPyC1nP2Z/k0IHNkDHEepG3feMQilVqGTj/F3HuuFvt1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770194131; c=relaxed/simple;
	bh=2DGR94z+Ms6TlDeEo0ncr39QWDGVr8Ka4QdY0A650sA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FM6R+fDgPanisqQjcsd7fCw6bgEq+TxgMsRUkUTRxvUiFITEUmEvV4i39GtrP+0rTvgXJHfftLGbxmYrNuoUn6Xv13rV2OYxV4qhlPAHEDT6eQxyIYhYK+vG+9uoX2npFy/XQNJ+dBTmUzSO/QRzHCv9vbcbVgGbpy32lephzBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Sgj/Vout; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Sgj/Vout"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAI/9g2qy3OwA2a+NXG+nEkoL5p12wAu+zQS5Hq0+Gq4+Mt0eEDVKd2qWegNYCwyttA7lhNInNPrkZSQVw5IDlg+2+YtBjRh3Z3Zm+ryO7dSUVmQKjt2QllXfgH8f5NUAb8qnu5FHUU5aUM62X2hv/+UxsrmUonCfkGdhs6Gfh3kQms3YIq9+mzpte5G9vBmeHAqHZeBZn5IKQaGveHenoaWAXoUrzb/8T6dgqrM5PuaFj6htSeHd2dnxGKWkWxBMnIAx9TxxiO0YA0FUJxEvRyzrBe3jo7M9oYCaNeP2pm2lUFPbfR8E+4oLJC8ySzeEKBvs7OKNjsDhPUKCDdd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQDab4De//WVl+MWui2L36EBfKoDLRAmt/sMnr7Xpn0=;
 b=QiZbdqN3IwfWI/2cR5OIOfE29IBbUlQzCoLFPi3/6QpplA5kYtSQnbOJWbOxleFOAdpIWL6xPWk1nHizEViMTbyl2C+7LQz94JX2x9WtTqAC+T8QFJRmjuM2CkQmd57fQrVAZPEHfgNQxosCBMiVF3xayK0k+mK6LgYFdpz/HQn18Kd9cICdkJKzKjnnE9Iuo2R47RabuvjjDYVVUcYz9wMEa2svbv6HhvGyVg+Fh83SdOFgGQG0xFTEWhKiLL4w5KRVMpYjwRDPTsD62zIEI5IgXD0FYQ+KyN3vL/ksP3CP4jUnjGwflMnwkexcqnBdAF0OesSQpFyVYhfa/NYuyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQDab4De//WVl+MWui2L36EBfKoDLRAmt/sMnr7Xpn0=;
 b=Sgj/Vout9ZWhn8EQ0nGmOzFTQgb8+QgakUQdSbjUO05Jz0Ww9SIX10XrXstdgahPtlFksZWEHjiNF+5q1G48m0M7PklV38qYQNJ835XvuvGq+9yRR/60rZVo0daed4H8GAFJq2IV/8dHbu+wK9kNxO9999OEPVrG9B2Nx3FGEcb+2gjxzcnSxznvjf7naNcoMcRjGM0NBxX3r1TbaxLI9PXOl36pElZpS60VPe3vY3miRTW3IV/4D37I1s3hcP/mNXTwjyCGaDoNfc2lxtp7LERxVCYIyFgK1wf6IE535FBV532Akp0u/VIIdhTo0D7vDjNtJ3CHUYUntrvlkFRP+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA4PR04MB9245.eurprd04.prod.outlook.com
 (2603:10a6:102:2a0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 08:35:27 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 08:35:27 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V6 5/5] arm64: dts: imx93: Add i.MX93 Wireless EVK board support
Date: Wed,  4 Feb 2026 16:35:51 +0800
Message-Id: <20260204083551.2867263-6-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260204083551.2867263-1-sherry.sun@nxp.com>
References: <20260204083551.2867263-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PA4PR04MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: e01268a4-3858-423b-c9d7-08de63c858dc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?G4TsG2CiDm5Wx1X1NVu2/ieMHq/Y20EcYZGYkxU0GOxC97DUa6P/VcGF2ASX?=
 =?us-ascii?Q?MIKEfP9VoWasGoJltiDVCyvQYdwegD650BeEJjYJpu3hHb8Afz0yHrkGulrE?=
 =?us-ascii?Q?neZVKCk6KmjCB+NK1d3Ah6/vUDs8y6cmRW0fn2mOCAyGagv7DpNExYPAjU0I?=
 =?us-ascii?Q?O0c9o1ouPXf1JG68T4Sq+QI91Bt1pKsv1xYjpTgGb0XApf7THbjPM47Cam6J?=
 =?us-ascii?Q?jfmA+60tGfSodI0bc+mFeGn4Hw3diaT2QHh84nJjGh7HR3I3CBzqkTB+v6Qb?=
 =?us-ascii?Q?ilV47SLdkiRxlzjz0ZVV3jLAWiWTIG77vcedbK48yN7WkPmQGGzVDZvLUTzw?=
 =?us-ascii?Q?KHL3TxSzAnalmx4y9wKZnMUt7xOUvOA1lAuR6B76TZ4wFaBp6LKCWl0dxWgK?=
 =?us-ascii?Q?ra5v6ULLNCBNVxhsy9LQqjpx9FgHwlqRyMjhvBV7bAC08/FDTzjjZ25AXYp+?=
 =?us-ascii?Q?HXoTORlWweH+c/k6zV2dvYAD4z94kInKr7BuWUkeF7O4Vrhlwh7a88Yd7mtP?=
 =?us-ascii?Q?ZzIwFc4YgemKGOJs+KVEJkRd8nSUIcVUJ+yLF48pqKU1iH9msZAt/NzKBcDT?=
 =?us-ascii?Q?7btmNlH3OHQ1N6Lvkef1vx8E6tXe2spYDbrfKOTR1B80KWkJ1WqlfweFtEtF?=
 =?us-ascii?Q?T2NhGzOmtm8ctrNjChy7Dg1lBV9tke0d7LJJY0dinH+7WSrA/nZbnbUILBlc?=
 =?us-ascii?Q?0Q0NFbUskeSTkL/MdfDU9RGbVN1aL9FGwow8vFLW2SMidZhbIDHQeg+eQ6Nn?=
 =?us-ascii?Q?jAEDEReOweYX5RvNb4NtwemTdinq5IfIV1ZZZSpIpeAmh1jwUGj6mFV9bOvw?=
 =?us-ascii?Q?mRoSOcc3ihzaODOE62GQp3L51lo9pro5Lc34ZxdrjEmVgyvh3k7AHULhAJE/?=
 =?us-ascii?Q?mmSBxKkVSyILbVJscd+LGGl+S+kkZctsEr6bGJ/WAj7Nnf5MYNnb47UguuK5?=
 =?us-ascii?Q?Gy466b3/JjYVpjW3VWJRcGNrxJDyTtdmuGMu+q/wFMF6IfcH+vooCvi5Xf6Y?=
 =?us-ascii?Q?YkcW8GkrkqD0WRLZMZGWBUpQywqSoV3q5DoVR41hNlK9aw8shKGcVyKXuys0?=
 =?us-ascii?Q?u3sMvBCAs7/hljAUpnHrgqwu7DtaM5XP1SC1ArfoGZ2aNhLxpzVtrcan5+m1?=
 =?us-ascii?Q?nogoEIFAQxvuBy29YBR5vGXuVmYIw3dlga9GwDXJRagh7/NludwK9mRx8fxU?=
 =?us-ascii?Q?C6CI0BNgG8csTjVKTYvb28um9qg2T38qWxtG5CsOmQF5UN+u28BJ11zD1gmM?=
 =?us-ascii?Q?keP9gbRtqpeYm308kioHtdiWOxDpbnbDPPIN5h8kSU/ttO3OB+z0wvIHj24s?=
 =?us-ascii?Q?7aUr7cyd2NbPg10CYIQnU/S2wS88x+FBijMTpLqtINngUKtwG0cLgb84XVTa?=
 =?us-ascii?Q?nSeSjEkyL2gbbeet7yl3qdhbj7KgmdSC49xathUq7LNVpmcxi1ZC3PqwVbrE?=
 =?us-ascii?Q?mrApzI/n7R5rF4VvXo+oL5zVEg+4SZ/V57bMBd9QzPYPG7JXZtMV/ZOdBfJ1?=
 =?us-ascii?Q?xaj6XTT4SlPdIfYhsX6sWUl5juxnTAwlw0gS6kFrR5NcoZhrI+C1vvNfPXQk?=
 =?us-ascii?Q?aZVLhenZcTUYTfRHzQI9H4sNRQGEY7lc/mYJojIJ+3SiPD5tWTtR75lfmyV4?=
 =?us-ascii?Q?NuOt6EcT7RHIFJXwFT3Y1x1/Rou/ar23JgXX5h+sKDnT?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?kmpFCF2RDP1SksfTKVt6Z55fEUmLdTQuzXLL5T4mqsV10WYsiUQ/w6LrbIf2?=
 =?us-ascii?Q?5+KgXnLSdONb1hgc9rTPcHnRFhFMrmQxUf3Gl+xj2KrNR6Hue/nWx2rR9QGH?=
 =?us-ascii?Q?cytDJEKE988HnTsBDQunvizuWpBkZyxBaMEnb2mBI7a28E3WM/uGoTVN1xZr?=
 =?us-ascii?Q?9GTnXVPuUWo4DR+C6d5TlmqX2lpUunW+grjxzFjmypRFLZp/hHPkRHw24UcH?=
 =?us-ascii?Q?OBCj4QpbWaZBf1TWZcPA6Ig/jCPRfwP283Cu4sl83G2+fuibEIK5qN9LF9jk?=
 =?us-ascii?Q?OKO9jgkSho/X/xGXL4dlY33Ru+AmUcSAOo0W2Lt0RF+KXi1Ncge0VA0z+p2K?=
 =?us-ascii?Q?rYGQ0XAMezOQaSkhRPG8i2lEFddcvvOVAFAdv/Dr/NyRDZqHaVBhXlqbU9tv?=
 =?us-ascii?Q?DoHY4al2Np8fEgIgq1eNDgk+mGXlWzNyd+OsV1H2uZbqzJUG1b8uohKWTyeQ?=
 =?us-ascii?Q?w6BvglVxFlBugEOF5w+eiry11qcvg+goPdy2p4h/n2J6/n/F8sw2mIpH524/?=
 =?us-ascii?Q?HTQ+spcYswwV7747VxQquarir84M9m1PvkjEpX/MNBQNl7Ldy+BtOkMZKbNY?=
 =?us-ascii?Q?IVWS74DZUznJpNWVVRmCIktLeOnyae73G+GcaTlieAH8fHyHO8g1jXyjyJmt?=
 =?us-ascii?Q?mS32DK4vWPWg61PNmAnxEn+6DCz/vW/IKiCi8pAU6cMq2yhTDuxre8CP3B8h?=
 =?us-ascii?Q?XXW8OYDiTvBRWjwdavBtPbw6dUS08onLl8jukjgh4zsuv/Cvgm06dtyUzaB7?=
 =?us-ascii?Q?pRg034UtNdEz1gEELYEDNEr/wyfA6syZ3VA8I1LmELRuhSc72+B9NhF2VXwp?=
 =?us-ascii?Q?VmYezvdkZcFJBKXcsV2nwnpXlGM9bP0njPEiuSqAur7u1uTL0sT3XlPw76Vd?=
 =?us-ascii?Q?OwqUAhvgPH1pnmf9wpAgPcGFa1CeDIqIVj5il/H6aEpms7yVVLZMm/5DN+LZ?=
 =?us-ascii?Q?oAZT4Jx2GFrmdLAzNX3mY4jxwlppebke1MBaQ5IAtNrNQ8B7rbzl7dUGQVNW?=
 =?us-ascii?Q?nGDKkhQgECvur75JoG3wc2oqJznNCFwov96MfY1lrLSFxK5lITw38c8+3K/j?=
 =?us-ascii?Q?kacxOAQ+jwMDeKPbaeIBt+FRaoBbMvzXy6jDt1uzI1+suxXF+DIHRf09gJ0o?=
 =?us-ascii?Q?JCxpCs/a8yLAgy+sg4TMifMKo+meYg4UgquELXB/x4Kl+qJRm7RfmyfffEZF?=
 =?us-ascii?Q?UqJMqRKwQSPi6aDnOG/U9K0+mW2VZZdqYwzMtOOcrpgaTi+KDmisENSaHnnI?=
 =?us-ascii?Q?inco1kZdqDq7jOnt8o3eqf00r4ZN6tVgaiS3yvhOPMR8UVVhEj9zPqcBtuin?=
 =?us-ascii?Q?I520rICFMv46yZry8mzSsaKGzJWcyk9pEHg/JLhu83HmCKC3sgwsqxWNIlXQ?=
 =?us-ascii?Q?4gc/oMqxLEbWwu0g+FilZuK0gYCp05gGf5HJ7HdkB1xwpv1AnnC5I5fSvjLP?=
 =?us-ascii?Q?EU5ELIZBj1huvvfviEbYat5bNBJ8R0+tmZ2IX1r6Z3AnDN1DOY3UYV38iprd?=
 =?us-ascii?Q?SmwWIGWh7GvoYRI0uAyLLnhlnVqRkOsB5Iu3uXMpV70Ok6ERJey6YJC/8X8N?=
 =?us-ascii?Q?W7Mm2KR1qARMUBA7Q7xvxRYerbe+kQOJdsp295D8NPQddm0l+aK2gXNGeyYC?=
 =?us-ascii?Q?RvyeNXgysTP11kfUb1x8LIwgreYj1cxszAm0R/XSCuY7WfcIO5ZEUbEZ03Hz?=
 =?us-ascii?Q?JdaisPIMfpZx2nRZVCJEU4zSGvVLEeq4Hd6M6rhyGFie5ko6sObYx2U73wHh?=
 =?us-ascii?Q?pMLG6AdghA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01268a4-3858-423b-c9d7-08de63c858dc
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 08:35:26.9552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzgyFnQaV6KrR0fCfgzh0XtwvFTJiGnPHA7KZ23ID6q5VpnNObaXaL1cqXPREAK4LmPmb77m2C7208EJRXrazg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9245

i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
(Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
functional and pin connection differences. Reuse the new
imx93-11x11-evk-common.dtsi and add the board-specific changes here.

Here are the detailed differences between i.MX93 Wireless EVK and i.MX93
11x11 EVK board.

Function differences:
Function	i.MX93W EVK			i.MX93 EVK
WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
MQS		N				Y
PDM MIC		N				Y
M.2		N				Y
RPi 40-pin HDR	Limited support(pin conflict) 	Y

Pin connection differences:
Function  Signal name	i.MX93W EVK		i.MX93 EVK
WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
	  SPI_INT	CCM_CLKO1		on-board IO expander
	  NB_WAKE_IN	PDM_CLK			on-module IO expander
	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
	  IND_RST_NB	GPIO_IO28		on-module IO expander
	  PDn		GPIO_IO29		on-module IO expander
	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
	  I2C3_SCL	GPIO_IO01		GPIO_IO29

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |  1 +
 arch/arm64/boot/dts/freescale/imx93w-evk.dts | 28 ++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e60..8837d7ec4f3e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -439,6 +439,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93w-evk.dts b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
new file mode 100644
index 000000000000..8e53e7384013
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include "imx93w.dtsi"
+#include "imx93-11x11-evk-common.dtsi"
+
+/ {
+	model = "NXP i.MX93W EVK board";
+	compatible = "fsl,imx93-wireless-evk", "fsl,imx93";
+};
+
+&lpi2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+};
+
+&iomuxc {
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__LPI2C3_SDA			0x40000b9e
+			MX93_PAD_GPIO_IO01__LPI2C3_SCL			0x40000b9e
+		>;
+	};
+};
-- 
2.37.1

