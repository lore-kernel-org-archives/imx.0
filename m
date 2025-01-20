Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2C51B4143
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364693; cv=fail; b=bXPaV7ixf/9q/mpW52j0KRjHfkrWGBLdayyHPbX8RkOqoKeIDMh78IZWs7JK1hlwDkIARHQT4AFOG14nPAl+H+FrfcifLC9cWywFPVGhbSMVsvndLcncIK3mKSkU+OaFOP+Bp7M1Z3aMO26+FXOB3uqEPwzVuX0/DBpd8rtRrvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364693; c=relaxed/simple;
	bh=vBQVQ2KcX4Gn+6VBUNnBbKVBLNR4H+jLY4Ui1UfI5pM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZHSz5Yvo9WkHvyNVmlIQ7ObHUL9Xyx4Znm4c1cmGinTAq9V0GY8KuLKnLO270uIg90T31htGyPZhfd2Z9cZGjgFR02H4VooyGsqqu3aQIp0M81hQhTFs2Fby+J3gQkNJ/VgmnPW0j0WKY9Zykn9nKvNJoqim6PauN/g2l1Uf7bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hcot0Q9/; arc=fail smtp.client-ip=40.107.20.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hcot0Q9/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/1Dji1mGyxgW/nZR/nk8TJ/YM7pkDDZlFmCcGCFvQqekMp/58quM3EeR5mYwYd225uiYulOYfzaFnw+tsfh5BmNbFqzx4jXyowkswp7qyeo9VOt0Ozb40valJCt54L816c39rxXrTCwWXryoldMWu1fgn4Du36nbOJRy6n/aYHW2ei5V6+Sd6emPzz5k4ZZZWQQTWYOrjsR9K0ok+2ws5MEGmIUydReubrH2NNjqHh59IuOEa7p3jha/Wi8q+nqRsWb9c8dp+yBMSnsAx0+GnTOxbjWUQ9qMxxyHijyS/MOhRTHkct8PFWPz8UjMYz6BSHoVV0LKWE2NSWcHxLqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/zWdDiFzZfhl+QVWSyvj9bScH8acO+lrpAny/Eag4Q=;
 b=c1lKLTxLguEWTBg5K72I/ODLSsavVvjaAFqsMWYugX7FYr2OGGOL+7Qq9Ve+8tJKGQQ2iuW9AO3ZvCZtW13wjNIoEkOipERkiuMQZ54zA4/8ehuM2/gZeg/2gNXio0jbITVgFeHbrYjNMc7OqCKjppzp+v4BFJrPi1P3n/K9EDxN3DlcKbio+Gq8ThK+C1ML58G9bOvBVVRx0Zd3uzd+Z9Oliydh2d0lfT/hZS6SAr39mrEPj+9i00U9fXYwY90qZDTKFIJgY9Kx7ctBLYQd7mDqYR58hULg8Xfz0BWZvQhbD9CZ9ol9P4zcbMDyvEu4dd4whucqukImUFCtQAQ1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/zWdDiFzZfhl+QVWSyvj9bScH8acO+lrpAny/Eag4Q=;
 b=hcot0Q9/Ej5tEznRF09zGn6yEDO5fnQOD/hJjziIZf0LZ7jN+2noQjBy4hneq+cVCoJ+SRzWplacKQbmuea5k3YJqXqLWoCgIjQfRhwITASQI5eOVbOSSDsFCNDp9+LNmbL3aTCen6IHYrxrLB9tEJ69xVt7HcDMliE6bh3LbB+sVA2lsI3oedewfTX5o73nQJlrNtlDoM6c/XzT6K7pmE9gzLv/Z3Ch8dliKcqNxt37dJyoNya7Ex+eTMqA1fOfq9YQNNnfNjIFDxrnj1PKVuGZMx4l+hUDGCqoP+4jDcXB644J0P969lvsPnDbct0D+6dX2ny27KuLgi7+h/KUWg==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM9PR04MB8809.eurprd04.prod.outlook.com (2603:10a6:20b:408::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:18:06 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:18:06 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v11 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Thread-Topic: [PATCH v11 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Thread-Index: AQHbaxvvG5C+3Z5tiEGBNT1+MvjZvLMfYjHA
Date: Mon, 20 Jan 2025 09:18:06 +0000
Message-ID:
 <AM9PR04MB860430282FFB1D4DF19E074595E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250120-imx-se-if-v11-0-4d7d8f7f4b56@nxp.com>
 <20250120-imx-se-if-v11-1-4d7d8f7f4b56@nxp.com>
In-Reply-To: <20250120-imx-se-if-v11-1-4d7d8f7f4b56@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|AM9PR04MB8809:EE_
x-ms-office365-filtering-correlation-id: 3a91c14d-9fa5-4ee0-1b2e-08dd393359c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dFR0WmNQVjdGb0pScS9BOVUwSHVBSDhBR2xUZWpSeUZPQmdEUnJiVGwrU1JL?=
 =?utf-8?B?UmlaYzRDSS84VzI0S01QRmVKK1R2czZhbGNnbnovMVFVTmhjY3h4MGF0b3RC?=
 =?utf-8?B?QkI3aEJ6aHVUb3Y4UmdRSFNZOTg0OEIyV21TUUVJcjk5YlUybkpiU3Y2S1Vr?=
 =?utf-8?B?MENNbzlmN0RHUmVQelQxYVIwZEJwN29lbUpDQ1M1R1phNkU1MUM2M1N2Mnc4?=
 =?utf-8?B?dWJiOGVLbGE1TEVjWDZPZ2NIT2NuTUtrS0c3a2pzWFo0MnNYRzdOTE5vVkJY?=
 =?utf-8?B?M3BYNEx2Z0NoaUpoVzhrN1d6ZHpKd0F1WXV3K2x6N1l0cVdOMHN6bWtLMU5E?=
 =?utf-8?B?YzVZQXNETkdVK1U1WE5GRlpXTms1KzMrWVBCNEd2ZGdQTGRucE5VQ2lkUFNT?=
 =?utf-8?B?anhnblRBaE9WYWpGKzFJdFRqb2VVTWtaeUhQcjBtRFFhUWlWZzR6NmU2NnFo?=
 =?utf-8?B?TFRDdGVmd0RoczBYRkNKZHB0UXRpRjBvNGplaTZLTE5KQUNVdFNkRWVwVUxX?=
 =?utf-8?B?V2V4K2c3VktoRXphV0lPUDZlSVd0d294RlVNdi9ERlhXZ2RISEJXU3l3bFpm?=
 =?utf-8?B?M2ZZbFdYaCtaMmlHQ08wNStpSDNIYnNTemVUQnpMNVd1Ti92Uk5JMU1iYVFI?=
 =?utf-8?B?RzdjUVdHSjVlZ0lSRit2RzBTczFEYUdGVFN6Ti9iWDYyNlFoOHo3azNUdlFK?=
 =?utf-8?B?Y3VwNkIxbnhHZVZjOUtacnh5akVCWHpRREdOYlFOSFRLZGJGOWV6S3pkd01h?=
 =?utf-8?B?a2ZIUDRWVWhyUUh5a01qYnhTdFZvQWdYUktRZm13U090amhud2NnVHZyTFJt?=
 =?utf-8?B?NVgzT3Vyc3l3aEllbi9zcEFlTDNncTBjZy9IcXZ0UEE4NUwxSnU4T09UN0Qv?=
 =?utf-8?B?YkZmQ21FY2swcUJBOC9UaEtjbDYxS1YxSCtySGlEYm1PbXlreHIrQmNFOFNw?=
 =?utf-8?B?b0NscCtidmV3TmVJc1VQM2QvTlN3Um5ITlBwZmZGckMyd0hpTnF5WTNuZ3pV?=
 =?utf-8?B?R2JUcCtQUlBqT0diWFpla3VOaXpPOW5FY0VUbThscHBpU0FvRkM2bjk2ZzVZ?=
 =?utf-8?B?MVJCaEQvdXFJNS9VQmZYTlFHMkxhbm5zUnkvdkM1alo4VFRISWxiY0praGFK?=
 =?utf-8?B?UmxxMk9KY2ZOYW1NaEtMcEZ2TlpldnBDM2hVSVBMUzVZZFNGL1o4VmRaOCtK?=
 =?utf-8?B?dEJLWUpOQldkdUR6TEpKNGQ4N3lnQVB6dVV3eTdQQXpxMFMxczkxb3dvT1BS?=
 =?utf-8?B?enp0c0wyWHFmVWNzME55YnBuTVlhOWJVNWpsSmpBb1l5MFVLai9PL3hTTjBW?=
 =?utf-8?B?QXVGTnh4M3B0Y05lK0grN0paUCtCQWgvV1NtYk1HMnRqcS9YMHRwT2ZLbzYv?=
 =?utf-8?B?TzFLRmsyT0V6NEliMUNsZ3Jnd2kvcHMyc1AyQlkxa2xHVklhUG1CeUk1K2d1?=
 =?utf-8?B?aEZZT05NZWFGVmYxV3Yyb3gza1UzV3ExWTZRMnN0TGkzUWVTZUZUaTk4emRp?=
 =?utf-8?B?TnpEaTFldGZUUld1RDNvM1lLMWppbk40bUZzQ3o3NTViUlFRNDdRd2FCU3p4?=
 =?utf-8?B?bUp1ai9lVXlqZ0ZUN3prRlNJK2w1NlJoNjg2ckoxajliZ1Y4LzhhbXRvcDhj?=
 =?utf-8?B?bWRmdFVyMzFpUnJmVVpDK1UraENjZ3I3L3Q5dCtlTWxOWnpiSXZ0T1NtWkt6?=
 =?utf-8?B?YXpZVG5GeUhobk1iRTVYQk4rUTRPbGVnWTBlV1U0di9uajFDSjZuSkoxWGRI?=
 =?utf-8?B?KzZrcWNpblVJdDJPTnlMQkxsWW1LYzFUMHdRUGx6YUpYRVQ0cCtFS3lPVm40?=
 =?utf-8?B?S0QwMXgxRTlnRDQ4aGIzUXZvd3JiRFljeS9PVVVRUXh4NFcyRU82Qkh6WnJT?=
 =?utf-8?B?NXhGQ2ZIRms5RkRlTU91RGd4RHhMclBIMXdSZkkyN2hIL2J2bzVLVHlQOTN1?=
 =?utf-8?Q?kKnOUREY3Ta/zl0nufkijnktRQDGQD6H?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVl4aTlhaThOYVBvanlnS0NRSnVubkt2L251S3NEVGFNTWpzWmFIT3EvTGt3?=
 =?utf-8?B?T1FCdGErN3AxRGhxQnNHaGlWeWNrajJFdmNUUkpPeVh4WE1GTi90aGFKbVhk?=
 =?utf-8?B?OFBlZ3hET25KTitURWRvZ0VNWDV5WDFLbE9CQkNWNG5sV3pWZ0sxUFFLUmdR?=
 =?utf-8?B?WHo0RVhyb3d3OTRialFUdzNJZU11NWh3OEJ0M2hhd1RWb2F3SVJhd25pd2lK?=
 =?utf-8?B?K0VKRFUwYTJJTnV0ZGgzSi9iYkZZcE5kTWxFV3prNnZxUk03cTEyK2VtdVVM?=
 =?utf-8?B?T1lxZmRoZGNtYWZELzhSM2tTSExDaVlRYmtCSjZKbUJMQWs1dWdmalRFWXVN?=
 =?utf-8?B?OE9ibHl3bHJ1SnduckNub01sd1VmVDhrZWcxT3Y3VmIwL2Qzbmh0ckJlTFZK?=
 =?utf-8?B?bVh6b3VubGRFdWNHWUx3TEliQ2FjZXFNR2t5eERaRS9HTlVITzVreWJINGRi?=
 =?utf-8?B?R3A4cDZTNktkRmhlNmtScjBBaThqdUNyTS9YNzNtN290VmRTLzVLWGNmUVA5?=
 =?utf-8?B?WFd5QmJSdXFVSFVoTmRUQWQwck94SDV0dFlwN204TDZ5ZnJPbU1WNTV4RXlP?=
 =?utf-8?B?VXJFM2Jja1I5NzJGZFR5aFlGblVOcHdMYXdJQnZxSWJKN0tiUzZ3aHZQeFZ0?=
 =?utf-8?B?R1ZFcEV4bFNjRy9zMkt6aXY2dHBYeno2bElKaUNtWld1V0N6cEVLY1czM0hV?=
 =?utf-8?B?U0xPczFBd2Nsa242cVNYbWtpcm4wY1NwRFgrQ3Ivdk5rYndUOGdtVnpWUFFL?=
 =?utf-8?B?YmNWSWpqdW54d0IvMGxGZjdub1lsN1FUNFNlUzdHbndDWWE4ZC91bGd3Tm9o?=
 =?utf-8?B?YkdQZ1JmZC9oanA4c3AyL0lnek1KdUEvcmZJRDc2N3QvRC9YMjJCQ2F1U1Jw?=
 =?utf-8?B?N213bSsvMHBIM1NSUnVNMFNncXRBVmRsYjUwNW1ZQ2tQMzAxSTEvdVR0cDBu?=
 =?utf-8?B?Rk1CU2Yra2NkeTFYZTI4d1JtTnRJdzJlaytQeVJmWjg2S2pGKzJMKzdGVDQ1?=
 =?utf-8?B?dzhrdjRMY0FxVnhoUkRVOEFDbDZSeWRMS2VTbEszbWYrZjV2UlJJVk1BN3gw?=
 =?utf-8?B?c2dCSWorY0VIa1hBbHB6SS9KZ0xxVlNlZFBLNFB1Wm8zWVEraVRXa0Vtbkt1?=
 =?utf-8?B?SXdTTFIxTVNQK2FwM1ovOE4wQk5maXhvUmZaZFNpQzBLa0F6L1oxNGtEbmtp?=
 =?utf-8?B?SU1hOWdoNGhHZDJkaXhKL1A1SWdTekFIckJQWlFXNmpOanNaK0E3VVJqd2FZ?=
 =?utf-8?B?SUJBVG9NOUlSQjJ3U0VIbW5OcHJ0WDRML1gvZE05ZUlXN2IwOENyeTZjRnJZ?=
 =?utf-8?B?YUJvanVON0JXNmxyRDV0dlVsTDUzb3dncGtva0VBM2lCekRSOCtYbW10SzZr?=
 =?utf-8?B?Um8rbWNtQ09wZUdkTklUbTUwVHZwNTJzd3Mxc0RFbEhlSWhkK0NWNFNmZmVT?=
 =?utf-8?B?NmZJZ1MvR3RmaHZQMmUyeXNZUkk1OHMxTUNuSUdmU3NUQXZNbEZYTmFqdmd6?=
 =?utf-8?B?T3dJOTRVelpLWXU2NWg2Z1Ryci9zTm9jWmZLN0FUOWZXaUE5ZHdET3lrajg4?=
 =?utf-8?B?Vk9UblRpVDhDOG9SOHhnbXBBSC9qeDdrOHpLTCs3OUxMQnJXb04yMXlsbXNE?=
 =?utf-8?B?MEtTTFV3Y2tWdGtNT2NWRzRicXg5SHVSWEF4Nmh0VGZFSlpKSjJKaGdFSi9z?=
 =?utf-8?B?emlBdlNJSFZXSGFtSlFkbmhEd1dKcFd3SlZZQ0dsS2xhdFQ0QkdLWjR3T3Qw?=
 =?utf-8?B?YWF0dkVoU0ppNU05NHRxSmZOYjBSY0xxR25JRDBGalVleWlkWmptWTlHS09M?=
 =?utf-8?B?VktKMngwazR2WTFIckx0VHQ5Y2E1VkR4NENBTEN4SUJaM2FKWjNlNlYzanlm?=
 =?utf-8?B?SjlkTXRrYzE4ZnJ3aHZyNWtWdVpEamM2Vko2WUMyQ3l2R3JmQVEzMGpGdjRk?=
 =?utf-8?B?a1JWS2dpTzRGck5kRFhoSlo0SzBCM0FLN05VVm9QVS8rU0pjVUhiaTYvRWRF?=
 =?utf-8?B?WnF4ZGF6NWt3OVBkYWpSNHgvd1FPVENkZTc5SEkxOHhKcU5BRzJoY2s0Rzgz?=
 =?utf-8?B?ZnV3VEZFT0xEazJibWQ5bzNOYUpJNmcwNURaSE5ZK1JlTHR2dUVuWEdRZWQy?=
 =?utf-8?Q?HaaXPynudxQrrQGmHx28IQPRh?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0461_01DB6B4A.4FAAB0E0"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a91c14d-9fa5-4ee0-1b2e-08dd393359c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:18:06.8299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9SU3r75096Com2qG+f4gTrNyX3K4BlfDNSyenXUE2wAMxfrXs+OSFPCZq54uqoD3EKMEkN4lllBOfhD8DTtuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8809

------=_NextPart_000_0461_01DB6B4A.4FAAB0E0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

Ran "b4 send --reflect"
But it sent to all.
Please ignore.

-----Original Message-----
From: Pankaj Gupta
Sent: Monday, January 20, 2025 2:46 PM
To: Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof 
Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn Guo 
<shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix 
Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; 
Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; 
devicetree@vger.kernel.org; imx@lists.linux.dev; 
linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 1/7] Documentation/firmware: add imx/se to 
other_interfaces

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s) that 
contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 121 
+++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst 
b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..a3a95b54a174 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,124 @@ of the requests on to a secure monitor (EL3).

 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an
