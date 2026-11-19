Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795079706;
	b=pycPj/QAbr1s0WeqsxWmjSNJ8EBWGNCiujhhjM89S+/gpYAPhQCWDre02a+Sl9Zx6rMV
	 kt9AyKjdkA72WY/X1wgJdmtaN7WDZeQk4j6wrG6KvBVNu5g5K+dUNLq7kCyCKqdPDBNVE
	 Wt5ZLM2VJI9vrd7/9ywQm4TgAmbjNmt+x9imkTn+ygPALXhfhm6gPkxhYmX8EuOMG35+Q
	 ukPv6Zn4mlBPAXtblNe4/fOF6FZL6WfVi22844WrkYlBOZjTqEGsq1PH5K4/22+YeGPvO
	 CnW3iMGhNX31xxrTGM0NvGF6x8OlkjhW9HJKYCp/R/3fYtxUy6C+Vj9yMB/HEwnYA8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079706;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=aawwRtmb+e2ctOPVZgT4eDiTzriLr63ItZLhrbB6NhQ=;
	b=FbfSfIua87TXK8YUQA05cNqxxvDuri8VXvWH2l14G238YmBfFwJpz4R4k8LKc/GrPa4A
	 0ZXe23/92lMZdXESyOzTm3n30hdiOortN1/GDpVJzynpTDtgCba4X4UchTamyD4JnBs9V
	 mshegfQadtfiTcWkZ2jfP4VfXSqqdWTv5TUTJZJjJZgT/MMKNMFXG6d1Nd75AeNWHYznA
	 7YPltLzraBNiSW67wdbAcaC1losEM+kJlbCn9qBtBm9PleAZ6eJ0sYLTF4PnqI/L8cz/x
	 h9JanLD4S8xYWUzRqo7s2Q10lr23Xgj2s1K/CLhDiZa7reXUUyxuFBoA3XhGik75NNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ANFmOVnO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.1
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CD6606A320
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00CD6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ANFmOVnO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiAYtQrQeiypET4QJIONzjaRsldvgOQj+vrg3YX5rhN32d+nfTA7hks9bVXrKNZbFrmLYEHv97JFOCGFayLYKtOwXEFOiQnAvPgrDY69fCj6WplTDviJupVZhpFjyGQHgcE3ydAekz/V7lBr3aWVMpOQcNU+uO+fqUyGuTUK9vo/JAWtwW6Fsio/WdU8vrSy0WjyJLLAiV/hCDghq3W2y9WPBvKnbJK/G+owSTiR1jkFcm5neGMgNhPd/Zs1jDYikdtsICcmQv+EXCYShbkZVIDB9z91okSrAb8nv9sr7yXK++ks6e28Pc70qFSXzM6h83n+PTagU/mG1bQ7qiHUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aawwRtmb+e2ctOPVZgT4eDiTzriLr63ItZLhrbB6NhQ=;
 b=nbkvh0034BLk+Cv/vpzc5ET0J0/mU58Ld843tPbVr7VJu3CISTpfs3jh0vPuwYSvyLSYZnlv9npSq4Zu/Jcccd8IV5DtW0vqPo1HpzuQ5AYCOmEGHQd2n/L4x/zoZrk9zfDcVbvU4F4peF1dodRy3KMcw7RLJdvnJ1lN9cYUka+ETJDhZWZBivuSRXYqheA5RBYaTt+yqX2yKwgTPv6hN7BAgJQoe2Lg12jU3NcTvqTCQdGrP1jBgcXBjYKEYgPLHWGM/fGYxwts96QpVzyJKdpa7CO6Lp+Jq03b4UNbLNoH93uik8dQvPZNzxG/9oS/JkYCEBvFb51tZDV3hZoDBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aawwRtmb+e2ctOPVZgT4eDiTzriLr63ItZLhrbB6NhQ=;
 b=ANFmOVnOYto727MDHc3Lu0fnmT92ndtr1mTgsMyeHx6xQ48shFVvIEXgfDT5OyU/HxHQ36BrnL48kbFsXGlNYVcpd7hM69UwhDrzcjwfj6UaEKB1A7bz8U3Ee+eZQVgd5vsiS3q06COKf2NkDUwzphgbWEUBGZpeTZZlxl64sRxewSVQ+HKpH5cpL0ABktdt9wLi5D+1CcEun7u69BZK9sIC8ii0rE+joWMrUELTPv0ZJmsCTFWZUf6u0DpANtTMF2uy++jM0je7xOYj6HSoktqvIbwhpVSShhLOG+lW2CQGeeHZRZGDS8Uo8Oy3R2IEa51vR4xmCjHrve16SY2Rxw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by VI0PR04MB10137.eurprd04.prod.outlook.com (2603:10a6:800:244::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:15:00 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 09:14:59 +0000
Message-ID: <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>
Date: Thu, 19 Nov 2026 11:18:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
To: Stefano Radaelli <stefano.radaelli21@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261119090600.9257-1-stefano.r@variscite.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261119090600.9257-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0006.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::29) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|VI0PR04MB10137:EE_
X-MS-Office365-Filtering-Correlation-Id: 83701fb7-cccb-4433-b353-08df461d9616
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|19092799006|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|261009221227099003|22082099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
 QmvRTUC3lhmDJ2t+w9rsMDqRVyxR94TtmU223Y6OKndmrnzLcQihKYqPLideoPItFiw+Sw+YvEFIOuTgSZYcBNLTLkzpjQ+/xHQikM59FjWEc6rP2bWG9ZW8bmdAe9YcchuKKk+2YbHzV8uHFgYu7sl44ghihhROoCqFs5wFN6tXY9Ci4l89Vs9a3ON9DDSoc9Dp1Ccj8Guj3PKAp5f1qid3ikR/r/dce1aKJXjxFfLAW/rM8+a6zivdMkiv1UdMbLWJr1EKBFQhYKmpA16zdu32ERzeNvblqler7wXI8vY+fLOoI1TscZNKwB9H5jAO81BekpU7GaOTnldH/npKPLNZW5LyG/jcQseySBr27l8KQMXYE6yEZUn5LiofpNThFYL5JSmmX8En83CEZFZjBYANW5A+M/SRiVJYRPTY97UYjFO9GdBpwSpXTMP6XKyiZIgbrn21wvgoitOLTe4H3tFvy0u0XGcyOtQ2NhcZ6SddiEp8TWHB/9+O1pE6SGlYevLVk16vxyQOYhmz+OV4e0eZVDVnLnKlyWUO7zAVWVdqBSg4//VIGve1u4jTHfEVArs+YJya3r8eBrTwwVGh+CdUqElQjdAVYKHIip0ftK4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(261009221227099003)(22082099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ejQ4WXp0SnJkNXNkTW9RZ25hVWppY3B4dXhvSGQ0dmw5SkUrQXk5R0U0TFRD?=
 =?utf-8?B?M21NM0Q0YjZUZGF1TVRwQmdzMXBiZHJ5Wm1idFZGVUp4cDh2NGtIL3Jmekx5?=
 =?utf-8?B?aFdEekJFZ1BEWXZBS2RmRjZWNCtYTnpPQ0tuNlVKRnRwSFlpZUdPdXR2R0ti?=
 =?utf-8?B?OVQ4NW5xQTF0UUU3V3czR2t2TUFUdnZwdHFQUmo1UTlRNVhRSmpBWDBLVStV?=
 =?utf-8?B?bU5lWHZWTWp3WXZBQ0dGL2szT3JKdEd0MjNWbGMwK2hOMkRlZE55VVRORVlm?=
 =?utf-8?B?Wmo2NUlwMVpsR2lRdGNjek5ObTd1MmRzMUovZFVoRTBUZEw3OS83TGpWREI4?=
 =?utf-8?B?S3czOEtMeGZ3WlJnTDJ6SjZqK0tkbjlrdEsrVXhRMjdDU1EwMHEzSzgyRFhP?=
 =?utf-8?B?NFNURUJtbnVTVzlGTnppekl0aXA3RnJsd0t0d0RzQkJaUmVKQkdlSCt4U3ho?=
 =?utf-8?B?UHFpUHNrZnl0cFVISHlBcFdDUDNkWE0xcXV5cnJGRlcwNjlzajhxamhrVC8r?=
 =?utf-8?B?UFhHaEJGTVJkTHhSZktJUktTcENNOGlUaTFtOG1yVlJSNGs5enJ6SW0waW1m?=
 =?utf-8?B?cDdLUXFtQnptNHk5eTYwMGJZaXhid1FNaVd6a1UxQXVZVEhFYzIzNmVrK1l3?=
 =?utf-8?B?bnNYeEtXYVF1WW5WTk14Zk5tWks0aGE3TFoyakhHbWEwejA0NEFnYi83a1RU?=
 =?utf-8?B?d3plU25ndGc3M0RpcjJ5aEhLdGE5UlNPRGRBRi81empUN24yVDhtRFJKbC9W?=
 =?utf-8?B?WWFWdm1YMjFwRmtROWwwN2xQc0p6bFFycWxKQU1mb2NrWVdGY1NZcFBnYTNW?=
 =?utf-8?B?eGZqQytnR20ya3FRQi9HSXNpRk5vRlRZSDZHTWo1VTFwZEVGMXJLRS9Ha0Qz?=
 =?utf-8?B?UXhieFB6Y2t0ZG5LSUhmT3hYWmlnbG5zV05sWVNoUWFKY1NlSGxFRmpMeG55?=
 =?utf-8?B?V2FtTFk0SlVFemFIN20vakhUQ2E4RmlJMllVVFFlMnJLVU1mNU1LOG01citr?=
 =?utf-8?B?YTlqOTlCaUxGNFBZZ0pzYlBaYit2OXVWMkpMVXB2eFkxWUFaOWpxelk0cVRk?=
 =?utf-8?B?THlzOVZ1S0VHdEhHTllaMTI4MGF2Q1JtR0doVHpwU0RLdWUvRktKUVhSaXUv?=
 =?utf-8?B?OWZBcjhWZUEzYTF6dEVnSU9CelVabkdCWE51dEw4d0x5Y25KcWYxY0ZNemhW?=
 =?utf-8?B?N2t4QllZTE1xTXJPN0RJODhBc3VZcjFvTUFEK2w0NnhZdG11TVg3QmlHdkVv?=
 =?utf-8?B?aDRqYnZTT2FIbitxbTg4aW9Sc242MWRLQ2lleGU2RFA4aGRneGo3cHM1Wjhh?=
 =?utf-8?B?WVJtMlBpMGFZQUxtY1dJKzlqU3NlSytPcnk2RFZMb3Fxc0RqQVRnbmhxL0Fw?=
 =?utf-8?B?bzRDZjNGOEtKRytWTjM1MGhkYzFaMUtaVEx5bWsyRW1yQ0cweGNXQ3pWalE4?=
 =?utf-8?B?UTJ4bTkvbTNwTmdudUtTUGpUZldjNVJudjBXVm5QcUFXTmlMNW56QUp2REdP?=
 =?utf-8?B?WGVIU3k5TXRRcTFYbWhIWkwyMlJXNWJnaXI5L0Fja056bHE1dTZBalI4R1VQ?=
 =?utf-8?B?TTRlTE5sVEZpdW1GNXlqSmdjczZnS1Z3L0d2NzFla0RXQ0JIZXlUeE83RXIz?=
 =?utf-8?B?WGtrOWFPc1RLVUhBZFhsdGZqQThkOXZuZXEwS1dEdEdKVlQrYXpzSGMzUWtj?=
 =?utf-8?B?N0lnajQ1RUxVMlNSQUpGU2dLUGg3eS9UNjFmNnh5ajkxVXhNZnM5NlBYY0FR?=
 =?utf-8?B?YW5yL3FJdjdEbGh1R3V5RDRka3hFbWJIN2pmYnE2V0FzVFpxZ2RWWTEzdW1W?=
 =?utf-8?B?WnRQSTVtTVFjUUlzR0l5MXQvTG1MSFNKTUFmeFljNVN6d0h1L0NnWjZWdWtF?=
 =?utf-8?B?eUdxQW9NSnJFR2ZIcEZIT1J4TEVzQndiTVRzYVgrNHJDQzNvWnNNQ0x6REJl?=
 =?utf-8?B?eVJGZnA2bHhoc3hZRGNwR3dQSlpSZ1lvT0NrQW0rZ3YyL2U3UnBzOVRjaWZ3?=
 =?utf-8?B?aG9DN2h3VGhGWktabDQyOFYzYk85MlhtaGRZbko2MXU1Vmt2aHBndXNpL3lk?=
 =?utf-8?B?aENic0I0dzJqdWZucjB3MVNrQ3hDcGZHTEUvTWI4TEFPN3cvOHpKTUxPQ1Jw?=
 =?utf-8?B?WlZXckFPVVRsV2R0WG5uNTJLck5yRGJJYjRvWTJkYzBqNnVZQTNOdzFHZTho?=
 =?utf-8?B?cDZ4aWYwbld0S1pKNWlJM2VmaFF2OTNkUFl4dG5kUUlIMmNUcTFKNXJEYVNi?=
 =?utf-8?B?LzUzTUp6VnNhUkZiVkNaeG9nTkhGR3Z6QWJHRXR2dXhmNDZkWEFEdWdjdTl0?=
 =?utf-8?B?U3pRQjllY0xOanhnWFN5VHpRMnBGNnliaXkvaHZ3bC9FaVM1cExudz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83701fb7-cccb-4433-b353-08df461d9616
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:14:59.8256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j55GPJRPaWwg5lI+Vn64UjJssE79WKKjdpppJytd+yQGCDefZDPGChmpmIriLTWu0xEaLn6RJkrG1SXDrezkKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10137

