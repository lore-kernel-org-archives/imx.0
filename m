Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E7235CBC2
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 02:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769136396; cv=fail; b=IYD5fkJH1cufstfPwnXTQKJVO/w8jdGPxbPGAWBG2qTq8wtvqmy3QANCDMjSEcUbVgjo/rBOE+8e0D5BhZwrDF8xeeTQyiC2ZwneuxUgPU5M0FVvFdhQ3K2nW2Rorh8c7WQ+tDYDLXCxOeNOzAXzLihwHFXYeX1W0fi5K4M+1fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769136396; c=relaxed/simple;
	bh=ZGuQMCfTfLZEcA0BN0ci1Z+8WcQNJuikL0GTxeEHb88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G2I9A6FZ0j/JWkXjotL2nImRzCOybWEAWKylBp99PFUsN/5IQCQY2nPX/uRIhFAySTJ3w1LhKLDRoD87jW/wT4kKyfKDldGULCjkXuxqiOk+LwAudnD4bvt8EWaj0kDLzfC/V3vno8UGBqGtvJYw+iAKgLKB7CHqSf9BmvjKIsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jv3O5is2; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jv3O5is2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzVAMBbVcpLHqq5T6GfJG45+Gl0fLt6OijiW00vTRfykq+dxh+5kkDoGg/+Ig0NUCZSkwbugkuCs8RgT8plF7N4KGeF9Z+VOm96RtUz6C6cXlfgE/N6bgA79us4EItaZkNhszs9XKcBE0gPnYBXm5PLk9GwuV34W81F0NA3O6wHZvxjjPzV1hberJMaXb6JZIY8uQ8Phe4+P+CQny2oqGlu/yQm9HwzkN5y6mf4XFb98v1VIuTxJyqJTZ5iog3Lfbo2AruDs0byc98ThfpkpjV+DtRHWQrHgQcVMb9loI8pKA30KXEO44g4RkDhBzyEDf0l3Ib8cGVi+znY+XCnPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iL1YVRiEzhaST9gVc7iT80300rPIMmixigr4AGj+sTQ=;
 b=Uk782SbBelsIAR/+bWnWM1Fp5D64dNtAm9HaUC16Cnp2c9WktV1b42A58iyMcVrhydit2njHMKuaKKAQp0UgauOjLdIvzlxbljebNTBLLTMa5qi5kLTM+c3Ti8VhnrjfHBTZwwdxGgL3aGicufo10LnaW5hxQTnumLtBHYXXfUECFHiGrKPgkUq4ovUZj6qnuC3wtag8eU+VHZcl0b6oBa94ZhPfLW5sqppAe99hZO8KkVVEJBb7rhQ37fWNMy/qIrOhA2fOo0TaqJv0oe3a1FTWxE2S7OaouijpYYT+b31ssIozVA+9Kdm4tJMOODuzDp7XL+4EZNYcN8Uypk2IoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iL1YVRiEzhaST9gVc7iT80300rPIMmixigr4AGj+sTQ=;
 b=Jv3O5is258GvRztYmfq3oOllzRarnFxvuTisw4qGBXXFSOIE3CM7v5ArjEcmXl7PB1Oul4lPcSLGk85TSXsNZXko4TLMpmUuFLiRKQm8B5l3M4C5lR4ezEhMnQKF1r+X2JZp8yiTcintw4XgblB56uLCUIMHj/7TMCMiUtrV503f4PD3VOaaVpKmSNQdN6xWZ9C0TUn2U/kkXdIM91RsgnuzZjRcXJf2uAX+EEhY6UXAzyCR8krdtiZPEw15dfLCobkun2lW+o6fa17ZjxVp9UJ6SrCyNjzhv7jvU7lq1Z9IyHaw1pDPqhZO4ppsGsTRJ8WJWvFBagwMXWoxipP4aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS5PR04MB9797.eurprd04.prod.outlook.com
 (2603:10a6:20b:679::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 02:46:05 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 02:46:05 +0000
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
Subject: [PATCH V2 1/2] dt-bindings: arm: fsl: Add i.MX93 Wireless EVK board
Date: Fri, 23 Jan 2026 10:44:47 +0800
Message-Id: <20260123024448.3909345-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260123024448.3909345-1-sherry.sun@nxp.com>
References: <20260123024448.3909345-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::22)
 To VI0PR04MB12114.eurprd04.prod.outlook.com (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS5PR04MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: 03cd525c-0e80-495f-443f-08de5a298e07
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?JcDRSaHx2lMyzT5qMfZb3aOOZi0grGbtdaxM51vonHv1Dn3GZKDfoG8IrBjQ?=
 =?us-ascii?Q?1oWOEncw7CX6Z4fA/B6VmI7Y32/Y1LopYVPBi1V84ejPIKgLquk98wBBuMUu?=
 =?us-ascii?Q?8O9n7ff/Xa31p4TjNQX9fsAzGsV57l00jyBhxjqagh5B6ffhifWwb8ott0tC?=
 =?us-ascii?Q?1uNtHMf+8S5235lELA9V4Qsl/guOhM/R3pL7Mk+NJ43bmqlp57s5FeHnWWAu?=
 =?us-ascii?Q?B8h6y0KTczjtfIxQL1SgdvvaDnNfa6EyNvkniKX8WYixKMRlKH6BvV8w7m7C?=
 =?us-ascii?Q?Iqzxae0BZVuydlWprbr+fFZQLsds32HArmBMxP4Z4p6rr+Cj1GkUUt5qaAvo?=
 =?us-ascii?Q?VV1o+BSpas6c05fC38Oqi+0zqcn01hH6iCpHNgq0VWDoyAbBjM3g92qQK+5t?=
 =?us-ascii?Q?iZlhkAqwG93jEkFhmRSC0RwZULj+fvwpC5V7vULdqgGRPRALRgZ+CTD7/dDd?=
 =?us-ascii?Q?rM6mg+vgUgwpulJVBZLsnrppKhilJRCpy3ToAGGDH3H1DUl9MMmAuCqo3/Es?=
 =?us-ascii?Q?YIxBvxABgn+M5ktSzxrfXuZbFXRuC/2zQ+T4aeDsJfHK6PS17ZK7LIOmu1kA?=
 =?us-ascii?Q?v07hqpkdF0TpWslcJhJ8hzmzyKMOKMZYh4ug9qexbhLEKLlu+0nSFtpOH8Ad?=
 =?us-ascii?Q?9zXZwtkkYWftQZ8GDMLmpWtGncLz3XaxeMJIukJ1mVX6EZdh8E8s3s2+76d3?=
 =?us-ascii?Q?AVChW9ehJgeZxxhc3sdmVGKbEsdv8rkBytSfbLiekVg3V1p8g+qhRYT3QUIK?=
 =?us-ascii?Q?Gn4PdkpmAKOTijxdSjswROPrl79tT5TmZacGm4x+fTON+gwT6vkNUHsjH4Hl?=
 =?us-ascii?Q?9seSECokUlwMVTF8F80gOMcN8dHQJp2IpnKtwKtbiEBtTa3Im46Q/OO7ICEx?=
 =?us-ascii?Q?T/usmLMx3NIMFdjQqn0zmTYnzX9qER47LA7tC3lfA0ISC+lFwxOLXRhq08mG?=
 =?us-ascii?Q?SnlfldkanwAZPWc6nMZxJiTIkAEQVef6Sks4A7szTVNslI6w8VFPlX+/VlkC?=
 =?us-ascii?Q?MYcqbqFfGG7ruHOWGQTrFv5OU/lVj0S6g2BKcJ31LeCDInTAnaj91bQLq9Ir?=
 =?us-ascii?Q?VprZcLR73Y6ZziI6sWdoQ2j2X/NLZpcKhfRi+dlkkQckAZHdJFU8J+UHdps5?=
 =?us-ascii?Q?gSzPbyzhLK5hKuE84mZ4urxuL+YeChwnlXcqFD5YpCO7hFxLcx3/J5dFmJFm?=
 =?us-ascii?Q?j/ExsEcISQ73USXP6kkWHhZcivLIV9j4fNkP9NwvTUvYcfls9Fp0MYBdRIjz?=
 =?us-ascii?Q?078001019XnJk8W1k8A++TEWkd9ff5iGD2nW2w5zzm2RldGiA9polfqjC5ok?=
 =?us-ascii?Q?6kj7H0XrHXErrsFKRI7zGNUGn+4U321dV5sbhzE7hQg+0SS2l0cZh0w2xxwZ?=
 =?us-ascii?Q?QzMjlaYY/+VAlwWDka9pQc3kfBCeaAA3Sb2EuMSRXF0zko7rIUoybaSJTyic?=
 =?us-ascii?Q?F3z0DfLOT5s114Q6VAUaJJG+2wB75TpQz1vuKA8bxM1GkKKlgkNNCfhB97qn?=
 =?us-ascii?Q?syuGI11+YXXNg+j4ui42nd6lBPptPHp2jjC0bp9bjfWdF6mm6rbNZ6LBvmHY?=
 =?us-ascii?Q?kOxrX/RID85S+HTtHqDm9BrEow7tcNUrhcoWqN210buiFqcUc/xVy3FfsCLK?=
 =?us-ascii?Q?4qWpIRfGvJIijtGhJxrmwLxiuZDhhXHoBewzoM/r6RCX?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?IBqNFlvOORGRPe12bgw8Q8Mbng4iJQrKm6vd/v1xmGuVeH+4FzPT4MhswDYb?=
 =?us-ascii?Q?4nGpyIsXGWkUpQYgEK/6bJu1I7OAnWlW94Xb3fxUOWBwaD8MUzH2ZMIG2TDK?=
 =?us-ascii?Q?RWkBUi5Ddo7MVPISLJE3Y9MzYoHjZYVy8DG+W2gsmZZOw88261MlNmrbcJuI?=
 =?us-ascii?Q?zhZ9eqWHUnLTKyq0XGB2+88OILlbRiPunAdwQ/jjcQk0fOM7ncd7dXh/JpyG?=
 =?us-ascii?Q?XC1nGvsoNvdFKvc+7YO5yJvstAfAfn/vOG4/aRLBp4DbgaZY2RXxA7Z9ZDh4?=
 =?us-ascii?Q?cnAzK0fiL4+AiON/dK2AH6rb3fdIc9IAfCvw8UZ5fI+9JqAveCFvl9b1KNWH?=
 =?us-ascii?Q?BP0i1k6gwozY4V8vCBrxSD7SVv+pI3olmy9QM7W6zSehWwhqfE4VuhUX6JrV?=
 =?us-ascii?Q?n+nuv+iZqymGns3snHLv6AzaYiP4sVRl2+QqLeDOrYZPZy3hH7YyBr+MDSyd?=
 =?us-ascii?Q?SktGlXM5ikVyZ3Ye8Chtc73gTEQftkOGnB4WQCXzb49ULTbFIFCTa/4fmIeR?=
 =?us-ascii?Q?SkcMd7PvZrpqi49zkIALRmvZr9djbSslUHFz912QmOe3OrvXvQ3GXB6ruhjX?=
 =?us-ascii?Q?+4RDLzLs2XtWGRMMppgdkCftIBIUgMI7XSusV/JLC81egAp5jMh0VhE7gsma?=
 =?us-ascii?Q?lZuj7vV6tQQmFZzM7B+TSE3VCACGYAktMl8S6Vy84XIYKEcpnexBhpvKvLo6?=
 =?us-ascii?Q?w00dbmQAI+KIyrqSS/tm75/k4TP3ul5Jlv5LiY9FMcIUbcCKIysiz9ezb4LE?=
 =?us-ascii?Q?YMZ33O9KFJY89p3or55LwuRjGhnhcWN9Y/31Q9oemtmtRseLA9HZlfhgl9G+?=
 =?us-ascii?Q?fOZ+0fGFvqISKo22oNEeCarOXnN2v+3sjMSKlNVQMIkNdQ7Xg9niWv/ASHnS?=
 =?us-ascii?Q?A+YBsORVQZpVhp3+A4aB2EBi7XufqbLU7BeliksO5azw3WwmOtxHdNqNgKJ4?=
 =?us-ascii?Q?wGfBSEzFUR/KqfEPgmRsKh8vO2XKWoG6v4HglCHwBmzNpZB86KCHo7vLVDrv?=
 =?us-ascii?Q?ZhJ9F3ZgX+bGU6sRE/2wq1LODIrSivurVrH0EQYDXYtjeUPcRsaw8SLYJCeo?=
 =?us-ascii?Q?vdnLAtO8ERh9fIlfDcPrbyhPbVXCTDPFucWRFLnFoC73arpjjt5yuIFvuRRJ?=
 =?us-ascii?Q?BL2gGAz6WYn+BowwvqhphVa5t/9ZUpRTwVcyp41M6owjovhUBzkkN+0e0IUF?=
 =?us-ascii?Q?Pp/77ENeY1u8I5/h8J0ZzlL2RGNU6XXhcqbXAuMZirjVn0ZznHvbZOs1AMQR?=
 =?us-ascii?Q?2lsId01aerPduUUcmij1ZOk6G7+hJlXnWA2IwJLXjyiqPJx1A5gV72E1jZWE?=
 =?us-ascii?Q?87edlNgbxJJQo+Jo7EmTdFMwB3qVyX1/DuL5MIZhq9jGa3dlNMwTiBzPOlUJ?=
 =?us-ascii?Q?CO5DVCQ74Qzp345PDarNsJMO1LSjbjYI9vEdw2pjqqMvd2uW2+Dl8vHzGOBf?=
 =?us-ascii?Q?YcTxIBIbKne1Qb4SQuVwGfUme5g/n4v6VcU7AHEL7vc69X0bnwIcdGc8/hYO?=
 =?us-ascii?Q?fN0rFB9Kq51wE7qQBlazReYxgUujNO5oAF+yJEtuHMORO/gbgxrSHQ2IKWZ5?=
 =?us-ascii?Q?n6mlFJimKnum/GqHv2ctCGS5S5TRe+s+dpXvYAhDrpetUYns3rARARx2uKSJ?=
 =?us-ascii?Q?y6BfOv39NWjkP5u7gULlPewusUV9wqLwLkC+DkATA8ecZMPiZn8EJmyDyVLQ?=
 =?us-ascii?Q?00u12xnBCUnZCGwCS5ZGCCnuNfSrMAOzTYyNHQE/30rsH3PIegrjukYGKqyn?=
 =?us-ascii?Q?eXig3e2WTg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03cd525c-0e80-495f-443f-08de5a298e07
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 02:46:05.8978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRUn+olBEzfcqee2B0/Oq7cCRCD1CjL8m6aGAsWkSb87UsXMN8v2Rx6FzHR0brHJ1VdwbdBBWZWw/zRVyU2zmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9797

Add DT compatible string for NXP i.MX93 Wireless EVK board.

i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
(Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
functional and pin connection differences.

The detailed differences between i.MX93 Wireless EVK and i.MX93 11x11
EVK board can be found in i.MX93 Wireless EVK DTS patch commit message.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..df01b928c6c5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1441,6 +1441,7 @@ properties:
               - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
               - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
+              - fsl,imx93-wireless-evk    # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP EVK Board
           - const: fsl,imx93
 
       - description: i.MX94 based Boards
-- 
2.37.1

