Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023074.outbound.protection.outlook.com [40.107.162.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E260223AE62
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016051; cv=fail; b=t7Qz3F8z7mogg++ShQ2++okSwXxikp5WOJJvJUJbMfTHUoKh0DtzNzb/RmY6mqQjhkM/4Y4XMP8xdqmtkfOTuifMm5nfUCcyG12JlsLRYfADFz+iOo+zlPQcUn2SEmbSjeQnibSH6LC0yBogcl99jlbx5thvawjRl/S4mrrTFG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016051; c=relaxed/simple;
	bh=k4D506JQ92Y51bsaXtMIzlHKMBjrwOvE9sIVkxaSqqw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MGdJhTXlLoB7VLZs1TbAU4rtydiVjkeR6VkGxdbJW7u77RzLTfqhPS858nMYJTKqGhxfczGr9lB31Sq0D7KKGDtaRqneMwoREaWGw8aSHK6DL+jyf9YngkIcjqcWjMgDBUrowlOv1c5uCBragI/xdefEjLXz7lwjcPRF+qu+uxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=PXWzi+uQ; arc=fail smtp.client-ip=40.107.162.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="PXWzi+uQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUPoIZTaO78fzWVHlEKm1yKpgqWk3i3zkzbVa0tpxfiE4UtYtqXPyxguNRljuGUdbzOStgtEnZlU3XY5abam3jjzH6r7eJRMKDjb8qxo/RIwCL1uOIPAXARK3PZiZpOFAvGWgp1Zh2xaniv85rQkFKN4hPS4zzOnZA58S39pFpCc86MuhK095fWJp5ve/2i+SylGHPsaLRBwoNuE3n0UCOe7YR34lSQSeltxtfDn3LrMJ7cwWvfNPKopp7pcIeD37/Kv+Ql3FBmXipCrsHJZdME+zuFUoKijjXIwVprwu4ZXahkELJZIW73IIyw9iYkWTrd4tW3OjF05oqo51AUkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XqpJ0q/osNOfaugeVj5l8wBgkLcgRx32A0Dg7a/ZLw=;
 b=mvRa6FL0jRsPVbQjEWA7QFASG4LkWQ2yFvevC3PX6nbta2WSM9Z3wYrxfYwsgaYsaaM8xHPLblFtQm6aEeUVC43IcR+xwkkFvHLY6zzFdjrUPS8IJ84vaqmXwyrDxPaHBrEI3Y6aKYM3WDwGhrI8FWgmxGTtdy50gZsceO5Tqv/uORds7xbIUdK/ynXIDaOZfk6+vB5XWX42qPaV3XsxgIl2fGGMhZRH/1fQTrNZvdz+fDVWTdPJ9KUtjDiG5LFKvLK47WUFAPJmnI+HIx0rDhTzo07cXukcuAXxKz5wwJsLPpwprpiwG2Z7d+CTGIHRFjpudZm58Ebt2m/EujF6Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XqpJ0q/osNOfaugeVj5l8wBgkLcgRx32A0Dg7a/ZLw=;
 b=PXWzi+uQLu0RqIjgyckV60M78xUr0rNFuXNgPeT4jxMG7aiKrcgZV2Z+ZgL6C7eYyVfZcJjZLqqdSkN6WHaykGYvpwCJ6j6d1ePHx6pae/EJJrD6qdx+SEGR2aHIdptMn8vMD5MTKPuJzgJ+/nT1h6pepbJbYbu0iOAd4axIiSpsaUn7XgK4HZWKiA+y3uRGk69XK4Tn4uGQ0clxxOwlNGc7/GvAh1LZDkDmZ0kTEq+uO/4ElkZketCZkqW6tRMHKVCYoqaiEK/VE9wXk8Eujw0V6O/L/NWDxL+2plYoklgDHhI4YMCEzWI6mnkiOdG8b/drAk+h+/SnrK1gYtzgyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AS8PR10MB6056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:571::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 08:00:44 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 08:00:44 +0000
Message-ID: <1148836e-8388-44f4-a4c8-3911fd1a4a10@kontron.de>
Date: Tue, 14 Jul 2026 10:00:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
To: Frieder Schrempf <frieder@fris.de>, Srinivas Kandagatla
 <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-1-b8266d93514b@kontron.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-1-b8266d93514b@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AS8PR10MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cad7b4d-5571-4d59-ad6c-08dee17e01ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|921020|11063799006|56012099006|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	qIKmnbS1Qlm3pO0HR3tWHpLRXo7jVPXMpRb4XxE376E7/wEm7eP3sa/3ve/d+/AL/pFSaX8JXDZ3kDsyCuUwJly3cqvzV09hfbLbV2Kr7Z9JBBVhK/g/zJyHLUqOlWAkxEllzfpRazx8ibfYySqtxlSbMrNcRHoQpD65XxcMAJe4cTF+xkIBCJ/cxoAOAxkqpqgIDi0b4/BjqBZ7GhrMLyCOAFtef9o7jGVcEcesfZFIooADXbYS6X3mWXxnrOEmDpbRxRH/DCimep2+QYtnpZftkDz4o1NS6hz+EjwF6viyrjjATR9HKjBZ+x8WpPohLfYOpCS4+77DLGatCsAMRdsDPtgOoFifqrgZtXnqrjZuElCcdGBsLo8PYcDO035oTFvsQXwA+Csk/z8UhQmmOc10kcLLriku7iW+Kj3pzhp6k02uPv14kz3JQvGqZaRvQuVYgBhDMY6nzaT5wLJkNYA3+wmJP7ywWTcCpkkXL+Ec1fykVshEI7GWNYfGiTFlHcBiIaMuBC7goOFInDh9TXJ5HPmT7btpuUbLj7CPj7ckOobpgp8q6YpySco+UxcOVWAjxv5V9gOqL05ga9N8HXCqrAKNmMo12yntEHr72hjNthWiwEHnCMIEg6FP9gfnebvRWYoqocQOHxp3JF/WR1QMYrdT92aTdNWCMmGGCr+vflo79G5sAUK9uilLh4Te7SDdszT3KuchzBXKB94vAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(921020)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUFERk1XTVUrbFB2ZEw3Vm92cXFQWnlSRVhDZmhDaXloR1ViK0EvUjgvMXN6?=
 =?utf-8?B?UTh6VlhnZzVFbHBGUjFiQmcrUzRIbUxvZUtkYkw2Q1k3QnQzVzBISzgra0ZT?=
 =?utf-8?B?N1JYWm1UNEptODRsUlZuTWNINEpEVVVON055ZCtTVkVZeEhRR0tVSVZIUHRx?=
 =?utf-8?B?NW5seGQ5MDdhTWdFRnlpMmlKRzBNb2p1TGlvN0lRUllZeUdEZWZRMWJDUGJ1?=
 =?utf-8?B?MzdSaFlvRXo4djBnVllGYVArM29YbTlwaUxFT3MxaFhGZFVFaGowZEt2V25F?=
 =?utf-8?B?TE9FNkM1YUN6Uk1EVzJmSytyZytTaThibS9tWkkrUkljaVY2dTFEdGNlRW1k?=
 =?utf-8?B?N2Y3NnJreGg0YklZcmR4VktoTEJQbXk1aXRQL2pOWlZ5cmxtdUtoeTVjZWN6?=
 =?utf-8?B?QXY4b1VsbXlabm1xRjRycXBCR1djb1ZCRlIrOFduaCtEVzA4UWtCR3I1eHM2?=
 =?utf-8?B?cDVSUlFhMjRMM3I4eFV5elo0MEhFdUpiN2RKUWsvcGVsZnVjdTBqT1dtV2k4?=
 =?utf-8?B?QTdjK1hmN0NVYzhPRVJrVTM0RVVDTmVGNEdOTWRhempMMmdQR1BlcFNpQm5s?=
 =?utf-8?B?aGg3U0l6U3RmUE1PdjU4ckJRVThZZDdFbHZib2F3aTNEK2h1YzNweGpKL2hY?=
 =?utf-8?B?NUgzYUI1cFRYYi95ZDZRV3hYTmdqYjQrV3hjaTk3RHlSNzhoQ1JTZkpJUFc2?=
 =?utf-8?B?aUhvZ3EwTjJMR2oxaVRTMHB5K2JsRFZCUnJ4dzk3bzNBZ0hDV2thcktCUUg2?=
 =?utf-8?B?Y041L0pWSmdaTmx3b3d6YzZQNWwybW9rcmkzSEF3N3k1UUFEbnBSZmZ4dzRw?=
 =?utf-8?B?QlltcWE2YWpFeXVQbCtIRDkwdjM0LzZnSk5sKzYvUE9qOUdRZnJKSVc3NkNJ?=
 =?utf-8?B?VENOWi84L3dMWmNoeFBaT3hEbDd3elcyS1B6ckNHWEswb2JaL08xcU8rOVp2?=
 =?utf-8?B?UjVzNzJkQ2tnVGx1Znhic1gvR21EN1RianJBUGNZTlNjSkNVaDlCaXFucG1u?=
 =?utf-8?B?dkVSb1hPOTYwRlVwZ1F3VFNzTTlENDZUbnI4OFVWSzFGV3R2U2pXbnBwUm01?=
 =?utf-8?B?eGp0SnBON0R2SmVqeDdMMnpBRVNWVzREazdmZzYyVHdERVRvbHMycHNhTmpU?=
 =?utf-8?B?czlKRTRjcWhUc3JORS9maWUwdWR5b0F2dHdiUnd6ZXVlTkxNVjZMcXBuUkN6?=
 =?utf-8?B?bU81STUvM0Frci91Y0UwYk5kSTNuY1ZtNVY0YTBnTUh2N3FoR2E3eXN2RUdr?=
 =?utf-8?B?WmRDRFVhMDhBMXFUYmx1cWdVS2FHb2hUQzBwMTAwT3VTQnBmWmZONXl1dGhR?=
 =?utf-8?B?MGdDMjdCZmhaV1ZTSGxCelh2dVVNL29RQkFudkF0R0lMRDVnMDNiNllWR2Zh?=
 =?utf-8?B?KzRxMW5tRG41N00zNENSZmlBOGVmbFlTUm51L1Iyc21RbUFWVnhwejFnRFJy?=
 =?utf-8?B?YlhhdVdmaFB2WmRwckhjcFdHTVdicE4rL1A3Um5XdWhUODl1MWlkelRLOFNi?=
 =?utf-8?B?eldsM1pRTWovdzQ0eGtMRjM0c3BZN3pSZ1VlS1NYenpzQ3FRQUxSL2JaRFNY?=
 =?utf-8?B?eTBpdS9LN3dBTEVGTnc0dFFuVVhzbW41ZGV6cFBwZjNFM0g0Q0FZcDVLZ3lS?=
 =?utf-8?B?WFc3ZUk4WklqNm5UcjEwR0M4V0s4cUlFRGU4TmN0dW9GRkI2QWs3d0tKUlhH?=
 =?utf-8?B?WFFaRUttRTJBWVMrTXdCWldNUGwzcGRtcEt6ZmxyQmN1VFAvTjZpTCtBZ2xR?=
 =?utf-8?B?RWhRajhzblp1T00rY0wzaDV6VG1iUUZTSTZ6SW53TWJSRE9rL3M3OW44V0gr?=
 =?utf-8?B?cFA3WkpCTnVjcm1SUUg0Ri9NRjNGWDJmcmRqcmMva3RkZHlHYlhTUlIxU20v?=
 =?utf-8?B?SDRkQVhBb1FlaiswVlVqSnAycVJWdE9CblZTY1BaaUNtcmFQWXhqWFNYRjFE?=
 =?utf-8?B?VnNZUTA2eEdaVldITW81ejR3d3B5T1IrTEp4STZybFVicldoRm5MVDc2Ukhu?=
 =?utf-8?B?YktKa0lLZzhhZWVST0NDcnFvNGx3QUw0dTNhSWtFc2NBM29CMXNqRzZYb21J?=
 =?utf-8?B?MVZnSG5ydVM4UjZ1cndTV1ZXWVhKOGdMdjZXTDRBVTZ2eDVkM3VpY3VlKzRh?=
 =?utf-8?B?TGk0eFRNOFNBNkRmSjFaQ2FtMGo3aHZKc2lHM1owQXhpcFIzTm13V3dBejRX?=
 =?utf-8?B?ajJHZEVheFRDTVFMUDVGQ3NMc2IwQXM1akZac3VBTURnZGFTMWc5bnh4M0x3?=
 =?utf-8?B?TUxiaDF0MXl6TVpHRDN6aitLem5aUDM1MEZzNCtKRk9qTFo2NERBcTI5bEdV?=
 =?utf-8?B?blN1UENYdGl6cE1Hc3ZpcEFNOS9mQUhHblVxdExPb0tpSWp0UWZvc2QzNnd2?=
 =?utf-8?Q?zNoxgPSBeDzEThB0=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cad7b4d-5571-4d59-ad6c-08dee17e01ac
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 08:00:44.4938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTuphFVHHB+rUej1VeP0tkws3H8u9nEV2fzB+i6jk2/+knnXnDnO7QF6Sel4wNXAEDaVKa1541mZqEMuibNrdFC18tGiwB9UaRBBrxoBBwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6056

On 13.07.26 16:53, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The driver currently uses the limited MMIO (FSB) interface to access the
> OTPs. The intention is to support the firmware interface alongside the
> MMIO interface so the driver can pick the interface that is available
> (firmware might not be loaded) and fallback to MMIO.
> 
> Some SoCs like the i.MX9 family allow full access to the fuses only
> through the secure enclave firmware API. Add a property to reference
> the secure enclave node and let the driver use the API.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> index a8076d0e2737..70901218871e 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> @@ -20,6 +20,16 @@ description: |
>  allOf:
>    - $ref: nvmem.yaml#
>    - $ref: nvmem-deprecated-cells.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - fsl,imx93-ocotp
> +    then:
> +      properties:
> +        secure-enclave:
> +          $ref: /schemas/types.yaml#/definitions/phandle
> +          description: A phandle to the secure enclave node

The binding validation succeeded here, but the DT check fails. It seems
like this is not the way to do it and I need to add the property
unconditionally and then reverse the logic of the condition and disable
it in the if branch. Will fix it in the next version.

>  
>  properties:
>    compatible:
> 

