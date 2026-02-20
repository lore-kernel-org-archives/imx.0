Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023103.outbound.protection.outlook.com [52.101.72.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B224E267B89
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771583800; cv=fail; b=g1BGyLNrK1XnC5zktAxUfBRB0NU85nKGhWUB6rDDpqK0NL+UA4geaYiP4ZsBHIAiM6qYkiyRgvZL6ZdUuGNv38qa9sawOdB+NNFjQ1OV81b7VeISL5c2uLMTa3ioYmeBcAXpAKeDcWcdBk967xU48TjYkskW4vth+gICcZpOE34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771583800; c=relaxed/simple;
	bh=NgcoUiW8z5V4IsQDcIWZGrQTH7L6E4sfUdIvEqB3lis=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Iix7KwqhmSt8INn0hPnKxDZGzNd50Itog75zhNNP4YnqoAmfq09d/IgVJCX5WeqA6SVZsk3E0kzL2sRTWbUay9vQgfinJkppRJjcGwqKyebR9H4GjmoNnSA4du77Jnz4V//L7rKnbuf7mmrEYldR2O1MO90MD3fc8HRjr6gahyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=v/RhX4hl; arc=fail smtp.client-ip=52.101.72.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="v/RhX4hl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQyNMc3vAvcR0na2gxFWC8PupONJETLgBmokv2WVLZUhabPBVFUc8oV4KqI/rcz0VnMzmHWnsmV3lR9fUmiwxD9RClPOWqX+vdS0aQQuLk7cCTV/hV4EmwL/zIZppcrasreYIDLAwoPi7ZJ2AYtgwcjeq3++c6BefJtXIbyYjheLfDKNBRDemG0J2ACFBU5L0/SdLQxlqz71tWjizHYrv5Bex1/8OfGuDOPTWDTrujtx4pOhYJspXUMcMTpby1+hzPrCGnEDiYlBorntojiX+UetRWhuhJL1b7u5nZbuqrW10ljorFuYCk4If9BvXIr9SEpaSwbbI7dgSCGaHsAiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBJIPUBL3pI925Fyy7iFD2l6FMWxHq55b4pGUjrBKus=;
 b=Om4Om9WOHVOVr+A0STGmC2hzGyPQG/xyiMJTmCU3diFs5nsyY5/u7zpntcgtCQarFbBjpaGsZo8lYO/eOwy8PJaYlHPFAN5wKtin3Epit5LVceCF+hIP6e74jKMETVXnVEWIlWy+KMMY054twwNK1YE6JSdu2LD9KK27P0QB7pnW63h1ACEcKJ18YlKUEB3gFXJTyDms9EyFt1EpCOetoih6g1VbIHJoW5JovkVgdZDJJnIhWbACcXtj4LOhuoauIUcOof651WiBPkW5lUjwUY4C0J+Uf40fmnsnJIJy1gXQyPaZTleVXuwncR9K7TQzYpWdYAPucfVsoupHeQI6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBJIPUBL3pI925Fyy7iFD2l6FMWxHq55b4pGUjrBKus=;
 b=v/RhX4hlvgIbE2f1Znh5bYZ4RBuxj24+7wafdbNb0QB9BOx80J5qX56nB+1Knc1OGjEpxactIzjF5OYkUtZ5zgTv6dy2O44Oeg4/mWCisLQPZ0anYFqzJQ3n1uhVkamTqTTzdl1198GUjKE63edFzIizPxtX1pJGagKwoW5UjlRxacipKMtAmlGrTwp5AoW5AfaTIaXSli5cbKAwxAOBtMR2suP+VcHDMdV9GhGGqECniYDlSgw7we5iTqfsUibIRy74y8Yg+/9dsPFJ2vV05ZKdOZB85ksUiYKretXj8qa6BUH+ClVhN4N5/MfytKIgQQdpmQxz2kyjqXlsQMst+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by PA4PR10MB5658.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 10:36:33 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 10:36:33 +0000
Message-ID: <45d07a30-66c3-40f9-b347-baa3ad614420@kontron.de>
Date: Fri, 20 Feb 2026 11:35:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: imx8mp-kontron: Fix SD card supply on
 SMARC eval carrier
To: Frank Li <Frank.li@nxp.com>
Cc: Frieder Schrempf <frieder@fris.de>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260218132519.74570-1-frieder@fris.de>
 <20260218132519.74570-3-frieder@fris.de>
 <aZXv6QSq-ydOX5Wt@lizhi-Precision-Tower-5810>
 <1c86a997-4781-4816-9e90-35b15e2b0146@kontron.de>
 <aZdKhAa2u14LD-cW@lizhi-Precision-Tower-5810>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <aZdKhAa2u14LD-cW@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|PA4PR10MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: ae624345-cac2-49b7-f55b-08de706beaa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVFZRThIM2RFZVJlbHcwNzRzMnlaS20xaGN3UEZPOHd5NXEvMWVqbEQ1OG52?=
 =?utf-8?B?MFlldWtkSGt1MmMrTllrNWVzY1V6dkIvYzRtUXpWeDd0RFNIMlVvRjdYNWxv?=
 =?utf-8?B?WTFmZUwraXdsMkhLUGJtanAyWVAvelpZd2RucGo1T2U3TFk2VkJoWGo4ZGsv?=
 =?utf-8?B?VXVXSXJ6MnhMRDZhMmZZV3dnUEt5SldpdFd4Y3VrU2VkNm02VndSMWE2bkpi?=
 =?utf-8?B?Y1I2cllFek1jQytrU1o2OGJlTlhCRmR4S3NYazFjSG45U0VCRnNmdWllUW15?=
 =?utf-8?B?dkF4ZFdJSGFqVkZtbnRlclRZcFd4MUpQMlA2bG11cXRMU2RURjN5QTV3UzVD?=
 =?utf-8?B?VTN5Q2xUaVk3OXU5Yk5YU0NkcElTbnFkTGJ5QzhWQlBYRnBpdnZDUXhEMFdC?=
 =?utf-8?B?cVorVDBROHh1MjJrSW9rSGNMSkFmWGNzL2hEZi9yZThqZXdTVGh5cEg4SHJT?=
 =?utf-8?B?cWpISHBLamNJalFMeVZZZXhIbEtKT1BEZnNWc3BMM0k1UDhWSHlKb2ZBNGJT?=
 =?utf-8?B?Z0N1NWxTUWt1d3l0UTRVVDlCZGFMM0JHUnpvQ2loeFFnNTZiajYzdTNmeTNv?=
 =?utf-8?B?MGxRQmkzTndXc0dOc3E4eGFucncwUkVWeXJqOTFrUXpwcnErSmo3MkRBaVlJ?=
 =?utf-8?B?TURBQWsvamZwODBLVWd3NUp2T2szS2pVUklxMW9LR1piRnR6YzlWNlgxNmVn?=
 =?utf-8?B?enYxaTlQRzVGeUE1emYwSTNVUWtDejQ2OUdveFlEcXphdURVUWM4WWlCVkQw?=
 =?utf-8?B?ekhOaXF2RndTZ0VYVEJoTXhzZWFkK2JOK0hzbFVJOUFiQm9NUVVyUFhncEMz?=
 =?utf-8?B?ZnZsUlQ5K1J2N0pzdlN2TUhISjVxcHFPSXZZdUp0cVA3MnBzY0ZuZjRtWVVr?=
 =?utf-8?B?ZkVYeWNxbkZjUkJIZjdkZEFDVVBCR1B0UmtiejUxaEg4aWhHZE45NVY5aGpw?=
 =?utf-8?B?WWhMaDhwaFBBd095NFRaQzJNaDlGMyszT3FRQzhMOWFVMzRNWFU2R0lNejJl?=
 =?utf-8?B?bDZ4bVQxRGZqYzlldDRLbndQSm5xUmEyNllvb1RCNnJ2MlpPZG5OVzJsOTVI?=
 =?utf-8?B?bFVFbjVwbWVIa1A3Nm9IY1BnK2hiOE16RktSU0lTMnhwQnFqMmJJOXFhKzRl?=
 =?utf-8?B?bUIvcUMzNU56OGZYY1E5MG44eW5XelFzbkhGMUFsa2lYOWJBOGFIQXJMdSto?=
 =?utf-8?B?cFlwdThwaFh0T1BLUFFRTXdxd2k0dG1RZnlBK0dCaDN2VDUvclY1Lyt5ZVF1?=
 =?utf-8?B?dTBjYWlNeXdZVitOZUZlOEJIVlpzT3VNckFGWjJPWTZ5dElEb1doUlJhUEtS?=
 =?utf-8?B?NCt3N2tvTXFhMmVnWlFTeVlhcGU3NTJaVDY4aEtEMi9CMWdxM0dnb09pYzAw?=
 =?utf-8?B?UTZpRFlQYkpyaWFjOXBiNFhESTNteE1BdG04VForamh6a01lektoampmNUV1?=
 =?utf-8?B?UUdnWHdUK3N4UXRRQWFDdVhqemdSclYra3U1cHZ0bHcxQ0ZSRlNVUk9iTEZa?=
 =?utf-8?B?QjEvZUFsdUxkWUdzS3podzQ5aEJqZzJlL0FjdCsvYU1xdEZQYnJuUWQxckYr?=
 =?utf-8?B?dEdScWE4R0xhTFhXSHdnWDhadXBoVWxpdjNjTitlSXptQzZsMFNOVExZQm9C?=
 =?utf-8?B?Z3lzMVNyQTI5Ti9zYVZTV05uK1dqZytZSDdzem9yOW5sMFRaajJJclpWNTJW?=
 =?utf-8?B?OG0yY0s5aEVzQkRCSmRvTkNDUCtLa0dWNTA1WnM4NUxrc216eGU2UkRJcWNH?=
 =?utf-8?B?NTc1RHYxTzI2bUdkL21STDQvRWFZaGV0aEFUS2M0VzJiSGVuaUNWTXliK3JJ?=
 =?utf-8?B?UzhRVnNCa3pZYlZZMFpYWm5nclI3dVBwYWdhVVZ5c0ZuUUdlZHZpVmEva3pa?=
 =?utf-8?B?aUU5dzlFUUNCdHV0N3ozMHoxLytycHdIOFNmT2oyeGlDTUZtdWJrdDMwUGdX?=
 =?utf-8?B?VjdEYWVPdldYaUpvSER3NzhUd2RiM0w5WldKemJoYmdnWXJZMmgzUG00dWdY?=
 =?utf-8?B?TEx5SkNXRFd5Mm1UekoxaktPdnFsVHh6MnEzcWlTS1E2ZzE2NjUxeXVkcFhu?=
 =?utf-8?B?bUloS2ZBWU1ScnFSNktqbGpYQmsrOS80Z3VNT3REdmEwazZhTUhDS2VBUk9u?=
 =?utf-8?Q?fI3c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFR4WVY3cEVKemRGbUZDNXBldFVlM1h0cllvNTlnNVVDWmJWeHUxUjlCOVhp?=
 =?utf-8?B?MlhqZFZQNmtsUzdWUFgyR0lEcHgrU3dWdjZyNkszdC9QRDdSWWhWVk4wY0wx?=
 =?utf-8?B?MU5XMzd6MStmZGJGQThHVHM5RjZsRUpmeFVyNUllMU5KQWY1aDhXd2JMd1o3?=
 =?utf-8?B?QlVkbFlJbTByeDUrSUJxZlVDaXAzdENWTVYxTW0yZ0pwWk9jRHBXY1MwZjJG?=
 =?utf-8?B?Wk51dzFzZW81NW51bWE0QTJuZTFvTkYrcnc5N0llM29rbFBBakRlKzdVK3Yv?=
 =?utf-8?B?YXlEWW9SWXNJYmd3bFRaWnMyOWJJcm1pclZvbGhrbnJVTkdyZnYvQ0ZuWU9M?=
 =?utf-8?B?cGJ4enlFL0t2L2NyMUlVcDJzR2hVVmRKQUpRSXd5ZythZ1ZhTW1MZGEyVlFs?=
 =?utf-8?B?ckthS3Z4bllpTVV4OVQ5RUd0YTlkaGxxeWRBWHFWVzBIbVduZVlrcmdkYXMv?=
 =?utf-8?B?N1dzbTZFdlEzelhTTTZ1TGJTYkgxaTJUMmZzY2Vpci8rTHhyajBpd1BNTjI0?=
 =?utf-8?B?U3NVU3pOY25rZlFRcCtxVzhuZ0Q1Z09JS04yQUxNMHZ3RFo5cjNlOVZzS2Zw?=
 =?utf-8?B?UCtQTFJidnRzMHkweTBrNk1keC9VeTIyQ202VUd2UVdLa1BBbW9WMjZFaW1H?=
 =?utf-8?B?UlY4L3VXMmFXVEg2R1hJc0dkMWJubnpHY2pyQkN0cGtLMzJNc3FtajdhbWdN?=
 =?utf-8?B?K1ZYODFUeG02VWZ1Nld2azZLZDFMR0NZdnZXZkRoZmZ5S3JTdVBSeHhOTG44?=
 =?utf-8?B?MWhxZG1LMXhvSUxKaWhPVXJDTE43c2JpWm50M0JxUGtqVzUzSGVRcFM0UGd1?=
 =?utf-8?B?UmxlRm10TWdRY3UzT01uSnppVDdyZ2JKWWhoNCs4WnJQdGl1QStSdGJBVUxM?=
 =?utf-8?B?L1Q2ZU9qVjZZSW1wbFhIczI0UkM1ZFFDTXVHamRreEdUYnVGd0x1c2VsU0JO?=
 =?utf-8?B?aWJJR01ETVNZRXk0UmpZOUpqc0lEb0I5YmRUcjNRUVZuM2dua29OQjhDSitE?=
 =?utf-8?B?anhGbURwOEVoRUhMQzAyMU90M2g5VG52WHpSRlY3VjZmOWs2dTlnMTA4N3Mz?=
 =?utf-8?B?YWtteXNLVWFQYS9jMGY0aGRoOEFlZmZKcjAzMkNSd3N4K1RSaXJZN2MvYitH?=
 =?utf-8?B?MGdCSGt2UDllTmFuZFQwMkpMS0ZzTThMSGRDblZWYTJjeVkzM2xjUldTVGVR?=
 =?utf-8?B?dldNazNwS1RaRGNDWUVqSUloZTBuWWNuZldUSkJPdnN4VGRKZGswVkFiZnFw?=
 =?utf-8?B?ZWdmbDZqVk9hNVJIZlhDcFJ0c1lQSStLam9iWXZaalNOc2xaQmpPYm9lOXl3?=
 =?utf-8?B?Y2NjMnp4WjJVaUlUN1ZBZm1WRzNwcEZuL083bXFadDRhMWMyOEFWV2xXUUhj?=
 =?utf-8?B?eWlJVyt2UkZvL2hrNFE4enh1S1hLQkdsNlJVRkpQNVRvNGxQSFhYbE9vck11?=
 =?utf-8?B?WWN4T0VVUVpnMmdvODFqei82a0lGWW5XeUdpRFdGem1peUpobFF4dmFvc2hJ?=
 =?utf-8?B?OW9ncklSNU95Snl0aGJOL3doVy93cDU1YnRLa0x3cXdweGd4NFZKZC8rZFZp?=
 =?utf-8?B?YlBIZ1dMN2xwS2tyZ01Wb0IxSm5Ra0ZTVVBGQ28xUHV3YVEzVGN3Sm12SFNS?=
 =?utf-8?B?RGplbmNpcmpkbWNxWG9tVjZvaDZGMit1N0IyNW5QZTdJdTU1K1NSUlVSakpx?=
 =?utf-8?B?dDBNQ1p0d0hFeElzaGdQb0JyZ1VYM0pwZ0p4YU8vZjNCR1g5MzhDSWxXYXJs?=
 =?utf-8?B?T3Bsc3Y0cTVLUVd0MmhvQTRVSEFiOVgyb0ZoTnBDTkxNcE0rQVJFUk9ydXhF?=
 =?utf-8?B?eFNlbjMvMGVFVWhpVk94Mk1ESEdySHJ6bzlmZkJvVmtRMEl3aFNxTjdWL1BE?=
 =?utf-8?B?RmVtSFhWb3QyV3J3bXVMSW52MDZLZnRTS2hHK1BhdG1kRUdFUVlySnMxeDNv?=
 =?utf-8?B?RGh1RlpCTkl4Y0poUHNEQkZkbFNvcm1LZlVNOThYd2lzMEJhTVdGY3VHNXQy?=
 =?utf-8?B?Ym5tNkY3SjljR25FcGUyM0VQeG1xdWUwZllPcFdNSUJyM3hUUVFjZmVXWnE3?=
 =?utf-8?B?UmpieUF4RFlMOHBnTDVHQTRjTlo5TWtOK0toLyt6eWVrN3BTd0swbW4xRFB1?=
 =?utf-8?B?ZmxsNDZNUVlkRVhUcnk5WStFUzdiVElNME92dzgwZTUraVp4dW1qTEdQMVhK?=
 =?utf-8?B?WStva3N0NmFxM3AzTEs0TllqY0VIZ2dCYjY5TUNFRnVpK3RLVnlpOEVUemtF?=
 =?utf-8?B?amhNaEpwbWlheXl6Z21MUnoxNnVIZU1CK25sTDIrSzhmSHRvR3YraitRbUlG?=
 =?utf-8?B?T3VXclpoc1cyTXU1ZWxUMUlMWVM2N2I5RUhCTjVPRENlaWJpOVRubFdpL2JU?=
 =?utf-8?Q?EFXfhKi8k9cFiERU=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ae624345-cac2-49b7-f55b-08de706beaa4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 10:36:33.5262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fRBTLDT7t8M38XqQqFy38o8UeJDjJ+Zab7QvykurEbsopLmghcokX8ASl3Zy1qfFNvr7J7icc/CSFvCHCOulhWp+YpsJEiLJW6k4GnuUWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5658

On 19.02.26 18:38, Frank Li wrote:
> On Thu, Feb 19, 2026 at 08:51:32AM +0100, Frieder Schrempf wrote:
>> Hi Frank,
>>
>> On 18.02.26 17:59, Frank Li wrote:
>>> On Wed, Feb 18, 2026 at 02:25:06PM +0100, Frieder Schrempf wrote:
>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>
>>>> The SMARC eval carrier has a power switch for the SD card compliant
>>>> to the OSM standard definition. To use this as already specified in
>>>> the OSM base devicetree, stop overriding it in the board tree.
>>>>
>>>> This fixes the power-supply for the SC card.
>>>
>>> Is below commit better?
>>
>> Do you mean "commit message"?
>>
>> Did you run my message through a LLM to enhance it and now feed it back
>> to me?
>>
>> If yes, it is a very strange way to waste GPU cycles and developer time.
> 
> I used LLM for some unsatisfied commit message with LLM. I need make sure
> other reviewers can understand the commit message easily and commit message
> align submit-patch requirement before I can pick up it.
> 
> It is not waste GPU, which already found many problem although there are
> some false alarm.

So I don't follow you on calling my original commit message
"unsatisfying", not understandable and not compliant with patch
submission requirements. On the contrary, I think it's fine, maybe not
perfect, but it should be sufficient.

> 
>>
>>>
>>> ARM: dts: imx8mp-sm2s-imx8mp: Drop SD power-supply override

If you still think you need to enhance the commit message and use a LLM
for that, I won't stop you. But please, for the sake of an efficient
patch review process, check the output before you post the feedback.

Did you realize that the subject line you proposed above is using the
wrong prefix? And that the LLM hallucinated a non-existing board name
"imx8mp-sm2s-imx8mp"?

These things were correct in my original submission. So your proposal
makes things worse and not better because you run an LLM over the commit
message and then just post the output unverified back to me.

Two things to always do when using LLMs:

1. Verify the output before you do anything with it
2. If you share the output, make it clear that it comes from a LLM

It's so annoying to expect qualified human feedback and then find
unqualified and unverified LLM feedback. If I wanted the LLM to write my
commit message, I could let it do it myself.

>>
>> The subject line is completely wrong.
> 
> sorry for typo 'power-supply', it should be 'mmc-supply'
> 
> subject should be "do (what) to"
> 
> drop vmmc-supply to fix ... or
> drop vmmc-supply because it is already in base devicetree

Ok, got it, thanks. You're still missing the point here.

> 
>>
>>>
>>> The SMARC evaluation carrier provides an SD card power switch that complies
>>> with the OSM standard definition. The OSM base device tree already
>>> describes this correctly.
>>>
>>> Stop overriding the SD power-supply in the board device tree and rely on
>>> the definition from the OSM base DTS instead to fix the power-supply
>>> configuration for the SD card.
>>
>> Ok, maybe this rephrasing is slightly better to read, but again: is this
>> really worth the efforts? And it doesn't even correct my mistake of
>> using either 'vmmc-supply' to refer to the property or "power supply"
>> without a dash.
> 
> Sorry for typo,

Again, that's not the main point. It's the whole process that annoys me
as I explained above.

Anyway, let's stop arguing here. I will send out a v2 with an improved
subject and commit message.
