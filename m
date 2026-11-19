Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795122225;
	b=dzKz5BUsM2C86H+0Zh9jGmKiYsWISHipEMPI7zuwjS4BhYSXi94LWkEZi56o6Cx9tW3n
	 BVKQkpqJu50bfXVVSod64WptHtor7br9FDda5jumlYzkFlphym/8ltkJKJWA5X1lS76D8
	 fm3l6JuTOwyRo6nfL1+yX5qns8X3Hy2Ziywtu1nA8nPOLzXvBQAZ0VgGKKGVl2md3jOxF
	 uYOe7uSdCCXr+qJDU4Je1YmhKrNTzo3ClQnFRCAJWKslTU9ZSI8/JVSD0Rnq5kREhGQLU
	 3Q1Li+iJSNb3pvcVgKweD2K5hCUg0jvzlcDznQwn045/tpbHpKiDYI02dgk/V+MkjOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122225;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GyBPI5yvOkE5norKTa2AeBM6X/TZ4IPvBDIYQu/W00k=;
	b=dj2WTsjnxPgUAoL4B3N4Gl7awOyk48XGzQunef+SrABOd7T5jqaw/k2BvIzcLTEuJ4Pb
	 rJIDEYZ1+hoFURgNJBfd/VKJJISYbGpGNOCXR1X8iuPGwk0loCg3N7aviK73glARLATJZ
	 HQpNasZIjQKn6DAXWKI63zNMV2YqM2LGEWZh+JpQw+T2gyY5XV7hLY1AGiHfO3IMgyMTq
	 9T/jQBMxEzbuCL7jsJZCwLFuUWev4TVpsg/KcpdiSjLD+sfHgetcTxn7ceAn+eSrYdDZZ
	 Tm+iUktiuk0PTKPwZPl8SKOBhJI1b0LTa8cWACFOZupdcwaQqIUo9iTV+/oAOSbnbkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=I3aHFY1e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.48
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013048.outbound.protection.outlook.com [52.101.83.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6792C606A331
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 21:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6792C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=I3aHFY1e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnXx5GZ0Vw0zAjThoybI2/9C9UfV/HSL6xoQxBC7pE/3NUFJCybKnockh0BOp17t91l7GqJ+54SNYhG4OdLiscbY+V25tohIFTBG7a/PL2DcGmJkzteopVGJwlig7BcXjIsKIGh6eXP1VhwRKWtoDHmnxy3oRB3bQEU/flU5BN0m3G32N7QH1XDCuV0yIVf4c/E+ksAalWdF9JT7l1CZVi8VJL6WJFdST8OCtjcBMZg8x07wvVS9suGvjUNd9ULUr420g/WuVzEMuguMhw6ISz0LGYOTHAbyz+bnDjqoLEn/maHHqafVyJUMVDAu62Qy/jaAJndBoBOzaOeaL8XBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyBPI5yvOkE5norKTa2AeBM6X/TZ4IPvBDIYQu/W00k=;
 b=gsxT+taEOMLTcoJ6ROY2Spsq9JtUy0aV1VmoZxkeoHdJdlCMsdSPy3GIarAfECWxS96D54RUrpA1qX4RugncCOJ+6pGwxUzBgkgE3kM3ILfIsQhTaDPoDvT8d72dYxg2KV0uTAVK2Mwv/fSUbeslWWDdB/DTshsHy00fFL9WIK3U/RfO1LkUEBJO9pP6ZLRqLW48Rwy4E2u+YEU9PyHLBykfCEBpnryjdbhpV44H+89E7VtkQZTpNtHPWIEIkIPqP4RqXNKkaQ6N6BdFQx7NjCTEpUGekaucIY19TAF9lg8qE3Kzq7k033B63RExKhWubqBOwMfTw251avZiMyBQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyBPI5yvOkE5norKTa2AeBM6X/TZ4IPvBDIYQu/W00k=;
 b=I3aHFY1en5D9gHSh+WdoQ+0D8drq/01K9mDnzVW2m5N83YF4lUmXvFgTItktuA7/Vyx0W4FQaU4eF24HHRTWDlrN89e2hEEGOdmyyL3BRY5EM+B4GyuQ6DOdzSFjDLeQYlig61FOiVjZoFK+T9t3v5WiqQVKthmPlqmGrGWPhXZaRQAgUZXprHVpToVAdz3H/EKF27yFyjUWSLNbb04Gyk/z1d9IQRipcm3Iu/Jwp3lT+Mkq3Y/G4+DZ4EPTu+VpZKXMnVmhihLBwspP2Jiy54LBne5MAWZMHK2BdJDmVxwpDl3nQFo91MO4RjSxArTlsNcO/gd+3paqxegA+QMTSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB10828.eurprd04.prod.outlook.com (2603:10a6:150:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 21:03:40 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 21:03:40 +0000
Date: Thu, 19 Nov 2026 15:03:30 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com, kernel@pengutronix.de,
	nicolas.dufresne@collabora.com, ming.qian@oss.nxp.com,
	marek.vasut@mailbox.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com
Subject: Re: [PATCH v8 10/11] media: chips-media: wave6: Add Wave6 thermal
 cooling device
Message-ID: <av9kIkW6rYeUGFBE@SMW015318>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <d973e48036b43e9f1e5fc254153303a4c21deebb.1795075582.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d973e48036b43e9f1e5fc254153303a4c21deebb.1795075582.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: PH8PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::6) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB10828:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e68084-852a-405b-fece-08df46809666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|10067099003|56012099006|5023799004|11063799006|4143699003|261028144727099003|261021121427099003|261026140227099003|261022105027099003|261102123227099003|261026121527099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XBGpqGmDUqpr216jgkgeVqayAvZ0oCWm8To25qWb3wr9UgsjOQtFfRWG2Kors3doDwdZMt/f81afbfZgAb4z825JxFBgWMhXpKtBklHNFOk7QzHUiYlNFkxOPXAZQskmeewa7HlshmQ//JBf1M9pborsxi17XdppkIsC77LRmZmyab9s20VUQtFNXNfXvXRVQ8SGGSMl/FWAxRM83xlOSMO+CrBSQnhcLmuJFf1zSHyzP0c/RHpTYmd5h30wBjkedRrqXyZZG7EYgvNDH8zH1Ezn2zw15Y78cMvjcJKxZyYArlcHWh0N9r3U4L2LMsaBy5DrZIbeN7u5mH5XUi48Wt9AKWJYEQw7AkMJZkPnslydaOcZUU6F9d/kZf7+IoDJRLIDSZWCdjTmy5W1Xn2FRdN3cKD6CxEVUH32fsU9Yc53BlY6XOjyizxbV27ZObn9WzlIqv6bpkHRgITG4HmW9up4KBbveOD5SXvtT6pKGNFG7ubmai2X+k/0h0/mydm5Djk1Qxl4PGo1D+J9NqpYaWNWH75nDPyPt5IBxx8ByAIzM1zEDmODL++ak4MJUud3ohqzaiA0VxKACTQIEG1tC+XmMS5epRQ+MCIG1in2YzT2gMyjtdJh5I0VP2QhckJE1JoImivY21Yanx9se8OmlMhSgTAvrY9PkyR916LUYdw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(261028144727099003)(261021121427099003)(261026140227099003)(261022105027099003)(261102123227099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gHvo41Ra5i4rrzZkJWEtd2ARh+wFGa3sQZd9wfwfUogd4UQVvvwmLjbBWfTw?=
 =?us-ascii?Q?sMlZRX9ce0K3KIjyePh465g/ExCh1l8OqRi92LP32AYA/LpofDOnaYF9XeS/?=
 =?us-ascii?Q?9hUHsOdhva0VEP26gglDszytD9LFwO4n99USyO97vsnqUQ8lHEA+N+Mc2/VT?=
 =?us-ascii?Q?1Jt09JU2LX+tCF7FJh8/FFcKh4wvr7z7/IiBsQfvOreVosFxabTPGRJVfVUV?=
 =?us-ascii?Q?jlW/aGNNI65uI18tZOeiND1CEF8KC0ZOoODb/U7D18SX/HgaYbP+Jh35CEEq?=
 =?us-ascii?Q?ucABt1iMVJKPg/pbmId9z+GTKvfzdGf9nJWlwGQ7k3lX9ZRSREzXPVzjXEBN?=
 =?us-ascii?Q?6pSvRkunvEmXgk9f3WIOMOVUARJCn1Tax5dEhf5RsZ0jmEijsJRX/fNeLtl3?=
 =?us-ascii?Q?uuz6Ao8pT/SVuJ2rVOgKalia1B5iiYd5aiahYpUoLcQu7FsjjLFLTVeEYvZn?=
 =?us-ascii?Q?m5qAjCCXtLMCt4DytUL2z5uSP1j8vzAQkp2ZwKhUAJmKgBec3g5ju4lGAqnV?=
 =?us-ascii?Q?UleKs3joceJiZ4XV67D5GGJrbqrMxwwzl49OQ65gaP+k5+FKBTdD0N+vbhwh?=
 =?us-ascii?Q?aiNXIzDRM+gXPpc0AQvccykpc8TQgEekOCDFdQJfHyw3jg/O3oh0D95nwCcj?=
 =?us-ascii?Q?lGV9QWj5o8htaCpZp43Gfl4eR4p8HbZUVa8qbqYaT8N9iXPR6JA/idROFZUm?=
 =?us-ascii?Q?Q1MWgq0tbdHcXolpMH0s86aZKy99osTf9FZtuPUXJyW+t00RgLnNNxewI9LU?=
 =?us-ascii?Q?R5tUna+FPqf5OtlJnZmKNDCAYQoNwjnAxE5mHIkBqeKci1q+PeBGjlmBV2WX?=
 =?us-ascii?Q?jYi1X/TIpVQdG5K0ybxVA/HLEgYvggvFVjM8QhKYsLhKU0ZUxTNreHV+iEcX?=
 =?us-ascii?Q?nCYFXVL17OilWa5KQpTVQl1VyZOaYbmLKBS/ObkrCyKYLkcM2IAIlV1sAlsH?=
 =?us-ascii?Q?4hJOb2REjk33fgHmS4vdNQEBYcYkgi098tGECdPEOQKAvylIl7r2ZFPb/QA/?=
 =?us-ascii?Q?+5jaKga+V1ijRyR0ox8q3zH0fj0L0+cWwzFGscxoRxlsFtSGNx7g06Q3WYBe?=
 =?us-ascii?Q?JAE3rnnhUOtPZVXIb9+VJaphm1stA09vlCcmbkOhvG5G5B+bPQF1vT5lRLD/?=
 =?us-ascii?Q?X0QgA7qphiWhiJw5BU8XPGLVoPOtE5WZjM4/6LDaalW+9LUGu8N4Wn68SX1/?=
 =?us-ascii?Q?A7JdQM09m1x6glEUBbXeBxNMUWQcaI9BTjxQJJc/Uo6fBt4Sb9CI82wbWwpG?=
 =?us-ascii?Q?ls8WNjwI8qMNLg6Qnkmrp2RD/5P24ZvpqCppUxTEHql7lSTP0dcL1apAu1WQ?=
 =?us-ascii?Q?8dmWEMYRiTewitX1UzZCWUnq6FJ0zflmp7MjZ/gIrPeveGtVHr7KFgyeNs1F?=
 =?us-ascii?Q?p31FQspumn3SgBmq5sBN/23nkeehKG+DJKASktN6/GgUhci/+1xhYOx+/+bD?=
 =?us-ascii?Q?ahPJNuIiaG6phAo3XKYyxTd6lXUbTkp9Mff2H4Jg5rzATZiN0w+CNTgKVsSp?=
 =?us-ascii?Q?rEdbVvRcxij5qR+aTd/i5xEaclEG+Fg7xYiJiECAD2N89BrNJ+pUutiP4xzU?=
 =?us-ascii?Q?aAIOIOMsLIPpqQxFQvfDHrtFv77H9YL9/s3uiBkTrti3B7wPZHNJJ/hp1fcq?=
 =?us-ascii?Q?Cn+3sr3G15rfU0qL0DsIFr14CVe9FkVzXmGPeztre49f3JE0LEST6EdmqqYf?=
 =?us-ascii?Q?2W/mdYTvPOl54D2S0k//RV59Dv2ilfEfT+x6dmuy51pv8mbZa5TqLl2USNpn?=
 =?us-ascii?Q?PGzIxvHRMkyJlcAmQBkFBU8nlWX3vALFmxewH8TRlaCf0D2CVaCZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e68084-852a-405b-fece-08df46809666
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:03:40.5200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7IyOQ7/bu7egIdGhUnWOoszj5m7232rDPwfRpVppmqRk6plKXd42gE5Pz4OGuZMQHRVG++MecmAxbr4KI5nu42Sh7mdBgIGuwFlQiS+XhzVp6VEuk0poqwRNBlSTPzK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10828

On Thu, Nov 19, 2026 at 06:00:04PM +0900, Nas Chung wrote:
> Add a thermal cooling device for the Wave6 VPU, so the thermal
> framework can lower the VPU performance state when the SoC gets hot.
>
> The control driver registers the cooling device on its device tree
> node. The cooling states are built from the OPP table of the "perf"
> power domain.
>
> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../media/platform/chips-media/wave6/Makefile |   1 +
>  .../chips-media/wave6/wave6-vpu-thermal.c     | 141 ++++++++++++++++++
>  .../chips-media/wave6/wave6-vpu-thermal.h     |  24 +++
>  .../platform/chips-media/wave6/wave6-vpu.c    |  22 +++
>  .../platform/chips-media/wave6/wave6-vpu.h    |   3 +
>  5 files changed, 191 insertions(+)
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
...
> +
> +	if (!thermal->thermal_max)
> +		goto error;

nothing clean up at error label, just return ret

> +
> +	thermal->thermal_event = 0;
> +	thermal->cooling = devm_thermal_of_child_cooling_device_register(dev,
> +									 dev->of_node,
> +									 dev_name(thermal->dev),
> +									 thermal,
> +									 &wave6_cooling_ops);
> +	if (IS_ERR(thermal->cooling)) {
> +		dev_err(thermal->dev, "register cooling device failed\n");
> +		ret = PTR_ERR(thermal->cooling);
> +		goto error;

return dev_err_probe()

Frank
