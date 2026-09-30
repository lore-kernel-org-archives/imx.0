Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67A84E9C02
	for <imx@lists.linux.dev>; Wed, 30 Sep 2026 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781500; cv=fail; b=G2/sMMwIbXubwgXxksiJUThTjocoY24eSeFmhqJDOXAA77+xrh0BtgoptHi+aNtA6w86dpWjloiIMn8WPyKFd5n4fYIEWMKaN2YtqKBkjoIsCP9Ri5eD9QHRSZA1aZzmXyYuBOzZKrJHCs6FlkrNy1EDXSBVyFQiyCI6cvJAR0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781500; c=relaxed/simple;
	bh=vndDUQfe5zJVmKHRi3ivjoE90KKgod+DdFlMtreMQ3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FhDHrbNEBU4gF7p8oTH+JCUm5clbyhkFANb8RooeJCxqEFOXPsTPh9GNeUxd8sRQTuexS6w34ZQCOvDpebLQSopya1LPxJmFzAER3Bx68fuDp5I7tf5qcNvZsgfjDu7dQ4yPjxoTsypKTpZhR2riTbVTMW8iUWflqaA5WtJekqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=w0LfBnmm; arc=fail smtp.client-ip=40.107.162.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="w0LfBnmm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nV78QrvTSZmAXeiref4MA9SCwPVqofPyImu2slDj773oKz0lGJhkKJnKu1pJTZwR4TeaE+Ka+pbNbpJH2qtalyjE8dQ6eWnFdVC2H3Iwa0CxoeIM94DhmKuQ1LZHHMnQJWzAkoY6GZ4pz/sWFfQBZXF/b44RkRAH+FdRd1k7uvF5IWbfpDWAh42/aCx/qv3+6vwsSOovBoBkaEU1Y0rDZNXWTaItiQ1Ega/KDPojrkf8CFMJfp90qsRy30WUxMzhABmAnthcNAU1N7jEAXYID0Lq+J0plgxcQenKj17s14PSSRfKCNVSN7X7rPlkveCtyZtHLjBghH7Lr4akcQqf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBJ+BgAwsuYJIa3K0WNtRKZKS4n8kXSHaCy29OB762Y=;
 b=mOUp64ioEWtyQIDGrM/Id1nHvY65QUQTlCpuikRYjwZbX+6wlvzDItRX0puldOGKDO9YAEv4HeYEP2V+ufCdualCpHig1a3RZj0VOwH4Zux2FqrDrQViqtQykiIxJSwcXtGax1Cl8eVHvuXFdQUMJTq145LFgm4y+7OWOMQ2CYukg729SGt+Yne5FD1V92H9cc6iv8GmTnZvMvYNP24NCq+FMaetPMI8UyKiBZaSPhRD1FzTgEas9bSjHkx4QHZBiFw/Swjltfq2O/4xdKfEP12Z93viMebHpuhf9LtnxQQIv1wlQkTTm98OIdTd5hIIS+BOd7Xn2G2xmX0Ahv6Ixg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBJ+BgAwsuYJIa3K0WNtRKZKS4n8kXSHaCy29OB762Y=;
 b=w0LfBnmm3GxFWNmI5aujZqSM37Xv239PeIR8ENf7+3nCj0heXt0dbd9cHQ2GHIdVVrK9aAZWX0YlZyWjuK3e88JHE/cEyvsmJNrXDzC/Q/fy4DcYPTEoEjb/j29Za4b1KOqYoPptyOgWTG7KoO/vpexAyDvIyGUlWBNAqJVRBsyJhz3inOAanZiBnjNls2hT1fGZZrYYzWtUkzcxv2uBZOw3OeCVEPyjn+dRI/rJpkgfHo7rauoZ/Cg58cha0YFl1a6mDInXohK+lVZFaLzmliTK4bfT48IS6fvHNBnmBpCAeKsd73CqAnJSynSCD/dVpKcuISf2dQZLJemP8N6DFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB6957.eurprd04.prod.outlook.com (2603:10a6:803:135::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 15:18:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 15:18:05 +0000
From: Frank.Li@oss.nxp.com
To: Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Tom Rini <trini@konsulko.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Stefano Babic <sbabic@nabladev.com>,
	"NXP i.MX U-Boot Team" <uboot-imx@nxp.com>
Subject: Re: [PATCH] ARM: imx6q: remove unused header includes
Date: Wed, 30 Sep 2026 11:17:56 -0400
Message-ID: <179078134446.567194.5317242454962834738.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3cec5f38-e0d6-4d12-88d4-74cb0000a2f2@gmail.com>
References: <3cec5f38-e0d6-4d12-88d4-74cb0000a2f2@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR19CA0047.namprd19.prod.outlook.com
 (2603:10b6:930:1a::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b26f46d-a992-477b-5e7b-08df1f06069b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	q7zcYIYz0kZYAgXJp54fHpPHMYxkkMoHjlw5CmGWlQFfqxCY4OkXDT+VLBGVhO1PXmGeWK3oU3lpv2ctyR+4CoVchOzAhf+TlTKyQF89KFi6jO//EDO/5IyRNbr0yXJgc1XxuKpf/d3jxAlmALRySKOfDMn534VmMbGecd7G5A231tUzoVsATPgG8xFlhqpS7x/YqsqQRBdCcjgL3GQMeG3wxs5HZgIHS4uj6b7Vqne1qAcphBp2dR4Gk9BxM7Xk85S/bac/EKClAzT7EIjCrzwuefcGwZbKJdezkylzG1qm5D5h3bvAxVs21Nio5LPIx5ESGCoZbLQheCbpgCmZMpfp7UyFg/htlA7sNMVeJvaGZoKTh3oBVQUJu3hKIgWBU31L1RcSEVMzss1LMNefQxAz+JN7zMeLmDCTPStuc+EtWi/D2ea//V8vMmmx+4i72Lk+nCKjMZ9lP8VB+0CkH+vso5cuBFKuVhyMFN9sP6kmNEREVsp5J2dkVdaS3YKGxLrAqFEdnU5eQoztET77/bkEv/OFjV+4E4MLlHJhXcqDWN78kVjShibaDunJnrkBVVt24k9Wgm2o6M0mDoJOF+KvrkFc1IfkjcL3dVEFAQixqRNjf0Iq7SkLBNtrjFeZRNCKWUGLQfYdnEnfC7UiFyS9r0ZqUdPg1EHsoChW6MY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1ZFSVNVQ1pGdEtCTDV0ZHExU3crR2w5blBmTlNZVHJXdllUU2xPT0l2YWVv?=
 =?utf-8?B?Q1NqQXFTMVFZcnhaNEZoWHhhVllRTDRnV3FXNTArTDVBbTJuSXNYbnN5c0d3?=
 =?utf-8?B?OVZLVm0rZ2NCT3BZaUVoRXEvcVhOYm1ZMHdiN2N3OXgvbWZCalNCaWZld3ZT?=
 =?utf-8?B?MnBNZTZuejM1TThQOHh2Mmh0dGZGYWNTOXIxWUpvS2FDY2JGOTd3VnhLdEVq?=
 =?utf-8?B?REhuWDdUWmpRNGdaUlkvZGNLY0V0Vk9MWGpUek4wM1VkWUpZQWhUQkFGckpx?=
 =?utf-8?B?WHNnOU1PNitVc0F6Q0RrVlY0M2I5YjlRdWtTVHJDdGsyK3E0cWlCQisvSzBX?=
 =?utf-8?B?YTZlRGhXZnJ1SHRUT05ocldvOTFEcERwTUZmOFpwdkN3NG5WWGpHZEovcU50?=
 =?utf-8?B?bVdlMDZ5emU0bG1ydk9rWDBLdDkvelM5NUQrWTQrbjZpU0g3RzBNc3hqcnIv?=
 =?utf-8?B?Y1UwaGIzRy8xRDRzY2RZalB4cmZOWXhGTGxBMzhSWTRuMzJXRWtJMUlJMDg2?=
 =?utf-8?B?YmRIenpOUGZHejMzSXNURkhLZ1NZRTVaaDJJQVpPTHI1WDhsY2Nidm9xbEtU?=
 =?utf-8?B?ekVZNEtuVHZvdkpEV0FiTGxFZktWWVowbDVWZmlMR3AvRlhHNUo4bjB1Q2No?=
 =?utf-8?B?V3kvR011S1ZmY01udi81S2RnY2N6cnhId1pWZ1N5NjIzRDlCREFpZGdJSDlU?=
 =?utf-8?B?OFFIUXdoeDB1MWJPU29LSkJRWGJIcWxZVllGV2FOT1FETGJ0VmxYVmtIVUQ5?=
 =?utf-8?B?UVArSkZjQjg4d01MWmFTUHk3TU80RFJudE1JblhJamRGeW9GRDlEQ3Y1cjJB?=
 =?utf-8?B?R0RJNmJQQ1l3YzIycFJTVEhhU1JQWWR0eVZJMTZzWHZmNmFnWkNhd1NHVTB3?=
 =?utf-8?B?N3hQcG1jUUZ1c1Y0K3F0TkZWeEVyN0tqSFRBS3A3WHIrd2tiYlMrYWdmeDdp?=
 =?utf-8?B?MnpyRGE3ZnYxbnV5LzdxeUgzSW96YmF5TjFwY3FQRDFFK3VLNnA5VjlwZU16?=
 =?utf-8?B?V0wwblVnWmIzY05CZ1ZsYm44M05EcEh3TGJhUWVvZFhhMlpVc2diSUpsZzdK?=
 =?utf-8?B?ZGhaMkF3VU1PbHhRNGlFVTVUU1FJejBONEdsQ3VnekFuUWVWY0t4NWNZWXBk?=
 =?utf-8?B?a25oU2ZCS29YbWVrSEN3ZTNCeVdWa3ZIRGtFajl3OElJbEx2ZjJXSERpLzRY?=
 =?utf-8?B?ekZyLzY1cDBRNFI5TkFiUG1nN1UwbGhhdUNoUmNjMkNJcTNwZnpURnIrYlBT?=
 =?utf-8?B?aW15ekFSU1A5MFNUZ3FtOW9IZUpvWTN2YzJVNWM4WDV5L3lBdnVQM1pTcC9X?=
 =?utf-8?B?dXVCN3IrYTVLQVVKOENwU2dWK3B4OWZlMm9vZ2k3ay9DUHFQZUYvQU9DdlhM?=
 =?utf-8?B?YW1UcEVLZUx2VHhjc3hkUFQydVh0TnVIV3JGSWl4NHJ6UVBtRmw4N3BuZ1hE?=
 =?utf-8?B?QXN2Nml1aHJVeTFpVkpoRVFaNDFLZFlqcFI2N0Jqckh2QjRuMHJKamJsb3Z4?=
 =?utf-8?B?eXVSOUtEN0dBNjYvNkRqRExVbWhlWGgrbUoyaWlsQWc2KythTWlWdmtzeDFN?=
 =?utf-8?B?WDd6aGlHZlpCWWJxck5URUtENkkrQ2U5OUZwZDVFNDArN3FvODNwNDRlQlpC?=
 =?utf-8?B?OE0wQVJnY21QYk0vOTlqcUFML2dvd2lEQU5YNWdVSkZOcVJmTGZYNXFMVnFH?=
 =?utf-8?B?Y25wVE9kRk1ER2pzaWE2V0tnbmlXZi96U25IQlJWS05lVkxOMjlxOXZtTE14?=
 =?utf-8?B?RzNXc2VTUWNwd3IxNmVmaUcxOU1zemt0M0RNTDNzYU83VEp0bWE5Um1JUXYx?=
 =?utf-8?B?ZmIrYm1RUWxMR0JML2NvKzNhdmZ4TUJIWHpmK1oxR2RCY1ovYU1NZjN2T0xG?=
 =?utf-8?B?THFpSWUrL2JwRnUrQ0U4SGFEa1c2cExSZWM5YjNjQ1RvaTFwc25PemlNWldI?=
 =?utf-8?B?Q0thbkhvTUh5N3VCUlFGSlJiUXdZczJNenhMaTYyc1daVEpOUkk1QVc1aFVN?=
 =?utf-8?B?SmZZaDd2bnIwcDd4cTF0S1Z2aCtvWHRvR2lVOGgxVGNLdVFzTGs2RW5FQnp1?=
 =?utf-8?B?VG94M2ZjcDFsdTlLVERSdjdQNmh3Rnlrb0RDRGhWb29nc2ZsNU9PUTk3bTFy?=
 =?utf-8?B?Z3hHd1F4Ry9MTCsyYjEzSTVnelZGVk5LYjYyUFEwYzREdGRkdHdBMUU3SEV0?=
 =?utf-8?B?MDRVSEJQclhadVR6Qklsck9sVG00dWRMalVRRHU1NWtvOU03WTlFTXl6OFZt?=
 =?utf-8?B?NG1iaUJuVXRVdUVxL3UyQWVKMklRbTBaUUUvOFM4NXd6S2JQY1B6VlRndVJx?=
 =?utf-8?B?VzU4c0g2UFRtTUhHM25OOHBsMGdFb2VLNU1MNVR0Tmo3MXFZMnBabXB0MGpG?=
 =?utf-8?Q?El6q+m6Pr55hnCNfIAkOJKgmO/WzYUj3Mvoh6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b26f46d-a992-477b-5e7b-08df1f06069b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:18:05.3258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ummxiySWjvNkljBIHbVMrqAVvPes80foPENJ2mr9LsuZ7sXXJEExhG3u+3CFnSHrHO6mE2knw3ExC/UKBff2AdVU6XRg1BSrWoLXUn+957jGd4a1vVwQjvG/UrpCPLr6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6957

From: Frank Li <Frank.Li@nxp.com>


On Fri, 11 Sep 2026 22:55:30 +0200, Heiner Kallweit wrote:
> After 8392af7be78d ("ARM: imx6q: remove KSZ9021 PHY fixup") there's
> no user of phy.h and micrel_phy.h left.

Applied, thanks!

[1/1] ARM: imx6q: remove unused header includes
      commit: 1a0a1dbf72e7ef7a6abbe14987b249f0f7754aa2

I just sent out pull-request. I missed this patch. If there are chance to
resend pull-request for 7.4, I will include this patch.

Best regards,
--
Frank Li <Frank.Li@nxp.com>
