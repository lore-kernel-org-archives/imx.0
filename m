Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5F811CAF
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 02:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626998; cv=fail; b=UOGlG0jefzeh2m8Bnvo+AI0yNtxJH+gJTM8WZerbUGEo0x7cJy5ZWByzZBpAY4/HqKpDgQ5fmLLZqEt24Y6J0Fgx294IbLPjKlyTd1f2/gb8fqFX8KFZHIKEW6UdDwKiYLAFA3FhxHcvuNImGReiMXK1sa1iq9xQdyrPmMm5ycY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626998; c=relaxed/simple;
	bh=fimBcCd/0LyoINRa1pjeyh4QyUgpPDE11yEKj8oUHdY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DxOhVlSiR3MXV8l1C9TvocVWe+Nx91iQNa/hrQ4aXLF05g7ef//OiZ1IKJ2/7PTWQP2fFq7zrdM4/Sz+J9sduUKLO/qTCt1SGM5x6RIOtxYcezHvDUUchHmkHXULvA/zR2zRvNPVSmCpXjQAv1+o+61jq3YaILG9L52Tr4YDEFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f1IxK6Dq; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f1IxK6Dq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uq0to5t0cJOmWVyXK/xFri1cC32uPKhWyhae2xxztZ3V3fahevPDe+RpE5e3gRVPAJD4h769xanmfS1fwtfxCNvqRo8grXQKAtyu/+qiSrgO7Lt2mesWCkb/zR6OLf2/tUuJfJDYsbv51XKQgFPDCCKfSnRYd93qOywP8YYXHuJZw/fo9PMNLq2+O56ZVRAfm0anZ5S6w+abfcY5kq4iMxtGmu1xc1bUSrQfJ0ICeLkn7Zi9b103ElyT2j1CEcEZKL6GME564oEkJykREFhvggOhXvM+IUnCjoopvM7LxNeObLLhNPNLKNCVkN0BcMUCCE71P7WdwIokY75Ap1rteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6szvOZ5spgH7ur8ONT+h0nbzp3e1wQ6yAIaDwLABRc=;
 b=Kve4sDGDcwdVeEDCCXbWiyman6paytRcPkEWjnBLKWjNY7nkau0BndXiYqEel23jZhJbu8klovwz/mlu6nZslTav+H1KoWwCm3GgMP19NCWIIXSUuyEAn2WAz5zkxxZyRro1vtv9OV/v6fU+VwUmQueCV9rKD4+8zPd6RxfoQ27fOfYG0znrm2rmWi7uc8W8S5TV+Z7zPeowXpgpWoA60qgmtiDuxW0swRnIejFOVvvc2WBl4mXQ6OcnrfVmsjmEB30FuiyBcgSvJG6JlsCzy0xhuQjRtiuVjlIP6/X9L5R7ylpyWi+vy3X+exBLT7VQUO2mDWyHBYqnc99RjQgwWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6szvOZ5spgH7ur8ONT+h0nbzp3e1wQ6yAIaDwLABRc=;
 b=f1IxK6DqhvwndvK0zYZdss5hWvFu212Tn26c08nq0/bmD9B7kekdKgpSQKMbQoGXcGWUB9QkO/UkUKULQraHUq96/aIrMukBCu6g8xL8od/ahDVrnoJZvKTFGUFalM6+HEFVHo205sz/EOr5Vl+oxoNdSxkB8p7PY3Ob5Qdg8iWL3iGIs7x6Jk4la35udu9F+W26EwfOc2hkJxsfuijSJmNZc0uQA5pf5nh9ezKa4VpqAijbBcNRb/u/mYPP4cTKfjiLSJ76xUbUShFKv/S4AxWb7VuThjxPnf1MnESIR5b6MppmwQmFrLueTT7XCRrPNM6LYWM22zvc8DzSpU9vhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB8047.eurprd04.prod.outlook.com (2603:10a6:102:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:09:27 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 02:09:54 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: dts: imx952-evk: Add audio sound cards
Date: Mon, 16 Mar 2026 10:14:35 +0800
Message-Id: <20260316021439.2971610-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0043.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 99051477-035f-469e-c193-08de83011cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|56012099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	HjEIo5hpczBTW0PGL9EcgqlzJxddhltBwPLiA3ML34gkYcSPtp6Z0h2jPMNl3dPBbeH8QwS9y044IPQmDZ3O4hALXS4nX1+9r9MfD89d5OCG3vRvpfNmLn1hh2mzeENZ2VF3d1GQwluPnn1iaDZgAk8e00vwOFKev/Gs47g5kxix9DQPtl2/+n8eCQTAGNq+Yng6nfnoK4Nxl+ITBNfAMn964a0jqgQICYui0bZcwkZVyZ18li1I1S6baarlijL/prAPrp4R22Z/fGpCqBzJB2qqtKswXBpVHqCRharvKmrohXA1bxqpxbgvOTcR3kw9/MY9mbqT5GZ1Bh3gs3o8ei5ffb7ZtEPCkNtk5SONNDCh8CT+8FKqWk7VbPhJWstrRQlRceEcpTZx1rHJa8TXQl0tYABwRv7SLMb5mDmVCfsA0UZB7bXQsJdjfGxkdeiCRK9ZbnDP7/RmJ7uBdmPkb+Z5Oi4AQQBzjyly1iP93vZhHTXWHOYtkz2iRu69RFkUTMnfvjMq6MMAiVZJ51BL6AgLqsVDthTDvS6D5i428xxZU9KtnMn8JH4eN+vtEBgScHZoq+tYGIFLw3WoT2V+IOZh3drSJORW5toshZjRaAHrm/srxphm3RAmbhQ/nFkn2NUZ7jnVzY1sjESYLr7FHtvy7aHLu+ARdy22y+rlYxqQxu6BB+YIuiylzH7IQX1IFlC/DIp4H+XbHPtsW3E4gDDtHUmJUpvQQu9hxKH7gihxIiwM5WHjzAWGcHvsykU6wD0Mx0iYYYRMQNQfCJJ0n0qxhHdJCC8/rmK4KVdva0OS8A7Zv3UDqgUXHeOXNVjZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(56012099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o+XeB86qXTvVSGm/KIoa387enDuHdotfrQe064vduyBuNATqcd9POUUGYpix?=
 =?us-ascii?Q?dwFZ26/tzyGXoS/VJ834SE81wh8u+LKI0HM2Eb3VCfMVSRH+F4CeluGEuER/?=
 =?us-ascii?Q?/NUMGh4xSW7ZteoU29U18l6P02CsYlznr3vd0EtONrHZSgwFik6fBpRuJ8lW?=
 =?us-ascii?Q?LPbQLueTk01Psiwz1jXJeABNwCbIuy+qMd5+Kw9FO+afPAUnzP9oM0lH+hO9?=
 =?us-ascii?Q?z/LgaQrPESM02Lqo9K9YwlZKBIP7qMhLrKLetw9z7R4kDuX964cHyYPnEx/f?=
 =?us-ascii?Q?U84dr8LM72IJpK8djoEZfxqCCZy9shQT5LtI3jNNl1Y+zYchcHUm2+rJY+Tm?=
 =?us-ascii?Q?x5zPG2/KOpTHTNnqD7+n1uvZpWsJGsXgZWWJnDrirz1vj8NJuKwDg+YAM8RY?=
 =?us-ascii?Q?ZXmH6imRQtB9VJChH3iEPiltOnDa1UETno19UuP77z1rInTWbHMSAd6lARQF?=
 =?us-ascii?Q?V2lEFed8+e2+xd0VKLOiwV443NTYzdaPEYHLR4SAQNOKBnhIy1P7HBwTY4r4?=
 =?us-ascii?Q?fAiGwz7U2zHR++GebnWIlo/53jegNomHuwKqUL3zmI+DVGrQkTSc/A1SBE48?=
 =?us-ascii?Q?oAp6Hqy7tSFio+NypdBKFY2u8N4TCJQ45vbR6O4bK87FEznYbr66FR43c4FZ?=
 =?us-ascii?Q?KILajpMpobR4by793xN63TXQKiLMFaliInG2zGk32eVnzGmH9xhdIm8MQ4sk?=
 =?us-ascii?Q?diGpZ4No3zNjDLVkL0XqhkgevRtEY9jq4+/Bt3vRSenPhQT5NcRh2/bXw8ZI?=
 =?us-ascii?Q?geHqV/5Xt1jNw2Wk1ozEPFEX3nZMM/ELj0uNryPi29IGKTnBj4cLCoLct7dg?=
 =?us-ascii?Q?nuignB13FTqoQke4GuLkVV7nGlrQne8jhknk2Y0eJoquczjh9dNbLzzP/CFW?=
 =?us-ascii?Q?sKJnT70WzoLE2Lfkvn4FWa8BwkGftpkMv5MbkitaPouARpNHdDKjIflX0ufN?=
 =?us-ascii?Q?xh9eKos/8IK1XeT7QHvpg+J3t9zpFfkdmkm0riqRbb6ih549uHu3pRYLg5JS?=
 =?us-ascii?Q?I1SBzQbPwJwzuwX5ZunyZaPng+hkHxOrITP1MaXmJIby4V54UbhvQHhXapSs?=
 =?us-ascii?Q?piu/qIIw9LdXadFEDHCOTTshYrIoeoZ6Jfe/ztqWkvl+6b/Kvx797CkqtIAt?=
 =?us-ascii?Q?ZMcuB5gET/vTPYy7eeFTlGcUIMuGLjWuUL/yxbSSzEAuNfeqteFtzBXp9iLp?=
 =?us-ascii?Q?2cW4m7DWn8kaeeY1GQlQZQZAfliqkfyaeFpIK1Ii7u7UvQTUn4qAbUsDs3hv?=
 =?us-ascii?Q?+TO/618e5rrGAKCehceiS2t6sfqSg1HvMSaZKlG+m/eIZ3V6RikHDldQvUbr?=
 =?us-ascii?Q?A7G90Rmv1KQPIOKS+RTZpEV/GAnOgZHb+lok0lxvHzFzmwTsC1e07BPaRCIe?=
 =?us-ascii?Q?7eHrr3jkdi0c1OHg9LZmEUEuwkYHWea0bUwXEe5AbwgTNTqdSLHhaLtQ6W9s?=
 =?us-ascii?Q?x2qAHa2vYmt/Ol4+3k3bjvpGbh+mtwaswwLBlc+FwLo6pxXqrL+4M946KccZ?=
 =?us-ascii?Q?knCrWRY0DaLGh2rdM4N/7jobZD4EvMWj32rrwKPD7q98ef8sgNtY++4aJxSE?=
 =?us-ascii?Q?H4vbLGhA9XbjQrePFce8I0+Avv5mt85tJz2zZBo7gNXfbNyF0NLeFD9QYb63?=
 =?us-ascii?Q?qF6pGwd7Odc3ricV2XcqQvJ07PvSM6puK7l2ISrUschvqQB4IlC+AgybuNjq?=
 =?us-ascii?Q?2ztMuXby3sr0WRf9cj5z631Oq9RPVZNJu38U9RZ0q6mN1/t32HJlRGmBsEpq?=
 =?us-ascii?Q?yiG60o018w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99051477-035f-469e-c193-08de83011cbe
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:09:53.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ABvFy5CHTKNAkoH3kN0wgYKsBkxvFMGheMx4wVeyVKyeuP1n9C9Ur57rnxEl6TMAkRkf9SOSYsZF6KmfzyLyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8047

Add audio device nodes and sound card (wm8962, PDM microphone, bt-sco).

Changes in v2:
- use macro FSL_EDMA_RX for audio nodes in patch 1/4
- update commit message to add ASRC2 info in patch 2/4
- add acked by Daniel in patch 2/4, 3/4, 4/4

Shengjiu Wang (4):
  arm64: dts: imx952: Add audio device nodes
  arm64: dts: imx952-evk: Add sound-wm8962 support
  arm64: dts: imx952-evk: Add bt-sco sound card support
  arm64: dts: imx952-evk: Add PDM microphone sound card support

 arch/arm64/boot/dts/freescale/imx952-evk.dts | 232 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx952.dtsi    | 203 ++++++++++++++++
 2 files changed, 435 insertions(+)

-- 
2.34.1

