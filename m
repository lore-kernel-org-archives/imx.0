Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012020.outbound.protection.outlook.com [52.101.66.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9B71E98E3
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 03:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771989554; cv=fail; b=JdRWShXVblIKFbS9rCzdvFOoDI6iXqD9FLYfaI+3tOWDE9YE1ppVUn6qJ6eic4UEt858rmFxTnHaB8sVX1uRpn827oFXt0l9xZ12hKSCrfE6c29SqVdlreD7izYyOCWbir19anO6WYKZ842ybN+hACP2FdH9gHM6Nary96P5X68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771989554; c=relaxed/simple;
	bh=eGWK/SbnzG5ctpeOV9ZP1CNo20Gk5eOp9eZEbmoAj4E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rjtu85xAiQUDcTNWLx1spWS6DYltHckNrqT/ber4FYCn3LScVjS982D/NxEg7s3IdLWTTwMsoyyo9YESUdTW0xJ72mmYmi1DjTpCQYFeUrbpdiL0iiX7MAJsuSNliNdE0pUTzci6shlwlZuqgyW7994jERG9ONTxchKqKTVJeP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GWuu9VyG; arc=fail smtp.client-ip=52.101.66.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GWuu9VyG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMTl4wGfo7fjklrRgKuLjGbddjPjkdhoFtD6j2vrzLDKdK/85BLWKWDm/evk4qjs3tQCFz6LSpIUjANqxtqY2t9V6/hk5iN/zBW4fC9DsXpYkVRAMNYqEcJLMefS3wjDPgEPMIKTSDKTXxaiPoeskfvXpZPCuK7RHfJg2INAut5ikjXxz6URCUFJOpkseZqgNdkS/Nf0WY6lacam7IdaU15i1uqi3vRwf1t1mzi1OS7KYteEXGZ4U35QRNNZeaNNUb8GmizfRl0pqR4YG++fzebVaghrPLeYbKYVulgO+Fhpp/kl4EV/2BM4+bYmmRrJ0gNIWd7UKl7lUmf6h17uoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgQiS8YV+GLTR7hpkwSVbn78vaZyKOI/4+QjIJbjt2s=;
 b=f88FXEJTxScApBPt9R6uJsKCNP+Etl3ld/fUpG0u06GzbasrI+sKYM9rFpzHtXAkALjWrxKcpgO/gYh2z37EQprMEWKu9pEJ/8l5wwVKog5sFuoWtwgxhK6M0MgbX8pk/YTToX7OSUzaOi6ZDwgwaI0DLM1utBL3LlVRofxZ3BcvyTrBiGZlPn+Q3EX5XAXAn1XLSJcLp27aDuGae3JrChfRJdR/Eil33pb240tz0drLsuIHEuFWHcPmvy1QEQ50pcmknxhNktusRl+SPC5JK+SfTaGl6PnfpkvNnMmbOWdhgpbotHbXhQb9gq3BRt9Ghz9T5tiepOTF9Na55NNQ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgQiS8YV+GLTR7hpkwSVbn78vaZyKOI/4+QjIJbjt2s=;
 b=GWuu9VyGnXCR2a1wy3D7n3dOSYRfD2pyxBaYzQQR5JOAYUVGC7VhequMLDo6rrOvkv5vr7Nbc7LIBWu6yfXhugR52VjGvxWhRfCeZ/8Wd/J9WMybjTksla9AjjdiqZtMJ5eWDFRsaMPPVfc3kvlsYS8HXCVkPOPPo7UKGbe1hjagyaINn+riVrnzi+2z2k4O7QQ5/DXIx1T73lf48HK3gE43sO8stqKijxKRr3F5Q8Fa9GuH4MSrgPeixF1SD30i9uFQh17eNmvCX1LtX504unRcvHizoFM6q2U8zQ9c/4DH1fNfRcfnsmhddKbJLvNZhxFezhxBvr7iej86GUvE+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8611.eurprd04.prod.outlook.com (2603:10a6:20b:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 03:19:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 03:19:10 +0000
Message-ID: <7b1298aa-5386-41e9-a49d-843363176596@nxp.com>
Date: Wed, 25 Feb 2026 11:20:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-0-651ddfd13bdb@bootlin.com>
 <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-1-651ddfd13bdb@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-1-651ddfd13bdb@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0273.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: e44b7ab9-a374-4d28-1d09-08de741ca47a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cEg0amZhV3hQN0hySDJTNVVMZXZWWmZJYmNjNU9kRFl1SWNNL1hCaXl6dnZp?=
 =?utf-8?B?T3ltVWlCUUFiVHlFRy9weVQvczdDcjIvRCtXSnVzMnMrL0JraXZzZDRxOWR0?=
 =?utf-8?B?MFdxVHVSS1llNEZUVTM1YnNFMUZ6YXVtZ0VaeEJYNFZzKzl3TzVKdHl3QTB5?=
 =?utf-8?B?WFRjWU9qZkRSMjlZbkpGWnh6ZGMrbFZ4UHNjTEJOQUVDQXN3UlJxamJUdVJp?=
 =?utf-8?B?ZWtTdjBjZCtYSExlWkNXUDMveGs5Q0dibng3b2dSbVRPTFlJMC9YL0RRdkZP?=
 =?utf-8?B?VEhuY3Z4b09DTVg1QnpRaW96MEtrcEU2bnVOTTR6RzRiRlRuNmlrSTRhUXVG?=
 =?utf-8?B?Wmo4KzNjRUQ4UTl0SnJvYVEyU3IrRmZCRThiZHdrUU0vZEFac1Nua2RGYjU1?=
 =?utf-8?B?d09NOEhpVGc0cHBvNVIvSlZ4bTlsQWtESkpZcUZjOS9ydktjTjhwSWVLOFJN?=
 =?utf-8?B?TnAzcFFnTXR1K0xQb0phbXFNTHJkNHdtTlNTL2d5MDVzek04OUFXanRpTElG?=
 =?utf-8?B?RVJEVGw0OFljSmtZOWFoTFBlbUhqYWM5djRiQ3VFNWVIQlkxSVFtcVJVa05l?=
 =?utf-8?B?VkZkOWZDcXp2Sng1ZTYwTEN5d0w2RHNCOFR5bXJvVVAzV2lUQzNaeTBGaWcv?=
 =?utf-8?B?aWVaUmZHOFRjSkQyY3lIQUJvcVJmMHFEVWZ0L09LbFRmWmpPVTgwK3k2ckFU?=
 =?utf-8?B?dU42eXFUbUdYRmpEdE9MNHhXOXlrU2REeVZvUmk4ekxQYi9NYStGenZSWk5V?=
 =?utf-8?B?RU9iVnNrVjgvMU9pU2JtMUhTanVQRVp0ckNpUmtvWldLeUxqRklDZC9nR0Rv?=
 =?utf-8?B?WkF2dFVJK1N6dEVXN1lBNzJCZFRERmN1OVR4QVZDaUZVOTYvUkVubGtYdVg4?=
 =?utf-8?B?TnljeDNld1Q3TzN4Y3gzUkdTT1g3R2pMWjlIU01uSEltRUJuR3plT2krYnd2?=
 =?utf-8?B?bWN3ampXQ3BmVmdPdXFpSndycTFkTlVxOFNVZkJFNkVPRkN3ckEwSW1EUkVV?=
 =?utf-8?B?OERIYlZQS2NUYUk0QlNITmd0V2dIazlqd3hLMWlXQVlnTDlwZE95NVNhUmVr?=
 =?utf-8?B?dk5RVVd5MUxET2Y5R3ozQXpkUG40NitITmorMTdIYTV4aUhpVGEvQ1lNdVhk?=
 =?utf-8?B?TFJSZEJSV0hrWmpnTEM4NGdBR2p5THdMekFHeHRvYjY2d2RCZ0YvWndud2RT?=
 =?utf-8?B?dGNQejkvejdqTVdrUE04Zyt0MWExRC9GR2FFREl3UWxncUQ2d3dLSStXMHE3?=
 =?utf-8?B?b1R2UHorVXRLcUhReGhjZFV3SDVMb2VpQ1FXeGlFVWJvU3M1aVZjaHlDL0di?=
 =?utf-8?B?MUE2THZrQlVQN1docmZqd1pTYVo3N1l4Q0VlQ1lvVlJOYTIrMFB3cWxOZElR?=
 =?utf-8?B?d2VrYUp4UXpQUTFTWHp3MzZ1bTFpR01YeVBmekI2K3BGUFMzZ3JRc0VMdjl5?=
 =?utf-8?B?bDI5aEQvUEZDN0xzK2haNWZVM0g5R0JkcXVxU1NRYUZTMmNJaVFqS1FWVjNk?=
 =?utf-8?B?OS8rNFpCNURUTWpwQWs2OFRRSU44SzhtZWlOYzdGcUpIb1RWb2FQTWxCY1M4?=
 =?utf-8?B?WkptRjQrTVpUUkdYenJpWDR2MmlzZzBja0dvcG56YjdWLysvYjMwNjFob1V3?=
 =?utf-8?B?bitGNytjL3JaRS9ETGlQaEE5VXpRNktOdnNVRzRVUml6Z2ZrRVB4eWduTU9S?=
 =?utf-8?B?ajN2RmJleXRaQk1lam01YmZLaXVDK2x1TTU1V3hya0sxK3VFZzhzbGFjSllI?=
 =?utf-8?B?cnF1R1h5YkZMSkxET2J6emRCU1lMemZEaHY2enhYUnNFeVpWendHWTZpRlI0?=
 =?utf-8?B?ZWthdE5QMnIzOTB6YllJYkl4a1VmbTBDT0YxS2d6Z1Qzb2s5bGZIYWVwa0VG?=
 =?utf-8?B?NFVjeGx3RktSRmpVREhUNHYza1VzaXBLdm50SjgwMFppRUlwNjlXbi9QSVl2?=
 =?utf-8?B?cTVTRE5ranVPRjdrYUw4dnBkemMwWXFkUGM5dEMzZVJ1aUc5M2liT3BUTGEz?=
 =?utf-8?B?bDZSTGgwUnJkVmhzVVR0bHdjK2NiejZVV2VKNmRLTExxRXFZbk5vN1p1cjQy?=
 =?utf-8?B?aWRGcDhJQ1JtMjQzUC93MTl5Q0RaMFNHMFdSQ3prdmsycHZZRS9nZE5VY1g2?=
 =?utf-8?B?QUowYTRCdkc3ci9pVktiVzZ3T292Y1A0SnhwbFd4TmN5dE42NkgrR2hIUkRw?=
 =?utf-8?B?YUE9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UCtZUEIxc0pZZUFybU1FdTdvaG9acldBVzYwTnhUSk1rMC9iNytyYkFuSDJi?=
 =?utf-8?B?bjV0bUZzekorR0ZnRGdWYkxjZzAwRUV5NmhQTTU5WTM5aUR2WmJGZkh6Y0N5?=
 =?utf-8?B?YzZYQVJiZXU5UlpiSXpUVUgxdnBVczFMM0h6QTVlYmZzZnRHZXFCcmtQb01B?=
 =?utf-8?B?SVpGMDBKYXRPcGNrSWNHNVZ5UXlGUkVDSFc2K3Vsa0R2cTNOMkNBMTY1RExB?=
 =?utf-8?B?YVJzbm5oMDUvc3hTVGI4d2h0eUdMWFQ5TmRUaHU1cmJaQzFOcUhZSFFQRXQ0?=
 =?utf-8?B?dFpjTUxzejQvaXdudFVHTEJRN3N4Ulp6T3o1dWh6eDdvcVlBazIybVBPNEFx?=
 =?utf-8?B?cjJaYUZHSGQwTkh0SHlzcDcrOGJpbytvY21yL2JKOWlubjBxRWd1cmJqbkp2?=
 =?utf-8?B?THhzcjFnOWRubVBDditMc1ZNdk1ncjZvWmNzY1MvZlloc0tNR2l1N1MzZHph?=
 =?utf-8?B?VHNTMGdpbmF0c2MyUTRlWmFWbXZES1VlQW1ydnF5WlIwTHJlcUhrRzM3bWhu?=
 =?utf-8?B?VXIycURvb3JGQWZueTVIRmRKRmJKN01FOXY5NGlyTzBiTlNjOXk5Q05EZGpY?=
 =?utf-8?B?OFFxR242Wlk4MWZnTjFnWkU4MUZSWUZIbnk4N3F6emZUY052RkI2eEtYRnBY?=
 =?utf-8?B?czV6VTBaRU9DeUt1M1Y4ZkYrUnlVRGlvN0ZvUTljOGNzNmtYSjNNQzlMaUcz?=
 =?utf-8?B?a2hxRzZpcWNmcUM4eGczbUlaVjJUYWxFck1Eb0oveXJxQTArd3lxaTlYakUw?=
 =?utf-8?B?dnNFMFd4VWdpdlNpRkhwclVwQnROYjl0QU9SdlkxMEJLWG9ueTN0Nmp5Qm5E?=
 =?utf-8?B?SHBRbVpNNnFBQk1FTEpOdG02aEw4YlhmS3gzUEJQK2VsTm9Pb2wyam5LUEpu?=
 =?utf-8?B?WjFTWkg4VFZwNkQ1aHZTWCs2STUrK3Q5NmdtWlM5cWlmVUZDZXNRWTFRVENR?=
 =?utf-8?B?MWZHT0tKSTVSRFBpQmF3dmt3UFI2dkcrc1Z2ZEpvN0pJSCtTOERNcjZsMmtn?=
 =?utf-8?B?U3RUcHp1TWpjMjgwZ2VDM05CNFFBVDE5bW50R3dBZFVTK3dwZlFaUExlaUZC?=
 =?utf-8?B?RGtxOVdkMzdEODlDMWFvRW53eWNISHVyWVdCSERlTHVSVExQMWhLSGk1dld6?=
 =?utf-8?B?RHoyMjlURExrd1Vndmh6U3NYaXBXSFNYbVpreHZDWHgrd0cxMkU0anRialEx?=
 =?utf-8?B?cTJQdXFteGlnZExaaFcrRnJvQkRQUXdkWWExOE5kSWlDTDVUbE1ibkdLT1Ay?=
 =?utf-8?B?eTFUZG9rdzZmSURNOENQNi9Lb0E4a3Btd05OZWsrdnU1L3N5enJ5T0RqS3J0?=
 =?utf-8?B?S0xMZGJRNXhtOW5xdXNVM1VTNU1jV0wxemgyYVpsQ0VXWGpyeUVydnZ4aFY5?=
 =?utf-8?B?VUVvblpqQ3JsOWFVaCtuNVYvUk01akVrazFiTmZPbjdZZWRBRzhmbmVudnNK?=
 =?utf-8?B?WXZSYktNU1dEdGh3OWlESTkzRzFDTCtGdTJpVklWQzdPSzZLUEdRYVRWYy9w?=
 =?utf-8?B?QVBVUVFNc0FsTTg2RWg5SUdHWTBFdkJDc0tJWDNNeGx6N0k1RVFneFFKZ05j?=
 =?utf-8?B?aTlvQ0ovdk5LU1Y2Z2k4STRPcWt4OEJ5NjkxeXFDTlVqSkZKVDIydlZJaUNk?=
 =?utf-8?B?THR4NERTTnJUdWFxdEVvdmMzWUVHeFl0YTV4cFN6VUpHWEdkM0cvZlVXdlJC?=
 =?utf-8?B?c0t6OUg5eXJlQWloMkNVSC9ySEFtNkl4blVVUFlzYmtZaytBM2NVRGZUekhm?=
 =?utf-8?B?RTZxS1JKOW5NMmduOGs5S05KTjRUMGw0dG4zc1NBWVRHWmkwSGwyMi9vdU0v?=
 =?utf-8?B?L1BXaFYwZ3RYbFhPVEtnZkVSZWc1MW1KZTVNT2JIRHR6OUVMdTJVWUdUb1Nm?=
 =?utf-8?B?QmRRNXlZUmduWVdVbnhSYnZGY0lKdTB4Y09ISGJ2M0tHK3h3VHJGekRBL0J5?=
 =?utf-8?B?RGRhVWNNanhzdk04ODdla09jdkg2T0NUcXZoWUg5cUtNa0ovTHlLRWtaRCsy?=
 =?utf-8?B?dm14WkpnYXorRlNFek5aQzViN24vOXJTT1NWT2NCRDdRUFlrTVdibVBSQktB?=
 =?utf-8?B?ODVxQmJyemtaVUVsR2NwUjlYVTlEdVR2RHdVRVd6L2NFNGFKRXUzMWZBYVNX?=
 =?utf-8?B?czlYWGwzaGprZjcrU2liZi9rOVhHZ2o4eUppNjB1eWhwYi85RElsbWR5cWVM?=
 =?utf-8?B?dHFjZWVSNHlNc1JZQXBLY3E3R25sQVMzV2ZSOW5xSzRWK1BHWHpKODhGa3o2?=
 =?utf-8?B?U3BLcTJadkdBcmd0OElNZHU3Mi9HYnlrWHN6ejZxUXUvVCtscnhsaXFZbGlr?=
 =?utf-8?B?bGpaZDhranZHcjBqVmE3bG4vUFdLZ1dBdFJoQlNmUEliMnNCL3QxQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e44b7ab9-a374-4d28-1d09-08de741ca47a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 03:19:10.2000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaKpPf5DQ2PysZgShpMA1h25HJ8Z6Tyaksn/IP7m8AgcE2HXYc/teXPDtEpMGYx+3YYDMOozhxnY5oUSRUW7rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8611

On Wed, Feb 11, 2026 at 10:39:49PM +0100, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated, so move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
> 
> To keep the code as simple and reliable as possible remove the intermediate
> next_bridge and selected_bridge variables.
> 
> Get/put operations on the remaining pointer is pl->bridge.next_bridge,
> which is tied to the struct imx8qxp_pixel_link lifetime, are:
>  - get reference when assigned (by of_drm_find_and_get_bridge())
>  - put reference before reassignment if reassignment happens
>  - put reference when the struct imx8qxp_pixel_link embedding the
>    struct drm_bridge is destroyed (struct drm_bridge::next_bridge)
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v6:
> - rewrite as suggested by Liu, removing the next_bridge pointer too
>   and splitting the comment for maximum clarity
> - adapt commit message accordingly
> 
> Changes in v5:
> - rewrite commit message after Liu's review to clarify the per-pointer
>   get/put idea
> - split the if()s involved in selcting the bridge
> - remove intermediate selected_bridge pointer
> - removed Maxime's R-by, patch changed
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 27 ++++++++++++-------------
>  1 file changed, 13 insertions(+), 14 deletions(-)

Applied to misc/kernel.git (drm-misc-next).  Thanks!

-- 
Regards,
Liu Ying
