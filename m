Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08844432BD4
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 16:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783355140; cv=fail; b=t7jDmCwJImwxfgMcxh1n2/m0LJfiaS0EPmPMkeM9nd5UIrpsL54szOP4BvrAN056YQYWfFLkCmEPJXqwzYv3G/s4KR5S0Mat9Dbwmh5R7DI2ks8Js7JjEU4QdNzdQx44j4+L4+bnZX5a5E6ldoEW3ANqh5DskulXYtuItvycHnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783355140; c=relaxed/simple;
	bh=f60ZaNXOU34BCUly+wIQh2hVd18+10Lfv7y0UvXyVV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iotiXJ8XOVchVUuVOM6X4ePz8frHOwDwWqsIoHvxkjGpf00T7Wg2vzQ5tbwmaW8W2ykxMG3HrWDwenrZoj1NWP7Iffs07vlgcivgOB2N9GJyDPixIcT5I648WWNgb7LE+EP8fWezysty4woOnPOrj/H9IndCfEA837nyt7cVbwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=v0bLcvtj; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="v0bLcvtj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZE2Liva0DkRGK0T9KIeQKBxjiWpVyMwm4W0bPiMremB09/pYOPhl40nAl5KpMlGWIykH9R1E2CjE4bPrcXADiq9MOTKyaukCrEPjUhDx+iHG1hEp6I6DQNd6QY9TijqjndhGiFxX9usD3Yb3BPEdKEvX20W8gQQyZU/gMRx8QxAAFYd8oKJ36yLCz/dvMHQECelGVwyplkXq8hU11/vFHin/LacfVo005+Pgw5Z0bVyg0aZjQ7nxgY6OTFdzJUctzPP1IeXGiuFsCNJ//MuSVL6VeIHOnQ+AQoURNuhqazcaJvHM30YtSc6ucpTQfsS3nzX8qhZzuefnKm/qHKQIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsJuzVeJYrMx644L9FRW1COtyl1sKxSzmCG+zDUZZd4=;
 b=Z/zKrRapzJvXkP6uCdpYYChU98PENypmC1ni7Rhh87tMBRFKVXFdHE+AvPABzAQqLdz/8xS7UiYwD5UsgtP4YW/vcW4R/oOjjpC2eCQQzycJfPZUREydJZs90m2x7+VUrZZIsD9dTM7cwJsxbk00Dzqhv6VrtmE2mqrx2oadO7LI6cvDfs8j5S1CChnctXrQFk1BZDtYSVJwPN5iwWZ3lqY4xJjGFV5EZHRNyE7WyV7sJtBXTKsTrSUBsL1zrWW1INWESf4JBTFY9yeTf4jwIlCaFiVEp4LzY2W/xTYQo3aXJpJSuMebZBkP1ds+C5/IcW70EXQfhBB58UxT+hvRLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsJuzVeJYrMx644L9FRW1COtyl1sKxSzmCG+zDUZZd4=;
 b=v0bLcvtj1gNZ8w6ZcUvwHrgk6eCMwZQopAgKwMkmbYLtNZsU5RgKzur2+y0d41uico8hmBKd4YrTLVwYkRhnoj4WbKEh8Ybf3KBtlkxzBfF+0oXacWBO4yYLO4I2d+4xHafDXMDt2nlm4+jSUg2kQKych1zWQy459UeQOfRiZJ8oDw/VssjPS2BrAPSV7rOhm2pKRqBKlOzl/B/DxKnRFWRddkv6L1mgD0wjdwmg3D2S50bKF/RH+EnJ/0e9tC2wm4JvRWkbUBTX34EgxJFd1bJejh1Rkuwcz2iAdyEeUB8V8UB8Vs1P/SepLDdZJq8q8k+UqbVsReasZjEsTtXIDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9705.eurprd04.prod.outlook.com (2603:10a6:102:24b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 16:25:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 16:25:29 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v3 1/4] arm64: dts: imx8mp-evk: add typec node
