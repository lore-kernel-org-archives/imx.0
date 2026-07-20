Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6903D16EF
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 21:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581859; cv=fail; b=hwrpJRxWfqI4VFl0cPHBZsX/dhT01Qf0CNTRarvwYIaydD2lr+VYFw/Pjw7b9ZgYa1nDNDM83FPjwH8r5QgmKarA6nmoCL7nhdpwm5NJlGSpvMwdPB85QaOIAKGSuedglZ0Ddm+h1pqqrsgTJMLk7JlWXdI/TGDOpF5md9QZR3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581859; c=relaxed/simple;
	bh=X8qqqK43Xjxgua9WqZGJ1+fW2BsTY5GcVRk9Sw+x+Vg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=BCspMTKthg3iuL2/gpHl1B+q3lithjkMLiVP3MkoSv3gV8wemiIiNSeGyAnk7sItjDzaaFkwpq9KaolSLqFRhIgzsFN73/eSrp8hW7/Vh9T1mcOrgzilu1SHrgN8L9S02fF4smZW479QqmWtuISRrv7iYkQQ+WifoZl0uQP2vZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JTD48T4k; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JTD48T4k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j20EVLVb+OBXeh+u1a7bDez5KlkI1CFNzAhKtMqN5VJkCgwttEOrVXj3KfISoYOVIvFlq/2ncX9kkbA2YE0RbXO9UJsmSP8QMCnpvw8kn8LLDVXUT9Ebdf2HWnAPKpOFCKR9Q0OIfTMNYK2Zgw9Rq6KbsUj/qXH9uyTdyF/MBI8/0CwSqh+eo19fXegrH6cTBzJ1d55fI5YhebE3kn/Vx1lJ6NXc15vbNL3W0dodopk/S5VlRZcvYC8v7cqCX5JN9iw+VE5Q1klpg+ZQ3X+xOjhSuzJxsKhYTIGHYKLwRq1uMBA1s+j7g4v5Ch04LmV9aaXjBBmViKtPs16YTSzl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTdXOWy3ed/D4Bj7Fisqs9W87MUsn70k8yzLHR59L10=;
 b=kzMImNQLn2+04t9JwDijPMYCqqngLhcavEjPvSG3TPnyiMhXDPee0W9IDko3MAF2Nw2y2rerUUs7FZu6R5F1RYf4C44yFz24nEzh0FwElvO/CV0Id7o1b122Kc/1dx9LY93rSSuZtyOT1507B4408q3PXPFsCn85doglfElBK9aXCo3rltyaHMGWi39kZe7yU1OZhy8UNpS9h3hgOgZRJc5PsQsqW48rVTQpN8NRZL8Ze0kO2ERoYJGh4ILWb7FEBBhMR0S4+BBOLdeUT/ZFkQXWDEfcQVfNoJ9gpph2WOJUr34rFYTggSjoFcwYyAUEpZRIaTeq+HncYRkVe2WJ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTdXOWy3ed/D4Bj7Fisqs9W87MUsn70k8yzLHR59L10=;
 b=JTD48T4k2sSPtkVUuiyOPyCQcYssJvP9vCFcrChlyWPXQoe0IIlaqDLHwSo0xGkXITipx1kaZoMx+lSCpSJotQW0abVjX6Qv2oAYZG8sg6LH/jGR5UIhqMCkGvsRnLbOCxOshBBbTlEcZ+VkzWCFALXYdz6IR2fGAijPIoysFvl4JJ3KGACNfjce1bVWOw8y7Xc5ZYJIiqKEsz5PggXdfZgFK4pn7g0uC2mvmnG9jDnmgsN2wdmC6LI4zGqx0MVmMg8gXDILk9J3RqR43P3p8Y3tykGC/iLzbfcRjKKnevcW0UYc2jK7iLgHMJ7uS9mtebSAZo/9OjNW94DsmxVeDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10565.eurprd04.prod.outlook.com (2603:10a6:800:25b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 21:10:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 21:10:50 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 0/2] arm64: dts: imx8qm: add smmu information for usb and
 add hsic usb port
