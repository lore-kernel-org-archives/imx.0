Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1CC3C276E
	for <imx@lists.linux.dev>; Fri,  8 May 2026 14:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251611; cv=fail; b=unurcgwNx/b/o7JoIIQpqm+LGiAr8qdREIX536NKODK0HOR3mOT9bvCBVvbBaTx2E7X9kTvufpO4xOjf1UUDlvIO21PmnQ1d1hlysTbF0R10wqWPPlVXdcw+m5r2HTOz4krdK1xBgpCYhR3eCGne8Lfrqw0cTQFGh7c+oylQlos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251611; c=relaxed/simple;
	bh=Z3Gi0Rg+FgBKqL6ToM10ChkXzfEYn1fp9w+U454+jmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BlXD4HuY7q4QVoAPJ7LBuXHRcd5J+e4zISINJAdV/TwgBjOO4eq9meeCPabvrpCKBWwNyRTFweyyzo4/uqO0GewXkBI7ML5cVvIaX9NVZqevVEYjRrGGMZ6G/9wbZgE+puo2/32kO3uNVfO3MVsYLiOgQBiE6iyHU4XTZkulXw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wv5c5uWO; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wv5c5uWO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdRjb2LuD+3sPxYMIo5jYyYVNoxZghjt0SdGvO3eZucZMe0q4fTHfFA2H7srqVf5yykzP+i4wgDdJpH2UPHl1QdZym6tNHJtpyTrsLJtDmBlpnfRUH+KGsgw6GbBAp3y/47abs7mJgQoKPobH2W7qH+l6SQCVSsrh2oH5zc51Ur7Fy8AbJ/UvRwFasqQThLmzOFPVVUoSof2ev4MW4Zh+qH+Ax03BceJ7cLl0C9s3Uj/yKuWOC66FynVMwxDQB+VQ+a54XTW3gfzS7g/8aA1V+bwG21+mLIGuauc38C0ea2oYVOK59vcoPnM1fZtRILxcpMbyEcO0zrRbhUEqb0AYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3Gi0Rg+FgBKqL6ToM10ChkXzfEYn1fp9w+U454+jmk=;
 b=O4A/rnUOfWxl2uIGp0qS3sV07402h1m6WCnJAZpnZhhUNvocMZRs/15hDktgnDhvNI7xp8ziHmyzA9j1aCapzPkR9yu2m8vxHRw6KSWbkZAQf29Ezy3nVXPlXA6kZFMY2LjBmwi6GTi2AiUnSHPr7rbu3i7+Irq2qQdMMDD4XOP+3DD3IXyyUb15sTzRcczLllG9sR5OLjZY9W6bQ/OhmOG2tqLDXdCoCe758PLwHluErvNFxwI3v6cJX8RlskxbYV44k01Ja93Anyz1w9ahCYE1AqFNS+nLf9eq8UKHPw7jkrkXKHrLm++mXR9DqWwGywTNrwhXQw/9jwOdYUX6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3Gi0Rg+FgBKqL6ToM10ChkXzfEYn1fp9w+U454+jmk=;
 b=Wv5c5uWOWiAG8ERGwvNvQczOMVlL48C8oVFs5XrSWDS11Nw42300bW6J5QV7RHoOJxLJeB7bOaGZa6ail+9QvkWivN7OLVPbXXdYVqblQMkNWuqUEQsvqfbz5AW4kVmJh5xHvJ2z+0Hi63otAz8AXSRtoQtG3fXlFhRqUQBAbVdYB6byxF3fH6vESpRf7sMW83PvFeAjqrCmA/wnpXO1ehRqc95djAxP6NjQyuztpMhI1cUHNGXCjxHY6GBMCr4vzcLspDYeAoiUiBr8yCB4tflVAY8KeUjrk39r6kFqw2bz4mq+FoHrLPySNCjY6MnO+rJqZHsvee2xWww6lSruug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 14:46:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 14:46:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-kernel@vger.kernel.org,
	Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	frank.li@nxp.com,
	imx@lists.linux.dev
