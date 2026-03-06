Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B736AB45
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 03:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772766711; cv=fail; b=oaqQ+N0/g5tHS+SNWb3exBHWvSISdoRLLOO2UIfvQLGKYKFVSzJIrfVaVjdX6yUilMatgYJ3Civ0FwBmxR0H+sYN5GX+Py4vK9tn1o1Uu9I4By6oQFQOK+qKx9fSdRnIVXhIyo3+S3F+t77t9xR7Gx00R+Sj/QSFUhrivEL5oog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772766711; c=relaxed/simple;
	bh=CzowyYc3fn1Tv9vuhzdjFdp0NL0HiB2Ti4s61YruU2c=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OcOF0f1XUXHgGlvuRXDQVdCjZsxZpABMKOjn+9mF06vVoh0FioZabwdXtT7KqgdRPqf1Z8kgH9J36qf697NHL1fydiEvrAMxUOmtwmyd9bmXHkyaNFv0EgfDheNzQwEzDw1HYeNpY37YPgUJxWOGAMTCv5uymsm/GULQE43s/aE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oIn1ZgSl; arc=fail smtp.client-ip=52.101.69.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oIn1ZgSl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5wKdUtKAfZwV3uq5+PXl6ZCeUK6Y+D998JoAs3Q2vE6WP5GtjjR67h0aHUWbT0pdGamf45TIy+o50uy2IhiClHN0uG8Akr43i7S0ghnQQkvItWckkobQBAG8/TWKYNwm6rQK0RmXwDDiVIP1+PRDARHzwS99f6h3Ul2EzeaEKjTdoGHzjIpV9onCyT07DWg7MT+bqTqxFFZ0hbTMa0Cu67IyZT8oZ/ql1+VBE3jBByA8u4K0x+Pl7h/DVYjOUzk1a93gcrjPjy3F+mJGU9ctKnLo/0wZngsF7vym4frpx+Q0g5UiuNP2VapVLxC+K6zj1EDokKgL/OybgbyFzr7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UH5RGYZe9gw1xHUu4g1D4x4YiBZdfKbLPU1s/pVGfI=;
 b=sgL+hS37e1zqdwdiS9qr+aEILMFC6kaE/L4ce3IwNVBnPIejQKNi/hIdNo/Meunx9KAxyE+AZ67/gPH3K730gXVIfbDBHdyMBZao3PsgL/8fnqeIl3BpFZhKK3wZqKX7Xg9P9wSTC1h9fTltCGakEK1IEjobpYqZuuE+ttaWqIXaO2fkC4iI5Lmf3UZ88PwUfgC2aLcLN8TNRMolsE4rjzgDwkjFrkqszlC/SIYStph8H9CF9pgpQysnXFfcJKxsAPK5waJ2N+KKGyYA0NP7/PvEOJKcfoLtK3PbPDVExKAgAswx9r74V+qVVI7bNrsMv3m/VHKSmAb+8dGgbG8g9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UH5RGYZe9gw1xHUu4g1D4x4YiBZdfKbLPU1s/pVGfI=;
 b=oIn1ZgSl44zodlzAEwry2bR7KYYeZAS9FIJylV0V47hT0TDvk9pneapV7dXSveYrMXLIBxaG9tqbhCUtCZbaxX00Bulv4b9DqVVpmTITupyoAcpnyamyu+bpAG4RAv7ta5z1vDb+fMqYN1ekMzptkZirEfYuzcD0C0/gpl7nMxGUzcVFaT5B8MoyPF8IvtP2N0ShqahVUHxsBVUcVdWTEQwyHNV0xGTeZfyCKS0p2jofcENH5m5PHc6d0xaSyMxYWvyMDIb/AujvcdoEQl5QO9dRG8E09l+JG1EcrFvU42LNDA1BAnY4KEgheytcABoI0UjsJWfBYF75zRQhRCD8+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 03:11:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 03:11:47 +0000
