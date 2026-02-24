Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013062.outbound.protection.outlook.com [40.107.162.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F503284663
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 19:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771962388; cv=fail; b=XnwbRVKTO1M08tx8DghZVzqRzpd6r3ppZbV9buozDDn8Oi/6+kT/Zraz7HHA4sUxBpiUbEr9GUzfDo1vLufsl7fjCdPdfr3ryq4gxYihPRLPIQOUvj9GwAtZSFxt1VCPmEwn9F1A7s/jTK0tCAhQf5DOfeUX+Ruxm6croZQPNWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771962388; c=relaxed/simple;
	bh=8BtB2JjuGOgIVm4odXkmNkwUpYoSJObva+BnWhuvwtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qeil6xC0HqvkwaDajQg+35Lp0oGOIGpzDnFFc3hFBibeiaHpC7xvM5nBpiKMT4eQjYlW0el5pNBgZ6vqr4UEr6Okf0xe+gf0ZRDbb8FWvuQciASaSwFJYXZdJ08kP3tqYcuC2W9TuMnG1wtimmZEgMmIl5iW3PwZBE4JqF9oFw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ke8kzzW4; arc=fail smtp.client-ip=40.107.162.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ke8kzzW4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiecxAGB3nu5wAjhLO4PTDXIuJhfnUmcLKuTT9JryuHJLehOagCzyYD31652BL2mnSxC3WVvXUrNo3I2u8bEM7GZGzUpqfsNNupDSBGZRCZ7BXFR6CEUSH5M2VjaLlfLu+ux8aHmb3cI2VtstFDh0k2dFEa3ZnUw8ie0mYQeX7Abomn7F1Fh0OLL3CQVzm593rqOhnxwzM6A9wNy2NTGL51GbVuz1IP1kpiHtpL1ODWvIkJwfrm2qdRtq60u/uHcHuBbbOXF0ayduKCP1S+uDa4NWwbRYeZgM5G6Rvs1KKpMU4H171pvoardM3WyZFiFMtoP9F3jIAG0LQYiMD5yaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0e1V1xvTPSpUCREC96PQwsVHARUhxXTPg0ME46RC6UE=;
 b=DUxJ3gPGUsmSLDbYsf+EWcPFQwmYxdbHeSyAFg1n/GX54iPcCNpY43fBeVn+gWWaW9F1HJW51aYsXgeztX1utyS1S/OlmJ3GA6hlvH98sKQXeykjIF2PDY5/OBdRdb6WmVhsU/qcvgRyvRHf1E5RGnRReEZwDJDxZ9eeXGYcTDmehuWFsi4P61A/ElwvjxCqA7rkfngAv0PCy+i0PE7j4lWruiQUK+ZObjk1+y+w3EfZFVoGxeSRrfSyZQEeeq60gaCqPEuwPYf0XV8fFdpTmfQuhhu8EqA9zJT15I1gPMJFDrwMA64FBedY340p5yWIwdvDfdxuYpm3SKXA7n0T/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0e1V1xvTPSpUCREC96PQwsVHARUhxXTPg0ME46RC6UE=;
 b=ke8kzzW4ivpUfMoej+DlbmS66/Pd0pdJKcfXOWjQ6MYV1VShs0P/q0/inGJxT2T8IYDczy5AYUrMN3LNQ9Hv77Mh+y3Vb7BlK/DOPTm004ieX9CpSTPmPXmWHbHV8wHVU5hZ5eW/3lMWAy/CwbTGMUfLux1zuaZeG44EGg7er7vFxHOgQJ8JQ1PKoSwUa3oasr7cGex+XDklftDMgCYabhfthyiV5ahTGxOsAsVwirQ5tUJ9rIorQKyOp0eAVvAY7y1darneAv/JZsaW6vWuYY2GRNxZHwzrjSOuks22JJusAmAubEGvIohq8nB0h92PGq4u6/rg1FN5sIKlTxO1FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB10978.eurprd04.prod.outlook.com (2603:10a6:800:27e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 19:46:24 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 19:46:24 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@puri.sm
Subject: Re: [PATCH v2] arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
Date: Tue, 24 Feb 2026 14:46:07 -0500
Message-ID: <177196235148.3218368.8299697496119492969.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128-imx8mq-gpu-ahb-clock-v2-1-f32548d46188@puri.sm>
References: <20260128-imx8mq-gpu-ahb-clock-v2-1-f32548d46188@puri.sm>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0050.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB10978:EE_
X-MS-Office365-Filtering-Correlation-Id: 1124e945-bc89-4a5d-d997-08de73dd641a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWJnU01yb3RjS1JXRnBnbFNrRTBVdzlvYytpM0J1ZlZ6Q0R5YjhZZC90cTVR?=
 =?utf-8?B?TE9peFpjVUo3aE5MeVVualBQYjZjdEhabFZleCtzTkc2RStHbUdrT3dtMjhn?=
 =?utf-8?B?LzdQeHZNU0gzbDV2Q2ErelRQRExJRzhCMkRyUElLVG1GN1ZzTXBVazhhaVpJ?=
 =?utf-8?B?NG9mU2ZMNWlIZy9mLzFYcTRGQlhvZFVOSUcweG1vZDMwVjJRbGhjaldoTWdZ?=
 =?utf-8?B?WkdUN0NCTzZiRmJQQm96M2ZxenRINE9haGltTFcwS0tQNVIvRVhLWlVmN2xD?=
 =?utf-8?B?RjZrLzVEMzVYeWMydFluOEp2S3hsR2thYUlkTVh4WHBKRTdTei9ubGpUQWZG?=
 =?utf-8?B?NERjdVg5c0krTUlIU2ZVQUEvVGRaWFBFL0p6b1ZBN3NVVklUdHF5N21EOHQy?=
 =?utf-8?B?S2MzQklLOWNPTFMyOWsvQWVIOFVqWGpBWUowZWJITTA3eWJSYksvei9xVUox?=
 =?utf-8?B?QXFxN2dEMG5mdkRwc1FvTFZGRXNyY1p5WGtOUGdYanNpdWNSTFBvM2U1ZG5I?=
 =?utf-8?B?QVoxcTBIMzBrUFFObWNnZmh2R05tYTY1OFlKV0xTK0tBS2QwNkVDTjNNZ1JJ?=
 =?utf-8?B?VTFhUmgxUkE2dzFkaUsrNnptZ21zSThYRWExcFNETTBSbDA1U20wQjlSaXJz?=
 =?utf-8?B?WWVUaDNQMnZYY0Y5WldIb01ySFY4VmtXdTJVcDZMNXZ3RWhhWWlia2o5N1RG?=
 =?utf-8?B?R3NLRUl3K29qQklUcVR2aDYwWjBwQ3pzdXBxSzNkYzA2WmJvZW9zZ1pOQy9o?=
 =?utf-8?B?TThUempObGVYQUlrYTZmMjZuNjhkZ0xPcFFiNkhnK1kybG5PbkJGdzNOOEpw?=
 =?utf-8?B?a0J4eWN1UDVGcVM1SkRBcFFZdENVQXhTbEozcGJ3bHIxaEU3ZmIrV3VIelgw?=
 =?utf-8?B?OU5aeVJpT3htWk41WDY0M1FERW5DOGZuQ0xwNTZVZDBEOHcrWGVXOEJQWjZF?=
 =?utf-8?B?YklxaVUrdUhrT3IxK09Bd1lPNkMyOW80MXdTN08vZkx0VWhoNEl3MElCTm5T?=
 =?utf-8?B?eXNINE1pcWdkRUNlSTltc2tJeXYvVklGcnlVeU9VdkZzYWJqSGVhN0tyLyt4?=
 =?utf-8?B?TGJpVHA0TDhlQ3ZKeHNIejdkMDlyZTBiMkZhM2tycFdpU1pnUklWWlpJc0tW?=
 =?utf-8?B?T2FCengvRCtTai9oVnM0SW50WVh4TUdKQjhyQ1o3dysvL3Q3Wk5mZklrSWpK?=
 =?utf-8?B?cGpZa2JBU2dzRzIxd2VvSTFFQXM1TTVxcVVQWDhMV0lnK1J4SGZxdkF0R1Zs?=
 =?utf-8?B?czRuWnB2S01KeGt6ZGdnejVoSmd3RXdQOEFxYzN5K0t2RllXTFVObmhUU1NM?=
 =?utf-8?B?ZitsbUtkZmpQVDFtK2xtdWxOa0FRT1dPd3B6YzJTRzM1Zzc5K2lsWXQwMUZX?=
 =?utf-8?B?QzJzNjUzeEFtTmo3WU9WaUgwSzluOFMvZXlkdWtxbnJZTUw3bnBtVmd0RGFk?=
 =?utf-8?B?QUdaOUtVSVlGUFJYODNEUXYvR0hjc2IzNEVpVDJrUmhlOUdNS0c0OEdSbm9n?=
 =?utf-8?B?c3d5Q1FUelFCMG1Hc1pxZWlFeU5hc0gwa2VqYWxOWmpwaWkrYWRCeFJ1ZVBP?=
 =?utf-8?B?T0xsUTB0SHFpUjdwZHk5YWRsL2lSRmw5V0NsRndDaXh1WVZxSHQwNnRpUWo2?=
 =?utf-8?B?ZG80aFg5ZXl6V01jdlVWUTlwRTFTRG52bGFXZmlhSUJuYm9JMW1IbEVJL3VM?=
 =?utf-8?B?MEFPUEdFS0ZQd2ZZQnUwYWV5VnRoYTlHcFBwUDh6OVpzVTIrY0VEcUNGbzE0?=
 =?utf-8?B?NnRRMll2TG1ZN1krUlNHV1BHRkxyc29oSGpQZGx4OGFndlZ0QkRlcWlGSTZI?=
 =?utf-8?B?dDduYUlQTTlYVEdnc1I0U1dYOXFVV2pSVk4vWjRwT25XeDZmT2RmK1RqaTRZ?=
 =?utf-8?B?TEFxTzN0S1NmYXhyN0dvUjlQSUtPdTMwZlhGY2w0d2xhL0dkSzJ5UXlSTjBS?=
 =?utf-8?B?UDlPT1RkdExuWWZMeWxvaVU0aTFiaGJyMSs4OFllSXIwN3BWMFRMWTRCVEpB?=
 =?utf-8?B?Zi9ZYjl4UVhHdnVtNlJENFpQR0lsYWRYNlJIazRqYW44SUlrdUhrSythOW9v?=
 =?utf-8?B?UUcyWWtyUmZLQmdtZ2RrM1BFTk1haVY4Z2xoenJaVnk4RkYyYnM4RDM2QThp?=
 =?utf-8?B?dkNmN0R5WG12MDI4VUJZNDZmOTE1d2ZhT1UzckxZRzZhL2ZsS29ITStXRFhj?=
 =?utf-8?Q?49R5taXukZUbdQr3z9CcAtk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVpDaWdwZ0s3NHVGKzZHQ1Q0K3dmWEdwRTJCdTdUdHAvTzdQc2RnMGc4ckEv?=
 =?utf-8?B?Z1J2RVNzQUZqVlgwWWpOZWg2am9kY3E5VEFWay9OUDlIcnJkS1cxLzQxc1pj?=
 =?utf-8?B?RGJYMUIzdHdqVFptRDQvWS90YnBienRWVmdEK09ZQzhrR1BqdnhzWXltODBF?=
 =?utf-8?B?Tm41TWozUmNSQ0pTZkg3aGw0VTdQNlplSzBTWTVucGQzTC9LWEY0eHRDL2Fm?=
 =?utf-8?B?dUljbGdqblgxbDJqTFRMbEVYSXpOOHVXaWhIWTNoMzNoK1Ewb3FNeStaU3VM?=
 =?utf-8?B?cUtKOG15Q2FTcUFBL2NFN3ovRXRsRFFMbjQ1Rm5VbjhKNlFyOTZJcEhQVDl5?=
 =?utf-8?B?Q0ZOMVJmTXJmcXJ0bFRHbzBYaGJ4bW9mZU9nNlhNelcrY3A4YmVRY0VwMFFM?=
 =?utf-8?B?b3hiL0FJU29UaFYrWjJ3eG56OXNYYmE1Z0RyTWtXd001UTVSeU1BcXEveGxC?=
 =?utf-8?B?OFU4ekJxU0RTZVQ4bTVTLzY0bTczMzRSMnEwMCs0eDlYSXdhY3VVTlQzOHRm?=
 =?utf-8?B?NjQ5dDc0Vy9QSnpQTFkwNEZQTyt5T3lDTnUrWVNJR0ZXc3V4clFzREZ3Undq?=
 =?utf-8?B?TmRIUnc3QllLeHdGZDR2bm5SMmxFM016MFVPalh0SUY3T0JBR1U5aTd2MVVi?=
 =?utf-8?B?cmV2blliZUtNL1BzU1QzenowRWFlQzc0VzRpQVBSeHNKTTZyVkNGb0Y5Ujg2?=
 =?utf-8?B?WHQ3amk2TG1WVFMya0dOTk0vL21sbTBmRmh6cTdqUy9wL1RRRGhPYktSWXM4?=
 =?utf-8?B?NmpHUmlsL05lOUF5TDBhVTQzNXM1WmRoNkhiZEtPNzdiVzZzcUx0bUp5bWdp?=
 =?utf-8?B?Vy9xTTdNcjF5S2l4Q2JadEJ4NHRrVGZETERGd0lWMnFlNFdWWW9TY3kwZ3NK?=
 =?utf-8?B?UXJYZldHZjA3MTg3RjhjQVRkYWpzTnJVMCtMcmdxOFJaN3BuZlpGRVY1Nktu?=
 =?utf-8?B?bmYrR2IrMHBGMVNpU1pvQzBiK1l3V3dFRVNZQndBNStiaWMwVGR0dER6Tzl0?=
 =?utf-8?B?WHJndEkvWTNGeGYvSytlbGhXTFNYdHNXSHAyMDVVMG9oRXhGVHRzZ0tRalFo?=
 =?utf-8?B?Vmt2aFlSL0sxMnlzTHJKcEtzZ2wvSFdINHJQWENITDdLNStQdklvd2hvdUUv?=
 =?utf-8?B?QnBoZ3dMaks1b0hQaEZkTjJIdkp6V3I0VXJNZEs1T0VBbDZ1MWNPSC9nQUt6?=
 =?utf-8?B?NkdNVy9meEczT1hUNVRodVJzQ1Foam13VzBKaE1yNDF1Q1pMTHBldlptZkxp?=
 =?utf-8?B?ZS9MaGpHQ2VxYUJqU1pYVlU5bWcxdjU4Y2RqOC8vTmxnUkkyOEdlWElqKzdF?=
 =?utf-8?B?QzAyZDRCbStvY3pUbllac3Z2V09KMmVsQjNxd3MyVE4weFlvdzl4TUpVUHc3?=
 =?utf-8?B?LzdRdnp0TnJOamMvaGZpbXhkeVNmNzlwMExJdkp1TG5Da3NBTTRwNDRZcW9O?=
 =?utf-8?B?Zm1QQ1hRdmY0NGkyUjlUMHNtMUN4OUtSZTJqNTFPL2FueUR0dWc5Rmw3b0xz?=
 =?utf-8?B?emNyejIwTDlWVFhydjRBR2ZPeXo2V1lYbHk3S1FsMWFzMVQ4UWFoZUV2TmdS?=
 =?utf-8?B?OGRXRVBCWEdLejlqTHZibWZxVFc5cXJ6bU9hMDF3Uy9IeXIyVFhWcE1TbTN0?=
 =?utf-8?B?YTNlTVlCWWZibG41R2V5YW9sZUh5WWg1R3Q1SCtpeEtoeExhS0Rzd3pTQk00?=
 =?utf-8?B?S2gvUFcyTXFBNDhzbUJrSEdQMEF3Z01GUEpWRkMvNm5VbVpWOVAvNVZBQkhj?=
 =?utf-8?B?YjdlOXBPYTNwWWMzd1Z3NVJ3OUo3VzZCWU5rYk50RldCZWg4MXdEcVVDR1BT?=
 =?utf-8?B?cGxlWm5NSE1vV1V0ZVdySWx5VEdLYUlUVFI4R3FMdFJmS3luVnRzTVEwTjJR?=
 =?utf-8?B?NE0wVFQwa3dZWXMwTE13cmQxd1FiOW55dTUvSnA2UFI0K29FU2RCdmNmU2JC?=
 =?utf-8?B?dkxwN2MzRUtGLzJKSFRqRnBabnBiNDE2MVNPN2ZxTUtweWx4MHdrWFRGaVZj?=
 =?utf-8?B?am5qd2VlK3gzZUo5ZW5NUzdpa3h1ZnN4d1V2VTZJK0RINUlRSW1STTVHemVT?=
 =?utf-8?B?OStkQlVMb0lOaWhyaGRLdmlQZ2dteUtDUnhicVIrMUE0T1ZWb3hLVW0vQXYz?=
 =?utf-8?B?N21RK3RlT3EycDJHV0tZM0UvTzcyN1dPRUU2WkRvakVOaVJQTkJXZHpMKzU3?=
 =?utf-8?B?aW54a01kUHpvN09GWFZQcVNkRmlVN25FSHhpTXJDSUxScDJuQ2ZIMWNQemRi?=
 =?utf-8?B?OTU4Mmt6YXVLZHlYZzFMM1AyV254cjQzRFlqeTJDWDdVVzFXc1R3TnNzTXdE?=
 =?utf-8?B?Um13WVFQdVNDU2szc3ppU3RhbEpCVU0xbVVaRUc4bFlvRVRrTlZhQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1124e945-bc89-4a5d-d997-08de73dd641a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 19:46:24.0999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpaZrX7dAj1DUO4M7TFhqd1vJZQGbqUnf4jOCFeEX1X03oN81N2uXeMENNrXfEVwmf0xLuTT4ShYcZ7PABlhpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10978


On Wed, 28 Jan 2026 00:28:28 +0100, Sebastian Krzyszkowiak wrote:
> According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
> frequency is 400MHz.
> 
> 

Applied, thanks!

[1/1] arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
      commit: 1f99b5d93d99ca17d50b386a674d0ce1f20932d8

Best regards,
--
Frank Li <Frank.Li@nxp.com>
