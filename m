Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A465A2FD69E
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 18:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757260; cv=fail; b=lydpraAnvZGWQAotvuBP2Z44oTysGjUkcVo3EdH7ohuKgs5+a12YcERy+wQx/FgC+EPCKYdYSD6z4XT1Vkf/2A69EoOYbd5e099vHPWVq/Aw042CHaLF695ExmE70iMCE7dlzWBCfgGyfsBsEsX/xiXvJxOLx7+ehKtdeD2CzEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757260; c=relaxed/simple;
	bh=2ZRPrY+jX066aJs2G/a2LeyyIBUm+e0z3n1mBVY/BKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HKGDffPBddxMWSh5HOJYHTTtlOOi9PY6/F5ZDIvrqSTOnmMvwi60XT7azRJM6OhH+zRUrYTV/iAkGeeUU5mYT8IeUcdPXHUCmszWzEP1tirrQFE21waRfLA4gZ/ZAj1JOzoM3mbuzlq0wQDx71aOqjIQQFiyslnAwfMqX7X8nhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XI8+/E6J; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XI8+/E6J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7N6qrUSYKlDcWjksLHB901izFnyDkwa3ljM+tAqh4psor2be+Tq1f01XQ4wNNKFYKCnftuYZeDxXbeySLJaNJddrodX0plc6sHDGnqInQxv90wA6aMCuH+cN+WCALq/5XeTNA6wT1fimLGN1RxHO83xJoSnkyuL3ZDXbOJBRBSbSEAEuZ/nKmCgMEvKr3wt3Q0orYgXfReKQGEEejkJ4/rxjv4iHSAJ7XUPCKlgSXI2tQ8g1u7WVkCcH8VGC8Nmf6IFvS72Kwhp/TWV4+Tkpj6EDEZfUJcMcZqQ5Wd9wfP3XOFGLf+9R79pPJwHmGOUzxyiAGQH3Aee+e5JIkcrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0mPnK/u18TmhgjDwA2tvkK++eKoop66bxqn+/G8rXE=;
 b=OQ2En9I2Fu9Tq6ZJZkq8Cm8E0WqCXpA56mrCJAhd4GJIwM+k9CTc2fdq8ZCdfsMMN6/Gk1mF8eVkG7kNcV53Xoe+g4zz6XyhuFvrhwXjgrO0nAOSZv9SJiEeyVy35h47IvAeifbW0o3kJJnkxumJYZcEgUlYNpP8WkYqQ4G8NmF3NTzzS5qztXm2vGDxtfZlrDx/DeckVe9wn+/AluirCDIgKeIah3uPCRnLhoxyosvx+f3yatmBx/5YxOyOc5b/cNbko9QsjchkeLQNX+eEPPrPrjlTZODUTSMg/K43T/4WNr3j+HWY4wp6wQj8dfK1xeqCWqa7F/fUyU2wWnsB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0mPnK/u18TmhgjDwA2tvkK++eKoop66bxqn+/G8rXE=;
 b=XI8+/E6J8EHNEjhJiDJ5qW1jfWKF8tdE6Sgy4saqV07PufWed6u3mpye+1TwbmgZBKRPDeqx3A2DZ5PaPpnVFHMQ2Y0kq4BsLeyaDBk3lcxvl+NR9Jt5dtb+HVzaYxSqVwh/H8Ox+vaDlXIhS6YhDemMd30GiiJwW84kL0lyQpcK9q3ktj4Ome+nMDU3OkvF96k4LyCc+MSu+p0CjilqRnWNZb/1LRZp2K4ZX8euin2lqNdjznVDcI7dsieg1DAHN9s/Ff5sByXfWHsZ2AqfiErwFAQ2UI7AGpbun3Ym3nAkt+TPToj8KUhXBmkyZ+UNYZ4UEgzwAZ+yEdPFxYsweQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 18:20:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 18:20:50 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 0/2] arm64: dts: imx8mm-var-som-symphony: minor board updates
