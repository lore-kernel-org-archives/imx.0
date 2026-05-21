Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF7040626E
	for <imx@lists.linux.dev>; Thu, 21 May 2026 19:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779390989; cv=fail; b=qb10yC7h9kKPI702riV4RmlzCSF4j1RQquaIHvyBSGu0HjuHu1A8iJ+nJIRK6THFdJtq7lcxLQI2/LnP35n/VNX/UqpsfYqE8hVY9WpMau+sxlcwscBnDaCRNj3ZmQsNU0ibeAxER4Orvj13Ixu8phJ+J8FY9D2O39pO/X3zuPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779390989; c=relaxed/simple;
	bh=oIwmWo8LbFIOIx/Dsfiodi9S5wPtclmNTcNGKH1eoEs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UwnvbY30JfNiqOcuHDH3qrlmbLD5pmBtdSvvwttqyEvwO6RMuHnefdaaO8Df2ZAoSudQqetptjZ+OaIHeQ/BA+Wglp3cU2psfLhXHoXTD3ceJANfDh0l0qEEfkQCHPaT8wgv3DX1bekwoShd2PXAr+3zKmuVhgFwjnRxdyiyYE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z3cEfcfL; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z3cEfcfL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdZzXiSNKQ78Dt5+iSz0s0X57eHVI25LlRK5RsorHuHgrDD1VfQ8K3aLjXxemYl/iBmSN4C4P6rLorJ1zHGuDXkWGGYQJ0D1Tf0U3xk4L4MBAy/eCgsIBfF6HqV1GQuQ1RGWZrMfkrkFlPFHB/bM9BpgDNVurYb21ZfXJjjDiFGWHtUzs7WghQiqrUcP2NBvNgqQjivTOBIy3bvtl7Zk16ObwpwhG6/ek3p4ulCoKz+ACvU9Gg9W5eVeA+g2IWK1qExof5ioH3bNAq7MOIrSeWvqd3bOAqtS07Qqo8LmVP64bdviWu5YXJYPP0PtGs7sd38qbP/0iDrkV65+pDHYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqIyrkh7paf6bOXm5XDgPQ+cfxq2y4Febse6qjrPeD8=;
 b=A/fXjBB7I5Y1nKAZ/vaEgKfUk0bEGahDuUvG0QomYeVSVARAIUBWnQwsxd1K3pcbV2B7Mw9LreFqQQNVQt0Xp91Fe0hVUO87N5A12G7tlQqeqQrSrsH5oYTBqDReNNW0rLjn9pY9XAKH3RY3+ncJshdyJn2JV3TkpOoUOndcYSstVeEUSe4U6WzMHB7Xt1r6gp7g3AsebUEmpX3UJxKv08ml4nS1zy1qB29cpK+55/St6t9gKWWjKxhhUaTWSNmBC4lyMq4wKB9Se68poGQOzxe5et6Rp4g49Kn4uI9L3lulY3A4Lh2OMP5mcmn4gkqEEXvBGx05gVtvyrI0XFiYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqIyrkh7paf6bOXm5XDgPQ+cfxq2y4Febse6qjrPeD8=;
 b=Z3cEfcfL4jmGz8OaGeFKQ63PE+5ISvnnh6B+APs0OtJ97MYj4Nvnyxrd9yDjjJW62iFonXobZPZrIUKl6yUNBRF2VzZWD0okoYY/rYb0KU0z+QtGlkMnxjLhQyL34HFnn09AhvjGgjzCa+Uf46iDifYMl4j7nss1gcIb2+Nak/FVQZ3wWX2kgbgQ4qBV8N/qg6NUDNDRuCNInu0z3/YcDa1gt30yMKE1CAmSSOI2BA7SNOMm8DLA2YrB1HyAo0lnWYyUgDOoDE3ARq/8euiy/szvBTTBeMAHTgRYrf7VSe6IfDqT6PkaiZ+odp30AIRYQCgsn6i2kf8jjn85zIHoFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 19:16:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 19:16:14 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 21 May 2026 15:15:43 -0400
