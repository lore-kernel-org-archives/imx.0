Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0581C5D57
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219043; cv=fail; b=qxJYSsz5ckOFph1cWFcuqEUffYzMSeVE1Paspy+lOiZrgCkYg4QwiV//vz924AENOPT9Qr1G8Lg2O2kHZr/8ZOzcmGgVu/WPEAxyU4uZ37SKHV7/9SiprcFL9FGQP+p2f6anEIIEQ8nA7sfs3uK9RETqjspZqemG6+AOhGQOO14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219043; c=relaxed/simple;
	bh=wXc9SphvdvHnctM8Vhy99lQkG+Z5qmvfZhxoXe0lSTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HM46eTJr5/R6n0D4fFJlzIRu/YqmHYva6viVecZLee0XtGkV+beu9GpZy34jpPW7lfMMZwJ1T/fA2xaWl3k38Fv/MRKYzFpGzfcDZ0TCeRsvaCEB5c79o8c2vEqkeVlpoqJy8pm8AGK4qO2mk2yON2XufYyM5mHg7nAW8uAP23Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U/ynBUK7; arc=fail smtp.client-ip=52.101.69.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U/ynBUK7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RX3JKvGr999Msm8/muF0rWjegGGTCjBkqHN2lqEXUjjFESjhDN6iw2CV/26wyhPpGFswXYF+v1lBr/qbJWmx2vmUcyG7wbpfXKKRgINER5zjxD+9dotxmZVlAqoA7Ax9fvXlXbaJQdtJVTAOYYB8Qmcp5oouyDgZY4QAzjCkcayt4+LxNLpG7YDKmqWI2EF8yYOrmWCjxKzP+3IE6Jq0dSWfbUSnYeD0lk3sM3J54kOHoUOLiWYUPM/Y5X/e0ZQED7zMUgyCFzOrBR8pTLxYpgLEr8udvItDTRimbQZU/bBe3UNX2nCF3zAr+6cyJ/NsodMtvaeYwUwj9NV6j2p9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1C5EFtbHLFSrjTrYKIrwZPBryIwOjIymYR1V23N9k4=;
 b=X5i2U28pYvm7fc+NYIq8DDvmTyzmtkIHR8wkNH6Vo1W5Zy0OTr2G/0v15hJuEZ35SII2VbNCtMXo70JOo06e+cQeMaNAPPHK+M7isK92u5OusGnzjSKGuIQ+qjDFqqGdddIyIRFrbt3EPgDWFAshEJXbG6Bxt6p/nP9DIizAYCy7KFnC51dYJSMSGi46GkxLoOCUOTEexPAuR2fdZCJ7DLxIdzaLEe8V9EjKCuxf+5zPzOi7C5Pv2h5qReYo317t+PyebgWQDEc9xcovl6ozwTCuas2qDKNylUnKNl9kLU00JSSh0nBx0cV4SMpTwWYJQH1ZdeDUMp59Soks0NcmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1C5EFtbHLFSrjTrYKIrwZPBryIwOjIymYR1V23N9k4=;
 b=U/ynBUK7s7A9ZPsYkMzodDgPheEtYjhdjzZWvCDvBtTxOxXj7xUX0ueuwSyRze2wwIKxyu+gxPWAgIXSmgOimkaWuX928/5cT06vc0BwtfpKPn+nJwE4J4mGCoVAy3nl/HAmuxQRwJd2PoDHv2FtRa2ig+3n9yK2XF28fXe5PILCmiNJ3x802fSt/y9qSBiz6hkfy5b6dundB0cBH36GfevQEEYV0m5REBcIMHB9q9ob5EpFjnus0KdhTf5i0lUFS8JkZwu4pcErbKLEr7yZcxWFwzct9/wM+Hy5diJHPp/ZzBOGjJCTwwvqkdFe7U6Furltcipj08yGVVQ7MLPkiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 15:30:39 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:30:39 +0000
Date: Wed, 4 Feb 2026 10:30:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, imx@lists.linux.dev, kernel@pengutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V6 5/5] arm64: dts: imx93: Add i.MX93 Wireless EVK board
 support
