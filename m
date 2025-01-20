Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283BF1E0DBA
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737372522; cv=fail; b=Q8NzJZzox8E08XRRelS213W4E7TZ/xWx3IL2REWg4iY7EXU0bxrOvVPLxF9ZwywEbXoOl1eOABYkR5bEXTqGFMBY1LYoJcZB10lNgQsfj1P5aoM+m4d6nTcHFmUxRvIQO4HxZkN3DX6i6G5ZixGGFj1POsbzYy1plPSoRiKZXuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737372522; c=relaxed/simple;
	bh=MIxZB7+0iiwHY14iYwrb4PHJ1Df+VGJv6DOmvp5dDhw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qZlGe6pJSZhCJSTPVrCz4S885107Dd7ZMcVpmF0cK997VlJH5jBTDTzIOcuaRDtmEp9LmaTpH8av32AfWAQfCK7MV3ArCaSoDZE8vZUhbv0coJ0VZotjaIt+429VrUFMkylo5Wt7vfIK911jnWMYFYDVlbCWvRja5TZIEFwrTIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hjCp4cOa; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hjCp4cOa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5c/JTyR3aiXDIfgOgdGASp5tfUBGYRWbc1JcFQiiLkgsD0qhNUgRBvPKyKB1l+4XvbzFdtCeb8cYICZXQx1Q7BVNEW3BKWaY1EUjzTjv78cCRs/vwZ//h+prF6Tr5AomtvVF3tDXQ4oGz22EiFp5kkAdjYERHmg6qgAVe3+LNtFjUrFY8VE4eNWjMu4xLtRf2P1HYVWVpawJ8LhMqIxmr4Eja5HAWbw1lPm5TjmGBq98HJ5paenqzt+osUxzFp06fYpmqsGrujWC1VozPF68HS2G6pD0gIfp+t1VpA/a+y8y55zokEsNlmsU0MpWiWHKLxpKtUg1y+roSxVexnc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDKJ3rhxif8AOWhGSoEl9YdwCftvhSNnOv0YFNpNfbM=;
 b=g3RkawJ2x9XcliyVTlwOsgfBmTAZHED5N+jkkQpYnnFxOIG2Zt5X77xJ/AxG8yvjWP4vK+3HA3VdIvcYSh4f+7m8hJP9Jprw3QxGlLBvFnx4h+bLBDRT8VDN2aLXTiZAbgN9qSyPDDRWRXdp30n+bh1G5MWo9dGa0/jyQ3z1UIWcz1+IwwVFfhqO/VXy/235NPKRhh1QluHwq/wDm4lJsRH1uK3j4NRe0/tdWzcIjgPGxjmmqTidy/u6ouTmQa+YVygMiVmk1IbUxbi/QOdzKCNM3ofCim3zztCfAuACVqjioOsWP/DpDlLlCMWFcb8YL+ISlt3+DUDb2XDaGvP4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDKJ3rhxif8AOWhGSoEl9YdwCftvhSNnOv0YFNpNfbM=;
 b=hjCp4cOahOcbJBe2lpeW92OGT9MAg+BnnSbuMW12cq0SkLYT3SCc6uZJ239W3tpVIRp5WLE8gZgg3hFHKMXPR9jA6/AvZd2EQtTBx1aPFhRRpCOkl58CrP8WdXHXgV2VMZWgIaoOSR6BHgI3XjL7VA72QpItbf6Iy2WN2Olg5x+s470Fb22/SxWnULp7H5pJGG2KtdS3tffRSilRUDPdBjtj9N3XWTlRG1cXu9zwkeuFQQ2iZcYepWY3M9RuaRefYA/3WU2NWC9urCOov6ZA2tF+s5/o9/YTXAQ63j1y9RO+HsNms4lkedGG0/K+C15bCYfQEokJZNu4E8i0Qy80xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AS4PR04MB9551.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Mon, 20 Jan
 2025 11:28:35 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 11:28:35 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Mon, 20 Jan 2025 22:22:22 +0530