Date: Mon, 20 Jul 2026 17:10:32 -0400
Message-Id: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMiOXmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMD3cLc+OLc3FJdE0PzVEtD0+Qkc0NjJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAJwkzX5rAAAA
X-Change-ID: 20260720-qm_smmu-417e915cb713
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784581845; l=518;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=X8qqqK43Xjxgua9WqZGJ1+fW2BsTY5GcVRk9Sw+x+Vg=;
 b=IUz8/qNszlZafa2YjYN4IeqBV/yEk8SV9mCFqgtSnkvb2tigQqXJqTVw9Eg9TS+bn360YWBbd
 Bjb4f5MykXPCOH4kL/xvCtfp1u5GWoQ1ywHabtNyGOV9m7rzYDT7Zdg
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10565:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea2cd37-9f20-488e-8bb7-08dee6a36032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|23010399003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OFH+0XpzRGNTLbs2TTFB43vKvh8dREeaHDat8lva38k0D7i8adztkY9Wc2fSEiA0heryWOAtJH7MCUlpBr0AIPJ9b9XpmERKkSRv+7x60jIdiTEpMuedOcmIiRtlBcMMf8Ro3ClU3NbfXgz5XWcs/n6jKRG0+oXG9JITxtr4iOgaVvynmXDclTpn3k+AIQdQygK/HXRWqWq6S2F7LRdZtPLJESxe28203yRWVVlQJdviWBI5ujvMeKnQA0MVa+rnrJ7Atxv/dHVqH5LdMEr2eMNX1pKkMpp5aX1Osnsn9YLhNLSNO++h4+ZdRcGYkdrhUfQYklEe1yNUqfVZdNbB2xaeChLbfVWf1bKG3oMCUIAjmptdFvMlRCSP4lctxTMKvIersGK5ompfjpsL3gAdnnyYlV09k866kmqvQRK/j9h2iMfUgkjdQqLXy8GrQwx4KPBKixIeOv4i4/96fx4If9g2tUDs+J1F2cYjt7xLRCo6v7QPHBgrdFpgXlnplxvXGH18v1mPEQHtQgKBoqb/TdH+G+piB/lvCQcvuwbsr/1IiFF/S+UEFkuKTunUIVv8k3zNH1+R9je0zkl2efaG1vosXN+/JIGCjfUtGu3QhznL0Jb5DzkTQb0x2+kSlSAUCNHidt6mHmt/8I1ufHSXaPsy3woPGvOtPGt6bG3td8w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WThPOEFEVUNiYmlVK0lPWUNXNlE4U2F6MXBvTEhNV2dxc01HOXM3anFpdkxF?=
 =?utf-8?B?UkMzZUJSMndaWmh6NGc1R3ZRbWxOSzZyT1RNZXVTZUdwZHUyQVNCa3A2dkFq?=
 =?utf-8?B?UlNqWElmWDhYbUFJK0J2bkJrK2hIYmlFSXBOdk1qdy9QcHBQaEtWMzVxbi9t?=
 =?utf-8?B?dXlnK3pzNkc0RjU4QzFNM0RHTWltMUVUM0x3a0Q0ZGtqbmJGQjhVL3NnUEdU?=
 =?utf-8?B?ZVNmWTBNRTNaUGtXdVZUQzBxQ0M3Y0xyYitzekErVWdiM3o1UDhqZUt5c2Jt?=
 =?utf-8?B?MXhyRFQrVjd3UkJDeXZwZEFSWmJwWitsbWNxMFdqWUxTeGhhN1B6NTB4ZUoy?=
 =?utf-8?B?YTlQc0hCY0Z6LzJrWGNobXZOVWJzSUx4bU9VNEpjak9DTXVaOVI3S2xqaS9j?=
 =?utf-8?B?NUg4emFEcGFwRTdtYkVNbEFBdkl2eUFqTEUvYmoyaEdRdTl5eXY0WGtIamFS?=
 =?utf-8?B?dnJHazRnUW1kcmsxVDYxRUpFZU11UHJWcnpoaFU2OEJLa2YvRGY2SDBmRVdQ?=
 =?utf-8?B?WVpSVXg4Y001R0ZuSXB2YWYySGpEcmZaREV5bG1aVUloRGlobVQ0THBGY3ZO?=
 =?utf-8?B?aE9KLzhSaU1aR2ozV2xpQyt1bi8xTmFTRk9SK1J1UEU4T1ZVNDlOSlRJMXZF?=
 =?utf-8?B?NFd0RDQ4aHRQQlhmN1lobnBFL05hYUxBYUZVZTFiVTNKcGo1ZU5EeWhBbFky?=
 =?utf-8?B?VFZBeWM5WFUwaW12NkNjNmpvTHc0bUtDT05yRkMwbnN0R25BNG10b0FCSGti?=
 =?utf-8?B?TU0xUFlnc3ZJVml2ZkhCVFhkdlNrbVJOT0RhMzhQbWF3MGQwbTd5VlBpcjdU?=
 =?utf-8?B?V1ZSaDFPZG4zemxNMlB5RHkzQWVPVkZkeEFSUVR0Y0l4eVlQQ01MMDJQc3Fl?=
 =?utf-8?B?WEIxWGt3QXUwOHlFZjFwT1ZmNnBzaFBRTS9STTZKQy9zd0RYWWJRVEp6eWc2?=
 =?utf-8?B?SnR0elpVZzlYckx3eWI3ZE9lTStjcDV5Ym9KM1RTMWVUcjRnNG5NZ2N0Zkh5?=
 =?utf-8?B?emZoTkRlODdTRVZoRlVQaS9ST2xObXV3NHhsSUsyamJjUkJaRThTT1c4QmFu?=
 =?utf-8?B?ZjNNM09PbVA0dHRFY2JMQTFzeTUyMTJQODZnUm00a0xucy9GYUQvazB3U3BM?=
 =?utf-8?B?NHJ6SlZJdjJUaGtBR21qczRUcC9tM2M4MUg5c1RNTDZ5UXJ3dHJrcytPRnYr?=
 =?utf-8?B?VTJqTGU3dHV0MS8vRXhPdXdVTEtFMmVVOXJFUzNZZTZpS1Z6NkVQa2xqZktS?=
 =?utf-8?B?N2pGNlk5a3NiV21TTUtsbEVaWWtmVmoreVVSaHFlcWhGZ3hYQ0Jtb2F3eHB4?=
 =?utf-8?B?Umlvc2UweEd0bUFCTjBOeFVsL1ZGUEZ3Z1BjNnM2Vk1STkVhWVZjNWNZMTFy?=
 =?utf-8?B?SzA3UUZoRlVxemxUbDY4VW1mVzZ0YTZEcE5aRXVCTUV0V1lmRGJ4alFHRFVh?=
 =?utf-8?B?ZEZkZWFYVkZlSklTVHM5R1RaYlFwVkg4YkNYYW1mRjJkM3owdDRZamlCbUh3?=
 =?utf-8?B?cklCV0VHbXZESlBqSUNhaEl2d3hUVHgvUVJleENUaFBGZ0F3YmZYZUxvaity?=
 =?utf-8?B?dlM2am93UE1qWXBybWt0MWdpcVpMWlBPLzZpUjU1M2FnQ0RZNDNta1pjOE5a?=
 =?utf-8?B?SWNqTjlXdkdBYXhxTTFiNlBlZE8yV1pYaXNTcjBoZURLcWhLbllPZHp2c1hY?=
 =?utf-8?B?OTlwSXVYYlRDZTRLTEphQWp2Sko4ZWxTSklJb1VWOGFwdWpKekVOQUoxZ2pR?=
 =?utf-8?B?bHQvM1B3SWZwaC9jTDZRYVVORFZsYVNNT0cxeDNpNDdIWnVKKzVMY0diQTZK?=
 =?utf-8?B?ZmM3RXdWYnQvaFVQUFp4ZnU1MlJqdWI3amRCT0EwbTBHYXFIN000bzZBYklQ?=
 =?utf-8?B?eTE3RkFCL3FaQkVEQThCSEQvc281cENpU0JGSXozdmVQSlNTZ3RtUi8xMGoz?=
 =?utf-8?B?UDJMeVVGbGZ2RzI2WDJLUlFqQTZweTNDKzlVT0ZsMitpWGx6b1l5Nks0czdM?=
 =?utf-8?B?RHRUblFFZHdTeHdNMko3SHVFa0JVdHAwWWJMemJtWHk2eDBiQnlEZGo3dkU0?=
 =?utf-8?B?c0wxemsrRFVxRjE1TEcvQlQvVmk0bmJaVmhyVk1sM0xLc25WTzk2SWdpdzNE?=
 =?utf-8?B?OUl6N0UyYVFSalJJdXpjRlJTMXVNWEVQYVh5aGFNcUpjdlBXZmxhMERnRnZq?=
 =?utf-8?B?UzBnYnZqOWdWV0RvTmg5eG9IU25Kc1hKUDQ4Y050SXpybVA5QzVlWkxnVm8r?=
 =?utf-8?B?MVduTyt5clgvbW81SlpNVHVpM0V0MDJadEdZU29WWWg3WHJ3QW9ZMnhSdjJu?=
 =?utf-8?B?YXQycHpDdXpuRDBnbHQ5eHNNeFo4aWdtQTkwQ05jSGtuUndpSm9qTU9kZTh0?=
 =?utf-8?Q?Rr/+zGoEjlXwS8aBxshu02uv5j4x0gI97h00b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea2cd37-9f20-488e-8bb7-08dee6a36032
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 21:10:50.2994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EbiHkBcYf6CuiAJIqfUX3oniW+MH9B8P9aa+Z++jLlk2DAL0torQX3NBSkc9WN6AvruZb+TdjZXoTwFT7LF/yo3+Te2NDB4r07sUlXrIfaK9Zu2r4cTOIPGGPiEWVeP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10565

Add smmu information for usb and add hsic usb port.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information
      arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e0000 node

 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260720-qm_smmu-417e915cb713

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

