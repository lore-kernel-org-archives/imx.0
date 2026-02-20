Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1153168E8
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771580565; cv=fail; b=j/aPzhgGITjxHB79x+IvL+kpmseyNeThPoJOCrb7JVTkp6qxj8tOeOavsxZQ9mcP1jM13Q9Gne0PBGQ+BzqH25NjF1tbg7f57sQf3h6FJZBdynIARPdYTBoGF5Xxfw9JyEHGBdQR8oh5Ud9oSCmR1Pi6jAoUk7H/Q6rV5eBSiPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771580565; c=relaxed/simple;
	bh=27JrhWVyH+sTlwqrcyRPu9bQFcW4c8Bjg86155ncCQI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JU/8joQKraVRaIb3nYisUq3C+KVZLJspH56FFcsVMNQYgHlvAcEbzsvbkccGNG52gHOzVZXgvz/INLjQeZb5VBqdEcfV06oNfQOSZRBmGr9yzycDtV4LXjtMqRNB51IJ6WV46xohf0JLCYuoWf6fxX3/DXw4qVJscYTDDm8xCWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S0OYYH+T; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S0OYYH+T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPgps5sKMyw/B0eCWbEglZS4QijexSM0NrX+iCrKMWdJArDwAr8Ci0oAEsz/HLfTjf0hCr9nfE50kkrh0fc/nlNcuztRl9Tg+OPqvDTatW530EMX/6LfZ6KCaMrsJ3ck5qhrmJkt5rij4saTfg+W/LAQlEs0+fYn2oxyHWUwE7yypYOnOvhHTlvhBpEa21PNPTP9+/NlHuXrjhQwM2A1W+986QVHZt+l/aXo7sttG0BVeTz7hdpTUQ1hwuPt5gAheSe+GDrR5m60OosLekXrL58Ppi+TjjHiqRrwa1ZhUDU9x+CKhvYIp1xnLnACsHnKq7/uCFAvcE5Ysjx17A83wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27JrhWVyH+sTlwqrcyRPu9bQFcW4c8Bjg86155ncCQI=;
 b=JT3PzzL9JeLV7XZIZ6koX2y5rkgODUILCJYrnzgr9nPQWtEun9YAfzZ4RBN0suGqv41nDsrXtyG39AC2y9tUOwXeLIqO2T9NBoKLbVzeDnzGTGQ/sVKdHy8BiWNC0Io98I7QAm1CNnVugROLY9gGQDSHctMPcUOcNZhmn7dECsximZu3DM4Gshqse2/mzGDC1ZgOQZMBXO7u6hovZsOsxt5Rmgf3fh7ke4x2Dria3/kF8hbXh1fB3u/6CtzOWzxNux5jiG1pJhPqP4N8FizMf5qmtoLHVAdMD+JkD6SKLHgpSo2mTjdKXzXDpARPPWST2HHxujtApj8mWF8NxlIbvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27JrhWVyH+sTlwqrcyRPu9bQFcW4c8Bjg86155ncCQI=;
 b=S0OYYH+TOGHsQi22sP37IpByMRO6NyEEE2Ar/OvW00mBQgw3wFKjlFNP/Ng5zFKZZkd0FaSpKeWwtlRLYD2YhcpRTHX3dhe7HrXHdEQUnWWFNSlkk0CcYVAQrzdJcRVcHrnjYnrQ8MC+j4o/PmaZ0gw8F7PeliyCJk93ZCujE3oXN+GsZGyhlWk+ySU16R4gqUaRc2eWPcha2d32CtzmHSff0QffhmzfRtCxMK8ia+LBRiynuAGofwnYuk0Os6CcVCET1dHpy3uhiGH+LsxBz7xNfXeDjf/yZ5T6oPpHWTu/JItNhEdGg1XDVbeQLjQ2t4B/cuEp/GOiRTub6aBnyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DB9PR04MB11557.eurprd04.prod.outlook.com (2603:10a6:10:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 09:41:24 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 09:41:24 +0000
Message-ID: <0cdf1d10-74d6-434a-9230-c9e7d5a5c9a1@oss.nxp.com>
Date: Fri, 20 Feb 2026 11:44:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ARM: dts: TQMa6UL: modify for use in bootloaders
To: Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
 <aZXw76CuH9u8csFk@lizhi-Precision-Tower-5810>
 <6c001865-c8e3-4133-bf10-46384fdaf511@kernel.org>
 <aZdodgOZcM9Nzh99@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <aZdodgOZcM9Nzh99@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P309CA0017.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::21) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DB9PR04MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: e6e2daed-57d5-4d49-de07-08de70643605
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajhzREZMcnlidkIzNjNodW1RdmNYSy9CNm9wVDQrSzliN001Z1h6bGtmODVS?=
 =?utf-8?B?bld0OUV4elpVTHRKaGZFVmxVMTcwSE9odVphK1VxQVMvcVBqRFZSYUxkRGhK?=
 =?utf-8?B?aE1GclE1R1ZqOWE1MTdKbEFrbnVtc0dSd2E4bTRiSzdSQmFYZEJHLzZXdnpX?=
 =?utf-8?B?SHhxQTRWZ2M5VWZ4VURwQ2hnMTNwREo0Q0cvM1BhMVJ1U2ttaHVkOWRPOVJ2?=
 =?utf-8?B?a3ZnYXp1RitEamJxQnE1WDhZVlBlSlBHU29SeW1aUFVheWJPU0VUbHNabkxG?=
 =?utf-8?B?YUgyMXFoc0xwbXV5MEdJLzdTT2Z3cXRwK0hMRTVkeHZnVGM5SHlHVTd5S1Vh?=
 =?utf-8?B?dzNXZzJBV05JZ1hBSlhHMDVZZEtPZ3FvK1dFUUJqQmsyc3JVbW5YVTNJOStH?=
 =?utf-8?B?SUVmWUl3YTBkR3duU0J3dGdURUFVZDVVMzl6RzZQTE4vdXNSTXpTYk9ackp1?=
 =?utf-8?B?bnljeFp1R25VaysrWFk1dUh6SGFyNE8rUGxrNGJ4TlVlZmVGdFNYYlo5VkhW?=
 =?utf-8?B?WXRjOXpvbnc2VllHaTNJTjN0bG11OHZtODdhbzNzbElBUTBrSnF6c0NDdVY3?=
 =?utf-8?B?dUI5Q2c2ZC9sYnpBRVZUQmQyWjNaN0thMUxSVzJkdVdpTWo5VXdmZ3h2c3dz?=
 =?utf-8?B?NmJ1SWRhN202UEZxa0pDNUFvdmUyUS83RmFFRFZQaDI2a2JyTjlOZTUyblJi?=
 =?utf-8?B?SlVCS3RZRklieU95d3NnTTJDVjlLem1HUXZtTnZOWHBuTzdTbmttMFFsWkYv?=
 =?utf-8?B?K0RtR2lpQ0p2eFhHa25GZXhzK1hLOFZZbGpGMUh3dS91VDV2ZGNSdlhVTEdh?=
 =?utf-8?B?L28xcnQ1Q1BHZ0l5QmtZTW5oZlJpMVJ5YUwvQzJ3bWJzT3RER3dtUGNxUklp?=
 =?utf-8?B?RTdFYkVHV1FOTy84WFhRUEt4bTgzN0ZIb1FRWjU5dnFpS1R4dnl5YmhWOFVQ?=
 =?utf-8?B?MkEyOUJpSVplRDlIOUFSQ2RLWklNWTZUaFpOYmhtOEpqTEhOR3YwUWVRZC9T?=
 =?utf-8?B?cFB0NGNJWGRmdGpKNDZ1THNsMnh2WE1rS2VzSThpN1M1TlhLeURPMllEeW1J?=
 =?utf-8?B?L3VZVkdqNENLcGdoRW9hYi9scU9YZUp0YVdHcnNCL2lxZkdJSTR2T2JrdG9S?=
 =?utf-8?B?VE5SVkdPMFlUNnRHMkhWQ2lXQnlLVklvQ0oyVFNWWEs1ZE5kd1kxMjl4NElX?=
 =?utf-8?B?U0hYdStNMnRMMXJ4RWZiSkpSdjdPYklBclc5NitNZWlRQ1h2UE1VeG9JYng3?=
 =?utf-8?B?MEVSMUdyRGFMSENlMWtrRlZQd3ZSdCs3aGdsRVNhbG1PVEFnY3BGdm41Q0Ni?=
 =?utf-8?B?NVZKU3hMaWhMTHlDd1IrQXVPV0o4cUpYa2RGa0Nld3RrcEhIb0dBeWR0d1BZ?=
 =?utf-8?B?b0Uxd3BlWUhSMVBRd1U1QXl0Q3pSelNqaGlNRzFDaDQyaThtOUJPMHB5d01z?=
 =?utf-8?B?Y2FORTFBVjJzd24xNU5ybzltNmtSTTh4L3BWZUZtLzN6bnd2ZWRGTGc5bjZx?=
 =?utf-8?B?RjRFWkRMcU5lYkkwK0xGUWJyVndQNDREK2hGQjZ1WmRpVXlkY09UazcrZkM4?=
 =?utf-8?B?UnZ3cS9DNG1uc3JZQ0FEcDJqajNMcWRrTlJITHBxQ1B2VFlpYzAwWDU3QmRS?=
 =?utf-8?B?VWhoVG8vdCs5ZkREQTFQcTBtZVFOWWZodDBOajRuTTJxc1VjSkNRTWxHaWhw?=
 =?utf-8?B?NEUzSVJmajk5UThNTEpWRVQ2Y0J5Yk9MTnZpMWtYUiszaThXeDFrTVpQdnpC?=
 =?utf-8?B?YytBZTh0bWNRT0VkUWg3STRrVGhzRG83clpPN3ArdklGZmNCWTFoMWpPT1JV?=
 =?utf-8?B?UnFMTzFIMnNvems4RU9LKzRyS0NPbm1CaFBNODBja2tXSExoUC8wNExEZjRL?=
 =?utf-8?B?d1l5R01ETTRZTjBjNjhzV3pXanBkbDJRT0ppQjh5bWFEMUJhSDZXa0VCRkVX?=
 =?utf-8?B?SG5wRG8yL1dRdEQxYnpjTXo2TjY1MVM0bU9lTWlhUmxSU1hHQWNWcmVQSXVp?=
 =?utf-8?B?cmtsY0xqZHdoM21HYzA5endIZ216aVlSazJvaUE2SEFCWlpiUk5RNFUvSlQ5?=
 =?utf-8?B?T05wek8xSGhySCtBelVETk5nZlE3TUdZZVlyWEw5VTBITm1LaHBjMDNjUmZM?=
 =?utf-8?Q?DZ4c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U09sQ1QzMm5jQmUycUlMMHB3MlhFNlZkRFZobmo2VkNnMmFPSWJxUUJOdVdm?=
 =?utf-8?B?aHBPNjUzc3E0cnBQd3Z2MWVhY2IvRGJ1Q3FmSlVybWFhcHU4SUxNeDJwYjI3?=
 =?utf-8?B?eGdjeEJiTkxvdUxqQjNRWTNvRzR6REk3MmVrb3g0Z2RrcjVUUFh1YUVTM2lX?=
 =?utf-8?B?SExkR2U0VTRnZm9vamdnVytRM1MxL25BTWJWeWJzQUZTNXJKaU1QNHIyakRt?=
 =?utf-8?B?QklIbWhoeVNaeTBvUTF5T3Iwdk55R2VTMGZjSDNMWHlqM1VlYzFaL2pVeTV6?=
 =?utf-8?B?Ym5SZ0owclJ3emY3OUdpWGhUSVdITkR6Wm1XYVZEaUJmUTNlWXlLVEg3MTBW?=
 =?utf-8?B?YnlRUEdEVCs2K25DWE1TWklLbXN2ampKVms4VE5CRFl6cVVUeEpTQXBDWHgz?=
 =?utf-8?B?LzNJRmh3TjBwVUVGL1ViSmorTnA5K211d2R4V0tJdXh4S2ZmMU8zL3lXWTNK?=
 =?utf-8?B?WVVGWHFZYWJSc0FSSG9tTjg0bWR0aTZSM1Z3bUpYSWE0alZYRjQ3TlR2V2x1?=
 =?utf-8?B?OWJmOFRtTGVFS1hQZm12RWxHa3JKMnZ1SHdCVmpnOUtNbVd2UlVYcGFZNXRz?=
 =?utf-8?B?dkRaVi9QbHZ5dWlZUHFwcUo5OTNSaFovTGlBOGlMMk1mdiswWkZwd2lkWk83?=
 =?utf-8?B?T0V0N0FMc1pHSEZtM2l6RWhJcXZ6Zm5rVEErNDBhdVQ5YVI1NVppSFVDRFpa?=
 =?utf-8?B?WlU4SHhLRHZlejJxcElIWTRpdllZdHpWdmZ5QVROZlBzZStWYzY3aEJ5ck43?=
 =?utf-8?B?VUppYVRsbWwxbHJObFJlSVlNT2VqTmVUb2ZjY3dLbS8ydm45blRGU0MzTkhz?=
 =?utf-8?B?c0VrV1pLNkx1Nm5wTHQrWkovM0YvRFJiS1ZmcGxtRDZOZGo1ZDh4OThhSDNi?=
 =?utf-8?B?WDlkV0FXTHdnV2NscTg1V3Q4TmVPYkpUMGhyL2tCQ0JQOE1BMkdUaWc1cjM3?=
 =?utf-8?B?dGQ3ZFJ0U0ZmQ2w4QzVvdkVLT1VCcVQ4cWtpZTdPaytmTUFHTnBUSXFteHpI?=
 =?utf-8?B?UTd2RWpoRS9pcUIwUXVQUGNUR2RrcHJqVHJDMjN0blc4UmhLOElmK0tMSzJ1?=
 =?utf-8?B?Zk5aMEhzQUFNcHI2amF2Um5ueGhmK1UrdDloZnV1QUNyMlViRnpoejhXQWw2?=
 =?utf-8?B?S0xJYkR6S21yNkVtbXJtUEVPTnZITkgyKy9SSzRSbFg4K3Q5cTc1U1pqODZP?=
 =?utf-8?B?bHMwNFhzS29HUFlxdG0vdGJ1emJXSFJJSDNsNHg0UG1CUjZZTm9pWmJaU1Vv?=
 =?utf-8?B?SkpTSDdLcnhlZExEQVdaOXMvM3R3SGZIdW51NGJWSnpDZCtITEMrbmZadC8r?=
 =?utf-8?B?ZWlwb2xOY0dudFRIMUtnWVpqTVgxdTEweS91YUdMd1N0TDE0ZnVmSjhNNDVt?=
 =?utf-8?B?MFI3UFlIQ0U2VG1BeTEzWXpNWjdMRlNEOTBKSjBLdVlnVXZoMnRTYzdyU3pi?=
 =?utf-8?B?aUMvbEdya3o5Tjg4ODgrU1pVTklUQ3FtdkE5dGhHSTByQXVmZ1l6eTExclVr?=
 =?utf-8?B?aFNqVktpQklJVUVKOUVLeFZFS0JwU1g4aXJvNWhYRkVIemp5cExMSmJBT2x0?=
 =?utf-8?B?ZVRGeDdGZWFQK3J6WGh2Tk5yMlhzWDJGZ1FzM3VCb0lXODV3TGpUV2RvYkQ4?=
 =?utf-8?B?dWk0cyt3QU9FbkdBVnRSVkJuY0xjVjl6ZWFHSVhJU2lQZmlidldraEJLSENX?=
 =?utf-8?B?NHk0ZzIwZXBOWkFCVUoyWWtYa3YrSktNbDZQWnJkWUJyZFFoTG1tbGdnRmdr?=
 =?utf-8?B?VnpyYXhYMXFJMlFucFRuS2pSZFNwem9yWHB1bzNORDJoeDRlblpHb2o1SUpZ?=
 =?utf-8?B?a0g3U0w0UTk1N05YTHZuRmRvZEZJVXRqMXJmYi8zei84Z0tzeUt2d1JsZTVB?=
 =?utf-8?B?VjFrTHpsVCs1ckJOMElpLzlIUUJVaytLa2ZjdUg0WXE1ajlOd1Vib1hyQkMx?=
 =?utf-8?B?dHZjSVdjbHowNVd5UFJydmIvZFc1LzdoTENUaXJJanYxdUgvdXhNcjdSMW5L?=
 =?utf-8?B?SDBTTHlzLzk2MGUvSEYra0hjTjdWc2llRGlPN3VOSVcwLzVMY2g1cEVUOUxs?=
 =?utf-8?B?SVhqK25RLzdmMUlQdTgzeFVxM090OUtEU3Voa05Sa1BQbTNuN21WSEJnTjQr?=
 =?utf-8?B?V2xBSCtIRGtEK2VtcXJ3SytMUUY0NXR0VjNqOFZ3eTZ4aHlaYlJrdUVkenE1?=
 =?utf-8?B?L1RRNkJkcTZLSVpwWUJoTUsxRU1ic2Uwb3NlNVRLUE9YOW9HRzdOQ2xWOEZs?=
 =?utf-8?B?czR3aVdBQWF0NTVGRFZBajkxejF4eTFSdXllZDJDN0hpWFRxdmF4Q1BuVUg5?=
 =?utf-8?B?QXJyQ2Fnc2pBTGpScVlGazY1R1V1WERSR2FTWkhzOXhaUlg2S1JWZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e2daed-57d5-4d49-de07-08de70643605
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 09:41:24.0938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0Zr59yWtbg+wb175asM6oaaZmKf9rkwWcVbuSJ7O96Ejoc2K4u1eweFb/5mzdPZk5nwSH7kS4NtxsZ5u2ZV8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11557

On 2/19/26 21:45, Frank Li wrote:
> On Wed, Feb 18, 2026 at 08:44:17PM +0100, Krzysztof Kozlowski wrote:
>> On 18/02/2026 18:03, Frank Li wrote:
>>> On Wed, Feb 18, 2026 at 02:23:33PM +0100, Max Merchel wrote:
>>>> This series contains modifications for using Linux device trees
>>>> in bootloaders. Changes from U-Boot bootloader are incorporated
>>>> directly into the Linux device trees.
>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Hi Frank,
>>
>> Why are you giving review tags instead of applying the patches? Aren't
> Now merge windows, wait for v7.0-rc1 come out. Still waitting for other
> reviewer's comments. I leave tag here to mark it is basic good to pick up.
>
I think by this point taking directly the patches into your tree would also mean you reviewed them.

I think it is worth adding the patches in your tree sooner than later to allow for testing and also integration in linux-next.


thanks,

Daniel.

