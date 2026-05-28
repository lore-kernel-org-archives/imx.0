Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B2E34105B
	for <imx@lists.linux.dev>; Thu, 28 May 2026 06:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951158; cv=fail; b=OKdDWElo0yssMJ87KDD7j6PM0M/nxmIrPOyFPVlxDVzaM1wINnsFzzYG+fyUQ/JFaW0Ins8280lG//od2R3Xjm3cbiLx73UaeviMAiwo+Vb3gKZAbqw+DL7x2f35ti6uVzDaL8Dp2kINNe+cYEvUwx6X6zbKFgK02GceFEY+qUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951158; c=relaxed/simple;
	bh=+2L9Swo51MeYAAvjci0aw8ue/jVSzdVw4Wm5RT80X0M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iDM6hGgAbH5OO7AeySWP+M1suKqWt+afZOHkG+rKHcC7i6Gb4wbaB9c1hdpjIonNozi4gu93878eMRCpxNV0YBGRijHdJEfJgzR1iJNeZkroq6866n7B9PjtCinUoPL9ufeNF/k2jSbgjzKhn985KRYkFZHfM9wxdP4qkW5i758=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mkelJNf8; arc=fail smtp.client-ip=40.107.159.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mkelJNf8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPmHm17AjkWGTS/hQuWRk1y5v47LMu52WevzwFVv9GWIi8Yh2S4YhRq75J7GX4UV6ADqxxCk8QmHqhbyNcEydq9EdMsgYcwtRlDMts03mtNJeW/S/jKuD9NpxfkK0LgFYG7OjgAtFr2PsE7FCdFdq39/niY0lqosVWhF4HU8Aa2VN4zFuarEL0cXZp6vpSNN+fp4Uoh9uhYoaup52n9K+Ax+UTmwqG/PH8EZfh0zI6ObEMf4ctBmCDGXhn4bxXEIkj1fjfrUO56EKd2S2buk94V+d0Zf8NV4cf4XqxfhV2z/lY1EplCSipZgST44ZsDC31iXkqHIkGNt/J/DOA1wNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zei4lK2Ja/ELPTG6sO38XZpwT5eJXVZ14aye3XCNYwk=;
 b=B2QkeBsEte5tOoYGvRW9P92rCxucrhQOY2TCd4N0ry9qPPt6NUi3/yYUNFLMHwqv/L0jmezFFWkwGHTOSuwycQ8KGD7+yG+w3c2xRCTj6hPFv5g9ULn4mZHWUQSqwVzRN5gQo0i4EdyzHKF3u8UoDkVUNwMsIpWZdme5yqmmvf29jc9g4EhwHYuNYCRy21oEG75VDnddK35GbAvt1FB5UBIFE9C6zxZHN51waD55xaKwvEp1JTXa/UXiSCuBimwLC0B8iRqYORXiQD7+tjxh7ToSAl/9D0jmow8EE/rkuFYcx2YdwjalVxzY6YwQnPCa8WyFsYmEl3CJ2BuBTvrcxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zei4lK2Ja/ELPTG6sO38XZpwT5eJXVZ14aye3XCNYwk=;
 b=mkelJNf8bzoLLO1t4+ZHHiglCxzHrGMsxixESKuhjqnfRoRScPdRG7JfCinmqACJ2UYNckFYvBwBwebcS/84WHwtUaFwuAa1uV5MbO9y78m3eCtG5XvA+CK1IKH6BB1gHlKXBMP3wqdSl4hyh3xKy5eFQB+wIUYHIyQH+lz/mNWR880olAG7mTjz7M3genaOU1Xfi3024aUPKWg3/XrdbaeF4E8vH9T8oXkwHPecRTLf/5pmKFUFf8oYyrhaFDP/ljtHnEiTGTxyGeyIdLGp9RpQsH4bKKkfAdUPEGEr19FQi8tGIq3wFBMnRpt48/OqpTDzqaXfV4E3JyGbtdmZtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DUYPR04MB12692.eurprd04.prod.outlook.com (2603:10a6:10:65d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 06:52:30 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 06:52:30 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH 0/1] add PWM DTS support for S32G2/S32G3 SoCs
