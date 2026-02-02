Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C5637F8BC
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061429; cv=fail; b=O+YNu3IHi0bzPj23walVW9cDsuQuU3LtEb8ExtFrOJwuNkkIWF5wfDYG4bmKWFkREt+TY239FCWoQM/bwZI37OUnmeicvoORoXeBGN0nKTzGpQ+pIu5Ci0tbSyNbXZOYDXAq1YnisgV/40Nzz6qKoj2jaBAJ18C8d/dJrU6R+tM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061429; c=relaxed/simple;
	bh=eVRBHCGQqFmA0b0XgVOOvRpPAWCD6vVZNxcy+aNev6s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AO76XHds29ljhBpeO+ePG3TqvDq1zH8ijEtg3ThY2g/vNGY+tmw3ntMQyEhcrvFmPkgyKG5KGW6fR3DHr8dbq8JUJJ4SHesYUbRVQkTi9X36XJBciWGKFrRJZrqMalnbobdKnldytUZjF3caZHUZr7xzsOpJjBSUPkkDKjmGSNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l666wsLs; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l666wsLs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRFFyeuDMrsKd1d0R9wMnD3edMZmFqvSitstPv3kB6YtPT3S/XZr81diinT0j2XLcoMwuJlz7Xod9tS8EGgSYk9eYCfVVRyzWSukfVKvzTUctWGLiHdWDWeGyMwCOpSrfNVTW9DNjZiY8V1FqUyDGY3HOkups1YvdKBUkq+KjYoggc9gPOf1O7weDN3p7SrqPBYql9vSmUmdGNP+lqBHcrQVpKG16Y8U2BM33LF1Qby0bc/ZjoMgtemmqM/ZtqqGnKVoyUQKnpr318VloVahs+3uc4N3vaaWRMGXKs7F+ePOSYy9o33Eg5m5whV1SSLnOcpDSLuA6B+u6N0ld0/86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g39MTGeU5NDkK154c0f3gljSI4a7ojftpIfZHzw+tCE=;
 b=WLWVYipj+3iryZcDRBYr+g9yTeAOpPrtA82Gw8VsrjwUMyEy0/iBIW99l1zFNj+mn6OU58PVhkVxBdwgo59WAjE+tlf95NtHuy20L0AEOtc/yvgkSnYvS1wFzof3ed/WuOcF7/l5b1HGkbI0jNRkhbS1qQTaLGVxVXtz9NO93vrAKxIgOJnNhY83XYy/hhjoO7ufXotBh8hWoaJ0EZoBlokMSN34Px/H7feWLcS7iGcCNKJFn7GmpYY2sAUJpGn8u/+DwGXMlnj3grpm9yPTJr5Znj9w277o5HKQ37PrElFUWIewGdTO2znL+mzRHQt1k/k47tAVeQdcaA2c4QeJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g39MTGeU5NDkK154c0f3gljSI4a7ojftpIfZHzw+tCE=;
 b=l666wsLs5Wnzxf7QfP1gQ9isuKH45C468VG4ztAPgAXUyFz9UnajvS/GWOZWlC57vmqeRS9Xe4iq2QEb2crFUNyWO1yU5f2sFDYDPaaAMycCgO9MUjqhpA3Crg7P+uuBHePrnacIEJivPfG2oNk0S150KtRUb8uCpo4vXWCRxWTuUtrvUepl4yCU/a+8fZTqkqZL0Ihl5r2eEL4uJn9xvTOiW6LCPokcuvc2AxzE3dhSMrdmVkgaH5P87V/2RkS8cLp2YT3+G+qfhIYKV4Cx+sIXoLz62r48vWMonWk69ObVkTl4vvzP/5XTd+1e1KQTIFOCN15jNNmyqjN8rgW2mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6800.eurprd04.prod.outlook.com (2603:10a6:803:133::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:43:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:43:44 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Feb 2026 14:43:22 -0500
Subject: [PATCH 05/10] ARM: dts: imx51-babbage: rename at45db321d@1 to
 flash@1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-imx31_dts_warning-v1-5-434dd2643c3b@nxp.com>
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
In-Reply-To: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770061408; l=946;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=eVRBHCGQqFmA0b0XgVOOvRpPAWCD6vVZNxcy+aNev6s=;
 b=qvm44W/QdDRrTiZs7Jhke1hfBAdrlLJKbV6AR64gUtIDZbtRzFrqyj5RQQ4YGiqd5IU13GuRB
 AQmmzlzCcwWALPXUfFXgoD/oJ1HGA97jcqi6/6vAzRukINHWw8kjWFb
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: c6fab74f-8a1d-4f4e-85e4-08de62936020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ym13ZTJXWFY5QXJlUElHeElXNit1QkhJWFlTK2RmbVhaTTNyVnJUaDgzSzFQ?=
 =?utf-8?B?bXBmb0lEOW85dUtkSXlMbHlGTzFCblRQUnFDaEdhemNaeVE4UUc1TFdlN2Rs?=
 =?utf-8?B?M3JVOHR0U2pzdGVKaVNOUkUxREV3TUJ1ME54YXV6NktMa2ZwNWU1alFwRnRq?=
 =?utf-8?B?cGZvbXZieGlzR2Y1S1V5RysyVDVHV3dXTDJPZDdYNXFCUHJGRzBwUDlhRisr?=
 =?utf-8?B?ZDF5RTBydGY2NDNlRVd2TzA1dkZOMDFXS2R5ODhEa01vSXlHVmZOT1p5dXg4?=
 =?utf-8?B?eXM0UWZ0eXpDdnNieXhvOXF6NVBnRE1jMlh5blV1eDBLdlhDRmpTalloL3hE?=
 =?utf-8?B?VEVZSkVRcHJaL2wrbE1YVTN5YnlHa0hiYW0yd05PMDN6bFN6VDBtNWxaL0xq?=
 =?utf-8?B?WkhGRExpTk9XU2RWK2RXMXdaZVY0RkhBS3A1UGQ5SkhEWUNMZEN0V2czVjdM?=
 =?utf-8?B?VE5YOFJaWEZROTh6TW8zVUNJZXhzRUJDejRZMHdscnp3dU44Ukw2ZEcrOXR3?=
 =?utf-8?B?Zkg0ait4RWJkSCs1R1hBYmFLVFFzYUp5UE42bXV0SVE5MFBCb2J4b3A3cTN2?=
 =?utf-8?B?ZU5tTjJtcHNUUXlFYmFuL09BbkdBekdFdEhvcVFsOSs0K3NlK3RWM2RINnhJ?=
 =?utf-8?B?TnNtMG9tRTJVYmJ0ZVh0ZXc4aTZmdWNLRG5hQjhxTGYxK1FVcWd1Rk9uenk4?=
 =?utf-8?B?dnBiSFpMek9YYkRMcjBINzBoeE1LckI5ZXJBTDc3RmpmakYzS2F3Mi9kWlZu?=
 =?utf-8?B?ZWdYOUxrVUkwK2RXanlJSmd1MXc4Kzd5OXUrVVdiUHluSS9yUEl3eTE0VzZt?=
 =?utf-8?B?UjF5MU9BbUd5aDFMQjdkQ0RMM1grRzJ1VnNRSEo4NFoxSHBDVWFQcTJ5RzAv?=
 =?utf-8?B?SWFrWklmbHRNVlRwR0ZEK2c1cVk0TW5zU0NCQnRlNVUvdWhHYVhMRVB1ZEVS?=
 =?utf-8?B?dVp2L0xyU29lSXJORkMrSktuWTI4Q1dJWnFZODkxenlmQndjZ1ZHNDExbXVx?=
 =?utf-8?B?bUtXTktIUlRyeFNRclVCZVgxYlV6K1FmOXVsdVBuU2h3QzFIRVhWWkh6eUEv?=
 =?utf-8?B?ZHJrRGhTWXVhRnRPNXRrUndOQU40ai9KcmJmYUNEanN3Zm00OFdERGZvT3Fr?=
 =?utf-8?B?L1VIZXdDbEFmaWRsNmJoYWZ0UXZlOWdSZWlQU011TGxuaXF0Q2YzY1hBRU92?=
 =?utf-8?B?eVJmU1RuYmFqYW05bURucUFjNWIrUmZGQk5RUWlOckRnMkVnR2M5ajFiYXh6?=
 =?utf-8?B?SG04YWQ1MEVQdGtqK0d5RGNicVpVaUFRTVVsNHBoRGJpZVlabHpSNTBvWmI5?=
 =?utf-8?B?S0k5R1puVE5BRURNR0k3NUIraDM5U0xsQVVRbW42MjFvSXR6ZHdFV056OXh4?=
 =?utf-8?B?Lzd3R09mbUFzdk1MK0xqUGRiWlU1ZEkvcGE5TXFkNFVlU3N3ak0xeGJtNXVL?=
 =?utf-8?B?djdhV3pVQ0FrZ1QyZEs1b3RRcmRjUE9ZcVdjTXkrbXZybGxuMEgwMVoxSTZn?=
 =?utf-8?B?U2M1Z0IyOWkybFlMSkQ5UjBLSGdCbnRWNjJod1RqczdUMWFpR3BvM3BQQWpo?=
 =?utf-8?B?a1NoZUplQnhIL1pZSUc1cmhxSDRmU3lSV0FDa2llMzVjaXJLdW52RFk2R2tl?=
 =?utf-8?B?WVJsTU9FMEo0dFRVOE0zcVlyV0Y5WjFqTnBYT3dVWHR6RzV1bUtETTBzeFdC?=
 =?utf-8?B?QmR0ZFZ6TmlxM244elVuM3dZNnRuTzFqOXpQbmg3bUJSZ0tHT2prS1lORWk2?=
 =?utf-8?B?c0hnQnlURG80TXcvMk1JdXlvdGVIb1pYdExNdUM1QmdwQ1JaemcyRmp1NUhS?=
 =?utf-8?B?TEJjSGIvV2FxTG92d3EvN081NzBLU0Y1L09ySHdYNEpOZW9VckwxRlhCUldn?=
 =?utf-8?B?SmxkNjBLQTRRTXZlODdMS1lEQTVDckE2YmZDeXZoQmJ6L3lCRGZWeUtadGR0?=
 =?utf-8?B?YWxPcGE4amtZQ1ZmUnBXQkV1UWM4OTVhOFNaYmxxMVdGaVJQcWl6Mk9BRHA0?=
 =?utf-8?B?RGtHREtmcTdXbnFTakxUNm1LWFI1bVZ0Q1VidUYwZ2VONlRkeTJQL1lxSUVn?=
 =?utf-8?B?YXZMTEFGRFRwdXg5L2VrOWN0TU5mQlV1VFlMSGlWSmpYM2JIcXJDNjkyUCt4?=
 =?utf-8?Q?XtzDH0r9ktd3Mjbo4ArGBd3zH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHZHYlQ5MU5jUTVSTWhvQVp0R3c1UC91SFEzYmVlR1dHa0NXQUxyQVVyQUw4?=
 =?utf-8?B?YVYwQms5cmV1VWU3MUt1QmtWcXl1cjF3UEFSdy9SQ1V4UExhdjVLTEpZalUy?=
 =?utf-8?B?T0Q5T2hJaVd3RTJOM29tMk9iVmdlMkNRSzFUdkhBM3ZyRTZPUmdkenhuVnkx?=
 =?utf-8?B?cVVOTzZWMzlxV0UrSHdqWDR2Z2F4VElyams5SEFPbkpJMU9qdmRyUytwbE5Q?=
 =?utf-8?B?NCs4b1l1OU5hd1RBUnpIMGMwYUxMU0c2K05tU09GL0pNS0o1VWJyTUhONWJE?=
 =?utf-8?B?d0o3QlNmcTJTenhJV2pmTHlFV1R1R2owd0pmUENZbU4zV3M5NFVCM2lWeTJS?=
 =?utf-8?B?YjNzbXlGNGZDNUg2cVNHalJxcVJFL3F1dG5scGxpdExLSlE3S01RZ2FVQkph?=
 =?utf-8?B?akJQdVQ2Z1FrdnY0aFYreTJscGZZYU1Nb2I1MWEyVU1BanZGZ3FMNjVLYkVL?=
 =?utf-8?B?WUp0UVFtU2FFdWhNYldFV3ljU1gvb2hqVTJiejdFMTlISHFEUVY5Y0xUeEhs?=
 =?utf-8?B?VXBERjlHbUJ0NDhXTVVKK3dydmlKdGRKWU5LRDFEV3dBNUJkZDNNV2Z4QXFw?=
 =?utf-8?B?Nm44dGsrTE9peDhUbXVCRUJUTjR5dTNTV0I2RU83eGxRd3hHcVdYeFF0L2Z1?=
 =?utf-8?B?TzVkZ3N6YkQzWlVMdUNpTVVZN0xIMjY0b2NTRnZWMEVGQmhCem1ycERySWZM?=
 =?utf-8?B?SEVCaU1SaHVuNHpSRzBHdllUTU9xL1VBbktlbnhyYTdORDJuNnJnMTFVVGlH?=
 =?utf-8?B?Qm5EaG05cEJKVkE4QUdCaGpQRG1RUzZ4dVBRQS8yN3FaUUEwdWNUdDU1VkZs?=
 =?utf-8?B?YmhWbTVLYUNsOXc2NERLYndhd05taXJRUUhtVGtEUHVhRnZYVlNnOGVmMlVw?=
 =?utf-8?B?UGFTMXlPMGJkZUdSYmlMTHlyOFpCZlRrRWg2WkJLamM2S0pOakwzaCs3dmVi?=
 =?utf-8?B?TlF2cWNYdlo2LzNJRElqcjlLR2s1RVFncmt5bDZVT081VVFFYjZDQ2pJRUJJ?=
 =?utf-8?B?MTdhdlhIUzRZOU1WdWY0WVZaR0JPem1yRG4yNGFCR3NIVUxYaExVdWFqclVE?=
 =?utf-8?B?YVVidVVXSGVEc1h5U3dxV25mbEhJWEU1UkRseHhNbWFpeFVQbEhONzFYY1FR?=
 =?utf-8?B?cVZyZDlFRklTVFlLYmVRM1JhVnU1WExqK04zNzQyYzRYYktSS1JGcjZzdmZi?=
 =?utf-8?B?V3c5V1JKZGZaZE5RcERVY29Kb0owTmdILzYycHNiNWxRa1cxUFJndGFGMmhY?=
 =?utf-8?B?dHg1UitSM0pJcjRsVUtqOEM4MUpUNXlBajM1R0FGRjlIZkh5RlorMENOb2Fj?=
 =?utf-8?B?TFpCbS9DVk9XZHh0ZlprV3VVN3R4cnBjbjRVT0o3Y0lKK3JIK0VVVko2ams3?=
 =?utf-8?B?OEc4ck5DSHhrUThhbkVYM09zOFhCazlTdE8zUkZGRURpZktEOVl3RjNRZzly?=
 =?utf-8?B?UldjUno3Z0pIS1pEZ0p6NmJDTFhpQ2hSRW0wajJoL0liMkg2eG9uR09RaVF4?=
 =?utf-8?B?VEs1ZExBRTFseTZEa1JkVk9BOUdURGd2dWxHSGx6VUIzLzF0WHFSWVNQU1Fr?=
 =?utf-8?B?c3NqdG1sRGpYdGtzOHlyYlJRM3F6ck9oRkNXOGVIRnJSODlCeUhkRkRiM1Vi?=
 =?utf-8?B?NC9aSlUzOTVrM25GNHNVTGJmNkVuRUhid1RSMHhjYWVFQXFYMUgzK3o0djI4?=
 =?utf-8?B?ZExVQ0I3Mmd4clFuMVV4UWVhSHpQMlMwRmNlT0F0NHF3SGZvSVk2RGhiMGRh?=
 =?utf-8?B?WmNCSTBzM0xZTDIrUC9vUkR4MXRXd0s4NExGMTZRemxrNWk0M1ZaVEEwTS8x?=
 =?utf-8?B?V09JL0Y0VFdVREFpUXVDS0FmNXVoL2NqcFd6TjRCRkNKSVVEZCtMb2xnNWFB?=
 =?utf-8?B?TTN4ZGZKUm5iY2c3ZzVVd1c4VVdZcWg5YmNWNytsRThsMytqUU1vN0FaSHM3?=
 =?utf-8?B?NFJpVFhtbHZwYVkwSnVpSTZtQ3ZiWGhrQlM2dUVEclN2VGc0UzVtS2xCTGRB?=
 =?utf-8?B?WDV5Y3M5TGRHQ2FaQmtVSDVJZndMTnJ4UWxiVFRSZGlhU2srRjJINHFBTks5?=
 =?utf-8?B?NVR0OGVWUkZWamJPS3k3TEE3WEpqTnc4djFZd2EzTzJWYzVETTJUd241T3pr?=
 =?utf-8?B?VEVocy9NSy9FZUVTREFBdEJEQVkrQUF6U0tFTkRBd0RpZ1ZncUplY0EyVWJH?=
 =?utf-8?B?cG9JUXpMRUFTS2paSzNHVFdsejd2b0pUVkJnQm5kdlRTNTJueDc3ZHdFck9V?=
 =?utf-8?B?eDFrMFdJbExTREovb0FweDA2c1FidHZTY1RCako4bTQxQmpvaHdZbm1wMXJZ?=
 =?utf-8?Q?Z8yCrS3Bjg/uvPAbeD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6fab74f-8a1d-4f4e-85e4-08de62936020
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:43:44.7229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtPmB5lh+HF6Jg8hMuG5nBYffALk7oCgB7g1melJIS1eHtxIwdQS4Wg9giDPm7CLQblHfNGwNrbWjFSqpaJnww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6800

Rename at45db321d@1 to flash@1 to fix below CHECK_DTBS warnings:
at45db321d@1 (atmel,at45db321d): $nodename:0: 'at45db321d@1' does not match '^(flash|.*sram|nand)(@.*)?$'
        from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflash.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts b/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
index 1b6ec55f906839f3efde267aaaee035e348f494e..b17264e06e6916057c426179e4207c4a28acf1ab 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
@@ -327,7 +327,7 @@ vgen3_reg: vgen3 {
 		};
 	};
 
-	flash: at45db321d@1 {
+	flash: flash@1 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "atmel,at45db321d", "atmel,at45", "atmel,dataflash";

-- 
2.34.1

