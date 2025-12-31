Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FDD450FE
	for <imx@lists.linux.dev>; Wed, 31 Dec 2025 03:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767150471; cv=fail; b=Qt7bjzrh8eIMcEBTP+uMhGWBfcBp5wkoddLYzZkCt7zLTi6T2kiTyALqOfmQI/6TM74ZENSPMWY+ad7lG4iP2hG6xLU9G/hPmFcMJXJNDYTxNDcQY+S6t95sDEsSDpmvnsO++qwXEcPoShauYNs7f3GEzlPgpqnTWKPKm6x3rho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767150471; c=relaxed/simple;
	bh=djdeLV1wMIgNfVGGQcx95jcu48ls29O7eNi1l7Yu5xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ilMvJ+S+oRqUfXnX30Bfov50DxreAx7kxwDgvWmsfE1V8i1zuOk6ojm4WD5J9F/lVazAeROUMYrs1aOFaMc7xCSkgKhKDqQ5Zfc8NmYScKlBaHlWoEDocCh55ATjLGbAAUt6KjO0hWAYYh78JHhMQZbBwV2NijphokNLIHjJ0jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Iqp1xSr6; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Iqp1xSr6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDUCMVG0/kMJiJU/oJxxEU0TlvCYt5pHKq8caf960cDlGpgdDUNicoLtFgw8uKrD4uPLEpPOUZJ4V6QsNg4JM80jufAm+tUzQ65BoXwtEgFuNZEEFZ/JHs6ipqgTzLhmyyZHXlS96z1Ct3SYC21PlhlNuZiBKEPtPZxA0Yvt1b2tB/QUD53TnKQ+ODY+nTdyRQAWyzW036uGo8ph3EfqEJxhcuVPKN+jgfL6j7QQzEREeGbjB3SCJimlWDPR9H3eJdL6h3+TIgAe2UfRY9/zABsbZJzdC3Ydv5GtfJJuH1BflQaJzlYMlT/IMUdZXJW3aI4IhAUoWcSJKv135dwRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ou3HvS68q2GgmRwTS0eYG8uYahbArN1NaLghzVU3T8=;
 b=IU+b2IMrV86ovKTsbjMMTzZqWWFvuSe1rmcbNL5okLIviB8rNMG9Ty+nnlGmqrQRg6WskJFQQcLRd/W6SCJeLPgLmyXQ+yVpEeh1r3pIZtvEKqt25hz65q15bT3VKoW1V6yxxWbyovFOViM5wPVAkjo8kvPKoo+/k5yjo0j9+ZTEBdcapC9FDmWvCqhfEdoq5GRghD8nBIyToAm66l7PO9Q70tXBQyDC7DXuN4Gh0w0q7x/nbq5VhYERjiXe1SiImgJ0fqh8RZA2BSlEJDIPK7193jfmfiZEQp03CtuXDLWr1Y42ccit8rAIX8m0ryCefEXjK/3mql68kqmAQ+4hhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ou3HvS68q2GgmRwTS0eYG8uYahbArN1NaLghzVU3T8=;
 b=Iqp1xSr6Wt3gMkWZ6Im+rAZieT/+ey+MnCrnOffgr0+EAWEmUWTB6s6/qqg1lx58/I54pob2hsneF/aDguiVSuhplrpu5elRIt+RI/e03aC91FGzIUDZnZ9dpFszZNOGG6M0C8ww73EmZjtf7m0iqLhO0loe6LlGj4IwjVW/rbZdnIAoDzMpdaJhDZoUPN9Z7h7EU1T1bWSz6UxRPVu6oCZ03hbLdPotUJfbBrCgh7s8DR/czjQtqsfDSbfQQtQ2Rszy80oHW10KdETfR3Z+8HQxk2dSSBvhVGJw0Owxl+qxHfZf2QEo2SYS99UP3V4vqamMUV95T89GpoVI9r9upA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8161.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 03:07:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 03:07:44 +0000
Date: Wed, 31 Dec 2025 11:06:13 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@oss.nxp.com,
	kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
