Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2BF396D36
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 06:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195380; cv=fail; b=ucWjMlE5F8Rz1ghQHiX+Jd1wEKu/kdU9jtUAD3dVFJTU5NVyXp6Q0p2JFshjvVIJ200jcVz2aHvD3ZdTX0jQXZWWLXYoGRw2JY+TsJkA9tpQMAvT/tM//Fc5AUwWv4O7Wudr1yVF+gC82TinRdFuf273PAl1wl9uAnhWKzI1qIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195380; c=relaxed/simple;
	bh=Ebzxr3VI+r4CJFXrO3Rd5l2KCwLbjql/3iSo6ptsPOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nnDKgL+xk2X8grtMCZbaHvje4mQ9MQD4Ef3PPy13CSnf4f9qVwhZUdJpTJYfRBRkxdu0r4RwzWG48XKw73x8rTSMCfhFtXqEFhdj2qVuoU+VbRz+FKUGT9jR4u99vGs2W+191g/5Mb/K/t42yHhlIp4AF54K/JWM8oekmVmyj1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Qh0L4hKo; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Qh0L4hKo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaYydlWF6K+l31+leS83KOyfS2LL3MxlrGrQVH4gAQdFyi6T7HU5PnNr1iPjYRLbtPgt8NqEB1ssxTOdOEKRvokbdbCXd9HstRqnWzi3RvF4D83rQcHFPaPSM3TQ8BYfMNwAH71pJ2RrlALf7odYGZybZPoz4ozxX09L3+rI8pe3eCt84vgzMZyUaJy0pwm8fPAvMrmhgchKnxu6Q3scJMPpKADJEbRZ0E5Lw9bTXeMjz2LZ7Sn7NytRRKV2bf9PsTsDBKNoEpblG3zIs93PmMo8khIQpK0lDcsGMKfHvtmWG7o1Dw0xf7fxU7McZYGpMko0wxDNAUU3NjhsdrEMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8f884Hbbudq3sIDPYWOgHbNU5N3xqSy82fU8/zRbOg=;
 b=OI4Tcp75GQ/HsyRlzl037+ayngxYtKPekltSo8Y0L68hkTBHkK+Ra8eFhmIMltxNiWWMJMxXhUvq6AXdr/y6HIWsRgf1YSx1Jck8ull3qIOGOEkJN02jMh/QXjNe4Eb06s/GcQeuJoRtC5d1Dpmo1K+MMmbMazKzhd/3ME28GTMG4UjV8MPFVyjT5ouccV++Lc42rOzMtksTE5JLNE6xykJUsj0U1auz1FTTZDF84iGoFvRa9JoK158pJ/LmZ4hgBSfKIOdBsZGbP6Pft/J3/InRfrKzwJULjoKXRMctZIIa7YEO4eFrg+qb5PYtXvHIdC9Oq/v7A9c9AJhyCOLCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8f884Hbbudq3sIDPYWOgHbNU5N3xqSy82fU8/zRbOg=;
 b=Qh0L4hKodpQHqe6dBe308drA7IFT2EvHD5uEybLTUuY/cMvC9wfuHJSA5GnypOqePStMfugsDevPYgWt3wzA+myVgTf3Jsi3fOXIaH6SO2yoir66sh8E3njjYuWGGHs1TnNE/c11B1MSutweDfH6tygeS94wsE+48N78NoCm0wNoMBkvrkjN55F6NRZHif2+boXZOAyCLUs0GX5sApHxhbzS3WeuLc6Cc+d7YsxW1F06XvUv+duRhIAYUW8XSmW02RJpShi6SNXGKzINdytzDAnAmCm4GlQVlY6ErBEWof7EmAOiaT0sMG1BMZMOJjMz6RZHn7+ts2uFNvC8yh1Ikg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9300.eurprd04.prod.outlook.com (2603:10a6:10:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 06:16:14 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0139.009; Tue, 23 Jun 2026
 06:16:14 +0000
Date: Tue, 23 Jun 2026 14:19:33 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frank Li <Frank.li@oss.nxp.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
	Frieder Schrempf <frieder@fris.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] firmware: imx: ele: Add API functions for OCOTP fuse
 access
