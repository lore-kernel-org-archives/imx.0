Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013067.outbound.protection.outlook.com [40.107.162.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFAF2C0282
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 18:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538313; cv=fail; b=GCWzYxOMTuEvi7eMxfLSTnfH+pYBiVWcgwvoQvX1jE0M7p9wIiW+OsBfxlh2ecuOXlAn8DvmBK3mzCEWZtXc5xBJqjlzbNBma16fbiPQFE7YeT8Q3BVDXUHt9ktlOLMPlba86Hd2cKDduKkE6GW+r0WnRlBUPRDfSEpkgtiIu3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538313; c=relaxed/simple;
	bh=NZi5A69fPX/Ufhy0HWD1Agi5KRKE/Rf3pSJBHqn/aZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VTJW2cdvzl+0XyB8KJXlYmmsDSiSAmgvA/BHQmyBTgdG3CrsubuDWVmK2Qz2Z/fF49yPrr+2hRfvpa17dOSjOfSy0a47p5WxvxCxKVRYWPhm0gNrkO/HW/T1VmTkxzE/QrH9BPh4mLRjaKyToP3GchX82lSD5dBQa8D6YG+ZdEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bb/ol/Ep; arc=fail smtp.client-ip=40.107.162.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bb/ol/Ep"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVb68dWLJXLilKln74ZqjCEkxddS2AJ7KvU8GcZlS0jVkBA5fry8uebRCkARHGARwuU6iKOSwJr+ruu78KJ8eLtb8EY0LrYbBr2dnG/MrF4ISODhGvd+nVrYIs6VsEimDCKBHenVuaZMJAUyAPnfXwlQUksdI1JjGDQovOC2DbzlV3cS2j9bsMCSMpCs5Unvx0UZkU/Z3l973XonLozmCb/sjsNwJwbRu5GWy/0nUHBRlR/Qzq/NSj1Jj1fHb9tJwCQLAY2QVpYubr9GEWaqNNxdc7uPFRg//1KwKL4UKWFjyKFlwXqpcGz+tyXHYhfgyCVKd6a2Hz0mSyrkvOXwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZJKuH6nC13hC26XB8c21dBC7EPKtOY/OcRZ32upJ70=;
 b=RcwX732F6HQ1p3n7zFNSKfAe+Clen8sD2YUrk/7t1V2OilHj5JuNgRbnzn60W96yCzRN0/JIaJ/ikitDKaqMWmoFSlao7KzixGWdhcYQhc6J281QU6XYDckaAaRL1rl+u47rGWGwecCAYk9yftYc+0Yqg0HqPBuyIGDIfWr4fncNpQuDJKO4qbQUoHyPkXkthlpryub2AG6Ni5q8PgXwwNdmJWEGUUwWdq7WL+gf1tvApIt3t7SVA9QrhrSoG3g95fV8ZlHFN8dsNQDPmyk1NOQpYW300jRRItoy+bxCudDh8Fco+4PxTOlJBbpQGQoEXwEFPiofNL7seHPo0KpquQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZJKuH6nC13hC26XB8c21dBC7EPKtOY/OcRZ32upJ70=;
 b=bb/ol/Ep3Rmw29uwbpyJOrqX+heWgk4MueUTMfWMlTQXjc+aA0+8/fjmowDMoE6GMok+d7kYamXrSVpYxNFKdv/oYXx0KD3PpXk/mkBcvHqZ77+MmmNVL7R3Ebvz2JnvIv/S5QGs7keoToYKlWX1miO4DqMD3vydhZwWNR/V+Q0Ls5blvKU4g3CPIIxEZrUQ9PYSM3uECAC17MKLV/a73KrEXzmgcProeGiyqYf8wUhoJUFiiwivv11iEhXWBBj7mUAw8Rv4hCzs7Y3p3FQezsLKxWyTCzvoJ562Puli8mW9U1A9Fe8AgpW416+8/Xrmlz99ciE52RIDMea19ZrQWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10916.eurprd04.prod.outlook.com (2603:10a6:102:483::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 18:25:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Tue, 27 Jan 2026
 18:25:09 +0000
Date: Tue, 27 Jan 2026 13:25:02 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH] arm64: dts: imx8mq: Set the correct gpu_ahb clock
 frequency
Message-ID: <aXkC/gVUk/lA2vzq@lizhi-Precision-Tower-5810>
References: <20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm>
 <aXevH8e+9qLhWO7D@lizhi-Precision-Tower-5810>
 <8657865.DvuYhMxLoT@pliszka>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8657865.DvuYhMxLoT@pliszka>
X-ClientProxiedBy: SA0PR11CA0171.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10916:EE_
X-MS-Office365-Filtering-Correlation-Id: f16c4735-bfec-4428-b0e8-08de5dd16701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|19092799006|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alNZY3pjTmZaTFdDLzB3RW1rd0U5Nld4dzl5VkNvdEFEWDQzcGI5ckllOHNK?=
 =?utf-8?B?NjlYZ21vMjhaS1RSWjNROWUxRDFWYnVnUm5lN0JsaCtGQVNxTWR4eHJsTHZI?=
 =?utf-8?B?UDR6a0E4b3RuZWNPNU1sM1lJTVhLcTRCSmg4b3N0U0hyZHUxZmdQREduZ2dG?=
 =?utf-8?B?YituT0JNNmhSY2p5SDg5SWhiczZCMUVYckVJaDBESEV6OFJRYzZjL1FHZHlB?=
 =?utf-8?B?RFZWUG9xcUdGL3Bta2l6Nkc5dlVlOFFOc09EY0g0dUt4N1JBS1JNa0RlNDRU?=
 =?utf-8?B?N25LNVlON2h1Tm1GNWRPZ3NiQWNUcjIzL3llejd2RGFvbFhwN1FOWXlJUW9R?=
 =?utf-8?B?a2ltQzl0UnJadWU3N25RN0ZoS3JIQWVDU0RWS2kzQVdCd2U0NHBXY25XdDZW?=
 =?utf-8?B?cENJYTFNeUJjbHl4Sll6Y3NxV2t1d2tGQVY3Wm1tRlpic3M1T1F4amYvVXJQ?=
 =?utf-8?B?cUJPcE5FRmN1amdSNlJKUkJqaFJIN25XL1NWUDhOKzJIdTVwMFNZUUFVNkg3?=
 =?utf-8?B?a25wUnZlR0VlQ3d2TmpHdCtlSWI4YVMwNDh6eDd6cGg5T0xhOW9rRURpaG8y?=
 =?utf-8?B?cnRrSXdGNi9SSE5IMml1UWlGVnhLcExxcVhZY05Fc1RqcFNTUXdRM3NReitG?=
 =?utf-8?B?bXEreENZNDlLV3Q2NzYzMEozQk0vZXIxanN4ZXo3Z3pldFIrMjhjUHZpRW95?=
 =?utf-8?B?TkxxdlFjbDAvOGlPblZna2w4bkZ5WlpEck1mMVQxNWhEMGExWEd4Yk5yNXNK?=
 =?utf-8?B?THF3TFBmQkRJN0U0Y2twQXNEMkZXTEFHRzdvZFVGeDIrdkNOVW1uM3hiVXJz?=
 =?utf-8?B?Q3cveFRFaE1laW1zYjU5QVh0ajdvSnNZdE8rNVNCZmsvZFQ0M21LenFHbGk5?=
 =?utf-8?B?bmFWMVduZGYwSjNvanpCZTl4SFd3eUdScXBTWFAzSFJqM3lGaVA4MUI3UE5B?=
 =?utf-8?B?RkU2cWNlRVk1aytXcnBwSW1VMDd1cXp5Uk9kVmRIRGhETmJVRGNiNmF1NGlw?=
 =?utf-8?B?VllrWWR0MFl5VGVybGRPVW8zQ3VlWlZRaC8rRFRMUFlrOGhtYi9jR3VTU2di?=
 =?utf-8?B?RDkrUlNWUUZmWUUrUW9YS29tQVRidGg0Mm9EYlRCeTZ1RnpyZ203dnVHUVhN?=
 =?utf-8?B?aU1vMzVFZXVPbWc4dE5LSkwzWUVXdEdjK1ozRjRDVzJURkhwZ3AxWnFEYisx?=
 =?utf-8?B?amZxSUtpTWJXSG81eUFTaW5Db1RSRE9FWEEwSmljK25KUXo4d3pPTzRjOEd5?=
 =?utf-8?B?TWR0U0ZxcnYwWHM4UVZsOXhXYndwYVo1cjFUaVJFaHlxUnQzQklRK3J3TU1C?=
 =?utf-8?B?UC9USWh2SHA3bVhHakVDT3dha3dHTW9icW1zQ29rZUtEWHNKQWgvM3lUR1h6?=
 =?utf-8?B?U3kwbmI2aVRubVVRdk5pVnFEWnFDbTJsc3VJQlJTbDUzdWZ2RUhaZy9Za0M2?=
 =?utf-8?B?T2R6ZW94RmJEYkk1OEo3bDNHVnFTUmZUOG96SHBENVZuaW5EVTFMdWx2OGZR?=
 =?utf-8?B?ZXF4WEZ0bTg5b056NTRDenAzcVM2QXlGbXpxMGhuMG9PNDJVV09ha1dGOWQ1?=
 =?utf-8?B?ZjdvcVdOcFVKUXNvajJpL1JTTm8ybWJPdVB3Uk1KN1NhaFVIMTFMVU5mVVFv?=
 =?utf-8?B?K1FYUW1DNXM3M204OFVHOWpXam8wSzQvNWh1cUplc3Fmd09OWk02RkFnc0VF?=
 =?utf-8?B?TC8ybGN0UHc1VTNGMGE0ZkdIUTRsU0xFK2FOS2Nvb3lCcCsxYmtyOHBic3RY?=
 =?utf-8?B?Q1k2L0ZMejh3ZHVNTWphN1ZyTnMvZXdMbGVpRENwcnBNVGxoQWFLNXNJK1hU?=
 =?utf-8?B?L1VNV1pxU1cvczJKU0JEWDc3cEZMeDZzbmhsa0xiemY0TTZPKzQzR0NtK21k?=
 =?utf-8?B?UXlia3hmL2pxcWIya0pNQlhmeVZld2h6aWVZb3JVd2drUVM5QmNtOTVPcjhE?=
 =?utf-8?B?YlJXYlRDQ0x5UjVCTG9SVVRsL3ZaR0hQU09kWTRTdXdNMU95bVNpMjlUWll3?=
 =?utf-8?B?ZjVUOFhSNDBXM1czTlpDVXk2MHdmVjFqQmFpU3hrWGtPREFPSVVxaWRmYkFD?=
 =?utf-8?B?emZCZG5zWW5PRUw5TDdiNFZ3RmZhSlpIV2FveTBSa1EyU1JBcXhzc2lUY1VS?=
 =?utf-8?B?bWFidU5vSXhNRmNHRUNCaDBhSlBYUE9zeHE2Q05OZG1hN3I5WVhVakllN3FL?=
 =?utf-8?Q?EpqS1pV25XpRzaTUWq1OOag=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(19092799006)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cStWNDVEbjB1WEs1L0NQcSs4TzNFN3ZiSXJoWnZMS3FLeThCR0s0YlFxcEla?=
 =?utf-8?B?WElxV2RqSXFta0FmbVRVb3VWZHE2Y1RqV1RtTWJlcUpCbDg4L0JXWWl4NERl?=
 =?utf-8?B?N2kwSng2VHhsNi9Qb2tCdkxGVTVQbndhU2FsTk9UOGhTbHNwVlNsMHQ5VFlV?=
 =?utf-8?B?TWdaR0ZEbEgvc0VodEtlMVBvUVVNNHNHNU9QRTlYZGtNZkh2Z1dtcGN0dHV1?=
 =?utf-8?B?MlZHU1pBNzNYanNWNnRPYTFNVmFSdUl2TGlLK1IveWI2MWxqOGJGNEM5RlZF?=
 =?utf-8?B?d0pack40ajMzZTRWeTJ1TW9aQitucFJsOXlrMVBMTVhOcmZRQmVxUzU5VUM4?=
 =?utf-8?B?WkhielExbTJ1aXY0cjZtbEI3QUhpbVdGOUN2OEtlZytlSGgzVjRhOEhQRTUr?=
 =?utf-8?B?OFhoVGF4a2drZXdwbXZsM2I1YXA4VHM3UHBxMmQ1NmdLZk9BaVJkYmRuVldx?=
 =?utf-8?B?cTFZRHlFZzA5NXlnMjF5R05ROUNBajFLa3Y0ZE1sL25ESkJaaWFXSXJ1Z3gz?=
 =?utf-8?B?eGV5ZzQ1aXNPdThEczVucG9NaFk0Nkc3dVZiUnh0LzBJU2FpUTQyNmUxSXhT?=
 =?utf-8?B?TUs0ZW5TREFkOE1RVmdsOHRqY2t0aEI0azhmcy9VY294bncrQkpsY1c1ZGF5?=
 =?utf-8?B?THU4VmJvRzN6VzYyVmVMM2M3V2d2VlJwdGRUa3JaQktUSlBtTUJZTnJzUE9B?=
 =?utf-8?B?dTcrNW9wdmZ4eVpsci9lUStGZnozUFZ3Y3NrSnpTMkFNVVdLRGphWDVBTnRn?=
 =?utf-8?B?Y0pyMEtQK0lvRnMxM0IveHZiWWxsc1RGbi9JUEpTRVVvSmE3NDRDK1ZDQkJF?=
 =?utf-8?B?eVlPOVprR0dqdnZIQzAzMUt5Z2FOZkRMc3hMTnNzTmk3RGQ4dzZOK29La3Rj?=
 =?utf-8?B?Kzd0Ykt5TzZQV2ZnTGNQaUV1Q3NjSTVhZEtoWkZXU0wrdC9pQ0R4MGNUN2t1?=
 =?utf-8?B?RzkwQ1JhT3ArRktpb1A3OVZZdjlneWgzZEFPRk56OXhmT1Fydlpaekt4am1J?=
 =?utf-8?B?QzFXK0ZkU3B2cld1WlN6UlhSWGNBNGJDSUxIMTkzS0RERjFRZ3piWndTd1V5?=
 =?utf-8?B?OHBlSys0bkJyUWVHTUR4bmhnaVl4N0tUby95aVZrREViVTVVdUVpQzVyVGFR?=
 =?utf-8?B?M2ZRMEpOWThFbjhPWml4NEVXWC9QV2lqK25OWWdEOFJDUmNIcVA3UWdZSEZS?=
 =?utf-8?B?Z2x5UXVLY1lIYkVRZEJpUCtWY2p6Zmg3Ry8xYzhYWlZEWGZoMWFXL01vM09q?=
 =?utf-8?B?NUJSNUFjVUw4YXNZWXlvb3BieTNGM0hDKzlZbHBaNzErSWNhYm5GblVoMG5R?=
 =?utf-8?B?bFhvZ0VXWk84TEswcUZ6Q2xIOU1rS2QvMVpCaitRdFkzMml5MTRLSWw4THZp?=
 =?utf-8?B?S0w3QTFud3QzckVWWnFUSzZ3Q3ZNMWhKeE5OblZrZWpUMVl6SFJnM29hOHYv?=
 =?utf-8?B?ZXhLRW50RGtPcThxZEo0eTRXNXpxcUthOFE1SmtwWTRpTlkwbElsa0NLT0Zp?=
 =?utf-8?B?MFUwcmZvYVBxQllrakd4aEVJVTNQZHoxQnR2a1A2MnFsUVhRWGh0L3Q2Wldz?=
 =?utf-8?B?NWxJM2RRYk1PdFFFMysrS2lucU8rMko5elVYUTBMOFJ5Um1FQnEzWEVhSzBU?=
 =?utf-8?B?bFBaUGVtRmVyR01OK0dXd0c4U0IyUkhCNEt6ZWhyVzVRc2lMT2tsMzJ2WGph?=
 =?utf-8?B?Q2RtdUFhN3VYaHpFM0lqd3FxWFkwdmJkb2hkeTRIVUlSeXdBVklxZ2Q1L21P?=
 =?utf-8?B?SWkyNS91bGQ4YkQ3UHgwWUJucGVLdXdOZHZzTkJtcVZ3UjZleERicjhCbVdi?=
 =?utf-8?B?TU1zNTBFaWFZRHY3M3JqbFBkYUMwcUtsdkxrSlNBbzNIc2NDT3lLT09NM0xz?=
 =?utf-8?B?M1pyVFgyMExsM1k4SGNQZnhMRVpuaGRkWGRMcCtwNzA4RUlzbmpNbFpyczdp?=
 =?utf-8?B?eTQwR3NTT3dza1VBRzBtam5EY0wyNUdjYlUrWWhCYytNOTk4R0JhM1dsOXl0?=
 =?utf-8?B?dGNLK0gzRlJNWWgvVysrSERtWFMvNUxpLzBSMEpHcmVuUVRjWUp1N0VSYk9E?=
 =?utf-8?B?amxJcXk4S3Mza0pJVmxFQkhWdFZWdzdEM2J5M3VrdEtkcS9peU5ZWnZPQzBU?=
 =?utf-8?B?S2x3VmxXaUYydk0wakZJc1hjN25IWktINHJ6ejY1WW5rQ1NtbE1NVWk2OGZs?=
 =?utf-8?B?OEU1Q2lxSFBKaTVxTzBSZ0xYeC9uR1VQeXdyWERsUjVxMmdOdjdzYXRaV3NX?=
 =?utf-8?B?L05vL1d1R2YrRWZ3RVk1amt6bUJnb0RKTTFYZHBuczdiemJPblJXTmFJVjJP?=
 =?utf-8?Q?EK1HAgg2YOoDFHTvXd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16c4735-bfec-4428-b0e8-08de5dd16701
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 18:25:09.2918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dsW+zYl74TGSD2ITFfmE6WnIZuoslzgeqEgYt6rpNVYkkm/NKZiURYHq+26oxpoqWC6WsyTyKvIhOFM8+jwWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10916

On Mon, Jan 26, 2026 at 09:10:37PM +0100, Sebastian Krzyszkowiak wrote:
> On poniedziałek, 26 stycznia 2026 19:14:55 czas środkowoeuropejski standardowy
> Frank Li wrote:
> > On Sat, Jan 24, 2026 at 02:55:48PM +0100, Sebastian Krzyszkowiak wrote:
> > > According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
> > > frequency is 400MHz.
> >
> > I checked datasheet
> >
> > Nominal mode—the maximum
> > GPU frequency supported in
> > this mode is 800 MHz.
> >
> > Does difference grade (industry vs consumer) impact max frequency?
>
> No. That sentence relates to GPU_SHADER_CLK_ROOT, which can go up to 1000 MHz,
> but requires "overdrive mode" (higher voltage) when above 800 MHz. It's set to
> 800 MHz in the device tree at the moment.
>
> This patch changes GPU_AHB_CLK_ROOT, which has absolute maximum of 400 MHz
> (see section 5.1.2 Table 5-1).

Yes!

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> > Frank
> >
> > > Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> > > ---
> > >
> > >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mq.dtsi index
> > > 607962f807be..6a25e219832c 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > @@ -1632,7 +1632,7 @@ gpu: gpu@38000000 {
> > >
> > >  			                         <&clk
> IMX8MQ_GPU_PLL_OUT>,
> > >  			                         <&clk
> IMX8MQ_GPU_PLL>;
> > >
> > >  			assigned-clock-rates = <800000000>,
> <800000000>,
> > >
> > > -			                       <800000000>,
> <800000000>, <0>;
> > > +			                       <800000000>,
> <400000000>, <0>;
> > >
> > >  			power-domains = <&pgc_gpu>;
> > >
> > >  		};
> > >
> > > ---
> > > base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> > > change-id: 20260105-imx8mq-gpu-ahb-clock-139ba9ca9a6c
> > >
> > > Best regards,
> > > --
> > > Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
>
>
>
>