Message-ID: <aVSTJdnWm2KfpXa1@oss.nxp.com>
References: <aTACuRjC_Zpf8IOU@oss.nxp.com>
 <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
 <aTD5np-HGaJqhzkD@oss.nxp.com>
 <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
 <aTKVMAMQ6v_BwD6R@oss.nxp.com>
 <9b593731-898f-46a7-8ee5-68f8c170351c@mailbox.org>
 <aTYxm_dfMwF4H0_b@oss.nxp.com>
 <53ea529f-3538-4ab5-aa99-0caa6729b4cd@mailbox.org>
 <aVM-mSkSubMPd7Du@oss.nxp.com>
 <6055d6f3-2b31-4225-a42e-0f5ad79f7256@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6055d6f3-2b31-4225-a42e-0f5ad79f7256@mailbox.org>
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8ad728-599d-45c2-5c7b-08de4819c4a7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amM0Zk81ZEZUdDRQYlE2UFRyRHZ2Mm9McDhhMEpIMlR6NFJweTNJR2hMSFpu?=
 =?utf-8?B?d0FsSzZONnZFSE1Jei9aK2JSeGgvT1czK1RseFZSNlhyUjlSL0xqclV3bDRy?=
 =?utf-8?B?UUltL2tNbHA2UnVpaVYrK24vN29rQ2ZocnlPTDZhL0RrUC9XK0RPdkh2V05P?=
 =?utf-8?B?MExNQ2QrSWdUamY1MW1CZ1JrZEREaHFOaXF3ejNJRmJ2TExCc2Q2ci8yRFRI?=
 =?utf-8?B?SU5KU2NEUFVBOTBKdUo0dkNndHJEMzhlcVU2dFIyTUN4Wk5YOXhwZEVET2Yx?=
 =?utf-8?B?TkYwbjlFZjBrdDM1Y01KcWdseW0vSjFYaG5JZWVKY25TdWd5ZlM2OTdmMzlo?=
 =?utf-8?B?NVlOTGtEOXFuS3pUbDkraGJrNHN3bno5cGdBbXlVVjF2QjB6UHcyMzBSQ2ZW?=
 =?utf-8?B?dThEZk01RnpJMTEwRTB1WWFsd29FekVTSEZGUDdHWEJiUjZEMEkwNXlwMWtF?=
 =?utf-8?B?ZzJ0cmpFZ1NLWWVFbHhKK1pjOWwvUFNKL21uN0FuYU1aaVorRlc1eEgvU0tL?=
 =?utf-8?B?Y2U3T3o0MUNaZ2VNU3B1TUgwRnk5STJSZU9na3ZnSEdEYktjRC9ybzNwWVRh?=
 =?utf-8?B?RnFpYjJxRWVRc240bWRqWjhxQjJiN1lwN3NyVytOZ0hWMHIyK3NyS3RxTEVI?=
 =?utf-8?B?QUtZV1g1Z0Zhc1RROWU4SzBSV0tVNFpHUTFROFV3Snp4ck8yczRGVjBQejVj?=
 =?utf-8?B?K2FiUE1CNFV2anpMVTBOM0dOVE01VWlnK3kybG0vNkxwRm9aVEROSFIxSmRX?=
 =?utf-8?B?SURiYW5Hc21uTjNrVUVlbXJ4SVI4TnlXWXdNV3VtbFVxalN6WmhSdithc3hJ?=
 =?utf-8?B?UHZvYklVNFZxNmJ0VFpRak8wa2Yrekppc2VRTnBPVDhmbjNRM05jdUk0bWlo?=
 =?utf-8?B?cS9JeThPM3l0cVhPQ3FvL1lMYUhIWTIyNXhyN3NCK2IzSTNQRmxsdmV6RFIx?=
 =?utf-8?B?VkpKdmowV3pmeTR1QWdFUVVZa09SN0p5YUdaM04rS083d2lYRzlqNXV3Y1Ux?=
 =?utf-8?B?WEdlVnBSWjluQWZmRDkxYWpiTWVrZXhmNHFnMVEwbXBjUENGaTlyR0ExSjd4?=
 =?utf-8?B?N1EyQ1dQTllDcjdXOHFLY3BtT0VzVmV4QWRhTDJzSFpqaG5odytRcGo1UmJa?=
 =?utf-8?B?dlBrdnlhQy9HbXdDZEtVaVNsbFVKdDAvTEVQenVJMTJ5akZVRTFNQU1aZnpQ?=
 =?utf-8?B?QnBNRUdRY2wyS3FRWmcraXZqTGNydjdQRllqWEpuRjNHNjdtNVRBVzd1MXFP?=
 =?utf-8?B?NjgraTJGektFWnJvcnJieWhHVnJ4K0Jncm1UQXRrS0s1OCtjQWNZL2ozUEdw?=
 =?utf-8?B?VGI5bU9MbmxvOHJQdDRrOHZpb3puN2R2ODVjYkI0Y013N3pLdU1JK0QwU3R5?=
 =?utf-8?B?Z1NUVnRLMTNmZEJJSElISG10MkYyOGZ4N1FpaWZjbXpCSFVCOVdYNWhVcEFv?=
 =?utf-8?B?eVJFM1QrSFA1S0dRZnN3cjVIa3crY2RrU3Y0NVBMbVZIb0dnOFZia1FWQTgv?=
 =?utf-8?B?SkQvM3BHRUJIYlVENXdBVWNRV2phZG52dWQ0MkZiK0w5aDF2bmRZOWhXVVAv?=
 =?utf-8?B?QmNsY1gwdENXWkRveWo3aXlyOHpoc1lZZStta1VHOENaenV1NjNIcm91VkF2?=
 =?utf-8?B?YWwrazlZSWhKbnNVb0dSK2dZQ01scWxibWVNaDluTGVvS1pvVjZvOWFmZ0VW?=
 =?utf-8?B?NUZ3c0pBUEE3MnFubkM3MHpDM1hNc0JhSjIxMzFJaHNpRzFIRzNUelFqZTBG?=
 =?utf-8?B?dlErb1dXTkd6ZVNOaHdDVSt6cWhyako2TWJ5TUVCY0I0Z093QWtoRjVoeFhR?=
 =?utf-8?B?ZUVxUVB4bERSMTZWMUo1ekpVNC9YWW1IVjg5U0QxRzVCV1loUWJaK2FRVmln?=
 =?utf-8?B?elZnNVBUTURIL3VVVU1UTzlOZURROUZSMWNkM2d3SFhUcjlsQU16OVh6S3pD?=
 =?utf-8?B?UmJUSG1xYzhuZjV3c1pqY3NvRkE1U2VzM3c1RXhCcmdMRW5Ed0lHY01xUmt1?=
 =?utf-8?B?UTUzVkVTQm1wZTYvVmlLcjM3QVBYV2ZkaW5Rb01pT3pSemtONUxNQS9VU3BZ?=
 =?utf-8?Q?/17zJf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGFyNXpvS0pWN0loNS9pdnlZK3lmZzg5eEhlVC9seEZOOXo0dHkzdHJ0TzVX?=
 =?utf-8?B?ZFZJUXBsV2hYcFBpaERmM2dKUWlLZS9EZWNPU0RnR2sxNzFrY0NlQnBLbkxY?=
 =?utf-8?B?YXNTQm44eDdudTNQRDk0Y01lclNzdFJkVmtIbWgvUUZzOUhwUE8wOTJTZjhr?=
 =?utf-8?B?RVdtUVRuTlZoVlAvdmk0R0xmYjFLclNEakVHL1RwektCclRTMFBrMjlhbkZQ?=
 =?utf-8?B?RjIrYWZBOFB4V1BBc2h0RlBEYkF4ZXFRdHo0cVRiQnVkelBFUEd0QyszT2Fk?=
 =?utf-8?B?Mnk2dGxBVTZLRHhZOHdKYkJsOStDamtPbjZGYjh3WkpkSDdhaXJQaEk0bzNx?=
 =?utf-8?B?WHFLd0Jodys1cnl5TkEwcFpHbERRZ21uV2Yxelo4NjJBLytBd1lJN0FOemd6?=
 =?utf-8?B?Vm8rdEg0RmtyZWFCUEk4Y2JVNVRZMlNxMllOc2FIUGxtVFEvTnY0ZjNvOTlD?=
 =?utf-8?B?QUdPUUJiakpGcG5LczR0YzY4UFRnTkdBTlJPVnUwbjU4TDZCNmgrdjY3Q0dq?=
 =?utf-8?B?WjVHcGZYNkJKTkMzSWsydHdzWEJIYnhxbnc2YTc5cDB5cHcvQndsSVFHTzN5?=
 =?utf-8?B?Qmh2dHArNlYwUEx4cjMwTVJxWXhDYmpQWUNkMnAwVXlTWmNEZzJWWThxWnI4?=
 =?utf-8?B?YzRNL29idWEyU3ZvaFk5amp0b2Fab3hqU0dIZmhCd1YrRjc4dWhlaDV4VWxi?=
 =?utf-8?B?My83cWIwZlpKcEgyOEszV3dYdW1EcjZKazZqTER3NjNnMWxQbWVCRUJJVXNm?=
 =?utf-8?B?OVZ6N2tITGlYUnNzSHNiYVFQOGpxdTc0UER2dk5RN05aT3U1MXFtaDJ1NStu?=
 =?utf-8?B?SGlPU083YngwY2N0L2VJVSthNy83OFhpU0ZUbXBaRjV2TTVKbVdJb0E0cE9q?=
 =?utf-8?B?QTVDdXVKSUxBNVUvb0lud2VINmlhNlMzdFdEalEvdTQ1SWRjeGNRRmE0OEky?=
 =?utf-8?B?YXdIMllzNFJpVEFtRjJhdC9yQ2JvVUlzczhRQzFmR0RPLzJCZnYzbGptZmFQ?=
 =?utf-8?B?NklEREFpSmZVSzhuMTkwaTJ0M0ZuSDJzOWdZYXF0K2dkTFRERFhiankvZVFX?=
 =?utf-8?B?QjZFTWhzS3JZZEt0NlBWOUIzWlA5dTZmTU1wT3NKYlFmbFoxNEhTMklWZEJT?=
 =?utf-8?B?Y1Fvemk5TTduY1M1ZVNlbjAxcS9QajdFU3lPSWNoMGRHM08zZ0owNkYyM0FB?=
 =?utf-8?B?cGJLK0o0NFhXUnZTazY1MzdIS1JmbzFYZzFPb0N5WmhTSk9WYnJaaHFFSzhU?=
 =?utf-8?B?b0VDTWgyKzdQZENSOTZhMGtlUnhVREhDRVJXdFlySlZhYUdGeTYyRWdNOXZ1?=
 =?utf-8?B?Nkc4MnNwV1BmcFFzQWRua0VKRlBzaUNWVUdTNElZSHNEeHRHdmYyOUFkdTh2?=
 =?utf-8?B?TVk1RGFqL1ZKekNHd1FLSm5lUy82L05tK2tBZFp4ZHk4KzVKNUZWR2FGSWxm?=
 =?utf-8?B?ZnVVZlNydHh4UHhlMWx0Z3R5cmRDbnpDMEg5UjV2ZUJKMnV3OGk0YVpudUNG?=
 =?utf-8?B?L0ptWWdHZnJ4RkxHcjFmNmR0TFBqazJWU0tYNUhCaThYMWFpcHp3RGRYeW92?=
 =?utf-8?B?Y1B2RDBGdkZjTWZxdEVYd1NIVGdjREl4VGI0YkJQZDBPNW1HOGpORmtPbC9R?=
 =?utf-8?B?cTRrak5hRVN2cEFnRkxWanJWMjhzREJ3OFhPaWpqTE1tcE5iR1RqT2draUlO?=
 =?utf-8?B?SXQrYUhYK1B5TUVJRkR6Vm0vdHdKYUxtWm0rckRYMmlWNDVtR2M1RTZjblhI?=
 =?utf-8?B?SGtXRWh5dFg1eEdiMVZ5dEMxbmJJbDdJVzNVeStIN0JKaEt5Q2R3N3Zabmls?=
 =?utf-8?B?MVZ6aHY1Y1dtRTk4NXprRG5WVmdEeW9keklBQ3ZnUXBqbXBWNlZ4VzBLOVdW?=
 =?utf-8?B?ZXpGemJURkZpZVI0Y0ZHaW92Z2J0dXFvSW40Z09HREI4L00wS1F6UUxVM1ZB?=
 =?utf-8?B?K1Z4Zjd5UzB2SWk5VFg5SHBPbTRXUkJXNmJrQ1JmbWR4R3FIcWlJTUoxeTVi?=
 =?utf-8?B?VG1SYzhJc1dBbDNmWXRXV2R1V3VzelpUdmc4ajVXNEVQZTdEMGNZZ2lHOHR5?=
 =?utf-8?B?K21oODNFQnFINWZRazRTcVlOWUlUa0NWSnVSeEZRdXlwZmNjRnRWc0NUbW14?=
 =?utf-8?B?QlFQalVFNStUTVJYWjJERDQxMDVzeElZTkp0UWxnWHdqakdNWnVIZjlLV0Jn?=
 =?utf-8?B?b0NKWSswMnhHTnIyNmQwSVR5YUVLT01nbHNxejQ0d2w0YWdYVVBIenRhaWp3?=
 =?utf-8?B?Ni9iZUYrY2dxZW5FTXgveS9RejZTdVRsbjlZUEVkdHN3UEF2V3VOL1hXQXY4?=
 =?utf-8?B?dGV5bDRBMERTbEMzR3NiZUtBWXhWY3pZeEMzc0N1Tlk3SWRxY3AyZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8ad728-599d-45c2-5c7b-08de4819c4a7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 03:07:44.6384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RER7cSrJd+ubcZv/gxYOFe0N+hIQCseUfi8YL4ZMlhJabHQIE1TNpguWswTZgt9htMgz48LDYYev4H8jSh4NxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8161

