Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED34299AAC
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 06:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764744568; cv=fail; b=Xbrg4kvjqMdnM0qb0SLkENXyuCeODljLtl3U19venpCLqgXKYWlELPoY+Koc8ExW8DO2w0LDvrKpYm7i1c8NoASO5m/WviNWB3HbfZ1HHXii9x5xEnWmVqo75pxLtihlwHnQT1SLIrSEHhevKW/Ui+8bPjo4V7KFS3dqgDsz7QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764744568; c=relaxed/simple;
	bh=4w5tTIYti7iA3GrGZlldgwVR5QrapQ+PywNOE5b9rOc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gHbEA3+R4WNPgZH5weOpSFz6ybGpUD/oobZu3PJ/eFSx0Xvp/69NKEa8lwK0jYUU5Nu4ZZI9Yoql8lvwLlks4Y55Noy21Po70q13HX5R13V4i/3ta/bdz0/+oj+2drsb+5GbU+tOj8vG/DAXq2U3Rtuo9IfOerZ+1XVNSboDvGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=doCQQQk7; arc=fail smtp.client-ip=40.107.130.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="doCQQQk7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDufFWfdwP+/bn6iUE3u6NNU3AcxNMdoUzevjie7IArJxKPKh/oWBADDVgDMxTkYI/nQvRufLjV+ZV6UR40tX759iPrAWOoTi7xX30GO1F2iz4lPry5fn+j95noWorORnI/UG77G7+2ORAdD8EP8VM36rXNvT1kxdiTX4n1AmaK0OlsYhF76B3q3Ti/IW8FrqPHAxUsdueQ5i/7jN5QmHuieh2vEzz9ZBBhsMzYNizK6zZlfL0jNwbnZbwrTjmVaxxooPZmqSZV5howTFM9hBM4KXLvtY9r6gm+XvPWQIjkriO6Tmo9yt2S6+fM0GFuPvnvHS8ZKzlcWo6GYgFNd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQHp2yZsK+e2ioy8wswR6PSZqIAIAMOeejkSV5M/CS8=;
 b=FwQZZe070kxMn+0yxTIZqGnK327Td3uq+waDevUo32bp/R4htknM0yxzVwREGTEM11E9jb6s6J7cmzTkQHgSdJ9crQoBh87JbWYdHzst8ZiCZNoqoGsuxo6dYp49J3Zs3DSFVpDQ9iN3jgEJD1sNnGbK5jIfMoUhy5CZVIVETz9dzwnBqoiHsRfjAvmqfqQpvlzMX+uA4qwp6AQLP1uipMLkWw8AsJEJHRMawrkXguvTFW9+T3+GxzHYTfPTszCss6Ou4FjQn/CRfQKIchAw5pF3Z1Ca59IDJoagwEQ8bI/HoTtkcMOoIb2jcRF1onlxpqixLn4PQFplWpn4RP78ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQHp2yZsK+e2ioy8wswR6PSZqIAIAMOeejkSV5M/CS8=;
 b=doCQQQk7nuL90w/O2iQDrtYRg4vBOaWAZf/ziB8X66pDb1BfYcnqrZNwusj9NCyKxB1FQ3lCpBXShb0JT66anZoQT6jFqSFy/I5yHb9QYc2sGKVI7elnRjk0f7ZrirpHBdW5fKBlLAv3adPQhVOn3clw0FMRh9aVk9R17Klg4JktbJvvqKGM6dgcWsGBRxPeSnPMwcEi+zYUotXF2pRzCMKZETqcRxDMoNxbw4cjpb2JdscjEQ2ZXgHV687HkgO54Hv01jRdhN2uPDzeGtDBvMPFbgmKn2XPmUITLokgboDUUKROM9Rq121wNh7Nv4kemPqvX57XFOUaPpPQIz2txg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 06:49:23 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:49:23 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 03 Dec 2025 12:18:09 +0530
