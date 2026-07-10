Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C4021CC5C
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 02:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651336; cv=fail; b=dIZiv9dAMQxBuIIOhFyQFGf5RBDKsuj2MYsQ1KjwSq6dz+McBfGQZZcLRqPdGKWAKWXA1b4NuotcoUoPg40t/ptzRLd5XiBOY0LLty9WGJ8triK9BZfZMQwVJZDBn84NZUkakJfGULqzdPcYTFfH7kn2NI7oACp8Z3R9tB8sWNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651336; c=relaxed/simple;
	bh=ln0evllEreK/cpiNxI2AyBp5lmU6/dsceyexX7HWbxY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SUdhBwf91mgd4056m8uDhNyThz+pXx3FfrX0YkhEBYnpnvQuXotXFyLGkQh/Bv+1lufatJNxja8699KK/RW1mPSd2on6oayQz2zQGcXGk6vcpSAQG3WSuANWUsdMQPb15hs+iWOm8VHSAiHjAbaEIZpWdN3txXeI/4mA7g8ZUoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mRM33/tj; arc=fail smtp.client-ip=52.101.65.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mRM33/tj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrYFdCkTa7yvPoWMgJMA4DrxPnm/7jUifcM5nk/XrN87T/a7K9MJ0NLlQcc77EqaOx5mO3dAPdn7Z7lqpvHnJVqvGf43bZRXgorAlFwBVaGoAYQ7BZk3lJHNlSVa3qtjU9evr8dJhLJEQldqSsb48QXKBcJGvsm9Rb5gOkNQqHreCwTIZILUZLuEKnMDUNOf9y7wv7LdDeQhZ55UH74ajLOk4q5Q3LIkWQgUr3nnIRkAEVwPxbfyf7BGiohM6p07QypgZQu523UgZtJRHYs/jK+tTOswYHikcBZVK80t6AEpkuabZiW98kg9ltfCnqvanJ5IgtC4O7UEKwxPKPjwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPA3vW0lmbYrB+Brb+F7+btxcR6KPHVpXp0bTFGilaA=;
 b=Vg7tIzKwvCh+lNT9jGyM7UuK63trzJCSiOxEznx9enLwxi0aWWbHA8jG76sBRFl0wPHsrvto/D4lZmHK7OuNjwn4mUgq+i7Ve3MWd8WdRHUTFz0wno2S6V8UVm0iqWlEgA6R7tG6W6WMgaOJbFp7wtH3mKGwn/t6ESe5vBpXQwrWmwtJvd++zoy8IuTa7A0uiNVYFqD9xxQ+7YWKbXSDBOineP91tGCxjf73jpAW2PpdOwk4j8z2KX5N9Nveh2Tuv+0noYcLpIJOozGv54Y/50M5HidST1Iv5kf6mpqmRcQ4WWyVqzPlhXvIexnULkdySnI6TJeRIxdLskSp4oeSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPA3vW0lmbYrB+Brb+F7+btxcR6KPHVpXp0bTFGilaA=;
 b=mRM33/tjCkETPM/b7iKMV+MUU2fVErBK18VeyfugwqFgp0KGDO0h+Ck9iA/3c72EKosOzI+f54/YRBkUWh5u/0y2kwWwRi3n4Ogx0eepCYDtUmj5/FAmEVUhua8f09AYIzL18KqclSGB1U/yawgGzuVFVj77nhFPJyc36xInQQ7uWKhqRIcZzobdnFvUsSdwK653pZxEgI6psg8QXwuUK3RdDsprrpdOLZ2ZVOYf8leSgsgYSFbK/nHwJJiX6oLrv5wzeD4QStxLSS+JEFfYtzwGBjXFQVVe85BNdMwy6yh48pLfAYWzIL3xQPBTcCoDb9Ag1rzoXfAzo6SFuRQ0rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM8PR04MB7841.eurprd04.prod.outlook.com
 (2603:10a6:20b:244::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 02:42:12 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 02:42:11 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Add audio support on i.MX91 9x9 QSB
Date: Fri, 10 Jul 2026 11:42:01 +0900
Message-ID: <20260710024204.3462444-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0030.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM8PR04MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ccdf56-5aa3-463d-35d4-08dede2cd7d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|19092799006|3023799007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	d4QDxMpynJM+oh3fhajLn/gfdQuvJOM2QvYnWByMNqM31+vPfq958Vf8rEj5yS8CteZTNX9DDbHJhq/mQ10V5OhIuoRJVyWIaNvCCOnjX1AuBO4sOoH5+Xp99Ixm4DlUPxrGlOJInxHuJf6WtooHtjKUG0UzNY2r+9BZ/qub7ubzbLb0fpLg7Jy60gXx94sJf3HF0UV88b4cvUgU8Q7vyeUKi3tRyha5aMQI6cnJCcguLTS1smDA+WVjxqv/f70jB7L0UXtQQtRul4QHGA+m6yUuq2GTXM+pkehGqs7Tz42R+AUOROASH2CI65pT4jCVtVohP6Nxeh9vGGd6gmoS0KxOkiSdVfy4BQDwTnTEDaZYhdSW1Bzf/J3Nsgjfktb14MHAi6eyvCzLT5LMUjnDEleZ+fGffMFtE/dILkat4ExtKydEVfskoS0zrkaWtKWDgi3Kcaix8xrB2TnPqC1KPRZbY46upbhYstwmcq/lfSwGdDgT757f99U62tcG+/EwppU+QTabOQNxpGNvnXOgL87xhM1iRgYuuE4h3tpIijiawDUG39TISkP75sVe/Gaub8bpIlPZtmHCxrzbgFDL5kzMxNKp69xbufs9buCP8iyXjzbC7yykiemEgqdT0zXMCqAGhle+5+VGziBdWiNyib+ppk38ENFHaWHGDSLqUus=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(19092799006)(3023799007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NLb3i3SXSQDddf9DkyeTLKSjoPz57vGYqy2ksfyGxgmqX83quceC7E7EVPTb?=
 =?us-ascii?Q?R8mKkWrwY5h1sh5R/FpHMOEybZMD5B2m7rBPS0eP3WpFEKvsrvIJ1lFIaiCq?=
 =?us-ascii?Q?p66Tdp3FlhyZxWnjEoABCpMcnlfuft6LxPPr/LDHIAkXoJvn17Hy5CGlpX7x?=
 =?us-ascii?Q?YTXQHLTOJPJP0GZV7i3nvZ5S7yFwZoBlueHlFyez6WhrEcCopoTYNDPfI5lw?=
 =?us-ascii?Q?ABBej3G9+2CXXObCVt+ORL1Egb4WBmHXtv/l7H9n62B2Qg0PmKJcDumpWZvg?=
 =?us-ascii?Q?GMvfIJUXefMt0YMDXxqFy3v3bh3hpm3sK9LZyVi6pqPdeZLPfKVXvvsIS8HU?=
 =?us-ascii?Q?fOdDXWOrdPvNj8k/2mjQ9Snp19L3oYPdiYCb+QVi3EWTVWlJArZzvD7eruIN?=
 =?us-ascii?Q?p3H3tm+qPonGbGN75yJRm6RJeoeXpUVtMd+jnntSm6rcxa8o4k0a22hu0VsS?=
 =?us-ascii?Q?NjpcHErNZKOie2tcc1BIkrNiFS+EX1F6E+KDU6wUw8yLyP1GYbBz0JbQHbkF?=
 =?us-ascii?Q?WPJ5h8Wq/LUbG6ZmJIMU2PjpWaapSkJCbq70AobDMOFscqrOKTce65Y5JhIc?=
 =?us-ascii?Q?0fPDanwBAf5G1ixQrby1gtMqXIwmbEc2LZhuOMxKMe5w7798id1lVwA9rLxd?=
 =?us-ascii?Q?dgGMm/a0FtDul4gA1tcci+XCd8NY/Pc1hc+f+2QrpR3zV1Tzz9IuSdrI/4v5?=
 =?us-ascii?Q?8GfXRzPxLU+7boUAExNcK180BKqaAydxZPGL7qI8ZsYAfsBVY11Plzt1rihC?=
 =?us-ascii?Q?rGfkL47rPL7+87SXJAQs5U+cZhCPoEoZtaxkIoSwoJ1nGhB0lw0Dg8bQHKuE?=
 =?us-ascii?Q?+QrEYbyOlXNCJ0iuMEYbLxVwKOw7s8Wt8nnwzgQHnA0LhVRFt2NmEJxdggUo?=
 =?us-ascii?Q?svik063j+bc/kGs8MjzrnnS68vnyupPjQaLfTJ797cvMh4Rg3Fj3yxA/0ZGM?=
 =?us-ascii?Q?BgCyvsHEkE4dQ4KxOoNGbtDMIjDECyKXf0OBuzmR3PtuY4ews31uiMjs3nkK?=
 =?us-ascii?Q?nM2yVJmgb5XZcPIoVkyX6fge2MsZ9wjZn8C1ddtUWrrinA6ybqPGrausWFmL?=
 =?us-ascii?Q?PtxLEJpvycZ8GrycL9gPE/gNryimqm28eld4ItkL5lLKzOVprMIxfC/otq1x?=
 =?us-ascii?Q?zRKQjnp0QGy9E4JQs0+lFn9zVZmv+wH2uvnKUyWeDS5UfSPxfdHI9Eu0HKU/?=
 =?us-ascii?Q?+Tv26e05wLoMGTmDByt+L39TberMOWcQ2eRhy8yQWVx0y1/3HUgZuCvUoOPd?=
 =?us-ascii?Q?mylXOFeLmx2C1mLA42WLOtsdhg9/iwCb9O6pRno8dq1x7HGH7bCloC7/m5df?=
 =?us-ascii?Q?qURE/NnnvBFkRmXSb+OiSAtAi9UyO/uI7n53fZNNvIyWQ/0Z5gQ+CCtQU/As?=
 =?us-ascii?Q?riDUuSSnitotT4kSW/oDGVOzGtSZ+jiyUtcmjf5mLBw7aOEunay9qvNNN8RZ?=
 =?us-ascii?Q?nnEkmYrnrEqXGIDFzZL6i8zKQcJtvYB+9PrAOBc1Vb2UlksIxiY2dFoqsBus?=
 =?us-ascii?Q?Gy+Ap4GJk6xQMjJi+kcCSHstM7woykP2Q8We9r8JTZHk68c6zpRqkPzye7Vu?=
 =?us-ascii?Q?XHdeT3oPfWMCa2yQF8/M97OV3yf1+WM6QC2hsca1Zbg8o+mBGKLRSDG5DPNi?=
 =?us-ascii?Q?247KKbk8z/AAnh2hroeTLZWK0S+kHF7iIVzhrzFGAiALyp+smGyuK4sBmHQy?=
 =?us-ascii?Q?RX90JHIsaV2prT4rO1npuO8YDqEaJ/I/OijwcMz4f6xwQi4Hfd0IRaq9Qfh8?=
 =?us-ascii?Q?J1CV9tENRMmgNZcZ7Epxj5OGsE1tkYIs6tp/518+bDPo+KUIxwZN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ccdf56-5aa3-463d-35d4-08dede2cd7d5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 02:42:11.8043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSvk/v/ZZuOKwAe0rSbQtCMK+9wuCltynme3LUh9AVmMEUbrZXc/8dGOJio0cNmX6ktxtIlSa+rfqZZqC84z+QFO4ayWPhYtZivFGpI8nPRJPqwRdSTrUxwR+E82EOCB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841

From: Chancel Liu <chancel.liu@nxp.com>

The board routes audio related signals through on-board muxes controlled
by a GPIO expander. Add the mux states required by SAI1 playback and PDM
capture. Add support for WM8524 and PDM microphone sound cards in DT.

Changes in v2:
- Bindings have been applied, remove from this series
- Reorder pinctrl-gpiomux children alphabetically
- Move compatible to be the first property in the wm8524 codec node
- Move vendor property fsl,sai-mclk-direction-output after clock-names
  and before status in the sai1 node
Link to v1: https://lore.kernel.org/imx/20260707065725.312450-1-chancel.liu@oss.nxp.com/

Chancel Liu (3):
  arm64: dts: imx91-9x9-qsb: Add audio-related board muxes
  arm64: dts: imx91-9x9-qsb: Add WM8524 sound card support
  arm64: dts: imx91-9x9-qsb: Add PDM microphone sound card support

 .../boot/dts/freescale/imx91-9x9-qsb.dts      | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)

--
2.50.1

