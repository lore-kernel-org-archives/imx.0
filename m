Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2080.outbound.protection.outlook.com [40.107.105.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D9D23313C
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736766325; cv=fail; b=Uf3pFjy/ggFh7ohS6OtsfQv/lXhErgxD1ciwiJB0q7PVV+KoxlwHAafHL74v8IqTqpXbUdUIUWSgVSPcmhqqr/NXvPuZXpghWxSY8y9ILVs9kQRUaVwhDv0FxSfBeFJ6tiySx5bLBIfVcMkkNF9Q7rt7xYmKRZKZ/nb9vZ4I4gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736766325; c=relaxed/simple;
	bh=nZbqjVBhvhYzQXnAfJYm/EfijdFMHIa8PS4YFR5lWrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iK9dcw7Rz5PrUmXFrPCk5ZyW15FSeMsNCx3VYYXRmmNlOBIOfWNgIglkDKWmb0fcl1j/PBuHwwPopRh37PxsGC5oWklaYUO67S1llB+ovZCjqETL6KYOVLmalD8/G6vGz3RWZ87ynTCU2FHXqVs0MKBHsSSt8+OkxCkS1BTFg3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rSxXtwxD; arc=fail smtp.client-ip=40.107.105.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rSxXtwxD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pquGuyMVSv1yhWzsd7Xa3ZKAoWqCxP6lxwDyAbHTAJ+2gjD0iEbT84K4+f7ngYQzxtfAHBALh6OiWX0WBL659rfnBFvZgakfi73jFeoo7217B6VbYJPWmVp5W5O8U3KcJFByrZGPWI+uzUg5lGxvtg9ZBEPZ4m3hqd5MHDuFtoaBd65c5AOg9yet9DoUVDApS+j8lsttTiEdGPY54tBMO5aMAOKMgjGBslzV79XvGykSzTUKOtje3de54UHTmgJ35Tr6B+FVqVhxlrvA1MXzIB2RCj4O8fyYfNdgJUpeoSLV1sb+aLGtGu2bnNG2DQ6P7kffz0O81sUpGo2xFhX90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwQtLGG6+CwJTzrSpr9B3ctoEYlM4IqJYutipWDYHe8=;
 b=mmnyk55CXmCqVm9nzAy80JqKbxMth2RlNg8aS09V6FKmUoIgGjTihsi6D0kR/l6Znw9lkl5B36Id3xsfRDgl3mAVYysNNfuzWtIK1ujUqQ5/QfCMMWR9IFp8y7b2QAdhhwrqeVXJ1V9mod6nXS8IFv34g8W4fGN1LzQd8wRHq37IFTH0ACHaUYDoTFoPzC+/NHEuEU7C80PXLC4HV+ShZkrhLgNvmkD+U8OXCPxLC4GbWagN47qYdi80aptQNSk8zmxvCUYWdtqfLHDwypK1jXAwnZCYDIMVmD7mBDpD+sDxy98U9OBLw6pzGF7XWj1P3DUGNi7onRIBv0hKwBYT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwQtLGG6+CwJTzrSpr9B3ctoEYlM4IqJYutipWDYHe8=;
 b=rSxXtwxDqh9XUvblo30X5SB3iiwTtUcxV6DMj8BRfxtVLdWlGSMWr1MUWCQoAV3NLQU32cXMJ7JaDi3WaJY1fPoSLOfzJScSlDKgnzlJchKdaQtnUyC7svZnlDCtWyG3OsjzuSher9fVgCxdC8LmHoBZxomj/H77QloQ5RusK1mx6GOv3/VICk6lvtDvE0tDuq4kdm11A7lz4Osf0AJ4ZmDeZx0D8gpu49KP/AQ4ra61rhytJOy0vrjvNCJyTbI7sI+2su9i8Cft+wkHPxqGPM0LO86GZhl3rtUpegHE9c93OGcGJNxYgS5cCa5nomX34MVM+I4ZThlGymyNHkHWkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AM8PR04MB7425.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 11:05:18 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 11:05:18 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v5 1/3] arm64: dts: s32g: add I2C[0..2] support for s32g2 and s32g3
