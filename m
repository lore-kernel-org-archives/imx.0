Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD53259CAB
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 15:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102713; cv=fail; b=R7ymf3LBL++yEa7dS8uoDF+Enbstq1UcWSTO0YrRk+U0Nd++I23DNAZEJA8ztd/TYTnqmaEFexNOpy++SY0UjzpJyJYXrvo9sRxNqxnAowTpeiHnluuB3+EnCitTiTRlI9ITU5TCRN0JvdN+pSlu62D0ke3rTK2XmCAyf8VGwyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102713; c=relaxed/simple;
	bh=H51DTzwA+Xk8pSwfnLtjcKtnLlxETAb8BmS4EF+S0eo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m9yUuwbCnS+VcO01LjOpvAINA4sDvoADDT1wCLuqpD381i3uWyJqeYHJ8MEGaE2HhU254cdjwXHb1ZzVI9qWVtTRlLnLTdQd+X8RVGKhUa4HKEpYkmxL5VXbfsVLxe2A0DR446ynCWWnDyrh0dIS5uJYDTkmrZvzhUyvsoc/n3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oK2RKUPU; arc=fail smtp.client-ip=40.107.21.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oK2RKUPU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIIYlMeVt/1vZz7LhCHDPo96X/PVSZBXXwUcF9U+ajJz4NQfD2pBQvJY3ncqIfJaQ+lGafpwWGHKMNf9A8Lr/N1one8vC+8nkDKP+DriPDagWmjapN9tvBt0ktM4OxbDdXDOMVlOTPbZhctB5wdhSjba8yxFFAMwqohXRVlty4ZU4CHdZIoYHPfCRnycRdmlqnah1+RhaRndL7s1LYyZQ+c2kln7p+yOhog/HahUMubXsFhI1RIAOFqt/K4mIgbUUFMrW1z/ZmkqW91tpaNtKnsfNreA9EUHeJJqE+Nw5VKwM9IC517TKmrH+0TssVw6oSGvVsXKQGAv1Eg6bTfHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H51DTzwA+Xk8pSwfnLtjcKtnLlxETAb8BmS4EF+S0eo=;
 b=EqO9cub1B/c3QdtntVbcMoxGzdryzmA5wgQg7/QwcaLk22vxoixu5nM/jMZ6685HBzbWjv4UKwhBFQzyIapW+RXg8I0PUQC4+pe4t3m6yoUhIqgfwJ0BF9wpzoKwxMtJLPgAyHpvS+RhocKoFdLlFL3++uNd9kXx4wZDDr33/qRIm+X+a5u25oFIDcHoJA1IOizHY1RfXfh38oXVM/tdODQSXsA+L41+RqjVweybw0LSfLfINoFhLNfytn5Ej1AY7pGp8KmKV46XYoVwe4ZQBiS6JkQLunUneXlksAv/kXPv6OcVaet3gQSyxyqHpAgd9MmbYe+56eP02N6lUJHwxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H51DTzwA+Xk8pSwfnLtjcKtnLlxETAb8BmS4EF+S0eo=;
 b=oK2RKUPUYFo2DZTdAvIlDbDHuYjioee+drhyh06jvbSP8uyxWweGblB/Trb/Jx9tMBE3VNFxttzQdY/DIed9rJg2kHTW2c5KkDonSZZ43a0UPjibLubUnNvFXdijQqyRm1UDxgFhmQo2Uv01BNi+Z0agvt/M8trUyr3rabGRC1BAfn7f4LSFdIwBMAWTClYfujtl5lRI5ApJsMG+6Zr8eKBa7t1dF7rQJBr2e4mUB1W/91hSa2QzBAE5W0HwcfyrnoQEF72yWOAeKht2qJwibUSDlsEc6GaCUmGpzW5YOSDozgYrhsHlFW+BVwK85s+QfO5qDy6fGoH+vlf/7Q97HA==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAWPR04MB9768.eurprd04.prod.outlook.com (2603:10a6:102:381::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 15:38:28 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 15:38:28 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property
Thread-Topic: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property
Thread-Index: AQHbjOgzpPILpRKVCUGBCMqX1iCwX7Ni9I4AgAAOCaCAAA4IgIAABm0w
Date: Tue, 4 Mar 2025 15:38:27 +0000
Message-ID:
 <AS8PR04MB8642EFC83C65A92B75B6A83F87C82@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-2-ping.bai@nxp.com>
 <20250304131314.GA2441686-robh@kernel.org>
 <AS8PR04MB8642D20F0F5A7E8622A7685F87C82@AS8PR04MB8642.eurprd04.prod.outlook.com>
 <CAL_JsqJd06AOJKXFiDq=rihFa7qWnLciBeHKCKwkRUfF7AJTMA@mail.gmail.com>
In-Reply-To:
 <CAL_JsqJd06AOJKXFiDq=rihFa7qWnLciBeHKCKwkRUfF7AJTMA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PAWPR04MB9768:EE_
x-ms-office365-filtering-correlation-id: 64b35bb6-04a5-4c12-2714-08dd5b329bfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?blZQQWlQYnM2T080cTBzMmlDVG9rR2ZIR1J4aHNtY2FJUGJMS2V0cWRieWtE?=
 =?utf-8?B?VEM3T0M4NllXRTMrYWhtdXI0ZUpGMjFpUXYvQzdsdTRvbFpJc1psMCsrZklZ?=
 =?utf-8?B?alYwei81dk4yNkkxN0R3dSt4aU1GbTYzT1pLR1g5bHdqZ0JaTjJuRkRqMjBS?=
 =?utf-8?B?VTBxNGxIekUrcFVXU0ZIMlFKVHlUcXdZUXRXM3llUEZvWldBYUpPdTNVS1dL?=
 =?utf-8?B?OUhIVFVjK2dKMHQzVnJ1azRXVlI1Ujd1TURydjRNMmRlKzhWcXNaWE93V092?=
 =?utf-8?B?ZGJvU2gxeURIZ2pFMlVjN3pkaUZ4RGNkRVk2WStXNVR6T3Rrdm0rNXFacTN4?=
 =?utf-8?B?NTNIc016WXVIVzl1WXV0Mi92blVkV1MrNkppWlFtUzlnZklYbGJNb3VlVThR?=
 =?utf-8?B?OHFzc2ZWUk9wZ1huMHNCMEtTUFpVV1hlRHpyU3lON2RDbjRoZy9lMldiaW5S?=
 =?utf-8?B?SFpENzAxaFJQcXd1SXVKU3c3aEViWVdFa2xEalhUdW9GYkxUNEtOTnpsQloz?=
 =?utf-8?B?MVA1WHNBbU5PeHNqTktMeHNwUGNjS3ZwMHBRQ1Bic3A3RWNCNHdyVGZ5Q3Bi?=
 =?utf-8?B?akp5YUpCQzBXQnlKRWwwc210K3I1LzNRYW5mWFl5T00xM1lHM3E4L1I2V0pv?=
 =?utf-8?B?bGliUFo3U25VcmIwQ0RZRWh3UURFSis3SkdzVmthbFdmcWtBek8zZTNJWGg5?=
 =?utf-8?B?dHVCRlk4dERySlFIRlh5UFVGS0FzRFYwNXBud1JYU1BrTUs3djdXNDF5TVFC?=
 =?utf-8?B?S1FpRlVYMVV4TUpBSUhnVS9EWFVrWUVGZ2pNa0h5WkU5NTdnUE5TaE00bjZR?=
 =?utf-8?B?MzlQT0hGZjFnVFdtVWwzYnhnTGpaRWhKS1BxeDNVbGNoT2xmeFY3bGRYM2Rv?=
 =?utf-8?B?QTRDQitWYXA2Q2V2WHFyMzdZckphb0RjYkx6L2l3UXBBd2ZkSVZXSkhwSnhT?=
 =?utf-8?B?VDJDamJSaW10bkxpUnA0UlhyYmh2VzU4QTh4YXFpK0w4b3pVY2hKVmRLNWhr?=
 =?utf-8?B?d2VEMnRURUI1OGZOWnQrWEFDTDh1Vk95dXBpRk01RmxwbmlEbnlETitXNHM3?=
 =?utf-8?B?OVZxNmd2VVJLMlI0YUppbUhSUTZzQVNYeU9tUStGU1NYeW84eVR6SUl5VGFX?=
 =?utf-8?B?Zzk4bkdFZlE5Wkh3RXZObFU0bXZrNUVNQ3NEdkd6UldFOTJibU02V1lSaHpM?=
 =?utf-8?B?TE9mUldlWDNHMjN4MWlOSUVoeDM2QmtoWUdoWVo0WURwMTU2dSttb2tSY1pO?=
 =?utf-8?B?YWsycGdxR1Fmc0M5QWFtNGlHaXVlVEFaMHBYVUNNNHBnTGZVQ2k3UmpDaGJC?=
 =?utf-8?B?bXgxRDBwcXRyQTk4YmtjVXNBemVYY0ZjTEJHMmZObGtCRlNGRXdPZUpiZk9l?=
 =?utf-8?B?d0dSSWROTi8rblh4blhyT0FhSjlrNHJHbUw4cEVJQm9WZno0YjNwSm4zelV4?=
 =?utf-8?B?WGZDSWtlYUdmcUpHQVF3K1Q4dlRIU3kwR0ZFRjUrcXlwVFJxbjZOOEJUb0w0?=
 =?utf-8?B?OVduZ2FPUDFncGh3b2VxMmxGNVcxb1hVU2kzRCtiQ2t6YXV6MEV0bC9NNzFY?=
 =?utf-8?B?TTQyODNYOFZzT2NCaDRqd0lIeThVbXZrTTBrM0w1a0JsYmRCODNha2hZbnhG?=
 =?utf-8?B?VlpCSTRCMm5iM0htU3dpcFZXUzU5NURSTFo5Yzc2L0FuYWRYNmdwbzhjcldv?=
 =?utf-8?B?L2pOVEl2SFc2NzNkOVFjaW1YdTgxcVppVDhpUHNCWmg0R1JQeG9kK1REOHJk?=
 =?utf-8?B?Y3Z1NXhlaUZSbXRxMjFRcUtFWDJmOE0vTC91L2g4YWtXYUtCTkdoYXR2anVi?=
 =?utf-8?B?MnVWcVA2V3VqaXFmUTNmQjN3RFh5bS9hODlWY3FTZWxKQUtIVGdFUTh6Z3Nz?=
 =?utf-8?B?di9jMklJOWtHUDFPOTl3djR4UkdxL0RTZEROVG1JU0tDTFF4MEU4ekdMWHdY?=
 =?utf-8?Q?2ChRObH/l+co3pRG+75cKOMZ2uaxc69S?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UktDa3BqTnJwSkswQloxZkZoM250V2VLU2RkL3NySUlpSmxTMWJpR1dURXlw?=
 =?utf-8?B?enlZemw3Q0QrTkl0Q0l3QWlKajFseDhsU1FEZFVxY25NS29DUy9udWF4UGkz?=
 =?utf-8?B?aXAyb1hrNEtmZUw2c2VsU3pGaXRUYnVzMTBXbnlaVlZ3Q090RVVQZHJPMjkx?=
 =?utf-8?B?Wk1LNmx3U0xaSHRHSHpPcG9NUmRDT21FT3hoWVVENXBDZUR5T3V4dUNpWlQ3?=
 =?utf-8?B?WTZIMDN2Qi90Y2pndHQ4TWdXT0RrZU1FZWVYUit5b2FpUjIyMHBVZzRMWXNJ?=
 =?utf-8?B?V09rVm55K3F6cXFaOWozaG1CcXJ4L2NrMk9VcTlEa21MTU1ncGU3RStHM21w?=
 =?utf-8?B?QUh0aGo5SXcyYkFOR2VuL2FOQzZjTHBpZ09IcmxReG9GMTlFKzEyRXhNMlV1?=
 =?utf-8?B?cnJSOGFTMVgzTXdvdklMSWN6eWhCOXNsMzZSWE14VC8wOFBwV2xFYytuMCtn?=
 =?utf-8?B?cmE5dkVJenBZNndsV3JXcERlWjBTSlR5eVVPZEtkSC9qek9TdVlUdTk0T1d1?=
 =?utf-8?B?bUVZVWxSNWx1Yk1DazIwQm14RHFqenZ6WjZTZWpnVFVURldKSnhkT0FOVkFs?=
 =?utf-8?B?bW5QUHQzQUNPaENJK0E2MGpRZm9UUlhZWVpmZVQ2eDk5V0owZTZYa3dLejNX?=
 =?utf-8?B?QTNvdWRIOEV3S0tKYVFzejRHclBMWnNPNUJFcFY2ZlJmOTRFOHEzK25SRFZJ?=
 =?utf-8?B?Mld5dkZLZGR1TllOT1JsNUFIK3Y2ZWJDcHpWVTl1S1pkbmllRm8wcHprb1BG?=
 =?utf-8?B?TXhEb3ZqdTRYT1dSOXJxQ3Q3cE91YnhqYWpETGkyM3dpMVdxbDUzUGJpZVZv?=
 =?utf-8?B?TDBicWgzVkdKQTZnUktLQ3hzbWpFZG9KcG90Mm5RWnRtUHgwTENmQUU3WnpQ?=
 =?utf-8?B?NzdYT1ZNMnZ3WmtNWEt1VnNjakJYcVd2VWNScGluR29VMDMwN1F6b3FuYUhH?=
 =?utf-8?B?NFpHNnpSRWNyemprVlhPMjF6aGNMT2tXQkx0NnRUeUNDb2V6Sldwd0h3QkZC?=
 =?utf-8?B?eTVZL2dUZWplVnZJNElxTkxXRG83WE5hR3A3Q0JSNUphQnhHUzZSYzdGNEhi?=
 =?utf-8?B?QlRPNHZaYm5tUkQ1SHk1MUI1eWFYUjZzTEREdHVCOEhpVmNaZ1p6ck9HeFNB?=
 =?utf-8?B?VUkyQUdJZFR5bUxLZitDZWtZZnZqelF1bHcwNGpxMjBUc2lRTWp5aHlHUFdo?=
 =?utf-8?B?bFlzc1ZPRVBnSmlIYytsQ0NlWDdXSFA0bEw2Sm5CNkg5blNrSVRoRTRVTWt1?=
 =?utf-8?B?cUI2Vm1zaERod3pCM2pLbnBCaFJST3NGdXBtVEZwRkZ6RFQwR1B2Uk96MDBm?=
 =?utf-8?B?MWk2TEp4ZExiek9vVGJEQVZBc3lickxPdGlEeGg5b29RV0hZNmtiV1FlaVBE?=
 =?utf-8?B?T1diaTN0V3NsVUI3emszNjM1Yk9tR0U1OTd3VVdjQThIeElkdHEranNnTTBh?=
 =?utf-8?B?dk9zSDcxdEhCNFB5cHBhTUlHWk45YmdPekdiWG5GYXhUVzdIcTJWOE0vU2Rr?=
 =?utf-8?B?UXI3TXlQcmc0Y1BsN2pmNllyQWx3YmFlakhJNjFqWnU3VnlhVDgzeGRyeXlR?=
 =?utf-8?B?MiswYjJUL2hUYUhHcjZZMnlIZGRRNm91OUhlaG5EK1EzMGloUzZPeGxnQkNv?=
 =?utf-8?B?bkl3ZU0ydFhyemtzZ1pLMHIvYVRYL21KeWU3N0FMdThweWNFQTBaQTNMMDhY?=
 =?utf-8?B?ZEcvS0hRaHpBVytkc0ZjbGVydWxUZWI1cGtBdTRXRTRNa3lCRnR2V0x1UDU4?=
 =?utf-8?B?MkV4SWQzdWhzVmpjaTRvakN0VkFnSlFVWksxdnBUOFZHSStLMmJqMERTVWdT?=
 =?utf-8?B?VEgvVGJ5Y1YwTVllZDdJNU41L1BsbkRVVjBVemF5U2RDOFFidW1kTTdjNXJP?=
 =?utf-8?B?d3dtTHhWZnN4MXpZdSt1bDdTOVZYaDBiU0RIWXZYUW1BNzljYmdqbkhVdVZn?=
 =?utf-8?B?UHduU0NUV2ZTZUVCT0hMZEhSUGswM2x5UW41RlJBVi83em5jeFJlOS9MaWI4?=
 =?utf-8?B?aTVEMC9BcHAwODZ0OG00d2JWc2NiaGllc0dqRDdBQW10aXdJVTJKd3crd0Yv?=
 =?utf-8?B?WC82RDJOb201OG5JaEZDV3hOaG5lOFlSWmE1Q1kvN1p4cUd2L080MXEzRWVa?=
 =?utf-8?Q?k8vM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b35bb6-04a5-4c12-2714-08dd5b329bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 15:38:27.9687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPGZSRPvoHJcsDG8s96wtPyx7HL2tXyfKqxcjRYkduqug9EhwaK7zT1hbC1qz8Mqa0eluuy1xzSrZG0auA0tAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9768

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvNF0gZHQtYmluZGluZ3M6IGRtYTogZnNsLWVkbWE6
IGFkZA0KPiBpbnRlcnJ1cHRzLWV4dGVuZGVkIHByb3BlcnR5DQo+IA0KPiBPbiBUdWUsIE1hciA0
LCAyMDI1IGF0IDg6NDDigK9BTSBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gSGkgUm9iLA0KPiA+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvNF0g
ZHQtYmluZGluZ3M6IGRtYTogZnNsLWVkbWE6IGFkZA0KPiA+ID4gaW50ZXJydXB0cy1leHRlbmRl
ZCBwcm9wZXJ0eQ0KPiA+ID4NCj4gPiA+IE9uIFR1ZSwgTWFyIDA0LCAyMDI1IGF0IDA1OjMxOjI0
UE0gKzA4MDAsIEphY2t5IEJhaSB3cm90ZToNCj4gPiA+ID4gQWRkIGludGVycnVwdHMtZXh0ZW5k
ZWQgcHJvcGVydHkgZm9yIGVkbWEgdGhhdCBoYXMgbXVsdGlwbGUNCj4gPiA+ID4gaW50ZXJydXB0
IGNvbnRyb2xsZXJzIHVzZWQuDQo+ID4gPg0KPiA+ID4gRGlkIHlvdSB0cnkgdXNpbmcgaW50ZXJy
dXB0cy1leHRlbmRlZD8gTm8uIEJlY2F1c2UgZWl0aGVyIGlzDQo+ID4gPiBzdXBwb3J0ZWQgYnkg
dGhlIHRvb2xzIGFscmVhZHkuDQo+ID4gPg0KPiA+DQo+ID4gV2UgbmVlZCB0byB1c2UgaW50ZXJy
dXB0cy1leHRlbmRlZCBwcm9wZXJ0eSBmb3IgaS5NWDk0IGJlY2F1c2UgZm9yIHRoZQ0KPiA+IGVk
bWEncyBpbnRlcnJ1cHRzLCBzb21lIGFyZSBjb25uZWN0ZWQgdG8gaXJxc3RlZXIgaW50ZXJydXB0
IGNvbnRyb2xsZXINCj4gPiBhbmQgc29tZSBhcmUgY29ubmVjdGVkIHRvIHRoZSBHSUMuIG1ha2Ug
ZHRic19jaGVjayByZXBvcnQgZXJyb3IsIHNvIEkgYWRkDQo+IHRoaXMgZHQgYmluZGluZyBjaGFu
Z2VzLg0KPiA+DQo+ID4gU29ycnksIFdoaWNoIHRvb2xzIGFyZSB5b3UgcmVmZXJyaW5nPw0KPiAN
Cj4gZHRzY2hlbWENCj4gDQo+IFRoZSBzY2hlbWFzIHNwZWNpZnkgJ2ludGVycnVwdHMnIG9ubHku
IFRoZSBkdHMgZmlsZXMgY2FuIHVzZSBlaXRoZXIgaW50ZXJydXB0cyBvcg0KPiBpbnRlcnJ1cHRz
LWV4dGVuZGVkLiBJZiB0aGF0IGRvZXNuJ3Qgd29yayBmb3IgeW91LCBpdCBpcyBhIGJ1ZyBpbiBk
dHNjaGVtYS4NCj4gDQoNCkNsZWFyIGZvciBub3csIGNhdXNlZCBieSBtYXhJdGVtcy4NCg0KVGh4
IGZvciB5b3VyIHJldmlldy4NCg0KQlINCj4gUm9iDQo=
