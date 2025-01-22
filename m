Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011017.outbound.protection.outlook.com [52.101.70.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C8F10E0
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 05:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737523555; cv=fail; b=UdKkrNaLBcGtUuSXbpiXMqxVpe3p+2X4vZh9krZPWWnnNfzosVQfBfbbu545wnZX1+ZeHor+j134QNuGgef0Cwck8tRS0gZoc6kQumo3vD2AtemmzLxEBci+eeyYovb3OeI7uPmirrtqjA4AYuXTobt+z93cWN8mXXPhYShqRwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737523555; c=relaxed/simple;
	bh=C3/7qVZsbj5p0egSKLXId4lN0NlvFnXzCThI3JOS+4w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h1J8D70HiHVL8yPnO24U1UADcIC40ZYAvkpA4dVz4io4qOL0zNbiGCEnVhG9Zop/w09YnHHH/Aras8qHzmnv8dklEBFwa+mPu/0ML5HMFHsj3c6siG+f/0/GzpXDbtHOWHG2rO62Euke9Abzj4ltNVTr4i5266HxBKfLEaChul8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YciuCWcs; arc=fail smtp.client-ip=52.101.70.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YciuCWcs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkScUS5OUz90oA7jWVJo8tqQlJee339vbapRTMLxkhe9APNDxip+Y/Se7M2c89LRhL3uh/goAEMcQCRWmwnisliY5QnKCU8y8ThNt9VB8UdFKgJWYAxtSfc4uxnmG2WoKm9OOOpW4YWeNXBu8AK4foFNMRcuUVjTrGXqHPUPeD4c2TyPzXROOE66z3GG28eH+EwWluOCXjhQA4ZJRG+U/d9ByMfva2HdrsTnbScexYnMGwAom3vxBN5bnXCIiGw7OuUtqnx1VkJHLEGSukPdrO3DEM12WzbiHAhBvW92OfzP/ARXCMN2BcGfvwN3CHT8a2mqWry50QyegeyfxgbF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3/7qVZsbj5p0egSKLXId4lN0NlvFnXzCThI3JOS+4w=;
 b=oAfjk9UOhbM3MpKb/+l4Dfig9fm+LBnmHGMlKODyXp1s26yBByGB2cknNHcPc7E1vIixB/7Eo6d90ZMnFbeocTGAMRzCvyRQ+uffO3SAUJnAxSmuCL8NtGr7AYbNEdxzf40Efi2dymonY6461g33DcTo67+WqjZD2skqSPG2BF1IhrIP17HL9q+gt89Y0tUIvrgcabpCEDcr7ddR1LE9E5gJNCAjB4UV+fC29I49uuFOCLAQJeEtWCEGhpdpsGm0MhdqKlGBbZ6pZtUIHZMiw6jtXY9vxBSrtKPZRD/iWdcl24tCQHR1bniXBjWR4U4K4UcIX5F8nHLuO1gXpWFLJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3/7qVZsbj5p0egSKLXId4lN0NlvFnXzCThI3JOS+4w=;
 b=YciuCWcsfGMC9N7ygcTs6ylw1pSCb25lMRwetbQFWe0AiwggOGDYbeBgO/AKKyQGSdneETFN3ULlZZGFA9PkmrscyCAip4AHiIiwpTlGBSExPIu6eIyQKmoT30rkc06B1TLFWUVTgAys5UnQmQqOuPgwObcp+N7gFtRZUynYV+fB4rmsf1FKve6P6ig2NSoB0l5w4qdRVZ7vNZd46G9oo6tB5hp9WNx+aDhl+Pac8r39vWrEVOe2R+2C5VG/q0BWwsb2+t6DSp1YuO+r3OOltT8tbYP5OsRZiLWXQijSqmbk2HEcYvq2g8/jY3lCSS3W1ecswqvuAGG3f9H8VlbLrQ==
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by VI0PR04MB10805.eurprd04.prod.outlook.com (2603:10a6:800:25f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 05:25:50 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%6]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 05:25:50 +0000
From: Joy Zou <joy.zou@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>
CC: "joao.goncalves@toradex.com" <joao.goncalves@toradex.com>, "marex@denx.de"
	<marex@denx.de>, "hvilleneuve@dimonoff.com" <hvilleneuve@dimonoff.com>,
	"hiago.franco@toradex.com" <hiago.franco@toradex.com>, Peng Fan
	<peng.fan@nxp.com>, "frieder.schrempf@kontron.de"
	<frieder.schrempf@kontron.de>, "m.othacehe@gmail.com" <m.othacehe@gmail.com>,
	"mwalle@kernel.org" <mwalle@kernel.org>, "Max.Merchel@ew.tq-group.com"
	<Max.Merchel@ew.tq-group.com>, "quic_bjorande@quicinc.com"
	<quic_bjorande@quicinc.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "dmitry.baryshkov@linaro.org"
	<dmitry.baryshkov@linaro.org>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"nfraprado@collabora.com" <nfraprado@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Jacky Bai <ping.bai@nxp.com>, Ye Li
	<ye.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Frank Li
	<frank.li@nxp.com>, Carlos Song <carlos.song@nxp.com>
Subject: RE: [EXT] Re: [PATCH v4 2/5] arm64: dts: freescale: Add i.MX91 dtsi
 support
Thread-Topic: [EXT] Re: [PATCH v4 2/5] arm64: dts: freescale: Add i.MX91 dtsi
 support
Thread-Index: AQHba9foW9PI96qevEylkpuKFJMp2bMg5q0AgAFEwSA=
Date: Wed, 22 Jan 2025 05:25:50 +0000
Message-ID:
 <AS4PR04MB9386E5D011F3559A19E05941E1E12@AS4PR04MB9386.eurprd04.prod.outlook.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
 <20250121074017.2819285-3-joy.zou@nxp.com> <1945264.tdWV9SEqCh@steina-w>
In-Reply-To: <1945264.tdWV9SEqCh@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9386:EE_|VI0PR04MB10805:EE_
x-ms-office365-filtering-correlation-id: fde6cb3d-2a9e-474c-191c-08dd3aa53bb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?gb2312?B?RjEyNjJHc1BFb3JaUVhHYlNpcmlGT0xoL1A5TmhOQ0I2amJSeUdCWEFTZlRm?=
 =?gb2312?B?NGdFWmFtdDlWeXF3NmcxSE5TY0k0RE1MdUhMamJYTUZjU0w4L1hYeVg0eXNO?=
 =?gb2312?B?TGtuYkFjZ0t1Z0MrU3YwOUNYOFVHWkYyeTB6K25zendPajZpVWZGaGFKNlNL?=
 =?gb2312?B?T3RtZDE0UEUyUFZrV2dGU3QxOVVKaDFoZzk0SHJnWEllUzlQc2Vta3RZaEln?=
 =?gb2312?B?NDFRUW9Ob1NpSmpjZ3lBZEpVZFRweHpabjVCcnhMYzViQ2YzUGNQREhkSE9N?=
 =?gb2312?B?NEp3S3RJdXFCVGI4dDlRSGV6cUFXMk1zQm1melRFRnpVMVY2Zlp1SjBMRDcz?=
 =?gb2312?B?UGhwNG8wWWFGL2p5ZzR0UU9USzJXM3NreGpMWWppSXRCcllrKzFuOTlPZ0lT?=
 =?gb2312?B?WWxWNVdEcjd2RStOVFZKaFZqeS9TQm95aVBVOGUwT0tLSW5jRERvSU1MWTF5?=
 =?gb2312?B?OHMzZ0U4TkU1UzBPaDBZWW9sY2VvTmlzYmFncXVLZ0l1WGNPd0ZyOS9IdStL?=
 =?gb2312?B?U29XNjMvUTEyWkd0R1V1RksyRHg0b01WOUFqUmRIUHNVSGZGNjF3UVI3WTVq?=
 =?gb2312?B?aFhQbHFZN3dMK09mZndrczJ0Y1BoV1VmaVYrbWpqakJORlNpWE0zcXBWQzhy?=
 =?gb2312?B?MWp5SWMrWXR6enkvTW1FaHpvclRvdTgyNjVDOUxYekF6U21oU1FvOWJCcUp2?=
 =?gb2312?B?aEN0TjJ4TThGQzZ0UzYvN1dQMHFTeUpMQ2pJbmZaWFdKcW91ak9YUDJHSm16?=
 =?gb2312?B?WXZIY1VTcWhscFJKYVFvUWU3MVFvYTA2V2w3RTk1ZWlhT0ZrOXh1ci93QmxF?=
 =?gb2312?B?MXhtQjdKc0RMVlhqb2pxZGpsNzBwc2lyZjZvWEsrWEMwTXJ4UXh0NG1tVzBR?=
 =?gb2312?B?SnBYNk96ckU5MkZsVit0VzQzbnd3YjJHVjZLcjd4N3hVY0RTMGJtd3VXV0t1?=
 =?gb2312?B?Z1RSODd1cS9iMXBZNVBpZVo3RlF4UVhPRitpKzhVNzNkQW9zNEFweWFIMnVm?=
 =?gb2312?B?aWswQ1l6UWZDekkzV0lxSlQ0em8xWG1QMEZVN1l3TjlzcW1oQU83Q1dzZ0xV?=
 =?gb2312?B?clY4b0xBdTFYUXZKUjVoMTBQOWYzVzUzUmIvUEtuSkxSaHlIU0pHZ29CZlgw?=
 =?gb2312?B?U0R2eHBDb1ZTMUhFNHBYSU1SMTdpWXZkcG1yalJZd2dGUkFVY0x5Ly9PK2tN?=
 =?gb2312?B?MTFJblYwUFpFNkNZNDlmVkpxTzQyWG1QQXJnaFNyeEZhanUyZG10byt5aW93?=
 =?gb2312?B?aHpUQlhzQnpNZkx0d1l3QXJQYktVODBDVWRnd3BwQUZVQWdqWjM5YUsrQlJX?=
 =?gb2312?B?NXZLcERSSEpmbEdyb2V4Ykd6bWg1WUNxRTA2MnlZK3VUcFhOdXVpc0thUHhP?=
 =?gb2312?B?NVVwSURXR3p1MWNORW16NnBnN243MGJkbHJ2SmJPTHhmTkVyYVNmTDZzU3hT?=
 =?gb2312?B?emtqRmNlU3NWY0JDNVQvaHFRTTRlWDF3cGFTRXpxbUd4VlA3YTNjdXdJTTJW?=
 =?gb2312?B?NUZSZVNDbFBUREk2NUhGQkJBczd1S2FhMU9KcEQ3VGpZMHZlbGZoSFNEekdx?=
 =?gb2312?B?ZHpUdWZlTlR6N3NHckJ6MzBRT0RyQ3F0bnFxYkZOWEdZTXNENDk3b2Y0Tk83?=
 =?gb2312?B?T2dnalJSNHZGYlI1MjIyanFqUnMrTVJQSk55aHVkQUo2VmpVaitjNHZtdHgz?=
 =?gb2312?B?dnIreERhV00wWFdJZVVOeHRRVFBWZjVNNkxDdGZScTVWSVNEQWlselp2VFBi?=
 =?gb2312?B?YStZQ240YjI5T1A3R2FubStkcC8rKy9oWW92eDFBbzlaZFZpTGZQV1BkOTFv?=
 =?gb2312?B?eDJ3ZmVSWDFCQk9GekVRY1BUdVUwN0N3OFBCTDNqcmtpb3NRTjNTSGFRcFJS?=
 =?gb2312?B?T0RLMy96aTdXUDJJUzM1SkRhdVdtOVp0SEo5STMyN3FXK0kycS9oTVpQR0Iv?=
 =?gb2312?B?NlZXejRySy9UcmoyelFrNGtORHVVZ1RaeU9MQlVUM0k0Q1ZSY1JUOUE0Mm1u?=
 =?gb2312?B?ZmlVYXY2ay9RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?UHVPUUV5M2twbHhvZE1UcnZsVXNUaUdOb3JrQ3A5OUsyMm9lQ0RDb0k0SS92?=
 =?gb2312?B?OUdJTWxmTmhRYStWQnhkaUVhd09pa2NTMW5YZTgwU1YvQXZ4d3FtSFdINzlt?=
 =?gb2312?B?RzJzREM1eEFaWHNuM3VHSnR3RTVNazlKeDhYM3c1Rm40bGdIekZGTnZhM3Jl?=
 =?gb2312?B?UWVnUFhSOUNmQnVFdGhEMnBvdmhKUzZCc3RWYkIvSUxreTN0MFJ0UE9yRHNX?=
 =?gb2312?B?dGpsYnZpcVliTEVZSnpoQTNWNzJSWm5BZUIvMVR3LzVJOUFDOEx0TWlVeXRu?=
 =?gb2312?B?c0Z4K1lrS1NkRzhGUlRHWUUySVZKWVFvbzU1KzMyVVpPZncrMXFyTlJYQ0Zh?=
 =?gb2312?B?SStVeUFZNkVEWUZnTEFTTVNpL0E0RlZlayt3MjRwQUl6SUIzcFkrbHpmckZR?=
 =?gb2312?B?RjVOcWVvTmtud21tWjE2QmJyYjQrOUhDcVJueXl1QkFJakF4NzI2REFjUDBv?=
 =?gb2312?B?UmNsdHpZdzV2dWFkcVZ2dTdHZjk3UnVvWVFDSnpxR2pMN2wxa3NKTG1QK3hZ?=
 =?gb2312?B?dk5nQkxMa1lCbjJzQnhOWmRibTZhZ3BBcHBDSm13SG1KeHJtbFlMMHJpYXF0?=
 =?gb2312?B?dnNHc2NNb2UySDlTQ2loN2RtZ0c5MksyRVE3VGpnYXhPc0NJeVFyZk94dW43?=
 =?gb2312?B?QjlxeTRDbXluRCtwd2grUDV3NHp0OFNtTjNtS0dyNlZ6REtWbUowZEcyYmtL?=
 =?gb2312?B?T2IxQ3Q3aUMyWVhFbmgxQW90RmVzWXBGMkwvTWJtN0VwRVZOdmtxc2Y4dVlE?=
 =?gb2312?B?azk1WEZWK0F4eXVaWGpkeVgweGdVK240dklwQ1l5N1U0cXBvWVVqSTdiU3lH?=
 =?gb2312?B?dDBqRmdWTVJSOFM3SnNuc2VQNFZ2T1dxQUZBNmh0SnJzdG1iREpGZzdrbjRG?=
 =?gb2312?B?dHdOMHlTMDlUQWgxbHUwQkVKeXZmcXlVUXhpbk15WmdnQ205bkhIQ0dvbVZZ?=
 =?gb2312?B?S2k2eEphZ3ZYTHU4YitlcFZWajRQdmRMdnpFckZURk9lQjFYR0FRSi8ya3pl?=
 =?gb2312?B?bVRZMXMyd2xHbzIrZDZHWVBmVjVNMWY3MGpCekMvMkw5b0NYb2M1VmJBOUF0?=
 =?gb2312?B?MU5VWmJ1MVVuZm9FcTZ4S2phRjBRZk1kSmFFN0FDT04zMjJTNWk4Y0g5TDRN?=
 =?gb2312?B?UVVGeE91VFZzTGJqRGhVZkl4K09TTk9MMzd5ejVHeTZjL3V4VS9CUHJxaWxY?=
 =?gb2312?B?eDZ3NVo4eUx5S1hNTjdrUFJWK0pvOGRpZUZBN25oaEhMUzAzd25FZzRoUVVH?=
 =?gb2312?B?NEoxWkJ1NFZrNElsMDRSU3FvMG94NnZzbjA2c0tiU24yd0xpNHBnNE5icTRQ?=
 =?gb2312?B?c1FnUllOZnFQYjFqbGpqOURDTnlJT0Nmdm1rai9tL0Z3ZWpQWDJjQ0FEZVA4?=
 =?gb2312?B?emJuU0ZPWkFBNExnZTBURVJneTZnNGtOQXZJYmxBbkIya0JRaTl6VFJxdkU0?=
 =?gb2312?B?Q3d2amJNQk9lNnlJNlJtcjBYeFdFaUtnUW9ySk91VkFvMk5Lazh3OUJHOXFD?=
 =?gb2312?B?YlFoL2R2bHNjRktZb1h3V2dLK1ZRWk9SWXZiZ21pU05Ycld4SmRWdU5sdEtO?=
 =?gb2312?B?MEcwLytQS2FrK3FsZW1tbGFwTkxMUW1NdkxNdWJSSTFtR3Z6S1JvNGNZTlFi?=
 =?gb2312?B?SW40K2YrUTZnVnBaeGMrK2FJMDZsbm5kNnRMeVZGZTErSmdIcVp2em0wQ0h4?=
 =?gb2312?B?NEdaSUNsdlJvb1lpejhMdUJpQ0VsY1QzU3cxRmYydW5JRDd0QTdiREpCWXRT?=
 =?gb2312?B?bzdTQ3FkeUZLc1dpS09kNE9ST0gxUXg0dDNKZTVKbHo3eU5ncjkvYUg4NVZ3?=
 =?gb2312?B?Slk5UHVKOWt3STBzcUhIZi9ZUndFS1NzNlBGeTJNZElvNW5nR2pXdzBTaUJX?=
 =?gb2312?B?Ynh1NVhodUlJbUVlaHhFZ1FGLyt5VHJzWEtJbHdyUGtNQ1BNb2xZMUxPTndZ?=
 =?gb2312?B?REpiTlVzTEpsNGxtdzg1MmVFSjFEZUw5RmZUeTcwQTBkdDBlZ3NaYjhRQmpQ?=
 =?gb2312?B?ZDZ5eHVEektSaE1KQ0ZHNzU1Ry8zK3dhRUxZTVRrMlFjZXhKK2hRVUJ4L2Jt?=
 =?gb2312?B?SktUaDlLRUtLejB1K0VpVjRoaVVURU1BTjdSdSt0b1VtWVh2b0hxRVZ1S0tO?=
 =?gb2312?Q?YoC0=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde6cb3d-2a9e-474c-191c-08dd3aa53bb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 05:25:50.2101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zoh7uXucnKaGIE0uyb8I0aHl20GG0Md98449a488WrXas8Ciuk62CODQUbJG3nMD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10805

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRlciBTdGVpbiA8
YWxleGFuZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4NCj4gU2VudDogMjAyNcTqMdTCMjHI1SAx
NjozNA0KPiBUbzogcm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0
QGtlcm5lbC5vcmc7DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXgu
ZGU7IGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tOw0KPiB3aWxsQGtlcm5lbC5vcmc7IGtlcm5lbEBw
ZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOyBKb3kgWm91DQo+IDxqb3kuem91QG54
cC5jb20+DQo+IENjOiBqb2FvLmdvbmNhbHZlc0B0b3JhZGV4LmNvbTsgbWFyZXhAZGVueC5kZTsN
Cj4gaHZpbGxlbmV1dmVAZGltb25vZmYuY29tOyBoaWFnby5mcmFuY29AdG9yYWRleC5jb207IFBl
bmcgRmFuDQo+IDxwZW5nLmZhbkBueHAuY29tPjsgZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRl
OyBtLm90aGFjZWhlQGdtYWlsLmNvbTsNCj4gbXdhbGxlQGtlcm5lbC5vcmc7IE1heC5NZXJjaGVs
QGV3LnRxLWdyb3VwLmNvbTsNCj4gcXVpY19iam9yYW5kZUBxdWljaW5jLmNvbTsgZ2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU7DQo+IGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZzsgbmVpbC5hcm1z
dHJvbmdAbGluYXJvLm9yZzsgYXJuZEBhcm5kYi5kZTsNCj4gbmZyYXByYWRvQGNvbGxhYm9yYS5j
b207IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IEphY2t5IEJhaSA8cGluZy5iYWlAbnhwLmNvbT47IFllIExpDQo+IDx5ZS5s
aUBueHAuY29tPjsgQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT47IEZyYW5rIExp
DQo+IDxmcmFuay5saUBueHAuY29tPjsgQ2FybG9zIFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+
DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjQgMi81XSBhcm02NDogZHRzOiBmcmVlc2Nh
bGU6IEFkZCBpLk1YOTEgZHRzaQ0KPiBzdXBwb3J0DQo+IA0KPiBBbSBEaWVuc3RhZywgMjEuIEph
bnVhciAyMDI1LCAwODo0MDoxNCBDRVQgc2NocmllYiBKb3kgWm91Og0KPiA+IEZyb206IFBlbmdm
ZWkgTGkgPHBlbmdmZWkubGlfMUBueHAuY29tPg0KPiA+DQo+ID4gVGhlIGkuTVggOTEgZmFtaWx5
IGZlYXR1cmVzIGFuIEFybSBDb3J0ZXgtQTU1IHJ1bm5pbmcgYXQgdXAgdG8gMS40R0h6LA0KPiA+
IHN1cHBvcnQgZm9yIG1vZGVybiBMUEREUjQgbWVtb3J5IHRvIGVuYWJsZSBwbGF0Zm9ybSBsb25n
ZXZpdHksIGFsb25nDQo+ID4gd2l0aCBhIHJpY2ggc2V0IG9mIHBlcmlwaGVyYWxzIHRhcmdldGlu
ZyBtZWRpY2FsLCBpbmR1c3RyaWFsIGFuZA0KPiA+IGNvbnN1bWVyIElvVCBtYXJrZXQgc2VnbWVu
dHMuDQo+ID4NCj4gPiBUaGUgZGVzaWduIG9mIHRoZSBpLk1YOTEgcGxhdGZvcm0gaXMgdmVyeSBz
aW1pbGFyIHRvIGkuTVg5My4NCj4gPiBUaGUgbWFpbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiBpLk1Y
OTEgYW5kIGkuTVg5MyBpcyBhcyBmb2xsb3dzOg0KPiA+IC0gaS5NWDkxIHJlbW92ZWQgc29tZSBj
bG9ja3MgYW5kIG1vZGlmaWVkIHRoZSBuYW1lcyBvZiBzb21lIGNsb2Nrcy4NCj4gPiAtIGkuTVg5
MSBvbmx5IGhhcyBvbmUgQSBjb3JlDQo+ID4gLSBpLk1YOTEgaGFzIGRpZmZlcmVudCBwaW5tdXgN
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbmdmZWkgTGkgPHBlbmdmZWkubGlfMUBueHAuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpveSBab3UgPGpveS56b3VAbnhwLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTEtcGluZnVuYy5oIHwgNzcw
DQo+ICsrKysrKysrKysrKysrKysrKw0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg5MS5kdHNpICAgICAgfCAgNzAgKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4NDAgaW5z
ZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvaW14OTEtcGluZnVuYy5oDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5MS5kdHNpDQo+ID4NCj4gPiBbc25pcF0NCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTEuZHRzaQ0KPiA+
IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTEuZHRzaQ0KPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi42N2E1YTQ4N2FiNTcNCj4gPiAt
LS0gL2Rldi9udWxsDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OTEuZHRzaQ0KPiA+IEBAIC0wLDAgKzEsNzAgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQpDQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCAyMDI0
IE5YUA0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJpbXg5MS1waW5mdW5jLmgiDQo+
ID4gKyNpbmNsdWRlICJpbXg5My5kdHNpIg0KPiA+ICsNCj4gPiArL2RlbGV0ZS1ub2RlLyAmQTU1
XzE7DQo+ID4gKy9kZWxldGUtbm9kZS8gJmNtMzM7DQo+ID4gKy9kZWxldGUtbm9kZS8gJm1sbWl4
Ow0KPiA+ICsvZGVsZXRlLW5vZGUvICZtdTE7DQo+ID4gKy9kZWxldGUtbm9kZS8gJm11MjsNCj4g
PiArDQo+ID4gKyZjbGsgew0KPiA+ICsgICAgIGNvbXBhdGlibGUgPSAiZnNsLGlteDkxLWNjbSI7
DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmZXFvcyB7DQo+ID4gKyAgICAgY2xvY2tzID0gPCZjbGsg
SU1YOTFfQ0xLX0VORVQxX1FPU19UU05fR0FURT4sDQo+ID4gKyAgICAgICAgICAgICAgPCZjbGsg
SU1YOTFfQ0xLX0VORVQxX1FPU19UU05fR0FURT4sDQo+ID4gKyAgICAgICAgICAgICAgPCZjbGsg
SU1YOTFfQ0xLX0VORVRfVElNRVI+LA0KPiA+ICsgICAgICAgICAgICAgIDwmY2xrIElNWDkxX0NM
S19FTkVUMV9RT1NfVFNOPiwNCj4gPiArICAgICAgICAgICAgICA8JmNsayBJTVg5MV9DTEtfRU5F
VDFfUU9TX1RTTl9HQVRFPjsNCj4gPiArICAgICBhc3NpZ25lZC1jbG9ja3MgPSA8JmNsayBJTVg5
MV9DTEtfRU5FVF9USU1FUj4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgPCZjbGsgSU1Y
OTFfQ0xLX0VORVQxX1FPU19UU04+Ow0KPiA+ICsgICAgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMg
PSA8JmNsayBJTVg5M19DTEtfU1lTX1BMTF9QRkQxX0RJVjI+LA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8JmNsaw0KPiBJTVg5M19DTEtfU1lTX1BMTF9QRkQwX0RJVjI+OyB9
Ow0KPiA+ICsNCj4gPiArJmZlYyB7DQo+ID4gKyAgICAgY2xvY2tzID0gPCZjbGsgSU1YOTFfQ0xL
X0VORVQyX1JFR1VMQVJfR0FURT4sDQo+ID4gKyAgICAgICAgICAgICAgPCZjbGsgSU1YOTFfQ0xL
X0VORVQyX1JFR1VMQVJfR0FURT4sDQo+ID4gKyAgICAgICAgICAgICAgPCZjbGsgSU1YOTFfQ0xL
X0VORVRfVElNRVI+LA0KPiA+ICsgICAgICAgICAgICAgIDwmY2xrIElNWDkxX0NMS19FTkVUMl9S
RUdVTEFSPiwNCj4gPiArICAgICAgICAgICAgICA8JmNsayBJTVg5M19DTEtfRFVNTVk+Ow0KPiA+
ICsgICAgIGFzc2lnbmVkLWNsb2NrcyA9IDwmY2xrIElNWDkxX0NMS19FTkVUX1RJTUVSPiwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICA8JmNsayBJTVg5MV9DTEtfRU5FVDJfUkVHVUxBUj47
DQo+ID4gKyAgICAgYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmY2xrIElNWDkzX0NMS19TWVNf
UExMX1BGRDFfRElWMj4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY2xr
DQo+IElNWDkzX0NMS19TWVNfUExMX1BGRDBfRElWMj47DQo+ID4gKyAgICAgYXNzaWduZWQtY2xv
Y2stcmF0ZXMgPSA8MTAwMDAwMDAwPiwgPDI1MDAwMDAwMD47IH07DQo+ID4gKw0KPiA+ICsmaTNj
MSB7DQo+ID4gKyAgICAgY2xvY2tzID0gPCZjbGsgSU1YOTNfQ0xLX0JVU19BT04+LA0KPiA+ICsg
ICAgICAgICAgICAgIDwmY2xrIElNWDkzX0NMS19JM0MxX0dBVEU+LA0KPiA+ICsgICAgICAgICAg
ICAgIDwmY2xrIElNWDkzX0NMS19EVU1NWT47IH07DQo+ID4gKw0KPiA+ICsmaTNjMiB7DQo+ID4g
KyAgICAgY2xvY2tzID0gPCZjbGsgSU1YOTNfQ0xLX0JVU19XQUtFVVA+LA0KPiA+ICsgICAgICAg
ICAgICAgIDwmY2xrIElNWDkzX0NMS19JM0MyX0dBVEU+LA0KPiA+ICsgICAgICAgICAgICAgIDwm
Y2xrIElNWDkzX0NMS19EVU1NWT47IH07DQo+ID4gKw0KPiA+ICsmaW9tdXhjIHsNCj4gPiArICAg
ICBjb21wYXRpYmxlID0gImZzbCxpbXg5MS1pb211eGMiOyB9Ow0KPiA+ICsNCj4gPiArJnRtdSB7
DQo+ID4gKyAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZk
ZHJfcG11IHsNCj4gPiArICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg5MS1kZHItcG11IiwgImZz
bCxpbXg5My1kZHItcG11IjsgfTsNCj4gPiArDQo+ID4gKyZtYXAwIHsNCj4gPiArICAgICBjb29s
aW5nLWRldmljZSA9IDwmQTU1XzAgVEhFUk1BTF9OT19MSU1JVA0KPiBUSEVSTUFMX05PX0xJTUlU
PjsgfTsNCj4gPg0KPiANCj4gU29tZWhvdyBJIGRvbid0IGxpa2UgaXQgdGhhdCBtdWNoLiBJbnN0
ZWFkIG9mIHJlbW92aW5nIG5vZGVzIGZyb20gaW14OTMuZHRzaQ0KPiB3b3VsZG4ndCBpdCBtYWtl
IG1vcmUgc2Vuc2UgdG8gaW5jbHVkZSBmcm9tIGlteDkxLmR0c2kgaW50byBpbXg5My5kdHNpIGFu
ZA0KPiBfYWRkXyBub2RlcyB3aXRoIGFyZSB1bmlxdWUgdG8gaS5NWDkzPyBPdGhlcndpc2UgZWFj
aCBhZGQgdG8gaW14OTMuZHRzaQ0KPiByZXF1aXJlcyBhbiByZW1vdmUgaW4gaW14OTEuZHRzaSBm
b3IgdGhpcyB1bmlxdWUgdG8gaS5NWDkzLCBlLmcuIE5QVS4NCj4gDQpUaGFua3MgZm9yIHlvdXIg
Y29tbWVudHMhDQpUaGUgaW14OTEgaXNuJ3QgdGhlIGlteDkzIHN1YnNldCwgc28gaWYgdGhlIGlt
eDkzLmR0c2kgaW5jbHVkZSB0aGUgaW14OTEuZHRzaSwNCnRoZSBzYW1lIHByb2JsZW0gd2lsbCBv
Y2N1ci4gDQpJZiBhZGQgY29tbW9uLmR0c2kgZm9yIGlteDkxIGFuZCBpbXg5MywgdGhlbiB0aGUg
aW14OTMgYW5kIGlteDkxIHdpbGwgaW5jbHVkZSANCnRoZSBjb21tb24uZHRzaS4gV2hhdCBkbyB5
b3UgdGhpbmsgb2YgdGhpcyBhcHByb2FjaD8gDQoNCkJSDQpKb3kgWm91DQo+IEJlc3QgcmVnYXJk
cywNCj4gQWxleGFuZGVyDQo+IC0tDQoNCg==
