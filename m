Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EFC254B1F
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072778; cv=fail; b=YTk8r6h+GPqBJ7f9yBa4DokUFRpXnvbegXLdeLz5Vm6FHFIbktpKZ9j1lo1gixpeQ2nhrFmaKFG2uCiAGJm6yulTnKNvN/RkBfbhFEziurS/4kPEXLl3cruvbZTJdaB9b+3EvJA9mZCJoFeStnyFdrkYXl7lZDhM62US/W5QSSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072778; c=relaxed/simple;
	bh=//fmNMiuXC4kwicx8b5WPtYRShvwIJUPV/m39elxAw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kblj44HbQo7LvkF2OYyoiKQIjt3JwlfVUbJfMhKXTJLz4A3QcdijPYdkgugo5QEixlemgD/pOy0B8AnK5hXuwhH1T8vRo3vtp+N4onATDWBg309Q201ipsIocbLlq31WIMONdAuODZAe+YgK7BNhrgkk6IwvczlN0n91XGl5eTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YziGFwUQ; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YziGFwUQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1VyRTasy24CtRlLc64cyHev3HfhInZFqVY/NeEWHL0QK5XV+VhQroY63jjcHA9wvq+Fyb0nftJB4gpoIOphpZa/YsrLnUSMcPnAcxUu9fg23ndRiBEQA2JrTbl8QLakKG4n+zAKj0I13Y2XJsPo/1qudn/o8x1Q9uatK0wzT+v/9FoF97J2p4Zal34ssHLn1Kuabu4/T3uOeTl/LUiftgt9L4vQK0i1Sfq+PyVcWJhIxlj3ZbvGnfvXTdg7xWLhsmsFcgZIcklSOjq3uJKB1jnfxyfGv1XL4nZLC+YG4b9UPt1yNTfKpFrS5si3ZJCdb0bdi527UFKCLIBLh3rRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnCBEOn9UghTjv37MgYliDO540vBGlnS5ohIQs64Uws=;
 b=F0zOPDBXfAibNdqtdi4Y8vJ6Q4ToAiZobUqYAKM9tyhfJ2oeAN4bzcmzBSD0QpQITpOtupQNu5NQinIKNBNk21sgn6kxQ69K2HOe82QqmgsnowAqgXAd9U7Nt62qVSO5BRgcELh8pVwm/IbV+N5jQvGIHNtzwDPsj9bP6G6LqRBStJX+xoax8Ozz/DGP6COitvADD5JU00YZKkiB8pr8LKoW9+fBiWSO5TluLc+hWsBTtoyjKnFP6XVzd4M75gr6m6vZeh3uO6VFgI6LjYsDg98tEmFybMtuN/OhFd/eeVwppqW8JiiFcm8SSPlpXJeHs3wrWaBSKAgSQgPslbBD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnCBEOn9UghTjv37MgYliDO540vBGlnS5ohIQs64Uws=;
 b=YziGFwUQ0IMD+TI/NNW0hXbxFopbOUMCMTXlOMr6UEVQG1tJwNgdtsH508pu3KcCg+IhnHdq8GssaeixkJs3uWgi0GpzzMoqYQRgY80q0BNUo1Cy4QjK2AP05ZFDuL3t0HreYjPpztLcKt2UB+3+4UC5Dv3q+2NN/bSKs2/aIa0oJ6DtyK+ynb6gqjzHNx17PF6ON49zHud2TwORImn1IAW4YvU7sU8GJPNeTbmJdhS70QrCTRZyRRgVsavd8ks9IbKhcJ+ycsrHIBqmOUI+MMWByQ6CZkFHZytMO+IcJ8P4HoYn37TlJtCLnbx6kYWqfreePUFLkd92K3HY/caAhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB7008.eurprd04.prod.outlook.com (2603:10a6:803:13b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 16:12:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 16:12:50 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"A.s. Dong" <aisheng.dong@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/2] ARM: dts: Add CPU clock and OPP table for i.MX7ULP