Date: Mon,  6 Jul 2026 12:25:21 -0400
Message-ID: <178335508074.1424803.13243996547344180324.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630103629.76604-1-xu.yang_2@oss.nxp.com>
References: <20260630103629.76604-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF00013307.namprd07.prod.outlook.com
 (2603:10b6:518:1::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9705:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ac0e861-9ffa-45c6-447d-08dedb7b31a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|23010399003|366016|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	llut44pVvGYKGh1sBAP3pYayVvNksGI+RRAf2DzwBMp4+jKYxWC4/MC2JcPnSUmWcDt9g1FRFDwrlIoHi1sg3AgzbJX2IKlFj1Emc8JPAocvcSZO9a4ylBXpVRZjzRfJGry71cMH637IXyt0lVU/SHM+2938EDgrjWOze3FgQWRgK29Iev9SRHZEUlBbG6rXFN3flazXenOtbkE4gs+LPGcHO3aebuAPVzSfWbty2yQlKlwzxaK+Vxd8EWBluHi+QYJ82+nUl8SQzbP/jSr/08UqaYTkNWGuFN544Ip9+lQ9tipntCDFrnVw70RvgUnjTl9rVgu4r+7/7ixj5xJ5W0/q/qgE1dzf5/j1jBIUSiRZQiomQkYADQvpW0CFqMahgfocbb50hDHBDX3MFRAgl4m9sAHzML1qWIwgmyjqjL+TS81GHGw0drvt8qlvKXx86tFDykM7P50YiIupTI0yYWtJknRIsph8BzySZxcvy92oXr4QPSO1wmwu7VuJFxKt+8+Lxj3sBOoNteYKMqY3XonH8ruEAtejSIQfMa4SfYcJD3xG3qh8CXbIRfK7VMqO4bZjSchvrxwRgjvU49rVK6HuGYfxxTk038vCzzK9L+eMB9dYJJj6FK7MtF04ntDIquPOJQ57sLk4NOgprXsoVC3/Z9dYbHg6vEyaF9LIUYY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm5QOUk3U05iUnlFOUlsVFQ1L2RPc28vY2FXaW1LM21YV0dCZStkcUFyNE9w?=
 =?utf-8?B?d0hiVUh1RTJZZWJiRnNrNzA1VzZlelFXRlFXeXF1R2JMSVNtUTZvNk4rbm1H?=
 =?utf-8?B?N2tmV00yZHNMWHdVdG1IWjVHN1dKV1c3Z0QybzN6KzBpWG15cUo4NWdVc2pr?=
 =?utf-8?B?eWplaFBTbEhMcUNKOVJFWEJXSytRaW8waFVlWUo2b1B2WHR0dW01bEhaZHdE?=
 =?utf-8?B?a3dvN24wcjZ5MnhSRjVjRDFOcWo3WDVQZTFKRklPQmJWcDEyMStuSWt1b0Z0?=
 =?utf-8?B?WXJkaFY0TTRjbXVCK3hSbSswV2tXNHVhVnpYQlBFOXRtS3RqTC9WalZWL1JX?=
 =?utf-8?B?a2dYT0hsc3YxV1JzWUludjVMdGtJVkVqbURCUTYvUGQ5c3dCUjhCbit2cTBv?=
 =?utf-8?B?YTZqTVZyZ3dnUXN2dFNBSWlUZ0xjeFlxWnBOZEdoc1c1STh5K3dEZmdEN092?=
 =?utf-8?B?YnpLZzd5S3dKQWtvZ1dmclRkaURuOFoyWi9QbW5ncU91aUthOE1xOFQ4WXY5?=
 =?utf-8?B?WFhLWTdncXpxQXVWaVUvb0xLRWowd3cxLzhWVHdjYldFbXpvTm9ZejVCVUZL?=
 =?utf-8?B?YmIrYmYvZlNDUVloWnM0V2xtRjF2blhaKzk3aUFaY3RtSEJldDBPQnk3MnNu?=
 =?utf-8?B?Z0VCNFJ3eGNzRUplY0RCTjR3a2EwRDdKaGQwYkEzUit5Q2tnQkRYUTVvN1Vm?=
 =?utf-8?B?Z2Q0QUhOcWZzTkpHYTNWYUZncU9PaWU5NjRxb2Y3N0JQVmVjc1FHOHFLT2h4?=
 =?utf-8?B?QWNCYVV1N1QvaVNGd3NBeFZkYnFPYjNHOVJtYUcwTWlHZnc4M0NuZUtkeUZq?=
 =?utf-8?B?ZnpTYXpCQVVpbC81K3RqTGl5OVFxbHhuS3cxL3M1d2V5Qzh2Y2lmTGpwVnZK?=
 =?utf-8?B?bm5iTDlsaFFJNERDSDFrNDl3dWNjdTUyTXBNcWwyRXNsK0k0RkdBb0I0c0FZ?=
 =?utf-8?B?Q25nSkNIMDd2ZmpCbjFnZkhJU25oTGZ3Skpwd1NWQWRiQlB2Y0RJU0ppTzhj?=
 =?utf-8?B?VFp6bDhnbUVVYTJoeFoxcFdiMUFvOEwwWkd2M25OWVFMa01DMHBNWGg5cDNw?=
 =?utf-8?B?MjVyb0tvZU44VGtTWXNSVWVYZThLT2w4SDNoQ0pyOTI2b3dQL0p0UVJYY2VT?=
 =?utf-8?B?TytFMGhGVFdsU25QYVltRWh6TTl6UlZUQ3lZNERNSzdTZFkwL2F5ZFM1ZS9I?=
 =?utf-8?B?aXJZNUJtYTlHQ0ZtVTZNNXRiRHF6alZTNXlPZEVkRS90aVFVUXhPRUQrc00z?=
 =?utf-8?B?Z0VzWFdrSEI4cGpzSVk2V2dDWjZMYVRHSnQwNTluUWxFQzhwT3NjeTJsaVor?=
 =?utf-8?B?R0hqSnNyN0lnTkF5Wmd4a2N2TkNpVllwK0tPbnU4c1NtU21GL1pwdUk0aG5P?=
 =?utf-8?B?em5uUFN0d2pWajRaaHYxQitReDROQ2lMQVc0T2dvVW50dFBZUlJMNm9ldWVX?=
 =?utf-8?B?V1hGQmY4YVp4Q3pWZnJHa01weUd1NUZmSVlyZFRwRTUxaEcrd1lxUkxmcUZ4?=
 =?utf-8?B?dE5kUWRERVZQMW0yNXFMS0FzN1BOZWQxdGphcFVyTXBkUjZyeFB4VGZSTG5t?=
 =?utf-8?B?QnliUFhyU0RvQ2Zqci9mWWZka29ZdnJWRGtaMS96SW51MkcwZHl4K2ZOWkhO?=
 =?utf-8?B?bnJGM1BRY3cxanVFbW1XbEFLMDB0L09VTy9tVVN2S2pOankvVFpyNTB5KzRV?=
 =?utf-8?B?R21jcXpXRmI5Uks4eHROZVZuS2NST1l2ZmNlUWRIOExMT1h4V0JibXJDeGRU?=
 =?utf-8?B?NlZpWHVSblRFV0pLeFpEOTJSRHVqdmxnQkUwYS92T2lTK0x4Y25hSG53S0NJ?=
 =?utf-8?B?Qk1sZzl6a0duai9Td2tacTFvOHpmY1lpeHh2TWVqemNLdkxCRHJqR1pzTUtQ?=
 =?utf-8?B?elpMa3V4VTFzblFNdU13S1VYSmhBM2FPNWJNZmlOMXM2RCtyaWZhWDdHSkJU?=
 =?utf-8?B?allLSitjQlhYRGtraTdPbDdBVUE2MlN5NXRQNWNxUzYzM1NrRlZzS3QxM09G?=
 =?utf-8?B?NG1NdFZGQUtQeUJkRUg3THJZSHozd0Qxa3JTUEp0QUZscnRXMXJoTVlIY0Fk?=
 =?utf-8?B?TDg3enNqTHR3bW4yWjlSYWtuMW82L0RULzltY0l4RnJwUThGK1QvRVRGS2dP?=
 =?utf-8?B?TnFNNXJGdjc4UEdMSEpSNkZNTDA4WUhYMkZsY0RZNk54UFl3NnJnUDJQRXBF?=
 =?utf-8?B?QUp6MzkvNlk5YWZycTkrNFdTUExuSHl5cldrbmNVRDAxb21la014ek9HUmFw?=
 =?utf-8?B?ZEI5VjcwU2hUWWVsMDRDbDNjb3NoT0VaM1F5eWVHdXdpWUVaRzBoSjQ1VjBN?=
 =?utf-8?B?d2xoTFJPUGR2NWFiZS8wSFc4bTJ4Y09wUHl4TlFqbDM4VllON05JbFp5WVlY?=
 =?utf-8?Q?VJqyuIcI4Fqn4HRVdHUp9ryJ+eZP4WxzUrLU/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac0e861-9ffa-45c6-447d-08dedb7b31a5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:25:29.7205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GWOcJG3P/gavVodrvQ1MNTSW7vWytDMMIfca5P6kUr/cElHpP39kGRpO4oQdZFxHpqygUCHQjzyqnfbYHyvHINBRkqzhTIaMjZjignEbsEGxbPtoAPq/m7jKyx+zqdo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9705

From: Frank Li <Frank.Li@nxp.com>


On Tue, 30 Jun 2026 18:36:26 +0800, Xu Yang wrote:
> The first USB port features a Type-C connector with dual data role
> and dual power role capabilities. Add the Type-C device node and
> enable the corresponding USB controller and phy node.

Applied, thanks!

[1/4] arm64: dts: imx8mp-evk: add typec node
      commit: 6e62bc736674601a8764f01217ac539e75d71fc8
[2/4] arm64: dts: imx8mp-evk: add usb3_phy1 tuning properties
      commit: 05d5a7fcb2399d4398a651dcf3b4a01290418435
[3/4] arm64: dts: imx95: switch usb3 controller to flattened model
      commit: 94aad340fbf22a8a2484879c1e862c856d0e946f
[4/4] arm64: dts: imx8mq-evk: add typec node
      commit: b9fff21cbd480f47f04debbce6c14f48dd715f0a

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
