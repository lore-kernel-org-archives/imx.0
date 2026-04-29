Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B113374195
	for <imx@lists.linux.dev>; Wed, 29 Apr 2026 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454922; cv=fail; b=ew3T8WL3C3l8ikVEh6OWY0ZUXUPHPynKFCIQKtd7hZtx6RxszAcYonNN86r6JD3bHE5MoOiusQ0qYuu3ESuYmO/mQXh8z6bC7+L4zUKTVec1myhykBRWC6pUb5MOCF89VqwtdjxIGrYiypL42uLT0GStagl9OIz9wWX7AaQSSmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454922; c=relaxed/simple;
	bh=Cw9Ae2YIw9ZNgiI863zlj1ZYw0FohJZ8/cmnpHSwBtk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LdkuoK6qXheTv2tx+MNVlvBBYKNjsNvYvvhCELwGTjzu6S5qIkIcwHct4g+Y1pwTklPtetFQykxEWh+KNMI1jLkYjnbzMDLX8JJClPzAYy0xFwuImMhaCviGiCQIOPEeG1QkDKCzNi+f9yQIUG8yw2BbgWpkRyFPoFXgJc2feQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VWihipCv; arc=fail smtp.client-ip=40.107.162.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VWihipCv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9fjl/YHl+53FkqwrPB+zrgKcB5HLfa74JNZ0010Zsf/Si59oRbL0Fvspum79JS32F9AmxRb//r4w83/36qydqaQlbmkU43dsb9muKMtadskZoPSc3jAmqYnUjc2ATtgxVo5iAHJ7MMKraI0uvDxtAYQWh5vlUVwU0Fp3ecykhgPVyVkNbZRCZvugJ7UUnrg64y3PnFZKtF/XsMT+LU9dTCCsUhlyXuKH8E0YWHSRLJwtWCEZ7ftMOLUtiT4wN0E8RXbzSPJue6xejSoL+zxNEYv9AYUzABgKGuIj18U/lI4SwI8Wd3GAKGV1gO3Hu68mDeDcaqOz39QDxZj87+hHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvvnKwbnoFIyYxAJp1tHhpNO6ytnaL7ZrrqSCu74OZg=;
 b=NixS7j1UJFoRexJEd/qwP4UYk/ADBRxo07Wdmk8TmWdMjPulCz7ndYL+5KNBxlLHj7ji6Fgtw+WpiTiWuntbXDxkHyTNy50QTmWWFHck2sDz7qwHA04RSrajCGpeXfC6mbOHN2C4BBXLZqdwaqklhAAZpYBdCqwgvZav7KoeQiwl8dZp9LcMZ38FmVEVcbGow6XZ3DKEM1n4lHzdoPMm3M/ZX7hg/Vmkt11y3m9lMpTHecG/JYkC30XfNK++W5hCMM7ePhgNpZbuRKPunyszcvf1+LDuF7QNC2eOs+rEiQbH9MTr/kMktUb+IqAadVC+58Aj22GMLv5ed6CrmbXGuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvvnKwbnoFIyYxAJp1tHhpNO6ytnaL7ZrrqSCu74OZg=;
 b=VWihipCv9sy8tIdqsvVB0+X9MjflDpKfOdD2rYADIxrFzt9ZjHsPTdA72bllKUrIBN1BPVfEPkn7hRl41Bx6xJ1dVjPnQeZY1WU7WzhFzIg93DYlflzzg+mPR2qnzGO3jqPyCmJXWaHSpw4+/I7EkF6vt4ucDbxTEi3I7zt0SPzs1kTaDUc5oX5Xc0sEadilZSBMInL7B14xYpXSVO8bSIo20LuzjOnTCrIILBrFniglgiCeVeZYgZmYfVKug5yqiRfVgNsFLyWAcFImVRHhm+xHpPe8SnCZHZDwBlya1y0LX1Fu5KSlZTy04/klujllw0Lfb6TJxnvlhKZYuuoX6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AS8PR04MB7656.eurprd04.prod.outlook.com (2603:10a6:20b:29b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 09:28:35 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 09:28:35 +0000
Message-ID: <f7257d2d-61d8-42e1-b589-874da203d851@oss.nxp.com>
Date: Wed, 29 Apr 2026 12:31:49 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
To: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>,
 Joseph Guo <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 xinyu.chen@nxp.com, justin.jiang@nxp.com
References: <20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com>
 <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
 <d0dc01c7-dba1-4f25-88ea-a0840559cf38@oss.nxp.com>
 <bde82660-0550-4614-80a2-bf4f49b92063@oss.nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <bde82660-0550-4614-80a2-bf4f49b92063@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::18) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AS8PR04MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 763c9b3b-f27b-4683-fcd1-08dea5d1b01f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	H8c3GUnJSoAjefJXDtX9xA8rlMMbftKYpHgnTgv7X9Kzg8zwC7YijwbKzLrEvbcKXd7RsKL6O+KRGqsqBiyz6ELbKuqrEyLfchbo/mbmp4C0WKkaeCYqPJ2rEOU+d3nlAq9K3NMe/HHk7B6CHGdnF5jnNR/DlembhqlwnutajcSRoFg2XuAniSn5ogUqfg2m06/NTGExhxLfjES3G22cIE3NG3HDrv4SR4Yvu7+RApqTFLRdcMXZ9Ex0kQJQuzNCnMrizGxQpeECYA2pDDiqSCYjgnCknB+E9ivSbh+PBpHqkYXp1Vliopovb8Yr2onCp4CCkp9gxBLHQ9JyohK9bAHe+ostOGK9ouvzM3U1sEP7QCCjz3yY60gw/SEBOV7J4+56mv14EzlvUoFxS0NwSzONSDvWOslxI6KXuD/lRHyKKIiCJ8z0vR5TYqxZh4HnzVtZTSf8ky8EO23j2ahtKaomw4tDXUljrctvYGc4Yb/3C+Fp4PRr3x8Vy3q0hVCTG8kzfy70+heA8IxqXc2hx5TLs+pLHz6Wo3YVB0bcj1yI8SxH3dJbeWK8IZJuBfoqlb2F6HtklmSZAM8ceViWj+3qFdXO8qUkT/MLIjKiVRDkCxN0w+XF27gdsSptwY4A9ucI5bTlFfHM7LtuUbhuPStArDgDJYh2wW4kyNW9IVwuXMpzTACDqK3ynEJc/y2u1KNE7x5wbqcK0dZJlwitlBfKqLrlZvrHwzXQEJT/8E13llSSFRGrKwv8na9E2CQ7PM9YsLFmRDV4Uv0kGuFlSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWNLaXU1SWlHOTIyaFNzdTNRcktuUzBxQWdsenk4SGZ4QU0zSVgxNThEUFdN?=
 =?utf-8?B?eG1PUTZaVzdCQXVJVGIwd2xZNHhyWXdLRHR6TkNncS8xUUJ2cmZBdkNlRDJm?=
 =?utf-8?B?ZWlBbk1QT0RUOGtVK1NacGlDbzVzYkQ1MjJUSTNwc3pMcFliUHk5ZDdjenJ2?=
 =?utf-8?B?L0lXSWdVRnBIYU9iWmlXekVRV1hLNGRnRGNkM3VYRzZlT1VsSXg5TkFCZEZT?=
 =?utf-8?B?bEdMdEFEci8zNS9yNWtPNiswaUQ4b2J4ZEVUVVRDY21XcTRodEFGWDhtVXRE?=
 =?utf-8?B?My9DWGVWYytzdHI1cFJld3dtOUtDVFZHci9XZ2w5L0s4T2NVSHo0RS9sanRy?=
 =?utf-8?B?M01OaFFaNG5zbjZqNjBleXFYZWxYb2t6bFNNdTRFdnBpY2RSUzJ6VlVpeVU1?=
 =?utf-8?B?Wkh0UVZsV2xkSUVrUFh6QkhPY0lYRUhPNVJ5eER2Nnk5dEt5V0JUU0Zuci83?=
 =?utf-8?B?R29lSUpqaXBBbm5TWW8wZjRFL0pyOGhQL3puZjF3SlFQYmRJcEJGc1U2ZEN6?=
 =?utf-8?B?b2Z1eDhicERPcGxUWTU3V1hXNDNMUUVzT2xsYTZBblp6Qm1HZ0Z0cGwyQlRM?=
 =?utf-8?B?TlVpRzFxTE53RS9yN3pMZklEd0RZTnVyYzlRcWFLOHZZK1E4aUxVZSsyNDJB?=
 =?utf-8?B?SGpxTWMwVTU0RVJxNHBMSGRmbGZPZW9yOEhtb3RLUzE2YjY0amtHMHhFa1ZR?=
 =?utf-8?B?VzNvQVB6ZXRvN3FlUnFGdkQ2NEJBNloyZ2VlT1g0LytjUW1KZUJyU0oxeFVp?=
 =?utf-8?B?a3dyVm9SdzBPSUQzVm5HenZaU3lFWmN2SjJwZEtLeS82dTgzQXdlVVlRaG1n?=
 =?utf-8?B?aFRZV0ttNTlOaFp2RGo5Z2pYNmVvTXM2cS93R3R6emQ2N3ZPUWhMU2tDTkJG?=
 =?utf-8?B?WXZQWjZKTnpndi9aTG1aME9hNXU1bmxRUmdJWVdYeWZkY3IxQmZBU0RrNWVE?=
 =?utf-8?B?eDVPN0E4S1RtaXhlYkNPRTl5MmY4aXd1M0ZESFFiZVp1NGNiT01VcmhlQlgw?=
 =?utf-8?B?N3dCaEVHU1M4WElIQ2V5dmlRVjc3cEZQc21kbVNmVnBYeWpqVEFMUTd0R1R0?=
 =?utf-8?B?NGlEUS9FY2poMmQvL3RoUzdrZ2tRcWU4QU0rTGNFMXViWnA2VUdOY2FGL3g4?=
 =?utf-8?B?NmlETEtXcGR2TjhTTGJKU1dEYjZhWTEvN3VkRTZ4U0J1alV1MVFKdjlSNzE1?=
 =?utf-8?B?NUZEMFkwUGhQbnBZc3NaeFllZGRIUVhINHdJRjhoSTFHV0psRlFvWTg2RUJ5?=
 =?utf-8?B?N09yemd0L3F3bUtjQlVqMi9BM0xXLzdpY2NEUjM2VUUreXlqSUN6NldJVHhm?=
 =?utf-8?B?WlNqbUVEQjBBSVIvb09Tc3Z1Y1hXWGVSUDUxR1hHM3N3c3RaUXJQWU15RFFE?=
 =?utf-8?B?SjdiOVFBZGZVRCtmN2xua3lNeGxadGV4dkREZkw3ZnlDeFg5UTMwcDUwVWds?=
 =?utf-8?B?YVVDazU3bDJmMjFLQTJIN0JsZ3Z6WS8zOS9xVzUxV3Ryd2lHRkFUNEQ1R1dR?=
 =?utf-8?B?Vm1Ba2hKV0tmOEVHK1dSb2FyWFBPUXlsUTB6L1JxbVNnbUt0UWIrQXRqNVJn?=
 =?utf-8?B?OVd1TXhETXIybHJFa1R5OU1LVkJuRm94RWZpaHppNS94UUN2L0VGdE02Wkgv?=
 =?utf-8?B?azloRUFpekFBcEtkWEtWczZVSCtHUlhaTFB0OXBSYkhzNWpDUGVJdDZLN0x3?=
 =?utf-8?B?bjFYcW4yZzVjZGNkODQ0Rk85cHFXY0RPbkNMOW55N0VmWTFBdythQWpCcUMx?=
 =?utf-8?B?SDd5M3doK2I1MVZ0K1U3c3krcytTNG42eHc2Q3ZpVlpKRzBtUVhPOHB0Q0pw?=
 =?utf-8?B?L2h6THYwNVlEejBmd083K3YzRlA4U3lEM2d6WkQvOFVobGt0Mmt6WkQ5ZW5r?=
 =?utf-8?B?aVR1VW0va014WDN1NHZrVCtyKzNXcGJOcXlFcGxPcmRhdDZBc09ZalJwQytH?=
 =?utf-8?B?d0RqNTRDSE04b1R5WVBhQ1hkQm9BajJGZnVEcSs0TGdtQTFhd3V3RUNIUzVP?=
 =?utf-8?B?Mmw0ZFlsNStTYlhiUjZOOHNWNzZGSDZIa0xVVXNjWmxqSXlYSkJ1VTY4S3Bp?=
 =?utf-8?B?VTJFMjBDMjFGR1hCS0xTN1paM2FidTRESnNzenpnTytPWkhOamdhNFZtN3pT?=
 =?utf-8?B?WWNZdmFFV1lQZHVKR2tMbm9QT3JkMWhUOUtmOXVXWXBwYXRWNnRLMk53bjRJ?=
 =?utf-8?B?Z0ZjRjNmVjdDZ2JMd2ZCM3dLTHUzTG5kTExWZHBjdURPNTJCc0Q4U2ZQYkVr?=
 =?utf-8?B?Uk5ESHMrbndqUlhoWGxWWnU1dVpOMkVZclBzY3ZKSEQ0cGRWWmdjbXVsYkVR?=
 =?utf-8?B?RGluYXdtOWZTYUI0VkRNWXBxb0dpSTdvQmNhd1l0MDUxZzNzRE9Fdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763c9b3b-f27b-4683-fcd1-08dea5d1b01f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:28:35.6295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCe/FC3e0RrJaIRJysAHBcpSwrexi9TYdQWc8BgW6PZGQDHAV6N08lk+l522H+BhARD4W8igdKbYaKB8TT5NIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7656

On 4/29/26 12:26, Joseph Guo (OSS) wrote:
> On 4/29/2026 5:26 PM, Daniel Baluta wrote:
>> [snip]
>>
>>> +
>>> +&flexcan1 {
>>> +	phys = <&flexcan1_phy>;
>>> +	pinctrl-0 = <&pinctrl_flexcan1>;
>>> +	pinctrl-names = "default";
>>> +	status = "disabled";
>>> +};
>>
>> Why add this if it is disabled?
> 
> Hi Daniel,
> 
> The resource of flexcan1 in System Manager is assign to M7 by default. But it is useful if we assign the resource back to A55.
> The board hardware have the output pin of flexcan1, so I keep the node here but set it disabled by default.

Well then at least add a comment above to explain this. 
