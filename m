Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7139A1DD0C7
	for <imx@lists.linux.dev>; Tue, 17 Dec 2024 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734424925; cv=fail; b=mTNwuEYwRHPLBr+itpZFx/gjZ7TfFhMKY4+AK2NgOnpo4UVnK/vQtyKGL0mZ5YFHZASwINBYZBXyxYVXcRilg2mpcANVTy450JwhxqPaF1Ylonr036wD+LAsQ+waOh/cezy6Ejcrr7ZlroZJwfUFfesPwxmbwwPgCZ7tbMnGiZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734424925; c=relaxed/simple;
	bh=O7ix4NADyEVlKDwvDCTHqcEEPV0Dh46r7Hr5AFkopiA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ljxhdQGW02G6fXaI6kv/w4C6XWZNdd4q5svG0EiKMzNAI/R91zWc4eHjDgwSW2yl67tl3Gx8hCLlaLX3GY3PYpdYZPzoM0d8yLtk32DDbBedR0YGZj9E+KKdnsqeEJZcsP7ih8QLdB3kuvg45Qlha9xKb9UlayRfFTi89ay4aWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fEMzTipK; arc=fail smtp.client-ip=40.107.21.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fEMzTipK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrhdu3Rixsq38tojMigEPMQrbD4xRK+1b8f/EkozNwNBHJic0kgOWaQ19yZfsmYnhkD1sADL+Wm8umPMZdO+K1r3Sf26P+rAEtlEVX2IgW4KHtBfR+Bu+q5IclC42mg3yKtau7JzUFYo054Xzu4+gSjbSlwol7j9Gy6vMQKTCPlhC978njzIGmwAlJquDcNGTMUm00bJu4HSHZnq0yoMHXWwMyi1YwRtI9jwZIN1E14A8Po4RLJt7iWpIyPfyL8QMr67CYWoJboxLg1j+aRIq6C6jxrF4tlzPULFXJ9bCiMZSWO0TXZ1NoPlAOGz1TYJaPlTg39b5+FDKHDShpEeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7ix4NADyEVlKDwvDCTHqcEEPV0Dh46r7Hr5AFkopiA=;
 b=O+9sB5tXIpERdVxNVH0z8uadfz+e6cshLXM2cZGZ2Sd57mzYsZUL+DCC/gYZe/wL97ko7ElyRLvYBnx69tGmHPCR70axXiT904JJQmPYIX0J78I+GgOCUyo06mFsNEA5FZEBKGPLxZII1o54LBalepDbSzMi0j9P3BZhG/yX7iL+QaAkXnYHhtFrVM0Wlt6G6Rv73q1Jlrisqy59mYlaeZ65xL8C+dPWMG6ghSSRJxIBAjizc/Zm9gI3d08XKv0afxpaxD0iPPEBL//nh+OrVD6JsHk09IRib9ILsxde/oe1Zw+2A3eyp7lRuWkqQzKBenllAAfpK1IDd+yC3nsumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7ix4NADyEVlKDwvDCTHqcEEPV0Dh46r7Hr5AFkopiA=;
 b=fEMzTipKXwT5i37ab5E5LIGJYWk8fI4zSft8tx8ZnpBmtZDLxmVcGaiIaxV3KsPhphZ9H47jskRq1A1ubkoZLfLraNEhA2GtZ+nWKGBwS4H3wQhXwHdse6zUsUEiIFxCxdwPws1BFUUqR9syoVuDrJeeouxUQM7cHs/nXA+vk337r38VuE++ssFxDxJWuRZcW5kRDczbmtP49VUrPoT2dL0wCW87v4Ui33QGxSlpbihy+NlCX7aI4NmZyfltvGJ7+Zp9Li1r0NPMImQhalb2kqCXHbrH7k2zNeS7fm7W0Bqj8pKiSrB4gcBcX3uqhD7kigjowZgjWWaq84R84uyurg==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DU2PR04MB8645.eurprd04.prod.outlook.com (2603:10a6:10:2dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 08:42:00 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 08:42:00 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Topic: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Index: AQHbTHk81yKZ8OkADU+CIsg4vinMd7LoreGAgAFzfpA=
Date: Tue, 17 Dec 2024 08:42:00 +0000
Message-ID:
 <AS8PR04MB8642C9A1DA27CD0F3F51DF2287042@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20241212093555.1376568-1-ping.bai@nxp.com>
 <20241212093555.1376568-2-ping.bai@nxp.com>
 <z6udhrqfmbelspe3eiz2q6twqvn4nkgxnfsdyxdv7ow6llxiz6@qhbaobn63icb>
In-Reply-To: <z6udhrqfmbelspe3eiz2q6twqvn4nkgxnfsdyxdv7ow6llxiz6@qhbaobn63icb>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|DU2PR04MB8645:EE_
x-ms-office365-filtering-correlation-id: 5aac3c96-8385-4e76-5018-08dd1e76ac78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K3dSYWhXYzE0WjNaSXZnWTF0aVQ3RTNqM0RpWXB4Z2xQSkJWTUIxLzExVmRo?=
 =?utf-8?B?VFd5cFdCVS82R3VqNzQ2ekd6cS9Lc2ZVMExweW5ldTVFUC94OXcwNnRaWlZz?=
 =?utf-8?B?UFlzdmNUNnNTQXRLWm9WeUJWS3UwMmFIOHFzYU5FMXRhRmJtaldEYS8rdCsy?=
 =?utf-8?B?VkdJZFcwckZ5dE5PSTVuRk5oZ2FwVGt5ZThjTXorMFpCeGhLd1pxK0pnQUd6?=
 =?utf-8?B?WHRCMXRUbWZNOS93anVxRjVMdkJna1Bxd05Qem1ZSXE0NHhpQ2lWeHJXelB1?=
 =?utf-8?B?TEk2THFaQ0lRalNMV0lqTitZbTVSN2d6eTc2TE1rOTNxN1RaaitRbmZmb3Br?=
 =?utf-8?B?dlJucjN2T1h3T3ZMZ0NpZzdFRGNQdVRobWFKekJibkRkekZ1MlpUT3JXYlUw?=
 =?utf-8?B?UmMzMTJ3QzgraHNSVDgySzl4bjdTZFR3b0VSWlF2QXlBZnJlR1lZOVNmZUkz?=
 =?utf-8?B?Vm9uZkQ4UE9aUWFKSVFaRjhvSWFzWTJDZSt3TEhZRFQ5YlhmbGNTV2NVSzR1?=
 =?utf-8?B?ejNDWnl2TmVsbWtVeDFXb1dkVkI5bHdyMDB5elI3VkpFM0tZRTJjV1NRb3VQ?=
 =?utf-8?B?eVkvY2FjazFoMEpyU1RkSU5Zb0s5dll1REFpM3RKZG8vWVNWd0FRNGN3eVlE?=
 =?utf-8?B?WTZPM0g4SGw3Tk1UbUR5UktkYkMvaUFKNWU4QXdEKzBmVnZYY3JMZ2JOWTJ5?=
 =?utf-8?B?TUg0MklBV3NzZXF5b2lyaGVJZWRFTzluRXJURFh2NzhCWlluMEVreFh0dys5?=
 =?utf-8?B?UkN2N2QrcHVnb1pwakM1eVc3ZC9rc2UvOUhWaERRU2J3bXlZcmw4cmk4eVB0?=
 =?utf-8?B?ekQ2bTRwamxmMjNxZVlVdlBidmJqL3NCdXJraWN1UG5LdkVweXFuVmZFcWJn?=
 =?utf-8?B?SmVRTE10Y1UzdW5wT1hPTFQ0dTJFSjVrMXFTMHpYRSszeDVFc0R2Qlo0cytW?=
 =?utf-8?B?cHZsKzQxVktYZ1ZRS24vL0Q3Q0lIcDdXdDJWaXBULzFtZkZYTDVCRVJKZFJx?=
 =?utf-8?B?VVhNbkZHQXhkaFFYRDFQaW5VUUR3ZmZRVk5PWWJ3YnBOSmt0YXRSTVFOMkZi?=
 =?utf-8?B?L1FRTStTNFNmMDdBUmJFUGk0dlJLam9XL3g3MDdUbUhHZE1kaG9HSkhIUjRl?=
 =?utf-8?B?OG9vbk82TS9HNE1hRmtnMkVrV05WUk1reUduMlAySGg3N05vM3RNK3NlWU5o?=
 =?utf-8?B?bi9VQ3lyU1dycXl0SjRoQk5ReDQxNWtqeit4ZU9mYno3YW9QYk5pcTJCSWhs?=
 =?utf-8?B?NUhRZzFlRlpzbjBNb0ptVmlMTTFFb2RvVjg5a01pdmQzeGU4Z0tCWTFyTzFE?=
 =?utf-8?B?c3VlM1oyOUtPSEtkcGkxU2drY0tEeElYUnlzR3RxVjhFT1RVTWI3WG9JWDVH?=
 =?utf-8?B?Q0F4U280dkU4M2ZtSjl5RmJuUS9DV0NpRVoyMGx2M1J4WUJWT013ZHdWdzIw?=
 =?utf-8?B?WFlqSHRDZXZSTlV0dk1HaVAvQUQ2eXZoUjZtUkpjSHM4UjFNV1NRN0xMQTZr?=
 =?utf-8?B?SVJhTXkrZ2QzMllETjBvN3ZPZTVCWDRrdHZSMHNlUW0zZGFVTmVYYnVxam5X?=
 =?utf-8?B?TzBnZ3BKM2xqeWxVOXZjdVZNb2dsVU9jY0lLODVSSDZndHdaSWhmeXJURCtP?=
 =?utf-8?B?YkNmQjFsV0NqYXdpZzdrckxCNlFXUG14WHZqM1Q5R2Z4Qm5rQUs4WmhTbWE3?=
 =?utf-8?B?U3JzSDRVd2JGa0ZYalBSeUNIYzVITkdCSndGQzhVNWZ2VHZ3NmNTREpZMWhL?=
 =?utf-8?B?Y04wWEgxNXpySUtJdXhOTHZRaHNiT0NNd09jN2xqRU5sVWFrbzc4Y0NJSEFx?=
 =?utf-8?B?c1hBV0NvYkRBQ1ZNVWlGOC90ZmhNdFp6ZTN2dnEvU3JpNmR2T1JkT2VxbGVi?=
 =?utf-8?B?MWZNdjV0cUZmUnJ4RitLb0xFZnUxbFkvWTFNZE5MMUx0dURaOWhtZnpMVU9C?=
 =?utf-8?Q?N0L15Jq7XAXpy9uM6XfJ9jZPYI46f+pU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGJXQkZTUlhpNVJTakNOSmlKbFJhYnh4WlNTQUcyWkdWeUVxQ2lUTkRFOWtV?=
 =?utf-8?B?TUl2djJQRkpyY0QwL1V2Mjg4R21vVkN2bVpGc2VMYnNnTXVIM2ZGZ1FSRzBU?=
 =?utf-8?B?c05BbHIyM3pvTno2b0toZWRGSjV6TVdKaU5oVno5ZUl2c2FoSHNScTJwVUV0?=
 =?utf-8?B?YzlCVm4yZkJ6bk1NZE5ZRGtMNVJqR0hoODJYdU04eDgvYUtUV0wyc0dLZFcz?=
 =?utf-8?B?TFRvL201N05DWDB3NHRBRW03TEZNbFZkTytYRUpVbCtPWmd0eWpiYzNqbUJz?=
 =?utf-8?B?bXl6d1IzZ0JGNm5wZFRIaVkzRjI2TWFRZ0hWbHowT3d1cVdFZ0RzUVBoZGM4?=
 =?utf-8?B?ZEJ5NXdnd0tUcFB1RWRrbVorZGl6K0JRVVFaZlBpN05LN2lWckRNeXZyb2NU?=
 =?utf-8?B?NkFSK1JFUDREaGhjS3JkT3dEaDBQeW8raEM5dE1MdnpWWHdDd0F4Y0VuTVdI?=
 =?utf-8?B?ei9jM2dlZWlYc2UwNWpqZWFCNVF2UlhxTGo4N3pQQ3JuTHJPQlBQQjBXcWlp?=
 =?utf-8?B?Ti9VZWxHRzR3eFliUTBZK0VJWHpCdGdWUVNmaTZVZ1JWdW1MWEdaa3ZqZkJh?=
 =?utf-8?B?aTdWV25GeVRha3dnaG0ydXdDYm90YjVmVkVqYWszWW5oclZLL0JRemFzWE0z?=
 =?utf-8?B?d2Ira2NSR21zeWNWY1pKRjZvT2EwSkFUL0hvTEdJVlNyRk9DRkxYeEE5ZFlB?=
 =?utf-8?B?bEV3OURUdC9uSnJtNWYvSU90eUhUODhZeCtraWp3VHZ6SVFzQWNDbW1YYi80?=
 =?utf-8?B?b1FDNzFTL1dxRkg3dUNtSVUzZ0M1alNqN3c0OHVxNkdDSG9ubGQ5VTlBZS9n?=
 =?utf-8?B?YzljMjJya3ZnS2I4djlZTUxiSGJ0ZVdvSXRCMU5TbFhCWVhtbVc1bnJXbHZY?=
 =?utf-8?B?Y1hJQmxEY29vMlJVaVo0ZXRGcmx6c3VwWm9qNERKSU8xVWJMZjlHV1FudnNF?=
 =?utf-8?B?Ri9UTmV2NnB6V0FlT0s0V256dWJLWmZUOWE2MUpBd1c1SlhpcGF1TlNkUmtJ?=
 =?utf-8?B?cEI1NGpETGVIQURzcUxOZTZ3QWZQaDBOeG5kbGIrKytUUFpHMXpXdmtseURi?=
 =?utf-8?B?eVBKZ0R3U0xHNnNmWG5nUUZuNXl0YVJMV3B6QmVZSVdzcDZLL1l2OWtUaDdu?=
 =?utf-8?B?SVZnMlJrNkF3RlFQWXpBdlN2eEJZWU1SUUFSRG5KZE01Z0N3TEZxT2ViOEJG?=
 =?utf-8?B?SDFZVGt2V2ZxbHZiWWg5aWcxMmZQdEZOVEFRSUlzZUpyc0VOY0dldkRnWVB2?=
 =?utf-8?B?Q2g3TU1iSVo0a2xSQkI5aXdWeGRpbUlPMlc4V1BRWENyWC8vV2RlK082bVRH?=
 =?utf-8?B?UHJyOEd4c1hGQy9qUnFLSUZmU0M5U3pjNlp4QkxWWWJlbitZZGd6c2orRUVn?=
 =?utf-8?B?TW84M3c2SWt4dUdtbmgrUmxOR3k1TXd0QWQ5WUgvN3VMYTI1ek1vYWttSGJo?=
 =?utf-8?B?a29tVU9IdE56SUROU2FITERac0l5L0xXdnVmVGRZTitRQjIweldGVFJPREVm?=
 =?utf-8?B?U1ZNZjVBYUcwNDhUVFR6d29nc3BFM0loTVI2a05YNlZrZ3U5eXlmQmxZS0Z1?=
 =?utf-8?B?NnJLRC9ONE0yS1BuZmVGR3p5bmFEdEZTeUdia2NHRXVWL290NTI3MUZaNUp1?=
 =?utf-8?B?UCtrQ1VmVWwzazFaN3hmb283SDl4bFVBbDZPVk03Z3Z6dWRDUC80bVVRdWlS?=
 =?utf-8?B?ellaQUNoN2RhU3N1QnB4RzZ4dHhZVGlKeUxLOU5la2NtZitIcHd6cEZVeEVY?=
 =?utf-8?B?azh6dStNNFkwMzVKenJWMERpcCtPWjN4Y2YyUHI1NUZOaFRnQjVMZXQ2MG5P?=
 =?utf-8?B?KysvSEJqbkNQRDV4ak9ZNytod2FESkhHd0lCaDBOVWR1ZmRXc0o5c09FbElr?=
 =?utf-8?B?SzFURTA3OEE1dzZUQW5WbWhEckFKcDBGakxYeVdXZVVBVm96SXhwVXZHT2dr?=
 =?utf-8?B?YklwNFRiVkt5cVY5Q2lyRTlOclcyUUI1blRkN1NFTlZHSFltWEpKMkZSUElK?=
 =?utf-8?B?cjlBbmVzaUp0NkE4aE9yUnRuSVcySVY3ZFpmL0haSkZhVVRyWlorM21CQXNs?=
 =?utf-8?B?U2RaaklWWWl1dVpsUm12LzlkdTExSHZ1d2xCcmhwMmthSkZNaXZQVE03c0ZC?=
 =?utf-8?Q?1wCI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aac3c96-8385-4e76-5018-08dd1e76ac78
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 08:42:00.4512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BXGFy4XPJgNRjXUt9tjUUWVI0cpalB3sXzFPqqrac7/xgOOv7+Ut8c6w7B6cbmUM0RBYrHVqoRHQead1nIGWdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8645

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiBmcmVlc2NhbGU6IEFkZCBiYXNpYyBk
dHNpIGZvciBpbXg5NDMNCj4gDQo+IE9uIFRodSwgRGVjIDEyLCAyMDI0IGF0IDA1OjM1OjU1UE0g
KzA4MDAsIEphY2t5IEJhaSB3cm90ZToNCj4gPiBUaGUgaS5NWCA5NDMgYXBwbGljYXRpb25zIHBy
b2Nlc3NvcnMgaW50ZWdyYXRlIHVwIHRvIGZvdXIgQXJtIENvcnRleA0KPiA+IEE1NSBjb3JlcyBh
bmQgc3VwcG9ydHMgZnVuY3Rpb25hbCBzYWZldHkgd2l0aCBidWlsdC1pbiAyeCBBcm0gQ29ydGV4
DQo+ID4gTTMzIGFuZCBNNyBjb3JlcyB3aGljaCBjYW4gYmUgY29uZmlndXJlZCBhc2Egc2FmZXR5
IGlzbGFuZC4gT3B0aW1pemluZw0KPiA+IHBlcmZvcm1hbmNlIGFuZCBwb3dlciBlZmZpY2llbmN5
IGZvciBJbmR1c3RyaWFsLCBJb1QgYW5kIGF1dG9tb3RpdmUNCj4gPiBkZXZpY2VzLCBpLk1YIDk0
MyBwcm9jZXNzb3JzIGFyZSBidWlsdCB3aXRoIE5YUOKAmXMgaW5ub3ZhdGl2ZSBFbmVyZ3kNCj4g
PiBGbGV4IGFyY2hpdGVjdHVyZS4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgbWluaW1h
bCBkdHNpIHN1cHBvcnQgZm9yIGkuTVg5NDMgd2l0aCBwZXJpcGhlcmFscw0KPiA+IGxpa2UgdWFy
dCwgZWRtYSwgaTJjLCBzcGksIG11LCBzYWkgZXRjLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
SmFja3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9pbXg5NDMtY2xvY2suaCAgfCAgMTk2ICsrKw0KPiA+IC4uLi9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTQzLXBpbmZ1bmMuaCB8IDE1NDINCj4gKysrKysrKysr
KysrKysrKysNCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTQzLXBvd2Vy
LmggIHwgICA0MSArDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDk0My5k
dHNpICAgICB8IDEyODQNCj4gKysrKysrKysrKysrKysNCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAz
MDYzIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDk0My1jbG9jay5oDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5NDMtcGluZnVuYy5oDQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5NDMtcG93ZXIu
aA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OTQzLmR0c2kNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg5NDMtY2xvY2suaA0KPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OTQzLWNsb2NrLmgNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uNjRiOWQ1ZDQwNTFlDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDk0My1jbG9jay5oDQo+ID4gQEAgLTAsMCAr
MSwxOTYgQEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBP
UiBNSVQgKi8NCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IDIwMjQgTlhQDQo+ID4gKyAqLw0K
PiA+ICsNCj4gPiArI2lmbmRlZiBfX0NMT0NLX0lNWDk0M19IDQo+ID4gKyNkZWZpbmUgX19DTE9D
S19JTVg5NDNfSA0KPiA+ICsNCj4gPiArI2RlZmluZSBJTVg5NDNfQ0xLX0VYVAkJCQkwDQo+ID4g
KyNkZWZpbmUgSU1YOTQzX0NMS19PU0MzMksJCQkxDQo+ID4gKyNkZWZpbmUgSU1YOTQzX0NMS19P
U0MyNE0JCQkyDQo+IA0KPiANCj4gV2h5IGV4YWN0bHkgYXJlIHlvdSBhZGRpbmcgY2xvY2sgaW5k
aWNlcyB0byBoZWFkZXIgZmlsZXM/IE5vdGhpbmcgaW4gY29tbWl0DQo+IG1zZyBleHBsYWlucyB0
aGF0Lg0KDQpUaGVzZSBjbG9jayBpbmRleCBtYWNybyBkZWZpbmVzIHdpbGwgYmUgdXNlZCBpbiBk
dHNpIG9yIGR0cyBmb3IgY2xvY2sgcmVmZXJlbmNlLg0KSSBqdXN0IGZvbGxvdyB0aGUgd2F5IHRo
YXQgd2UgaGF2ZSBkb25lIGZvciBpLk1YOTUuIEFueXRoaW5nIG5lZWQgdG8gYmUgaW1wcm92ZWQg
b3IgcmVmaW5lZD8NCkZvciBjb21taXQgbXNnLCBJIHdpbGwgYWRkIHNvbWUgZXhwbGFpbnMgaW4g
djIuDQoNCkJSDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=