Subject: Re: [PATCH -next] firmware: imx: secure-enclave: use kzalloc_obj() for allocations
Date: Fri,  8 May 2026 10:46:29 -0400
Message-ID: <177825150394.3473131.12695193849600302506.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508060020.1840838-1-pankaj.gupta@nxp.com>
References: <20260508060020.1840838-1-pankaj.gupta@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0150.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d1073e-1139-41a5-6a25-08dead10a074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|52116014|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	e8j5BWcYR4M41zI1wc1Uy3dtAnseffNkefzbZIpuAgxSgE1rVxo5B6jZ2hH5vgbf8e3KatYkLBhjQWz+sqdGUesqSgqPDcIUq91oa/YLNzMa+LkPfurPLZnQm64iO8Zr/XQD01/kpDpkqXQdua9HVyOhq9z7DtcfM1hKJ+O2nnLgUVfRByuksq6LVlyIuH6pfwgcQql5W3yT3SH2jyxTcmkpPJe7u9TZZ551mfeXr7Oi7YKK25FgW9qhzfmq0zcPenbRa1K4QqpulpAqmDYkfTc9+jGrjxGhCf8RdE8Dq/ZcFfktS9PakjYR9uI6fK8BOo8vxAcFQGI0kevnB7MruGy7UVdSUOEH6jLDyWtH9UrTTfixZlAn1p07lmiclGeU/hop3VYYZ9RJw22GQCpXPOVUx9QAjhsoKpsjiHZepgMEyLmv+0laBYpVumENuKgEcb/iSkIj+ADW8SFn8wZIS/BguvWmRttBQVSodxu48UD/cBz9SQXQcKYwhIq9j9JkjSgcCsnnenJPeeq55M8DNVIiCXuH7++sUjeKuuAq7WCvE1S2MfQIhqNkr3jSvZqQ8WQW6W5grKeaN8P2B0wYXyZYMku62TMctQHGHo9DBemuQuhioQ/+6CYa/fFSWtFlpq1C3Rxji0knZtcWQRwZIW5J45T36MwOJQ914N2yMae/89mOsCOKP9LtNHjuvceRDSwphIStwUO4U8MebuvUEWVDuHxsxV5Kqx4wMJmFclFPUWQepTxhGxziGbHTfhkt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(52116014)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3liOW05ZEExUnJMRG9jbDQ4RjhVc1hkY3JtM3duWGhCNEhWSVZCUkJKSEdI?=
 =?utf-8?B?N1BLUnJxcVRDbU1RWjN4b3pqbGdWdTZiNkt3T1VyVnBGNVlNVjk3VWF3aXV4?=
 =?utf-8?B?SW54RnlLNlZ6emhYZUlEemxLOVJEd21NaUdFcTM1dEQzbFYzVXhaYkMyZVJ2?=
 =?utf-8?B?TmpKczFORVFiV1ljaEl3YUhCRm5vV3VCUng2TDFESXpVZ1RvN1JsS0I4T1da?=
 =?utf-8?B?MUxHS1gwb1pqMklEb1ZMemMrSWZqZjlZQjcvSnc2MzNYVmF1a0gyaWZGRzVl?=
 =?utf-8?B?eVZ6eGtHYis1RUw3UTgrOTNhVkg1SlVTaFBTNHozL2hUYzFHZDVpWHhpODdv?=
 =?utf-8?B?TjRDNkw4YU9mRy9QV216K0NuU1pncGJJaU1MQW5XNGdaaURnYjd0VDBKcUJj?=
 =?utf-8?B?d2k1MEQyamVhNFNWYjZ3RFNxcnhYQ3VhcTVtbzlXQVdmOGEzMTN3WDI0ZnJB?=
 =?utf-8?B?WEo5UVlrbzkyQm01b3djZkR6ZGhqOU5yTGduRVBFNWNlSkRhS2QrVVNpU1dx?=
 =?utf-8?B?Ulp1RG1NVlV5dDhDbjJMQVppVmtGd1RZaGh4aHFYVjFMOHBhRFo3a1pNKzRS?=
 =?utf-8?B?cTQ1dzV6WXlRem0wTEV5b0lBbTU0Z1N1T0l6OXNSMUR5dGIybEM5QVp1UTVa?=
 =?utf-8?B?VUhweWRuWEg0L21PRnpjOGZLWFNzNkR6TVhyVzRYek9xcXFhUHlDbjZEU3VO?=
 =?utf-8?B?dVYrOXdxU2VkTVhLd0QrWE1tbzdGaXlKakw2eWJoMHF4bzFTQkNaS2JNdExI?=
 =?utf-8?B?dXZTdWdDblRaeTFWbVZxVEFBK1hQc3d1RzFxbDNYQ3NyREVwblM3TUxVdDVy?=
 =?utf-8?B?aEtCVHkvUEs5R3kzNXdJZXY5dEI1M0g1NU9hZ25pMkhMVkJqcTBRS0JMZjJv?=
 =?utf-8?B?eFI4MmlRSjgrUzR0OWQ5OFJ5aE43c2NscWJ4eXg2aGg5Q01pS2Q2WDhaS09y?=
 =?utf-8?B?eTV3V0dDMFdQT2ZuSkY5THBGU2pJWktHUVVoQktsMVdWek5UWjdhNTZNblNh?=
 =?utf-8?B?U2VLQzBuYmVqd2ViKzlGU1E3ZEhJZ3hmT1hQSmxpU0lxVjJOY3JjRVNselpH?=
 =?utf-8?B?cjUwajBmenVzSVlpZ0lXUkVKWTNCd3plU0VuL1VubFBSeVg5TEUySFVaUEZv?=
 =?utf-8?B?SmtaWnBTdXVDdnlITW5ZMDB4ZVlmMllleWZIK085c2tqVDFORHFCUDR2NDgv?=
 =?utf-8?B?MC8zL0RXNWloV1dmRWpqZzk5TGdjRW9JS0hGd3R1akM1N1VyNmJ2ZS83Zitq?=
 =?utf-8?B?ZUFIZnJWWXFpekMvTk4xZDNBc0dneHNMU2JqbWdnYmR5cXNtQUdVRVJHamh2?=
 =?utf-8?B?N3Z6TDcvK1JrK2VZRU5zTXJIODQweHZ2QXVQM1JoK3NkY0FFWEVpcFZ6WEV5?=
 =?utf-8?B?eXpKMDlRTmpjL3pDK3MweGwvQlhES0dvSWtVdnhlRmVxTzBpd21jU2ZRZ0pT?=
 =?utf-8?B?dHJyeFQzZzNHTDdYMzkzNU15ZGZhaHl5Q1Y5QmM1VjBOTGx6dTdJQ3NvOWxG?=
 =?utf-8?B?M0Y3LzI5V3RsZkpLcG5aNytpTkxuR1hicWE0NlhsZjI3SEFOSzAzckJCSlhi?=
 =?utf-8?B?TkRvVzNOOUJTeHB4clJHU3FmNzhjWEIzM3hBaDEraUhMTE1QTVpBVmwrc25K?=
 =?utf-8?B?QW5ZYXRqWEp6bmJqTWtoT1A1TjAvelFlUk56czk3OXFNb0VIeDNRUE9MR1gr?=
 =?utf-8?B?WnFmNS8rYmhBbmtxa255OCtwVi8yMmEzRjYveXRJTUdreDRFc2tzbURKTFBh?=
 =?utf-8?B?ZlBSMzlUWmFYK0hUZEtCTHZRd3hwWFhwN1FrRnB4N2Zkb1kxZmlSMG1xdmVN?=
 =?utf-8?B?WGxtMzZWNlVCcDR3MThQVk1oTlo4eTNpNzhoV2hkL2UxdjNFdkFNWXF4LzBm?=
 =?utf-8?B?VkpGMUF4TlFTVDBhWURleXJVckdhNHoyNnRWM0Q2WG1yZEt0NEFhYkhOUUUx?=
 =?utf-8?B?TTY3OTZQY1AzQzM0OHZrNlJlbVVKMld4Y3RtUFNMS0lQSExzckQvQzhJRVdF?=
 =?utf-8?B?dVhUMkd5SEcySHVEMEtkVkdhb0ticjM2MWtUUUZyRjRYNmNXUnl3bTRBZWgz?=
 =?utf-8?B?dFo0dUIySFZwaXdwVUFzUzJseEJvSzl5ZW1sM3IvVkt5R2RtZnova3JBZlhw?=
 =?utf-8?B?ZmNCck1aTEFUcHZQdHJ0ZlhYN0dBOVJ0ZGEvVWhDbUdVRWFBMGFpaS8xS28y?=
 =?utf-8?B?QStVWGxJejMwQmZ4UzRBVVk0ekQzU3hHQ0g1KzNpeVZlR3NDaEZTNmpwTVI5?=
 =?utf-8?B?Ri9odm15TDdGZk5EeEdTSE41LytRK1JENjFXWkR1Qkw5ZUhhRWl4ZlNXdGRu?=
 =?utf-8?Q?svU2iWY48p/cp1OQLv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d1073e-1139-41a5-6a25-08dead10a074
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 14:46:46.0051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTl226n/4qyH3L6cGenuzhd4WNQsrBiowFkGHCAR5ykcE6nHdfvv46/HYrdbimsg/QGiAATMzAxJlSd1MlP/GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8247


On Fri, 08 May 2026 11:30:20 +0530, Pankaj Gupta wrote:
> Replace kzalloc(sizeof(*ptr), ...) with kzalloc_obj() for object
> allocations to follow current kernel allocation style and reduce
> boilerplate.
>
> No functional change intended.
>
> This is a cleanup reported after initial merge and is intended to be
> squashed into the original commit.
>
> [...]

Applied, thanks!

[1/1] firmware: imx: secure-enclave: use kzalloc_obj() for allocations
squashed

Best regards,
--
Frank Li <Frank.Li@nxp.com>