Message-ID: <aYNmFOAP5I4rQWM-@lizhi-Precision-Tower-5810>
References: <20260204083551.2867263-1-sherry.sun@nxp.com>
 <20260204083551.2867263-6-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204083551.2867263-6-sherry.sun@nxp.com>
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a0d59f-b74e-4b48-f7b7-08de640259a2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?pUKKdcruRUtzOfmY88O4cn83/i7DxnmEHxv+cyYUAI+XQqsEytW6+0bgI0vB?=
 =?us-ascii?Q?HKVOkZ3I2k+/yQ9bOYOjAImcnZNOds5jlY9/KrzphL19kfNN8qCSxZWOOyEX?=
 =?us-ascii?Q?iHmEyaWkc3hYwahXwUnsUmCOcjzvYsqIZO51BW9A4IYPiKb5djvjUmUEoKax?=
 =?us-ascii?Q?4+8CT9ZdRbMOucEtz8xZlO8wpGkKWZN32HVSB2vRzx8t0/KUSw5XI7g20t2q?=
 =?us-ascii?Q?G/MP+KXVigdV2jTG+3FgucXBYkozoZVsirzc9mTs+AEoJwJbHxNRiFE25FzG?=
 =?us-ascii?Q?JqQ02tp96VHnwlWu3ezQ2CxQXnce7qG0e69gr77lJHzLo6qjZxZn1POn6GIo?=
 =?us-ascii?Q?p6b3faUV50lzWmy0fGbgM6JRqZ+qHAkn4hxJL4iuRmFKZm3eZP7RvtdoSD7G?=
 =?us-ascii?Q?gYtq41u4MTGzP0YveGhJjJ2wiGEuFs5B1DOpOjJ5iJ3pJQ00OjT7Hz+I2KH4?=
 =?us-ascii?Q?hzPaqqoHXSAJQfw4L+yfIeRpX5G2L0J0u6jqa0vmoMZ8zNRqWIhYOAXK0TBL?=
 =?us-ascii?Q?Iv7mmFnPoCDwsZRCxQ5rQRXWoXVJh9kcBiHXEVrRn6R0CtlbVRPhyKAYt1pf?=
 =?us-ascii?Q?bBvPn7N+bR9imrLUSPm6fN4U9zt2XEdyUPEPy3v3mg0xJxlaJlSwh9rXx/PT?=
 =?us-ascii?Q?iLvOp3SDLYitc5DfwZNMM60d09cxXDzUeR1Hti2n3W04gulXN/PkgRbwGWDL?=
 =?us-ascii?Q?s6vxXkygWFhFy8ZuBQaCNMkf2o/9X+1HKldajG1JpWIt8NeRSwY3pyaSAVY4?=
 =?us-ascii?Q?vBLhJONcWpx4CZPGsUzjN4VPJdMoRWRcrXfFQBvpPad37yKL55br9FraKlLK?=
 =?us-ascii?Q?Rg4lyyphQjkmZQysMC4lKKpdkJ7aOIwDGaA3keFRnAfOrPY1WzH8wTUVvYOR?=
 =?us-ascii?Q?rYB95+TmfBzcCQ4aF9FFGN9vUKCp/v3K/ukNi3/sEPzLl0DIvt35MbMgJ9PN?=
 =?us-ascii?Q?++4YnbKV7ZJLA6V38Wxgvj+tUBnaYxvWnAbkJmaSifXNQgV6eKGinHaX9Dh7?=
 =?us-ascii?Q?VhPNlYG0eXqDTP2+DPlqyB69hkBKjS1wn0lH4EiwgvSlDPGfJU6UfV/BQNxT?=
 =?us-ascii?Q?47L7AZUPd2Y8VI20oOX9kDblEKPIMguvS5+kr28TUdU6ip3I690t8Nx9P/Q6?=
 =?us-ascii?Q?2SH+OvT6SNO43vcxwFfU8N+ifW8k4kZAgnXDlvyKgjDXlI2oWnMxDlpj7F+6?=
 =?us-ascii?Q?ICDTnyWNtJTI5DvM0WxQY8zcIPPCpU98AxVTpHcD0t+oqcqF1OnFFeDr5Cec?=
 =?us-ascii?Q?P1IieEk1HI1gHc59Rzq8OSHFFLKwDk97hUlVlhJ1H5jmOvL8dFrEKbgyH72v?=
 =?us-ascii?Q?sUPC8dCpArqBy/uD4IVRLUuqjZpU7R4aaMzitXsCtTaJTf0TiNG6FiX8tywR?=
 =?us-ascii?Q?sbMJ4MHZ3szr0slPLB2NRLbhnK5W06ObcsMGccZAjRrrbNsk34o3JXhxEaQQ?=
 =?us-ascii?Q?OSQQE8mhJglhOgfW0NHlVvtbxQZtPW/hU/kVdByPFwJMZ9z9Q1Odz2i7gNYp?=
 =?us-ascii?Q?Ya24n/6MKAXH9GCyl1HDO8PbCE6qat+0EoPSkD1zmj0jPnop1C5T7ym71WXT?=
 =?us-ascii?Q?rL+g8aLBTmZtph7LSIgFoHeKrXlyoxJC3f2IYueX7+mx8i+Cbsyk6636YPoO?=
 =?us-ascii?Q?EF0KpQ30kis2eF2yuOe8pyg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BYTvKMSr7V+UncJxnEnKsiNyc+1XsIzE9fC086td+ThUR4rxeytKzVDlKHjq?=
 =?us-ascii?Q?taWljXW3Kl2ZNOycofz5yNxcXVu0GIvUUrJ7iMaYmiOvqArCAoo6pPJhyVUH?=
 =?us-ascii?Q?5Eb4DaO/hZopsqUwUediv12Fb8hZ0azcFVfIB1gz0W7sY1WsSoJW7xHMp7wL?=
 =?us-ascii?Q?+o24yFdrcgRjPIEup5ClXZnI+zSgUCM2bPS39PToNV8dCoAEVA1YVWfDRlbG?=
 =?us-ascii?Q?G32ZvM2ktfM5bN7FdDq22HqkWTSzVoEQ2J78xogmiFzJG5XVtR873OrSBQ+O?=
 =?us-ascii?Q?N1MQJpvw+uX5zewgRJr1dyytkRGNOAm0Y/b5uShZqoFt6FULQZaf7/J+XX9R?=
 =?us-ascii?Q?LawjctP3Cl90z9/7VGTLfORiVLVJt48hqPcac2Y7kND3sj6J+aq2CLUyuhXn?=
 =?us-ascii?Q?7S4Cwq//Q0uBXTGBRYoWYQnjRpznffSBDoVepCJBmapDJ99b+1uG2wcZpNAH?=
 =?us-ascii?Q?PrgCMwIK+wLv5QIdBUTDY4/e9Z0cwB0nzmc37gGDFYSHgsUQHZfCZ5mLvdSW?=
 =?us-ascii?Q?efMm4+YXJG1EiN/w1ahnfTMNd+0SF3/a2uo+whB7UcBHn26smJrjhoc3QMib?=
 =?us-ascii?Q?y9n5vwppHo7jydMawOeVM9fZCAMH+IeBJ8zHkr/U37p5rXatyuvpNKzcHhGb?=
 =?us-ascii?Q?o2egn6uz+wNyYtZ4ey4O+TlICbU97/t0K2PY10vsS0WS1ahZCa2RGPIXooj/?=
 =?us-ascii?Q?KZSsoe7uh2i/b28IrAkVZzey031Ga0k2oJve0kWfUYy54OQtXg6hGLYoPIIS?=
 =?us-ascii?Q?kYNsS/dCq7QUVkE6gePJs3ZBbgmRWRRAAVJTLL+7adgrYLA2h/c/YjspmFFz?=
 =?us-ascii?Q?KRG4lBTsK+n3tqjC3/mZK1O+hzfux6KWgV3sfzx/wyAH2BlP2/P7ubQ/lwye?=
 =?us-ascii?Q?iGr2IPtx3IuB2BtVCLmGZeBm1rVmzm0vNm/wbt4uJ8dihlQ01+EPfUKWN2S9?=
 =?us-ascii?Q?KiU9rlPMokqPE2u4RlQ5J29g5A+v9qWNruIIL9bqlqsz/iD4pujAx+7V6Gek?=
 =?us-ascii?Q?TdmWhewjPVuX92GN+L4TTAFr009gPtfE1KpExqovgsl/Gcggc9vJscZQVj2k?=
 =?us-ascii?Q?O0rLwS2cIcFe0UHg3T25JrF0FxbChhHHrZ3i483ZkPWP93azjXvaCLCDxjQe?=
 =?us-ascii?Q?FCXVO/bjAtjKZoofp0jyYkGszyDIRHsLvJ1nzMiSuZ/Gs0bCGXEC52KE8fkZ?=
 =?us-ascii?Q?RgwqZzoZpTQnTfa1qa+hoUdPXE9L6x+rEK3u5fRcY8s57zv9sD6UOBFJSPpo?=
 =?us-ascii?Q?02Mh/VR0YLuoopc8sJmzS2TP9J+EfOF7GD3hYNa43K0de6bIn0kHdEa3pBdI?=
 =?us-ascii?Q?xjcWpXzqmx4pB6RrA1dAZOqUkOKFVFqP7t9QzIJGFi+XPOkti5u9C2MDjvoy?=
 =?us-ascii?Q?revAOcQOGeo8yHwvZJ0omLaUZQHCbzzq4Q/qnatCDQEAx213/jV3B4IqEQay?=
 =?us-ascii?Q?/MWFGNcrcroKxq4enF3GB7aaw0/uzzu+TwXluPkmzER5acia/qXCOTKITBCJ?=
 =?us-ascii?Q?MImfA662c246nhsmSom+J7imP4IeUSHqMktorzEcl9kqcmt+rHEFWvc/4qAG?=
 =?us-ascii?Q?FiHcOZh0ML54nJ9fUH9uVXNF8ikEs8HMYcOjteWB25wf7HJowLAOIud34wnq?=
 =?us-ascii?Q?tt+kyIAEWOh/i3F8HkB4akoqskLtSKZVL6wArXcXaMe3ug6CQnU+hon5f1lE?=
 =?us-ascii?Q?MG4FXVFYDYzCD7A/AlnzhUaznunfWXYhnKXUyqCdR4y0LN4/TC/XNyEHZkUh?=
 =?us-ascii?Q?Osnd510n5Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a0d59f-b74e-4b48-f7b7-08de640259a2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:30:39.2984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yXHlYQaxG4npUKKS0/e2jsZtRFW0ht3i4qeuCW6/gBtwqXKvv3ZTYjayw2mbaYYYyh4lP+5gmNqlv72vQSp8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7979