Subject: [PATCH v2 5/6] ARM: dts: imx: replace undocumented compatible
 string edt,edt-ft5x06 with edt,edt-ft5206
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-imx25_dts_simple_warning_2-v2-5-c6557df516a9@nxp.com>
References: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
In-Reply-To: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779390945; l=9357;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=HRi+bEu8D55tvNF1xtjQ8FCOxO7g+wz9PHX1mzIbv8g=;
 b=Hgzg7rsJnT5cqc7YEO/7lhn3o9j2LyzZd5STSgCA7ghX+JDuggyCz6zFIVP4M4rSJGpFIGy+M
 DAr+uSg/i/5Dm/rSTLhHVHJtw3HKJXNvr45NRjBO0UmSK9Wy8e/JktS
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11261:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4c0412-43ec-4567-6c52-08deb76d6ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|11063799006|18002099003|6133799003|22082099003|56012099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	JZOnpLXp4AHc6pUF311GWgiKbdBkkOKXnYN1iOJHhg4MP51A+SFKtdIoPj8JrpBfoBWqnI46wXJeMrngiz74S7ZqUzzoSqkAhi6AGnr0MEHyHCrKINVG+a6WTVUs4osqzB+be4NAy/rDV8QwfKTsVSaSuOnowjRDyMrS1DajXQgtOeM40MNdHv+l1DOclr2yCij2P/Tc79JywlV14zAViMu7v2Wc9sLjCRQm4mtIhBu+76075uiStKEX7cgiFr2LJHoEVnS0XDtORTQ7BtBf0Jfl8CWQmM8xsAlEpPq8Ddw9jqSncEAu/OWEercP3WjUR2E8/o3zpsjICNEJS1rbdfDsOTNgY2hDMIpAPRhJohwaUNPeKENpzlaB+gZ6zrvXmIt449qvB3+LHwK9vlQGpx4MWtvTxHDFoiDINhzqDkV8+iQzjnn3+IHruKrfpxnoHX/oxHYjmevdInZYc2RTwh+Rmda/aMKcguYbQCv83SZWqhYH7nkUFuDZ4gGW6Ergt+Bvf4Kn41m+/bgzgtzCzM1EFZhziK7W/Ds80N6gwF1EdpYEdMgVvf5Q8744qk8SvHxdm+6UsefUYY7rS4crTfuCEZyPsOu7xE229YAqBFmltBzDmiimgUFqth3sHuWb6cTnQ2Voo8M3dwui63RlUTOhr0GCDdGLJ+qPZdkVjwzERzHwFgOwENhTarszU6OF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(11063799006)(18002099003)(6133799003)(22082099003)(56012099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3dUbGJhU3BhNUtRTHRta3lkS2dpMFppV3hHN0pXS0l5Vms5Z1N1MjlZN0VJ?=
 =?utf-8?B?YXVlNTlXb0RCV1RCZ3ZKOGozUjBlNFQrSmk2OHVud1AzUHdhdjFUdUpqSW1J?=
 =?utf-8?B?My93cDVFckREeXgyaUwvb0syZy9wd3BxcEdIVGo5NGx1djZnK2RXWFRjMjhV?=
 =?utf-8?B?WUF0N1VhMVlhU0tuenUzUjMrMjBkTVpPeko4V3JEaVl6L050T2hoanVHcmRC?=
 =?utf-8?B?L3NyNXg2anYveklVMHIyQUxDZitxTmhGMFRqcVJ0Wi9vSjFYbmRBNXMyQVpT?=
 =?utf-8?B?NzgwTWI1R3BDMExtQ2YwQzFRUGFsKzhRdkR6UGJTTnluOStQRUxyQWxPZXlZ?=
 =?utf-8?B?cnRDVElVQU5yS0d2R2RTRHYrVHR3aE9LNUdWRjNaTndpNXhOcDRkMGpxa1FZ?=
 =?utf-8?B?UisrSG84L1pDek9NTklpc0Y2aTRIZFFRTWNkcUZIdGZxNHY1dVEyRTBHdTFO?=
 =?utf-8?B?MG1IWnNmNklwcmwrMFBNTEdjdHptL3Vudkh4RnZtd0RnZzFPdmtmeGZJa0ta?=
 =?utf-8?B?ZmVKdHNmWi9yN1lDUERqME83YVF3eCs5RnVVU1Uva3F1eUhiR2orTHVrajZl?=
 =?utf-8?B?UkxCNEFNa2dOSjFUYVVybmx1c2xNNVFaYmtWV2t2TS8xMyt5U09lUjg0Q3RI?=
 =?utf-8?B?K2FORW9ONG9QQzBrN2JJbUVwTUhFak5FcEhUYW5GeFBxMyt2NE5RcVBOU0N1?=
 =?utf-8?B?UWNRS1BMaTdQYVR1dlNlaEsyVUpRNGxnOHZFUVlIQkNPQTI1OGtwNTBQS1po?=
 =?utf-8?B?Sm9WVzBFTmJleTVORjVmZmJ2VmNhUDVSQVlPT2lDcVpqaVZ6WnlSeEdwbU1k?=
 =?utf-8?B?Q1JxYXhkYk93ZTE0aGxlTVFxa2RJYXBsYzBpYlhTOS9vUjRUcTlldkdqL3Fi?=
 =?utf-8?B?SmgxRTM5SzRPbXBjQmZFV1BGWkhnSUxvY2ZiZXgxUjM0YmlFUnlRa1pnNUl1?=
 =?utf-8?B?TkxTTkhOZVZwSDdldTYyUStnUHJEQUMycjVESmcrL1M2UWdYTVQzWHlFUG81?=
 =?utf-8?B?cUhETTFLeWlNSTVJSXVhbjNBL05nb0F3dy8rL1lERmdGbzFrc2ZjNWhCTit6?=
 =?utf-8?B?MHRKYUNWbmhseXhDVGhrSk1HN284ZDhTazdEQmFjNHhNQWFEaG1uMEwyeEtU?=
 =?utf-8?B?STJVYWJpRWNtdVA0T1l5SDhNbDhwVmlBUndGaWkza0tOYVUwakJRTlUySGdh?=
 =?utf-8?B?SFpVRXFMeTFNTlQwZnBUWW9VSnkrb2x3S2pQSVVOL3Mxa1JVTGQ2N0RiaUw2?=
 =?utf-8?B?cDVoZUlhWTBkdThNZWVIYkhUWWJHUGFoeHl4SUFReU9PajlpSUdvZHZsdlpp?=
 =?utf-8?B?TThnK2xVOGljR3dWaVRpeWNBR2xVeXZ5RzR1S2kwdlpHRXMvYkl4WmhXMGx3?=
 =?utf-8?B?UlZqc0JsemFUMHhjcVQxVEhhVUo0elF3U090bnVBTzkrN2V3Y05VdG1IS0E2?=
 =?utf-8?B?S05FMHpPR2p1SExmdVhxODljK0ZTR2dhTGtVVWZOTEdlakxVU1diYlhHb3Zv?=
 =?utf-8?B?UGpZRXNMTlRDQWFldjdPMnNaNG94a2FhM3M1eEtKNUV0YmtKQ0dRcDk2K3Zo?=
 =?utf-8?B?OGlwZ0NjQUFMM0xiQ3orc3ZRc3NYUUdhZ0NpT1RxbCtFUmhQTVlhUm85RVNk?=
 =?utf-8?B?TU5WdEZMdlU3WDJwRUJYTjdGKzJVYVpCYVo4ZEZvbUxNSXd1ak9PbElvY1lF?=
 =?utf-8?B?WXErVGkwdEZkWXhxQ0RQYkZBOHNEQXFMU1hUZE1Bbk9TaEMrUlc2c2Z0bHMx?=
 =?utf-8?B?UUN3ZytmNmlPb3VaVmpNZkcwVkh2SDF2Qkd6VG9pSC9jZlN4eDRFL1Rna0F6?=
 =?utf-8?B?bkNvN0szbGJsejFoR21HOW1xZENmVDJ6WTY4NTU3Z0tqWGo2cDE5MnFBUzF4?=
 =?utf-8?B?Y0hOT3lJYzJoSGNhWXZzTnBDQ0o1eHJKYUJWalB3QmlUQUFDNWlEN01qWU90?=
 =?utf-8?B?dkFaeGFVZW5lOFpzRnkrZGphQjY3Q1hBVVd3dlBBVFZpd1dMcnpic2c1YkVr?=
 =?utf-8?B?NkhMczBPdXJmZ2tjTFZPUnBZWXZvb1BqVktaNXBISjhvYkZ2MDlhSXdlTGlT?=
 =?utf-8?B?dXRzb3FwK0ZscUxzZHlGSjV0RlpKZ1FkVU5uUkcycGo4NnpyVCtoZWFreTVq?=
 =?utf-8?B?QWpRYW5vRy9sSkZXTE9lUWZwdk0rdGRJbjYwUHBoVkNScCtHWTM1aUkyTE4z?=
 =?utf-8?B?MnBHazhJanVqVVViRHlvL2FFT3RnVGhXZHRqdHBSa0NqUGpNVzFwUGNsblBk?=
 =?utf-8?B?QTFkMEg3QUpTRnZZWFRJMkt5akZnRG5mZVVMVmRUeTR3YUJhVlRFQUJTcE9V?=
 =?utf-8?B?cy9NVEQ3T0hMbVJoaXNqVC9nY1QxMXpCazFYbmFGNjVJMURjSWRUSFBkamVR?=
 =?utf-8?Q?jHkDakXa9ek9tEUcFwSNUgr4LdfU+57xFKTXd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4c0412-43ec-4567-6c52-08deb76d6ce8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 19:16:14.2675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGouEUX2F6AUeyvJ3I98fBhM60ySye8c4Z0ccg4oTCpemG2mSJnhqeVfd9sA6/4/JM3eedv/bkb1pxbwKFLCTGjcB4gk1VS6iFqnjWRbkOBTeO2DOL9vEi8Yd/FJRfSZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261

From: Frank Li <Frank.Li@nxp.com>

The edt,edt-ft5x06 compatible is not referenced in
drivers/input/touchscreen/edt-ft5x06.c and is not documented.

There is no publicly available datasheet or binding information that
distinguishes edt-ft5206/ft5306/ft5406 variants and the driver treats these
FT5x06-family controllers with the same configuration model. So switch to
the lowest common and documented baseline compatible edt,edt-ft5206.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dtb: /soc/bus@60000000/i2c@63fc8000/touchscreen@38: failed to match any schema with compatible: ['edt,edt-ft5x06']

ABI impact consideration:
Not affect Linux kernel. The I2C subsystem uses a legacy fallback mechanism
where it strips the vendor prefix from the compatible string to derive the
client name, resulting in edt-ft5x06

	{ .name = "edt-ft5x06", .driver_data = (long)&edt_ft5x06_data },

After this, the driver was actively binding to these devices based on the
compatible string.

Known user (U-Boot) does not parse or use edt,edt-ft* touchscreen
compatibles.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- update commit about ABI impact base on feedback from sashiko AI
- add missed change in imx6qdl-nitrogen6_som2.dtsi (sashiko AI)

Change binding doc discuss at
- https://lore.kernel.org/imx/aasmQiZJO2gSKzNH@lizhi-Precision-Tower-5810/
---
 arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi             | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-hobbit.dts       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-pi.dts           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts            | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts b/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
index 2acbc86cabb31..aa1c7e5012c6a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
@@ -248,7 +248,7 @@ &i2c1 {
 	status = "okay";
 
 	touchscreen@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_edt_ft5x06>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts b/arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts
index 872cf7e16f20c..6a1063c455f0c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts
@@ -201,7 +201,7 @@ sgtl5000: codec@a {
 	};
 
 	polytouch: edt-ft5x06@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_edt_ft5x06_1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dts b/arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dts
index 0225a621ec7a9..ccf6a048c9184 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dts
@@ -169,7 +169,7 @@ &i2c3 {
 	status = "okay";
 
 	touchscreen@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi
index 610b2a72fe825..cebfd622df688 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi
@@ -256,7 +256,7 @@ touchscreen@4 {
 	};
 
 	touchscreen@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
index ef0c26688446e..f8a7218b13ef2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
@@ -405,7 +405,7 @@ touchscreen@4 {
 	};
 
 	touchscreen@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
index 03fe053880ca6..fb1c923c46bca 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
@@ -326,7 +326,7 @@ touchscreen@4 {
 	};
 
 	touchscreen@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi
index 6a353a99e13da..9fe52e0ca7aa2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi
@@ -333,7 +333,7 @@ touchscreen@4 {
 	};
 
 	touchscreen@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
index c39a9ebdaba1c..ca4cb986efbc2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
@@ -217,7 +217,7 @@ &i2c2 {
 	status = "okay";
 
 	touchscreen@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
index ec1528ff3ea01..fe25934e06b1f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
@@ -292,7 +292,7 @@ sgtl5000: sgtl5000@a {
 	};
 
 	polytouch: edt-ft5x06@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_edt_ft5x06>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-pico-hobbit.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-pico-hobbit.dts
index bf7dbb4f1f3ed..e99ba04216b86 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-pico-hobbit.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-pico-hobbit.dts
@@ -62,7 +62,7 @@ &i2c3 {
 	status = "okay";
 
 	polytouch: touchscreen@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-pico-pi.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-pico-pi.dts
index 6cfc943a8fa3e..f79090fb2e6e2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-pico-pi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-pico-pi.dts
@@ -65,7 +65,7 @@ &i2c3 {
 	status = "okay";
 
 	polytouch: touchscreen@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
index 1992dfb53b45c..192c6a95ae589 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
@@ -317,7 +317,7 @@ sgtl5000: codec@a {
 	};
 
 	polytouch: polytouch@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_edt_ft5x06>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts b/arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts
index 347dd0fe4f82e..fca8aab9d8507 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts
@@ -70,7 +70,7 @@ pca9554: io-expander@25 {
 	};
 
 	touchscreen@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touchscreen>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
index 62221131336f1..673bbe49de525 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
@@ -49,7 +49,7 @@ sgtl5000: codec@a {
 
 &i2c4 {
 	polytouch: touchscreen@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touchscreen>;

-- 
2.43.0

