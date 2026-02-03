Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC565392836
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770105676; cv=fail; b=TlCKxXyOoZxlldrKkmyfZmq8ItmU2KqqFoSiW9FNwLv9DiKmjhxSXfZzCOEpEWuSIqCuAeWjsTp7lHrVpmfL1lE8RMX2MSywaf/kzYbB+AnjYnJ1UftykQL8wL5X5wFtGUWNunme2jMWsyHHeKiZhCUv/JDFZuE0aHNNznlEa7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770105676; c=relaxed/simple;
	bh=utymB/GkG9Q5PFvBRP1AM4QCnaeoC3az+RD0s+JQYBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AvT73Mk+Lk1lP4kgiTqQeg6HV8Ib0jXuGWWHNe6LnP1mBfhtDrwN+MIKcNWWa8XC7473FsIKNajR/OJiDsbHswJybl2YuwGX2fOvgL6H6RP7+grFbR+pzlehxlEanJ0UZm0wG8AmBFytD0qbrV8JnPxqgamRc8mX44hSe9efCWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bFHJIWne; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bFHJIWne"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxRMB13HWnRhOxUl/cQ07VdCuf/c2ZDESKkVcsyv6G4b57QgDWfEqMkf0+A3KgN1tiYw7iV6z7Xc6QIgEx3NrDjWdIirFn/0A6UvZDTkqxgR8+z8kZxJ+FOEWcw1hyfhEsVi4iXNmoorqDac3qa8m1FXjrvskUxsrrRS6ngDd8Iyt6Fp8nOezAmMH+/HdbPlBs5T9vMImmh6gIX6CfXXC+dTZpFj41EsrtsqoKwgwiYKcXmwLsvNAhcddYvxGuH6jdOQOyMvXFJGmWhuz+ye8wjb8Cr6HLH7dyiarH0JZR1/aUIhNpDeh/R8cLDDsfjOxIqtjFIV9c8T/GwvMXOFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMsUf0QDF1zxnkvFm1hXdV5V4wynj2RjwJe5JE9Acwk=;
 b=hwdUf+yM+wIfYIBGXO0Qv//7y4xXK8ZZ+0Yka4NcHDc2f2YY3ytviOKNckOO+qb3gtbRbnvTVu9cLkTjwaWiZ4jUikYY5mWLjkDh1B6Q+4jFJIhQtmB4bznpMMIMOq4Zz2Pz5uD8KEb5Hv+SysrFNizDJLhcp8Jmzh7v5YW/1yvxpkY4l8FkrbHEoF2kk7fKr1NntMY9aO4sPNmxgYdtMDaevSOXs/iJbmmJHx1PRJZKabR+5HWOGs5ltut/M0LYSsCNIoGXeUVNiZKpzNC/TfJuXzu6QK6OKo3zW6zTiLFsav4+7MdCaa1DyU5LknE97BVUopr1moizDaWYwVuj7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMsUf0QDF1zxnkvFm1hXdV5V4wynj2RjwJe5JE9Acwk=;
 b=bFHJIWneBuwD9xE1+uSR1i9kmiFq1Rh6QFxu6ZIa51fvFvilALKhLeKT9OQ4sWALUPmwlBYD8Of/jWDzhvpBJWKwcC3bnTN8apZt9Bf4PWpcQQWx9q06k47E1buc0+w2T8yTMtgTKu5lnzKZxXwL5zRbMHp+KkYdomvtKltulOWEQSfg6zBKOqhRwREAclVEBQ1fxhXtK6D+qdJjIEA6VahiI7x3b3dl3iWRQGhwovDeKlU0mrZEsJQ/31g1yiZ/krTxn5KkYA6XJp2RQ0PIkPx/fQV2clRZlAl07Wo6r21H7x/bP2yLAhtFdlS9362RSYwk3LZFMUj+JCec5euG1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
 by VI1PR04MB6990.eurprd04.prod.outlook.com (2603:10a6:803:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 08:01:11 +0000
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944]) by GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:01:11 +0000
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
Subject: [PATCH V5 5/5] arm64: dts: imx93: Add i.MX93 Wireless EVK board support
Date: Tue,  3 Feb 2026 16:01:37 +0800
Message-Id: <20260203080137.1492376-6-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260203080137.1492376-1-sherry.sun@nxp.com>
References: <20260203080137.1492376-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12102:EE_|VI1PR04MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: a0716826-53a9-494f-266d-08de62fa651b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?b/JrsEBWYrO2OFAPswmXrgFVEf2b0S3gc0EXU7qO0y+fpJ3ArsQryYqXtZs0?=
 =?us-ascii?Q?jve0/34X3AOiQQb3hB0CtbMcHgPdpzOzBnRFYE8MpOoPSTSj6NU8c2Ehyy8m?=
 =?us-ascii?Q?abyzJbp96EmAivNfhXaZQostrjf2PuC+4nL13r0h6c44Cf3JkH8PDgGzpr+d?=
 =?us-ascii?Q?ruC/BtChXMHYzAeQI1UB93RJ0qHS08VbgcPgOU3ttdCXitUFckOPL3V5YPG5?=
 =?us-ascii?Q?WVvnwIzKbqaUeEjJkDV0cBcfO6/a4GGOgklrYqPaYKgjVLoEmMFsPr4ltTf8?=
 =?us-ascii?Q?ZqRHGXkFMrAvoS2H8W/sHRgSdpcxFSSxREBmD+SyAI6OTTxbrn1a1yMBtTjB?=
 =?us-ascii?Q?TROzD+8RfHMfZkQHsHCVAPvSsWhv/i5UI7BaWrbotTIbNJNyQZ07uizpT8Is?=
 =?us-ascii?Q?HP1Tdb2mW7LB+YtjGKG4tyJc6/FY4wGvg+OnD6sZLWroTweDIRbHP4S+zUyT?=
 =?us-ascii?Q?k9yyKTEq7a5eQV0L1Ug6aFj+UnpxP3Fiz+hWiKWY182X8kuqxiHFDSGO865d?=
 =?us-ascii?Q?Xtdkyxd+zPLPRntFprjZ30V2Kl1V4Q9g/pmpaR+myx9DcrKaR04eBLuCb0LM?=
 =?us-ascii?Q?L+gC2bmFmgJpFpf1kzOXK8XfuFUHg3+/VAve8eKfxxapXNyRn3U+ljtRdvNz?=
 =?us-ascii?Q?BZWNP/Zu3yirU1ReLTuVox0F+tuJZEyIZNThKqYZtr44WI8+/eAtax0VYJ/O?=
 =?us-ascii?Q?o+gy55yiNLf5HmF5PrzdEbWHwRfFx7g/NaoUl46KP4eATtWd2H+fSPe0NlnX?=
 =?us-ascii?Q?9139EZIGkcDRp7yVknY3+5f66NH0VV46zM1A+DROTJbn4TEUWZr6wxA0dmhf?=
 =?us-ascii?Q?GoqtogMRYAOXnqACfzZsK122F4U8Y6tBvgwcajUkAYdTm8++dx/SqNOLe39T?=
 =?us-ascii?Q?XSWmnxADQNXDNQKHKXMVPY8akOMWWF63rNkrYxy6KwvW4JgUXHR5kxD8o4Q4?=
 =?us-ascii?Q?sM6zW3PnTKW7yRBnPDC/Szmiy0GmpL/CKKIi1K1HCfta9MDlB4A8VNvv8qBH?=
 =?us-ascii?Q?Sn2miSxctjhFYlXA/ahXzxBrxuye7sw7Rl8xyVe+DnAjJxKMq3CfrjhToKTc?=
 =?us-ascii?Q?b8b4cUWokLleMNz/qBqmyKfVZy7BFDaCk+82IZivZ0eEwKS74Fuigo2GBPsi?=
 =?us-ascii?Q?G6n5nA0MTn2XOVbytLut+69kti/cdaXg+9vvN9wTj8BoDDH3PTrvF/4Uj9C1?=
 =?us-ascii?Q?9Z8yp/tRUD4h6fxImn+DgI19lKxGSeY0DXW0lU6K/SSxA/+EWpPY9ssJemUR?=
 =?us-ascii?Q?eD8XbrsyzxlBuoJevzlSHG3OHMzxLTIfyKj6FRxKtMlmfUSkDb/ZUTc5K//C?=
 =?us-ascii?Q?I42cD67pDbOWfhwc78/LaGIwRMR1UDcPvRE4g8fNDH7SWfZ4b7/Z9xd+dygi?=
 =?us-ascii?Q?vb+pGIPDY9y/gIUk08NsKJJV8pCn2EV1sOVhATQDKkL8RyxmQhqhKIMIyaZD?=
 =?us-ascii?Q?bG+NQendDYMDGW1YX7+QWaU5zRq+K3cB0i4zZaR4ACJljaZbYB2wnmGlottI?=
 =?us-ascii?Q?eNVsvqAAuOmv8ytbkl/mNIvUv+vq+ohdQ1EGPy29OFGMmkxi9ElyRomVDPus?=
 =?us-ascii?Q?WqBxU6UfjmGLIeOUxV9TYTPVoW434qXLc99hrKZfZPJdp8wrN5ero4syNsFE?=
 =?us-ascii?Q?pM5JvlhoOeZS9yT5Oy9fCpPhUNCgTZ2WIYNUc98J61QY?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?aSt+qpsHTXTpdNGUOWKn1k80yA0Bwx85mgEQDQutG+EskJmAz7wbu8gBUftY?=
 =?us-ascii?Q?/UHiM6Y0fndmHWM347g7t/V2+iD2QpbpDWtmwEf3KwOdEVkLW+UVLDG6NeLI?=
 =?us-ascii?Q?LFQjeZAxa3Iy9u1ucrkNCjnYkvZz9cAlt+NiDZmUmKD6L/yLwHIUsBzKAoQ2?=
 =?us-ascii?Q?LOr/MTIpEKX8lOXuieK9tJp+VbChXXOQJkL3sab9BKHEtKf5/G0dbuf9Yiyl?=
 =?us-ascii?Q?VH2sEO5Mg3vCbwGQzHsGKRJDzoHMeaCHl2BqT0ROpueu9WH2y93sRdQG8n5D?=
 =?us-ascii?Q?ycqZjS18pdxtd7p9lXj7yCFVu3U7t2o6bYGydednPMdf4jgSnpLiLYL5e1dq?=
 =?us-ascii?Q?UeYZgbqsZYWH5QZ+W8sNjNn70sbBRTF4EcJ5VdkHw6WlF+I/CUb74xZMO5sm?=
 =?us-ascii?Q?Jwm9mSlhG/okJnZlyyrf8EDQHE0CLflhA4GegAtCRbjjr+pC0fvWVdlGd1kX?=
 =?us-ascii?Q?BogJJz/YF1kcg4WDsI1xUeUD57EMt05LAJ8hTVS9Ku4ZMgOYUNbac1cx26fI?=
 =?us-ascii?Q?260dt+KvO1SyerSZqPCcRj9tt5Yp6miDxwEO4X5RatOrSReC3ygaM8AkbgQ/?=
 =?us-ascii?Q?JFWg7Dk3Nv3w+93Mae49t6gLgUJMb+PstlGhuuDv96QjDaw/PorPJPeW6nGo?=
 =?us-ascii?Q?J4z85yPzW6cVlIqdsJmFJfAyUvuJMu2dlWJsryQpl+raBbahpbr3ltJXW6pB?=
 =?us-ascii?Q?WS2QRzpbU96+Upnlcm/ZR7eBXckEeqLH+jzZFWCGw6fZPIZo8PZuNWwCqA1Z?=
 =?us-ascii?Q?VzB51ZX7Un9uisOHk/FtLM0Mvf/l7ZdSgPaJ6+bugdoV6d4VM6jGSo/URhkJ?=
 =?us-ascii?Q?DUzEaBcy4Oai7Q7310Ci+2xj0WYoDWaD0kzC4N7XpHoFKrGYT4OwCcfq49SL?=
 =?us-ascii?Q?KRiK28QAxC8cdHIZJmPDqmU0TG4rYc2IfuRoWKxhDTb0fbBLdfZvUm+3O/T6?=
 =?us-ascii?Q?PRy2LBafrRVSfQHEqmGxVtxlzra29F6PJTpZnDp14FohheLn13pICPhgasUR?=
 =?us-ascii?Q?nbD3idOG9BAvG9YrQmNIAlMZZx/hwUWmETe2OJSUprZojxkbBa9BzUIx28Bx?=
 =?us-ascii?Q?8QyhlRzFyS4iwQddBCVC0fnskCr3OJ5Ll8MN3d+kK8w0SJmf3y8Hat0/N5V2?=
 =?us-ascii?Q?VJ8oraSahN3GFu33/hwGVmroGgMvRfTi+GbwTPm7mNo1Sd9/bkZ8ToKA/M2C?=
 =?us-ascii?Q?IfkxGUAzjVq1n+HQucSenZk8J7vTkcfy7ySrdzh/v7SiDgcFy6Pc9MIsCwFx?=
 =?us-ascii?Q?CduJ9MVVgl5mkOI7ABY5Y+N11GXCtcrv6wsyfN9qZatIPCHDZ/Bt0YxnjJkj?=
 =?us-ascii?Q?54vBK6rGQ1L29WuZd8NiRVKOhRis9UmX7BcfDWD0MkeQAWQ9vvj9G5VvkEtd?=
 =?us-ascii?Q?gbo4bHp+o3vzANgLTDXHLG7wa3/XKfJn7QDicrxHc3To/Qfk/y3zEf2kKz/F?=
 =?us-ascii?Q?FwOxMt1VWtKkv3+BcDd8PuDJF/D7VCNtmpcipF+Cb9heDKhHx/VI4vlWhsAZ?=
 =?us-ascii?Q?J0NKmOeUiOPNE30e7zTF+NTOblFucQoJncuqii0u7bQgG0ImjMgrQAtIJCp5?=
 =?us-ascii?Q?r35xVXM0ZqgsWpOAQKt0yI0z5pY3rymEhQbsJHvey3a7i3QPuSuqmvC2Juxw?=
 =?us-ascii?Q?SBFjAM3cVl+vcOK5hutupMHtq0NjXiJUajnD8xBTbvR1XXc1MPLbRXLpLMEx?=
 =?us-ascii?Q?Zah/TYM9dMVcaY1BaID3Ti5fw8qc8XrIf5e0y9+6zvXJIXsXyL5jIb0mKk9z?=
 =?us-ascii?Q?wKFH1z8Jcg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0716826-53a9-494f-266d-08de62fa651b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:01:11.2681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3f5Ruln/o9o9zl8j1MTttxaTuo6DirIU2h6LbsLoJ5jAV/BTexQEKSXGZPlc8nreEUdYilKOQO2I/LkfB6XRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6990

i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
(Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
functional and pin connection differences. Reuse the new
imx93-evk-common.dtsi and add the board-specific changes here.

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
 arch/arm64/boot/dts/freescale/imx93w-evk.dts | 23 ++++++++++++++++++++
 2 files changed, 24 insertions(+)
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
index 000000000000..9832b82b6ce2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include "imx93w.dtsi"
+#include "imx93-evk-common.dtsi"
+
+/ {
+	model = "NXP i.MX93W EVK board";
+	compatible = "fsl,imx93-wireless-evk", "fsl,imx93";
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

