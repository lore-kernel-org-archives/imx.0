Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EB62C158A
	for <imx@lists.linux.dev>; Wed, 29 Apr 2026 04:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436295; cv=fail; b=iyGElTelgeu1jK91Wgk2QcKLVRSJs1YdwTxyuvV2jkF6sKZZbEF06tMVkyQT+/dAzGXDwSlktvagVB/NLidBOQKlscZ0simUcZ+8wplxm942KmrBkOZOSUkxYUCapdFWGkxQ8qDciWbHsUDGT0hVLo3lKq7W5+228Yp86W+ZP5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436295; c=relaxed/simple;
	bh=w/wRzEJ0POCuQBLna1OcSKpy7WY9y4O4lLuJUZCihkA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ouh8mvgfKW2aSAt8gGF7fnncgxIkTg5mX+cCdvpjcWNBjCefO9rRzdUSLS0t4oNdmBd9Y+Bku8lU1VpTsT369Q370CR5Qu47D96RHDx4xjalthG/zf45yxZJ3GsA+AC5HdHzgAtbB4fgN1eT8AePEQofVLHtS/FiuSnbcWMPJO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qVD1goR+; arc=fail smtp.client-ip=40.107.159.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qVD1goR+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxKh4JicCfIfSV4nhqhQOmv4OH80NvtVwX9kaPJSYnn9NU/XX5SexizcInuWAjiB7VTt0FrsG0fAP9DefSGyMHE02ZqHAkGSXfHfXHbpfGSEqU2D0UCGeaZx0ZtTXh6LkTX5fEbYOoeWrHC/hBPinR7niBMO5ZSLFcVqXlkDK7x/evxxXfHQzaDeiNHY+akAi9sC38UTrViz1jWVSZNNCNHUlUpL8DSMdEOf1lsfnwwPOHNxecjxo3ujiGZDGs/LJj7piY6t3PFMxd1kf3kl/b45r3m9j8fGH7JoVGGY/oh/CeMaHgi6G+fOkqkPtnJmpY+BfOB4VdXoz31H0q+9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeosO1x8uh9sS6g26/XrmVDtw53NwgwhKgO+RA4nsbs=;
 b=BOIN7UZ8OL/fsi+H5lEEyyEvpmCfi33VcuxW7sIHpY35I3eMfCAQzIpC/b3NIpnvOxWLAaTsuWgdg6kKbOOLwGJasWqrZoD316juwaEVbaPlwkXex73p0N4urL7QmCJcUyoxpvK48V6NF74vE2Ji08k+Ih5yjMDVK6Gxy9i6sX+6u5OeOVtSS66MJJJdj0lRN6+IsKPECMzk+HLLk7wupwP5D0ntfvUisl+Pcot40yOlZFTxnxK7o4Lw2OiqmGZU4cJ6WOG89vUlgO29E2WX3x6rhjbVXk/Sd8uwghkGcbEgu/4Zq8aLgyaro8o+1gbgU/sw0uNsGjfEM0z/08FgsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeosO1x8uh9sS6g26/XrmVDtw53NwgwhKgO+RA4nsbs=;
 b=qVD1goR+o/9Gx69dP7cx/vQxrbO2rGlUY2ihDtDXq047wd67NNzYYO7BX8AMUMwHPhly3KNDyARxsRjPe+D3JHtG+4x6OSpAR+U/Bm8gwu65nYVJkbxJnCkO4sXoWcVHY/gcUkAnGgxc5Y28z/jODzRjsKna8aFM2sC6xupVhVpa59hXGcVn1e7U+ZsOVuqSCskeKmCZpWpCZI4OXqhocyq9mggLKGL3hilEzG0eUQsKtRVhMR6vhSd/E1xThYPck0ss8Wl4tF5u6w+RkAYinLV+Prt/lQ+1g/cAbHWPITb30Ch3EAKWgQaBZUQRtr+U/BqwkwFOpafmhwCsdQ7T/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by DU0PR04MB9225.eurprd04.prod.outlook.com (2603:10a6:10:350::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 04:18:07 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 04:18:07 +0000
Message-ID: <846f10e4-dbe7-4f93-a98d-82cabb086810@oss.nxp.com>
Date: Wed, 29 Apr 2026 12:17:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
To: Fabio Estevam <festevam@gmail.com>, Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, xinyu.chen@nxp.com,
 justin.jiang@nxp.com
References: <20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com>
 <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
 <CAOMZO5DV4Nnc+7DfAZT-VYDqxniz=ROR4-DnH3x9NbU4E8d9mQ@mail.gmail.com>
Content-Language: en-US
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
In-Reply-To: <CAOMZO5DV4Nnc+7DfAZT-VYDqxniz=ROR4-DnH3x9NbU4E8d9mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0187.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::12) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|DU0PR04MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8f3b2e-dedf-4e58-b5d7-08dea5a650d1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	S8idtUs+igpIHioJ0S79eDnNK8TznvjMUqBhSPGUMm6dQCdpNlyCPpt/VfRSbrRBgVrO/9fpoCgAoVshBrw0hxgNWANaeRSoAuDwDBYhElCq4JGGe7me3UWm6FzDlRNWN8vUW0VXp4tAHleAIxMzQU1xhGhtjKifa9rBik6cHSq1Y83fAHp1esVX9PZsAPuoGT6NAwck/42+qQX5Ey0wrhkv7p4iRXPH4aZu9t3zsIDZLzYFm/CbDCf1KCs/61/c+RuDR6ClM1S8UCU+ONX/Z64moQJ3ysQ3haeaOC2dD8IVlVcrtSbRc2EQ5LK+Bc/aj/29yQgX3Ae99/XQuCNNedktTr/xfsYWJM5h1VgJjwVU8nDepTgeanJ2nvMiJnn3t+7km+tRJHfZZPWZhKgH0eVE3j3l9/dqmez51Qdp4ZdJ3WYs+8Oa/vy0ql0T2aYxnVTsRgARD7SAsXTXngWfC/+KFGDnJaRPM0CYH9jRjcH/OVenhiHZxuyg/r2vPLTVOniH5bHITanNzwAa+S9gfNaX1gOUV6odPF/uk/VLh9fBvwwgKlrfslrVMoyspDsYHufB6x4Az1YoUirc+DVQdlzmAWGNv598HJmRt+MNUSlhc5ZybOAeXhsJvozMC3fRQaSg9xNLVhfylkLVXvZ/WwHsj0aQgi71FbE989H8ewFcY3C9fIFLkzDstn27u7KWstezTeNG3RPqYTn9gvh0zAnFxOyL0VUVzEER/JXqWto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmlENnVVWWgxMDU2WDBpUFhyNjEvSTBvVERTTlFvQzlJSlorWVZ0V3FTbnlO?=
 =?utf-8?B?Y3FDUlpiUzAyZE5kdjVRcjlac21yZUV0azZYNzR6V0s5T0wxUEZmcDNldjJh?=
 =?utf-8?B?ZWN6TE9BRUdNQWNDTWhLbWZaMWZ0cVNEbXBvS2daaER4TFcwbVBuamQ4UC8w?=
 =?utf-8?B?aWF4d1BxQ2U3bVpPa0k3QWU5TTYySnRaYWE4S1N4QzFWMG5aQVdSTi80bVE5?=
 =?utf-8?B?MTFqVllKTmg2ajQ0cXRrNTBTVjIxdlNhOEN5UXlzMzFlaUw5SExqS0xiVVBr?=
 =?utf-8?B?YlF0V2Z2WGRvSVBZeUpWa3QzeitkT1JKWm9LKy9kazl1NHVBWlRyWVdCeENH?=
 =?utf-8?B?c2MvRW15VXRzN3VoM3p1Q3pidXBXdkhCRlNRVFAvTGZRY1lJK2E0UWhpVTZN?=
 =?utf-8?B?U0RyZWdBT3dkeUxNTkdma2NtYXN1YnVLN0FKLzRreVpTd3l2TkpleVUvanU4?=
 =?utf-8?B?dS9vWTQ5ZHJuK0V1UzJ5OFJkaVlXWnJrMDdZRFdzYWpBbmkyekpQa08rYk1p?=
 =?utf-8?B?SDltRGh4Y3MvYnNvd0FXM2RXM2Q4V3hkUlA5c1FvZzVsVUhJTzZvYkI1RkJX?=
 =?utf-8?B?YytqSnVqYXh1azZCS3I3OUtaMU1hRkFtNld4aGlBdU13Tml4S0FRZ2tQaUZn?=
 =?utf-8?B?My93UlNYRTFPVlVpcVR3L2gyUjZrZ0FCYjZnWFdGTy8xbjBwQjJVUStIcXFh?=
 =?utf-8?B?c01jbW1UUGtBMk40Q1NQUlZDRUdMUXR2WC9jU0R0QzFLWFZQNEJmOFYzOGZV?=
 =?utf-8?B?ZkFWdU5NNUR1YkQ2bEpGamVtNUpTOENnRUpjQk5EMklUbWZKM3MzQ09JT2NW?=
 =?utf-8?B?YVd4MHRrMkV0Z3F2bjBaZ1loVmZ6QXBwa2swNVpDcnFzbjYzZWQ1OWIvQStX?=
 =?utf-8?B?dG1aL1BvQURrWmptOG9OS3FrdjFPNSswcDFsMzU3RFFpQmFlb3YzSDhzNVpu?=
 =?utf-8?B?M3cwd3BRamlsK1VzcGgvQmNQd2hxK0hlNStRYnd3NlI4VjRIUURCWG9GSU1l?=
 =?utf-8?B?Vm9ZeEF1alQ3alNBTnYrdzZKSnovS00yTms2Tk13UUhKd21oSG9zaHlldjBD?=
 =?utf-8?B?R000MlQ3bHkzWktIellYMjVMMHVXQkl4UG56VllTd2hPZm9RRXNxOXVRUHJr?=
 =?utf-8?B?dWFwRUxvanpNWWh3WFhBTElZY2xNUXVSS3crZWFBYXhSdlp2U054OU5RY3NC?=
 =?utf-8?B?Zm1hVWt4Sm81Mmpnem5EZTJuRFJxL0hDZ2JOMEpzT3VMRUcxVGw5N2J4WjlZ?=
 =?utf-8?B?MFVVbzVtc3l0MXNKclNQeFV6RVRyVDZyeWVDL3ppc2pVcWIwNjl5d05kVTJQ?=
 =?utf-8?B?UzFZZXJxOWw2S0JCMy95QWY1L2VRTGVEb2FTWEJVdDZFQlJkbml0cG1uZEFD?=
 =?utf-8?B?QmtMVTQ2bW9JRGt5dDl0Vy9YaTFCWW9jcmlNL25tQ1RsdDdMMHlXR3g3WDc2?=
 =?utf-8?B?N1hKcjVEa3U0YWRiMXlGWFhQOWZKRVNta2trcEo1SktxWVJPckVrOEJMa0N2?=
 =?utf-8?B?TzhCMXo3M29GSFUvRUVvdFNEaE4rSGxHOTVmYVJzNjlEZEVKMWZRR002NUpT?=
 =?utf-8?B?UUhSbndZbGcxVGlTb3FwOUZLV28wMjY3dFdHZWtDZWRQdVVhZzBCVEdxT3lN?=
 =?utf-8?B?cWJNZldENWZwSzJ2cmRzd2RMNFZlcnBudXQrdzdFWEhteWt0bUNlZU1nVVZT?=
 =?utf-8?B?YlV4eXN4YllQZ3lYMUVsMWhtNzNPZGYxVFVBWEFBeGJMdEJQQnpXd2hDTlVO?=
 =?utf-8?B?enFtWHdvUGJCQ2JZSHJIUnRENTBEemRrQkpNWEZ4a3FZK1N1MDRxVW1oejI0?=
 =?utf-8?B?R2FNKzExSWZhN0tkVWd0Y3lPS1cvRHRNMEllc29nV2p2TXhJeXQ5OXgvRXcz?=
 =?utf-8?B?S0RMTXArc1BXVE1RQkNvZjdTL2w5QWlPZFRSdi9XZlFvM2VEdjNOSEZSbDN4?=
 =?utf-8?B?TWgzajBxZ2VpYkRtSGllYmUvTWhEQlRGaXYyVW9td1ZMTmZoUDdDZnRxQ2Ft?=
 =?utf-8?B?Sk5zWlJ5VFA5QUt5Y0Q3K1FURGhRYkJlaGlXR2hvYzR2cWsrTWtPOE9zNlJ0?=
 =?utf-8?B?cUgvNXBKNkUvWWNIMkdKa3JwNzQwd1I2WE5BSEpGNmZrczl6akxRbjNtUVlm?=
 =?utf-8?B?OHdHcHJrdDhnbDk2aFVwMlMyZnluS0xXM2dUODRVdkpvMCtvbEpCaTFTeFQw?=
 =?utf-8?B?a0VaWFBYTEJubjBxWkwzQkJxc2pHYXdiYVdlVENkeTlvVU42ODUzQW82aWJt?=
 =?utf-8?B?cVFZODZrL3owOFZwZXoyd29SSTZrM0h1SUJ6U1lrUTBMamxxVG42d2hxR0pZ?=
 =?utf-8?B?eUNXcHhBN0ZWN05ycmFwdGRLRlkrTUhVME9CU2c2Rm1xNnRiVUFHUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8f3b2e-dedf-4e58-b5d7-08dea5a650d1
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 04:18:07.5436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +m1YF+28k4EQxsPFTxvCD1goL7AKHGTWzghkUiyQmN6oqcQ3WkDIGPyy2CVWZXUuZoQuHIhF9GdR6pw/x0JAhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9225

On 4/29/2026 9:37 AM, Fabio Estevam wrote:
> On Tue, Apr 28, 2026 at 5:03 AM Joseph Guo <qijian.guo@nxp.com> wrote:
>>
>> NXP i.MX95 19x19 FRDM PRO is cost-effective with extensive
>> expansion capabilities based on the i.MX95 19x19 SoC.
> 
> It would be good to explain the difference between the i.MX95 FRDM PRO
> and i.MX95 FRDM.
> 
> Also, does it make sense to share common nodes in a dtsi that can be
> used by the two variants?

Hi Fabio,

Yes, I will explain the difference between these two boards in next version.

But actually these two boards have totally different hardware design. So actually only few nodes which
are not related to the hardware (which means the IPs inside the SoC) can be common. 
Their SoC is also different package. 95 FRDM PRO is 19x19 and 95 15x15 FRDM is 15x15.
I think it is enough to create a individual dts for this board.

Regards,
Joseph
