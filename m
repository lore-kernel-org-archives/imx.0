Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazon11020089.outbound.protection.outlook.com [52.101.150.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08173A1E96
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.150.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109455; cv=fail; b=KQQoh4DB53MYhuOcW44QV887uIlIh5qxP2SSCn47JB8O+b7LApinMNpFnGrR7prgnKTGsQ2+Dp6DXPdQMC+fR4BFzn+oYR4P8Op9ykpJqU5Jo+BlxLnxmKGaCEWsAvOogkwsvyn4/ICWOw0o11fnpI6BiO0D2zHLpTCmaUtWM9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109455; c=relaxed/simple;
	bh=huUemOtJ3nRP0CztdOzLFdL2gwjvAZ8IGVz6isCyOBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h8lKpLT9pjTMzWX8MTx+z4CXsz+z9t9eAHhJb5ddjUw6kzpIsM0f9mjRtha54/+e4H9VXsNArTLlkFNP2ftbpBL2+m+Ujc3pq7C8bECZSEdRk7yFkz5k+3r556L91He7vCABwrA4z4UwqZBBMK8cumpOAFyVbxCp9uL+6H4uyp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; arc=fail smtp.client-ip=52.101.150.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smAbDKKjWyskadACiOahg1zrjfTdEESmsONog8PfZX0apifDtsF2x4lCEtl4ai1siM+Pa2tm2I7lelRXFH4W12fBECob/piHhJOpGp9B77K1cwC3vk92iu9uN+87ui2cAYjUCZ8ka1skK0C6IOCfp6WrraeA9wik8lN2/eXY93IElgoZB3q2yEO5JgCAdAcWTWrKMuhRpRI+OKN/p7/u5r4rW3/oXVqL9+KG0IPs9yW9Ru87CZ1pdAR6IZd+tTAfGNUpZaP+cq5JHp6cZKVINB+j/1HPUCROT/4wDJW6I7s+e0+fYzfIatl+lm2RE6qMljYkGk/R9PHIcYafx00tBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62PSKFADmKJntnWvxAacXn6TiTrG4azF/+bi5S1VWLU=;
 b=J1ZCUOZZ2tIkRYPsuBC0Hjv+KO/VkqNAOwQreBPpGkMoUbMU32Jw7KBni27X2IPdR2HwGnim6Ux5wW5jhGbC8zuke/dNTwEe/pPHin5ztfnrPQDRryn+KBbmTwrSU7IyzL3oFqFKIvh51Q+IojVq79mBoNuDIOxoC9AOSB9snDhQ9gHwiK/DYsFeArkj7v8LqIJISRWqPceHZhVOADTqeJdihuqo4ONb9H5SpyNrDCI4uEUrK19InleAknTP2e+e3CiCoLfpleRz3mgc2XVyCCfVwR+nzmj6mt9DmSuVR4GoBJTgLpQoafRJnLObANRCS6ZfqtzQgIo5z8h+MQzm9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SY7P282MB3978.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 13:30:44 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 13:30:44 +0000
Date: Fri, 7 Aug 2026 13:30:26 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: imx@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH 1/5] arm64: dts: imx8mq-phanbell: Keep the GPU rail on
Message-ID: <29b97e0542a825ea957167911de12fb2c2fa3d71.1786107926.git.rudi@heitbaum.com>
References: <cover.1786107925.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786107925.git.rudi@heitbaum.com>
X-ClientProxiedBy: MEWP282CA0057.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1db::15) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SY7P282MB3978:EE_
X-MS-Office365-Filtering-Correlation-Id: db77845d-6040-4da8-a0ee-08def4881532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	q+IIHB9nrseeyK2uDEZ40JeQPjYFFA7rg13Yq21GduTTBKBn90tpVvL6mkaWBEuHfhnUEb06AbDmGtO73ik15fY4S8po9V+lQpo6IuX+rxv8QHEPxxEhHpex6j+oxwavGJU4RH+PaLFUpuLyukpWpo3POXz08USQ8F7C4lTrFcSVx2iwnq64YcLwEiiYDBAahNAYPldfM/Gq9YeNSUtqBfN2L58CdPC5CyjxMJk5quYSFYFvf2bzHmTZ8x7DQYQ1ZXAsJokTehYy7rFQ6gpi0+2CFKuNfpdhMih0uaN3R2FWxKKV5VHVbBU1stAgxO+cIWW3KVwfgUJ/XLSxeaYaeg9bedvyBLEBeWDTgH/A4968Pd/PFWom7whvt55b6aRLJ+BnWkSR+17xBQLiIK5O7GI+FNcXXSoiDnt54dzFfWiQ+e510xriEdcRRJDe/bpLgyC27dwaC4t2dR6uKfCrp1b4qdhnpmQ527uCpzd0pLKQ1vBkxBVWTBfvHcb4LgxnFh5skdLugQb/y2LEvPL5hzUOhzexXNhRq/CKO6TQQxcb1W+K8S1t1Om4CkAsrBIaCX6ZY17fgpmrSrgevTAUXCKVan8RqrI4Q2gQnObSDuZzkhqF707zVM8y6Z10M5xzTMwnnNDZZb8+xb/1Dim8xjtRnFmBXXpgSQMu9LvxaC4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KPhTUKkInseFQA3SXVlHAe7whDDMMeMDXVlbAz3POBdpLQWbDgXN+a6F8AtW?=
 =?us-ascii?Q?PXHokErqJ04LszwcQiPEGuevovhMgqtR7BhSnDtB+HTR6h3fYCQwUKXjHa3Z?=
 =?us-ascii?Q?7W/Vs+tCmQ/OLDXxBL+TY4nFB1UBT/YMOBmIFr59FMTp/2gzi7eH5eiAS53G?=
 =?us-ascii?Q?tgE/IiNMz2xT/YGeBNk9PNVVMc7bKm/H9iE+0SBVXVWpMh9/UKui+LfrqRWk?=
 =?us-ascii?Q?SEABTRxAPrqTc40hAYuYClhVpfWBEC5VamWFfOJdtHFYFkdgZC4BrjNNkIRQ?=
 =?us-ascii?Q?r7oRudQwpHBoemP4uZnSfJpd9/NF82Ys8RgOueUgrAeNMvSeHjRzKyW/mhMT?=
 =?us-ascii?Q?u6sJutwVGgxFsTA+yNki1p9W6ifg4//Pk73lziqdCyqBaVOaiL+H+SRW0rFL?=
 =?us-ascii?Q?uRfHPzaDBKXpsZ9Z6zoURScs7f0RVG7uYXBbYg3awRmzWJzhOqDkjw/6jRWA?=
 =?us-ascii?Q?KFT3WG67BKWBueKkynVhQ8OdPdL6fopOonKK94AfRiuLwe2TzFNCmzhCYFXx?=
 =?us-ascii?Q?BmoDsc3MN31xpj2V+1SC6UlTqpBCiG3DXMQqnX5/GEpmCmIMXp24FED5HaCU?=
 =?us-ascii?Q?897zB5fxlShopSn1NIR5gMhV+jDwS1lGxd+bime8u5qw1XgBDEj4KASAYIPj?=
 =?us-ascii?Q?MgONFmezpfq3vOKkZcH/M9d40wYRrvApCmaKwl9nhjrixbgABa5iC4sGYsn5?=
 =?us-ascii?Q?7WnqQZuCdo64U6XXfKNTySK5kZsjKgGg7BTEOIYyU4O67TAp7Y10xTow1d7J?=
 =?us-ascii?Q?cmi7xObP1KJZG43coPplfu5GVzBr8pxOvN9pee+z38rTDXvAjnoLk5j9uayT?=
 =?us-ascii?Q?ayxvUdT21MbwF84GbojH6Q/j8Z/7RseU8Rl3YF2iN9l71bHfhtiGh1NySwCR?=
 =?us-ascii?Q?v3FtGl0bOR0i4sy9ao15zA0HnGgmhpyw97EEBf5LqEBYIE5ofh5lS1OoTm48?=
 =?us-ascii?Q?05HbQw6H+jy7laH7KDiznNCIcKTABThcLKjIdKrljrIdCWP3s9rhNwNjd1OL?=
 =?us-ascii?Q?6l+f7OE7noHQa0Vl6DHRHHAMkW1KqhcIyh8yYqWYTBeTQ66Mx3IrkjCR35qu?=
 =?us-ascii?Q?tMAp/YgCWTkXJ3bWAH8TimZR1ifGX/vwwyV87cGefXBTAMmICevcxbSxss9N?=
 =?us-ascii?Q?loxgRs32cRgkytoh4j/Y8u8wpJLA1JCLkEy2P2CcISwKN4ZjJFET9PzMJ3QC?=
 =?us-ascii?Q?IKtHN9LDM5z/UKb0Sce/8VH9j6VaVG1RQgN5nN6GMOd+oOTGYTJAP7WNRn8a?=
 =?us-ascii?Q?6m5u03uCpTCpOb+7AxcWG3KQaFrKkcmluuXOo+BoMSt3Ese1EBCX305KG4pb?=
 =?us-ascii?Q?4wJi8rMckt/RG4LL0N7yJLq89K1Vx18ofqGcgxm1ZRTO49fi+ICbiDnajiLS?=
 =?us-ascii?Q?eVx4gf5R2bTyfyDVyfWLWM/EvSU3x22g8TlTwFp/LXm2tt38S45X8geclTeX?=
 =?us-ascii?Q?oVQvC7+Hmy8Y0CHhA3Q9JjZjXRK0O3VfQqkUMi6lrfbtOZtnxyGxYGFZGXXL?=
 =?us-ascii?Q?mRiM8f7LMtwx6C59Wc8/ENFm3HgUZBh6IuBWTchPUcXIFKFs2Ba52CrVGjgf?=
 =?us-ascii?Q?FMXP3H3KhPlBk/27nOJR4UVFkuauiLNa7iatb2A95YqdvGp14p47nSCa2Omp?=
 =?us-ascii?Q?sCsp7hKd24qWKhkDaO+AVFqiVNx+3FNbMBrrLRSR8f0ub4Rz7Zu1n7yqlDb5?=
 =?us-ascii?Q?WvRxCbnK4VV393GtSLXirrcVMMwT0s0435IYXBcXp1VJA9ni?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db77845d-6040-4da8-a0ee-08def4881532
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 13:30:44.2509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3y7FvLIABOAw5McupSKWeS9Z6a0B2vuOPyS+C5GqQhicP+caFlnY5GWPoF7nImrtBZ0Q1TLNdKNFpC+n584QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB3978

BUCK3 feeds the GPU rail, and unlike every other regulator on this board
it is marked neither regulator-always-on nor referenced by any consumer.
Once a driver for the BD71837 is present the regulator core finds it
unused and switches it off when it completes initialisation:

  buck3: disabling

which takes the board out about thirty seconds into the boot.

Mark it always-on, matching the other seven bucks and all seven LDOs.

Handing it to the GPU power domain instead, the way imx8mq-librem5.dtsi
does, describes the hardware better but does not work here. With that
link removed the same image boots reliably. 

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index e34045d10a12..c06a787a4013 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
@@ -156,6 +156,7 @@ buck3: BUCK3 {
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <1300000>;
 				regulator-boot-on;
+				regulator-always-on;
 				rohm,dvs-run-voltage = <900000>;
 			};
 
-- 
2.53.0

