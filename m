Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A214188CBA
	for <imx@lists.linux.dev>; Wed, 26 Jun 2024 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414684; cv=fail; b=SNp+/Yiignjj/Tbtl0xXldTghqndK4/Ny1P561bWYgif63RNrlPnDp8d1qjxDeopI9oABrfa0zOoqGpwbUF50uz2ro4GtSItt1ac/RKYoD3AKd7TWkCYaELlAV6AjwgMS9+dsmoUT9NqDJe00NTDUu7RADmDvywezu6SSeCutcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414684; c=relaxed/simple;
	bh=TvqqSNwvTkChGwl4SeNoHdCjiI3G6HRSalByyU3LOwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CtswZGB0+WB68DVFYN9FSmndcD0TpZx7xsF6COEymccoS/VWU6twU4WFK4UgqTjWjkPlonLtEyq/XWWyuzvROrMRWaEuOLrKrQQM7V1ylelzrrZW680FPQgFachTSVTi3VP7KqmOQfPrGPDzzvg/idtuJ66ibKdjtk3SwBW4mbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=o6YK7JSq; arc=fail smtp.client-ip=40.107.20.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="o6YK7JSq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUtQu7Nk2fJlvFgsqrDqPfk3La0hHVXttG97fYO6+NX2PKyQoZ5+AUmAb/gnW+/laNj2ZYGUQbncr8i28I09OUavJ364iS992in+qXmNDKS6FvKIV6Of7gwCZ0S7ZR+itxYgZ0mYvh5XprMyfqbGhlyyrrHT1TjtpwMC7J332OQ1Vss31v1EYkf0x5LS2OnR2F1vx1aoavnRyP1WPok/9M/Ss9AKAvChse03sceVL0G/s5MORv7VuuGJxHexqR+dMLLOS0nm3rX5cfaWo4/zJ+Y1UE+Lii654ivgy8AGMsbhRS3+6mjxqxRd0RdHV//oUMSJm2hRsc0/2sofN5Ojaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzyreqNEaWRSLTF47124SbFBD0hQw2BOIIHihSYNk7A=;
 b=lhN/ydEHVV3vKVxNTQVdnty3Y+3FfMF4nIpthZnwQKu0/FKFm4rUISB8cn8RxYn7Kcd5eGGRtO54d3qH7sja72XMi0PZDFQQs2uOwRr6fWu8oTLbcbEWNUrzvpjZrscqx/RXLf24QMUKp3vImwB5cJOkYBzNl8pCW1ns5JZSkXFI+AdJI3aFtedUJLbjax2P68yIojBknwRGVIjNqR+SDvFKT/B14LMVlM20tbHrBT702h55R7ej+OKXEJPivMKp8A+Dc+DiqTGcbxTQFwp7eBvNR5RAm4KbX9zCnwL+w1jCnlErwIDYTpYV4WFVwUKqKCIyG8R2nkgj6BSr1IoTew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzyreqNEaWRSLTF47124SbFBD0hQw2BOIIHihSYNk7A=;
 b=o6YK7JSqZHNURBMCda7QahHL6z5bQhBVC1DQeSh/ycEJKXWqU5v7xQ/lNAEl0TODZRYAzZ+QW1aJaEhSoVcEtjN+yqt7RbxbDzRR7vI437ovIgbQn/x15I3fYPmeYPecAhf6sjXo48LbfKDt9hi02AYWuHzfs0SVY7dkSjuzI+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10939.eurprd04.prod.outlook.com (2603:10a6:102:489::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 15:11:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 15:11:19 +0000
Date: Wed, 26 Jun 2024 11:11:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] arm64: dts: imx8qxp-mek: Pass memory-region to the DSP
 node
