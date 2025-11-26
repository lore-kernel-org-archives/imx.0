Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF1B347DD
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 06:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764137962; cv=fail; b=AmMOcarWj1UJlTs2taJb0QCQHWEI+v4KbAvSB7SggXlhT6EkZEScgLB5Ni1vEZhoH+E0yjms0gjl37n6lhoaNtBjtWY8dnRWb7ZqtAXCuciACiQQPG6orgaVwEL9v6i7YJTqMJpGhw3pXxPjXUQHZY5pLNj6D0C5zNk9dvxOjI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764137962; c=relaxed/simple;
	bh=x8s9UZnjHhLINv1+mxOA95/phmR83ujfc3Yt+fxiUT0=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=J7PqOCEQ8SeWZMhJ/l1eq94BMkN+4HYZ7rQ3Lk32eQTCpkclX3Up81OVcchMbP2ZDuxQgibMnrkhPNy54zJjyLbPWrX7hPPTiMpzkRER5vjOGuMVLAsg/kriOdQgFDOPouZSGjsUqrMCQibV5oxLi5wQKpFSIY0BadkyGipPBWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BIq4Zk/4; arc=fail smtp.client-ip=52.101.84.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BIq4Zk/4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pja7q/C4Wj/2+F902pMvetF7e64nARRmU7anhqUrxOyxe5tf51ks8vZ7CwNIj4wb7TUa73/+KxeDY9rx7jOhA/NnBgLtTtZmVY7Q/k8bpk1192wsmL0iMSqAtni7D4iWQsWZNG1r68LLggtebUkNO7x7sXCbFmGqT96VYeM/OjqviflmD2BJjQPAgnVIljXxZERSwqbRV5/TKxkwcttgQgNGwd6gl7K/6pTWeJs+13EoW68F91kO09fKTS7r/DfO1VVT/0PqC4PM/i0HswIbac919uNpGceVHpgA+cF9zPH3lfjmmaUKnVKHWZUFY0ITIihAoavg1PDNz8US4WRsFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tgj2iSWj/tqcv3G4/mG5Sk6utxVdiCwS2IHp8PwNuk=;
 b=i20s1p1woiniUJlfjJj4sQN+VNz/IIGKhL0pozqijpegGpkK3NmeWiBnMlIc/OOZooESZxAOEC7/CWSuj0/SSaX7qJsivsF476ajfg7leO9ZBCOfJ/5pbbEU0FzkuLKEPsk1HgPIiQikFXUeg7vAda4NhDkibsnnPT5i+vVMVIss0DDrF7J15+8nuIsDECNxuPvbDSit5lgzyPVc0DEuQWRlqf91AKEWgfGkFg8OZQi/nRPMZv7X7g7PcZgye0n7Ay7yI7m6PTWYkGz4FQEGoWeWRdxlVikufhYy/nBJrlfmaNJoupoO42pTZEewnNADVpWZVlkfmAShUxCTsOO6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tgj2iSWj/tqcv3G4/mG5Sk6utxVdiCwS2IHp8PwNuk=;
 b=BIq4Zk/4a+B919xf3nTyBN3UuME9LV6sYWpnCS72pcIwtagy5qncopfn3tUKmkQndEG3mSgXBOJ5VuLVMVQwhwkTOevAMDi1FzeZUSKre/XQc35HyXx4hSjIh67PUdLcon73ijVhwCbRFcYw+PuMSC2CFr/zMIkv8O7bCpcUPyqY+X4gS/NbW5qcSay4U5dXhwaYBwtf7YhMxtQgfnNBTxUSEGKuAfMegE9SAivmdOjf8xcTm+xiDZEXij653xL/oheNQKoxbk6n2eIkjFTg4oOOSMNVUt/Wb285Skp18Cmz1a55N6OPTzFXNwB/I8nMoBfjbWzFWqN1WzeRylst4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB7653.eurprd04.prod.outlook.com (2603:10a6:20b:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 06:19:17 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 06:19:16 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Wed, 26 Nov 2025 14:20:07 +0800
Subject: [PATCH] arm64: dts: imx93-9x9-qsb: add CAN support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-b4-9391-can-dts-v1-1-c23145f0d2db@nxp.com>
X-B4-Tracking: v=1; b=H4sIABacJmkC/x3MQQqAIBBA0avErBvISSm7SrQoHWs2FhoRRHdPW
 r7F/w9kTsIZhuqBxJdk2WOBqitw2xxXRvHFQA0ZpcjgotG2VqGbI/ozIwXda2u7PjiCUh2Jg9z
 /cZze9wMHze3FYQAAAA==
X-Change-ID: 20251125-b4-9391-can-dts-2f4849978fc2
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, frank.li@nxp.com, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764138020; l=3069;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=x8s9UZnjHhLINv1+mxOA95/phmR83ujfc3Yt+fxiUT0=;
 b=aiauKiOcQxbSEuZWUp/eWb5eOcE7m0cUl/+R5pOd2ce2L5hmK31W059H138I2gnvOR3KYFxzZ
 8rXRCrRR1pXDWjVu8z0BSAq+ATaayNy8QaVHxva2xhJt9J0lBpXxc86
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AS8PR04MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf83b07-1b4d-43d4-f98f-08de2cb3ba08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTJyMjBReW5yK0dkUXJvMUxGZTgybTZjSEFmUU5ueW90RGs0QVlVVDVNQTJY?=
 =?utf-8?B?dEcrUGdWNGtQWnVhSlNXdVpZK2R0VzB6Q1lmbzVvSmdJczJ4MlFHcnRqQUNy?=
 =?utf-8?B?UnptUzdEODVkWEZ4QUhaMFk3OXFaQlhaQUlWWWgyMUwrNzRDV0tlb0JIc1pt?=
 =?utf-8?B?NnFEeTl4Tmg0NWwydW1YajF6dG5UNU1uMWxtek5wZTBFUjVmb1V0aHRVTGIv?=
 =?utf-8?B?cUFZV0w0eHpXMVMyTDBQMXZDY0ZvTDIzRloyKzRrNWprZm5OS1E3Z0RsamNu?=
 =?utf-8?B?WVJPOHo1NHczNXRIQmhON0t6b2pVMndkQ2FBbHp2RzFSaHhsTUZkZUhEaHA5?=
 =?utf-8?B?NTBwVjMvOUNIMnpnYm1BcEprRnB0VHNxb2xrb0VZVk9sUWJpT1Mvc1FtWkV3?=
 =?utf-8?B?M0NpV0hCbVhOc0Z5Q0dtWGhsNDJzYTZtRlYzSFhhVTNUUTNsczRZU0ZTZVFp?=
 =?utf-8?B?NTV5MER0Y3Z2SEc2Y2pSRnY1MGQrUkNSZ05vVkl3d0tBc1MzSXBFNFVNOVU2?=
 =?utf-8?B?WFpEZTdnV3BUb040NXNxelcwSjhlL3ZYUUF3WG9TUkFCN1FRcWFUQXd2UDg2?=
 =?utf-8?B?U3dHRVlld1VSL05DNmlYaVAyb1N2SWt3UkhVd25jUWZwejFidnlCUVBxOTlG?=
 =?utf-8?B?OU02cG1LT1QrK1VFZld0UEdWV2R3b0I2Q1lUWEZQTzVoSElmY0tkV09URnZs?=
 =?utf-8?B?MlB5RWtad0xiemNQTkFhdmdObTlCYW9wMFNUanVjaS9HeXJwQmtzWml6V25N?=
 =?utf-8?B?MDh1MktmbU5hV2dyTEp5azAvS0hSZE5QK0swY2I0ekR1dFlLYUJ3WHBwZHE1?=
 =?utf-8?B?bGg3Z215TnNjNWZzQzBmbkRoRDYyUTJDWEdxNGJQWHUyMlIyVkN5MytiNGQ2?=
 =?utf-8?B?Vm9KVnY4cDI3bjd0YkVBTGl4UEdabDZSTXdoU3pUU2tyL1JWR0NaYzBHbkp1?=
 =?utf-8?B?V2ZnM01oZko5M2IvRXl6ZWEyLzdoZnBGY05NUGRNUlBiZ05mUEpuOGNIZ2lV?=
 =?utf-8?B?WjRYLzcwNjhCVHI2SWhzU1VaZjBZazYybzVMcUkxQUtkeDA3bXZ5cXQ1RGJm?=
 =?utf-8?B?QnZ6aVk1R25odUp0QWtVbjhMbStNSzUvekpqb1prbWRoeDNmSk95RE1TajhI?=
 =?utf-8?B?eUx1aWUyb1JjRFQyTkNFcE1RN3h1K0ljNW1raFFxZ0ZtRDhPT2JVVHc3QjRs?=
 =?utf-8?B?ZzErMncxcWorR1lqM1ROUG1zYmhZQlJOclJCc0d3VFF6RHhsb0hXZFoxZVl4?=
 =?utf-8?B?QjBvUWlrTDlHQUFsNjhSR0s0RDc2MFBoWWQ1a1MvSmo0enZPK29sekowWm9Y?=
 =?utf-8?B?MHp1cEN3cHZWL2k1RFR2ei9KajRlKzlRMEQyY2RxZ2lKKzROYzlXT0pNOWha?=
 =?utf-8?B?bVJKTy8rZ3hZODN3Y3lzRHBvWi8vOVpDQm1HZVRGemZoVVdrcTB0VVJERzBU?=
 =?utf-8?B?TnhMY1FnYVJYZWF0dkVHS3VvandRaXlOSVN2UDNWVUhmN2ZZamNZenpUc1B5?=
 =?utf-8?B?eEZlaTVKMUJhcjlOTktEcHlDeDEwcDJ4ZUNOY2ZtTndtVHhSU0FKMmpkeDIz?=
 =?utf-8?B?SUR2SkEzRy9WTi9vWFYrMlcvdzdRcWlGeWFTR3hTVGVEcVJGLzNPcUpQakJ2?=
 =?utf-8?B?Uk45VTVmSi9nVFR0VTJhY0xiYzN3RXpweWRnUnM2ZFhyUWZWZUoyM05EY0wv?=
 =?utf-8?B?NlBSQ2E0WE9mQi9NcjhLdEhQVFZ2V1B5SmpXM1BOZy94cElQUWsyVFkvNlVP?=
 =?utf-8?B?V0FQRlBIR0FZcmI0Y3JyM01mOU5XS2g5NDJSL0U1ZjVYRGcwSXBXSlV3dGpN?=
 =?utf-8?B?L3Q5WGdtSzNFejN2VHlrNlhWUUlGbXBROFQxN3hGS3pXaGVxTFFnR3FONm1D?=
 =?utf-8?B?TCtwdU43T0VMZVh1R08xU1E1OEFpOWJTRStLeXFnem1EdEFORnlDNTVwa2dt?=
 =?utf-8?B?b0xUaDVQbFE2ZStBQjZreW9KWFBzaXJta1prbWljbXlPdDJUd1RYSUpzZXNV?=
 =?utf-8?B?d3RabUxUT2pQczFzZThGMDBqLzRBeUJSV0kwSTNRWjcyUHJOeUNDVFpUNks3?=
 =?utf-8?Q?SV8Fdp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWk5ODVuSEt6QXUrRHFVZkNUSzMxRjJLS2JWdGF1ZXNKWGJFVnlJM3N6eW1i?=
 =?utf-8?B?eXpEM3dIZDkzbEtzeUpJeGptZzZyVHp3b0FoMnNxUFg0d0tIMEFGOW1MdkY4?=
 =?utf-8?B?TXNRZHBjQVVibzU3RGViWnp0K0ErWGtkYnVzbjJSaXZxeDRrMDUzc0xla3VK?=
 =?utf-8?B?WitxU3pUL2hWY2NQeEFFbk1naTRnazV3cmZqb09SM0JmdWJ6RHJjcTZKUHBF?=
 =?utf-8?B?V3BDbGhtZzhSZ1N0NC93MUFWSWJjUWcyMDhJa2FwV0dNV2QyekJDRTc2Nmo1?=
 =?utf-8?B?Zko2N1BYdk5TcnJJdHlwZS9YSGRnalZqVkVFalJ4cGtJQXM2NXJUeEc0WFVp?=
 =?utf-8?B?K0VLQTNELy8xWldQMFptZkJIRlN6aVZZNVdZN3k2UWg3NkpHdGdnVEtZMU12?=
 =?utf-8?B?SDVtWWE4R0NQN0NYSDB0QXZkQ2F6TGR3c3Rjd09sRTJKMDhobFdVMkRPM0ZL?=
 =?utf-8?B?Z1k4blhHWGc1elZkazRyL0ZvNnVrQUZ5bGRNd05kRXNod1BuOVZhWG1iWG9p?=
 =?utf-8?B?TWpyRldhRmNtQ3FQdHlBSjlCQitFK2pDYUxWVHFNVEZGdThEWkFCSWkzOERZ?=
 =?utf-8?B?a3pJN1lLT0gxODE1aGtjTFVkbVc5YTV5OFRmU05nWTVsamQ5Uks3OFV5bzNB?=
 =?utf-8?B?WDgzUFdNOGJ3UVJoeWNtMW5ncDNkaHBjb0tQL1g5TXRiYWdEajNsVm4xUDJE?=
 =?utf-8?B?WEFxcG5UaGROOFUvVzA5Um1XVWFpdVYwUW1qeE5WS2FtdExmcHppNGVRM0FU?=
 =?utf-8?B?ZUxvVmc3STRUeFVFZjBBdmoyV2xKekVMUzVLVnpDYmxaZDB3UldxU2tTRGxu?=
 =?utf-8?B?Q1orNmN5VHRLa1pHTWR1UGtLUDdnS0xTREhFNW12dVB2ZU1kSDhnY3NJVmo2?=
 =?utf-8?B?TjYwazJWclJYMDFvakNpR24ySmN2dTgwbDhDdG9vdzRLRTlLZm9vL3VHQXpU?=
 =?utf-8?B?K1ZrcFl5dGNiNG9LS2o5NXdmcng3UlZkMGN1dmR1eFJuVU9yd05ydjJQMlpW?=
 =?utf-8?B?SVhISWpMcHRWcUFwcWRkYitoUy83Vm1oOGJVcWJ2R0J1T3orcHZwYWRIcFFz?=
 =?utf-8?B?VDJQcGc3QXV2cXlyeklBczljVGEvYTlkRC9XK25QU1F5bVlTQ2NRWkpMQ3Zv?=
 =?utf-8?B?SUU1TUtqb1owd1FDYzJ1bTllSG03cnVrOGwrMG9QVDNHQ2JCY05ZWEVjWlpq?=
 =?utf-8?B?SGRObXNubnU4MGJrUU4xOFdWb1NpQWo4b1pBazFlQlpPekU3TURtMXJJeEVT?=
 =?utf-8?B?c3dXejZtSEVEU2ttVDNxVWx6NHVGZlhPMWJ3Q2tNR1BTQVhqMXgvNkNyK2M4?=
 =?utf-8?B?L2xsOFJWL3ZnRUU5ajlGUkxEQUUvNGlVbXRneG9iRTR6VWMyL0FBZEhidVlO?=
 =?utf-8?B?akVBTzlwTDJXVXd1NkhIN3cyYUFMc2E5Ylk5MUt4QTdCM1N1VzdhOFoyMkNF?=
 =?utf-8?B?WTFYTnJVYkMxaHpEenFYMkhJeUVaa1lpa3NsNE5Za01hM3JyQ3JreDZJSW0y?=
 =?utf-8?B?L3RsWE1DdXlsN3hNTHhHRi9MVWRGZVV4RkY3SThMUDh6c2pvWjVoWEp3ZC9o?=
 =?utf-8?B?NTVzL05WTWcwT09YUkVVcERQenUwOFFhdm1ZL3QxQWgvQ1hPWENPb2UramhW?=
 =?utf-8?B?bmpuREloblFUdDdUM2x0MDhsV0MvNTRFblphajNYVHpqL3UvM1JoclU5UldG?=
 =?utf-8?B?dWdXVUI3V1dvdllXVyszem5WYVBXbUhGRDBFWkF4aGxZUlZXWUJ5bm5SMWh6?=
 =?utf-8?B?NFp3RzF3c3dGS2ZuMzg3eCtwdC9jZTR4Zzh2Y1JYTXd6cHZyUGJOcWNHRXYv?=
 =?utf-8?B?eDFERVJiU0c5a0lxMDhSbXk2YUZJT1BoczIyVU56S1dFMDdMZHBLcWpBUFp0?=
 =?utf-8?B?dEptVGx1c1A1MDVCbVdtQzJtZGpaY3M0ODZoblpEdE0rRDJyS1doR3BZY1VH?=
 =?utf-8?B?M2x3ejgzTTIva0RYdWd5VURudUdjOENMbmxWMVA1V0h5TER4ZzJ5aW5zTW9H?=
 =?utf-8?B?b3d0OURtQkdIOTJDQ1Rkd2s1N1p2N2ltNFJQYjVUY29ONG8xbWNPb216U2Ex?=
 =?utf-8?B?cFlSOHZGUUxiYi9UTXNHdjE0b0MvbGlPbjhHRXowaWFzWGNQWTdpVDlnQTM1?=
 =?utf-8?Q?bsmJaAJFWumdFp+wj77hwkDAt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf83b07-1b4d-43d4-f98f-08de2cb3ba08
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 06:19:16.8118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kQens0DSG38eVV9y36vTH//7geN2uNRMXogjrwLnjvbqeo08d6xTN9620CIVusi39F71u57Wu2lcTXMasTAdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7653

CAN1 and Micfil share pins on imx93-9x9-qsb board, use TMUX1574RSVR
to control the connection: put sel to high, select CAN1, put sel to
low, select Micfil. In default, sel keep low.

To support CAN1, need to put the sel to high. Besides, CAN1 use phy
TJA1057GT/3.

---
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  2 +
 .../boot/dts/freescale/imx93-9x9-qsb-can1.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0ce6b38f7bef10e3970ac34f70f4a..1142d3312c8651b4292837bce3cbe46ab95f7e09 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -373,7 +373,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
 imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
+imx93-9x9-qsb-can1-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-can1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-can1.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..62d4fa6c21d794f91da59f511d6f0162037e9271
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	flexcan_phy: can-phy {
+		compatible = "nxp,tja1057";
+		#phy-cells = <0>;
+		max-bitrate = <5000000>;
+		silent-gpios = <&pcal6524 23 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	phys = <&flexcan_phy>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__CAN1_TX		0x139e
+			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
+		>;
+	};
+};
+
+/* micfi1 use the A port, conflict with can1 */
+&micfil {
+	status = "disabled";
+};
+
+&pcal6524 {
+	/*
+	 * mic-can-sel-hog have property 'output-low', dt overlay don't
+	 * support /delete-property/. Both 'output-low' and 'output-high'
+	 * will be exist under hog nodes if overlay file set 'output-high'.
+	 * Workaround is disable this hog and create new hog with
+	 * 'output-high'.
+	 */
+	mic-can-sel-hog {
+		status = "disabled";
+	};
+
+	/*
+	 * Config the MIC/CAN_SEL to high, chose B
+	 * port, connect to CAN.
+	 */
+	mic-can-high-sel-hog {
+		gpio-hog;
+		gpios = <0x11 0x00>;
+		output-high;
+	};
+};

---
base-commit: 422f3140bbcb657e1b86c484296972ab76f6d1ff
change-id: 20251125-b4-9391-can-dts-2f4849978fc2

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>

