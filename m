Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E3833B6E9
	for <imx@lists.linux.dev>; Sun, 11 Jan 2026 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135254; cv=fail; b=hyyA5SZGjiAOAz3tpFoO6PS1cVfGf8hU/MCTDEL2m5PsIjdcor9buUR/RElLoqTCAYZfE/n77u/VQkuu5cIjD5SkkDUZGXkZD8lWrt9mZ0Lj1T/EvFC0b1awrIu1AjaJkwedM6FUSW2shB4tKfjQU9hm/LrkVJWEGQ1TO7DCh2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135254; c=relaxed/simple;
	bh=ovWEQATY9Bas+9Q67KfZ0NmjJaS8d+C2O3SM7Ee/kZM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UbRDUZm5MjUIhFYwxB8ATdvG/qETOcwPwLZ2dOx8xSJlZXBXINRMh++69QUTUrpnNwRalowhj11J+0ak2H9waP682lyLrF9+0tu7427YsW3KN0O7GzfiA6OihkMCONjN0NqylRHi6EJh8nZShqF+NL3Nx79HYOaNATQvdJcEU5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tbBDax4W; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tbBDax4W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4CfeAmkM6dddho0ajUK4AHJwSYRYEAuT8eDYFTHtZjXT2vRNZYbJMK7JQKRfvsmH9n/i7baqbKe60CCFssaKoU6+QOadQO6nBtsxc0EhldUAc+GR2WPX1gdO4Mpw9h5h2s4BjlvjFR9t6ABE2dprHW4wIcG04SZrIliCClDs3dR1/vHlDp1Mquks+MIA0H+Kna8QmPM5m/UAhe+y59Og+5FIn1y5X5G24vNqWY79N86CkEUt+FY63Am1mKKHYjhRswAfrdObJ12DMpzrXHOU6ed5LW6Tp/ns9ju6kgl4/jUbugxX7JKNZyaEESr3V1wqNK0r3ozDH88sdMKYYEvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Emc+EZEx+TUlDQI5CKvwWm/9rKPIAV4QhNftap+3Y+0=;
 b=rHR3qoYhML4slEn8sraFi5kPPj05crF4xWSLXqShYiY85WSvveiFsA4me4/rIbE4/v80FfCRkoBEcZaSry0C/WQiU67FTH+3W/+SU53t7SBn+USmQBeYtyfx4rqumBmXE+Yu9wsQ9gRdY4xSRL2dHrfQnhVoYLyROegCLPSHuh23c6oug8ePRMPP4a++SFWKV1LJvq281OqOwZeBuT8OTk++vqH0zS59n9Mo8ZLboBuqkydAxNi9ZnFWA5RlJvXNrU04wlaC1kVdDcS17KmGxibDw2d4FYzj3MYs2pnDg/9N0Zv0hkxQ2A1EsB2mKxm9LOiXYy3tOwJH7LtO3QovwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Emc+EZEx+TUlDQI5CKvwWm/9rKPIAV4QhNftap+3Y+0=;
 b=tbBDax4WGa+Dd05//pbgYKg3vBWkWEHeZciXPiTqs1Z+ilhEWYg3fQjUgIVDBJZ8XzuY2qSh2x7tFCv7OmrIzFTVOgCFCHx3uenV06Mtc2FanWymvWt+SmytoGrLsFgixz8B0AB09wh4yzq3pgPiWWKPn8qE5Lwr8rhcvdBvm21eYC00uEiRAcBfSi2HhYqMXDuOXv7jOGsAX7V8Gqq/hFA1XFwrfz57HTQKCndWyz5vHBrv7YyrDIDbKqq9WS/xYIwQh4z9BGrTJqvITDJMwbZd/13HHXbQsLwA0jCF8hDDFo5wp+qLZecdoOxS8UnQsGIl2q0BfBzPv1Qbdxzb6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 12:40:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 12:40:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Jan 2026 20:40:07 +0800
