Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3B43191D3
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609018; cv=fail; b=YUIrDTZAdEERLy0jZPjMwlcmByNB9/SodjTokY1pCQ+ooWz8y4drltbFMwHYyxpwral0CHdpaRu4tBPsjxxLbG5DCjce/uAN/YpYUxP4synpEdO5OVvZLIm0BzuCG3fZMwK31q4+sVWiKh6KPXwOY5Az+d+WsxMtmtRcuoizXY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609018; c=relaxed/simple;
	bh=xuePPlIk3w8nX3tYHIa7dL5953fqXWStHserYKS811U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pq0jeOrbc/qDKzUZL7x9SA1BMcsKgqyq0mJRBBqkCi9KkbMo2fq0d1hLtlBB/t1639mXdkPtaeKhJAGKFFxhRNh6Z0/q6/sccTZsn5m4yZ9a9FdZHgnCzEGi4gvNB+q8SdI0LGDWBXoNRs5ZU5+LNMHUPe/O/q1joj/jE75740s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mUkj8nTp; arc=fail smtp.client-ip=52.101.66.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mUkj8nTp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdTKmQHmuL37s7+/mb2jMVwj5OUm+vfO2ub4a5hEd0kQbuPwFbt76xUJbIa5ekoSvmV6HawEtI/rKuXaWqsHcunT/C5qtn2cErk2HODKovBnHXJZTE55fLMUyeHMXA4SFWh9s/Vw4XC0XY8gFl6MCYCDIoHYB0GyLeW7iAubwbFbcGMQf+3hlB0Cbqltq5DF5SWHK1gBRsVEuy5xcYs8UmRlO18a4BmSxg1aLW4sv8eZRUahTbtc+Qa3pqsY8UmLFAxAHmABRa8FvjFRGX7iDEpgSxqnp8307Wdz2EnxCYu2dO5n0Olq4cILsQ1bc0bjDmkEtk2SQxAlMLDdbZWBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4vy9G7Iy0pnyJcUaKWY5lfT3DOLO8CU5mago1jvxDY=;
 b=jmRWEeZPfbHkpHb6A3pj9UK9QDcd7Es5AurBWXcttV9TcK1kQU17agl7AvKpjPoZYqUAa0gz1U/TJyyCOSo3YMK0HKkJVnuTpv6C3amSC72ebPtKqJ/MA5oThZkPqjZ3gNK5LluV5JassrCNsTKELG+9gT7gmcj5ILDb19RjPqd8fYXD3GiCaknn69fpdzRkps68dUQvVcsemIrwApahcr3XnunVZuhRGoFlfaWuj7lXHqOHKQhqWe7f6tQS9t4HcdFU8wZYvhV+Y19LxW9M56BAxIhpje/XvyEttnWciaMK6GxE53w9/fwSp3p+5q6It7D7G+uHclJUT9XcXkGIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4vy9G7Iy0pnyJcUaKWY5lfT3DOLO8CU5mago1jvxDY=;
 b=mUkj8nTpoBz4f5D05fpxpWt006RlDiB7U5Q3K4jgykOtdD5YIeLmqSURrr374Q2flhbs8MbIUYx8+nDzKR5+HtexBiFDonrIrtWWMGJZtLxBdipkO5QG3X8l4V/t1tvD91xcwMbfpWB3sZbWipsPc5uALm/4w1oVZeXeJ17ANWs1UqH1uwwiWnugygTTm/JXKyrsHIAv3Q0nHr9Ry7Kf5l9vpREB37jvl/gwbjms4dpqoyoUYzpQe9957GgAjSb5QZj5rZRe+Cw5zrJZWve07zg3+UILsgenKK8zHxAh45wBUXI8LtkGpxLX5oFli1V+zXELA0UrGgY72SUgZHtr2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI0PR04MB11538.eurprd04.prod.outlook.com (2603:10a6:800:2ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:10:10 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:10:10 +0000
Date: Mon, 1 Dec 2025 12:10:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: Bough Chen <haibo.chen@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: imx93-9x9-qsb: add CAN support
Message-ID: <aS3L6cPxHE11FF4p@lizhi-Precision-Tower-5810>
References: <20251126-b4-9391-can-dts-v1-1-c23145f0d2db@nxp.com>
 <aScpNjZNU5MtfVRc@lizhi-Precision-Tower-5810>
 <DU0PR04MB94968BBFFF9FC757C177C14E90DFA@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DU0PR04MB94968BBFFF9FC757C177C14E90DFA@DU0PR04MB9496.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH8PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::26) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI0PR04MB11538:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3186d9-48e6-4353-20aa-08de30fc7bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|7416014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFhFazM5am50RW1ubU1BdEdmZWtQK3lidlVsWGwzUEZNUlp5cHdJR1dyRVNh?=
 =?utf-8?B?TWZib2haYkxFSWJuc2FQUEVUTTRMSVJHZ2cybUZoTmsxeTVsaEo3NTlpOURO?=
 =?utf-8?B?Tmd0cDNoSFh0bk9qcVlUZXNsdXdleXAwNVVkTlBWMk1nYVZSeDM0WjZrb3pL?=
 =?utf-8?B?azhFaHAzSjI3OGVac2d4TGxBb0xjZ0lUMUZDa3pqVjNtSzdTMElyS0lpK0p3?=
 =?utf-8?B?VFM3Z0NwWHlKL21jMDBtajJLaXR5S3Y5b05MWlcydjVDanpoY295ZnRZRXhD?=
 =?utf-8?B?VHRNMHIrUkhPaWlaL2RSc2RNNkRiQys5SEptemlCekV0UDJZVjFzM0pZY0JD?=
 =?utf-8?B?NFN0SkhiMkh6TENaeFNpTTk3RmY3RDNVL0wxd09FWEdhc0EvTjhtczVkd0w3?=
 =?utf-8?B?dTc0cXJLSXZGb0s4c0ZFQ3RQY3ZIWjRxQ1oxQW1JVHlDaFE1Y0JEYkVrSm41?=
 =?utf-8?B?dFZ1Q2ZVZGhqMDlkV2grVGZyeHRPTWNkTUxiUHhqUnQvb1VxVjdVald5ZENa?=
 =?utf-8?B?ZFMxNUJGNlpWcStndEtRRldpN0FYbTJjU2xWSWR0cC9Lclhha0xLbXltZUds?=
 =?utf-8?B?UmJzVnErc3BSYlliYkY4WXQyR2lSaG9pNGxzcnRsQTllV3I2Zm5DOEdKNUJn?=
 =?utf-8?B?b1dDSDF5WjZSRzg4K2ZZZHZoL3F1c0EvZjJtdVJjbStYL0kxQm11WUF3NW9y?=
 =?utf-8?B?ZXhlZGRIZyszUmVEczJVdWtXTjYzRDh0UCtUb1d6VkdCdkZSRkwreXNKYThW?=
 =?utf-8?B?SzFsY3J3UFhnV3ZZeTFHVFVjRjkxbWpsdnN5OUdsbnEwTWZXZDhWSE11MHo0?=
 =?utf-8?B?LzRDb1BOb3EzbytDSlY3NFJiZ0NuNkpIY3dVMFE4aTliVk1FN2t1Z1VIdUtF?=
 =?utf-8?B?RVZIMmRUY3plbnhYekVGdksraFZubFZNTzFjbk5oUHp5SmlCZUk4QTRSQ21s?=
 =?utf-8?B?K1Avb3ZOVGlXUVJOSDQwOG5DUEluY0ZjUjRaVFNoZUFMTHdTNjFmTDEyZExV?=
 =?utf-8?B?Y3U5bGVENkx1ZG5oelVWOEJJb2hoK3A3cFNPTTlpM0JUZy9jTGlCcjl3TEwy?=
 =?utf-8?B?R01DMUpNc3B2MDhRVUZSYWNZcWNObjYrZFlqRVFQeFlPRUJGSmQ2Ymd4Znpm?=
 =?utf-8?B?SmNmMDBMUTVCc2oxa3ZQanBUbnR3ZjZBMFFqdE5QWkRrTEY0K0xNbGVOWlNv?=
 =?utf-8?B?ZXBMOW9tQ3pCV3lJdTFNRjcrTGxMblBUWFhXY0tOMGo3ZXRHTFhEaElHRHhF?=
 =?utf-8?B?QWVMa2I1SzR4UFI2bWxvS0VFakFpdXNkcVhDRkJvUFFtUWJuZVFOT2Z6bUFl?=
 =?utf-8?B?d2wrNDFOZFdJUjVFYWxtQ0JrMDIvM3ZDcnQ3R3BzeDNrd3RKUGZVaWN5ZklX?=
 =?utf-8?B?eUNvcXc2MWIxWTdjZU9zSUtHWEM4MFJwc24zajR0VEZEZnBaUTdwNGRuMmEx?=
 =?utf-8?B?RnRHL1p2TW1Ja0s4SVN5djNuRi9iNHlCVGY0ZXdmRG52OTBzdUlnSVVGWi85?=
 =?utf-8?B?Wlh5ZS9sbkluOGRrWkFCRVl0NU1VYVkvUTdENUJyY2Y0blhaVzRqNGR2NnZM?=
 =?utf-8?B?LzhXSnJDb2dRVnNCd054TTdiaVozbFJ6VndqVzBBVTdiSVJYaFZwbEFwRFpS?=
 =?utf-8?B?NTFwOWttRndpL3VzQzU5Q3BvK2d5ZlErTHBNWTNhNE1CQ2JvcGdIMzZQRm5k?=
 =?utf-8?B?TjU1Q0NVNzFmOElEQmJvUkZCekRXQnVoYVk5MmJKSmIzTDFDWUNabkMzOWtp?=
 =?utf-8?B?Qm5aREQ2OTFuWTR4YVRITVBvckE1R2lSVVdET2c0cTRNNk8vSXpBREhBMjBY?=
 =?utf-8?B?ek83NFViZ2ViU2tweURHS2RLR04zMUNvSGt6b0thSTFSMitxbmNzbG94UXNs?=
 =?utf-8?B?S1RhZkQvK09YSnZaNHk3SDFVVEd5VjZrY2U2SzVaQm4zRFVmcGFFeGlFazJs?=
 =?utf-8?B?azRJTmluanYva3RDWFdNYTZsbklsNEs3cDEwc0toYldQT3l0dmJZTHBtK0JE?=
 =?utf-8?B?cEZteXJVaU82TXhSVDRGbXJLWGhCczlyVGlTZ2VTc2FyWGQ5OE0yMk9aWHoy?=
 =?utf-8?Q?h1du3V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(7416014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3QvWitEZHMxclFVK0tEc1FHYXc0SkdLTk04VnJBSktWeWp4Wng2TkhicUd6?=
 =?utf-8?B?SkdzMENsMzN4eHV5WjZQS0JWWG05OTJ2MS85ZWttT0dLSmJYSVV1YXlaREFQ?=
 =?utf-8?B?b2F5NkZxU2NxTEJEb3cxTnpiV2ROb3pFSVNQY0dIZHlBVnNaa0ZKKzgveU5I?=
 =?utf-8?B?ck1lR1pybEt1RFp1Z0RlOWYwU0x5azIxV0RpNXRsTFN5TnZNWHprZ3draFNK?=
 =?utf-8?B?c2pDU3RCdENPSHdNbExMNnJUTm9ZWm9VNjgzays5djU3TW1TL3ZJQThyY2oy?=
 =?utf-8?B?U0lkUkxpNzVmem1hcU4zb2hkU1ZISnZQM3RMYXFCbTh6anE5Y21jS0Fydkdr?=
 =?utf-8?B?aHhSRE1URUkrWmhyMUxvTWF6cEtqWDRnSGQ4Ti8xajZwNC82MTdkMVlIdmND?=
 =?utf-8?B?d0IxRzFhRXlyTE5EdlFQTjdIb2p4UUt3cE5VTEFheHFVMXI0U1lHdy9WQmZC?=
 =?utf-8?B?WXFDMTRwWTZKNExxOHEyQnM2UWhJWGRibktJaUFscThUQTUrbUhvbU9wb3Qw?=
 =?utf-8?B?QmlFZFk0M0lnZi9RN2JWeUVmSTJpejJVc3d2WXpZc2dMSWIzeU96UTJrQ2Ux?=
 =?utf-8?B?eHBVN1hiY3NPTndVSHFabyt1YzhVWnRvWk5PeklZZ2ZaODR1R2pqK3haUlJZ?=
 =?utf-8?B?Q1JWQU9odGE3WmhkNDVVOWhpdkRyenprUWdMNmtPQXZTQm52Y1k2VE8vZk9l?=
 =?utf-8?B?MmtRYmp1bURjdFZxZHowUGc1d0Z0K3g3OVhrc3BqK3RMaEVBcitEN2F4Mkdm?=
 =?utf-8?B?eGYyWDVDWEN2dWZkcFl2cXVabjluVDczNXpJb3llam9yaUphU0crbk9YY3Nu?=
 =?utf-8?B?L0NFbkZhMytTMDI2bUVPcW14OC8razVYUEc4aVFGUHpPclR4MS83UGIxYU5r?=
 =?utf-8?B?UWV0Y3BSaDFuK3lkdXhHenpNQWFuUXpoU0RTRzcyT0JHWEYvSDdpUkxkMkV0?=
 =?utf-8?B?ZFlKYTF0YjVFQTRuZmZITWpQOUdOWGlkeUpZaDgyaXFmUHJWdTBydFpoUk4z?=
 =?utf-8?B?Sjk2RWlEYUp4R0Q0Nkc1dGVrT0JKa2QzOVk2YWxzMVFhMFlKd3BPOE1BbnVY?=
 =?utf-8?B?VmJVMmR5NTBlYjBFRUFnUEdKOUwwOUZ1bjlJSGR5c2NCS3pRWTZMcXVpMFhW?=
 =?utf-8?B?YzZhZ3V5N2dJNWRqQkJ0TUpJQ1RjV3dOVjFwNGZMREx0ZHhZUjErN2dmQWc4?=
 =?utf-8?B?QjV4ZFl0V1pDYVNjVlpGTEtScVp6YUhEWmpQM0pCbUhueEhVajdJc25wellK?=
 =?utf-8?B?cUUyWitpeklDNUNveGo5cG9rOENGNmJKOW45ZkcvZ2hzNVk1dzgvdlhYVytV?=
 =?utf-8?B?Uk9weitnRVQ5dlBHYjJJL3JQdzJpSHVINms5QzVkSUdnck4rUWliTG9KWllD?=
 =?utf-8?B?Z2c3S0V4VGpyTUVYVG9BbUNaTHZNRzVpaWZla2RDc1BDcmltL3JvdGw4cHkr?=
 =?utf-8?B?S1pRYy83WThxWVpHKzZJdGpqUGg2UXpuRCtYTWFuS3hsU2VBMFBlVGNnRDA5?=
 =?utf-8?B?MGdPTFB4VEQwdXpRUVVWWHBIN0JZWCt2WjZkWnVMWFkvdXpBNEtJL1htMXB3?=
 =?utf-8?B?cERueVFrZWcvK1JtaEhjRWQ3emFVNm42dU1ybVgxVzAzdmVEd01nVXNDTHR5?=
 =?utf-8?B?cVpyUThYZmpDRzZOdWZ4NDgyMW8zNDhzNDUyVW11ZWxiNHdYSFBBNW92TWNL?=
 =?utf-8?B?VEwzdGJuQlF6eVdXYXhibmR1RHlSSHNyNXMvMXhXUGgzY3ByTm9zd0FpWVYz?=
 =?utf-8?B?alVkZW5reTd5VFhhUlZJNWEvNG4wTmpFa0lKUzc0MlAra0ZZU3g4SHNQL1k1?=
 =?utf-8?B?QUhSc0d1WXo4VGdRR00yYUdqeFlhM0QyS2c3MXJtdXFVUTRyd21HZkZXQTd4?=
 =?utf-8?B?RmEvRmQ4Zzl0VGxFTmNSSTNLdDVNSFU0SzY5aWgvVklYR3EyR2RWemlnVHhx?=
 =?utf-8?B?QktkMXoxMXN4MXkwL2JGNjdicTdiZWRmalEvcytJT2cwRkVDWFlOb2FGdGd2?=
 =?utf-8?B?Wng2c0pXZ2dCQlVKSXA4Qm9TRWoydklRQzJBcFlrdmd2R1dkSkJLMTZPSFZP?=
 =?utf-8?B?SEsyeGNBVnc0ZUdIeVNBSlJOMDNIR2l6NzBUSkVRcVlwOFJqTC9iQVcvWitH?=
 =?utf-8?Q?pH4eQj8L4K+P91fpJKorpFELY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3186d9-48e6-4353-20aa-08de30fc7bb8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:10:10.0020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EMKXkxLfZmL9FCZ1Zhgx/QaibesH0lI3HohQO/9ogo7jc/R0z6USz4GUqMVOZ/nPBTWVRy/zmaQrUWbFrgm5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11538

On Thu, Nov 27, 2025 at 02:01:47AM +0000, Bough Chen wrote:
> > -----Original Message-----
> > From: Frank Li <frank.li@nxp.com>
> > Sent: 2025年11月27日 0:22
> > To: Bough Chen <haibo.chen@nxp.com>
> > Cc: Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Rob
> > Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> > Dooley <conor+dt@kernel.org>; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH] arm64: dts: imx93-9x9-qsb: add CAN support
> >
> > On Wed, Nov 26, 2025 at 02:20:07PM +0800, Haibo Chen wrote:
> >
> > subject suggested,  add CAN support overlay file
> >
> > > CAN1 and Micfil share pins on imx93-9x9-qsb board, use TMUX1574RSVR to
> > > control the connection: put sel to high, select CAN1, put sel to low,
> > > select Micfil. In default, sel keep low.
> > >
> > > To support CAN1, need to put the sel to high. Besides, CAN1 use phy
> > > TJA1057GT/3.
> > >
> > > ---
> > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/Makefile             |  2 +
> > >  .../boot/dts/freescale/imx93-9x9-qsb-can1.dtso     | 63
> > ++++++++++++++++++++++
> > >  2 files changed, 65 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > > b/arch/arm64/boot/dts/freescale/Makefile
> > > index
> > >
> > f30d3fd724d0ce6b38f7bef10e3970ac34f70f4a..1142d3312c8651b4292837bce3
> > cb
> > > e46ab95f7e09 100644
> > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > @@ -373,7 +373,9 @@ dtb-$(CONFIG_ARCH_MXC) +=
> > > imx91-tqma9131-mba91xxca.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
> > >
> > >  imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
> > > +imx93-9x9-qsb-can1-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-can1.dtbo
> >
> > Keep order by alphabet.
> >
> > >  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
> > > +dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-can1.dtb
> >
> > the same here
> >
> > can1 should before i3c.
>
> Okay
>
> >
> > >
> > >  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb diff --git
> > > a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
> > > b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
> > > new file mode 100644
> > > index
> > >
> > 0000000000000000000000000000000000000000..62d4fa6c21d794f91da59f51
> > 1d6f
> > > 0162037e9271
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
> > > @@ -0,0 +1,63 @@
> > ...
> > > +
> > > +&pcal6524 {
> > > +	/*
> > > +	 * mic-can-sel-hog have property 'output-low', dt overlay don't
> > > +	 * support /delete-property/. Both 'output-low' and 'output-high'
> > > +	 * will be exist under hog nodes if overlay file set 'output-high'.
> > > +	 * Workaround is disable this hog and create new hog with
> > > +	 * 'output-high'.
> > > +	 */
> > > +	mic-can-sel-hog {
> > > +		status = "disabled";
> > > +	};
> >
> > are you sure 'status' work for hogs?
>
> Yes, I test on board, this method works.
>

Okay, I just want to make sure it works.

Frank

> Any better solution?
>
> Regards
> Haibo Chen
> >
> > Frank
> > > +
> > > +	/*
> > > +	 * Config the MIC/CAN_SEL to high, chose B
> > > +	 * port, connect to CAN.
> > > +	 */
> > > +	mic-can-high-sel-hog {
> > > +		gpio-hog;
> > > +		gpios = <0x11 0x00>;
> > > +		output-high;
> > > +	};
> > > +};
> > >
> > > ---
> > > base-commit: 422f3140bbcb657e1b86c484296972ab76f6d1ff
> > > change-id: 20251125-b4-9391-can-dts-2f4849978fc2
> > >
> > > Best regards,
> > > --
> > > Haibo Chen <haibo.chen@nxp.com>
> > >
