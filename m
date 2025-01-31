Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013009.outbound.protection.outlook.com [40.107.159.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B90158875
	for <imx@lists.linux.dev>; Fri, 31 Jan 2025 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738335501; cv=fail; b=unIHXQU7QxQMcQfzW1P20YpDbe82l3SXhxWomOAUNT0b3c3EoYYOepPZUOk7bWWsLsrg/F6sJtnjnv0HrjJDXjHFBCg50jhXl5z1ODas5GdSUDObOskAVfTxXjf6H+Rav7UaTQN/xUbdyyUIpCQlgcHYRGCv4DdYI/MaFDSgQKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738335501; c=relaxed/simple;
	bh=hx8fzRi08zit4GCbfAN0KmlLIZmgtvxUF8Q5kM2G8wA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=opt5mSY67OIs8d0Yge+iOlbPLoEkdzf/llliDioJ2Z/c0GHBqQ9XavVzrG/cVxEymZMMW6szsQtZ8uIbHSCZByfnIiBdAtqZWpwCb0MyfhfERZT0ZkK73w+c2Y/+8ryKbnjEgvWRgyErbe/O4J2L+l8Nuy3wMzYYZJxgU3bAw+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ATRXL4sM; arc=fail smtp.client-ip=40.107.159.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ATRXL4sM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2YfyZZnTK38oHnf9YYFb2OFTmaIc7ghx0C2L6RErblTKdMJ+0ow7KQOX025Yn4rJoxxX4Ss7pzyZGW87bpBM1yx0WRQmZ3Cika3lpqrIuU0m5zATNl5hh7DSe5D4jwXtyvb0w7srctSZSNjzYs/wJTdV1zrfr0AaBYBRTNt+0d7irssROjVrki9kdFiRe7qUJpTQ6wAGy76XhH/5xV+Q2Bz/V092zYrZ/C/zCTsz+BdzckeGbe0cVg0Vu9JLhI/jaFoxqCydnU0GwLGvsaBZ25+6MF0fW9wbg0qKn1IA4t4lwohoCwvc0KqdxOxLVLGdVkplytMa+XGOBbMh0oqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hx8fzRi08zit4GCbfAN0KmlLIZmgtvxUF8Q5kM2G8wA=;
 b=jDWrgbz1KJk1P4dhu/K0fzKD5oAVLDIxnReXJWX4DH3Naumg8s2PEdDfVwXNlbdly1uNxwM+fBG5ASk61bLWVfu/Nt7Y3UMTAncPIhgmt8ZAyJiWJzoGsasHx6ofjg2lsYA7SpK0Qa+e4iAf+SgWf/iIUaVOZSSdZA7GwOiVxiu+zzWdzblUBynYU29mAOghR12e/BKGvPX+iVRzQ4JeznEt0boxbEXJqIn4RHVnqy3OVgg0wawNBylK4E4z3Hzos8ZzH01J2fxsMpUOnZX1sJLjexR6Ya45i1ALU3gExbWxWt9QZx0zu+3kMPppcKlTrVHzvNY5/WZR6nAU13dPWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hx8fzRi08zit4GCbfAN0KmlLIZmgtvxUF8Q5kM2G8wA=;
 b=ATRXL4sMZ1tFlegTSyCFQie2/6e4NS3C3j+y3m65i/BltMDpRWu9A6UBm0Ti45pj6Y27c4RPK4MC/LOFkknDC3KXyUIX0SpBORCDvS29fL8t5HX9LbVtV0cMndNf+eOn7ZDqG2hFgFXXORJJ0g0bmqbdES5tSfzZeNoB7QrtogXHrjqv0QiyrHRE7ubg1F7lBvzky28S2OWZhQhc8hFFYisW8QuJwP+W/rMy31dXH9JeTJRkfbgYckKR2RgDhcpKTPwdM5t0u2pl8haQE4EyheDomOxJ8ilt1bN7pBmgxcqiNHOSJcyLBmbIxqpNUBpIc7fxrckf1lPhwdhUJ5MeJQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM9PR04MB8748.eurprd04.prod.outlook.com (2603:10a6:20b:409::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 14:58:12 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 14:58:11 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, dl-linux-imx
	<linux-imx@nxp.com>
Subject: Re: [PATCH] reset: gpio: Add self-deasserting reset callback
Thread-Topic: [PATCH] reset: gpio: Add self-deasserting reset callback
Thread-Index: AQHbc/CMO1yU63m65EiWgWk/Ov2d+Q==
Date: Fri, 31 Jan 2025 14:58:11 +0000
Message-ID:
 <PAXPR04MB91858A6F0917109DFF33110B89E82@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20250130215306.60589-1-shenwei.wang@nxp.com>
 <dca86a09-b763-4a0a-bb46-9cf6043cffe2@kernel.org>
In-Reply-To: <dca86a09-b763-4a0a-bb46-9cf6043cffe2@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM9PR04MB8748:EE_
x-ms-office365-filtering-correlation-id: 74a8f949-e2cc-441d-a323-08dd4207ae9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K1dJZXlESEwzVXNoRTBhazdUOFQ0TXNDNFhYaGdtbXlYT3NrTitEUGpwVVdj?=
 =?utf-8?B?cm1VdEQ1Skh1WFEyUGVUUkhoanhpZ21MRUJFUFBVQk13bnZpRlZ4VXlaWTkv?=
 =?utf-8?B?UlRCN0tyVTh0WU1LTlNsTU5JYUhVV2d1RXMvdUJvVkRMMWRHdmJoM3RxRkYw?=
 =?utf-8?B?Q08xclVpSndkYmFLOEY1cHA0cDRya0ZuR0h6WFEyOTM2SVEwQ1B4YkZiTE91?=
 =?utf-8?B?a0RlcFRKSnoxWXltTXFqVSs0WVp5ZnhwWkg2VFpNYjU3T3BzaE4zVXZHSU5y?=
 =?utf-8?B?QWI5SDJIT3Uza1JFeWlSRlJPZi9HSUlBbFJEc1FqVlIreGdDYldFc01zSURu?=
 =?utf-8?B?WFVkdjhEblVVQUFORTlpcHR1RTh2L05IZm9qQlVyelNRVS9QV3Y1bkNQK3g0?=
 =?utf-8?B?TUYrQzlUdzBOZHN1UWJGbzdoYmZhMElHbk9ycHdvdWNDek5yaTFhOW1GQUNl?=
 =?utf-8?B?bmRHdFowY2w1TkJWczJBSzdwQnBtQzkxTnJia1pJcmlmaVFZQWtKQ04yN3hC?=
 =?utf-8?B?eWxkWjJpc1kvUmhEaVJ4T0JaK0d2L3BmT0lQU3ZXWms0SGN3NW5PMFdGMFQ3?=
 =?utf-8?B?S1RtY1lDNk5iemRtTkVxZWg5ZFBQdjYrcEpMTmhMVXorT2JMcUdKVWtMS0Qz?=
 =?utf-8?B?SC9jbXdQZ21SWGZlTkdtSXRTbkRJd2NaUzZteDA1ZlRZbkl3MnNackw5cTNp?=
 =?utf-8?B?TVZTQk95SjAzSVJyNE1PMTJ0WDJiRnlLSW9weE5JR2xuWGZSZHdGczhUeEpY?=
 =?utf-8?B?amh0b0VsK3NPTTQ5eE5wQzY4dWxsdm8wQzdEenJPS0tOS0VXbDdEQ1VxQmoz?=
 =?utf-8?B?ZE1kU1F2dzBVTnBGQVEya0oxSnBVRkJvekJ5b2FEL0xqSmJXdkV4SzhXL3pS?=
 =?utf-8?B?Rnlha0djSVc2UVUxWmEvQ2NXem5hbm10eTRqRXh6SDFabldwRjBobzlqOFFJ?=
 =?utf-8?B?aFU4SU8zTSs2MUsrWURGeUdjZUtIOHVWb3dTZlI3cHVDZytOcVErUFQ2SjJB?=
 =?utf-8?B?R0MrdHdITDROMnhMSTM0MUtWdDdNdmNuUmQvaEFVaFdneWFFUG5jTUxYM2l6?=
 =?utf-8?B?aThiQmc3SitSYzg1bVFxV24zb0VmUXdjbTk3OHlad3RMZ3hUcGIyYUlmRWNK?=
 =?utf-8?B?akJicEl6RnJ1SDhES0RvQmZpN2l0MVJML015cG1tbnNOSkE0OEkyL2YzKyt3?=
 =?utf-8?B?RzRwNVU2YzlVeGNwY3d0R3FTK25IVlBycUQ4c1FEZ3doV2RlNHAwMUw5UXEr?=
 =?utf-8?B?QWxRNXVwSUVoUzZlSnp6YUZsaloxVmlmMjJqYnZ0dkZPZ0V4NnBnNmIwT0I2?=
 =?utf-8?B?cmZNUGFIRU0ySGF1YktqRU5YckJDMUM0M054NUZ0YWE4OWlTendlejJmSE1q?=
 =?utf-8?B?MXM5WlZrcXVmcjVrNjJzVmxjaS94VmFBdmQzQTNVMkdSWkhvZ1BpREVpTElo?=
 =?utf-8?B?NURvckZKV2dDMWlhWFd3WktxUWtIbHNyQnF5UGJXN3kyUWJIQ3Yzbis3eHUv?=
 =?utf-8?B?UnZ3SW1tQ3VHNXZxOHlWWlRtU0RYUHI5N2owVDgrZ0NId2JuSEtPMVRQNGNI?=
 =?utf-8?B?QWhGOGZ1U2M3OTRvNlpzQ0xmY3lEWXlJcjBKRjVYbG93QWRiYW5oSVFFcDZQ?=
 =?utf-8?B?OTIrNmZVMTB2TEF6UDlrN1Z0VE9NMDB1ZUtoY0c5M0N1Z3JkS0IyTGo1aTdS?=
 =?utf-8?B?MklOTDg3NVFhcnV0YWNBQkRmT0xLS21uc1R2Vzk5ekZ1UmdoT1FaQ2p3SS9j?=
 =?utf-8?B?YU5uTGJGazVzUFc4bVRzUENVTlNYVGJybUJjRzZHeE5kenpadEVWaGl4WllV?=
 =?utf-8?B?dUxuRzJXMFFFTmlRVkVjSzFmUmRlTEZnQUFsUjhBc1lHSEFxbHYvZUlnT2h0?=
 =?utf-8?B?eFkvMkl6UjN2RlV6NWdYejVzendrNjdLVjN4NUxDYktLVGovOEI2TUhNSHc1?=
 =?utf-8?Q?oUEhZ/yHyUGjPTvDGp7e8ym+Nl8OgRqS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vkt4RSszUU8wRTU2OFpwRGZpeG1SOGM4bWt4aGdIRVVLZXd3SGo2Y3kzRE1S?=
 =?utf-8?B?U1IxZ28xSmFrWERFTDFKNFhRazB2dnpReDEvVnBFN20zSXdacDBtMXphNjlo?=
 =?utf-8?B?SU9uNmhrUy9zKzB5ZE9XMGllRDVhYlBzbjgyNExzdGJqVzhkMmwrZzVUWDA1?=
 =?utf-8?B?b3BzWlZZcmR2aHFGekpCNng4LzYvcXdxRklSYUJ5Q1NSa2lVckhtSUF6MnRQ?=
 =?utf-8?B?VzFvdk8wTm83MmJaYnZwdmpDRWowY3JpNUNpUzdiZkVDSVVnZE9raFdYemly?=
 =?utf-8?B?amorelp6NDJkY3ptSGQ3c2pjU0h2dEkyUHV3V1NpRWNtUiswWFNIclRzWUJC?=
 =?utf-8?B?QmRydzJYRnk0NjRXaG5pbEt0b2RONVM1cVFaTXJHay9pUGRxQWF0eGtRcHRj?=
 =?utf-8?B?NmxRYVYrUmYyK0NhcjYyVE5ydkdDWXdadi9NUitwRWprOCtFdzJIczlDMDFC?=
 =?utf-8?B?dFpqM1JXNVpWenpFUmlGb3dTQTJUNUdIZ1NBUVRFMGI3VHdmdlJHVldsY3Ey?=
 =?utf-8?B?STg2WWJabVNHbURpSHMwV091R1ZNUW1LaFRoTno5MkhLbmxrMjZTU21Rckxr?=
 =?utf-8?B?eFI1SGxKZmdVR291RlR4STF4aVVHQWpWOEV3R0Znb1h5OUYzQloveVdXV3o5?=
 =?utf-8?B?NWRnSlBkTXhqckg0WE4yazFsT085SW1QZnVwOXpHWWhNK1BYT3hOS0pETDZV?=
 =?utf-8?B?ZThOaTd6ZjZQQmhyTXhSNWd3RkVDTlhIL013K0xXdEdFUlo3WmhSMWZIeTNz?=
 =?utf-8?B?dXBNa2lReWxvOVhFL21tRHZWOHhQcnRWd2l3cHdPZ0pZS00yT3VoT1p5aGts?=
 =?utf-8?B?eGdVeWtEd2p6dHMwQzZLTk9MYXRLNFAzYklFOTZEaVBPSFNxL3pGVEJtaEFa?=
 =?utf-8?B?RDBIZjNGYmpHL3RjOG5yTzR1OEl1alNkeW1mUWJaVW1aY3ZUT0pyMUQ5Mjdy?=
 =?utf-8?B?czJNTXMwQ1hRWVgvRHdYM1VrSVhwVE13V2VwNWtyeTV4K2ZDN0lzQ0U1cEdi?=
 =?utf-8?B?YXB4eFZ2UnBpM3ltSFprbVVuRnZyNnVOYkljODJsaVR6d1lwOEkvRmdpczhs?=
 =?utf-8?B?RktIdWRQTlBZS0xEOFN6Vm4xbldUL0NtZnRDWk4zemU4SklMUVNqTUZEb09J?=
 =?utf-8?B?TUxZV1RESzFJQ01CM0s1d1lZY0kxVFl0b2dKUTNIQnRYVGgxTDZyQ3pkcGtz?=
 =?utf-8?B?QURlOWZwcGpQeVJNUmMrS1d0cmVIOHVwUW5LNFdWejFXajlPWk9pa0I4aCtT?=
 =?utf-8?B?Qk1kam5rcDQ5U3dMZGVKV3ZyRVJjMDZRSklYdGVkcWZSMllHTUFRQzI1TWVI?=
 =?utf-8?B?V3AzN1RtM0FleGFPVUo5MkRVRkYwMlozSkFZVW0rN3Q4OEI1T1pjSVNVcDBP?=
 =?utf-8?B?MWdEODFXOXpEZGlUdGtIVkU4YVFLaVhVc08vNG5CZ2FseHBCNTFRKzlieGdB?=
 =?utf-8?B?bTdJM2syNlFEMjlUWHpONkxxYmRKWFZnK0ErcC9Ka04rVjJvck9qUWJ6dERn?=
 =?utf-8?B?N0IzTkZTMDVINVhxY2NtUXlGQjMvRTZaK05LM21yWXByMXhJeHZXV1dxMGJv?=
 =?utf-8?B?MlVXUlZUblFNSkc2ZHNwWXBYWUlCUnREMEhLZmdnYU04UHQzaXcxelV2OWRQ?=
 =?utf-8?B?QmRCTWNUMFM0aEdrNS9ua3dkbWYzdWkzT1c3dHkwSnd6YnRiR0FGb1V6K2M2?=
 =?utf-8?B?WGhNNEVUcG9nbmVrVG9velZIUlFNc0xlZWEzaG5EZEJ4K3NsV21zbkxaa3gx?=
 =?utf-8?B?azZ2REVvZ3hkQjJLRThFZkhEMHluMkhPdjFjaFl6OVJLY0Z4Y3Y4eDZmRS9U?=
 =?utf-8?B?M09MK3NyVmxiZ29mZXlFRnBvTTRQSjhjV3B3OWZsWUlRbGJCblFLeGtWc21K?=
 =?utf-8?B?b21Lb2wrdkwrRWUwRSttUFdETzZDR0NMNEZiVEF5OHg0aG1TQ1JHN0VLV0Y1?=
 =?utf-8?B?dk0zVlFwWkMwbFJ3L2YzUGhWVjIzN2tidnlGZE5BZVFIWHNCRU5wTTlXS0lU?=
 =?utf-8?B?dXVQNUxtRk5DVTRJWW93Mmc1QXBWMUJsakpmcDViSDF5ZGwzZEk1OW5VTlJu?=
 =?utf-8?B?OUFSeG1uMXlsWDgwTmNyc2JXMGJuaFRndFNpN1QzR3dLYzdJZVhYRlZTVnE4?=
 =?utf-8?Q?9g7XeO/cb8XunSkDD93pUKfKx?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a8f949-e2cc-441d-a323-08dd4207ae9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 14:58:11.7841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3dMPs/PxZ6QRUQWTXIBO/DEYNGzXdOB9TUaUeCrodvkcn9wfcphEev5WpvDvn78Ebh+4rOAhIpf5eK6gE1rReg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8748

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMzEsIDIwMjUg
MToxOCBBTQ0KPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT47IFBoaWxp
cHAgWmFiZWwNCj4gPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBpbXhAbGlzdHMubGlu
dXguZGV2OyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBbRVhU
XSBSZTogW1BBVENIXSByZXNldDogZ3BpbzogQWRkIHNlbGYtZGVhc3NlcnRpbmcgcmVzZXQgY2Fs
bGJhY2sNCj4gPg0KPiA+IEludHJvZHVjaW5nIHRoZSBzZWxmLWRlYXNzZXJ0aW5nIHJlc2V0IGNh
bGxiYWNrIGVuaGFuY2VzIGZsZXhpYmlsaXR5DQo+ID4gZm9yIHVzZXJzIGFuZCBlbmFibGVzIGEg
bW9yZSBzaW1wbGUgcmVzZXQgcHJvY2VzcyBkdXJpbmcgZGV2aWNlIGluaXRpYWxpemF0aW9uLg0K
PiANCj4gDQo+IFRoZSByZXNldCBjYWxsYmFjayB3YXMgbm90IGFkZGVkIG9uIHB1cnBvc2UgYW5k
IHlvdSB0b3RhbGx5IGlnbm9yZWQgdGhlIHJlYXNvbnMNCj4gaGVyZS4gU2VlIGJlbG93Lg0KPiAN
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54cC5j
b20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvcmVzZXQvcmVzZXQtZ3Bpby5jIHwgMTMgKysrKysr
KysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtZ3Bpby5jIGIvZHJpdmVycy9yZXNldC9y
ZXNldC1ncGlvLmMNCj4gPiBpbmRleCAyMjkwYjI1YjY3MDMuLjYxNGY5ZTI2MWExMyAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL3Jlc2V0L3Jlc2V0LWdwaW8uYw0KPiA+ICsrKyBiL2RyaXZlcnMv
cmVzZXQvcmVzZXQtZ3Bpby5jDQo+ID4gQEAgLTEsNSArMSw2IEBADQo+ID4gIC8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5
Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+DQo+ID4gICNpbmNsdWRl
IDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
Pg0KPiA+IEBAIC0zNyw2ICszOCwxNyBAQCBzdGF0aWMgaW50IHJlc2V0X2dwaW9fZGVhc3NlcnQo
c3RydWN0DQo+IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyYywNCj4gPiAgICAgICByZXR1cm4gMDsN
Cj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgcmVzZXRfZ3Bpb19yZXNldChzdHJ1Y3QgcmVz
ZXRfY29udHJvbGxlcl9kZXYgKnJjLCB1bnNpZ25lZA0KPiA+ICtsb25nIGlkKSB7DQo+ID4gKyAg
ICAgc3RydWN0IHJlc2V0X2dwaW9fcHJpdiAqcHJpdiA9IHJjX3RvX3Jlc2V0X2dwaW8ocmMpOw0K
PiA+ICsNCj4gPiArICAgICBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAocHJpdi0+cmVzZXQsIDEp
Ow0KPiA+ICsgICAgIHVzbGVlcF9yYW5nZSgxMCwgMjApOw0KPiANCj4gDQo+IE5vLCBiZWNhdXNl
IHRoaXMgaXMgc29tZSBhcmJpdHJhcnkgdmFsdWUgd2hpY2ggbWlnaHQgb3IgbWlnaHQgbm90IHdv
cmsuDQo+IElmIHRoaXMgZ2V0cyBhY2NlcHRlZCwgbmV4dCBwZXJzb24gd2lsbCBjaGFuZ2UgaXQg
dG8gdGhlaXIgb3duIG5lZWQuDQo+IFRoZW4gbmV4dCBwZXJzb24gd2lsbCByZXZlcnQgcHJldmlv
dXMgY2hhbmdlLi4uIGFuZCBzbyBvbi4NCj4gDQoNCklmIHRoZSBhcmJpdHJhcnkgdmFsdWUgaXMg
YSBjb25jZXJuLCB3b3VsZCBtb3ZpbmcgaXQgdG8gdGhlIERUUyBiZSBhbiBhcHByb3ByaWF0ZSBz
b2x1dGlvbj8NClRoaXMgbWF5IGdpdmUgdGhlIHVzZXIgbW9yZSBmbGV4aWJsZS4NCg0KU2hlbndl
aQ0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=
