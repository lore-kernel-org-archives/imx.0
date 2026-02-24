Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE0530EF74
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 19:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771961842; cv=fail; b=EB4YjK4jIFUU9rYURHyJJHpUn872vKqbLQtDx2f0N0g1DnDK7MUoJVBw+WaDanZXyvbQS8s4LpqAsmlVdhXQchI5x/6FNNolos1WLRQmv14cdSPHey/rAmh6ZjmPFAhBUOj4vA1bnCD51fKXquodJv0YhT9je0tgGtqa7bZbiK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771961842; c=relaxed/simple;
	bh=BnBbuTxlDUuJeRdis8URp8VkqtMstqzPHPk3kM4bVas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZAcrZX3fL3ec+72HxZ1fe0snslbUyuqW8fcFpeKmmOsz5xvUha3agqsIf3+vZzQbvy8mr+3RBSSlW6HCot38QqnEGbTSUV1aIetPeAPGptu7avss/bDRmPFAYS7SVPLqUcDLEsDCG5f1e1MchnMvIPLoI0vX7mv6WAPFj1VH1nE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=arEhqpm/; arc=fail smtp.client-ip=52.101.70.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="arEhqpm/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQiMJd4oJHO9OEo4I4TAhgzhB+NYgXlqjl9ltSN0qwpyyzX85N+dzSAU8SnHrf7JVAIaHwnT6HlLgTppCdkAQ83AdGnTlog7TyDArPNIg7eklVPgMjPuzD6ci/49XRzp6D9Z1/PB/PXPsVhlI2Oi4+DJwy4MtMyzmQ+lQ1ope5MitGnDeHu3EjmgCjF8P3zEjlCoJMMUD5QsZAgX+5zLyPBirWJfArjjALEIQDS64xhy64d0zb+5BK6ZS+v6121SvlbiXej4np3DBpW6Ch7K1TgrdTBx2ondIRZiup0G8gmZN0ecmqStEkXh41Rdi7JUPxVrmOlRRyeMTHhadQJRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnBbuTxlDUuJeRdis8URp8VkqtMstqzPHPk3kM4bVas=;
 b=tSbMvMUnhrMuBq6h4zU7UCVUCueYaYO6M28FJE3zIbE3OeXv+81hqMbacn9xuwEtHgSO8L6o354vcx4b2oozFQIfLDTBC07RSuZZY0TElSctcrncp9Ax1LFWaNywK+A4Qbi17Y/ibDyKdmAkID2JsEnozxMgF1Ny5UcxGtEKZaNchv8Wv1pQVdjT32A+khDOgMCziWhtU9v4sa9L9ssCiZfYL6ew8t2EJrZDG6cWJYdass5RZb+GA5DfdSIx5EhxLV89kif1rAXgYt/0wphQqBHRBsbmJX9TBDLF4RwFogK9c7/hJjFqJoJiXmq6/fIjA2NVaRYf0NMo66Ps9QvQ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnBbuTxlDUuJeRdis8URp8VkqtMstqzPHPk3kM4bVas=;
 b=arEhqpm/CImkBe5U3ckVqywlT1jnV5VZ+fU+kbiV0W1tOV29X2D97ZPx9hKD9Z67xaXkfhj6ZsbKri8lYmKwyJYul5bOe165M0FYpF8BaevBhzMT0HBbVp4bn0e9zupaUZmJen2T+MKXByF7x0zkPkFCaiSrp2Z7SGQKHywNxwzxlQ/xftFYoCrQj0QKTBZTiK1II3cmsjXlTvBVD2oNN/Q+5JMo1b+AVCLsMBiJnY9zMgMqo3jjQFf89haYGA0rBtPVnjHb1I3bKFgkkCfBFBLMyXUlaTK1bQ5V3JalCwUnUuYfdSbeXxs2YTDNQ/MqZ7ukohGIGewWzQ2deGsssg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10283.eurprd04.prod.outlook.com (2603:10a6:102:463::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 19:37:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 19:37:18 +0000
From: Frank Li <Frank.Li@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	laurentiu.mihalcea@nxp.com,
	daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] bus: imx-aipstz: set default value for opacr registers