Date: Mon,  9 Mar 2026 12:12:31 -0400
Message-ID: <177307270421.1707510.7834228185612661282.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302-imx7ulp-v3-0-26b708aecc59@nxp.com>
References: <20260302-imx7ulp-v3-0-26b708aecc59@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF0001330D.namprd07.prod.outlook.com
 (2603:10b6:518:1::1c) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0edef5-269f-49e2-6544-08de7df6b618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	Iw9Ebe0QAnNu2KhSir/APScnMUp13pN3PpNgrHbtmMnBHVaVpBjblh9r3uJGcd+I1rr9vLWMbWoF/Ya2MmKZWxDUn7B5nm3q6MVtLociPdpWAIKPvfR3mo3A0A23bGucNlFcgYqN6RH4DBVt6/80avGmAzqs8gAu+bmPWgyG6VLc3XDsI2w9mZgevvJXNktFYA3QJrTTKEOtXrFH8uREK8lEN9nNUJ56C/lcgUDssU7+wdWYMAb+e9LPVPicyD2tv6P+k1XYFWV/05ZfpMhGc2+KpjKYrFc9xnZpE2n2OHfBkk25VB04Hu5gaFgqWQFF0m7NH9QqC5V4+TMdtz/K436PD4Tlw9oEgmbOQ2ra88h2ohTM1qZ35yOiXv+PlQTDegOI7TUqyTJSOo75oTF80FB2qL+fM8iTuN7v0eJAjUQFZBLjKtsn2LWmN1Aq1fE/h5ssBL+HRkmGiyUnFnOd8xJB1Jy4eRr/IJB46/h0B/NPaqO3Pqp2vduY0g+hgQWJ3cmcffzOGhy1QewKOWJg8/bk927lyP4bkR7ho1mqhmTic1ifYw8OxlKgKzjyTErmj1rQGKhkyWqEpV8/T5XPOVm9O1y1rV5re/TFFAJ6ujekExLo0fCzYUxoMezSggslYUUTn5RtEfuTB71RCkTsji3GHqVfK8WoErqGassxybXs2WrrLawQlC4QK+T5/CaJ5Tirj5+jS9mNvD2JmQFfhoyvnbYcu9n1e/SC9j87cU0zMbQWLQ0LoqBt+kkVCpXVdh9otqj/mx4PuoMgHi+KB1c4RZefx/Y3z/IcYoz0uSI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YldBOExueUtWakZYRExFOE1qc2lwRmJQNWR6TGxjSDM4WVU0TVNUWmlid2VK?=
 =?utf-8?B?alpMTGFXNFJRRmw0Y2tDMFkxb0M5UXVCeTNHTUhPWEsrRTBDaU9aTTIxbFhJ?=
 =?utf-8?B?OUJoR2dsaWNLdTk1UXRzRGVsaFcrMURGSDduK2JkWDYvNjkvamdTV1loeFZH?=
 =?utf-8?B?eVZMdDB1d3JFUTYwZHoyelppUlNtR0JnRTlVRnBReWZYcjhUZWZaTURDdTUw?=
 =?utf-8?B?dnJ4Y1kzTjNmQXVBMlU2aUh1QjFYQnJUdXExaHVsZHh5Y0ZCdzQ1WmtMdFpy?=
 =?utf-8?B?Uk15WWlDdEhGVFFKQm13N1JhRzdmc1NlSUN3cVg4SFFsUytDVkV1SFFCUlJn?=
 =?utf-8?B?bmhpWU1samhrTnVVTTdJTDZtbUNubXhNdGNqam1TZ3lBQmxuamo2cmdsWm5i?=
 =?utf-8?B?VTBPYjNickc1cnpvSTZzNlJvakZjNWJENXREdTF6ZWNNcFRQekxHU3ZTaGRC?=
 =?utf-8?B?cTA3ZTFjTm82YUlWc0F2SUdYL0UycGtySHJPMVJGK3VGckJraXVYMGdFelFw?=
 =?utf-8?B?UW5SLzQ2b3k5dXg4TlJKS2h2MVJicVU3VkJGM0MxUXFKbHoxV21TMGhWYVZR?=
 =?utf-8?B?V3UvMzc3bnNVYVBiYWdrVGV1NDFPTDJ5Q01BYk5vbkVzY1AzNGVKdWFzUU1N?=
 =?utf-8?B?ODVWclpZejU2S2VNeVgrVHZtQUdzSnhuaDZLMGNEL3Uya3hWOFNjZGpzdGdh?=
 =?utf-8?B?S01wMFdqRkEzblBweWVrMWZJYUFXZU1tWmVKUVBhVnNZMEROa2RYdHF4R1Yr?=
 =?utf-8?B?dmdrTjJEdk1DN0dVODZOVG1lR2t3eGFmZFZ4OXFvTFJtMG5Ka2E3a0ZSK1Np?=
 =?utf-8?B?enhmR1ZHckRQNzRyKzhpTEdCODZ2dVljampQUWt4SHdxaUNzWkJVaUsrcGJs?=
 =?utf-8?B?OWMzYThzZ1VtNFVYODdDM0FZMWFkVm5iY0hlMGs1dTk5RHBmbTgrV0MzMUpv?=
 =?utf-8?B?Y3FwcE1LK3RWV281K3A5eU5hTjJ4ajVXSXAxeVNPMlVkb3hGV3Q1TC94OW1S?=
 =?utf-8?B?QllEUEVqRjlUbHZ0MktHcHlWeHRvdkdCZGVJOWIybmhjaGJiWW95eUdNOUs2?=
 =?utf-8?B?Y0Q2S0l5QTFWdFkwVm1nbGZPUXV6MzhVc1g3RmVUVGVBVHlXbExsSDBiNEhT?=
 =?utf-8?B?ZHlIVnpLeURpN2I4MUhJMUIwdk5rV0NqczNlNjFNckxMLzdXWjVGcFpjMEhx?=
 =?utf-8?B?aWd3YlMxektKTFVoMG85cHAyQk1ORmZHbXV4dGdYYVo3T3YxQkVpdkZyK21t?=
 =?utf-8?B?T29RVzd1T1hzR1hxWlhWNVhTd0FDWE9IK0NYMENXNm10emxVZE50V3ZpNGI3?=
 =?utf-8?B?cXpBQjRTTVJ4MDB2UTZvdno1djQzcVlJWkNJMTBIMWhMRlZWbTQ5Slo0RHVE?=
 =?utf-8?B?bHNtVlBsVC95WHJwNHU2M2VHNVFWcGpJUE1rMlVjM3ZmWWpLU2FoU043b212?=
 =?utf-8?B?cVpNZFEyNEZWenZmUkFhSlg1aHVjRXQ4VDBHclpOYWwzNlZQSUo5L3VBU0N3?=
 =?utf-8?B?d2dDeStBUkM4MUJ4VUFUUCtCWi9SVHliZFZnMzFzYld5V3FoOFRKV3NKUmsw?=
 =?utf-8?B?SjJnR093Ung2SlMrNnQ3OWd3Mm95N0tJeTFiRFBIOFZtQTdVcGhrU0ZEOWwr?=
 =?utf-8?B?QWxzaDRsTktFcUFxejhtUTVyVUw5dXUxTnNoWUJ3WXJweDVCZUZFZzV0ckVP?=
 =?utf-8?B?NzRtcUJpYlVRbVh5STRXdE02STlHVUpxYTY1MUNiRG83NnBHNWlHOTVHeWJk?=
 =?utf-8?B?VC9YQjBka2c2MlA5SXdOdDFJT211L202cS9RVExDbDdQRUhnVW9FT0I4MTRt?=
 =?utf-8?B?blR4bWwvVVZoQ0tGYXBCL3AwRmJ5Wi9IeHhDdGpWbTVwWGxoTmVQcnUwdVlR?=
 =?utf-8?B?bE9vK1J6Y3VkWkFXKzZKUEt1Y0RHOU0zcFVDRUJOMDFyNEM1bm9zOTYrVitM?=
 =?utf-8?B?cDcyQ2dTaXVBTW5xWERvVVloV0ovUVNNWkdCWm44YWs4azhDT1pLTHRMTVUx?=
 =?utf-8?B?TTUyOENuWHQybnV4d2NVSVEvd052VkdqVlQzNFNHY1c0TkVyalRGZ1UvTktP?=
 =?utf-8?B?UjIyYnFrZDcrK1ZNblBZWElraVpNRzdKQnFRUHBUaEZxajN4UVljS3dUSTNi?=
 =?utf-8?B?SEwySGp0dmN6RkdzTmdnUzM1ODd2L2hxYzJPQ1F0WWNHNzNrWEx0VXp1dnlq?=
 =?utf-8?B?QUFVejNYVng4ZUVQVmErLzFRYXllN1hoVUYvSlRWeWkwNXpxa0pGdUkyWDh1?=
 =?utf-8?B?ODdYMzRQSk9mUnZmL25tMXRScTQ0eWFuNjg1cFpucVVHcUtLMEdZdlNLRURV?=
 =?utf-8?Q?js9r/9YeZOz5KqZiBr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0edef5-269f-49e2-6544-08de7df6b618
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 16:12:50.7967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlTuo0xf15SPcmHqO0UBRFyRP0siNHeOjGQzSru5RQaGpoG9f4948e1M62aQtvyuZMJeZjmU0bt4MORW8jYaSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7008


On Mon, 02 Mar 2026 23:07:40 +0800, Peng Fan (OSS) wrote:
> Patch 1 is a binding update to add missing #clock-cells, otherwise
> there is CHECK_DTBS warning.
> clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> And the clock will be used for cpufreq as done in patch 2.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: fsl: imx7ulp-smc1: Add #clock-cells property
      commit: cb794619c2d29b882f6eec3b6ad4a1ca5afab312

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
