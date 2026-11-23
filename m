Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795469124;
	b=d+QcM5afi0DbokCQnt2hgvbc9B9ypB6TWnKloVTtqM3EKmKBlisTrVpQAQYLuM3oCA9r
	 HwaEDy4Kjf1aDPqLVpnBah4XzkH1ECKCt4/Za42ITEvPD45Y4DtN4/XN2yvJDV+gzEwaR
	 A+vnTNTZuaf4WIvScTOsHYn5MQN581PaAofMKN83ZtqGfLwbCLr+9kfzegfLojHzSyU+y
	 B2kKraljo1X5wjmOzBDXyl0sd+yhrvn32T4fNXwbb4wE7ACzNfhgQBn/PwcdcU8MiRUTU
	 Nb2vOnFsNOg0ZPccgvY0EyY170adx+ocgbQNdE7urtVvorZQcY9vxjPFlI88/GC4/tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469124;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wZAivBtRtLWcgM4HWvBb1J0EkN1/qMExe1gj1iNUfz8=;
	b=Ins/GD0jfqj7SIcToJXSsgt7CmIcWit4T64/ycAOtLl063D3NIgZH4+5GOll2H6mx0zA
	 ST53TeFkYdEqCHqvKKuBtXYvBwFZjnRR/JtrvC2CqzAHbLYhTia6wzjNqtZPHRWlylgrT
	 Bjf+WmBWvo53odOL6YQ+7hNLAe0qBDTtysrAKKBmfJibyrrMPpl3GnmD2IS0t7ksq6hBS
	 QXyosDtTM09Ar+bjxk3Hr89YOF2xuUmm59ARP/H3d3UIxtZme+wfFZgFEetEI2nl3/LlM
	 8RrgS7eoi5qTCDBo2o5nIDPi1cFVtAJmTkHsmZ98rJ2rYqjtBBsh8QRpNA3hItkXhaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uH3ISwkJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.12
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B48D606A321
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 21:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B48D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uH3ISwkJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuNAVThaG4I64K2tIg+uKVcwfqa/I9YfdX/Bwxbx3Net1VrWz2LpUFX+bbELPlO9dzvQt9l3BHoS9/Pn/nyu5ymkdTSONeHNRfg+o/qNAfkjgBmaEzDgX+jhS+6PmAlv04jDfJ1X+mZCcKRdxQUYjveLuFggxCBQyvhMy1pTahwB7BqqNA8yGN4rhLw5HVdGMFmYtb3z1UatIYOKgUZQOiuJNE1NwtrCB8hz3aQKyONqX8gvqFS4jT/jyKm4ze0wUNHfUlaoOvKTFR/GwAPqmUnWWFccP9xVgwXoZCBssIR0dfIDd/MYjxn8HfrUJGtYq1tzTR44qikwpvLc8zlfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZAivBtRtLWcgM4HWvBb1J0EkN1/qMExe1gj1iNUfz8=;
 b=EROYBXcHRYJ4CPjvDP+FuW6uvzw/4BCzJhQdeYCoTKnJsaYhXTKnMI3Nx6Cv6cga3oRyiBwe+k//NxBLLL4OfBF8zKNF1ij8IfbVbFSJoiS4B14sKVCAWhSjr/3MlXyGiqoP9XUBHLpnfkh7KeBcUl/Wgg5JUEzpF4uC4hwgwmRjrVx9gP46J9gOprcJTgY/FiHqqrKCWHcVVgf46mV1KlEji6ALMauE/8zA75+SDkiRXADzBmxJr13MnAkkvxI8NJT24wi4zyEcOcCnQHadQZij4fRITRmJxRtTwrVievPl9QGKRdwmRrR8qt8hLXNl4TLhYUmwSduCBurU60WR0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZAivBtRtLWcgM4HWvBb1J0EkN1/qMExe1gj1iNUfz8=;
 b=uH3ISwkJ24n85bjYoBj6dndsehQ8OEvAeNFZJytoOR+fhVNs0WXHLMrU0Oj1q+wMX+lPQ4CE3S9QDGiCC4AbZoPHMNkeKWrhK1ygBZ+wAJtUsgIRJjv/chOpkO6E6ru0Jx3QAIFERQBsTHsyMCNKj9UXx6BWJWW6CEeiwhVWGiX3GcHejn+ejAVP40TTC76gYL3VbWk5uJfXne1ouWntI0TcRpToSFHfcg+Ev8p8V7MxACcmnEYjaNtwfPsQLC+6jL7qJny5JHxzWp0aiGiAuICnBum/CxEeglBX107et2nlGB1LekqlAI8JWuqeWNk29aydbUueiObO8ljQyg6dcA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV4PR04MB11823.eurprd04.prod.outlook.com (2603:10a6:150:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 21:25:20 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 21:25:20 +0000
Date: Mon, 23 Nov 2026 16:25:11 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com, martynas.grybauskas@draeger.com
Subject: Re: [PATCH v4 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Message-ID: <awSvNwkscHbCNZts@lizhi-Precision-Tower-5810>
References: <20261118090914.38082-1-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118090914.38082-1-petko.manolov@konsulko.com>
X-ClientProxiedBy: PH7P221CA0032.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::35) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV4PR04MB11823:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3d145b-8d62-4cf9-4d47-08df49a846aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|23010399003|261009223027099003|18002099003|22082099003|3023799007|261021121427099003|261022075727099003|261022105027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	9Xc8qrkD3qEtdtqW1YDlNMWIP+IrkG+aQGDLWN3zirV0zQUrjVqqiG020Wr86d2kIC9VZHeHD4O/sgCkOdkjlqeji/vkQ9ZdOF3GmsiaOe3J0y+V5LtaFrgsfntXPgXx9oS4rXjKb+vGX/vEK3dHwRSekkBpGz15XFUwdXuJC4sz7IKDk1+COC0htl0Ct0oERqgfXX7tVedwkkzNf7ODp9FRKyr55D4PPXrgPjR9Ddk0mse7KRJJpWo0n2MaK9F0VXBLO4JQ3Pw+dl4pzpVB4xC7C2U2gtWaFje2C/8y+P0Yx/NzMyQvz196j+HHPWC9pN+CRQrXEATxwWgOjTz+yoqVaB8ONlA2Dw4+iV/x1DC7NCdmGZFZa8upVgJAMEJy+gxx4MAyGWbxIHxzS8OkSY60WS81qCnW33MRa3Pr0rtrxQbKI+bcPC96YcB8MzCJUUq2hoeyGYdJNbJQgeA/KzEeEc77TE0IUjzY0NuKzZRNeUsncAzRDVs3jR6IQC3zbkG69oyTmrE00JwIZykzchuIpNpc+UQGGjX08qOULZcMxjwDo7++SEMH7MmJsDdM2Y3r6tRZ1rFbDq5Afxx4PtS4oOsK5phKj6Dr+ZCVYVE/vGnnfEWAAsKRLqQjP5vp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(23010399003)(261009223027099003)(18002099003)(22082099003)(3023799007)(261021121427099003)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGJFWW5uQXJIN0s1SkwwQ3I3VVJuU3JCRlpHQklVUHhoV24yUlZUc25nSTF3?=
 =?utf-8?B?VjhRTWhZemRhT2dQamVXdWRrRUFyT0JJQzVWSno5S0hUaUsxTGt0NXp6UUoz?=
 =?utf-8?B?elRwWmxic2lMNG9SVm1ISURnR3ptN1hGdis3SUVaMHFKcmNDbGRkN1M2cFgz?=
 =?utf-8?B?MFVheTlCc2Z0MXZGUHBreTZqeVZWUmxseUVUTjVWTUIxVnowdEJqc3htblBO?=
 =?utf-8?B?ampRTStIWU9SS3J5Vk9PZk5jUGFHSmkySkZYSUI0UUZDNWhPNTRDemVvZW5E?=
 =?utf-8?B?ZjMzb2pRem4zcUZQT2FwVzM4NE9GclZhTHAyN2hlYXZucm5IQmJYeXlsdndw?=
 =?utf-8?B?YmNqalFjbHVGTUYwZlpwd3c4TUhNZkw4Qm8rNldCSnNWbHZZcGxabUx1WGVI?=
 =?utf-8?B?Z1hKNVN3RnBITlduVHE4WnVHMmdJOGtBeUlvbGJkbGtSeWtVWHBvSm01Qzhp?=
 =?utf-8?B?bisrZ1BDZ1NnN2lxTG1FenhaZkpFdHJ5VXJ2cktFcXNWcDFPR3IvTjBsb0ZP?=
 =?utf-8?B?YVNYMG9zcUpoS0MveVZKdHB4bjUweFRlNE9JMVBQaXZ5Qno2OGhFSFpYY0VV?=
 =?utf-8?B?a2s4ZjNzcjBhSlFtMVNneWp4QXVHSE8vZEtlaStsZmxoQzhWNTZkRjFoMnk2?=
 =?utf-8?B?Sjg3dTh1WlpXeTBTbExxd0dHc2xBK1dQVVhhQ20rU2xsUHYrZ0lCSEk0TURz?=
 =?utf-8?B?KzlUVC9rTEE4aE9wMm5CcWh2V2s4VmdtRVhwazN4U1BnakN6MWxNSXAwclR5?=
 =?utf-8?B?czl5QzAxMXNwMXdpOG9sNnhMK0FDMzNCajYxSjd1Rk1PNEw5aUt6TVpPZk5k?=
 =?utf-8?B?NGw5WU5Vb2hPWGsrZ2tCOUkyMWQ1SEpaeEdyZlV6UzFUQzFxS0g2R21NSW44?=
 =?utf-8?B?WmtlWXVQOVpnNGN2THpJRjlKUERQajBtRmE5R1hobUZvbVJaSHdLVFFOd3ZQ?=
 =?utf-8?B?TkxhcHhBamQ1NFRQanpoak80SmdtbmkyTHZTUmFQeUtqcDRTaml0OSt1UXJ3?=
 =?utf-8?B?ckFkSHRzOFo1eTFEcFVWeW5iQk1nRVc0T1U2UWxTNXYzYjRkNUpjK21IUHRx?=
 =?utf-8?B?MjN3a2xjTFMwSkV1U0pxU29yVmNOSHJKWTlGTTNvK3NEa01UZmJOdjUvZURV?=
 =?utf-8?B?d1BQbE9QbitCWVJBcndxcUF4ODhoN1AzQVJSd0MvOG5UakdjOHF5UFp6MFZU?=
 =?utf-8?B?bytuZXdydHdPZVJXZGdHM2VTd1RUUEl5TXhZQVVNdnI5RnVHTW9TMFpQampn?=
 =?utf-8?B?L0FoY3hiYmNaSzVCci9IWHBwRTFIbFIxWHpYRTF6a01rcFhQWG56eE13d0ZP?=
 =?utf-8?B?MlhLMDVZNnF2VWxiakVFV2dacTVaTUpRUFYvMlhUMnZiYm8wWkxTck1VNXI1?=
 =?utf-8?B?SFZvUGZER2hpWHRRNC8vSlNQSmhQSUgvMk9MclFHSm4yaEJTUGxZd2NvR0xw?=
 =?utf-8?B?T2g5a01tWUdzczBSSzg4bjRsQVFmYkJJMnVXb01NRmVMeTFXOXVJS2tQV1Ni?=
 =?utf-8?B?Z0hsSXVBMCtMY3RHQndNdEZlakhCRzhOOUZOcGZMZ2JHemNPa1JUdDdxQ0ZU?=
 =?utf-8?B?M1RkVTl5NzZna1M0aFAzSmt3WmRiUm1BMmpjSENWRThnbEVqZUF4aHNlUEdx?=
 =?utf-8?B?WTBTSjkyeDBtS3lac1padmszaDM3WmZlT2RpVng2djhNNHhxdUlCKzJlYnJw?=
 =?utf-8?B?V2Y2V2tQSFQyZ1YxbXE0blduOG5DMDQ5Um4xVEJxa1FsdWtmd3VhOS9JdGV1?=
 =?utf-8?B?YXBLUlF6R2JaQ2ZQZ2REMDhXMVBNOXhlbUx3U2JjNEZLTE4wQmwrUnFBOXBZ?=
 =?utf-8?B?QmVmVTAvdFFUWmppVE1vRzdMT21MY0I1TmJITW1mM3VXZ1dJMkNwQTkvSDFq?=
 =?utf-8?B?KytuVFpWZ3dHV1pBUllydUd2NFJHOUFPSVRJRnVuSDRWZkxpeUV3ZVNVeUxt?=
 =?utf-8?B?TE1UWVBLS0M0NkZqcVBLcFFpYlZHa0RWL2I1TUVhZndEcmlVUzhFaEJGMFhS?=
 =?utf-8?B?S2FyVEJBQjFEUGQ1bDNJbHk2RmxXS3RrVFZiU0luWm1yWXlPWWlJdUFmRWVv?=
 =?utf-8?B?S3lTaHhtRGVVZklTcDBnT3RTQzJLZ1lFOFR2eUtWV2o2aEwwd1NkbW9XVlpY?=
 =?utf-8?B?Y0RySnFCRVJ2VTVSQzBpVkxtWFBZcmxFelZQODJEV3FQcDNUVjNKNk14ejJq?=
 =?utf-8?B?SFRKWVhsL1BHMCtmdXdmaWxnU3ZLbXJSeDFpbkMyQ0dQcytvcVlXbDQxT1Uw?=
 =?utf-8?B?d2hLc0kwdGpyUEpDT01WUHUwcHgxaERqVHU5bWZ6WVNRVktCR2JlRTBiWC9m?=
 =?utf-8?B?dVZRWTV3bkVlSGJJVG9adHNub3paZ1NmN1RuVGQ3aWNnemlnRklJdHVvY2pK?=
 =?utf-8?Q?JEeACueSEzDv47FAEIVo4eb9Q0g9v1sir3cIR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3d145b-8d62-4cf9-4d47-08df49a846aa
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:25:19.9560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLhuzr7KXkkuY+jw/5sTeYfw5JMKTct7XiiO15aKouweS7h3QJH7JllJWs1azBm7zh90X9hw5+VcR9ZPeodPqtZO05ed2yJRMi8Ni9BQrurr70ea+rvSd/Eiej9yHY7u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11823

On Wed, Nov 18, 2026 at 11:09:10AM +0200, Petko Manolov wrote:
> Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
> SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
> same carrier and they are cross-monitoring each other.  The SoCFPGA boots
> independently off qspi flash.
>
> This is the imx6 devicetree part.  There are two bindings as well as device
> trees, since M48 is using two parts: imx6q and imx6dl.
>
> new in v4:
>   - added the missing GPIO_OPEN_DRAIN definitions on I2C recovery GPIOs;
>   - fixed the halved LVDS pixel clock in split mode;

Your patch in my tree,
https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=imx/dt

If there are update, please base on the above tree.

Frank

>
> new in v3:
>   - used LLM to cleanup most of the errors and warnings;
>   - proper use of dt-schema this time around;
>
> new in v2:
>   - add the tag from Conor Dooley <conor.dooley@microchip.com>;
>   - it should be clarified that "draeger" vendor prefix is added in
>     my previous Draeger M48 patch series;
>
> Petko Manolov (2):
>   dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
>   arm: dts: nxp: imx: Add devicetree files for M48
>
>  .../devicetree/bindings/arm/fsl.yaml          |   2 +
>  arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
>  .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
>  .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
>  .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
>  5 files changed, 249 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
>
> --
> 2.47.3
>
