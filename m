Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E441D106
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169794; cv=fail; b=tbiCqY0o1lxVcLYEhrX6kH4gjtVsgRvMcLjzNG2G0Elpbe0eg/AYpqpCTvMZNRhA20G/2amtYMEyCBgW/m8hOtexIGdE6p7zufWUTuMAYxOFsJyUAOdvmtP35q5K544VvybOoakl/t+vu8ov26szNVCL/EsYi3N8+6Nya6jStoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169794; c=relaxed/simple;
	bh=h9QoEK3+jTlJUgeEuU/ydGywNgZTG8L/tuaBF3Idryc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fQDQPTNGhh6arU3cOmaxMt0MroHo0mr+cRKvupBaesS59udN+2PppAGQSQGI1b7DjMlgXiUxNhsZAYzMxhgZevvm0iQd5ylbQDz8qHAeuZgM3qcjIuW+jOkXetXTl7fcPRljIW8T1kCQoFYwgFadc6oGyOn4ok3otbF6895DSoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vVpisUac; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vVpisUac"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llVK0cCi5cs6rsI6PUWzK2w9FsBGxkUimgF9BF0kLp5nzT+w77G0sAEBn/HEndH6f+D4c/nzFMpfnC5jCg3nQV3tubmZ3yuNOueMIC83JkLbi45QsFC/JyEol5eb+XTdgrHgJmcxie6KE4N3XLSAVhy805TWmMpnbmssAnuvkO/o37fpctuxBDvntcsNiwLUaStU4iIdxUbS/srzDBgxCNTiad/AT/nsWL99QfwkQ6IjWgWuxVHodVnII8heubgbfZBPbjRJRXHv4DYltwtPltqqQdR4q7zdLUelYEg+6qZEDH66HVHDjBwVLPtb/ZYdmvxwpWxvImnROiCPophiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jx15Okrd43p/TUo9rjmm/KdXY7T4xzPUNy0xx5nsKl0=;
 b=T+3n7DJHChL0p5CUbfnT/hi6Y4siXBorunRXKkHz7pvHoaSj/Di5D96pojAp5bjgALCtBZ3dMWtN0hghzK/c7UH9FilpH5qmxHmXrLlgdX434gqSxp77xKqq9k2ZIOoRgriyC4OG+z/MSdND3ovPkP6aNJPLoRXVYvBVTfMTcP7KVTi5GycKIlchgozj7a+jFwuW1DHArGA/4GywynVQE1Wc3skw24E3qD4zjY5A/km9RNMsJcEPHnmVXyQhX+lZyFunfjfmBDhI7phk2ihtwcSbL+E+6/cC/mcT7IRakMW0tPXHzdtg0VNSWT+Q7aHZ7L3GK08UlqsZYQ67gMnDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jx15Okrd43p/TUo9rjmm/KdXY7T4xzPUNy0xx5nsKl0=;
 b=vVpisUacAG9K7HLTUH3GdQeStljMYJTRVUW7If1mgKQcb7HflfjzrNsuAOeHZt6pC5y/uUVrycaJJ99JzGZIh2K19ZFL5U6Tt4RcNc6uCh5Xc67LsPLeYB1da/K03E5ivYGlpwhOfGiScTMG9lvaDWo76E3KeMeHP6uMF6Ltm+YSZiLjFQmESbRbxFpE6aLeHh58JCZqlt8IBF/+yFok4srBYmskZyKQJW0KRnDL5sp2+TsGjNJ1uIeq7e0fYHp7gV1FZnruNImV8DYGZ3YkkVqbJsU+NUBCl0EKhJ+C4J13AuIP2P92e8eIn4U18GBcKADqA+awTBO4VP1JOkbtTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:29:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:29:49 +0000