Message-ID: <ZnwvkHfhleg0ERl3@lizhi-Precision-Tower-5810>
References: <20240626140532.615857-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626140532.615857-1-festevam@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10939:EE_
X-MS-Office365-Filtering-Correlation-Id: 945ca19c-490b-4227-989d-08dc95f23bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|366014|52116012|376012|1800799022|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qPtzl58oDmboQP0BTflqvAoCqRb14FACiUj21Ew7LVAE6llwUTOWd9Ebkb4w?=
 =?us-ascii?Q?ZRXWi7cZMUkywm9y8FmJ6z3mXoNR8mImpZoSwGjAyBu/yhkemWm3iEqNAI2L?=
 =?us-ascii?Q?Hk1fsqD5crKpRPRNb61IJLZPbFIBf+5r2wFlFwKk4iSsb3UjSz/8XI3h5Fxa?=
 =?us-ascii?Q?eG3csHpcSDD1DjHFeckvqQH08U3PkCcJkgRMAqGRAh9GgcOyMS7rtmk7HWi7?=
 =?us-ascii?Q?9hgCS1W7tscDVJsNljDYO0DvlHFvabzJW8sN2F2g6maUPqmqxJ2JghnG4wQ+?=
 =?us-ascii?Q?6yirkHHLUZVif153OQvgcdLrgM64gAmnmkPtnMBhNqchMh9TO6Istyfy7Kbn?=
 =?us-ascii?Q?XDOz5iUPR3ilPUaRu5uOxfL3FC7/qpFm5ooGaenxCPlkYtkm65YTwjjEUEkB?=
 =?us-ascii?Q?Ey6tLBMWwWmszt8vnOd8Cq33kq2KZojWyluaP3bUbt7hvupaM2yS/AO3AAEo?=
 =?us-ascii?Q?0/gymY/GCIQOJSykMIBYFYCFxfv/EE2SQe3Y647G0PslSE//cbjbBJq+8Bre?=
 =?us-ascii?Q?kbf1Ch4+S0EtrP93qqhLkEaIbGgfjvntMyAiVLmA0NJzzL7nGGDeFDj1BCxh?=
 =?us-ascii?Q?3iSk5EOaqHeikJ5/+3B3q9DHO9R7WESOJAGkhd7zpUb+5GRu7UCT5SsBfycy?=
 =?us-ascii?Q?HUEVghsRBiHanLeiYXKY482vl14npFoiMHHhavg/NbQONNWT5MIOYW1iz63T?=
 =?us-ascii?Q?ofzed6VSk5/AtFsEJx+50KF+8D8wA07UkWIEIA7gvK6aHYAE+hnSHTEmGe+c?=
 =?us-ascii?Q?gzZurHq5vO8h+/x17kIZjCNi8GN0arjtyo/5zuCZDH9dupT/i7ypSgOhwP4K?=
 =?us-ascii?Q?DgVTQUXuptoika4Y34k3Ygg9UCET8eA758FR8J1supPdh0Tmgxq/vZDMY6u3?=
 =?us-ascii?Q?b8efgPi6UVyYVtuhab9ySXFP0DK4klQqyDktraitE/TNQmC7UjDQKVkLMJ9m?=
 =?us-ascii?Q?q/wredeCMAplXtydlYKRid5OweLSIp/5OHtrY0FyW/mxu8FBu1mcXooVyJmu?=
 =?us-ascii?Q?ScX8p7IQNRNGZKLbeohsZEk5mwp/Jlw2I0dSIUdAZCSka4jdJWmKDGTmdHxc?=
 =?us-ascii?Q?h+aog1DdiVISe+CSz/UrN0aE3PCn3DBCV3/NlXUVVbZ/wrXZPdl8AyAisyhs?=
 =?us-ascii?Q?jZUQmMkV5YlV3yiHYHjAcIXYMoSWrpUngSslbw+Ow0YKaYXzj+55DAI5UAln?=
 =?us-ascii?Q?/Oqitcya1jsIErV6wj+c+jrYkOOQW/ZREK4Zobnj6X3YK8WxWZe/FDLiA+sP?=
 =?us-ascii?Q?2iP4+nPoJvRpHlH/GsAfOqfqsCAjkHka18oQ+3zUAhWuzjRAjzwf3D7k9HeR?=
 =?us-ascii?Q?kcsl6QJ3p4v0v9r9vVLSB0gRXSqDV070o8Vao9OJpSV+DyFYvyzMZ2+p0Y8+?=
 =?us-ascii?Q?DTICNuvbWMJaw3qFrjSUKwydi3iwAzDV1v+1rMXrLBfFuei1dA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(52116012)(376012)(1800799022)(38350700012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qttsjSwRg32/JcLJX2kfa9EUbslUG4cpTYuwVboW2LFi9+LKDDVjZIdEIHzP?=
 =?us-ascii?Q?CbaU+B9xCAuYWsg185Aztfr7vn5HvtLaKVIzmgW/eXGceY/7aZ3k/uZWw33d?=
 =?us-ascii?Q?Al/PpGvUCeFJ+1UQNTUnAynUZ7dcAunWi5l2r/FnvKM4WOkxDukWMdH7sj5U?=
 =?us-ascii?Q?RNnCKepejAxrL02aYAn8BpDfync/l4CfVnmogK3ooR1Q3stccmnPwF1ZXgUf?=
 =?us-ascii?Q?9p9r4OAF9VvOsPc36tjHHhtL6gMGR0/2YmgRxp9rbqRDwR4Vcpu1bNwRCd7H?=
 =?us-ascii?Q?rOKr7zbRUQq0jOgBT6Al/7cj5GSaux/SKPhvQIbYU6Ab3tZzG32A7YztxSl1?=
 =?us-ascii?Q?tWjcyBmEQZ+SWNLFvxldjXB/2dBJmg/zzOte+t+1erKkMIKayFUPUZyKe4zR?=
 =?us-ascii?Q?8FrAwBLYzoiA509D4HrTDb+wGwePBYIbJIFzxSMPlDO8jfiAfckLxlXjucpa?=
 =?us-ascii?Q?JPBO99BOct+LN22tH8inyeshzO2Ge050PU8GZBcsUucrR5Lc17EO1Cn0qPr3?=
 =?us-ascii?Q?t0o3E2DQRdkjf3TAP2m4zAEXGPD3ozR3q92fj7NGAELNCORRDn/1rtEby1bL?=
 =?us-ascii?Q?Puq+1fH/VhWsb/NhNHIjmGrThUI36w0HU3QABOhAzU758xrnPKEt/2AMJ6bi?=
 =?us-ascii?Q?a5ydhxwDlJe9UxJPGBT7M31gO0xzYcNHaZ7/5mrQHSykGLptoCIDBwtDgofX?=
 =?us-ascii?Q?1ypKEpXwkRDwTH0Xu3wHagCw++DX4N6pJKJG6EMl7ojFSGsWBaFUJJnvbQSL?=
 =?us-ascii?Q?x0Frd/3Xh4pDCuOhEQR5kv+s8zevmkn8peOiVKwkWNxH7ukGFulx8R03ePGj?=
 =?us-ascii?Q?7y/xkNrnuCB8IhYefia27EEDqGWrHYazKerVZZnyHSbLM+WJPxTSfbRZQkAt?=
 =?us-ascii?Q?9Eh5hf8etgZGU4O387eIslMQadx+/PA1Nl7bWv8juhDhz6JsLwT9p4y3eAPd?=
 =?us-ascii?Q?0xlsfDRYePYXe9kRl623zaLgV0iw5+kOehWcmcBZluToV0V3nu6K8jQe80wU?=
 =?us-ascii?Q?gVBhe0rNwzJZtXd9JOZbsoVJ1ppZNzk0/JWBKgrzaC3ewkQEePAdYPETkWFM?=
 =?us-ascii?Q?KKCjQXLun9Emo58UsTOnK5IKpJ7t0ZJrPDvvcMUd8OdUrN9GYzbW3sWkEpot?=
 =?us-ascii?Q?I2Ny83vMOdEi2MC+PgPd2DdaiKpgmozbPauQyl+os4+cTqi4AE9yv9HeFuZZ?=
 =?us-ascii?Q?IR2s/uZ0JSHaz/s3JIXjwBzEHUzBrQNvDchVkFeZLVjR86nWb8ELmJO6abPt?=
 =?us-ascii?Q?sEktLxJCm4wGsueMB1aUPIBZ2REXNFU2W53koDmj2wX9oNN0ciUT3cnTk3RR?=
 =?us-ascii?Q?KjlYlz9L4niqYMAozal6hMS9w5+rjsHU+EXEJ96NUfzZz/giYplAvG8Pw+yg?=
 =?us-ascii?Q?Sg2QstAvGdWex/JVVKCP7CbD8kWC8pf7PCd0SJmD757tMvMe91gsx4eedjcm?=
 =?us-ascii?Q?sghC1MtrM++Y8X6jopu35++NikTzYZn2pIsH/eDZOW3O87m2YmFJNRTLt/eb?=
 =?us-ascii?Q?g+k/rQ+iQYCwlDM7jJ3RwWPabkuHiPou1aJmVYeq9flhP6SR/0NCtF0fpKmg?=
 =?us-ascii?Q?ASxWywN3j10u2ejezRYLjSmfYzLVHAan1Vm/l949?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945ca19c-490b-4227-989d-08dc95f23bd2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 15:11:19.8922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByXQlxObK0Hpwi9VmyQJCapqApDP2d8icYT0KTXZDsKRfqXWaESkZfSBld4+6if2MBwEAWkgGmKGsbjeTM+awg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10939

On Wed, Jun 26, 2024 at 11:05:32AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to fsl,dsp.yaml, 'memory-region' is a required property.
> 
> Pass 'memory-region' to fix the following dt-schema warning:
> 
> imx8qxp-mek.dtb: dsp@596e8000: 'memory-region' is a required property
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> index cee13e58762c..936ba5ecdcac 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -63,6 +63,7 @@ sound-wm8960 {
>  };
>  
>  &dsp {
> +	memory-region = <&dsp_reserved>;
>  	status = "okay";
>  };
>  
> -- 
> 2.34.1
> 