Date: Mon, 29 Jun 2026 14:20:42 -0400
Message-ID: <178275723289.2363090.6349594223758276729.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780527068.git.stefano.r@variscite.com>
References: <cover.1780527068.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:806:27::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10969:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5fccfd-c0bb-46ef-2fbb-08ded60b25ed
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|7416014|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 9DFLBPBcM63Dg/Ii86bbFRiQFuCivKQm2zkk8orokmTqWueuzZ3NPpK+aUGfjIv5oHOOTbO/W7Wt+INi2SWSyOlB3Aw8e7ET/z3feFQoed8B/7umQ3YrkGRedV/oRUYDl9xAcyOyWpWVYsBOGtWLQklGH6XhWkN6SjKOlwAZ8w+qcrPWg5JM1vUU5BhuQAlOLVw1tprYNA5BkjGlGIdC0ij5OEObkm0O1Wu08P8Me6DSHVHz2+TZwH0sXyIz+H6JE9k17F/piZmrL2bfN4Fd0YHHCQQ+jz/b5NL1i+3nM/samP3jZUu8QadkgGgVn7BL0ZRFMNINXqdPabT4Sn6XNisXRGVB7TyPYovZnRn/b+zcoTU5qDkGSDOMLQs8QFlQbN066qmV9ipK59De/ke+DNOOBS+BtO9ZA8UXehEIAvqFJrek97sm24U6eH69sb3DgCwTKwU+ujjBfSneESOCgnyyz6RWuFagL/cM8moUs82UwwKVtWR+fNAsTmaynFTX3JlERQVYgh17EVwlGlLiXbL4gRgMg6F8PZXw5OeyJ1LtaBxAXeQOc987sCiJOJmp2Gp7XvZ0i90MhU29nniHxk2Na+wCHx1pju+TA3NKQTSIs9nrvpwSLqwtfOhqyBv6XHVUUNT7g2NNEGhWnXH3IedkUXN9T56eLP52RTn1ERY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(7416014)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dmRQRXUzNlZJc2hmZTRtMVgzZjRYU3BERTVHQkRLQVFtNkFWYWNkbW1WVjRk?=
 =?utf-8?B?VSs2Tm1zZ1ZUTkdieDEwdDRCZ0hhd2QxamxlbzlLSjZvSkdNSHVPRit0TEdt?=
 =?utf-8?B?d2V0MHRTQWFWNGxqeWZYY3BGSVlpeWJsZHdRaE5JalliY2lqTmg0a2kyajhj?=
 =?utf-8?B?d2FydEZNVWhNRkN4TklBQi9uU0s5ZjdwN1I3eVZ5MVUxV1FxaHRDYUhnZ1hp?=
 =?utf-8?B?TTJieldnWXlGeVFUbnZCUE9laktqaWJIcHcrMU11MkwzbHNkMGIzdHR6Qkk5?=
 =?utf-8?B?ZTdjdnpZVzlkaTU2RVZvR3c4UGlLdHRyRlQ0NGlVTEdEL09FVFowc2xYN1VF?=
 =?utf-8?B?YW5HVTZXSzJXVGZWWCsvVi9UWXdUUEVJSVB5dWRrYWY4NksxalVtT0ZXb0wr?=
 =?utf-8?B?RXZtRm1XVFgvWUliZnoyZjJzNFp3RmE2L2FHbjkxUTRsWUxqblk2TUM4NnZV?=
 =?utf-8?B?K0plQXoyLzFIT25iSkFCOFIyVFROZ3FsdEtURkZ4YUZJQTBGM1QydHlqbXlO?=
 =?utf-8?B?RjFvVmNjN1dpbVo4UDVTUVJvWWJwb055QjZmbWRFRklTQldRSkc0WWphYmR2?=
 =?utf-8?B?Wm55UWV6L1hlOTVCMzd1YTBWR0FzSWQ5cGp4SzMwalVEdmdtcnAxQmY2cnM1?=
 =?utf-8?B?cDZDc1NWYjM0K3NQNW1rMmo4cGFkTTdiRUNWempGS1VSMCtuWEowUmFWMUdr?=
 =?utf-8?B?aGRWUkg3RGpaVnVaQkd1Q0UwR0dXTEZpUjV3ZnNYQlRaT2xkWEZHd2ZPOVpM?=
 =?utf-8?B?WmNxVTV4Vi9GWDhYSjFpSWR3bUF2TnAzUGlILzVpcUk4OHBtT2d1ams5VmpE?=
 =?utf-8?B?cll1V3RFeGVyaWhUTTJ5eElHRVNiL0lVMjNpOWFoQzBxclJIblRrTk1LRXZk?=
 =?utf-8?B?OHduZFd2eUdnQjd2WUg4RjhnWlFmQU9UV1Y5bHdJY3NvNTZSRU5QWTVockRX?=
 =?utf-8?B?M1FTbStJR1Rjemx1MVY5STNSRjJMY3E3R2ozVVUwTjN4d0E1aUVHTnkxbkkz?=
 =?utf-8?B?aHhKZXJ2c2Rad2FSenBqS2JwOURoT0tBcWFKRjNIY3BybmwrWllmTUNYcmNT?=
 =?utf-8?B?NW50eEdXL21rWHZNanBDVEttVW1IV05GMzZ2dklubll0aGFZRjM4MW1oNHNy?=
 =?utf-8?B?ZnZiODZzeHh3UWFQQ01tNThuSGI1WUV0WjdJRGl6eFZFZUxLdG5TTjNhVlBm?=
 =?utf-8?B?bFEwSzVXRVJVOXVaQ0RlNWFILzNoTzZVdGZqMWVKOUJQTzd5YlphdWdScHM0?=
 =?utf-8?B?SUUxb2RtNit1aUdXeERaWUVoRlVZa0FMbmQ5RTJmOXB5YVRzMngranlTRHBN?=
 =?utf-8?B?VDM4UGVQNml4dWV4KzAzbkhXc08wSjdmRVFxVUc1dlBMejNadVd2K0hCUGtT?=
 =?utf-8?B?S0Zta0RjWGRIQ0VhcldQQ0hER3ZHbk8xVWtoYnExcWllYjV5ZlJKbXVsYVNl?=
 =?utf-8?B?SGMrS0Z2b3VJT0ZkRFlhdGRucjcwR0lzU1RlUmw4OHpDNXQ4Y0ZJemdWdFhi?=
 =?utf-8?B?YU1FaDZFTm1CcFdNQkJnd3RzUy80NXpPVEdxd3NXa1h2dXpmQUlPOFNCU1E1?=
 =?utf-8?B?V3UrZzlsNDRoakVuZDRlcTJEdnhRUmNPalVJSXVGQjVaMUhmalZDSDBwNG51?=
 =?utf-8?B?SGFKNTkvdld1NlF6SmpKOG9nYXBnU0lwVTY0V21sZmltN3dyeTNBcW5BdnNi?=
 =?utf-8?B?QlBhaVVuWW5DQkhvUkx6MjQwMDU3eUF3blB2OWh0K2FaczdwUzBpZGtCdDdV?=
 =?utf-8?B?VHA5L3UwcG95WFNvL3pDTTNVL3VXdmZ0UmxCc0d3M0ZFL0svQVRBNFUvM1Rt?=
 =?utf-8?B?aElMY1dvcmUwL3c1SlE0eElxR0IxamFMTlpOWGNsK25jZC9FajJzcDFPenlr?=
 =?utf-8?B?aTRxSHhGRVppMkpudEIreWxvWnUveGJYeFh3Rk1jaEVFcDJsWlExYU9EcGN4?=
 =?utf-8?B?Vi9FcnV1YW1iRjBTdHowMllETWk3clF0ZjEwR0pFNXBRWE9LVk96R1ZzeXNq?=
 =?utf-8?B?S3ViUHZkSTNnbk81RGdYQWhwTUlNTzNGL1RoVnRsSldIZSs5VmtSTnliQStF?=
 =?utf-8?B?VDA3THFtZVRKbTRpRkVEQXlLcW80SUhvT2Ivb3IxeU1GaFl3aEhnb0RxNnhu?=
 =?utf-8?B?YXRKbFI0WlRKZUxJcmdUeUdIZnBuMVIyT0RTTGZhY2dBS2xoanNQRmpxeWJn?=
 =?utf-8?B?MUY5djkyby9tK3FhZFArV3JScS8vZkpleHJXMkpITW9EMnFoSVd3ZEQyYnUv?=
 =?utf-8?B?enJ5c2hxUDNaU3o0S0tPc2NRSzg3ZWRGMFJHSEJiQ0Z5aFF2S3dkdGhVWjZD?=
 =?utf-8?B?MGhscHg1SFQ5ZWdudjFlUjlidy9icHpiVmhEYnJJZmtNZ0pQVGs0Qm4zNDd3?=
 =?utf-8?Q?nNAUfDVxME+ryIrnfTGdXrlN1Ua3M+Iqoqmbd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5fccfd-c0bb-46ef-2fbb-08ded60b25ed
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 18:20:50.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQMN4zhDX1K2JqKML/UpxvGsPeEjXWU018jUXde1VA/SlXBtJs3CsyV3d6xZwWQ+ahvB1nnQZ+CIXuNtMChNXMiFpQjcnuq9rmPYPBabqiXIexSZdWJU8rhAZp4QtM/k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969

From: Frank Li <Frank.Li@nxp.com>


On Thu, 04 Jun 2026 00:53:58 +0200, Stefano Radaelli wrote:
> This series contains minor updates for the Variscite Symphony carrier
> board based on the current hardware configuration.
> 
> It updates the RGB_SEL handling and marks the relevant input devices as
> wakeup sources.
> 
> Stefano Radaelli (2):
>   arm64: dts: imx8mm-var-som-symphony: add wakeup sources
>   arm64: dts: imx8mm-var-som-symphony: keep RGB_SEL low
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: imx8mm-var-som-symphony: add wakeup sources
      commit: b376fc7db933785a5a89446ed0748ebb7709c1c6
[2/2] arm64: dts: imx8mm-var-som-symphony: keep RGB_SEL low
      commit: 7294b6214493075806a032227691781a2df94fc9

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