On Tue, Dec 30, 2025 at 03:17:44PM +0100, Marek Vasut wrote:
>On 12/30/25 3:53 AM, Rain Yang wrote:
>> On Tue, Dec 30, 2025 at 02:53:38AM +0100, Marek Vasut wrote:
>> > On 12/8/25 3:02 AM, Rain Yang wrote:
>> > 
>> > > > > Okay, I’ll submit a patch later.
>> > > > > The commit message should reflect that only CLK_GPU_CGC is enabled.
>> > > > 
>> > > > The commit message , and this change , is unrelated to GPUAPB clock.
>> > > The commit message is ambiguous. Could you clarify which parent clock
>> > > you are referring to, and whether it can be enabled by CLK_GPU_CGC?
>> > > If it was CLK_GPU, CLK_GPU_CGC can't be able to control it.
>> > 
>> > The commit message clearly states "These new GPU_CGC clock
>> > gate the existing GPU clock." and "GPU_CGC as well as its parent GPU clock."
>> > , I don't perceive any ambiguity, sorry.
>> > 
>> > Frankly, the whole GPUAPB discussion is entirely unrelated and it only stalls
>> > application of this bugfix and keeps upstream broken. This is not helping.
>> > 
>> > So unless there is anything in particular that is on-topic and prevents this
>> > patch from being applied, it would be good to apply it, otherwise the GPU on
>> > MX95 in mainline Linux is not working.
>> Hi Marek,
>> 
>> I’m not opposed to this patch being merged into mainline, but the commit
>> message needs to be accurate. the parent CLK_GPU cannot be enabled or
>> disabled externally. The last sentence should clearly state:
>
>Look here, this is what you can do with the MX95 SM:
>
>"
>>$ clock.r
>...
>083: gpuapb               =  on,  133333333Hz
>084: gpu                  =  on,  800000000Hz
>...
>174: gpu_cgc              =  on,  800000000Hz
>
>>$ clock.w gpu_cgc off
>>$ clock.w gpu off
>>$ clock.w gpuapb off
>
>>$ clock.r
>...
>083: gpuapb               = off,  133333333Hz
>084: gpu                  = off,  800000000Hz
>...
>174: gpu_cgc              = off,  800000000Hz
>"
>
>Notice how all clock are disabled, including GPU clock.
>
>That does not agree with your statement.
>
>> When the panthor driver enables the GPU core clock, it enables the GPU_CGC.
>
>It also enables all disabled parent clock in the process, which includes the
>GPU clock.
>
>> This ensures the description reflects the actual hardware behavior and
>> avoids confusion for future maintainers.
>> Thanks for addressing this issue — once the commit message is corrected,
>> I’m fine with this going in.
>
>See above.

Hi Marek,
Based on the instructions you gave, I’d put it this way, even though the
CLK_GPU clock can only be controlled internally.

I’m fine with your patch now.