Date: Mon, 13 Jan 2025 13:05:10 +0200
Message-ID: <20250113110512.506007-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::15) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AM8PR04MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 28522e5e-fdbf-4b33-bfd5-08dd33c22a59
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blBIeHNWSlkyTUVwQmFWakRpT2ZmU0NZQXFkWGtDSWNiTkRuNHdwcjdDdXVy?=
 =?utf-8?B?KzhXYjdGa1lZdjBValp2akRVRVU0N1Z0K1VEU3k2UEF6UnROSnB1ZGZ0M3VP?=
 =?utf-8?B?Yk0xTGg0QXM2T09CZG0rZzlybU50WUp1UkxIQVZ1Ni9LL2k0T1hNOW9taEF1?=
 =?utf-8?B?NmtueGhEVGljZGZQVjdQUFZVVUZkVVJWK2R1TElnaUprYVA1TzlXdUFMRDNU?=
 =?utf-8?B?aW1ZVmxrZEZkM3VWRnlOTVMrZnkxZzFuaVMvdy9QbGFhQ2FkSnVrRVByOWUy?=
 =?utf-8?B?STUzQzJzbEhmU2ZhdU4wS2xSSTFaZ0JSWVVSMitOYWltaWxxazk0UnBvRis5?=
 =?utf-8?B?ZHhtYU5rRWtsNmlLUFp0VHRZMkkxTWNsN0VrTWtySGxhMjFoa3NYamU2bVBY?=
 =?utf-8?B?MGJxQk1yTngza09GK2lUM3ZiblBLV2o2VXRGUHZYVEVaYU5jRm0wbzVQOGlP?=
 =?utf-8?B?akxLUHRpeVBaRG1uMzBJRHgyc1pQUSt1ZXZ6a043a3dmYjJiU2E3UmxEK2dm?=
 =?utf-8?B?SThrL3lnTDJmeWx0Vi9ISXVIcDhHb0tYdk0rVjRKdmZRMFY4S0Nwdm5td2Jw?=
 =?utf-8?B?bmkwYVAwaDV2ZC81aU8zNnMvaFZhYlhyeEdlNXRCU2tKbnJWMXRzbnpONXJX?=
 =?utf-8?B?b0o1NnQxNmdnZC9vZ2w5cVpsUStTaEhWV1ZhdkpMcEZwWUlPWVpHdytTcUR6?=
 =?utf-8?B?K3Fxb09nWXVTdUpjQytOSEQ1Q1lOSmE3bXhMMmF6T2ZDd0QvRXk1dGhrTGNh?=
 =?utf-8?B?b3NMRWlzc2U3Q2ErRnVoYnlCdm10Y1ZIaTduTitVb0g4dmR2cHR5NGdIbmNh?=
 =?utf-8?B?LzVtbGFSWWZWblpYN3NOdDJPYW5TS0ZSeHgzWlRKaHlTcUFnMjVLNEdXSkVo?=
 =?utf-8?B?VVRJNTFMWllsZWxDcXZCTzBQa2l3WjJsdHBoOFI3M2ZHamJnMFlUeG14ZzlI?=
 =?utf-8?B?N1NkVVpmT2JHTzBBZ3g4NDhrNjlkTkdxeG0zZHRtSSthQnZTVHNDMUNnWktE?=
 =?utf-8?B?TkxyaDJRQUNmcEFQeDFNc1JMeUNmOWxrSTQvN3JxWEk4WkxkY252RlhudGpm?=
 =?utf-8?B?ZGZIdHJnNmQybEJFUjY1SHBFVXZsOEIvZTh4MmRmOU5YZTErbUE0VVN6R0FD?=
 =?utf-8?B?NnFBUnU4N2NPeHJHLzFvNG12UC9FWVNZM3AwS2xmUDRQSmRCKytwRk9KbzdO?=
 =?utf-8?B?ZVY5d3VMUWkwNERZeUJJTXRoQm1scDVKeXZjakFhR1pDd05mZTVoZGNiRkZF?=
 =?utf-8?B?NFd3cy9CT1M2clM1b2w2QUgrTEs5Q2Yxb0JqTDlDZk9GQVMwN21DcWp3ajRk?=
 =?utf-8?B?MEJ4SFlUNTRSTWlSR1p6QXhhUjNKZlJJZkt5SXlURDdVZ0JNVkVwRDFGVWNN?=
 =?utf-8?B?ckh6UGNmd09PdzNlQys2YmgwNTNWeFRiRTZHR090MWZoeFZjQ2JyVWxqdk9o?=
 =?utf-8?B?Q3Q1Nis0NFp0YWRsMEJDQlY4YzBsZEJqMmhTN2pZSURNS2ZlMHAvZW9XQVUw?=
 =?utf-8?B?YnpsWXlvak5qOFlFakhVMnF6LzdrUTVTcnVmbW1DUHhCYlRpRjNpNm9VbXl2?=
 =?utf-8?B?SGFrZms1Q3N6TzkyL0xFa2V6bEF2SnJIRGlDZ0twOEsvTzQ2OTVSYktlUUtk?=
 =?utf-8?B?QjQzR2h0TjRqQTQ5ajFFcHVmbkpsOFdjQWtrV05FYmlROENnVVhUV2piN2RZ?=
 =?utf-8?B?ZEpCRTArRFZXZXU3d3V6VGFtR0pvTWdQbGk5aEZITi9xcDFmR2tWYmNHcStY?=
 =?utf-8?B?YTYvRHZCOWJZc21YNWkwOEJjSVROUHY0ZDdPRXQ1bEJOc2ZqRzMxdktTbnRW?=
 =?utf-8?B?OXdNOEZZREtNTEgvV0V2ZVorZjJ3NTJMMDE2b2o0TkhSTkprTnpTRjhaVktG?=
 =?utf-8?Q?+h9UQvbRDK2ZP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGxXVk1Lbjd2UVJxMGI3RjAzWDhxaElTUnJYT01SMno1QjVaTnErWElIa0Fa?=
 =?utf-8?B?Z0ZNa29SNGtkSW1HaXpEWTZjLzZMQ1k4NW9Xb2pJaVduSkxvNldBMVZTRXhq?=
 =?utf-8?B?a0xTL1hidk5pVHRBMG0yQ1hSanY3bHhnSTV5VnczcUp6ckVqYURKTXl5Yk9O?=
 =?utf-8?B?WC8xL1BzWmFkaFZUcFpyMGdHUGdRT2FlNWZUSXMrY25ER3V2OGd5a2Znek02?=
 =?utf-8?B?dlUxeVZTRC9odWJUeHdhU1pOOExoUHV4Nk1NR1Y4R0Nta3phWFVGRXlINGV6?=
 =?utf-8?B?azc0Yzl1ZHk4SHBuaWJlanRhT29CS250amRCTFIraFVDQVJNQjJ4ekN1bTdL?=
 =?utf-8?B?YldyK3J3RThLejVsQzAxaDBJdXpyZ2VYcFBLcTFoTFpDZGhzS1ZuYUpaQkFG?=
 =?utf-8?B?TmRBRFNsMlozMTYyekorMm10dllMS1pLb3NhZkZZNFlIU1V0QmhvYW9KdURE?=
 =?utf-8?B?K052dnZpMHhIVnUyd2s3UitOeHNxb0UrbGtvbUpNVkQzUE1DeDVMUWV3Q0pZ?=
 =?utf-8?B?UWJjS0txNUM1WUZmT3kwaGpnNS9sWHN1YWdDL3BoalB3SU5CQ25Uek96ak5F?=
 =?utf-8?B?Yk01cVUwNnYzQUZKaVJYRTBNREdBdHBQRmdZZWs3YUZmc0o0Z3g2dTF6bVdF?=
 =?utf-8?B?WDdpQWpxRTd5TzRKYlZQS1BlUUU3L1V0eGlkYWJXaklvTWJidkZ5NTBkQjMz?=
 =?utf-8?B?Ym44aWZmRGpuSFpZb25WSmVLa0VvK0RzL0t5V2RUZ1pzREpydW5ldTZLVTRX?=
 =?utf-8?B?d0lOOUtpVExZT2V3SmRXYjF4RHUxUWpieWw0a3UvLzBFUnZoYnI0NTNYQ1JK?=
 =?utf-8?B?L3VFejdCeDRXV1M2aTZGcmk5WVltK3F6dHFFbXppdjZFVkFoUVovSTEzelhI?=
 =?utf-8?B?UHdnNUZsYU5DUjRxNlFLdVRzOUI4T1luM2FSM1QrZjg5WVRVcFM0OVowa3RX?=
 =?utf-8?B?VENYMjRJQmVDbGhvam9kR1FxUERYb3NOSFdMS3dPeFBEbUJma3lwRUQzTkdt?=
 =?utf-8?B?YjFSNTBYRngvQldoRU5YQUNmaGpDWm9PQk53enhPWDVEdmg3WEpCa21FeU1L?=
 =?utf-8?B?aU1GUTlORnAvdGsvZGt5Y1FtRFVUdG1wbS9aYjZ0WlhIblh2ZzdMNGhaZGQ4?=
 =?utf-8?B?M04rUUE5UmtHQS9hRURRaEtzZzlIa3JrOEhORTNZbkp4L3lxdDNJbE5MMGRH?=
 =?utf-8?B?c01tS3BEWUhFdnYvY0l4SlJWM01LNXlURjRWekpoNnlkOXVKRkNzUmdZVUxV?=
 =?utf-8?B?aXYzMW9UblhlVGVIbGFSbkpXK2twNTVseURvb2VweTUyY0JVWWxXYnRPN0ll?=
 =?utf-8?B?dmdlS09KdXFrWW9BOU9ocVVON3FLWUk2RGlESlBCaTA4VEY1bHVoQmZua3hl?=
 =?utf-8?B?OThHNTUvdkgxTzllaFZpM3ZZMkdrOGI1Z2tIMDh4WHhHNnZ2WU1TWEd1eVY2?=
 =?utf-8?B?MFVFbTZjTzNhMEkyQUlzOHlIR1N2Unl6L3YwZmo0SzFYOXVGcTV3YVkyZVZj?=
 =?utf-8?B?M1FPMlBzZEZxQmF5ZnR1TVhLaDRoVFlwQTR4bVNMNnAvQmk1bGxkN3RHR0tt?=
 =?utf-8?B?amtBa3FnZVJRbGFFKy9GWEFzbGcvbTRRd2U2YzlIanZqZkpldkVOb3UzZHEy?=
 =?utf-8?B?ZVZZNytNS293RWdROUhRY1c2a25nM2ZHTEdLdEFZZC8veXJLQldrTHF1Zkxi?=
 =?utf-8?B?TnIvNks0UVNLU3c5NXNHeWhFd3ZEcFZNaEpWdmsvL0VxMHVhdWhvblpncWQr?=
 =?utf-8?B?OGJaK1hiUlhOYWFobmV5aFM1UWN6UVczTzNodnpLY1dtSE1tdkxqNitCUFBt?=
 =?utf-8?B?TmFzUEV4bWpTVjBlWUVXZVNSd2Yzb21leGN3WWtGdnQ2STlPWXd4VG1wOXdY?=
 =?utf-8?B?LzMxZ09yR2kzRVhXaUNKRlpXQjAyb096OGowWkljTDZXY3RLUWVmbStxQW80?=
 =?utf-8?B?NUZ6ZkZiYlVHdjdNMHVlZXBNdEVNVmRUR0VpMTQzalVzbmpNSXB6REJ5S2hO?=
 =?utf-8?B?dmtJaE1lWURnUGY5cDFCNURiWU9abHJiY2xYTmdJRmJPa2dOeHdpOGtQcDRZ?=
 =?utf-8?B?TWhVcG92Z214cXBCLzhSVlN5K0xKQUo0d3NDalFHY3p2d1pYMThQNUUwWVNO?=
 =?utf-8?B?a2hLcldnRG9RV1NKT0N0S24zY3JOMTlEM2FITm5yVEhzVVN0b3JQQnByZlBC?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28522e5e-fdbf-4b33-bfd5-08dd33c22a59
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 11:05:18.4941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xa8kBurFawboDk1H0eLDqC13XfGSx2CtOlYowtTuHgWj/sefQgy8//AC/MwiyNAh/x+8mgRwT0BvxfUQiehqBbO17DEluX7vtcpWCjKfg+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7425

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add I2C[0..2] for S32G2 and S32G3 SoCs.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 55 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 60 ++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 7be430b78c83..beae4d5cf54e 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -333,6 +333,39 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@401e4000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x401e4000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c1: i2c@401e8000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x401e8000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c2: i2c@401ec000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x401ec000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		uart2: serial@402bc000 {
 			compatible = "nxp,s32g2-linflexuart",
 				     "fsl,s32v234-linflexuart";
@@ -341,6 +374,28 @@ uart2: serial@402bc000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@402d8000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x402d8000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c4: i2c@402dc000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x402dc000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g2-usdhc";
 			reg = <0x402f0000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 6c572ffe37ca..79b38cd8b142 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -390,6 +390,42 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@401e4000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x401e4000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c1: i2c@401e8000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x401e8000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c2: i2c@401ec000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x401ec000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		uart2: serial@402bc000 {
 			compatible = "nxp,s32g3-linflexuart",
 				     "fsl,s32v234-linflexuart";
@@ -398,6 +434,30 @@ uart2: serial@402bc000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@402d8000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x402d8000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c4: i2c@402dc000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x402dc000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g3-usdhc",
 				     "nxp,s32g2-usdhc";
-- 
2.45.2

