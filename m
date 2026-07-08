Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE673DE42B
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540162; cv=fail; b=t1uOQCYJ4KfAXFwe9J9ijCow6l0Z3I78+jb1Au4Nngp45P/g3QtUb4tqFvU0855ofq6Y5wj9d84BIVZoCUAb4FwSOEbq8fDeQD/Qz3OJ6lWYElgx0WHtxpsiAvcj4ixtvGW+kT2t5WCMk62EGYU/VRvPhPOSzn4jw5CiltsJ12k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540162; c=relaxed/simple;
	bh=Wq6t8O83JqDTHOSN9D/jEpw3GPwurL0eQH+9uI1fScw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=stkyUBP1i4hDUp6yj9kLdrakDczJKjVJ+vhmwJ+7HzCmhfypZFj8IZ1x2vaIpst2VLL1noyMeBADZEW4iOdEtLOvNV3JoSb8qbmeIJQYe+Z8QqzcApn3ADIbHjAksCrM9VX+UKXh0gIKtRelUBXLAW/59w/XEUgVPTeZjAvcijg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B3Zc2Sf2; arc=fail smtp.client-ip=52.101.65.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B3Zc2Sf2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX3+WjwbrNiE4Ej9MW6LuG7+kDRR9JAvlElxf7OQ4Qn/hxhlHtvh9fFYS9lrIZMtbhgQnEntp2Kp2VzZX6ls1z61mDR4goHDfDn0O9yhmlDh/z3/inSQDP1B2q9WXLlSq6iRqN0e7LLQJu1MmdaUinoS/xyNoqGWxTyEpVwxA8gtbPROguheK7exC6CziRV7yM2AE9fT4LZqy61Emx5HvIaTq16uLwCTn5m80IM688Rs2j/Tjv26PqFBUSUvhtB7CqBN826/lMULnmHsP3J0VDhiGtRw//J82Pc3QjJGi59zVdUtdsD/eKeGbGWP5OhB3TgWdUDtoA9nqOcmphPETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyS95G9sIEg9bOlDxjUL01jOOiyRrnizBGnKrC0JolY=;
 b=yQaBnreff2Fv3I5IWHY8JLS3yQRpqlyar+XFlOqQDceGDDRvW5P1JiSDb3wqKDkY5iW+tv17AI0obuZKXM31xUAJ/v6bfPQoL8wDp2Km+TYWWv3vOcpWxeKfLwxtkLbbOr3jojB44sI6JaMi0MSRXalsFv0nlytGrLi/Je5oyzkwqoJRBizqeQM5iqDNhr9tvK3gayzztPlGJGDysuuM0qaCW7TH6LuFKV8WbYNtNKQ0TpRtbb6Sm3PL9ovVra+0QnMhwA5dmuEWRSc9tMMAgsinonoFjovnTJeFX0fPMQr05Tj3qWQEOV2o5h1v5hPNdzVFrd6hji/uNbtdgRc9iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyS95G9sIEg9bOlDxjUL01jOOiyRrnizBGnKrC0JolY=;
 b=B3Zc2Sf2qUiL1W7x//VgkVnoiYGVmtFhznOeqUkdxb9fe2YVjcyHQwStEoi1m4UeRiPi+pD7eaQAHxka9yxP7dau3laPvA3y/mjwR/tWflSGngxCfSPsZn/O+4psNmoJFffnYe0aSv9ASkhHZyO0FK9xzM7FCe0eW85sVaIql6PX4XZG00eE8DavqBhOCGU3UeuvDReIqm4Dkzn5UY7JE7K0vHraaxt4db927Gsha+QOWE2HdbvDPP63LKmXOOUMnPjImgwIsMQBQ/SlLdMKmvhSXEv9RwiCxY/8yZmyzhtx9WcBM6WHAU8WBUi5FQJ5D0Y7w8Zq93Lp7sSJjj56ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 19:49:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 19:49:13 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 15:48:57 -0400
