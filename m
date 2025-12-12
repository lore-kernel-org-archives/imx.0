Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7482315D49
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765533478; cv=fail; b=Xk9l0KkLWbcry8kYagKka4rqT9bUsH2P4yRuaO4WPkDegXHlQREbPMKSJLoVlaORfvBNlzNPaHZNSg5oxxa8rXlf3AVSHFtMt6BjEQD3SAEW1zXnX7stK77/fv/oUDiMfvNKPdFvlJOWybzXbnP9pOLWGLblNjYffyr6b6t5k+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765533478; c=relaxed/simple;
	bh=+20QAArXHSOqAXwS/WLs821KBdhsKVGylZSFKqHV2j4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=b2mXqmJjIgShj0WKiSyDxk9ADsJ3/lxajDGdN4zJkK6/5VsEankgo0b0DmcfeqyXFsQZlFWLwMSalksuzsEGYT9tuIcFwslezJZCHY1ZqxeRQ8qvErTvqIh0tHt0p7i7UESr0QvL+qdI/Yhm3JYzqGYsNBpVrrgcO3wuk86vjS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rr3+rS/J; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rr3+rS/J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0WXW/ZLO3yvzyhPrRx6N6wtMHf+VFYSHRXJNczhUVnFpEYKxd1Wuui8Hd/vPoJXgBBY6ve+v9a0xJPfp8sU4ECM31mkXdb6SATvl4IXH5Bf16rSzcz2w9Z/t2OR4+HZfDs28w8phWoZ8gBQ68blDeN09vXlLyzNgzcWu7/Na5nJUzHPW837zrM4JCkoSNhKlyJ5YR0s4KS1V5iU2ExhoswOpJTUEB8BzS1owRH+b2yZiG1E53a+qJbRbe1bxZ1o1tUa/pFb6YV2AB0Xi6rj+ePXLPnPNDgcTNLBxmpmdOQM/+vO4DythGtFFxfZLDt92GpqqEnoQfe/FXnMwfkA2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFqD2jEAQs92aM0sJShUeC9g+cNjCRigMED60HaHi5E=;
 b=lu0zszs+20zN6DJxYQuoHA0q7bbryUjpraanLCmIV0qmC5IkU94MnDqzewYLyQdNePy3GyQNidgdBPffYNzMUtaKtOnmZf5AbRwWAt3e4spDStZyRnTaN2Y7kO/bd8jTwhzxnRfvxfQR57J3bByyRqiAE473celE/cfIsgYDmXN+2nbZlGZImav6JyphOscNt1J0r6kC7gB3HjpDic63bItN9Kjvr+F3OAnuzuz5VCXn2TbKYp56eMnXQ0re2PTaEHYlpoepWQ6fQjUtM16lqeHOCSvbKQOq9kG8e98dMryPjP2OA5KFUNfSFg6oI7ZmyNYltYH3y47FS6makExcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFqD2jEAQs92aM0sJShUeC9g+cNjCRigMED60HaHi5E=;
 b=Rr3+rS/JD13iKp5ky3djH3C5s3yN7LgTDwcNVW9TrBoGAMwSNl+FR19QU6nm35Dv/UVO2fPteJrWXW+lsSnXvuqD974xwMimWhmqhsXRGTsoEEm2tVjixcj26XeAap9k12MQS1oxh3RBUhs1I7sYmz/JCCsJUMc62EU0SbXKlKhGr1qjkszu70JDBeNvUyGc7oSSQj5vMvk4eORN95o3x5jvjpiGe5cZg8Soefqo9I+i+eqefJQba7ypjQBD4/3C8+v4PyEXQ8lusj2m7SGCTRIlkc06gYRFaYZxSJ8uI5qnKcYXudlBNmBhHtJXkrBLnD6H4aOibNOgetH+GAZpkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8975.eurprd04.prod.outlook.com (2603:10a6:102:20e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:57:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9388.003; Fri, 12 Dec 2025
 09:57:52 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Dec 2025 17:57:19 +0800
Subject: [PATCH 1/3] arm64: dts: imx95-15x15-evk: Use phys to replace
 xceiver-supply
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx9-can-phy-v1-1-a421d7023e13@nxp.com>
References: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>
In-Reply-To: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: 750c2988-5f72-41b4-2aaf-08de3964e9e6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c08xSDhXYzlsb0Ixb1FXdlJiUWRyWlYydGc4S3VzWTJERGc2T2U4TmtHNXhE?=
 =?utf-8?B?L1hUM0IvVTZUWVl6MWtPTVhoN0FFcFF2MnFTcjN1MElrNkVlaDg4T2ZEbmMv?=
 =?utf-8?B?T0d3OGVTUzZ2WVdaeXphVmcreStCek1NakpUeFltZXJQODR4TUhLbXVNcVZ5?=
 =?utf-8?B?cGdpcGRFZng3U3BsamlaVDBnNFc0bDRMUjh2dnB6RFpHSXNBUkY5ZVBCbC9a?=
 =?utf-8?B?L1dIVUlBQXZVRmNlWmJNblZCbktRb2YvemU4cFJPTTVmYVNLcmcvZDNCaDl0?=
 =?utf-8?B?NzNtNHdleGVtY1lhZzZ0NlA5TDRtZVRYYmRTYWJWTjFQcUdKVDdkajVBSnpB?=
 =?utf-8?B?UnloRjZ6bmQzeFVaaGdCaU1YNmJob2lmbExOV3JpMXMxbUNhRkdJVnA4MG1N?=
 =?utf-8?B?TGxOdE44cVR2NHZZWkl2Z2xKZEg2VG03OGlMem11ZGtTMDN1SmozMjNIejY3?=
 =?utf-8?B?ZHJmcXFqZU9jaDV6VzRXcnNjRGQ1b0pPcmVZQkU2R2JsUnNITjNsMDQvZGlZ?=
 =?utf-8?B?QmE3ZitiTHZGTGtnNXlJRzcxNjJlR0JUMGxJWmtZYVA2VEd3ZnZrVGYzc0hr?=
 =?utf-8?B?VDFkNkhRYW5rNE5KRjdTVzZzL3FyemxLSk1tMUxpNWJTbHNsWEYzMjd6YkRU?=
 =?utf-8?B?cHZ3VVRrRVBYamlOTUk4U0xyRThHSDdxcGxVWDQxMUtYRGt1TURSQkowQ1lJ?=
 =?utf-8?B?dHFzL2tJSkFZYkdRalVGcGpjTFhTem5JSWVjdjhoTXBVUHhyMHd5ZitQR2Rq?=
 =?utf-8?B?dGJQVWRjSE9mMnNIWFUxR2JXV3MyVElJL3Q3bW1Kc09URVdNdEdMN245ci8y?=
 =?utf-8?B?aE16SkJjbUJmL25JRDc0T0FMZFVwR1JScFBtcWNYSG4yakVySlJMSVk4WnpV?=
 =?utf-8?B?MmhRVmpNcEsyT3JIWmh3NWQwLzA2bW1qL3k2cG9XVzIvc3RlaUkzZ1ZFMzJ0?=
 =?utf-8?B?ZTM0RGZQUldkTmZEWjZDWUE5dmw5c29PZWcxNTlKUkFvT3VXNEVUejZBbGFh?=
 =?utf-8?B?UVl3eTlHQTBUbVFKU2dJdkVxYi9ldDlHa0xmM2I5aWpoUFUyOEs2UHlHTTRW?=
 =?utf-8?B?QVg2RUpkNVVDWjlseGdFNEloTW1NNmt0WlV0dGJtWCs3RWJPVW9ma0ZCVkxE?=
 =?utf-8?B?YWpzSzB6UzNQQVJmVkVha2psVGQvNTVLQ1FGUFFYdlI1R3ZTUmwxYWhjNTNk?=
 =?utf-8?B?WjhkVkEya2tYNSt1Mmk5MnN5bytzSVpkU1hZRzBKQnpzVnNTd3ZTNTZ6TWIv?=
 =?utf-8?B?RkpzRnNnN2MrNGVSUzZGV3ZvVVdKK3BPYTB5VUZ2NjJPTjZ2Wmphei8vdzh6?=
 =?utf-8?B?eUhDbWtwMm9TOG9RdTZQUTRyRXkxV2ZWLzN0cTF6aW12RURZL3NicjhpNXRG?=
 =?utf-8?B?UzRaV3dwNURrMXk2MXJGalh0MTNRK0pHMitVem9EOHhMYk5rWTgyTmpYSVp5?=
 =?utf-8?B?blhsMlV3cGQ2WkhGOG5kNmMxSFUxUkQ4ajlCalZabXhEWkZBTldaZjYyZ21s?=
 =?utf-8?B?RFpRUXBnNzk2REF4TkVHM0hrVVViL243NkFBcnlQQm8rSk4rRitsaVJRVDQ3?=
 =?utf-8?B?bzNoaTVpanZyT01LenJBQytmblRxUlRvaWpFWUR5dzdTc0kvQzhJWjh2d0di?=
 =?utf-8?B?ZVJnREFuWmxTSU8zOUpNU2lneERoUmpmV0N6Nmo5dWlwY24ydythbWxvWmhX?=
 =?utf-8?B?M1lsUUZaMnYwWHhWdzVrQzdhb0hoMXdQR1VaOExEZHIrTm9ndEpCZXlGUXVQ?=
 =?utf-8?B?ZVBZVVVzMktaMEovSWtyVHp0SU5aY3hCTUdhYytvY0RTR09LWUdmanBucXNU?=
 =?utf-8?B?dG5rTGFUSEZvL1hraVhxTTM3ZXRKR0ZFZndsTGMvM0pRanZaRHhpbWU2QjNr?=
 =?utf-8?B?VmUyLzN2RjRzL1A1d0NLU3RscnZlMkdCdlkvUEJoejdGU1JXYllKSHpHeVJq?=
 =?utf-8?B?aGpwbXVsY3ZHTUxJeDBnVVNKcGp3MmZnQktya2Vuc2xqdi9aWFkxNU12ZTh1?=
 =?utf-8?B?bVJhM05QRlZXenEyWEIvTFd0NTM5V2NLMkdiNFVjWkQ1MGwzWjFXY3hFcEc5?=
 =?utf-8?Q?yByBVJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UThMZG9HaFRuWXRpM3M1REJmbkc0VUtKTlF0UE0ydlNYVzcvSmwwdzhiWHpn?=
 =?utf-8?B?Yk5FQ1RvQ3RPMllnRkNnakpiaXRGWXRnbFJ5aHhsV3oyUEx1aXppYnhCeTdI?=
 =?utf-8?B?NHNUdyt0cjlBREtnajNUNVcyaVh3VDhPdHpQa1FQTFRkOURBNUFhQmVldXJw?=
 =?utf-8?B?RDF6WFVEZkdiTVQxNHVmbXFKQ1d2S1ptdmNUZHZSb3VrSXlCUUVOV3dLWGxt?=
 =?utf-8?B?SE05N3dDU1NNRUxpZW0vSFZPR0VKWUFJNGNlMFVOVU1OeTNRZStFdG1sb2xv?=
 =?utf-8?B?eDIzMCthQjhpZ2dxdWZHa21hb09VRmhUOUZkRnZqdmhVOVNISWxKTG5FU2VQ?=
 =?utf-8?B?aUoxdE9WTzJjWXk3T0tlT1grNzJsUUFsOHlNTS9ORytuKzdxRUxjMUdQcEdy?=
 =?utf-8?B?RVRkaDdDN0FVdkNuWjdvSXE1NU5vZCtDYlhYUVkvQ2RaUkp0eFY1bWtDT3Rl?=
 =?utf-8?B?ak50RUZsUHpyMnhxMFhmYWZacWZUbGZwQVVDWkVmRDdaZ3dwOHY2dEkxZlpL?=
 =?utf-8?B?eGxuWXZVQ21RcVpDUDhvSFhFNUo3N2d1eEVQNkppTnZrRkNyRnI2a2dXTnlI?=
 =?utf-8?B?U3lIUForVVFzZ1FQNUZoUGszaWFTcEZZWWxubzNPWVUwZ25RSS92eWw0UWJs?=
 =?utf-8?B?UXBLTWVJK2J6cjRiSmJLSjcvalUzUkYvand1OHYrQ1RuSkFOUXk1WW1JWVlE?=
 =?utf-8?B?TUVCVi9RMzJkd21QZjNhdFBpalBWWTdvdTNLeTFWSnJkc1lRa2RDNHM2OWRT?=
 =?utf-8?B?N1hHTXoyU1NwOVBNUlg4a2lyUnNqOG9YSDBpa0RKaGRJSUFsZ0hDMHZsQ3U0?=
 =?utf-8?B?cHpTQnFoSStnUG5MYzVQZGx3NmlnWVpmVzFOd1YvMVFycU94RlZrNVJDK2h1?=
 =?utf-8?B?UU4vRGwwWXU1UWdCRE9qNWtTbmluQUQxSTlvbk5GV1EvM0M3MG44blBQcitu?=
 =?utf-8?B?MzVHZUFjdStUSHJZOWdoNURLRGRualI5VDJkT3pxUElVSkIvUlRpUEV5d2F2?=
 =?utf-8?B?eGRjcytSb254MjBEMTlxWjU3WlN4a3lDZXpaNXducDgrVENPdlhhUE1kLzhr?=
 =?utf-8?B?NmVPRFdjeHp3bis0cVkydU1yQWlnTmFCU1ZMR25IVkJ4N2oyK2craTQyUW9F?=
 =?utf-8?B?djc4eFY3SEhGKzNKRE1vdjByK2VyT2RRTjdYd3I0UVZDM1lPdE52bDJyQWQw?=
 =?utf-8?B?OUI0eFlKSDlySW93YSs1MjlOdGpaMEdlUWllaStVSHZFU3Y5YWgvOEhMMHhk?=
 =?utf-8?B?TGE2RzdLdzFsQVhxRFBIMTVyTTgzUElGSWY1SXA3Qld0blJiQVUvOFg5eTl5?=
 =?utf-8?B?QjJEUlJFQnF0T2pYVXdFdHF4a3F3dm1EbjV6bmhpRTlZTFhZb3p0SzhWSXVu?=
 =?utf-8?B?TTA4WDUwY0ZwNWc2amkwZVA2NHJ5d3A3YjJzYjA0aWRzdFdWREhRUTh6VTRa?=
 =?utf-8?B?MVowTk5jazlJd0ptK3g2RVo5TTdLNEkyNldFOWxuY2xESHhxS1BuK1BZQ0VF?=
 =?utf-8?B?RC9uaEhjdkU4YUZVenpiWjF3MGMxZ3NiMjJtRkV0dEVtM3F1cVBjR2V5Vm83?=
 =?utf-8?B?ZG9pdkYrdE1QWEZzNnFIVW05cE8zVmZiaktDMnAwY1F3cUI4aVJ0T3hOZy94?=
 =?utf-8?B?TWcxMDBoS09pbWlDaFNkSFdHZ1RsNU5PRklHVHRKODczaVZtZ0JYZ3hZRGxK?=
 =?utf-8?B?Q081UUMzR05hUkdNai9FRzdVc1JUOGZZdlgvSkxDWGpacGpWc05RUGU1QTl0?=
 =?utf-8?B?ZVl6MExuZlBvcXQ0SGhPVnlId1JHaGxiNFVjZmdrUWRwd0p1empKbmdpTlQy?=
 =?utf-8?B?NDFZRmp1Tm0waUx0Wk4vWVl4eVh2YmVON29uOS9CRHlPaytYVHI4WlNaWWNo?=
 =?utf-8?B?T2VSbW8xbHNPWkxKUGlMQktxcEV1d3JUVGZUQVM2UHJsYnhOOTRoSXhtVXlD?=
 =?utf-8?B?LzhnZVdZQXljQXBRRnBROHVnNDdCU0E0Ti9RTmxMdkFEQVQrSUN3UWx2blNM?=
 =?utf-8?B?WGpBa1pBemY3OWxSVFY2ckpZQll2Z05KNmtTYmcyU0FSK1QveGZoNnV3SVZC?=
 =?utf-8?B?dVh3L21jSEpZRGQ0ZXk3dGlxYU1PTnV3QzRUblV4RThUK3ZwS3Z0V2VrR05B?=
 =?utf-8?Q?yOpZZt0Bw8VW1ADZqVcg4EUgN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750c2988-5f72-41b4-2aaf-08de3964e9e6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:57:52.0052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIkc31ICHL9Dp2eRkg8/xKeNOyK50XVGBrcT0niiUJFZUvWQfhLU05ensewoGPGk7aZvznCrN1t+URv7dTVeZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8975

From: Peng Fan <peng.fan@nxp.com>

The TJA1051T/3 used on i.MX95-15x15-EVK is actually high-speed CAN
transceiver, not a regulator supply. So use phys to reflect the truth.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index c1e245ecea9c16078cf5b59ac527721e156cf939..b934295bac15ee73c2a65a70c462b2cf75534cc1 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -107,12 +107,11 @@ reg_audio_switch1: regulator-audio-switch1 {
 		gpio = <&pcal6524 0 GPIO_ACTIVE_LOW>;
 	};
 
-	reg_can2_stby: regulator-can2-stby {
-		compatible = "regulator-fixed";
-		regulator-max-microvolt = <3300000>;
-		regulator-min-microvolt = <3300000>;
-		regulator-name = "can2-stby";
-		gpio = <&pcal6524 14 GPIO_ACTIVE_LOW>;
+	flexcan2_phy: can-phy {
+		compatible = "nxp,tja1051";
+		#phy-cells = <0>;
+		max-bitrate = <5000000>;
+		silent-gpios = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_m2_pwr: regulator-m2-pwr {
@@ -318,7 +317,7 @@ &enetc_port1 {
 &flexcan2 {
 	pinctrl-0 = <&pinctrl_flexcan2>;
 	pinctrl-names = "default";
-	xceiver-supply = <&reg_can2_stby>;
+	phys = <&flexcan2_phy>;
 	status = "okay";
 };
 

-- 
2.37.1

