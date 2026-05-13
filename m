Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0E6389DE8
	for <imx@lists.linux.dev>; Wed, 13 May 2026 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778666475; cv=fail; b=EYyBxVCvJWK4Z6h72dEvPyr//Q8AtGy8EKPybLTcBR+OEwDwkpiIV8lW5hjTq2dONQNMRmJHfSdNeuStLWr/AJT7Y3npPWuTWwZZk10cnpspn3v5da55Ks82NtHg4e+L7kudjOmTIPH9r7pWlxhlBOMZw8veSR1eW4Oz9pmh0wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778666475; c=relaxed/simple;
	bh=gcaOg55UfUvZNOAiZQd7oFOubaNV+4XtxWerCgdA4K4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=mBmh+GZYFsTPvNRdiJBd45tbZNkSox8fMAj9CCyEs1iiAgcpxtSjNEirfEIQTxaY3QHJ0v2V0wjT/at3ImRw2xDvh0+K9bc/iLLSbOpj4xHOjcBM33Y3ZX2sEnC8OBCPlWejYZl1+8qhqNJaUlpOoMfCD7WbV2N7HdZQVo2h4sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DQwPKDzC; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DQwPKDzC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jO2P5h6sVrezgILH6LZJw2HF+FfwGSYiTe5+F5Erqj6oENaOrwwxqAkmAq3oSbGAVvcyO3SQTIkh9ZZZd6xLEiE1n3nYEYpMajotBLXbRn1bNngoe4aONt6Zc6qCD4/9asCI0VSYo0RywQUNCfRKhkNE0eTqjZJJvkchfZcW2OPE8uoVi7T140vm3Nkg69fm9q9Tc88z8iARE0JvtTbEEr0bxTHs+UANzaQdoVDnNemMxPyYaBZ6hdu5ixdoRLvUZX/2t2F/RIkyDMw5Qxlnyu1cRBIWrPu/tCDcOv7xmK0kS3qv/ZJkFsbIPifRXpb+VgF1YGxQVFDod3q7ZCHMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FG3apDllCbRxS6DzrWE1+5z+aWl2biOAEmGMiAurQug=;
 b=IwDsDlmGruP+INcgAj74PNBVJvKwmCC+gJ/ZBGoXUp32fqobAxpyIljfNyrcfk92hY4Sq8B7bSBujml9JX7KAyJ16TX/OBIqahLCmt1b0oTk5UeIYVQX+1Ra3NVw5hkdgQulD1Yh2JN6AcTEe4f1pzfEE6YgKPqUZpv9AUIsy7gWy0mcNAkeGLEmzCZ9o8aOfqt7X4odhLdSUrWoir6241FLmCBwaEWUCKDNGUBfwa0WY4Tegumv1IUW8PkzabakL9sz+ltzr0khZ/CZ0/Z76zQnsV5kPgTWK00OoRSMAyM1zfjfI/RWKYKwfgkQb1oNKeo/2V4L1PsTWnwpKAcZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FG3apDllCbRxS6DzrWE1+5z+aWl2biOAEmGMiAurQug=;
 b=DQwPKDzCHFQjfQNQL51JLxIIVPnoJ4bpecnJlqvrsUS6XCqdicyF26eLdpEYvmBpNrxg7sEobgSBmBe/xZLnqn5rI/ey0VGig5TwTEEipgadaNhtUTay2ZYVmRZP0g/LDHNcUVzJLWD8sTDG9Igsc79vXHV2NAWVc5yw+pVdEb6UKU24iMpjR9OHONVFwvlC7Ygy/xCNNQIdlb8Y0cmAkIsD4kTXKDEidU4Sh76e1VhvT3AM8Gr1pCluLijCHFfOdxq7wyPfWQxUTvY3NhN4GKsOEaKDpsBRNPS+O56v9wnHQKFnMRwfxwYIKJtrW4bztU5NN2gJV+RrIwr/6ghhFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by VI1PR04MB7134.eurprd04.prod.outlook.com (2603:10a6:800:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 10:01:06 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 10:01:06 +0000
From: Liu Ying <victor.liu@nxp.com>
Subject: [PATCH 0/3] arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS
 panel
Date: Wed, 13 May 2026 18:02:13 +0800
Message-Id: <20260513-imx93-ldb-v1-0-d11c5c3cc197@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACVMBGoC/yXMTQqAIBBA4avErBMyLbCrRAuzqSb6QysC8e5ZL
 T94PA8OLaGDKvFg8SJH2xrB0wTMqNcBGXXRkGd5mRVcMFpuJdjctcwUWnIlUXKDEPvdYk/396q
 b3+5sJzTHO4AQHh0fOfxtAAAA
X-Change-ID: 20260513-imx93-ldb-c5a4194e41ce
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|VI1PR04MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 29cc7ac1-a166-4d16-0a7e-08deb0d68c58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|11063799003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	JV4gyHbM8lhxK9s1w8+9+P3HbGB/3JqGl8AOflR0AUlRdcqV4dAIFkMZhrnOaUrWjS5VMrhOdEwfR0hY/MoY4VPLK72Pbd286inoLjkOo2QEw9slJ42Hiz7iErFcIyrZNeeD1SWQQHbiqT7kAOmTGe/7trQAhjvPnPHeyv8vtV567xPTtrAC8TzOPGUeGKBKDA74ohhWHfGoUXgNT9brBEhm/khPDzQ4+RbUo+of60i4WFfCPRlkMqMWI2dFu9ukBCjs6N5N0GulLnQ6Pl2fPdBBGk7wplMoruQBo3vZunuZdQc0dPFfQu61eapsJaI0zs1bP7hogLR88n8TzRazb/6vSSFr/oe7Wlk4lct77nCRgo51j9zGTJ1FvMYuVSGGYDPmvMIahCG4IgfSou4Nxv7GBw7osPn3K0+JsKkX78B7xJ58INkNjZHXM3ckgYM5NnzKTs9u7G/iZT0LVOVbwp6Cp4lIurk6TcbOABL2fbBKWEcVM1mQGdACQyrul5QbRbvM1/hQ8JBBWSmxejhXMiBH+1uexXGFOnCFEnOPkpJ0rXxLB9vbs5Di5YTm0uJnZjpLLueqLuBJJf3fQpSaQqfwilC8tondnQjq9ba0iYbU+xR9lXjBnoNGNfw0xhCtziSfyyFgVpdKlhj+xyU2FoqQKL9PJiNgHwWrEnX23vItc2DX9cXvZCYCBF0uHCF/RsK3mP0fYpu+vTprO+uQsv2la+TaoQqYTSgjUPBMO4uGXsD7GN5ySShTnJSk2RQ3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eitMQkhiTHA3R3E2a2JQYm13NEtTbFB0S1YxaGRyMDFkUDJESGh0YUhOcU5p?=
 =?utf-8?B?WCtGU1JvcDJjdXpqSGxuQVZrUFdpNVpVRU1uRGoyN1ZmakxDa1FObVFNY1Ro?=
 =?utf-8?B?eDVMUEVEN25HT2trTno2R3RBZC9SNjdMOTUwMGZRTU54OXllV0VSaWk1SE9I?=
 =?utf-8?B?a1NEenh5Tmc5TjhhandET1FzblRUR3A0UGtWa2UyejEwaG0rdGRLUFl4eDFB?=
 =?utf-8?B?TEZYUG42cUsxNCt0aDRKdUdicFdpNVcxTUYzNTN0bGJ4ZXczSnlManU0SVVE?=
 =?utf-8?B?TFYyVW54dU13M1RLYjcvdE83bkhHZ2FSbXBUc1hrbG9HNDcwRkxIdkt3TFRV?=
 =?utf-8?B?RXRJRHFTRDhwRmd6WEc2M1pZcnFpbnoxZWpheFlEUnZ1WXkraXlyaEo2dHFN?=
 =?utf-8?B?dXZ5WmUycWdBQmhIaXJETDFzMHJCbktja0JDV1VrWnp2YXRoTFBPb3pobVkz?=
 =?utf-8?B?Qy8wamVuUUpsNUxIb25JMHVIaDV5ejJGUWF5YjNCM3hjOVhNUGZaUEtJTitR?=
 =?utf-8?B?Y2h2dk9XdU5xVU9EdGFNUXN4M1M1ZkZUaGJBb3M0RmhVUFNzUXMzM09STzNJ?=
 =?utf-8?B?S0hmWHhPMzZXVTVpdFUxa3RQNFQxUDRuRmJnNW5Qc0o5dDhuZjJqZUNKenR4?=
 =?utf-8?B?YXFjTDVBVWVnam5QMFBxeWxudlNJMjBQejdRUDVCY0MyNW91QzMvZnZtRlBn?=
 =?utf-8?B?RHRFenNCdmRSWk1NeXpPRkViWDlHUHFXVzg3U1pnV0p3VERJTU9yNnBicWc2?=
 =?utf-8?B?azI0RytpWHptbVFIekdwM3JNbUlxZkFwNHVmRVN6bkhRRHVTck5mNWxXZ1d0?=
 =?utf-8?B?N2lsK3pFYzVrYlI3ZmlWbVVtNUJSRG5NNy9jTFpjTmZjcy9JOGFVSHljYVRO?=
 =?utf-8?B?ZlEvN0tyNjJTZlc4TVdORGJvSGpqQmhPdnRPVnVrcGNlRDZIMWR3L3loaklE?=
 =?utf-8?B?ZDlZSGhMd3o4c1BjajZBRzA2SjR5UlZtMjJ5cWpWemNJTmZlWk42SmY2L1cv?=
 =?utf-8?B?NXZ1WGhPendyNkRXcVNvYnJRdUMvei9PSVljQ29OdVp2ZFhuYzJ2QXVhNFdF?=
 =?utf-8?B?b0ZkZTJadmhkcWR6L3JNb0NuV0JyQitLUy82T3I5ZXBvbndSWjFhWkpBdnNP?=
 =?utf-8?B?Tm1CeFR6MHFuVTlrZmRQcXl1YmxOaStzeXZsSXdzUm1PSXFSY3pOYWJwZVB3?=
 =?utf-8?B?T0k2Tkx2eHl0b3Z4TGJSVjh0NGk0aThyTm1GbFF2MWYvZGdtd3VDcUxjT3hx?=
 =?utf-8?B?cWZmeUFJQ0dVN2YyS3RTcUdacVVyTlpSQmlia0loL0M1bTU0Y0RpNEdCaldy?=
 =?utf-8?B?Wi9tOGl1c2hvRVNKT0l5WjRDVjk5MElmVEQ4RXVuemdteVdqdkpqV1dWWUJl?=
 =?utf-8?B?YVNrTTJCeU81dTJRODVXV21wQklQcXZiY2h0ZHRObXFoS1U1Y2g1emdQbVZk?=
 =?utf-8?B?T3UzWHFtSDNNb0pjb3I4bmE0MTBlNmUzQWt0QlM1Zk1CMTg0a3Mrb3JGSGtY?=
 =?utf-8?B?d2NZV1JHc2lhNVlKR0xiL1RHMVFGR05VZHZYOC93NmsvUnZmS3QrbUhKaG9D?=
 =?utf-8?B?TEFySEZSWDAyMWQxZnZwWFNlMDZ2K2JBQkFwMzFnSTR3NXdtYk9JZThPOWJm?=
 =?utf-8?B?blJ3a0Y2U3RkREh4Vlp2M0dkZldGN05KcXNMRWRnbldLQmMyZENwVWFQRW1y?=
 =?utf-8?B?QjlnNTdRcVU1eDV2b0RMa0lUaG9Ub2RvTjdXbEh6QStlZjNaUXN2c1lSbmNU?=
 =?utf-8?B?a2tRZm0xMWZnTENXRWpWc2RxYTJ4TlA1MUtXRlhLamdiNEsyL3JLcjdkMFZF?=
 =?utf-8?B?WFp4MG5Pa1N2ZS9rd3d4ZW5DemhpMHdLOEh6bFJnZDRTaGkwelZXeHhjTkEw?=
 =?utf-8?B?Y1dWR0xTY1B4eGN4SGVQb0VTc1pXRlRJcXBMb1RhZm1uREg4bFd5eGlSbWUy?=
 =?utf-8?B?RDdZSithd29EN3l4czBCb2JCOGRMQjI1T2xEc3lZN01vbzV6VUxqb0wyblh5?=
 =?utf-8?B?cnZHeXdBdDlVT2ZwaTdyaXUrdFd6emd4aGFsM0w3WDlHTWpnaE9NUFpoTFNU?=
 =?utf-8?B?SEUydnM1bHlDY09vdGdBczR0YnpibzhiRHVCWHRrNTYrVjdpSWpXN20zSTBS?=
 =?utf-8?B?ancrZzdaV0tDS3BiY3JQcTZQdnFnNVliUXZ3bUxpZGtHTGZ5Y0MyODV1c1pZ?=
 =?utf-8?B?UEppZCtFblhDTWxNcWZGeVBCRzVQSU9RT3pBbFdnOGp4ME1tcC8xbUYvQzVD?=
 =?utf-8?B?Sk5WL05HSXhzbXpUVStMYTF3L0xyVkhWb0c2Q0JERWV0a1pyTG9CMi9ldFBO?=
 =?utf-8?B?WDAzaWUvd1pVcGdDN2pEd0VCUW5ZdlhoZGNvalNSMERqMTJJZ21PQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29cc7ac1-a166-4d16-0a7e-08deb0d68c58
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:01:05.9406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAiDp0NNrHwmZnq/iP8O/heeDukSCnxDI9jEYuLBrDX7FyF1sw6EgT8MQVD5T7C8G1XjdRdnPD+ur4XEZUzE7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7134

Hi,

This patch series aims to add DY1212W-4856 [1] LVDS panel to i.MX93 11x11
EVK board.

Patch 1 allows LVDS Display Bridge (LDB) child node in i.MX93 mediamix
blk-ctrl DT binding.
Patch 2 adds LDB child node to mediamix blk-ctrl node in imx93.dtsi.
Patch 3 adds a DT overlay to support the DY1212W-4856 LVDS panel on
i.MX93 11x11 EVK board.

[1] https://www.nxp.com/design/design-center/development-boards-and-designs/dy1212w-4856-tft-lcd-panel-with-lvds-interface:DY1212W-4856

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Liu Ying (3):
      dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl: Allow LVDS Display Bridge child node
      arm64: dts: imx93: Add LVDS Display Bridge support
      arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS panel

 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 38 ++++++++++
 arch/arm64/boot/dts/freescale/Makefile             |  4 ++
 .../freescale/imx93-11x11-evk-dy1212w-4856.dtso    | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 37 ++++++++++
 4 files changed, 160 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-imx93-ldb-c5a4194e41ce

Best regards,
--  
Regards,
Liu Ying

