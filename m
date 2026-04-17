Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E355B3BADA6
	for <imx@lists.linux.dev>; Fri, 17 Apr 2026 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776423617; cv=fail; b=g/UGAfFyDpSk7kmZFNV+8/4uQTHq5sp35bn5JuX/uMXh783/BmNm4aA4ti9NHI5d+i+vFK9pq+3F96HGeXCzEJ1PXakoOv430MQTJ+eb9KwyHw10uZM8tawmt2WD7ctAsOpHDrPz5wIRGddT/Eg14kMbmFM7wgU6VQY2QZENN4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776423617; c=relaxed/simple;
	bh=y8KajkngJsAaaePI0ZEgxCT8Dpxx0vBL3/s51nya2gk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bA2bORw65vXzkAioBOVe8mgF00AmUxRLzuLbvTffPE0FRXDpkosIYutU/Lp+dAcT1WhCV5Lfswks+tHgox7foEj0pBdw+ykhsiBAG9v7iP2WSYJKU0WLBMb0+epZggd0zfLVIO3Sr9fkHaTSqyVsbfkjgLOiVIGZQfe3YweauYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CuZtCEll; arc=fail smtp.client-ip=52.101.69.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CuZtCEll"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVVxE2zPwISgixh8zKL0MaPtJFZ41jJ5HnGOxMJxrCFRRbgQUyfh4ANFHoJMcIQFfwAzDndgqkx579rPigEBJDvynDkxlNjCzxs+LXlzSBUnMcz6tF6SV1Fr64sdftbeKJfJMEvQ9L1K0annjGcuYQ775FR/KU46FaYDWs7MSKFyKzkQAgycRsYWZjUPvE3IqeKAfY/7lqQUhoZI+CZY/DG9bEK9r0BJ8+jH8OqyaD3LDqBz+OoEgbwsB7IPLnUzcJlCw1/hKWBX8Ra2ZmVrbS6vIPCEdNvyDg9Vxoanol1twXabQ4cZ62x1Rf51Pi2/6cvlevWKM3ywNFT48yyOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSnNGEQc82xSVE7hS0vM3RU6y1qTbAkWRgL0yv3iCL0=;
 b=JWnC5JskdSvFe3h1uf0VMl4+TWeszbBz8i8+IATq/I9ezwy0+zo5kKyjQJhL3HMA90T8m2XFVoxbA0b0Dd1Jxyd+Px2TvD7Fbo1iVkzepPJdOFfnazbMgtyaPeyDgP0SV98RrQsTS2FzIoCW9ECyWDt6pb/uDLwJAjlKyYhHT83t/D3dNAaHa+DJ7B/ap3Zpz8Q7FRlILsAWXi/5HpSqGcCCzMMDUQIblTNfmBnR2y0xSNthY7vi9tiw1kPlDdCgFqk9Z/AyuT9mdDadcoB5Oz9RLC+qfquXgMily8kPYCT4jqD3hgxpiuXkg1HL3D0YK6CG8O3KbcA/Y1VlltIalQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSnNGEQc82xSVE7hS0vM3RU6y1qTbAkWRgL0yv3iCL0=;
 b=CuZtCEllYyv/yHd4PV4xdAd+/Pt/efdIopx3xuXhtgvMS4g0HcV6Xbg5GtLcs6cpac5f+qySMlXJmFZifIuwR5LDdGyavu6m6xuxHz6gW0qObF852UoFlXTerEU20PbmVfjbsMo/QyiuG1sRHQX3MRrctkiqXFxOVOzxxCal1GcmxrA82hXZPUI9xPf4oVu0774kziWl0byy2XSoQo4ui2PEpIvPVyNzgFBfijFZwpuqS9TH6gnvAf6ZpA+plLLW9GzzFtZknIi0jxZYS77SIPH6pEwYUWjrkgtEf3Aed+am7IdoqjBjEUMjsKuvu7ud/9V7SBNaMIApnB3hHGgUXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by DU4PR04MB12276.eurprd04.prod.outlook.com (2603:10a6:10:629::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 11:00:12 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 11:00:12 +0000
From: Robby Cai <robby.cai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	martin.kepplinger@puri.sm
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Enable dual OV5640 cameras on i.MX8MQ EVK board
Date: Fri, 17 Apr 2026 19:01:58 +0800
Message-Id: <20260417110200.753678-1-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::33) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|DU4PR04MB12276:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d503e55-bd97-42df-803a-08de9c707f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	4rATppew7kRvadEZ2G1bzcMIGPkwLlssw/Zvt/FuIYL+8Tk/iYWDAlM/iJ7w9kmrNeob8f/hFJwMgixSG+TCCldiXSZQMEkbzoNqFbpJgMTNfMo2PUD23982YzBQPrRIWECIJZ6PYYSM5IoJlbSjX2bCiG01lOVCkokLvRrLEbsqhRvfUNEqYpmkqliF7Q3oRAjN9uEddHE959FOScpbxUZD1XKNL3cwf+QLtsFu5wN7sybIpWuwCiMWOnYVX745cHMPPqkoRWinrmQAqK6bXZ8ewRD0h62SBGC2n+cXMxws5llilOf4puZtxVIhJ5yK3qAbPjFU58T9a0gzm0nLdNi0FGeM4Tpv+0a0YLSgIBGbSXwcY90LCWy5D5uai6JPysSzRVOHzYyvwYQhYU3wcK60lmqgH8mSyAEbM2q1TIdmrNFFOOSsOetIJaua31wv+gFcJnj+1XPqXxk9gkVTVm61smSKkEhqLhJd02k/SbrrODG7+HchqVbSk7fPMo4kADKmYDFh+qJN9lPoq9AjrZop4OaCD+xBSvDJ8OAU1i3tx92kl4xsODiPX2BV3pG9Y517r8poE0gDUh40+2k6IQZtSiwBlVqKaHmlMNjWJuKBWl8kEhlKxur4ioNf++BRkZGzt22flaH88mwm+QpVLYlSXk5NSi8xPpsXuswU5xjLiOwknc3uCjVMHk7d4jMvee7FgXMeBewKm5LqAA4qx0fNDel2jR40DoFwgOF2oe843G4oMjF0+GLzhRdGLk6nMZsVHZjmdqkdbxKzHos4HpkVXntGY9Aw1Y4eNDWnHRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3crekY2NHdLdTVoU3hNTWpQcVp2aitBK2xLOWRtWDMwVnd6QytIbnpZcUpz?=
 =?utf-8?B?cmJCMVduRUhuZTZrV3BBMkNJWmFDRHN4N1lRMHJGUFdDM3huUXFFNFFuejFO?=
 =?utf-8?B?QWMvdDJ6dFdSNUNBNnE0Q3o2UXNUVHo4UDlHaHJtb0J0d2RGSkphek1jcjNB?=
 =?utf-8?B?U1JpYTRXTytJODdJZE44bzdJM1h6WFhuWGNja0JVZ2hoREVIakViYTBYbHBt?=
 =?utf-8?B?TkFUSG5xK2NaSENObnJaSTF0ekMycHdhcXZRSnZsZ3RwYURtZGpnZFB5WVJj?=
 =?utf-8?B?UkR1ZUJUUlBWMGJrYWlpUitLTTJBdSt5VDNRODNCaWo4enJHQXVBaGNaeXRt?=
 =?utf-8?B?WG5vSm9Xc0diNXlNMEdnc250VjViZjFQNGhYejNEUTBUYzVpbDY0cm5pY2wv?=
 =?utf-8?B?UjNxblg0SUMveUl0ZmFtdzlaR09HV3RxakQwaU9oK3ZUZWJBMnpFMTlFaDJE?=
 =?utf-8?B?YllHTUw0TjhaenpIMlFJMWZRenNVSUlBU0tBZ1N1Y2tCSnI4NVowY3NqeG1W?=
 =?utf-8?B?RE4rUVlac3BKenFDdGx2WmZ4ZjhreUsrMjRLM0tpeHlRK0xhUHRYTlE0L1FP?=
 =?utf-8?B?WGNzdkl2dVN6T2MxcEVzUkw1czRQUEM1VTh0RDR2VzRQRHBiczBFYTdEck9u?=
 =?utf-8?B?cVE2QUZzRGZWVGZGdGxET3FTR0lwNHJPNnVGN1NmTnozSmtXazhCc2hSVE03?=
 =?utf-8?B?SWlDbzR0ak1MaDZEdCtXZmFsZFBhUm1HNE94QXAyZkphZjJzYlE2ZWZmeENq?=
 =?utf-8?B?YWRCdXl6Yi9KdHNobWdQTzhpdVdVMXc4N0h1YzNLWFdxdy9hRi9kV0wxcHRY?=
 =?utf-8?B?TzdtMkNGRTBOc0JhMnNnV09qRndWUHlwMEhtZ0RwYks0eVFkWkFzeFQ2eEhz?=
 =?utf-8?B?TzN4UlNCU0szWStSSi9aVzl2RzBWV09udktsaCtDVHViZVd1MXViWEdoVlRR?=
 =?utf-8?B?M2ovK1BESlphcWoxZUdzaENsR0JRK1BFNXNZUWJOYWh0aU14R0ZrSmlxdWNl?=
 =?utf-8?B?a1ozY1FnZW4ySStZTzRHZ2doUlRmY0J1a1hGSXFtOFAxcVZacmlkNHZSN1dr?=
 =?utf-8?B?OEo1UGpyeEVyK1B4VUpLYXFkMkJFc0lQQTd1Znh4SHhOeHNPQURpZnczZkRQ?=
 =?utf-8?B?MTY2M1EvbFY1MzRkeWg3WWJEWjVPMC85QzNrU0FuOUg1VHI0aWhkOWFyK1BE?=
 =?utf-8?B?SnprS0srZllwcXJaTmZkVkR1d0dNRzV0bjAxcWtnY1MrNGQxZzgwMlFPVk04?=
 =?utf-8?B?aEF5RGdoUU9wY2x5cWNvVEtXNnJNZXlTMnRQcFBBUFZyN1htVm5xMml6TUhw?=
 =?utf-8?B?aFRJYzZUdWo1ZExLd1Y1bi95S1B5Q2pxdis5MlRMZUFOQjFTd3BBdHIyS0h5?=
 =?utf-8?B?Zmh0RDNTeEkxWXJpTnhzVFgxSnFsSEFaeXIyd3V0ZVZ3WStKOEorSUZiRW1N?=
 =?utf-8?B?dnduUFJxSmFybTFCWTRkZGQrVmZodjlIemJHKzJvMGZDczhSMG5naEthNHEr?=
 =?utf-8?B?U2tqU0x1T2FSdHVSZEtaUVR5ZEMrN3Y1cHU0TzFBUlQvV1BDSVRhSTlTWjZO?=
 =?utf-8?B?c0JDS0ZPaDBNT3Ywa2U3YTkxdTRIdWJsQVE0OXdmamFUYm9FUVhhWnlpRXA3?=
 =?utf-8?B?U1A2alBwclgxOW0rWGlYSzA0MDArMk04bHB5VzQ0Rmp3YVdjY0hNSXR1cCtu?=
 =?utf-8?B?QnY3dWxlU09hWVBEK2tzckhzb0hJb2V4RlRJYWV0ajZ1a3BEMW0zL3pSMUgv?=
 =?utf-8?B?cFV1eGpwdHBHUy92eTBwd3paUnVvZCs3cUJMS1BISmtUNjQ2WncwdGRabll0?=
 =?utf-8?B?aFQ5eUVBRWZ4Mmx6NEtwd1FSZjJMdzliTVBMbmg3bW5CTzFhKzVXYy93TGRS?=
 =?utf-8?B?RHpEa2k1NzFuSFo5ZVpiZGdoeCs3NnhVOXpYZ3FNTTFkb3RuTUNTQ1NWWUhE?=
 =?utf-8?B?d0NKQlRUSWVzNndVUWx0aUJsTEZkeUY3V1JmdThuT3dxQUxMRDR1S0tlVHFi?=
 =?utf-8?B?NFlDVGVMcERtRTFKaTNvc0NwZlA3Smt1QTZvSkdjWHhlK3dWSUhMRnhSeUx6?=
 =?utf-8?B?WTZVN3pRSEtpazRoN25oUVZwNDVjNFIxQ3JDajUxckhMV2VoeXJxZzFzcFVZ?=
 =?utf-8?B?YThBTGEwbzl0UTJiNk9HM2w1bzdvQXlGQUpIM3UvNUpoRnVDbFh4TFIvR2hk?=
 =?utf-8?B?c2VFZG9VTGFCNGpKa3hscVh6cFhpcFVyS29wWkRScFRaTjBaOVl2TVFrOGE4?=
 =?utf-8?B?TEZoY1RlWmdFY2NIcEtsTXpPOXd2N0FzdHJwRTdoL01NWU56VU9TNEVqQWRL?=
 =?utf-8?B?UDVxdTBQcXZsRE9EU2phdy9QYmtjV0tHWm5HVTg4eHA3QzRBNWZ1UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d503e55-bd97-42df-803a-08de9c707f9b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 11:00:12.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmPMiW2D7OgxI58v1MNRCN1X30lxGebot4i913gyhXJxhoqvCi0WsxEQxKqkxBWtBZoQ+cc3ajzzhqBGP7SO7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12276

