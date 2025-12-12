Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5133D315D49
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765533480; cv=fail; b=LOj2IlCg5A3SEL602/+bxp3tfN56BTNJYDApteDrxgelumYt8O/MUb2bNlTWJyBsTjERxoVoOCSJ2rJhrB5RI6kAPdrJ0SL4RoMuos11StXFWtONbrgG0yWIfNg3cnK4Yz4k6P4dzZnaN6x06ERGaUn9p7BYndZRRlzNlw/Yjzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765533480; c=relaxed/simple;
	bh=0/MSI/ulDmaktJzbox2cbRBQUzTdUs2+4iiDsuc5Pig=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eel9+qJwOLb24j702aalKbAY7I3hyoQ3yIdSQYUHrcVXIYsoE7EGMIsoanoi3CkXw3L5+3cSBjAAW2/fUWS27oB0OLjnIADaD3GTYr7EFOU8GvbgkB5qvzx8rjkBGuucXfV37FkzVyYsdgPbz3BUdZ8bcNKb+9DyzZ2p2ufp/30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=woZN0Ts3; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="woZN0Ts3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIuBcuMnvrUXZHA2UVRYbrwaIA3LnNWVC2ptTXQei1TuKbjxWTTsQCUC/4k+qp1/mXG7eIXLzGpsGBxtRW8K5Lwytj4OrwHc4dj2/dhP9PblG04hyn/TSHuoUAa20lRtCEiJ3XWKJk/1+ifk99qkvwuGNxGJYOjkn5zvXcWZ9K0B9Nabsg5GZzfJpCBJ4AfxG+nUYRtjgP8GThZ4Vp7da0ECG7ngcaakm6Wgj2kJy+V86lQyZULI76giR9jMWowToO3ASG1IIIA+sasqNxwvtu895g9RBSXGvoojR0bkkQgQuDdmxuCv7kT+PMI4Y7QzFgmCIdGZbin4lRnrNcXV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xA3EqrjowR7h4MOI8J9XZRKQ5l5NV2OZq5h313qnJ9w=;
 b=hPH5PL4vv9lpdfyT4A3zlfzUJs27FlESj+f5TjoBr/pqnqDgkSK23UmZuP8hgRG5EtjVUryLYqAoq56LU0Oo3cw/GAROSAx/91FLtz+WVjwE4696iPGRcgvpOW+5loWH6deIBhHpbVRnr5Jy/iONLx6k829Th5Q1EStK54+dAj3k2a/OwZ/2Nzg/zZzM7kiJcWUoymFiuWfNCVk0cXt3uygjKTV8QoUdIA5rc+fuGxkRT3UAuhC1qomkA1RLPPD7EM85tqM6c/isq5/t/pfffn4HY174av1BSptn/ZLgRhk5MgVIh464T3BvoloUoBLhu5flFA0E2fzW5o7h32sIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xA3EqrjowR7h4MOI8J9XZRKQ5l5NV2OZq5h313qnJ9w=;
 b=woZN0Ts3VZAS9XU7gFVsadmfXdkPb840BdQdL9AsA3Wd+DxdPlRMHNr/jTvUHLzJUvrBbfbX8BxRwWxu+LfD1O+1PwrB9Tv+dHOiS8+42OaWj1V7steyIyCxoYgFEJuietUO9k3lMJMg8iKcmLfPJvIYEXok/ozOuW7ZjcJ4SDRPzgUKxJ2OKic7/kFFy+qYFk4hWPbvWjfJZMq9SWPPATa7BuHRJkX4DxKWio1kRGzO3IB/8AGE/DkkoJHW5Noa24a3thxd+L5PSppDczWSqIh2zjgjy8KcT+w3IOrE7Nd6mMU9MWKSe45JSzsxS51ga9tTimAykObflPvzJt/A3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8975.eurprd04.prod.outlook.com (2603:10a6:102:20e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:57:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9388.003; Fri, 12 Dec 2025
 09:57:56 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Dec 2025 17:57:20 +0800
Subject: [PATCH 2/3] arm64: dts: imx8mp-evk: Use phys to replace
 xceiver-supply
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx9-can-phy-v1-2-a421d7023e13@nxp.com>
References: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>
In-Reply-To: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ee4323-a315-4e09-c21f-08de3964ec6a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N01SWCt3WXNNRjBobG14UHdpa3QwUTdpS0RVdytKRE9aSlhZbVRCOHMvYVQx?=
 =?utf-8?B?SlFDQWpVelVxS241aUZ6Y285OVhIL1pYSWt2NnNLM01ybnZ2aFRPUVkwait6?=
 =?utf-8?B?RHdXelBMQW5XSy9jQmVWcnd4SXE2RGs5cXhQNU5ORStuemxmaVg0N0JxZFhU?=
 =?utf-8?B?US9EVDUvUnBGRW0xUWlpeTRQWjBoK0VEdEFTcDhKcU0yZ0FIRXNoU2VOYUl2?=
 =?utf-8?B?SVV6cmJTSUJGdGVmeGZaUXFaYi9wUERMYi9WdHM4anF4ZWNwTnlmSVB6VTBm?=
 =?utf-8?B?ZFdGWTZxWFV0akpzTkpTeE1xcTZac2NYMlI5dzNtVlhvTjZ0TERiZ1VGSVFp?=
 =?utf-8?B?MDZ4QWFYbkZtWStYWXg4dURFa2c2a0x0c05PNXltalY5a2N5VUtUM3dXY256?=
 =?utf-8?B?by8yZEJzWUtIeTh6TGFIZXliVUhkejN3MVFnUlArQ3pqQ1NqTkhabmNxbm5U?=
 =?utf-8?B?SXNVMDhoYytZTHFWbW1RcjZEbHc1aXd1QXRUK3BUZjhUai9MdnRURGdqeVpa?=
 =?utf-8?B?WmxBZ3IweE9ObkhXYlpQeFdXLzNRekZtajBZRWRxeEFsVUlRTlJMNUtWamdj?=
 =?utf-8?B?dHd5R0FsSWR4Z3hlUnYwcHZGcjJkMkwxclFtcnFVNXZvTGczMVhYMDk4MUlT?=
 =?utf-8?B?THh4T2ZjU1RZdnRkUDg3OTYzckhOSDE0RVlNLzJ6bC9DQ1JLT2xBWVp6NWZt?=
 =?utf-8?B?MXdLT2NPTnZZMksxblZIR0ppL056SUpqbTlLY1ZIYXptMTJNOUtoaFdVQS9Q?=
 =?utf-8?B?cng4aTVlN1plSURsaEVXQW9ZZlhMNTRVdHlRSVNrYTZydm9sYTlRWlFOQ2l0?=
 =?utf-8?B?ZTBybTRBanhtdWFWV0JoTElIcEI0aG96Y3JwUWUvSXFqd1JvQnc3TElXNHJC?=
 =?utf-8?B?ZysyN2V1OFNOTnA1K3NYaWpXeENVTlR1eUFtbVZiRnFxZVVmdEgxV25lWGJS?=
 =?utf-8?B?Yk1CWHJPMjdiVk81SUJPQTh1dUdnSVpWdEdyb2dlbHl3Z2x5L2ZkUGJFT2FI?=
 =?utf-8?B?d0Y0OFVKNG1mbnE5d3dva1lyWGpRODB5VUMyMk1SRWRYSUFEdEcwNDV1MnRG?=
 =?utf-8?B?aHZyNkdKZ1Vpbnd5TmQxUmRCcjNNWUQvNlVHSFZzTjUxUnpMNWNaeTFnZmZM?=
 =?utf-8?B?b1kydUVBd0dRSFZDai9VaFE1RSs3U0tXbStGRVlGR3ZpektKZVFJcU1QRE5P?=
 =?utf-8?B?Y1BiMnhUYmUvdERkOFJKVkU0eVEyUUYvNkpPUUFIZXg5QTE2QjAyak5yR3ho?=
 =?utf-8?B?S2FyVWIzblIyWlBHaGJ5Rm55dTN5QXc2c2pCVEdycWlsd3ZHT2FNcElvQk5M?=
 =?utf-8?B?bzVaamNPMWtKNHJCQ2U2NFpqalJVdXJFMWNGMjlyQXJVdkV0SzFPNlIzajd4?=
 =?utf-8?B?R1VQODU4S3RkQUhMVHlDL2x5dEx2bWQzdVFsTnRjdjIzVUdDcGNEcVhZQ3Vj?=
 =?utf-8?B?YzQ5Ti9IdDYrSDNqaDFvem5xZHplc3lPMDZwZG01bDNodm9URUN6eTJoZUVW?=
 =?utf-8?B?bUZBTFExY3JHbGdCTGdWYWRjK2IzY2laMFBZUk9YQ3lJMkhFTFJNaW1tcjkr?=
 =?utf-8?B?b0xrb3lYWjNHT0JFUXAzN3I4ZVV1anliWmNkaWJtS2ZZWEdCL1JYUU5vT1RD?=
 =?utf-8?B?eDY5djNSZFE0cWxEaVpNWWJMUjZlRWNrN0kySVBYMERkeHYrdXBNZHJucDU2?=
 =?utf-8?B?dE9INC82UVp2MmtOejNtM0VXRmZsMTFrQTh6ak1McHJQNVRWYnFxM2hNTncx?=
 =?utf-8?B?U1lNbnRKM1RBbldhNEN0WWxaeVBDc24yVDVoREd3WkpkK0FLYnhkTXFOS3hi?=
 =?utf-8?B?N2hOdk81d21DNEQwNUx2b3l5anIwU3JFbnNQVmFLY0xRdWV0aVM3RjQ5amdy?=
 =?utf-8?B?ZFQ5Wm01NjRsd1Y4REJaUWJyeGdmL21KNERlTXg4SUMwUDN0WFZ4c0s1U3dn?=
 =?utf-8?B?TDJkNDV5TG8wTXBpUTdRQjMxaW9qcEZEc1dQOVhXZ093TVlIMkdCOVlza0Fn?=
 =?utf-8?B?cHRTNWlXejBPTERhRU9XZFBLeXVILytPSUd3V0FGblRYdXVCSUtnRlNCN2dH?=
 =?utf-8?Q?s/VS8L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzZDdlZiVjM4bFdMcDdnanNwbGIrcmUrNzJ4bXRkSEFYN0swYm5JYnVpdFRv?=
 =?utf-8?B?VitZREc5Zit4OWpRYTBZa2F6OGhXWngyUWxRVnp3akFwKy9MWUlVNkxkVkha?=
 =?utf-8?B?MG9LZU16aEVIYVJMaGNaY1VnaXVReTJaeE9xclRjcWx3ajIyY3FwTlNsRDFz?=
 =?utf-8?B?ZkczOGJ4NjArSjhSSEN4RGdHN3pzK3lVRXRhYmRoRTRSRGxxWE9YWTlZRVBB?=
 =?utf-8?B?dGpCRmtOa1NlWEhqeGUwMExLNnNINVBmS3BlaFp2UFd4djIvZEdFRFNiNmdw?=
 =?utf-8?B?clpoSGR0RlRTdTNYNmZ5anJWTDhTMnRabTZsVmNBVHQ3aUx5TE5xZzhRTDFW?=
 =?utf-8?B?MnYxeXZDV25nWmdPVVVoeExPTW9Jd3hTMlNvUUxGaVZ0bGJmTmJWQzk5STFt?=
 =?utf-8?B?Z0VNSkpqRjFIUU4vV28vdE1CeWN6RUVjU2lBWUJaNEc1VGpvMUQza1lUeUZw?=
 =?utf-8?B?Y3JqU2xsUVIxS2E0MkZ0TzZybkNjekVWaHdwOVUvd05DZXNaOVpkQWJsbGtk?=
 =?utf-8?B?OTh5ZS9hYVJnNmpvM3FOZEFIUzNIUlA1eDEvNVRIbTQ0TExLcjJJTHZzQkhl?=
 =?utf-8?B?eDRacjBUc09JRG5rT0pxM2dXdVg3U1NCdHJ6dUVGcS9rckR1YUFiM1hnOGd1?=
 =?utf-8?B?c0oxclhXZXlsMVM3T1BIbVlXUFQ3U0VBTVJCblJ4dGhMdlh2eEFaU0hXOWtl?=
 =?utf-8?B?Q1ZveWFrYTNwT3VTbWJxV2N6a1BmNGY5ZW1LejgweG1oa0NDNmhpaUN6WXp2?=
 =?utf-8?B?clY4YnFDUmU4Mms5Y2pXSExXSGFITzN3dy9FNkM0dktiQW1PTEtXbjk2dGJi?=
 =?utf-8?B?OThVSGRCQmpJeHlReUIzUDI1L1FCWHRYN1czOFVQell6eENTb05jWGtxMHBi?=
 =?utf-8?B?ZTRXRnN5d3FrUDdLWDFxb3VSQ0JJZWp3MmR3c00zM2hRSVl2Z3JLL0pzY2cr?=
 =?utf-8?B?SkhDZGdQREt3SkJERS9ENlBQaVJRMGhGMUJkQzF1aEpWVE5BQ1IxcTlwbEtM?=
 =?utf-8?B?N3VUcUlyODhmUXg4ZzBuUlg0c0FhQTloY0NCaDZRclN6UTlNZjl3azMvanIr?=
 =?utf-8?B?K1J2ejZxeEtkbU9HQVhvOTFLczFFRWxmaEp5Q0hKdW1DQnNqUURtT2lIVVZW?=
 =?utf-8?B?RGYzemlVQjErQnYzMmx6RHlsTHF3SUFLNzR1ZTNNQ28yK1hYelRKZEdNaTBi?=
 =?utf-8?B?dWI0RTNTdk9EUUZONjJKRWlub3hzVnV0c0p3Q1l6cXQ3d3VieEQ1ZnFOcUIr?=
 =?utf-8?B?aVhzOEROQ21KUkJoZVQySFNhS3hxcGt4dkdEQW5aMnRRQ3ZVbGZPckJPNm5M?=
 =?utf-8?B?K2dWYTVGQ0VFMEYrYUR5MWJHS055V0IrSlBTNEluMTdsZmxlTFFkZ0IyN3dH?=
 =?utf-8?B?WWxqcUxzQWxCdkJjL1JmcjdSWFRwMkYvN0VhaVhVSzNuZ3pza2JYbUtLbnU2?=
 =?utf-8?B?MTRtTFpZdDYraURtcy9EVHZmVkVSd2NPdlZNQ2todXdXeDgrRkJtQjhidVcx?=
 =?utf-8?B?V3lRZE0yY1p0MjcyNkdocDZaeWUyTUJxb3FNV29nU3QrZTU5UXVzWDZxNVFt?=
 =?utf-8?B?RkNENnBzVjV1NzlDTXRuMHVCZUtaTGFNZWxneVBSbGpLdTByeGk4MFhzVlFs?=
 =?utf-8?B?QTF1aENzOFFlVHhYQXFBenJ0U2Y2eHRBMnpVSVpTNHZmUHYvQUFzcE9aU1Uy?=
 =?utf-8?B?S1UxMWorR1lTalIyNTVjdm9LOStlR1dsOW44TUh1ZDJzdTJTVFhqZHhELzlV?=
 =?utf-8?B?MnNGUUZEWTg2VXJYdFVOME1nYU5NbUJHZ0R1M0pCQjd1cVBYazZHZlBWVFRS?=
 =?utf-8?B?T0N1RnF0WjlUY0JqKzFmU3M0S1JReXNvdCs5NmdDUGJSL3NCdldmc1lmNzR5?=
 =?utf-8?B?VWNMd3hENmcra0JhRmtXMkxhSGlsSVY4eHRpUU9NRlkwS2FMVkphTU54Sy9l?=
 =?utf-8?B?ekVTNTN5bEZkWFUvb3EvNlppKzl2RlBvMGl5aERhUEQ1eUQ4dWRCNFMzWEky?=
 =?utf-8?B?S1lvaFI2dTRHVFRwOUlmZ2pISWtxVXIzb2FKQVlUSlZHTlI3WjNrdEpjTUNF?=
 =?utf-8?B?ZjQxUDExNzNjY0gyWHNnYXQ0Qmc2dTlZSElIMUQyY0dqTjFvT0RRQlFpejlP?=
 =?utf-8?Q?aBoKrK2F+/Q0Srui0SzGxxarz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ee4323-a315-4e09-c21f-08de3964ec6a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:57:56.0657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFsX4jOFP/PJLfEhTiZsVJtC6ZJYiGspUdTJW/h20EM3GT/JuR8Oymvn6UDNzrJJFKgXOrh2h2s2+UZfRaUqzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8975

From: Peng Fan <peng.fan@nxp.com>

The TJA1048 used on i.MX8MP-EVK is actually high-speed CAN transceiver,
not a regulator supply. So use phys to reflect the truth.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 43 +++++++++-------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c6facb2ad9aaa210d355a0f40eecde5e4b2f4c5d..7ededc1a06179808070f1f82172d313c8d043de8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -56,6 +56,16 @@ memory@40000000 {
 		      <0x1 0x00000000 0 0xc0000000>;
 	};
 
+	flexcan_phy: can-phy {
+		compatible = "nxp,tja1048";
+		#phy-cells = <1>;
+		max-bitrate = <5000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_flexcan_phy>;
+		standby-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>,
+				<&gpio4 27 GPIO_ACTIVE_LOW>;
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "HDMI OUT";
@@ -103,28 +113,6 @@ reg_audio_pwr: regulator-audio-pwr {
 		enable-active-high;
 	};
 
-	reg_can1_stby: regulator-can1-stby {
-		compatible = "regulator-fixed";
-		regulator-name = "can1-stby";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_flexcan1_reg>;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio5 5 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	reg_can2_stby: regulator-can2-stby {
-		compatible = "regulator-fixed";
-		regulator-name = "can2-stby";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_flexcan2_reg>;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 27 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_pcie0: regulator-pcie {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -431,14 +419,14 @@ ethphy1: ethernet-phy@1 {
 &flexcan1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan1>;
-	xceiver-supply = <&reg_can1_stby>;
+	phys = <&flexcan_phy 0>;
 	status = "okay";
 };
 
 &flexcan2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan2>;
-	xceiver-supply = <&reg_can2_stby>;
+	phys = <&flexcan_phy 1>;
 	status = "disabled";/* can2 pin conflict with pdm */
 };
 
@@ -909,14 +897,9 @@ MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX         0x154
 		>;
 	};
 
-	pinctrl_flexcan1_reg: flexcan1reggrp {
+	pinctrl_flexcan_phy: flexcanphygrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05  0x154   /* CAN1_STBY */
-		>;
-	};
-
-	pinctrl_flexcan2_reg: flexcan2reggrp {
-		fsl,pins = <
 			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27      0x154   /* CAN2_STBY */
 		>;
 	};

-- 
2.37.1

