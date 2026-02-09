Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58845280CF6
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 05:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770616629; cv=fail; b=nsAcrr9yeg/2wxaYhSdPD6cDF+WW7gnPKDK3y7QrFY7oJfnjI5j00OY+8yhJILw9ZMkfc1tvV2D7BD+xGWhgiScJIMqjsJCe8N76wGmRxyJKZ4Q7H8cOY+ArIC2nLIZGV6bvW/Uq8kaLgKAycVTs0MRmUsMLhwVA7NhYDNhzeUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770616629; c=relaxed/simple;
	bh=li+fRkJYjV739r2vS5YMNncV5X/UCb8zjC1eRarJeEY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=M20KGljs+HAH3ZTd86k9UAiUMMd0PDMQQ1ULNdkIanti+s7/gSGgnTLr+CdfL59eOrpsh5fQZiioL4Wi1pyAYFuzftBAaytmE1lLD1nOrvmFrROt7bTvIDBP9tJtbzK6lVQ8L9/un+liLaxzZhpSECtmvsEmqXpan5K4znizpGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dq1N1iE+; arc=fail smtp.client-ip=52.101.65.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dq1N1iE+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHBWR2G0O10lNqbW+pPP+HL99Tt+NUQVO9Np3E214lxM4ccP8MMczBHLL9bO8pdSGFMn4tgWyuK8kv4yHJ38qt0vZuRvCp+3z1XmKuwov1RXFBio45pUbGmuxdMJKaJxypnyRWDyw61x0elfEALu9qyRPDpo2e08Psvp/1NOtGsE3q8ByiNN/vJu/m+ooLBONilhWhWP50pp3u5tfzvqF0saJBloh/ED6upWbiNG4/FiFdqnvdQkwZG6PS8dz7h8uDK27GFgV5ye/K8OlNHah1yDfIQ69mYqA2aeDgMm/f/4JgSPjfckGMK4fdxVfU86HAFaI+dZM60swqGUDII5CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pyls2Nmwb/J0WYwbXj1s7cQwq0Xi6g64HtdrKYDKIzA=;
 b=LjrsRxaXuR40Pxmqk3foqxL1II+QrZRyarQNtXxM8ARfPngGLvWdRj1KhHdQYd4RPnsAnJGyB5sJp9/aTo99XeDEroyLbBg6Luhxk7Oc5tFB+peoeFpU4xrxdHF6tez7M9+FPRafFIBLKcU3QgSq29z0fp7sK7uHd83kScEi75nv052C9KlXzU2kM88/f7Wufv+Nnb3Re2rq8r6I9NpJ5M1tFVtHPvZMvDtQsJjzneiN6DETy79bX7zb/FwljZIe4Wz6l/92vMYLenQN1gSyLOo/Hx5YAYDp6CROPAhDifLkWXEtrIfnRBh3NN9nrZ1m5YNBhCsGZyHQeYQHe2jtcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pyls2Nmwb/J0WYwbXj1s7cQwq0Xi6g64HtdrKYDKIzA=;
 b=dq1N1iE+mqFiUGLbyPg1KTzerCshHze0P6VT14YdvHKHcRSVSeIbVoRs3SP0ziFUwlRO4QfdDrvlJ6IpIkkLonXSGSct9n9HUHS6BOjA0ACx7Q/fzH2USczAVpgRn5ozpv8zWyg70H04+vT/UmAT+BCguHGTavnGIJega5XKbRwl48zwleBqE9XFC8KzmxMmb+Aq5rNDHcOZ8F3Y8SQSrrNOff4MdnDGfs7QQADq3EwkRFjQTp0v1tNiUOsd4cOPVfFsYmT4nytxv6JDZowwXj9TpFuKR+iw6BeFRL4afnNxM1htDMgqNcvTRn7lAkEvfnu5eb//e30WsOmwe5/Ggg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AS8PR04MB8994.eurprd04.prod.outlook.com (2603:10a6:20b:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 05:57:06 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 05:57:06 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	sherry.sun@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add i.MX943 PCIe supports
