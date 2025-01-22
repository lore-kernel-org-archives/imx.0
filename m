Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96B721518B
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737575205; cv=fail; b=Do+8UI/uUD0ENeUlaEAFhq5WSwscdZbfFj5Kj4enH1nKGkvb0zvBxvv7W0tzBFoj+oQiK8uaKJqxTR1SWPjZGBNf5H/tYHv1Pwsti8VGSUgwvIGU6xkR6Nmx75K1X77YYNxonm75lgH5dwzOAAiISjudmvfUwKNBvStWtWTJ3Xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737575205; c=relaxed/simple;
	bh=sEYQzIm5SHOnFl0+pbZzwMQ0/ZGxtKq0663elmPo2/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=laENvTzWK1J1xhcwZje6+0Ma+2ExFgbW7K7mHqzukAdBmRYyl5HVFBixyjL8t9N1RqVKb+BwUu7N76+72msW4rNwA61/QwSj23pE9//MepNIgWsBxKOVQlcS7HxrQ9MwExht18NV3WNV4LWY3Yb0umkxmQmLbG7gegibGGaaleU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=INnJNznp; arc=fail smtp.client-ip=40.107.22.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="INnJNznp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8NzdgDFccKNDxFTco01zBR+OktDAVHzx8Woi7+8x4+RekS0IyGiKqqOI6PmHtcEckmWQwEo6btlnMr2Q+6Wvi/C6JenJ92uC/sxhD+ktnwG1H9rHk37YNEi+nFBHh3oiB/nj0fLQjHXsNSeJiNAmymhVvV8WxkHFkfMB+cQWLOa+ZiSN1jFStWCKXgwaMHC0aiX3yeh/CRcTEYvXaD9VCmYmPW+zdtFA8j7+MVncahcKrinL2F9+a6YQ214beqJsKwDDRCxmnkzvX4j4aTu9lIPR5nKQiBsxCiHjA5KRrGMaZKmlEoQFJKAoavr8FCWSNuPpxOE1zRpFfQN3b8ShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjxazykXSmEJUq5yoyZ0t6W7iIDkQ1rqgAztYIyFziE=;
 b=CDoSY8xDFQ2mHKk1h7iBUx8ayQubilrFo9vJc4RH0zYdudS0YP6MpsgbR0cm/b3rnfF5e7Z6jqfOsupuazPfIegrvoogoXQM4OZSUXksE8HqA8sSzok/chwNJnQauAmMUk/Q7pegtohky0Swvvt1rWDOseGBt0oOtfQ3KkNF4E0C8oVoJPYpgn6kqhi/0ibxwqyOCyUxYVEpnvqgsaRrT/qno6punJD9KmywPD9OLpKLhoK99xfStxGDhyaaJkomnR57d/ARsGL9Oqsy+xTmuCsPVA+pUNMCOQTh12aaDB78XxzpuLtRDGlQkA0osfizjFVRLaFPaFuX/4CJabmh9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjxazykXSmEJUq5yoyZ0t6W7iIDkQ1rqgAztYIyFziE=;
 b=INnJNznpxVOKMbRC3OYBF/CbtpxL1h3q2FMPGGXJ4Qu7IljgNBLwsMH0mYbatIxGHOc69DI9majtAG7Xm/NFSm90FLC8ezJ/BzKJV2ekhQTlj0jgutRaTgRYDC1Cko2Uz5sgJffjJaz4kUuS3bxgw1+Jdl/8s4mjzspoBWPrEk5e7HnEgOSUiB1XAQbXppry/ANy4AwLSfoOJneAS434l2Qg/D1xFNaMmCY+yx+qC9QWgsCvX5wImRNJ3BR9UatnM8ttXBLoKidEglbvSi5BeGqhebVA5f/ttey2GySIQrvH6V7yCVNqbgiGqr7Q7Gm0CFLWFyFPreSvOpqMbPfLzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB7103.eurprd04.prod.outlook.com (2603:10a6:800:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 19:46:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8356.017; Wed, 22 Jan 2025
 19:46:39 +0000
Date: Wed, 22 Jan 2025 14:46:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [EXT] Re: [PATCH v12 2/5] dt-bindings: arm: fsl: add imx-se-fw
 binding doc
Message-ID: <Z5FLF6Em43XVlRsB@lizhi-Precision-Tower-5810>
References: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
 <20250120-imx-se-if-v12-2-c5ec9754570c@nxp.com>
 <6110fd00-c050-4bcf-8971-674bc8c0bfc7@kernel.org>
 <AM9PR04MB86049239156AC82F0AA4BCCA95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <000e44f1-839e-4f43-9bb1-ae53d6826ff7@kernel.org>
 <11880309-5021-4038-a4eb-a3a80da71550@kernel.org>
 <20250122-feed-empathic-4954564d95ba@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122-feed-empathic-4954564d95ba@spud>
X-ClientProxiedBy: BYAPR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:a03:80::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 24358b55-c087-476e-2a4e-08dd3b1d7d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IemNrJM+4XOwS5kthDcg3fQ5mM+QAzGQ12bvB4a/x8XGKB4TdEikvlUvwxnP?=
 =?us-ascii?Q?Eun46Uzggows6JeueY6XKs8Lezu0swVleKfCWT3dLQAPG5U0LM87CjZFo5Xa?=
 =?us-ascii?Q?yMe2pZPJ+VcKNpw9H83mnhdrC/x9wOy9e3E6sichlu8B08A0Q2dxiWa33Ne7?=
 =?us-ascii?Q?YhFX7tzw8xOeiu8RTGr4bkxU9/E3Zj+luwyOKFAk+MoavBt9XeXO+BsWj7fS?=
 =?us-ascii?Q?CcIIq9nC6G1ZFgAkFqb+CJc/cD/yZLY/Dw5TlNukmNlW/3vSGP7D4Z6R79B7?=
 =?us-ascii?Q?Kwqi4FG6pKgdU8bkKHeB3aLDo8LJFuoVVDTgeoII/Qqlj3Egl12ShuMDMGHO?=
 =?us-ascii?Q?3Vh07qJNesVLtx3vxLu7nO7ux1xfFv+Gd/7WXhVJ/y5cRkvq1vBGLakcdLVU?=
 =?us-ascii?Q?kv+70vXzTc9YU2EWQYWDvDXTXV3ob/BoBDjtUfAJQQzN/mtc0E4dLs78OAZE?=
 =?us-ascii?Q?T5Ay9XPcBL+ZzBHxlMRsBO7BK/OKnL8CJX0149NEH2DzZMg9UjM/fuGg56w/?=
 =?us-ascii?Q?ea1gCcj5BCe2FuzvX3O6gxt6I1Noxpw3TxQLE1gwFZ39hxChiDThbNKp6wii?=
 =?us-ascii?Q?4hjvhodaMs1NwD9XxR/5dtrGD2Yst+QiGXSXzzYpNIGF8IZiJmeECzBRGQOS?=
 =?us-ascii?Q?EWdVo3emyVKSG9BxkIryITQuTdyQ/RhrCZKMka8ZdKtZX58yMZvH2bV9psXq?=
 =?us-ascii?Q?btIskj0rjE8QJkGNKiYfLU3OzZrj0fsJf6zshGayRa/mEHDbCP52eXnOhfgh?=
 =?us-ascii?Q?VvFEA65JZ+lht5uT+dDZaIf+Gdk2yKyoCydJa8TvsvnOMp660qmK1EsfW4Yg?=
 =?us-ascii?Q?7isuEyVkao9mcnC/Ius2iXdijeBWZ4kYOn7lvRrMTc8hm6lK0tcjEiJ3o56E?=
 =?us-ascii?Q?sMG4qSCqm8EVwAkmHyvmUfFgP5TSBnLd+vxlomcT+xXVoMdvW/cYuDSsWXUL?=
 =?us-ascii?Q?ALtsiktds2cko48KoCwwLtnUpmWKUfIQzr4JUx4iScgiSLdEBa+hE/VYAzlo?=
 =?us-ascii?Q?IclscNWBJvizqgP3YwnAod4nGPT5mQUZAQ+Kfx8hQCrkAPEXYre2XhJXzUOo?=
 =?us-ascii?Q?AQ++Lc9SJGTUnnKnCCfXeoEIp7xhaxCdL0wjcsuteCK7EqpzlAKOgRa+Jr6t?=
 =?us-ascii?Q?d7i0oxWAODcbjd8tWj8nkZza/DqZhGkLDlw3TU6UXNY0lWr+0J9IUF9/h3JF?=
 =?us-ascii?Q?e9dxb0Z7aDRnVXevvuB1BgTjgtYpRuLsV5WQHESHm5jb/+YPjVmKYbGfBMx/?=
 =?us-ascii?Q?oE/40B4Z7LaQRloTHH+Ste96Q4z8DcDnQL2flMOdlvKvO5eY50qUO5csLapX?=
 =?us-ascii?Q?pOYZQiw6umIXIgoMWPIju7M0xOREFk9jZRbkxmBmJqG00zJeXVxpRgbYIv+3?=
 =?us-ascii?Q?dXsvUtljiRKgGZ1fSRZ/GkcNPwt02YGHDTORF5++5z0XU+WFupUS4PP6Qh4V?=
 =?us-ascii?Q?J7HWhRVMsqMfPNIpCv4RH6rGdydVO/iL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sPz8EbF002whvLRjcKfmcz8eCbgE3oF6jMvBDh+50etJIcCD1JUZG2auX8gq?=
 =?us-ascii?Q?bsnkq8TiQHCLnbAjp+MBTSJkOoVWrBNUJ+z5+E0tH48jtEd4N+zAZDkxRU7e?=
 =?us-ascii?Q?9PHirLywdvnftbEk04OJUT2Y9CDaotOuw6GHbaPQrniwibzRIr/fwyFfDUMh?=
 =?us-ascii?Q?YKrqM/Sr14BSq4mHKaLarl07rGUdpOZ74OrMtL1L3poIYJ/siU+VyHVSX+HH?=
 =?us-ascii?Q?MuJeM9CGf3KIlqgK/Cb5QUDlP8xhckWoKJsUJfU9o10sJvFBiCcMzI75KnjE?=
 =?us-ascii?Q?miqdGxhp1ptyIlhydHO9NGPqrE7pOnnS7cDE8f59hArGRX7q5Qo8A2gIotIW?=
 =?us-ascii?Q?/ftVgeFtkF3V2WsK0wlo27OMUvYNsf20gxZi8Uv9YXpX09V3TujHt3is8wXX?=
 =?us-ascii?Q?BZN0hZqyeHDuvKVjb7ea1h0q12TyDsFJV9soOnluhhgrpF7HSwGLfKWoPJ9/?=
 =?us-ascii?Q?HB4QStx3KQ/XpednhR/xT4tvnKgwqUtOb+JcOr9/cvmi1/qCenjVC9tVfXPB?=
 =?us-ascii?Q?7Nerafv9dai55gB/UYJ5Yjc07VWz2CVPcY1AOcI/1Bpij4AQgDaXvuFUdVue?=
 =?us-ascii?Q?4dYzHxn8zlCMR7ChxAr/annA/YoBx6Ftn6DS0bmF5zTEnDJrJJ4BLOLcKdAq?=
 =?us-ascii?Q?t2qQU2dvcVJaYjSdEILsgNgMm32gt0oXLoU6zJfvarqiuKFnY/HnDv2OK1QR?=
 =?us-ascii?Q?MLudGLHVt4iooQv1ygdE8wmfu/CRh7NZ0xQsTHyUcUnSVav1d8nFh6FS7IWM?=
 =?us-ascii?Q?Dp0zhqVdt/RrKPHsEpKkW3FAm56jXt/gGcRabwVAMQeQu4v9UlTIGoE19h+v?=
 =?us-ascii?Q?tZ3xOIRHH49+zRS3Xhy91mqd9x+5t6nlxTdbYMOsEchnYYD1ByHG2jiKLapl?=
 =?us-ascii?Q?cCQ4lIfEViYfYMk77t58+xmybVrS7D1hwTK2r/fGMlsY3UAZhsR3hH/QHquC?=
 =?us-ascii?Q?F8kAqpXIxqPlciz6yK4QQfa6PazJGMdTXbHdNkuP9xYsbDAMn2vCVYhOhq9A?=
 =?us-ascii?Q?ahrHWZClQIiEgIe2R3DyFT6unxSgWwW3WxCvr58OXil3tvmvLOMQFt0drGki?=
 =?us-ascii?Q?daG1cTyfF/TXjUTZ15mAU5t4SRjZvHp1cY2SvPcdOXtm6Pags8H1t12mVkhd?=
 =?us-ascii?Q?kkKKTtObuhxC6DJ4X4GEvE4AssH6GQyD9Y9ullrk2jRReAbpeZNoYBRJsORJ?=
 =?us-ascii?Q?MsASXQbONgb6RdTtSDHIbj4cY6jni/2w5fjqDNOjrCGY6Cv/bhDbjqjprluX?=
 =?us-ascii?Q?8Oqbuj7iq+OpcNMFt6+VwnLGvYd48pYjAPCDp4FHEk8LJVtc4mg1LpIZXKY0?=
 =?us-ascii?Q?16XMC9YIc7ZIUe2WxTBGP6dAJ7cvlWrwjSXWGPxx+2a00u2pPNWwTghqwmhn?=
 =?us-ascii?Q?pJtAMCua6NOo/ZlRhzjYjaE9wWbtoQY0bDvFbn66qybEth7OGInGUUBGlqVY?=
 =?us-ascii?Q?P3+nc+bvkIbeG2dlo4W62dFBCoi29zt8JHbLWUAG9h2WCDWkiHL1U6gCXfFk?=
 =?us-ascii?Q?s5TPACaHJmUmmAO1y+Fy4g9A4IHtU6A81rN3kBbMOHm13c/pvzX9enlsqovY?=
 =?us-ascii?Q?OCN7Q6K2YKOGa5u2jiU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24358b55-c087-476e-2a4e-08dd3b1d7d1b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 19:46:39.7369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwnGLiLUsJ97vuS6Yk67QK0u6qfvgz17W9/JM/TJC6yJDEfFiv7SIXvBf4IS7Mmcad2G1/tFJ2gC/XraHLsZcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7103

On Wed, Jan 22, 2025 at 06:26:55PM +0000, Conor Dooley wrote:
> On Wed, Jan 22, 2025 at 11:35:50AM +0100, Krzysztof Kozlowski wrote:
> > On 20/01/2025 16:01, Krzysztof Kozlowski wrote:
> > > On 20/01/2025 14:07, Pankaj Gupta wrote:
> > >>> Driver configures multiple misc-device on the MU, for multiple
> > >>> user-space applications, to be able to communicate over single MU.
> > >>>
> > >>> It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.
> > >>>
> > >>> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> > >>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > >>> Reviewed-by: Conor Dooley <conor@kernel.org>
> > >>
> > >>> Where Conor's review tag was actually given?
> > >> On v6.
> > >
> > > I already looked there. No trace for tag. Please point to the message.
> >
> >
> > Still no answer from you, except that evading answer, so let's be clear:
> > don't create fake tags.
> >
> > Clean your patchset from all fake tags and keep only the ones which were
> > real.
>
> Ye, I don't see that R-b given either. My guess is that somehow "go for
> it :+1: was interpreted as one, but it certainly was not meant to be
> one. Converting that to a tag is definitely not okay. Seems it appeared
> in v9 after Rob prompted about /his/ missing review from v8. I never use
> my k.org email in tags, so that is an immediate red flag. I think I never
> re-opened this thread after seeing that Rob had approved it back in v8,
> so I never noticed. Only by chance that I opened in now.
>
> Thanks for spotting it :)

Pankaj Gupta:

	Please use 'b4.sh trailers --update' to avoid this problem in
future.

Frank

