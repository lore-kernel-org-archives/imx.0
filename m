Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013052.outbound.protection.outlook.com [40.107.162.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238F63161B1
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103775; cv=fail; b=E/0dssJS/+LgBJ9nNsbbZ1ID3K3V0treNl0x+8Fz97/LYz00kbGq9KCQo+CZ83yBNxqrk8Ue0YQFAsnvnV+i2sVQ/VulXvVhCiCf6m0FPa+wTxADgKMwqdQ7ma3zrmS8L0mGBEV01iI3Z71nMWDj9g50eydlR0mhwIO3tzVoMFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103775; c=relaxed/simple;
	bh=YNXD2kIv0/HxxrQD7N50cUZLv+OC8VEwYvHYyc4fIzQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=nd/wpzVtJfaC5QWxHdnhgVOAJV00p/nNKg1yaBROqf/nBQyUwoz9TvZI14nraJ5T4lXj5+rGUjwJZr+IAEFFTe4DWlKzqsZOgYMfY0XF2jbXkSdLGn2V4Ack7BOZylf8luei0KqovFlsu1eluZEmaa5twCtptzppxydG+z0PLwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XxlASPx9; arc=fail smtp.client-ip=40.107.162.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XxlASPx9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWFB0aZr8wYem7io1oHiSiF3tcFQibzmtBGkLjp8HW9XF64gOER3HQF05ow5CtCje7TsSv87J3UmQTCmkOHAvL16eKFOofZErUDnuhgbc6+fvv6lyKSjcFSTXs9S/+2jIHG6V1bxxfpOF1n093MgP4OWjp1DdEnDYfDQoZHvaEZLrHW9Ls8qXUEZYl+MPmgcD+CmrhFMT0XtNZfP4pD+RiylT11kxwP6XT9hY0zym2OneJh4gNm44xv1by4W7OXTgf/YZUtb5/MKISvd35fhzNTmJyQ8MQJc2JR+6rhBaUqO2Hd+u1rOGXYokbh39qU+cf/gNZfHOYRPBh1TWqjVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kTUgeoBSWgqAtHfG+dvff2sEmukUFOAe89sFfcQnLU=;
 b=d+fDp2qq0IetcGHXZ8WTvvpriDKDaE3BWUoeEOfHIPCJ08rdowJBFKGuN7457UFQQ3VCQxwX5NaWRKYnLkj1VUzS9zf8+rOa6mv3RHwdYwjpprMTgLlMOswf5TQzSc04V66PJ6QshzXY9UjQo46LQPldThGbMTBgnf0lS8d640mK+6OpR7mlNsHmGobI62cMN3vCsMP2T5zDVmJkWLAtUSmbNvqHK9N+YGRHBHd9n0+4NYYOpC3RLYirCCtNPWPK1dmLwiIfxMDQjpgkbBv+4QFq+sPdmbt4nrGXHB4ATEOnVuNBekTrSsK/n8drq0bRE2KSmVA0ZoO8SwCtgfamIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kTUgeoBSWgqAtHfG+dvff2sEmukUFOAe89sFfcQnLU=;
 b=XxlASPx94oETyrNXNFmdfRfuwMklZZj+TbdBhsN69MXny+Tx6+To4q7Gb9XYT27betXVU1hFgd+FYLckngDNKxQKpmfny2605/Y3MECpNoRaO1xa0AW6UuA3nvaDGRjSA96XlQ/nO4EMzQh8Oun/bQE6HDCRZQV6joSQnCCqVN1W4Ke4RckWZ1z+Yru2LTw4brE9wB/UInfGSblcRbbmrQubBe/piBjb5ttIYbLNGulzxxEL8QB7spQsHBTkd7qRN3H6cqJl9Fq3sLZRtLYc9cPoeSKwD31Lv4yaoTlPu3r9+Zo7LrZXUyDWxpV1rOJx5IYuGvrJT3rz4yzwu68Nlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7068.eurprd04.prod.outlook.com (2603:10a6:10:fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 11:02:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 11:02:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/2] ARM: dts: Add CPU clock and OPP table for i.MX7ULP
Date: Thu, 26 Feb 2026 19:04:14 +0800
Message-Id: <20260226-imx7ulp-v1-0-3fd611ceb346@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK4ooGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMz3czcCvPSnALdZBMLU0Oz1FQjoyQTJaDqgqLUtMwKsEnRsbW1AN6
 ADJ9ZAAAA
X-Change-ID: 20260226-imx7ulp-c48516ee22b4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "A.s. Dong" <aisheng.dong@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d902b4-f62d-454c-17d0-08de75269545
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	xH1mQUQI+9CoiAhfSnMt2pnE10V4j/HfKhFwkJB51dotxZwdCLBbst0R/xOeqZhy2n28KnChhPpDGB8WaniU1blAqXdYU1In7ujrGgiZf1eZn7RSnBNTFAOyHDmuEpafvOJqxP10IktAj8n+B1weQHYjUl81HrBB/RqDv9Cb4TuSMqNBbBLw2QRRStNMzy/sq+ydns5RdNPv+nHkHypbi5D4QDzCLnd6XcSDMIFx1LN7NC3hpwvAvNj5/6Ef86iw9Iy7jO+wxW80cJ2xibI0p1AgTkgmK+QyUYakdWEz63qzWcS+nbBUEOMfH4fJRkJcQO4dXL8Xzdlqj/xsi7t2HStiy+SxJNM8MzoRyUoMlH5BWgNHWyFvWIkKUtwEY4B0RkBnBCP97P7TNHT8fCh2v5hekeNw/FHU+JeAfl44aiZYxrovrnZD3VuowfPQdC8UbzZtZc5bgRKr0yFMOy57MU6PvJEX3c1By7fzWKX9av5J1dUPehy8ScpeS0GSgZ7f9EUASbJ5fQ4z47lMCC0jjyJst/mJgIWV+7+2R3+QD9biFhJVBEmSKLwQn+ZJzcyiQ3b+FdI1cGLhH+KNsSMeRrKVTZ/JVX0B2AThqXgAHdCuC/F/gROkR34acnd1mg7TJyDv/29Zg28DNpBB6hg2jQiu5QWod5G/nLcQh8NSlgCqgeyXY4G4ReXjRKhjTN4finVBXJ1ceH+uB++vUTKlQQfVfoI9pNzSmSWiNW8Nxs+9Nv1wG5NyIrT4KuhbKeTXMPlZngh7NLTY0MsnYQ63VzhfZQ8uJfl6Si26YWXZEcA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGpSZDllMFFMWnJqenB2aS9GblF5UFFrMDByQ25Ic2ZPMTVCNVNMTStsTWN4?=
 =?utf-8?B?bnhwTjF6a2s2VVZaa2lWU0VucjVScVRTc255UDB3blNuZi9EZFE3UzBGdHN5?=
 =?utf-8?B?M3RER0tSL3NCdVBHNGFja1FzcytkU0lMYXNHWEI5Y0tKZnVaSTV6b3VReTM2?=
 =?utf-8?B?RWllbmVrNGxuN3g4VlJzdFRCSVRCUHl6Q2JISDFSdkZjVmFPb1JkeWxMNGhz?=
 =?utf-8?B?a0Q5Vm9vQ25zM3AwanZmREtyNGFESjE1aU5hWWhPRlhJbzJPMXhFNCtudDc2?=
 =?utf-8?B?QnRvSEwvZGM4TXUwa0FqRjM3UkR6cU9yd2V0WjJ1cElLTVovbFZPTUZoQ2Nn?=
 =?utf-8?B?aWlzZ0ZOazlhcDZXSCtObXFzdy90TjA3M0xGb2w1SkdONUVPVXlnM0ZyanFD?=
 =?utf-8?B?c3FwczFtSllId3ZzNVlJVXg4TW9jV0hxQ0JCZVVlcWNKai9rNHVFMEllejdY?=
 =?utf-8?B?RlhxVDhENWxvMUdnN1UyUHhUZ1UvOUhxTGcwYVlHOUJ1Tno4UnczRG5LVmU2?=
 =?utf-8?B?SFh1eGVDRDhNZXN5RDZrc2ZoVDNSY1JNQlVaTHNNUmpjUitWZFRQaWFzdGFl?=
 =?utf-8?B?bElNcGI4ZXl1Ry91TXVnbUdXTGpZWWcrUTlsRTZJeFY4TDZ2SkczYjBuWjYy?=
 =?utf-8?B?dDRHTER6UkU2OElnYUc4QWZhdWFla0FjelpoTTRkOGxEVURmVkFCTFNEd05J?=
 =?utf-8?B?WWVTQTk2TEFCOFEwZExGMTF5ajFPMDZoeDNJNVFqbEI4MW1ZNkhOZFJacEJS?=
 =?utf-8?B?V2pLc0R6SzdkZmsrTXU2bTZUUE1WS0lRaWNpMXlwcTJYUFJuMmE3SXpld2hO?=
 =?utf-8?B?eG1Ua0Naay9temU5M1grMVJFK0RvZmxoeFVCRGZjSThzVFhPdlZIMHFCVlE4?=
 =?utf-8?B?VG5KY1NhWW5vZ3I5a3V0aVZDYmxqNE5tZ3htSGp2NW9pcnRlZ2NneGl1Z0Nj?=
 =?utf-8?B?cTJ4VVViY3I3dlVZakt1ckF3QzRkNy9ud2tqVGoxd0M2Z2JseFQ0NDZUK1hm?=
 =?utf-8?B?cTk3dDl3ODdGR09BdkRqb0x3ZHk0QVFDVGcvc28wNlh1cG8yc1hrVzc1Y1dV?=
 =?utf-8?B?eDdidTdVay9sU0xXQWd2dlNGUG43STJXTitEUVk2cXlZQURXK3ZEVld6bGd2?=
 =?utf-8?B?M1phNmpzU2VXUVpjNWFTZ3Y5RkorcXNTY0JjS2JsNkdCTDI5Q0hQYnFLVlFG?=
 =?utf-8?B?MzgzbGV2NWJrNlVUT2RnNXVwZDBLdkZOYWdDY0k0UmtkNncwNXBsVWN0dlk2?=
 =?utf-8?B?NGZtUENpcVZIdmExenhMbkxRdys5MDhLNzE2a3NHNVpIbXFMTkZMUWdsUHJz?=
 =?utf-8?B?S3NIczZNQXB6UENWR1ZMdXhkQ0pMclY3djZTaG1mZE1lNGJ5S2w0V2s5Nkw4?=
 =?utf-8?B?MWlRUnRTT0lqeXZlTi9MVmF2bVVKNThpTTFYbzA1NTJ5L3lrZm9jL01nMXJh?=
 =?utf-8?B?UmIveWNqT1F3SmRBa0hyT3BuWlVpWVdTb1BSenNxV01FelVtZVdSMzFPeTR3?=
 =?utf-8?B?ck5vUXNOcVdvbzNNMFhjRGY1Vkl1ZnF5K1NiMFFpUm5PNXNQeVRmcUJsNDBw?=
 =?utf-8?B?dGFNOW01SjlkWW52K1p4cXZzOXZUNFJtcTNtdGwrY29zc2c1QlJHdEJzRW01?=
 =?utf-8?B?NWZGbnYzTlRnYnRUZ1Q5ZExpWGFwRjRxazE5aDhUckovT3psckl6aVlueFN3?=
 =?utf-8?B?S3NGcTgvVmFkZERjakQ5LzBYbGhYWkNHaFhsa09GdHNwUktLdW5ZbXkzbDlk?=
 =?utf-8?B?UWdGMVRGWXRJTzBLV2k5R3FCcUhsckY3WDZTMTdoZkkxU20yWEdxNjNsMXRi?=
 =?utf-8?B?QlVoeVZWWFZVZFpsSmE3TmYxaEIyNEYzTFJCYnRrQ3NCS0dxMkRFbGNiS1lS?=
 =?utf-8?B?RjZvZjdQc1d3WmtOaklzRmc2eUhGUHQzWk8vR0ZxL2I4R3BQZkpxditCRDNE?=
 =?utf-8?B?Y3dzMzVEQW9RVC91YkhBN0JpNHlvd2w5KzdQQTFTVlZkd1VmL2gwcGN3bUlt?=
 =?utf-8?B?OGVzenU5S3hrcjhnM0FWbWNLZmRyZStJc2FxbHVyMk1XUm1aM3NYQ3RRa25m?=
 =?utf-8?B?cGFZV2t0ZXRobGZDbkhFZzRWWS9WUWpXQVRpVHIySkNuRk5zbS9YdWNNb0o3?=
 =?utf-8?B?WkEzS0poQXZqWXZzSW5RS2tGUGQvQ2NlRjAzSldMd2YwMzI3TVFGRzNOdHNv?=
 =?utf-8?B?d2Y3N1JUT3dVQUl6dElZZVdkUGNCRDkrUllidUQ3NUswdGlacGpRMDBtaFhs?=
 =?utf-8?B?S2hEY1VLRm5CRmtzOEx2OXZ1cDVSWmxlYzJXWGE5WlpGVHlBVmtoQy82MjB4?=
 =?utf-8?B?TGwwbUNVUnBGWjRtVCt3QXU3d1ZvODRDTlM3aGNTNlV0K2J5RWN1UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d902b4-f62d-454c-17d0-08de75269545
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:02:50.8863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RU5iQFCUce8OhdeuLqvTePWjVLLNq/tex4a2ZesS2qHzE5F/7h9rbJW6dzQOfNlQExnMmuxLNAudaJnm4NzSyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7068

Patch 1 is a binding update to add missing #clock-cells, otherwise
there is CHECK_DTBS warning.
clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'

And the clock will be used for cpufreq as done in patch 2.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      dt-bindings: fsl: fsl,imx7ulp-smc1: Add #clock-cells
      ARM: dts: imx7ulp: Add CPU clock and OPP table support

 .../bindings/arm/freescale/fsl,imx7ulp-pm.yaml     |  5 ++++
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             | 28 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260226-imx7ulp-c48516ee22b4

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

