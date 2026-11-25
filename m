Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795629774;
	b=3fawbQKTWQoyRqPnDBpnSaktvhSXaYEaei7kegGsLIIofHihrcUpJjnVwoGlr7POJ97i
	 X1iT00NWX+yZIYPk9TE3EGDP+HIzZXPN/PhVGGTF3XsG/wXz5tO5vI7Y076GwVeWFWdjY
	 0Jq160N4hLDjDqi37+6hSMq56UaJuo8KW+y7dMn5joHNMMF/HUxcD5XLN6+LQI/+7Uilb
	 2yOYeLHH2eS+zaxzfZwktC6pyxJkzzNG0R3isV595x9nUc+ka9XaJPl3yUCfZa4BqtnZe
	 p58H9PfyNxNBqr2zx5d8/hRlITUAQXAQ3NnWJ87i+Z1b2y1uQ1OT5M/Ueogn2bvK7ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629774;
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
	bh=6h5K9pbN65+6UyDZbrQn/A7256YJ9qLGywHwBkkdVsQ=;
	b=RrWYVU+pNLCAx5Y0jfpKKKJKq+HW0um0Dx3PGMjrOCEJ5W+wDAMquOvvTInu50Tt5Z1P
	 7x64C1QRVWDd8i11hN9qXaRWg7M33ikVnkkI8QccpP8aybtW58zX0MNQao97mwHnqzxwo
	 7KYYkMFk1UQmYWvu+Z67+nEoxAg4IWCTOwQICpt/lzFv6aBjAgDUmrt/i1IW/2NsSwVhn
	 V9tbmvrIxYrwutYDE0rzhHjsreVoz7EdDS0J4z+3IpwHzJ12gLXHQZ9BN59hLhAfHnoqp
	 ze0quXLDKX36HIxWVEqaN8TUy+KIxTuy/XCroOHVsYWwjrhj1eZoP28N7C1yRLrbDww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dnL2oiKo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.43
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E43606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E43606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dnL2oiKo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZ+YVKpPFYScVb8viZjYoiUArNui3Gupq163qkHYtuY3MiqxSiX691sCO7x9XzC8tMwJ8JYAVcn9m4c5LJxbKNJRy7jAN/nv0VYcQvZ0kmtXSKZ7YlAsSveTojRPq5o+0y+Irfm5/Ja+FGR4OSCY9hAMs1KquviOgyW/Ql3xJnJgU8rmCn9HHxq1E18Sg6P6X9ZacKauERAjHErY0vq0zjNbaaH7LxgFGmVFqHJYYE2twLsbiD3DT6pH6/Fe2iOJKbVsxYzXKRoAtK+t8YYSS2OUr2BOI2VrtuQ4VOp3HQCjTQfeBnD3poqSlUrEdK15W45prkMhnOxXMY7korV3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6h5K9pbN65+6UyDZbrQn/A7256YJ9qLGywHwBkkdVsQ=;
 b=S1AjePbWKvpT0sb/pCRvgWYgdBgTv73TPt+O8PetBfTQPnzVs0+R+FT8qYBZN2byn9CrQ4+iJs28Lvgdz+rdYPwly4O9jU7IXkjmKeaq4zYfoaqyxgJKHWeK5jsj78jJn96jWvt7bCsWJ0GNZ/h2bSPUu9U5bLXiyoz+9P5IJDVXP/Gtx7ZE8PbyWeyFKU0XfPkluL4EtGAMCjIB5m81plzUp11piL14khsc90FmW5Jcdi4CnvnYbMlp9C0T0saxtuuLojkg28BwlijjqntJfn+aP6QjoTx3I8JnKbYSOkACNMMQ7rVBngLL4C6nrzu8K+gvk7DydGHr24GYDUYBQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6h5K9pbN65+6UyDZbrQn/A7256YJ9qLGywHwBkkdVsQ=;
 b=dnL2oiKozP4IhU4Q5NzZK8wxuBPCxNT7jb44MRsoCZGVP7kSthtW5i8UWf2B7vzuUMlRM3yANDxPO/6A1ae1QxaIV8B6IPteGGyEzAW64F/zYGNSTeDZaVgDFNm073PJLdLESslFBgiZrKerty0eDiptdIiiHSuSQcUiByUnvHaqYcFW2DNUU7gOQiAGUPxF4R0QgD8L8LbC8AfLl7rl6EuXLapqiVxoFdIFtcGggvwORQx0ZqkiuCZeqXaeKv0Ql69UrL7UsKk1dWOY5k7/PZ+zLXRWwn6q0d4O3WYS/8TWDk2XiIF7hd3fP5Jva6/i62qt45jnhnwm50peeb7DZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10242.eurprd04.prod.outlook.com (2603:10a6:150:1a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 18:02:48 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 18:02:47 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Fabian Pfitzner <f.pfitzner@pengutronix.de>,
	Joseph Guo <qijian.guo@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mp-frdm: Remove unused realtek properties
Date: Wed, 25 Nov 2026 13:02:39 -0500
Message-ID: <179562975640.3144928.7034536035449232424.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124-8mp_realtek-v1-1-3da734007eff@nxp.com>
References: <20261124-8mp_realtek-v1-1-3da734007eff@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF000132E6.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9641f7-b881-4639-7deb-08df4b1e4fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|19092799006|10067099003|56012099006|11063799006|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OnVWeDhzHkSmMB5rnSDjddwWkwqRsbEsj0JvlfcYH1Aad3s4ntbzBIAJ3FRXHkNMG7ippTJjV6h4apvNQiDZhqI6sehzjg92I0KhbqQxO9p9sQSOMZuHjLaVGD4Lmc1oR5vlZinQgRD2ZPi24gU6lGPlQJxrGVTJlGq6XseD4E9I/ktH3nE1zy9fbgPcZc8woX6h+b8Fx7xPOhx1FY3cqp9zLtLlbz+UgYkyXbXglQQzNP9dVuFcGsdD4xOJwjlAxS451bJtjOuqGa9iCkla0aFJfkDeqTOCjyvBwuehkfQmwm96nyZbC4Z8KFKp6tfdBS1J8aEEejA54DispNsDeQn51WDkdVS1wsWGuntoEbmNtYivwRFS1XMiJwQSe3h4j6dg6jqtzH6OuF8keOck6iz4bVkTkPICanqXo/8dQQkiFdAXcO6PTmfhDizJS+50tEGm0lNk0h76vPtEoDoIyW0ImGIUwkELS2Xvf12pmVPvl/M2h+K7aOrVIOLdEYmUbHJZxk6PbI+G3OyI2kVTApMaGWXFmuFkgQKZNivqDbxHvVI6dD4ADRZ/9UdmRdIs+ZHnV6B1gIyhqTEkmvYB6wJ6tmmOkhSM77vr1qJvuD3dHabx+ifrb57BFzxm6FzzdtS/s6Qt8NW0pRLciDpIg0BJI5V99ABv+mPDH+WZ790=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MS96Y1dpemVtcFM0cHB3ZG1CeTViQlJHM0ZWdGhGcW1OYnlRWVF0S3BrTGFa?=
 =?utf-8?B?eTZoaE1JU0dja0w5VDE5SUVWcC9WUlYrZmJZdTZlOWlvK2xjU3J6bUI1cGJS?=
 =?utf-8?B?VDN1QU1RZEVqc096eTVqOWxMUnR5Q2JIQ2VWbVQ5NCtJWC9VemZJeDNxNVFW?=
 =?utf-8?B?ZnE4WkUyK3pYWGM1YkE0VFdBWDJsZ3NsODNST2RqTVNFWG9LUWd6VmVVdHlu?=
 =?utf-8?B?NGdEQnhDSFlLYVZ4b3I1RXNLY256RFJpN0hYajF5M01TaWJmaHJmRFJ6V3cx?=
 =?utf-8?B?bmlGOGJnNGpmYmtaa2NEMi9EK0VuaTRDNElLQWdPelpsWGpkb2V4STlxLzMv?=
 =?utf-8?B?ZEZlUittSHFoU3lHWmNuY1g4a2NhZHNDRERsbXBqWWxLT2tMdzBlNUErQ0p5?=
 =?utf-8?B?ZjJPY0hDOHo3TjR6WUxPV04vWGs4M1VGZDZQTkVFM1BQNUlucWMvZ3Q2ZUYy?=
 =?utf-8?B?TWFERFp6K3Zya1ZTUUlkQWZueUNzSDV4UmFkaWd2MUh3L1U4TGo3b0N5cWxl?=
 =?utf-8?B?ZGJzekVWTGM1KzN1RnJValh4SnBkRUsrdVhHenVnRVNWb3ZSRk0wL3B2Z0FG?=
 =?utf-8?B?LzlmQ3Bsdy96UFVOUmdxMWpWbk1lNUlUUlduVzV4Z0hVTWpabG1GRHRSQ3I0?=
 =?utf-8?B?RGxWSWY5MDlWbFVQek9CZ3U3QlJwRXc5YmVjZERBaFJPWUZXTUJFTlNRUG0x?=
 =?utf-8?B?aVBvTGIvRjZrMTlkOHhtQmhuaW40VmFjakxtZjd5K0VVejZubkVHWGVoL1I4?=
 =?utf-8?B?ZmUyak9ldUdoeUFJbmNwZmNuNVduVlJNVkI5WjRMWDk1ZithR1dJWTgxeU9L?=
 =?utf-8?B?RVpQTk9iVkxZdHNjMWp2TUJZbWI4VHluQzJrVDNHMUliZys0L3pzWTd0UjQ2?=
 =?utf-8?B?MmJSY3cvV29DNEpMTzI3cVNQRkVSWTZjb1NaSFZjTk1CUytzZHd6Z2k5TXZn?=
 =?utf-8?B?R0UweGN2ZTJFVkNzQmJZRWVnTmVtbnBsNnhXeWc0OEdMTHRybkQxWXNXUVB1?=
 =?utf-8?B?eS9kZ0NFQWJtU3owYVM2SGZoOGRXbC9CK0Y4NFlnU3dLOHEwckpnbVFMbzRo?=
 =?utf-8?B?VHB3a3ZVTWNNTFE2b3NUOTE0aVB3L282SUtEaWZtSWh0RFBuam9PUkVSSkFB?=
 =?utf-8?B?NERRSy9Zc0F5NVU3Mkt4VDdJMDlZOUxPeEYxWm9ac2RaMFFsaUI0b0ZYMkYv?=
 =?utf-8?B?Q1cweFZMVHRLbjlQQURzVlVqcXdFTFUvTUZHS2ZDbllwL1FGRWlHK0x6czN0?=
 =?utf-8?B?ZEdqUzRSOW1jSWNWb3FMck5pN3FuR01CNDgveXJUa3ZRa3J5VHBnWDFCem1D?=
 =?utf-8?B?dVhVZklCSDVybUNqQXU1aDZMSE54THFwUUx6azFEMjdsVmFRbHZWWmlNQzVt?=
 =?utf-8?B?blUreHlrZlNBSURMVFRocXhrVE5DdHNjMmlyVjhsdXZqMzdNVW5GemRCaFgr?=
 =?utf-8?B?SHZnSFhkRXYvQ3loeWpCNzZVTHkwWi9Ccjd3YXY4cFhESGtBbGZuUTBuMnkx?=
 =?utf-8?B?dHNHVEtUcDNZVStVWmFIWFlvYlJGNVZ2Q084RDdCalFWNVI5Mi82eU5DWjdT?=
 =?utf-8?B?SG9KSGJBai9ZdU9nZVhLYlNWYytoZVgxdXd2cUZOT2Y4eVZBYmgxNStnY3RD?=
 =?utf-8?B?N0ZtUmJlblpPMUpjSzBlUTBCWGNuQnU3VVRDQ0dGNmp3d2pUa2hoaTJ1OXgz?=
 =?utf-8?B?enh3YzI1cm5vTnJtbUlzRXBYcUpvbTJKeGQ4dldoUVlQOFR2Q1d4bDBXMkZy?=
 =?utf-8?B?ZUxneFJSZ2JyRjFFRVNmb2Q1L1NrRncrYUVnWjRaeWY5YUdNelpXc2xwYnZR?=
 =?utf-8?B?eElzTGFZYUt4R3B2cFpxN1FGSk1NWlVCaUNvanhvNkJkWW5rRE53NkN4c0Rv?=
 =?utf-8?B?b3ZET3U5cFVRWXVQNURSQk9UT3NEZGtMVnE4T0pTK0Fpc2U0STB0dWMzTks3?=
 =?utf-8?B?cytkVHNkbHo1b1ZoamJ5dUVuaFczRmZYMEV3OExVOFhQQkpFWmMreTJxeWt4?=
 =?utf-8?B?aTNmcXZxZytpakRkQTNuVVFLZXFmNGd5MWE0Z2I0VS9tSlpDbDIrMDFwVGwr?=
 =?utf-8?B?NVc3TjZRM2R2QXcxN3MrY0JZdUZwb29OZDdWaW00bWhUMEV0SXZuMkRuOHBt?=
 =?utf-8?B?ekttV3hyQTJZbXZzQnJLbTBPTlg2Rk9EeFpLOUlCK1NJOXpDRU9CazREVGh6?=
 =?utf-8?B?UjM0VzlwM3UybGgwcHIva2NjV1daZzl3SUVRMXF2QkJlRnl4ZXJnZmxtcWZL?=
 =?utf-8?B?RHh1WXJld1d4c3dKdjdPcGt1MzgxaEpLQzczVjcxWFlZS0daV3VFZUxxUTdH?=
 =?utf-8?B?dUpwbDlCWXdHSXlpVDZzdzJSRnFSVTh4VEg5UzFITkpRaXlOM3g4aHR4K1Q2?=
 =?utf-8?Q?NrAmDnsmjS6RdN7saAr5rJTx4M0M/AUG+n9OK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9641f7-b881-4639-7deb-08df4b1e4fe7
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:02:47.2352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +byM9A3bsgRL0PbsoG1n2cBdcSeFD8OMUHuL/tY+g0IM2RK8X39kkdv8wRtborf4Ax6QWFuju/tGdFr3CWUqnVOi9Idb3NtWHckdY1W5Q9fTJK3zqLRPtWbzm4rkiNub
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10242

From: Frank Li <Frank.Li@nxp.com>


On Tue, 24 Nov 2026 17:18:17 +0900, Joseph Guo wrote:
> FRDM-IMX8MP use Motorcomm phy instead of Realtek PHY.
> Remove realtek specific properties as it is unused.
> 
> Fixes: 95d7d7d2ad27 ("arm64: dts: imx8mp-frdm: add sd, ethernet, wifi, usb and hdmi support")

Applied, thanks!

[1/1] arm64: dts: imx8mp-frdm: Remove unused realtek properties
      commit: 3e99374a14b311e627a8f0491c8be477e9d9f44d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
