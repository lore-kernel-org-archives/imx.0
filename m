Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5734B385531
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061430; cv=fail; b=Ey9qNR0pVeN3RmrB8VXvY+AvGCtwU8gxDoHq4rMRyTbvWdBJkbeIeacbOn7tGOT0AzLyaCk5vDEL1EQX321UHom7FUH87qZGuFER+ZIkfExmT05WU2zW4I8+/RLOIOOb/eGowiWH9HdnzgwOSEWXODQaqOWggsSQcf+zpYZycWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061430; c=relaxed/simple;
	bh=oDwZPl3gPKuOTHjGIhShp6eDCiyEHneZ97tpGSbK/d8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ym91EiHVtsvGauQgAOvH8X4OQRyIyeOB8B71cgz+IVG2LYWnJVAp2VqbgfuomIhVRB/apWhte+1R/hS4rB2kVfjOnmg64T+BSOxa8Qo9maPEwOG1+nVTjYKW3cnwx7FO1RFrc0RuYPUp3vYbeY/XUFtrNAXra93edObKE2Tt92c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YWYdFX+n; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YWYdFX+n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tsf/7H9gBfX7boEZWe5kDob7Uo+HAQRyAvTGN6U1tFWf2W5TdB8xaDVLdSsw/Mpjwregmkn8BIO/jnX0oYzp/8f9MQIFdBRfKZ3snDR3DbtSHUtCQAFkLZt0QOPMIczQQNdimHOdeyz3pzE1UP3zvZG7oloHwL0TV5fRyjJDvvNgUPBT+yuaZXBkl9cZmFrXU1VQmHhkg8Pkfd5m22mgvXunmnSzBU+S9DerZjN56PLxVQvCYbHXz/9rQMSeGC9pbMun8ixy85xjlJOgXH7lS39Mi7gwjajEtXPsQpAegex2x5tJz7ZxUO16JGMoxYC3Es3LXqrVuBM16ZmqPe1mng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehuWwB0FL/VJV2CMdA6bKTWY2u7GGnt8NHRX9Ua4dy4=;
 b=efMCoVvTmFgnNbfYAn/FCSUhoNbV6z88yG3LYTPZxwRKVHEuxjknmOTC3jgL6YtA6L8dXpDJGd9qUTU8KCwWxwuGtp4tkQzZCQssYxTGYy8pbPFFy4TGU14Xi3mSR0nLWRjtykFP7qBiVv/v8aviq3HxQdpdovk45Cy3OVGyXq9bnFVbReWnCXYFeCvoimxoWjPxWcnjbTJk1XyZ052DC6QqL3TJBy5Vr/MlDisD0kj7xAOjzeZqtsZsdP2dCWbOl3aNzMUV9Ew+pKALlM4oGgPLfcBidxVMd67irvDT09Y1rjo/PlZp4dunvWZDbKlhmWW+fNZFKeT+k2h63H2W1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehuWwB0FL/VJV2CMdA6bKTWY2u7GGnt8NHRX9Ua4dy4=;
 b=YWYdFX+nGJuiI6rYJ2y0yWXU2+OE1iUQR65we/+T3TXx7itVhUjdswuDUS94obMw5QNNGIXhfLKwxpzuloUHt7DzT1zE9u6DcCp+sE06T1zsc8mdf6HdikYQ8HtJks0h+Xr+IUmqm8vn6/Z/sOAG25IPvvD1iz4b3pXT3dkM+gcCfZhZXUf+ycD5xOy8ZuRYyfBuSTCLENBwfJv6opVe0o3TFP3ZLTaWs6i5hjcX/DjzkZnR4Kfk3LRtMKUgG40HydWFtBKOYAetBnsIBqlHFq9IKWJJhk6driixSph9E0gWMxXyaNVO+5DXNRF/fa5H4DrY9gEnTEq+UbJQMkaPmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6800.eurprd04.prod.outlook.com (2603:10a6:803:133::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:43:47 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:43:47 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Feb 2026 14:43:23 -0500
Subject: [PATCH 06/10] ARM: dts: imx53: drop fallback compatible
 "dlg,da9052"
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-imx31_dts_warning-v1-6-434dd2643c3b@nxp.com>
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
In-Reply-To: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770061408; l=1663;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=oDwZPl3gPKuOTHjGIhShp6eDCiyEHneZ97tpGSbK/d8=;
 b=nH8ClnOhEuFe/4RaRtvY8KdMFx8GPn0E3AFE53tSxLKrkafhNuHuRYcFXnpbuqBSSn6RdmFFb
 eBVrlmb7aMxDxi8PUMJlKm5o9OpROZjjy5V3/gu+bYrYnlzJcYYMKhz
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 06391a36-2dba-4bbc-3eb0-08de629361be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkFVTW4rYlNIbzBSTHJpNFZsMlhwUkprakRZYUM2eHhvdG0rM1ZpOEVWWDhZ?=
 =?utf-8?B?TklPSnF4ZkFKemRyRDFRMHl1QVRHSW8rVkdsYlRHemxFeGRjYW96SzIxRTMr?=
 =?utf-8?B?SDNPTVRpbXdrVnN2UUY0UXpjK0tiMU5Jc3pCV3lqU0RWVGRLSlJCdUxQMFdX?=
 =?utf-8?B?ZUFXbTJ6aWtCWGRLRTZIQjRjaDg4UXIxMkM4d2FZM242ZFA4OHBrRXpKK3NV?=
 =?utf-8?B?ZU4yNlQyUlJTMFowVFlnbms4QkdTUnJHOWEzZWhJMjFFNDZQcFdRZ1FjMWFw?=
 =?utf-8?B?Sm01K3c4ZkNqbVRTQVgrOGpyZTdDWnBoQTl0UVNHWllvSUt3c1QwMzF4clZk?=
 =?utf-8?B?ZnEreGVtOVlsWFRWdElqYWtVdU92OUExT2ZwSDlvdmtuTHJjTzlpTkR4ZE1G?=
 =?utf-8?B?U0Y2bG9nTTVxMkxiTjJvVVpFWmxyTVVKQXpOeEI4VU5YcDg3SVc5V2p2dTIv?=
 =?utf-8?B?QUJsb0VhaHFrNERKYnQ5YUZYMXM1UmxwT05YV05NT2FhbXQvWHh4ZXRDRSti?=
 =?utf-8?B?a3pZZFZTUlRKbHlCQ3RmaEtjRit4UEo0bVlVUzdoVlVXWEFNNmdzZDRkcHA2?=
 =?utf-8?B?NnljMHNJN20zNTFwSU4xZGFMQWt6UDh4Q0loV2Q3QjZTalhyandncGN1SnRP?=
 =?utf-8?B?OGdud2M4QTNSZTRUeXRXU1RCQXdkaWx4dFZFZ2p5RVZ1WUhpcUdCS2EzWXl1?=
 =?utf-8?B?OHFLNjcxOUhCYmVVb0dqSlM4aGVZZUhLRHVhQXF3UlNzcnBLakRVUGZTWVlS?=
 =?utf-8?B?cnoveUpoanV1alF0a2pEL2NVejk2MFlyOEdVQzVNM1hmWHNNMTc2SngzajQx?=
 =?utf-8?B?VWhmSkVpMHFDM0lwRHF3M2UvRm5ZSGE5OUo5VmwyNFc4MzlkL3kvc2MvQU9k?=
 =?utf-8?B?UDM2a0t3QUErRlBhUHZjSGZWeExnYWdnMW1UTEgvZlZSbzhOcllUa3g5b1lK?=
 =?utf-8?B?YmlmR3E4ekdXVHU5YlVrNmluWEpvUlc5VlhnV0Rac0RGNGV6cnVGRWh0RExB?=
 =?utf-8?B?K29MWGcyYVRxakpFY0krZDJJaWpKTjhsd3FFTU9GM3l3R3BBOE5FL1pDY3Ir?=
 =?utf-8?B?dy9hWSt1TGcvTEJFWjgvWDAzNU5nT2FYeWQvbDl1ckpNS3RoYUJvM2Q1c2x0?=
 =?utf-8?B?bUFvblpvRjdRUXJGSnA1aE8wN09uTjhGTjNNb0w1ekJlNU5keWU4aDM3WUh5?=
 =?utf-8?B?eWJUUUNMclNWYTdFSTFkdUhKY2grZDVhK3dsVEgxK1B3WjJWRDJnYkZ2UElS?=
 =?utf-8?B?Rko3K1pqdCtxQ0ZHZUlXZnlmNitBS3Qra0orU1NrUndlb0pRdC9uUzRNNW5r?=
 =?utf-8?B?bU1FcFl3OEtnTmVHRnUycnVyaFlDSDdQc3B5ZFljOEpoUEthWlpNZEFyYUlE?=
 =?utf-8?B?aEM0Vjl5UlJmVVhMZndtMi9lR0pxN3YrOWF3RVJVS1Zla05nVHl3T1hMRWkz?=
 =?utf-8?B?eEswenhCU25FdlA3M0l4dW43SDhYRkQvS0Q3UTlTeFdTSXdIa2p3NWFVU3ZG?=
 =?utf-8?B?Tm1URFNFNGpieTI1ODVBOUlzMi9uL0h3Z0N5Zkg3TzJIWXpxUDRiNXBNUkFj?=
 =?utf-8?B?L3lPRzBtVzRJTVQ5QlhiRnZhc20wTnNrcVhCRUlQWFBmVGhsZHJUOUF3dmU4?=
 =?utf-8?B?ZmQwUmh3UVdBU1V1SU93dnF0WDhyNG1RUDFKVnk0VVVRbnQ0UlBxOC8wc0JO?=
 =?utf-8?B?VDROTVpxQ1JOUU9HK1E4MFgvM0lQSlNDWXRzTkxYS3o3WVJENWRzRnlaSDZ1?=
 =?utf-8?B?QjBaeHdtRGdxWjI3citoTWxkUzRrVDE2V3l5OStZN0xPNGorMWRVanEzaVR0?=
 =?utf-8?B?M2hHUXZaZUg4b2NvbVVMWU1SRWxSNWpkNWxXZi9qd2pSSjZhK1U0SWpYWm8z?=
 =?utf-8?B?OXZGUmdEK2grMU15WjlYbytoKzFxcCtZNXVjdEo5eFEzRHlqWnpYNkhBV3U2?=
 =?utf-8?B?TUJVU3dXTjg5ZThsd2Y2NkhrTVZvVjhKSU9IcXM4d2d2ZHNrRW53eGFOUVZZ?=
 =?utf-8?B?blFQaW8rdUMvSklYNExCd3N1aFpidFR6NXF1aG5RSmx0NjdxYVBmTVlaQnpL?=
 =?utf-8?B?eGg1TmFVWnBuWTFtZlRxaHVYUk51WXdFK2xiMEVJQWoyVTlBS0RzMmJPR1Y3?=
 =?utf-8?B?Q1Qra3pJT01TeTAxbU5rakxxZFYvWTZvSVNPVk53M2dmeFpjUnJyNTJzbHNH?=
 =?utf-8?Q?hRZlM5DWBInR4MiujsqKTe4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0NYNFNEdmdxNk1OZEU2cnZneVYyUHJXVUdnVFpEMVpCMFFzN2tPcWk1ak4r?=
 =?utf-8?B?dDJJQVpIbkFwVDU1LzZDMXE4QXl1VkI5VkxkMVQwNEh3UDNmYUUzckdYOTVJ?=
 =?utf-8?B?OU9tR2ptczhoVFVEVlNEVGpNdy9OZTgyRTN4WW83L2hIV2huelYzZjQwSkNK?=
 =?utf-8?B?RWpIWXNuOFBUU2pZTDNlekpWRDFZNCtNZUx1dGlsd2F4NGZXaWVJMzloZ3RC?=
 =?utf-8?B?MlQ5SXJ1UllvYStjdVQrUTVlMTRkeGhERlVHZ1U5ajJiUHVWZzhsR3U1czVJ?=
 =?utf-8?B?TWMzT1gyelQ1MUlUbG9TY0JuTGY3dG9XSVh1b0tNN0dXRmVOT0h1VUdjM2VE?=
 =?utf-8?B?bVR1a1RON0NrMkxTOVduTFRLN3BpaXFpcFpCNS9ydjZsTGg2SWhUSVRHcjdD?=
 =?utf-8?B?WjZpNityK1o3VGFnOUp3MURXT3JyVVlaaTZwaEFiVnhVazdrbklPcE50eWlH?=
 =?utf-8?B?dlR4Q2NIek9VMUJGK21tQm14cjJRbVlGMk9sTlU4aXN6R05vdDQ0cStvNXBF?=
 =?utf-8?B?ZzdOUjN1WjVxOGhtRGVLVTloaUJFcGxiN2RqK0VVSzRHd2ExOEhVS01NNERD?=
 =?utf-8?B?NDNWZFlqNS95QWE2aUFWZ3FtT1hZYUhCeldlaUlhRWo1V2MweHJWOGhlUjY3?=
 =?utf-8?B?ZUoxc0x3RUxBcVM2ZnFXK0pMY1k3bTM2YnB2MC80ZWdrcDM0OW92Sksvdnl1?=
 =?utf-8?B?R0RyZ04ya3JLbmFCOVZ2S2ZxSGt0MkFHd1BaaUtmWHcrVGE2ZmhLWWlTOFBh?=
 =?utf-8?B?UTJyV1JTK1VCa1FHcmlnK1VFQU5tMHVSTnBza2RJeVgwTExVdU1YU28wTjRV?=
 =?utf-8?B?OXJFMndQVTF6ZFJNWkl1QmlTMjlubjZrOW1TYnc1ZFBicCtDbVJ1K1VzOXdT?=
 =?utf-8?B?RXJ1S1R3WGUwbUVWSnpDbUVKTjFJMGhacXU2WUlqRm9GRE12Ri93dmpHMi9Y?=
 =?utf-8?B?Z0FWZk9GUTFPYmhldVVrSjFaY1B6eUxXMkQ4L2tGU2pGbzBsM0t3SGdvWVFw?=
 =?utf-8?B?Y205cmIxYU9GQXJ5N0o5N1ZKSlJtL1R3WFhiZlVrMSt2SlozKzRrNGduMjZ4?=
 =?utf-8?B?aDBRbktxUndzSjdUZFBjSUNIdkwzVVEvOTRKdnR6WUhCM1MvUzliclQwYUU2?=
 =?utf-8?B?dERlTjFCMEJhTmJFZDZESk1odHhEU3VYajhRUkxKeXdGbmdvSWhNNjFObTdD?=
 =?utf-8?B?NmRacitWR1NDSDZKKy9taG5FbXJzSmhmTmlNTWxGc25pWmJ6ZjNSdndrTUJt?=
 =?utf-8?B?UVFBOTV5N1lIejVDcTloeXR5a3VyRGFyZ2t1UGFrMUIyZWFmSE1ZRElNUFZX?=
 =?utf-8?B?ZFFkWXlPaG1IaUdLdVVuUlByZC9NZ1MrcjF3L2xpOW96TVk5RWR3MnozdjJR?=
 =?utf-8?B?VHJqTzdDS0RLbGlScUZWYjBlMC8zMTJTaDNMOG50djJEQXRaYTI2L0VtZnFC?=
 =?utf-8?B?SktQUzB4RGZ6QzhkM0hyQmpYNWpiM25lQUt0d29ta3YwNXFlNnZiOVl1Z2Rj?=
 =?utf-8?B?bmxrWlhCVEg4SUJqTVUrREo4M1ZRUjZnb0ZrYWhPN01Vbmg0cWhaVkVrRVlo?=
 =?utf-8?B?RjFXUnZqTHZOU28xalZmUmdKU2tpekorbE5EeUx1M1dXZjhwZmZ6MUg2K0VT?=
 =?utf-8?B?d1FJait2ZjNQU2RCVVhPMGlYaEZJSjMvZmU1YldtUVF3cEh6MnM5MzVUMjdL?=
 =?utf-8?B?a0JLRlB2RndXVTdQSVdPRTBWUGgwUjQ0czJGOFZZRkhqdHU0YUc3ajhJa0Nz?=
 =?utf-8?B?V0lHVHdXZE5XTEJaMDhHWUg2T2lGdWJWQXpPeXBFb2dYdFpNWGFqTElhSjhM?=
 =?utf-8?B?aWxMYWljb2FFcW5FMWVpVVM2WHppSGoxZkQ4Y3JkRnR0RU5nOWVhM3UrOGcw?=
 =?utf-8?B?dzY3TWQ4Uk04a0ZrRHpkbElqV0ErU0tKVHlXWXpqN1RvSWFxK0YxRzhxZlR4?=
 =?utf-8?B?aEUvK2VoczFCbWEvRE04akMzRnZiODFxNGtvb3dwY0ExR3hNNzMwZWx5bkxR?=
 =?utf-8?B?ZmY2WkZiQW5nQkZZRDA4WXNxTERrYTZvTmVKQXFGSEExVkFsOUV3aDdTNFFJ?=
 =?utf-8?B?RGVFQ05YZFdqb09pYmY5VUcybXNIR3JIekVUb2h1S3dNaXJDQWFpc3JrTmZ5?=
 =?utf-8?B?Q2NZdUtCRkFlbi9Wd0JkZmYxbGh2R3R4Mm5QL0lSRDloY0F4QXN3c0EraVcz?=
 =?utf-8?B?K3JubDlJeU83ZUZjR2h2MU9VMFUzV0hWWGpIUVNnamRRQjQ5T0F5bHVyRVZJ?=
 =?utf-8?B?T3dwOFVXS0tRMTA3SHd2ZkVlZzkxV1lSazg5WHlzR3FkMnNzempJSlJycHhZ?=
 =?utf-8?Q?aPd+z0uwe9udv94h2O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06391a36-2dba-4bbc-3eb0-08de629361be
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:43:47.4895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7BoY19aZozi2TdefUTP2pra5J6G4DqIOGLSmm0Zog1P4FXFgqovXOgL9BYg3xrQmac4IZLzLC7H7fl6XSdDxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6800

The "dlg,da9052" compatible string is not fully compatible with
"dlg,da9053-aa". Drop the fallback compatible to fix the following
CHECK_DTBS warning:

  dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-qsb.dts             | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb.dts b/arch/arm/boot/dts/nxp/imx/imx53-qsb.dts
index 6831836bd726cb759d47821d104595e00c3bfb46..e7e15d2b82c4455d07e246eeae6830d905ae9bf1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb.dts
@@ -13,7 +13,7 @@ / {
 
 &i2c1 {
 	pmic: dialog@48 {
-		compatible = "dlg,da9053-aa", "dlg,da9052";
+		compatible = "dlg,da9053-aa";
 		reg = <0x48>;
 		interrupt-parent = <&gpio7>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>; /* low-level active IRQ at GPIO7_11 */
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi
index 6dc70a92d831b42b2c1ec8d8eba3839fb45f64f4..6eed683d92a83ec1e59943ce31bba5cf315f0246 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi
@@ -128,7 +128,7 @@ &i2c1 {
 	status = "okay";
 
 	pmic: dialog@48 {
-		compatible = "dlg,da9053-aa", "dlg,da9052";
+		compatible = "dlg,da9053-aa";
 		reg = <0x48>;
 		interrupt-parent = <&gpio7>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>; /* low-level active IRQ at GPIO7_11 */

-- 
2.34.1