Subject: [PATCH v20 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-imx-se-if-v20-4-a04a25c4255f@nxp.com>
References: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
In-Reply-To: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764744504; l=11122;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=4w5tTIYti7iA3GrGZlldgwVR5QrapQ+PywNOE5b9rOc=;
 b=Jn5tb1bCsetTXbYuJxFT1BWiABKpOZHPhsU9/E9u6II4tzjzD66p+a1med9lbIIXVTMSbLe0V
 aD6jGebxn7mD2j9t2zPeY33VAG9/4n/w64c/P2eNltnG41pPflQY7HI
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c723648-3d1d-4d53-3068-08de323817e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlVpeFRNZGsyZVFLYng3S1ROQ0RBZ0RFQTQ1UWx2VWFaUVJ5d0w0OG5YWVgy?=
 =?utf-8?B?cHYxSVoxZ1hsNTVrQmlyalZLblBHbnVyc1Bxc2VLUXZaTjY3enJGRmUwZ1JX?=
 =?utf-8?B?bFgrWDAxa1F2M0s0MVlTc1VSQWgvK1ZpcHZnSFVoaTY0bEptRFJFODFoV1Fr?=
 =?utf-8?B?cHU0UEkrUUVGL2dVVGVmTHAxdjg4ZVNjOCtZTWlmUnFnRVVBOW5KMHJSc0Vi?=
 =?utf-8?B?UGlBdmhMdVFHZ2tYb2dHVmNmOHhTcks2YlRVUGQ4S3ZISG4rb2VSb08weXdS?=
 =?utf-8?B?T3IvNVQzbFFoRzZtTW03ZWlSY0xvY3NiMHJzN0NuOFVQRHRHbmI4MFJ4dHRv?=
 =?utf-8?B?RGlKUUR6Qm1IcGtxdFF6ckk1K2RSQkZMNjV2aHVoK2FQeE5yUEZwM2lJZFBi?=
 =?utf-8?B?ZGZtVmNVL2NsTGpJQzdHQ0xDcE5lOEV0VEkvODZhU2o1TGJYc3dSSGd6cERk?=
 =?utf-8?B?VHUzRnc4bHV5ZEhUbmFqVE42dFpvR205RzZRUXhmZm8yckFTa3FacUdtTDFJ?=
 =?utf-8?B?M0p2UUFsc0RiQkdtNWxHdCt4WElVQWY3UkZNN0M4TExwbUJUNG1FeDBSaHd4?=
 =?utf-8?B?NWNjR1JnMms0eVBWcmFhR3FodXNVaWFoakFxazZIWTVlcEdVNWxvNUFqSHRx?=
 =?utf-8?B?UlU4SkVBZFkzZWlqUlNYaUtSRGNiSWZuSk1IcklQNlBLMlNtY2puZEVQNEpV?=
 =?utf-8?B?WWFNN0Z0b3VEaWMyT2Q0LzY3aUJkc1dMM3MzMVRtMW1vSS9laUhwaVIwYUNZ?=
 =?utf-8?B?RVF3TFdFaU5WM1Z2dkJBQlU0V0hSUFJ6NHBPVjY0YkhzMUlOdTRrRktNQlla?=
 =?utf-8?B?WmVIRndQcFNkbGJQRFg2QXZjckVJdjUyTFlGajNGQ3RnUnZvRm1OQTUwejcx?=
 =?utf-8?B?aW43UnA4bHVibmY4eW5GOGhyVlBjK2FUbzdFSkZRQUFpK2lWcUlnamRac1ZB?=
 =?utf-8?B?bDg0Qm5iS0ozaHNoYW9SdkZqZ2RkeEZvS2p1Kyt4a0pEdTVFcDgvZzY5TVh1?=
 =?utf-8?B?aTlrOXp6SDk0clk2QXlWNlBtdFFRWkpRaFpTYzlCcW93M0N3NG5GVG16N2xm?=
 =?utf-8?B?TFpwdjB0UXEvRmc5ZVM1dTMzem1pdWZ3VHA0N0x3SzZlVFpjbXJaTUVodlJP?=
 =?utf-8?B?TXhZdVNCOG1ENi9oaXdmQzFaRTJ5YnU0ZWZXcnNNVjJyL2dhTHgrdkFKSjhu?=
 =?utf-8?B?ZU5ORUpvN2o5SEJ6eXBFZUFmNjhERWUwQXNMWi9GQllXSTRnOWxDWG15TjFE?=
 =?utf-8?B?OTJCTW5la2JBR2FML0RTZGxDS1VFZzBXaHJta1Q5M0RPS1EyMkMxL01ZU2xJ?=
 =?utf-8?B?L2c0dzhPUmlCVTdQZnQ1RXcrVldkZzBuRDZucm53N05zOTVYNTBUeEJBU2Mz?=
 =?utf-8?B?TGFNdlVDRXJkclFKUU5kQUtYdVNnTTdFcTY1cUxEaENnZlBYa0ZORGxWUXQ4?=
 =?utf-8?B?MFQ3R3FXdCtLWVlwVldhQ3ZaUHdERFdPTFg3TXdVRi9uYi9RTDFPcFpEeW91?=
 =?utf-8?B?cExta01odmYrb2tFLytVMVl1L2hFYjJBbDNJOWNqcHY3cG1EWEUyY1djRFZ3?=
 =?utf-8?B?RDFNVS9GWHVSMEdiWEVPakd5SzV5Wm52ZW1KZUpjdUJ6ZHc4MGorMnNOVnV5?=
 =?utf-8?B?UmdZcGUzSXdFdHlDM2JEUDN6M29KazIxRVBGS3FyU3p5cWlRcUdnb2R6RGVn?=
 =?utf-8?B?ejk3V3laSllJUWlna1ppUWhsWHZpMUVSL1hwV0ljalJmTmtKa3BkRUdPRERy?=
 =?utf-8?B?djFhUmZPa01XVzRnb21qc0l2Tk85cGZ4OGQ0NlNXcis2WVdTejRCU1FWTTJO?=
 =?utf-8?B?dVN5b2doS1RpMVhxWjk0YXk3eTRMc1R5Z0RCOTd6WnlsdFpaWHhjVzNsakRn?=
 =?utf-8?B?ckVZbFNSWjZSMCs5THRGODErck1ybHFtMVVvS0NaMTB2VFptNWtWQ2x0L0Uv?=
 =?utf-8?B?enhiVmdHeWk0b3RHU1J4SFhuU0FlT005bHF3VE1Eb1J6clhpdzZLd3FBUDlk?=
 =?utf-8?B?QkhOTEJzM0lndy9ZV25pOHp6cUtlN3ozZ1dubEhsK2xnM2M3bEU3UjhsZ0dJ?=
 =?utf-8?Q?/OzEOj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ai9kUnNGNVVhTXZidHF0UmJvYnlVc2N3ODl1WlJZN1NVOS9tOWp2N3A5TDJZ?=
 =?utf-8?B?bEExOFVQNTl0eTJyN2g3ZzdvN1UvbHpIL09EK25ZWjZLd2d2VlNieWpsdHlE?=
 =?utf-8?B?K21wd25FdU5jTmN4ZmRPM2lldTFRQlhTK3NlK3RrV245cUF1UnlwaXRFTUFO?=
 =?utf-8?B?YStoMHdJeUdGYWhnNHVYRjVlZkNwWmNXMks4YXJSNGdCZkdXR1hkUyt6VmZP?=
 =?utf-8?B?bm9vd0N2WnBvb3Fpd3JnYlcrbVR0NGJMWlNvcktBKzltN2crWmhnMVRJOENp?=
 =?utf-8?B?KzJIb2FJQ1hEOXNrRmRDYTRuNnMzNnBRck9OUXNaenRueHFZTm84aHFzeFNt?=
 =?utf-8?B?aDJJa2kvV0VIcGpVTyt1YTFUVmd2eHROTU1EdUZzUHRBWnRzMWdMWUlzejBV?=
 =?utf-8?B?OWpKUjJqbytaQ0h2Q2YvOW54dXBZcVZFNjYzVjVrNEx0RFNLNGJCQkg2d1JT?=
 =?utf-8?B?STdQdE9vRkdybXNpa1NxbnRtQlIvUm1taVRMYzZWa2J5V2NxZ2lIRUZUK0NW?=
 =?utf-8?B?dUpmV0gvYjRzT1RNV0NJMExKa0c2REZnWUovZzFCRjgyL0diUmlCdmJPYVNz?=
 =?utf-8?B?VVZzQjgvZEdmSjZrU2E5dSszRytHZGxNM1VreDB3MVB3bkE3a2NzalNNczQ5?=
 =?utf-8?B?Y0tWejcxVS94YlUwdStoSy9TNnYwR1JUakdWVmFrVC9NL01SNHAzWlJNanBQ?=
 =?utf-8?B?eEdWeDRsMWJ1eW9ZNENmL2ZhSGNLVDlSRUtDREpVc2NKQXlXMVFFM3U0YzM2?=
 =?utf-8?B?cmNTUW03S0FEUlh5ejg4RXRBV09BU1lrb1dYZVhHckZTQWs5b3MwT0t0a1Ex?=
 =?utf-8?B?MnBLaGtFSSt1MUs4YnpURGtnTURLYWdkMWxIdDF1b3Z1Nnl1amQ0R1UyTTBQ?=
 =?utf-8?B?bWVFaXBPbkUwWE9SWit0NDNSMFNlMnlUQjBZTDhjdEhLbUJKNXFzdjhES2pz?=
 =?utf-8?B?eFB5Mjdzc2hGZTJ4R2ozRnoxb1djR1piQ0JEOTNHeFA3dnJJc1l0UmdKSEVn?=
 =?utf-8?B?RHVWRk9vMVlKZHJoSHplMlhZY25ob0wxWnpCSzl4eVZSUmdmUXFrcG1SU3RN?=
 =?utf-8?B?Zkk2WW9URElUVjZtT3phQTA5WlVyaWtVUjVOY1U1M0UySExmZGZJYnQxUWo4?=
 =?utf-8?B?RU9ZVGhnR3JrckV3Mk1uKzZiSUxkV2dFSWpNWTB5QWMwUG1HQ044emkyN09t?=
 =?utf-8?B?RDVPTWp1Q2I3R3A2L1dRdXpBU0JrYnltY0xoZmN5RzhBQVBjdVFPK1NVK2x6?=
 =?utf-8?B?bmdMTkdSb2pCdHFtOC9uSVNCRzYvdDc4bVpScGk0R3o3OThRTjJvajhaSnBU?=
 =?utf-8?B?b2JQOHMrNW5RQkZtR29zZmhoamhvZHNCeG5heWZ3Q0ZVaVd3MGZGa0pTTG1D?=
 =?utf-8?B?RkVrYjkvZHJJSzFGbVVUU2JtckQyRUZpemF6a284VlIvbEFxZzg1cmxWb3RM?=
 =?utf-8?B?djVrQ0lkMlhJSFRZMmF5Q1grUnJKbEE4NW1ORzR5MGQrOHlrdlQwQjFFR3JG?=
 =?utf-8?B?aHpiVTBUOHN4alRYNFV2Q1c3Nk1hbDF3SXRYc0Q2VVhWa01XdkQyV1ZtWk9H?=
 =?utf-8?B?ZkEvajRTaVhiR2ZmbjR2WVR3Q3AvNTNEWmUxNDBtUEhudk5RUGU2NGtuK0hu?=
 =?utf-8?B?SllsSEhjYm9TaC9ZWlg5ZXJmSXBjRzVVdjBsK0Y4WVNYajUrYzlGR0xqK3lU?=
 =?utf-8?B?RUJJU2pWTU9aR2NjRmRuMmcxK09Nb1BQZnRNbUtWVFlLS2lmL0ZRQ3pyU3Jm?=
 =?utf-8?B?NExsaFlxakJERDlXNStJQVNBeCtiRm10TTR1NjU1REpLOWVGWFNJRitaVmx0?=
 =?utf-8?B?L3c3QVVqWGkrWmE2QTRCV1lPMDRzUDg2eVBGT2JraTYvUmdUTWk2WjlvZVdZ?=
 =?utf-8?B?TW1XbThLRjI3eEcwQ2h0STB1TEhXazAzUXhEWGFNUTdIalRmWGZOVi9lRDBu?=
 =?utf-8?B?RzRuMEJsSVV2RWxZWTFvQkI0Z1F3S0l3ckVIVVE3ZzJhUnNKd3NzZ3c1N2x1?=
 =?utf-8?B?RWxXMXdNc1FEaTZmZ2pWWi9vNDdlaENRczJWWkZuMVJYenBqK1VuWEhaUFpK?=
 =?utf-8?B?OEF4b2FDamZHZGhtMThabGRYbWJEbFE1ckdGWmt5dWRqS092N2xhMmVlV3l6?=
 =?utf-8?Q?D3ev5NDSQ6vVaITdLN6OQfbax?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c723648-3d1d-4d53-3068-08de323817e1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:49:23.4397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMe1QiRid3yhHYJ+LEu1cCXubUtVxgHh2aE6zCYiCkxDCw0NAG5wG7HupJgaPlonI5PIkoNTYTH5jn7ZQHRtuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 14 +++++-----
 drivers/firmware/imx/ele_common.c   | 51 +++++++++++++++++++++----------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 29 +++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++++
 5 files changed, 78 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index a070acbd895c..b233729dd13d 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -59,8 +59,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0)
 		goto exit;
 
