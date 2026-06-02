Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B309336C9ED
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780372391; cv=fail; b=FlHg/ecZo00mNSRZiBE3pecw2vFZoF4xCkbhmq0fVFQxOpFE0GoiaOSYxHj59tCvTEsIGpXiu0UGNJJzzF66NEBxltC9OOCGhBbRMvrkdJow0BdEli6sGUvmXgDjqUksznJ+nOGfuykr3IvHgUBOV2VciKNSeXxu7PJbUB4bjQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780372391; c=relaxed/simple;
	bh=fSdVicTGEWNiaxQavPWxIFsAzJXhi+M4lyr+HxjAHfE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OvhxcM+rYgYtfd8PqA/+mgGGnFRasWkvdK1zki8MaoX1knVw/fEvHf76piYvQ+6trca7WqTxKIbwMNYDgJguKt0UOkgsIAqBjFMgszpXFf1CGIuEunY6h2HIOPqFWApPoW++dYVNhEEi+0CFKHztz5VghBw62cT0RiLHEgJj5+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X9TMboZw; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X9TMboZw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYi1uAoe1bKD7sPAVVMeIM1dBXFJ518MbjYMyvmvBErhQJm487vPbBQDDAXJ3aMB7p3I/SW7g19IjfVsnrGXPSB8LmNtReAxsGJcJfJMruHJi7kNgYSHYTGxBYPiI/9ZbApBNA35V7hbe+lh8RYI+OcDIpjJGg+a1ZcmT9QB69ynB1ZR9IZ63bCBRlp87vufw0iECapgC0ugsDO2jEh5A6kygdccHhjSk8mTNpQCjO4rCzi6svI0dbhmAW+FeMSU6WK5L+ZNNkMnYW3i2IWwGeruKft1vMu+6w47Vr9EJNe2NPfRjkNLEv+6BTtB5jYu320Ux2rllJMG79OCMRO3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jd1xLPH7fGL2n9HtcOdHne6UzjM4ZQwxBD81p7Hpmr4=;
 b=fmRXlHSKty0+x7xjmZ9I0FAsD5fUEJBjs0PDDuZL+m2L6qRellb3q2UqQYZfBccKTgJdSk2iLrf7mLv5qhblC4RBBGpYsG7sm4B8Qz+KvI2zjW/CI+wSSu0y5yAGM5I4r6kVi3pdHDr1b2xVkVUnxOWpk/Ivp68hmghle6hq67hg5xFNn2Lwp2QXdi1T9ab5055Z+/nfHo4BA0Gr2Ir0OIbeqGgeG4d0Wo2YfPS/67+OLLavOYSZv9MwrKxwCIFPhuu3/M8OfrHjIxdDjQkhbkrbC5NzfLherMOvM/BxECiOQvlVtEqVt8iBdG5TzT644E/LkXJneE087i2/ykQ4tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd1xLPH7fGL2n9HtcOdHne6UzjM4ZQwxBD81p7Hpmr4=;
 b=X9TMboZwdn20MlDqbhXmlnLPXwBD0iJKRONFFBHKDUURsngNqTvFfxEcsjVKtmdNQmvOXlpXoar3nBMdGnzKE+qQQW5XQejCXMBsnZxWWmM6H2EtDAoMEx7Ixp28zeaT6efb7XqkvtDzSKDjGNqJTkAHAM5rGZfhVZdZ4rr11Xyp3mG3sGvJ59R2aQpLk/IJywR95ZpTR6b2EBxTQ734/DFrDJCnkxNilIO5gQX800J7/Ow5Aw2hOg4/ShBpOocG7iavyTvl75mfXuEXj3DjZ+GmzSPmpqyIojvpJOnvXyT+nsF8MvCa/1UCfTwWY5/Df2dmUYWGGfLo3Oo9PpKFrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by VE1PR04MB7343.eurprd04.prod.outlook.com (2603:10a6:800:1a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:53:01 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%6]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:53:00 +0000