Date: Mon,  9 Feb 2026 13:57:42 +0800
Message-Id: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AS8PR04MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: a377cd2b-c359-40b2-531c-08de67a00d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0lj2rj2o6wywSCLGEZlKW4Aveh4vSZtdfjogVMVWuMEZpmRoPrmH9m17jlml?=
 =?us-ascii?Q?VTrHc/KVXNMvzmMRpuWw9I+hfA7VDg0DEEkD3tZh3NWsQDpdsOcQyXVVWmBd?=
 =?us-ascii?Q?nAUIfuR/CMo5vgB9pfKX75gSYeDdGRbQry561A8cTydZVmQWv8UrUsJFk2j0?=
 =?us-ascii?Q?Ibv+E02DAj+tLznYL4Idk1c2sYy67oXS968DRJQL6Qcn/weuqL62AePr+mrB?=
 =?us-ascii?Q?fxo1og85IXL5CCUnMtVZBWZnjt6QAJStsMfEe4C0EiVnNnUkKc6WnTYe4XF+?=
 =?us-ascii?Q?1nxQC98N9Xhg/KxI1XvkgmiYIlMA4mB87/D+/5ZC5w3HjqmpGeq4LsS0/o/5?=
 =?us-ascii?Q?B03RT0Qvl/OPfLqdnoHmgY16qVyfOAP22NnPhERrDX60fdbuf72D8EnkOpBu?=
 =?us-ascii?Q?HioT16IN8wfWMNpt85vGM+TFE8iP3alUOVuvmlASC4lgMHUrLNubJkcAVB53?=
 =?us-ascii?Q?1ZLhszLn20nqG9UlOO+Hz8LLORivY1/ES4mDZiRRSan0X0MjS0nRmY306UT4?=
 =?us-ascii?Q?EIzGsjCChgko/z+NG5feGb3kJtNqCa+cQwwO44Frye8oo2C7yBq69kjv5jCV?=
 =?us-ascii?Q?lsm7JiMuEYQ1EWaehK6unDZmFAvqEREwJoO9wrqgDoRdLTrIYvx9MyElOqlO?=
 =?us-ascii?Q?4kepE7NhGFKBRQDLzSFnIy3ZAklYdFqyibN0b+jGbXn1b2Jf9qIjGwzx9elP?=
 =?us-ascii?Q?AghN5wu+LUGvs9s6WF2AF2ll/RwL1tPresGA6scX2BY6jzHtekDgwlp3pzmA?=
 =?us-ascii?Q?4X3cj0Ncqdr/Kp8k+0ERx2tM+ZZV/kDezPbYDcS9YNBjQCz9QjRcgblHTO9y?=
 =?us-ascii?Q?FrjZvTiynPbVoeVROqG8ZuwN031DkwcDOLRGHaIUg2jcl/fUHex78Pn+fUQR?=
 =?us-ascii?Q?En3NOhtQUeeK9U7deQSMCQXXQVuJCOQFNKxoPaU+RkbQ/Dp10DM0K53qaVtp?=
 =?us-ascii?Q?VawtTqHBgJfJntZ1TPUw9MPJWAfTzEOviw5vVZHCy/BuUVa0r4rjekcORcpO?=
 =?us-ascii?Q?hZa7JvOzOs2GP2VmzJjTaiSS6/n5kG1qgr44nLxy74NcXjTa3OFQmAjVmFWd?=
 =?us-ascii?Q?JEZ8IdTqwReyHcLtcE/tZzcn6i7O7l0NIyDmCLPjLRxOEdQemGLzqbNDWlll?=
 =?us-ascii?Q?3nLgF9emBK+lHEZWPLk0eCtxFAL7jklOQUeh0LHifLcl7etF9tsFq8JDyWU5?=
 =?us-ascii?Q?MGkWDZ5htdX02co4OP9Q23Pnkx9xZXKtdnVXZsm5PoJg4Xy1qcqrF5tmn8hm?=
 =?us-ascii?Q?lSJlpXUr3FqoXrCyGbrGLDALSrnxWGGXmABuxOfsfdzFr946tRrvc277qq8i?=
 =?us-ascii?Q?eqToQTP+XcRA0QXg6raILTJ5wcmA9DQXZXfAO7Qwjd0Pgzsey8kJmirGW4bo?=
 =?us-ascii?Q?ISRQcOEC4xu7a5NQ1+413pqoDJ+D7IqR8ZedsM75OIqXYYdFWjQCPDsmvpjt?=
 =?us-ascii?Q?TdI79Ig8CfVuzu2f/Ke8WWOzbrVcLj/99KSVJqAtNcnATDccaZ1rvXd2qfkR?=
 =?us-ascii?Q?uNjdQ1B5QjCbyWIH3ELgDTexUByhc1yJDln7NmeZ2ZFY1Dr7m6fJDQ2leiDi?=
 =?us-ascii?Q?NKRE3QbbXD4sgU3tw0vflKtP0UA6wIotpKU1TqClTH9faY6hZ0UPwa4VtuXs?=
 =?us-ascii?Q?RIYPD5VjA3tlB64OhqrPcPg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F0oMI1i8JVjRcK95zTCy0zn2EzzIiAXNqsxtGjI5sbrkZOJCxG+8As7kyDLZ?=
 =?us-ascii?Q?99Y7/O0X4gbig0C+jSgBexdtc4mbP9i4IKPDZhWFIzwHP33n9hRat07tHwS3?=
 =?us-ascii?Q?f+vHgLVUGIXZJYvYyR4rNhRtCvIMH/WpLMzSMfCpusPN5mUrrj/8DqVMbGO1?=
 =?us-ascii?Q?lFM7K1zhz08LNq6nnUgAasbIa/eYXtsdjrPpB01hJUS0WKezcnnX/JCqOyy+?=
 =?us-ascii?Q?U12oPtOQqlgDcrEFCvsLc8w6BQpQ8X+EQPcChrVTsbdLSt5Kdx3UXeTusGAn?=
 =?us-ascii?Q?kPe66ynE9Q0HvhRxWumFxHHmumfritPfaEG9aFYMxvhIfAsHw8y8nThey4no?=
 =?us-ascii?Q?QgJfkNA/X/MvGA4TtKMYyjqSemO9C0vuX55zEta4s5HzoEviCMrtarg/kinJ?=
 =?us-ascii?Q?asYLrK37XiR0yfQZ/E+sC6OOe8bDAmTXTbmKHIsFs/lRriSpAvR9taqvjKuZ?=
 =?us-ascii?Q?dTRY7XrlrPz9/qTqpDDSMeRplX4zyWu5ju7jFwCmzzXQzVhhmVhvjDd6euNi?=
 =?us-ascii?Q?W5lEhvqcSaIzGY+EU81DVNFYxZW4XB4BYDcsHXyfHdgvSSNicCW+2RhGr6Ha?=
 =?us-ascii?Q?n345oQ9sTXoAsdp1LXh+bQk9MC9Q+UPKsTBGwZJTo91KL6vkMzJrurCLEzD2?=
 =?us-ascii?Q?PF76gvDP3fTwE9qxYSXzMUaRFnmVZtVV6SSDTbAEiGNe12mPlFOJC6nxuTRu?=
 =?us-ascii?Q?jpd+X8M1OPB3Oea3ruKt10knDySV3CIpA6HRbij7ExB1O5h9Ix8sFUAEIiLx?=
 =?us-ascii?Q?5kHq2PSQ9PtLj59gCD8CEq1CS7MhH3XwEZVerUtPc/rtVjUyLZ+pGUPa4FsF?=
 =?us-ascii?Q?nU196NzhCxsVMCq2/7WmRDyUw1ID77n8LwsPHP24IBIjhyOdHpvE4Ud8hrM1?=
 =?us-ascii?Q?SlCOPca0eralUdHFK6E+ZH7nRiJtDVYgDwE/HVwk03tvAJ0xMvwzqW66Ez/F?=
 =?us-ascii?Q?mQgBP0exRuKkjZl5iWd7de3XwujdpUAEH02J1sHbfSenQoUTc6lA8rI5ahYv?=
 =?us-ascii?Q?qGX4+nJm81UNjQe6nLUom8iY4O68TS/L8hvhwVCLhbrzRQDwh7L4X9PVu+eW?=
 =?us-ascii?Q?RValovmoHivTWogyTw28eanpxXslrxhpkb0NEPG/KPE5G30KBmxw/coZAUsA?=
 =?us-ascii?Q?Wec/PwJRHB9B8uI1Pz640nh2mTKM7OHHpR1s65eOvqnWlIoJg+aMgMlVL7oV?=
 =?us-ascii?Q?Y/WR/5n0Ctom9fylN7QO3lVfAAqYF/PdEJoykrPgHGdCFtUjT+NFKDFl4Pdc?=
 =?us-ascii?Q?6vQfofJjIK4uAPzbYATcHW2Bo/pZFXiFjcrlfiWntz7q2032aETTV1kKi4Xc?=
 =?us-ascii?Q?7yqLmVsX/iSS0fMoTZsjAOPsh+OQIqsxTI16WG3crzagAGKzfHPGYX1w3ReI?=
 =?us-ascii?Q?dsioFx6nDo3PME6MVb/TuPc1jbDh8O0Kp/Zmnfbok0KOnimXrrDtOzBJUG4I?=
 =?us-ascii?Q?Z4l291akEo3CHJ2QsDcuBgwIv5iHM/juSq/ebokr6OWvjcN2a4e4u5sn4Ent?=
 =?us-ascii?Q?m+/eAW5nPqwgcXlY2t6SwGSrZL0O75hGovFws2o2q2hGhbK8QOPGeV8T1NcC?=
 =?us-ascii?Q?uAso+Ivwb19nWDyshnUehA1H1Z0lG279ILBBxhGiMRSVUskCD1wWNJA8kF3s?=
 =?us-ascii?Q?QT2GxLFYeGcidrSo7sVJCEaIalXB8JFSpQlf0AMnVM7FLTP1QqXdPP+7PsPt?=
 =?us-ascii?Q?pC42fLogRH2vMYNxI+9vvcM6Y2GMUg2WhmJCcXRqfG2b20b+MglP3Gl/SGCZ?=
 =?us-ascii?Q?oUXTAbtbdg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a377cd2b-c359-40b2-531c-08de67a00d54
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 05:57:06.7348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GILIR18cYPiIVxn7Cp3XNw2zxTVrqL17mCf/anahtdiOUg0bIUWkp50Pv2sqA5Rdqtga5g/VWHuFH+9JofyqXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8994

