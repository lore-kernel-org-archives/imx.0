Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A577216E18
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 06:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734589790; cv=fail; b=lp+7EX2si2iD8h9xgug0DRndc6F+Ua1lO3ccZFq67n5+JZfDOvrH6EGCOHO1DOoQzEX4JDVbSfcfuiwmDY58LZq2EZ4LurQEI4gHm4hsmIl6XkO1s+NL1NRel9o4d0X7953QlOv/+l5ot/Ljrz3JTAMkeCgGA4TlvBL7FOoUQps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734589790; c=relaxed/simple;
	bh=YK2cS1dcHpncbZ86CkljjAUjBDNBrzcYrSXNEVo0j8A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Tb47Nlt8MFIdbdjIUVs3N4S8KH7h/8TRlDqv3hasHzk8hum3le+QpKDgjDeQWh+NIlGMplgM1N3Z6/9r2O2iPv+CfO67UvGgUtPGqcmPp6rKkYT6vIh0JnvUy0DKwQvCBDB8YWCt2liBRW8mjvBXhU8G36eOeUA65Ib4HrkvFrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fJep/IrT; arc=fail smtp.client-ip=40.107.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fJep/IrT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSP3sWrdWvJDHpa2+3CLmE0b10rJM5B3UJ/YB4anX5NxkjJJR0d+i7/6CSUk0+SUjat+20xDgkvVVJSkgEiA0UTsV0g+mqTlqYr9E+xmEhXsEdzAosIgtwv8fjfxo51dHnLi8WwBpz4aqKbpXNQ+UfXJvyP0kvCSu7Tl8z1e23EkFw9DR5sep5kuNJzloXu2e3ITjNBzax9xgg5dMwow8WYfSjHlOff0uy4IONMUL8Rg3De3GO/cmN47uRuX2Qg1JLXlX3nH4s+YgGx+TPKbjQ64YzZ1XtII+jWGXwY6pASqkk+s6GO5KsNh1g22ntWW6oFPBovnxXl9Gx9oKGD7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ydObq0+Yw87SKNbHPSMwKP1bF1FLchpvf71syOg/Oc=;
 b=G2SPwqZpBUZZte+Wuk2LZV5tFxOskvjLZXcv3reWQXguwm0eKZINXLZuIgUpEcSWgi7gIx9jJLPjjV0KjcOCNcxNUz+xmdCZkj+0mfz3HW6ClZc7lTsWCkR4tsSPdDov0SIhJtYHxk6MABFqhTYBEx4UkCqPPuBGGD8xNMRvj2KN6jhg+6MOUvCzpwibJozj6dlHMcN2frwqeO3rJYLOLUQXsYEXNUpcevVD4yjBlXLS5YAWtE7vOnBkAjF4WXGDBv+1BRgWZf4HTXzC4q/9Q7EbVblkqCPeD50RdtpAyzFtMmy3YzR/NHYc5K1tZ49wP4B5wgxpQXnECcd/rDLPtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ydObq0+Yw87SKNbHPSMwKP1bF1FLchpvf71syOg/Oc=;
 b=fJep/IrTBhR+hCLjwE17PjFlJA+GV0M//4A1ePnKcco0wA/TqJfvvNv7kgsypxmKNX06GPcEebIZFwPGPwKCWgjLkNhraDb5WlZSX436gbzx3oRjUeTueWMFlkithGXEZ/0eGQ4HZ6jUJnyEi2mAC/q1ylZIYfJT1tEDGnM62H2reazgt1mA/5VdK/hUoESP0zuEdOhYozF9UN8kBT+AKaSNsN2+4mQKrZ+QwG/tN5CF9iVsnElphGQTw1mSFlmOxo07N3v5CtbIxL8hlU1efn/TMlGgDr/0WEGoeYLyBx/Xcd8v8lpvxYy7U/GhxU7yXVEBPwWBKjZVJyqNVXLp7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA4PR04MB7966.eurprd04.prod.outlook.com (2603:10a6:102:c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 06:29:44 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 06:29:44 +0000
