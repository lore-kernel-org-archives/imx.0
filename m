Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2076.outbound.protection.outlook.com [40.107.103.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AEE1F12FE
	for <imx@lists.linux.dev>; Wed, 18 Dec 2024 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734541592; cv=fail; b=gHgvQvVvU3Me8itYU0qAPq0OySSPa0azFlC/dTnsxXC8QBt5XzOu7HS+t1u8m/wZ4u+9CXFwwwvnmPDrKwgHUzaln1isWYjfTFeBhJFXur0mX4StLaGOrCv8NS/8dGG3ib0lhq4JIlcvljUOhyuMWU32kt0yaFi2gKszHIJHkYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734541592; c=relaxed/simple;
	bh=+/z8+f6kLilADnfHC3kI1CUEYiV9qBoZvzZb3GuNx88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IMqsaZpG5wXPK/jVd6zoBrGpTCcHKkRDcUydcDDhPdXJZHc6xbZHypppYU1WYy9HCI1l4PAWSpIttZJ27ppl3XiDc1cZoTM0ErDaPyuGiLq9CdE7ueVULs5BlqimWJWUQlRK1YP+6ch8VdZKbAJ9+osuDl17R4fZ25PBR+KGS5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c+5L7NRt; arc=fail smtp.client-ip=40.107.103.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c+5L7NRt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPUKBUBpd0VAbVXqnRcxElTm/Oz6h7HHkm6gV35CsdbDu8+ovk36XfAM6E3N17Bm9hvVJ7vX9AhP3cTzK9eAMlRciZNl/4OR/eLOMyZUCPKHohfERdh+Ue/yZucVsJDRYVt4f0e0kqZHWU3vymf1azL18VvH1HVMYOFJ4xnsVzPQiY0euwmF7T97zfyFn9KGyTtX0+pt+LhrHNGTpfM0pmTQGY5jXo97preUl1h76616cbglbfTjJ1q+7mm+jH/8lfMYxa+cZPTnlY/jXVy7DPVvjx2gNelMhjIncwJaSIvhmLk4dy1wXJNd3msLkF0nVX+QHVZDb3fQYetZTXM+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/z8+f6kLilADnfHC3kI1CUEYiV9qBoZvzZb3GuNx88=;
 b=Li7BwuUgsMmXBllVjmqwdNhbD/KiOgMzsNeVKN52zyxvJeTtLHexOoCKAe9teNkU7038OJw066Htj5t8fjDBBnkYKyVyJ2VO/JOVaUGauabXOiL5x+ZSJ6sDmufepbUx/e0I8gzRes7BQFlqe8A70M5iE9fS+j20VlupUFHBkOChFZepg4ix2munV7I6WuQXd5esfz7Z+Vy2vRogLF+4Nn45lv4n5oRBXZgeCK06ZA/QdEfwUcGJSo09zlt5Tox0YdZq9HgdzTDGFiYrEKntyJnT3U/pWdq/68L5d/EKvdIDP0Qyo1eUL9TCLS6yhjSKqH89Fv1EDeltbA/6fdDVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/z8+f6kLilADnfHC3kI1CUEYiV9qBoZvzZb3GuNx88=;
 b=c+5L7NRtQv/g9FCJJnbGO1gB/HIiBhW72A23O1yhUVMAg330OndeDKocirZbX8CR9N1msZbFeCkKSi2zeKIEl0haLNU2Ii69BJBRZlxVxKwfSHS1CusVCHWczoZeU/U/VXJEKqVyQnMGjwf8bRZTMVh01tWzYHPZ1EfhrWFVCk4jY5925zHEov1ZvZw1VGfQRNRGd1OYDOuq44kWiPaNq3dpZwnCXCFAasK0jMesdEgjXRKubevyyG9ioLa3p7mq18tbeaUrfGEAj12pxxp3MOijwysZex/TaUlFQCovwl+GKTHBS6LaCFibvh6dPOIQ+XKlu3fHg5rgpsZGAyhLYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7507.eurprd04.prod.outlook.com (2603:10a6:20b:2d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 17:06:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 17:06:26 +0000
Date: Wed, 18 Dec 2024 12:06:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [PATCH v2 4/5] ASoC: SOF: imx: add driver for imx95
Message-ID: <Z2MBCPP4G055Jbbs@lizhi-Precision-Tower-5810>
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-5-laurentiumihalcea111@gmail.com>
 <ZzUJQCeWclsrr/lr@lizhi-Precision-Tower-5810>
 <c47710a5-7e53-48b1-bd6b-c0123865aee5@gmail.com>
 <Z1r9hWH1ioR5vI5H@lizhi-Precision-Tower-5810>
 <c3c9389f-5116-4a5f-99f6-1b37c1e8c457@gmail.com>
 <CAEnQRZArKSOtka46A_SOiV2=8bs9B36ubAJM3GqYJZkKyBt_4A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEnQRZArKSOtka46A_SOiV2=8bs9B36ubAJM3GqYJZkKyBt_4A@mail.gmail.com>
X-ClientProxiedBy: BYAPR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:40::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 23613844-ebc5-413f-ed55-08dd1f864ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bz/xWZpv3pC2FCzUtBFLytWml00WB267igCxtlq9MR6rjIXHPa3nKFy1YfL2?=
 =?us-ascii?Q?uOMxeEzR43QL6ogPQ4/uQEaJ8l2xnpfEyCK3RPLF/HhG9h3dMwUmkY4geVRV?=
 =?us-ascii?Q?pcsQRU/TtuEtQ5Xs1geAoAs5BRXCkxBFJvosmxFKzURkEdIrfhMEdrpEAoyF?=
 =?us-ascii?Q?knuqmA22iQaZtN6VZ38hkFzG+9szzrgNvRJ3mDDF3r40CrrwfFLMrj+NChfG?=
 =?us-ascii?Q?diMVmSiqBquy9i9FGUmGoS8FQUUGdYkuEncvqtJx22LGFA29K+im+xjItMWQ?=
 =?us-ascii?Q?QzeHihRQmq031OPjb7Nv5Qc5TLeMBTOCOjxgojeLqCI0QWS9reduNRW/Jqjy?=
 =?us-ascii?Q?ddXbszHMIuMv/T5IP4n+x5F7a1InksaZwZ+FDos4NUPb1XZKDEEKKIEJWAB6?=
 =?us-ascii?Q?bHgntZSBUVf9G+xXWwb1zD+7ULkY4ohL3ir4Pc9Y8FHUHP3HaPtALkyF9gGD?=
 =?us-ascii?Q?MxVx/snKeFNMZLMsoSW5d6SwJiIof/vvNZtx570iCYadQfH6qc7fs+Qlc3Dv?=
 =?us-ascii?Q?je5yIQ+NiJtuXBc8VJ7iOYjfsySetyeZmMa6GO9uM0WR22QNSLNL/eXF22bG?=
 =?us-ascii?Q?u++fo3Nf7R+kM6W1HkilUxOBmPUe+r4/sPtKH84BjDLnJ8kOXqsA+KoL8+hS?=
 =?us-ascii?Q?sWJRgd/eOrPmPqMAWMmh80melfBPMkYFoeDyObkmqTVtaBaz2Cvl4x/8eO9W?=
 =?us-ascii?Q?WQqDOBVpyQWx8fZRxlaz44fV7sFgp08ArRmTbfikb1ZtOhnEbazae/2FCej0?=
 =?us-ascii?Q?Cm9W3x6Uuhm2oaqvCgWs3QwLNM6gdx5+sSauu2nqFlc90cwtLH9LM2BCRYFB?=
 =?us-ascii?Q?bfiFTy0FwJrW0dnOZAR6bhAniaI6iSbQaMmkBO6bagp42oSNll1XIBBoeuot?=
 =?us-ascii?Q?7zZrFWN6z2Eo7GSKoXhFf1dMJh53GlN43D/G/8zZXps/sFMuKab6FbpyIaVF?=
 =?us-ascii?Q?GCz4HzenIpiJw7+aZKHEWS3mJqQRtmh4QQs2fdBL8Bw5dI4ofr+BufJl35Ti?=
 =?us-ascii?Q?Ywt/djd5sSFmbPLV0I+o8Rw42hOn/9fAzJt6+BBVptS6vjQAtGVzOAlnGnxl?=
 =?us-ascii?Q?ABWh8/WItLW4MG2tqS2gWW6LIclZ17lkjWjvUiO39mlIwZJmXPp+S7Mwy/td?=
 =?us-ascii?Q?s1yKLLahN+Ep2WarEKikRSgKgc0xDWEtgX7d3NHlKOGtidRPUYw2V9tY36O/?=
 =?us-ascii?Q?rSCDoQyVon4Ckx9cP/dE1PJICf+436DDQsbFMFaNtVhf9hQ2JI8EyihYhvBS?=
 =?us-ascii?Q?WqHC2VEtC2VMIf/8qGysFAzLZSPIGdNNGnylp6El23gGXml/UmXrNQOcU7o2?=
 =?us-ascii?Q?O2yIp4aM9uSHVBzSzRTjDlSpBNThBNByCYr9KnfcjgtGKg8r0vnk/Ed7g7Iq?=
 =?us-ascii?Q?McxvDmSRQdXP8JFGy8mzrW5yYWFTxmmziVdW8ySzPGK0czvfaawvH9VsNOaR?=
 =?us-ascii?Q?f3eSdy5ryE8kYKAXW5FzU874sCFzALwy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M0YKaaWaaCyOtvqJFvKVegiMm25DDPdt16jHR8Ed92yuZlYnijd++Yyjjl4v?=
 =?us-ascii?Q?M8vvnSpnx1N6aJq52FH/ut/x/zT3VRW1mE+hqkw1QEV5TCBTaZXOTphX9DgD?=
 =?us-ascii?Q?oyhYiCT6CjyyvuRcGkWWOErnrhyj4CuEiLirsimVeGFE8jBSJ9WeZGU1GKaS?=
 =?us-ascii?Q?dhhLrqBqWbt/eHCiqNU33p9AziRT0lvY/78ENkTwQ+5UTNK57i3tCQYFp2S2?=
 =?us-ascii?Q?VmHo772e+9VexIRtZtSCtzlKV2rAhiz74jt9YIUHsvwVRuXjgG+DeJUI0Xbi?=
 =?us-ascii?Q?lGHrNnlKUQ/Trd9n1pG7OXkdI8LJ3xvWM24d0dPXF1sp6/fAiMrpvg+v7SiN?=
 =?us-ascii?Q?lrxYeSLQRN3QpaJMXeLe6LyfcCaLlTn4RpcpePFyj1/QO+/qXaTiUQz8o+VO?=
 =?us-ascii?Q?5HNBvBIlHQUza0XoNRoxOPtnFCMVN2ZXRVsoVlaaYRlB90I3M7ZkL3R3N173?=
 =?us-ascii?Q?fGLzDO4+9F267AutGgzssL3KMsGZQESvevKZj0aIumTogzjiqK5hutJTlVuq?=
 =?us-ascii?Q?c8Z6YItQj8BSmHnoYBcBFN2kdnypcV7hvng1ErZGVTnVXpjm8lqPR6Op3BKt?=
 =?us-ascii?Q?TdjE6fEiJVAQG409ET5hV7r+o5tNJ9UO+bQcg/e42Q7gYqh08fYAt+m+OenJ?=
 =?us-ascii?Q?oVsPfeFGHZdc9fp4oMU+McsFch8cXARiNUSHIbSR7Djuptm9H7qFOWWCXcQu?=
 =?us-ascii?Q?qcorrdO5SFl2qRdvec3LCgAkfqANgKS6G7DLG+feVBPmVRnKZIgJY4r8nc5S?=
 =?us-ascii?Q?3yWNJroCvK4/+tlkfI6NCpzrxo7SjtOUc0aF1WZNkR9fYxY1Iasr71c2YzTo?=
 =?us-ascii?Q?1W00zMgj/mfhf/ObWFxp5A8vhCUExhx1NbR1r0JAjDxwEhiOeBeyfHwju2mC?=
 =?us-ascii?Q?NkVSqC/eT+dYnsla8djSK4wq1VT4il/aIegaS2oWCJvUWi08n4j9kDnGUoF7?=
 =?us-ascii?Q?DHPLh5rHOyceC+6ApiOuNOEZof/ucHgXya76qWZqz1jzPT+Wohz9dak5lrTR?=
 =?us-ascii?Q?y+oPcrdKI7SK8In1DeznOzmf98yRJ7QxuK/Zq7GKUK5mixR4oN2sOQSKm64Y?=
 =?us-ascii?Q?eLrIdDleyoieWAwxxTXNS90XLvNbutsmsgIFbuGYpIpGirOdVmhKCrzqH+eQ?=
 =?us-ascii?Q?iUVJ5XZkKWR2X8ZdeYk6Ku4mfoce4ygtDE+Ae2su/ovsfKsX32ba/bN7KqXD?=
 =?us-ascii?Q?fx8Q5TYid2CzZQ3HlgUlP2+7UKlsJSrU8UMUs77wDCxYLVRMXj9VB9oZXARY?=
 =?us-ascii?Q?rQitQ+jLTpdQSRd6mxziSKK0P9/ZHBue/jF4TVXdFoHzp/L1dEyB0vBQbcdV?=
 =?us-ascii?Q?4jct64SdlofO8c8olE/avsvT1cU9vGq9ibA3QB5jKtUMmZlSc9VjIPFQFh+I?=
 =?us-ascii?Q?PflYLdvwIDKxXhzxyunHdnY7PrPDLdKfEISFGrNGbHyyWE6QxEiiRbacrdmX?=
 =?us-ascii?Q?DW8gFeARzf5btJLUMPSkr6/66uigXzeyMmKfHUhFfOiG9qj+h2MOTzbyD0AM?=
 =?us-ascii?Q?sSpv+QfMvwbE6Q4KovkIkuRbbTKgVPB4rL2WUDX/XhLiLcdddIocm9tImUK1?=
 =?us-ascii?Q?KW2sETG4jFUcE0jNs7jRB9ax6gIZZUegjXSiLn+e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23613844-ebc5-413f-ed55-08dd1f864ed2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 17:06:26.5990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+JRnc6CdeT/jcE8WWDFBjIHZZ+O/2SkEriNUe8V+4jtE7GWGswfrtNtkfM7zdVEe7ScJEb2cxxJ2j3mrVJFxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7507

On Wed, Dec 18, 2024 at 03:01:11PM +0200, Daniel Baluta wrote:
> > >>> Frank
> > >> the SOF drivers do indeed have some similarities, but each of them has their own quirks which IMO makes it a bit harder to add the 95 support. We need to figure out the common parts and then move them to imx-common, but I believe this can be solved incrementally.
> > > You should create common part firstly, then implement equal function with
> > > existed part. Finially add imx95 part.
> > >
> > > Frank
> >
> > Yes, I'm aware of how this _should_ be done, but, like I mentioned, the change is not trivial and will
> > require tweaking the other drivers as well. As such, I'd like to get the 95 support in as-is firstly.
> >
> > Are there any other thoughts on this?
>
> Laurentiu, Frank please trim the emails and keep only the relevant
> part for discussion.
>
> As for this matter I think we should go with the current version Laurentiu sent.
>
> It is inline with the implementation for imx8qxp, imx8qm, imx8mp and
> imx8ulp which we already have upstream.
>
> There is always space for refactorization and improvements. The
> current version of the code
> is simple enough to go in as it is.

Need provide enough reason in commit message show why need create new one,
and but not reused existed one, which help maintainer and reviewer to judge
if it make sense.

Frank

>
> With this,
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>
> thanks,
> Daniel.
