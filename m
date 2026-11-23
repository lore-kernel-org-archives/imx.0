Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795471179;
	b=njXeVp6mRg3fT32PObNI/VypeVeCEAOtPfgN/hU/FGPUX7jPn1Nu9F/20mgqrrVx5xHd
	 hMrhfz6uHldOUY608/Bwmolmb5adprBsXcyz3/AcHi7T5JTA5dYPz+t0nrZ+arZq8P4th
	 2qmr5yKnfHMy5rjxonLy7udirbWKLpnHmtwNcDiTX4g7E2E0Yey7faOatCxh0FD8qascm
	 XYT4OgUow267Xk4FIsaxj+BnpG4D3F9nLvmfQdlDOI5QnMBtUP0g3JQCqbL9zSe0QP4Mg
	 PUfIg6he9KA6zxxopQAqS0KxDlIp/yhGhbfxNAiawAYfMyuW7L6Ilm77TvL3FBcQgiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471179;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SlN1iedGIdSnNkJxuutd3w7e1Jbzw6sccZoEjYLTkIE=;
	b=udoQBIDNAlYRaBvDoXZPgfTv1VLCNaYFaaYIfvVhno7uqSW/FNbgXo55IAseQVMUNiQi
	 iRDLaSgK0tMbd5TpZi5Hn/qQRaBb1qAYq4keEMyt0itSb1Rx/QjsSCVuL5IKqxQg/rfdh
	 0hOi/NP417NIsu/Lr4s+93vOzTM3OZ8pDiPr+nzmS5+kmIs7e0lJfRXXldm3Xzx0yhrwL
	 IQShLYiMCCWcJPVNhxRp6UvFpNSeYPAZenazUAON1dTRGmb0UgMKq1LYCCtSeTjnbWtG0
	 RpV6ny220cU/OOuOSGzrlTSejquNMoM9/GTnqp3oBnlIsNhLyF5KI4glz6laJOipX0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=l8a67050;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.33
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5119F606A31E
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 21:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5119F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=l8a67050
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLfHlkkMmEo5wMInA3Cj8GkpJNtRW4xokHArDeDHpvRAquEA5rRfeSEvef9/wlcm7Jyg65rl+ka5keAxaTqoRRQNMUAWwOo9eegRC7FwVF5LExwGwXoFcNsMrwJ/+2C2Nj1t+LFGc7mlui561vURiQFVS0c3GcSUTk1zG0EJfZQmq7nsmTH4T/sJGaqDVmuwPubBKcl0APdAt8+IOAKAJd9awoSCI+LtkHodupiSt2n5XIiZ3Ua9AKMgXJipg3RKXRUjy9AC4/pMYDmFJ2kb7HNg1DMuuFglKrax+hAzb2N1cQ6lyvEVVMx6Dl2V/xSo/fJ77MN3/xF0pKFNc/ZKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlN1iedGIdSnNkJxuutd3w7e1Jbzw6sccZoEjYLTkIE=;
 b=AOB/LdShY19CMjFrjH9lbrBD+UXvvu2yQbJi+mncxr96pxwzwDcpfgYyaOsWkmtkZvVm5Y+bYzPLkm/WaOwm+DCmnPSQT0NMMSKzIoTVyX+5n/df/e4E1YrTbNmTWFacD98y+Y7nLOj8FXUhwz3GzOkWcq8rIWY+VSZ/1BALYNI0VL22BkDh8veZ6diDkyII7oT2AaOa7IdSvI67IeEt8lcR9aBY+9jpSwoRlLxlt3Hxl+hXTqUrKCvFTjY9AtWux4RM/Q723mKZMtaB57ZKpDi01YMrgXnGEtQEYr4eUB7n2c47mOT3E+InlddFjb6tblJHLYif7LoK20tBxulMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlN1iedGIdSnNkJxuutd3w7e1Jbzw6sccZoEjYLTkIE=;
 b=l8a67050XOEn7msYT9p3xk9dV3sQku6NpmFNSCvFORRlxeYItBjjjSwlNIX0iW67i/rgBEgdR7kS2zWR4AyrGYdIPjoxnVTCt9wwn6pK549wW1nQ29bJZYYUVTkf3zczpZy1NiAC8/Zlkk6ZW8s4rGyze6Jl8ELpl2K8WnwY0TNGyJ87P4OJPKnHl/hd7EjIAqccrq87+9jFpHSQQ7fgzQ/jvUJWDfngcKPVL5qckkpuDu5sVqQP+LkHDW1fa8dY6jj/2OP8xvtybpHPUdX0EMDGZ7IZWA1wMXffSvXtlYPIUMglHJ0E+0uKjDOgelO/rHhEAGIAMwpjMns4nJnIQw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8349.eurprd04.prod.outlook.com (2603:10a6:102:1bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 21:59:35 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 21:59:35 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 0/2] Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Mon, 23 Nov 2026 16:59:26 -0500