+embedded secure enclave within the SoC boundary to enable features like
+ - Hardware Security Module (HSM)
+ - Security Hardware Extension (SHE)
+ - Vehicular to Anything (V2X)
+
+Each of the above feature is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure
+enclave) can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are
+dedicated messaging units(MU) per SE. Each co-existing SE can have one
+or multiple exclusive MUs, dedicated to itself. None of the MU is shared 
between two SEs.
+Communication of the MU is realized using the Linux mailbox driver.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95
+which has multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their 
interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and
+provisioned using the single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprise of twp layers:
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol
+that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+  - Serializing the messages to be sent over an MU.
+
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as 
'/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are getting multiplexed
+over a single MU,
+  userspace application(s) can call fops like write/read to send the
+command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to
+communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                  +---------+      +-------------+       |
+                  | se_fw.c +<---->+imx-mailbox.c|       |
+                  |         |      |  mailbox.c  +<-->+------+    +------+
+                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+ kernel space   +------+      +------+     +------+      |
+                                                         |
+ +------------------------------------------------------ |
+                    |             |           |          |
+ userspace     /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its
+device_ctx as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management, over Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_fw.c
+   :export:

--
2.34.1


------=_NextPart_000_0461_01DB6B4A.4FAAB0E0
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIImZTCCBaIw
ggOKoAMCAQICCE4Rpu+H69FRMA0GCSqGSIb3DQEBCwUAMGUxIjAgBgNVBAMMGU5YUCBJbnRlcm5h
bCBQb2xpY3kgQ0EgRzIxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJ
RWluZGhvdmVuMQswCQYDVQQGEwJOTDAeFw0yMzA0MjEwNjQzNDVaFw0yODA0MTkwNjQzNDVaMIG2
MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQ
IEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmS
JomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTEL
MAkGA1UEBhMCTkwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAWrnSkYP60A8wj4AO
kATDjnbdgLv6waFfyXE/hvatdWz2YYtb1YSRi5/wXW+Pz8rsTmSj7iusI+FcLP8WEaMVLn4sEIQY
NI8KJUCz21tsIArYs0hMKEUFeCq3mxTJfPqzdj9CExJBlZ5vWS4er8eJI8U8kZrt4CoY7De0FdJh
35Pi5QGzUFmFuaLgXfV1N5yukTzEhqz36kODoSRw+eDHH9YqbzefzEHK9d93TNiLaVlln42O0qaI
MmxK1aNcZx+nQkFsF/VrV9M9iLGA+Qb/MFmR20MJAU5kRGkJ2/QzgVQM3Nlmp/bF/3HWOJ2j2mpg
axvzxHNN+5rSNvkG2vSpAgMBAAGjggECMIH/MFIGCCsGAQUFBwEBBEYwRDBCBggrBgEFBQcwAoY2
aHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFBJbnRlcm5hbFBvbGljeUNBRzIuY2VyMB0G
A1UdDgQWBBRYlWDuTnTvZSKqve0ZqSt6jhedBzASBgNVHRMBAf8ECDAGAQH/AgEAMEUGA1UdHwQ+
MDwwOqA4oDaGNGh0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEludGVybmFsUG9saWN5Q0FH
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
ggEKAoIBAQCsljsxzffby7IAt42e7cJH7K+49RL+7i56h3ORt8dS8WNVSdDlejp6uS6mLk/UX0wn
sSxDK1S5KquGJQzaT/3gxE8tdgvfFNBVdrgr48DeCVwWDr1o/UF3RmGcMdxqRz1M/oLDJ03C8n6h
L/0JXiwsNx0KZJoqDrN/48yX5TkoeKJmHFftZ5Op57xV0WkZJ/yLxSC1Om75jOG/UPdqsDzl+wi7
YVj5egV24hoaXgHBxtCeJzUgsHcJlo9nFtGe11j6H1vqFzkPzN9ydjRmhQATV/WLqpG8uot79u0m
6n7Mjwsd/HmJf+8xpovMcHPO2a0axppssKso/3APP6mR1FuVAgMBAAGjggORMIIDjTAOBgNVHQ8B
Af8EBAMCB4AwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMAwGA1UdEwEB/wQCMAAwHQYD
VR0OBBYEFLNr0DCWM1fCXv4ubOt/elkvcoiaMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRw
YW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFua2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAU5TJ6
9GbBR5Ykf/wngDlY3ysX4rswggFKBgNVHR8EggFBMIIBPTCCATmgggE1oIIBMYaByGxkYXA6Ly8v
Q049TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1ubGFtc3BraTAwMDQsQ049Q0RQLENOPVB1
YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2Jp
LERDPW54cCxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNz
PWNSTERpc3RyaWJ1dGlvblBvaW50hjFodHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFAtRW50
ZXJwcmlzZS1DQTQuY3JshjFodHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFAtRW50ZXJwcmlz
ZS1DQTQuY3JsMIIBEAYIKwYBBQUHAQEEggECMIH/MIG7BggrBgEFBQcwAoaBrmxkYXA6Ly8vQ049
TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2Vydmlj
ZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jQUNl
cnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTA/BggrBgEF
BQcwAoYzaHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFAtRW50ZXJwcmlzZS1DQTQuY2Vy
MDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRVhu2FOILrmUuaklY/hMbNXILljX4C
AWQCAT8wJwYJKwYBBAGCNxUKBBowGDAKBggrBgEFBQcDAjAKBggrBgEFBQcDBDANBgkqhkiG9w0B
AQsFAAOCAQEAWS4IrHXWhCGNWk5vn20xV7mlLkM7JPwltVJzB6MRzwUB438upbyUMwNHcEgAmHcs
xL9hafErN+n9rLL00wEqZsCV732s7YOxSRRjZTE3CmZQ2+TYjXR7A6AzQKo0fv/x43bpSes8ttQ6
Qtt8nzIbGBkDAcI7wfXsUPF5o0NwLOxre+Z+JCPNH0eaOj2J7EKD2ERLCClmvohrYdlmu85iXfyi
nJo42eq9g08FtnxTXVQSIZCtiETiGtXA7+t2Aa8429XXunsijRznaYw2SwI/s4sVmvaK3XHaif0D
QaUYxQp4s2ctzgz3eU6hK68OnNzbhBtF/lx6PHbifqHDzrtUbzCCB+8wggbXoAMCAQICEy0ACwRu
JYOozH+yQuYAAQALBG4wDQYJKoZIhvcNAQELBQAwgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNl
IENBIDUxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVu
MRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPy
LGQBGRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDY29tMQswCQYDVQQGEwJOTDAeFw0yMzEyMjAwOTIw
NDdaFw0yNTEyMTkwOTIwNDdaMIGaMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQB
GRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDd2JpMQwwCgYDVQQLEwNOWFAxCzAJBgNVBAsTAklOMRYw
FAYDVQQLEw1NYW5hZ2VkIFVzZXJzMRMwEQYDVQQLEwpEZXZlbG9wZXJzMREwDwYDVQQDEwhueGEx
ODcxNzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL2JT+kRihW1mBdeZFOoCLGIl4DZ
VL7FWt3V1iFFJJe/bZDw/SUf5z1HeA8xv9+S8rqMyybjlSRHFLgiMm7qrGpVEDniKe8eiqP8Un4Y
3fHgK5FKZIVVn0KlaMuD5G30AMk9HyUdc2MkVRL8YSQCewkQDEVjB8gnx/e6xfbWEVHf5+dOWJoR
aket5+0JKV0l/dPV7cT4hL3BFtiBhq8976Li6rn8gxIi63u0G3qvm9Scqk+EHzemDhw/W+eMmGR4
nwKVLKzumxko8l6EOnnvqqF4vj2hKTpB+2lsEXH1giireMEsvB2RY40lnRUXVQ0FDklOIQV4Qdgi
EJfUdq/ZhCUCAwEAAaOCBA4wggQKMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRV
hu2FOILrmUuaklY/gbeCPIPthzICAWQCAT4wEwYDVR0lBAwwCgYIKwYBBQUHAwQwDgYDVR0PAQH/
BAQDAgUgMAwGA1UdEwEB/wQCMAAwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDCBlAYJKoZI
hvcNAQkPBIGGMIGDMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAS0wCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBGTALBglghkgBZQMEAQIwCwYJYIZIAWUDBAEFMAoGCCqGSIb3DQMHMAcGBSsOAwIHMA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAgAwHQYDVR0OBBYEFMJ81PK4p3H8Q7gn7u/5OwWx
uAwGMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRwYW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFu
a2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAUWJVg7k5072Uiqr3tGakreo4XnQcwggFGBgNV
HR8EggE9MIIBOTCCATWgggExoIIBLYaByGxkYXA6Ly8vQ049TlhQJTIwRW50ZXJwcmlzZSUyMENB
JTIwNSxDTj1ubGFtc3BraTAwMDUsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENO
PVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hi9o
dHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybIYvaHR0cDovL3d3
dy5wa2kubnhwLmNvbS9jcmwvTlhQRW50ZXJwcmlzZUNBNS5jcmwwggEQBggrBgEFBQcBAQSCAQIw
gf8wgbsGCCsGAQUFBzAChoGubGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENO
PUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0
aW9uLERDPXdiaSxEQz1ueHAsREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1j
ZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MD8GCCsGAQUFBzAChjNodHRwOi8vbnd3LnBraS5ueHAuY29t
L2NlcnRzL05YUC1FbnRlcnByaXNlLUNBNS5jZXIwDQYJKoZIhvcNAQELBQADggEBALwIIuww1PaF
EbpQoy5vgJ/4N3xS+niIpFTKyYNAD0Ar38FcUlSnj0FIHKRj8rUmZP9WTky3U8m5B3LOyhJ14FPh
iy1EwkhZmds9fJiZyEEFiwQWYDG/uknu6zIKOTlLmtlYPfbzfi58keGcjD3T5H8D8DpCGWI1lAwe
clR9fJCbcYnQSQnuicSCfrHjjXiDZ2O8h7WbE1CC6Cj/qwo5nmS0lMv7yoG94rTNBvYe8iqOkcav
7KiZA6SdhXms3ppvFmBukI6pTheMvT39SM0S6E0dgeqZSGSxHrM7dcxUdAL4fnYMv3Sa+GAgyXB6
rihWC11+goz2eawt5TRU2w45TmcxggSzMIIErwIBATCBzjCBtjEcMBoGA1UEAwwTTlhQIEVudGVy
cHJpc2UgQ0EgNDELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5k
aG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJ
kiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYTAk5MAhM/AAV1goSs
wyqoLYNbAAUABXWCMAkGBSsOAwIaBQCgggK5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTI1MDEyMDA5MTgwNFowIwYJKoZIhvcNAQkEMRYEFGbzMKXi5fjBn7Jv4oUt
xXnF44HhMIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggq
hkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsO
AwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIBMIHfBgkrBgEEAYI3EAQx
gdEwgc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjCB4QYLKoZIhvcNAQkQAgsx
gdGggc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjANBgkqhkiG9w0BAQEFAASC
AQBxhOVylVAkfc4hdjug/a78fyCTMByJ/kbQKRuKXrMPNp3ny7oyK53xloGzp4dHV/Qhrs8w8W7c
t+6hg1Z57rtarBioH4pB1KuhEAaC+t21wEcWbgCeq1qNfeovbxi2jFirCproP2u65pudZUtnqEhf
bYkwe1q0Hpc98ZyKALZ2akAyC3KGpyrHFqJxJNVS8pmOih677BWVnCbQHywpGMlXKgJpXzABXR5x
TpBSEuyF5tNEVOfmmnrxTaOSND3uqhA/YDD53X7E5CMp/ahXgHnNBUYv01dzoqCf0vb1fswXUKtU
jqlpxlFzgLt5uN0bKR2nJdmtXiRdN63PPZCc74rJAAAAAAAA

------=_NextPart_000_0461_01DB6B4A.4FAAB0E0--