Message-ID: <ajoldWVz8UhZ/WoS@shlinux89>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-3-cb7f3698c3e6@kontron.de>
 <ajFtkysqxuLV8GgF@SMW015318>
 <cea74ed4-1003-419e-8da3-1c62b1ace726@kontron.de>
 <ajGsiglUUbDTIxTh@SMW015318>
 <9c1d34ec-0b96-471e-8b60-6b4c852878bf@kontron.de>
 <ajL7-OqjYuQHyZOI@SMW015318>
 <4f4cc156-7534-4f11-8a45-e4caf083c865@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f4cc156-7534-4f11-8a45-e4caf083c865@kontron.de>
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: a8eee12a-f659-46ca-f30b-08ded0eeeda1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|6133799003|3023799007|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	TRliRQG4sEieg63NuHMWhq9YY+cjK8fbRCJpU/tUGXSVGUooXOiTbpBe0J4CEtSFeAV4pcK7WQhkvryzRqRjAKzqLfgfIkoUdK0bpKvPsJ1CgxHgn4PzEEyaHI3nmKGhHFx+QU3LchV96W04wuyRi0jDs4GyODhXldkbz+fZRt2e8fISdNuxYW0jgQzcSdDPSG5D/9UMKAcDPX1n1XAdoZ9I4CIAYvUP1ByNIoM8IH6BYtd+LQ+kurd3Od4LsUlODFCYKvrYwz+cnd5V0TCNy0TnZ3iOmv8DmPCFFPlZD99gpDO4zvggY22F/Aa0XvwIXXSuqdQjD/ZAKf9wBg5dpjzo/BwuoTTt7I0E6RU2ezkIDMOeSha9bWM3Jj5I6BNWFbk6sZunpGIKTXg2fnzLbeu3+pyaYdxnahO6LnuI93VV0DMwX7LnTQdEmR3LYEl54isnwxsaRiXDFbSTZwY14ailvuF6Ez59hXwkxJwqdsr033thxCjCmuQYT88C+oBwEM5w6Edeg2Bkrqo5Fe5e9DzgBtowRVBUYyhj7xH/sEPi+cAl84mOtWc++jW25VwklAZ6IiNtOENKi1UuKvQH4UlwEPPRLLNY3T4ZsIy7I2zBePWYhjsAOuMe13GOp61zWf4fO6Y2lJceowL58b8++t23a04smUmnt2lcVZdZV4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ic/+spJw2PXr/OJQf3Wq14bD25/D69nuUYTcjkJkyI0zmXAuUFzEitKww9TF?=
 =?us-ascii?Q?UW3e5I945H9mX/MA6Buy5a+dFSh9jwT1otPE3OL1lkkfkZCVKLy48YOhqjwB?=
 =?us-ascii?Q?ucuqkOYCZXWCwUPf36Y198SiVFJUoX8uuO9XX1QXuIvJNFwWeflxikzvriev?=
 =?us-ascii?Q?Ih5PWq8L267Mu3TG3VLi4Jl+bg+y3/bcGz84Y++PgwzAvswPPflr4h/V87EL?=
 =?us-ascii?Q?rML4ANMt47402PKGNZSr97ZpamRrKgxYC42cEcxr3/uJ9LF2r6aaF634Ds7H?=
 =?us-ascii?Q?KaoJWhSUTu9N33D8H7DBZxi4gk5c9/5I6Glu0Oly+gsBOqH9FjZEWasx/ykr?=
 =?us-ascii?Q?IhB7yuIvCnBTtR2hZsZ/Ja34fUVBXejkeFTzdajhnzbn4q18FqC/K9r+xwCT?=
 =?us-ascii?Q?Ot2mVNRyQLjFTFpsjBQ0UgYfcnVXCiKJdNIxNiqxZnMw/oZmGn8rLQ7joRrE?=
 =?us-ascii?Q?w6FLKntIX4v+szg3DNp1WDo/JJSKcaVT+J7jkzXTLSuy0/ng/ZdGH10JExHy?=
 =?us-ascii?Q?+29LM1uZ/0AAq0Rstvk52BTHx7KEpsLClzTNrAc3GgFldtV1b6X6jB+ja7/C?=
 =?us-ascii?Q?6lSHkM6FGMwFjs/UqOGovWygK+saq/H/UmSgCFnzYOT9J2Gc5YmVIPG8hCPC?=
 =?us-ascii?Q?xPWu5bDBByXiYXIlBAZLg19dPsFfkecD3mlj6VReES6UqDAvqLP4nmi7h2ZW?=
 =?us-ascii?Q?5v0Mcypk88wvIWVTpENsiRCgcEjPnVTJEn/bAuH+5jPh7P8/j9Cl9sBF2np8?=
 =?us-ascii?Q?KzIaGExhBu9Ezdv1R30QnOXFlnc4K3CNQKOmThLUzerZ9/yF/zcu0aB6sDGF?=
 =?us-ascii?Q?4xx1CYtvkemjEaG8As9DHXCe9Cry9XJ6rwG+sHXXN6QMQG3zIaGa/Z8If2f8?=
 =?us-ascii?Q?v2zxEvtJykHfwqCXdRxsE1iGvjknmO/ireTYxRlZrqJRK/BnNH/yzzwI6fZx?=
 =?us-ascii?Q?0zoYpkpR/rGBZijmR/ecIYgoiyPgh81ZjPkm5yCTp78FZtFzt4VDs43FlvAo?=
 =?us-ascii?Q?iDyyex73WxseLVGigTbouu/l+Z87ah3Jm+H9j2QR/65LPVHwNPsOM4ZfrtI7?=
 =?us-ascii?Q?3mpFqqj2JobXUkodThwsTz9xLaH5X7ei2c3aFpCMN5SSkTrL3/VD40uABK/V?=
 =?us-ascii?Q?g+LN0zg12QpbvuApAh+NhmbG4eiHHedOlkU8oiZ1nVx9zhfCL7F6bfg9+OLA?=
 =?us-ascii?Q?0c0d36yVKcdGHoCdZ5u+mfOWa+3xj9bAEkQEmh49ZlvYNWkoOqO/vhk8PivN?=
 =?us-ascii?Q?wASHeNe80NeoAXOD77huR+5TBZNn2lzPuWwQeNt4ga4H6ZpIAty/U+oXpbqK?=
 =?us-ascii?Q?BFwlvlCNoUj0bz+jX/f12qFUnzoO008rj7LFBIIlpFAFp1IgzPsFsYYDJhNh?=
 =?us-ascii?Q?Vey5L+RQV/WeNj+Sx89mUlC+2LvW9HHqsRSIIhajulw91FS3Hi5r1+aplfUQ?=
 =?us-ascii?Q?HlOXBtVA/M6QTg7PR4kyRoN/qNYdt6qtASRjD5nnPGpds0TbxYxAIzAU1zcT?=
 =?us-ascii?Q?+Pz5CYWMykqIZT9YTyq47szIa2FEk+tmmokf8ITqbSQTSvrMYTZq7DjAzmcu?=
 =?us-ascii?Q?FDEbnKdx5AA+Cq9aXhDq5hr/H+JOl8miHVSZrzajzKBqBqE6lCqsXh4MwWjj?=
 =?us-ascii?Q?AHwAhGO0dERSExj5Z6hwD5YtTiM0r9onI+sIEGvNWTCT9MTDlHwisvo0ju5Z?=
 =?us-ascii?Q?AVIxp+Hpq3wapCsSj8AV3xykxvL19s6sfjazBtvaohieiwb+yLiBbI3/hbIw?=
 =?us-ascii?Q?1BBozmTT13Dq/Xdst/imlLHucgl4PSL+MDsZZHXKUp7zVb+smLu3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8eee12a-f659-46ca-f30b-08ded0eeeda1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 06:16:14.4079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZ8tevQsrINmkrToVDWw/l+1Kdn4vqAN+/Z8Guf50qOQuIjP6YB4+KwtcVC3PMa6RiG3LT91HZs8LSg8cMKtEwlRjsZpagUGkflXZvu4nBQXLQ9W6bYBVsexQW8Pf0nl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9300