Message-ID: <67b71676-8e78-44f4-ac84-9ae812a2a729@oss.nxp.com>
Date: Tue, 2 Jun 2026 11:52:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add NXP FRDM-IMX95-PRO board support
To: Frank Li <Frank.li@nxp.com>, Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, xinyu.chen@nxp.com,
 justin.jiang@nxp.com, Daniel Baluta <daniel.baluta@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260518-imx95_frdm_pro-v4-0-975346555a9b@nxp.com>
 <ah26BWPDtZrirG_4@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
In-Reply-To: <ah26BWPDtZrirG_4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|VE1PR04MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d4b09a-c155-4abe-a7ad-08dec05a706e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|7416014|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	3u53mgLTJoFG63LsPPQar/kFi89ZIEQbKhBwaGRCWGe7EDGefblSBSOFaDWR/jd4ilvtOn3C6G7pZVuuara9XRGal/KS4sYMZ3ceFvuHsBsxn2tV6ZaxW3NRThlTxo4JXfq1AukDIip+4Ka0qbSyM/oBw3SKQ30bcnvaUwP7S4PTAHfexp0Y6NLriuBuo7DXkwAprhgCv8NF76O4mxT8OxD1i9xfPIV4uuSeQQEWmUDB/wH918Y/b0UG98lMMJ2+5vpQ19nl3le1+6lTDDAZvZ/G9E0vpBjXiX6K1R25UBJOPl6ivqbP0/1/8QtFuF+4mih8hPoBg9HkQjvz57KAKZxfFJBoI9yAVpAOyThwjimwYDLgqwvD81n8v3Zj6j//WL57hPo91+7C4IKBHilV5dSXiIUWSvsik6trm6ZzeFd1oqs3zPvcc7QGmeM8AEG6AZD5yW930QdFrOtKpH4haTEDD/fXTW4RC6lYSWf/mhQLR9DWYGD9xQV1iNE93eV2XgeHaJI/rwMJkizEGMIFM1XqDGrAgr7+5dbCsmv9OGxq/5hAtsb1u0n3tPuz0GpdkrNV8u98kHiaXPRMrZtaZvq7vpl0pvpV7bS/AGZkPQQ4rujA/00Ww33GFEBxVyUlrvdesb78Go7ks1tPIoVkM83hsmQKhmVFOvLuG/sjysp9xRU26n57hkIT9DN+4Hd6+hKpb+e50FhnVAQwx7q+QA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(7416014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGkveWEyMG13ZkZiQitNeXFRWVhXSXJESWt4Ym8wOTdjeGNBZlpsSHM2VDc5?=
 =?utf-8?B?aGtlR3NnZzAxakVSWmpEbWlLRUFualFHeEt3YVNlSnBZUmJGNGxzSFFKa3Ji?=
 =?utf-8?B?am9jcWoxUzNPTjljQmJlb09SOWp4RkpxL21JUEZ4UDJyMGRXVGxQMmh6Rnpn?=
 =?utf-8?B?YnAveHltdEJpb25ZQjhPblZ2eXRWRC9lU085OHkzVzJGNWIxT3pIM3lGWU13?=
 =?utf-8?B?N0F4cHQvZ3hCMnFUWlZ1L0FOUXl6aDVjU0loMmR0UXUzYlV4TS9xRlk2N05L?=
 =?utf-8?B?THdOaTJ4SVdZRkIwNzZiRUdNYjZCSG5Sd20xTmg4NUdsaVhLMDlLQXZ2dGl3?=
 =?utf-8?B?MnlqeFZ1NVFvYnViVG5UUThOS0VtWFFzSTNvbTNPQk5kaFQ2di9mSGpMOEtu?=
 =?utf-8?B?OFJxYkQvK2gyTFJVcExEdkZPRTZjdlJZY3d4bFZqK2FqMFZLVThqZ3FpYjda?=
 =?utf-8?B?ejBzMHVwSnFVZUhTeisxeVJyVld5S0hTeHoyY0JWQ1QyaWdoeS9mR1JoWXA3?=
 =?utf-8?B?Ti9sU2hXem9pRWJRZHZDR0NHUzlxLzd2V0RsTnRmZmRWQTJIYmNoQzc3Y3N6?=
 =?utf-8?B?WXZxZFNrTnlLTmRneWwzVG0wNlY5WDY2QWEweEY3cUJYSDdHODVtMW9WOWtt?=
 =?utf-8?B?c2llOWhueTEzanZ4S1BkNDNPcWs5MFRYb3dDUnI1TXgwUGtyeXNUSkNEQTAv?=
 =?utf-8?B?NkEweVFFVG9LQnM4ZXNBd28xMmM1UEQ1SGFYQWpKRFhDZ05BZEFJb2JibUN1?=
 =?utf-8?B?ajkza0RFZ1RDaURxRENJQ3JGUUNuTWQ4NVBjdUtUVTFSbCtjWC9pMkt4Z3cz?=
 =?utf-8?B?QUtSb0pyUGdHNU1BeURRZVp5dFdLN1pEVGErNDk3SXErcUEvbUloK2wydUJy?=
 =?utf-8?B?RWFPNEdCdndaVlhOQ0I5YXVkM080ZnpoNUVpRkRPTkV4K1FwQWtMTUhWV3lP?=
 =?utf-8?B?NnBRSzd2UklWQWxLaGhHUVVvOEJCd25zRG9WZnJRTVExVHpuZmZ0U2ZkZ2R0?=
 =?utf-8?B?ZXhlSDliTmlkNEdIV3BSSUhrVGZxSUs3SWt1VXFFS040aFpkTnFidm5zKzVP?=
 =?utf-8?B?WXMvREpha1JNWTRobmRUSTM5SGFPQm1EU0ZEOVlua0M4Qm42TE1WUmROb1I2?=
 =?utf-8?B?WHlld2g0cFNUMDA3K0F2SXRoZTAwRFo3a0tMVGkvelZhZkxyeERpZXdOYWtU?=
 =?utf-8?B?MlFscnZ0TjNCWmJuNVdNbEN5NlFsM0Z6ZDNTZENCcEJHbzViTjJwczN1dlZ4?=
 =?utf-8?B?VFM1c0FKQjNTak8wY2NGSVNUNVd5UTJ3bWxIM2cxRnZxcEx0ZlJzTWovbVJL?=
 =?utf-8?B?bDJiMHBGSVBqd2VEK2hiL3ZFWEs5d0FuVUxvSzYvN3Y1eVBIWld5c3RqTk5p?=
 =?utf-8?B?SzZzTzV1VExzUTAxZzBUUVUzVkxOT0dEenVSREpOd0pycEg1WHNpL3FGMVdQ?=
 =?utf-8?B?RU8raGdCU3NrdHFidjNCRWJVeWhTazVSV2V3eEUzTllpNG9vSTRndEVRYzZD?=
 =?utf-8?B?L0l0SWgyVkpSU05YUGlQeXYwT1RxeHcyNldUN1JCcTFPL3c4cEVzVGgzZXRy?=
 =?utf-8?B?OXBFaFRsK2FLdjlsSDVsQmhtLzQwQ3dwU0RuWHI3MjFINGxFcGduUTRadTFZ?=
 =?utf-8?B?U2I0d05vVG1zMWw5VDBUNFFvUk84dVNsRE92SSt6b0xnaU9LK3JrZW9nSTBM?=
 =?utf-8?B?aEhOMUlPQ21CcEVVelk1YzhOVEZnei9QTHI1L1BDNjNxbG1EcXR6amZrdWxz?=
 =?utf-8?B?L3JYa0dWWnkreFd2V0IwMUo4RmwvS2FKWWg1S1RhZitpc2dTTTZjYWkxdXR3?=
 =?utf-8?B?OWJmaTlkcVladGpKeEJ3L3kvd1BHU0tGamZETVVrL0dObnBETXBhVjdEV3A0?=
 =?utf-8?B?MGpoQ1FGdUc1clk1b1FqV09MbzB0NE9PbDdaMy9NQ0s2Ynd2bERTZGJsOEcy?=
 =?utf-8?B?eGp4UksrUzV0QklhSENkWXg2T0JZY3ZVVGdJaDVlVkZBWThTVlNuZWFnbjk2?=
 =?utf-8?B?MjR6M2FsekxWZUlRK0V5elR0MnVCK2NVL0VSbGtPblVDaDByU0J6bXp4ci9P?=
 =?utf-8?B?N1lSM2wxcFZFeXVjK3Q4bDc2Q0Z3MXFoYlJjNm5kYzIxMkxmc3JMd0dVUE00?=
 =?utf-8?B?eDBzS244Q3R3ZjNoVVczQnBYc1d3VXRmeGpQbFliRDd4TUNXVndLa1pXNjRQ?=
 =?utf-8?B?QXlrZ0FkV29VajdDTEVXbHh4aWM5NlVWd0V2c3krZk05VCswSlNoRHA0bjdh?=
 =?utf-8?B?YXIza1BNQ3BmbDg5cm5iekhZUkVRM3RqUkdPZmgxWG94YUphcmRHc01zU1Rr?=
 =?utf-8?B?Wk9xdXJkZCtpU2M4WmNPUEMySGp1NDdJaUhHOGVHdHpnQ3h4Mjd4UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d4b09a-c155-4abe-a7ad-08dec05a706e
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:53:00.7986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eo4o30rD7TtQLcZUNAd/eIZSNHbWEJ6wY6xyQPpstqE8/PF3aXbjnsA/fklh+DUQ00fLiznSpYQVuaGMPewTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7343