Subject: [PATCH v2 01/10] arm64: dts: imx952: Add idle-states node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-imx952-dts-v2-v2-1-5773fa57e89e@nxp.com>
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eaf2da8-6abe-4a41-5a71-08de510ea3be
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3ZYOHV2cHlHODg0RmNYbml5YnNzUk03Qm9RVHh2SlNvMkVnMEhOUFhCOU43?=
 =?utf-8?B?Q0lFWmNrN1NtbXVUM2dMeUZvMzdQWUhvMWNYTmlOck1abU8wQ2pFWnJPcENn?=
 =?utf-8?B?VmRPSnZpREhoaGwzTjVzSEVESTgrb1pHd0F6MGlZdW82RFcxOXIxRm8zSW1U?=
 =?utf-8?B?YlluSkxBRDZFZGcxUUJ2SmZjMFY0MXM5Wk5odmdRQXE2T0wwWGtEY3VzS0ln?=
 =?utf-8?B?QWhOSmtsSUtuTFNRclJwTHJYY1kzZmJGQ3k2REdGd2prRUNjRVJTeUpkYzVQ?=
 =?utf-8?B?ejFNdHBYalAxc29EQitOd2cyWlo5VzUwWkRvaytLTm5LMWo0cEYwaVFLY2N0?=
 =?utf-8?B?bDBKUU9tZG9NU01SNnlKU0dKVlpUZGhXSmJsQk5FcWRSSlFqU0RJQjMrcXJs?=
 =?utf-8?B?Vm1WNlgzUElSMmJJQ1pVdDluYnBsOUhIaVRvNGNTZ1dPa1Y4QTR3OTVpNk1M?=
 =?utf-8?B?QWthbTBRL29ldndad0h1eWZkbGIzb1ZzSWlTVTFWU2dTL2tsaW9lR2E0cnVN?=
 =?utf-8?B?dXdFZjhNOFllQVlPY1VYeko1M3BOSHBzNVIrdnByR0FLTjgwMWJ2a1RsMWZX?=
 =?utf-8?B?SFE0cXlkK2M3dGdDd1VWUmRLUFZJSWw1UFJ6TzZFTXUvYlhlNXBzKzBaRlFX?=
 =?utf-8?B?RkZ1Wkl3WW0waW84M29aNjZhRGphTzNXbTBZQnZsZHhvOEdXVzJCbHBFQ1JM?=
 =?utf-8?B?eHBhWlVVNkRvaGhsQlZFZ2Z3ZkR1aU9yamJrdHpGVitBTXVxT212WjBsZnNa?=
 =?utf-8?B?QVg2a0MrcEtBUzNEZzV5OVZUUGk3QzVCb1IxS1pKK1FUaDlrOEtoNjg3U0Jn?=
 =?utf-8?B?akxPUWVKWS9PeVRhTVl2ZkFCenNIT0ZCQW9ZazMvQ0hXZTNVYkdvZlg1eCti?=
 =?utf-8?B?alJhWHhYNVFBYnRhYVNPVEdnSFhGMUVHc3FmUzlUVFVvNGlZTWNTVGF4eTN6?=
 =?utf-8?B?YXdKMlNmeWh4em5oaTI4YjVBY2ZROE9xeFZ6cThNbEJXb2J2YWZtdmRuUUkv?=
 =?utf-8?B?QnRLSDFXazNVUnZqQm1vQUNiSUZ2alNSYXhySlNwdWZldWhYUzZoRVRiRExz?=
 =?utf-8?B?Z25VbS9WaFBTbHJVcXdWbVhLMDlwS01JaG90Tno0V01vUm50WUxuZ2FPc1h5?=
 =?utf-8?B?M3dGTXV0Q094ckVHL3lpTm1naWlFam10YktucVkxUWpqenp6V0RwR3RXTG9Q?=
 =?utf-8?B?b1NQQjFWTVJVQk1PZlBlaHF1N2t4WkNQWko3UVZFTXJLcE9nQVlvQytXZGZR?=
 =?utf-8?B?R1lTaFFPeUwzQWtZT1ltM3dZdWhvQ3BXUXZFdzRyOStjYURxeDlLVmFYK3kz?=
 =?utf-8?B?Vmt5dFNmTzVxcU5pQlc5K3lNOWR1RHk3OXRIUUllSFo5SHNmaFZNOTRaNk8w?=
 =?utf-8?B?clZVVWsyT0xCcXJjek1IR0tseDdBYnpBeHpZd1l3NkdBcENEdnVRNVkxa3JN?=
 =?utf-8?B?alg2VkxjYWM1TjdkVkhWYmovbXZQM0RTZ1RWUXpCRm14VkVmOU9KVW4wRTFS?=
 =?utf-8?B?elJDMXdRNVgrUWhtenlQOEJsZVB6SGcweitCWWJwWnlVeHJucHRoYldrTWNU?=
 =?utf-8?B?dmRhWkgvcnJnVm9BaW1NTXRZRFZkVm9OWks0UUx6RDF5SFVFMXlNbHVJR1Zw?=
 =?utf-8?B?YmlXb1VWbis5eW5kaE5NRGRIUUF2b3IzWEZkT2RJTUNxVTJuWGFDMEozNjBT?=
 =?utf-8?B?QXlGN0I2TXZzRE5aVlM1QXJXVWlGc09iYzVuaUF2ejFUSkpITHhxQmptOVlz?=
 =?utf-8?B?Znc4S2F6S2pRQ0NaSSt2NFB3Y04rQmM2VmZoWlFoayt6N21NaTFoSzhkbTNY?=
 =?utf-8?B?MW1KK0Iwc3Fjd1BMaGdlaXVNU0tHcEgvSFZmMit2TGZ4c2toTnd4bmJ3Q2tU?=
 =?utf-8?B?dXdQaHJkVm1LSzBhWDJ5TWRsQXYrdnRXZmhQdjdwOGJxNitCTVFaSVNpb2lI?=
 =?utf-8?B?RkgxSzdJZXVldjhJTHRsUGVoc2hvQTA2eG5VQ0VhOC9UWnUyTzczUWwvb0hZ?=
 =?utf-8?B?OVpjRVRzZG15cmlXZ3k2RUFEUkZJTE9kOGFOUG1qd2hNU2Q4T3RTb3FZWVo1?=
 =?utf-8?Q?mkup7m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wmo5ZVJiVXNGQlFPU1N6YkVnTjhGRzBXY2w5dEdJUU1yZC9JcDlyM2tzUmpW?=
 =?utf-8?B?Q2FaSzg0WHA1VU9WZjZqa2JWTjY1YVVkaWVpSVJwOWFTdm0yTGJUY2FIeGRz?=
 =?utf-8?B?VFFQRXhJUnphMmRLOUx3bUhWaExBQ1I5OWZqMXQ3dnlKcnJSaFVJVHUvL3dK?=
 =?utf-8?B?VzNWWGxSNFJsT2FuRkFYcTQ0WFRMYVp5TGNzYmthUEpzWHU0OHR5c1FDcFNj?=
 =?utf-8?B?VGhFbldiQm1UYXM3d1ljcXdvQm1LMk5hSncwcDQ4bnhCQzJ0eXh3WnBtR2ps?=
 =?utf-8?B?bWdUUmhJQ0ZFWFpibWw1Q3UxR3pOM29PcjJYd1B4UmpvTkF5bzd6ejRodkJU?=
 =?utf-8?B?NVV6QXNyTkRPTjZXSUF6OVRGcmMxTWxZYnEzN3V1bWlDTDVOVm0xRlFCbGlt?=
 =?utf-8?B?ZXJSSWFhOEhKUDFVN3l2MkFHdjNhSlp4b1VTK3BvTjZWaHRndW8wWU50WjVM?=
 =?utf-8?B?dmwxZmgvM0hDSTVEYmNRQUY2OG9YbldtaHJOUURnenVQd2ZHQXBqaHVYRWxH?=
 =?utf-8?B?SGJBcVdJS0JsVFNCMGErelBrVU14dFlnQXo1VktVZzkzNmtpdVdVWFNxUDlX?=
 =?utf-8?B?WkN0cHB5UGU3WDNuNm1XSWNNY1V5MXMzYTBJalc4WlpWNEhwN2svNlRQdVVS?=
 =?utf-8?B?THQvZENDQVNkeU5WQWE0ZkU5WUZMR2lUV202b3hwTld6TGV2MmlLWHZZN2ts?=
 =?utf-8?B?UEEyTFdxanE0NG9HYTlGUjRuajBLaDM4a3hxU3ovZ2lVVm9rbkdOeUdzTUV2?=
 =?utf-8?B?dWxiRDM4UUdOV0ZZYmJoczdWN2RHVFpyTHVMVjEvbE5SV0dNMU5YU1pZc1gr?=
 =?utf-8?B?RWowYi9QZDlDSHZWMXA4S3dQNlRJZHJaUW0vQktNendEenNyZXQxOUxHdytG?=
 =?utf-8?B?a0c3K1U2dTNZTld6anV2MkFrYmhCNEhtVlc2eVk1T3JmUkdsQkdlYUNhYjVB?=
 =?utf-8?B?QVQwaWplSFpWT3VVMWsxWVh5Z2dmUXZXOEtmdWlDSmM5c2ZJRGVzL3o5Znpk?=
 =?utf-8?B?TnFTVHNTdUFZb3l2Qm10OXdwRkhQY1VaVDZpY21TVURtRG1CV0VtTFd5Mkxj?=
 =?utf-8?B?QTZ1REw5Q2s1Uzlkb3RiZE1oRjlvTGhEUGpDNlRsbS9KdmNwZ09YcjUxUDNh?=
 =?utf-8?B?T1BYVHorUlNUelNvNVVqRDc1aWVYU0EyVk1UMCtDUDd6N0I0SGpQRXQ5Qm9r?=
 =?utf-8?B?UkN6QlgyMVUrcVVTbkhLNU9UVzVOYUJSTTlENnhoK2kyekJUelk3S3RZOEFa?=
 =?utf-8?B?R1BreDcxSE1sSmpRU2JXSHNKVDhieHBHcUNqajA5WDNpeldVazRYVjFqK1ln?=
 =?utf-8?B?d1ZIWGJIYW9sL2lYTVk0OXhRRE8wMXFDZzRIZ3VmNlR4TkdZYXRLMXhFYkhC?=
 =?utf-8?B?TmxPOWU1QklzMXJwaXo1eGdPZmhXei95V0pydHRNclBNTjVrVmFiQ1h3NjRE?=
 =?utf-8?B?clFmOVRTRjd1bDlSVE5lOWpra281RjBEWGRQMDlJbDRNVkRsbkJSSk9yd3BE?=
 =?utf-8?B?b2RORE16TURSSjc3b2s5cllYK1k0TnE5SVJHMXEwc2hzcVEybUxJSnNQbHA2?=
 =?utf-8?B?WENLcGZVdEJTK01RaVVPNEd2S2dGVmkzc3hwOE9iUjNJWjVqaTl0OTA1RVlM?=
 =?utf-8?B?RElkSjdubWhsQW56cXNldE1GaGFKMzVxZUlkWFBGbmsyVU9BeXdoZ0lrVTBl?=
 =?utf-8?B?SnJ0NE0welRqTDk4VmVMR3EwM01jRmtWUUcxZkdjLzNaNElBc1JrV1FHVHhN?=
 =?utf-8?B?ZFFLeHY5ckVGVlk5UFhES1h6MnFUbExrR0Iwa1RrVUdaT3N1RlpHekg1YndE?=
 =?utf-8?B?NnpJUmlVcnJrbit5V2lIdkFBeTJrU29sTWF1b3BwSU5XVkN3RVFlRkVHcFBU?=
 =?utf-8?B?ZlhLcTR2RjVHTnV6TEMvU3BsaGdNK1crN1BITWJ0TUg3WTRGblBwRXJnUUVl?=
 =?utf-8?B?d21QMThuMGJlYUJlbzFLMTV4WVFrV0JGZ2p4T0dSOWpSTkNFSVpQWkR2SDc4?=
 =?utf-8?B?UUFSV1hoQ0NVT0xEOUtUOW9TOXZmWE45ZXpzOVFJWllEaVlubllab1JYcFBW?=
 =?utf-8?B?Rk9vUmxMblZjY0xIRTR1cGdmM0JQMjNhUkxuZnNWdytFNkdzZVhQODB2aE9I?=
 =?utf-8?B?a2VaQjRRSEZ6NEZQR0JuQnkzMU5jNDB6S1g4SkFQTEZYeFBsdDdXVWhobnEv?=
 =?utf-8?B?KzEvR3Qyck56WUhjcjZpMERLeTRHUVRyTGFJN2hCQzNBY0tjLzRRaHRHR01n?=
 =?utf-8?B?RVZmdFljTlk4ZlNCWnFvOVdRdU1haTF5Y1IrRUcyWHBuRUJ1OVk5NDBVOWRv?=
 =?utf-8?B?UGcyZS9La0xYQmk0MkxVMDg3eVYwWjNmU1FIdUlHbUVPeGhjNG5Mdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eaf2da8-6abe-4a41-5a71-08de510ea3be
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 12:40:45.3585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gV9wo9VzrftyzNR08IqUt5r5AfQMcejWtpXAQvI0CeW2chH8uUm+aLxLsKoYxoYaN+BHY2Gl4K63sJiifeKKdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041

