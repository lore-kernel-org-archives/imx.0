Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB812D9ECB
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 18:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339945; cv=fail; b=kppuq8OvowR4pOnzztY4IEAcFqafWY9LelhkBDDEUI6r54sv3dlzFeT/+OE4Iuf3F6Wdtwjob1QubM9fbxTEhrJgk9XQTPLdlnj5NhzWBzy0oW3nsHQAz7uAN7T8N03j+JTW64HQ1v4wEw2sp/+3ZUA6zqSsJxRxhlzWzrjsE0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339945; c=relaxed/simple;
	bh=+M9ERoBfxjm7X28N5PHJOHBPsXV3dWqeTm1Rs1QiZYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=obYJ5K8wT3I4N1Jc9vqD8gaMwxP1vwNIOljflH1cCBzOCRmCRtzaWkQsasb/UlusNe6KtkFvhpcToWM9Z/+RW1RsGONzd4+UHtVm3kHVCfQNIF3zDaD6DTFnbquQJ19+V3NoMQZI6WDiA8x0Hv18GoLZfWKS/MW1Dju/YISrP+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R24A4mtA; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R24A4mtA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGQrYkhd21wRg/rdnkXXXam+hAxcWt8dKSy7Q+SPCGWSZ5fS12R3S+ilLb/X2L61F24hXWAVI5InBSWbqYAtnCGuVi+u6SY4ybH0DC8qJL2zBcELiSMX3sgK27Y9inYXWSX8TB4pO8y9Uihh2yslcqDx56zFAqCgcQGtD4pEtKeNocLmcOrqpULNohQ/P1YofRx7wXGlxPhLSq59hO+PPrq9ZgQgV/JeFq2XSzqkkuMxsCaO7SumMmw2Hqxc1h+WAblGlokMy5pDubZV0d0dj9BKM3RABlu7Cs3Xu3dJjdqdcuiOhf4SKWCnfgptX/kEv8U9nrMbdzAP0vRfUnminA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=couy/oFOZiCRG/97FkLUlV7aXFUJePUbkSx2VdZ/P/Q=;
 b=vPm2sYxVHACudv4cJa3pY8ePVaYfsvfayFLBXtO5KIl6K3iq5SGKZBZf1990KlfuuZAzux2trH7+JN/cN009GKSH5Vi2NIRa8CECP7n2rArsTlvJ/LCZPL/2b/qc72lC6P2qIu6yqo9rHY0iFFY5Ph3J2eaBIjMVi/LOicUIAM+EIpK2eBQJnufT0v6MItGgvZ7sA1atGPEy9hDqBPWxudOgFjQAH+CrSGSCKYlrXeYBWO9sV+ePcoXN5weG1575xSRH+KPM1kbNW+KTgGkGfWBSbTqIBIX0B7Q6PCje3rqifT6vCLy8A+Zw240IXyBXHUoCTE5nVIWJ5+fUu8FEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=couy/oFOZiCRG/97FkLUlV7aXFUJePUbkSx2VdZ/P/Q=;
 b=R24A4mtARlIxLE8o77CegYSsUrIRgXJj5LibXpe5sRogV6BKyWM0QmZ/TtCqK5nBi7zFWQUIWBc05USIdVdVklmpc3BaYihciliwSdopSwLXnC2xUnxgwIofQ4ZbuMdUkSzjzcxYu8jLVJyU/6Gx9dTNYr4TKEncmJLRoajxtzV7YT798FV3Vi87CRHZRfyMwHtgwHyRnPfQneQpbnceidmyj4LZGn97oimngF5hb2ssqDsCtmV9UwUjzq8N27knCynH8lfHIXtHHpIy/6d8gKb4kNdjhaiEgxL+eQH1G2axb8Rwf2ZBSTXlnop/yN90LAYtwdaqG8srvJ7HA7sJjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10921.eurprd04.prod.outlook.com (2603:10a6:150:227::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 18:52:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 18:52:18 +0000
From: Frank.Li@oss.nxp.com
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v2 0/1] add SAR ADC DTS support for S32G2/S32G3 SoCs
Date: Mon,  1 Jun 2026 14:52:10 -0400
Message-ID: <178033992458.279833.17993672738559869740.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514082639.1181240-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260514082639.1181240-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:510:23d::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10921:EE_
X-MS-Office365-Filtering-Correlation-Id: 65645248-5563-4574-724e-08dec00ee76e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 nYKxCb2uF1bUjOW6dqwvoNQYYQTA++8/v6sKQUfy/dLdgQr3ypE/PEpCUI/QrdYfT96Hvjyp8rbDqQSb3Ck8InUeu/6jvfDx1BJ1GV7yMW3oUBSh0zNqX7aK71os1C0eYc/TKKFyWjtKw4OS+PLJ/v7A/Aqj7+O9GwO2ZP+a6dPMXAWrld/OHbeP0FI62zN1BiScHLvDLeYlL0gnc6oiMrDtsKUDkXJ+JXNIWzQfRQsC3lzSX2RZ0iTkj259IMSTaUbzHN5BuJnYi46yg70D3TtDlOfk5uVJVE/5Dw+5Bg9jdwk2MGYS+5yLCz3RO8wqy02YaaAzkQg6cB1gnl+SFSVMZeb/MBCalzVRdUJ2aAh2GUK3dZZFChdhw3XSUQTvwnGVb9Ibm5R/JKMP/lkvlq/IVeGBZIDilSfG2BCDHdwr91b04leMQeMsTnLpm+S6pOZge7yNdaLTXpFWX9jWy8alr+vGFaHjExqVy1CRqwP1NACaJ2bwN1e8HoGaOBM4EY/P49/1rrq0q868SJ6oQHTMqQa/yy4NJU3b66rFj5bwV9K9yFk0WhKhQ+ODXAmfqUtKkrd34RAoBrgofIhl7BYFqvEKZY1NiKmphMotRZzio/SOIzEcp9Z+G/jkxt0igzzdSNsAMYgKbM0sKGR2HmDmRggCVeeftD/uhzPWqcq8NC849ZzMPgMxWpDksdg3
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TGRZand0V3lWOFVoWGowN25qdVJxS0FLTGpnNjhOSTB0d3JmQkR2cmVhQXlP?=
 =?utf-8?B?RUxWSU9zYzVyWHlIR09JdXFtbk8yOG5UT3ErSUFIcDdWcVRDK0FoRklLcU10?=
 =?utf-8?B?VmFrWkU5c1JRTGNucUlSWlhsNU9rRE1TNzF4QkJPNkJLNTZYNmM5eHpTdEQz?=
 =?utf-8?B?aktpYkFsK2xjQXdFRGNjK0d1WGJDbUt4QjhZdGRYQWFNYXdBdmRjMTdrbFhF?=
 =?utf-8?B?elhMc2ZpdDFjNmFWdDh3eTRXK3U2VXJWM0tSN1ZFOFVzUnZEVkJlNmc4TzQr?=
 =?utf-8?B?Q0ZidU5TQTFPbVBNOS9SWHlGQ0YwVndiTWlBODJxeFFCczN4aDNJT3NjcjFY?=
 =?utf-8?B?ZlBIcWxYc1kva21ISGgweHNFQVVJRjRqRjhtY3pwUTRxbTJBcEhXWG1WWWI4?=
 =?utf-8?B?MC9zMksvb0RuRXVGUDd3ZmtjSllGR3Jya2F0M2kxcWlENnM0d2NDNXlmbEhO?=
 =?utf-8?B?Z296Sy8wZTRYVExNQ0t3UVlqVzYzOXBFTUsrUlpMbkFlY0dwTDV2N1VqMU9B?=
 =?utf-8?B?eWh5Z2FtQ1RBN2lIYlBVdWliWVBoMEF5dXU1c2lMNHdVUDhmR3NPUnhOSzlj?=
 =?utf-8?B?Y3hEZkthakJsUWVrT21CQkpWRTJscEJXTkxybk95VXdWUnlTV2NzTUdwVU5D?=
 =?utf-8?B?NHZZK1lGVUI3SnJ1Y0s2Ty9Nd3VmYWpvdFhSRWlCY0tCM3NGUFJwTGFMY251?=
 =?utf-8?B?OFlqU2NLVkpBeXNyTGphTHFmK3g5YTFlVFg3UUFneWw2WGFkR01DK1Jmb0Qy?=
 =?utf-8?B?ZmEvOXZTTE04Z2ltT1Y1bzArNVZ6VWpuTEZEVExGSUpyMjBRSUxTNkFVK2tG?=
 =?utf-8?B?YTE1ckIwMWJPL1g3ekMzeGJobXRsTWpaYnNIcW5SOHEveUhsUjhiSTFaTXdk?=
 =?utf-8?B?RU4xUXFtbXFpWXRnYlpTQTJGS2JxbXdkWXZQQ3o3SlhIU25DN1F1Y3c2QTdV?=
 =?utf-8?B?ZHROeXNhWFh4VVhHTUxmRnhEOEtLT0pLY0VlOVVtWk16M1pwQWVaUFJIQ2pw?=
 =?utf-8?B?NHhmblhPVUNjeCt5N212ZVZUeHJvTFRadTU3ZkZodzYxNllWUm1WVmxwalBq?=
 =?utf-8?B?clhwL1pMVUR1UVlTMS9VUDA0d2kvekZqVXVuN09xWTVlS3ZSQ0FsU1BoZ0FC?=
 =?utf-8?B?S3pVV2lTUmVTZXhjKy83VjJGUXZlcjBjdGdmVjhteE5YV2ZTWXpleEpjdTE2?=
 =?utf-8?B?b1pENUd0amFCdGc0bEg0TDJ0MnpFcW9uWE9BTWVRekJ6TldydlgxY2JuSEdM?=
 =?utf-8?B?elVPZzdvOVR2bFlhVy9pc01nSDEyL0Jlb2dJbUVOaEF1NFZiZDN5NmkrQ0hF?=
 =?utf-8?B?UURackFjaDZGTGhELzBvOWpXT210QnZHT2FNNE1vTWNlYncvQ1lOT1VmSHh3?=
 =?utf-8?B?N0IyYy9mUXFaSldHOWJuQ2Jrd3FQRjIxSHFHK3NHZVJzUnFSQXI1S3hyVGZG?=
 =?utf-8?B?V3BhaERFMFZmVStYc09IZXdKNCs5N2V6QVVpZ1RtYnBSNlAvN2tRMmgrRzdN?=
 =?utf-8?B?SDdXSkxRWUpoUG91ZVlkeWhsYXY1aXNsMzFaK2tBVXdoTC9uTitaZDZUWktn?=
 =?utf-8?B?ZGx3UG83NmFNd2hXZ0w2V1NCdG5PYm90MEpFL0tnOVBoRHhyVzltZ2FYdG0r?=
 =?utf-8?B?SUN1SmZwQVRTamJpSDhlK2tyMkJhbDl5T3VHQnNhbHdTeHQ0akcxcjBJVVJ2?=
 =?utf-8?B?RUNmSitqZGxSOGNNL1NFVklHTnQ3T1g1MU1HVlZJNlc2Z1FsVnhTVmhOUnoy?=
 =?utf-8?B?Kzg5RE5mMjJCbklkRWNkOStZOEliK29LMGEvOUQ4V2NEMFVWOFJvYU5EUkg4?=
 =?utf-8?B?NjJPMTg1QkI2ZU1aRnFxZEduMVA0TXk3VG9nZTRUM0RCSzE5U0FIOWpIdVA5?=
 =?utf-8?B?S0dabmFzeWFIajNHbFVlVXA0N3lVakI3OC9ZV2dCVmZjWFN2UTVOOTFZZHVK?=
 =?utf-8?B?RjhFYU1YK0NRMDZYeWVlbnBwV3JZbGowaXVmc2FTb1NqbWNHNnZJdHR3UVcx?=
 =?utf-8?B?ZVc0Rm9pV3lYTFJNM3U5bkJnZVJOTmIzb1IxaCtza3Fva0htN0JwZVJ1dWpD?=
 =?utf-8?B?dlU0ZTYyWlJpSzV0UzI5VkFPRDdsbHUvaldMRFhFS3JqRHQ5Q05FcnUvL21k?=
 =?utf-8?B?YWdZLzNYL2o2Z3l0ZWtraHluSHBJSUMyU0tUWit5b0YyOHZjZkc5d2xpTHlp?=
 =?utf-8?B?RFFmMk5nVit0b2x4NThETlBVQ0ozR1pGRUNaN09RSTVPWkZMN293NFJ0ZE1w?=
 =?utf-8?B?RmhqNnhydHgrQThGWUpBSU9WL3grRFAzMFFjQUxoQWs3eStYb1JaUEZsdzEz?=
 =?utf-8?B?bUgwUXptNktqRitod3d5cGdYbVF6OFVrOXd5c2lYZ2paRG5XeGZ1Znc1RFB4?=
 =?utf-8?Q?SrqLFBo2Erx8OS2g=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65645248-5563-4574-724e-08dec00ee76e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:52:18.0496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieBIqyMcbKD1bT6+NodXrTxLzxGfKA7yf4eXI3GfiSx9XxrEmupqxTvb+o5XA4n/NslA5ZUnaSFAzb99Z/31m+AYOm/EZ08B0lXCDE5CjYia3WR4tzPSXpthr8rxEgDL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10921

From: Frank Li <Frank.Li@nxp.com>


On Thu, 14 May 2026 10:26:38 +0200, Khristine Andreea Barbulescu wrote:
> This patchset aims to add one change to the S32G2/S32G3 dtsi support:
> - Add SAR ADC dts support for S32G SoC based boards
> 
> v2 -> v1:
> - drop 'vref' property from ADC nodes
> - reorder 'adc1' node to maintain ascending
> unit address order
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: s32g: add SAR ADC support for s32g2 and s32g3
      commit: a9882a7623490cc4c562d2e98f9e017c98060e12

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
