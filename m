Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648131FECB0
	for <imx@lists.linux.dev>; Wed, 19 Nov 2025 03:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763522552; cv=fail; b=fU0/WrAp//vGG7xo0s9N7ebXcwv856cO4XKm+7EW8hY3wR8dDD//scB+5awS9hsATciVqi+5weQh3TmZMWITD/U5tVncXteLo+Vsf5hCl5qONDsyvPOZzbzLqoxEGKCrvKMJHs0NRFQudFovmLZKTD/T9dgMgPkcDW/yqmXNTpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763522552; c=relaxed/simple;
	bh=7syRsZJLe4mqC1PhgPa6pqhjxc+HY2hXRuQHrDvVdds=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kgdnxc7gEHoeOw8eQqVzJ+7YHKFaOZZQkDJQVg0EbFwKjka7OWThbw83UDz4fiEiiC2L6YisgOkfU4oVq/NUcR6y/mtkNncwETJZNKLr7J5a1GTJQFkocxngjV+WkcCDqTpdx/pY+WpH8udRXnsb1QHz+UB7VklD4n0TnpzS/ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BtC3F8x6; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BtC3F8x6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDDfPJuba7mnl6GVVsXFTf4ApnKMkyCqx/yHXmOJxHGR9px26AEhks0gbXwDx5b0Gyr4xk0PTFTnN9g6Q5y/eDMN5R9ioTFTI7KQNntN+KU6n8YxRT7ap0fezBQns8YbtAEkWe+9KJ+mRKw/gZSfghw97Ta5Y5K/M+KTz7JPUmLHzWoXKMEv88Jlge9iGIFxEGjEY+qIRWxLio1lJtNH/QsA0N52iwj98E55BvsjfP5NZ4MJv2TCJLtIg7BHZX0SjJuXiePH/E/ElhL0ZSCyAq5kXqo8+4hvtbQNuiUZKLAYk55HaRs0kPnh7lQvJrXSDebH0Rnxs0fajGIvROO+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3qwXdEIF8uKCtqTYXevrgBYB5Lp9kuna94xh77u8Xs=;
 b=PBQkQ5HNy8dxDpSGYTz6SWqTE6PVWeY3C6UGRZVNqD5rdd7e0v/zBNNEkNx+0HTFf+YkLryT831gKIroHooQqH9D3Z2SUn2LJb5EZ59tKc8hUMAVbBVwMsX+wPDKxYuesPn1Fzq+XGttGWb2743b5JIukzudSHS1vtJjxF0r9DYvHRbOSrhuZ5t9tUkG+kZUnFp3ieui8F6Ld69gGWH/DOkNKdBNDozn4J9vTgcuzxmQDtJtk87tMR9/i/X9MBNHBK8M2fssZorSGKMlOpLO5m3gaOoDv4a/ikby95echZEJkOLMGq97bIY+KSeyUY3cvZB6e/otOx3bfuN2i+izug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3qwXdEIF8uKCtqTYXevrgBYB5Lp9kuna94xh77u8Xs=;
 b=BtC3F8x6GeTkMbi870mkNea4plxl/wjBxycK4lghKStI4QXGH3Z9l05BoCTZBeri7Kzyb8BsuRFkcJHHX5TdCt28anCH7ENG3KGmWVeetszmr22T2zleTpBSMNkdlAJJbdVn0xnOfugo/ag+llOqRKPc3sNS7lUoRv7GO4b53Qz4+nnhkfjypOfMuodt8p1wVv+csvY3BaXfbyYxO2PQNCbvkiY1CTxGzgxt8J1fcBYwNGUgTvlSpxy7OGipJz/nLPMS6GZmHU/6jCpJXltYS5sKOglpEkqlGwnNR9LXLIPK51Itx2nb8wTNshQ5i/6SnHtdKESujqtDEOHLqCtCIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by DU4PR04MB10792.eurprd04.prod.outlook.com (2603:10a6:10:58e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 03:22:27 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 03:22:26 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Wed, 19 Nov 2025 11:22:40 +0800
Subject: [PATCH v2 2/2] arm64: dts: add off-on-delay-us for usdhc2
 regulator
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-dts-imx8qm-v2-2-2579434f95cb@nxp.com>
References: <20251119-dts-imx8qm-v2-0-2579434f95cb@nxp.com>
In-Reply-To: <20251119-dts-imx8qm-v2-0-2579434f95cb@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763522589; l=1174;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=7syRsZJLe4mqC1PhgPa6pqhjxc+HY2hXRuQHrDvVdds=;
 b=kc/CUkLg1z7bEUOc4nzucQbfpsm6737sTcPuIssd81cOHvM9eHAD13pdk4GpW6eyYPwZLnhlS
 l/N/RnrXwCDBdHb4+rEc7SNlhxrLsst6jUjoTlPP9QjLsXFoZQfGlB5
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR06CA0231.apcprd06.prod.outlook.com
 (2603:1096:4:ac::15) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|DU4PR04MB10792:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4669c2-b03e-4441-8fc7-08de271ada7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWRkdFQ5VnFaOUI0SlUyajN4NlZ0bmJmcC82bEw1cUp4SkIzcHZVcndicFIv?=
 =?utf-8?B?WUNiZ1RIZ0hvdENJNzFyMVMzS0wrVkVDUkltRkowRERZYmZlbkZkdGxPankx?=
 =?utf-8?B?WnVJbWMvRkREUTQ4QUYwNC9UdFJQRXBYRGFSSmFDelRwUHFSWDhPSWFYd3NJ?=
 =?utf-8?B?UmRlUFpjNUNLRWlzU0tLeGQ5ZlJzbkhOTi85aVA1dWRpbkZmRU5UNXJBb3Bm?=
 =?utf-8?B?bSswdHBvWUZIVXFZRHNCVnV0MEV1N1VGYm5RNmdlRFp3QTZmN0owdUFCVklk?=
 =?utf-8?B?Vmt6dy9UVEV1TlpEY3ZHUzFFUWF4cGR6UUg1S1A5d0tIcS9mL3FwckpUbm1T?=
 =?utf-8?B?R205MVNwL0pUSTVEUExnVktRRnBFSElLaGhsRXJqUVBzZ1c0SE40dFZndUlO?=
 =?utf-8?B?K0xlZ01oOEd3cy82NHNaT0M4dnpraUNMRnhTNTRWRUN4ZldqY2NJZklJRjda?=
 =?utf-8?B?QUZXTTZHdXhKQlpTU3VYZ3NLWXNpNGxOTnRyUERPZnh1eEFCZk5HNW5RTDdP?=
 =?utf-8?B?bGhzd0IrdGxTaXBLZER3NWVQSkpRdldRbnp0VUova1MxTUFZMmRHT2pBSTNv?=
 =?utf-8?B?TXNrYkpWRCtjMFdWNStuaSsxblB4K1E5M1ZzTG5NZUZ1blhZNlR0U1BkN2h5?=
 =?utf-8?B?b3hTcnMzM1EydU1kRGRmemZZWUlSZ0FHMm9Wc0lvZmpDWmxtVHUvZUhQdXZR?=
 =?utf-8?B?bmxaaUVxSnVQTWFyVXU4R3R0aTRXSWN0UlNnWSs0a3c3RW5xb3lPbHdWOHNL?=
 =?utf-8?B?bk8xK0FYSDBZZ0R4OENtbFFNbzl1ZGFXdDF3dk15Q1RnQ3pWVHBCb3hYSy9D?=
 =?utf-8?B?WGhCdzN2K05uM1cwN0IvcC9LYzZwZW1NVnZWenFheStKY1pURFZGa2FCc0NN?=
 =?utf-8?B?NDBucnlGa3B5c0RDVWVXYW1keXQ3MkJCSk5EeUN1d3FOZkw2RHVNRkREVCtJ?=
 =?utf-8?B?M2xQQXBRK0l3S0tZT3JDR1phcTNtR2hEdGxreFdqZ2UrSU1TRUFudWRDa3Vp?=
 =?utf-8?B?UUViM3BQV0hhVW9Xdm41ZE03UFpadWVSa3N5bHMvZkhCcEJxbUtNazhXWGJr?=
 =?utf-8?B?VkdHY1lza1A1R2x6YUZVNXljemZsVW92UkxlQjJSRmdXbG1WdkFvY3ZLdCty?=
 =?utf-8?B?N0I5eFB6WGo3eFZhQithNHp2OTJOLzBUQXVyUS9YbTBxZ29zMVF2ajNtaXV5?=
 =?utf-8?B?TUdBczRyZjN6eWczTElacWF5bHhRV21VdWtmMlJTVGk3Q3RCcFBjOHdOTmJh?=
 =?utf-8?B?Yzd5UG13SW04Z2N1Tk9uVlc5UU1yWXNtcGthM2Y3K1VJZTExQ25kVEpHdkxH?=
 =?utf-8?B?N242Tnk5ZTdkUCtKK2dQZDNmTHMyTXVRNmNRUjNaQWp5SU8xUXA2bHRMVFBD?=
 =?utf-8?B?Q1F5UGRuRzBPV0JYVG95LzNwcDdBMnYzWFY5QzVscmRnR2tBbklmRGtuRWtJ?=
 =?utf-8?B?STUyblNRQm1VWG10R2VDb1ZRVVNYNkxFbkpLays5SXR1NlYvb2pwMHdZYXo0?=
 =?utf-8?B?YmFPNm5uZnRaMDcvS2Q4dFpVc1B1RExHOVRDV2ttM0RkUXJnUUJnVWZMQmVR?=
 =?utf-8?B?RmpHQXh1OHczYlk3d3h6VmlYQ2k4RTFXcUpHS1hCTFR2SVlxem9vbU1HSkVB?=
 =?utf-8?B?d0JHOTlrK00raUpXN1hNdHFsMHhUV2Z6R0ZWVVcyOVo4MjZ0ZHdvQkdHQUhV?=
 =?utf-8?B?b3FzY09pUm1FT2syaGhXaW01cDdOQmdOQ01wSEs3YlhmS25BVnN3Q3FEendt?=
 =?utf-8?B?aEJYM0VWOXMzSEM0ZVo4bWU5VThnTndyMzdsUmxmRzVzWmtPYTZUcjUxNnlX?=
 =?utf-8?B?bFZEWnh1T0xLYitwbER6RTJZT2ZjejlOcHZqNDlBQXhmOHR6VFMxYnNQQVMv?=
 =?utf-8?B?S05IajZEZERhQy9yMmRmMm1SYjFKcVZZTVZ4Y1JCa0d1Y2ttOGcwUzRGQkFj?=
 =?utf-8?B?UG1TWEpYdXg1cGk2R0NLSHJBS2hQbEE3OS9TZVg2ZXRoZ3BNVUxHZmFBM09F?=
 =?utf-8?B?VFlVNkRMcVQxQ2NzSExTVEYxaTc2N3FKeTByWnEyUGlJelZVTXFQakowTW56?=
 =?utf-8?Q?1yq+NP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEFsbHpDamU4UnZmSTlOUWVKRERhUmVXRWc0WkJJRW1SaThlajFuVFphRnpB?=
 =?utf-8?B?dHExT0dXQ2RXd1VaWnRXaklhWWdqVzFnK25rWnNVTHp4U0ZUMHUxTXJxbE13?=
 =?utf-8?B?RlRHK3FWa25WY2x4NldqaFJSelUxckZPNzFXeEVmUlBPVnN6c0d1TDJ6WUlR?=
 =?utf-8?B?YzNlcit2Szgrd3R2TjVkUlR0bGNtYVlKNjJGOE5PSE0vQitQVzdreEVOVWlr?=
 =?utf-8?B?aGFrb2xvaXpQcFZVeS8yY3Jkay9rME43bFBKd2ZFbEUwZXh4TVZiYXVwSHZS?=
 =?utf-8?B?dXVTTnBZU0FBSit2WSttN0hDL3RNclJodVp6b2tlQm5Rc1VieUt3elVISEJq?=
 =?utf-8?B?NWRtcTQrOHg5SVAra3AzeGpPSy9FNjJURFV5b0hxRm4wKzhXdlJjSHVEMlp4?=
 =?utf-8?B?d2hyRjFmOEg1YXpNWU8wQU9HenhqLzZYNERwQS9SZTdvTllCR2FodHJaUDg0?=
 =?utf-8?B?T0tLVjd3cmkwQ1VkN0J5N2N2MEJ1dUJ1UWhaemppaittcFpLVnd3VklzZS90?=
 =?utf-8?B?cUJPdE9OSlViSlNHY1Bqd2U3Q09ST1NWYmtmTU5BdysxOXhpc2pHc0JxbzFF?=
 =?utf-8?B?TEFCZ0JXRUoxVEVqWkEva2NObWFOUVczS0Fpc05HYjU4Q2JxdkxacUpzYzFS?=
 =?utf-8?B?TEp1Vi92dWVYZDBITERUNk15WjV0TEx2UzhML0gxTDc2MHpsUC93cWFZZ2hQ?=
 =?utf-8?B?SzVJcGpDYmV6MlRuYkVVUGU1eUVuTGxwOXdidGVBWDl4MzlmNWNxNURXUGcy?=
 =?utf-8?B?bitVMHpEcTJKY0RFYU9Td2pseEU3YVdCSXB4Smw2VFhiODVuUkJ0OXR1eTVu?=
 =?utf-8?B?eTZaUVNKN3JmOEhhcXV5eEhOSGdDTm1LR01VU2Z2N1RsTG5yTXp3M1dlZXJ3?=
 =?utf-8?B?eFBQaFAxa1crOUtqeTh6U3hRSmhWbDMycXQwN2I2WTA4Y2lOVWxZRnRYaFN0?=
 =?utf-8?B?Sy9RNDcyTDhMS1M3ZnQxVlQyZlFxVzRwSld1VzJocnNWc0Q0ZTJLbVJxaDNY?=
 =?utf-8?B?QXhveThvUWNmRjV2NDBrRC8vUjFMU2pNZ0t3RnRoQWdVNWVnMmFhR05wM0hV?=
 =?utf-8?B?UnRrRU1md044UGhXWmwzc2RrK29oaStUallyMG9zRi9GYnl2amhTaGlzQUMr?=
 =?utf-8?B?bmRlbUFLbmx5bGVMRWxLSkliMEt6d3ZlTjJXOXUwdlJISXZFaTkrUWE3aFI2?=
 =?utf-8?B?Um13aWliWDB3TTk3OWFONHVzYnBNQzdrQnlER2lPTmp5YVNkZWF2bENNTlRm?=
 =?utf-8?B?ZUQ5STJHSHBEY1BSNjlSZWhCZTRWQzVacEdJdWJ4ZTQwZDRzVkFENmtyU2wr?=
 =?utf-8?B?N1dYYUZpVFdXZ2FBSkhXZkt0N0d5RXRFVXZtU1BIOGRYOEJEL2lDOUpmZ3hr?=
 =?utf-8?B?T2JLWkdYZ3hpaVdGZHFtRDVmcWFHb1J5SUJ5WHl0WGVScW5PVVEvZmJ5MlRV?=
 =?utf-8?B?S3RrdjREYjgvb2dTcndaOWxqY3B0UktacWM5dzJ0WGtqZ0VHaWhnUFFseDNh?=
 =?utf-8?B?RC9hdTBjRXJXdVFxTldhZk9aZGxmT0Z4RVE4aUJCeUE3WDd2bUNrRGVCY2J0?=
 =?utf-8?B?UXBjRXZoeHpveHpmRWZVcFdIbXFKa0Q4SG91cGoydTJOZmJlT3hrMkZBR05n?=
 =?utf-8?B?VkNYMDBJa1NsN09vZ2FHT2ZEUGRvVTlibU1MQjdXbGpoQk4vZER4bE4vTUtz?=
 =?utf-8?B?R0syMWRQb0cvT2NReHZIQVc4NVBvZlRjUmQ4U2puN1Z1bm81V1dSb2VBb0M3?=
 =?utf-8?B?bGRxOUVhWGhBaXNncTl5VFduakpoems4TVVpamlGS1prWFJUa1QyUXNxVTFm?=
 =?utf-8?B?alBQbW5pNERRSEozVVpVMEROOU4vQ3JURU1mb0JXVmNLMHhsYlU1REJCc21x?=
 =?utf-8?B?L0crc20rM1oyd3B2b1QxUU5DL0Qvd3pCQXd4Q3Z3SGh6MDZoS1YxTWRISUho?=
 =?utf-8?B?cHR5RmxnZEh0OFJ5Tit3V21udHVaTUp2cGtva1p6WDJrR2piRzM0VSsvY25N?=
 =?utf-8?B?bTgzcVpvR1VxN2hVWTg5V0tHRTFrYUFIUjdOemRCaWdtZlhsVU4xWUFuSmgv?=
 =?utf-8?B?YXJzeDF2Qy9HWVpnN3VPU2IwNlpoOVhIYy84RFpMbU9weGdpTlVucEhMU3Nr?=
 =?utf-8?Q?fEkrEuKsxSNRUPYdTWFelKoZu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4669c2-b03e-4441-8fc7-08de271ada7d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 03:22:25.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKsS9zswMWYFkB36eM6r0WQnIQcRYsnJHbmLlVKqck7lmmPyJDMwoc68yQzJcZvfD6mOTkvqg+clMfCVJL7XjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10792

For SD card, according to the spec requirement, for sd card power reset
operation, it need sd card supply voltage to be lower than 0.5v and keep
over 1ms, otherwise, next time power back the sd card supply voltage to
3.3v, sd card can't support SD3.0 mode again.

To match such requirement on imx8qm-mek board, add 4.8ms delay between
sd power off and power on.

Fixes: 307fd14d4b14 ("arm64: dts: imx: add imx8qm mek support")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 667ba2fea8678215c611dc0ca19e8fbc397f9273..f1b0563d3a09044dda30627a62de5707b53f021a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -263,6 +263,7 @@ reg_usdhc2_vmmc: usdhc2-vmmc {
 		regulator-max-microvolt = <3000000>;
 		gpio = <&lsio_gpio4 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		off-on-delay-us = <4800>;
 	};
 
 	reg_audio: regulator-audio {

-- 
2.34.1