@@ -109,8 +109,8 @@ int ele_ping(struct se_if_priv *priv)
 		return ret;
 	}
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -154,7 +154,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!tx_msg->data[4])
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -199,7 +199,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	tx_msg->data[1] = upper_32_bits(contnr_addr);
 	tx_msg->data[2] = img_addr;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -238,7 +238,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 748eb09474d7..f26fb4d55a9a 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -42,7 +42,7 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
 	unsigned long timeout;
 	int ret;
@@ -52,8 +52,8 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
 		if (ret == -ERESTARTSYS) {
-			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
-				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
+			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
+				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
 				continue;
 			}
 			ret = -EINTR;
@@ -66,7 +66,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -78,15 +78,16 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
 		return err;
 	}
 
@@ -94,27 +95,31 @@ int ele_msg_send(struct se_if_priv *priv,
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0)
 		return err;
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		err = -EINTR;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+		dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 
 	return err;
 }
@@ -159,8 +164,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	/* Incoming command: wake up the receiver if any. */
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
-		dev_dbg(dev, "Selecting cmd receiver for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -169,8 +174,9 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 */
 		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
 		}
@@ -178,14 +184,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
-		dev_dbg(dev, "Selecting resp waiter for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz &&
 		    check_hdr_exception_for_sz(priv, header)) {
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 		}
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 96e987ef6f88..5bac14439d7d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -14,12 +14,12 @@
 
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 5f978c97da4a..40544cbc70ca 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -203,6 +203,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = devm_kzalloc(priv->dev, sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s0_ch%d",
+					  get_se_if_name(priv->if_defs->se_if_type),
+					  ch_id);
+	if (!dev_ctx->devname)
+		return -ENOMEM;
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return ret;
+}
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -325,6 +348,12 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index b15c4022a46c..b5e7705e2f26 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -19,6 +19,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -36,6 +37,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -80,6 +87,8 @@ struct se_if_priv {
 
 	struct gen_pool *mem_pool;
 	const struct se_if_defines *if_defs;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

