Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013047.outbound.protection.outlook.com [40.107.162.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C82363C75
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 19:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341699; cv=fail; b=AeIhF+P2r+IF8bxwgxNonWp2OGhAD8GOcrYOEVT6sxL7IakNDf7EVsgcAJ04PFVJ9ZxqG+I7/JjzlrkH4oXPnyVEktCGPvqpCFQl3dBhd2H6spfpVgZAWNVxorEdvQuz/4z/ohOwPRVv/2b27zrntWeqX7xhkvTibz4rD4sqMpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341699; c=relaxed/simple;
	bh=oN16LMRWXEF2SVwqVWJhkcf8wu0P4zh8Yyeq/M5olZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QRZXg3FzgRsm07S4oS50ZfNcFb64MgstA3Jhzgz3MZuVRJePWEaZTmfuDmBD3Zh1aUNA6wjVFdOeqzF60jY3bxqBOH7gQ9iHno2Yuh5GoEY/AD+MZs1auJ5+hhsN7CI73bI81zM+caDA5571DnrQBG3s+zOOBwjevDicKtWts+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AcKitBZC; arc=fail smtp.client-ip=40.107.162.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AcKitBZC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJavuKwOmFqtFdBve2xvfQsp1Ya7f8t650dxmW+qKsLYJRzblqOmaUn7BaMhhe2htrrMVGXftpjDcJcnf0UvxWsCuEAgr/7UZHMmLuRkjsy3hJsjdXmonMUmPxGCOu2VeQvECm+Fe/vw/du+RaPd+d9Ltmn9foi/PsJT1NgsD4n6fwE69WkNx8bl2slmLX5InfCdAF7MmvT8YRDhYOZYDgylG/9R40WM01C/ecDrT2KO5gDLg3untSn4cA+zdOZ7IQ5vJnAL9gdK8k8Yyf093HX88/TRsbHu5/J4H+Xn3OSKAueLXZwdzkJnE/xcIhc3nHYlNH5cKew3E05lKf+McQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzPhR8Gyim4QKtm1adROYoazPdZbWiQqanSsAQ5nowQ=;
 b=NkZKMD2ugBSq1E1NLCE3SW5caafe1FJRCDaWbzj6fLGd/XZt1C534fGASAQpWmcNBcSlt36/JsO4NASnA2cwl8c9In6u25C5B0A/wJPxNRvc7psqyeqJskVdOFLPKZr+WovsFf8rxpdbHFsMgu+W/dnppkE1+N/+pnja7EnG3FwAu9kY7PElbQDd9oSOyysXqjsOFHpUQPl35I21HWSLXYQApizlKwXUQzR8Ctlq9twva4C9mOv7GWe74//JADcAMR1MkGlphlCHmxi1MQ2VYpQpww4PckcnaHTWFutt6ltiqp8N1cAHbOGrzFo8DqMrW+c4bMVjVDOpnbLmrFnXmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzPhR8Gyim4QKtm1adROYoazPdZbWiQqanSsAQ5nowQ=;
 b=AcKitBZC4rHdRyrRHp93kjoJ4tbwsEIPURm994RPcKZn+0FaERa6YnOXiNuosenhCWd3/U7PXbciKhHCFQS2UqYgvhGJwk7/+ryU/Z7NCP13p6QvkAdApqxDWSCPIdI0uOiZDdgriadoU21AZGdYCdSiw1kNAycqCr4TqnXbQ7oliZuA72OA5vu9cg+i/ukfSzXnYpjsPF6LC+qZmhkA6+/mx9ACuTzHfGEKeE2v/KN+JGKSWvnEgdL5kaZ6kLZoIoehtEkW1YhATaacHWmAEIzRM5M2j9l1oJgXOIaJRZShIHu5swNWHDv4r3uuFxnXUO56R0RwXIC64HpXRuvq8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10265.eurprd04.prod.outlook.com (2603:10a6:800:221::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 19:21:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 19:21:32 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Richard Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] arm64: dts: imx95: Correct PCIe outbound address space configuration
Date: Mon,  1 Jun 2026 15:21:24 -0400
Message-ID: <178034167818.348173.15192190277666384692.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520072228.2274790-1-hongxing.zhu@nxp.com>
References: <20260520072228.2274790-1-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10265:EE_
X-MS-Office365-Filtering-Correlation-Id: 7958f97c-3f75-4497-b23c-08dec012fd42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|19092799006|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lHpdDGhGOqPDWnxIucyuHase6ccKzemiDBzUZ6D8ehxuhkc5fPmGpdJMMONo5oMXqYTrW3znsaQ7klga8+Z/EwGrVGmOTB+HpP4slgDrxiAABaXjWRRA4O1IoijC48FBSV4h1HPiMqlNifIcBVmSE/+lgVqE1kwmRt0SIS28ALYNtYkG3x2wGm1duSjO/GkcVEmM78iAdYXAaTq/OVDpo677XMJQoGz4J2BN8qlHtt6RMNW1hH4EzcYz061Fbb2uheHBiwTQiMVoNPSYVG82nOR3ijNJLU893NooNlpbpOZbDScgnkhtEENAsVIDdCeHajT8U8mH9/++wt0cdFkXwlmV2PLQbqUIetwSoP6AHSdv2aKVMAaf2hxcIuS0kRZwRnB3H7h7z0Tpj8gHVEYJof6OtDxAx4/M3QeOU3YrizAY7qYfPsMsxEZjrmH5brHFhcneMtRFpIgErgWjGeAzKTW5YJQbE6F21F1YX58JmpD+qbKIrMO32F9GnZSgawVbHMUZ70Ff9d8PuNYDCvtuS0e6zg0YxKo4J4trltx8YnRO0tjdZfMN06FXZw1rZq5XIaMcNuqVq5+WYcxm11VSV7Tv/IFiSwaYAFsuWPVZ/xD4hYZRb6NRM1RisFdWUYKmbcRvSqTk2pPJcfLUvI4i25GlBBFVIlfJI232/PibFAfEJ2dmODDS77MBDjk3AWDD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1EzWVdyaDJxUXp0cHB6K3FNWERwZkx5VzNqSmxqcVhFbFVYSUNLYzd6RWtS?=
 =?utf-8?B?aFBUZkR0TUFZYU0rbmg0dXFjbEZQZVlQUmJiaXBUVWMvd0tkNk14eUFJcC9t?=
 =?utf-8?B?ZDh5Mm01Q1Ruc1NObGZObENBYmNHOGZod1N1bTVjeHNMQlFHbGRKY3ZIRml1?=
 =?utf-8?B?ZTRObmNTbkl4bDBYbXI1UG5zTXp1OGpQckZRTFhIa2lJZ3JOSTBuVG41MmY3?=
 =?utf-8?B?aGtnVUdHSXpiTFp5TXdMT2VEcTZ1eVcwaExHTXMvTER4MWI2VDExV2VrYjBs?=
 =?utf-8?B?MGg2OU5KTkxkd3dnVWYzR3FCZHl6ODA5ZnV1ZEFONU1Qcy95S0NuR3BUdEFF?=
 =?utf-8?B?SXZsTy9KQy9JTHhUWlZJaWNiRHllcTV2VlZWandBbkRaa0QvWnNZZWd2Z201?=
 =?utf-8?B?UC81dFFWRUNSd3BYbFBHUk5Wa0tkQm42R2wzU3E2citBeVRwSHcrbTYrVTlt?=
 =?utf-8?B?R2NHTGt2aG0rdGk1WVNYa1lFNnJXOXFob2VWNWJZa1FSU1ZPVEZaSkpHYzE4?=
 =?utf-8?B?eEszdlBjd2M3bmdRWjd6aTdrdzc3bDcrWnMrZzNaek1oVDNtQVVYZk9LMlpw?=
 =?utf-8?B?VUxTNUVvTDh4eDRvbmsycDBVQXRGMnoycFhUeFNCQTY4eHc5TU5qcnQzSEQy?=
 =?utf-8?B?elpFRERKdVBnaHdsSjRFOW5vSnJQcisxTk4vclljbFZsUFgwQW9JSUhWbTVL?=
 =?utf-8?B?ZTBoTWZLRysxaHFtMHJhNG5BUFZ2cERQUlQ4Q2ZQUnNGLzgzZDZVenRab1E4?=
 =?utf-8?B?ZEtUVkx0TDZ5K1VHck9TUnBBZmRnOStnT3FvYzFOUml5UzVQMHJ1MFBncTJX?=
 =?utf-8?B?TVU4YUFYN1JOMC9xTDVzaUdodzNUQVVqWm8yb09PcXBnclVOU253TFZDQU5J?=
 =?utf-8?B?Z0xYZk8wNW1KZlo5OS9tQXdkcTdmcjM3SGc3cC81dDNzeWtiZTNjTnF1UjRH?=
 =?utf-8?B?dlg3WmIzSWhQY0NTZzIwS3RCRi8vaUZUaUZOU2NXdld3bVpnMFZxalN3OWs3?=
 =?utf-8?B?ajFQNkhwQnhIazZ2czVNWlYvN1hPL1hLTzRRWHdRQTZyREU1dXI1MEI4MHJX?=
 =?utf-8?B?cllVMUNIVUxHRGFESkxKZWV1V2ZsVFQxT3VRUWU0WURzRHZQTmE4N3BVeDR1?=
 =?utf-8?B?L3cyOU81NVFrUjFocnlpVTg1VUk4YmhCUldnbjdTbC9rd1g0emtOWUNwdDlT?=
 =?utf-8?B?OUJIZ1lRMDBCNk9zM1hNTklVZHBKZndwUTRjSWpyNEg5Q0EvNHRydkRXT3Zi?=
 =?utf-8?B?c3NmSllESlVKWDRoU3JaYWw4MVFBajROdHk3cVJ1Q09EZXNLc3FUU3NWaW5s?=
 =?utf-8?B?WDgvNUZpSmhLSzVSSGdpWnBHQmdiZk1JS3M5QkVjQjMyZGQvYU1mY2dtQzFH?=
 =?utf-8?B?cDNyRXc1N0taOXVaVnIwUEF2K1NiY0NCQTN0QXZKQlA2dG1KZk5OQ2FPQWpx?=
 =?utf-8?B?Q292ZHJCeEdCTGFBNXlaWURLbGpjcVZhUHowUXhjb285cTBQKzVmbVNhd0R6?=
 =?utf-8?B?bWU3K0FmTmR0amF1dkRJVm1Rc2lENTEvcHVkQnl5dTkyZDJBK0lJc1llMmRO?=
 =?utf-8?B?M2pvbDBQRmsrcUlEeVQ1NjVPNzFIZVplaVJDMTl1NDRydlRNd0hwVElBRmFU?=
 =?utf-8?B?R0VjaWpNQVlHTkxodTV4K2pKNEs3cm9CdURkVGlzY0NkTVpRVDBiOW8zTG9n?=
 =?utf-8?B?MmEvWHFrVTJmUGN0cnVyZEZ2bVVEaGllcWM5L3laYUN4ci9TUUxxNWN4ZEg4?=
 =?utf-8?B?dlk1U3JHaDRUYkFCUHBzUXRkMEdlc0g4WjdpV0pNWFNvQzkraXBhWXFzL0dO?=
 =?utf-8?B?Q0lFa2hPZmZNWDl5aEZKbHZXN29VcnhXVDlPMThCek1mcFQrSTlYWElzakxr?=
 =?utf-8?B?RnlsRGZ0U2tHR3hFd2tvc2l0SllRMXIyRTZlTFVJS1ltVDZVTVoxWmxsMTlV?=
 =?utf-8?B?eERTbFAwUmc1TythK3ZwNDNDR0pDeG5ZRUZuRjRhWk9Bc2NaM2xqOCtZNGNM?=
 =?utf-8?B?MHZoVGNTQVVCZlZJN2N4QlZOUzl2T3I1ci9teDZzMmFpUlR4MmRrQUNRWW1J?=
 =?utf-8?B?Ynkwd0xaV3IyR3Rnd1pTdng0Qk1zKzl6KzM0ckwrNGZiSWRqZ0Zac3ZkMTE4?=
 =?utf-8?B?cTY4bE1WZVVId0RPZVI1WjVnK2FtVGZMUVVuRmlLbFBmTm14UU5pV1E1OG95?=
 =?utf-8?B?Z09pYS9Ea21tdzJNaGlFYVo5VWgrWU51K2NmdWptaHppVXg5K1RPSmk5cXVE?=
 =?utf-8?B?Wkh6QmQwd1YrMURGVkRVeFNJOUwxZjZFUjE5VVZBSHJUYlRrV3lRVUJpb1Vy?=
 =?utf-8?B?czdvUmlzTVJEN0szV0RRZURmeTBYZHNJSm9TSUlnWHBjK3JNdzMvcVVoNzJx?=
 =?utf-8?Q?5BeemUxAAhRaM77o=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7958f97c-3f75-4497-b23c-08dec012fd42
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 19:21:32.5841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivfZFL2NLw9JNJAJQCGwO1pzAbVISN+p1oDXkikkJewFs8CqBrZ6dNyy6GemCpeAJi1siaow0MI12yznq2p2AnkVTvENpfx7eukH4ZXYk9QOHL6f939kcdgGSWZv8T9g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10265

From: Frank Li <Frank.Li@nxp.com>


On Wed, 20 May 2026 15:22:28 +0800, Richard Zhu wrote:
> Fix the PCIe outbound memory ranges for both pcie0 and pcie1
> controllers on i.MX95.
> 
> The memory window size was incorrectly set to 256MB during initial
> bring-up, but the hardware supports up to 4GB of outbound address space
> per controller.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx95: Correct PCIe outbound address space configuration
      commit: 1dac74fdc1bfbac413e386259f07887317f38308

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