On Wed, Feb 04, 2026 at 04:35:51PM +0800, Sherry Sun wrote:
> i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
> Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
> functional and pin connection differences. Reuse the new
> imx93-11x11-evk-common.dtsi and add the board-specific changes here.
>
> Here are the detailed differences between i.MX93 Wireless EVK and i.MX93
> 11x11 EVK board.
>
> Function differences:
> Function	i.MX93W EVK			i.MX93 EVK
> WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
> MQS		N				Y
> PDM MIC		N				Y
> M.2		N				Y
> RPi 40-pin HDR	Limited support(pin conflict) 	Y
>
> Pin connection differences:
> Function  Signal name	i.MX93W EVK		i.MX93 EVK
> WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
> 	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
> 	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
> 	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
> 	  SPI_INT	CCM_CLKO1		on-board IO expander
> 	  NB_WAKE_IN	PDM_CLK			on-module IO expander
> 	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
> 	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
> 	  IND_RST_NB	GPIO_IO28		on-module IO expander
> 	  PDn		GPIO_IO29		on-module IO expander
> 	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
> 	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
> I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
> 	  I2C3_SCL	GPIO_IO01		GPIO_IO29
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/Makefile       |  1 +
>  arch/arm64/boot/dts/freescale/imx93w-evk.dts | 28 ++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 700bab4d3e60..8837d7ec4f3e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -439,6 +439,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93w-evk.dts b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> new file mode 100644
> index 000000000000..8e53e7384013
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx93w.dtsi"
> +#include "imx93-11x11-evk-common.dtsi"
> +
> +/ {
> +	model = "NXP i.MX93W EVK board";
> +	compatible = "fsl,imx93-wireless-evk", "fsl,imx93";
> +};
> +
> +&lpi2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +};
> +
> +&iomuxc {
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO00__LPI2C3_SDA			0x40000b9e
> +			MX93_PAD_GPIO_IO01__LPI2C3_SCL			0x40000b9e
> +		>;
> +	};
> +};
> --
> 2.37.1
>