Subject: [PATCH 2/3] dt-bindings: mfd: st,stmpe: let interrupt property
 optional
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-stmpe-v1-2-1f51d15bb358@nxp.com>
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
In-Reply-To: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linusw@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783540138; l=900;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Ta3ej7C29rxWqJ5Bsokx+QvtsaMJv39OZLLX3YXHmF0=;
 b=xopbX222igskNdMkDPX3KjTHqpd4gxtw8MNhYXZEd9QJt6qTjG9VklH7PBCLzyNy66ro+6I/Z
 /LXYpt7E8hSCbrAFkSWvhhKRKbxmAKFs5BnOIq+i8vetIhV4dWfuxSy
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR22CA0024.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: fa08e5a1-a82f-4fa6-e4ba-08dedd29fc90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PsVKxcRKmUQSYZbvXLg3mzK6M+SF+e1uPecyWbTidf1djaVg0z+Jpy4S7nNDlULU5Po74vMwqailkBqShxdgWksrOe3+muko6hHISuQHW9MbX4Xq/vT1NV+xYdjl8c6PbCMdX8CPsQwGQRBFOU8p9NE8taVwMj7KpWYYlRE7NvdIAQ9rTtwQxycEKMzkX3z26v59oYxZjsLAr/QMOXPhro11U+s0V5qFgz7HPfvVityA1lOpMmJEl+2/0Da9U8ABA0V7y3g1iR7UJSEkMFdyEplGx1YlYRDxnXcPLP+zhgoxCrzLtC++28n0fBxJoQzkKSGAtdMeqceUufdfqCZ7suw3DQfhKCVRXOQESEuqUuyx4YhylSeRaV9ZQn0kjxRCBn7QCSyUDmVL6sesvTLmVdjNOPwP4WOcMClqTjyscjfMmCnnBVDiU1mQiU8KNtM8ljHw+ufxFCoW7Pev/3Ooj6itl/SEJesqFVbYB9RH9XWf+iybAU8H7NS2ByAKOJDHJG2RJJH8ZyAQIMQK5NCmgpNgoVaJRp+ulxJLps4Hj4NMWITZAdMT4Q2U5j7iOnIxJEdvLiGtEhPB/R9+utpgfhT43tsXxCOQn/IY6byYgoUexXjTtxmJBUIo2nCmI5rOaK3Va2Q9iGvRhi7KmOxxOR6rDtInTsCfWIhkGdRuGsWaVp2RFAuv4aO10PwX2sJriVPaWaBL5XABEOK1h/oMsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFI2QldnV3pON0pjWmxyUDBLMWhwd0s0RTB2RmwvUjJiaG83WDcwL2dmbVJK?=
 =?utf-8?B?ejlDdlhzOEdHWTVpcGhOOTZLb2dlcGx3Z3hYMTFDNTI0OGVLa1hRbFRlMWYv?=
 =?utf-8?B?OWpzcmZvZnVMS29NVjJENi9TSXl2UWVJRWF6ZG9kc2drNUkvQ2p6czlUQXAv?=
 =?utf-8?B?WDBXQlhsejJDVk1aWXJBblA0Y2tsUUFJRHJLZ0F6djgwV092eW9HSTU4SXlS?=
 =?utf-8?B?ZmxCTmZOUzBabXdMMzN5eEIydlNnUFUxektWSDJDSVZtR2pmSC9Fb0M5TU55?=
 =?utf-8?B?L2xmSlQwTnBraE81VGZjazM5OW85cnEzNURvd0N5SFNCbUhMTDdMdCt4eGRY?=
 =?utf-8?B?cVRDSDFLSmN4SkdmNHZBbVNwdXFVL3laNmpEZlozRFVpU1dteHEzbHc3Q0ds?=
 =?utf-8?B?dVFpdStBT0FqeHcyVlFhMXM1aUdVZjZZMldWcXB1Q2JqNUZwYXIrVVZMQ0pj?=
 =?utf-8?B?S2NETTJ0QXVRMWtzV1FPNUtpSDJaK05zclVzNkFKbzBZQW5hTXRNVlo4TzhF?=
 =?utf-8?B?WDBXYXhiY05FOGF6VTdZUjA0cUx2QUt6MlQ3dU9lR1RwZnhOSVlNVjcvQ2tQ?=
 =?utf-8?B?UFVhcXB5NmNDZTdPNnNmbml5MDZuZ2ZCcEZ3WDYyYmMvejBNUE9xNUxNWGJQ?=
 =?utf-8?B?WWkvWVZMbHNkVnFVSEdQa3RZQmFPcUNCSEhlc1IzaGZGbHYvOHBlUEYzTFc3?=
 =?utf-8?B?dHJLZWpCS2tYVHBaZld4dUxzUTI5ekNGc21oMm81OXpWWWRZcGd6Z2VNczlG?=
 =?utf-8?B?OTE0Z3dvekZQNTNxS3FidG9vZ1Rock9kakRMcndhMVdnancxbTZ1KzZxZzBH?=
 =?utf-8?B?dlpqVGRXMWo1OEVaazBFNnVmcUVUNk1jSGJrdU4vYTFBV0JCZy9teUYweDdT?=
 =?utf-8?B?UVhiRnZxeTNKTDBFZlFJNGpNL0dtbWtzdjFMR21NQ1RHSXlKTEludnMxM1RE?=
 =?utf-8?B?ZThmeDZDaEpWUXJQWG91UllqUkYrd25YbUh0UTRxMk95Q0tBaGhQUTVyWnhw?=
 =?utf-8?B?OGFaWUt0a21TLzhHVmppNEs1cXhVNnZ5MEU0Y3dBd3BxKzA0YzRCbHBILy9a?=
 =?utf-8?B?dHNmQVAzQ2lRNmNtV3FUUit1R0cxUnRQSllrR1JzdWh0M09IMGNKS1FSZjdT?=
 =?utf-8?B?M1FVazFPNERSN1dQa0JxUmVMVGVtcEtPRitDUUc1aUVYQm0yM2MxdmdqVFla?=
 =?utf-8?B?Mk8xeEJ3SEJJTmlXcDVjaTlqTkp6ck9BcG5KN0ZCWWpJaHpadjhzN0JqSk9C?=
 =?utf-8?B?YmcxRitvbHBxNnF5aVZXSk5xUk1adFNQdFkxWHI0WXJwL0hqalRNMThGZGVI?=
 =?utf-8?B?K0RuMzY2bGtlTEk3d29WcGNhUmNkOS8zeWJ4Zm93NXZ3dUplMlhZMkFTVExO?=
 =?utf-8?B?Tk1XMXJFWktObndJS3h6MUVrTExOdFZSOSs2YTJsYXdMMWh3YTQzMldpZTl6?=
 =?utf-8?B?eE1GeWpkWWYxaFlCSVZvZENwV2kwZmx6MnB2UVR0MzFFOE0wSkJlZlRUNHov?=
 =?utf-8?B?M3FwK1hlUm5LYWYzZDVIT1AvL2pic1NJc0tQYTUrNkZ5amtEMGNuTjlWZTV0?=
 =?utf-8?B?UnI4QTladVdTenhBYVFTUENnVmo0TktxbisrMnMyejVzTExPckx3WmJjZWlh?=
 =?utf-8?B?ZnIrYmcxVW5wQlpFUzUvNHR5NGZqUkNqZ1FDWFpydHNSY25Ibko1SGgxL0ln?=
 =?utf-8?B?c0wzbWV2WGZTY2lQRGcwd0ptS3UyRzl0N1NaUHFyVmxuSXNuNThnSHF4bEhp?=
 =?utf-8?B?SnZEZzN3dXd4RUNqd3dnZXhDekJxeEl6V3Nza0VHRHZoU2MxUU9xRFFYRmZG?=
 =?utf-8?B?ME4xc3NGdzkxWEZoSGVQVXlnaUJ6R2Rqcit0eHpaa1FsYVAvdDBKSWpuV3VB?=
 =?utf-8?B?eVBiY21ES3BnMTR3SElpV1Y4QkxyRHcxcFp1Z2FwQzFJa0hjc3MxcG5yMlk0?=
 =?utf-8?B?Yk1lYkF1WXlqekJkV2ZCemNQdFI3dk1HQmUwWkRYV0dkczlERUE2dHV0Rzdk?=
 =?utf-8?B?WkkvWFM1enJHbUtsalIwS2lzanhZai8zYm5hbnI2ZmswSVRTTmlBRGozYTFw?=
 =?utf-8?B?MXdncFhEaytQQWNBTkZkdUJwTVFxSDRxMC8zSXhtcmRYOXpFdURmTWtPcy8x?=
 =?utf-8?B?S0lNQTJlTHNLcEVyRXE1bUhZYlA1SjBnOEtjeUgyTTR1Q1dhbzJOK1RSVFAr?=
 =?utf-8?B?UmtndllaMzA5ZmV1K0J0a0NkaDdXKzFSQThQcGpCUGlaNnVkWjRsRGtnOEph?=
 =?utf-8?B?Y0lzNlVpcm5yTzArcmNLT3lFckVJb2c0ZGJkaDZFWXhGYUZNMXJ4ZHpPbHU0?=
 =?utf-8?B?Z2pWVktLWVNEZ0FjVS80MmZycElwQU9Bd204cGVKaXVXeEREakZjWHYwK3RP?=
 =?utf-8?Q?NkIlG1fY0CbgENxfK7v/hQAe+kGAQO0+BPOVL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa08e5a1-a82f-4fa6-e4ba-08dedd29fc90
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:49:13.6186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyYf65DMFUwJBx1QL8ZG8EYip0SkGDYW0xipA8HPkvPON8Oih1p3qdzCGtKHGyf+RjwBLzKP/2/oJpdY3dH5TOKmvoSlGLF4f/2meQPZ3ZNYZh86qT7M7Be5iCUdSX+W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

From: Frank Li <Frank.Li@nxp.com>

Not all boards connect irq lines. So mark interrupt property optional.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-phytec-pbab01.dtb: stmpe@41 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
        'interrupts' is a required property
        'interrupts-extended' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/mfd/st,stmpe.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
index 56aa2570def83..c1a4fd0dc8089 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
@@ -225,7 +225,6 @@ additionalProperties: false
 required:
   - compatible
   - reg
-  - interrupts
 
 examples:
   - |

-- 
2.43.0