Date: Tue, 24 Feb 2026 14:36:54 -0500
Message-ID: <177196179969.3201168.11433129813346211117.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126091156.951052-1-shengjiu.wang@nxp.com>
References: <20260126091156.951052-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10283:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8f6cc0-b2e5-49a5-a2b2-08de73dc1e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2UvQ0tlTGNER1U3cG9Fdk5ydlJTc3lmSEdEQkRTY0x2UzBiWFVMdG9Ra3hS?=
 =?utf-8?B?aG5FK3I0QnRWQXVvVEpDUnp2RlNTUnVIT3dOUzNJbS9sbVZMUlFPTDlGUEFS?=
 =?utf-8?B?Q2pqRkx0ZWx3dnFZZU01K21uZDhXN1doTExUK0I2ak1UWktyK0lXN1NLZ0FU?=
 =?utf-8?B?N3h1djVqWEhDMEFlSUV0aGJtQ01jZW9laTNxQlpKejVoM2d5N1duR1prZzFD?=
 =?utf-8?B?Yk9lWWxQelJ2VkFDYlprb2xxRHJRaUdKNkplU3dsck1TN1dKQXBZMEZDdVVF?=
 =?utf-8?B?L1VaQmlZNE5QcUtpTXIraU5SYUJIc1ZFdlBOZlVEdjF0ZkJMOWE2S2xkdG03?=
 =?utf-8?B?MlE3dXFTM0tWWHlYWGFweU94UzJpcnNxK0ZIM2J1VmNuQWNvT3VBeDVEdHl3?=
 =?utf-8?B?YzFrcjd4UHpzSnlYNk5uWjBBbVR2UG5aa1NBazA2NEhYeWUxM2h0OWpHZ05k?=
 =?utf-8?B?ZHNhbExsditFWUppMFV4dFcxU1Y3N2liZHBNQWhDbC9POVBxVkQyYmF3ZXB3?=
 =?utf-8?B?VWp4QW1WWnNRNjAxZ1F2RW1QeVFXSkV6bGFzMU9JTXFvUW5CMDBxeE5ZUVlN?=
 =?utf-8?B?UGQxTE9UNFZ3Y1ExUE93b24wczVBV1VYYllBdlVFUUFTdHZqYXNOT0dHZFFD?=
 =?utf-8?B?WWljeldOR3ZHYnc3RzVRaTJlSm00bEI1M29Od3Q2eUFjVkd6aXpUdGJiZGpK?=
 =?utf-8?B?YjdrTmx1R05YVC9MVTdHWTJFRVB5dElROTA3SHV5TjR0RlpwNWIrcWEzSlJU?=
 =?utf-8?B?M2N2V0RoQmlteUlsQlF1Z0xEbGI4ZmJxZW1oVUg4cjJGMTdVT2Vwd1NNcFVL?=
 =?utf-8?B?OHNjVWRiREtoMkRSN2RUdFNZWlArWDlHR0l2Q0x1YXNwL3gxM3lDRjFKMWdw?=
 =?utf-8?B?M1dNTlNwblRGUlY0K2kyNXhPRXlOZ2VjSDdZOGxLOHZ2NnJsaEExY1ptRzcz?=
 =?utf-8?B?QkNsbHdsOXZGUGFWcnRNWTRBSEs0V0hUSmE5V0ZLQjdSTktXc0hiTU44Vys4?=
 =?utf-8?B?Qms3WlV6a1dIU1FkZGlnMHN2c0U3RkdKelQ3eFNEREhxUnVId2ZMaS9ib2R5?=
 =?utf-8?B?d1J4b1haNVpWSWZZMkhUMFc0ZDNrbTdlOUkxQlRoR0NTdEszV25KVm1kSm55?=
 =?utf-8?B?T3hFb3JTVk9Xb0pwTExHMEQ0d1BqTXNKYTBYb3lRaEtxQ0tEcCsvK1NYM0dF?=
 =?utf-8?B?eUtaM1JzNkRKZ2FOSUY4SmN1T2pBakRsTmtCNzRPclpmclRhU1g3L1FzdzRX?=
 =?utf-8?B?bUR3ZEFEQk4yWUJJL3pCeVcxaytCOXdiQ1pNem54OHpaMXJzTktlSndtdzBj?=
 =?utf-8?B?NzRnbi80dHhvL0dlNHkrRm9tQzRhYTh0aG54M3RqUU5YOGwxSExFNWpkSE5K?=
 =?utf-8?B?MG1rRWtueEFCL2ovLzBuWUp1eURFNmZadHJtMThUQk04eDRXTDlTa0NqdE5i?=
 =?utf-8?B?dVlmREgvZktXVVdadEUxTFhadG9xYlRIS1R3cTg4MzVUQ1BjMG5iL3p1Q2FF?=
 =?utf-8?B?RXdOR0ZLM21GNHpCUnpDaDdUb3F1WCtWVmF5ODArNnhRSVpNcldqOTFIUHhl?=
 =?utf-8?B?bHZUeE9RNjdaMmlGblViRGc3Tng3QTVlV3k2NUJrT0tzcVVQdlRqZzdNMXc1?=
 =?utf-8?B?d3Vtd1QrTGV2eGYrZVFRUzE5V0haNTVIVTNVT0lMODFoZVJ2UWw3QlBWQmxt?=
 =?utf-8?B?TFcrdkhVVzhWU0l1b0wzeXZqd2FTcG5wWVRtVnZRd2Z6dzFHMmNHZERsMFFR?=
 =?utf-8?B?SFVMN0J2OEZZSkpVYkROdFhBQUVacnNxeDlRVWkrQ0FyeEdjMTJYejhLV1Fy?=
 =?utf-8?B?TnQwNFlZNnB3TVVhS1lDRHBaYlBUYzlXZDByNmVEUUlJOHBpdytFc2RiSjMr?=
 =?utf-8?B?QU5FaVk0MmZJcG5sVEd2MFMyRUhZMjJYZ05CbHJvNDBYN1E3VEJCT2xlM0Fp?=
 =?utf-8?B?N0JydzhQZ1RERXhsUjIydklWbFZTMmhyczU1ZlRsb0FPMHB3MXZaMkU1RjJr?=
 =?utf-8?B?Um1HQmE2WjR0OWx0ZFZNYkFyVFJ2VDBpNnJNcHB1RnI1OVk4aXE5bUJMZ0ZI?=
 =?utf-8?B?VjFmOUNQU2NsTkQ5QnRtd3JmZ2VmLzdTYWZaUitEODFnY3JlNllxVExuTzBG?=
 =?utf-8?B?WlVDTTB1Y2RmNUduUllQVnRLWXArRkQvS3F4SEo0VUFIVWRaVWNGWTNMNzV0?=
 =?utf-8?Q?lOOYOjjiQ0fbF+M4hX9zXSY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDNXaEdpM3R6NmRHNVZQYWZaR3U4U1U2RTFRVEVzeE9zYVg1c05sZU5TSHdN?=
 =?utf-8?B?Tm5HbnJ1YzEyREJvREpjSGxuWk0yd3Y3Z3dMcUlhdW5kVHRIWnRIR01STUdn?=
 =?utf-8?B?bXppdHhTcXZXK1ZFamFrbjAzQ2ZUSlVQQmMxejVMRnBOdForSi9UQUEyZFZj?=
 =?utf-8?B?YytjQnp5VWp2dHpzcjBCbWtoVHlLeEF5UDFrOFlvWHJPNDk4VDVPQ3NtN3pN?=
 =?utf-8?B?b1NqUG1pT3QxNEpCZDNyU0I5Wm41YTRiR2x0TzBoVFJYOUllZkpZQmFmdnk5?=
 =?utf-8?B?Ti9mVWM3ZGM5eHJOdHIvK3Z0RHFZL3F2ZWpkTjRTSldubk9GTU1zaWJ1WFBv?=
 =?utf-8?B?V1dKTjhNc3hsWWpOeGFBOUNIdUw1NGszK0ozdkhXaENndXc5QVhJNW9LeStC?=
 =?utf-8?B?WU1WZGN3LzNUVytrTDRXL0lTOGpBcU00aEREZHZ5R3JZMkF5cVBZK251YU5Z?=
 =?utf-8?B?Z3pwajlIaTltenlIL0hsQTJmcUFiUXNwYzI3UkFMKzBwS1hydnVNaWEwRm9D?=
 =?utf-8?B?SC9HWnRoM2hmZGhRdzc4WElKTDdFemg4Q0tRYTNmSUpnQ0IxNUlWWkV0OWlQ?=
 =?utf-8?B?YWNPams1WjZaL001LzEzdDYrRGZ0dEhxMzlXYTAwUEF5V2RrdFJZVHp3Y0N6?=
 =?utf-8?B?VW5NRTJ3b1hLalI2bEl4ZTZsMGJyVzYra0Z3clRXVjdnL2Q1ZU1oRkRHZHp6?=
 =?utf-8?B?aHZhdGRpai8rZUhFdTlGOEVZWDZXdUU1ZW1aMFVhZ2RJdDhXZ21QL1NZeWN4?=
 =?utf-8?B?OG5VNnlYY2JrT29ubk5id0dkVXNGS3FtOTFGa3NuVHBJT3V0anhGUVEvMXJC?=
 =?utf-8?B?L0s4ZWJXaVYrallteW5xTEJnN0k4NTNlYVdqVXZNcWR2SDdmQXdhd2ZHenhO?=
 =?utf-8?B?eXJEaUhvRG1TdllTS1d5NnlVekhGZGp6cW9CeS9ZNjhRQWZ4Mk5SNjJyY2Fw?=
 =?utf-8?B?TXNQNVFuT3U4ZjI4ZTc5NExaOUR0Qmp1NzdLdzF6cVFvRnVRWEU2d2F5ejVn?=
 =?utf-8?B?M1Fpck1DcVljWlVtS3ErdWRBOGxLS0oraVhJZXpiMTZTU1VnMTZPWHdYUEdw?=
 =?utf-8?B?WGVFTlY2OVNNYTFWbVlQelh5QUx3a3BQZGh4SlIvaHVhMllJUmY0ZGhVZmpP?=
 =?utf-8?B?NE4yUk5MOU95TGF5eVl0YzY5ZTR0Qis1Zkh4bDNQOUpmSTcybk0vMm1BS3py?=
 =?utf-8?B?MmxDSE1ZeGhwVmJvTUNIanJ0R21OWk1HbGowTVhqd0xXYjZuVGJpWi9WK3hm?=
 =?utf-8?B?UmVIdVJQL2dtSm5zQW40U2VZMWdobmIzUWU1V2laU1dzU29DZE8rS3lkVTQz?=
 =?utf-8?B?V3lOSi80TGxFSDh1bzlVWGJkN1V4SzBobWxCUFFDSzk4NVk2SDExb3F3cnUw?=
 =?utf-8?B?OTluSGtJbFhSQjhPQW9oN3VJQm1GdXRhQ3lMKzJseUFnRTA0cHdFaG5vdnZN?=
 =?utf-8?B?c1N2clowSHdJMDltVGU3ZUxXS2JrL3lNMk1PZ1NjQUViaHFaR1MyQ21YclZN?=
 =?utf-8?B?UW9NdGtsQkpic0RZRFVUWitpKytRUUpoNGpJNlZzdTZ2cEFLZFhSMVlnenZQ?=
 =?utf-8?B?dGxxRUJZMkFUb0dPeEo3V0N2Mi9meUd2aDZJRDUxOEZ0UzJRUWFmMFBObE5G?=
 =?utf-8?B?bDRtSnk0OTgwZ25OaUFkV0lvV1pzNit3blZvcTJUNVh5NEVuQk5ubWdwRmVV?=
 =?utf-8?B?NDhtOXNTbk9qSVdKbDdIeHFPQms0bnh6THNMZ013amxFcEFLZ0NEYnUxOVFr?=
 =?utf-8?B?WW5XY1d6ZVFwdkV3R3RoZHNOTVBWTzFFRUxJQTBhOC9id1A2VHZFOUhCaGMy?=
 =?utf-8?B?WlVhMGw5SVlaWDU5UTFMNC9xcHFVVUl5Uit1K2hxQnJPL0lEZCswL3B6dmtZ?=
 =?utf-8?B?Y2hGbHlSM2RRcHY1ekhWTjVZdWFVZkJ1b0tGKzVHM1RMZ21CSGVLWFlBRk5Q?=
 =?utf-8?B?dk41TFJMUlBVMURKRktuanRvT3VVSkFtNUkxNDdzWXNOaHhwWXdLNE1CYTFV?=
 =?utf-8?B?MFI0ejJFUW5qQ1BzM2RydXBVU29oMlZnUzREbGkwb1lqemI0NVBPYUZaOVlv?=
 =?utf-8?B?VWxkQUxsN0NENVBkTGxRVlBxQ2c3SVMvZG5wZzhOL0tDVVRJS0lmdmFSUDcz?=
 =?utf-8?B?M1ZpWTEwVjRrSk1OcVNVZDdQVVQ5OWpGaE9WQllaL3pDb2t0QVhpaTV6VFNM?=
 =?utf-8?B?cmFHcjlVR3BJSDZ6ZU9FdEQ4ZzZzVE1GbHVEUjNLazM1L01JSjFzWEI5c2xi?=
 =?utf-8?B?ZTZRQW5DRFFPc2p5UERmS21zUlNZWEZvQXlEd0tONVgvcWNjZVVFeWEvV3FO?=
 =?utf-8?Q?tlOI0vjj0dFVZRLTWR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8f6cc0-b2e5-49a5-a2b2-08de73dc1e1d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 19:37:17.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlB83Yz2ZIhhAZTtaMdOutb28ZXhdBQ83a52G6PSyL+PvIh3ILCxAjOdb6UkQLaBkXS4cOqaZpaUUyYoKyeO1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10283


On Mon, 26 Jan 2026 17:11:56 +0800, Shengjiu Wang wrote:
> The sdma script app_2_mcu needs the permission to access the peripheral
> devices:
>
> 1) SDMA2 transactions are set to user-mode in this particular case.
> 2) This type of script doesn't use the peripheral interface (connected
> directly to SPBA), but it uses the peripheral DMA interface, then the
> SDMA2-issued transactions are subjected to AIPSTZ5's security-related
> checks.
>
> [...]

Applied, thanks!

[1/1] bus: imx-aipstz: set default value for opacr registers

Best regards,
--
Frank Li <Frank.Li@nxp.com>
