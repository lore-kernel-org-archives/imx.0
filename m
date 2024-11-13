Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A782206055
	for <imx@lists.linux.dev>; Wed, 13 Nov 2024 20:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731528683; cv=fail; b=XZOfCQ7M6HSlOaBhgotklJ7ICvCNN0Z/UGp/A3NOpFLyH4oxOJ3iNwsuDDZhjf7FsmDcvqjo5VHYMpIMUix74K245Rh4gQQC/6uJ7Z96HSeyqpxDWREqQYlTTnBCI+pbcrTVxtsvIXFgnma21IgF85CWCh43FrUPqIUTuMPhH2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731528683; c=relaxed/simple;
	bh=1fWI/1neNwLKs2dZnsZnFqRjnmKe6GW8iBkMYVCyj5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ptWexVSiqkVbJeu43FBOdEUkOhC4IDTW5WFcvYcroWH6dU6AjlxU/MXgB4qEmkXUs4EZM/nggqXxw4n7vv60tpIlWmLFG9hI2EPFGnnybaNnJhORn2+aOh7kPLQCLAvvyktcQJGIf4igGAFtnxVm0pDCn+TloPvs1sb4wbGtebk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BECtwS5N; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BECtwS5N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6YW8nCT25t6wQ101EDXxDcIY9T4ODfwUpVP5I4m3BL2NmVLpQuOjHKpr5DGHozg8u5W8hVtkp2lnP7aDq2qsd+YxcDWwPfoK0A6lasrgh+8URfKBbe0ODibh28pCSdL1+w0tWeVzWZ+G8HZNyJsCicRh6e86WLj23miNKpHBgPkvcHur88NX3gJG94ObSSf/JFFBYZq0QBnfc8IKL+6gdEtE5NWLSiTv62GQgPf8dOSTXB4YeMvwQyR7M6rmroPEawTHX7rW12M/jrLCAv3qzXkorQ2YPUoQ17XMg/K0TghxK7XYO3P6cui9gBqcqIZrOzTxaM9CHc3PyPlqB2vMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8q1rVcEvyIL8kRP+tFAhRrRuRcUa5GYn+4TrsgfwkE=;
 b=FgVb/2QkpZasRl2fmBaCvXb/vtxj5twLDlYk/DrOPLNEVVQDZnjexM1lMbspB6GVuvOHK5PaShgfkEJxHfpMbU+/5g7iFb7X7DYgR7e5ZTBQGNcLdeiWtkrCmOjS2P2doPn8vdND+EPX1XvFV2G+rpqBZXiYVbmz4+RlSHgJQCjVeHJvWJ1JPJTjGBOorwKIGE+Jkfa3yt+iaSxZ4Uk26uI0HpLZFo4tpC0z3hpP3nkcYph1IkBqwpg09ybT49yVES+muGiDdVKHiYZGlbeMBm9SFo8ZCw//06DGL3drZFb4eNHqDPVsnvOmiJHLbe1wqfQsWrQRs9ytUIbs5sQghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8q1rVcEvyIL8kRP+tFAhRrRuRcUa5GYn+4TrsgfwkE=;
 b=BECtwS5NauS8FEvMFjRgEFKCSw+WRBCEd81YIAEQAWuZ3nig/2GavQXY1E6x+KPyVBmTHfTZRTq7ql2vssk7JfsyoIXo3NCT6h45hvpHm9l0E4dUn3N4tCSBEiqsvdSp3ccv1eFV7GFtPobceZN2uxJ9XbmmbFi6vkDzBiae8lDm85VD7JnM4gKDrjdodsiNXd+eQ4LKXmUw07CiF3UlRTcpk35O2mAIMRm2MaRW+FaJsvlkkcowgR/oUe8HrgAtK2IfSA58v/hCHJvId2ougNqO4jCtRrXzInJM+sKP9nhUp42bi4K9XYmHTc2OYC3HbCtZR/ILTc8t0MaBnELMfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7735.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 20:11:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 20:11:18 +0000
Date: Wed, 13 Nov 2024 15:11:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] ASoC: dt-bindings: audio-graph-card2: add widgets
 and hp-det-gpios support