Date: Thu, 28 May 2026 08:52:27 +0200
Message-Id: <20260528065228.1300779-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::20) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DUYPR04MB12692:EE_
X-MS-Office365-Filtering-Correlation-Id: d97b57e5-e03b-48a8-8597-08debc85af96
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|7416014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 AitlFcBFSdZMTgB3igs6HE0Wna3Gie7beEt1zVXW/oT8iHJzB7wnjejVpEWzZeNpsTrMUo2ncj5m3No8OpwTPkaHUX81xBcQwjMP9FAKzRPikVzUVpv/M4jaLYQ76VYR5cddNpOn6FRoQixdEsfmzM2D1r1Xb8tFziTCsPKnKMsQLNHrSaIp8OYEcP06lZrs6rXWCL/EnUQuuHpo2cyLG/B55IwIZRE4rv6jBJmn/Zk6CqNUSiA3SeOUNXgi6BTOOgwE9D/epq/onJPoSKCqlwJWzvY8sDPJ51l+Dt3CCCToip53JQHu3TMXEMlHLUmW2K6AT5pdujpiNoBoWbabmlvylFvjleKQt33xPMsjMgeJ056DcAFbg94Fq0ComtHh6ugfKS839je/lS5IwN7uuupBXlmOyUX58F5JNHLUhOGPDw3x76jTSNDaXJhyk7W5nYp31IgRzQeeMEuotL1QkrBgnpEKondJIL3gZt0SN5vQd/KT/3JXEAtn3bEKVU0cuCxKOxcVicCCqNAOumJeFkWr5gUlrfMnKFGorDv17wN4PUEb1dNQBM+uyJ1HrykdplqVggMXi73tcRMSBMNc/6P6Hb8u4xSuxHvxMVRDa9+XscWLx4hzZyDh5W4XAMkPYZWr/3WP1d7Okx6ewPhWV6x9vzSQHHSLzPvv9Wpq1JNFz/Fidnmx4dW+NdY8pRjd
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(7416014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NjZWekxaTTV6K3FraGl3SFNKcnI5c2NnREZuU0lhM1ZUUjl0WE1hTjRPWEpM?=
 =?utf-8?B?M2ZIaE9xb3NtbytibVFWcmR4OHNjV1o3YzZreDFlcnJkdnRSR1ZjV1JnSXRl?=
 =?utf-8?B?UVdCS3N3K3JqNCtKTlJ2ODhsM2hTdm0zaFhOQWcvT25tcUpkelFRSC9XREpG?=
 =?utf-8?B?S3craUV5OFBGT2VnYnFBdlp1YUlvbmhkMkhDRGdlYTY1cGVpWmJ5NUgyeGV1?=
 =?utf-8?B?YUNLaXZyalNjVDkzeHZ6Wk10NGMxeEErYXVBM1VjSG9XdlQ5aE0vMi92V0hy?=
 =?utf-8?B?MGFXaTM5Y1ZLYVRKUmNMOENaWjdER1M0ZnkxTHVPQUhHQ2d0WWY3dEFpZHdV?=
 =?utf-8?B?S2FkeDFaOHZhQUlpaVJSNjhOSVVja1NhWFk1bXV6ZVVRUStsN0Q1TCtOZE1a?=
 =?utf-8?B?VHZqemp1QWpkdkl1RXM1em1ocFZMSTBPSjBDQS9mTjdWUTRHdjlxSXk5UTFD?=
 =?utf-8?B?cXU1VzlHSzNxbWg3MHlUbUE3NHBDbzBPQ2g3TzFLYmE0eFg4eVA2d0FhT2Rt?=
 =?utf-8?B?SGN5djA4SXYvdWl3SlJEZTFFYTYvMVdMRGRGT1FzTmYyUVNrSCtyaHFBaVRZ?=
 =?utf-8?B?NEY1azZvSVBEM2FRUmFGQjMzQnp5cU1wYTZiZWxnVFpYVDZoZmNPWGpGcEpp?=
 =?utf-8?B?UlFSVzVFS0xSSXdKOTNabFhScFZQdjcrMVNnYlBTekswbzN1OGxlcmh0dVlh?=
 =?utf-8?B?TTdmTnlhc2dVUDJYSmZFQngxUFUrTnJpNWg1OGQwQjdhTE40bmVyS2xMRk9Z?=
 =?utf-8?B?dmgwZk4rdFI0SVVtQ0Y5NWxLT3RxUFpERThFbHQ4QXlCblFiRVNiUzNQemZB?=
 =?utf-8?B?VldobUNaMk5mcDNzMVhsUVZVSFV6WXNwTDZtMmNmbW1oMEdWUXVIRzNZekQv?=
 =?utf-8?B?d2NaaGVicDVDS0hiR1NMenVCWngzY3dtUUxGbDJ2ZVdheUZUU01uR0ZpWEdV?=
 =?utf-8?B?UEVHdFZ4RnNUMkZFdi9teW05N05uT2s2MzNtZmY1dGIxN0tNSmxIaFh5Si9C?=
 =?utf-8?B?OHV2QVVXV2ZNbVYza3RsN0RWUjJYYXgyRGlXUXhYREU2ZWxDbnY2KytMelUr?=
 =?utf-8?B?SVhqS1FweVBTamZQNlFISmJkd0lmbEtHTHFCVVFQVjhXZ0JCYVFiU3ltcDg1?=
 =?utf-8?B?Zm9rdU11dDRHVzZXVWZjSTV5ZzN6azhmR01MNWg3TG9OYzBwUDZKTHFidEll?=
 =?utf-8?B?L204ZDhZcHpRRWlQRldXdXZnR2FvTDlQRVV4UmdMazY4TkpNTmFlR216Z1Bl?=
 =?utf-8?B?Nk9zOVVJTFdZcCswQXhaWkxocS9iUEFrT0lRRFgxNlNRek43dU9DK1ZlaTJP?=
 =?utf-8?B?QWVJUTlqQjZUK254aGFTSnA0bDFPTWkzUE5iV0RZMEFHMnZkODlKbHVER1V1?=
 =?utf-8?B?STlGNkoxTmpNZ0Jxdk5NTXVLZlN1dklEcDIycDU2QllDKzQ5NVQ2THgwNWt3?=
 =?utf-8?B?NHZUTVIvMGYrK2ttdFJkTjhwRHBKelBmZXQxaWlGU3pTNFRxREorN1ZGbVAz?=
 =?utf-8?B?akowcGpQOTRUSUpvVlN1NDNKYkZEVUpPcnM0SlZoSmtpK0Qxbm9YdzdvbTh5?=
 =?utf-8?B?WEpEeFZ3cDcxYlNoZ3JoRlYyL0Zsem9hQklUaXFLZGg3dTkwcHo1M0VoT2sz?=
 =?utf-8?B?dWZ5VFR6amNWOVNyakk5Zk9sYnBVNk9CRGNWN2xrWWlESzhaalBrNThBeUJs?=
 =?utf-8?B?UTZQcnpXSThqeTZuSkZyTUlKNjBGbXZsNW9aczhGYXRrSUo2RlYxMndGOEho?=
 =?utf-8?B?WWdmakZzZHNUZWNaaklRUjZFaUFsT25MbFgrbXVDQ1FhWDY2N1lBWktzaEQ0?=
 =?utf-8?B?ZHMvUWVNSU11ZGdIWThJdkJoOGFndEQ2TCt2UUdNY1BBTk1POVROWVFIUDZJ?=
 =?utf-8?B?ZlQyTEdZOGhEQ2ovWEMxb3lhWWJmL2J3WXdzc0M2SktKTUl6OEtPS3lGWFAw?=
 =?utf-8?B?N1hqVHFTN2pGZndaaWtGYkREci9NU2RCYnVQWmRQMmE3OUtuOTB0K2dLWHBT?=
 =?utf-8?B?SG9DcU9HazRUTmprK0hkenFXLzFRSGdwR0dzTXF0OTRJdEo4cVhpSzB0c0dC?=
 =?utf-8?B?WU5ldkJ0NWcxS0ZFaDU3QThOOGNFRDJqQVltanBhcElGKzRIeFczSWRmR0c2?=
 =?utf-8?B?cndNUHBrU1dTMnNCcTJzV3Ywb3ZLMmhkT29hSitsVDNORDYzS1N3SUE4NFNC?=
 =?utf-8?B?ZHhnMVk5TlY0SFlyVHF3Vm5ZaGdLck1ncEhVV1Yxc2IvMnI4QW5sQmFxamly?=
 =?utf-8?B?Nk40ZFFlYWJOSWNnQ2lSc0xGOTJNb1BGNm1VT1htSXVpRGtlN1AzUDVUNWFw?=
 =?utf-8?B?MDE1eVJDRG9YNnhOZHA2clI2OEpCMFVUTml0bUU3OW9oZk1VeXpkcVd6dngz?=
 =?utf-8?Q?XXuV5cjfUQNV6rkWfe99rkjhQrrHkx7T9pIji?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d97b57e5-e03b-48a8-8597-08debc85af96
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 06:52:29.9276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISEgBoZV8eaFnFDPoGcXDnW+VeSRkeWCEUFp2gJXk5HoOvZyOQP2ERO6O//poslhLIAH2wMJyEyatmG25Cn0dAwzv2NbK4fmkIZaNFJqQt5EUCc9wfOTTr/GfDRNjBCx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12692

This patchset aims to add one change to the S32G2/S32G3 dtsi support:
- Add PWM dts support for S32G SoC based boards

Khristine Andreea Barbulescu (1):
  arm64: dts: s32g: add PWM support for s32g2 and s32g3

 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
 3 files changed, 133 insertions(+), 3 deletions(-)

-- 
2.34.1

