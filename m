Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE925357724
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 23:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770851603; cv=fail; b=pxt6jkCzmFwcwmBlYkI08toFo45+eKWkqMzrSwri/pH3zvB40/eRtZ8sQI70ZqUzpWYUqKiujMx3wwvpmnE/ZHFWvrtFLGTt9+1nZ2riTrGgou1zPBfv2+iG+JwXd4nljSrLffilrvG0SuMRy7ZIiTMVizyswFKznoJk3a5Iyts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770851603; c=relaxed/simple;
	bh=6FN5xRFIrCohylw5qJU8natZvxfm0tXU7lZnmXRoSGo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hlz9ez1TuNsEvqrMnKaTSaBAl5gcduYtskkjYJk09eX3Z5ZyWgLGh7V6TG4FhNntSFjfU+zDshmmhpHLApi2znmO4VwhPiy6eZh790u/3yFWNBe6P4MtK+MxndAd7IJf4eQvIDv8HwoXfhVWu/JLjEpkUmWNPHgkH59HKhvz/60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OKLl21Fg; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OKLl21Fg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNoayCGFqjyturMMkBF+SRpH6gJogEev7jzDWwY7V68SvSp06cBnmNZTmQKpeVaZRYKqEKHG3wxvCx+gs3oqvHJP8yz+Xevh6w5CtfcrBlbIz+wvRVD7XbZH1m+WEWN2ftUpQERjeWoY27G1X/qrQ2qu9OejPnQFIxmvrX400j2Dd0+1AXnq8U3Yng3MIUclOUTLtucFhnNoueHkrww2uvVnPEjSFpPjfUy4Eyre+5nyHSvVrCZfKHhgNvHLCv9dZzgVXwgnVkss/2cdUeAquoIm1yBLZc7kJ2fiJKNsuc8jQ/5Qig9veGgerYL8IomtRbAow4xrx7hiiNvI/DoE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwVzplF+TuL6xO2KD/TycUHZR0WYTLiGSfeIttz5GNQ=;
 b=QcXTwE4xaWgRlSX2vtFWdD9RZeYp3mkXD8QW9xf2/cD/zumpehcDv9LfJZoU2Rmqwj/w/F9se03uC/IonSo6ISpw8+qbSBykNiIabbo82d9Pp9zcMMLY6v6phDy4FQUIjLUlmGVef44y/tHFyBYFdhlTHGMKyxG87kQNSqm7aLntmcwYCglvKLK9mWChVfGvmr2JOhyZ5H77ZXZDh8nBSVmHPEigzY45o9/jvxAOpeYeswIzeSnt6cgl/AN8ONhl2NDxq5wHVwf+W4lRUz8bMeMtaR8Slq35hVjQdJuWvKo20d5Vz96Dm0/lZDVnnCVigWUWc6Ny9qD7djXpPjUZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwVzplF+TuL6xO2KD/TycUHZR0WYTLiGSfeIttz5GNQ=;
 b=OKLl21FgaittBjk4nbmJUuJc/KNwzO9FHVd2H5xI3jWEfrYb5v4163QYr2H0SCD3KnesUrdcJZGeji6oZBE3gYAJvzLDIgOeSlUKG3GQL1xx8JuhXMnlqSSk11w7ZZYM+AkMD7Gt6Uwit1nw0wBSM0MEn68O231IcbNc2XLe9MXR7XK6us2wnm4/rYBYKtfYPGpnIsc8wcktZTWipLGRB4WXNkE8mD3rc4q9+5DiIJmaKJWc6P17DmMyGsNa8GheRZe2r6KsBOuRLzk0ydJr2nlYApqrcqct7VbxOFosJ/2Z2fhyNBN7XuNJZQOpWZ9qHGE0ZFjeBo7/f5GhCSnYjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 23:13:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 23:13:20 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Feb 2026 18:12:57 -0500
Subject: [PATCH 3/3] ARM: dts: imx27: remove fsl,imx-osc26m from
 fixed-clock node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-imx25_dts_simple_warning-v1-3-7b40e1acca27@nxp.com>
