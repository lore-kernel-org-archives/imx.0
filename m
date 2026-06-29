Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7297E39EB7C
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 19:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782761242; cv=fail; b=FuiBeAeQQ56rva3UXP00tnSm1Cizq1vuJLu4vWQ/pmrzWWHEWdnnq4jyH7QEfslF2Ckf8XFCOwL7he99UegOiVTsPOnj/sY58fAQuyUKpo9CeUGV9NtOGx55AOPLlr9h/UzWGKix5Ol7a7nDrge8Y+OXiyhOn3vkpCTwsPANK7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782761242; c=relaxed/simple;
	bh=LMBTgVU2wvkInZ/yfKu4FnZr4RlmyHktpmfxUfNrZnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pRzkmbS61ggqSvt3wZJ4eMyyaTtslTf3gjwlyfbgf4LXMD6ZOda7U1ffzGL6gloRwkWgPS0ajv2bD9NWgG9uw39Cu6kP9r1rqBeBfhYd99bMB8K+pdRu3VFVeZt14AXQUrUTVWqmgbtyjJbsTFlNmImT5x6YEGVarg9N4anfd1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B13ElZIK; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B13ElZIK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElDO8evkNcxRhi0EHddFtBCk3K9xyHbK+T4qZ8YJJOWRnqar0+nPJTvTURUx/fhj1tbTBSXHVRQVbiaA7FdfMPUTxKvm/97yr5SrjrRC7SgTM1Fr5yY9/ciNfoKXf1QP4gKZUeXuYpsbX23g+KZEBDql8GENHFdY2iAPApARQ6xGBSTjC2eBHpwM43eN+VYAebN+nvic168oaDsNQ5lWzOr1gCRnkwzXzoqFkQIqMX4aRi9SlgyJfS7iezsq7YACxM+YG1E0JE45745XZ3xDN5cuReapiNpdJScZQF9mm/7tEhACuz/aXyAxr0OjC6vUrWOgvszt8eTjmvm8fEpkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL8QDy6FQo+TaxqkRjiAkbCfr0x8+6yjHljV8xV/z6E=;
 b=f+eQArRqsx0wzrrk5afeL0MoHqL3VwsOFkuTiNgZuPeAG2eIfEUcWycAwSxJU0Os0noQy1w1QkDaHBQJ8Pn2WgYbLhT4vonYllQ3RTn6j8FTknnL9MniWgi9+tjCY3HrjARpuk8RAhVsq2JfvResTgV1MIVd1uOG9nX+5ls6MxoylotBdhk/8mPSdXCyRvn/ygLf7oQT41pAQFLgUOYcUS5vfSgYt7oUtj0LgxBk41uYTb1VwvnIOlSvE9wmMdlUsta77MqKaeyhQ7wlAxzvJPivZBrR6ckhQfFg+n9/BMlmUX5R1oKRXZm4/fKkwd5IOYJAPHRISCG9qRUhqzYrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QL8QDy6FQo+TaxqkRjiAkbCfr0x8+6yjHljV8xV/z6E=;
 b=B13ElZIKq5xzpk/HWP1+QBRFtZ7wZGl7HdQjjC54W6LqcumKAJkEgBgV7CiaxHHSaWVvZEof4y9WK1Yf6Cz2J92EYo0gSQy7dPZFupolHXN7z/vM3cV+UTRqjW99o74t2OOS/rB1P51SqkawYWZbuaZ/vB6zmB8Gde7UmhnIcp9b+d00YCT6tRxS5WdflRueWkhp0S9e0GNVCPNOXmI8b8LiXYdOfzIC36O++qUgT/kZR4id/7BfyiTiB1OQ0DqfEypuoiEtOGQ+4m+vzebJ+TOXA0qF1MnNpvbTf5bzulDOYYo5sSGHYXPj0ip9bSarOXGhJgCrLwGOWemkqHLc6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7134.eurprd04.prod.outlook.com (2603:10a6:800:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 19:27:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 19:27:16 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: (subset) [PATCH v5 00/14] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Mon, 29 Jun 2026 15:27:02 -0400
Message-ID: <178276120701.2418130.6810411375485698366.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 6767731b-9320-4fed-32a4-08ded6146dec
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 0ybkfROmClZNMOvJIbMyVu8AATeScOjgg/oa07Il7V5Y2T5khhYMiiry50kLQ6yg6RIyUMrTnglmcmlGNJxkYUsKQNzUbsTQR7kDZhtkaEEXIkN/qRL4utK7XwVxt09nmjegj7CvEUU7v4772kiwjwCCVJmXbpyFwp+/kYZpXbT0zGvmzM2TPnGiFWSkNR4v195odY9NiLuMh8qhYY+8bO0Y9Flt+MpDRMeCOjOEHG0489J/6f2raMJg+NxtOjTEPXwKY9ixd+dAD6ZZETAr2SS1zTM5AlmORhaI/44NQzMPg30C2EuSIR1ZdpmVSRDVdZZYR13uPboxvKctBNtdFPtNtqUDj5RhTy/CvGfuvzJWu78HXn967oPFt3icJmQ7hEYQO0aetKPGXtyLvxTPmwO5fs2IRnlyRkk6J3pnvY+fQeqrKF0tDyuQyOQdzuTQcRqLrMwQIEqF/mjv16WedCyCMw41590ospaCGXF3sgliBlWnFIq2WTXGKoMNhiTmo2GIJNIQidpuWiPr1cpFXG99xU5JbbsGaOc9rdPAIzWm2ufzHHnXV2EfshNyGQ0aKWjvO2UCgY6ZGeL6b37FF6nKzawXzMbWLAj9ZnHk3Hkc1vkoW6qhyTZRj7WHEGSayGWf0ODnyvZhVQt4zt17qs1lz/OzJGSHUyomBqwkL6E=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?V2JyaW5ucmFoTVhyUi9ralNLUFhqdWNydGo5ekh5TXUvclgzbkZmM3RQUUht?=
 =?utf-8?B?a1M5eFJkbG1GMDd1QTdXcVc5Z3lTaXZHMkZ1UHBtdmJEOEdFZG1QRVptRWZr?=
 =?utf-8?B?RmlvTlNNbWo1S1JBWlFLaHNzU2NWT1c5aXkwZlkvelQ4dDlIaUZ0VjBBVk9N?=
 =?utf-8?B?WExXOS9FaDhiaTBnME5LWnhla3BxdnU0cHJpeTVwa283bXB2WmJXdUxWZW9F?=
 =?utf-8?B?TGxUUTZEUWhnazNiMnVhTFQ0SmlMb1d4WHRLK3NiSnJZYnMva28vQnFmUnJq?=
 =?utf-8?B?WVdrMzZOWURUVGtQU05Na0dYQ3BkL1dBQ3AzdXNHUjRUbjdGYWVPWTA3dzR3?=
 =?utf-8?B?S2ljdlIyc1h1Q0p6KzRobjdjMndDSE9kM2FuYTlmNjNSS0I2MDBwVWp6ZkYw?=
 =?utf-8?B?QzhxcXBMVGlPWml1eEhSRzdWNk9yT29obWlveVNaclZ0ZTZ3WEsyWnJOcURq?=
 =?utf-8?B?ek1PNXErUDlMeGxNWFNRcHQ3TVUxVmVUZWQzT0l0OEdSUmw0OGdNTjhkSDhL?=
 =?utf-8?B?aXFaV1ZwZkN1RjErakdRbTdIZUJWbGR5bXllQkNjcmttZDlIbzRzQmRpVWg2?=
 =?utf-8?B?V2JROEluN2hHMW9YVERpQnBndkplTkszTVdWazVOSkZJT0o0akF3djFiV2lL?=
 =?utf-8?B?NUtxNHJrcldHV0dMWEdIc1ZQQjNVaE5WZ1luazVqRUZGUk9JV3gyeFp2QzRy?=
 =?utf-8?B?MThjN1o0VVBWNERSL0pIaGppTmtmbDJKYVM2djhsM1Nqc0dodUxKS25UT3dl?=
 =?utf-8?B?cTBTdGVySHEyTy9QZUhNdGVVNnZpYnZwZUVZNkMxbTc1VittWVc0dXlEK1N3?=
 =?utf-8?B?bko3Tm1BK1ZwSU9ZMVExczFjZ2lDdHlqbEQ5NlNvbW9EdFFuOGd2K21HRW9o?=
 =?utf-8?B?b3UwN1FNRnhFcmpZL1ErMWx5a0xiYWJuY0JJL09pbkZud3VENWhWTkRYeFB5?=
 =?utf-8?B?QWxnZTBBTk84MHRLUXdZNSsvMXQ5TlhWbGlLamZKWjlCZCt6NUNLaGJrbTAr?=
 =?utf-8?B?emZhdy9wc3NUOU4rZXJqVVdxeGowR0x2RHcrYXk3d2kyK2RFdWd6RUhodFU4?=
 =?utf-8?B?eFg0WVNhZE1CMWFZamhWdi8zZ2ZLdTUwaytZU0Mxd3FpcG0xM0Q0VGlaYlR3?=
 =?utf-8?B?UkZsQkJlczU3enFiNWU4dGlTOUJXeTBMVzBtVnpxU0N4cmRjN09IVWpYWTM2?=
 =?utf-8?B?QkhMdjhwMUJwVzBjVU5CK2U3REh6ZWJPcjQvekJXN1ZFekFWWjNlZGRPOTRB?=
 =?utf-8?B?a2MxNVRMN0NPVzlVaGVyTjJkaW9oL2xUWGJsNnJ0ZHArUlFhMWtPN3MwN2Qr?=
 =?utf-8?B?aTZpbS9FNDdldWF5ZnlJOGhOWmN0aXh0dnpqUWE1bE9aTnlXZ29pYXQrSUxY?=
 =?utf-8?B?VkREQWl3MjNzdGUzOVFlT09SVzBlMGs2dDh1eHMxb2R5TUdJdkd0eEk3TjJw?=
 =?utf-8?B?UktBMzFKUGlWZmlUOFloTHVFMEw1czdaZ3o0RlZjNy9SbUFpcjJKTVFnZTRu?=
 =?utf-8?B?Y2krYWpTend6V3ppQURsZjUvcktzZlBQOXkxRVIzNWVlcXVnRzVoYWFsRXY4?=
 =?utf-8?B?NUhHY1I4SkdQSEpEeTFWR1hVUFFTaWFYTjgvQ2U1akl0d0g3b3hPRWh6SUtN?=
 =?utf-8?B?M2M4M0FMWk1vQVcxM01jUVorS0VNbVA3bTBKcUNUUG1UYzYyVFF3dEdiNWxm?=
 =?utf-8?B?ZDliaWZ6b0RzN1Q2L0tsWGZFN2V6MWtWN09rblliOGZlM09ib1FyT1VLSFB6?=
 =?utf-8?B?T3BZK0RDQ1MxWVgwbTFYR25zTHdvcjR0WG1RNFR6Q21IM1NYTDk5NlBwdXd4?=
 =?utf-8?B?SnE0QmdxREcwUFFPZmZERXc2Y1A2bzhuMkMwVFhVRU9IM0R2ZHcza1hXZlhL?=
 =?utf-8?B?NzRRUkp6UUwzWG50N3U2RHNveDdSeXVNOE9vUUZBemx5aUJLZUdOeGFGbUhD?=
 =?utf-8?B?WDZyaW1BelRNSlMvZkROWkgrKzNBZDdkanRjMnhzMXRCMkY5SGRsWndSMlo2?=
 =?utf-8?B?a2hkQ1ZFTHNrVkFVOTlZNEF2UzZhRnJhVVBDTkh5UFhVZEcxclJubzEwNDNZ?=
 =?utf-8?B?bkZSTnRGeWNEMjZmeEpMMVRyYnFtYXBEeS90MFlSUWVUWTNyenJnZGFPN0Za?=
 =?utf-8?B?dnpoZThEOU42UkNpNUlqeEJPdVV0OFlVcmNiZ0Q3WUZDR2E0blpKbFRCUVRV?=
 =?utf-8?B?MFByWjd1aU5CUElNbXdLYnVoVG5GWURZWjZleUtUTy9Tc3MvL0RkRC9ZVnJL?=
 =?utf-8?B?K0FiZCtJR2tpQ3JCUkd4ZFJFb0VUMEJ6bFpqeVU4bTJ1elRjWjFoN0xxYjAx?=
 =?utf-8?B?b1lQL3YrVll6bDhGbkhuMTA0S3dZVmxweCt2ZGd6TFpiZFFMUUZvTmY2K1pC?=
 =?utf-8?Q?uSIXNE+we8/u+Uufl9CHGgaQkoFD3ZFqEd3lC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6767731b-9320-4fed-32a4-08ded6146dec
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 19:27:16.6953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzhNbYMzdoayfxg425BANUSR5K/3LTTfMtVc9yQrn/udouCb3rnnJaouAOZg2PfvV4HuKIGKh7wUa/AlikP4X6lAT7tCz3NbuM1c2GZzJsrXtUCim3707aF7JlJBSN/g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7134

From: Frank Li <Frank.Li@nxp.com>


On Mon, 08 Jun 2026 16:41:01 +0200, Stefano Radaelli wrote:
> This series updates the i.MX8MP VAR-SOM and Symphony device trees to
> better align them with the current hardware configuration.
>
> It adds the missing board peripherals and completes the related pinctrl,
> GPIO and bus configuration.
>
> v4->v5:
>  - Add the SION (Software Input On) bit for the I2C recovery pins
>  - Remove regulator-always-on and duplicated vddio node
>
> [...]

Applied, thanks!

[06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
        commit: dd7858bbdfa84beddf7d08bb82eacc8010221493
[07/14] arm64: dts: imx8mp-var-som-symphony: add HDMI support
        commit: dfee5fefc3ecd29794c79b3f5284d759cfdc869e
[08/14] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
        commit: 6651fb350bff74652edf8fdd2193ad33d69a968d
[09/14] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
        commit: c0cb98e3230fd5959bb8075e059fef60d0477698
[10/14] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
        commit: a062ace84151ca83d39e6470c0a23c51c0d343df
[11/14] arm64: dts: imx8mp-var-som-symphony: enable PWM1
        commit: 2558c810a6d28614a8b076123762ff53f4acef5e
[12/14] arm64: dts: imx8mp-var-som-symphony: enable CAN
        commit: 8d7fc066c18a99cd95226a660f4ddcf353d91bd8
[13/14] arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
        commit: 0bfd9e56f4868b66bdafed6a9f867629899bc199
[14/14] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
        commit: 417b121ab93cd5a0929a663b9dc5da5595e290d3

Best regards,
--
Frank Li <Frank.Li@nxp.com>
