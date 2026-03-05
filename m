Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011059.outbound.protection.outlook.com [40.107.130.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081543537FA
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 22:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772750903; cv=fail; b=bRGbtrPpDGgTcY3yQ0oMfN3cEfLKdU9OaWu5GKfkq+p/+UpgJzOA2MRwdWQ/bOiGXTqr31NTjn/MGJrq+rESqZwMFfElYRZcOsND2a6kB+6Xv0KRw6KAThpv5pt7pbiTluvgnqO+HSTgoj54Js+3cI0YM4uwTrWlEA0dGbMBWlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772750903; c=relaxed/simple;
	bh=g5oarvMRs+/dLmfD0gajhCF3SBSe0i0BVosgTzYH/H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eQdT4aNDQT10h3ztdhXSPAk/ELYLQkmfzuPpqBHBHP16sJuQU1DgSp2SdlZTQR38wD/ilGo+uziPvtb3tLXTBed2pmIsGqGbwBbAyaX2FwNuKmqOcCKHg090bnBS8RAxSj6St8b2mlH4pA4UaM40BovSGeKKi1MrpQ0tDWdk/j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=epJpkqCe; arc=fail smtp.client-ip=40.107.130.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="epJpkqCe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rx69PG8/cbxheBeR5sOPWBwjUGXJpjlBPI1V55u94K6Fy/+M1LLT3TXEXXJyWN0aKb3c1c74VgxuO19KsLsIZ4WphQJ2BygsK0Nn+1nZUKFBMr0JJeuUi2gYtOoXwdLxyJhRt22r7lYw6v38dOCJ9elNOlODldx7Zq9KjnVqiIUFhe+hwqW9y/FawaO6SmQqodxINM4qZpc333x4Mkhs7lN8efwcF6BFznMG8vDIP/fLSm9D/92bpwdkM+PtrdHddrV/RLHRyXn69fJcam5gUFy23JXgcDSvyNNz2SUrJ2yCnCOuVlYVWZQEQNVpHBidI37xahCA3nuKexB1f8pqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04iAeQzIkEcGNpKDxgOw270im+0xYrZ//tnov5p3M1M=;
 b=H+fbpfikTVqM9cTawVAZSXnxMghhkUsjR9gBSQARoeAzcp2O0M4nM1WJWXvkvy+zphSWUSh9Zy8vjbbgqK7XaS6O5mjRpFF+JHWi/15NmhgjPI04mCAL5u0a9dEsuKpIgG82YcNQ1dv60zFRF8d+fSU4Y66DYIoznT91ELvse7kxOYh2vmVp0pTJiswAXFMmJR0rXxl1KcTJDS7hBmFtAxosY3bAduYYcyVCjtv72XZEGwQZpliWd87VLTJ57bjukUA8MWbAy/PprJ9iKgcTg6RPYSdeaP9Z4JudZXfA4E+poGi+bi43lG5Dpdk5NL+iOA9I/1ucakucYToXCr523A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04iAeQzIkEcGNpKDxgOw270im+0xYrZ//tnov5p3M1M=;
 b=epJpkqCePYG8Nirr48nu/SDvc3zOr52hr3J06uPoW5ced0Xe8FEr4zaB4+QaXqAP70j9TOXTXP7uCiiyEH7J3w+zbSsSQd/zpog6FkzXtpv/J1xwr+u5zKCmxNV9CJqcca6LcLYskpuC90wPUI50XgBgd8kdwG3rSMt4K+IIi9+x/K1Ah0qwFCz4vjd7XqNCg0r8QBO/H6hY1cmPq1nYnwLkC1Wb//B20yUp7sIMwCyZ6rvyXWHHfbnhePzCDamKDXc3FuFK1pkY+x3QdueEkV3BVs5h9UPq0vqQWuwZjaETI/mmS5zsFKAxgmqzOyJLxhcMsUSKqRK5HDBXkbMxlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB7032.eurprd04.prod.outlook.com (2603:10a6:20b:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 22:48:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 22:48:18 +0000
Date: Thu, 5 Mar 2026 17:48:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 1/1] ARM: dts: imx6sx: remove fallback compatible string
 fsl,imx28-lcdif
Message-ID: <aaoIKmhcgIZdFvbz@lizhi-Precision-Tower-5810>
References: <20260305212312.4053922-1-Frank.Li@nxp.com>
 <c64ee6d6-d948-4146-8463-0e68ba542404@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c64ee6d6-d948-4146-8463-0e68ba542404@kernel.org>
