Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15C530C62E
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333528; cv=fail; b=n79eCr+p9DDE0VVmdrr0Ybd9bodWO2jQyXk2PQeT9q7pYB5gr/l7uqaFwgYj3keTCPzf6MwXn5+dW3PNVDa4RoPcrtA3b0cK81qBp8lxqPkoyW1iDqp3BXNJyP6c0hBbdJaQNT0TWZ5pSxXzC80MzYSRCSlfEOGTsovwEafMMBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333528; c=relaxed/simple;
	bh=OtqoK0Oh7x5p3vPnU3HqkcUJWoNy1wkKAqqzk1M9jcE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NVkmn+WZLLDmPC29XrEPVgBM9hteRmAYFpzaE6TQQfup15J4lZDzr3yeIAXivqUN9MRI+S9n3kAn94o/DK83ZOFPWEL5GVszO3TRgu75bKTAbe0fT9PkhTTDMjTMVXzg88AZjvd921UBr1ibYK5MB0GqoPhRHuff/9mZf7v837I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TFn73f2D; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TFn73f2D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6dp0T5qqBl216QosOtAuDPJs2yWQyd1FROCw/HVisRlCFsotbrR3GmSxeJehqs4fQxQij3hT5h3vXSnrb2QySd6JUv/AnkZIt8xIXm/Kc/dXQ15TAsvBhwGrFmREEfSockmutwGnyiC9iAX8Qf3N2iKBUaynwlWw4gk1qIBjAIaxiCulEEG9bwWeWuFjnFeEKQ44/rSBafN+T+2MW4bhSlUvcsm7ukGR3mAw2gh0aXaK3NICpORJo3s6NZ+ECO485rEFfeZ3NZtpRvmUTGDx/OSxcdA7dDoGiCkxqJbD3J2IeXBiQJNdEtP8+CO8bRjJa/mLwipNY9mqB2JyenT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtqoK0Oh7x5p3vPnU3HqkcUJWoNy1wkKAqqzk1M9jcE=;
 b=vAf6MKTkd18IoBZ7AMue6vxREewa+Gj5H+CA6EY8nplgHVIpVyUrRbEtSWzkkC6DiM9Su3v1GQAkDFqfl/je6X27UXFeCcH4vkJyxTGZmJckpzkVb/23Y9nWEVBGDfJK2gl4EUL0uCluO7gtuTHeMXEmnG0B3L7RvqO64aYbybU2KnUE+QkNy3LCLNYjltLIT6jmLnY6Q2gwX5nLG6LrWK9/BMFqD4Udrm3HClpyUPq1OZzToQ1osn0KXEMOt8CxpzWEKtFoYDEVPWGVdF4kfYnz7DCkDI6Wp1rjL2c55exHDP4PA7tOEqU2X10RHWGUJC1QvT2UBazbkPOgrzpZcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtqoK0Oh7x5p3vPnU3HqkcUJWoNy1wkKAqqzk1M9jcE=;
 b=TFn73f2DbaNommZvDMncjCL8Nc0i3dYCmOPc2du7FFJaa1KzLG8H8o7yGuFcbYcsIxCqE81sAwxsip9CBlhFV9OzexpMoB2FjITSAasfcNzNF7E7JDtGkamloOyWossJBXfhYFumQ62W+m9ZikYu6HfKFzYQqvntbvwzKCHdIERPLoN99whpnO3PRwE/0r9+PEc93/0XKAuysFWb/s0Iv6uoQuuwqjojzw9sNoepo1cAZx2iNYCTmVzQ63++YKZxOkgKZfCGjeMeqPj4r0VRzEsKrkmGycsGNbNvjLTnjRtVXCLclBz/uiWfv8a9q75lcH4gegzsIioWlV+M3bkiWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS8PR04MB8577.eurprd04.prod.outlook.com (2603:10a6:20b:424::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 13:05:19 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 13:05:18 +0000
Message-ID: <1fe4e13d-cc0f-4168-9c5d-db372433c384@oss.nxp.com>
Date: Tue, 17 Feb 2026 15:08:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: dts: imx: bx50v3: Configure phy-mode
To: Ian Ray <ian.ray@gehealthcare.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-3-ian.ray@gehealthcare.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260217125952.53997-3-ian.ray@gehealthcare.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0038.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::7) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS8PR04MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 43fe9b37-a9ad-4fc5-d835-08de6e253351
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2tmMEdUQWpJTSt0Y3NqeS9tejBWdDl3cFErSFYvQ2h6Tkh5MFIzc3U2TXdz?=
 =?utf-8?B?a3dDU05Za3lrUXFodlM1anhDNzlENXE0MEZEMzMzV1NzMjNFUy9EV3Y3V3Jt?=
 =?utf-8?B?V3pxdHIzMmZEM24zZkowMHpqbjhEOXF5RFpTOW1QR2xodUtEbzhYSG9tNG1P?=
 =?utf-8?B?ODNSM1BiTnorUG5CZUhuYmtBcTEvZmxzd3ppSGgxaFhVc0NybWE5azJSNm9J?=
 =?utf-8?B?RVJsSVd3TUVSYU5xNE16WTIyZHFrc3RtTWF2U0lhaFhSVHgvaFZwTWJDempY?=
 =?utf-8?B?NXRkZ2JyRUtJUkV1cmw2NW9GcDVXblV4dHNBei9FMjlYRUxkRzZuaUhQUXYx?=
 =?utf-8?B?VThNUm9tMC9OT0hpU3g5WlVuTzg2VjJIY3J4SE9uVzJsejlrZSt1b3VRdndy?=
 =?utf-8?B?SHRkenpLaFVlTmYwakcyS2prVDRrVjZDSlJmRHBUSnJLYnVvQkVrMXc2cDRk?=
 =?utf-8?B?TXFNZzlOQXVxbEZHdkxFVVQ0M0JTa3p4SXdvZi80TVhxV0d2K2lUcjMyTWYx?=
 =?utf-8?B?aHI2dXVZVGpkVGNra1ZjOURrSjJ1VDBHVTVGS3NOdkZVS25mNG9OYTh5QW0r?=
 =?utf-8?B?MDZDK2hia1NZNytFWk81RkRRdS9ZYkhUcVpwTkJhSmJ5NXhtR1FvZHYvMElt?=
 =?utf-8?B?TjUyZklDMm5zQWk1TWJZVXY2TWdLVDFMWmtnOXdNbDNyYlp3ZmhjN2JPakNJ?=
 =?utf-8?B?MWN6cmRLUXN2eGlTNDdOZVZvWTMyM1FuSGQrNHpHTGtOajFKZUVSZzJYYmdI?=
 =?utf-8?B?QWplMG9ZSDBINnFWb0E0Z2czdlduK3MvUmM3OUNETzVTcHNVY20rN0dtL0x6?=
 =?utf-8?B?UW5rVmRZdFlhWFRGZTdIWmZVTnlnTmJsTW1VU0E1cEhxNVBQNVppaSt1SG1w?=
 =?utf-8?B?Q0tTcHdtU3p5dUt1Y2dkVldzWG1nblhPTlZDRFA4MGY4UVVJOFFHbGlKMEpI?=
 =?utf-8?B?VUU5UjE2L0RESUdIcHNGQ3pRZ3MxQjNFeTRxbXJ3SmJhM2JYSGhkVXp6Y1Z5?=
 =?utf-8?B?ZkMxYjNVaHBjeUpMdDB2QkIyRE1zemcvUUtZTlQrMUVYZXBmQUIwNkpiRTZn?=
 =?utf-8?B?ZlNBM2xGdHEyYTRJMzF3V3FkaXZySklDRHNWSTZaR0FINWlsc00rTTNIalVD?=
 =?utf-8?B?UE8vbzhoV0YyeUJWMytuQWxQYmxaUmJWdEdnWHJ5RWJIU1ZLczJKbDAvSXIv?=
 =?utf-8?B?b1ZqNlV4VGUvRnZhVGxSZ2diN0hPYlNQRWFKUHRRU3poQ3J1RGYrQm1CTFZK?=
 =?utf-8?B?RTF0bXd3cUV4Y09Bb0oxMVgwRnowbjZqOHUwNFB6L3dTeU9aUVE3N2RQbk5s?=
 =?utf-8?B?enhybjlFTGVqdUtPMkNST1hzOXFua3hwUldSYUtqV1diUTh6ekhaNHRTUGZr?=
 =?utf-8?B?ZUpRZUZhY29NVXBReVU5ekdtM2Z1Nlp2RWZhOVY5WVBOS3FmMS9UeGV1eENJ?=
 =?utf-8?B?alZwOG5YaGtoVHVpSDBocDdwWWU1dVFHRmJMdDhhcHdYbmdmNnFUc2J0aHlP?=
 =?utf-8?B?Z3JHU2tIcmJkbFh4OHBISzAvRTJGRFZYQjJOaFYxRFUwT0tCWFhSdUhCV0x2?=
 =?utf-8?B?bU9wcFlNMzd5dGFrSElCNEZac3d6cnZhOG9qTDJvOVd3ejNlZ0h6REJINEZ0?=
 =?utf-8?B?dno1SkZQb3NIN0FYeGUvOFQxZnZOSXVpSGpzZVNCQk5nM2lTT29CTVF3T2ZT?=
 =?utf-8?B?KzBDdExmRVJkQUpZM3dhN210d1d2V1Y2YkpISnN0NTRLZ3VDTkdwYXpWMnkw?=
 =?utf-8?B?ZEZCbGpSRzFCaHloYTdDYTJFYTRwWTdYdlZCMUpyQWlEcyswWTcrTEs3VytX?=
 =?utf-8?B?S2N5VktXM3FuVyt1bDU3NGZyMHQvaWxRMUtWTWpSWnVsaGNNUUJFbkk2R0Jq?=
 =?utf-8?B?MmVxdXIrLzI3Q2w1cjVvTnNLcmVUMWtReDVINThLYWwyaXZhRHNoMGI1aFlo?=
 =?utf-8?B?RXdMQkhSN3lwc040OEFZdkMxT0llamZJYkNwOUpDMnYzM3pjYTJHcmhCMnVo?=
 =?utf-8?B?VlF0OEZSV0RRNUV5T0dVYVNxaWVXM0VTQlkzdUMvWGJnQzNUcm1GUnVHZ2hE?=
 =?utf-8?B?dzUwQitWTjZWSU9wNC9sMm9mZlRhQmZTYi9wMmMxUzVkc3puNGt1ZndNM3RC?=
 =?utf-8?Q?camI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlIyanVzOEs0MFZNRFRMbEp3MnJRM1hYTjVyWUppUkM4dEY5bmx6MXUvNE8w?=
 =?utf-8?B?ZDh5NWZYVGYzQXcvbXdHbEJWQ3hKZGNjL1lXOGFsUUJDMlJtR3MxL1pZWFJn?=
 =?utf-8?B?d0s0TXVPOUdNQ0EvM2hSTW1Sdm04MThTeGdLbkVqdDljdkZheWxtYUptQ3Jl?=
 =?utf-8?B?OE5NRUlZR3V1ekxjSWc0VnFvcVRjRmRQdFJpZ1VUTEphcWlaSU9TVmhrL05U?=
 =?utf-8?B?R1I0RmNKQ296bzZpaDJXcnVVMHBMVEhaaVlDdFdGb1FMSmsyQVg5ZitDOU15?=
 =?utf-8?B?Y0tLU1Y0MWdFYUl3c0VPR2trVi9vZGRvcytKczZsWmx1WWNxVkpQYWdaZFdQ?=
 =?utf-8?B?UG12VEVBRFkrcnpUSmkzMUJZODZuYzN1VHBYdklwSEZQTTJSRkNlY0tSSmx2?=
 =?utf-8?B?Z0hlVUQxRy94b0N6bnRtYnUwQVU5ZFczaU9hWWt6YU8yTW9sREZ5ZGJJTWxm?=
 =?utf-8?B?NXNkTkRwc1dWUVFqdmwyN3U0SFVBelNURjNQK3FTYVpGY2liTTZXUnVPSDBQ?=
 =?utf-8?B?RW5YdlVsTXp2Ykp4cTdzZ2Q3SkwxTEdNZXU4anpiWmlWTVB3Mm1Yd0UwdVEx?=
 =?utf-8?B?bWt0c05jTXdZdXdQUVpVQncyYy9VTWErZnFnQXpaSGRPMUs3SEh4N1R1RVRB?=
 =?utf-8?B?KzVJVG5GK3VxWG5wOGRwTlVyT0dUR1pLeFptSmlpOUlZZzl1anUzWDFRNDda?=
 =?utf-8?B?ck5LRUUrMkR6alhMVk9TREVKRW1nWFdrMWhYcUROK3cwQnVwRTd0WFBPOXVt?=
 =?utf-8?B?RVA3amRIY01kSHQwdGhPdGllRXJtVVk3YnpPY09TU2xQOVkrQXl2R3RmYWFu?=
 =?utf-8?B?VUV1MXB1K2tWajBGcUs5b2l5MkY5cUE2MjkwTTIxOVZZbW9RcnJSakRjQ1kv?=
 =?utf-8?B?VTZUeHZjalVGbENvWEd4Z1ByWXIwbjlmaE90SnZMNWNrcFhtazNCeHVtbGt0?=
 =?utf-8?B?SVpOSnkwNDZ3aEV4M0w0eForNkhIRmNhcUhlWkthOHhpbEJUTE5RaDRucm9p?=
 =?utf-8?B?VzVsZE9TMU42aHl6YWJlclVrcHM3QTBxZ2pmYWFNM21ocWNsbjRlTXhPWFFu?=
 =?utf-8?B?cUZCa3Nic3ViN29pNmZvbEc1WkVYYm5YaW5iK25UdnhPWGRGNU4ycDlkV1c2?=
 =?utf-8?B?U2xFUUdscnhoM09CaEkzRS9pTGdQV0hsbFFHZzRjWlZYaWo0RTBYK296aHJw?=
 =?utf-8?B?OW9Ib21oc0xHekQ5MVd2WEVBaW9nQjIrZktpRWdGRE16K3hwV2k0allNcFJt?=
 =?utf-8?B?TmwzVWRDd3hSS0xWTmQ0d0NBai9HS0gxUlN0Rkd3elh2SWV1QkdrTE91YVBP?=
 =?utf-8?B?QkEvQldNMXkvRlJHSFhQRkxEU1hnb0tJN2QzL201Mi83cmQ4eEk5ekljdyth?=
 =?utf-8?B?ZVB0c1J4M1hRdjZWa29RMlRzS2YzZ042eDhVQUcxZEprdG43STBIajVjRjA5?=
 =?utf-8?B?UEVPeXBWTUMwSThSUEdBQW9Qd05lenBLSEFBSWhFdm9JK2txelIwOU1qSXNB?=
 =?utf-8?B?MWVHMTdXOTJhaEdob3dFbmozcE43VzF4cWx1SFpMM3Y4VVk3VnNveVA0ZmZC?=
 =?utf-8?B?NGFyanF2T2pFMkppUk8wNGJlNlY0MWE3YmxDQkZLUE95M2lySjlLdm5vUFhw?=
 =?utf-8?B?MDhNM0Y4MDYwQ3NNOFFScVNlNG5GU3R3ZGpHc3BZYldGVEl3blZHblFuVHY5?=
 =?utf-8?B?Q3l5UVpzdDRXZlIzNEdidldVQnROMGZLcytabFY0SHVGYnBlenl1Yy8vYW43?=
 =?utf-8?B?Ris5RXVVQTE4UGI3YmRQUWcvaEI0cmRNdXFKQUEyZElXeEFab01oT0dWQ0dH?=
 =?utf-8?B?M3BwbUhENEh6eWd0aUtGc0lpbXBlNlZaNFQ5WVd6L2lFdUFvQU9CczRBT01O?=
 =?utf-8?B?VTEwZ3AyWFhKSjQ1TFhveHR4MmJpVEdEYlpkMXEyZ0FwSnhWZVNsaG9ETzU0?=
 =?utf-8?B?OGFQUGFnSVdpYnlzWjM5NVRkc1RzaUFVYXdoNHRERkZyOWp3YmYrMG1ubkdE?=
 =?utf-8?B?RVE2bHVlai9jdE5TSDFhSWlUS3llM1JWMnZMNmlORDg0cHVXV3NmTE1xZDBt?=
 =?utf-8?B?cU1vM0U0eGM0ZjlPQ0puVjhlNU5OMEE5MGE2M21lbGQ4N2NZaitIZHlsdkdN?=
 =?utf-8?B?SVVBQ002Wks3RGliQmVoSkhWQ3psbnE4eTRjanhXZEVkaHZZSEU5N0J1SmZk?=
 =?utf-8?B?ZFJKQ0JvTkFSTWVoRnIxUzFDN1lldmN4KzZnQzJXYkdpUEZNNXZvekpRWWpS?=
 =?utf-8?B?dWhvZTVHNk9vRkxKd1k4V0VSMDYzRHU2eHdtYmFzd3ZXMGFqOFZESXFwaHRi?=
 =?utf-8?B?cVlaYmRtaWtPY0xPV3BTRFVSemZUWjF5VWUyeXFNU2lhZVYzQ1U3QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43fe9b37-a9ad-4fc5-d835-08de6e253351
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:05:18.8974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RToRqLky0M6U+koD03myqZeq24LuyTArvdl1IDhnyBr0C4LGAk2krxn9dWudGSalmj+thybb9GjKRAlOUt7ZUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8577

On 2/17/26 14:59, Ian Ray wrote:
> Set `phy-mode' on network switch CPU ports to eliminate a warning.

Can you mention in the commit message what is the warning

and how did you get it?

