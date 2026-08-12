Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010000.outbound.protection.outlook.com [52.101.69.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8F533DEE6
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542491; cv=fail; b=PLQwpx5zr7+RQpV3yB85Ge7DWyvInAGtALFj/FVn0p7mFG77c0Imwr0aRW4aRFbHzyBSIKPXA67spbFNhaCYi9PA/chG2IGRZyHEyqHAPR4IucHQXDazkl5Lps3EuJqi6EBM4GJseB8E3HSLqbCtaGHe0EDw5iyytAjW8QtHPmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542491; c=relaxed/simple;
	bh=smvDnx1mILHq9Lx99HsLDFypQHjEpx1OBEuKXGHzyEw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UknjcnDaeYKuL5fdrB1nHgfmgUEyru5QqPjRQeH9DI8OUpj4MVrfBgmKqsBBvc6tkjJ7PzRjkhbmYzPjC4d5+IojXbwQlsAUVoT1vJI9+DRJMtMDHUXN5e83sfLlGIsnwdYI1vKgQrHHT8JeuglhJ/TrkUrQ6bicUR5+nf+rhLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P1U8Ql44; arc=fail smtp.client-ip=52.101.69.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P1U8Ql44"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Utjb1jHoMtcTeSDhgRKqys69k8kljT3faKm3TW5RI4KMjj4M54rKzIttiLpSyCmVyoMUgL/NGY3mJNz9aWK5xZLmso3PYi3o2mObVea+8qOeMaCy7qyKWQeK1ZHpmdPmFem3WX1xQBSCOz9lj1KM82qw+M9Ynzn59OeTY4JRguzlDyn86VkYS0NAy12pVDiROV6yzLAlSCnZuL16AfnKYBnUouv775zPqFk8vdFtEvBoupmGJ1ovSmSl+3gIxmWNAe0kho2kVAL1GWoC5Tot8kWX0oquZIynj1b7SPBLfC16K6ps+dLHZHddZ5plBcN0KViU0btYniH93Eg4bMIDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRGYRnn4G6Xd46W0JiSdcI04D+BrCSPSG17YMGfRxhM=;
 b=LV51HNpQ8bfnDWnSYxergiMEq7jj3km1GDyBKEsecfMbp8cQ6kU7xkxkGrLksmEhGVRgewfP7kQhGKHCjqIiql6WBhW+ycLtj6wTrksmORXBVxA8CEN7UglIHT4SBP6OR7r+MK1P2bFhmReCMbKOYSNDD51OuIxNudvkxdasgU3Nsi4krME42nuNRVxX476i142TJsjT1K2PSOGkq6L0Rhmerreo3MwgGj/o5MKU7tKTuMi5yMytox9fXOy0ls6nNZhVN3ZyCVDpHi2qOMwVJjAt2K9Ck1HbMn7WoVxx13erBMvkCjF5CwunquI5BF/eyvdzJzgSyM9hZC6iDM4sEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRGYRnn4G6Xd46W0JiSdcI04D+BrCSPSG17YMGfRxhM=;
 b=P1U8Ql44QnUB70QAGUIwn7npJURSTgmPHT4JuFEjf5la0xfAsHYWFGGzYkw9PVtW8xjBCzSEpjlBeKud+8sHvle1OJ2XPFrOc691NTj41C54t/fYAW35dnz2WKfIggMQbe+YF6wTAKS6lULXQJHx5oMXYsDN6cA3wjQmiWEj8qqkw5RIW9pgPufS6+2N0bS5VQzCUWEzPRaHSF7DOQng4YGRjtVOHSVSsPwaCflOIigiG3oEeS0fncNqsIL6ExtO7Q7zKUT7lWW3LIiOpvnivjWQDwnRhBHKZqxUuPf9mYQ6IfJrtRchBAZVvvc6Vs5pedCZKW41n/iS0SZgmZ0FHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GVXPR04MB10234.eurprd04.prod.outlook.com (2603:10a6:150:1c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 13:48:05 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 13:48:05 +0000
Message-ID: <30ffea19-e2d6-401c-ad42-54a2de2f52ec@oss.nxp.com>
Date: Wed, 12 Aug 2026 16:51:36 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: mxs-sgtl5000: Drop redundant probe error
 messages
To: phucduc.bui@gmail.com, Frank Li <Frank.Li@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
 <20260812101418.37966-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260812101418.37966-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0034.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::12) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GVXPR04MB10234:EE_
X-MS-Office365-Filtering-Correlation-Id: e77a1c39-074f-4234-417d-08def8785604
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|7416014|376014|56012099006|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Whh5MlTwaI0wgwTt1xYcF0n3UmxSOYX/YYBSJJMVGXEFxII2y2JWR86TkhL7pbcGMPHvUXSJS+S/iZohMtYXPqUvVqdcy02FG8l0RVudRHZBXAKVpNiPHCnvzlXOo04erz4ctut9sVgvt4B6h3X2KBCTW54hvyr+OnzpXdcAj6q8jcKxf6TSfUaoSLen9UnkOPAafnK7g35weOoHnKHl5PmCSWxslM0k9OFkhlbkg+5WkWgg3t/kQ2OYyC1DyjjIg3GtCUQKhzObKmWY6DRIX/eEincO84klEX+nqksj0UmqzDvCsTwc0Gnq0LD8FVhn6bzXAsNeHnC1eWgK5ucCw7BRp768p+DHh6VcJcLzz4AEoj2/NmLjNOzd5Rbx2BTv9fgKwNpZhrGewv5j80mBdloS7ddN8p13TK1MPOFBC8wP+3qFiBo6NLcjV71BnISAxIBbbAhybIWClBgncyJVaF1r+ir1bw60bKrw/nRf6IJPzscFF9A5DWkcD6bkoXvEtpXCed7bGIamync6Rn6C9UorKHQsXFxP8L2jD9a5mz83am3a/HD+k4K9ACYp4YK0L+aw+3US1olXBw/tqQJn9IHvIqrRq2BIh7L1Llqwd7o3jTN00b9JBRNdDUoUhsrvIFl5kk9SaLvG2xUyTy46CE7HQS6ZvDkuDTzFUrmuqVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(7416014)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEl2Q3pmbmVCRnNGVHJ2d1VMNWNSMTk3a1hCS0thR2t5OEVmYk8rQStvNi9F?=
 =?utf-8?B?ZTYwMVNpcmdmNkxSN1d0RllZNzAxRmViSmw4eVg0OVNSQmNzQzJiQm84eHVx?=
 =?utf-8?B?MTFGWC9zSEw4aGwrYXZWQjdpbjZBMDhZU1M4eU5CM1BZMVdLVi9qajBiNEdu?=
 =?utf-8?B?UDhCZWdjV3BabFlYYUNhNU9VdEZkekxjTG5MWUNmT0tKSTRZbGlwaWliMFVq?=
 =?utf-8?B?T3RHcklyN0tuZ0tMZDFwK1Y1NS9TZ2tRalRZREhseG5LSHF6dUZPdjRCbW9y?=
 =?utf-8?B?cGxOZkVqZTJEQkhDTW12RjRZdHh6d2dqSFIwakp6WG0xQ2JFejdiaGVTZHJo?=
 =?utf-8?B?Y0NyV3RadzVrczZabjRMMTBzU1RrdjA5SEhzQ2RER1JvRmluWU03VmFGUTAw?=
 =?utf-8?B?SzhZUnlMcFhpS3B6Q1dTaE5vTzZCNnVua3FBN1dVWHJaMmxsWklMbzMwQXFH?=
 =?utf-8?B?bFpscWVJN1NUbEtPSXFkekl6TWx3Vm9VNEE1VEJ4dUdyWU8vNTdLME9RU1Rm?=
 =?utf-8?B?VE5KQTVQL0d2OVk3RHd2bWJlZzdFa0lxUGQ2MWRXTFN5MWFZS3laY2F1U0Jx?=
 =?utf-8?B?STYydFdTdTg5TmdJRFRLd3NXTGRpVys2cHF0dWJrZlA3cXRsbmdQVkNMbHFX?=
 =?utf-8?B?NklMWDl0OThuK0x1OVp5VGtPakY0OFkyRXEya3VRNFZZQVkxbWZveUVDQURw?=
 =?utf-8?B?V1VqeUZZeFA1NHQ4c0EwQm1ObE1TZU1HYU11MDZtTTRWU0VnZmNvcXJHYUht?=
 =?utf-8?B?aXFCWkIybGQ2M0ZETm9JbGNFbE5KZ0Y0U2dHYWs0VE9kbzdlUm5XdWtPNlZ3?=
 =?utf-8?B?R1h2bjJCNlFoT1U1dkhVMmVwelZwdU1uSGx3d0RNM0hTMStMOHJiek41eGYw?=
 =?utf-8?B?bFc0ZWx0Z3RzdTVQWEZVZG5IN3BlZG45dFFMNUVYU2JhS2V4SDY5OHg4cGZu?=
 =?utf-8?B?MWZyUDU0eHY0ajRUcUd6UTlFK2dwTmU0QlMrSTJHeEtPN3I5ZDdPRW9PdGYr?=
 =?utf-8?B?NGNQaTZIWHZsa1VGVkUvdWU5OGcxNitsS3hLL0hZMXk2MTlRSkhGcDQ3VEhw?=
 =?utf-8?B?dmtKZ1llQ2xGTWxoK2VxSE8zV0thYVVCN2p2SlQ2OXdqZ3FtWUNGajZ3cDZq?=
 =?utf-8?B?bFhYV2VzdWIzajkyZGJ6MjFlS0NtVVltSFFDMEkvRUd4U1ZjMVBoSUd1eFdh?=
 =?utf-8?B?c0RwalprTDdTNW5qK015S2h2a1lwMVhwWWJFMjNjVkNWZnduSUdEb0FCOHJI?=
 =?utf-8?B?K0l4ZDllNkd1ZkZtMjdrQ3FXMjRiOUIrdHhDeEtmV1Mzbm5rSGNrNGJZb0Z0?=
 =?utf-8?B?bmVTUXU5VlRRQ3RVb0x0VHNFTFhYU096NkxDNUwreXpCTjd1QVkzMmJPckxw?=
 =?utf-8?B?YkpSY0RHQ3hKalhIemVrd2NmU0JZMEU5Vkc5cTRVRXh6dUlOUFFqSkJpRnox?=
 =?utf-8?B?dC8xRlZOeDRDaVc5NE1FamVMTFJjUnhPQUhzL3JvUCszOVdCcjdPN2pkRHpG?=
 =?utf-8?B?UFR6OTAxalUya3ZFak1scW44Uk0yZlIrcXhJWjIzRFIzVnV6TmMxY0p1SFhO?=
 =?utf-8?B?UFd6UTNTdW1JUW1TdkJVajJnUGtISS9mTE0wMWJ4dVdMblBBaHZsVVFqN1BK?=
 =?utf-8?B?bmxkUHZhOGdKaW1JeXB6c1JIdU52MGtrTzg5bllqRmgvaWxNYi83ZjgzelFT?=
 =?utf-8?B?MmJuNzY2SC9najZKUkR5bHhhUzRJSm9OOXZ2bFgzRTRrc3U0cy9LYWhXT2c3?=
 =?utf-8?B?dmtldjZQNTNNaTExMHpxWmhwSHZCNnYvMm1jcDUwRjF1d2lsWitKZ3NhZnlR?=
 =?utf-8?B?TFF2S0tnNjVvS3kwSW1JMXAydGtGT2ptMGJwM2UwMlhJRmZENDJMUWhTWDl5?=
 =?utf-8?B?QzFuUmR6K2dUTUNEQStVWWF5T1BXUkVhbms1dWg5NTc3TG5LVmdKbnJYMHk4?=
 =?utf-8?B?eFdTZkhmVElSZUFXS2hJOWhUekZtdkJ1Q3hEdGsyWFdDOEF6dm9sMDEwMW9q?=
 =?utf-8?B?b01Wc2MyT2dzZkxjTThNOS81N09lVVN1TE0vK0FCMGlxc0VFNjJJa1c4aFZV?=
 =?utf-8?B?TVQybG1pWE9GTGczMktMa2cvb1hjL1Jlc2Z6K29Jb2E0bmg4OURjYU5VU2Rs?=
 =?utf-8?B?dXZJdDYvSCtJQjlsN3VHUUMzZHdiSWdna2ZsVzFhcXVyZTc1Y0RWemRJTnJr?=
 =?utf-8?B?cFVHWCt4U1hIa0lDS3lNcXJzdkRaR3dVbCt5NDN5V0hUOEhjd3EwWFNsTm56?=
 =?utf-8?B?YW5CQWYwaHc2WktQcHRtRnRTbU41d3Y3ajBhWHlWb2haSHNpTnVmQ1V1OGpM?=
 =?utf-8?B?Nm1nd0dRUWtsOG5VZE9oMTBiSVhMNk5mWDhpb3ZVWEFVWG8vcUpjdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e77a1c39-074f-4234-417d-08def8785604
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 13:48:05.7436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckPk55oL4rThazG8Y+3fb88GpXIPZs3iRdZH7I1ULeSkLaGw4yDAYYg1ld7BgKSjhcbzi3wmWZUHvo1yoG/3dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10234

On 8/12/26 13:14, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Remove the probe error messages to avoid duplicate error reporting,
> since the error is already reported by the called functions.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

This looks to be OK. Indeed at various points snd_soc_of_parse_audio_routing prints
an error message if it gets into trouble.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---

>  sound/soc/mxs/mxs-sgtl5000.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
> index f1c0e612313d..a253a48ca59c 100644
> --- a/sound/soc/mxs/mxs-sgtl5000.c
> +++ b/sound/soc/mxs/mxs-sgtl5000.c
> @@ -155,8 +155,6 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
>  
>  		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
>  		if (ret) {
> -			dev_err(&pdev->dev, "failed to parse audio-routing (%d)\n",
> -				ret);
>  			mxs_saif_put_mclk(0);
>  			return ret;
>  		}

