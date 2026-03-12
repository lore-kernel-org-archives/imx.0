Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D0522B8C5
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 03:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773287272; cv=fail; b=qWbw20shnC7GL3YxxHaJp3fEgI2UcqWs/B1MEmw+6QsA9Ephonq2UFqmRNLewrcP6GXxbg4FpBlX9T2u9aBl3syPEsgW11HyyBmts/H4eUWiZHGMDSNsdkzjE5xYwo/UlqN0kYurzkpe5jyW9UcisE7J9+Bg8GdHQLH8oDK2HfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773287272; c=relaxed/simple;
	bh=qiM40lM2z/ZbfMHZSeBpAIdhCN8RA35eHXynSTjnAlo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jsdpqu/OkFWEuaOjoFjVU0NJ+r39v7vEKZ4r+4IDQYuEEBCFWhw6U4oUQwKor0JOllLsErVuSg1HYvgKUs+n7YrfBzZgYwBxP/0SvNaZyxmtld5yZI6nX4Ak/4t8saM+PZM4vk/WQxSsbbdAm1TYKVIvSQTEKOnek+wrv5hrfQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I4uDZjN5; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I4uDZjN5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZPi9nEg1bplisj3CGT86DPdMLqy3eon0dpk/VnVXo3zadtR8IjXhNYbfTXhcF+PgTnogxt1lB0APcAWCnGsn+YZoK0KqyuEHeDrNuSRN3YTkZtwrc37Gscd35tk8s6I3SSQwJkvArdoADR9QjAFaKthNR5mbO1Tr/tFo+Hb4GYg4Yso4kKU2UaUWwStvrfdvHXXvM4LXp9WkU7iwOJMFMaq9Lpq6iSWOEQ8mInKmzoDnSLIj5hn2h8j3Vw0p5uMQ/tgdIACwIxr141v/Ly7g4YlRo8aWBFVEx50AOIEy9vsTbob+1ShXQ9J/CCrwAsDG/82nf41zR+uB37EPKHUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mE9m/pqtPfMEZ2uiwpzmmfYx5lYDaK+7jETh7S8l79Q=;
 b=wqJMg9Gp+094cW7oa5dekXyp755hjeJ7RoZQ2YX3ZrcE0P1gULXzwlwvYHF4XLcaNqk8ZnEmWSVrxjeYn1ewuky3QIqRpgtZmLtADYHk51Z4Cs14B8n00Q3UAwxs0OHjZv1uQpkJCKK5iNlfDRfN3QRuzlxHvNryo1wm5IO2DqnanAUOorPTA5TI4IH4jgJyCu60R9tXnfnKnR1VrgMZlpx/pczYyLvMoa9b55DRZnQyC6v4Q7UgFiHX6d2i9t+nIeND7rciGbqMYkejSvUI/ftFOXRAmHVvNo8lvV0JW8+663G0Ib0gXKIa8PkeTWDlxtiauG1gbN/LKoyIOypT+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mE9m/pqtPfMEZ2uiwpzmmfYx5lYDaK+7jETh7S8l79Q=;
 b=I4uDZjN5YXmhTEnbnTpJNO7kxASzrrb7er8UuK/U86DSYLvrSOBvdVLNu91ZO+C487d2lUuGdQ/ObQdFLf2uUQo8jLQaJ7ynWv/ku7GDiTJimsk6M2fB45IK8bFLfMx0ZoFXouPIMHnw0fT/SBQHoiS5TZE/mz5blk7L1cJULtzkYoMOKU1PuI7sd9V1gU6uad3X6s1YP1kljlOXiPVb0GQxkyAQcaECgZlewuMO1JZv56TQDIAhRKWnQyJfb39F49jOGrAdEGT7dxpmWZGUqfzwJwMft1GF83XNmVC/tB3dUpFOklVdBrcLqruim6CAgsJ/U1VLmLfOPxyDYzNLag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM9PR04MB7636.eurprd04.prod.outlook.com (2603:10a6:20b:281::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 03:47:43 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 03:47:45 +0000
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
Subject: [PATCH 0/4] arm64: dts: imx952-evk: Add audio sound cards
Date: Thu, 12 Mar 2026 11:49:08 +0800
Message-Id: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM9PR04MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: e300613c-c73d-4ae4-5539-08de7fea1eea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	EY2YHYUdlJ5WJcyu5Q8Cf2NOwNXqzHOC422kjG0XKmkVg3uhI58vgdnGR8EcXdmVjAfp/qvwsGtGmDQnvpvIq0+wkDBcNZx2NToeBSF9/gL1064AAWUkriqusd4jBXcB/6ungGbzUiMx8xJ2gj+Lbvn6Wi6JuxoD2UpxIxPVRpWBSgc+XdYinqirlvQIxqwOjbsuiPp8kMEWPoRqXtUdSo5EulN3Q7CU2hL95xltX3xjFgrkj6yx0mSYby4DGx0iiz/sX2rqjyAFWwLzsDd8Zc+APqRxQbMu4k9UOAKj/kAq8HsTSvw9Yu2PHqBOE9xjWPZIK/CF7HPdYfGkcTZMCIAns2qxSK2E9TYtRn9JRME7UVKUQVyGWzXWsK2wuHZit0rg2c1oQmPoXENqL3T6zsNdGzaNvBxQODtkBxWdu6CIw/U49ZC4V1RZAtlbCHXEAxF3X6+HDhCxV+LBKEihJra90ORt5Fgrmi5ae3mw6DMzZppZkL1zYvznQaedEC6TKBfKFguILeQB50csC19QpFbdCgQpwCAwZcU0Juyg1bpyDh91kKtoJSZHVORfFPLclH7TQF5TCg8dYevCzAvU+m6mcBR/p8y35sPavhp5V1H8T3cQWZqsMwoP9zIYJZLswKxsU5JbA7GbxQwDgsJc0UpiRSRC0v5kX2Gz5lLKO63raVL6ZJzuIy18CMMDS8zUwa31Ku99osLpaXu2RU6Dla9EPt9RKIg0HZY06v9neNU/WQ9IB1iH6gKbmNHomqp1gzuHL71FjTGmxT+hf+JsI0eu0uovvjlSlmlrVYWNYpFrYlwoOFUrshLpUq8pW3qD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fe7tEWRXkdGyL3SE5XDZUiSbRoQ7X5xoDCTSWFjm7R2KTkx3T08TJOyMQieC?=
 =?us-ascii?Q?nRGOh2/3QRIsM/vdd1r1XJLb0TjOdzbkIhMFlW8JAvP6c6KtxQvJZKA45hZB?=
 =?us-ascii?Q?eOfiE7WR514Hq1c/ibskzI8/eevbLixtcUnFenISiBYawjiG7g1xTq7pCJH1?=
 =?us-ascii?Q?xZ1x8O1XcwVLnNpjDFM+dxj3BnRPpygPOtOkoWKXyLaowdJMRWTZ4IEAhZKg?=
 =?us-ascii?Q?E+ioueoDBkayyaJCi8YXzquxphWJ0TKJDUDyPq7NN4mQU08WpBpCPLqOIwTr?=
 =?us-ascii?Q?e9LIJ80rzXkkTjx1Umhkxmpl6hid7AUaPJ0rvMLUHbb/iB6/zQCAmpG1UWY9?=
 =?us-ascii?Q?69JDveCetGgO0qO2g6AgDlL/DsRpvJpkvUqz3/oJgfdb7HbiGTIFQYUi9Wfn?=
 =?us-ascii?Q?hdxG5USkOYWMdMYcjsaXPBTTURP6mDfPbjm7wkbgd9P/Fmhd8Q8olLrXW9d5?=
 =?us-ascii?Q?Q/sZh8uIu98YHM6kZQDCVWkpxg9azfs/KbGxSpb23mpHjoswarC64id+UtTF?=
 =?us-ascii?Q?0we2VsyLUdQi+R6p+IisOeJXfWde0cNylmeR+mZGjfs/FWDQjmMShfp78VHD?=
 =?us-ascii?Q?TU07OApn5jRoG4+9FnTn1bWy7BKd+lFvG36wn/4bzoNE+Jsb/Y05ex95yVEA?=
 =?us-ascii?Q?QX9qMWBXZKe1QEDr6yFeSGTUy2jc8CD2XBf5a4pSACvJuLmcAKma+/psbFXS?=
 =?us-ascii?Q?271edqEt0ZmyQmihCaOpOgem6jRvXuXpH90kKAzI/lwTNqBBvBirdtnFgiHz?=
 =?us-ascii?Q?Dmn36JcIHGtlgg9X0U6Wqh0YO5yF2WP+2nOF7+555AIrN+BrPXlFqvVhI/KR?=
 =?us-ascii?Q?AcfCkHhHwQvTkeNZTTk7BG4ydtNzr08A7VsWG3/8Ws1ZzIr9trJqEmetUWVH?=
 =?us-ascii?Q?rr+76FTCH4JDpAY3R6OO7wI27Xg5Dimtw7RImKQ/twZtl7J8zIQoy4ayH5N7?=
 =?us-ascii?Q?m4dyWuLXRBrqIXTZF2UgUBIm69/D+sm9dnjzLbMAiefv33FA0mowHoxVF8PT?=
 =?us-ascii?Q?oP/h6bpjXg3KphG6ep+VMq0Tb9P5XtehagBi3HaK/DdmR/4IDfdDZF+wO7me?=
 =?us-ascii?Q?cc8+R1myLu+rH7H/Llzlu+7ygJ20EHKz8s5OS1cZk0Zc3cTE9LmKVv1/3+tP?=
 =?us-ascii?Q?fcKrW24aF9IFzwYSEgHA5mOwuEA829snLGqFoTMczdNb7ir6hLnnAw/mIFG6?=
 =?us-ascii?Q?xPzljpzCPvZX2dfeI9b5jC/eW2AhGHj/bGylJzT9NPaqnfunUMCUsvgvcpr7?=
 =?us-ascii?Q?FzAGiqphZZLbLjIUWTBTJ+jwhCSn6ezOhzJw/X919wbWJKrFN7Egb9i1k6yK?=
 =?us-ascii?Q?FS80DNJEx4hSen+kxbiFJcHLJ3sjFTPuLJeZhRforCS3LS/RLQQSW7NeCZpn?=
 =?us-ascii?Q?BSc6MX3AY0flVzY4L6BO7lYKrfvdtc5oSMgrJh3w3Otes2DYT+U5eKpY4L1J?=
 =?us-ascii?Q?ldXkeXIZ2aEHhdN3d5yhDsdkOlhIK8XwEy2LtDyQmRLjYTgVDmVwrJO0ePSd?=
 =?us-ascii?Q?LB7MqHtR0sfeJcd68LXeqPGMJ99ZXVRjS/N6rS+mJSD2+q0sSCIKrGiPSBTn?=
 =?us-ascii?Q?PL3QQts4Oi2vIfwRNAFSrSfJ4ysXqhhsnvXbsH+q9EDs3ydE/fqvdnp0zslt?=
 =?us-ascii?Q?MFufXswWzkAdE2dISgcHo6yhtnspK8i7tstGPNYzhKCQHB4p9cDBo0wvzjp6?=
 =?us-ascii?Q?5rO3opFDBUBPQQVbpOuWEochpdJ8CWjb20IidvTNjvQrA0vYpXW/shUMPgT8?=
 =?us-ascii?Q?mjzYKuzuIw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e300613c-c73d-4ae4-5539-08de7fea1eea
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:47:45.4075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBCVk03jng5PNkhpxgo8M7ZjvOZUGxM/DDIqsyeYJl5IFvVwvMTtVaamC2C48ijZMJU4sm16dIDk1HBHvhmDJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7636

Add audio device nodes and sound card (wm8962, PDM microphone, bt-sco).

Shengjiu Wang (4):
  arm64: dts: imx952: Add audio device nodes
  arm64: dts: imx952-evk: Add sound-wm8962 support
  arm64: dts: imx952-evk: Add bt-sco sound card support
  arm64: dts: imx952-evk: Add PDM microphone sound card support

 arch/arm64/boot/dts/freescale/imx952-evk.dts | 232 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx952.dtsi    | 199 ++++++++++++++++
 2 files changed, 431 insertions(+)

-- 
2.34.1

