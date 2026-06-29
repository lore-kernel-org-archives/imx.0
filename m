Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C784938F24C
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782765715; cv=fail; b=jgYtjFqVxAAiZA1Y4fzQ4HPr2hD5pQxca5pU0kW+aHvdyEuSwHPQhAnugsaMXt4o+xxl8bOu+WgAKPs3SjRQLpM4VpsSKdnK0T6q5qBey4R7JHFoG3zu25ccqwb6e72azUFsb5Tw5QUxLa4fSIgGD7mrXyIAh/ytHKh3OGylDJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782765715; c=relaxed/simple;
	bh=nu16N0ofLp7KeRPwkFjyaNNlniJUoZZDkc6S2JPZt7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IYkW0CT7/lpMAauaZxF1Eufgf7JG+0AEY5+v2EilyevnCynnUr7Rpk3crj09WM3nVHnzYDN0PZru0bP7D9/bsJQ23X+ksTTuChz7qn7OsvJriBKI8MaQnA7v4OjIYne9d3gXHEiJ6Zl8KWEr3rNgfa2IV6J9q5OK3QMXX5LWaL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CoqCpN9m; arc=fail smtp.client-ip=52.101.69.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CoqCpN9m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzliHIbLexLraEKNDlc3FMRX7Y//4q31tOMjGhkR9LBtiYlclARaCDRhC7i9Bz68lXNz1OKU+rtfG85Rr681zjtO645kTMoKkp0y/d7BmTfHuXRjwbWwfzJ84XReGKgCpBBST7NqYWCwa80h6wXnS4b3LyBPKbh8qIsZCjvYsTwuO6BQlSvrGoiacR8hhxGAcw/Dla25wbxVPNmv6PX3wzS5JsiWuPvxz8iE3HaG4tJmUxN9e3aBYv5S6i0HEoMQoAdUzoJF72MOMvt7ykZXf+2YoivO/KC/Eqndds5Jh3jWiCZOPtNQXwLZbvdAzb0R8TOeHtpNyk6ERcif+G6qZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+/G6fGJwj33cgWatinfrglRH+cgf3TmqKmmKZEzcJk=;
 b=JV3YmP/FY6nIz3t9+j+W52Z1TuNFdpWWHaiM39uOp+Rk3Te7IcBdz6fEd/DrgrXZSCtSF3vdvmSS5cc4H7PiOahWi+0wM89gAgn4buyH01P6UwosBOOxGYiaVzcwC+vcgRsX87iCDPFbqiDSJ+Pj9jsPAiuMoyW7Q85Bb+W4VI0l2A6fze13DJizFFobDvNWmqWPVbk9mXsJtkohPnEZNxwsZJzLf5Ohsa0AzIj2gdhG/M8Z0fZPItZ1O62XfdmD/8ax2BbTtFx9GMlTvtt2EC+Lbj+Bi/M7ihW0j1hITJULGl5ani5yDD8+yZN+V9ntenCCr996e9yxyTaCkxs5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+/G6fGJwj33cgWatinfrglRH+cgf3TmqKmmKZEzcJk=;
 b=CoqCpN9mx3FjQeAg0E0KVzjgBF2sUpYmFFB2o51RMz72csBcT9wlnb5q9B+PgLDuemrqwKZ2v7KjQ5WSXoDh4sG5nXsTQ9p1TROmAuGc4FNPoxskjv4MUc+lHgYEtSQgvIHIbPUKKU74eU5Zifa//jTE5nps9EggzElXF8Vn49Ie0ZdAaWECYhYE3RDIq1rpMZpwVemgSLJ1KJ1h4aHWpOxrS4xBSoDvbFLOZfOed7eWMp6jgPjCoIs43bql0SZzg1VFJyAVZZ3MNATzEWiHFZViaY1Ivxy/AlFmZMjtnKcc7sXnl1t6jHjkII2dYGBSghM2yAQ0oqaBOvTCS6AKRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9772.eurprd04.prod.outlook.com (2603:10a6:20b:677::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 20:41:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 20:41:50 +0000
From: Frank.Li@oss.nxp.com
To: s.hauer@pengutronix.de,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peng.fan@nxp.com,
	shawnguo@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Li Jun <lijun01@kylinos.cn>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] firmware: imx: sm-misc: Add NULL check for kmalloc in syslog_show