From: Frank.Li@oss.nxp.com
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jared Kangas <jkangas@redhat.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v8] arm64: dts: s32g: Add GPR syscon region
Date: Mon, 27 Jul 2026 12:29:41 -0400
Message-ID: <178516977239.2517575.14455944558041826088.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721-upstream-s32g-gpr-syscon-v8-1-49c308536aa6@redhat.com>
References: <20260721-upstream-s32g-gpr-syscon-v8-1-49c308536aa6@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10546:EE_
X-MS-Office365-Filtering-Correlation-Id: 3052e4a2-a33b-497c-06db-08deebfc471d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|18002099003|56012099006|22082099003|10067099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	z3iYvSGuBnJKV581giLQXoSUMuMTQSMt2qR5xb46/JbC68/6s3UZH5AXkdLZNuxHAdsbfqUotmerw84/Y9QsnOqOlekAIZtBJMu35MUrZkRjNqBoK46AIh9qaPepzg2xF95LIFtOI39ZcoRNhy7paKKN7LdSY4XiW0eSgtBr7396KOa++FOtVKxORS4oYwZoMugOApuKzwzvwRhDQqWNfjr1L3s40uPd/HUJhj9s9yFuuk8nfxO7PP9yxqwBCkVLaRGE7f3NQv/3B0F0vgkHPkVLUJDg2T5L7loU7IqVukFlTqRD9ZyvmqfESMYCWOJ7sHw+OzmIAFBJ57yXDI8Ebup3glg6NCIvHLsBVcB9JaNvDCagh0kR2JbOyiz3ZYcnxgppG4KlcEgf31YeMDm6OibL34hv2i5RyjZ+F2NpQA3Byy9KaPwlYQGt01RzzZiaxzlK+X9z5qTt7d+8v92Z23AzAtgJ21aiOvuzeR8CF2AkV8kuDoyDBycAvhlW9Ihtz96vZspQ8nznQ2MQ9xd+2XofwO5rL3e4LWbNtmQieDeAT+7TjjJHeQciKohUaKP79L63s2XeEvqzUi0RlGzxAoLIAdakhF+K9MQSGNaQabKYmQqKkHtpzsMp0iqvdQ+cla/CGoQ5maB60bPguIa/jHzjg0NCwlr0tzkymbn1TPEqje7Eh4AyBwa8Ti7LOnxp6apYMRpTd4ZUB1BBhZUz9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(18002099003)(56012099006)(22082099003)(10067099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVNrTEExc0RvcEltYXliODlIZlk4SS9zNWxVNVorSzRNcS8zMHoraVZSZVF4?=
 =?utf-8?B?VmEvOE1RS3BTeWRnL1RFN0FlYkIxakdXNlFBa3ViR040c2xrNEw3Z09rQTYx?=
 =?utf-8?B?M2ZXYjdQbHFTM2FMd1F1Ym41ZmZFY2N2MkRKRnp3Mk5saXQ5dHlzdS95b21L?=
 =?utf-8?B?b21wV3NWbmloQVYwcldLRWs4c29yeXR5YmxiTnZPa1hibzlzV0F1djlBbXBE?=
 =?utf-8?B?VkZpVjhVSHM3SlZkdXpveE1aY2V3UGZYMDVFcHlPa1BMa2lwSlZYblQrQUxF?=
 =?utf-8?B?dWc2NVRHSEdUMTdoSy85QkVxMFhMdXRlUUYzb0dibWc1SERYZnVFK20vUWNH?=
 =?utf-8?B?WjV1NlhEOXNDb0c0MFRhbXhWaGw1N3hrdElaK09RUjhsRlJMMkJnUlczclo2?=
 =?utf-8?B?cTB2UlB6U1BzdUEwamlSa1kwRDJxZ3V4RmxEckhBVithWGpuRE8wb3FHU29L?=
 =?utf-8?B?YVNNdFdLcmNQOG5tanZ6NElrVTdoVFhsSlBuTFpNY0gyVmhQUHJ3NDk2a21N?=
 =?utf-8?B?VlU2dmdjbFdxb0NVa1QzOFNIWjRwWWN4TDF2ZFBPWlhwK0s1ZnJzUFdIWlRB?=
 =?utf-8?B?MnBDTHlTZTNJQUpvSVRjbXNQdXJsVEFZMWk3Z2htbXVCc01JVi9adnpvMWtN?=
 =?utf-8?B?SURlQW9qWUE5NXBlUGYxRVVyTUlkODdNeFJJVXVWNDF6QmlseGo2dmhxZFc4?=
 =?utf-8?B?aEJVdkdJR0N0ckEzd3g2UEZpU3dnb3BRZXFEOTMxQ1JKTDg2dUh6eEc4dXk1?=
 =?utf-8?B?d01RMms4eDJCYktqYVBNWGFRTWlQQVFpNzkrSis5MHdzOHBmdjFTZUxFTjNk?=
 =?utf-8?B?T3ZWcjY0SmJocUNBanU1TkJycHB2eE9HZkJhWm1BN2ZXT0tMb3VIT1ExYkZS?=
 =?utf-8?B?WGZZZTR2dHJqKy9NV2Vyc0JKTDZjODVSWThKcVpFaXB1bklKZmxxanNtZ0FW?=
 =?utf-8?B?UzlOVzJxRlk2VkkvM0FYQzI1TmdRa1dlMzk2WEZWaUFmRlZZMWo2SkZlSktD?=
 =?utf-8?B?UFFhTjlVVHk0Ty9vblBnZzJCWDl4N1lkeGI4aW9aSmp5dlFBZmVOa3ZuMnlR?=
 =?utf-8?B?VnhvWlNZalJPZjdYdERJbUQ5b2F4bzNEbnI0VTVmMlNmdTRFVU5ONWRQcTZO?=
 =?utf-8?B?Znl2UU5MbnNaZEx6OUF5UFNMeEJlaCtmQkFaL0hKUHMrMWU3TmVMU1RMc2RM?=
 =?utf-8?B?YjdocllLZ1h1OWpEMGhjOUtCMjQrVUZkMWRXM0xuQkxjeHk5N1FYVEVyRU1z?=
 =?utf-8?B?M0N3bnhpTXFXTGVuMGt1WnZIU3pKQWFZdlFZSjF6TG9hSDU5a0JycUVvb2t0?=
 =?utf-8?B?MHZLSVJFL3BHQmViZFhSZWhlMng3WmpldERSdW1HVTllRi80QjMxaHI0MEZm?=
 =?utf-8?B?N0FjNnBmcXJOc3Z4SHp3RjRuKzg3RFh0S3JWNEpJeFVhZTdSaXVvclFoY2ZM?=
 =?utf-8?B?RCtBWExxZDQ5RGFNZzhMN2tlQWFUNlE3K0xBcFNoVTlHQmVvTEZIS0xrTzgy?=
 =?utf-8?B?N0dDU3VibGN5Z3JUTXI3UlVUeTN5SzNDUHZ3cWNESTJXYTNRRElIakFXaWVW?=
 =?utf-8?B?T3ZobmNKdHBBeDQ5cDB5cFdCRTRZSjNnZ0Evbi84Y2Q1akhDakVNWlJML0wz?=
 =?utf-8?B?bEo5c3ppZmJDYU5RYWZMUlBIM0JhM2lSdHd3SVg5UlNIZDVoTHovL3NzeGkv?=
 =?utf-8?B?eDhUcmhLVGVxUHVPenJxRlArcVN3MGM4QTFEVFdwbjY3RWNSbEhoZ0JLMVZp?=
 =?utf-8?B?aXBuaWpQcVV1WE80RE1oOVM2ZkJJYnkra3FyT3Z1eDQyUTgwTHFaWENGbmZS?=
 =?utf-8?B?QnUwd25LY1h2aCsvRTVwTU90RlRnMEhTbFJ1VDlGOGlMdU9wbXZyYUJ1bEo0?=
 =?utf-8?B?ck9xa0tWRnJwbDNsellBOUxNakNaOFRTOGpFU2RVVU11NnY0eTNNL3JoN3pz?=
 =?utf-8?B?L2MrWXNveXZ1NnZCWTRjb0JSdEMvOG5XUGxhMjh4OFJka3lSRm44blFuVWxx?=
 =?utf-8?B?bVZVWWdFMnBZY0NVWVZKV2sva0VFZlpaVVNORlp0YzBPaWFyMms4MCtGdTE4?=
 =?utf-8?B?Mm9vNGR5Q0tZZzVRazdlbE9wRkJ3ZWl6TTQ0WWE1aGRBZ3lUY2ZNY3JMR0dy?=
 =?utf-8?B?ZjM4RW9PdDRpcG5udjVrTnU0aWdtM1pJQjRDWmM4VEpsZHZucjJCSUZmMHFo?=
 =?utf-8?B?RlJ5TGxyT0xkRXJqNy9UKzZleDhQYUtQQXhWd3J5bDEwTDVJSXpxMTM2aFJM?=
 =?utf-8?B?MFJDSk5Wcjhrc2hOK2QzcUpIRThlL1BTbzBtSUtuRjUyNzEwak5zWUg1NS94?=
 =?utf-8?B?cThEUTdtUjNmUWVFVG1KYm9pS3hiQjMyM0NGSE15dS9WdmlkM0UwcDBHNHFT?=
 =?utf-8?Q?qgEBot5Tn9dt2sQ0wbxLM7JeJ79trbIyZ+kXJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3052e4a2-a33b-497c-06db-08deebfc471d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:29:49.2472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/WTHtBEBEzQqgTzM4SESEl6bXYzJa01MldMFlvqdX/SecQ0N+G55ImjMkvEmwN/Ly+FNt/sT184D3CKTJqX4VNkJiUB84zODG+IMaqFTWeAlRxfo6VHUuTffz6djf01
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

From: Frank Li <Frank.Li@nxp.com>


On Tue, 21 Jul 2026 09:12:41 -0700, Jared Kangas wrote:
> Add the GPR syscon region for the s32 chipset.

Applied, thanks!

[1/1] arm64: dts: s32g: Add GPR syscon region
      commit: 853d77cc0c06e686d0214a015fe88c1047ba6302

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