X-ClientProxiedBy: PH7PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:510:325::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: eceee48f-e2df-422c-ace2-08de7b094b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	+fBD7BZrl8d2wcwKbu36gQIVVuUrF8VSDA3kZMm4kwNbaQ73t1bwtg/+pZd3vXessvqnYj/gPtlvEegnHxiyVSbmk/slgHMXobU93lMQmp17DdKcigaP6uyg5QEIk3xUmOc8vkP93bHOoQb+XJ1TyKFtW8a0TiQo3XZ+MHzNDmDKxZT29XHMHXJ2GLFJwGJKMLYRzvHQKyUI8evlAjVKsNGIfuWkLdgOE1TC1WjpUByVyMEl/bpJ0aiC2oQHzPLblkG80pUdKBSYZegBgDHjc8qOsR/zC1LDsy2R6MnXmOCSXjXxWHEi4yfijUPUYu4Gt1AvLEjQGZHTKdWcYbhD3Dpo6H1i+vcwC4eaJlmxqnyzykVP+Gmnev6GdKrKsdIo7yA14/sX91DQvRJWdtzTNEmLSuP7wLs0LI/kdT8jB7jhJ43r8G7NwuK5EbuLVHv67L0ZjRtA9dbOMYa66KgzNUMUEzrNB5szDXRb+ZIKBogAPE7MSI4zDWkF+wN1+bJrG9yfnpad5NQEt8E5BXhnqZ3i7uHbzCqad+Yk4v5GQkD9ZUYwbOdBVb+BskFzmzoXctfZSMA8p9LA7xpDy8cAnbH4uYKONE3onrvMehKJn3yfSIkT8XvW8HmGaEo8Dh+tlOM8K9L4Ol/OS7I3FIk/0kdx2EC/yzY4ZSL8Lf4kj5WzLzQQmLLt80p2CoxsJGAKBDcRa8t0gsHsBHMwJCUpn2v9Ta3OuXHJdDknUSkbHKRoc4watATkok3Vm0p2Rzdm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t/lsg3j91YHzo4i8lWqsYgO8dSrjYztl7x15Y68O7tNJaLX6JCJo5pyirl6Q?=
 =?us-ascii?Q?jAwt5LAqXoEF5GupexTiKlVa40kjR3fE2GBisN/HWdn9hsF5l4pLSLekmzSD?=
 =?us-ascii?Q?UkeP4F9grUek6AzD3SZoCOzJ+gXtoNQhcjR27x8yVJ3qxVUNladJJDQb6ht4?=
 =?us-ascii?Q?k7tMDzCDXfts0upa5DfaIzDwnrWuCek/F/DDZ1f8EQplWjgeLWck7ON92Nmh?=
 =?us-ascii?Q?6c4PbK0L72o6xPl/CDQ1VyHDV2m44AycriDiqypmeLPpS3x6l2atmrTViwzF?=
 =?us-ascii?Q?ie/wLAhTgODRwYhcrz11BMdw2USZSdCFao8ebBYYbweWALwPaQfsRqJYJM5D?=
 =?us-ascii?Q?PB1TtwA+kzpP/MFuZyMjU1uoD7ncJJqymUBvux7OsnsLWVR89zmwhCxuD3oT?=
 =?us-ascii?Q?QjL/Yd31vOw5+i/aafab1jED+afHNFJjVknSFZeeXUGTlmmXMu3Epf00iqCW?=
 =?us-ascii?Q?+r7+QUmLMWh1eig5PXnHv2BSXDg0Nfgbg8rDkNdfNTJxq62im3DvbnOD8ViM?=
 =?us-ascii?Q?c6MzJvoYdymiJkUnaDnnHtL/3TTydmB/naQfPRrTlHu0p2CnJGIWzIxlM7Q+?=
 =?us-ascii?Q?ivfznli9uBg5c/3TEVVa/ky+2bC0BaBkVNbTDIvigkqZz7xuCbeeVEc+glEx?=
 =?us-ascii?Q?z1ZnRNUEemY90GG08b7BxuRr65zRRFIkUzpbRpVXOVrxd9oOg+F4PLHwzEjn?=
 =?us-ascii?Q?l27iz1JpXCVX8Cr7w2BwQEg7umBI6VNKn4N6O1aR0rnmxImiwhZaVsJd4cM1?=
 =?us-ascii?Q?/Kv6EqZtHYXZvA2qDvdmwLBGmxuwYM+DP+HDtl2B7h/0cg0flFvQyKyHjMsW?=
 =?us-ascii?Q?lTjDm/2h6H/PM+zdVMhuhSrbc5jIfULhZzmUsSBxuybaEecwgN9ZKOpdpH0S?=
 =?us-ascii?Q?KmOdWdRf8FeZLEUbXy8I0xNjDWmEzGiIsYeHSda5FpFg1uFhnhDlacH3ZiOH?=
 =?us-ascii?Q?faW+yvogK+e0a1sYo4Qd+eUwD2LlXEhLdB0SKC+qT9gg/XARz5stoD7TBEVR?=
 =?us-ascii?Q?JMNtqM+6QWyDIebsLJN7NMonMduI+HsT+MlGhYwAXibuLTIEpLTa2Qt0trWm?=
 =?us-ascii?Q?RrVFphukXNYWSCrRtjEiR6XqKuE1V9TeALdioGpsFX43gFwR2UmZ0/bULbJy?=
 =?us-ascii?Q?p10JjfbgbvtqMhtMakGS1OpfftM+4Yj2TkwDxathpe8Y181Vxpt1Z+ebr6QM?=
 =?us-ascii?Q?4Rt3NwM4URvL4XpZWo15XW4UaeyGyts/58dbsLrQBxqBn7WHEQMpKIqcSKG2?=
 =?us-ascii?Q?AZd4WNTodJB9BmtOWkaeFQkAnBae0ZNqHyvAIw5flgDwMtWvt5LdCAOzMuSp?=
 =?us-ascii?Q?VVIRH98h8rc897acWDLrZ9qHp+SMDzqdPDs+4+xBCx9+BOQJy0ERz60S9HtZ?=
 =?us-ascii?Q?uKPSprIuXtvfEndFuIRd59NeVCm4rDicNTFGwpQvRMzZCb9pGTCQ46LRC1ko?=
 =?us-ascii?Q?Jh6mH3FTfKT2LvcZdUP3xCtjDnZYdFiwblqU+/+dFt68S6PhhNgmu0sGMgVl?=
 =?us-ascii?Q?J7Dav/xCdLF9vYQvD9Oh/AhevCn3I3ULUdyyIWezHtbQOp29desHD/G3vLem?=
 =?us-ascii?Q?YpY3XIaUXNLDAw/8iZuvRYD9rbn7ZNgI1qqPwE89Hh7A42lXuE9YSfQUWjIq?=
 =?us-ascii?Q?IG0wGIVQWqh+UAr7kvhXhiTtnkzozcysWX+Csk8zrmfVPx4RPPweSiJcfSHU?=
 =?us-ascii?Q?cDxc/OMG/vFbK7HWWyupWHiTzMJgMUn1wsN0v/WksP+i6K5/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eceee48f-e2df-422c-ace2-08de7b094b67
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 22:48:18.6013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcMy0idxphZn1fyrzJnJxysPm5LeoSobwxIgE0or0iZWw02xt/CcNu7quZYE2GFiO8x+tkoZEaejCvpztIjamw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7032

On Thu, Mar 05, 2026 at 10:34:18PM +0100, Krzysztof Kozlowski wrote:
> On 05/03/2026 22:23, Frank Li wrote:
> > i.MX6SX uses the v6 LCDIF controller, while i.MX28 uses the older v4
> > version. The driver has supported the "fsl,imx6sx-lcdif" compatible string
> > since the initial commit:
> >
> >    commit 45d59d704080 ("drm: Add new driver for MXSFB controller")
> >
> > Therefore the fallback compatible string "fsl,imx28-lcdif" is not required
> > and can be removed.
>
> It is required - you are changing the ABI and possibly impacting other
> users without valid reason ("not required and can be removed" is not a
> reason).

In https://lore.kernel.org/imx/42eb2d42-47b0-46b6-92e9-c59473113c2d@nxp.com/

other known user barebox/uboot already fix it.

https://lore.barebox.org/barebox/20251107210033.2229781-3-a.fatoum@barebox.org/T/#u
https://git.pengutronix.de/cgit/barebox/commit/?id=c99b937f3a31

Frank

>
> Best regards,
> Krzysztof