From: Wei Fang <wei.fang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add NETC support for i.MX95
Date: Thu, 19 Dec 2024 14:13:38 +0800
Message-Id: <20241219061340.1633173-1-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0213.apcprd04.prod.outlook.com
 (2603:1096:4:187::11) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PA4PR04MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a3df20-628b-4d18-3922-08dd1ff686bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zmNAjhdon4fRBc+yk3kpFNuApKFrRidVX4I8lEhDe7w2I/BvVmsA8lk5T4he?=
 =?us-ascii?Q?qTSnnQqb202fezHUfTletpK36nULOHMUSUbRKZOKa7WRntLoWfK0dLt4h1+H?=
 =?us-ascii?Q?zpNG3WrPo7S0j2EQlBdjqMTBCiSFJA8bkOgjfcHUDtJ9Z3V3O6dmU4/Ade1C?=
 =?us-ascii?Q?B0k/IjkGVrRtIfpFSIkRumyf0+ObkXqu+Xy9s4fM4H83qZMm/6wMZD0lXa+o?=
 =?us-ascii?Q?DowOpq+onBTKYsKElWuWTgYCEUDBva2tkFuFmboPpGL90Y+LBK3G9An/rvdQ?=
 =?us-ascii?Q?WEAJzmUcYpzS4uICS7cgBTGdvIAuZy28fWl+K/sP38w//3Db5R9snCaBrIcd?=
 =?us-ascii?Q?ZSt9NsewNA1X8oQNmF0XQn7cbb5bX09qZFt5P0MyDeMmL8k+vYAlBAWXF199?=
 =?us-ascii?Q?FF5skFnmZOGIdLon1pLFCyEWG9KyYWzd67fb7LHwVzzEIrqDsTxPOM1Gk+Pm?=
 =?us-ascii?Q?9OctW7khDHEcrxbgHjCpYLdcCSaeOspxhNLQ9bGmYc0pIZR6XN9jBUvn8Sq0?=
 =?us-ascii?Q?fHH+IfWBIbD3Sh8zyB9UK1rkDHuSmKspMsCkLkhCaqk144X/lyPOQ24NccNR?=
 =?us-ascii?Q?TR3AN0Mhyldd5aFYts7IwSjmjgNz28yaIY0yMNm2lExse18+onMRzls/fQJw?=
 =?us-ascii?Q?MfTpF6IJqhOAPgK5/WTokPNAlXFRuRGREqXLmINzaj/6rDgrLP+qKs3VJrLF?=
 =?us-ascii?Q?A6hL/80xPzMdQtCLqmSbdIf75PoMnwlIK8kJz6Hz0R2t7Wrdrrcw+EX9MAVg?=
 =?us-ascii?Q?0Z0r0IaPfSZDYLfeMWXXk0V/dr072wpzwp6Oetx8Cc7eFVXeG99qjJ27OynB?=
 =?us-ascii?Q?LLmwArwJUCM3lqmfG1vx2kaWNGXcOR3rxQmuqBP0oBvYfpaGpx9Jd1s2xxpA?=
 =?us-ascii?Q?apJbrqUgkHSTB4aUxBMQDO8pB6oV2T4sldO7i26DnkCtPH86dSWIxCWv5AcB?=
 =?us-ascii?Q?RLf8AAR3u2Fi94FayG7wTv7EEyOTjEAwH3qdWVsPGmAyoai9YdTACW/pr3Rh?=
 =?us-ascii?Q?uF3zY4R2Hf2/7QKrKXizQ1e+6Md+J8IdHnEBlAH7bKeJkRgdUgnT06xb3j8m?=
 =?us-ascii?Q?y+XCQOmzD6SgB5bmc8yQD2DvmRs8SN+3JFHIFXvL8Ef9cJsECuPA5ETkJRZT?=
 =?us-ascii?Q?y7HSZ6/SadTSFbtfJEbCN57EJ4LP5swlHWrmhBeZ92/PbHdcLuPwlj2KDad3?=
 =?us-ascii?Q?csnLe1C9/O903XLQftqOTRBKiYkBCNt6YumnPFp4zqsePS/T4f+nXZZm0tmg?=
 =?us-ascii?Q?8edN2/DsETtIzRShwfizXjG1KL/aOwXg+UTafdwXsmtrdoqLlW6y8MNqFN7k?=
 =?us-ascii?Q?jYSNqgzqPWxCqTcuU6ggVdsk0xAHpqFgs4koZNIqgTkjZH0aYHUlieXHSEr2?=
 =?us-ascii?Q?HTo01V+ssvxWSTzcBfq1qsxFYTUgt0R0BX/V2wW/9ZI1nqmI2KOmNm87+0qb?=
 =?us-ascii?Q?VO+sBVCeaGNiaPnS/7KioLlw3rJKRR0g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YfAVURigZ1aU4xGVmxwzDOUrDu5X3L2M4wmeAmE0xFX8mUU4TwX2kqH6vFEU?=
 =?us-ascii?Q?MGGXAMhQiFTp9Ed35DauWuUBBARr5Nwl8bTKK68QCXQvOGvm8jYPnDxKRWuX?=
 =?us-ascii?Q?2DGoswDkkRPY8D2PD0Yws+5BmmgY/CteJnx7U35MYXPYRDqHEuk6D+Tpfs/2?=
 =?us-ascii?Q?YP/eG7BZUgqywSXt3GGRSk/Rq4qBZALS+X/09IXrDerjSU6MSRtQ72XrIzWr?=
 =?us-ascii?Q?odbr8d1M2tOEEUDQqXnMt71/CMWYgop3rD3bGu2KVogzy+3Id2NeLXRIAzw9?=
 =?us-ascii?Q?Ep4t+88rAeOpaUASGA8S/YachddXWaMFoiDE900BtPBqE7icDIEjNTIxWDcE?=
 =?us-ascii?Q?uFiM1siDYobBRjGFyA6yY+0gOhK0ehy6wbA//4ZNgWDTn32vYE8jrtK8Mqnn?=
 =?us-ascii?Q?f74J9xbpxfdkrSbkg8lFewkfCh+RRHe54Jm/X+SbNdNMhWN0xhjs91rmoKVR?=
 =?us-ascii?Q?No3baTR8+Dz3X1FKrTD+6+wK86QgFHS33qn4F4K/0yPZrgOqsVYQ9rW8UyJn?=
 =?us-ascii?Q?4CAncrllR+xcRlS2SiqIZUpzDMB784VRFQOElNprhhCv3CQaNdSEq+8Fzexo?=
 =?us-ascii?Q?VVk8aG/CjXcYdM/eKWmxx/GZxN56+lJZjXqyDk4EaPHHg7yiZzbB/sg5fHUF?=
 =?us-ascii?Q?7fFytzsXqXd13F/SkSMzOkLodWd58Z7Qu2swW5omZBOaeIYeJWHKEU9eitgx?=
 =?us-ascii?Q?tHlP04HD/fIg7rKEiMvgvUHOFFWuiZYn0qfh6xCojaTrzNR3DNJC94CLxx2G?=
 =?us-ascii?Q?74UE+NoZ5or/+CskuspcczAyKES1fMto2+3eZV0GIyuOLZAEVNJ/WxDCF0Kl?=
 =?us-ascii?Q?t+1KmevHeE3qC8HNbqoyXAWixAn/iyoKhEsJqR1S03wLysI+KIdVbzuvNpXW?=
 =?us-ascii?Q?OGLZT6aywtXlVArengW56s3AbybAVT7gm/vKFYoNzrc/NI7NBAAD65kIRSpW?=
 =?us-ascii?Q?kRhRQ15FIVjcEtenC8JN9rynnXid3eW88Mpuh6eRuq5HZnkJPvKk9Ce3yRk3?=
 =?us-ascii?Q?tbxu0qZ1y7sEMe/qoX7v3/6yM76FiyjGIJVHdmuxHY667awNPbDuJXBpbemB?=
 =?us-ascii?Q?GigjvoR2DcFrk7eGRdMJwByzLa+awoBmJ5LEUxP3524/ZSghLhZTUOuMp93Z?=
 =?us-ascii?Q?3hct8enpvHVFObe1vdcVdPpN5iL/t3r3F26GmpHiolOszfHjLawhlFwHsGFR?=
 =?us-ascii?Q?VDJBiJiy6LY42ZjHZyNM16QZrh+FF8At2Aok3tljsjjvv5/q1guYgthHOSNv?=
 =?us-ascii?Q?lBvbk0PfMfJcmLUsK/GbuZK08bwT6TQ0HOJxoVR2bIyUXIr9lheYXqHiJ1iE?=
 =?us-ascii?Q?C3kLW531t/h207FtDMdgpuByfEhetkyI6BmSmdcck618YF7a/ZR0Vtah8BqR?=
 =?us-ascii?Q?jS4LQzfCKR5NcJxeallcjRFCCZkGjtj+VApgbIZbKw3dltmw6p2f1L8+CoWK?=
 =?us-ascii?Q?d267gYWz11gF8PJ22mTYFBCa1X0Qe7CRHlykwvrC86Xxepw54Xrqh/Azxr2f?=
 =?us-ascii?Q?LIrOA0G8xVH0xGvztq5U2MX2nh5hzXtOr+XcG75cFtohBYtQN0Kfh7bpYwnW?=
 =?us-ascii?Q?nvWqCSdwUhynrJRKTzK180UcgB0AYt3KHJR7BMGT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a3df20-628b-4d18-3922-08dd1ff686bb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 06:29:44.2472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5dsyIZTriD+mBe9R5V5obVv+S3KNutPIUhEIf7zFiHTnFyc+x8rvlbe5WYtJWP/ITMZXvlwbbsSDggyOo9q5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7966

We have added support for i.MX95 NETC related drivers, so it's time to
add NETC related nodes in DTS and enable the use of ENETC 0.

---
v1 link: https://lore.kernel.org/imx/20241218061725.1608466-1-wei.fang@nxp.com/
v2 changes:
1. Adjust the order of the nodes
2. Change the subject of patch 2
---

Wei Fang (2):
  arm64: dts: imx95: add NETC related nodes
  arm64: dts: imx95-19x19-evk: add ENETC 0 support

 .../boot/dts/freescale/imx95-19x19-evk.dts    | 52 ++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 94 +++++++++++++++++++
 2 files changed, 146 insertions(+)

-- 
2.34.1

