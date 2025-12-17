Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013042.outbound.protection.outlook.com [52.101.83.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA8C224B01
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 01:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765936762; cv=fail; b=IsfDQ5RtJJHkjbVbd2ODlnu22hwgAh8/uWht7t168p7mv2VGmnAzx92bKjkMf/iu55yTp7JsdozRMvdcrLwgpRWQt+4kH7yDQvvsFPpB739b4joMHmxu/akiM4lEQ6j+fWSq9VqXedRMp+QAjdHvAd0ccdund7lx/eu6BQ7xAB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765936762; c=relaxed/simple;
	bh=PvsKKXEnt7VFFdmbSve1kB+tpkIxytziyvL4rApzFlQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PgaPowpeKfubj/3q2xKyvKkB/zvi9O63POD0mOyVL7U8/d8D+pCEnUHMEa5pZudZeR3Vz+iABKhccqj3wqWcNCLgMfZ8Q4Q+5hk1sWcDqpjiLMLtbxMf68OwAaj9r0Cf/sXs0ruvRqPO7v9IfT+BIv9B2JJlC6Oq2LanhlUpjSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TrtCf36w; arc=fail smtp.client-ip=52.101.83.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TrtCf36w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/tfuml9gXO0iZsjD854dvLI7RaybYLoTzwIGpklYrUCS/sSJdGFtwdtq/ojJcdjxTZJxPRCXSuG/bpilnOTEcf3tz3xzPrRJU+TS++Dx6wBOMGEQv5QxbpRd98+lanevyFkAWR/MsHYQWKONsSip33ZnBdw0ZTGBq+M3rJPE5LsdLL2uL3jFIJrQrYT6SH3aCXwMcolN+k3G+En8h90xAZZ2ZjPsEil/lUiRjB1bfbpYcJ8byJ0J6Trll474SM+XgkoFXQX5cnEzT8ZIXpRGgu58FtlLdtDeHkQ/23ustzeTKlC9bGC2++SMMml3lqCFvP5JcfKrfVZZDpWxBeh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZQyraTxVOsoRJCVUyMyE8CntCwXeVFEH8cK985ir1U=;
 b=w+SreOjQMYmmx1trY9enLJNiaDSa4HJZAPB8UoHQl0z9Bzx16PD9Vat6NAdDh4DdH8lnfGA8GoV4Mh51CNovyCNxf4MRVSfRtMR671BZ0qh93QZomhVZqPWuSTSRJWyrEGJ+7gyxfrIZ12T3lNlfXugc9hb62hgc/RPhHwOlD4bzqgpvuktIYJGiT3+CApwvtR+FtDf0IDLBbZYQxita01Cn26bwjMrxsEQkrrMUgRMJzyzfghFKb6kcJ6ZmFw/Q86q/PvBLJUfeMmu0DM53oapSe95IDYr0fFxApDje5r6fXeVsD6txHczjgWCwjTqmsLEhVk1Fdddt/dqCuu1suA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZQyraTxVOsoRJCVUyMyE8CntCwXeVFEH8cK985ir1U=;
 b=TrtCf36wyvSL7UBabjbLrkjfpHoxJYNamA6Qp7PeDH2+5Oxd/7fuRAAw/Ed540s/o73MMUnD1jDdOO1vVvGuVXhou51FvLE92Re/yMx+tSyzHz6vlMsRS4jYhUCXheRoDyH8QWbIrnWlQIgKKZMMOlyMoVQzV8TI1NXW1b0AoLFycflpSEZyrJVpZN6D0hyaNOjJGQPWlXh8I9LndpBgPT/gIbA4dBZvFU/tYmIhj+6dVpm7/IbvzLssUZ4Lyem67CX6iKxpVTqzu2Pa+EKgVeTXPLqT7iKLuqdi0cclIa55sbDOSNQBUyyIJvM1NeFyntA0y7j5e0FGXuYL0aZdgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB8953.eurprd04.prod.outlook.com (2603:10a6:20b:408::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 01:59:18 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 01:59:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 17 Dec 2025 09:58:26 +0800
Subject: [PATCH 1/3] dt-bindings: arm: fsl: add i.MX952 EVK board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-imx952-v1-v1-1-a55a7fe2df0b@nxp.com>
References: <20251217-imx952-v1-v1-0-a55a7fe2df0b@nxp.com>
In-Reply-To: <20251217-imx952-v1-v1-0-a55a7fe2df0b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b57bc95-2116-440a-919d-08de3d0fe36c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|19092799006|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXdaa0FUcFNHOWxoNktmTWFUQTg0YUg2WFc5SzZYYWIyMTlxTVlqWWZxK1F3?=
 =?utf-8?B?T3pVdk54MWFCTnVmK1d4SEUvQmFwTWozNTNMZ0ZBRXNFTFl4VEN5YzAwRncv?=
 =?utf-8?B?emg1SU95MTU4L2RKV3EzTHV5UGF4bktyMUpNV2JWRjh2OVkwbTRxME81TXpj?=
 =?utf-8?B?Wkh6cU8zUENDM1hkL29JKzEwMVdOaGlCOE82VTdzeTFFYXlRNjY2RVFJN1NG?=
 =?utf-8?B?V0VyL21Ua2ZBT3dMTitrbzJPNlU0Szl1N0dzaDFlVFBWL1lWL25zQmg1aklV?=
 =?utf-8?B?a2Y0aFJQY3hnOG5MaldseFFiaEFBSGd6em85UHRTcGVnSmtUZ1d6WlllT1FL?=
 =?utf-8?B?Y0RqZGxSbUN5bThqZ1RxV3lVWHR5dlJnM2JZQ0FHdllkeFhyK24yaTRDN09a?=
 =?utf-8?B?d0lMRFpaUUI0WWo0eFJkQ2pQcG9WUHZWMlc1VHNEcFdZeVVUdmxSeE1Ma29v?=
 =?utf-8?B?RVlrd1grK1NPV2FTQy9JOXhqQklWSWRic1lpTGthOTFLZk5JTWFRYUtYdElI?=
 =?utf-8?B?ZnQrSlAwbTVyVHJSbHNGL2JZMXV5ZGhPOHRqRzc1a1EyQ29NNE41WnQxaklY?=
 =?utf-8?B?alFXTGlUdURvRnNNYnp4SUdBTk5SVlozSHFhOC83WDVoM0NQUUpCdURZNFE4?=
 =?utf-8?B?cU1HQ3F2N1VPUXVYNWFPYzBNSDBnTGtYL0hLaUs2QlFoR1owYUwxdzdrVnZp?=
 =?utf-8?B?Ni9zN0tJWWRPTXBsU3l2dDg2K1pwOFI2S0pncG9qZjBsK2hUOHp2OGdrK2cr?=
 =?utf-8?B?VVh2dE9mV0YrZWpIdUdTY2VCNVBrMUFhbXErWVhrNjliWE5WcUt1WFJTMmwv?=
 =?utf-8?B?eHZwQ3ZwNUdnVWhXUTd5ZGd6dDdqd3d0R0NHZnFzYTc0TGFMOVN5bCsxMUs4?=
 =?utf-8?B?bmZmdXhoQ2h1d2NwL24xY3l5YTBKYTlRSlRHbWhGcGVEbCtsTnk1OUxsdzBy?=
 =?utf-8?B?WDVtUVF2YTRvT1FKQjVCb1F5cVBrYTQvTkRadThqTUtCcEpWVFpFc0FxTmF3?=
 =?utf-8?B?QXJvblhDRmxHaGdVbkFWUUJLT3IwamJsbXhKU1RhWTRyOW9pTi9WOUIzNm5L?=
 =?utf-8?B?anYvZ2NpazVGaTZQaFcxYWRLWFl2azZBRWRDTkY0UnVpQWRUOWxZcm5vWUJv?=
 =?utf-8?B?K1dnSTdqR1pjczBhYWd3RzRtRzZZSy9Cb1pOa1RLeHAwZFVmZjhWRkF6eUJB?=
 =?utf-8?B?blNlVG85V3UwSnpWZkJ1V0N2L2Z4aUNpaHFjVmUrNEVNVFNIdzRDT0dtWlNJ?=
 =?utf-8?B?T3Y4ZnhoNkc0bW5acEIrc1AzYm1DWDFkb0Vya2ZoZHc4TTdvb1pMSThqaVNG?=
 =?utf-8?B?Mk5XRXJJdkR6aVo0M2NybzFoUUtOWmwvVC9PUTV6TllQT1pydnZmTGFlU2tU?=
 =?utf-8?B?SVIxZDZEUDZaMlZrOC9FZExXY2tPajMvNEM0NmVhdWxSZzU4K1MrU2d5WWVM?=
 =?utf-8?B?bGttaHVobzhqSjhGQzBONysrMnR0djFtOUF6M3NENTBVd0p0MTA0d3JFOFVW?=
 =?utf-8?B?U1oxV3JnWlN5N2hBV3VLaWJMeTFObXpTaFJvY3FEYVZVdU5yWktxNEVsQysy?=
 =?utf-8?B?NktYNDh6WUx0T2hUTVR1Z01kQUhXMDR0WWFvd0l6VDFORThkMjZ4WWdIdVhO?=
 =?utf-8?B?WTBVeEc5bTdKdUpOYzNrb3NQOUsxZ2l2RkgzVHgwUDZ2eDl3QndyM2tGVFEw?=
 =?utf-8?B?OWluSGNad21hRXRVTHNFUkxLNkkxclAzL2RDNjRZbjI2bGdqbVNXSExJeUNY?=
 =?utf-8?B?Mzh3emtZMlRWcXRSY2c3OTVua2dmSVlNb09VZXZqSllvS1hicVFkMkNlQWd6?=
 =?utf-8?B?SEZOTlhLclpLVVFMaU05aFlyL3laLy9kb3grRHZmbm95NDBrdys5UklwTEJH?=
 =?utf-8?B?RUNkV3ErOEluWFBScmkxTU5qbUZvRFRNd3NWNkwwN0MrSzJzWVZ3MWRhaFdu?=
 =?utf-8?B?NE04dDdpUElzd1BUcUhOTG5aUlRYdmhaaG9uVCtGeDE1enNxRFJFREN2WEtt?=
 =?utf-8?B?MHhWS3oyZ0luVzJ2dHhDa1FpaVdjc3pYL2x1bVByWTFOTmpiaGdLQVR0YStO?=
 =?utf-8?Q?MXEdGL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW1XSW1DL3RKWW9TbWF3dnpZN3pVYnNlMzhkSVhDWnN3aWYzclo1eGpsS3dj?=
 =?utf-8?B?WCsvdVUyVy9qL2g5bVF4WGZEUCtNakZKSkZnbEh0KytvbVZYc0t5eFpYdVBp?=
 =?utf-8?B?cU55a0RoNzZFUGozQVNzUWZBVXA5R09vRWdWa3NSV09FVjVxQmh5bXN1SXl6?=
 =?utf-8?B?QjlueWdycHZoeTlUZDl1bkhFRjJpTjFIOENqMnlDdS8rZUcxaFpOOCtKak5B?=
 =?utf-8?B?WHlvcXNpeEpBNGVnUzhVQjd2YXNZd21Ed0VPTDBrMXNsOWlCRG1QTm13Kzdr?=
 =?utf-8?B?V3d6bjBtUklUY2Rhb1BRajdkUE9XMnFuSXF4VTh6SHdyY0RWM2o5SlJwSU01?=
 =?utf-8?B?RWxwdDBtenBpN3NqZmpsb016cTFTNm56VU5rVVlSNmhabHJqUGExL1JZTFN1?=
 =?utf-8?B?UUt0VW1tQ1JOTEx6bGxvODZIUGpUdlAyejAzZ0ZLZnJMamc0dWd0N09FaUpm?=
 =?utf-8?B?QnN0ZGNVa2hTK0FXNDJvdDRMWnU0QTY0eWEzSml4djhNUytXZkxCaHVZRDNi?=
 =?utf-8?B?RGlMSUhOUTVUSkphZm1RR1RmUDJhRFp5dDFsb2hZUEhZeHpJek9kRy9lUWpj?=
 =?utf-8?B?dzFaRFpPeS84eWp1SXFkZkVqdHoraERxVnhUNlduQVdNZFhlWFNTV0piQ2pP?=
 =?utf-8?B?djZXNVV0QkxJcmw2eUUzbVRZZzA4SGovLzZ6RXZ2dVRSckFTbmpUK01wRVJU?=
 =?utf-8?B?RVNqOSt3bEdqaGhkRFNOeHkxK3JuZlV2WW5ORGk0Wngrb24xVTZPZ0xKYURL?=
 =?utf-8?B?Y0xZeHZId1hmMXFPNFdNWVBRUllvYVNPTXZXdDFNcWFiY2JFMEZ1WjRvZGJO?=
 =?utf-8?B?Wm9ncElmZnhzTUQ1d3plZlNiOUtSNzBaZnZJTHdKUG8veUEwRUtwUGdYeis5?=
 =?utf-8?B?d01NMThhSUFHaGNla0llSWdZOXJrNk1uc1RaNkZacGVmUmhHblhtYmJ3VU1i?=
 =?utf-8?B?MEdkN0xBVXFxYVdSY3k4ME82WEpUb29BRUxFU3BSQ0hWN2JZbksvbU95VHNW?=
 =?utf-8?B?T2FZK1VybVQ2am0yOGtURC9FUmhWVFBJNjBlNDArclQzU3ZwWWJ5dm42SXl4?=
 =?utf-8?B?OWcrRFVuYjBJZTk2SEVJNU5GNjlTWnJmaWRNREppTWs3bDVrb3p5T09uWmRs?=
 =?utf-8?B?WTE4djdmS21aSHlzdDRuRlljcGtXWE8ycFNDY3duQ1JxQURRN1BoTWFVdExD?=
 =?utf-8?B?aGU3blgvT1Z6akVDZXlpR21xZ1VkMDBwSko5M3p4dFV2VDRUa0hhbUdFWHBE?=
 =?utf-8?B?bVR0ZmxnMjR0QUdhRnBBTnRGdzdFWVZjTGJQeFdKV0FNTWZUQXVVVHJjQmtK?=
 =?utf-8?B?MXVzbjBtWUVvR0RzOHhEYmVuTDdBYlp4STA5OVg5YUVWTkhNT0Yza1N4RlQv?=
 =?utf-8?B?Zit5UzFVUnBsUHhSc0x0cmFmWGVDblNacTBuaExDMTNTTEd0RERXUzlhc0xu?=
 =?utf-8?B?Vk0vMFlJelJEYi9rNDBOZVkweFZRK3gvR2pFTVc3UG9OeHZtYUxlb3NqYXNL?=
 =?utf-8?B?ZGppeFFLMkVaYnUyenVHU0thRUNyZ1R2bkYvc3ZjczZDYnBkeFRid1gra2R3?=
 =?utf-8?B?Y2hNdTJPV0c5b3FDQ29YSU5nSkRBKzJNMzBFTHVJYXdvOU1CbVRaTk51QUZy?=
 =?utf-8?B?Sy9yZU9PNmRjSGh0VEUyWkxqREZYeEg3eEd2YTFScmZONU1Qd2lTZTNiOXl0?=
 =?utf-8?B?RFE5enRsMkZCVVZsSFNJemlYdWJ0NWxjaFJWejQvMEpsNWRBWkVvNStpZjNs?=
 =?utf-8?B?dFZpT0grRGxqbDB2YzMxWU96OVF5L1d5Wkphd1E4UFpMbDREYzVLdzlEcXJn?=
 =?utf-8?B?dkRqOWxpRlRQV0FmSElVUDgwQldkL0pyZ1FTZEtoNytPV0NqcjU3czRDOUpI?=
 =?utf-8?B?TzNQL05icTViblMxczN4ZTByUXdkU29QMC9lT1R1UXpoS2JWeGxGVXNKTnBK?=
 =?utf-8?B?L0pmQjlQeFJuMy9qTzhORHBXdFRnUElURFdROGViKzFJRnYwS3RaeW1yRGtv?=
 =?utf-8?B?bHNqUmpnMFZCY0hUUjkxYVU2WkFMUUM4ZHZlL2dBWlpNMDFZYXNpZHFxMG1T?=
 =?utf-8?B?dkdUOXJXMnlJVnZDdy90QVI4VGtXNTh0WWoyZmltc1p0SE5zOFZtNGJSSXln?=
 =?utf-8?Q?F+mDVtw0WOM+3Vw5Q0EY5i4vJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b57bc95-2116-440a-919d-08de3d0fe36c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 01:59:18.6214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Go6MCDc36iyhVLAz9+yfVNBQ+lnKvM5V6iTCTH4wnWopUHBzUpWycFiLAAda3Tb/tcw3dSmD02adQcfhUW1Syg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8953

From: Peng Fan <peng.fan@nxp.com>

Add DT compatible string for NXP i.MX952 EVK board.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43b06711e2efce61ac1fc2794b79bc..b3a6f72341fcddd05ec21912e975878c9d0fed73 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1436,6 +1436,12 @@ properties:
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
+      - description: i.MX952 based Boards
+        items:
+          - enum:
+              - fsl,imx952-evk            # i.MX952 EVK Board
+          - const: fsl,imx952
+
       - description: PHYTEC i.MX 95 FPSC based Boards
         items:
           - enum:

-- 
2.37.1