References: <20260211-imx25_dts_simple_warning-v1-0-7b40e1acca27@nxp.com>
In-Reply-To: <20260211-imx25_dts_simple_warning-v1-0-7b40e1acca27@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, 
 Shawn Guo <shawn.guo@freescale.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770851586; l=968;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6FN5xRFIrCohylw5qJU8natZvxfm0tXU7lZnmXRoSGo=;
 b=8TqguYU0cv2b4jR60ELlC2FhexjAai7ChJJfhjxXnHsYEDqG17Da0Xn7LrmdVkds4b1CPdFKC
 w/OXF+NRDFTDvPfC91Gc9cPgWBN+m8QJOkKSH9XCZGgTHqOj2QKFRMe
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d1ef4f-f841-41d0-c375-08de69c32563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WW9sZnJQQWRsUWNSRU8vN2EzTVlOSlQyQndUQ25FbUhhajJRemZqaWNGVFR2?=
 =?utf-8?B?cGJZVUUxbTJqV0hMYUpVcHJWSTgxaUUyajZLd25Bc29BM1B6UzZsTGp6eVNs?=
 =?utf-8?B?QTJmUHloN1V5WmFkclo0MXVlemRESzdwSmNVR0hJQXFZbFdOeUVCcWR3ek5V?=
 =?utf-8?B?SVhYWEJwdUFWOXpDQWt3QUNlQXNpZWxFdFY1UHM2dzZGdG5WRDBRQmJ0UU16?=
 =?utf-8?B?eWxKUkFiQ1JheTNJRHVuTHNVSEFMQ3VuUUZDY0FPRkd2RU1ZOTZqTlBxSWtH?=
 =?utf-8?B?SUFpcDgrODdtN2hGK2g3RmpCOUtmdlY0SU5TZ2RBS1o1WFJqYlczOWtpNm1t?=
 =?utf-8?B?YnB1d242OVJnMDl1K29CdFBSeHdITzVVdWd5K21IRUxiRlhRMzhNck9XSm1m?=
 =?utf-8?B?YmFvVndnZGNSNUpVOGF1YUlFVHNITW15cDhNMHFSUnprY0ZuU1MyNGFSaFNN?=
 =?utf-8?B?NDIvVVVvS0FKYW00NXpPUlh0SUpSYzZhZnJxWlVnSEh0SG1LUGNCS1BibFZC?=
 =?utf-8?B?TjRjRXcycXM3UzZILzBTY3QzdTk3Z3ZtcFV2cDk3YisxUDRISjJSQm9WMStn?=
 =?utf-8?B?cWpxclIwUW1PUmlMT2VqcnJGZE04ZnNmdktVOU5TSVR5VmtySGNwMTJBWVBT?=
 =?utf-8?B?N3hGaGZpVm1sVmh4RDBJczVKeHNTVEY3MU9lWkllZVJGdmhvWWZzRklNMzlp?=
 =?utf-8?B?MFlzaTNSU0dJQ0xhaWNYcUlYZHo0TnFaOVQ2dG1FM3dSU1FsTUYvM0VhV0tl?=
 =?utf-8?B?UXcxRi85bjRyeHdobzhhUHU5V25SSlBaNVpMaVZHUmRRa2k0ZThhWGdtNUtk?=
 =?utf-8?B?Yk9KUHMzZ29HM2o3QWJTbmE1bzl0cjZWWFRtMXpqbkg1WXVsZ0l2VU9NVWd1?=
 =?utf-8?B?ek4yVVFmb0JXRE85QmpWdEt0aVlsOUNyeWtDVEQ3OXgxWXFIWU4wSmx2bzlW?=
 =?utf-8?B?L01RLzVvVWI1YlBsb2dwTHhpVForbEtyOUlGV1A5K0tqeUc1RU5CZGJ4VlZO?=
 =?utf-8?B?NEtKYmppM1NDVDNrZWJjSkx0U1k0OFNaTHllNlF2eWVNa3VuTExLQ0ZuR09B?=
 =?utf-8?B?TndYWi91WDVadEFRdHUwRG9NaUZJM25jVVdhRlV3UTZybk11MjY3NktSRnBF?=
 =?utf-8?B?clVYdVl1NndTc1NGanROZ3ZSdDE1YnQzM0JiM0pUTE5PNXh4TDVKdWd0d3BF?=
 =?utf-8?B?MWZ0VFB5TUdwZi9sbCtwQ1k4RDgxN3ZXbUpsQVByQXBIWXR6aC81TGdTQ3RP?=
 =?utf-8?B?TWoweTMxWG1nYUV3a3dlcENEcFg0UzAxQmdtRGQwejZCSE9pMWFCd3NoaWZN?=
 =?utf-8?B?TjVmSmI1ODVWRHpDa2V4bU9oUmp1b0lzQUtoRXUzRFptZ3RMbDkzY1dpcElz?=
 =?utf-8?B?aWNMaXIzM1d2NWN2cGJ2b09hMHRMdENXNWE1VmFKTDdydlpIdjMvZnM2Uyt4?=
 =?utf-8?B?b1NjTjZ3d3AwSm15M2VMNmRzeDMySnpvNGxsWWdQRThuekd2TWVWdnZtOGk4?=
 =?utf-8?B?NXI1eVc0R3BjNDVJaXpYRGRKN2dGWFFINU83YjRyaFhxK3Bpemd6YmFqc012?=
 =?utf-8?B?cnA4dVA3VERXamhoT1ovNE9pRXlMekZlVFdxb1NTK0NCNTQ0TE02RU8vM2w1?=
 =?utf-8?B?ak55MHZwajZzNWpmeVM1Uitja0pDUndrZUU1SWJId0lTVGx0a3VQSUFxZ1lL?=
 =?utf-8?B?aHhCa3NHY2NwMWxkM0ViNmVlVXBvWmpkZWJUMCsxcm51QzNkMGVhZEpETi9H?=
 =?utf-8?B?WTNTUFY2dzdmTVBCOWE0RkM4WlIzYURWUGpxZVg4NkcrTHIzaW10dGV2L3J3?=
 =?utf-8?B?UVZDUUFVQXBtbGxrOGVQU05MVnNsUWhrWFhQclMwYVN1dkYxSFAyazRsM1F5?=
 =?utf-8?B?TDRSQVNYMFhEcTIwNCtuMVJhR0s0RjVvelZUcE81U0lUdVh5TjN0WU10Ym5x?=
 =?utf-8?B?RTFsNDhQZTkvd2l2Z29SeGRLTnNaaW5tY2MydWo5K1YyU2E1Sm9XMWhOcnRp?=
 =?utf-8?B?bWlyRVJubkxNK1VsSlhTS2YxTWhMTnJCWStRTWt5WjFRSmwyS3dyY3JhQ3FN?=
 =?utf-8?B?VWVUVlh0bjhYRGNNaDlFbDVsMFpkVVpEdVpNeGtzTStyQUF2dVJEMEk2SUYv?=
 =?utf-8?B?Q29RZEdjaVR3MzZuZHJDOEl5Y0dNNFY4NGpLVitPeGFRZTBOK3BWWXhtTnc4?=
 =?utf-8?Q?bg+TggoUe3Qw2kndbHGykXg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STU0c2lVcDlXNU92bWNoRStHUHUzMWlrcjV3RjBobjQxRXBxUDZzWkFkdzdP?=
 =?utf-8?B?MStSUmhvRHZJemswNHIzTW43MEQrTXE2S1FQTWVqSEdtellMcmU0eDZLR1dx?=
 =?utf-8?B?UGhGNUhRUVBlYW1SY3pCU2paYTM0UzRCR1F5Qjg0TkxXRUtOeGxnNWxWb051?=
 =?utf-8?B?dmFUN2xhUkhGcFRpemdCbWdQNTROUU5SNzZCMG0vUDkrdlB0YkRmY1pNblZt?=
 =?utf-8?B?SUxBcW9WcGp4cUhOZzJkalBaQjd2bVJnaDZWSldpNzVJak9VeTNYamI2cEJK?=
 =?utf-8?B?MC9QcUNFMU5tei82Z3Zya1dXL1dadEZWSisxVGM2M2ZiVGFFUDQ2bWtWUzJC?=
 =?utf-8?B?UkNkMjRvUTV0V2lGV2NSenpwYitwcmdrVTBFMlFuWDM3RnQ1UGh0czgrRlZw?=
 =?utf-8?B?MFpZWmZKalM0Z1ZaNmx4ZmRPckM5UVoxRUZuWXJXUDYwZVJMeml5NG10a2dE?=
 =?utf-8?B?VldlSUwvOFFhL2hCZ1UxOVJOY21weWJCYVpuTVJHekV1VWtIYk9kejRiOUFK?=
 =?utf-8?B?N3RqYVhWcDZ0R0xWTkpNNlFQbnhiRjdtMnVLK0lOdCtJWlNtSEg1a1JyUTZX?=
 =?utf-8?B?eWVHNXI5azBudG81cjRSNUxtTXhwNDN2dFM3T2lTeTFOcEREc3hvdG5Tazd3?=
 =?utf-8?B?NWEydUp0Rit5YVIzYm1wWktoOGFvbExPNTBjdEtjenY0bTZhaVJyT0pEQjdj?=
 =?utf-8?B?YUIrMit6MGtCNUZabXNFWjZNMEd6VkpYeDRPNTNXY2RDRXZ3bUtWdXVBZ0Fa?=
 =?utf-8?B?TlU0ZHQ0aVNFaXd6Nmp4MDBpZHI5d3BWM1FqZVd6R2EwMDJkbWhwTE9sbTRN?=
 =?utf-8?B?UVFXb3Irc0wrQVk1QzllN1IyRytUZExIRS9wb1ozZG1IUGgwOHlaV09TYkc2?=
 =?utf-8?B?VU9teEduWk1ncStHQ0h2OHIxYkU3cjlVdzJ2MGdKMDhJVzJRUUtVRUl3Y3Nr?=
 =?utf-8?B?RGxjY0g0U0h4ZkQ2UE40VWNHVlBYdHJHSXp5RFUzTnZDRWZDbTY2bnFLSk1a?=
 =?utf-8?B?SzdWMkwzcEtvK3hqRmkxYmpxNjJyUVA5ZWtPMmN1SFYyWFhHNCtTQWt4NjQy?=
 =?utf-8?B?eEV1VUYvb3VSbnFJQS80SERseFBsOXJUeXpFTU1kaEdJVTU2NTFzSHZJQ2s2?=
 =?utf-8?B?V3A2dDBaZHVKWDZMc3JnS3gwUlZLTFhDMHU2WFdEa1Z6UmZYdW9GcE5pckYz?=
 =?utf-8?B?czFvc3psOUdJZ1FqbUlYR3RZb1FoTnhNRGN6R2JwQjh6OHIvcC9RL21aSmZW?=
 =?utf-8?B?OXFBZzdTeHdZMFRuL2gweUlCUm5rQWJNdG1JTVZjTVUrMWovOEFLMTF0b1Ri?=
 =?utf-8?B?TzJFakhJL0Nza2VLVm5ISm1RamxXdXpOUG16b2xzOFNINU1wWjRUWk8yQ1FQ?=
 =?utf-8?B?YysvWDI3RDZJa0RXcFhRUURCRFQ0cmFQRk4rZFpwaHVpVWEyY094RENzQmdr?=
 =?utf-8?B?blBvMzQ3ek14N1ZONWZxN0psemhCWnNMeEpLNjVQRFovRWl2T0kxMVlsbGMy?=
 =?utf-8?B?Q1hyNlp1RXFKWS91cW1ETUsyTkU1aENwZFBqc015SDQvV1VFczBwdlpuZGFW?=
 =?utf-8?B?a1lTMnZxQW8xWGkwWHlQbHNFYk9UNVE3TW9rMkxrZ3diczhlWlVBTmFQK0Vv?=
 =?utf-8?B?cWNnQ20rYjV4eE5MK1NabGZCMVNjLzBGSUNQeS94YjVBekMvRlFHMDBjUnF4?=
 =?utf-8?B?NVNjODlwaXdxVkpvR2R4aHY3ekxyeEVSS2ZIcG9GSEtDQ0dQSzEvYit0QVFo?=
 =?utf-8?B?aWZjVkdheW84bGpLVmVISm9DU3VDcVovYUJzZnJFQzEvbHh1cmxNRWJoUHJP?=
 =?utf-8?B?QWZmQjcxM0EydzFuS3lBVXVzUENmZDY2Vm5vWVJsMTdqSmdsSVh6SDVaOWRP?=
 =?utf-8?B?OHZ2cmhRL2Jkd1ZRckl5akNURzVGOFFDZlFnNUNoTFN6b3NFWlJxNXVHNkEx?=
 =?utf-8?B?S0JQV1RDaWhBVVdLaXhqTTRJQWJIUlBRWTgwNUV3ZTJzR1dDaERGQnFsTmJ1?=
 =?utf-8?B?S21vYUdPWVQrMlVQOU0wYk1IbzVLL1VVZklCbGdTNVJPRFZvcS81bGJsNU9l?=
 =?utf-8?B?T3FsZTJBQTc2bW1qVXhXT0tkTDhIZGxCY0VLV1RTczU4ajRGVHpQSC9QQ2tz?=
 =?utf-8?B?VldzaEhlQjVxNFJqdlVFN3RKdXNJaXBzRXphaWhabU5QOUJpZGwrcVQrRU5D?=
 =?utf-8?B?c25SRStwK3hTQ2lrZFlsMU5KYWJYSHNxMS9XeWEyNlJGUVV0d0JOYXhETUJ5?=
 =?utf-8?B?aGVLdkV6eXBqYXRzOVJyUUU4bXkyVjhpd3BiaG9MaU5LdjNKS0dKekRzK3F0?=
 =?utf-8?Q?XjU2OMUZEwJ7+nVvdS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d1ef4f-f841-41d0-c375-08de69c32563
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 23:13:20.1313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1k5NhZvIy1vQlq4HKvUXJNqBauOWr5eK/pl6NhwuMZa9xrCpfLn6uZTA35FVKKNxpUNkYESgpITt8ZOlHZqSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558

Remove fsl,imx-osc26m from fixed-clock node to fix below CHECK_DTB
warnings:
arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: osc26m (fsl,imx-osc26m): compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx27.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx27.dtsi b/arch/arm/boot/dts/nxp/imx/imx27.dtsi
index 99a8f2b1f7d319fd8d25ff696d53622f8badf0c7..3605b03dbc00ebcdae21b9032410d7e13b35aeec 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27.dtsi
@@ -49,7 +49,7 @@ aitc: aitc-interrupt-controller@10040000 {
 
 	clocks {
 		clk_osc26m: osc26m {
-			compatible = "fsl,imx-osc26m", "fixed-clock";
+			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <26000000>;
 		};

-- 
2.43.0

