Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EDD48986C
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 21:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787694381; cv=fail; b=ZnwYwoQbksW1oUbN3qvH+21vD0z2tAp1Jlwq/rgAPwxGzvZt77bACX/lFnxLQv8fUj1o9edH6K0WrQpui4LKCoeerpoCm/f55qGcfRe0qLZvXRd3c+04yWuLypgKefBXtieXDapMaYAjJvBDrtfh54TIe1aGIbvvcydwyv4dQXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787694381; c=relaxed/simple;
	bh=SmJXWt1j8YoHJKcz1fQnCekkqs3wxi4rRx/+jFsUqPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gmsryEdt5mV0iULnsbcCyBuqPCBBZA22vD+yqwwvYtNDL5fSy0OBbBD4X2+d6pjAuA+IBX1aZ3BsN+G0+mh+29eH9Njt838WoPAxEzHdhxMUh2PNw0cJcXaNk+8jugJHov9/ZphfObsLFypORsmg1SH54jbLnHrfqNdSPIgHNPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eCzpIi7+; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eCzpIi7+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWVWFwoWG3z4JLc2Ue9/5mP6Apo1xzlgeQkr/WWGUanboJsvPygDpvOAanmLlCTEbXRY/xRI5Iwfaju7DdZ3xjEx4VAXmeTmPVQa/4Rge0j0RH77yhYIFNJrHa/AHVCSP9Zya1PqVnMVJI+6+B4prV3GWnjgnY0Pw1d8f/oyxL2q4FuI4WTj6qVqOwLIz5QQRmVw3u3UI0VoiMFTM79po9ax7n4a+JetipAIOF+uCcohvssudrGnTnASwy9/d0eCodHSQiD4KVujRe7/YxXlFsSWPogz6hMGUUtSEaMQrocbhz0qdYNtGx3VGbg3TjXcdtmSzvzEzD6vdiMgUaVi6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bP67wmROG0I99gOkkOnKRlpSB9MdSEYX0WVT/VaUJRk=;
 b=JL+2JZ8tPTlxfybwJ2goSC3OlXwj5CfO6/WogTUKdvwsnTba1c3xn9dXdk4JrMYRdQ4ZuSBQKDTeYH80Cg03PzalXC3xl9bM1NAAc2vHs4GOYn7KHKRbPZAPRMF2ILdxmVmvAmyrHI8FJ2ALyaezEtrZ6Dq5ZQyzGuU/kwM7/q2ruarRWPN07TrUWjbbIutu+TQBICegL6TlFovs1bXKxBZfmsX8BqluD2xFvw55rB1lXRYxApcG3am0GOvN3pra7HmiG54ZirsrzA68iQxCs0bp43X4KbCxZxQoaq3T72SHdgfVgMPDg+xQ/0jrGOLst8PZrc0sg5NzmyBnEJ6LYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bP67wmROG0I99gOkkOnKRlpSB9MdSEYX0WVT/VaUJRk=;
 b=eCzpIi7+IaRIloHkzpVVBvhUxVLsMGX5yDIvv+ZJo5YGsOmfdOpTgrg66Q8zU+dcLpfkOD3N/37OUijiVBFiUp3X+wXJFDBBG1azktemZCGhHPUn+VZlit9Dk0RW8PVAa0FO5UvOr2M8jiloZFwL7AUWBgpimux0wNNjeDWzzJtDPAb/ZKperLx60bA4PAnv/xR+ftN7ZnXajABEnYiBPAm58vsnYdlOw2PKF6A1wu7MFA4GzU2MqQjfa/ZslDf6y/SztO1J/i7B0lraFvq6pNB1fWsTfKXlX2FrYqbkE1L9cfbOA8T3o4HcqvkQ12vIddlxdo2Pjixtfvqv/iaJ/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8909.eurprd04.prod.outlook.com (2603:10a6:102:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 21:46:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 21:46:14 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sherry Sun <sherry.sun@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx95-15x15-frdm: Move PCIe PERST# and vpcie supply to Root Port node
Date: Tue, 25 Aug 2026 17:46:07 -0400
Message-ID: <178769432074.2276675.1191318022705051337.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818-imx95_frdm_pcie-v1-1-55ccf1822b1e@nxp.com>
References: <20260818-imx95_frdm_pcie-v1-1-55ccf1822b1e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0137.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8909:EE_
X-MS-Office365-Filtering-Correlation-Id: dd54ecbe-b7ac-42f2-a309-08df02f24960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	qKeOdlezlnjB/GICX6yHF3xPwN6roZAxvpXsXZ7UexGM5HO/ea68NKoH8rT6hSRSyzJYgfL3nEHcBYD5kJSR8WrhdMSjYh1m7NR3iD3lGAywyPhK8sUaV0UlRig8stxi98V35v+n7zo9mrC20ZFge9jSxgPbtOiWTaZTJ2XMA3+WQh6KCikbjTbrMxJyAjJzjKwn9R6Ec8FkPh9meCmn7V8G1TY2Nfw+qAG7PmfW3pFyN8h4WSVHPuvmuiNOyPIKEJ2hP5xwMsshNPe6DnGZbpkgZ9sXBdkdH9UAZKa/PJyv7k4nb7Ip3YAZHbFwrs8Ah94/40RSNV588B+eVINvWYSyfzhoE7YX1AV2iyQXMQ9Ew4vRD+wl6xRlksPDlhdrmsorXvzf00rgYb/GNFvmOm/rvPmIoQZteBOs0RRxZbou8VGJiL07v2oHBwKw82sazcqj1AjVaX74VizAYytFFVMR8cfN+wVqs1AZk77NSUwZ7yXnm9t0et+dyMLDeNZjtqw5lTxs3DBxd1NXbHp1oEML1jVrxQKGLjDmSFP9zfcVk7cG3kiFgdMWGtsTE/sjOSkR0UIFteo0XFfD6ZAQLCwS+cjK52sKsS2Lz6/W+Czb1AYdWd2pnmebshpYvF4HbNiZoaIA8QQ7Hfxd6SyICpSOYZyEx9+6lBWkmbJzuig=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlZQQytoOTl2NGdCVUlKVHFBMXdsOHRETDV2T0FtWDQ5WjI4dTZxcWUvckJE?=
 =?utf-8?B?RFA1Y05pSkN3UlBLLzd6RFJSRTg2UVpaZEJJaHRCbWlSMGlUU3RBWU00djVl?=
 =?utf-8?B?akw5eXFVSjltVHJnNTBEeWFJVzhqbjJtamdVV2gvZWhubHFxMTFtd0ZqS1RW?=
 =?utf-8?B?My9DMGFUczRycTloMVZOckVaSWpCNzlwVVlHcndqdXZiTTZmRVB3Mml1bzdO?=
 =?utf-8?B?Vk1xUkxIem9JN25vVEJsVFE1d2tQWHVYb1pIS3dyRjA3QWI2ekVnV0hoVitN?=
 =?utf-8?B?eDBvZmhBV2tRcEJmUFYzU0RjZHFOOUZwZThhNEhxbXZ3bUh3Y1RQZjJtSUFs?=
 =?utf-8?B?UGNOMFF0TEcyb1htS2FwNlZRbUNjcUNyODAyd3FpbmZDeFoyUDkwVmNWWG9N?=
 =?utf-8?B?UG9UM3g2T3NhT08wTkswUVRQUmxiM1N4eStsZHFPMDdQZTZIYXlpSWdGbDhP?=
 =?utf-8?B?cXVaUDNHVC9VRTIvenNQN0VFd2d4THFGWU9ncDR4SnRRSzdCczBaUy8xVG1S?=
 =?utf-8?B?Mm5HZE10aUtOazBjVzhacDlSTDVrR2Nla1Znemt1SVltMzVjZ3pNTE0ycXlM?=
 =?utf-8?B?dzJLdFY2YmdHd3dqbGpxMFJVS3E5Vmh3dEMvOVkxTmxHSTlxWFM4UU9SVFM0?=
 =?utf-8?B?cTBra3dDQkJOTDNhcGxtN2oraW82RVNnUmhOdkV3emRzTGpzMjV2cFV1NERx?=
 =?utf-8?B?cEFhYTIzVEY1NGZ2dUZwdHJQK29KZFRaZk5aZ2JQNU16TGJ0Y1UyNDRBNUwz?=
 =?utf-8?B?ak94VjZCaTlVQ1hsUFRjNTdvVHlFc3hNK2JDNjlVT1IxQjdRWG8zOE5WZ3RV?=
 =?utf-8?B?cEVNcE5pTVYybW9kMEwxQXBjazA0eW92QUREaFNnRFo0NUt2Znd6cEZkVkpo?=
 =?utf-8?B?WXhzWi9ac1oxajN4ak1sSUZSL0hpUHdINldMSVczYlI4bXhoRDBsbUh5Umhs?=
 =?utf-8?B?Q3RTLzlpRlhRdGV3ckFJVVovM3cyK1JIbi84cFJZWVB5bll0V1ljQ1FmVnhV?=
 =?utf-8?B?N0pKZGNDMnd4MEt4RldOS3B4Nkc2RlJqTHRZdFZoYmJvajhSUEN5Qm9wYWxV?=
 =?utf-8?B?TGttTVhhdnpmUitya3BTSUtpdXk0bDM0MlJkaE1oY0VCVHFGMEs4dWVrT3N3?=
 =?utf-8?B?K2NYVFFZcGZmWGkvYk9KQmU4TmNGU1VKRjJlNlYyVVFFRHRvK3hiQlJpbWlj?=
 =?utf-8?B?Z1BudnpoMHJ0QS90L094eXA5QkRkaGVMNXNQdVUxRmpWZHZvL1hrYzZqRkZu?=
 =?utf-8?B?bnZVdXh4VlA0TmlYcFJMSi90SzNZQUdQL0RkOTNJOHF1SDJPUnIyOWZzaTVp?=
 =?utf-8?B?aVBOQkJqZGpnbEo1ejM0c0NVaFZtSlBmSWs2SXVBaVpEbmVhNU5vc0hsczJK?=
 =?utf-8?B?NjgwR3ZwQzNhU0J4di83Y3AxQjBtWnVVekpNeEZmNldsdXRwdnVjTklCSzQ3?=
 =?utf-8?B?ekwrMXpZUGZCeWxwaU9rUy96dzY4aEI0YktReS8vc0FJbGx5TmFnWG9leXdL?=
 =?utf-8?B?RDZwVmdUa0wvRklydndQUDgvcnJ3alBVRitRVUxIdERsVHJvT0tGQ3QzbVRQ?=
 =?utf-8?B?U1lYM2RJQlMrb1VaOGtVcGx2SHgvYXN6T1lMNmtQM2pXNWxoaTVYVHc2QzND?=
 =?utf-8?B?eUlNWmExeUMxMVBHNC9hOWpNWFBScjBTNGFTUGVWSTdqR3dXcjZ6UmRvYXg3?=
 =?utf-8?B?L3hOQm9KcWV3c3RiUnl4cm9TNjlIRkxRcThOSkdxM2l3djM0dmtHWXNXeE91?=
 =?utf-8?B?T011S1YwRUozZ2I4SXhrVWRiMkxvTmp6VEpCc2FTRlJCU2l4cWNTeWM0MGtY?=
 =?utf-8?B?RTNCVDJjbzNHZU9welA4QTdQNTd5RjdyWjZOSUJDR2F4Q21MZXcrUGxuOERO?=
 =?utf-8?B?Z1J2ekI3ZTF5MVdsck5ZdGt4MzRJODdFMWNWSDlERjNrOEZ0d01TUlo3ZktI?=
 =?utf-8?B?WWRkSHJ1VmVpdzVpbFNCSEhPYzNOTlp2b3RGUW1PZ2FtNUNMandnUG9tL1RO?=
 =?utf-8?B?bE41TWpCOTMzYjVkb2RSNEZnRDRUaHMwWnUyV0E5Q0Y1Z05NcGpjUDJOSy94?=
 =?utf-8?B?clpleldHdzdjL2lDd1pmRW50TUdTNnl4Rlg5Q0xMUEtHUlBGRXVsdkFqc0Jn?=
 =?utf-8?B?U3lPd3llREZhb1JoQW94cTNReEhwREFSNEtxK0RWelFsaUtuOHBuVDdiNzJT?=
 =?utf-8?B?SGoySUoyRXIyekR3VGZReEY0TlhxdmVTYTV2K0tUdkFMTEtQbFpuc3J4dFNV?=
 =?utf-8?B?d2lCcTkyL3Z3cmpEcXJJN2JSZC9zWEFZY2k3M0FRMWgvb2swUEx4dHhLSkk1?=
 =?utf-8?B?S3JxUXlPSEFqSE4zSmp3b1JJN0hOOU5yTkhaME9idlQ0UlZudEwrbzBMSndr?=
 =?utf-8?Q?/5XzfbebN0Ijbkoux3ueI31k02x5/fuAGsGQ0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd54ecbe-b7ac-42f2-a309-08df02f24960
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 21:46:14.7586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nydwM5plWhRpfbFyRVNa/ik9vfZ7Wq4NF2yJ7E/C9iyA84tRXY5eMOwg7gT2XNReuPCG//H/+0ZTI4J/yOhBz47VArQac4+2nwkgMtSks7mMC2VN414ygm5249QiJegJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8909
Message-ID: <20260825214607.9Rj0lEloJ0dMflAL4aFAHHa_GTu98ioJMCQ_ScjqS5E@z>

From: Frank Li <Frank.Li@nxp.com>


On Tue, 18 Aug 2026 10:55:44 +0800, Sherry Sun (OSS) wrote:
> Describing the PCIe PERST# and vpcie supply properties under the Host
> Bridge node is now deprecated. Add the PERST# (reset-gpios) and the
> power regulator (vpcie3v3-supply) in the pcie0_port0 Root Port node.
>
> Since i.MX95 is the new platform that under development phase, it should
> be fine to simply move the PERST# and power supply properties.
>
> [...]

Applied to imx/dt64-intend, thanks!

[1/1] arm64: dts: imx95-15x15-frdm: Move PCIe PERST# and vpcie supply to Root Port node
      commit: 79d398c23c19fd7be7e8e13080429fb847a8f306

Best regards,
--
Frank Li <Frank.Li@nxp.com>
