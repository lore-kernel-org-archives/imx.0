Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013035.outbound.protection.outlook.com [40.107.162.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371972EFDA6
	for <imx@lists.linux.dev>; Fri,  8 May 2026 15:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778255175; cv=fail; b=VGR+0jtgrJar8A0m/HxecFUs5Gpv6ilTv+/OiHtoamOrVNkR2SMx7Vv/vgRLCc74VezXiL8cmKqGLGqXVkl7Lgb4bQem4dBtblTCCQgkEy0n1MM+3sX88AmYj3acq47WCAiGhXoKM6vgo2z9UEJiWUL0wkcHuoXB23/whNA4ohE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778255175; c=relaxed/simple;
	bh=4Vi9WO9OYlDTNZv0FNV+4yA3yU3GnZtfb7SbVGPsYmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c7TbVCDQZiL2vm6cqjim+kyfcbT7FsrYSIwzoi9eoCG3TbMLQFuFxoUxwSXLw1MhY3OvFPojJT85jTfB59qHzrLEKf8aE7Mm1pS3ArRigFjl/JW36L71nusd/jz0bQTfy9YAVKQn5lbcnXKba1MIKhTQvUG3BtZPS+sV8bUBazA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YJUup+Sc; arc=fail smtp.client-ip=40.107.162.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YJUup+Sc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Axm7S+xqWV4bypFz5hQGHlpPADqXogXnF9VkvQ+zBjT0wielYkx+AJkwZ0RcDDsqk41igeukzQLwkKRgAsbleuPZAwIKXIPgznCuTTBplgmaMzQ6kO9nGMsKoIDT2wUpBBsR1IxsMLdxU4N/HEUL28iJwpDMdGegDUUnAwDP/sAowlUlTafFj+JzQchMAbpEqkM552dTxF4LlWUTmwnE6IiRvUK+y6pP2+KZAbDpZ217DSOlEbiQl6lLJwkN1sHwt4zm79XTkmhJBrCzrGRjLe7rdbr13z0G0TS3INesvGUTgCZ82JhEE2yjc0HZxhETr5wzCLXLXzyWd7usOaJ/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Vi9WO9OYlDTNZv0FNV+4yA3yU3GnZtfb7SbVGPsYmM=;
 b=txCkSTFsxSMdrVstxivDXOG+EdRIC3gBvT1l2oMacFBnJQ24Hp3WTjRpD7XMs2Vk6X1H0yOWGnhWT1UQbRjlg9Gd8+WJLBn35jEG2IzbzVZHiJUhmyoPko1OQje3el8xDi6VNEARgXFIbJF7/6VlLOwvFHqkqdT6PVnIiUIuYS4JY7KoP/yTfBZnjy3A0lbRonbiD8YB4muPlJnae6Gm/KPgSDq/n8Gk6oKLg8iwOLOkFZsoigXMrLXBFQ8smhsuMgX32txE8An8RjGR2gh4+vHSul21FITmcfVQXgpwf1PbP8cfAk+eaTNZ3Bawzd7s2heiAB/tiGgQCQn0JzZsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Vi9WO9OYlDTNZv0FNV+4yA3yU3GnZtfb7SbVGPsYmM=;
 b=YJUup+ScGnyAjqB2iJs6crWoL3pbzS5kunQfHCsy4T0odp14+ryy1bUCa/rpkuEuh8LtyiWYygMHVicKoEU6WZdoMDYAddp1W1SLu2BDoEnV2EnIdSmIBg8VaDelgeSbw0y4t6NHw3uLPR6LhRGSGj9MiWAfVwbGRQqyqypVdSOiviBAQgpPL5/Z09VMuTRN7omxPHO5DBMKfCDA0cIfnPeZ9DiC38Q7Iz8ZN2auDdS76ke+A/V9BpouRKXmduh2Frpw2I5A9eJJM7PnosMFMWaMmTgUsUKmdlYgfpglWekpGzmjpTL+95P+kyyZ0i4AxRV2CyU5CzPEIyEm4gwcnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB10032.eurprd04.prod.outlook.com (2603:10a6:102:38d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 15:46:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 15:46:09 +0000
Date: Fri, 8 May 2026 11:46:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <af4FO5vOx3ruwWBE@lizhi-Precision-Tower-5810>
References: <20260407211850.79881-1-marex@nabladev.com>
 <65342735-44b3-4a2b-90ab-6093e0fd91c9@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65342735-44b3-4a2b-90ab-6093e0fd91c9@nabladev.com>
X-ClientProxiedBy: SA0PR11CA0172.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAWPR04MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 670129b5-4ba3-4bca-5ae6-08dead18ec83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	EU/XZZJsfLYiGfC0ZtHZx3RZ/gBBXc50B3fu/lCOS58IRwILFY/ZNFKZtWO8P3aCvFfcazVk/IsdMoeonalM/BQlu5xont/i9SfiZ2xN6jEfzfxij6oPHowmPXKa3OxSrk5bgInC5OJRfUMrop4Eb0L+i5RDqTjMohFr70WKReI+ic84Ul4JWQIzblVEmZdiiLXBfCijn/PXbaO6GhdHM6wM/nYHuIOu50BeW87iOt4uk6FQOMvrOFHvPbh9+o/dTYNAxwYnG0GD9ZobDY+yNby525mhc2kV9VT+iDeR2vtZVzrpzDc0es3Vywn446FdsOP5egoJhdZw7t2/ghXAZfxft0iAEm3Djcn0uXOnInPjFl6FSQsiZuJHvmPTMrbmLed0XeTPX34mfYUbk7Z0rlSWlSPLUWMOrm4EBdfW0+/HKXMJSWF/CNiAFXYVYvDQfBOl8zSK+3ZV/gBQg+9z92j0ur7g9alW2dX9LM/9TmKVbfhcD+yx1eEFQjRjT0K3eHO6kCesw8808zb24pJP+w1BGbTlMbfymPfBvTLU6mMEtG3zrsdEGmaFVwVpwv8YNiDDSoLeqWBx7NfrsMVL/9hXIyrt4RDpZxdaNV2xaQ4B0U9t/zVAeR4YysKSQSmJlUWNAA1K4vXPpLHkb9XBRyQ8L6jaM6u7Ak24RlzKOdMHVJiwioTNx8Qe4zX6jX/rSJZ59mk3qIpC56ZbACZfLXIRfV82gtlIAbuG/5bzOi79J5SVOdsNe57KIKRGEmrl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t1BHk6f+2AXDzmiYnSiMNwzPHYXM9MsY/f/q3/4baw56kvBcWxx9/8kDudu5?=
 =?us-ascii?Q?Ntwf5fMeNP0zIBHCJNer165jULx1dT5Ni3kCin8nRbVxxmxXDNxMXmXOfbFO?=
 =?us-ascii?Q?tgpR/xobV0tNtO0omakuX4MuEjL832jR/wFUZI47x3+g31v0ZYYDiTDu8nIJ?=
 =?us-ascii?Q?ftznB7oFJr5cAP+5nM01TN4YNUkrP7uayFB0iolY9Bthentmxz//p09nE16z?=
 =?us-ascii?Q?haSyjmbWS3dWNcmlfxwEIIddaHyordjhJMt8WWeT6HJ27Fe+gZLhDy67fXlE?=
 =?us-ascii?Q?tUaiuiT6rLMOIV2sjCFLhgnIKPJGsh5FNvb0oUoqPChiX1Ibf0TRykXnNpRo?=
 =?us-ascii?Q?TjWlfACelah9VuIoQxF90MKc4nvgdJUt0GBrJQ6Pd0HDw8s5I9BQIqrHdMHC?=
 =?us-ascii?Q?RuwbK0aFycKQSk6DWEJom379MDS4BMaYeMWwMjLQGt3Ft1NEsrVW62apHw1C?=
 =?us-ascii?Q?G7+9Jc0WWzGtItKfLvW1QS4vg8TUklqSHRLrFowJqCPd2O5gzMRzxfXTZxA2?=
 =?us-ascii?Q?MqBkFgRPXjDdib9tFdIi+8m3+7A1fddtzRH8Gav86ecdUFlCqANfQiulfzFn?=
 =?us-ascii?Q?sJqk1KEuArCn3h1cy1rAmashE9Nv2A+T3I8mQziWI7sOy7d2W0yLvSVkZfTF?=
 =?us-ascii?Q?A9Td9TINBzNx+KTY12Lt91oEMa4/+RtVrMGEuTzZKNl5ANkg4cpFRvNS/Dct?=
 =?us-ascii?Q?s6Ytt31pSPy6wDz3zaZvsBvoFvdhTkTxjiLw/grH8fvf2Drqz0vtne+vR1YB?=
 =?us-ascii?Q?rMyRBUPyesN25t+gvaohVQOmKTn+814cJ6cys+NoV1nZx08YaT/jdNkeDOrq?=
 =?us-ascii?Q?miwBLB7aZQfOim4Vs3W+nYYHnzUSe23NpzKujiwVrczQ0MziLPgL1z3b+yC7?=
 =?us-ascii?Q?uJakrQoNKkexSi4MuHm2C4DlKMfZjxvQfbjokeM1CdCJl6UR0g00EjajqTn6?=
 =?us-ascii?Q?azcKJUDJS8vaaRdLUk0VzxxELx4segsZmlMdQQfxbMFoSa6kbCPG7DQjZ/d7?=
 =?us-ascii?Q?OiRdGQL3AumGqSNNWhuKYwuzm6yEYtccYze7kyvpbkGFIRe5FHYk2OZxKEEH?=
 =?us-ascii?Q?zXCKDftn+s8rORO57QyLeevlGRtfLb+g0aZRFraSeHhuetKbzcz/Gm88Mj4r?=
 =?us-ascii?Q?NHC07HjJ+hB9H/nzXqyXeelYSBVYWUadKWbMmERTnW3pj2oMxH5ofC6M+OBd?=
 =?us-ascii?Q?tQf7ONdCbDsW1El+3utnRQmxBu1/M2ddCenhjzRUk0XMrBOaiz/asDpTGT6q?=
 =?us-ascii?Q?ed9bZGV+/z5iNwjT4TxMSGgmVEO/zfDB3Z9X3sieGFdgjMaCJatODjCeumPA?=
 =?us-ascii?Q?lk20tWm+fj7ilqHDEOVyhrtu4h65tJSUpYd/OL47Dx+TlIEzCC4QMvsL8ZCe?=
 =?us-ascii?Q?Fg0Fa9am8ZkCl3VCQ0Uy6e61VtFgiVK6bNuKf13nV28B/92N631C6GqIIyDo?=
 =?us-ascii?Q?5CVBsG2vT/GqZbtGyboI3olAd8DGwrcLyKGYdkrDnH5/t6O7iSWeINOFl+wl?=
 =?us-ascii?Q?MjRhih/1qzmApzfYDbb+3by1A/RoHs8DdxxpHKVndNz1wDKGXTzdfrpXrjMQ?=
 =?us-ascii?Q?CTtQTmupfXHfJme/8qgxyAutZwA09JXWE16sOoiZqlmdok9raEr60fx3V16I?=
 =?us-ascii?Q?srbOk4mRLoIENWVAQA9wWKc/9pZhqpnCPp3GGlqV8C/2Op2cV1uJ7sp/kCLP?=
 =?us-ascii?Q?7RrJSEy4jt66qkq+R8xjDTtDxxE4q4ZbI7lvlTc+80ctznZw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670129b5-4ba3-4bca-5ae6-08dead18ec83
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:46:09.4252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qesOSwJmtyiDUp+yiFqSFyAuJn99y1DqCz+UPnTVEFdIeVHH28YRggpO3//PCn6DjU39+WJ/GfRAMKf1e+cdTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10032

On Fri, May 08, 2026 at 01:21:43PM +0200, Marek Vasut wrote:
> On 4/7/26 11:17 PM, Marek Vasut wrote:
> > Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
> > with Lontium LT9211 bridge. This adapter can be optionally populated onto
> > the eDM SBC. This adapter can be extended with multiple panels, currently
> > supported are the following:
> >
> > - AUO G215HVN011
> > - Innolux G070Y2-L01
> > - Innolux G101ICE-L01
> > - Innolux G121XCE-L01
> > - Innolux G156HCE-L01
> > - Multi-Inno Technology MI0700A2T-30
> > - Multi-Inno Technology MI1010Z1T-1CP11
> >
> > Note that in case of the i.MX8M Plus eDM SBC, the adapter name containing
> > iMX8Mm is not a typo, this is the adapter model string. The adapter was
> > originally developed for the iMX8Mm eDM SBC.
>
> Hello Frank,
>
> this patchset is now split. How can we proceed ?

I am thinking about it. I found an old thread
https://lore.kernel.org/linux-devicetree/20250902105710.00512c6d@booty/

The current code base already supportted partitial of it, such as gpio and
irq map for connector.

Internal chancel liu have prepared version by use nexus mapping for audio
boards, which almost done to send out to review.

I want to wait for a little bit well to resolve or partitial resolve N x M
problem.

Frank

>
> Thank you for your help!