Subject: [PATCH v12 4/5] firmware: imx: add driver for NXP EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-imx-se-if-v12-4-c5ec9754570c@nxp.com>
References: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
In-Reply-To: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737391948; l=39055;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=MIxZB7+0iiwHY14iYwrb4PHJ1Df+VGJv6DOmvp5dDhw=;
 b=YSEguYOO4DRHxmpCF+ETV6tA7LFKDbsFMVvG6oPsS4SWKtI2ZMUkHYlUCYuYB7VMy0IFSte5l
 l1uqqk2ApkOCOS4BnsbMce5Rkc6xPdBOzwNSZ2F3y1AzNx2vTWWQlFi
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AS4PR04MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: 2acb462b-4394-4683-765d-08dd394593d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk1oZzZEUm1MSkdYd1krVmtWYmFvRkNhcWlGQXZ4aDRJU0xITURKMmVWTkd1?=
 =?utf-8?B?eWFsY01VYjFLQlVVSjk3STlkS0NMZWs3Q0gwa3NqN0JNUmtVelJqTWJZcFpJ?=
 =?utf-8?B?VlVFUFczSDM0M1ZDNVBITXNoaldIUTR6TXY1QjN6a1VseDVKaVNvWEIyZ1lp?=
 =?utf-8?B?WGhaaWlXWGxUZG1IVDcvNDBsb3dsaVV6eUtFbmhVMGNzUVR2WkRRK2ttYjdz?=
 =?utf-8?B?bnkrUGhiazF5bWtBM1EzT1M3MXZzNWlGd2JDRzJuWjdFV2hINW5qRzd2bWYr?=
 =?utf-8?B?RHRPaXBlRWNuaWV3Rk5Md0diTngvcnlickpicFdmeEJSaExqRDRjK1lTUDFI?=
 =?utf-8?B?V2p6ekk2Qis2YWZ5eUdGdG1sZjdJQkZwUHJEcDlmNDNGaVo1d3VOSWlzVjBZ?=
 =?utf-8?B?K1JHcVM2YVRXREN4S01xckdjMUo3dTJncHBhZkIyVGxCVzdWMjg3bnJxVzZr?=
 =?utf-8?B?VXducXk2TkZuSHBnb2V5aURKMjNIMWl1eXNRVERLOFRkV0x6dHoxTWhoMjZt?=
 =?utf-8?B?U0hJV1hsNkZDTkFSbkh5V3JpSG9tVys1ZFdnTjU4NWJLcmREWW82YWxvM2Ur?=
 =?utf-8?B?MWVuc0lCSFNiaG81bmwzWnk3Y3owQ2dOOG5mbFordlZzSTNrSk84OTBFeVAw?=
 =?utf-8?B?UWJ5OThLTmxhVnpHamZRM05rblVMNjYwWTdRZjhaYXJVb0hBbGJFdDBzZ0Nk?=
 =?utf-8?B?UXRRSDdiVzNnR2xPZXlNSXBmdE9zbTYvSWNVd3dlaTA2QmYvbVNtRHIwMVNn?=
 =?utf-8?B?cFpnc0dUdCtDanVIUFJzZGFIYkJFM09UMlErMlpYQ3dzSVhmZjRWWTh4WFUw?=
 =?utf-8?B?VysxK3laRW1NSTBMWUR2UGdSMHNlK2VucUUxNllEbG00MlZUUFhib0xiUkFV?=
 =?utf-8?B?bjlxNlRicmZFZDhjbVV6dTdmbXNnU1gwK1RDMGJjdlJBOW5IeEcvRS9nNzFV?=
 =?utf-8?B?emxBRmdTN2VQbGV6cWU5Y2lWUmJYZWFvVkNPVHdpMTJydGM2ZzNWUWxKZ01m?=
 =?utf-8?B?aUE0MjE2T3lYamN3VTJmWmJhU2tmdElKMEp4dVFUVzFNN0xuNS82ZFc5Y3kw?=
 =?utf-8?B?c0VWZzJXa3B0dG9QdUFqRUp1ODloU25PRVVXcmJaWHpTb3FnVlVEcDA5RWha?=
 =?utf-8?B?RktpOUw4LzFnR2NRWE9hR1J3QjNJY2RLS0lBbG1MQXR6Qnh5ek1oR2dsaExK?=
 =?utf-8?B?bVB0WEdpRzV5M2JQQWRrRTUxMXdkRzlVVWVXeklNV2VWcGx5MVhTY1Y0OWZt?=
 =?utf-8?B?TFRUenpHOU1FeFhzWUNRV0lvdUhOUkNYOFVzOFRmQzVJU0xrNUtVSFVBdDZZ?=
 =?utf-8?B?Q3Nvei9UVkVNWVdZd1NjSnpPWFBERm9ObTRmYXY1Q2gvNi93T090QzJXNTFM?=
 =?utf-8?B?M3FkMzRYOUMxM1BVYUVHUjl0MUVrMU1ld0VmcW10TlB1RWxwN2lQVTFmSXdE?=
 =?utf-8?B?UGRLdW9hVlBRSmtlcXFKVDVUcGdTZ3RiZ3VVaUthNEFvZXAxZzI4di9tdk9l?=
 =?utf-8?B?U290dUdaSzE3QUNpNWVISXU2NGRzbWRISksrdWhheTFKczNpa0pKSDBzcmhD?=
 =?utf-8?B?R0ErTEFTUFJKY3lOTFJ4bXBBNnk2a2kyTkU5b29tWHc0WFNCdzBuMFphZ0dy?=
 =?utf-8?B?YUhwbjZ1UjcwaHkvU1VzMGlGUVRpYmRENENRMW9lWkZ5RDJseWRnMlFhRTli?=
 =?utf-8?B?Q2JkVEFnMkYwazVVZWFyL3VQZW5YUzFSN3dDdWV4RU4xWDFhT0s4djlSNXNT?=
 =?utf-8?B?ZDV6Y3l0T1hzWUVjTDdCVjJGYjEzdkJsVWxDelM5UXE5ZVp1Q1kzd3NyOENo?=
 =?utf-8?B?WGhneWRNcHY1VUd0SzVyZHNRdmhlZWRkMUpjRWdodlE3OVFoS2hBYlEvMk1a?=
 =?utf-8?B?UFhBeURGYUZVKy9xMld5QktybWF1OFE4K0xGSmFPUHNQSGVQVXFmZFNtbTNM?=
 =?utf-8?Q?O5U3IlN/QsoKTSdT/altx1lOQSCroJI3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZldjblFyeXRSb3NRK1hIZ05xM1R1MUVPU05ZYVlONUxhdUZaYWxXM2d5ekdi?=
 =?utf-8?B?Rm1UVmNxTVlwVUlpQUZBcG5CaWxyaHBYOUhwYkNtM2V1ckhEWkdiVTgvRitE?=
 =?utf-8?B?TlphekVPNSthVDEyd0JFYlhXNkUyQ2J0ZnRITHhjTjF0SEhGdFM1dXhnMFlh?=
 =?utf-8?B?Ym9HOHhzQm4xSStOTkJxYVNBOUhjcHQxaU5hK1Z6Y3FsMVRzOEp1T3lMRGxE?=
 =?utf-8?B?dVJmV3pzWDNQK1A3ZFBINkZ5OW5HOFJBdHFaZmkrSXVJR2ZLTWI5WFVqV25y?=
 =?utf-8?B?bVFaSTNGUXZHcEl2Qlh6OHJyZGpLKzdBWERDdXBJVG4waW5kZjNpazNOODdi?=
 =?utf-8?B?RzNxN0hkV0ViVmlLclZES1IrZUI1cThEblJhM2ZYMElsd0tsTE5aY0ZYdjlu?=
 =?utf-8?B?Tnh4WjVlTldzTWpKeHNZekg1bnVucTVSTHEyZWlRclhHZ3M3cHQzLzRFWWlC?=
 =?utf-8?B?Z2hHWGVaaXppM2tEZnlMcWNhTnB2S3pna1Q2eEFZNnlBakpsWnRzTnpxeFhx?=
 =?utf-8?B?dDdLRGhDU2JWazRrNXFaTjJzbFRtTE1WMDluUEU4bkRkUHdxYU01MzM3K2lZ?=
 =?utf-8?B?U1hNVXVoMmpJWm92cUNPNTRodkZiYjR1SGRUOGdmYTJiOHFuYXRkd2QxRVRX?=
 =?utf-8?B?bzQ0N3V2OEovd1QreE8yN1pGcytxdFR1Uytxa0N4cW84dXRSV0RwTjVnaG9M?=
 =?utf-8?B?THd2ZlhFYzVSU0dhR2JSMlh4S1RJNkYyellBb3RqWUFPcW9hMkcrVWRYbUFL?=
 =?utf-8?B?REROVzJaelExTzk0UjB4OEpWZWw4RzdxZ2grbElkZ3J6WjFMc3c1LzJNeUZr?=
 =?utf-8?B?OERRQmsyYTJrUzZKdjV2d2VITExZdGRiZWp3cTB3cVh1bFZHdDlZd2JTWEFi?=
 =?utf-8?B?Y3lJTE1DOTRjNENEQU9kSmplNlhHNk5ZZExXZ2VPYVY4QVJWa3k5SzFwSG1E?=
 =?utf-8?B?di94Wk8vM0VINE5hMUl0WElGVHZRNGFuMFJKNUhPZkhKMXJDb1ZmMlJzL1R2?=
 =?utf-8?B?MnlhQ3prY09LM3M5SnFKdTk0ZmpJTXMrd1lReTVqZnMwYlJHOVUxKzcrbWVL?=
 =?utf-8?B?Q1UrSXVuY1FKeEtLQ0taT3NwcUxNR1ExZlc3Ti8vVHVFbC85UFdYMzFOajhq?=
 =?utf-8?B?MWkrcWxPZzJSb3gyWmI0MXdFQ0FNQmQxODBoVDNKbnk0aG9iNDhRbmtTZ3Zm?=
 =?utf-8?B?SmQwZHduakVXcjBoY2k5U2tmUFE0aVZ4UTdwa1IxdmxpcmJsT0twMkp4WTBW?=
 =?utf-8?B?ZHdUZ2lvNGs0QlFiNWpBL1pNazVZTWhsV3lyNkFMZTlHU1VZZzNOVkU3VWpn?=
 =?utf-8?B?dzFHNlNiKzAvWE5jbHNoZXQ5aHQwbTJlbWJLVTA5TDllZFFBZjZ2eFFFZzli?=
 =?utf-8?B?NUR4TnNGT0tUVnBYMEFTcHBzVytObFNiMk1FNXJCWVdqVlFOQ0dGQWRUOXpM?=
 =?utf-8?B?bzNRSTdKem05cGxyeW1jaWp6NkdET3h3eVZsSGNtQ2IwNm1zNjlzcjU0T3hl?=
 =?utf-8?B?MFI4Q2RzNWJvekRuSU5PSmt2anc1bFRXZ29oTG9wYXdWVE5Kd2NSSkt0SGJW?=
 =?utf-8?B?QmFNZmZISjZ3WVhtcUFnWTJzMHBQMW9taHBjTkFiZzdTYVcvQ0s1K0hyM3Fm?=
 =?utf-8?B?Q0ViMS9UbU0wWS92ZExiNzRvZ25xTHVJQ095aVRFN2swYU5Ld3lMZkh6VHMx?=
 =?utf-8?B?KzBFMTB0N2lMWW45ZjlmL2o2RllaNWp5TlJtUkxOMzRLYytHeEswRnE1S2lU?=
 =?utf-8?B?NFJEYUl3OU1ZNkVRODdJMFE5Z21NQXJKTUlnTmpQOTllczF0K3hUbE9vWUx4?=
 =?utf-8?B?ZndycEZmQUJJbi80TG15Y004ZVdmdW1jK0pPMFNhcUIwdVgzK1Y5R2xLZFlz?=
 =?utf-8?B?c0hxRUVWK25iRmZNTmJnZjByYTBHeVlhNCsxQlkzZlNuNlNNSzBnRWF3RzlL?=
 =?utf-8?B?WEwzOVlXZnBtVTUvdzdpSHFUYVJjMngzMm5jSjg5aGxlSlJ3WU5QR21ZL1V2?=
 =?utf-8?B?MzNibU5TK2M0OS9DQ3hrQjErOXFxTjJnRnBma1NjRU1TdzZjN05sWkZlaTQ1?=
 =?utf-8?B?S1B2cE9acVUrSWlxbWg4eHd5TnJ4RWxJUWF4SUw1N0Z5QkNZbTB4Uk82MHQv?=
 =?utf-8?Q?OWUNJLsPWfjCSXzDTGfDercD8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acb462b-4394-4683-765d-08dd394593d3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 11:28:35.3148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jL49M6W8ly6WtNFSpmL3i8htO5WYhxY23JAM8y+H3ebUH9a3C4e6ieZY2Z/CXnqjBYXhjf9aCIl7hLCnU0lbdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9551

NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE),
are embedded in the SoC to support the features like HSM, SHE & V2X,
using message based communication interface.

The secure enclave FW communicates on a dedicated messaging unit(MU)
based interface(s) with application core, where kernel is running.
It exists on specific i.MX processors. e.g. i.MX8ULP, i.MX93.

This patch adds the driver for communication interface to secure-enclave,
for exchanging messages with NXP secure enclave HW IP(s) like EdgeLock
Enclave (ELE) from Kernel-space, used by kernel management layers like
- DM-Crypt.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/Kconfig        |  13 +
 drivers/firmware/imx/Makefile       |   2 +
 drivers/firmware/imx/ele_base_msg.c | 273 ++++++++++++++++++
 drivers/firmware/imx/ele_base_msg.h |  94 +++++++
 drivers/firmware/imx/ele_common.c   | 324 ++++++++++++++++++++++
 drivers/firmware/imx/ele_common.h   |  51 ++++
 drivers/firmware/imx/se_ctrl.c      | 536 ++++++++++++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  94 +++++++
 include/linux/firmware/imx/se_api.h |  14 +
 9 files changed, 1401 insertions(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 907cd149c40a..d618de402403 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -32,3 +32,16 @@ config IMX_SCMI_MISC_DRV
 	  core that could provide misc functions such as board control.
 
 	  This driver can also be built as a module.
+
+config IMX_SEC_ENCLAVE
+	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware driver."
+	depends on IMX_MBOX && ARCH_MXC && ARM64
+	select FW_LOADER
+	default m if ARCH_MXC
+
+	help
+	  It is possible to use APIs exposed by the iMX Secure Enclave HW IP called:
+	  - EdgeLock Enclave Firmware (for i.MX8ULP, i.MX93),
+	    like base, HSM, V2X & SHE using the SAB protocol via the shared Messaging
+	    Unit. This driver exposes these interfaces via a set of file descriptors
+	    allowing to configure shared memory, send and receive messages.
diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 8d046c341be8..4e1d2706535d 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -2,3 +2,5 @@
 obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
 obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
 obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
+sec_enclave-objs		= se_ctrl.o ele_common.o ele_base_msg.o
+obj-${CONFIG_IMX_SEC_ENCLAVE}	+= sec_enclave.o
diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
new file mode 100644
index 000000000000..aa00e95d6aee
--- /dev/null
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/types.h>
+
+#include <linux/completion.h>
+#include <linux/dma-mapping.h>
+#include <linux/genalloc.h>
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+
+int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	dma_addr_t get_info_addr = 0;
+	u32 *get_info_data = NULL;
+	int ret = 0;
+
+	if (!priv) {
+		ret = -EINVAL;
+		return ret;
+	}
+
+	memset(s_info, 0x0, sizeof(*s_info));
+
+	if (priv->mem_pool)
+		get_info_data = gen_pool_dma_alloc(priv->mem_pool,
+						   ELE_GET_INFO_BUFF_SZ,
+						   &get_info_addr);
+	else
+		get_info_data = dma_alloc_coherent(priv->dev,
+						   ELE_GET_INFO_BUFF_SZ,
+						   &get_info_addr,
+						   GFP_KERNEL);
+	if (!get_info_data) {
+		ret = -ENOMEM;
+		dev_dbg(priv->dev,
+			"%s: Failed to allocate get_info_addr.\n",
+			__func__);
+		return ret;
+	}
+
+	tx_msg = kzalloc(ELE_GET_INFO_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	rx_msg = kzalloc(ELE_GET_INFO_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	ret = se_fill_cmd_msg_hdr(priv,
+				      (struct se_msg_hdr *)&tx_msg->header,
+				      ELE_GET_INFO_REQ,
+				      ELE_GET_INFO_REQ_MSG_SZ,
+				      true);
+	if (ret)
+		goto exit;
+
+	tx_msg->data[0] = upper_32_bits(get_info_addr);
+	tx_msg->data[1] = lower_32_bits(get_info_addr);
+	tx_msg->data[2] = sizeof(*s_info);
+	ret = ele_msg_send_rcv(priv,
+			       tx_msg,
+			       ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg,
+			       ELE_GET_INFO_RSP_MSG_SZ);
+	if (ret < 0)
+		goto exit;
+
+	ret = se_val_rsp_hdr_n_status(priv,
+				      rx_msg,
+				      ELE_GET_INFO_REQ,
+				      ELE_GET_INFO_RSP_MSG_SZ,
+				      true);
+
+	memcpy(s_info, get_info_data, sizeof(*s_info));
+
+exit:
+	if (priv->mem_pool)
+		gen_pool_free(priv->mem_pool,
+			      (u64) get_info_data,
+			      ELE_GET_INFO_BUFF_SZ);
+	else
+		dma_free_coherent(priv->dev,
+				  ELE_GET_INFO_BUFF_SZ,
+				  get_info_data,
+				  get_info_addr);
+
+	return ret;
+}
+
+int ele_fetch_soc_info(struct se_if_priv *priv, void *data)
+{
+	int err;
+
+	err = ele_get_info(priv, data);
+	if (err < 0)
+		return err;
+
+	return err;
+}
+
+int ele_ping(struct se_if_priv *priv)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret = 0;
+
+	if (!priv) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	tx_msg = kzalloc(ELE_PING_REQ_SZ, GFP_KERNEL);
+	if (!tx_msg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	rx_msg = kzalloc(ELE_PING_RSP_SZ, GFP_KERNEL);
+	if (!rx_msg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	ret = se_fill_cmd_msg_hdr(priv,
+				      (struct se_msg_hdr *)&tx_msg->header,
+				      ELE_PING_REQ, ELE_PING_REQ_SZ, true);
+	if (ret) {
+		dev_err(priv->dev, "Error: se_fill_cmd_msg_hdr failed.\n");
+		goto exit;
+	}
+
+	ret = ele_msg_send_rcv(priv,
+			       tx_msg,
+			       ELE_PING_REQ_SZ,
+			       rx_msg,
+			       ELE_PING_RSP_SZ);
+	if (ret < 0)
+		goto exit;
+
+	ret = se_val_rsp_hdr_n_status(priv,
+				      rx_msg,
+				      ELE_PING_REQ,
+				      ELE_PING_RSP_SZ,
+				      true);
+exit:
+	return ret;
+}
+
+int ele_service_swap(struct se_if_priv *priv,
+		     phys_addr_t addr,
+		     u32 addr_size, u16 flag)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret = 0;
+
+	if (!priv) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	tx_msg = kzalloc(ELE_SERVICE_SWAP_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	rx_msg = kzalloc(ELE_SERVICE_SWAP_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	ret = se_fill_cmd_msg_hdr(priv,
+				      (struct se_msg_hdr *)&tx_msg->header,
+				      ELE_SERVICE_SWAP_REQ,
+				      ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
+	if (ret)
+		goto exit;
+
+	tx_msg->data[0] = flag;
+	tx_msg->data[1] = addr_size;
+	tx_msg->data[2] = ELE_NONE_VAL;
+	tx_msg->data[3] = lower_32_bits(addr);
+	tx_msg->data[4] = se_add_msg_crc((uint32_t *)&tx_msg[0],
+						 ELE_SERVICE_SWAP_REQ_MSG_SZ);
+	ret = ele_msg_send_rcv(priv,
+			       tx_msg,
+			       ELE_SERVICE_SWAP_REQ_MSG_SZ,
+			       rx_msg,
+			       ELE_SERVICE_SWAP_RSP_MSG_SZ);
+	if (ret < 0)
+		goto exit;
+
+	ret = se_val_rsp_hdr_n_status(priv,
+				      rx_msg,
+				      ELE_SERVICE_SWAP_REQ,
+				      ELE_SERVICE_SWAP_RSP_MSG_SZ,
+				      true);
+	if (ret)
+		goto exit;
+
+	if (flag == ELE_IMEM_EXPORT)
+		ret = rx_msg->data[1];
+	else
+		ret = 0;
+
+exit:
+
+	return ret;
+}
+
+int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t addr)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret = 0;
+
+	if (!priv) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	tx_msg = kzalloc(ELE_FW_AUTH_REQ_SZ, GFP_KERNEL);
+	if (!tx_msg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	rx_msg = kzalloc(ELE_FW_AUTH_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	ret = se_fill_cmd_msg_hdr(priv,
+				  (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_FW_AUTH_REQ,
+				  ELE_FW_AUTH_REQ_SZ,
+				  true);
+	if (ret)
+		goto exit;
+
+	tx_msg->data[1] = upper_32_bits(addr);
+	tx_msg->data[0] = lower_32_bits(addr);
+	tx_msg->data[2] = addr;
+
+	ret = ele_msg_send_rcv(priv,
+			       tx_msg,
+			       ELE_FW_AUTH_REQ_SZ,
+			       rx_msg,
+			       ELE_FW_AUTH_RSP_MSG_SZ);
+	if (ret < 0)
+		goto exit;
+
+	ret = se_val_rsp_hdr_n_status(priv,
+				      rx_msg,
+				      ELE_FW_AUTH_REQ,
+				      ELE_FW_AUTH_RSP_MSG_SZ,
+				      true);
+exit:
+	return ret;
+}
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
new file mode 100644
index 000000000000..ef9eb8155167
--- /dev/null
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ *
+ * Header file for the EdgeLock Enclave Base API(s).
+ */
+
+#ifndef ELE_BASE_MSG_H
+#define ELE_BASE_MSG_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+#include "se_ctrl.h"
+
+#define ELE_NONE_VAL			0x0
+
+#define ELE_GET_INFO_REQ		0xDA
+#define ELE_GET_INFO_REQ_MSG_SZ		0x10
+#define ELE_GET_INFO_RSP_MSG_SZ		0x08
+
+#define SOC_ID_MASK			0x0000FFFF
+
+#define MAX_UID_SIZE                     (16)
+#define DEV_GETINFO_ROM_PATCH_SHA_SZ     (32)
+#define DEV_GETINFO_FW_SHA_SZ            (32)
+#define DEV_GETINFO_OEM_SRKH_SZ          (64)
+#define DEV_GETINFO_MIN_VER_MASK	0xFF
+#define DEV_GETINFO_MAJ_VER_MASK	0xFF00
+#define ELE_DEV_INFO_EXTRA_SZ		0x60
+
+struct dev_info {
+	uint8_t  cmd;
+	uint8_t  ver;
+	uint16_t length;
+	uint16_t soc_id;
+	uint16_t soc_rev;
+	uint16_t lmda_val;
+	uint8_t  ssm_state;
+	uint8_t  dev_atts_api_ver;
+	uint8_t  uid[MAX_UID_SIZE];
+	uint8_t  sha_rom_patch[DEV_GETINFO_ROM_PATCH_SHA_SZ];
+	uint8_t  sha_fw[DEV_GETINFO_FW_SHA_SZ];
+};
+
+struct dev_addn_info {
+	uint8_t  oem_srkh[DEV_GETINFO_OEM_SRKH_SZ];
+	uint8_t  trng_state;
+	uint8_t  csal_state;
+	uint8_t  imem_state;
+	uint8_t  reserved2;
+};
+
+struct ele_dev_info {
+	struct dev_info d_info;
+	struct dev_addn_info d_addn_info;
+};
+
+#define ELE_GET_INFO_BUFF_SZ		(sizeof(struct ele_dev_info) \
+						+ ELE_DEV_INFO_EXTRA_SZ)
+
+#define GET_SERIAL_NUM_FROM_UID(x, uid_word_sz) \
+	(((u64)(((u32 *)(x))[(uid_word_sz) - 1]) << 32) | ((u32 *)(x))[0])
+
+#define ELE_DEBUG_DUMP_REQ		0x21
+#define ELE_DEBUG_DUMP_RSP_SZ		0x17
+
+#define ELE_PING_REQ			0x01
+#define ELE_PING_REQ_SZ			0x04
+#define ELE_PING_RSP_SZ			0x08
+
+#define ELE_SERVICE_SWAP_REQ		0xDF
+#define ELE_SERVICE_SWAP_REQ_MSG_SZ	0x18
+#define ELE_SERVICE_SWAP_RSP_MSG_SZ	0x0C
+#define ELE_IMEM_SIZE			0x10000
+#define ELE_IMEM_STATE_OK		0xCA
+#define ELE_IMEM_STATE_BAD		0xFE
+#define ELE_IMEM_STATE_WORD		0x27
+#define ELE_IMEM_STATE_MASK		0x00ff0000
+#define ELE_IMEM_EXPORT			0x1
+#define ELE_IMEM_IMPORT			0x2
+
+#define ELE_FW_AUTH_REQ			0x02
+#define ELE_FW_AUTH_REQ_SZ		0x10
+#define ELE_FW_AUTH_RSP_MSG_SZ		0x08
+
+int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info);
+int ele_fetch_soc_info(struct se_if_priv *priv, void *data);
+int ele_ping(struct se_if_priv *priv);
+int ele_service_swap(struct se_if_priv *priv,
+		     phys_addr_t addr,
+		     u32 addr_size, u16 flag);
+int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t addr);
+#endif
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
new file mode 100644
index 000000000000..67d1fa761172
--- /dev/null
+++ b/drivers/firmware/imx/ele_common.c
@@ -0,0 +1,324 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+
+u32 se_add_msg_crc(u32 *msg, u32 msg_len)
+{
+	u32 nb_words = msg_len / (u32)sizeof(u32);
+	u32 crc = 0;
+	u32 i;
+
+	for (i = 0; i < nb_words - 1; i++)
+		crc ^= *(msg + i);
+
+	return crc;
+}
+
+int ele_msg_rcv(struct se_if_priv *priv,
+		struct se_clbk_handle *se_clbk_hdl)
+{
+	int err = 0;
+
+	do {
+		/* If callback is executed before entrying to wait state,
+		 * it will immediately come out after entering the wait state,
+		 * but completion_done(&se_clbk_hdl->done), will return false
+		 * after exiting the wait state, with err = 0.
+		 */
+		err = wait_for_completion_interruptible(&se_clbk_hdl->done);
+		if (err == -ERESTARTSYS) {
+			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
+				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
+				continue;
+			}
+			dev_err(priv->dev,
+				"Err[0x%x]:Interrupted by signal.\n",
+				err);
+			err = -EINTR;
+			break;
+		}
+	} while (err != 0);
+
+	return err ? err : se_clbk_hdl->rx_msg_sz;
+}
+
+int ele_msg_send(struct se_if_priv *priv,
+		 void *tx_msg,
+		 int tx_msg_sz)
+{
+	struct se_msg_hdr *header;
+	int err;
+
+	header = tx_msg;
+
+	/*
+	 * Check that the size passed as argument matches the size
+	 * carried in the message.
+	 */
+	if (header->size << 2 != tx_msg_sz) {
+		err = -EINVAL;
+		dev_err(priv->dev,
+			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			*(u32 *)header,
+			header->size << 2, tx_msg_sz);
+		goto exit;
+	}
+
+	err = mbox_send_message(priv->tx_chan, tx_msg);
+	if (err < 0) {
+		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		return err;
+	}
+	err = tx_msg_sz;
+
+exit:
+	return err;
+}
+
+/* API used for send/receive blocking call. */
+int ele_msg_send_rcv(struct se_if_priv *priv,
+		     void *tx_msg,
+		     int tx_msg_sz,
+		     void *rx_msg,
+		     int exp_rx_msg_sz)
+{
+	int err;
+
+	guard(mutex)(&priv->se_if_cmd_lock);
+
+	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
+	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
+
+	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	if (err < 0)
+		goto exit;
+
+	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+
+	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
+		err = -EINTR;
+		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
+		dev_err(priv->dev,
+			"Err[0x%x]:Interrupted by signal.\n",
+			err);
+	}
+
+exit:
+	return err;
+}
+
+static bool exception_for_size(struct se_if_priv *priv,
+				struct se_msg_hdr *header)
+{
+	/* List of API(s) that can be accepte variable length
+	 * response buffer.
+	 */
+	if (header->command == ELE_DEBUG_DUMP_REQ &&
+		header->ver == priv->if_defs->base_api_ver &&
+		header->size >= 0 &&
+		header->size <= ELE_DEBUG_DUMP_RSP_SZ)
+		return true;
+
+	return false;
+}
+
+/*
+ * Callback called by mailbox FW, when data is received.
+ */
+void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
+{
+	struct se_clbk_handle *se_clbk_hdl;
+	struct device *dev = mbox_cl->dev;
+	struct se_msg_hdr *header;
+	struct se_if_priv *priv;
+	u32 rx_msg_sz;
+
+	priv = dev_get_drvdata(dev);
+
+	/* The function can be called with NULL msg */
+	if (!msg) {
+		dev_err(dev, "Message is invalid\n");
+		return;
+	}
+
+	header = msg;
+	rx_msg_sz = header->size << 2;
+
+	/* Incoming command: wake up the receiver if any. */
+	if (header->tag == priv->if_defs->cmd_tag) {
+		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
+		dev_dbg(dev,
+			"Selecting cmd receiver for mesg header:0x%x.",
+			*(u32 *) header);
+
+		/* Pre-allocated buffer of MAX_NVM_MSG_LEN
+		 * as the NVM command are initiated by FW.
+		 * Size is revealed as part of this call function.
+		 */
+		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
+			dev_err(dev,
+				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				*(u32 *) header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+
+			se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
+		}
+		se_clbk_hdl->rx_msg_sz = rx_msg_sz;
+
+	} else if (header->tag == priv->if_defs->rsp_tag) {
+		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
+		dev_dbg(dev,
+			"Selecting resp waiter for mesg header:0x%x.",
+			*(u32 *) header);
+
+		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz
+				&& !exception_for_size(priv, header)) {
+			dev_err(dev,
+				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				*(u32 *) header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+
+			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+		}
+	} else {
+		dev_err(dev, "Failed to select a device for message: %.8x\n",
+			*((u32 *) header));
+		return;
+	}
+
+	memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
+
+	/* Allow user to read */
+	complete(&se_clbk_hdl->done);
+}
+
+int se_val_rsp_hdr_n_status(struct se_if_priv *priv,
+			    struct se_api_msg *msg,
+			    uint8_t msg_id,
+			    uint8_t sz,
+			    bool is_base_api)
+{
+	u32 status;
+	struct se_msg_hdr *header = &msg->header;
+
+	if (header->tag != priv->if_defs->rsp_tag) {
+		dev_err(priv->dev,
+			"MSG[0x%x] Hdr: Resp tag mismatch. (0x%x != 0x%x)",
+			msg_id, header->tag, priv->if_defs->rsp_tag);
+		return -EINVAL;
+	}
+
+	if (header->command != msg_id) {
+		dev_err(priv->dev,
+			"MSG Header: Cmd id mismatch. (0x%x != 0x%x)",
+			header->command, msg_id);
+		return -EINVAL;
+	}
+
+	if (header->size != (sz >> 2) && !exception_for_size(priv, header)) {
+		dev_err(priv->dev,
+			"MSG[0x%x] Hdr: Cmd size mismatch. (0x%x != 0x%x)",
+			msg_id, header->size, (sz >> 2));
+		return -EINVAL;
+	}
+
+	if (is_base_api && (header->ver != priv->if_defs->base_api_ver)) {
+		dev_err(priv->dev,
+			"MSG[0x%x] Hdr: Base API Vers mismatch. (0x%x != 0x%x)",
+			msg_id, header->ver, priv->if_defs->base_api_ver);
+		return -EINVAL;
+	} else if (!is_base_api && header->ver != priv->if_defs->fw_api_ver) {
+		dev_err(priv->dev,
+			"MSG[0x%x] Hdr: FW API Vers mismatch. (0x%x != 0x%x)",
+			msg_id, header->ver, priv->if_defs->fw_api_ver);
+		return -EINVAL;
+	}
+
+	status = RES_STATUS(msg->data[0]);
+	if (status != priv->if_defs->success_tag) {
+		dev_err(priv->dev, "Command Id[%x], Response Failure = 0x%x",
+			header->command, status);
+		return -EPERM;
+	}
+
+	return 0;
+}
+
+int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
+{
+	int ret;
+
+	/* EXPORT command will save encrypted IMEM to given address,
+	 * so later in resume, IMEM can be restored from the given
+	 * address.
+	 *
+	 * Size must be at least 64 kB.
+	 */
+	ret = ele_service_swap(priv,
+			       imem->phyaddr,
+			       ELE_IMEM_SIZE,
+			       ELE_IMEM_EXPORT);
+	if (ret < 0)
+		dev_err(priv->dev, "Failed to export IMEM\n");
+	else
+		dev_info(priv->dev,
+			 "Exported %d bytes of encrypted IMEM\n",
+			 ret);
+
+	imem->size = ret;
+	return ret > 0 ? 0 : -1;
+}
+
+int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
+{
+	struct ele_dev_info s_info;
+	int ret;
+
+	/* get info from ELE */
+	ret = ele_get_info(priv, &s_info);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get info from ELE.\n");
+		return ret;
+	}
+	imem->state = s_info.d_addn_info.imem_state;
+
+	/* Get IMEM state, if 0xFE then import IMEM */
+	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_BAD) {
+		/* IMPORT command will restore IMEM from the given
+		 * address, here size is the actual size returned by ELE
+		 * during the export operation
+		 */
+		ret = ele_service_swap(priv,
+				       imem->phyaddr,
+				       imem->size,
+				       ELE_IMEM_IMPORT);
+		if (ret) {
+			dev_err(priv->dev, "Failed to import IMEM\n");
+			goto exit;
+		}
+	} else
+		goto exit;
+
+	/* After importing IMEM, check if IMEM state is equal to 0xCA
+	 * to ensure IMEM is fully loaded and
+	 * ELE functionality can be used.
+	 */
+	ret = ele_get_info(priv, &s_info);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get info from ELE.\n");
+		goto exit;
+	}
+	imem->state = s_info.d_addn_info.imem_state;
+
+	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_OK)
+		dev_info(priv->dev, "Successfully restored IMEM\n");
+	else
+		dev_err(priv->dev, "Failed to restore IMEM\n");
+
+exit:
+	return ret;
+}
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
new file mode 100644
index 000000000000..3d8b6f83fb9d
--- /dev/null
+++ b/drivers/firmware/imx/ele_common.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+
+#ifndef __ELE_COMMON_H__
+#define __ELE_COMMON_H__
+
+#include "se_ctrl.h"
+
+#define ELE_SUCCESS_IND			0xD6
+
+#define IMX_ELE_FW_DIR                 "imx/ele/"
+
+uint32_t se_add_msg_crc(uint32_t *msg, uint32_t msg_len);
+int ele_msg_rcv(struct se_if_priv *priv,
+		struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_send(struct se_if_priv *priv,
+		 void *tx_msg,
+		 int tx_msg_sz);
+int ele_msg_send_rcv(struct se_if_priv *priv,
+		     void *tx_msg,
+		     int tx_msg_sz,
+		     void *rx_msg,
+		     int exp_rx_msg_sz);
+void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
+int se_val_rsp_hdr_n_status(struct se_if_priv *priv,
+			    struct se_api_msg *msg,
+			    uint8_t msg_id,
+			    uint8_t sz,
+			    bool is_base_api);
+
+/* Fill a command message header with a given command ID and length in bytes. */
+static inline int se_fill_cmd_msg_hdr(struct se_if_priv *priv,
+				      struct se_msg_hdr *hdr,
+				      u8 cmd, u32 len,
+				      bool is_base_api)
+{
+	hdr->tag = priv->if_defs->cmd_tag;
+	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
+	hdr->command = cmd;
+	hdr->size = len >> 2;
+
+	return 0;
+}
+
+int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
+int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
+
+#endif /*__ELE_COMMON_H__ */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
new file mode 100644
index 000000000000..7f6b9199e6ac
--- /dev/null
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -0,0 +1,536 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/dma-mapping.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/firmware.h>
+#include <linux/firmware/imx/se_api.h>
+#include <linux/genalloc.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/miscdevice.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sys_soc.h>
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+#include "se_ctrl.h"
+
+#define MAX_SOC_INFO_DATA_SZ		256
+#define MBOX_TX_NAME			"tx"
+#define MBOX_RX_NAME			"rx"
+#define SE_TYPE_STR_HSM			"hsm"
+#define SE_TYPE_ID_HSM			0x2
+
+struct se_fw_img_name {
+	const u8 *prim_fw_nm_in_rfs;
+	const u8 *seco_fw_nm_in_rfs;
+};
+
+struct se_fw_load_info {
+	const struct se_fw_img_name *se_fw_img_nm;
+	bool is_fw_loaded;
+	bool imem_mgmt;
+	struct se_imem_buf imem;
+};
+
+struct se_if_node_info {
+	u8 se_if_id;
+	u8 se_if_did;
+	struct se_if_defines if_defs;
+	u8 *pool_name;
+	bool reserved_dma_ranges;
+};
+
+/* contains fixed information */
+struct se_if_node_info_list {
+	const u8 num_mu;
+	const u16 soc_id;
+	bool soc_register;
+	int (*se_fetch_soc_info)(struct se_if_priv *priv, void *data);
+	const struct se_fw_img_name se_fw_img_nm;
+	const struct se_if_node_info info[];
+};
+
+struct se_var_info {
+	u16 soc_rev;
+	struct se_fw_load_info load_fw;
+};
+
+static struct se_var_info var_se_info = {
+	.soc_rev = 0,
+	.load_fw = {
+		.is_fw_loaded = true,
+		.imem_mgmt = false,
+	},
+};
+
+static struct se_if_node_info_list imx8ulp_info = {
+	.num_mu = 1,
+	.soc_id = SOC_ID_OF_IMX8ULP,
+	.soc_register = true,
+	.se_fetch_soc_info = ele_fetch_soc_info,
+	.se_fw_img_nm = {
+		.prim_fw_nm_in_rfs = IMX_ELE_FW_DIR
+			"mx8ulpa2-ahab-container.img",
+		.seco_fw_nm_in_rfs = IMX_ELE_FW_DIR
+			"mx8ulpa2ext-ahab-container.img",
+	},
+	.info = {
+			{
+			.se_if_id = 0,
+			.se_if_did = 7,
+			.if_defs = {
+				.se_if_type = SE_TYPE_ID_HSM,
+				.se_instance_id = 0,
+				.cmd_tag = 0x17,
+				.rsp_tag = 0xe1,
+				.success_tag = ELE_SUCCESS_IND,
+				.base_api_ver = MESSAGING_VERSION_6,
+				.fw_api_ver = MESSAGING_VERSION_7,
+			},
+			.pool_name = "sram",
+			.reserved_dma_ranges = true,
+			},
+	},
+};
+
+static struct se_if_node_info_list imx93_info = {
+	.num_mu = 1,
+	.soc_id = SOC_ID_OF_IMX93,
+	.soc_register = false,
+	.se_fetch_soc_info = ele_fetch_soc_info,
+	.se_fw_img_nm = {
+		.prim_fw_nm_in_rfs = NULL,
+		.seco_fw_nm_in_rfs = NULL,
+	},
+	.info = {
+			{
+			.se_if_id = 2,
+			.se_if_did = 3,
+			.if_defs = {
+				.se_if_type = SE_TYPE_ID_HSM,
+				.se_instance_id = 0,
+				.cmd_tag = 0x17,
+				.rsp_tag = 0xe1,
+				.success_tag = ELE_SUCCESS_IND,
+				.base_api_ver = MESSAGING_VERSION_6,
+				.fw_api_ver = MESSAGING_VERSION_7,
+			},
+			.reserved_dma_ranges = true,
+			},
+	},
+};
+
+static const struct of_device_id se_match[] = {
+	{ .compatible = "fsl,imx8ulp-se", .data = (void *)&imx8ulp_info},
+	{ .compatible = "fsl,imx93-se", .data = (void *)&imx93_info},
+	{},
+};
+
+static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
+{
+	return &var_se_info.load_fw;
+}
+
+static int se_soc_info(struct se_if_priv *priv)
+{
+	const struct se_if_node_info_list *info_list = device_get_match_data(priv->dev);
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
+	struct soc_device_attribute *attr;
+	struct ele_dev_info *s_info;
+	struct soc_device *sdev;
+	u8 data[MAX_SOC_INFO_DATA_SZ];
+	int err = 0;
+
+	/* This function should be called once.
+	 * Check if the se_soc_rev is zero to continue.
+	 */
+	if (var_se_info.soc_rev)
+		return err;
+
+	if (info_list->se_fetch_soc_info) {
+		err = info_list->se_fetch_soc_info(priv, &data);
+		if (err < 0) {
+			dev_err(priv->dev, "Failed to fetch SoC Info.");
+			return err;
+		}
+		s_info = (void *)data;
+		var_se_info.soc_rev = s_info->d_info.soc_rev;
+		load_fw->imem.state = s_info->d_addn_info.imem_state;
+	} else {
+		dev_err(priv->dev, "Failed to fetch SoC revision.");
+		if (info_list->soc_register)
+			dev_err(priv->dev, "Failed to do SoC registration.");
+		err = -EINVAL;
+		return err;
+	}
+
+	if (!info_list->soc_register)
+		return 0;
+
+	attr = devm_kzalloc(priv->dev, sizeof(*attr), GFP_KERNEL);
+	if (!attr)
+		return -ENOMEM;
+
+	if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
+		attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x.%x",
+						FIELD_GET(DEV_GETINFO_MIN_VER_MASK,
+							  var_se_info.soc_rev),
+						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
+							  var_se_info.soc_rev));
+	else
+		attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x",
+						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
+							  var_se_info.soc_rev));
+
+	switch (info_list->soc_id) {
+	case SOC_ID_OF_IMX8ULP:
+		attr->soc_id = devm_kasprintf(priv->dev, GFP_KERNEL,
+					      "i.MX8ULP");
+		break;
+	case SOC_ID_OF_IMX93:
+		attr->soc_id = devm_kasprintf(priv->dev, GFP_KERNEL,
+					      "i.MX93");
+		break;
+	}
+
+	err = of_property_read_string(of_root, "model",
+				      &attr->machine);
+	if (err)
+		return -EINVAL;
+
+	attr->family = devm_kasprintf(priv->dev, GFP_KERNEL, "Freescale i.MX");
+
+	attr->serial_number
+		= devm_kasprintf(priv->dev, GFP_KERNEL, "%016llX",
+				 GET_SERIAL_NUM_FROM_UID(s_info->d_info.uid, MAX_UID_SIZE >> 2));
+
+	sdev = soc_device_register(attr);
+	if (IS_ERR(sdev))
+		return PTR_ERR(sdev);
+
+	return 0;
+}
+
+static int se_load_firmware(struct se_if_priv *priv)
+{
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
+	const struct firmware *fw;
+	phys_addr_t se_fw_phyaddr;
+	const u8 *se_img_file_to_load;
+	u8 *se_fw_buf;
+	int ret;
+
+	if (load_fw->is_fw_loaded)
+		return 0;
+
+	se_img_file_to_load = load_fw->se_fw_img_nm->seco_fw_nm_in_rfs;
+	if (load_fw->se_fw_img_nm->prim_fw_nm_in_rfs &&
+			load_fw->imem.state == ELE_IMEM_STATE_BAD)
+		se_img_file_to_load = load_fw->se_fw_img_nm->prim_fw_nm_in_rfs;
+
+	do {
+		ret = request_firmware(&fw, se_img_file_to_load, priv->dev);
+		if (ret)
+			goto exit;
+
+		dev_info(priv->dev, "loading firmware %s\n", se_img_file_to_load);
+
+		/* allocate buffer to store the SE FW */
+		se_fw_buf = dma_alloc_coherent(priv->dev, fw->size,
+				&se_fw_phyaddr, GFP_KERNEL);
+		if (!se_fw_buf) {
+			ret = -ENOMEM;
+			goto exit;
+		}
+
+		memcpy(se_fw_buf, fw->data, fw->size);
+		ret = ele_fw_authenticate(priv, se_fw_phyaddr);
+		if (ret < 0) {
+			dev_err(priv->dev,
+					"Error %pe: Authenticate & load SE firmware %s.\n",
+					ERR_PTR(ret),
+					se_img_file_to_load);
+			ret = -EPERM;
+		}
+
+		dma_free_coherent(priv->dev,
+				  fw->size,
+				  se_fw_buf,
+				  se_fw_phyaddr);
+
+		release_firmware(fw);
+
+		if (!ret && load_fw->imem.state == ELE_IMEM_STATE_BAD &&
+				se_img_file_to_load == load_fw->se_fw_img_nm->prim_fw_nm_in_rfs)
+			se_img_file_to_load = load_fw->se_fw_img_nm->seco_fw_nm_in_rfs;
+		else
+			se_img_file_to_load = NULL;
+
+	} while (se_img_file_to_load);
+
+	if (!ret)
+		load_fw->is_fw_loaded = true;
+
+exit:
+	return ret;
+}
+
+/* interface for managed res to free a mailbox channel */
+static void if_mbox_free_channel(void *mbox_chan)
+{
+	mbox_free_channel(mbox_chan);
+}
+
+static int se_if_request_channel(struct device *dev,
+				 struct mbox_chan **chan,
+				 struct mbox_client *cl,
+				 const char *name)
+{
+	struct mbox_chan *t_chan;
+	int ret = 0;
+
+	t_chan = mbox_request_channel_byname(cl, name);
+	if (IS_ERR(t_chan)) {
+		ret = PTR_ERR(t_chan);
+		return dev_err_probe(dev, ret,
+				     "Failed to request %s channel.", name);
+	}
+
+	ret = devm_add_action(dev, if_mbox_free_channel, t_chan);
+	if (ret) {
+		dev_err(dev, "failed to add devm removal of mbox %s\n", name);
+		goto exit;
+	}
+
+	*chan = t_chan;
+
+exit:
+	return ret;
+}
+
+static void se_if_probe_cleanup(void *plat_dev)
+{
+	struct platform_device *pdev = plat_dev;
+	struct device *dev = &pdev->dev;
+	struct se_fw_load_info *load_fw;
+	struct se_if_priv *priv;
+
+	priv = dev_get_drvdata(dev);
+	load_fw = get_load_fw_instance(priv);
+
+	/* In se_if_request_channel(), passed the clean-up functional
+	 * pointer reference as action to devm_add_action().
+	 * No need to free the mbox channels here.
+	 */
+
+	/* free the buffer in se remove, previously allocated
+	 * in se probe to store encrypted IMEM
+	 */
+	if (load_fw && load_fw->imem.buf) {
+		dmam_free_coherent(dev,
+				   ELE_IMEM_SIZE,
+				   load_fw->imem.buf,
+				   load_fw->imem.phyaddr);
+		load_fw->imem.buf = NULL;
+	}
+
+	/* No need to check, if reserved memory is allocated
+	 * before calling for its release. Or clearing the
+	 * un-set bit.
+	 */
+	of_reserved_mem_device_release(dev);
+}
+
+static int se_if_probe(struct platform_device *pdev)
+{
+	const struct se_if_node_info_list *info_list;
+	const struct se_if_node_info *info;
+	struct device *dev = &pdev->dev;
+	struct se_fw_load_info *load_fw;
+	struct se_if_priv *priv;
+	u32 idx;
+	int ret;
+
+	idx = GET_IDX_FROM_DEV_NODE_NAME(dev->of_node);
+	info_list = device_get_match_data(dev);
+	if (idx >= info_list->num_mu) {
+		dev_err(dev,
+			"Incorrect node name :%s\n",
+			dev->of_node->full_name);
+		dev_err(dev,
+			"%s-<index>, acceptable index range is 0..%d\n",
+			dev->of_node->name,
+			info_list->num_mu - 1);
+		ret = -EINVAL;
+		return ret;
+	}
+
+	info = &info_list->info[idx];
+	if (!info) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	priv->dev = dev;
+	priv->if_defs = &info->if_defs;
+	dev_set_drvdata(dev, priv);
+
+	ret = devm_add_action(dev, se_if_probe_cleanup, pdev);
+	if (ret)
+		goto exit;
+
+
+	/* Mailbox client configuration */
+	priv->se_mb_cl.dev		= dev;
+	priv->se_mb_cl.tx_block		= false;
+	priv->se_mb_cl.knows_txdone	= true;
+	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
+
+	ret = se_if_request_channel(dev, &priv->tx_chan,
+			&priv->se_mb_cl, MBOX_TX_NAME);
+	if (ret)
+		goto exit;
+
+	ret = se_if_request_channel(dev, &priv->rx_chan,
+			&priv->se_mb_cl, MBOX_RX_NAME);
+	if (ret)
+		goto exit;
+
+	mutex_init(&priv->se_if_cmd_lock);
+
+	init_completion(&priv->waiting_rsp_clbk_hdl.done);
+	init_completion(&priv->cmd_receiver_clbk_hdl.done);
+
+	if (info->pool_name) {
+		priv->mem_pool = of_gen_pool_get(dev->of_node,
+							 info->pool_name, 0);
+		if (!priv->mem_pool) {
+			dev_err(dev,
+				"Unable to get sram pool = %s\n",
+				info->pool_name);
+			goto exit;
+		}
+	}
+
+	if (info->reserved_dma_ranges) {
+		ret = of_reserved_mem_device_init(dev);
+		if (ret) {
+			dev_err(dev,
+				"failed to init reserved memory region %d\n",
+				ret);
+			goto exit;
+		}
+	}
+
+	if (info->if_defs.se_if_type == SE_TYPE_ID_HSM) {
+		ret = se_soc_info(priv);
+		if (ret) {
+			dev_err(dev,
+				"failed[%pe] to fetch SoC Info\n", ERR_PTR(ret));
+			goto exit;
+		}
+	}
+
+	/* By default, there is no pending FW to be loaded.*/
+	if (info_list->se_fw_img_nm.prim_fw_nm_in_rfs ||
+			info_list->se_fw_img_nm.seco_fw_nm_in_rfs) {
+		load_fw = get_load_fw_instance(priv);
+		load_fw->se_fw_img_nm = &info_list->se_fw_img_nm;
+		load_fw->is_fw_loaded = false;
+
+		if (info_list->se_fw_img_nm.prim_fw_nm_in_rfs) {
+			/* allocate buffer where SE store encrypted IMEM */
+			load_fw->imem.buf = dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
+								&load_fw->imem.phyaddr,
+								GFP_KERNEL);
+			if (!load_fw->imem.buf) {
+				dev_err(priv->dev,
+					"dmam-alloc-failed: To store encr-IMEM.\n");
+				ret = -ENOMEM;
+				goto exit;
+			}
+			load_fw->imem_mgmt = true;
+		}
+	}
+	dev_info(dev, "i.MX secure-enclave: %s%d interface to firmware, configured.\n",
+			SE_TYPE_STR_HSM,
+			priv->if_defs->se_instance_id);
+	return ret;
+
+exit:
+	/* if execution control reaches here, if probe fails.
+	 */
+	return dev_err_probe(dev, ret, "%s: Probe failed.", __func__);
+}
+
+static void se_if_remove(struct platform_device *pdev)
+{
+	se_if_probe_cleanup(pdev);
+}
+
+static int se_suspend(struct device *dev)
+{
+	struct se_if_priv *priv = dev_get_drvdata(dev);
+	struct se_fw_load_info *load_fw;
+	int ret = 0;
+
+	load_fw = get_load_fw_instance(priv);
+
+	if (load_fw->imem_mgmt)
+		ret = se_save_imem_state(priv, &load_fw->imem);
+
+	return ret;
+}
+
+static int se_resume(struct device *dev)
+{
+	struct se_if_priv *priv = dev_get_drvdata(dev);
+	struct se_fw_load_info *load_fw;
+
+	load_fw = get_load_fw_instance(priv);
+
+	if (load_fw->imem_mgmt)
+		se_restore_imem_state(priv, &load_fw->imem);
+
+	return 0;
+}
+
+static const struct dev_pm_ops se_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(se_suspend, se_resume)
+};
+
+static struct platform_driver se_driver = {
+	.driver = {
+		.name = "fsl-se",
+		.of_match_table = se_match,
+		.pm = &se_pm,
+	},
+	.probe = se_if_probe,
+	.remove = se_if_remove,
+};
+MODULE_DEVICE_TABLE(of, se_match);
+
+module_platform_driver(se_driver);
+MODULE_AUTHOR("Pankaj Gupta <pankaj.gupta@nxp.com>");
+MODULE_DESCRIPTION("iMX Secure Enclave Driver.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
new file mode 100644
index 000000000000..12c201b503b1
--- /dev/null
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef SE_MU_H
+#define SE_MU_H
+
+#include <linux/miscdevice.h>
+#include <linux/semaphore.h>
+#include <linux/mailbox_client.h>
+
+#define MAX_FW_LOAD_RETRIES		50
+
+#define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_NVM_MSG_LEN			(256)
+#define MESSAGING_VERSION_6		0x6
+#define MESSAGING_VERSION_7		0x7
+#define NODE_NAME			"secure-enclave"
+
+#define GET_ASCII_TO_U8(diff, tens_chr, ones_chr) \
+		((diff > 2) ? (((tens_chr - '0') * 10) + (ones_chr - '0')) :\
+		(tens_chr - '0'))
+
+#define GET_IDX_FROM_DEV_NODE_NAME(dev_of_node) \
+		((strlen(dev_of_node->full_name) > strlen(NODE_NAME)) ?\
+		GET_ASCII_TO_U8((strlen(dev_of_node->full_name) - strlen(NODE_NAME)),\
+				dev_of_node->full_name[strlen(NODE_NAME) + 1], \
+				dev_of_node->full_name[strlen(NODE_NAME) + 2]) : 0)
+
+struct se_clbk_handle {
+	struct completion done;
+	bool signal_rcvd;
+	u32 rx_msg_sz;
+	/* Assignment of the rx_msg buffer to held till the
+	 * received content as part callback function, is copied.
+	 */
+	struct se_api_msg *rx_msg;
+};
+
+struct se_imem_buf {
+	u8 *buf;
+	phys_addr_t phyaddr;
+	u32 size;
+	u32 state;
+};
+
+/* Header of the messages exchange with the EdgeLock Enclave */
+struct se_msg_hdr {
+	u8 ver;
+	u8 size;
+	u8 command;
+	u8 tag;
+}  __packed;
+
+#define SE_MU_HDR_SZ	4
+
+struct se_api_msg {
+	struct se_msg_hdr header;
+	u32 data[];
+};
+
+struct se_if_defines {
+	const u8 se_if_type;
+	const u8 se_instance_id;
+	u8 cmd_tag;
+	u8 rsp_tag;
+	u8 success_tag;
+	u8 base_api_ver;
+	u8 fw_api_ver;
+};
+
+struct se_if_priv {
+	struct device *dev;
+
+	struct se_clbk_handle cmd_receiver_clbk_hdl;
+	/* Update to the waiting_rsp_dev, to be protected
+	 * under se_if_cmd_lock.
+	 */
+	struct se_clbk_handle waiting_rsp_clbk_hdl;
+	/*
+	 * prevent new command to be sent on the se interface while previous
+	 * command is still processing. (response is awaited)
+	 */
+	struct mutex se_if_cmd_lock;
+
+	struct mbox_client se_mb_cl;
+	struct mbox_chan *tx_chan, *rx_chan;
+
+	struct gen_pool *mem_pool;
+	const struct se_if_defines *if_defs;
+};
+
+#endif
diff --git a/include/linux/firmware/imx/se_api.h b/include/linux/firmware/imx/se_api.h
new file mode 100644
index 000000000000..c47f84906837
--- /dev/null
+++ b/include/linux/firmware/imx/se_api.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __SE_API_H__
+#define __SE_API_H__
+
+#include <linux/types.h>
+
+#define SOC_ID_OF_IMX8ULP		0x084D
+#define SOC_ID_OF_IMX93			0x9300
+
+#endif /* __SE_API_H__ */

-- 
2.34.1