This series adds dual-camera support for the i.MX8MQ EVK board.

Patch 1 fixes the MIPI CSI clock configuration in the i.MX8MQ device tree.
The previous configuration violated a timing constraint defined in the
i.MX8MQ Reference Manual:

"The frequency of clk must be exactly equal to or greater than the RX
byte clock coming from the RX DPHY."

This mismatch could lead to unstable operation, observed as intermittent
capture failures. The updated clock ratios align with those used in NXP��s
downstream BSP and were verified to resolve the issue.

Patch 2 enables full MIPI CSI support and dual OV5640 camera operation on
the i.MX8MQ EVK. This includes enabling both CSI controllers and their
corresponding MIPI CSI-2 host interfaces, as well as adding two OV5640
sensor nodes on I2C1 and I2C2.

Note:
This series depends on patch [1] currently under review, as well as commit
6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly release reset").

[1] https://lore.kernel.org/imx/20260417080851.489303-1-robby.cai@nxp.com/

Robby Cai (2):
  arm64: dts: imx8mq: Correct MIPI CSI clocks
  arm64: dts: imx8mq-evk: Enable MIPI CSI and dual OV5640 cameras

 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 149 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi    |   4 +-
 2 files changed, 151 insertions(+), 2 deletions(-)

-- 
2.37.1