Message-ID: <179547116080.3011330.9892542532663386900.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
References: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9f5cdb-1130-47de-8a8a-08df49ad0fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|19092799006|10067099003|11063799006|56012099006|261009223027099003|261022075727099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TGwiWXCC0Af1Rzggx4jVaF+DSjCQzhyUksmFgipKm7plWEvsS3LfxBMUk+LOVbsfy0SdCZuMF7B8YX7dSFjO7QQ7xVOMrZKYld6wVNw+6qQ6Mgz2CuWSARuWwnOiZG+ZMZXhrGdGpSsG3bXflfS9+OidJjt3s8vVTAJdFQ0iIJ94ZO6HTM6Lp2GZn7inrsO3ZLWvOEDSoaNe2YuMO+Z3FuOV5hHlzBf0yGf8VP9Vl7F0cy8fOejXkmTB092stcxxLZ2UvRQI/lTqgYdIU3mFsc1ovWco/MTR2J2X8aEDLzSpNagGU4zWbmsMJjvsIpSDOXXM8ApkkVOZ2QWFQCVmksPDBnzyiPAj30rY5+Me0azt/qrU1GmhIi7BqNbKcN+rCSEFqAFadeNeGBY7trMNptrI19bmyVSBRon7bBzyX/kvlTVrk7+ALKDcWGNwNk+86B1uyiVGKgKqOy6puE/LlaPIgkwlQ1e4TTX1Khyv0jVwriLbSZCUMRH4bUAnX6TZ1+1TECOpkqeC+PPVenxHGFEm4mYCp/QaXyKSxXGjYO7x+NHFnIhc/ALxRqY9S6HeoeG+KAGab8g1Aq2bFrP26VLRmkDXGxz41m6peg4puYL4VoVByFDG4KM74Jy0U9xsBvhgEArsZ8TmLhzT6ImVpZsflstOu8kJbMaB/+wPmBc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXJQSXBTRGRsL0hvTm1VeFN0QUZZdXNtVjFmRVFEUU9EVmZpSDl0U0ZKeE5X?=
 =?utf-8?B?U09wUXBWdzRZemY2d0huQllhVWZUUkZ0Z2puYmlYemRlYmRvbUt4Tk1wQkdj?=
 =?utf-8?B?WSt2K0JnT21WSGNTSjhzWXMxL21SR0JLbWFhY3Q4WFhBZElIWG5JSTltRkJT?=
 =?utf-8?B?TDAwMU1wT2tYbnQrdnJuZmRyLzVScCtnYXRiVjIxRUhvWVIzbS94RG00Rlpz?=
 =?utf-8?B?VXNPUDU0MTdKaGJYWlFVeUdRQmpHeUxnc3dkMytsaGdaaDFMUG5yeS9YRkk3?=
 =?utf-8?B?cHBUQ1JRVWswN2JuOWxPZmtDNkNzeDg1VVYzeENxaDFMTFIvK3pTRTBmOHpH?=
 =?utf-8?B?aWpDN1M3Y202MG1hdXo3RW5OejNLRXRmdDA2L2YwRDhhS1Z4M3UrYjZhUDBx?=
 =?utf-8?B?dkdMbUdJdTBlelFqU2IxaThKdzBXN1I3TzFsQm4yck04Vld6MkFkY0xMQWs0?=
 =?utf-8?B?VjRyYzBXa2cxdEh1c2JHQ3BXVFdoNHRLNzlGb0RhUXlRc3pHdncySU1rVEVC?=
 =?utf-8?B?MnVLS0VjcDRaSzFsMWVtdWltWU9idmpKbVJSdmUwcDlYR2ZSeXg1eERnenhO?=
 =?utf-8?B?d2lyZ1pWc0kzNVVZbkdtTW1iaVhpWmtqTm8rYUs1MlNJR21Ga2R4SUZ1bWl2?=
 =?utf-8?B?LzdNWngrVFFJcVI3TG1lUGtRN20xU2FsQ1VuUnBTWWlVZ0FmemtvaUV2Yk83?=
 =?utf-8?B?QkpWN1RwYUY3WmZ1OWVjcXZyUUsrdlJtdEVjcmxwQ2ZaR2txM2ZYUlZ5NkQx?=
 =?utf-8?B?WE05LzFyeFM4ZzNtL2RWVnNkL2FuUERFdG45ZkNXMDZqVWdLcVpVR291cTZu?=
 =?utf-8?B?ZGhKTE5CU2JDdEs2M2FPN2RmVnVMUG1PdG1UZTRrb0IvZWVid3pGZWVudU9z?=
 =?utf-8?B?bjdPL3pxaVF1bFZYc1NIRTAway9zWEJzWGlWZWpYQnJ3K3JpUzlmZGxVcVp0?=
 =?utf-8?B?R2ZxQnJ6VGtTeEJvUldqTTJrSlJqazhGTUY3VmR1b01USkhsVkpIT3BOOWN2?=
 =?utf-8?B?NUpHY3ExZmhEa3AvVEZ3RDlFRHg3SGpHcU9PcmljSHRoWUd0NllCM3dJdkha?=
 =?utf-8?B?VC9oK2hacVc1VkNrbzQydE45am01aWRBR3NUWGNJZGxKbW05eXhLZW9ZbWJx?=
 =?utf-8?B?bTBoV2VvdENjQUN2MmJZM2IvdFh2VHlFOHdTWUNjbWFCRnE1UXFGSDVoYmlG?=
 =?utf-8?B?QUZVZEsxbVkxU0NkUS8ybkVzRGhJMWhseUU3VEdZWUh5bGh4aU9iOC8zbjd1?=
 =?utf-8?B?Rm1ycjJBUm8vaTduSkZoZUtPNGwwVStkVWEvVU5WWml4RlgxcW9ja1FETVFv?=
 =?utf-8?B?SXB0ZThCZzlnSHltNkJIM0poQjU4R3RXcDM3bDJnSHpwdzc1TW1laGI3bWVa?=
 =?utf-8?B?bTNDSUVwRHNqSUJxUGxPQ09uRGpMWEtQbkRMSzcxU211aW9iemYxZHFCWXlD?=
 =?utf-8?B?VWJDc0V0Tyt6V2dnOGxTVGdhRDNZTjBGUk52ZG10RkppMEc3NE9GZWcrem5i?=
 =?utf-8?B?aExsUUM2MUtYQmFrN2hnMEExODBiaXVTUXhhb25hbFBJRzA5TElqemJFRkZL?=
 =?utf-8?B?UVVObWhQLzNTRE5iNFhURzR3dWNUWjkyZW1tL0U3Uml5UG9udUFKa0l0Uklw?=
 =?utf-8?B?YStRMStucnVJSjNUQUd3ZE05Zno1MGxwNTBqZXFCRDZPby9kYkk1Q2tySkJn?=
 =?utf-8?B?SUV2c1hvNnl0dlZ5ZnBrdnZCUGkxMUdsd2ZKb1dua1hmUFhlRldNVFNhSGtZ?=
 =?utf-8?B?Qk1XZ0ZpTmdzMHZ4eXJ1dTI0aERBM29mcm5nQ21rQWl5QUR0RmtldXMvUXR4?=
 =?utf-8?B?dFZ3NW54cTR3L1hJdkt1VGc1WXVNeDhKb3RoVlJyRGxxampaWU1rQ3BKZmtU?=
 =?utf-8?B?TFo3cXRnS2NZcmVSSEpNdTVLSzZURzlld0RBR3dja3lGMm5BeDYrckQxWk9X?=
 =?utf-8?B?d2FKZzdqSCswTXluemx5Z3pHSHErMG9wREozYmpHcEQrY012cmtNSnpCL2xh?=
 =?utf-8?B?Q3hNQkl2aWhRVjFPSUJ6b0xkRmYzQS9JV2dNUSt6b3RmMVlBY0JES2JQY0N4?=
 =?utf-8?B?ZEpIbFdLalZBSDc3bzE5MHk0bG5aRHhUREFCQzZSd0d5aHl4MmhrN3o4b3Ev?=
 =?utf-8?B?M0plVkFrVEc5QU42K3I1YXMwelhDYmx3THdUOTlDTjMxd0R6MzRDOWcrM2hn?=
 =?utf-8?B?RDZyaWpuL09QVkVXMThCVWt2eW56NUdWTGRDTEdnU3NibkhKU01YU2UzS1VG?=
 =?utf-8?B?RDc4S29XUUw4Zld0TUtSRmFxRDlQRFM4N0dDeG4zSVhKQ0VTMk50UklSOS9u?=
 =?utf-8?B?U1IwalREeGZXazd5d3EzNzJtOExuNFZiR01YaFplVlBEK0FqbFVDVVBPOHFK?=
 =?utf-8?Q?u17uzxX/klfc60vNKsZR2j7nF78mllZi/Zuwv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9f5cdb-1130-47de-8a8a-08df49ad0fd1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:59:35.4132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kx1ieQxTQcVMY5ZLcDcT1jXHRXpDbrIE8i7ZQK1MRGS5XXaB3Wc4iH4/TbF53JN8JIFqG9HrgTlPLgz+xLuacVZ1n8g1mq3RLIZN5t4B2RY35xDVT63zQaLGw7ZtE43W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8349

From: Frank Li <Frank.Li@nxp.com>


On Tue, 17 Nov 2026 09:44:12 -0300, Leonardo Costa wrote:
> This patch series adds the device tree overlay for the Toradex
> Capacitive Touch Display 10.1" LVDS V2 through the DSI to LVDS bridge on
> the Verdin iMX8M Mini.
> 
> It also renames the existing DSI to LVDS adapter with the 10.1" V1 display
> overlay, to keep a consistent naming scheme with the V2 and with the other
> Toradex Displays being introduced.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: freescale: imx8mm-verdin: Rename Toradex display overlays
      commit: c28db479bbc3aee4ad40c3a8af725c30f288e938
[2/2] arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
      commit: 88ca7b43866db1a409e63d165e100a3bbccf5448

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