This patch-set adds i.MX943 PCIe supports on EVK board. Please pay
attention to that it relies on the patch-set[1], and the PCIe1 port on
the EVK board relies on the {2].

Both of them are queuing up to be included in the coming 6.20 kernel.
[1] https://lore.kernel.org/imx/176649331066.523506.9443864112044699350.b4-ty@kernel.org/
[2] https://lore.kernel.org/imx/inzg46tc2fwsajxq4vzdyuiq7krzy6xtcg2mjaieninz7zsmgm@mtdjr4tuegpq/

Changes in v2:
- Refine the nodes sequence refer to Frank's comments.
- Rely on [3], and remove the duplacated codes mentioned by Sherry.
[3] https://patchwork.kernel.org/project/imx/patch/20260204022306.2372889-1-sherry.sun@nxp.com/

[PATCH v2 1/3] arm64: dts: imx94: add pcie0 and pcie0-ep supports
[PATCH v2 2/3] arm64: dts: imx943: add pcie1 and pcie1-ep supports
[PATCH v2 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1]

arch/arm64/boot/dts/freescale/imx94.dtsi     | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
arch/arm64/boot/dts/freescale/imx943-evk.dts | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
arch/arm64/boot/dts/freescale/imx943.dtsi    | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
3 files changed, 247 insertions(+)

