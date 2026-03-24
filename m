Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278AD31AF1F
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 19:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381723; cv=fail; b=uyBdHbBZiHFZ5MVGcFWEwJ1UKQhRo3F5gRzWxybT7xZBIm+2s5JSe23hSLfQDY4CV82c2RwM3w/XDg8VNeHpKCqfIyRTDRGN2/DJ/1xR79gMSSCgB9xHKUaD9gCZHoS0VT2gsxQenqh0rY1se11DwZWj1RfM9mdI2AYsPwfxxnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381723; c=relaxed/simple;
	bh=OFMv7TEeVLetub5kcLK2fSqKPYseDISUWH/nK0fKhgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Po4X2LoiCkqbYfwR1H+n2Mfd3FZQefu/pvdYokyUSmEKU7TwwSS8QjmwoYn5WqTvfLTH2L1LtxONSFO/CxdoXJ6+xqNw2XqZ60ok49jw+3pqMb615jdPZ2FkKb1+mZBr/IfdN1o/mZLJOHswgmt0ZKqbq8UsDmhgu5VAGc5uD4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Mt4rL7xv; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Mt4rL7xv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCVHlpq6ymFsE0gFsehXkKnnbyM0kiWhMCG7k7jOJOqIl5CwzuqtDDSPoIjpLsTFdX9T/l7UikMQPevIzubDYY+25cJQRAYme9z6nmlAiDapro6m56Pjbmr8LHkhGf37jpnlrdfADAVGwSJ52ehG1oOJa5ChVcm5QOWOYQfXzqIkF7lBLja6tB8SOZkhTWFsbbzOUS5+6VhvPVXXLtRUrs/PSIWAixp0+mJXvF8J5QTDzpI3bR1LpzLli6xn5loPKJuaHZZ5hCf3Qp077DCtZFbItvo7HIaSV8JqyFKL5I38Rou1LMpWe6Uqu9iGnG1iV5RgNxqTTjsmlcHg9fgf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Clh6eWNUZXN9C5PW6eYqSxfprgiBL92NdEwI7gy9Oo=;
 b=l+5p7ZiiwRfcdV38yDHlQUNqZ+iEJ4dxzVh2Kj0XveziMlMPbA6/cIwkq+D3NfDcrBKnsl8MQi4u0eeu1YADej5rrDYJdDiGe6YnzdvIUc5M29my2LlkllbtlQjbOnbem70jT5muLYxQUhL1hjr0lgWEpXLft9D/FeXJo4X+hzzL2C6cW7AvvuBqytOkpP8e8YUoyfgomWeSwsXatZ92rdvBKIOiSIebeQNfUKZTdR0ncpOXsqul4MP8uh3Xtn8vnqpALPNydVs4KNFwQLAPesPoRi0x9+j0EteGMHsGJRS/6rWHF8BUMUwHoyU1PqFKCQQkndGZfd1OdpYZcb+92A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Clh6eWNUZXN9C5PW6eYqSxfprgiBL92NdEwI7gy9Oo=;
 b=Mt4rL7xvAAyQvZMB3t8CI42bGxQBCSv8fVKL/DarVSqsn4OnI/2byNDQ3Fa7hH5Vp5lhkdosiFNBtDAEnxOhqfipEIqU8W0dKp+WjKsOBj6w52vE2uAXQJSLqE+wKCgJK89IUGFgQawG+uUhzq6THY3UI/awsAUvi18jdmp7gUKlFMVUYkPfH6P7JTQpqi6SjKOwzGDjOuwK4/wXaNNMEPbJNjSspZ/r9ULWKOrTd/v1mTrx1ey0/X6g8dLoa1KkXJ7Seep4nXIgmW7NRoxPf1c/rHoWTtviGONwYxy28iilBbwfKP5bWofdz2d+57uC+2BusP7DOQGAz6Tn4hu3mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7801.eurprd04.prod.outlook.com (2603:10a6:10:1eb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 19:48:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 19:48:29 +0000
Date: Tue, 24 Mar 2026 15:48:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata
 board
Message-ID: <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>
References: <20260313174707.26902-1-stefano.r@variscite.com>
 <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: PH7PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:510:324::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca5207b-29d3-4fd7-97ce-08de89de5254
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 skUq+4qvvSEr5HdE5QN/TuHYxb2aTEpHfa7XSguwAxZdkwgSifeIqkSbZHjhUXOJAuH+MSyBLLDU/9Yw0Mq1KmBaUjvzIGJYtDGUheKiO+Rji/Wv+IuP0ORipPFHVPrjgFSqED82uMZao7qFvB5pEdWgUk8skI0LxcMNHIPfjSx6QH2UN7nOk1SeNnRbouHlpFoZhkThWsk5MTp+Tnx/Tx/uGDtcNb8n5ma4uPDWkMDMcwEfSwtfTIAeTAbqPC6CzOJgFCd88LfldK22uEzr/Myz0NcxZwaZ747PUq/pS9/GOghmKUqfCr884Qcp9VUj8m5+ms6sUO6k1/IVjTJIMahHss1qZ0mxcfvN8/Hdjho8x9sRSP6kUDtub++q7E1iBxFCpmXbwKZ7npW3e1BwdlyWHpdZ1nG/9wX5lspPHJK43+YAcPujKxNii0PlTvbOPzfnMvl7M6U6Ye+C3YksvqJ5mBR77R8Rku0z7sGOC4Sz6B6xXZHs7qjOeB6worrH+dtmc0aUfHMkJ57H9dr04/GUAgBUtrKu/rGTV1sRtZ+UN93p2qVtJalpV1paFmOKPsztwSK1t2L94w4PsMgqp5iyfyBZaWT7KHVeq3Z7U6Pn2ESqGME1J2+uqWJel5VWPlp9ofAQc//wdl059lgOZWeVdH8UagU0q1aLlMMXn61saS76O53LgdOk/DGcSSQrtxQM5ulLw1U76jJTR48oIbJKgvoEPRFiyrOp51O9phRGCBJS1aAdGa7DTumg+T0aa+PKS7kOc1nQwWH2JNBC5TwiYTOPOtNwaDdLJ3QW3Cw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Fljq5masTWIEfDPv++s79F0LD2s6GnbI9O3Hf2g/dpL+KfqWF7Bh5pQssBNC?=
 =?us-ascii?Q?OYCNGKx8GYTzmaKvRQ6qzxxfMp/crHTTSeeyonGg8Q2Tns5EIF/N48w21o4o?=
 =?us-ascii?Q?x1pYO/YoRDbqsOtq6zrINUWP+hZpaA7NPEA3WkFXPcmSUwqB6Bd8nQyFTKDT?=
 =?us-ascii?Q?3pqENSdWxucVrzqrWEXHNxELNrbbqKlcN5Y4QXdZ3CObS4EtPsk7Y8m4Smcf?=
 =?us-ascii?Q?4F/v4G7acs8KtcERMA8LxPePQhTnvjMsRIf5gt13Pp7NLvz+xELhut24owxs?=
 =?us-ascii?Q?lbqZLui4SZwrBNvG97laYaf6HeVNqsKm29ZTvwaC4L8aQcLvTSzChQ3c+Lh6?=
 =?us-ascii?Q?03l6ZXsrEZvISTbg1kp1ROV5ugrZo/0q+rAvcCtDLRw1IveWjmE2p1F0cU1G?=
 =?us-ascii?Q?svQ8yjQ+6+KWAPJQ27WWKQam66K9cBNvguzPvJwc7iKpH4+Zqn1FIH8FcutN?=
 =?us-ascii?Q?0lBJuIPai6w8DwG570idbYBUA+Auf1Q4u7lIS/mwczm2N802nDl7zJwF3vpV?=
 =?us-ascii?Q?WxLhgfESXI+Xr4ClVlvlA/6shgVdZSB7dgvf3MFzk0Hc+Yxm97MDJF1gAf1/?=
 =?us-ascii?Q?04VbGEHKwxPqBVgM++mCgPOT5R1Lvg8GqjDEHMJ7DK5hcQhtOo5dDCMvmh36?=
 =?us-ascii?Q?j/D132tTotoVbBlewMXSFAwmFMT3kE47kTTsQ7C5vWrIgyZQx9hCCuGB/56E?=
 =?us-ascii?Q?G0CFu0Fj2a3hnNRNHjvN+AKQxwQZo4qf2Uiz35UGyZP2q79ZyH/ZQRTYKlzG?=
 =?us-ascii?Q?mdSgNv9rM2/kaY1kZq0ve2ZObMBN6dH1dZpbNTssajiUVe8XvCNSeO6hO/oo?=
 =?us-ascii?Q?C+AYJGtB5x6hlNq2DDy62LeaaDYokbM7+HdqBxeKMFH//w8VvFJQ3vpWCG8B?=
 =?us-ascii?Q?XVyc4Ow+RpzpAfBKoG1jjaCTowXTHI43/8mi0wcy+grpPn7LFa/ASMiP52Tt?=
 =?us-ascii?Q?LNjA4lTsO//iVjiEhF2oFJ0be9ENMAdxVjukktSp5vmBLuDTRTwXXl1nHtQf?=
 =?us-ascii?Q?vnP+H0lU36EzW6h08XGs7cyEXOf98TcH75COxUBkVukFiXjof7+g9FPqgYO8?=
 =?us-ascii?Q?fvr4DgPbyBYSU+x4LJ1rfi5cKB7kLbsEj58SdmYaHg/upfD4p1brTrasb0rQ?=
 =?us-ascii?Q?5Q90NDjqkz4VDVG/NDEbH9Daw3oJ+bezFF7Y7vUejDFOVAARzFeUf3D/N4O0?=
 =?us-ascii?Q?l3DP/JvWfrYiMjK8Pn2FDU75KPxFeRwrBU18c0TFHxMWrA5qbmvguwCvhfDz?=
 =?us-ascii?Q?vsInfvKg8WH2qPHtB//xrTKUCBtJI0FPel/ji1ZmAuD3XuKGc0YjyBxdI1lZ?=
 =?us-ascii?Q?LK0JNoBlGWOPcEG1gb+zZZeuuhvcKDMesIpYAcuxSp9GIzIfXEAdWdMvlLse?=
 =?us-ascii?Q?ot9NlC5QajES8O6Wjzvoc74653YdKgRCAnMzuQx7nXFCpkiE579cmx6pq6ha?=
 =?us-ascii?Q?ALrFDZijdm+nzK3jrrLeXsf1lG6foKsu3UakIcGzGp4eedZBMf9Oi/YCnCED?=
 =?us-ascii?Q?MIt7Jc1Ee4eTnMX2/oqA83lhlXmWPUeYMc2bhUzjZwtevyxOFvk3/eN+CN6B?=
 =?us-ascii?Q?791FEdlIg8lyocpqPy9YuLc+PWhiM0pmXT+OhraUmjCqFLFg662rXxW/tte3?=
 =?us-ascii?Q?LbwJS5Yw8KJ1FJo7iG1EHIR4wnqXnn/6Z8oibkRMdXwtMrNNAebN8R2M6OKa?=
 =?us-ascii?Q?nd0fMSj+nAp1PKrV+WU5EUN31IXOyPwF1JMUarTJkwaOf8Z0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca5207b-29d3-4fd7-97ce-08de89de5254
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 19:48:29.2298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnuCY/NhzrL0Y3SrPcXlLMBOIn6Y6jyDG0YZdyrAz582/p2gr7y0iH3cPv8ECWK+Y+jsbrUylcHal3QQW3cwTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7801

On Fri, Mar 13, 2026 at 02:56:03PM -0400, Frank Li wrote:
> On Fri, Mar 13, 2026 at 06:47:01PM +0100, Stefano Radaelli wrote:
> > This patch series adds support for the Variscite DART-MX95 system on
> > module and the Sonata carrier board.
> >
> > The series includes:
> > - Device tree bindings documentation for both SOM and carrier board
> > - SOM device tree with on-module peripherals
> > - Sonata carrier board device tree with board-specific features
> >
> > The implementation follows the standard SOM + carrier board pattern
> > where the SOM dtsi contains only peripherals mounted on the module,
> > while carrier-specific interfaces are enabled in the board dts.
> >
> > v7:
> > - Order nodes in symphony dts
>
> Can you run https://github.com/lznuaa/dt-format for new file to easy
> track and check by script later.

I applied with below change
- update copywrite to 2026
- move reg after compatible at ethernet phy node
- order button-n,

Next time,  run dt-format,  keep node orders, just adjust some property.
I will enhance script check graduatelly.

Frank

>
> Frank
>
> > v6:
> > - Order by node name instead of by label
> > v5:
> > - Fix newlines and nodes order
> > v4:
> > - Fix typo in spacing
> > - Remove vpu and cm7 reserved memory
> > - Add GPIO_OPEN_DRAIN to i2c gpios
> > - Move pinmux to eof
> > v3:
> > - Fix specific node names with generic ones
> > - Remove fixed-link property for SFP
> > - Audio regulator cleanup
> > v2:
> > - Add SFP cage node for enetc_port2 following sff,sfp.yaml binding
> >
> > Stefano Radaelli (2):
> >   arm64: dts: freescale: Add support for Variscite DART-MX95
> >   arm64: dts: imx95-var-dart: Add support for Variscite Sonata board
> >
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../dts/freescale/imx95-var-dart-sonata.dts   | 591 ++++++++++++++++++
> >  .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 +++++++++++++
> >  3 files changed, 1017 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
> >
> >
> > base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
> > prerequisite-patch-id: 7ed0e453f554c70d0fafd5147d4d9b62cac6c10f
> > --
> > 2.47.3
> >