From: Peng Fan <peng.fan@nxp.com>

Add idle-states node and refer it in A55 nodes to enable cpuidle.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 33bde271d394d19407562f2a427a8a84b85bd679..91fe4916ac04d1d6337c2670374865c6f73163ba 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
- * Copyright 2025 NXP
+ * Copyright 2025-2026 NXP
  */
 
 #include <dt-bindings/dma/fsl-edma.h>
@@ -50,12 +50,27 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		idle-states {
+			entry-method = "psci";
+
+			cpu_pd_wait: cpu-pd-wait {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010033>;
+				local-timer-stop;
+				entry-latency-us = <1000>;
+				exit-latency-us = <700>;
+				min-residency-us = <2700>;
+				wakeup-latency-us = <1500>;
+			};
+		};
+
 		A55_0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 			power-domains = <&scmi_perf IMX952_PERF_A55>;
 			power-domain-names = "perf";
 			i-cache-size = <32768>;
@@ -73,6 +88,7 @@ A55_1: cpu@100 {
 			reg = <0x100>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 			power-domains = <&scmi_perf IMX952_PERF_A55>;
 			power-domain-names = "perf";
 			i-cache-size = <32768>;
@@ -90,6 +106,7 @@ A55_2: cpu@200 {
 			reg = <0x200>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 			power-domains = <&scmi_perf IMX952_PERF_A55>;
 			power-domain-names = "perf";
 			i-cache-size = <32768>;
@@ -107,6 +124,7 @@ A55_3: cpu@300 {
 			reg = <0x300>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 			power-domains = <&scmi_perf IMX952_PERF_A55>;
 			power-domain-names = "perf";
 			i-cache-size = <32768>;

-- 
2.37.1

