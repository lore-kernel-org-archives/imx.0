Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013060.outbound.protection.outlook.com [52.101.72.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A31E4AF
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 19:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762763; cv=fail; b=Bb2HlsEnfqc6KPPacVy+I/PdqVtIJDyn4kcgv46DOxaPqf5J1/sDkHMUulECvGinYNH6MPv07XsaiC/l69V+yaHcvvUg85NUwRHExueMl0hOV7TMxr/lm2LwJoRRdqhPvW56NvfxWoHqbNl/xzFkGYw6qM1R2rBXCbddv0qVNOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762763; c=relaxed/simple;
	bh=w+dnt97ZXgw7dTv1bFC2uwK1l8dLMD68ZaVjDtm9zWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YPTJT0MOIH/auY2LHYqytRMkiLTNx5pkd4oo+ewIQA8V+npv/xKvULxyMGcseggBz0G3v4I3GSzEaFPYLtu6PmUShOmU4YzyflLJ225jWAoZBxGi9JNHk7RUj+dCF6a/lQ0TfWxK1/ig8ezkSoqKju9bfTUU7iFeZ3Stscht8K8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vFCYvdEp; arc=fail smtp.client-ip=52.101.72.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vFCYvdEp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukt4qB6adPrQ/fUu+ekI3+bzf6vGik5US+J2K0/yVMjATOc+JVcaMiGJQntUpjC/zHBASb0LXVUInjIVIVABMsO9Z/tY42vbaTUeWMidDIwxTqvzbXPwffvF0358HK0tkPK8DUp+eKebrKlwn/oq1C8agafQpwOpqAtJFlMhpcQMFLh7F7jhu7qA1JpkcB2zZze7kZH81X2RSSJ8h5sKSSWlPXcwixNEU4zCFYOtZ5dHwSRLF2P/bHTER4Y3yGJ2DGdFcrfAuidQBuuvq5NH0zsBe+FaqOV9qxi5Vgfae6NJICSOyt5zpCaiwp/IZCzLaOs5aVeSeHRpcDZ/5qUgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0Nr+h/ke4f/9V4ZlF7jJkduLcXTAPV4ytPaXjTqXI4=;
 b=AhAd83Un2Hvfgsb+CpIVfwRmLOHVNXXJb1+pdye05yFJIaekIS/Nnx2uKCqJ7O4IRNVnmied8R9OiLTEG2aEdmTQdVxKBXrtF1lPmVa+oGsLQllmNo6iX3recSNddd3yxdsEHEzIfu2mlE+UOnibsX9yPgk/tcWa7T1lc6ER4aYypuryp07B37qIve6ouY0blO5BC8UBzYvkfajK7l6Hj/EKDbYyYYiHeUEulYCq1y1ImPltdfRVnJ0zKb1/HvZ3Pg7NpVAXlhv9+zFBUT16guSEOXvLoH/znUqjPAJOoKJEYOokP4MWzjjBSZJGaJb8Z+TtnU7b57IQmWvf00uRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0Nr+h/ke4f/9V4ZlF7jJkduLcXTAPV4ytPaXjTqXI4=;
 b=vFCYvdEpafoSb+CeC+FByCWhOw0WuX1MVmup61UYT+lnGMkkeFlFZjpfjYR3Fl+RnToySbQn3j/5E7O+SJR6iMUJhJpbKfi+SIxrI+cXF1+ExBHndNfcz87/yakcBvLFgzzPN0pgKOiqw0FolcHAc3F1eHfZrxDPhV0uHcPTmXRNzx801rx3GEPH7kZzwdl/NnuGr11WPj+NQsx71FquCT1VvTz+8rsTEzranXVSL1Icy2ycVG+9Z/0OiOHKSiWAkYeIJxzbQuU1Q1KgKAXoSjI/G1kyA+qKbdlsQxBidKsaoO/TYkzN87ziOrUF4zuMmhlLMYSDgpPDd/7Kd0z5bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7978.eurprd04.prod.outlook.com (2603:10a6:10:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 19:52:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 19:52:36 +0000
From: Frank.Li@oss.nxp.com
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Lech Perczak <lech.perczak@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lech Perczak <lechu@hswro.org>
Subject: Re: (subset) [PATCH] ARM: dts: imx7d-pico: describe Bluetooth controller
Date: Mon, 29 Jun 2026 15:52:29 -0400
Message-ID: <178276274275.2437081.9059083136920604553.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607131217.6497-1-lech.perczak@gmail.com>
References: <20260607131217.6497-1-lech.perczak@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:806:125::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: b62dd3c8-f4e7-4835-b6bf-08ded617f7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	BWePmMgN0M/GSdSfhzR5/x7BF+DWAXOEGgEJyHIdVuzZmaYNT/3fP3BqdOdm9CTHXvjGEUd+Jy7t+ydx+8+mYqQDgeMeUR4cR+kdmt4VkPUDausHOjKmzjIRxxAre//YZFwuUp+KztfQFcRX0V1qeAyYHKeB5nRcUOMM2Zj7c+eVhdck1o55N6tF+WJzAtRiyD/BqpJs+q71qWb2OSZSoP+0FcJ9jOh4dwY04v5khfttRkGSr9FH34/1G3a4Ze3806QOkHYFy/M8WHkoq1n9/53P0WzLVxSYuOwJAOCnK8247h9UaMq/A9P5sxAHYzSNfjBv6rgyY3j0zX0UD7GY+7dwvUYiO+D5ORAR3jSL2z/ICt6i/upOH1Gp+lure/8t1W9zmTk9jf9nFFGfJqnktvnOddKFLFsnPpxREQR9tzGbsaIGlAwhg4qQPb1M1yq/4CY+XwxjaYahdRz37SIQRcRRvgJKiZ3DzMLmRHIEkKupQuDfMtKVQvUl+ZCEtGh9/NFDW7wN/v/6kAlkzT6euhxMu7IEgqtL19GZadWd15jQVH01Qg3HeL7OHy+frbngnhd9trCxXy606BmItPPu/yHzjZ/HwtXOHF1uNDBvy/DWjxj9/dM7Gcm99N6T/2C62efO94Ls/QVw6RfEgQpT6pQZhqSVdHqG2fEUc7cr4iY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnVNOUEzTFpHelNxeThyLzBycmhvanJMQ0hObXlNajBDZkpFL1E1eVJ4NEZZ?=
 =?utf-8?B?K3RrVklJdEV4SWFlUXg3WGRqd2prQ1NNZG9hQzJ2MFhiZVhkZnZuNkJ2emNW?=
 =?utf-8?B?ak1vOHYzRk9ZVzdBU0pUZ2NJeFNudkl3UnBHeXFRd1phN1lQSTRyRzAvZ0p5?=
 =?utf-8?B?ZXp3dURaVGwxbnJOa08rbTJUWHc2TUlNM0d0aUxBQXlVKzFkNW14cGpmc09K?=
 =?utf-8?B?NnpGUXh4MDJ2VStaeGd4YllmcnRDTURGNWhVT0tELzRuS2RIMVE1eEpYY3BQ?=
 =?utf-8?B?bExycFdBSTBYbno3dWZVazJDOEJZdW0rOTZXcXUyRGJQNXFNNFNoRUxkNCtN?=
 =?utf-8?B?SUY4SDVjc0J5Ti93MVVINWk5SVUvaWQ3U2NSbGNrcWNSbitZY3NTWDNsSFdG?=
 =?utf-8?B?N3oyZld2cWZ3b2gvcC9nQVJxUkk5aENCVVN0R3JRT0Q2OW5MVklobm1kSGk3?=
 =?utf-8?B?a042Wjg1L3NTcG9vbThwMWVyNUJ3NHJ5NkNaWTJVZkdpY2ZtYVhEL1NydEM1?=
 =?utf-8?B?dm9YUU8yNFh1SGNRdGhpbVljUSt2b0ovSnBuTnBOVXRRT1hGRzVLYndmT2xQ?=
 =?utf-8?B?b0txcVdVQ3EreWtWNUU1WFNIK0x5Y3BiMlhua1JIdi82R2hRODk4TmFLS0xM?=
 =?utf-8?B?Rlp2TzZaaXNsWS9lbHNPZWxrVEdlNjVVbGtST1J4TXA3ZllyRTN2cGNiMUgr?=
 =?utf-8?B?RUdaL2dpTkdCaEJBZHRySk5WNEJJQUZvTk9mdlQreEZDSUlmdFEzWnY2YkZy?=
 =?utf-8?B?K3E3VU1VbE9PWDFjMDQ3ZlQ5TFIvMGxYNlM4UlNFbE94NWdIL0xSL0tvckdV?=
 =?utf-8?B?Z1BGNFBFY3ZyemV6TEJLekpESnVDUEo1eHpHNlZ1NGxKNjVqeTN3ZUkvOXYx?=
 =?utf-8?B?a0VvY20zMFI0eHRzK21wUXB3b2RiWlliRlFocC9FMm5zdDFpS2xNVmJsQ3R3?=
 =?utf-8?B?TzlveXB1cWpEY0Z4NFEwVTg5ZVAxdEw1cUNmVk44RnRVRjM5T2dPaEJLRjl6?=
 =?utf-8?B?dFJKaUFkbTdoTXVTOWNQUmh3Zkh2WVVVazNoaSt0bGZJalREdEt1eDNqMmZT?=
 =?utf-8?B?aGdweUJOV25DcHcvdVNzdThORVZ0L1NXRENqK0lub0U3ajl6UHJXZ25ZellX?=
 =?utf-8?B?eXpreUFnRGpVSEt1OGpSU3VPVk45ZTZWbHQyZzA4NWxVY2hsTmM2U01NOEJK?=
 =?utf-8?B?THN6QWVsTzR4bUNiMXBHSzVhSDFXT1lIdE5HVFpJZjJvZjVJWmV3MkJHTDV1?=
 =?utf-8?B?dXpscXJBWEVub0p6NlI5TWNYU3czcGtOY2dTQXRPaG0zUEFoLy9lb0sxZDN3?=
 =?utf-8?B?YXVuRGhNWWpFU2kzM2Zjbk1GS0xhcVlzM3dVZGdneWdFVEVySDM4a3hGaWJN?=
 =?utf-8?B?b1p6eWkvSkFtNkd3UmlhN3lzZXowQVRzSVFDQ0x0WWpESWRKQkc4ZTRwbFhy?=
 =?utf-8?B?UWJVWmo3c0pyMk1iWDczd2hySnBneCthYVFDMUZ3ZFh5K0FiTTFqRVllUXZ1?=
 =?utf-8?B?ZWkrbVp5M2xzcHNJNDkwdnhzT2xFL29zempiUElTdDNHdld5TTVMRG03UGFM?=
 =?utf-8?B?aldrTWdQbklYK1pnQWwrekpncjY1NllENnhFMGUzYzlLMlFNL1VQK2dBYndh?=
 =?utf-8?B?RE9ESlNIVlhURmk1OVY5MG91UTV1OTJYZ1poY3V6ZDNyaEVPVXdsL0xmdXhQ?=
 =?utf-8?B?VnpFWkxoS3NpS1JNUWlYOWZ3S1RJUWh3TDYwWjd2R3pGTno0aXJHeEZyRy9Q?=
 =?utf-8?B?ZEx3N1Y4V1hPTm5JdXEydVdqMmtFc0xVVHZyRUpISG9LRGVkakdVakpGTmFN?=
 =?utf-8?B?REtHOENTNEp2QjhibWw5U2FTcW1iS3lkZnE0eks3bGF1U0U2TWh6RnJYZjh5?=
 =?utf-8?B?MjliU1I1Vk83T3BvR3V3UVFKNGJrV1dEWEFyR0p1ck1iaUF5SUs0Q0c2cEgr?=
 =?utf-8?B?bGNSZXV2RDh6aWFnZURWVjkrSUJRempiTUV1TVJPZnZYOGp5SVdBeEdEV0Nn?=
 =?utf-8?B?OHZTbVZFY2Rjd1JYeCtUREVmeHU1Vzl1R2Q4ZnNrR01lU3VNNVBKUmp6cXU4?=
 =?utf-8?B?d3NwSFhhMS9CTHJGL2F6WHN2OWlsc1FVb3ZhVXF6bDdOTlJMQzVWYXlKYUJh?=
 =?utf-8?B?Mlh3M0QxNXFmVUVVbHdqZHNGUnhsc3MvcGRoOTRRRXFMKzZCcjhuYWJxSkRG?=
 =?utf-8?B?Umo3cTVSaS9vSHFWZU94cXA2UHdXWWVVQ0JZRGMzUmlJWTEyQXBGTXFHUVJL?=
 =?utf-8?B?WmtKdmhLMzdONXVtanF1YW9vVEJTVXgyYkxONTN6NXZZTUtpNnlkcW9QNnM1?=
 =?utf-8?B?a1luTzhpcEFXZHN4dlAxam0zbSt3emlRa3ZRSWpLK05FdkoyUGpQcUpEWDlU?=
 =?utf-8?Q?hCv/y6U0gjoYN9LxkpxolxQT+lPnINjMyOnIf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62dd3c8-f4e7-4835-b6bf-08ded617f7ee
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 19:52:36.6983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/lv8RCAAFGt0GefDvzKBFXNAZ387+1OxXP4LYnmnNmznxNZHO48wKXF2UWhC1hdeB8HPAbRs5SkUja6KfNBUUgD03FgVX9tioC4RTUJTLPTWoqoKCZuViM2DPxadBAk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7978

From: Frank Li <Frank.Li@nxp.com>


On Sun, 07 Jun 2026 15:12:17 +0200, Lech Perczak wrote:
> Ampak AP6335i Wi-Fi module atop i.MX7D Pico SoM also supports Bluetooth 4.1
> via UART attached to "serial6" port. Describe it, so the controller can
> probe automatically on boot.
> 
> This is based on "Pico i.MMX Development Kit for Android Things Hardware
> Manual" rev. B1 [1], Table 6 on page 12.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: imx7d-pico: describe Bluetooth controller
      commit: b9e9f549e9b65d85605fd3f7cb587d4df81e7d06

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