On Thu, Jun 18, 2026 at 07:52:16AM +0200, Frieder Schrempf wrote:
>On 17.06.26 21:56, Frank Li wrote:
>> On Wed, Jun 17, 2026 at 08:54:35AM +0200, Frieder Schrempf wrote:
>>> On 16.06.26 22:05, Frank Li wrote:
>>>> On Tue, Jun 16, 2026 at 07:59:54PM +0200, Frieder Schrempf wrote:
>>>>> On 16.06.26 17:36, Frank Li wrote:
>>>>>> On Tue, Jun 16, 2026 at 01:52:18PM +0200, Frieder Schrempf wrote:
>>>>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>>>>
>>>>>>> The ELE S400 API provides read and write access to the OCOTP fuse
>>>>>>> registers. This adds the necessary API functions imx_se_read_fuse()
>>>>>>> and imx_se_write_fuse() to be used by other drivers such as the
>>>>>>> OCOTP S400 NVMEM driver.
>>>>>>>
>>>>>>> This is ported from the downstream vendor kernel.
>>>>>>>
>>>>>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>>>> ---
>>>>>>>  drivers/firmware/imx/ele_base_msg.c | 122 ++++++++++++++++++++++++++++++++++++
>>>>>>>  drivers/firmware/imx/ele_base_msg.h |   6 ++
>>>>>>>  include/linux/firmware/imx/se_api.h |   3 +
>>>>>>>  3 files changed, 131 insertions(+)
>>>>>>>
>>>>>> ...
>>>>>>> +++ b/include/linux/firmware/imx/se_api.h
>>>>>>> @@ -11,4 +11,7 @@
>>>>>>>  #define SOC_ID_OF_IMX8ULP		0x084d
>>>>>>>  #define SOC_ID_OF_IMX93			0x9300
>>>>>>>
>>>>>>> +int imx_se_read_fuse(void *se_if_data, uint16_t fuse_id, u32 *value);
>>>>>>> +int imx_se_write_fuse(void *se_if_data, uint16_t fuse_id, u32 value);
>>>>>>> +
>>>>>>
>>>>>> This API should implement in fuse drivers. Other consume should use standard
>>>>>> fuse API to get value. If put here, it may bypass fuse driver.
>>>>>
>>>>> The reason this is here, is the downstream implementation in linux-imx
>>>>> and the current code organization.
>>>>
>>>> Downstream may not good enough, sometime, it is quick solution.
>>>
>>> Ok, but the code structure and API design has been upstreamed like this
>>> and the refactoring could have been done before, if downstream is known
>>> to not be well organized.
>>>
>>>>
>>>>> I thought there is some good reason
>>>>> to have shared functions and it looks like Pankaj structured it like
>>>>> this so all API functions live in ele_base_msg.c and the internal
>>>>> structs and defines in ele_base_msg.h and se_ctrl.h are not exposed to
>>>>> other drivers.
>>>>>
>>>>> If I would move this into imx-ocotp-ele.c, then I would also need to
>>>>> change how the code is organized and make the internal se_api functions
>>>>> exposed to other drivers. I don't know if that is really a good idea.
>>>>>
>>>>> I get your point but it looks like this contradicts the intention of
>>>>> having a clean API in the firmware driver.
>>>>
>>>> You can refer imx-ocotp-scu.c, structure should be similar, only difference
>>>> is that lower transfer APIs.
>>> Ok, this would mean that I expose the generic SE functions and structs
>>> required for fuse handling. In practice, I would remove
>>> imx_se_read_fuse() and imx_se_write_fuse() from se_api.h and instead add
>>> the following:
>>>
>>> struct se_msg_hdr { ... };
>>> struct se_api_msg { ... };
>>> struct se_if_priv;
>>> se_fill_cmd_msg_hdr( ... );
>>> se_msg_send_rcv( ... );
>>> se_val_rsp_hdr_n_status( ... );
>>>
>>> Then I would export the functions in ele_common.c and put the fuse
>>> read/write functions in the NVMEM driver.
>>>
>>> Is that what you want me to do?
>> 
>> Yes, Idealy, it should be children device under ele, ELE like a bus, which
>> previous lower level data transfer, ocotp should be base on top then it.
>> like spi/i2c, which provide low level data transfer.
>
>Ok, please also see the discussion with Krzysztof on the bindings patch.
>The problem is that this driver uses both, MMIO and firmware interface.
>Therefore putting a child node in the ELE device node is probably not
>correct, either!?
>
>In general I think it's a good idea as the fuses actually live inside
>the ELE block so this would properly describe the hardware, but again
>this would create a hard dependency on the closed source ELE firmware
>which I don't like that much.

The current ele driver does not export API for others to fill the structure
as i.MX8 imx_scu_call_rpc(). Actually I agree with Frank's idea regarding
ELE firmware provides low level data transfer, such as ELE firmware driver
providing an API such as imx_se_call_rpc() or imx_ele_call_rpc().

Regards
Peng
