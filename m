Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8B73AD513
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 06:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332877; cv=fail; b=jkrNKTy1F90W4MbbbXoG12G/dyLnyAcJvXgh0Hrn7CclWmzTZmEqFE/sO2mQO96/cIU4vyoqIoJtuqxFMMQcTqov6GkgXfMJVTSvSo2MQIhPonkQs5zhihSUT+8UzLo8auKix4XHsRDei35Kc/Uqzqxkgri3B/8ZHOmlVCaa24Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332877; c=relaxed/simple;
	bh=rlmAU+478U4B85A2KhBlz4QtcvD/FYrBXwFPGwBLYM4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=e300k4teLiemuIXoxFXWUQrx1EZ9J/d7DklIKegb6CvE9M2Zb6rTkBoDFO80QTmG/g+HBdaXLut7nRs+PB4gv5hxDjhiM0EbpAcLdMEkz0oPrzQKrUEsTzhCb1k5ZExJUqtW3oWCYdxabkGT/sqtoIMu4ldnuYK9SdfNe5ZS2vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oFBnT+xj; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oFBnT+xj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkIOO7uRxQ+xtlo6qVPzuq1of99DMOJbKB32ozvPTawslkMyNj6KBqXvHNdb+jyF9e4jnALEvKC7P3jDuNBNQzuuz4+PQec2yTTxXspEPjVx5wDhECYCy3A4Ou32trXuq6TquuvuK3I0zRCAWudquGTA8Oi5JZzo6dTAWQTfXknu5A8JDuO1z4WgsLEHAgZPcv3NSwRQfdHxCUuia0LNciWZ75I9Yfnyw5sdgnUAOrQFXuiA0V+r2MvmqW6hdvkw1lVp5H+9aXGguSixUitNhUsfM5I2sXuhr/L3VZdvDvBQ9xtaV6dg2vswBayIKFYf+lc2+Nd+4DZhKVkfgXZsJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWfiJ1mUwcoHZwQFaGV3GOq7P1MCpfIoyvB/O7vFujM=;
 b=lF0Gf14T3crBj5WsU/9JFgsTJFDGdWbHEHFM8HegEKhBYTOhWqSqUT2W8wYl9kAnt+YgulrXZNOXzyGI+SIcJug+7f7oUsblAWq5dxcgcVXkqM9N7ihZGdG75qOmDKAaUuWMM1aGVosai++KXBJgI6iQkIDzUjn2pCST3fpFfyeumIdP9RmRDKjA9D75cmGWLi244aGdY2ET+Lg7ZCjHykuGM9bI+5gaMzde+f2AWS74unj5JHVQLzQFBENg1mveBK9teYvuEw8rnHNv1u4zR+/e4gjzqEevGJg1oNekx4nF6sB4kcksWZgn4jQjlzioOpAB9cDaWhnnj28bf1ySxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWfiJ1mUwcoHZwQFaGV3GOq7P1MCpfIoyvB/O7vFujM=;
 b=oFBnT+xj6Rr+zKCXOPOgnpxwz7FeQMnjZjDkAN3zgqriOzNKfP5ZVJ4Ho9TWqdeF49eqFXJkCwzMZk5ASKdTwNLKXb2M/kLEFAmhyEe32HEzUru4AKvz4N5ISZlsG9sPVnSv9PB15IEV9Whb9O7QUCu48ruImx1aoWIoy8/lFEDkmcTrM7fMUCs8zWK4sdBczR936WCUv3G2pkUPf66M5bC13aS8RtL/tURV+viucnSk5xoYyNCwVKVM2IH8AxSBF1FLosF2tbREfoLI0q5mwKXMsbB6HmHXivr2VhVeCk1w6Fvvz85meG7ZvkCxAg/hD1GhV9qWhV/AhW6n2OXnZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8671.eurprd04.prod.outlook.com (2603:10a6:102:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 06:14:32 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 06:14:24 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	Frank.Li@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	maudspierings@gocontroll.com,
	josua@solid-run.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	primoz.fiser@norik.com,
	francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] arm64: dts: Add NXP i.MX95 audio board support