On 11/19/26 11:06, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Add Cortex-M33 overlays and combined DTBs for DART-MX93 on Sonata and
> VAR-SOM-MX93 on Symphony.
> 
> Share the remoteproc and mailbox configuration through a common include.
> Reuse the reserved memory from each carrier DTS, preserving the different
> resource table addresses.
> 
> Move the existing DART-MX93 remoteproc and MU1 configuration out of the
> module DTSI so that they are enabled only by the M33 overlay. Use the
> -m33 DTB when remoteproc support is needed.
> 
> Reserve the peripherals used by the M33 firmware and disable Wi-Fi,
> Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
> OTG1 because its USB-C role controller is unavailable.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> Changes in v2:
> - Remove the cm33 and mu1 overrides from imx93-var-dart.dtsi,
>   enabling them only through the M33 overlay.
> 
> This patch uses the memory-region-names binding and driver support from
> the following commits, both already in linux-next:
> 
> - ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
>   memory-region-names to avoid implicit ABI")
> - 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
>   implicit ABI")
> 
> For dtbs_check on older trees, commit cebd1c0961d8 ("dt-bindings: gpio:
> vf610: fix clock requirements per SoC"), also in linux-next, fixes the
> pre-existing GPIO clock validation errors.
> 
>  arch/arm64/boot/dts/freescale/Makefile        |  9 +++
>  .../dts/freescale/imx93-var-common-m33.dtsi   | 24 ++++++++
>  .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
>  .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
>  .../boot/dts/freescale/imx93-var-dart.dtsi    | 14 -----
>  .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
>  6 files changed, 139 insertions(+), 15 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index cfd548284358..05a7556e9de9 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -956,8 +956,17 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb
> +
> +imx93-var-dart-sonata-m33-dtbs := imx93-var-dart-sonata.dtb imx93-var-dart-sonata-m33.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata-m33.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata-m33.dtbo
> +
> +imx93-var-som-symphony-m33-dtbs := imx93-var-som-symphony.dtb imx93-var-som-symphony-m33.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony-m33.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony-m33.dtbo
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93w-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
> new file mode 100644
> index 000000000000..51b4cfe143d4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Common Cortex-M33 configuration for Variscite i.MX93 modules
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/* Use the reserved memory and resource table address from the carrier DTS. */
> +&cm33 {
> +	mbox-names = "tx", "rx", "rxdb";
> +	mboxes = <&mu1 0 1
> +		  &mu1 1 1
> +		  &mu1 3 1>;
> +	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> +	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
> +			      "vdev1vring0", "vdev1vring1", "rsc-table";
> +	status = "okay";
> +};
> +
> +&mu1 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
> new file mode 100644
> index 000000000000..d97da9916ef4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Cortex-M33 support for Variscite DART-MX93 on Sonata-Board
> + *
> + * Link: https://variscite.com/carrier-boards/sonata-board/
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx93-var-common-m33.dtsi"
> +
> +/* Reserve the peripherals used by the Cortex-M33 firmware. */

Use "reserved" instead of "disabled" for all the nodes that need not to probe
on the Application processor because they are used by the M33 FW.

Also, instead of disable in the commit message I think it is better to say "reserve".




