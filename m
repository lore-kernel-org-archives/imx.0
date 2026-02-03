Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013003.outbound.protection.outlook.com [52.101.83.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D368828136F
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 19:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147410; cv=fail; b=NYQgfZe5dHdtVi7jazQidTwxI8hWG3yDc1HP3AJCasvtjKMuxjJl1q+yvlLXQjr5TzPqBCuy7sDF3bwXFYx5sNgwGgRMkkn2t115WYbNHFSrbQBDivx25b6h8XCe+mYeu2WGCn3CscBmXPPdJFgmMbT4EAbOSzPBRr5ythZlUTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147410; c=relaxed/simple;
	bh=akqyr9mUCDKsXlNJztBQ0d530bSEJz3w2/y2eooUwsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bnkjusfJ3VgMrf9fSid4MRk0wC+LTy5SJ42fVgCw5jbEpanYRofmHiZ76w1GKZr0UFk8ulykwmwOMEE+hE0aJU0RmpgNTgIFQWV3uyR+dHf/AKDtt6f7UWM3Mql2da053e8EWl2kn0ZiY2U5PRQxMWO0kCtO3ocpyCVzKNuSKWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=REYhPAs/; arc=fail smtp.client-ip=52.101.83.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="REYhPAs/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P36c+M2qHusyhmBp7vBbAFRmTm0cuxdT+n1AhfOLMlGQp+5USH0Cyq8+VkvJ1nkAesfL0wVay8Bv1sTe0gTjMoZcCCzGEt5PRzEj2P7GQcPguGyIvCO1yjioJCu1F5LQNPzcjyEY2C9dNotittjES+ia4/X7pjEEoiEfgePwt13pM4kaKD011/KbNL9zb64AWp5FT2KZxtU1vxbGe0Tm4jITFdPWmjq9BA0jUcbBKsyTsfU26ymvyRgUO9Ldu8QaP7kGKXrIsYJazx62/QbIPhNVVF7dfTqM5mGtTEzzMK5LmxmkaM9Pt91Vl436A/TIVMVesnodQDqe4eDiKbSZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9Jie2fHm3O8WluhQOIc4AqjUSC5g1NTXnbHYAvR+I4=;
 b=HlkKarx/gDwc9sW4qen8bMja9fUsXPLTtDx7KsReYE/bLojFu05wT+FTABvG5HnZ6jUFQogKtOx6mP/ljNYe15QqW/43Cz2O+Ponv5LMMZ0Fl6ReT4cN3GT7a9dF3F5z6ntRgdqjjfbEBTWmVG/hkz5YDiTYa2I+hWTGZcO1a+CEPnmPT2DnJcVTnIpgBaR/OZcq0XUVRgmhyWwHyACA77qeTbroQTDJLFZ0QyPdlMtvtv/Zz+fbk4n3UUO8puf0bdo/2KR2ZQo89EPOoRWQbc/8GVMbXPayuWFtI7n8wYk/fhOrKDI6ZRdPV0oY+ham3cjo6yRBf5wJ84fsOv2igQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9Jie2fHm3O8WluhQOIc4AqjUSC5g1NTXnbHYAvR+I4=;
 b=REYhPAs/uct/CCE4OXj6QEMVcMuSS3vNHh+aNX7CzUv9tAmyTe7NwMhrMhOJI92M97Jd32t16gZDKNUVUSXqr4fRUpE+QDtH45Vz62WTG/98OGwnYfgTkbcrHh7BWjBdqDprM//KSHqv9eL9UoXo3TP449FWHlULU0zckaGGwwRFQHKxJ/wCQSdKbiuKm/C3BeUxFJ89PitKi+J2BS/0Y9u8ecKKagzXQtCNDGMCAovxUDvkV2ePEC3c73XZLr7iTFfOC4xO8qHOW7IRrh2HZ0QEl2CeKuqg6CzYpj8+YFXJQmJ2m8PVYlI731sKff2RiRVhQCsggN+ZN8TAFqkvVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA6PR04MB11736.eurprd04.prod.outlook.com (2603:10a6:102:526::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 19:36:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 19:36:43 +0000
Date: Tue, 3 Feb 2026 14:36:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: imx: Add i.mx8mm Gateworks GW7906 dts
 support
Message-ID: <aYJOQ42Scp5jAjzR@lizhi-Precision-Tower-5810>
References: <20260202181029.1832198-1-tharvey@gateworks.com>
 <20260202181029.1832198-2-tharvey@gateworks.com>
 <aYD4BwB3McK45vCk@lizhi-Precision-Tower-5810>
 <CAJ+vNU0rwpoedAvPH5whLSXKHXX+jbsnAy1hKx_0To8KoMqBvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+vNU0rwpoedAvPH5whLSXKHXX+jbsnAy1hKx_0To8KoMqBvA@mail.gmail.com>
X-ClientProxiedBy: PH2PEPF0000385F.namprd17.prod.outlook.com
 (2603:10b6:518:1::6d) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA6PR04MB11736:EE_
X-MS-Office365-Filtering-Correlation-Id: 128f6816-552c-407e-2f99-08de635b8f2f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?N2VacWwwRDNWTXFIcFpHclVNbm1iZGViajc4NUV5bzRZNjJJcU15RUsyM2M0?=
 =?utf-8?B?QUhHeGxKYmtkZWlvR051cGVHSGJvZ3BSSW9tQmh2bnlKZExEU21tdjk0eEZ2?=
 =?utf-8?B?V2xkM1luWmNCNmp0WTJxeWxraStMaGV4Tjlqais4cStGZVM0ZTVYcE01eUhP?=
 =?utf-8?B?b0lWSFBOV0d5b1QyR1JWT0xaYkdZNG5LQUNwRE1ibjRyNCszVUlNNXNxbHlK?=
 =?utf-8?B?WTRLSlhOTVRkWUpjV29CbHZIbWJEdkpmZStYZU13Sk1FT2dvTHR5elJNL3B4?=
 =?utf-8?B?bU43YlRXbnVTeWNxMDluekFOWmovYVQyZno4bGJyTnFNcHhBL3ppdmFNUEty?=
 =?utf-8?B?S2hyYWQwZzZuUTBkSkVmMEF2N2UzVzV6QjViR1R1bSsrcWw5Y3NzSWJmQXgw?=
 =?utf-8?B?NkEvUTk2QVI4MHRhME95WXRNYnl2d1EwdG83U0tlMGV5M3Q1MG5JSzBMZHE1?=
 =?utf-8?B?VHYvYUh0c1JXWkI2emwrdE55Z0p3QVRHTTdTMkloc1ZXTHNpaHAyWStWOXZw?=
 =?utf-8?B?L0dWNGVFUmgzYkhlZXlmMnp0RTZyV1EwYUcybUJVZDJJVHY0RXVDSWk0bThw?=
 =?utf-8?B?aHFlakhtb0JhMFRGeVI2dWNVUUcwL2x4QjBUM2ZHNFNYOC8reUtJMlMzSTFK?=
 =?utf-8?B?b2hmSlY2TmJ0UWVyUDB6ZWNYT1Y0WEJjTFZnY0V0MTBDOHdxdmExK2lpVTZW?=
 =?utf-8?B?VG9XaVJoYzljdVNPUVk2c0RTL1ZlYjUwd3NSSnRUNzYxYzBCU21DWjlKMTBm?=
 =?utf-8?B?YjNKN01QVW14OURHcm1UcnJ2S2puNWRzZWRUdXJCVXZDN3BMbGdST0hMN1hG?=
 =?utf-8?B?MUZiUnFtNXV5b0xXRFg5Y2plUWtVWmpZMHp3YXNsLzZCZXIrSTlnVG1YTlhU?=
 =?utf-8?B?eXRVQStqVmJaWC9WVHlZa3YrRlBuL080ai9Wd2NsNmdPbGNZMmwxTTlRZ21n?=
 =?utf-8?B?MlhkSXlRSjRPSW5lMG1pQzNWRHk0YlIwdkFBcm44aHBDL3dqdy9OUWZ4THBi?=
 =?utf-8?B?VUlTUmRjd0pKMVhkQkIxTHVVM0J2RjJKMWtoQVU1TXRHTm9CbFQvNzhrQnZp?=
 =?utf-8?B?SzlzeDVTTXVoK293c0x6MVBSb2tHWVJBenBYWjRydzFOUXRwRkoxZFdhLzlp?=
 =?utf-8?B?MlZkT3Z3S3RRSjNIdVJqeExxOXUzWjJzQnlDVWxzUStlNW01aEpaMllNWDRH?=
 =?utf-8?B?SzY3cUVod2FqR2kzbllHcmxVVTQwYjd1VE5nNW9MaGdGRnk0ZE1yRjloRUdS?=
 =?utf-8?B?cGR6L2tzci9nYytoL3BQMGZmOWFmaVkwUEZXRkhIbXVNK3VXV1daLy93Vmoy?=
 =?utf-8?B?NW5GMkJkMGpkS3pxaTZnYnFhSFB3ZEIvcldDQW1lUHRNVVAxR1oveGN5aFZa?=
 =?utf-8?B?dVFHY0VWV3AyWmxxM1YrRXBrcWRuVlg4aWZGekMvMzlLOTY3STBUZVhReS9j?=
 =?utf-8?B?Z1poajBnVzZCRDhUbDNvSG1nMndVZXExVGt1cW44VVZ6Y2wwdC9uSUp5VHQr?=
 =?utf-8?B?NkFPSHNPaFhCc0kxamRselplMWZEbm01OFNtaUsxaU9Ca21SWVo4SEdpR1c1?=
 =?utf-8?B?SU1iN0tldnJrbXZGU2QwNVZUU2Z3alpSYnZuZXc2NitEYWJkdnMyWXZLa1RB?=
 =?utf-8?B?UFRaeFBlNHQ3b0JOZTNyZHBLYzRSaW5SNHVTcGFZa1ozMURGNkFiWnJDMTR4?=
 =?utf-8?B?N1hlcGo4NWlOSjJNOVRSRE1NQ0dHUDVDYzcwbXBjaWs5UEJKTEhvWmpxZlN4?=
 =?utf-8?B?TmxxaEowU1ZuY3VuVG1RMFh5czU2YTRPL2xCTmJQR05abFRudUpiOGdXWHE1?=
 =?utf-8?B?ejkyVVJTaFlhQnFLU09hQ2lqeHREV3hzVWZtNG5VU01vd3E1clZpWHMzU0dq?=
 =?utf-8?B?TXJhQ1hCaWVsWWY1S2JYK0E3QUl3T2g1VWVCZDV5Z285RVIzRzB6eFZaZjNs?=
 =?utf-8?B?NDhkak9ZMGRZUm42bUxzamtSZlB2eVR0THNjTlhNSE4zTnJMN094SFNKc3Va?=
 =?utf-8?B?VE9zVmhSSVJFSTcrdTYzLy9TS21ZQ1NhOTRGNGFSc2lHd2FYREk1ajF5aFRY?=
 =?utf-8?B?NGVpeVB4bnVDZHhkVGR5aTNCZ00zSGlGWHkxeGgzUHBaQ3pzNlAwV1hPbFNk?=
 =?utf-8?B?Z2RlZG1BdHZteEZDTlBiemRjSEFrbWlJOVFINGtSSEt3NThoRjhIVjEvSU1L?=
 =?utf-8?Q?+bXj9DLREWyUxpvDUFuBlgP0CUMWR5LlbdUM3sKhVeHC?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dms1ajBOUUxJaW9EV1h0U1FtS3o2cURXSHFZUEowRDdaK1ZRRUZGVko0emo1?=
 =?utf-8?B?eTB4RDhtVEorWVdMTXUxU3NNNnNNYlZ3R1U1M0JNV1h2UmJUWGREb29YT1Ew?=
 =?utf-8?B?cHdwQ3NDbVBKQkxDWUlrc3dYNXRVdmd2MjN4K0lydlB2UWVhSk5MbFdFNXVq?=
 =?utf-8?B?cjk4ZG4rYjNVczZKbXVzZTdnVDVnTUw3LzFBUUJ1ck80bERveVZXdGpzeHA2?=
 =?utf-8?B?TEY4YTZ6cEVac2IyeXE4YUZVak5LblE4ZHQ4cHVKM0d6ZStxa1k3amJGdnJW?=
 =?utf-8?B?M2xoeExYNFY0RmF6OWY4Ukx2NXUvQzlpaDZ1Ym5XR0FFeWlRS0syNkdHU1dC?=
 =?utf-8?B?ZTU0cjBsSnp0bUFOelVTSDJsUmdDZkpuU29sKy8wZ0l3cUNLWWluU0g4Vmxj?=
 =?utf-8?B?Z25BWTY1REg3c2dyakZwSFZKS3kwQVBRaG0rbHZuZUU3bkkvQmc0WU1FdkpR?=
 =?utf-8?B?UDllSUVqTmg2TCtoMGx4Tll2eDc4ZTRLZENLeHVJamRVWVRnQS9Sb3BRK3Nt?=
 =?utf-8?B?bEJJUC9nVVBBekRCbGt1UFNFenVsQ0VWazVZRjBLRTFNWVlFSXMwS2ZuYjZp?=
 =?utf-8?B?RWVrZytxMStJbGF4VWI3TENVOXlXRkxpZlVTWWpmZWhTcVBTNXlBL1YzK1dy?=
 =?utf-8?B?L3JPR1Fhd0tXb2N3YVhNRWQ0ZUtKbzhzakRJMlBPQVV4SGdQQjF4WE9qcTB3?=
 =?utf-8?B?bUFXQTBHNXdNQlYzZDBKakl2cjBFV3pNQ3NQTmdSc2paclQ3bWdVTDJmRVUw?=
 =?utf-8?B?NkR6ams0Y0U5bi8veXAyL21CYVBlMHA0L0JoNmNQbHBzTGcvOGtHWXY3T3Rx?=
 =?utf-8?B?QWtsZDRNK2tuelVManQyRmxTY2h6akpFbVdWdk9FaUtURVhlNEpRZzJVV0x4?=
 =?utf-8?B?SldRUjBPa1NvZmNEOTZ3bUhBVEtLK2pYUmlBSlg1MXBuVCszOFpoQ2tYc1BU?=
 =?utf-8?B?QkJnbTErQmoyNkJsenNabS9wY0hLSG9TWDNLa0NWTkhKUXgwSWVnUm0wS2s4?=
 =?utf-8?B?SDhWS2ZTZ3pnZThwWTVBTGh5RGdUNVRZTHJuODAzK0ltRUg3alQ5U0VhcGRK?=
 =?utf-8?B?bHdoRjdneE5WNTB3S3NDTXpBdk9HZW5US2t1VW5pRFFqM05HeVJSOGlYMkQ5?=
 =?utf-8?B?Qm9DeUNRaFVHbmFhZ2sraDlzWHBOUlBnVTdLMnR5Nlh3RmtkNzFXS21YNjlm?=
 =?utf-8?B?clprNFJjOUhPa2xYVWMvSTJEc2tZYmo4V01oVDFrQ2ttMEE0ODdCUUp0VHNt?=
 =?utf-8?B?MGJiVGJrY3JyT0N2ME1GWlhXbzcrZTcxVWZwbTc0RGNJK1RYOThPdG0vc253?=
 =?utf-8?B?K2FkZ1I4NGpZUk84MjBXSk9VYkdUdHZlNGZKS0NPbk8vWFBiQkpBZHh1cnlR?=
 =?utf-8?B?YVRaNlQ1akp1TEFYRkhsU1dTaE02RUVxU3h3SXNKVFl4ZFN2bnZQT1BIMjVS?=
 =?utf-8?B?S3VXNUJGQkliQ09Qdk9ZazdZTlY0MzdVbHMvQXM1eUZlWTRlQzhsdmZYVTBl?=
 =?utf-8?B?ekJ1d2Q5YUFrSzNzWG5aSGtMWGNwU0NvOEpBZENYNG12akdSK0Jma0t3a29G?=
 =?utf-8?B?cnUrM3BTd212a3I4Um1IcU9WUTJ1UUZJMmZRMG81engzMThuS0xWamxZYTlC?=
 =?utf-8?B?emliT2hjTy80U3pkdTNjbGljV0xNRWpiNGQ2WURzemFVTHN3WkR1aWNQZVk5?=
 =?utf-8?B?cVJkdVU4YWdQb3cyRElNeUZhRmJLSkVHNFArQllyK1VQVzArVFpud0ltQnhr?=
 =?utf-8?B?OWx3MnowcXQ0ODZCRnovWHJrbWtUUWpYeXBKTmZacmwrSmVLZFYwaFN2THVz?=
 =?utf-8?B?a2Fjb0dHQXlzMmg0Wjk4Um9TYWJ3Q2tlcjIzWW1JQmc1M3ZyOWxMZzZFM3ha?=
 =?utf-8?B?NWRCSU5lZzJoWGZ0SWVid1J6bEY0Q25RZ2pydHpHaDNmTFhEK09ROXpkQitB?=
 =?utf-8?B?b0puc1g1b2pQNC95VENOZWlpK2piZFA5MWRZcTc2WkV3VC96RmpjajRQZzJq?=
 =?utf-8?B?US9uTDRhMGx1dmFGcTM5L1ljVkZrL0h1NHJQWXRWaFByOVNYMEhGQ0VUUHhS?=
 =?utf-8?B?QjJYeEVkaXBZVzFsdlVaWjlBN2dOZHJKR0htK0ZIdmcvbXNZd25BOTJKQjRz?=
 =?utf-8?B?dGM2cWFxQTdHYVdXSHg1TTZpSUYxN0hVVFlmd2tsM1ZTLzFrQUNsNlN0anJZ?=
 =?utf-8?B?NTNWelBzSzZIMFowRzlXdGV6cmU2amRPRUlzN0FEWWkyTUxmTjNXM0cvSkVK?=
 =?utf-8?B?U2U0eUUrK1NOc2ZsVmRwWkxVRjdqeUF6NFRiSXJDS25HNjNtazUzcExEa20w?=
 =?utf-8?Q?UOlR0SCNLPIBtfKF5s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128f6816-552c-407e-2f99-08de635b8f2f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 19:36:43.2267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqKna+pbeDksFtHTzA3kRM0GzwOZssNEB6nk3JetN7AkuIroDzAbZlgNpi7hewimPmeLTtx3nywQrlVtPV3Org==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11736

On Tue, Feb 03, 2026 at 10:33:03AM -0800, Tim Harvey wrote:
> On Mon, Feb 2, 2026 at 11:16 AM Frank Li <Frank.li@nxp.com> wrote:
> >
> > On Mon, Feb 02, 2026 at 10:10:29AM -0800, Tim Harvey wrote:
> > > The GW7906 is based on the i.MX8M Mini SoC featuring:
> > >  - LPDDR4 DRAM
> > >  - eMMC FLASH
> > >  - microSD connector with UHS support
> > >  - LIS2DE12 3-axis accelerometer
> > >  - Gateworks System Controller
> > >  - IMX8M FEC
> > >  - software selectable RS232/RS485/RS422 serial transceiver
> > >  - PMIC
> > >  - 1x isolated RS232 UART
> > >  - 1x off-board bi-directional opto-isolated digital I/O
> > >  - 1x M.2 A-E Key Socket and 1x MiniPCIe socket with USB2.0 and PCIe
> > >    (resistor loading to route PCIe/USB2 between M.2 and MiniPCIe socket)
> > >
> > > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > > ---
> >
> > Any difference with gateworks,imx8mm-gw7904? Can reuse existed file?
> >
>
> Hi Frank,
>
> It has much more commonality with the gw7903 - I'll submit a v2 using
> that as a base.

Sherry is working on the similar work for imx93, you can refer
https://lore.kernel.org/imx/20260203080137.1492376-1-sherry.sun@nxp.com/T/#mf7aeb097bc03e3d7fca93d8e51ed933d838b9536

>
> >
> > >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> > >  .../dts/freescale/imx8mm-venice-gw7906.dts    | 869 ++++++++++++++++++
> > >  2 files changed, 870 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > > index 700bab4d3e60..83fc7faf81d8 100644
> > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > @@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
> > > +dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7906.dtb
> >
> > Please run https://github.com/lznuaa/dt-format for new dts to keep nice
> > node order,
> >
> > If output result is not good enough, let know
>
> I notice you asking people to do this but is that tool robust? Every
> dts I through at it crashes:
>
> $ git clone https://github.com/lznuaa/dt-format.git
> $ cd dt-format
> $ make
> $ ./dt-format ~/linux-6.18/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> Segmentation fault (core dumped)

which version imx8mm-evk.dts? It works at my side.

Frank

>
> Best Regards,
>
> Tim
>
> >
> > Frank
> >
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> > > new file mode 100644
> > > index 000000000000..ec146a2b7549
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> > > @@ -0,0 +1,869 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright 2026 Gateworks Corporation
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/input/linux-event-codes.h>
> > > +#include <dt-bindings/leds/common.h>
> > > +#include <dt-bindings/net/ti-dp83867.h>
> > > +#include <dt-bindings/phy/phy-imx8-pcie.h>
> > > +
> > > +#include "imx8mm.dtsi"
> > > +
> > > +/ {
> > > +     model = "Gateworks Venice GW7906 i.MX8MM board";
> > > +     compatible = "gateworks,imx8mm-gw7906", "fsl,imx8mm";
> > > +
> > > +     aliases {
> > > +             ethernet0 = &fec1;
> > > +             rtc0 = &gsc_rtc;
> > > +             rtc1 = &snvs_rtc;
> > > +             usb0 = &usbotg1;
> > > +     };
> > > +
> > > +     chosen {
> > > +             stdout-path = &uart2;
> > > +     };
> > > +
> > > +     memory@40000000 {
> > > +             device_type = "memory";
> > > +             reg = <0x0 0x40000000 0 0x80000000>;
> > > +     };
> > > +
> > > +     gpio-keys {
> > > +             compatible = "gpio-keys";
> > > +
> > > +             key-user-pb {
> > > +                     label = "user_pb";
> > > +                     gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
> > > +                     linux,code = <BTN_0>;
> > > +             };
> > > +
> > > +             key-user-pb1x {
> > > +                     label = "user_pb1x";
> > > +                     linux,code = <BTN_1>;
> > > +                     interrupt-parent = <&gsc>;
> > > +                     interrupts = <0>;
> > > +             };
> > > +
> > > +             key-erased {
> > > +                     label = "key_erased";
> > > +                     linux,code = <BTN_2>;
> > > +                     interrupt-parent = <&gsc>;
> > > +                     interrupts = <1>;
> > > +             };
> > > +
> > > +             key-eeprom-wp {
> > > +                     label = "eeprom_wp";
> > > +                     linux,code = <BTN_3>;
> > > +                     interrupt-parent = <&gsc>;
> > > +                     interrupts = <2>;
> > > +             };
> > > +
> > > +             switch-hold {
> > > +                     label = "switch_hold";
> > > +                     linux,code = <BTN_5>;
> > > +                     interrupt-parent = <&gsc>;
> > > +                     interrupts = <7>;
> > > +             };
> > > +     };
> > > +
> > > +     led-controller {
> > > +             compatible = "gpio-leds";
> > > +             pinctrl-names = "default";
> > > +             pinctrl-0 = <&pinctrl_gpio_leds>;
> > > +
> > > +             led-0 {
> > > +                     function = LED_FUNCTION_STATUS;
> > > +                     color = <LED_COLOR_ID_RED>;
> > > +                     label = "led01_red";
> > > +                     gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
> > > +                     default-state = "off";
> > > +             };
> > > +
> > > +             led-1 {
> > > +                     function = LED_FUNCTION_STATUS;
> > > +                     color = <LED_COLOR_ID_GREEN>;
> > > +                     label = "led01_grn";
> > > +                     gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
> > > +                     default-state = "off";
> > > +             };
> > > +
> > > +             led-2 {
> > > +                     function = LED_FUNCTION_STATUS;
> > > +                     color = <LED_COLOR_ID_RED>;
> > > +                     label = "led02_red";
> > > +                     gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
> > > +                     default-state = "off";
> > > +             };
> > > +
> > > +             led-3 {
> > > +                     function = LED_FUNCTION_STATUS;
> > > +                     color = <LED_COLOR_ID_GREEN>;
> > > +                     label = "led02_grn";
> > > +                     gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
> > > +                     default-state = "off";
> > > +             };
> > > +
> > > +             led-4 {
> > > +                     function = LED_FUNCTION_STATUS;
> > > +                     color = <LED_COLOR_ID_RED>;
> > > +                     label = "led03_red";
> > > +                     gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
> > > +                     default-state = "off";
> > > +             };
> > > +
> > > +             led-5 {
> > > +                     function = LED_FUNCTION_STATUS;
> > > +                     color = <LED_COLOR_ID_GREEN>;
> > > +                     label = "led03_grn";
> > > +                     gpios = <&gpio5 3 GPIO_ACTIVE_HIGH>;
> > > +                     default-state = "off";
> > > +             };
> > > +
> > > +             led-6 {
> > > +                     function = LED_FUNCTION_STATUS;
> > > +                     color = <LED_COLOR_ID_RED>;
> > > +                     label = "led04_red";
> > > +                     gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> > > +                     default-state = "off";
> > > +             };
> > > +
> > > +             led-7 {
> > > +                     function = LED_FUNCTION_STATUS;
> > > +                     color = <LED_COLOR_ID_GREEN>;
> > > +                     label = "led04_grn";
> > > +                     gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> > > +                     default-state = "off";
> > > +             };
> > > +
> > > +             led-8 {
> > > +                     function = LED_FUNCTION_STATUS;
> > > +                     color = <LED_COLOR_ID_RED>;
> > > +                     label = "led05_red";
> > > +                     gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
> > > +                     default-state = "off";
> > > +             };
> > > +
> > > +             led-9 {
> > > +                     function = LED_FUNCTION_STATUS;
> > > +                     color = <LED_COLOR_ID_GREEN>;
> > > +                     label = "led05_grn";
> > > +                     gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
> > > +                     default-state = "off";
> > > +             };
> > > +
> > > +             led-a {
> > > +                     function = LED_FUNCTION_STATUS;
> > > +                     color = <LED_COLOR_ID_RED>;
> > > +                     label = "led06_red";
> > > +                     gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
> > > +                     default-state = "off";
> > > +             };
> > > +
> > > +             led-b {
> > > +                     function = LED_FUNCTION_STATUS;
> > > +                     color = <LED_COLOR_ID_GREEN>;
> > > +                     label = "led06_grn";
> > > +                     gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
> > > +                     default-state = "off";
> > > +             };
> > > +     };
> > > +
> > > +     pcie0_refclk: pcie0-refclk {
> > > +             compatible = "fixed-clock";
> > > +             #clock-cells = <0>;
> > > +             clock-frequency = <100000000>;
> > > +     };
> > > +
> > > +     reg_3p3v: regulator-3p3v {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "3P3V";
> > > +             regulator-min-microvolt = <3300000>;
> > > +             regulator-max-microvolt = <3300000>;
> > > +             regulator-always-on;
> > > +     };
> > > +};
> > > +
> > > +&A53_0 {
> > > +     cpu-supply = <&buck2>;
> > > +};
> > > +
> > > +&A53_1 {
> > > +     cpu-supply = <&buck2>;
> > > +};
> > > +
> > > +&A53_2 {
> > > +     cpu-supply = <&buck2>;
> > > +};
> > > +
> > > +&A53_3 {
> > > +     cpu-supply = <&buck2>;
> > > +};
> > > +
> > > +&ddrc {
> > > +     operating-points-v2 = <&ddrc_opp_table>;
> > > +
> > > +     ddrc_opp_table: opp-table {
> > > +             compatible = "operating-points-v2";
> > > +
> > > +             opp-25000000 {
> > > +                     opp-hz = /bits/ 64 <25000000>;
> > > +             };
> > > +
> > > +             opp-100000000 {
> > > +                     opp-hz = /bits/ 64 <100000000>;
> > > +             };
> > > +
> > > +             opp-750000000 {
> > > +                     opp-hz = /bits/ 64 <750000000>;
> > > +             };
> > > +     };
> > > +};
> > > +
> > > +&fec1 {
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&pinctrl_fec1>;
> > > +     phy-mode = "rgmii-id";
> > > +     phy-handle = <&ethphy0>;
> > > +     local-mac-address = [00 00 00 00 00 00];
> > > +     status = "okay";
> > > +
> > > +     mdio {
> > > +             #address-cells = <1>;
> > > +             #size-cells = <0>;
> > > +
> > > +             ethphy0: ethernet-phy@0 {
> > > +                     compatible = "ethernet-phy-ieee802.3-c22";
> > > +                     reg = <0>;
> > > +                     ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> > > +                     ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> > > +                     ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> > > +                     tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > > +                     rx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > > +
> > > +                     leds {
> > > +                             #address-cells = <1>;
> > > +                             #size-cells = <0>;
> > > +
> > > +                             led@1 {
> > > +                                     reg = <1>;
> > > +                                     color = <LED_COLOR_ID_AMBER>;
> > > +                                     function = LED_FUNCTION_LAN;
> > > +                                     default-state = "keep";
> > > +                             };
> > > +
> > > +                             led@2 {
> > > +                                     reg = <2>;
> > > +                                     color = <LED_COLOR_ID_GREEN>;
> > > +                                     function = LED_FUNCTION_LAN;
> > > +                                     default-state = "keep";
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +};
> > > +
> > > +&gpio1 {
> > > +     gpio-line-names = "", "", "", "", "", "", "", "",
> > > +             "", "", "rs422_en#", "rs485_en#", "rs232_en#", "", "", "",
> > > +             "", "", "", "", "", "", "", "",
> > > +             "", "", "", "", "", "", "", "";
> > > +};
> > > +
> > > +&gpio2 {
> > > +     gpio-line-names = "", "", "", "", "", "", "dig1_ctl", "",
> > > +             "dig1_out#", "dig1_in", "", "", "", "", "", "",
> > > +             "", "", "", "", "", "", "", "",
> > > +             "", "", "", "", "", "", "", "";
> > > +};
> > > +
> > > +&gpio5 {
> > > +     gpio-line-names = "", "", "", "", "", "", "", "",
> > > +             "", "", "", "", "pci_wdis#", "", "", "",
> > > +             "", "", "", "", "", "", "", "",
> > > +             "", "", "", "", "", "", "", "";
> > > +};
> > > +
> > > +&i2c1 {
> > > +     clock-frequency = <100000>;
> > > +     pinctrl-names = "default", "gpio";
> > > +     pinctrl-0 = <&pinctrl_i2c1>;
> > > +     pinctrl-1 = <&pinctrl_i2c1_gpio>;
> > > +     scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +     sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +     status = "okay";
> > > +
> > > +     gsc: gsc@20 {
> > > +             compatible = "gw,gsc";
> > > +             reg = <0x20>;
> > > +             pinctrl-0 = <&pinctrl_gsc>;
> > > +             interrupt-parent = <&gpio4>;
> > > +             interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> > > +             interrupt-controller;
> > > +             #interrupt-cells = <1>;
> > > +             #address-cells = <1>;
> > > +             #size-cells = <0>;
> > > +
> > > +             adc {
> > > +                     compatible = "gw,gsc-adc";
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <0>;
> > > +
> > > +                     channel@6 {
> > > +                             gw,mode = <0>;
> > > +                             reg = <0x06>;
> > > +                             label = "temp";
> > > +                     };
> > > +
> > > +                     channel@8 {
> > > +                             gw,mode = <3>;
> > > +                             reg = <0x08>;
> > > +                             label = "vdd_bat";
> > > +                     };
> > > +
> > > +                     channel@82 {
> > > +                             gw,mode = <2>;
> > > +                             reg = <0x82>;
> > > +                             label = "vin";
> > > +                             gw,voltage-divider-ohms = <22100 1000>;
> > > +                             gw,voltage-offset-microvolt = <700000>;
> > > +                     };
> > > +
> > > +                     channel@84 {
> > > +                             gw,mode = <2>;
> > > +                             reg = <0x84>;
> > > +                             label = "vdd_5p0";
> > > +                             gw,voltage-divider-ohms = <10000 10000>;
> > > +                     };
> > > +
> > > +                     channel@86 {
> > > +                             gw,mode = <2>;
> > > +                             reg = <0x86>;
> > > +                             label = "vdd_3p3";
> > > +                             gw,voltage-divider-ohms = <10000 10000>;
> > > +                     };
> > > +
> > > +                     channel@88 {
> > > +                             gw,mode = <2>;
> > > +                             reg = <0x88>;
> > > +                             label = "vdd_0p9";
> > > +                     };
> > > +
> > > +                     channel@8c {
> > > +                             gw,mode = <2>;
> > > +                             reg = <0x8c>;
> > > +                             label = "vdd_soc";
> > > +                     };
> > > +
> > > +                     channel@8e {
> > > +                             gw,mode = <2>;
> > > +                             reg = <0x8e>;
> > > +                             label = "vdd_arm";
> > > +                     };
> > > +
> > > +                     channel@90 {
> > > +                             gw,mode = <2>;
> > > +                             reg = <0x90>;
> > > +                             label = "vdd_1p8";
> > > +                     };
> > > +
> > > +                     channel@92 {
> > > +                             gw,mode = <2>;
> > > +                             reg = <0x92>;
> > > +                             label = "vdd_dram";
> > > +                     };
> > > +
> > > +                     channel@a2 {
> > > +                             gw,mode = <2>;
> > > +                             reg = <0xa2>;
> > > +                             label = "vdd_gsc";
> > > +                             gw,voltage-divider-ohms = <10000 10000>;
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > > +     gpio: gpio@23 {
> > > +             compatible = "nxp,pca9555";
> > > +             reg = <0x23>;
> > > +             gpio-controller;
> > > +             #gpio-cells = <2>;
> > > +             interrupt-parent = <&gsc>;
> > > +             interrupts = <4>;
> > > +     };
> > > +
> > > +     eeprom@50 {
> > > +             compatible = "atmel,24c02";
> > > +             reg = <0x50>;
> > > +             pagesize = <16>;
> > > +     };
> > > +
> > > +     eeprom@51 {
> > > +             compatible = "atmel,24c02";
> > > +             reg = <0x51>;
> > > +             pagesize = <16>;
> > > +     };
> > > +
> > > +     eeprom@52 {
> > > +             compatible = "atmel,24c02";
> > > +             reg = <0x52>;
> > > +             pagesize = <16>;
> > > +     };
> > > +
> > > +     eeprom@53 {
> > > +             compatible = "atmel,24c02";
> > > +             reg = <0x53>;
> > > +             pagesize = <16>;
> > > +     };
> > > +
> > > +     gsc_rtc: rtc@68 {
> > > +             compatible = "dallas,ds1672";
> > > +             reg = <0x68>;
> > > +     };
> > > +};
> > > +
> > > +&i2c2 {
> > > +     clock-frequency = <400000>;
> > > +     pinctrl-names = "default", "gpio";
> > > +     pinctrl-0 = <&pinctrl_i2c2>;
> > > +     pinctrl-1 = <&pinctrl_i2c2_gpio>;
> > > +     scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +     sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +     status = "okay";
> > > +
> > > +     pmic@4b {
> > > +             compatible = "rohm,bd71847";
> > > +             reg = <0x4b>;
> > > +             pinctrl-names = "default";
> > > +             pinctrl-0 = <&pinctrl_pmic>;
> > > +             interrupt-parent = <&gpio3>;
> > > +             interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> > > +             rohm,reset-snvs-powered;
> > > +             #clock-cells = <0>;
> > > +             clocks = <&osc_32k>;
> > > +             clock-output-names = "clk-32k-out";
> > > +
> > > +             regulators {
> > > +                     /* vdd_soc: 0.805-0.900V (typ=0.8V) */
> > > +                     BUCK1 {
> > > +                             regulator-name = "buck1";
> > > +                             regulator-min-microvolt = <700000>;
> > > +                             regulator-max-microvolt = <1300000>;
> > > +                             regulator-boot-on;
> > > +                             regulator-always-on;
> > > +                             regulator-ramp-delay = <1250>;
> > > +                     };
> > > +
> > > +                     /* vdd_arm: 0.805-1.0V (typ=0.9V) */
> > > +                     buck2: BUCK2 {
> > > +                             regulator-name = "buck2";
> > > +                             regulator-min-microvolt = <700000>;
> > > +                             regulator-max-microvolt = <1300000>;
> > > +                             regulator-boot-on;
> > > +                             regulator-always-on;
> > > +                             regulator-ramp-delay = <1250>;
> > > +                             rohm,dvs-run-voltage = <1000000>;
> > > +                             rohm,dvs-idle-voltage = <900000>;
> > > +                     };
> > > +
> > > +                     /* vdd_0p9: 0.805-1.0V (typ=0.9V) */
> > > +                     BUCK3 {
> > > +                             regulator-name = "buck3";
> > > +                             regulator-min-microvolt = <700000>;
> > > +                             regulator-max-microvolt = <1350000>;
> > > +                             regulator-boot-on;
> > > +                             regulator-always-on;
> > > +                     };
> > > +
> > > +                     /* vdd_3p3 */
> > > +                     BUCK4 {
> > > +                             regulator-name = "buck4";
> > > +                             regulator-min-microvolt = <3000000>;
> > > +                             regulator-max-microvolt = <3300000>;
> > > +                             regulator-boot-on;
> > > +                             regulator-always-on;
> > > +                     };
> > > +
> > > +                     /* vdd_1p8 */
> > > +                     BUCK5 {
> > > +                             regulator-name = "buck5";
> > > +                             regulator-min-microvolt = <1605000>;
> > > +                             regulator-max-microvolt = <1995000>;
> > > +                             regulator-boot-on;
> > > +                             regulator-always-on;
> > > +                     };
> > > +
> > > +                     /* vdd_dram */
> > > +                     BUCK6 {
> > > +                             regulator-name = "buck6";
> > > +                             regulator-min-microvolt = <800000>;
> > > +                             regulator-max-microvolt = <1400000>;
> > > +                             regulator-boot-on;
> > > +                             regulator-always-on;
> > > +                     };
> > > +
> > > +                     /* nvcc_snvs_1p8 */
> > > +                     LDO1 {
> > > +                             regulator-name = "ldo1";
> > > +                             regulator-min-microvolt = <1600000>;
> > > +                             regulator-max-microvolt = <1900000>;
> > > +                             regulator-boot-on;
> > > +                             regulator-always-on;
> > > +                     };
> > > +
> > > +                     /* vdd_snvs_0p8 */
> > > +                     LDO2 {
> > > +                             regulator-name = "ldo2";
> > > +                             regulator-min-microvolt = <800000>;
> > > +                             regulator-max-microvolt = <900000>;
> > > +                             regulator-boot-on;
> > > +                             regulator-always-on;
> > > +                     };
> > > +
> > > +                     /* vdda_1p8 */
> > > +                     LDO3 {
> > > +                             regulator-name = "ldo3";
> > > +                             regulator-min-microvolt = <1800000>;
> > > +                             regulator-max-microvolt = <3300000>;
> > > +                             regulator-boot-on;
> > > +                             regulator-always-on;
> > > +                     };
> > > +
> > > +                     LDO4 {
> > > +                             regulator-name = "ldo4";
> > > +                             regulator-min-microvolt = <900000>;
> > > +                             regulator-max-microvolt = <1800000>;
> > > +                             regulator-boot-on;
> > > +                             regulator-always-on;
> > > +                     };
> > > +
> > > +                     LDO6 {
> > > +                             regulator-name = "ldo6";
> > > +                             regulator-min-microvolt = <900000>;
> > > +                             regulator-max-microvolt = <1800000>;
> > > +                             regulator-boot-on;
> > > +                             regulator-always-on;
> > > +                     };
> > > +             };
> > > +     };
> > > +};
> > > +
> > > +&i2c3 {
> > > +     clock-frequency = <400000>;
> > > +     pinctrl-names = "default", "gpio";
> > > +     pinctrl-0 = <&pinctrl_i2c3>;
> > > +     pinctrl-1 = <&pinctrl_i2c3_gpio>;
> > > +     scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +     sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +     status = "okay";
> > > +
> > > +     accelerometer@19 {
> > > +             pinctrl-names = "default";
> > > +             pinctrl-0 = <&pinctrl_accel>;
> > > +             compatible = "st,lis2de12";
> > > +             reg = <0x19>;
> > > +             st,drdy-int-pin = <1>;
> > > +             interrupt-parent = <&gpio1>;
> > > +             interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> > > +     };
> > > +};
> > > +
> > > +&pcie_phy {
> > > +     fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
> > > +     fsl,clkreq-unsupported;
> > > +     clocks = <&pcie0_refclk>;
> > > +     clock-names = "ref";
> > > +     status = "okay";
> > > +};
> > > +
> > > +&pcie0 {
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&pinctrl_pcie0>;
> > > +     reset-gpio = <&gpio5 11 GPIO_ACTIVE_LOW>;
> > > +     clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
> > > +              <&clk IMX8MM_CLK_PCIE1_AUX>;
> > > +     assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
> > > +                       <&clk IMX8MM_CLK_PCIE1_CTRL>;
> > > +     assigned-clock-rates = <10000000>, <250000000>;
> > > +     assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
> > > +                              <&clk IMX8MM_SYS_PLL2_250M>;
> > > +     status = "okay";
> > > +};
> > > +
> > > +&disp_blk_ctrl {
> > > +     status = "disabled";
> > > +};
> > > +
> > > +&pgc_mipi {
> > > +     status = "disabled";
> > > +};
> > > +
> > > +/* console */
> > > +&uart2 {
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&pinctrl_uart2>;
> > > +     status = "okay";
> > > +};
> > > +
> > > +&usbotg1 {
> > > +     dr_mode = "host";
> > > +     disable-over-current;
> > > +     status = "okay";
> > > +};
> > > +
> > > +/* microSD */
> > > +&usdhc2 {
> > > +     pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > > +     pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > > +     pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> > > +     pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> > > +     cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
> > > +     bus-width = <4>;
> > > +     vmmc-supply = <&reg_3p3v>;
> > > +     status = "okay";
> > > +};
> > > +
> > > +/* eMMC */
> > > +&usdhc3 {
> > > +     pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > > +     pinctrl-0 = <&pinctrl_usdhc3>;
> > > +     pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> > > +     pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> > > +     assigned-clocks = <&clk IMX8MM_CLK_USDHC3>;
> > > +     assigned-clock-rates = <400000000>;
> > > +     bus-width = <8>;
> > > +     non-removable;
> > > +     status = "okay";
> > > +};
> > > +
> > > +&wdog1 {
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&pinctrl_wdog>;
> > > +     fsl,ext-reset-output;
> > > +     status = "okay";
> > > +};
> > > +
> > > +&iomuxc {
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&pinctrl_hog>;
> > > +
> > > +     pinctrl_hog: hoggrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10      0x40000041 /* RS422# */
> > > +                     MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11      0x40000041 /* RS485# */
> > > +                     MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12      0x40000041 /* RS232# */
> > > +                     MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9        0x40000041 /* DIG1_IN */
> > > +                     MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8        0x40000041 /* DIG1_OUT */
> > > +                     MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6        0x40000041 /* DIG1_CTL */
> > > +                     MX8MM_IOMUXC_ECSPI2_MISO_GPIO5_IO12     0x40000041 /* PCI_WDIS# */
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_accel: accelgrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15      0x159
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_fec1: fec1grp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_ENET_MDC_ENET1_MDC                 0x3
> > > +                     MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO               0x3
> > > +                     MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3           0x1f
> > > +                     MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2           0x1f
> > > +                     MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1           0x1f
> > > +                     MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0           0x1f
> > > +                     MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3           0x91
> > > +                     MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2           0x91
> > > +                     MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1           0x91
> > > +                     MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0           0x91
> > > +                     MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC           0x0
> > > +                     MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC           0x91
> > > +                     MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL     0x91
> > > +                     MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL     0x1f
> > > +                     MX8MM_IOMUXC_SAI2_TXFS_GPIO4_IO24               0x19 /* IRQ# */
> > > +                     MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25                0x19 /* RST# */
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_gsc: gscgrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26       0x159
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_i2c1: i2c1grp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL          0x400001c3
> > > +                     MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA          0x400001c3
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_i2c1_gpio: i2c1gpiogrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_I2C1_SCL_GPIO5_IO14        0x400001c3
> > > +                     MX8MM_IOMUXC_I2C1_SDA_GPIO5_IO15        0x400001c3
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_i2c2: i2c2grp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL          0x400001c3
> > > +                     MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA          0x400001c3
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_i2c2_gpio: i2c2gpiogrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_I2C2_SCL_GPIO5_IO16        0x400001c3
> > > +                     MX8MM_IOMUXC_I2C2_SDA_GPIO5_IO17        0x400001c3
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_i2c3: i2c3grp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL          0x400001c3
> > > +                     MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA          0x400001c3
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_i2c3_gpio: i2c3gpiogrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18        0x400001c3
> > > +                     MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19        0x400001c3
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_gpio_leds: gpioledgrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5    0x19
> > > +                     MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30        0x19
> > > +                     MX8MM_IOMUXC_SAI3_MCLK_GPIO5_IO2        0x19
> > > +                     MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14      0x19
> > > +                     MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9       0x19
> > > +                     MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3         0x19
> > > +                     MX8MM_IOMUXC_SAI3_RXC_GPIO4_IO29        0x19
> > > +                     MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28       0x19
> > > +                     MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13      0x19
> > > +                     MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31       0x19
> > > +                     MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4         0x19
> > > +                     MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8       0x19
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_pcie0: pciegrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_ECSPI2_MOSI_GPIO5_IO11     0x41
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_pmic: pmicgrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_NAND_DATA02_GPIO3_IO8      0x41
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_uart2: uart2grp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX     0x140
> > > +                     MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX     0x140
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_usdhc2: usdhc2grp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x190
> > > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d0
> > > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d0
> > > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d0
> > > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d0
> > > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d0
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x194
> > > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d4
> > > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d4
> > > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d4
> > > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d4
> > > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d4
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x196
> > > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d6
> > > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d6
> > > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d6
> > > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d6
> > > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d6
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12        0x1c4
> > > +                     MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT  0x1d0
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_usdhc3: usdhc3grp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x190
> > > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d0
> > > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d0
> > > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d0
> > > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d0
> > > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d0
> > > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d0
> > > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d0
> > > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d0
> > > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d0
> > > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x190
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x194
> > > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d4
> > > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d4
> > > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d4
> > > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d4
> > > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d4
> > > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d4
> > > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d4
> > > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d4
> > > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d4
> > > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x194
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x196
> > > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d6
> > > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d6
> > > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d6
> > > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d6
> > > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d6
> > > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d6
> > > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d6
> > > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d6
> > > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d6
> > > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x196
> > > +             >;
> > > +     };
> > > +
> > > +     pinctrl_wdog: wdoggrp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B    0xc6
> > > +             >;
> > > +     };
> > > +};
> > > --
> > > 2.25.1
> > >