Date: Tue, 24 Mar 2026 14:15:54 +0800
Message-Id: <20260324061556.980621-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0179.apcprd04.prod.outlook.com
 (2603:1096:4:14::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: f688853c-c356-4168-91f1-08de896c9870
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 d9U8HmTkPlpExj5u0102vHWqPTp9I8HK/GWNRe/g8/Tbqv6mU7JhLpY32SEI6g9UHNhURsQ2kJYyNFkoMGVKgXOS0U3Hrb9m11pEnjOuirz9hV9WmV39qfOPeI9P8UV10yX7mhLKtJMkmgxl3OTsUxmFnt/HD0ZG4xnVgbzbn53CNnNEGbaD5WxFnIs6WNtUjBP1fO/fPZ+nc8XwhbpkQpNx6V1APh0BHv7PFFsZ0wr9CTQcG6v/qd3iGu5Q3YNYP3RgTeQKw5R4F9ysMg10zTxfchORqXGBtXeW8CtQSAF1pQyBQRTuDfZyRTB9VtMursaLgLc8+LYez4X164StuFUDeC6hDJonxW47LO96zIYDrVVHo52QjlKsWiQdw18r8IDMAgnzHjIVQVzNsmPSNLWANFfFk5HbhZbzXTnRkiNbBUNrDRVk4iShZffv2r6DurBhC91AZH706QeZj+JK6xxQBQkrJeo54PW1+m7D/c/z7++/S4clLytbmvULuDT3tsQRLOpEr1MAYJQ6QQyWFY9/Ggph0Qi0NTdLfkYf6k0wGSYiVxb1Ta3uA5x0YhbWPUxIPAqUPVnLQrOdOyzGdePpjM0BcjWB/3ENR+LKelR7bqQj1v+U5NkY2Ib+2CPbKEmRh243Tk4LVWXl0P7RvGvUC6OJ7ltPYbbdJrBfwLb//yqUJDZilnH0KPdI5aPmaaZD5hEEdQnIcNi9dI8DhgOzs04r5DYCRcM6bXlM/hKptwzEUCN1/MVsXSvEgBo/jmbVJWCkwv7RFrPDGimicfy8tWSlOb+tphAwenj5morSzeb9g3m2BKf81JlVCtJ3
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?iQ0U8txqIN8yoM1T4L1vmLnPoU68h75j9aTZ6hMfF7Wav6cd7V+2EL7Y1lK/?=
 =?us-ascii?Q?+UKy3n/vgMkVQKa3niZ1hTn+OgxuUJJ0kUuedq9FXpSPwUOAhhpWTx0qSEAx?=
 =?us-ascii?Q?ciMuwfA0i0kdDMgzIlLS7DOkMTCmKI57Mld/D06C+S6Hjh2a/hj3ZNzhtLBo?=
 =?us-ascii?Q?6BbeOAsdG0zNB7+PB1QoTBrzXTnksZT0Q0apLJtfFXrRhjpFCwe7aKkUC06v?=
 =?us-ascii?Q?UD3P6gzTAD3XKs1Q51oIjORpcSAkVCbJugflzMccR4Rmhh8Sj/fu0Sqeyg+P?=
 =?us-ascii?Q?Bp7eFsL/5ilu31AY1thDcBrIXdBdSItoX59lJT6X2DpfYnRQl8NN1lkd3fT8?=
 =?us-ascii?Q?NsLpaod++HE7oqpKBdCwFAJqQlpmz7doDSGz5u6pzREeW7aAFX+ZQrohoneQ?=
 =?us-ascii?Q?/sd9rHUa8byNwhentptGEURZDhewYmYXhAFjJ5mYGgTp1ey/wlNVJcbumb92?=
 =?us-ascii?Q?m9wY6UzXaWc+ds9vJ/Hpg1ij1SEU5Ni3EUR+LxfTfDHW8brGy6DuXGew2nml?=
 =?us-ascii?Q?IJ7PlNXRezofy2spWyzo+4my1c+gxWsI+UoFJrMRLLW3ra1BhVGTMNwl3z2D?=
 =?us-ascii?Q?vr2cdZBHzZXwJc67mYur8sDSRMuq5FMnKdfQ7KqzUy8B0DyDt4yC9XivhsMP?=
 =?us-ascii?Q?NbXvP8d9PLuaJF3n0va5A/MSVff3pioQW1UY/dqJChMkGkdHc1k9GyrxnIIX?=
 =?us-ascii?Q?7kCIVNaMb8hD28WYSjPrLl8Z7pUTYk7PEBSEs2PGD5bVfpSdDWfYPO5iukss?=
 =?us-ascii?Q?oIH+2OOZ3igTc21IqeTzAc42WsXg5TMXBDUj/ZCfzuDFBqyDaw18Eqnh8T0m?=
 =?us-ascii?Q?2wNwcu+Vs8cwxCPuYlla5icvE/vT5kTfzm6kqZ7Je+yBQyV0I2DptQtoiuHp?=
 =?us-ascii?Q?4hRwpv2QefhcSRjy/Bfa8fJ1sDXCxRen0qacdDTG9YlarFOtt3sK3jP2rbBO?=
 =?us-ascii?Q?HFvF7pQh90YEv6MI6/xFAIy4CyhRD4qXtWgBdd1KdhBuXExSNJ5Koze/qVnH?=
 =?us-ascii?Q?P5Yz2gl39EjPCOElkbdSkgWkQ0ci8yW58PzhtewXzdFbEXvIhX+Y827zNU90?=
 =?us-ascii?Q?N3FI1fSL8DqEqc/M4VDJ2Wo9GlY3B9aZbJ4tplzn5dqYmjzu/+/wju3SiAal?=
 =?us-ascii?Q?DI/bXWHs9NeY0NjdqiAvYa1dzaVTpO7vCvHtTrlsUXJXvo//PXtfnlt94IjP?=
 =?us-ascii?Q?9omnGj+8W00FDKcwMbcKS//GWYg4i1FndZwMjHP7Us2IsBp/Y5YdPIwqEeuZ?=
 =?us-ascii?Q?bMtHt+oANO7JVaY0iczlXHPYBj/+rfQTR1r47MvU7cxYsIS5acH20XBGmpjA?=
 =?us-ascii?Q?rbzLb98lBZW6pPiqqeuKo/+J4PY0+WDNkudI1eMZIutW1UFJyGJuig3Xlwia?=
 =?us-ascii?Q?0SkwQyhQS0tei+Rn2WgAt/wXxJhBE2+wCM9jx1O43zhLso7iLadv8W2xoNzZ?=
 =?us-ascii?Q?yQ3/idmEBk8UDQwR/kuX/LF5aKmsXxDzF5p8f/nH49jJ7Czv7AXomW7O76T5?=
 =?us-ascii?Q?50S1xA4vxOPaeq4lKFqgEoamZvtYGFN+hHsMwD7y6AIWe/BF40dQXN9rykQU?=
 =?us-ascii?Q?I07sHHqdcDioCrqqiTcF03lyKCGCIJFfBuF00TlWJ0P4511UIGSENFAHYQ+j?=
 =?us-ascii?Q?1ZrnpzYpClm7CTbbcnsX840Qg9CNmKWbTcOG679VagImLdKNYvqDz9NhNFdX?=
 =?us-ascii?Q?MSp3cvnU90s98P8pYjnb6Mato/5qYUCz3mcecEvoyvl2h2eytSlt2Newii2j?=
 =?us-ascii?Q?uoZo3O96Lw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f688853c-c356-4168-91f1-08de896c9870
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 06:14:24.3965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFhg5IFEZ3ZVm3Xy1cZctb4NyBgklwly+g/fn2Am8hj+GPH9GBpYxL5QC+m67VOGDxmLm/yJgDBDTuXVuzGvRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8671

Add NXP i.MX95 15x15 audio board (version 2) compatible string and device
tree file.

Shengjiu Wang (2):
  dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 audio board
    (version 2)
  arm64: dts: add support for NXP i.MX95 15x15 audio board (version 2)

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx95-15x15-ab2.dts    | 669 ++++++++++++++++++
 3 files changed, 671 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dts

-- 
2.34.1

