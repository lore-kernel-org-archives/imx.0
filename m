Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14DE388E4A
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298042; cv=fail; b=khl9SYVMjIykLj8rr23WHl+r1fcny5wFFxF7klyYYwSXwjP0TUN3spBZscEceCyStyVPN3QGh4mqtao4+uineJ6wq5Z2MUi/20AL4ns3xWHImPmyBgY3V4sbBzqlPyKUyCz+lBbjXtApu6Uv0PIXCYo8IoDXboG0hOFVVuIjYWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298042; c=relaxed/simple;
	bh=KS5lv1mMPOk9dVPjzAio1Y9TDllHEQd22A/8yeKOnYY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cUCIXyx9DIofeI+mQ/akQqcBdufnFeNqTRl4ZH5ZTsITMwvfOCde7zwQIOvczAUtLUTpm/FPsBg5zWTlWLyLYkRAGnNjehmx1uQVMuflsXn817Lb8LIF3poAHSo8JT03hu7Ge0tMA80fzeR8Tgh7Id0ljBfD+ukOLCQk1wD5QhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JjVD4n8D; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JjVD4n8D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLnOXOW+MxvIIDQPqOwf3DJj2ytbO7qls0ZKVMruYVsHnhSyW656oAyfWejUg4udzj38Z859/T49788Ys9wWonh9op+vR+LDtfWpX0lHHmXiMt9sZCDFoj1lcseL4I/O852G/9tX0Nk+bIca7ihMfOBcUcttuQ3bxwD3bq8cFwXYINyyIR78SQKRh2y0Mdf2cRSCzERdj6R3vQccAQRu1nweXf1fFjtxjIQX2YKaikELZKOCVxcAKL0smfK5umQI6s+CGj9d1yWCHgdFE/QSiOLW2j892zwOXrkOoRMqsBMHqwRkNXWZj7jEztJrno3ySA7fCAPMOcwo4aXHMPyl3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KS5lv1mMPOk9dVPjzAio1Y9TDllHEQd22A/8yeKOnYY=;
 b=HgL2nqIv95mKEJngQmqLzb8r3uBpGvktCTXl4cbPivOS0sTYr0GtY8g3HrijU1CaQ+HKuvZ3VLIMb/aGEzI/9MTsHi+2bj7dh5DVbL0emekDmdA8A1Vonyr+YfQ9NnyT3aVYSKQbSNDWhbeVY80HSen2/JzTzXV4lRdUlSCyrX4ttS2YKumWFiPnUJzpdRVH+8rgztdBg9YZt3ZvdwXeZyv0s8xnn4Di6k1ktzCdUBMlPnuw7ogQ10wByIKSiWvdg1d2ZJN47V2Jgnr6lRLKu9sm1MA+FG2GRg2KJKgqfs3rZKEnCdULDa7clpij6DHy2avFNQgGt+g91wLkExaOtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KS5lv1mMPOk9dVPjzAio1Y9TDllHEQd22A/8yeKOnYY=;
 b=JjVD4n8DG6BuY8MzW3DiuPyuP3assQCCqVtivgidVvid9+i1OiHS77IqNsqhiAW0Nk0oS6IaTb5mtV93TdQb9gDEOPvhA1DMBtrt0mDpkSjp0YuHdK6xfUzvrEmigNhKT0+kDc6bpu2Xf7KkPbo6+Jyzz4Q2TwBW5tD9lZ7VtTB7KxLJM1+Jvdxc16ebmCtoj3RJJnpSLvkLir+Y+quRfh3kFaJJkWCwg9UP9levmbDe4r7URMf/sL0/mwLiyNtVqP9tlRiV/Vw7T070lfx/NYVxU/5ATyNTcGypFEc6gaswfeG3GNvjwBCTF5lqPoW40v+Nq54fHRD1U1jEdN7BMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM0PR04MB7171.eurprd04.prod.outlook.com (2603:10a6:208:19c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:47:14 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 06:47:16 +0000
Message-ID: <5f033bfc-a02e-4e91-b2f3-3920eb2cf064@oss.nxp.com>
Date: Thu, 12 Mar 2026 08:50:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: imx952-evk: Add bt-sco sound card support
To: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
 <20260312034912.4007057-4-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260312034912.4007057-4-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::12) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AM0PR04MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 45308b76-5fe0-4dc9-9693-08de800332c7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JJ8C9wZ6QrbFghTpcjCdgVC3QL8Wc3Zg17/EF98FfcXwk/srEzHRJXRyEsbjulC9fFmMmERHsIYERbdedNQjwrrwK6tathtKwxqN8c6nF9DTyfqu7MNEdtUGmEMhomEoXhDzmQAwr9a5CFxmrqJf1skCetPoesWFv37vCLqqomRtxIhgLOUN2dKwVqMRst2J1kGgoqdXEfcE8gGucSc2fH1DpBukra8UBa78kW3NHfyLnl+rkP+i9NNvOzLMuWU0JCIM54Rw8kgkC58jlTrRo8nD6NOxMKH7J4KnuMzW2phZfJfaC6F/yMGNmo7V7KVukAxxSm3cXDP5CotSk9trLTXzvSgehlObZla3DdueemIkOTD3oMbp4wcCCLqj0her9G9a4aJS6Ai6by7+pFw3TNbUGWClGvjRYdHyAzQZwvajGsIXoHoX3V+Qd8D+dzzqntqeDqwBZQeSPK/Ltmfp/SOngIxGWWjCZ4EYRtvcN62iCscAQ6vX/We7eGv7AsX/MD1d9wNx6iwOu/XjOvRVXW8+375cZsnE7w16PTKVmHd6thBf+Yzx7GIrklqgh/s3yCja3+hKCItaRXSw5Xo/vRQgIAuZYx4VtUuyDgsN9CsFxOmPZQc4usoeLHK0nXZdMT6ik0MG9UrxUNFi0p4IPqEF7M4ajGozStckrVhP9mdSimKy2yGKulkxQtpbMSS34baGKI4Ave7yr3S8zClAIJEhGTfzH4ofwROSqY4Hvc3LQ2LoI0DxhrvNuoUbpLsY8C6NHqyTYukUfnMP6njt/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3lDY0UzRmxSMmk4K0ZnMDUwL1BMcWFxTEF0RmNRcS9GZnFNYXZhelI2bzl4?=
 =?utf-8?B?RDJQTm1rWG9PTklBUlpWNFNLN3dIS2t6aElvNzREUmtGUWhlSW1Lc3lpb3JO?=
 =?utf-8?B?WVB0cGhyUFQyRS9iT0dNM3hxMGRoZG9vaXROZXNaQjhHRUZld0U4Ymx1a2Z0?=
 =?utf-8?B?Y1VTSURNRXZlK2tTK0p5cEw3a0hqMitoTkNGVFY5ZE9EbGN1cGMyek9zVjM1?=
 =?utf-8?B?TVVBdTVCMWw3YXpxQjEwS24rYmNpYUtOcFNnZTAwN2dTOGFyejUyZkJiYjYx?=
 =?utf-8?B?VUtZaHkwZXdRUkM0ZnNUMjluZVFFNUFtN3RsZWplM1VhVXNLNkV3LzFaRDRG?=
 =?utf-8?B?QjhXZkRXcDU1NlJQVWRWaHU5UVk2V2tXUXZQekNrRlhoNUN2QmlYRHp2bS9o?=
 =?utf-8?B?bGhwWEVaNURmK3hHb0lreDlIQVZaVmRFSzUxVlBqZVlHcjVsSktCZ1o0VmE2?=
 =?utf-8?B?NDNvRDFWREhDSFlkMzVwTXlNUExVM1pWUnJhUGVJWlA0aUd5YXlRSElENCs4?=
 =?utf-8?B?blczdTRzOWRHcWZ5WE9sMGJuQ2gvNCtjeXZ2TlFtZ012bXhiaElWcmZxUkVt?=
 =?utf-8?B?YVZ1ZkxIOVVzdGdCdmZSN1RVczRXbUdHM1FPS2hSS2pNWTN1d1VoN2pubFNk?=
 =?utf-8?B?ZEdCL21qU2N6SStQSk5PRGptQ1piUVllUi8xelEyRUZKOW5TekQxNkRFOVZD?=
 =?utf-8?B?MjlXQUFPSE53THpQQ3dSYzR6dGswNWFYNURsdENKZVNORHBucHVqbkVtaXFD?=
 =?utf-8?B?c0o4S3pleHRzU2x5WklMM3UvN3QvMDc5cURRb1NVZit2V2x3dmZXalRLL0do?=
 =?utf-8?B?SGZMV0hIZXRxN0hLaWlWNWdOTU0xYU5KeU5ab0lhb1lCTjNLRFJHRDR5NjRQ?=
 =?utf-8?B?UmZISXpBWklzOVVSOVY2amo5cWM0cVRDdnV6cVdvY2p2SDhEc0hGdlVjaFd5?=
 =?utf-8?B?R094TGxYVEJFOE9OaS9CcXdPaHhlNnhKUlk4cGFHS3BQdE5HRmowTVY5Mmly?=
 =?utf-8?B?Y2RDWmR5bEtQbndQWDlnTmdGQkplSmlPYXIwNjZNRUdXZlMzL2d3L1RhV2RZ?=
 =?utf-8?B?eEhkakVhclpoSTJXT3JFSkNCN1NIUTdNTVQySHdmK3ZzNmpZdVQ5ZjV5a0k1?=
 =?utf-8?B?cG9uQVRLM0tyeGxUYlF4RVM3Z1NrTXhQZ0VVT0xEZW5RVSs4aWdMNE1xekpY?=
 =?utf-8?B?cEhOSmRFVm9GaFR4YVJzYmFpTlU0YTltV0s4dldvWHp1Vmc0eTc0dlhiWmht?=
 =?utf-8?B?cHJoUTVGazQ1MWFFSyt6U2dabFYwNVQxRWp3bXhCNk54ZGtKWStHbnpMc0ZB?=
 =?utf-8?B?UVNteXJ0c01wOU9TY0pMeitTbklRS1ZzM09CU2U0MXNvU2VMZnlmbUc5NElj?=
 =?utf-8?B?V2RsQm0xS3kyalBrNHpPREhVWDJlRFFXZzF2ZkI4UWJCS1ViVTBMWGYrQVhn?=
 =?utf-8?B?OFBYUnltSlgzM3lFK0dPY3VoY2tHTDB1R1RtVGR3RVhSYmpGWlo0eG9QTUVn?=
 =?utf-8?B?UTVIeGtZZkRQS3ljL3h5VUpCMEcvNXI2U1c5ZFdzVU1IaGErenVCZytqWG1o?=
 =?utf-8?B?TGtLK2Y2amxWS2dHMi9ZUGJmSm9YTWpma1hMN3VlVWlEZE0wYjR6N3N3Tkdj?=
 =?utf-8?B?NitZNjc5NzcwbjhaUFdtZUVmVWZSM1N5SjNTVjJwc0J6ZmkxK0V5YzRHeUp6?=
 =?utf-8?B?NHh5dDlUWUkrT2FROFU4VHdTNmliYXhQcHcraS92MXIvVzhwK0lGVU1iQml2?=
 =?utf-8?B?SEdtWVJwYUo0OTFWaEdqbXdRemNCL0V6VldXcHZKUGpUMXhVZXU3cXhOeGNy?=
 =?utf-8?B?QTU5MXg4RENNZEZVelJuTEJlTGcyczlOcEgwQVFyNHdtc09COXBDNTRSNy92?=
 =?utf-8?B?bHNOK20xc2xvL20yMHlOZ0NjOGRRd0ZUSkQ0Mk9rVjdjbEVOdjU1NlM2Kzh1?=
 =?utf-8?B?cmJQaDFDTTY3bkptenJrOHM3cUlIazlVZG13QlptQW9rZ3d5NHVGMThBdnhi?=
 =?utf-8?B?ZEVGU2NxaHlnK0JybWt2SURwczdWZ0dSdjJYNlZmNzNuajVGYkhxT0RnT0xI?=
 =?utf-8?B?Z2hKSFk2S1lRZXNiU3JuVGl0T3BhZmdrNWRmRkl1R3dGOUxLMEFsc0h6Q3M5?=
 =?utf-8?B?MU8reDY0d0l0ZmVNK2dGVVhNZXVUeEVTK1MvZTFrUXMvcGppNWVhYjZiWm1D?=
 =?utf-8?B?OTJlblJ5RGdBNTRtWDhYRVBaV3gvT0dJeDBFSFZUSm5hNUlGWk9DQlBRMmty?=
 =?utf-8?B?Y2VDbGNzRlI0bHpDa1pvT2ZLRENnNlZmK2dmNnVHUURudUN3S1IyZGUwWSt6?=
 =?utf-8?B?Y0w3L1BXV3dpTVl6S3N1MWwvdWZOMjV4VFZ4SkEyUkw5SmI4NmlZZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45308b76-5fe0-4dc9-9693-08de800332c7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:47:16.4037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mY5rGaYT0kwAZTzsybxPUcmjvUG0SlB3Y3M8JqSYG0tcvgaGNarBOONEjdx7RGLWo+0hTyZEqihrKuKpJ69hHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7171

On 3/12/26 05:49, Shengjiu Wang wrote:
> Add bt-sco sound card, which is used by BT HFP case.
> It supports wb profile as default.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