Message-ID: <b1dd821f-2827-4323-906c-359054782a38@nxp.com>
Date: Fri, 6 Mar 2026 11:12:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ARM: dts: imx6sx: remove fallback compatible string
 fsl,imx28-lcdif
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260305212312.4053922-1-Frank.Li@nxp.com>
 <c64ee6d6-d948-4146-8463-0e68ba542404@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <c64ee6d6-d948-4146-8463-0e68ba542404@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0152.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d22de35-4902-4898-8ee9-08de7b2e19e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	zE+sDPaGy6dFVsHIgyjDTAwkC8xNJ7AgJRytzfiOhWNBaJDo+9DDE8LhkwMYoCXZplOzXGrmJZhcfJVwhTayq4lPOqlcsCFFiSguXko3J4hH69dpk7ggEXLaaDkR++gBZhdOnndCg3UwfzKrB0XKyXWnG3p8N9SDddUlP2aymcFIA1SLmZ8Du1UOpkNsvSBng1lWHYHuMftZQAwPG2wfoepMoVd5C47AMNj+T7SFQHngzkfLqoQNAcCHq0aIcy14nj5e193gqhd+Wut7JgmJrBpho35/XH05luIrbwQDLSEw7KXg6/Mvv+I633MTXb8sZSCbB4QF5Ux3WeGE3GQam075oeuIW7x3G3uiSzfwn0qjt54F9utyULPjz8i44rtSs3ovKsgt9AagxBwnE53Qb8fam2Q4c457aaNI168lIwFNT8co0UvNb7hTOQusQejEQY/DXp6PuGVC6kO3WCIZHd64nrUeiq2kYGKnB/bcuJz/OGFxh3bmDlrhD/L8BdKXC8tTBjmfRjCVP7xPJPgv3wOUwBuJg9trMTyH8Nxgi2g4co1g3avt/LK93pmGY8BuA1FU7FWr41dd+wapBWfBRntbrW64xC3CTXx57snhzBQld1rm8PkqScdNzdvYDknRdO01ggfzdLipnaq6d1Hq5EBfUuhI16w5z3yHyKoj+CdJUmcoU0GeRVrnQOYq7SbbqJqPeH7KogVwbV7IE4ng7Lp+tXZmcapWDvxLxkDklDhj6PJbq8zA95CpYYmccnjDeOYqBrFsPp+J8MutuQGyqsSu72nrGnw5+IZgU8rTWWU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzZBMXozTmd0UEdxZHVZWW16ZFFhb0VoM09YRTRTVS9qckZnM01UVkVDY0Nk?=
 =?utf-8?B?VkZrVk9xMGp2aklOR1lXVGtndHdlZTZDNVlJSlZYdzFsM1dVMVRMV3hCR1A1?=
 =?utf-8?B?TU1mMVJjTGlkWkFudW84azdkb2R1ZjdaRnZmL1FzbFFnbEhmak5OVzh1cFNO?=
 =?utf-8?B?MEN2ODl6Z3A3c0d5RTI5REhhVnJaaDBZTWVNL2ZFakI2Qk5oZXh3VEwyRzZY?=
 =?utf-8?B?S3kyUVIwUHJQNUhQMW9KL0lqaHR5QnZMUVdEZ3Z1dkN6czIzekczWTRLQ285?=
 =?utf-8?B?NW9VVnVwL3d4eXNQRlFPL0puU1JzdHNjK1RaQTV4NkpWVlZpUnN3NDJnTlVm?=
 =?utf-8?B?czJzM1Vza1RiZEkwOXlxZ0MxaUx4czRNNTZvU1o5RnA4WmJYRWNOT1ZrR3VJ?=
 =?utf-8?B?cDRTWFM0NkUxb3NNc0FlVEhWazVvTWx4T1dDZE4vSG1wSkwwNm1nNG1GaWlo?=
 =?utf-8?B?cFp3bmdWSGZPNmNPcnpUZGU1MUFXMlVOWGR3ZXBJT3J4VTgxRjZHMDNXM1Ux?=
 =?utf-8?B?eFNtOVM5T2h5d2tmZlZoSkkxNnozNUVYMFFvVEFVdzJjTkl4K0dmcHJJbHl4?=
 =?utf-8?B?NDYzQTlVaTduVTFjQ2FMTlU2ZzVhM2pac1ZrUHV2U0RldnpVVTVBRWhQZHZX?=
 =?utf-8?B?Sm9zcTRuNmkzZWozTGhTMHBSRFY3ZTJTYzkvNWhRbGgraCtWa0tUblRzOFQw?=
 =?utf-8?B?RmVva2RmMnVnaGJoUDFnTU85UG1BUUhQTnlTK2MvcDI1bXpkV1RIZW0yRk5o?=
 =?utf-8?B?aWlqL3VnNnNyWnRSY3ZBVWIrd2tOUlJUak51SnFaOEFYcFRTYlAvK3d0clNU?=
 =?utf-8?B?R3JEUjVXRWdvVG93Zk05NzJoeWVUUlFvS01DNVlaRENkNEhFc1huMFNSMDgz?=
 =?utf-8?B?dytHeU1wK1EyYkxQcEx5TGVEbjJtbSt6dUJuZ215Mm5QWVZBcUhwR1JPOVlm?=
 =?utf-8?B?N3VzWlpGOFFBTm9ESDJJR1FnVlQrZ2Y0UkNiMTF6L3F5QjVRS1BDcXRLV3VR?=
 =?utf-8?B?RFRYbU90MW9mNmlmQ2JDRFZXb21GNkJNeEFWeVYxVjdhUXJIQkg4S0M5d1lJ?=
 =?utf-8?B?YVBUbmF4UlR6dFJMeGFCdWJtd3RhQ09ZWGx3UzRTSUx6TkE2SmE0WjBKUUZk?=
 =?utf-8?B?eHpTS1Vna21ISmRTK29wYlpNSkhEWjNOZmVKRjlJMGN3QlFrWlZxdm5hZkRQ?=
 =?utf-8?B?VHNWTFIyU1FVTS9ZOWVqMURsNkJQRm44ZExPNFkwaVY4WXFZVDRzVzBUTW9O?=
 =?utf-8?B?MWtJbTBYTXpiWWZDWVgzdXJZWTZSM3g3VDlveGpLVlYzZkVYYzcyV0Ywb1Iv?=
 =?utf-8?B?RzdrWWI0UzhkVUpQRnlrK3pOYzlCN0NjZnptNnhKalFCQyt3WjhLSkRpNk9k?=
 =?utf-8?B?SmFpeUVLZHN5aGdXRmN5SE85Y1B0YllETXhKbzh0Y2QxV3d3OE95Q0dKNjB1?=
 =?utf-8?B?bGhxRWNkVktkMzAvUGF6c2w3dE9zTk1XejJwUXpUaWV4TmQxTmtjVjYxZFpN?=
 =?utf-8?B?TG5mTnA1cWFqNmY5cndkeklsZWxxaUk1ZGY5VVNZTERmQ1YwMXBNTjZacXpR?=
 =?utf-8?B?MTduRFVVZHhpN2lzOHh6dUNlYnRjL2R3TXpHaHFOQVV2U21jVllNeVBkZUhB?=
 =?utf-8?B?WDRCdzRXejBYdkZpblRWZWxCQWhHbE9Xei9abUJCMVNUQkxkZ0t1eStiNFNt?=
 =?utf-8?B?Wi9kQUxWK09ldkkva0lJMUV2QlYweXZ1ZjR2TXFGQU5VNkN5OHlFQ011RUc3?=
 =?utf-8?B?NWNRVVNZdjNhTmlOQVFEZWNBN0xGamt0QnpYdUl3MUthMmdreTJwNmxML0Nj?=
 =?utf-8?B?dlRNMis2UjBDWXd4Y2IvWU9tbVNXakQ5TEVtd0JkUTI3MmdIVXQwd3JlWFpm?=
 =?utf-8?B?NHptUi9aV0ZoZ2ZlVXJnWnY0WkRsVjEyWTEzbU9JL2xnN053OFg3ZmZNTjZh?=
 =?utf-8?B?U1ZQM3lmM0FkOVpXZHFKRXMzbHJjLzE1dFM0UVY0TmM4U05qbHA4NE1kYUlh?=
 =?utf-8?B?TGQ4NDRYZlg1ZllSaWlGRVNWZ0NrTkkrU1FibWttTnhrcWd0SFd5VmVBclQz?=
 =?utf-8?B?WTViNnZ2U056NGx0Nmc5czNiVUIwQlRHVnJJTmpKdFNPbzNHRXVOZnk3dEVv?=
 =?utf-8?B?ejBXV0ZPRXltQXZHcFFrRUFFYUZJYWJOSGJ1SGExdXVPbmZKQTI2WkorVVFR?=
 =?utf-8?B?UHV0ZDhTMUtNbEEvbm00akpVNFNRSm5FTHNpSTdXU0ZRa1pabFd1SUlhd004?=
 =?utf-8?B?Rms4ZEVNR3R4QTVwMFFzblB3b0ovZXhMZjl0UzZTK0V3Q2tZZXNYcXE3Q29I?=
 =?utf-8?B?TDR2THJWT3Y0aEUwZkZtaDVYWklDL09sRDlOemtzeW5nTXFwc2NIZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d22de35-4902-4898-8ee9-08de7b2e19e6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 03:11:46.9755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHmo8U4ksVkBC0QhRKl2x34VDnVq3M8LDbjkWDm1ljnuobgCB8jFW5ydNPj3CBifQbg7YwQojkoERTmTsti4ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8906

