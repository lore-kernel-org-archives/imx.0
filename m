Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010061.outbound.protection.outlook.com [52.101.69.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE77231D735
	for <imx@lists.linux.dev>; Mon, 22 Dec 2025 01:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766367782; cv=fail; b=RkYAfswdinKFDUlGRNVf2er5fwZuO+CSrO16Okk57BI3qhC5yhQ9Fgp8Qs+HnIWBaDPIkj/bcosAPVt2678Zk0SJXGaTA4dI0jheTODcevXCz1asvOmrxHvjPGrm0q6MXSKCqTFVhoTuJd3S/a8ymKpERunbwYgDw9LXK90+2bQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766367782; c=relaxed/simple;
	bh=5Y/Zx7Ye+z3UkUAyRZORKhV+ohWPiv+x4WhIhTHbu5s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=smJWv0bH9fpRkRtYwOs9X6kkgy4Umy8TZsfGzuPmlKUBu867paOXiqBHWsWwz7VXGOEg+0DXsy3ejzvdV21zBW2prq8Mnah98s7n0d+P1GjRukxGeFYFVSbsNDo0ugJQnO3ZFuvYpw4BM00yDmgI0A89ZtpiPWObZ2ooXjIsmQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k35H5Dvd; arc=fail smtp.client-ip=52.101.69.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k35H5Dvd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlSuV7Brzfg2hnStRsusjhr/gLvzzCrnJfYwSUJ9lrQvx9dAYvcm0iixz/YxHISZ2AZArhDInUcMd8jGXCFoYlMgo3uXfIPyL2L6ydcLyHDraTCDsnboK6RNdjMbjVH37oZAuBGrZTbxbyIzj84V43UweSbPRDDeoEHodtjMENif+sL5T6bMhRrkBNz1YkD5iJMnuO8szWzmy9ewEx+TkU8bwLFVQoCmbBsb0ovgmUo8Gvt8fAiaIc4Vppl/bZ5oq1/WO9s6KmvmioeUGrLd5xhMiWgWGzrhdKDUf6+hgRjPfEyKcS908hJpzvBqUaiLAlKGQmboo9USqb5fD3o80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP4smW54yMoZBCN6Ka+RNK7R5G89rUAzU1ac2NggJm4=;
 b=SSmDw543OT8Rq2FedMS8OLwe9z+cWLL82+LWfR45FcczerXSnzEFIb4+D7m4Hcrz7a2eAAUQ6vjSj6TS0hzYIxZnAQmcqGLgeC0YOewl2/AP3zieqJWvgWp0LMLBHZwmWkWMYbarLn78ymAH5t78L1g923T10fecMY8Mf+FfwiNXo1uHWCY/UmnSRmw8OEzTa21+ovPn99dkKPqs9r/KGIJfU4i1PEXVXX6l7UDb2dK1J3uuz1VfRWuo2Gxdn36FjzfNfyB5evJEf+FWx8kOpvqf2wiohry1//N3ATJlV2XXsGVgiW2n7h/H24MDmzItHF2+p83z73h+iT6QEo6YEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP4smW54yMoZBCN6Ka+RNK7R5G89rUAzU1ac2NggJm4=;
 b=k35H5DvdXicQl6hRGJX0lczPI8gZ9YGyqCABRjrRWNxC6rClO2GQZHDhJ8D0jdOgYK3omiy0ZfaNa1QBZwXbuzqANk42rASUqRekqQyGCvjMBAsUaCbLBP6Qb2AKOpSsshEbmM2nolLHZ9E3CYP591sXIO44Qvs49uU2Y4/w2b9webHHI8WeIpLFLURngXxjXbQhKjX2BuCk7u6i1ke+Wz4Ks7BUzDJBIPAkvQot1aPYlvGJxxXeJTksaHP3dSXlCYDUXEEERU4x2UbiN3gtQLcVlQ6HeJAkB5AoVXdbJ1wfqTJgUutAbSM2Uj0e14RE6YLGLggcFjm4+sIL9pECKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB11457.eurprd04.prod.outlook.com (2603:10a6:10:5ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 01:42:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 01:42:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 22 Dec 2025 09:42:16 +0800
Subject: [PATCH v2 3/3] arm64: dts: freescale: Add i.MX952 EVK basic device
 tree
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-imx952-v1-v2-3-8793ec8bad6e@nxp.com>
References: <20251222-imx952-v1-v2-0-8793ec8bad6e@nxp.com>
In-Reply-To: <20251222-imx952-v1-v2-0-8793ec8bad6e@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB11457:EE_
X-MS-Office365-Filtering-Correlation-Id: cb6e1729-9d26-41f2-5d21-08de40fb6c3c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGlrcGkzbHNNNDk1MHRGUmowaFplTk9mQzFxUjhGVGhHRTFGbFlJblJwUVpO?=
 =?utf-8?B?dVlCaThiZm1aQ2ovOFBhZmV5MmRQUGJHNVpzU2hXK0JtWHJ4c3d0T2gyd0Ni?=
 =?utf-8?B?b0NNSzFJWnpnL1FzaXJtMkYxbG1GSFZTcTZuL3RYWUJxOTQyUVorejNDUm83?=
 =?utf-8?B?MWx3dHk5a2pYUGdyNTFQdXVUWVJOZXFYc3pGUmhKVUVsaTlibi83SG5FQ3Ro?=
 =?utf-8?B?aHdHNVJrRWRTd2sxejF2VnhoTEZ0Q3U4Slg3RDVJUDZMc2M1UWV1NW82akNR?=
 =?utf-8?B?dDZFMEgvU3U5L0VNQndPME1JamlVVG9oUkI2TEVxaC9YN3F4MjVoMzZINGE1?=
 =?utf-8?B?NE5KbG5wVGtJclZyejdvcUhhOFNVYXovQmQ3NUZlNU5ldW9HRzVsMWMrMDJI?=
 =?utf-8?B?UCtEV0xFZDFJbURBOGd5TDAyQkJMYU43eWVZMm53ajI4SERLeDRjUGZ3WkQz?=
 =?utf-8?B?Rmtwb0JHbmdJenAwd2NmYkk5TWhVRWNNU1crNVU0bWdKcXZXSWVLSE1DMnha?=
 =?utf-8?B?QnUvZ05lamlZTmg1UHhBMGIyRWhwM2hxS0g4TDJ6Rk9YdkJ6SmoyWWNmUEhi?=
 =?utf-8?B?VVpsbUtZS29GUTJTbGJRcnoxNHdoeDF2dG05MmprZTBRdmNNMUphSGZCb04v?=
 =?utf-8?B?T2Z3RXNjQmd3b0pXUFJEaEwyTGszUnQvNkNuamlZZFlNREJrTHh6TFczSkdu?=
 =?utf-8?B?Wkw2bXo2K21rV2hiR2RMR1FaanF1SW5HMzZ0ZjZvSXdCTWM3QnF1YTRYWndp?=
 =?utf-8?B?R0I0a2F0YUFyWjBnb0pZNW1sekZKeHRtN0crVGh4dzNDVFU4NytsbDB5WWJq?=
 =?utf-8?B?TG1NNmprZkI1T2VIYkFpcktMYklDQWgwanl4YXFYSDhDOHVCRkN0N0x6WXRY?=
 =?utf-8?B?aDFYbXNwSkN6bEVTekI0YjluQjNibElBVDFDTHRkdGttV21IbEZ5Rk9LOVoy?=
 =?utf-8?B?L0NVeVg5ckU3M2hodzZIalJ3MWU2c1Zac1l2cVRoM0Q2ZmZCU3lSd0VNWGpl?=
 =?utf-8?B?aFhRNVRjemZlbldDc0RIMlplZUpNOHZ1SmxoTHVyZXMyZEhvRmdwOURBVW9o?=
 =?utf-8?B?cGtBS2pnNlVSdkFWVmdLbGd4UExJQko5T2hiWTdmWEpQOEpDU3cremlqb2xS?=
 =?utf-8?B?WkFrNzNuanptQ3lCOXgrWEZqNmIzWkJEVVpBTDZRZFZ5SjhORm00eUNEL0xE?=
 =?utf-8?B?ckMrL0liMlMvU3VEZzVaTHM1RHRpdEUydy9lN0J6cUJJNVJkUTdJT01FcS83?=
 =?utf-8?B?K1ZqZlZ3V1hkdEgwcTg5WjVHYUhZSW95dUh2bGVTdzVGQWpvNEQ2eXJ6dDJR?=
 =?utf-8?B?SkNZc1lUdkovbDBmNTN4OW94Y1NjcGJNNm4ya1lRRnV1VGsxQUdldjVoUkF2?=
 =?utf-8?B?K0V5dnhjT0kxbHU5TVpRdUoySHowR1BQdnNWNzIwYXdlM2V3YXBENnUxVC8w?=
 =?utf-8?B?cm05d3lHU2hHQjdBZHlDTjgvY3VyZlo0bFpSQjdVNWtKbmNTQWg5YlFRb2xx?=
 =?utf-8?B?anRiYy9RMFNQMi9Rb2wzOGdrUW9qeUlnYUNIcGtYdzlQR05JcVVtZjFpaDAz?=
 =?utf-8?B?K3o3Q2k0azV1ZTQwT1JNU1BCYkxvSzFvTjYrTGViOVFsZklMZkd3Z09CNGl6?=
 =?utf-8?B?TVI4UlhrMWs1dWdYYmJHOEFFSFE4aE5RZm40OWUvOFVkWVRWUVFod3UrQjZG?=
 =?utf-8?B?WlRzaUZjdmE4dWZiY0dHdHM1QlBwSlF0dkNjOWNCNW1ta1ZGc2kvWTBES2Zz?=
 =?utf-8?B?ckFBdTEyMzBEODRjV3lsbVNOWTRlNmNwdnJJYlkyUkpPaTMyN1ZxTE13WFhr?=
 =?utf-8?B?bm5RRllhQmJSN3BRSHpjbm1KS0V5UmN1REdrYTcxSkkwek5jNDlkL3JQYlBL?=
 =?utf-8?B?b0RKektsaTZPUkNRcjI0UHdoaTJRc2hmRGZyQ3hjQzcxVHZ4L1JFYWZqU2x0?=
 =?utf-8?B?UmFqN1VjN2tjQ0NlMzhaTVVkKzJwZFhGYlhxZDI0UDBZRU44SHdSeXpEMm51?=
 =?utf-8?B?bUp4ZlJrUVVXQ05jSFRkNUkzR1FwNFFBbS9NN0ZWYys3b29NbWh1a2JIb05S?=
 =?utf-8?Q?jzf/d1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0N4NzFDeE5MbVJmdGc3YXl5TFFEcEk4NUg5dlM3NnIzaDh3bFhzRnc5ZGNa?=
 =?utf-8?B?NG5hcC9oMzJRVDl2bjc1ZklaVCtXbFpwMVNRaDM4MEZPOXJaSVhSQ0pMWEp0?=
 =?utf-8?B?VkpsZFhrWVhjRFdqaVBTcXVPcWhlTDZsL0k2VVUzdUJZdnR1eGxHcXl2c245?=
 =?utf-8?B?QlNoUmxvZ0FFWEF4ZUswMUgyZ3dRQUhLY0dnOE44TWcrYUwweCtweEQzWHBD?=
 =?utf-8?B?RkppWjNQaDJDL0duN0ZBVHV4YnJncXUzSkxoQ0wwRkh1Wkp0QnZaZStLV0pW?=
 =?utf-8?B?eGRaTS91ZGpaMVJMYTR2YmxWOGg4b0Z4VnhncTgvc2xLdTJmQk5MWVo5OEJG?=
 =?utf-8?B?L2hFREthUkZRSjZjOVl1b1ZFeUdzNTJNRjFYTXJwckNldmY0ZGJ2T25VdWFI?=
 =?utf-8?B?K3B4czVZeEFNQ3FPOFVCTkNHdnNzaUN0amI3Nk1uaVdKcVRqZWw1bjNZWUZX?=
 =?utf-8?B?OUpEcW1pcUozYURHZHU4cUt0RFEvaFJpVi9Cemtwc1duVi9JaGwyN3Fyc2xL?=
 =?utf-8?B?TllsYkhzWXdFMXN1TnIxbWd4YmNzNVJaRHN3bXJuNHFGZ3lkeUdaT2JYTXU2?=
 =?utf-8?B?NHgvK3Q3Y3FOMks1M1NiVXg4WkdpdzNsQzhHNHBQOWtISW52SkJkbVNCR1Bt?=
 =?utf-8?B?ZHdDT2J1VWZJdnFpa2RGVTlNY05KRWVISllWMm9NcFRlRkZhTVoxand1WVQv?=
 =?utf-8?B?Y1VZRFJ2Y1dZU2xWOFBybTljZXljbHFHRDRmZFZzYUhybC94aGlUK1Bvdk5R?=
 =?utf-8?B?VDJVMTgwVjJuL29RdCtuV1MrMk9Oc281TWhuZ2Q3ZnhjTGlHN1NKVGZGZnBS?=
 =?utf-8?B?UTdQNFptd1Evc1ZhUVFCemtIa0ZXOWp6NWdQMWNZQWVWQ3pMVlRPenBqaDBa?=
 =?utf-8?B?R1QzaEVsbUxkYTkzT1JlaVpIbWoyaEc3djhJaW9NaXBZa3N1YTIyd0NjT3JE?=
 =?utf-8?B?TlN3bGNzOGNHOTZzbmRUY1VLNU9BZWJFdDFSRnlxUE1DSVoxREtsMEZlM3BJ?=
 =?utf-8?B?ZGFqUHJ3Vlp1MXQ5R2c1cWpZNmU3b29GR1ZvU2dwL3pWUzk2bTRKc3VkOXpQ?=
 =?utf-8?B?d3ZWdFh5MktwM1R1RzRIQXlRNWY4Z0VKT1NSdUxqSUlKdSsvVVBMS2pGUlZV?=
 =?utf-8?B?aGpGbXJhZmR1Z3RpTy9YckVjNzBHVlpHZngyMGVlbkZIdktubjJQUWhvK1JD?=
 =?utf-8?B?ZkhJREswQ1l0bUt4dVNNVXRUeWdWdHEyZlQyRnNmVVBlK1lneHQ2WjdlVFhV?=
 =?utf-8?B?bThubE1OWnpxK1pDQ2gyV0Q3UE84ZWR2OENVb2pQRVFyYVVHbWVNWW1kR3Ir?=
 =?utf-8?B?YTU0M0R3UGl2NFA3SWRqSzlrOWVMdDZML2VPU1NvVlJXUTV1ZHRqMkR0OXRv?=
 =?utf-8?B?dVZxQmtORUEzbHA4VWduVVU0SXYrUDRCTlFNUmszV3NWSE9RY3BoTllHVXYz?=
 =?utf-8?B?TDBQWnd5RFZIRW96MUZsUDlCU1JGT2RqL0dDZ25NNElKbERONkJZRUZud0xR?=
 =?utf-8?B?MERDZFlsYUdVNUZvZDlIVXRGZ2xkNzkxNW5yR1VQeUZLMHlFTE9uNkpYVUIr?=
 =?utf-8?B?U3JvUFhzRStFRzF0aW9TS1loRmpEdzBQaGZxTldNaDdTdms3NW4xTXJ2WEUr?=
 =?utf-8?B?eURmbWtRa3NoZE9ubGdQcTN3MUhTSGpOaHFyY0tuSUdMQzhCOG1WYlkwWFFU?=
 =?utf-8?B?MCt1RTI0RGI1UmxyODB5MkFXZ2Q2OHZEWHdkVEVaTXBldTZkZkxCcnB0Y1l2?=
 =?utf-8?B?czZFOEVYSmtsT0FMZ3ViOVVNUkRGUHlZMytLWHptSU9PSFVNQnFvNXZnR2tX?=
 =?utf-8?B?Z0VTTlZuZlIwTURrUEl2VjVGcGV1dEhOTExMTnU2MlFPa0R2RnN5WU01UEhX?=
 =?utf-8?B?N1BJOTlCZHJYdkRCTGVyNXVQUS9ieXdGaE16RVoxKzRaeERDUy9vbms2N0M5?=
 =?utf-8?B?NncwT0E1Vi9oQVRONWpSVHZ3WlB6aWhjM3pLYWlubng4d0xuSnZzMW13NjNq?=
 =?utf-8?B?d3RqdkZuVXN6OEJ4OWxVa05sS3F4c28xNGt3eFJmKzZGU0ViYnZWUllVSnF0?=
 =?utf-8?B?VVE5VlRPeE9pWTBNbEw0SkNqWFp2MVFUQkNpQzhlMjFNVm5nVU1XZ2dkbUxj?=
 =?utf-8?B?UnRaWE8wWFJOR09sLzViOHNrNDJaTFFIZnFEUmgyOEJzamF1c1FnUDVaaFpN?=
 =?utf-8?B?QU8wa0RFelBBVHFXUFlVb25BcDBHdnJNT2ZhYXBoSGRscVFwakZoRmNZNWtV?=
 =?utf-8?B?dUZIZWhuNEtaZmJpUzJDMUhCTlNJREJFK1NDQU9uNEEzcDM0Wks4SktKakNF?=
 =?utf-8?B?cUN2K1NoRlIwWGlOeVpsR2RGdUhtL2JnMko1VzdTd2JydnlPUGlOQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6e1729-9d26-41f2-5d21-08de40fb6c3c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 01:42:53.2645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgaWKcOMTF0HAZVPxjENBPd66jePNKS4Hgq2lkmAhw6dD6f+u2fcDqOTXUx/yjat7rG2+roBDwOal1LEYI5xgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11457

From: Peng Fan <peng.fan@nxp.com>

Add i.MX952 EVK basic device tree, with UART1, SDHC[1,2] supported.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |   2 +
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 217 +++++++++++++++++++++++++++
 2 files changed, 219 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0ce6b38f7bef10e3970ac34f70f4a..05d8ccd89186478ad4310f56a02783b51034f839 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -414,6 +414,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx952-evk.dtb
+
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 imx8mm-kontron-bl-lte-dtbs		:= imx8mm-kontron-bl.dtb imx8mm-kontron-bl-lte.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
new file mode 100644
index 0000000000000000000000000000000000000000..2c753fcbae3c5d545f5d835bd70492667061d626
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx952.dtsi"
+
+/ {
+	model = "NXP i.MX952 EVK board";
+	compatible = "fsl,imx952-evk", "fsl,imx952";
+
+	aliases {
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		gpio4 = &gpio5;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux_cma: linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x7f000000>;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+			reusable;
+		};
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_SW";
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "+V1.8_SW";
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VDD_SD2_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <12000>;
+	};
+};
+
+&lpuart1 {
+	/* console */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7	0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX952_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x31e
+			IMX952_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX952_PAD_SD1_CLK__WAKEUPMIX_TOP_USDHC1_CLK		0x158e
+			IMX952_PAD_SD1_CMD__WAKEUPMIX_TOP_USDHC1_CMD		0x138e
+			IMX952_PAD_SD1_DATA0__WAKEUPMIX_TOP_USDHC1_DATA0	0x138e
+			IMX952_PAD_SD1_DATA1__WAKEUPMIX_TOP_USDHC1_DATA1	0x138e
+			IMX952_PAD_SD1_DATA2__WAKEUPMIX_TOP_USDHC1_DATA2	0x138e
+			IMX952_PAD_SD1_DATA3__WAKEUPMIX_TOP_USDHC1_DATA3	0x138e
+			IMX952_PAD_SD1_DATA4__WAKEUPMIX_TOP_USDHC1_DATA4	0x138e
+			IMX952_PAD_SD1_DATA5__WAKEUPMIX_TOP_USDHC1_DATA5	0x138e
+			IMX952_PAD_SD1_DATA6__WAKEUPMIX_TOP_USDHC1_DATA6	0x138e
+			IMX952_PAD_SD1_DATA7__WAKEUPMIX_TOP_USDHC1_DATA7	0x138e
+			IMX952_PAD_SD1_STROBE__WAKEUPMIX_TOP_USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX952_PAD_SD1_CLK__WAKEUPMIX_TOP_USDHC1_CLK		0x158e
+			IMX952_PAD_SD1_CMD__WAKEUPMIX_TOP_USDHC1_CMD		0x138e
+			IMX952_PAD_SD1_DATA0__WAKEUPMIX_TOP_USDHC1_DATA0	0x138e
+			IMX952_PAD_SD1_DATA1__WAKEUPMIX_TOP_USDHC1_DATA1	0x138e
+			IMX952_PAD_SD1_DATA2__WAKEUPMIX_TOP_USDHC1_DATA2	0x138e
+			IMX952_PAD_SD1_DATA3__WAKEUPMIX_TOP_USDHC1_DATA3	0x138e
+			IMX952_PAD_SD1_DATA4__WAKEUPMIX_TOP_USDHC1_DATA4	0x138e
+			IMX952_PAD_SD1_DATA5__WAKEUPMIX_TOP_USDHC1_DATA5	0x138e
+			IMX952_PAD_SD1_DATA6__WAKEUPMIX_TOP_USDHC1_DATA6	0x138e
+			IMX952_PAD_SD1_DATA7__WAKEUPMIX_TOP_USDHC1_DATA7	0x138e
+			IMX952_PAD_SD1_STROBE__WAKEUPMIX_TOP_USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX952_PAD_SD1_CLK__WAKEUPMIX_TOP_USDHC1_CLK		0x15fe
+			IMX952_PAD_SD1_CMD__WAKEUPMIX_TOP_USDHC1_CMD		0x13fe
+			IMX952_PAD_SD1_DATA0__WAKEUPMIX_TOP_USDHC1_DATA0	0x13fe
+			IMX952_PAD_SD1_DATA1__WAKEUPMIX_TOP_USDHC1_DATA1	0x13fe
+			IMX952_PAD_SD1_DATA2__WAKEUPMIX_TOP_USDHC1_DATA2	0x13fe
+			IMX952_PAD_SD1_DATA3__WAKEUPMIX_TOP_USDHC1_DATA3	0x13fe
+			IMX952_PAD_SD1_DATA4__WAKEUPMIX_TOP_USDHC1_DATA4	0x13fe
+			IMX952_PAD_SD1_DATA5__WAKEUPMIX_TOP_USDHC1_DATA5	0x13fe
+			IMX952_PAD_SD1_DATA6__WAKEUPMIX_TOP_USDHC1_DATA6	0x13fe
+			IMX952_PAD_SD1_DATA7__WAKEUPMIX_TOP_USDHC1_DATA7	0x13fe
+			IMX952_PAD_SD1_STROBE__WAKEUPMIX_TOP_USDHC1_STROBE	0x15fe
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX952_PAD_SD2_CLK__WAKEUPMIX_TOP_USDHC2_CLK		0x158e
+			IMX952_PAD_SD2_CMD__WAKEUPMIX_TOP_USDHC2_CMD		0x138e
+			IMX952_PAD_SD2_DATA0__WAKEUPMIX_TOP_USDHC2_DATA0	0x138e
+			IMX952_PAD_SD2_DATA1__WAKEUPMIX_TOP_USDHC2_DATA1	0x138e
+			IMX952_PAD_SD2_DATA2__WAKEUPMIX_TOP_USDHC2_DATA2	0x138e
+			IMX952_PAD_SD2_DATA3__WAKEUPMIX_TOP_USDHC2_DATA3	0x138e
+			IMX952_PAD_SD2_VSELECT__WAKEUPMIX_TOP_USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX952_PAD_SD2_CLK__WAKEUPMIX_TOP_USDHC2_CLK		0x158e
+			IMX952_PAD_SD2_CMD__WAKEUPMIX_TOP_USDHC2_CMD		0x138e
+			IMX952_PAD_SD2_DATA0__WAKEUPMIX_TOP_USDHC2_DATA0	0x138e
+			IMX952_PAD_SD2_DATA1__WAKEUPMIX_TOP_USDHC2_DATA1	0x138e
+			IMX952_PAD_SD2_DATA2__WAKEUPMIX_TOP_USDHC2_DATA2	0x138e
+			IMX952_PAD_SD2_DATA3__WAKEUPMIX_TOP_USDHC2_DATA3	0x138e
+			IMX952_PAD_SD2_VSELECT__WAKEUPMIX_TOP_USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX952_PAD_SD2_CLK__WAKEUPMIX_TOP_USDHC2_CLK		0x158e
+			IMX952_PAD_SD2_CMD__WAKEUPMIX_TOP_USDHC2_CMD		0x138e
+			IMX952_PAD_SD2_DATA0__WAKEUPMIX_TOP_USDHC2_DATA0	0x138e
+			IMX952_PAD_SD2_DATA1__WAKEUPMIX_TOP_USDHC2_DATA1	0x138e
+			IMX952_PAD_SD2_DATA2__WAKEUPMIX_TOP_USDHC2_DATA2	0x138e
+			IMX952_PAD_SD2_DATA3__WAKEUPMIX_TOP_USDHC2_DATA3	0x138e
+			IMX952_PAD_SD2_VSELECT__WAKEUPMIX_TOP_USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX952_PAD_SD2_CD_B__WAKEUPMIX_TOP_GPIO3_IO_0		0x31e
+		>;
+	};
+};

-- 
2.37.1