Message-ID: <ZzUH3n50Vw6RhmNJ@lizhi-Precision-Tower-5810>
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-4-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113195240.3699-4-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BYAPR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::47) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: a36a0ff7-377b-4363-f621-08dd041f5592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b+pHmqbNLSoW4PjcrxwycF4y4EOwXiALxhw6XMxipqsGxmKq8gPL3LI8olul?=
 =?us-ascii?Q?LZ3/KDcD9pRGOVNAZLdGsIWsvXrEjcvEqi3OzhhzvGRptE7XX69QqjfLHgNc?=
 =?us-ascii?Q?VmrjQWBsIggHDgg4ypF+kETFro2v/gACx2No6C/HY7ZcvpgOncXt2ezJppRw?=
 =?us-ascii?Q?b+anMKOjohRHOAsQbRQ3isZSuE1RMqcOKYRM28skH0rPU7/Dm7/4lBOuSbej?=
 =?us-ascii?Q?nmwvGZ54q5A+B2b6srVoOrTV1+5Mj82Uy+CZN1uRzmfZz4koPyoat4XXKGJz?=
 =?us-ascii?Q?EsnvaosTU8AXyomzo1bWu5K3KEVCpwP1wPAboOF58kgFdt1cl2oti/CH2j/B?=
 =?us-ascii?Q?Z6ktJImfzhANY2O9Clku9tE6VJdC7vOlkJfd0OR68Ja/pfXVigY8ckhQ/bvq?=
 =?us-ascii?Q?2c4Zg4U5qqYcd7fdLTbNe+8ex8M2Yq6i6Qra+sWeDJvgtJbSVTNADSnv0KK/?=
 =?us-ascii?Q?p3wuBMAj5FJ3nXqD9YaUSellEEtZ6MOI/DuAQ4iTd2zZA1jZ94EtoS7bdkqZ?=
 =?us-ascii?Q?pKWTVDxfscDjIbZ9kL58CXHgsBeh9c1532FdK3S/UDYEZF97wEYp3I89Ch9C?=
 =?us-ascii?Q?Mt5ab4X2/Zc+r6g46Uw8mF1sZHuqzyOHgK9/0pnE4Tt5+FLO81iiiH9LHlY3?=
 =?us-ascii?Q?7xwHY5w1X8ZWC4y/1megHl2hksP/6yGKU1xvf3uRys/YAKK/2NSD2m+ZnnYG?=
 =?us-ascii?Q?tZsi3hvxYabxSuC5hkvE5hpEipa9gjR7PJHH59mMgDG9VEwTM68N0qufaaOA?=
 =?us-ascii?Q?lMRg6amE5tDoq89HgUiTdrERkoKGROZtTJgVYv984oIVJJxmcm4UjcnUfBrA?=
 =?us-ascii?Q?BFXrmB1/cDt5zv+7BJk+mQFinsbNa2R/Oi9HnQRIkf0+jyhLUGC2WQ+xBuBj?=
 =?us-ascii?Q?bxf2snCc16Z+K0gGLuOmoJd+Hc1kwRK2c6gJnMDegZe0WUjbzZuGqJwvpdEV?=
 =?us-ascii?Q?DmDQOdvm+mZfye5gtsUDsQ1Z0DJ8kZVoWFxuQLXM+/Zt0ZNOtyOq/NLQS4Ip?=
 =?us-ascii?Q?J8i6PAAid5nAzNRqOtL1xiLgDuzxuIl7a8BFFIK00D1ca1SyBponvAniTzaD?=
 =?us-ascii?Q?6A74O6ERdiNOFRnqynO83hnkwS64NuY+XxoNjsWRDhTgzSkQnUyyt7UE4Lex?=
 =?us-ascii?Q?q4y5uLZrjdXuYIL5GVLX+t8eFn1CRw29a+PniEGJqo2v5iKnwSSG4Ihu3GwO?=
 =?us-ascii?Q?+4ns5tmX9AFVhN3n6a+V5xBcOr0/w/ntrMUmfBDya5FfTUnkan/4ogMnmqwo?=
 =?us-ascii?Q?Z3PIifhb31p0QUMfuPXlzogYmwXkgBC65s2beup+kUXoC1fJlio4iwrTisMQ?=
 =?us-ascii?Q?4UxNikXU+3zO5p/R7VXru7Dg3XDjG8LBHiMDrNVWnC4/G/+MPeslka21egL6?=
 =?us-ascii?Q?x3Rgg0Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fknncCAxC7sfueuieC6n5idYSgRlsTOX8aiE/bq8U4XBslObqj2mzEy1Wa1m?=
 =?us-ascii?Q?HGQszCPEAi/Tzvb8K7m5NZCgOMtzLDybOpX2DAKFNw/PqJ8OifhZ/Jl8PQmk?=
 =?us-ascii?Q?TL9wZ3LzJo6RJ52ZiJcyjyNlYRNB6E7MULm28p2Z5RUX0wxp5L1gt0Qbcpon?=
 =?us-ascii?Q?LGKVHSq9eulJU/pHQRhcpzU8SWKi19q0G0ldvUcW4dN+2kh2wc3QsRTILNBU?=
 =?us-ascii?Q?159rleU9if4UgtJpJC+DInZhF/E0G2P3+62+i+DFiO1AAfirJB9nN5ILOHOb?=
 =?us-ascii?Q?fF9UkdhtZkwQa0xkIrcvFvQrizB56ofcQkbxhhbhWxeg4M3hGVIH3aczW16N?=
 =?us-ascii?Q?FbFqjgv42EYPj9FKk1R/lm1eU3YJo417iLy6VixegHGW9Cb/UpzWax7zQu0m?=
 =?us-ascii?Q?Hci6vM0im1+5jlxgN9kgsqLdc/BaoDxE/DHW9+W7rcZD0DGPdiUcwpP4z8OO?=
 =?us-ascii?Q?MRZsbUtb01FG+3k2k0ruuoRXNakjGiGYzAS06t1fbgpQbG1MfiBebV5dHzSe?=
 =?us-ascii?Q?5196ToCdYbrG831QVpUm01VCdf9PLhAVwLGNLCe7XrnH1ZaKENtOK0hdSsxq?=
 =?us-ascii?Q?temXawL+eDYgYv6APDp0MyNvBpTIadFVqVMCRE5AF4+MGc0rbEZ6YLZou9YK?=
 =?us-ascii?Q?5B9U2F/y1jpGyoYv3LTReN8ZW4yrbTbBmNZahRK3/wHrMtaRsl/ool53v7Tu?=
 =?us-ascii?Q?j+VrnYbD34Bxfek1QI4wN0LjfumDb6eQ2beKAkwrHuc3oQTAM4gOEWkVAzO/?=
 =?us-ascii?Q?ULM8K9mcyF9iH4mt/qg2gswgqR7mi9GbfULUselFcI+JM+UqBMfH9Zpf9Om9?=
 =?us-ascii?Q?wbJR7IA3vMwYLdXMrsPEG0IAeVGM9Xm5mNy5QY8eODcUb4lhxXgJWSYl3Y6I?=
 =?us-ascii?Q?rtwcV9Pn4OX9vGko+63CnmMv8fb10iOQbM9ahvKwPJHZE14a11Z6cIuCk60e?=
 =?us-ascii?Q?BqfTxttCu7CeiZDO9wctmem+H29UDHOeh9dTkOQW6jP4ph8CThvCJ2S1ju5Q?=
 =?us-ascii?Q?eTa1sdpFwG4BO1qeTczFaj/DBLaEbgjU9w6lnyDbZjUqdfVZKN9kOkq/iKaD?=
 =?us-ascii?Q?ZFlPjJW4nHrGMUsBBOcBGVBx8umgE6dAIjHSepeJD6ri0lRmeMN6GF3pNbba?=
 =?us-ascii?Q?ZyOVMUAv2zXdsGyiX8ir/EvMPDlyuPMRaUKaXnmzJOMPGZd5ybFW0QAVFv88?=
 =?us-ascii?Q?Fokmu6G5+20j6RtBdEA/EXallbuza9Bcho+sDECDxwlerOz9GSSUlRRMwiUd?=
 =?us-ascii?Q?cWyjRXaf42GBn+RIr0Fb98pFmHe5ir/zPdEjIin4m9GA6AK72FplWFJct2AN?=
 =?us-ascii?Q?39U9GO5UDmBISaP9Oyo5eANQwBSg1DFpGLuyVY+Wtvvxop3sgeD9D+LqeUMf?=
 =?us-ascii?Q?W1aV9UQ+ooJGQXa6qt6fqOl6waCi/p9ajBLYHgJfo5gVyddYInpEGPXhV1Dy?=
 =?us-ascii?Q?lqkSS9mo1zd56Y4WbvLT9ZNjxiIi040TBR2Bs4pIEqKpzLjsFogMwJkVmvA8?=
 =?us-ascii?Q?qakutWrZLRpuLO4alSgrU677gtJlprnj5PWHnrpScCI08hucskU9gcR+r5r4?=
 =?us-ascii?Q?HVvCihkvTs0qd311dfA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36a0ff7-377b-4363-f621-08dd041f5592
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 20:11:18.3744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9XX58lPBrAw5+Nfz/Wf8AaX+e9I3Y5AgSNO6fMz3Lw0ewsZ6HrfSv2e1NNUD9wZUrN7XVrPGiCMeKdUkieBCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7735

On Wed, Nov 13, 2024 at 02:52:38PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Introduce the 'widgets' property, allowing the creation of widgets from
> 4 template widgets: Microphone, Line, Headphone, and Speaker. Also
> introduce the 'hp-det-gpios' property, which allows using headphone
> detection using the specified GPIO.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> index f943f90d8b15..94588353f852 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> @@ -37,6 +37,10 @@ properties:
>    codec2codec:
>      type: object
>      description: Codec to Codec node
> +  hp-det-gpios:
> +    $ref: audio-graph.yaml#/properties/hp-det-gpios
> +  widgets:
> +    $ref: audio-graph.yaml#/properties/widgets

why not direct ref Documentation/devicetree/bindings/sound/audio-graph.yaml
and define these again here.

Frank

>
>  required:
>    - compatible
> --
> 2.34.1
>
