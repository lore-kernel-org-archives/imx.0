Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013015.outbound.protection.outlook.com [52.101.83.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C5C1E86E
	for <imx@lists.linux.dev>; Thu, 27 Nov 2025 02:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764208915; cv=fail; b=kna9HhbqBN4Q10EvS67lDYP0S6ix5YtRIKTk6uStvEusqM44gNPMyWErcP5pyHrxwB2LtDIKBgYVY956Ff+uCVdQp1BMHDofltP6abkxj2yYxxLVyHfnoHCEXwWwXZPqOSpdfemLyMbdjIz7lWSX4JCHxAy8epbt8XiPP4GYJv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764208915; c=relaxed/simple;
	bh=ddF/9jo9w54U/1+cMtODUkP434s2yARmfh7kPAVDzWk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YMIoM9sbIxgqkg7UI0J8ZhrQN3ytkfR2yUSKwapcobdeljaEfXLH/oqIDG6bBfXIqE0FpkQB1z5H9aobeTXTg7/k0W67iuUnCKtPe2ZqI0EUDCPJTkO7p7TSa9rfPIKC/xS+3kJ/TyByi8krHbxza74pEEBEubPhsg6gUHIb+M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gmGju68Z; arc=fail smtp.client-ip=52.101.83.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gmGju68Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwqj8abTZinYVyvaEK0UbuUd6K1w4lYKzwKiYS+1OCjRHfFpbP9lIktihzpt2Lun840bnL4elEasH+un+9F1yRXpEockN2inq1RzaKHsDONSg0rt/I6fKjdGQU8o69t0uC2o6j1dZLMjizhYNPZL8oOny9DWM/2Zxk+qhQzLcY2tYjpjSvpCpTVrcqtM8nXYCGdBwwg39cvUl0cbOfvinl922AK3CfA1Z9Fmfat1SHBzfWgIU0Jgjgw6vdRT2vHGRQr6OV98mynRNOnYk9au4AQh0TdnXgfPUKHxhKiE7fJuOQS5O/8t4GOzC5WRw1ARBEDYu8q52Dv1VM793mZQzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddF/9jo9w54U/1+cMtODUkP434s2yARmfh7kPAVDzWk=;
 b=IhC2TDprY3DwF6NBCrdkxVfrEVIgweYA8571gbjc4ioVAO4O3fwXPfarDpxvJ5AmMXTc0ToYXT9ywnmmTJIv8MMesB+UpyH1ljwPplw4qGTqyMn9S8Lmcz0YlGmAW3QDv/sdfTFCfwJXHADDup7As19hacYiQklXKdEeQvCMOsck3lcOhtleJ3cjNe2GVkbLPsZo0hONIq3SdzGjkz6HLCcpazlA5WAABt4xgD+snVqR38Ixtg4V/8nmUhmg4Jb1OKEt4mdvlel9DtGgQXEGPZwX1hQvYkaf6hwMzO+BlUBhJG0sveyEEENRUHsj+IT+rcL+kW/vnOB8KMxgFKNgug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddF/9jo9w54U/1+cMtODUkP434s2yARmfh7kPAVDzWk=;
 b=gmGju68ZttacjCPr5KAf7CgwOw8FH91dMwhLWL9DhRuIr0CiVF0YtLC0vu0MzEWCNPyZ5Npws3nIG82GaxNNKvP+e6rdlyu9m6VBh90QxDgSVm38iWXMx7hcsrGStJHo3wMAbvb1yXHRNEg+/Vlau+8rzFnnofMM4qhF40T+m1p+LRh3ihHc7KNM9ylvwrvrx3njg2J7Z9eODJw9TIegbt8K2AYAfjW7sYbwOmENfj9WXH8/zdtAy1rotMq1SeXAGjqqi/p2WmqS7VXo15nvbX8QVZLy5Yr2BXRn1TVzqSPyA9omK1exjNA2gK28swCjR/xCOsyXS3cQwp3y9H6LCg==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PR3PR04MB7225.eurprd04.prod.outlook.com (2603:10a6:102:83::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 02:01:48 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 02:01:47 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: imx93-9x9-qsb: add CAN support
Thread-Topic: [PATCH] arm64: dts: imx93-9x9-qsb: add CAN support
Thread-Index: AQHcXpyXOzXOQXS/AkiA8JxcFg4eTrUFJGwAgACgR2A=
Date: Thu, 27 Nov 2025 02:01:47 +0000
Message-ID:
 <DU0PR04MB94968BBFFF9FC757C177C14E90DFA@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20251126-b4-9391-can-dts-v1-1-c23145f0d2db@nxp.com>
 <aScpNjZNU5MtfVRc@lizhi-Precision-Tower-5810>
In-Reply-To: <aScpNjZNU5MtfVRc@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|PR3PR04MB7225:EE_
x-ms-office365-filtering-correlation-id: bc2c337a-9aff-45a0-83d6-08de2d58ec44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?MXdWYUxCZXpNZGdEYzNFR0J6eHJJNjY0OHVJdjBXYjhUVjF2UmRXMWFqSFRD?=
 =?gb2312?B?M1pwQkJhQzdteDJrK3M1dFZFanNFVHBEMDUyZU1SQktvSERjazNoM0t0a2Vs?=
 =?gb2312?B?WWRmNFJwQ3lyM0VlT3k0VHlkaXZpUm9XN0lBWDM4RmhhWlR1UTNZM3RKZEIw?=
 =?gb2312?B?cHBZanQrQ3UvWHpUM3NkS3FJbm96R3RRQVhPVEFjcWNDb1gxN3N6TUlkVm9N?=
 =?gb2312?B?OW1BdjkwRWdYVmRtUVJFOG5WV2ZEd3N2TWZkL3I1M2Q5VDBsbU9VSGE5ejB4?=
 =?gb2312?B?MzhhdUR0YXNQaW5LWlRpYzlULzhCSFNlNXp2Z1RUcHI2d2EzSlZYYWVBV0Zq?=
 =?gb2312?B?U1I3YmJDY2xuemI0Z0M2enJDM1piK1Fsdzd4RGQ1TkcvMTZGUUhVUTRIS3Ux?=
 =?gb2312?B?azhtUno4Slo5cWpSaDhQNUxEUUNkSzhTRUJMcXFIc3hUNi9kTlFsRFV6c2xY?=
 =?gb2312?B?N1NaakZVNzkrUG1YZTErSEJNK1NGVUdDRHVwbzYzdXlTWnhsTHVTUDd1YmlH?=
 =?gb2312?B?bXR6SHVtNE1hNUJENU1iRkRHSGxhdFQwYnhFT3grNklKcGxVQ3pOMmJ6ejBu?=
 =?gb2312?B?N29BYndrN211WitzY3VwRmJSdElZK05HZ1ExVDhZVGpNbU81eTE1UVhreUh3?=
 =?gb2312?B?MTRUWUtGVlVvRWxKMzViS3hTNjBlUzVkZWc1OXJzUERoZ2RFc2s2WVlOSlN2?=
 =?gb2312?B?MWYyeGpteXNNSU5wMUplczFXL09OSzFyVUZpbzRyV1hCWGs2eHFxaDhKNWpD?=
 =?gb2312?B?Y0RncEVHcFQ2MkFRSFR0MHR2aVBPUTIzbkFHalFCUjlXNnlZTkFrU2pOWGFj?=
 =?gb2312?B?NS9ucHhaSDFJenA2N0FKMHN4a2Vzcm5Lc0x3UStSSEtXT0Y4MjlBN0t5Y3ZV?=
 =?gb2312?B?UEVpNmJmNTA0OG5VWTNKY1ZabWRSdG1IblBxeHdidkp1ZExxcmJRc20yNzQx?=
 =?gb2312?B?WnA5aCtXdE9VS2hSNUROUUZTdmczUE9tTmNVZk82SGVJeFY4anBOQkRKMEtE?=
 =?gb2312?B?Y2htSWsrbkw0WHVtd0pMckxxREpRTTBNU0s5UU05N3BGbzJ0dm5jR0NLdDc2?=
 =?gb2312?B?L2ZPa1JWcDBQaFpaT0NGTnp1WnV1SlliMzdpTWs4WXROd0w4YTRZeDJ2R3lL?=
 =?gb2312?B?U3FKQkV0QU9QRGNWNzBRbENDR2VUSVB6eEZxWHdUVHpYa3J0WWErM0dWTjFP?=
 =?gb2312?B?ODBLTVNXZWM1WE02ODFYYWVIR2FvSXhWa2xqeTNYNjRBMDR4SC9zd1M0dHpH?=
 =?gb2312?B?OTY3UTY2djJUdWFuMUpqV0J6UEwxblNUd1BGQmJPQytaSlovc2NDOG9WNzFJ?=
 =?gb2312?B?d3E2d2ppU2RLbXJkWGNUWG9ZNkluUFRoVWdEeldmdHo3ZnBUVXNaU1daTkVZ?=
 =?gb2312?B?bDFCY1FkS0kwbXp5WEpPM01oajRaOVFOYndYOExlUjhCY09MQzcyVHdXeDhw?=
 =?gb2312?B?ZzlYQ1V0ZkFFREtERE40S1JMZjF1dXdTWVcvWTB0TVMxbjJpOE9qOVM0Mkhk?=
 =?gb2312?B?bVN2S3RXSDMrMTY4ZG5KdFpWZ0NIMnBjVjIvWDQ4UFViQ2VPd1ZsTEJIejc1?=
 =?gb2312?B?VXh1d0thcE1JOTc5Vk5Cd282ZHE3SVlNeksvVFVjNHZzWjBQTEJJRlQxanUv?=
 =?gb2312?B?M1ppQTIveVVyVzJrYXlUeGFKa0tnK0ExNjRRdlA3R2d2d2VhUDB0R0Z6dVJs?=
 =?gb2312?B?MnhiVFFTMUtqckdOdkxBUTZMRVFHTVg4K2I2RThFbmMxQ0R1ZVNVekVWUHUz?=
 =?gb2312?B?Ny91WEN5R2hlMDQvcWl5Y3dJMFVaZVBhanY5ajJGMXY3Yk40YVN5MmYxT0tR?=
 =?gb2312?B?dVJkdEk3RDVoM0lNRnl6czV2ZHQ3WUtMalZiN3dxaXd4ZlRER2J0VUtFK1RH?=
 =?gb2312?B?bDdXZjdDU1ZSZ1JYbHhFejRxODJGMFIxVThZc2k3cFRRVGdIZFNaam9uZGxy?=
 =?gb2312?B?c3Z4Y3VnNzRQUzg1V0dkS2x1Q2crWVpZK0x5cCtXWlNEb1RJQlJjaVplcmtZ?=
 =?gb2312?B?VE13amo3cXBEdTZIdm5wK0RNZ0tPT0c1RFczZTMwdlNPV0kycS9JdS9uUnZL?=
 =?gb2312?Q?qUUo3H?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?ek95eGQrU0VyalpGa0tnVWVvNHdwY2MzaDNUSjdLZzM0UDdoeGN6b1prQnI4?=
 =?gb2312?B?Um1mcCtkRi8rMDZndnJmTGdLS1JKdy9TcFhvdm4vQ0dXbldpem9DdGY5VjZ2?=
 =?gb2312?B?ZVRkN0FWQUVBQzQ1VmprQjFQVzNGaHFsVHQ1RXNTMm90RFp4UW9pR1U1Nkk4?=
 =?gb2312?B?NTYvL3V3YmVVbmpwNzNLWkpmdlJiaUQ4RWEwTWF2c3RIZHlvMHh5RWJXMHNT?=
 =?gb2312?B?b0Y4ZUs5LythUkFHQ1M3REFCd3Y1OFozTlczZG9SRmFIRkJDTGY3bTNVVnI0?=
 =?gb2312?B?T0hzZHkvODRES25IWTZoT2dKeHN4dGhTVVhyUlR4Y3BZUVJUV2NxK3Z1bmlp?=
 =?gb2312?B?Sy9jZzFtSDdyQlljS1NWeGgyRFJtSkFadUZkUnc0ZVBDOXIwTHg5TklmN1ZI?=
 =?gb2312?B?cnMzTWZWOGdJUDBXTXlzNVhIOE5aZDRnRDJPL0xPbTB6dFhQZUNjVEZNUlVs?=
 =?gb2312?B?cXQvSWFVTG42L05iZU9IYlpJUEpCd1cycDM2eTBkUThPeWNlRFB2andEL09P?=
 =?gb2312?B?dm12amtWV2ZyVDBlVWp2UzNVNnNWOSt1TkpvZUVKNWtJdmpRV2xNNWx6MHEx?=
 =?gb2312?B?RkpiV2R6K2VuaWEyRTFkSGhCMlBtZ2xaSVlQTlZNbDRheEp1NGg3N1ljb2dJ?=
 =?gb2312?B?dFQwYTAyZHp0YS9lTFY0dHdGc1dyL2JTU0h5WWFjTEM1SU01UERQR1FRYjFl?=
 =?gb2312?B?dFVWdzdhVS9BRXdPTHo4Z3pnOTFRaGpIQ0Z3YW5KOFUzU3dGcnYzTUhnU05l?=
 =?gb2312?B?cTJjV0tyUjR2c1poSWhWc1VnVEoxN3NMWWo1VjFEbHUvSUxrWGk3VkxSWG1a?=
 =?gb2312?B?MXJyTSszblVhcnB5azJvY2ozNzFaM1lnN1BPQXRQWDYwT1haNDhpbk4xRDBi?=
 =?gb2312?B?WlBVcWhhL1g0dWR2bEk1NFdxNUhiZDJ3dElvWExUbE1zN1BENEV6eVhQc0ZI?=
 =?gb2312?B?bXBtQU93WUV2MGRUdnYxQlhXL09kUmFvanpWY2o1L2tHdGp5RDN3TC9pZ01B?=
 =?gb2312?B?bmdMNkV1OXNqSzJzYXowejU0ZWxlMXVFanc2dU5TaXlCZUNDeXgvMlphWG1k?=
 =?gb2312?B?WmR5TzF4UzNYUHBEZkFqOUdqKzhQd3E5MzczNU02OUI4WFFFVGZOa28yM1BJ?=
 =?gb2312?B?bnBLUjhqajFLN05LMXpmeExPK0NzT0tDL0tWa0VaMlhUNnZLRUhrZmVZUVhM?=
 =?gb2312?B?OUhlanQxVU5DQS9uWVIvNnFCK29ZVDEvSXJZZXNsM0N3L0h3TWZIV0kvellV?=
 =?gb2312?B?L3diK3hZY0hMbGVlYlc3UExaOCtwOE4vdlBJZExsbVA1VkpUN0p5YlpnRHdL?=
 =?gb2312?B?Y0ZkQ1V2d3pMM2QwenlRNDl3dWNrWkxDRnA0RVFQL0ZnV2wxckgyMWJQQkpO?=
 =?gb2312?B?cW5yazVSZm5Yb0RLYU1ETjlzOEdqSUlBL1BRSzYwYzlKQWpDT1lDZ0kxV012?=
 =?gb2312?B?SmlyRWtQWWY1Uk9sNm1HNDVLa0tMd1FTTWgxeVlkM1BjQWc3TXc1Y25JdkZI?=
 =?gb2312?B?NFpoQjJrY3U5bmlvbGJUQ3NPSWF4WlFiUDFFNVBTNkRjNG56UmhvUnNpRnE4?=
 =?gb2312?B?eUs3TUhDNFJnd0h2RTU3QWtJWjVtWHprQ3Y3MjRmZWlZWThjVlVvcFNwVXJW?=
 =?gb2312?B?V0dtZWpuditGMUJpdHZqcHdDNXlqS2RlVForN0Nzbkh2a3FuZXJaMzQrZ3Nn?=
 =?gb2312?B?NzJyL3ZtNFNvb3UxUWtBaDRLQm4yTEFQbk56TThGN3p4NUhQYmZKLy9zQitn?=
 =?gb2312?B?eFVMNVNsM2swbWVueUVwMEFFUEdkclBva01KZWZsZ1J4Nm5oTVZMbHZOTkE1?=
 =?gb2312?B?Tll1a25EL2FpM3BwTEFJL2FKNldKQy9wRkt3SWEyVU9mdXVOWXMwQU00ZGNm?=
 =?gb2312?B?TERBd1RsbVZwRVd6ZEhpU3BKS0V2U1BaUnp4UHlybGF3MEhpVmZ4VG5LeVRm?=
 =?gb2312?B?Y1I0Nm1YdjYrNnhEeWVrNXZLNzdRUk81TnlETDhzVm4zNW41VlFTQ09zRkh4?=
 =?gb2312?B?U2Fja0FuRVpXUFVyYTJmajVVRXRyWEJrbDdGbnFhMXVNRitJbEFYa0hvZDFK?=
 =?gb2312?B?a2RzVHo3T0hBMk5mcXg4ZCs4dzVaYlZtTThTdUM1WmxqdjdidnFvQ1ovMkZt?=
 =?gb2312?Q?jav4=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2c337a-9aff-45a0-83d6-08de2d58ec44
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 02:01:47.6806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3po9I6isoMjmCsa9UP6fbrB641r4tTHUoPkavX7kNdBX+LSQBDHKNQIo+8+WAmrIf26h2K97OAhLtkJIjUF9KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7225

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmFuayBMaSA8ZnJhbmsubGlA
bnhwLmNvbT4NCj4gU2VudDogMjAyNcTqMTHUwjI3yNUgMDoyMg0KPiBUbzogQm91Z2ggQ2hlbiA8
aGFpYm8uY2hlbkBueHAuY29tPg0KPiBDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3Jn
PjsgU2FzY2hhIEhhdWVyDQo+IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgUGVuZ3V0cm9uaXgg
S2VybmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0gPGZl
c3RldmFtQGdtYWlsLmNvbT47IFJvYg0KPiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vcg0KPiBEb29sZXkgPGNv
bm9yK2R0QGtlcm5lbC5vcmc+OyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTY0
OiBkdHM6IGlteDkzLTl4OS1xc2I6IGFkZCBDQU4gc3VwcG9ydA0KPiANCj4gT24gV2VkLCBOb3Yg
MjYsIDIwMjUgYXQgMDI6MjA6MDdQTSArMDgwMCwgSGFpYm8gQ2hlbiB3cm90ZToNCj4gDQo+IHN1
YmplY3Qgc3VnZ2VzdGVkLCAgYWRkIENBTiBzdXBwb3J0IG92ZXJsYXkgZmlsZQ0KPiANCj4gPiBD
QU4xIGFuZCBNaWNmaWwgc2hhcmUgcGlucyBvbiBpbXg5My05eDktcXNiIGJvYXJkLCB1c2UgVE1V
WDE1NzRSU1ZSIHRvDQo+ID4gY29udHJvbCB0aGUgY29ubmVjdGlvbjogcHV0IHNlbCB0byBoaWdo
LCBzZWxlY3QgQ0FOMSwgcHV0IHNlbCB0byBsb3csDQo+ID4gc2VsZWN0IE1pY2ZpbC4gSW4gZGVm
YXVsdCwgc2VsIGtlZXAgbG93Lg0KPiA+DQo+ID4gVG8gc3VwcG9ydCBDQU4xLCBuZWVkIHRvIHB1
dCB0aGUgc2VsIHRvIGhpZ2guIEJlc2lkZXMsIENBTjEgdXNlIHBoeQ0KPiA+IFRKQTEwNTdHVC8z
Lg0KPiA+DQo+ID4gLS0tDQo+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gQ2hlbiA8aGFpYm8uY2hl
bkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9N
YWtlZmlsZSAgICAgICAgICAgICB8ICAyICsNCj4gPiAgLi4uL2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg5My05eDktcXNiLWNhbjEuZHRzbyAgICAgfCA2Mw0KPiArKysrKysrKysrKysrKysrKysrKysr
DQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL01ha2VmaWxlDQo+ID4gYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmlsZQ0KPiA+IGluZGV4DQo+ID4NCj4gZjMw
ZDNmZDcyNGQwY2U2YjM4ZjdiZWYxMGUzOTcwYWMzNGY3MGY0YS4uMTE0MmQzMzEyYzg2NTFiNDI5
MjgzN2JjZTMNCj4gY2INCj4gPiBlNDZhYjk1ZjdlMDkgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmlsZQ0KPiA+IEBAIC0zNzMsNyArMzczLDkgQEAgZHRiLSQo
Q09ORklHX0FSQ0hfTVhDKSArPQ0KPiA+IGlteDkxLXRxbWE5MTMxLW1iYTkxeHhjYS5kdGINCj4g
PiAgZHRiLSQoQ09ORklHX0FSQ0hfTVhDKSArPSBpbXg5My05eDktcXNiLmR0Yg0KPiA+DQo+ID4g
IGlteDkzLTl4OS1xc2ItaTNjLWR0YnMgKz0gaW14OTMtOXg5LXFzYi5kdGIgaW14OTMtOXg5LXFz
Yi1pM2MuZHRibw0KPiA+ICtpbXg5My05eDktcXNiLWNhbjEtZHRicyArPSBpbXg5My05eDktcXNi
LmR0YiBpbXg5My05eDktcXNiLWNhbjEuZHRibw0KPiANCj4gS2VlcCBvcmRlciBieSBhbHBoYWJl
dC4NCj4gDQo+ID4gIGR0Yi0kKENPTkZJR19BUkNIX01YQykgKz0gaW14OTMtOXg5LXFzYi1pM2Mu
ZHRiDQo+ID4gK2R0Yi0kKENPTkZJR19BUkNIX01YQykgKz0gaW14OTMtOXg5LXFzYi1jYW4xLmR0
Yg0KPiANCj4gdGhlIHNhbWUgaGVyZQ0KPiANCj4gY2FuMSBzaG91bGQgYmVmb3JlIGkzYy4NCg0K
T2theQ0KDQo+IA0KPiA+DQo+ID4gIGR0Yi0kKENPTkZJR19BUkNIX01YQykgKz0gaW14OTMtMTF4
MTEtZXZrLmR0Yg0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9NWEMpICs9IGlteDkzLTE0eDE0LWV2
ay5kdGIgZGlmZiAtLWdpdA0KPiA+IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OTMtOXg5LXFzYi1jYW4xLmR0c28NCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2lteDkzLTl4OS1xc2ItY2FuMS5kdHNvDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBp
bmRleA0KPiA+DQo+IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjYy
ZDRmYTZjMjFkNzk0ZjkxZGE1OWY1MQ0KPiAxZDZmDQo+ID4gMDE2MjAzN2U5MjcxDQo+ID4gLS0t
IC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkz
LTl4OS1xc2ItY2FuMS5kdHNvDQo+ID4gQEAgLTAsMCArMSw2MyBAQA0KPiAuLi4NCj4gPiArDQo+
ID4gKyZwY2FsNjUyNCB7DQo+ID4gKwkvKg0KPiA+ICsJICogbWljLWNhbi1zZWwtaG9nIGhhdmUg
cHJvcGVydHkgJ291dHB1dC1sb3cnLCBkdCBvdmVybGF5IGRvbid0DQo+ID4gKwkgKiBzdXBwb3J0
IC9kZWxldGUtcHJvcGVydHkvLiBCb3RoICdvdXRwdXQtbG93JyBhbmQgJ291dHB1dC1oaWdoJw0K
PiA+ICsJICogd2lsbCBiZSBleGlzdCB1bmRlciBob2cgbm9kZXMgaWYgb3ZlcmxheSBmaWxlIHNl
dCAnb3V0cHV0LWhpZ2gnLg0KPiA+ICsJICogV29ya2Fyb3VuZCBpcyBkaXNhYmxlIHRoaXMgaG9n
IGFuZCBjcmVhdGUgbmV3IGhvZyB3aXRoDQo+ID4gKwkgKiAnb3V0cHV0LWhpZ2gnLg0KPiA+ICsJ
ICovDQo+ID4gKwltaWMtY2FuLXNlbC1ob2cgew0KPiA+ICsJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
DQo+ID4gKwl9Ow0KPiANCj4gYXJlIHlvdSBzdXJlICdzdGF0dXMnIHdvcmsgZm9yIGhvZ3M/DQoN
ClllcywgSSB0ZXN0IG9uIGJvYXJkLCB0aGlzIG1ldGhvZCB3b3Jrcy4NCg0KQW55IGJldHRlciBz
b2x1dGlvbj8NCg0KUmVnYXJkcw0KSGFpYm8gQ2hlbg0KPiANCj4gRnJhbmsNCj4gPiArDQo+ID4g
KwkvKg0KPiA+ICsJICogQ29uZmlnIHRoZSBNSUMvQ0FOX1NFTCB0byBoaWdoLCBjaG9zZSBCDQo+
ID4gKwkgKiBwb3J0LCBjb25uZWN0IHRvIENBTi4NCj4gPiArCSAqLw0KPiA+ICsJbWljLWNhbi1o
aWdoLXNlbC1ob2cgew0KPiA+ICsJCWdwaW8taG9nOw0KPiA+ICsJCWdwaW9zID0gPDB4MTEgMHgw
MD47DQo+ID4gKwkJb3V0cHV0LWhpZ2g7DQo+ID4gKwl9Ow0KPiA+ICt9Ow0KPiA+DQo+ID4gLS0t
DQo+ID4gYmFzZS1jb21taXQ6IDQyMmYzMTQwYmJjYjY1N2UxYjg2YzQ4NDI5Njk3MmFiNzZmNmQx
ZmYNCj4gPiBjaGFuZ2UtaWQ6IDIwMjUxMTI1LWI0LTkzOTEtY2FuLWR0cy0yZjQ4NDk5NzhmYzIN
Cj4gPg0KPiA+IEJlc3QgcmVnYXJkcywNCj4gPiAtLQ0KPiA+IEhhaWJvIENoZW4gPGhhaWJvLmNo
ZW5AbnhwLmNvbT4NCj4gPg0K