On 6/2/2026 12:57 AM, Frank Li wrote:
> On Mon, May 18, 2026 at 11:58:18AM +0900, Joseph Guo wrote:
>> This patchset add Devicetree support for NXP FRDM-IMX95-PRO
>> development board based on i.MX95 19x19 SoC.
>>
>> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
>> ---
>> Changes in v4:
>> - Correct underscores in node names
>> - Correct 'silent-gpio' of can_phy to GPIO_ACTIVE_HIGH
>> - Fix typo in pinctrl_pcal6416
>> - Link to v3: https://lore.kernel.org/r/20260509-imx95_frdm_pro-v3-0-96290b471396@nxp.com
>>
>> Changes in v3:
>> - Change status of CAN1 to reserved
>> - Remove unused pinctrl
>> - Explain difference with i.MX95 15x15 FRDM in message
>> - Link to v2: https://lore.kernel.org/r/20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com
>>
>> Changes in v2:
>> - Run dt-format to reformat the node order
>> - Change compatible of mqs to audio-graph-card2
>> - Add imx95-19x19-frdm-pro in Makefile
>> - Link to v1: https://lore.kernel.org/r/20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com
>>
>> ---
>> Joseph Guo (2):
>>       dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO board
>>       arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts
>>
>>  Documentation/devicetree/bindings/arm/fsl.yaml     |    1 +
>>  arch/arm64/boot/dts/freescale/Makefile             |    1 +
>>  .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    | 1021 ++++++++++++++++++++
>>  3 files changed, 1023 insertions(+)
>> ---
>> base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8

Hi Frank,

My patchset is based on linux-next.
V5 rebase on imx/dt64 has been sent.

Regards,
Joseph
> 
> where this commit hash? I can't apply whole patch and can't find this
> commit.
> 
> Can you rebase to https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=imx/dt64
> 
> Frank
> 
>> change-id: 20260311-imx95_frdm_pro-7a8d03b50982
>>
>> Best regards,
>> --
>> Joseph Guo <qijian.guo@nxp.com>
>>
