Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14744BC006
	for <imx@lists.linux.dev>; Tue,  5 May 2026 19:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778008019; cv=fail; b=FC5tTZogFXLi7Fuc+dWLN+AxNjfrb6U+Pd8JAdbG1hrYr+okv19RYMgx4ZRlBZ02Z8uxBmbflZ4TwUriV8SI/2nXzYkEVHJJeRRsXy5wlVNDua831AknFM2cLdB9YAp7y/16EFjm84/hufkDXUgQ039Z5jvCHkESdvVwjD5mrHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778008019; c=relaxed/simple;
	bh=xzpwU5xu96bTp0P5PmWlrIsoaUu5HtgSzaJtAupgGcc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=EiHKaHFCaQjdWpFOnO3M/xdqONbXQoXXY9mmMAU0A0vnIx203G4XeLmam9pEEi9oDUgLk90+8fnNRLmNWIruAg0s2rRJVDvN14g+5tswHAf30/TbjpnVoF/c4PHOX7C75vLpQSU9wFyqVjO/EKxav3eNhCcr4Zl8xByJEN095RI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RAlRLK3q; arc=fail smtp.client-ip=52.101.70.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RAlRLK3q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1UJkQs1bVtb1W5+SN2WEYt8rpcAHCzOLKcnDRRjR+75uK1vdKVHQaAFPegnUHU2PwZttLJK9XNdYvGMeUPP5Ngxes60SXKXISYutMXliU6Xz29NS/4LzQxlHSncp/jaRQ6qJ47rEYo5Qg7bx9u9HYOVoz0CPsufqEvlOSlSYFcdcohA2LcbhXuEadOx+r3hvUIGeTEk6tX+NoF1e2Phez2yflWyRrxRv3/cZ3C7A6AVLAnMiOS93w0fOmqW2iJT3ltkr9uCE0HskgST9hCpWpZIshx6+dyyXxKB8YYMqJJzMZK1sCZDDIgM/366VwS2a/kQmTM469EgQZNTHBasnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z53awzetgokdOxPp3Kx8nxLKJlW4OTmiDAh6E1XGNKo=;
 b=IldpF72a7Jh3Z/bRUp51clCrxYl8j9Nug3n8fpC30MIvdZuavD1S4Rer1cr5QpeqB647yFtkUDCK7iZmW0kiofiY5rFk/5iXi/i4UtWhGWJEnbvzHP1aQ9ORNPO+ua14CSigJDNT9jN2JhYPh36sPSecWscHSL9xpuoxd67UAA9d8lW2rIvINpM636vhmwi1aEBFygVlsPvrEnnAzVV8q6nw8MTXnOS3GxkHUtm4iLR4z8YM64GleddAeRVNYNP2iQYlWEJ/Tq9t7rX+4fdo7CCUiNrQUK6Eh6WGKmz7nogjFadVoMjHE25Rlanw2WDikYoXYgNJ5h5rxXAQOcgPGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z53awzetgokdOxPp3Kx8nxLKJlW4OTmiDAh6E1XGNKo=;
 b=RAlRLK3qjYTGe6bfb/sNCFbx062+D/BLO2gk/F8S5sN4HekgyETNq4qYtCuWD0uZyZ6eI8OO0JxodahB4H5Qb2bhp3uEuBGGpEMlyYS3Z6PAUrQR9l4iJ+UdDSCt5o1pjsPFMoa82mjh7D1BsfIGKX7J8+qg6D5l00BbX2DdFm55DKJRXMVwAR/VNOZZWWUhKubyJljAmovtZcuUxaJtiuCfUqD9eDlrUI6hub49GDgYODpCOhhSr6AQ0tGePnB4WamFsPipwcO3wYIvHvZlcwSongxlzPNEhRBZ8UEsDaN2cfPdDYXgYwkbOqVFnS08oy0bPNLERNjNMw2XQXgi/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9326.eurprd04.prod.outlook.com (2603:10a6:102:2b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 19:06:52 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:06:52 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, miquel.raynal@bootlin.com
In-Reply-To: <20260403074634.774234-1-Frank.Li@nxp.com>
References: <20260403074634.774234-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx35: remove empty clock-names for
 nand-controller@bb000000
Message-Id: <177800800935.1894999.17959268942006949539.b4-ty@nxp.com>
Date: Tue, 05 May 2026 15:06:49 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH1PEPF000132F0.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::33) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: e2517d46-ac9a-450f-8615-08deaad97762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0DyvgzbrXtTlnPsBtwcQrUo+iH5EoQLOi+TgRlLjgj0s3UoAEHGtyg8/0te4Zt7OFeDq5KGSWLBuOs0R7RG+w0l8nMmxXNcvgWsucMt92ubOeTu/2oQB0Ge6pBUxFc/05PfONByZaNHAfewvTixVEb3d40yTf2zlPj2Smc29SpYY/bIXzcY+ZZlzi2rl9nei376LFMqDY5A308YUyn542/qHm5ZvoDLFeb0d/J22mZryU5yO8ZaZBu5AtQs6h0l6q8zVMaLlqllVmRloZkOfUl54ShFpqjfG90lRaA0d8Kw9Goswj/bAg43rH+9k94j6Oc+kspXDQNYDn5XxGrnWlnl5wpGULvzCSh+uA28CnJNvOpfCPGSi8/6riYv07PUuhS+Qj399AV+h3jgyWqE6ugH62r9h3HWOrik9YEUsnuSsGBsR1r/yvOfywSBZRXtkB8ebBw0Va5sEBvQZcuioYYUl1mCwTismydrv5txNrx9Iv5QYFprjLArouH8MNgLryrUwsHVfpHoD6U+0PYxwVR8DNpA106cLyWb5Qcpw7Cvp0AyOI8XTUpvNQzW5BhbUYZaPwZrZSTG7kIQCvAcSl043JHTWUIgoe6Sq3LuIJEIdWOy1lAqWSSlCW2eXby+a9UfbP2QlKZb2VOfBWkvtHkWfE7VFEiM+hEeMjxb0C52QPG66dwJorx6LQNZpV5inpL5JoawC2gJ573ZT8j0pS5bbZjEDsb8rSV4/Ejoh8XM/SUUlZJgT36K3DIxqG9Qs7Qq2cP0Cwbc3T02kLGgWng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qlo0YXhlenBYNmd6dEZkTGpUS3dmd3FUOWZBcXZRNGNFYU5ES2lQMzYxcDFu?=
 =?utf-8?B?bmFHaG9Kb1hMdUJ4TmVRVzhZRFpNUlIweVZTb3pnNG1CblRFdjFsMUZ0SjNh?=
 =?utf-8?B?L0N2TTA4TlZYa2M0QSt6by9rVnpxamJ6VkMrTXA4TitMazlHM05CMjB5UHhm?=
 =?utf-8?B?SGtJMlNVY1pHeGRONlBQOWF2ck1zNGZXZ1htYnRpVjVrUHJTT25KZ1V6MGVs?=
 =?utf-8?B?cnFicVpnbEJYYnFVYm1jMzFDTmZRNTJwZlNuTWlUem1iK1l1OFBxWXAvMnNT?=
 =?utf-8?B?YU1uRXkvVlpvT2M4dDd1U3Y0NGdvLzVOY0ZmVjhKQi81SmIrMmt0cUlhcmdu?=
 =?utf-8?B?TjJ1bForUnpEeUo4dHZxbXU2TGFjWFQ5NU1FZGZmN2JDTml4dkNnWUJkelAz?=
 =?utf-8?B?NGJEbVJSMFBIcGdEdmc2cm42ZTFod1o5c2hPZjFJSEZ2WU9nR29RSlZSa0Ny?=
 =?utf-8?B?R1dJTzkwRmN4clJMcjBmZm9DbkdHUTNMbHZWQ2NyaXJ5TzNnVlZvOGh2OFdI?=
 =?utf-8?B?MG05RFgzbWRsbXlQZE5oakNSU2xSLzhCaFhQL1JwYVMzV1RqQ0d6WEg1cVVl?=
 =?utf-8?B?K0QxNHpvSnZvVjBpSUtDbTBTcG12Z3FDdzRNZktxZG0wR29CWkVmNjlHbHpG?=
 =?utf-8?B?Y01Ra3JXWnpsaG8rd0MzMmxGV0hMZHhJdEpTM25LZHUzSVZUNlVsYUovL2lm?=
 =?utf-8?B?ZlpITzZwdFNZdUNZT0k4ak4wKy9SK3BrZlNYYXh0THdGcnZYNDY3ZVYyOFNL?=
 =?utf-8?B?NjVPaTBtbWhhb0RpejdySUQ0cGNobU9nM2JyR293R1dtREMrWFBLdGpjcGRt?=
 =?utf-8?B?QXRXM2tJUVBVWW1wNm51Y1RrSWM3eGFySjdQa2tTcWh1ZkdCZXhQMlV1Z3N6?=
 =?utf-8?B?NmZtNk1oeXdFc1lxdTZVTDVjR3BMYnk3dFRoQmlod3c0b1U1djA1NWhQTUF4?=
 =?utf-8?B?UHlNZXVrb3NROUVPY1l2bXdRQ0N3aU1zc3EvY3RQSE9Bbjd3MjFnQ3MzYlAw?=
 =?utf-8?B?aXdTdDFXeXJCaU9XK1lnT2lHVnNvVkhJa2FqRzBqdW5SRE02eGtYMmVyOC9N?=
 =?utf-8?B?TU5IYllwYkR0a2xxa3RnL0FaVTlpRS9UVmlnaldvTlQ0T25pWnpVQTVlZHlo?=
 =?utf-8?B?eElVbkVFN3dWcEl6TlM3dVpPTDMrYTNqL0hqNlFGSnhRSnNxbDdpUDVMT0Rs?=
 =?utf-8?B?aWxLckxrTDJLK0xBd1JGczNwNm5oQ1dCZ3dsSGZLTDFWNVVlbm4vRi9sSVhZ?=
 =?utf-8?B?dFZtSjc1YnRjREpwZ3YxajhVSm5qeHNnSWFqMVdES293OW9KSExFMGd1VFM2?=
 =?utf-8?B?NjZiMXUyVGh1WFh0SytaYjQ2TzhxWm9mY25ZU3NJUzJ6dHF4S29ML1pqYUxx?=
 =?utf-8?B?K2ZiMUhpSUt6OGN1VFdsNk9IeEF4NkJWZ3BWSnBMalU0cjd4RWlGeU5xbXVj?=
 =?utf-8?B?MXdiRDZHTzEvc1orZWhOMlg2cmVYS1Y3NmpkVFhTQ2FXYllmTG0yUjBQVStE?=
 =?utf-8?B?MG5lbzFQTWJ5NFBkRFk5Y1ZOaFUvL2RHVGY1YmsxRVAvazNUQVgyU3k0V2xO?=
 =?utf-8?B?M0Q0aFNTdk5rNFZuRWJ6RjFSazk3OUVBeFgwR1JEQ0p0Q3NpekJkNmJmaDdo?=
 =?utf-8?B?ZXVncWl1RkxWSW5wVXh5RTQ3TFYzTFQ3dnExMnlJcjRxc2Z0MHVTR0l0SnRw?=
 =?utf-8?B?VzJDdmI4SWVXZzVweWJhSUJXbCtGYUVTak4rMUNFcEVoUXlLemM4L0tTbVZB?=
 =?utf-8?B?UXpuT1ZxVy9KY0Z3MUNXSjlrUWl5cFdkYXZPcWwxYmg5T3F5NEFGWFBOOGoy?=
 =?utf-8?B?b0ZRNWQ3a0k1bHFTd3ZxWllJSUd0SXEyV0dTZXZTb3FUa1BaRm1seGY0ZE9q?=
 =?utf-8?B?dW4xakpSK2lMNnQ4OWFiRHFJeVNWQmlNbjV6S3dtMGZOUi9rWjI5dVJ5K2tS?=
 =?utf-8?B?VzBqU0JZaG5UVXpHVzljYm84NkFrTGRDUjRGWU9rZlcwSnlvWnY3VHNha2ZZ?=
 =?utf-8?B?eXZseUU1TVUzY0JISWpmcE44Wm9FUXZ4NFY3Z01XME81ZWs0Q2s1Ty9vWHlu?=
 =?utf-8?B?U2VFRXl6ZkJqZ3N2OGIzYW1yMWJLR0ZPMnpvbXlDdUlxT2ZYZ2ZEV3kveDJB?=
 =?utf-8?B?RTRpQm1qc3I2bmRMQ0ttdlRSVVdsK3o1YzYyU1VITlN6RU5ocEdlUDdydkkv?=
 =?utf-8?B?Nmd2WHRESTkrS3U0ank4S21HdDZhb1hBVTNHYU9HS0w4YkxMV0pua2czNjY2?=
 =?utf-8?B?WHBhU0oxVHdVQXF2K21naUFKU24yaUpiMlVEamk5WVlrVVZjMGc1MXdxUXVr?=
 =?utf-8?Q?/PMa2hpvOSUyZI5PUs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2517d46-ac9a-450f-8615-08deaad97762
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:06:52.3433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+nXLXIRVkZVnZEFZDxJVnra1ESWDtKDU9ta3LMixhsOiZnmdR3ie0nSnI2YouSpktaB0GKneeJIE6Y5Ty+FkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9326


On Fri, 03 Apr 2026 03:46:30 -0400, Frank Li wrote:
> clock-names is empty in nand-controller@bb000000, which is wrong.
> 
> Remove it to fix below CHECK_DTBS warings:
>   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
> 
> 

Applied, thanks!

[1/2] ARM: dts: imx35: remove empty clock-names for nand-controller@bb000000
      commit: c1315c36141a3310723c443f6ab90a7e41ba60a0
[2/2] ARM: dts: imx25: remove empty clock-names for nand-controller@bb000000
      commit: 64b4b92f2b1650e8f6a0d142592325af2520695a

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

