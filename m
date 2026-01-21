Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013038.outbound.protection.outlook.com [40.107.159.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E79340287
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 06:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768978459; cv=fail; b=O7fRVftg8JcXf06ak5BOs4Y+K+yVE7pEGW2udxHNgxjfwRU0EzojoSlXliqPVsSMb2tJblZu1HcTfYVBx9sAv9AoQPtCYQZ5v/HO7AOKGg/Ynz+fz58D2NwqS+kI4eqdox3v66SgDr+enINJXoGXSKmezeY62GkNczluMALOysI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768978459; c=relaxed/simple;
	bh=7LBRoSlJNE2efz7c0yNYjsdUnApVDNJRymK9p6c8Idc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QUToFZ22oixnAPum6wE4VhA0ajO85krUc6H+dez4vJYA8OHTj8/xq666imBknq1WrXKRQys7zkwCdhfW64WvrThKs2e08DgGFppLsZRItQ6ZCL0FXnno3cRGl4ZeyZIc5hcswjK2GmmvN3H5nn3cRn2loF0mdFqx2IfAVi28DCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=njfBZVj0; arc=fail smtp.client-ip=40.107.159.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="njfBZVj0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfH88L+P4dY7s4cLJdX3tnYeTvfs7jAoRwZ7Ica6ayzwEpbCNThMiSDwE1EIC50pzg4kc+3HlgqPN2YZMg8DTOfnqDUWR9WUw/nSZOr1QWcHOX52mE7rol5vmTgPF03wglx2yh5yy139tNsfxSfuaYsdtIEcveZsHTrdw4c0EFXHg+4foAKng0if9LwgZAvfNBtWxmqoUIhdz2udqb4Yc5hPmGLI9Ipc3HdSNbBsnnWCxCAj14+b9SJNnr3LSB02Dwo2DKjN5RFJir/z1pNGbDxRVkf8OCQ5/G4o/FY4ggxZCFmGNdBcK8ortVLXfTbWw9veiS77GF5TFxqu/wZ9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LBRoSlJNE2efz7c0yNYjsdUnApVDNJRymK9p6c8Idc=;
 b=qz76d/ppPUtVNVMCd3We9W7DlS7s0y1mgZsiEn8+Nc6xFHzyyeoSq3ECMh8aKm1ndBJBbVj1ejv6PhO/M0M+OA9DQ0gxWOuBwmir/MlLeHY4GLr6Gyj80gPKnSPITp0IuZp29zxk0ObSjcH1BOPUl3AJLiHHS7Ubo8q3az7yfuKZ68T2GA3Q/EB7Z8/x3RGkvvirrik20kIUf6pQwZaSnU6Jq2PATRuA/8pUNUKuXhKzyw3rjgplCjWvAkOPCu6BtDzVyQ5pajH8AnNeaYo0A3xWejl/V9kf5YBX5a0Ijxyh1tLht1hMIkmKgVv3ZQBHbiZRm4KThVzQmuaJkAyB4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LBRoSlJNE2efz7c0yNYjsdUnApVDNJRymK9p6c8Idc=;
 b=njfBZVj0fTT1nZo//Z7i6pjp8b1cLKXabq3C+ZRjdOK6hHhVNiJ1lDoGd0q/2aRsrGZtHeV6iE4HX8bl0NesxUsQ3y76H63wew9cykEC2sakrUkE7cp3RaDgoPPBtDHjz88rLc4I2mVrZJ+ns1dyoTrQOzQMkOQdXd9h9OuNGj9oiKv9p6FCdXtWZtnJ2CxQzrMihLOZFchoRokU+5NRMGW0/EhlOtnqRLcdq0q4FaaLaU38i5xkJYgUaUe89MroqyqnCVgO+VxjgOkSbOZ3IbaUP7gmh2iX5zTX7CMcsT22fCIHNUeoF0WmsPttM13Lj5vubxJGpeXvU6od1SIqKw==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by MRWPR04MB11286.eurprd04.prod.outlook.com
 (2603:10a6:501:79::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 06:54:11 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 06:54:11 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: imx93-evk/qsb: add m2-pcm-level-shifter-hog
 to enable BT HFP
Thread-Topic: [PATCH] arm64: dts: imx93-evk/qsb: add m2-pcm-level-shifter-hog
 to enable BT HFP
Thread-Index: AQHciedj90LaF2vQYk+VSMNPrn4yPbVbQ2qAgADr34A=
Date: Wed, 21 Jan 2026 06:54:11 +0000
Message-ID:
 <VI0PR04MB121142D337B54A448ED64EC419296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260120083233.1899272-1-sherry.sun@nxp.com>
 <aW+wM9iEQiO+NmyJ@lizhi-Precision-Tower-5810>
In-Reply-To: <aW+wM9iEQiO+NmyJ@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|MRWPR04MB11286:EE_
x-ms-office365-filtering-correlation-id: f683925c-2bc2-44c3-2173-08de58b9e1c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aHhCcGZtSDg4cVpBVTUzUEhRM2p0WlYyb1MyR2kvSlNYM3NhUDhEcVk3MVhY?=
 =?utf-8?B?eGFjRWl4NXIrQ3VraW5vLzRQbmVCdWdvVzdQTjVrdnlOQUt2SVpDdC9MQ2ox?=
 =?utf-8?B?dE1RTk1xbFVlcTRKeUxDSFU0NElQbE55MThMQ0xTMXNsVWZyL0pJeGlYMDZY?=
 =?utf-8?B?czdHbjJrWmFSbEY0a0VuRmNVN3NUaTNLd2pKc1JrSzV1YVlzMWh1a3phdGt4?=
 =?utf-8?B?citETjl3VjBvcGk1b1gxTWZNNTJOMlg2RmFpV1JZWkhIYzlyelhCQjVEcith?=
 =?utf-8?B?OWZWRzl3dUF5ZVQwMEhnWW9oc2dYWUNQSG8xMnNoZWVtemdTbXMxeVlpN1VE?=
 =?utf-8?B?MnNEWUFBelJGRnpVSjNXRHZLa0VWTUs3Y0xGSGpwWC9HQW9uMXpCMmd3VEtK?=
 =?utf-8?B?K2NYKzJZMEdySkJMNytybDRwMHpVcGphb3hJeTBXVTZxdWpSWnFtN2xVU3dL?=
 =?utf-8?B?WUFsald1QnZBZFBLL0RiMG5NSFY0MUhmZ05NaTFDR2hjT2s3dll1b2dpZEJ5?=
 =?utf-8?B?Ymd0VTBtcjdCNFB0TGFlSnVEc2dYMGc0b2dyc21sS2VKaGF0M3I1RmZaYlA4?=
 =?utf-8?B?QldRNzFmeXFwT09vbFJ2NzNabWxCa0Jyd0lTYjR3N1FUaDFmSHVzcjRDcDlB?=
 =?utf-8?B?dCtrSm4xbFdtTHJNdkVLT01tNEhSajRnTk1tTTNsbVhpbDUvTk56a3NYR1g5?=
 =?utf-8?B?aHNUdmlQRFZGd1huTGV4MUMxMXhtaDVDSDBIRXRQeGdxNFVJWWl3dWw4aGo0?=
 =?utf-8?B?TS9XbnRvZWxIZXJoakp5S1VzS3ZBV3RGdmtYdkY5VE9SNUJBSXQzcUVzeWg3?=
 =?utf-8?B?d2l0ejVwN2EweVJzY2QyeHhPZnJ2b1kzVm5Rbng0ODdUamlJcHVaVWlrYkpR?=
 =?utf-8?B?LzRvRWxiYmJYWXAyTkQ5ODZKQ3JpZVp4Z2Z1VTdoZWQvR2RaTDA1K3Y4NEQx?=
 =?utf-8?B?RDZlWXFUWmNsb0JUQUtyOTlBaFROc1VWS1l4V2ROZzVLS2ppQzBGUzBVcG1l?=
 =?utf-8?B?NDVsME9ESlh6bGNxV0RpQkY4WmVSdUZYV2dncUtBS2Exc3NsRk1wSUQ0RTdq?=
 =?utf-8?B?UmhrU01DcFhPMXdRcWlqcVA5cXZLbHZNNHlMTEUzMTAyZXF6d3AxOHg2ZzVO?=
 =?utf-8?B?U3BqWVBnY1FISE9EV0JGRVdybjJEVlNQeXNycE5hQXBQWW45SDNCMzROZWs0?=
 =?utf-8?B?cWVqZHlLUkFlRzd5dGxIYlNlNjBKQkJXRjlLa0xGM0o2bjBXNC9BaGEwMzda?=
 =?utf-8?B?R2JobWRSbi95YXN0TzFRZnVpbTU5UkN0elFSK3dsSE5CaXNDVUJxdWdMMHVm?=
 =?utf-8?B?cmsvSG1XeVdkUDhSTElWMU9yUSthMm90ekpKZDdiNVlSZS8zRm1TNVp0S3p6?=
 =?utf-8?B?eDBJQkRuSXVWcDVYMytFa1JHVUYzU1dCamV5SUR5czdKSXRRSUYyZ21zNDN1?=
 =?utf-8?B?Z0NqdWN4N3lEWThtMm5zdXg5SGp3SDBXMUdPV1RDK2ZGa3NTTU1JNDgxc2ps?=
 =?utf-8?B?Tko3MVFkV1A1WDAvT0xpT0ppaURVeE9VZnAweUlGblF0TGtrejUrTDN0dWgy?=
 =?utf-8?B?cmlCOGpzQ0xXcEI2c2FTNEIzc0pTb3RQcUtOUkZOMGpML0JQSFhzRWlTWTB1?=
 =?utf-8?B?STdJa2FFZnhMSHo3UElyRm1RMTNkUkpHTDVjemJoK0Q4N25hcXFqdjhWRVQz?=
 =?utf-8?B?ODdRaG1yVUxyMEU4UCs1ekN2TFZBcjBCSElXQ1phYmp1WEx5Q3FObklxVTFa?=
 =?utf-8?B?ME5uc1F2azZ0NWJMdVErd1NPR0pjakwvMnFrc3VPVzRVRGxOd2xGL29IMDRr?=
 =?utf-8?B?bWlyZGlHc3lUVTUwa2lrVVhUSGZPcmIrM0RWTWEzSEVyaDdvUXN3ZWxuZXRJ?=
 =?utf-8?B?Y2JwcTY4RWplMXZuSVVtR2taWWVXSEx2emxZQVNUTHVjYmd6WWVMWXprWUVU?=
 =?utf-8?B?WllBT0ZDbWhROXI1UllING9yZnh0b1JuYVhlaUh6ZysxQ3o2WmQ5eFMzdWdw?=
 =?utf-8?B?bXVZWXFzVzdzU1laTXRaUE15MUd6WkNybjEvUXFTYlpZQzVXNzVZVmExUmw0?=
 =?utf-8?B?STdHbG9qKzNCeUpIaEtHOTFEcG5CcHBpZ0JyOGg2T1FhUVR2eGFOd0p3cE55?=
 =?utf-8?B?VnhIQUlnVFNtajBFOXlHR3V3TUlvYlhFZk02NzJQV01sTVlwMVRWeUV4akRq?=
 =?utf-8?Q?ryzVRACx3ZA42IP7Qx389Fc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MDk2cFdtYVEvdC8rZEtGZHRmVVlNSWN1aTE4YTgyTmJUTEVOUWZqbWFOczhq?=
 =?utf-8?B?aENVYTZEazVTUGh2WW5HQUxyL0lSOHJiRlo4bUdRME1TWlpyUEYrRlZvaElr?=
 =?utf-8?B?d21UWGtWTit4U2hsRWhFeWtiYkpXUCs4dG0vSXZza3pYTGQ2YXZpMDllSUJ0?=
 =?utf-8?B?bkZUMWI3aXJwbDdGUkIvZitXTnp0b0xNRjBKR2lEb3RVeHVySVNybDd6QWVW?=
 =?utf-8?B?VzY4aXFFUGEwTE1VUHRPNENNRVY1d1NxT3JFY0YvUFE3bStBSFEva09wbHVS?=
 =?utf-8?B?elNyeHBMdThtdnFSTE5CSzA1ZTB4MVJ1NVRxaVpjNlVvRU1FSDR2eDdiZDUz?=
 =?utf-8?B?Sk1qSmNrZnprNzd3Kzl3RWZyTXpnNXg2RVBTTElmcHdoSDIvYytmMG1IbFAr?=
 =?utf-8?B?b25ISi9VNHFPUEFtUFk2UHROc1k3d3BVcjE1ekk2VVVNaTRyRklycGQ2MHhG?=
 =?utf-8?B?aFR2akd3cmM2dEI0b1k5cTdyNW9DdVNudjMxZXpYWDdDenRxOWdabkVLTTV4?=
 =?utf-8?B?K2I1US9aRkdVNHIvM1JUcXcxSmswbm5KdVl6NkZLcTRTNmpjN3BsZGhmSUJJ?=
 =?utf-8?B?Tm9NOHFOQUFpUGkxR0I0V3c5SDE5aFhWYnBuRW50VS9admx6c2JGanBYUFV1?=
 =?utf-8?B?QTVRL09OTUFpcDJZTVJSa1RKWVBVdVpCZWo5ZlY5OUszS1QyTllmUHlKVm1u?=
 =?utf-8?B?WkRXMzlSTzFnMXdtSzVtbXhFN2VxTWxuTWgzbXZ4M1NHNXRlNGNFSVZyR2tR?=
 =?utf-8?B?VzJlTGwySXI5TUNreENEYS91SHZBQUh0QURteVdteVpoL2R1RUJyVkNxeVlu?=
 =?utf-8?B?d1dVTDdpMm52ckxtZ0hnWGdzV3RodzZxL21nSkFtTjYxSk93UlcydjNLYVd3?=
 =?utf-8?B?SHhIKzdNZUhibXlxdThGd0J3Q25BdHNxNkZkcjlGajBLYjNjTmZvTmNGT3Nu?=
 =?utf-8?B?djFxcmhDcE1QZ1NvT25TcFB3WU1MVFhXVG8yLzFuc0h2ZDloK21VNDd1ZmU0?=
 =?utf-8?B?WnV0bTQ5b3dnUzNudE5zY1pIYmxsUEQrcGVTSW9PZ25aNEZUSjB5VTJFa3hB?=
 =?utf-8?B?Qy9YWTVPNDlMTXJZUFhiUTNkdWRCR0IzSmk4Tmo0UkRYdi9zRXh0SEN4K1N4?=
 =?utf-8?B?NXg4anNyQTUyYjQ3bGtIOEhXeDY4WE5vMHF6SUdtVnpDNU5uelFHSHhYa21t?=
 =?utf-8?B?RnJ2SXpIYW1HcjgycWgwbStCSEhsSEVnaFpHWHNWVE8yanJ0a3BuYWRmNjhx?=
 =?utf-8?B?SmZ3dHVrMVRUY1l0cEkrdzBNYVVNcHV2dE84Y1A0QmJIanArWGJIRkYxak4z?=
 =?utf-8?B?RG9Hb0FRY1Z4WkhBTmhpVWJGcjdyTUJuYUkvOVhnRTRHL2FCSURGeXB4bUFk?=
 =?utf-8?B?UzRzM2xrcVo4bGZ2TklFb0hQbXJBSVMzQVorVzJJeTlwRjFxc0daL05KRlVa?=
 =?utf-8?B?b1p0blA0Z2E3b2hvVjI0cWtpTHkxUGhLVmZHRUZ0WUdweE9obWVzaE9oblYx?=
 =?utf-8?B?b3JlT0kxdFRHY2o4ckQzR2VNUnNsOHdBaEdIY09SckdqLzVBMjJpWTlGZDF3?=
 =?utf-8?B?VGZrdFYraXFZMThEQjhBM0QyN0ZLM3oza016N1Ztd3dxeFo4NFZ3VVJZWUsz?=
 =?utf-8?B?UVFveGhaaU4wSDVWelpKai9FVmJ3d25hdGNxZWxaMGVMRzUzNFluK2dXQ3Yz?=
 =?utf-8?B?WFFaS01wN1JkSjdyTXRnam42aEJtUWZoenlBOWlhTXdHaGxHaFFXME9udzlT?=
 =?utf-8?B?THoxb0k2NzhuTThPNWMwVUR6NUNMdGgxWklkMlJ4TWxJbDlESHlxZW5oNzI2?=
 =?utf-8?B?akEybDFXQnRwcWVjTkNxVHhLZHloSTNpc1NsMXd3ZDE4MHBLSWhKamVKL01H?=
 =?utf-8?B?MnBpODRIandLWlpRWDRIRHZ0SFVaU3BESWkvZko3djZDWk1XUkRVT0lvSVhF?=
 =?utf-8?B?cGNmeTlIejlhWUNneG96V3BIc1Y2QS9ZMXg5SE1YdEF6VHFGZFl6by8vWUlt?=
 =?utf-8?B?akJQN1kwa0x4eHF6aWVLVzBvQk1kV1FVeXNlSWpuSEdFUUZ6YXQ4RkJzSnNh?=
 =?utf-8?B?bVJpYUdGcUNnaDBPREtFbUErWlFZWk9SK011RU5VNXA1a2xKQ0crOW9KMWM0?=
 =?utf-8?B?MUZRUTVCRmlIcFdxK0Z1K2hQWmJBSGpJRzhIbDJVQ3VZS08zMVV0VWVleDRS?=
 =?utf-8?B?bVFnOVpYSGpDcklha3lISGJJZ1NvWDNla050cU9tZ0FEYThxeFMzT1B2c2Rj?=
 =?utf-8?B?aWJ1Sm05NVN6WFBVM1ZjUXArVGlrcVBUc3VVeCtpWVIzTmEyK2Q3ZFJPRFcy?=
 =?utf-8?Q?w2K8cR8Pbhuko2CMwY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f683925c-2bc2-44c3-2173-08de58b9e1c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 06:54:11.2438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oVPoF6+ZFKJ5ye6++DzJFgcZJ2cuLyGpv+E+SAWcViiTEzzQcH4DvV4K8+U7uikVDgkbqhV3ntlTSdvbcGCYKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11286

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiBpbXg5My1ldmsvcXNiOiBhZGQgbTIt
cGNtLWxldmVsLXNoaWZ0ZXItDQo+IGhvZyB0byBlbmFibGUgQlQgSEZQDQo+IA0KPiBPbiBUdWUs
IEphbiAyMCwgMjAyNiBhdCAwNDozMjozM1BNICswODAwLCBTaGVycnkgU3VuIHdyb3RlOg0KPiA+
IEZvciBpLk1YOTMgMTF4MTEgRVZLIGFuZCA5eDkgUVNCIGJvYXJkcywgYWRkIHRoZSBncGlvLWhv
ZyB0byBlbmFibGUNCj4gPiB0aGUNCj4gPiBNLjIgUENNIHBpbnMgbGV2ZWwgc2hpZnRlciBjb25u
ZWN0ZWQgYmV0d2VlbiBzb2Mgc2FpMSBpbnRlcmZhY2UgYW5kDQo+ID4gTS4yIFBDTSBwaW5zIHNv
IHRoYXQgSEZQIGZlYXR1cmUgY2FuIGJlIHN1cHBvcnRlZC4NCj4gDQo+IERvZXMgc2FpMSBoYXZl
IGFueSByZWZlciB0byBwY2FsNjUyND8gc2FpIG1heSBwcm9iZSBiZWZvcmUgcGNhbDY1MjQsIHNv
IG0yLQ0KPiBwY20tbGV2ZWwtc2hpZnRlci1ob2cgbWF5IG5vdCBzZXQgd2hlbiBzYWkgcHJvYmUu
DQoNCkhpIEZyYW5rLA0KDQpTaW5jZSB0aGUgSEZQIGZ1bmN0aW9uYWxpdHkgaXMgb25seSB1c2Vk
IGF0IGEgbGF0ZXIgc3RhZ2Ug4oCUIGFmdGVyIHRoZSBCVCBmaXJtd2FyZSBoYXMgYmVlbg0KZG93
bmxvYWRlZCBhbmQgdGhlIEJsdWV0b290aCBjb25uZWN0aW9uIHdpdGggdGhlIHJlbW90ZSBkZXZp
Y2UgaGFzIGJlZW4gZXN0YWJsaXNoZWQNCuKAlCBib3RoIHRoZSBwY2FsNjUyNCBleHBhbmRlciBh
bmQgc2FpMSBpbnRlcmZhY2UgYXJlIGFscmVhZHkgZnVsbHkgaW5pdGlhbGl6ZWQgYW5kIGF2YWls
YWJsZQ0KYnkgdGhhdCB0aW1lLiBUaGVyZWZvcmUsIHVzaW5nIGEgZ3Bpby1ob2cgaGVyZSB3aWxs
IG5vdCBpbnRyb2R1Y2UgYW55IHByb2Jl4oCRb3JkZXJpbmcgb3INCmRlcGVuZGVuY3kgaXNzdWVz
IGZvciB0aGUgSEZQIHVzZSBjYXNlLg0KDQpCZXN0IFJlZ2FyZHMNClNoZXJyeQ0KPiANCj4gRnJh
bmsNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNoZXJyeSBTdW4gPHNoZXJyeS5zdW5AbnhwLmNv
bT4NCj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMtMTF4
MTEtZXZrLmR0cyB8IDYgKysrKysrDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2lteDkzLTl4OS1xc2IuZHRzICAgfCA2ICsrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9pbXg5My0xMXgxMS1ldmsuZHRzDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9pbXg5My0xMXgxMS1ldmsuZHRzDQo+ID4gaW5kZXggOGRkNTM0MGU4MTQxLi5h
Y2IxNjBkMzE4NmMgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OTMtMTF4MTEtZXZrLmR0cw0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDkzLTExeDExLWV2ay5kdHMNCj4gPiBAQCAtMzU2LDYgKzM1NiwxMiBAQCBwY2Fs
NjUyNDogZ3Bpb0AyMiB7DQo+ID4gIAkJI2ludGVycnVwdC1jZWxscyA9IDwyPjsNCj4gPiAgCQlp
bnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvMz47DQo+ID4gIAkJaW50ZXJydXB0cyA9IDwyNyBJUlFf
VFlQRV9MRVZFTF9MT1c+Ow0KPiA+ICsNCj4gPiArCQltMi1wY20tbGV2ZWwtc2hpZnRlci1ob2cg
ew0KPiA+ICsJCQlncGlvLWhvZzsNCj4gPiArCQkJZ3Bpb3MgPSA8MTkgR1BJT19BQ1RJVkVfSElH
SD47DQo+ID4gKwkJCW91dHB1dC1oaWdoOw0KPiA+ICsJCX07DQo+ID4gIAl9Ow0KPiA+DQo+ID4g
IAlwbWljQDI1IHsNCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OTMtOXg5LXFzYi5kdHMNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2lteDkzLTl4OS1xc2IuZHRzDQo+ID4gaW5kZXggMDg1MjA2N2VhYjJjLi4xMWUwODY3MzA4M2Ig
MTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMtOXg5
LXFzYi5kdHMNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My05
eDktcXNiLmR0cw0KPiA+IEBAIC0zNDksNiArMzQ5LDEyIEBAIG1pYy1jYW4tc2VsLWhvZyB7DQo+
ID4gIAkJCWdwaW9zID0gPDE3IEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiA+ICAJCQlvdXRwdXQtbG93
Ow0KPiA+ICAJCX07DQo+ID4gKw0KPiA+ICsJCW0yLXBjbS1sZXZlbC1zaGlmdGVyLWhvZyB7DQo+
ID4gKwkJCWdwaW8taG9nOw0KPiA+ICsJCQlncGlvcyA9IDwxOSBHUElPX0FDVElWRV9ISUdIPjsN
Cj4gPiArCQkJb3V0cHV0LWhpZ2g7DQo+ID4gKwkJfTsNCj4gPiAgCX07DQo+ID4NCj4gPiAgCXBt
aWNAMjUgew0KPiA+IC0tDQo+ID4gMi4zNy4xDQo+ID4NCg==