Date: Mon, 29 Jun 2026 16:41:42 -0400
Message-ID: <178276569309.2475689.8476501730139793064.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610003814.75493-1-lijun01@kylinos.cn>
References: <20260610003814.75493-1-lijun01@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9772:EE_
X-MS-Office365-Filtering-Correlation-Id: adbd0fc9-78c1-4f08-a307-08ded61ed867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|56012099006|11063799006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	OPsX0dfrr4S7oYWN0KDWDyGguqqpBlcYUAB6u4/D009qi5Bj8TeokRKNAiQHhIEXF3ptCvUAgZSQBRLPWxK8P6B6qlQStD+LbKR1TRuj8PCmsDrdSQpQ19/OtxdRRMqmyTrMHEZ7M3Y21ZyyZiA0dVfCC62y48TsoJAycVt/Dvz0NLW6tOozaY8jyNOoqv2nb0hnip8MoLxbZDD4Ef8yTiNDC/BKvNHB6B1vwoxoNBW9I4WogccePuG3IfhmF+yC3HQWx7HRPUsuTNg9d1GAFhFl0eYibRRLjucs+p8+efEGb1YS5GxAHYbnS9BSsFf0zzMFvjTNY6Hxg5sG8q3TVQmFjPfY0OX+nR04nV/6HgAFAk7J/8+Grk9RDB3OsZuqLi5aSRNb3vA24YNaAjKjvm0rFRBfoSnBp5VFV61A78WDD4aHWcZp3c5p0KuHvE0biciBdi+T8Xny1YBYuYiKpxr6Yo0tGp4Yr0B6hj3a6OM90xvA/+P6Kb7xld06mCJoqJH7BfBIwZBKFko35p37uuq+bR8lQT6/RC9G7GI3q4Oa2zw6Y2pF3ZKVscLS/pv9ktAomiaweEMx6DWvEWStipGAPTXU4whpI7zksWu81VWrzqFvWVq390CvIL32tLDDMTN1pyPKhS/+HJvIxVGla/WIXThxevIQlxlDqCxo5KmjeuMtSH+QCQgJTsEOUg0MHEyAecbZ9rS03D7SWbcZ/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(56012099006)(11063799006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blJvNmd6c1NaYWphSCtIbkc4Y3lhZlFaQzlyRENMMmJ2MTRNK09PaCtvRWx2?=
 =?utf-8?B?b0pneGJYTGQ2WHdNNTZjQnhYZEIyNXhRMzJUa1dKMjlFZWNkVTB4SnVtSEpR?=
 =?utf-8?B?bEhtU2JmbFpwbGNPQnpVcEZ2cDVteVZmWjVUeDJpV2RKWVNEMzRybUUrYVpn?=
 =?utf-8?B?WnR4RUc2TkxaamMwR2gwWjN5WHdhV2xGTVlncko1bGowVzFQaGd1QnpUdUlx?=
 =?utf-8?B?djNxU1FlQWtqNDI1STNDM3lWTFlMUmlhTTFRM1cyL0FWRHJQTlFPYVBWZjBO?=
 =?utf-8?B?NVFzYXFwbzczLzJINU5lZjJuZVAvazViczdWRGJiUmMwOXQzNHpuaEhTSmxM?=
 =?utf-8?B?RlFVNWVtcmM3NDJRYWlHNkZQd2owNUdOdzdYcFJtdXUrNzhCNGQ4TnRBLzIz?=
 =?utf-8?B?dCt4RTlWNVUvdW8yL2tRUE1DbVczdW9MU0dCQ2hqbGJQNCtqb1ZRc1NjVjE1?=
 =?utf-8?B?Z21IOUMzOXRaN0tyL2k4SjlTQmFwMHJFYVJVcCsvUWRPT3B4eG5xak9rZ3d1?=
 =?utf-8?B?bHljQ2IrOHpKYUJMUkJGeG9IVU1PU1EyQTBzQ2VXWFJsNE9aWFpVNDl0OWxQ?=
 =?utf-8?B?Y1FGM2J2MkFLNEpsRTNUK1Qyd2ErWDlvL3BEb0lBYTZEQ2lVaEhhV1U0eGc2?=
 =?utf-8?B?MmkzNkZicjdlRm1TNVBuRUh2cEliU01GdkIrMjNOMThpTWZWb21sOU92bGhx?=
 =?utf-8?B?RStvZU9lL1ZaclJ3dSthWFM3YUc3OXRXTnNqNnFSWDBqMkltdzJNMlk1QVA2?=
 =?utf-8?B?d2NNREpJSkFFU2ttT1l4SFNPTXdFamt3TjdINU44M0Z6akpXQWZTbmpNbmtn?=
 =?utf-8?B?cUJhZmRWQjFRSUoyV1V2RXNhUzRVQzNmMUJJWWRnUmFzVmw4VVdaZW11V3ov?=
 =?utf-8?B?OFFqT1FXRXpHb0g1eXhlbkpJLytFWFB6VXZocHNDTzNwcUlnSzd5WXRQMkV6?=
 =?utf-8?B?a21Rd2o3VDJrSDJNVGtocUhKZFJtcVN0K3JyeTVISmcyYW1uWDFkUHhaT21E?=
 =?utf-8?B?Q3k1QWZmZDI4dkhQNTllc1dFQUFveVRhRVRBR1NHdXg2Rm9oNjFHUXNmSnZZ?=
 =?utf-8?B?aE9NTFpHWG5KdFo4cTdpK0F2R3FFUUhqdkl3WDlsTWNYd2FGYVJjWkhaU0ZK?=
 =?utf-8?B?c2VJVDV5c3dZTmxnUFFGdVVGQ2grNmN4NzZqQlhFajJyT2hNVzdydE1ROU8r?=
 =?utf-8?B?dElGc283eWFvSnRaTWhIb1NKYlh1U3VFMHlGZHZhU1FLcXV6czVPRWo1TStP?=
 =?utf-8?B?SzhxZHVHUmVlMjU4UFVITnBITjE3b2daTFM3NkxYZ3ZKa1QybW8yNkdGeDFQ?=
 =?utf-8?B?MVFOdVhLQ2ZwWm1uZG52eitVZGw3dEprVEVMUndUNWdrS2N3MTJsbng1ZUdw?=
 =?utf-8?B?SXIrQ0NIbHF1VmVzUXAxMmx3NnhWYXEyUnpNdTNoQjAyWWU4am03YWRMMmFI?=
 =?utf-8?B?Z1hsaUdOSy8yZElzMkg3VGltMUorYmlhRkFXb2FIVHdLZDJDdko2Z3VWMDU4?=
 =?utf-8?B?ak5EZWc4NzNtLzY3MHpMN2VoaW5uY2U2SGtqNmZrSDRseDVnSUJIR0ZESVQ0?=
 =?utf-8?B?RUgxOHAwZHZDQWtWWjB5VTdqRUJWVXc3R1Bzb3YxaFowU2NHNHJObzNvU25D?=
 =?utf-8?B?NmlSaUt2ZXhKM3JSUE9RSU9KSFVuSTdTb0NxMExndm9YbXExek1TNms3bE82?=
 =?utf-8?B?WkU2NFNTeG56SnZSN3M1a3BJc3NkOFlZUWxRT0F3S2hhYThRTlN5cTN1Z3k0?=
 =?utf-8?B?Umw1LzBKaHFFaTRrKzUvSFpIckFmOG9ZVi8wR2RXa3FGN0I1S01hcUNsa3ZB?=
 =?utf-8?B?dENuUVhadjNHenl0OXhlbThwQmtSVWJXRU9kY0JEV1ZKK0ZnQ2Y3Tmg3b3JJ?=
 =?utf-8?B?VldIaFExeWhNaHZwcEJZcDFpbEROZGJhSXFJb2R5WC80RnBuVVlabm5qZXdS?=
 =?utf-8?B?bk1GaDE1VldXU0tqUS9jU0NCQzJ4NWRCK3RqSjJhbkxCYzdrU1pqTitBblVr?=
 =?utf-8?B?Z0NKMU4vaUJWVEUwODVwcnhaTmJBaVdtZURkU2duRGNKYy9jYkJVNWdZejdq?=
 =?utf-8?B?Z1FydEV0c1l6TnpnMkVtMUVwV245Q2dqdE1oL3RicFlNaGFnM0dMaStSdUhG?=
 =?utf-8?B?S1BqaTlYb2RWdTNyaDBSVEhEcnJiQ2Y2LzcrQWFlQ0k3SzF1MzBrVHl6SEhB?=
 =?utf-8?B?TU40T2t0UnBWUGVHaDZyc29EUEJvemUxODBTblVIS1d5anB2UUR4R3VBWFk5?=
 =?utf-8?B?QmhKV0RsNGVSSFgycW1lRnpxYjh2T2hwbFdaT1F4TVFVbjJBVXZFbEtwUTNT?=
 =?utf-8?B?eWpNVUVaNkhDc1RGM2dpeUZwYmxWNitWU3JvS3NGUG1oYlZucUN0WnBoeDho?=
 =?utf-8?Q?2+sfRKHDkUmbhx/gcX+aCeeTULAcxTTrdOqOm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adbd0fc9-78c1-4f08-a307-08ded61ed867
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:41:50.3310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVOPUrXJeC+URueZDau7tkpchzmDgKDZe4poNksl1CLMgxV5N0RMyJYHTjrRm0qLGq0R7jirk7PrVCke2SxxriAVgV/D6lLXJ/jfFKP6ExUnfgV5Tx8tWLvEvA+0I5Dk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9772

From: Frank Li <Frank.Li@nxp.com>


On Wed, 10 Jun 2026 08:38:14 +0800, Li Jun wrote:
> Add a proper NULL check for the kmalloc() return value in syslog_show().
> If memory allocation fails, syslog would be NULL and passing it to
> misc_syslog() could lead to a NULL pointer dereference.

Applied, thanks!

[1/1] firmware: imx: sm-misc: Add NULL check for kmalloc in syslog_show
      commit: 4cf26bc2e7e099c86127d63ed7272753da45737e

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
