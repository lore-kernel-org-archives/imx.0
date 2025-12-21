Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021122.outbound.protection.outlook.com [52.101.70.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FCA296BAF
	for <imx@lists.linux.dev>; Sun, 21 Dec 2025 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.122
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766316558; cv=fail; b=e2j9udWLatuSkiDNmAb2SkxavrPEea84/pzeZ1/0Z2OfmOHox3kRRRLizG0ro6i3W1aAEVZnFqCgKCnqVFu57Daubcp1llCmuLkdzlkl5GJ0HU1fpw669N7U3y9G5kJ6vW4iJlBOG4to4aCXZOltd1b1oxVPZfjHQz3IOOU7Ufs=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766316558; c=relaxed/simple;
	bh=2MfKhbs53mUFk8mRL907ZXmsTcUnBg9oBHloK4eeTrc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qX2VOWYsb6cqIZIrR1jP6EG35drgmG3durf3e0zqG0bSUGsBCxnjNLj+so639aAuavMueBPx5Id23NtoO8NAbSavX841eINLJqWpPwNG0NNLD0hb2nkaSAzBHqWS9GUIEN9wziNkmpCc4reDkJtWVXIL95NbSqM/VdVKegMhdFI=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=KOrSex9I; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=KOrSex9I; arc=fail smtp.client-ip=52.101.70.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="KOrSex9I";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="KOrSex9I"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mcToUzE4mDihTsRP1YjJ4EzUNOghrymUYAjyWQY1i6ldJ/jWDmpq2XtxMORfqriRhAm4CIon192i/ZulZ6jxSGJ4ptC4/PFL8cxVXSoGVLSy+hUUKqaNu1MHqQmhjQOSNoo90iYjN6rhglKzOvIsG6pD1L0kHjCoAQsrLzHuZlMZAqexycHy0Yk5s5EWgQ9jrRRqDjprWA7ZtuiNdfQTGj7KnU4gq69hmFk8lQFdFXPT8nd71MaFaRg6kbBP3XbZfGfW8QIHssce01JT7A12721GvW/O0E2CE9QDh3koF8IZhz14LjpMSZFy8tl8SEQTGA18q0mehaELdwNsSH3GCg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=kOhjmq4uCSJqYe9joivWuP1PSr9FuhzD1PBI6H2vc91tCz0LPI25uNrNwyylZKytfLgyXPPk0Ni5P13XoYE0bWnJXmCxxp335+9G0rS9kODnrUNGxPlvzAgdHEaqVnN3X6WZD/ueIibheNecNjH3q+auJ8qAM400XsjcuSJx22pQOglmIGheT6sgxkf/S7TeET761HF8Vtp7tBmS9sTDKel3xx7hU8x3IlPaop+7GEdPxJ400N3pT3eesfdJLwkXT0WFEcqnQVxjKGOwiWQr8DTELBtdbZ/4bF4x3r7ya9aDPPmiAQ9xSrVwRj8uVPg9OuO2eer2NRufzrxgVdmWuQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=KOrSex9IFA8td/0/ZWQIxzFw0Xp0FLLrCcgd45p8qsC0xdYy23/98HUq047VaTwdlRRI6/u+OTc5XrgPFjOaIH2I0P5I0c54g7pgIZ2aL8RHsSgV3IYHLvBpfPbJ4hvA6aVpYqr8BCki58xjEl5xZqmm7EonpcMvfB4VAethmx8=
Received: from AM8P189CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::18)
 by FRWPR04MB11104.eurprd04.prod.outlook.com (2603:10a6:d10:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Sun, 21 Dec
 2025 11:29:13 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::b8) by AM8P189CA0013.outlook.office365.com
 (2603:10a6:20b:218::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Sun,
 21 Dec 2025 11:29:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Sun, 21 Dec 2025 11:29:11 +0000
Received: from emails-2443758-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-225.eu-west-1.compute.internal [10.20.6.225])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 41A5B800C6;
	Sun, 21 Dec 2025 11:29:11 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1766316551; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=OXpmWoAwFtN+58G6kddhvi5cm/UcaL70V38unsLq8lkvUKtWkz8NbkY9KLw57xFrJReKL
 s36GXQrfsDziKrwFRET8HGda4RAcNWcub7f6NwFJRPTYd9Y5Vgpnm4UtR66+QzjCeqd2fXQ
 IM9KFrbks+0jm2FXqDy4u8mLUGZI7SM=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1766316551;
 b=GinWKhkMbdxAp0A05NdCcaIZJJKczsAREygehpJe9TjbdwO9MN+OPqeSJDqws0VZbx/Ur
 jCFJG2X29W92Uvrqhu1xfCwr17i7/uG5/19dqoGWqGXteWo/g3NIOth6NjuLjzrmAlpprbR
 rxRELCKpXha7730XyuSJCO6mesX5HNM=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/dutk7pF87D4lpFfeYohq5hgllaRZw7nDGun4sXXTc8YIfwBrQxol9hDLswszRQLWtX6HfERJfvzx7p5r8k1dJ4nh7ddZsZx9lCutv9w+5hKx9I5Gnak06PW1UlpLhKv6mDLstiaQLv/X9raQD8JrzsF1aPLNOX3sMcdY5JicTbl7l9BwvMlQJxxyhR+GDUsNLcOoDflEVbiJacLmdIODGA35wFDbQPWqZ8E0TB7FRfjH1lTn93Y8IoM67/6pCssuS7FqwgWyXfaTOBuy5P2hhx0/Bxnl5zQ2eN4w4WSaeGuHl33r6q6uqYR68eitWEV1EZo0ZPhibtd8T6pgo8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=ATew6TbTR1EuhBVUX/ee1iaupQCO/TeBFqUnIT+IZCiKxt2F6nNI2g/a4ueOfvgTed73sBBkcRKCab+50ljUXlBTNn9xtR5xMMqATRyxY8FqBTiGWqOSiDdJbeYDK9DVZ4mhTcp/XRAS5da+oD+oimmZjEws/fyZy3hS94hBrn4nOCY+W7nQkHlRTZ8lwIQ4qK4zOfUcH78DRbjpBeih/aAlwa6wTQE/PylUOfGAKGKotJ1bBeQK4rJ8O6157F8MAfeT8hYPjYCpUEkrF3KdAPuU4jJyMWnr4+ySj+Wz7AVLlCBkD3CRzuuL5xmdYrqy3HKKSOYZrDSfYjRQEfshtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=KOrSex9IFA8td/0/ZWQIxzFw0Xp0FLLrCcgd45p8qsC0xdYy23/98HUq047VaTwdlRRI6/u+OTc5XrgPFjOaIH2I0P5I0c54g7pgIZ2aL8RHsSgV3IYHLvBpfPbJ4hvA6aVpYqr8BCki58xjEl5xZqmm7EonpcMvfB4VAethmx8=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV1PR04MB11037.eurprd04.prod.outlook.com (2603:10a6:150:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Sun, 21 Dec
 2025 11:28:56 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 11:28:56 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 21 Dec 2025 12:28:52 +0100
Subject: [PATCH v5 3/7] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-imx8mp-hb-iiot-v5-3-4a4dad916348@solid-run.com>
References: <20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com>
In-Reply-To: <20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0433.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|GV1PR04MB11037:EE_|AMS0EPF00000193:EE_|FRWPR04MB11104:EE_
X-MS-Office365-Filtering-Correlation-Id: 184cbaf5-b8c8-400e-0f37-08de408429f4
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UWhzSnEvU1NieFNEcmozRnlXblBWNitzUmlwOVlJZU9yN2txR0Y5eFBQWllL?=
 =?utf-8?B?cjVTRDh2MitaRWRvekZ5KzFXbDhiYStzZmUwTkp0cy8xV2hJcmdpbGhkbW5l?=
 =?utf-8?B?bTB3RGlTcTVEU21SdzVSRVNjR2NhQjYvaHljNVJieUgyZWltZkc4QW5lYkRv?=
 =?utf-8?B?K0VKNW00N3NzUk1EUGEzZTRoWnZ6NmVlNVdJMDRwY3MwU05KajA0VmVPSVZm?=
 =?utf-8?B?OURiRm9TUG1NbzkvNjl4MFQxS2N2QUxIR0dhV2dzNHZndGFvY0doVE5BRmRX?=
 =?utf-8?B?cXV1M1hRRkJCTnFLZ0NJVWF2NHVNNmlXMmhYOWVmWUU3ZzBEWEFHbzhqbTlT?=
 =?utf-8?B?Vit5Ry9HZG5lNXA2bnA4dUlBM0xObHFrOC9tSGJCdHZmSXlBc3RmWU9RRkkv?=
 =?utf-8?B?MFVIRjRxeVJ5Vkk2RWtFUzF2cWRPTXA2dlA2QUhuUE9IdXdEZXFkUUhjcFV3?=
 =?utf-8?B?MGZBbnZQT3R4SHFjUXJOQ2VNZGNaVmUxM1NHK1JkYnFsUTNZR2RMNm5OVk9X?=
 =?utf-8?B?cWs2WU5rNXVoMzhsMUp0Qm9IOElDUnZLcFdobFB4MW0vbDhsVHBIcjBPZXBC?=
 =?utf-8?B?aFFWZ2J6TUI0UjVMaHVkVGFnalU0WjBtQUpDMEJ0azJOYTEweitDNHFmWFFJ?=
 =?utf-8?B?OXBUQnZXWHlGVGhFeDBIUjlaTnZHd24vc0R3S2x2V3UvKy9UQzNKSittYWZ2?=
 =?utf-8?B?dUxQMEx0SGNCQXQreUtTZjNYdHJ6QVY4emg1UlRKbDZ1WmduRDF0bHJGa0h0?=
 =?utf-8?B?UFdiV3F2bFF5N2s4c2F2MlhHU1h6K1ZsTzh1VDByVjBUcnV1a0M4Y0wxdysx?=
 =?utf-8?B?TmZMNHpPckdhT2JlZjFlb0lBMDczYlFjd2h3NWhlaEVFcjhQM2pIVFZDYmQy?=
 =?utf-8?B?a2tvSW1hbzBPdXVoZ0pMdDNFOEpuVU5pV0J4L0JxenhiSmRjdUQxa1paMVVZ?=
 =?utf-8?B?a3lkV28xc0d0U2xmdkgwVTg1NEQ2RHVQZWFYdzZOdW5pbnBQZ2tDNVlVREVW?=
 =?utf-8?B?Y0F3aDFFV3I5L1ZyZXRydktKamVLdWVwT01sSlNpQUdQdkNPUVlURkc2dDcr?=
 =?utf-8?B?RmtSMVRiVEs0T3BZR0xrSTUwQXhyeDVBOXFGNE14elIyWFErRzRMK0xtTy9I?=
 =?utf-8?B?OGxORktoRklqRkFqZ0MxZS9Xc0p6UHJFQ1hhOWM2SnlrbzAvVEM0NWxBcTJV?=
 =?utf-8?B?ZUFXaFhpMERYTHoyWWIyOHJ2b2FPcEN4aFJ1ek9iWjZpOEc1VUh4TmdBMDBT?=
 =?utf-8?B?UnlRbDZzbDFHOWt2Q0d6QlUxMHQ4ck1IM3Yrd3pNT3NpUjZpVXdRbDJFWFM3?=
 =?utf-8?B?emVxbTRuUFdsVzZSYkNIbTd5WjVlQ29RWVFMY2dqSDgwcGtNdWx4SE1sLzJk?=
 =?utf-8?B?SWlUcUZEK2ZsbnZjeDVHL3VGeGdHRFI0dmFnbWYxSjYwbmxDdHNsZ0U3dTlF?=
 =?utf-8?B?WHhnVzJWRWRSUVlrZWRhNnBlN0FaRVUwMFJ0MHc2VTlGcVVIbmZmSmRrK29V?=
 =?utf-8?B?eHNzZFlJVDBYVFVacUtWaWJubDdmd04zeDNqbWp2VURvWjl4NEI2YlBRMGQ4?=
 =?utf-8?B?VzFOQXU3dlNPenZiT1Z2SEU2WWg1MDg4MTNvYUFzR3lvSnlLSUljYmlKTEtG?=
 =?utf-8?B?NVJLSTFsQW9SaTRCTWl5OWlXWXdEd0cvQTcrb3VQa2U0Kzd3UW4rZDdQdFpL?=
 =?utf-8?B?cld1cDVseVpZSW9LUW1WYlI0b0dGYXBGa1hsT0RrQWZHZWUvZmxiQlRZQXp2?=
 =?utf-8?B?VmdGR2htcE9ETU1jRFZpaVNYa0dlTFBralprd21IQUVMYkpkMTBtc1VWbXQx?=
 =?utf-8?B?VDJRajl6K1VhVFJ1eUJpT1R0RWc4U1hsd010ODAwKzE2clJEbG1jVkcyN3lj?=
 =?utf-8?B?b29WYW00MzZaa2l0NmQwdEd1NU82bDVVMVJaWkU2d092YlJxTmZaRVI2c0Vx?=
 =?utf-8?B?WmJtb2ZZVS9oQVc2TnlpNEFlUFR1Y1NDWTljZ1A1Z1lwVE1udzVzcXZEcXNV?=
 =?utf-8?B?QUhwOElwVDVuZ05oRER3VHhZMGs4L3pBcmdUc2xLOGE1L0dYK1AzRXZOMkE1?=
 =?utf-8?Q?7Ba8hc?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11037
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d035ddeaa5b947f09f13226be1160cf8:solidrun,office365_emails,sent,inline:496ecece1675cc50818f13340f6c7d29
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	28231fbe-7dbc-4bed-a341-08de408420cb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|36860700013|1800799024|82310400026|7416014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VE1Sd3RPRUNVNy8vNUlRenZlMGk5NEMxNkR1dFVXN1FqbHV5SFZ5QlB5ZGhm?=
 =?utf-8?B?M3U3VXd5cUFOQjRheXRuT1IrOXZ3YVdMS2pIY21MVVZNZnU5MTNxTjJTNDhP?=
 =?utf-8?B?VC91THJFR1NvV0dEUVRFak96VFpIVm5BcjYyTWRUYmhwNzJoQmZvZU51R1Fl?=
 =?utf-8?B?YjhNb1BORXh3bWV0QUpZY2VlTDZhNU1EbnA5V0NjREFSZ3NTNTg0dXlaNUxB?=
 =?utf-8?B?dzBldXFQb05CZklMd3pKc0VTVlV6MGYxNnBrTTIwcVBvR3hCV3lpRHRRWFQ1?=
 =?utf-8?B?WkNhQ1BYNERzSzFqaXpDYzFHUW82TWZUL1VpclFyR0pLUTdxMTlWM2NORDZx?=
 =?utf-8?B?WWZtWG43V2ViUTkxcTl6THJxbkNGNVlYZ1FFZkNXZ2gzdkcyUk10b0NNdHFT?=
 =?utf-8?B?SktIV2I3NlZlbXZwWUtVR0FUNS9TemFOK3owOGxXZ0pjdVVTK3l0NXdESDRO?=
 =?utf-8?B?MDdGeGZRaitReUFqRkZNbjdmNTlrN2pET0R5VTY5cVA0d0doZFhWUzYzWmdq?=
 =?utf-8?B?QzNqVzlNU25nNzhWcWhaQitzOFU2OEptaEpQSTN4L2Y1L1hLMkRFdjk4ZTZr?=
 =?utf-8?B?b1ZVZjI1OXVYSzNJYVRQcDQyK3BkYTBkZTcyeCt6R1RuYnBjU3NVUXA3Ri9x?=
 =?utf-8?B?NkNLcjQzbldxVlVDQnB2SkZ1bTFOK1hhVG9OWVVzUmx2RVJvL0xsRUo4YzVF?=
 =?utf-8?B?L2NGc3ZMd0p0dUdrUzZPME1YNzVPY0ExdFo3a0hIcHJwWmZyL2ZzQlNSSEc4?=
 =?utf-8?B?cXp6R0ppL2hlTHNjNWFBYjRmVjVneVdoUE9RNW9BREhEb1pqQ2d2WUdEM2ZJ?=
 =?utf-8?B?MUNYQ1pmbVFVc0FPZUR3MWIvYWg2TlBrRHhPVGJlczQxb1RleDZMZ0tQOUFt?=
 =?utf-8?B?WUlCVnB6S3hkRVZ0ajkrcURlMlA0VzAxQ2dmbUVjRFNTamsxT1UvRkN2YUti?=
 =?utf-8?B?di9tVUNsOC9TTFQ5RWRPS0dQMmg1SmI0c2ZOdGVIb1k4L2F6WmRFSDgyV1JF?=
 =?utf-8?B?M0N5MUk4Y1piQTRTSGZuK0t5dkhQNXJqYUxiWWtpd0MrQjF5VHFDQklFYWZx?=
 =?utf-8?B?RXVSUTRaZ0l3WFl5Z0gvTFZYczQ3NldMRERuMTBOenRlL01zSVI1NWRMcSsz?=
 =?utf-8?B?eGZ1OVoxOVBTemI2aXpYeWMybHgrMktzaWF4eC9IVlB4QnN4cXcwMnRTdE5K?=
 =?utf-8?B?MlFxS3d6Y2IreDVqQTRmN3B3OEkrL0dxMUtQYXhYZnRsekNiLzdLWnhiRzdk?=
 =?utf-8?B?L3F4UFd0ZmVqa2JtMzRybStFbFBBc2ZpTTZpSFBKQVV3NW9XMHNUREtwUjY0?=
 =?utf-8?B?YWk3cml4UTB5SGk0YldmanRpOUlmMnpnQ2tiQXl1QVQvbC8yaGVReFliZk5J?=
 =?utf-8?B?WjNWU0ZjSzJkbDdFZGdTc0x3SGQzN1JDOW01ZXpHNzRIMEVUQTh5MEYyMWdr?=
 =?utf-8?B?QlZWSERKWEJZSE9keE8xWSsrRDlZWkdOMUpNcEg1bEhHTmROZ0ZaNVczRmda?=
 =?utf-8?B?NWhqVStZVVVjT2h3Ynp3aldoRWlPcWtqOGo3UTBhNlUyRXN4MldQdEtTUFV1?=
 =?utf-8?B?eDZHQVVmNWU4bS85N0E2NGMvZUdkdjhrY3dsV0JScmZta3FNWXNyaXZSVUNL?=
 =?utf-8?B?Y0wveXRBY2VSYUF5UVkrQzJyNkdBaVRJbnN1VWxqeTlkRFZ2NkU3eG5OQXk2?=
 =?utf-8?B?ait6UmhPLzJPQmg0L0RhbWROK3JlSEh3ZGFHQ0N6dDFyK1hSdnFEWFNxTmxT?=
 =?utf-8?B?NUswZk9SVEkwMXV2ZlN0UFFMR1RxVW9hMGd4R2tYWGh3ZUpYVjA3eDFVeFBi?=
 =?utf-8?B?VWpGOXcrK3F0ZUt2QkNDWVl6MW5FRGZLZW0vUFA3aVVmcVpSSDFxM01EMTY1?=
 =?utf-8?B?K1RNbjhoMGkxL1VyajFqa2ZPdW8ydngxalMvVVhUOXNPMVBDUG5IVWxSdkJw?=
 =?utf-8?B?UkpZbk0vR0YrUnAxbnp1TS9NeDRZdzdPNGVRTzEvWXUxRUZWZEg1RXM2Z3lq?=
 =?utf-8?B?TnRaWUVtcUZBVU1ieHVtV3d3eG01Mi9YM2x0eVU3SEJHSzk5djg4UXNoelhG?=
 =?utf-8?B?NWpqdWZZTzliYTBxditlbDZGdThyakN2T3VtbDNxb1lmdVgrbjZEWTBjbW5a?=
 =?utf-8?Q?qV5w=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700013)(1800799024)(82310400026)(7416014)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 11:29:11.5844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 184cbaf5-b8c8-400e-0f37-08de408429f4
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11104

imx8mp.dtsi includes a default port@1 node with an empty placeholder
endpoint intended for linking to a dsi bridge or panel.
HummingBoard Pulse mini-hdmi dtsi added and linked hdmi brodge to yet
another endpoint.

This duplicate endpoint can cause dsi_attach to fail.

Remove the duplicate node and link to the one defined in soc dtsi.
Further remove the unnecessary attach-bridge property.

Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by Josua Mayer <josua@solid-run.com>
---
 .../dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi    | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
index 46916ddc05335..0e5f4607c7c1b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
@@ -41,7 +41,7 @@ port@0 {
 				reg = <0>;
 
 				adv7535_from_dsim: endpoint {
-					remote-endpoint = <&dsim_to_adv7535>;
+					remote-endpoint = <&mipi_dsi_out>;
 				};
 			};
 
@@ -71,11 +71,8 @@ &lcdif1 {
 &mipi_dsi {
 	samsung,esc-clock-frequency = <10000000>;
 	status = "okay";
+};
 
-	port@1 {
-		dsim_to_adv7535: endpoint {
-			remote-endpoint = <&adv7535_from_dsim>;
-			attach-bridge;
-		};
-	};
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
 };

-- 
2.51.0