On Thu, Mar 05, 2026 at 10:34:18PM +0100, Krzysztof Kozlowski wrote:
> On 05/03/2026 22:23, Frank Li wrote:
>> i.MX6SX uses the v6 LCDIF controller, while i.MX28 uses the older v4
>> version. The driver has supported the "fsl,imx6sx-lcdif" compatible string
>> since the initial commit:
>>
>>    commit 45d59d704080 ("drm: Add new driver for MXSFB controller")
>>
>> Therefore the fallback compatible string "fsl,imx28-lcdif" is not required
>> and can be removed.
> 
> It is required - you are changing the ABI and possibly impacting other
> users without valid reason ("not required and can be removed" is not a
> reason).

People may argue that both DT binding schemas and DT nodes are ABIs.
The problem here is that fsl,lcdif.yaml contradicts with the
"lcdif@2220000" and "lcdif@2224000" DT nodes.

The only way not to break the ABIs is to additionally allow the i.MX28
LCDIF fallback for i.MX6SX LCDIF by changing fsl,lcdif.yaml like below.
But, it looks like a bit weird to allow both "fsl,imx6sx-lcdif" and
"fsl,imx6sx-lcdif, fsl,imx28-lcdif", and I still don't think i.MX28
LCDIF is a fallback for i.MX6SX LCDIF from hardware IP point of view.

--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -32,6 +32,9 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
 
   reg:
     maxItems: 1

Considering that Barebox added fsl,imx6sx-lcdif compatible string in display
driver by commit[1] and Uboot has already supported the compatible string
in it's display driver, this patch has kind of low risk to break the ABI,
though in thoery some other unknown projects might be broken(but, I believe
those projects should be fixed just like Barebox did with commit[1]).

[1] https://github.com/barebox/barebox/commit/2ddbc8d9d15c8db23225785b6b8ebc3cb309e435

> 
> Best regards,
> Krzysztof

-- 
Regards,
Liu Ying
