Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2056.outbound.protection.outlook.com [40.107.104.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CDF1B2191
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737447189; cv=fail; b=YsCFDmWBZxDN8LO0gHiRYhRkdsjSPito9ZVhuBgMpPTgQTj/Y1JvGVAA0mqJ9hLlZYmT4DUP6WmEvr6ku7Vw9M2C8jmGJdZluRJj/+jyvPjdQVF5q53HquIfgyJWWNwG5admxah+X8vMl+SQXGcouAOU2NimaI+lgwsH4ZQVwJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737447189; c=relaxed/simple;
	bh=s/AN2Y/5jbM7f96BUiQqMMf0UXofAp9UdjbAX1E2XN4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UNBfuB1rdyxdQSgMUKpvD6+35MjQpf5pV+u6IRVk1RoURQesQk9vurL173rvLi/u52fIdQmxpa9oE0FkmFMpVRYsZDebSkKGIPeINmGNQH0Vb2Or2JtkcbWVvQf4VA9amjHMAz+jo7xoNF8ApjBakIV9BBRPcAhxcdW7dArGY4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KdFtj9m1; arc=fail smtp.client-ip=40.107.104.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KdFtj9m1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tw4DrAEaVRLQOnP7lYwv+J7JO0kuDcDnZnJxjkusYo/4AW+suL6YOAW2hd/fCKZMYXTGLDU7wo8SQgiUDEu7EUydBjHpE+Fsdy8xvdIN6tp75ioW/UEcRArPGBXwlQ4vt7IozvqnFfdnjkxD3P4t5fx0/ebrRlcTihEI41BBBvX6jNbuImyLzgdmAkbOM/JAxzNqylINHeXw1e4nxYmMY6BG7OfnNqgOiTx4fuz1NMBsKCIWZCIkXTnvjTQo1+mvEOEXA96d2uWUOBV12sexCTQseIXQcZ7thHaIwwM6Wz1v/T9HRgeJPPUG0LlJk8b+onGvZ6F0NLfPHTHS1Nhg3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/AN2Y/5jbM7f96BUiQqMMf0UXofAp9UdjbAX1E2XN4=;
 b=GOHg3UynOxv0gDQcbChYc4fXugC+VVqoS3yx0vHn3L71lsGfTmxyBU0x1iTV9Kr0fJXTlH21U9Vp645Xt4L4lfBrkO8nVPLiltaryUOh8xXS4tenyrvsbWMh2EayXwgFeCegzOi8XWa0tPPE5SWlQuIGXvcWkwejcGH/TPeHlNzONomWWU8dsW621xsqwPsQL+GcRT6+VxeL63wtnNlVY2wFjh6GXlY4gEudYjUZZ+mJIBU5r8fGWJhvYeQhjR/TAwkeRHBF6ogCoJTjhJByXT6kv/SArtoMDM+WK/PX8o8L0X/nbI/lhC9YI/OXw7ZLi8vh/5LpKtutE0f2kJytBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/AN2Y/5jbM7f96BUiQqMMf0UXofAp9UdjbAX1E2XN4=;
 b=KdFtj9m1KYy2ciIMA2tW/GnJtceDYHTc7HzBV/RpFPLvDK0kkxJu4e+CgGwJT6ldAuK6sTCe/SLHyI2xK0+iL8OJsi7qIpq3hCMk4/jRXAC/BNRFuxHKC02X8dcAaZc+ueEoxNyX5wW1pJ9umjb0JuyAw2WZumNteipblrmdnMq93+/FQZVkIYsyeS+g4V869puj5LqeZdzt3ccAboQflINn9CTQbUYspiQfqvLwez6q4W1JeQcLZQvuFlQxnESSjreDqy1BIRaCQLeDGHwrN8mI+CtF2Hwpss4THjO+k47cpeUfkTN5OOQXZoH0lGWaUqKME+ym22tc5v2mCm9jHg==
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by DU7PR04MB11090.eurprd04.prod.outlook.com (2603:10a6:10:5b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 08:13:04 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 08:13:04 +0000
From: Joy Zou <joy.zou@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
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
	<frieder.schrempf@kontron.de>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "m.othacehe@gmail.com"
	<m.othacehe@gmail.com>, "mwalle@kernel.org" <mwalle@kernel.org>,
	"Max.Merchel@ew.tq-group.com" <Max.Merchel@ew.tq-group.com>,
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "arnd@arndb.de"
	<arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Jacky Bai <ping.bai@nxp.com>, Ye Li
	<ye.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Frank Li
	<frank.li@nxp.com>, Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: fsl: Add i.MX91 11x11 evk board
Thread-Topic: [PATCH v4 1/5] dt-bindings: arm: fsl: Add i.MX91 11x11 evk board
Thread-Index: AQHba9xLYVGOuMISiUuO2dDB0/pgcg==
Date: Tue, 21 Jan 2025 08:13:04 +0000
Message-ID:
 <AS4PR04MB9386DE9A3D1C3DADE712EAEAE1E62@AS4PR04MB9386.eurprd04.prod.outlook.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
 <20250121074017.2819285-2-joy.zou@nxp.com>
 <6693f1ac-6390-4e87-a0db-6fcb60242230@kernel.org>
In-Reply-To: <6693f1ac-6390-4e87-a0db-6fcb60242230@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9386:EE_|DU7PR04MB11090:EE_
x-ms-office365-filtering-correlation-id: 967a8319-27e6-45d9-f92c-08dd39f36e27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?blA0OGV0MDRVMXM0aWUyWGZZQVBiUDg3MS82WHI5aitqZCtRUlk2bUxiZmor?=
 =?utf-8?B?eEMrMzlZY0xIeHFNeXh6emRMWWw5RW9SdEVESzBlOFNDT2x5ZUE5TGU0MVVS?=
 =?utf-8?B?d09IUGxCSXBqSXpBVWhCdlRqZWRONlVTQURKelRtbjF6akNhQ2RrR04xRnda?=
 =?utf-8?B?SExaVWkyaXc5NUlWU3RNVURlYWhPSlMwdkpzS2JDTzBveWpZeUlObUFjMjJq?=
 =?utf-8?B?VjZaNDljZFZpVjc1Zkw1Ky9CQ05FR2tUdmswU25seEtobDFRUVA5MGgwRzJL?=
 =?utf-8?B?Y2ZJdnd3c2l6VEdTVXUzRDMzdkhnWW45eEc4Q2ZXcEFSTnlOOTBFOHFHalJO?=
 =?utf-8?B?RENXNUVRSG5xa25NSFpyOTRtaUFUb1BsRFlZYjZmQnhiWVcvZ3RMR2FWeStX?=
 =?utf-8?B?Y2Q5cmVkcHB2eUpZYk1KWmdXNm1XWlpFeDEzZGRuUnRkcThoVXNDUkJwNTdn?=
 =?utf-8?B?dTRyMlY2UmNUNWFrMCs2QVluYkZkaFpyZUZVN1d0YWJqeEFFeVlSNkFhdnRY?=
 =?utf-8?B?dGcxVlRKSEM3aHMwVFpCUmtXd01YdjNtVzZoT3BzMmZrSHZoaEhzWUQrRVhI?=
 =?utf-8?B?WmFrdnZ3NjNra1JQM3c1dWxjMk9LSzkzWG0rd25RSmpMalFYUEc4bFN5VlNM?=
 =?utf-8?B?M2FvbHNMd01ONW1DYlU3ZTBGa1J6MVJrTXpvNEFxb1Rpb25lS3BVdE5GZ3I4?=
 =?utf-8?B?c2dySXNXcDZoek9WYkJ6aUtrbkRYK2cwVTRjN0h0QS9XdmtZZ2FhSXJ0QVhQ?=
 =?utf-8?B?UGI1TTRFa1NJeExjNm8wRzNXVG84MDVtOUNVcmk1dEpOZGJEVUNyK2NNWFMr?=
 =?utf-8?B?amtCc3FiSFVyaW5wSHJaQldya3BwbmZOSGFZV3c4VGxEZThhSktTK29yTVQz?=
 =?utf-8?B?MFFUcHo0clRxcnFKdyt2OXB2Z3BHNU80b0JDb3ZaSFVrME5OajN6MGNYZm9i?=
 =?utf-8?B?a1hkR08rQmM2OGxrTERRb2N2ZzE0d05zaGpNNmN1aHNodjlTK2NMdkVOZFNm?=
 =?utf-8?B?cVBLbm5jTmFHb0JlY2FjTjdMU1ZUaFNpU0ViQTJ1dFZpdkgyMVFPMmZIQkhz?=
 =?utf-8?B?YndxSlpLZllJVjd6MlIyZVZVclV6SkRRSzU1d3pEVERhajB5ZkErTWtrbWFV?=
 =?utf-8?B?cGptTVRIRThSMi9UODJ5dWhkUjl4L2lKN01tdWVnNVIzTVF6cEYyYU45TlI3?=
 =?utf-8?B?MFN3WGNTb2ZUWTVhL0U4aWRLZ29rUGRKRnlyc1NQN0ZoTm81N05oR2g3VDhW?=
 =?utf-8?B?SmVnb29Qdm1mOUpCUEM2VlFTN0xhZVBhaENLYi96SlVZbThjNXBMdHYzWXBL?=
 =?utf-8?B?MDJ6K21aWTE2cFA2NFFoeURoVTIycnBTbzhYc0dxcTBXL2RzbTByMW9OdnV2?=
 =?utf-8?B?QWZJajRZTXJuM25mTG5rRUU4Z2h5YVhNMDRQbG8wbGZ4cnhPZzlOeFZ6MWJG?=
 =?utf-8?B?eG1oamhtK0tSb3JzNkpJejdQQ1gyMzVkdzVNVHY2OVFxd1NJQ2ZDM2ZzU28y?=
 =?utf-8?B?Y01YZ1NjUG9jbGNsK2ZBMUJRR0VZeDY1NVZmQVd5ZUtNN0RMRituQXM1UmNa?=
 =?utf-8?B?RXV4RWVNSWpzTnNnbGJGL2J2RitEVjNDYk94MXFUNjRRUkxSSVhwbE1RMGZQ?=
 =?utf-8?B?Vis1d2ZRQjcyb3FWaU84WWkvODhpbFlGOTFWcDlYSmM4UnBkbWVhS3ZxOEQ3?=
 =?utf-8?B?WVZFeTBRKzdJbGo0aTBVWVdxYlFqdFZuelcrYTdLb0hjK21HS2d4TWp5Wm5s?=
 =?utf-8?B?OEpOSzVXanI1Mnl3WDFyOCtMem9LS3oyZ0pkUWx4OUhSWEthVGUyNlY3dDAx?=
 =?utf-8?B?LzZad2xnaGlVTFlIektRcG1vTlIzM2wyRjlEYkVOUXdHYTUxdmdYU1J1NnY2?=
 =?utf-8?B?WGZ1bWVsLythVDRPcHY0cmFLQWVFNHhRQjdaQXFmT3o1ZExPVnowUS9wbW9D?=
 =?utf-8?B?MGpCeDI4K1Jaa2p5MlRrYk1EUXF2QTcxbkZ0TXByVi9rZW5MY1pvVHBmUnZI?=
 =?utf-8?B?L0Z0REx1SzBBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3JGbUNEVTI1VTVlMVNTd3NTd1ZqZDJPUEtZVy82K2RHSGMwcm9yTVRzSUpJ?=
 =?utf-8?B?a0phQlpJYUp2WnM4RkxiaUM0NHpQRWR0bGxHNDZxbWFTd3lLRjNyUTNzNWpU?=
 =?utf-8?B?N0VaQUFERzg1bGtaSC85RWkvNkIzOGZLdW1lWGN2VXlHeFhXU3hxU2pGaHgz?=
 =?utf-8?B?VXFZMTlVN3oxb2VoWmgzYmt1L3BYNE1xNy9PbVVpWnhlS0R0QmJaenV1d0J1?=
 =?utf-8?B?S2tKWUlEN095dlpkM3YrWHdrMzJQNkx1azRQS0RkTmVCMmVDekd4WTRPUDBa?=
 =?utf-8?B?UGNRcllVa0o3STZwMi84NnpwUHFIUmJPblNKS3JHUGNGdW5hSEVJWk5MWXdp?=
 =?utf-8?B?OXVXQ0ZNN0xkdml4ODJzNHdWK1hxb09qbXhlR0RuaWZtOFZsSDJScjlVMzcw?=
 =?utf-8?B?cGE1QVVFWnk5TmpxcGU0eEc3K1Y4UDc5YlE2SlpiYmtZdnFuZjEvclBpbElr?=
 =?utf-8?B?NnFSTVhGb2RsSzVaMUIvWlBvOWNTSVRwR1ZqNFdweWRMYUo3Qm5xVzhHTXMx?=
 =?utf-8?B?R2xvclkxSlZGcnUzTXlEVjJFMzNRMlJtRm5nOFVQdWFXTjhBWWpyKzJ6MEpa?=
 =?utf-8?B?MXZ2MUY1L1cwVmZ0Q3VyUnF4SHdMaWpuZGpSQWtLaHVlVlpqbG1UMWZKZ21t?=
 =?utf-8?B?ZUxXbGF6bE9DbnIrTTZqY1oxZk01YU85b2Z2ZlVnQTNoSGl2M2k5bExLQlh4?=
 =?utf-8?B?TmJ2ZUhJem9UTUJZUUlwM1lGNk5KVHJJUWlqUXc0RVlnQkNpaXBjZ3M3L2N4?=
 =?utf-8?B?MVVuclh2N2ZBRk5HZVhRSGZ1SWsweDFFY0pGRC9rVVRicVR1dHFERSt2aENs?=
 =?utf-8?B?VUVCYkQxcFFudUFWK2ppWVVTZGIrR0Q2cW1pSGVsMUY4dC9ONTNZRGN6TGg5?=
 =?utf-8?B?SmpVQWhLSnhqM2dSZlYvdm5wcTAzRFlQU3cxUERUV295ckt0bXA5elhaRWM2?=
 =?utf-8?B?bWtpSHY4dnU4UTgwNExuSm01SkhNL3N1V0pYT0ZVWGVzVkdQbmMwSThGWEhP?=
 =?utf-8?B?UkJuR0NHamk2OEMvZmNNbHlYTmsyT1QwaitSZjROTm1VOEIrQ2trOGZjKzNh?=
 =?utf-8?B?Zm0rNWk5TmtvOFJBQ0VRV2J6WS9hMVlSY3IrcUF6aVZFWncyZXBzanN3UTRa?=
 =?utf-8?B?djZ2Z0lNWkJoMWhqMTlOWVNXNVpuZGZ0dCs0cGZOZUNNSFNKd29ubEZyditZ?=
 =?utf-8?B?SUlyVDZyNXNwR1h4d21lbytEZ2hUcnAzZno5V2tuV0xrYnc3SHZma3loMmNP?=
 =?utf-8?B?Sk9Ja3dwWDRxSFFNdG92VW5RVnUxRWRlaEZxRzRuVC9xV2loUEtpSis0cFYw?=
 =?utf-8?B?RjdCNTl6WHNlaHJ4bG5ZUnVVL0w3alNYcXlQMnlFWkpjS2wvMFVKZm9MRDFW?=
 =?utf-8?B?ZXkybFJ3VklRWUpzTEpyZWhWR21mMi9vNVhVN2IyZzBuY3FEaktDcWFrT0Y1?=
 =?utf-8?B?N1VYMFNQV20zdVBTMitKQi94WjJRV1dPWk5QQlZ2TWNaaCt4Z0tiMDFlOHR0?=
 =?utf-8?B?NUVObHNFdkUzckFsenNsaW1hRDhmTHRadFdtcFlwOEhZbXU4cTBqajhqWFhW?=
 =?utf-8?B?QnErMjFBK0JsS0RvWE9wdENjNEc5RDNOdS92RWtuUGNtRUhZZE9QbWxMcThk?=
 =?utf-8?B?L0JpMHIyeXZpdEFIYk9Gd2YzZ3dpVnhjNDJ5VHRvVXZkS3FCVUs1aFpSTHZT?=
 =?utf-8?B?Wi9oYk9jUzByMGlsNXpWZVptaGI5U05RS1JUbStXbmZTT3JidTZ3Y096OTNp?=
 =?utf-8?B?bEhhaDdrS05ZZ01UVFRlUE55ZitTVVlBTUx1cDJaUmp0UUVvSGhZOGFoT1Bl?=
 =?utf-8?B?UUU1a2ZRYm5XTnQvTUdHbW4wNnVYSUpJb1I3SVBhc3dsSE5VM0hUMXQ2aWMw?=
 =?utf-8?B?NkJvOXpGcUlocmtSTllVZmxReWhzdFV3MHlXTFEvOUdjUllkRGl4eHR1aGgv?=
 =?utf-8?B?bU1OTmlibVFnTDJ5TjJ1L1dlNXlHYS9LbjRmQzM1TW1zejlSZXhUanEwZS80?=
 =?utf-8?B?alJhMzduU3VpUFhoK3BQeFFLNU9VSDc1TWV6TFE3ODlldkdaOGxLOEJPNzVH?=
 =?utf-8?B?SndLWm15eGVkRDdudm1mUlE1TG8wb3dONndnY2hZUTEzMmhINUxWL1JNVXJy?=
 =?utf-8?Q?b4sA=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967a8319-27e6-45d9-f92c-08dd39f36e27
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 08:13:04.4263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 95KjpoBLCTdaYXXXlI/5VEMDZwStQABSUW2PzKzmtaRX7iOmeH979QYANwCO3xmE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11090

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyNeW5tDHmnIgyMeaXpSAxNTo1Mw0KPiBU
bzogSm95IFpvdSA8am95LnpvdUBueHAuY29tPjsgcm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtl
cm5lbC5vcmc7DQo+IGNvbm9yK2R0QGtlcm5lbC5vcmc7IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMu
aGF1ZXJAcGVuZ3V0cm9uaXguZGU7DQo+IGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tOyB3aWxsQGtl
cm5lbC5vcmc7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsNCj4gZmVzdGV2YW1AZ21haWwuY29tDQo+
IENjOiBqb2FvLmdvbmNhbHZlc0B0b3JhZGV4LmNvbTsgbWFyZXhAZGVueC5kZTsNCj4gaHZpbGxl
bmV1dmVAZGltb25vZmYuY29tOyBoaWFnby5mcmFuY29AdG9yYWRleC5jb207IFBlbmcgRmFuDQo+
IDxwZW5nLmZhbkBueHAuY29tPjsgZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlOw0KPiBhbGV4
YW5kZXIuc3RlaW5AZXcudHEtZ3JvdXAuY29tOyBtLm90aGFjZWhlQGdtYWlsLmNvbTsNCj4gbXdh
bGxlQGtlcm5lbC5vcmc7IE1heC5NZXJjaGVsQGV3LnRxLWdyb3VwLmNvbTsNCj4gcXVpY19iam9y
YW5kZUBxdWljaW5jLmNvbTsgZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU7DQo+IGRtaXRyeS5iYXJ5
c2hrb3ZAbGluYXJvLm9yZzsgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZzsgYXJuZEBhcm5kYi5k
ZTsNCj4gbmZyYXByYWRvQGNvbGxhYm9yYS5jb207IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2Ow0K
PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IEphY2t5IEJhaSA8cGluZy5i
YWlAbnhwLmNvbT47IFllIExpDQo+IDx5ZS5saUBueHAuY29tPjsgQWlzaGVuZyBEb25nIDxhaXNo
ZW5nLmRvbmdAbnhwLmNvbT47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgQ2FybG9z
IFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0gg
djQgMS81XSBkdC1iaW5kaW5nczogYXJtOiBmc2w6IEFkZCBpLk1YOTEgMTF4MTEgZXZrDQo+IGJv
YXJkDQo+IA0KPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFr
ZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3INCj4gb3BlbmluZyBhdHRhY2htZW50cy4gV2hl
biBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0DQo+IHRoaXMg
ZW1haWwnIGJ1dHRvbg0KPiANCj4gDQo+IE9uIDIxLzAxLzIwMjUgMDg6NDAsIEpveSBab3Ugd3Jv
dGU6DQo+ID4gRnJvbTogUGVuZ2ZlaSBMaSA8cGVuZ2ZlaS5saV8xQG54cC5jb20+DQo+ID4NCj4g
PiBBZGQgdGhlIGJvYXJkIGlteDkxLTExeDExLWV2ayBpbiB0aGUgYmluZGluZyBkb2N1ZW1udC4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbmdmZWkgTGkgPHBlbmdmZWkubGlfMUBueHAuY29t
Pg0KPiA+IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29t
Pg0KPiANCj4gWW91ciBTb0IgaXMgbWlzc2luZy4gQ2FyZWZ1bGx5IHJlYWQgc3VibWl0dGluZyBw
YXRjaGVzIGJlZm9yZSBwb3N0aW5nIG90aGVyDQo+IHBlb3BsZSdzIHdvcmsuDQpUaGFua3MgZm9y
IHlvdXIgY29tbWVudHMhDQpTb3JyeSwgSSBmb3JnZXQgdG8gZXhwbGFpbiBzZW5kaW5nIG90aGVy
IHBlb3BsZSBwYXRjaC4NClRoZSBQZW5nZmVpIExpIHdpbGwgbGVhdmUgTlhQLCBJIGhhdmUgdGFr
ZSBvdmVyIGhpcyBhZmZhaXJzLiBTbyBjb250aW51ZSB0byBzZW5kIHRoZSBwYXRjaCBzZXQuDQpC
Ug0KSm95IFpvdQ0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==
