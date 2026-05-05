Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011012.outbound.protection.outlook.com [40.107.130.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDC93DD526
	for <imx@lists.linux.dev>; Tue,  5 May 2026 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996432; cv=fail; b=MmPYUH9grU0htwlL2umwNp5XS7ZSLIETQFLSysPixjzxQLHopUmXu4YXeoSnR36luf16lyM5/HTLu7ONak3XLe/cYVuMnT2bblx9cB67K7XPEFwg3vBNVqgTl79pwc6FP5RZzE+K/FIz5mqZOYoCAzETGPliFEoO/Zvn+PvmQ3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996432; c=relaxed/simple;
	bh=pcTY9NjnmYMmUkop9JL9vhcJpOkjxMP8sXD8s3WVCGM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=V3ovsUQeNqkNRZP74+dOETYdpp7f3JPcEATNDKG39e7vAbCduca/nl7zeX6ll9bBdZDa8R2BzVV1UqiYkZukw90PQzfma0FiyMKkCJzscAsWd8AJA5VGoWLHDAUq5O0EYBmP/hQ+/caCIpaXr2HbuC7FhP+5ordJV8Ih2wrkeu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aHkKogwA; arc=fail smtp.client-ip=40.107.130.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aHkKogwA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7oUj/Qa3Mq4Dk7mE//YQIm0nEKU5qQD6NbR/02ICsusF2VyC5eeBpol2fwuHGjndA5sjFO+VBy4kl+ItX8IWgENo+MZVEEq5mB8+sPzj4RObydOivUnyOXyVkaJOrNCZzLfJwn/C+/1JDtvRaghn1Pa2rAoZy/fsGhvYOwjT/4UK7jG3Acbm/FviW4xolodXSmn3zlCpr4mpqcBlBaO9M9m+tELxhAhR5iVwwF4LXuaRvzGVnmzrMSBXrAPJuLCq7BamHnUObaKSwQclHZeA7AcO2hLaZIhIRCfC9UNaM2wq+HO29luazesTQvJDpN4Wy9m/d/87czRQqvWCG2tzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqWl9nLOgcG9DnbkC9uuzG5q/peMPv6ngfOT4Wa0V6U=;
 b=OqxaIGvgaXN58DEuW/ai6b2qp+5Y2ucMwUnVBnt2tyfyBpG0tRWg8TSKwJYpvwZ4sWkuOYttKEY0d0tpNA+fxlQhnbiM0FACQkupgxlsQi7SD208SleHPzPNpgM4lNCK9eJc4NyFaRAIfDKkzDr/Wr5k6ZgdmpReFkr6ql/tBYF2hy5Gn8kdwdGarpjzHRhurnMQrcV1OD/a+aDf4jHzb3YZp+KyY7DWHL/xPP59uIVjYFpf/s5TElct3OuofC0u4aMzQJZNX5xsZl5JgEMGCXfHOBAZX+3F49cvyAE6+SiPKgJLmCyXH/NzdfPKPwE7vah0y6Efh0fzLqB4xuHWYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqWl9nLOgcG9DnbkC9uuzG5q/peMPv6ngfOT4Wa0V6U=;
 b=aHkKogwAZmRvdBBNQVZl39PsbiINGMnVrex6x8fb+4EC9xQtzsC5stUK8Xg3FCZZEbTuAE6wVdfwG3BoJReaBqmywWT6ydMTnbik3kuzK21NtUzMW8TX3gp+/ugOVPjHY6voLfvimU9QJNZ6bfoNXsMVFEF2JdiwP7cab4bUvyv44wQcz61N1W6JgPJ9eBC/4s7NWorn4gwT/+cSFKXPVTcsXdVdAZKUDdwgDnALZtpjrJsnT/b3sy1+siUiOPvYUAUDeMMTXS55KeS7oIC380iRr6ibpoiDQJrqR7WCS9bnq52cl+n+WB3zUlwhoNeDe40HzF4MV4CqQtMNLj6Xpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 5 May
 2026 15:53:47 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 15:53:47 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
Subject: Re: (subset) [PATCH v25 0/7] firmware: imx: driver for NXP
 secure-enclave
Message-Id: <177799642393.1381528.2137639571938103661.b4-ty@nxp.com>
Date: Tue, 05 May 2026 11:53:43 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SN7PR04CA0060.namprd04.prod.outlook.com
 (2603:10b6:806:120::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fef259-f893-499a-be92-08deaabe7dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|52116014|366016|19092799006|376014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	azHs906qrsXvekyrU/eyS2O3Aw+3lnVxrpgKyyRHCzr9vQltxggN5Em5cJtQUUkwXU0Zvb7Ze8JZqWQ7iEs22Kc7fiZROxC4U1kysErqdyZpgGLdvhoV3LuAuWWUaZyIei0gRk8JrOnTwN2Kbg2el7mRIRvaNHzwJ7euUAFBKCW/ozG2roGvS73Ewxz630lQ0XYGV/kSOaN+RTvxW1wWgI/R+tE9sbcAGSnGftlf016mUsvo7SpCmKl16o7CUct98vRjciW6dx8+WzxNnnWjZrZuupFgRud2WVE1tMvR74M+JYMohTTUoFu3OTCiiatSL2tsePQQH6EdxkcEja3+KyqosjtUoWUipTX+NRJVghVPF/uDV/5EBAusZC8Evdk+T8DtRyvq8W2DgIYkADpBIxOc4pyeCxC9aJvdfTInvlO2Q3jLvBVRirPXWwcYXhllPzohof4QUJHTtieeXujdJHSc0UVE3X7dBsn8bvegLJrYtJBj9pf5AleDkEgA24MsuactcLE9Fk7zMY3a80igYTpP/xvmLVOPlUokBjIdVdVnJ94JENc2Lf4srEoSaze67H/6v+fw9FioAZ3lA3nlhDnbx20pr77MDIuvaq+JIyLrhLpj7KntX9h0VPIS1A+EIgTBfuuRgf4BR77WC59/f4cObdpU69O7TEKZoI6Xi+VZR3Bl7V9nFPxRzMkCJ9+VPJeGzw0XXvoSZ8lZKIT+2abkuCWkvxvlFPbjcVqh0VDb1UUOammO/5pPaVzCUSyB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(366016)(19092799006)(376014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHpCYXNzcjVmMXJqRjFVeVFMRVBSeVViQkN0Yk9MOXphVURzbjN0M0VGc0xR?=
 =?utf-8?B?eUZ6TkdCTW0yMmhaZU85TDZ0OEtmT0dqSDhHaUd5VGd3bDZsYTNJbHJWTm92?=
 =?utf-8?B?ZXhUR3lTaitXeEhoUEFKeGtuMkUwM0I0WXl0OFliSFVNSzlBSHdiNmZJcmtz?=
 =?utf-8?B?bE9JY1o3NHg4Wm5ZamwrOUZGVCtCRGpFZmtsc1lwejFlNkJOdjZMNzVNQitQ?=
 =?utf-8?B?ck45QTNDTng0N3BaMlgwM2hyRXJndjRVcEw3SGNkYzY2WUdSY3RWZDhuSFZp?=
 =?utf-8?B?V2F0NCtjOUFiZ1F5VnRDb3VvM2R3QkdBOCtSVm5oUUxFeTZnSFU4RlI4ZDhT?=
 =?utf-8?B?UFhiUU1sSEJhSktaa2MyMjhDVUJidjZQSWFCTDVydHhnNE1FbUxORzZRdEMr?=
 =?utf-8?B?WGxvRStsUmJTWWp3cU1PZGxGQnVrb3JFWEc3V2tybU5meEt2bkx2Vm5pWXRU?=
 =?utf-8?B?UFFya1RCN3F3eUNqcW9XbEZpeGt4ZU8wNi9OSll5MFZaL2dCOENyekFqbm40?=
 =?utf-8?B?aXd6K2YybEZlVEF3c3Q3eG52MU4reVg5cmRrSXRtV2VEcHpUdjROb1lldTJz?=
 =?utf-8?B?ZElYQUlBTzk5bTFuVHM4UmkzMGNETE9CcGxFaWdKdHVDWEowVk1PYkZQSk5y?=
 =?utf-8?B?UlZRbGhHOUtPWDBpeG5PdzdDZW9ERnRXcmovVkpNNTZaTmtub2J6emNVOUZq?=
 =?utf-8?B?SUQxbkZLR0VOa2dONXpaQlJ5V2J6R3Uwbzd2OUVrWmRyelI3VFM5cGhzSHZM?=
 =?utf-8?B?VkVVbU9hV1l1bkdxTkxhdW9TZkVlT0NXa2JmTTFMbTNSZDhubnF0ai9oaEY0?=
 =?utf-8?B?NzdIbjRaeThEOXhkRUxkenA2S1hIRkVvWnZQd0tRaTViS3NBdFptYU15VXVP?=
 =?utf-8?B?YXFvanIwci9lYTR2VVcvdFZLSkszdFFrRVNYcGo1akR3eGdvQTIxdDFRbUFH?=
 =?utf-8?B?c0t0TXloeSszSW40NUpySG1sUDNlWFlJYklYYnF5R1B3UWlBMFg2OHIzRjUr?=
 =?utf-8?B?bkIzcll5YVY1SXJ2MjFPcktuOWhmRGwvRzREZ3J1YnlabkhLMEtxQzMvZ3lM?=
 =?utf-8?B?SXVmODViaEVHSC9Hd29rWFRaS3pXbHdCM0cvYU9Za2ZBM0RzdmV3a2I3bVpJ?=
 =?utf-8?B?Yjl6Sk01bXVoZEFkQmJHVm5UaTdxZ1NZVlJpa1NhQTg1dTk0cjgybjM0ZnZ1?=
 =?utf-8?B?ams2MWtYajFnMkdLRUJwSFBZZEVaemVnUFBzbnBiYUt0ZmhVRy9XTVRicEVW?=
 =?utf-8?B?aVFVcWtYR3VDN2sybHFMY2NFNjNMTWhkeXpaKzNWQStSV2hNQll5MWNmT212?=
 =?utf-8?B?dkpyRUNqZm1VRUYwSFRHOWt0aVd1YTBweUFsWnU5SUNvQjk2N0tORDdzSi9r?=
 =?utf-8?B?WTB1dVFVWUtFVFh0anV5TGVNKzJjbjJ3a1hqMkhrbUQzeWFSQ3VXVEtQNUlU?=
 =?utf-8?B?WW15TW02bHVPVEhFTDBMMExIZjZhVmphVHZ3VGZZeWpCN3NQeS85MlRWT2k1?=
 =?utf-8?B?aTFEQWkxVm5tcmZTdEJMc0R1TVJrb3JidDlXWVIzaWh4cVhOT0xCT2NyQWp2?=
 =?utf-8?B?dVJvcjlhRHdtMFJNVDR2M0lVS1JnSWswM29BRDNLUk1tMkt4NXpNYjBRcmF2?=
 =?utf-8?B?RDNkWEcwc2RpWjh6eFRiNzZZV1JQalBoZjQ4Qk8rZU9OTEwyenpEYmx3czQ2?=
 =?utf-8?B?WE5WUkY3YXJ0elI0OUl3ZmwwZEtKUUNmdHlkdWNMdy95YXBRb1BmWmp6bEth?=
 =?utf-8?B?RXo4UzlCMnZaQUVhVHhkNU5qU3lhSVlZRWsrV0VscUlINTFpVWFtS2VxNTZI?=
 =?utf-8?B?akRVU1BteHAydGdDWlFNVmY1dzV5UEU3eDBObk1LVDg0Uml2bmFhK1o5MzRM?=
 =?utf-8?B?VkVOck1PT2RXMTFHUFRSdld5WTdLNnZDR0I2NG5hdWhTL1Yzc3djR2N0VXBS?=
 =?utf-8?B?RmtYQlFiREpSTFo4aGhsUUx2NkpYRzN2R2hJNGsvSWFKbEVlWklPNXM5RjRz?=
 =?utf-8?B?dEsvbEErb2Nidmx5eGMvakhmM3dVeVBIbTY4S3ROb0diOVdZdXZmc0tiV3Bs?=
 =?utf-8?B?UHBTWVljN2VuU3JzOHZHT2xnRTRpeitCb0YyeGMwSlVEMmxhbExTSk1Ha045?=
 =?utf-8?B?U2RHaTFKcEl3TEU3UjFIQnJyUldLMW1vZFFDMk16NXYrY2RkQStkdk9nNnlN?=
 =?utf-8?B?S1Y2NVNTdjg5OWZzT05HT1kzYnJ6aEo0UWRjb0xYb3pzaDJrMm9YcjZhL3Uw?=
 =?utf-8?B?VmpNOFpVa1V1MURxNklCdlRsUGtOTVFkTko2azV5YzhwK29oRFkrSDU2c3hY?=
 =?utf-8?B?cElUcnhwbEFIRUJsM0RjcjVuK0N5NXRFT2VIRkdlWi9SdkRiTURaUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fef259-f893-499a-be92-08deaabe7dd7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 15:53:47.0948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvCV9kxgwNqVUsdGV9BFm0Shl6wvflephLspWKebHC2bKWolj08UyI+hXnLbBATqW+Hg+/NhmmzyR6eLLO/XRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8150


On Thu, 22 Jan 2026 17:19:12 +0530, Pankaj Gupta wrote:
> The NXP's i.MX EdgeLock Enclave, a HW IP creating an embedded secure
> enclave within the SoC boundary to enable features like
> - HSM
> - SHE
> - V2X
> 
> Communicates via message unit with linux kernel. This driver is
> enables communication ensuring well defined message sequence protocol
> between Application Core and enclave's firmware.
> 
> [...]

Applied, thanks!

[1/7] Documentation/firmware: add imx/se to other_interfaces
      commit: 3b4531c6e0f4c8874f0266853a410438eda1fc24
[2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
      commit: 4d7bcf0869686d7d7fbf16244453b987e5ca6d14
[3/7] firmware: imx: add driver for NXP EdgeLock Enclave
      commit: 338529a73c2bf2c277013b745cfe6f19b84b70af
[4/7] firmware: imx: device context dedicated to priv
      commit: 2d733ed67f608ee85abb854157011f88d7f280a8
[5/7] firmware: drivers: imx: adds miscdev
      commit: 4de71839142b5f43846e3593f4eb236e1d733885

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

