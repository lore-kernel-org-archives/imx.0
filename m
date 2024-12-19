Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619121BC5C
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734613843; cv=fail; b=Sa0i2nn4qRft0rHtkQK48QsZ8rfMU+1Gk0tO+c0ARLR8wiH8e5zFmY75J9yfY2uWs/MXR6koAySJo4WM3IQcRXc9e/seczc7h5JxuZ+kfm+bc/8rdJUx1DOBGM/r6wOY+dhoR93ciVJ0Hbv7+OVCp6vM8wbawJQ7LWVPriqa9Jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734613843; c=relaxed/simple;
	bh=ToWQyx3na7JB6mI0GAsXFrPJ8rc3mCzPfVOLB8qZ/GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s9mbhRcHGQL6MXxWbAWTDn/FYZfobog0Xw+EXpqMsB1iL1SEz1vs+hJgtJTEq8CAYIpQZnXvw71Xpw8B/YIc5Wr6RjKJNfo31OfoMy/ptwh9x8j+qEk1cMeMmGeqhbwPSRVL9mvKfHVHkdA2CwzqRm07eGr2ZfbdsvZbV3bYbDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rPCPX88p; arc=fail smtp.client-ip=40.107.20.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rPCPX88p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVNTnyhf3VaCFmQee8itZrEwO+5OptGRJHHdk9yarjSHAUZONHDhLNqaARVJsf/kaXSlEpq3zHvFMu9NgaDC7+0sJ25kbsF4bUnAN2g4u05bB5KN+Cz8xfEAcLWHmwKcEd/MWrCbTKdJIgDAhBX6JcKfQqVhcEMoKCcUPpHhuUT+OYmd2h6hkkV91hDwdmIkWtxS72o4HocpQNqXktqxciF8JFcOQIkKGvr/6bq/dWlGd1qOyxbAJ+0Fvs1KDGNxt235zNEhgaye3JBSReoJfZM8XDJtq38fcSjMzCclFetUP5z79OcsOF9QUIr4OAfwVGr1KrRsdXcBQ4YFIjOJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thzcWzw1R36DqPgdvtIL7BED6jyvYSKKHuq3aSitJp0=;
 b=DI/kqOLQyD/cRikF59vg1cAqdSV+MXGMB3UhaxHS33mlGBKipxoOZSqX6j7syAgoZEIcqjD5FBExbibVzKOOuISi9pV0n6GllRRBkvedN0ouvFLtj1Rtfq/o6z38qp20/lF77mris5l+UX/cHFPM1sDlJ5iVecjpr9qMUi5q/NoeEQ7gzqfaYVrSANn47e7gjVwb9XBkVZvDdEFlVcOh2CbPism9qe/5CRfXCrfxpDR0tKQ/2Ye/uFT1bW/0juqQc872/DNXzUYZ/RkxwZHSPMTdnK7/eZhZgQU4wMsvc74dvzuVpdQLTe48JtlnFQVo7LiUyuFSgDvOC259Byeqqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thzcWzw1R36DqPgdvtIL7BED6jyvYSKKHuq3aSitJp0=;
 b=rPCPX88pg/JhNN0LuYgkAuP+eVOMnXH80LSgE38Zgre+e8sPGXCDcpdaEXs1KxUnmk6f8kSIJjPDPzOXQQK3ne/9CnqFKtSV0dHLiT3U6o105hc31RCMwlAqUUqGA+bjsmWe1MOI/ZP4PgoDXcppouKbRR/X/Slj+mYYKttjbZJ+N/Zanar+7IHlmODbI8kqpHPLgB+0Z7RB1x3s1wSRHLcS72h+A1WiQfYY5PhhX6YErIUvYTvlidOSKlBbu2OoaYCB0fvGuhEThOZjL40GV6yvDkI543r4UAuLHjDZQSVYx2Yfvnfhq8rxLUEviQK1TEtOGUQzkNLhDfXUVSaqOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0SPRMB0099.eurprd04.prod.outlook.com (2603:10a6:10:47e::21)
 by DBBPR04MB7754.eurprd04.prod.outlook.com (2603:10a6:10:1ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 13:10:36 +0000
Received: from DU0SPRMB0099.eurprd04.prod.outlook.com
 ([fe80::81f7:ab08:594d:c11a]) by DU0SPRMB0099.eurprd04.prod.outlook.com
 ([fe80::81f7:ab08:594d:c11a%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 13:10:36 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v3 1/4] arm64: dts: s32g: add 'I2C' common board support
Date: Thu, 19 Dec 2024 15:10:26 +0200
Message-ID: <20241219131029.1139720-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
References: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:208:1::48) To DU0SPRMB0099.eurprd04.prod.outlook.com
 (2603:10a6:10:47e::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0SPRMB0099:EE_|DBBPR04MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: c28842bf-33d5-448d-7103-08dd202e8717
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnJyb3pYc1dUZDMxY1lYWlJrSURDOVIyWDQ1ZVN5RXcyY0VvejUzaEoxUTdt?=
 =?utf-8?B?VVFMVmRYRGJ2SFh6ZjQ5aDdjbmNEbFEvY3FaMmYyd2JPWGJlVERjTUtDbTJw?=
 =?utf-8?B?aXpYZFJIUjNkYkR1UlozN1ZNTHZnSnpkQ2hIQ3orYjNMa3cva3Q3d05kWUZh?=
 =?utf-8?B?MWF2SExrdTdFQ2ZWR0wzWElURGx6cUJmSHV4b1lpaU5HT1JSb3hhVVE3OWJy?=
 =?utf-8?B?T00zU3BFVmFaYkR3Vm9JemlWbGlWVkgxQTFvazhDNS9PQVM0QXBnY2Y2V0Nn?=
 =?utf-8?B?OTZyNHNyTi9lRjNkR29mR1k3dytXc1N6Y1UxOGlwWnN1TWdCMDAyQnBrUFJh?=
 =?utf-8?B?cjZMTkFGaFFrY1dwTW1lWWVIYjlHVkp4b0tydFhPVjVmRlVuZE4zV29lRWdz?=
 =?utf-8?B?TE84WWxtdmo1aGlibklBRm94a3hMUkNJRkppSlN2eWZ0d0dJaEFScys0b2VD?=
 =?utf-8?B?eDR1d3NMckxtdFlUWUtIb3BUeXlMUzR2am5OUXlQL1JTWW9yakpLRXhXVkJl?=
 =?utf-8?B?bGVsalVsM3ROQjlqKzN2K2dvZTJWOUJxajJWVFNodWI3T3hKSlZhVHYvNC9K?=
 =?utf-8?B?cXZLekxHRi9yaWc4cEx0azU0czB3VllZWGZCQ3RXL2RPMmk1dW9ram9pOXVI?=
 =?utf-8?B?K0lNdHNFc29WY3daUlRkMTBTSE1tenZvYld0eHpJT09vNktROFd4dVIwcUFz?=
 =?utf-8?B?T01nOFVnVk04ZXBVbE9DTGtYdmNEOUp3QmFZWm52NUxYVnI2L3RLV05QcDFV?=
 =?utf-8?B?NXczSlVjUDRlSGpZb3ZtbXlTV0dtUW9jNG9TemhlVytyREJxMitTT1ZXSEJJ?=
 =?utf-8?B?VnNPSHdlL1crNFBiS2cvVmFPRXhxWFR2RFZYbEZhMkxINEpqRzhPSWx2TFRX?=
 =?utf-8?B?MzIrZU45b09jY2FOWGRsdnFUQVBCb1FVUXkwZURiT3M1SkRLMFlybXJ0ZjI5?=
 =?utf-8?B?aEhUOHhNSXNFYUNzQmNmTy8xUGhJMFAyODBJbCtrQ0xLNmZ3b0pmM1BHcklP?=
 =?utf-8?B?SE8vY2NPWHE2bXhpSy9uQWgxMWtpU2k2dUt1aDlhVFM0MHRRVGJqZDZnSkt5?=
 =?utf-8?B?dVdlTktycCtWUHNuc253UU9MRUtqM21PL051cy9lc0prSDV3U0lIZUM0OWV4?=
 =?utf-8?B?UDJQRGRTSU1aem1jYkJtR285RUNNL3lYT253amtXNW5sMmthcXhZTit2Zyty?=
 =?utf-8?B?WEZkSCtmUTRpaGl6bE50SzgzSHlpWEhaWTZTMmh4bC9JS0drNXduOFV0L3BF?=
 =?utf-8?B?RUdDWnVpMzRKSVF1bGNGL05YdmcrOWVlVU00V3VNVDNZNURSK29EbmRlWE5u?=
 =?utf-8?B?Wlgwc1NWSlgxZFJUNWhzUE84MExCR3hXWEFrQlB6K0JOd20zdDBVeDA5ajlt?=
 =?utf-8?B?NEsvb09wUzFQNEpNUEVpa1NFZGM0amVDVUZvUVV2R3ZQWHdzSCtxZ0xqL2I5?=
 =?utf-8?B?UnQ5VUN3UUs2UTByWmkwKzJ5R2hpNzllVFkzeVd5WmtCYnFCMFNUTXVyWTF5?=
 =?utf-8?B?bjBadzh5REM5bHBJNExJN3MybWx0RHhsMjFWMjJSSmIwajVjUW0rcVF4dEtp?=
 =?utf-8?B?S1hEZUtZUE5oWEFjd3RyTWxQODRReG9wN1pKSTIxN3E4OHdUdVdua25aZVRX?=
 =?utf-8?B?NWRQWmJWbmprTjNFL0pFY3BHQ1U5VXJ6cU10OVBkTDQ0azBsMWhUc25RK2dI?=
 =?utf-8?B?Q0JPcVhJNGxXTE5YRjNWSjZ5cnRmRVdDK1RDb3pxUy92TUpydWpteWt0ZElX?=
 =?utf-8?B?RVZJRDM4Z3pPUTcwRmVRellwNUJuUUdvbmV1NndqUzhjbGhMbTU2UEs4K0oy?=
 =?utf-8?B?TGhpajNhMzB3ejJESS9UaXplYVNlRTRnY2Y3SnE5eGMxQnZ1MWEvbmNVYVlr?=
 =?utf-8?Q?N3IUCIaNn1JdA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0SPRMB0099.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU5zYmZpNHVJbTdoeFpIa3U3dnJ2Q2VTdXRRZmpTbXpPZkVRUmFSN29QMFlM?=
 =?utf-8?B?dnE4Qjg5RytKcFlHN1VCcllnYkJ4b3hLVUt5czRFY2poM1Z6U1Q2WVQrbjZ0?=
 =?utf-8?B?L2JTYzZxY1BGQ3JLb2NmZVpWSUtPUi9pcjN3aU9iZW14ZEg3N3c5c0thbzMx?=
 =?utf-8?B?R2h1M1IxL3RJc1FxLzJza1A1bUFyUWgyOFVWNE05dFc0ZDZQTEM5UEJWaFYv?=
 =?utf-8?B?R2E4TlA1WWs5TVdzcS9kdUYzWUpsLzRtUHdDaDFsamN2Q1V1SEJwNnZEUWlP?=
 =?utf-8?B?bzBPVW9TRUlrdWZiZE5UdGMxUWpqaE5LTElrbHhlMnRxNCtjcytwWWhtQXhq?=
 =?utf-8?B?YTVrMHdHS3Q2WHFUWTgzdlNrUml2eUtBSTJ1b2xPOVRyS2JJSy9mbzh2Z3M5?=
 =?utf-8?B?T1VoSEpkUnpNYWZHU2g5UGM2WFVtNUxjajRnRU5oWGpZVGNJTHQzOUtlVnd5?=
 =?utf-8?B?clZsVW13SjJDd1h4ZEs2TW5wTWpYZTVHN0c1azdxNUNXU2ZmbVVTQzkvUFVB?=
 =?utf-8?B?bUh3K2dIQ0k2R21BVTRFNU5Ic3c2TDhoek9QaVg3M3RweEE1MTdHanJVU2lu?=
 =?utf-8?B?ZnlkTG16VC9XK0pmMGtla3A4RWtWeXpVMTFpZ282Vmpta2ZDOUpHUU5SK0hx?=
 =?utf-8?B?S0kxdHo5WmQrclQ0Unp4bjhseUtMdXVsR2tvb1VFZ3BmT3gzQWk2Q0dnODB2?=
 =?utf-8?B?RzdEdmdaVENUL0wvKzVQM0hiclJtMVNJRkFsMGFxVXpOZ2dJZUtwNFk1MWg4?=
 =?utf-8?B?TWQwWEhCMmhCL25ERDZobW5HOCtPN1NHVDlOZEFQUHFWWGpnbWlEWWlqYmdL?=
 =?utf-8?B?TlI5dWtFd3IzZHNZWTZqUHNybUFSSjdOMHZ6Ymladk50WS8reE9zRGdvY0ky?=
 =?utf-8?B?bXJ6ektSV2NOdmo4SkRzVWV4eFQxQW9RRm9qTWs1Qk4vWmpoNE9zeDAwbkRP?=
 =?utf-8?B?T2hDZVdsallZSEcvM1NxWktLY1FwdWdHY3dUUThCUHJMbmhzWmZFVXB0Qk9H?=
 =?utf-8?B?OGFjZHhLSDF2V3ZMWUozR00wOTBpVHp3cmdRWkJLV2JhQW9lMzh2Y3U0eTZt?=
 =?utf-8?B?ZjZFdlNxTy9HR3FYeU9YSWt6UGZETWl2a2h2Q29OTWJzQytQM1RkV1FMd21Y?=
 =?utf-8?B?c0JWSGZMQU1NekducTVLRFNKNlBhMC9xbTRyOThDdlhkWDBTdVk5UW02SjBk?=
 =?utf-8?B?UHhKdFZpWktoNDdsZDExR1B6ZXRTUVBJV0hFZnU5KzAya1R3NWtkZnlFaDdS?=
 =?utf-8?B?Q2gzV2swdmJHMVBKZ01sWGd2V3dKVVVDbVpWRGlkVHJpaFlPSWwzUEFOKzVV?=
 =?utf-8?B?MnJzR0c1ZktVTEdrTkFqM1dpcWszYlZuN3lUbWRUanJnd3VuT3d0QW9rUUJG?=
 =?utf-8?B?VWsvUkUvdnhDWFNOTTIvUm9mWjh4RUlmb3RmOXlzYU5KQTcyTXBBRFNuT0U4?=
 =?utf-8?B?aFdmY2I4dWRVSERvcUs1R1dQZ09UaDhuSXV5dVlMVUVDRHorc0g2enlPWFBZ?=
 =?utf-8?B?c2NDVTVLZlVyMFV2SnVEUUpNTklzVWl5eFRWRzBwa3VQdmFRcm1IV3VwMjNG?=
 =?utf-8?B?OHRFNERoanFPeThjSDdiNThNVUMybFJ3ejVDWldENWhyNEpUQjQ0Y3h5aGZC?=
 =?utf-8?B?K2kxUW9qTDdReG1OaVhTTkNvRjFYOXlOV1djUUt6ZHlaYStIanppd3J0Z0RP?=
 =?utf-8?B?cTlUb3dHak5GbWovRHRHNitndDBrdmoxS203Tk1VVjFOcTVhM1ZnOW1LYmU3?=
 =?utf-8?B?OG1vSU44RmRVaUhoUVh6ODlHaFRGRktNa2lDZ3NvTTVGbW1WLytvY2tYdDgw?=
 =?utf-8?B?QWlkd3dCMjZycTBjYndDS3dBVjRWVGN1MlR4M0hlMVpab3lOSDVnYnp3ZWY4?=
 =?utf-8?B?NDZWVHRzTTNIc28wTmdGVE85c2NzVnEzTm5iaXJnQWZ6eVJPcm1zdDR6NTBu?=
 =?utf-8?B?MXlKbGpwbHh2d2NMelI0Y1VGMFZVaXhGSW9xYzVyeVVETldsUnVPT1YzZ0Nh?=
 =?utf-8?B?K3ZsQjdwSlJ2cGVpMTcyZGxLSWJQTnR5Mm1VMHkzeUNidjhwbllKVnd6eFlp?=
 =?utf-8?B?ZURoVmxmckdNbE1OM016SHpBNGxYb0lqRHloZXQ3SDFIV0ZINW1oWTh2bkVE?=
 =?utf-8?B?WGpVRkF0dDlaclZPVUdXWkVxaUhaTEdFcjlabmduZkdOUjhqWGEvdmFQZkdi?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28842bf-33d5-448d-7103-08dd202e8717
X-MS-Exchange-CrossTenant-AuthSource: DU0SPRMB0099.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 13:10:36.4381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/1VqvR+XBb8t0slGxiNIfDhtNNVzTa0bSii5k4l1q6Bt0J4spR4ignarBX38PkDhSsj44wFlVpcLrbX+47czCnf0kPh2sYPfE1fhleNfqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7754

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

On both 'S32G2' and 'S32G3' SoCs there are five i2c controllers available
(i2c0-i2c4). Specific S32G2/S32G3 based board 'i2c' dts device support
will be added in further commits.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 45 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 50 ++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 7be430b78c83..0e6c847ab0c3 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -333,6 +333,33 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@401e4000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x401e4000 0x1000>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c1: i2c@401e8000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x401e8000 0x1000>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c2: i2c@401ec000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x401ec000 0x1000>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		uart2: serial@402bc000 {
 			compatible = "nxp,s32g2-linflexuart",
 				     "fsl,s32v234-linflexuart";
@@ -341,6 +368,24 @@ uart2: serial@402bc000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@402d8000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x402d8000 0x1000>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c4: i2c@402dc000 {
+			compatible = "nxp,s32g2-i2c";
+			reg = <0x402dc000 0x1000>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g2-usdhc";
 			reg = <0x402f0000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 6c572ffe37ca..666e4029e588 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -390,6 +390,36 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@401e4000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x401e4000 0x1000>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c1: i2c@401e8000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x401e8000 0x1000>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c2: i2c@401ec000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x401ec000 0x1000>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		uart2: serial@402bc000 {
 			compatible = "nxp,s32g3-linflexuart",
 				     "fsl,s32v234-linflexuart";
@@ -398,6 +428,26 @@ uart2: serial@402bc000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@402d8000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x402d8000 0x1000>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c4: i2c@402dc000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			reg = <0x402dc000 0x1000>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g3-usdhc",
 				     "nxp,s32g2-usdhc";
-- 
2.45.2

