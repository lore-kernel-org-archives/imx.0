Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795705653;
	b=NO33PPKAtyhhaHTZC77e5P6lLeWEcPPCRRKJ0PrfmStXKRipWS9nd1yw3xOTcDP7RAsK
	 Tp+RwWTdrpvElxRrIBlB9J+Y7jC5iCz5+XzAAeelg9K0bWGdTHq1tTCkaFwirxXEdY5iP
	 n5sM5z+uIZsAPjVVJNveZqcV5npQcv94djzvzlSQyg2qT/+L6Qr7z9w/u7UJuAN9z70Sa
	 3hUqa70W3f4Esd1e0L6C+v+OAN8iZrmaOVPJiOurS/3xBvT4ajE5E6j46qAlsFiPisgFS
	 ++buG2Ln1lrVtsh0sqg2NWQdfymSKya2MIUoX9Eg2fgWJt5D/nF3X5n08MEeeHiywVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705653;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=NYS/pBdzWLzHmX23T5WEDDe6gERxmIQZbwyUQg6dSJE=;
	b=PGUpyo5VJNYBwFvlDCEnwEIWRqEwYMpB9Sa4QpWp5JwAF8P1bBMUYO8sPmxZegDc6hpG
	 1XN6myYq7VbSez8M3TTEs5PYyDfdFSt81vSe1vW3rOkArG5aaC80qToRCbtdEfRMj/urJ
	 F3IZKZdKc1GHgwzyTQ1Tgxg0xJvHB25sEA6vfO1mkAY16DEvEHN9gMMMQu28pruWFb8le
	 S7PepgS8TcW2vXVdFw1TdPR49WduS6vEHsafyMovtcmLBQNTjzs7Xo3r8+x1IAI/ElGnz
	 FL6gIySaQUKK+Fm6ft37067LMB8ylQKiWS0cUx/kpdVr4Hxn0ItPITHYM6iy32vvb5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ljekXM1+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.69
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE721606A321
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 15:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE721606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ljekXM1+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3L4tP5IJEcsYTze/oFGTAmMlQhXN3h2l/yNEu9tW7DDXgvN/9eo2Ar9JxFSZxvNEyIYm9pI6fz8Yf3OpeLuSOmSPbwdjJgQb8nJdNwrAqkWuH2oVdTqdXKy3M7CcoMOXSYuwKSviMq1ttnXRDvtq57BHXTVBKlryoL2wXJgwlDMKLdvHNKTyIC/iZi9qaaRviGCLN118eZyJFmF48VaxBD0D4qkLBSgoWRp7NWouKtv9/8ZMCHI5hed8gg2zdSJE3tbNMbMVor9RRh3XcVyOB7Ogy0gVt/j2NsUxBFxTwODqe6lGBE1+eTigIABgdDFr8LO4G560cZVoKouWaRjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYS/pBdzWLzHmX23T5WEDDe6gERxmIQZbwyUQg6dSJE=;
 b=F6nikmhaCtlCinsDT9UNTSbEPAWM3tD7lQ5ogv5CubQFwS3bVyl8UR7P2P2yV39GeewoOGcPoWy2L0ssK6CjjeZSKqkrMcXIgKOPPNxDL9/ARZFa19gzvf9oYmB9KYjA/gJcl0PInEURWhnIdxg8uX/+1PL+NFPh09Qyq8qFSx2hjfV/FiNYe0L0YmCct7UzlaUYsS8rn5I/reaKCzzk5E/hatZ3EVRc1V//VCzUW/U6YX6PzW1nfXRaR7lukRSQ7cf/UXh8N/PLo0fOjWTA3q6iC3zaom16Y7uRKnK7XgNzDL0oR3Slyh3vEjLqOXb3mO77js+6DruDkZlITp1+tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYS/pBdzWLzHmX23T5WEDDe6gERxmIQZbwyUQg6dSJE=;
 b=ljekXM1+wrma0btc/CMypYO55jYdNQKfNzNdFrJZReGI9KJsxNMJsICNvILOdN0XS8X4bUUSSnuH8+74Taf/dH+bfJzGM6l+7B3ivG1bGOF8nzjW2RTSl8Vj4o5S0Tkn0yP4XT1z1QS3MOrezZAkJFsYWA73meJD6uYWzEQpqJ335Qx6p1c84jVwEigUL6+/Tqr29/aA39YBgRY85LPBGtLBsPL2oolBgOHjP/OaKBxjYHNfRgfj+wk2JbxClg+SVRf1kOHLenXTx6FcdxcksKw6qJbAw8aMIO9YXFpLmbydy9CBcnjWgIAqDf9DMTCcq5JMjQ37dtw4FmkdzVn9Dw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by GVXPR04MB9851.eurprd04.prod.outlook.com
 (2603:10a6:150:118::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:07:26 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:07:25 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH 0/5] ARM/arm64: dts: layerscape: describe the DCFG_DCSR region in the guts node
Date: Thu, 26 Nov 2026 17:06:27 +0200
Message-Id: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::9) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|GVXPR04MB9851:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a67ebc9-f3a5-4209-5a0a-08df4bcefb21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|7416014|376014|366016|18002099003|3023799007|56012099006|11063799006|261102123227099003|261022105027099003|261021123027099003|261026121527099003|261021121427099003|261009223027099003|261026140227099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	x/Yb+GBNt3hYOPii//Wxo9BMGTKdUYkixU6Yl8Q2L5lHKRH6pd6QigSf/MiF77hPYEcbv6DA1zM7dOI9kzw0ytG4ol0PlJzlhcGp2L2pNabxLG7fIfdUg5/dem6/IJYGVl88mWJ0DNYnjDCq649tMA3u7v3SRlkEIaxYtP6Ub6Zd/1BD0GyK79yTv0hX5uKS2WP0U6cXqQTDXU951mXBcsgSXbWTObZoEuab6NcsS7Gd8Z+mSPpOBYbz3hze7FaDp8YX2eqtk7/cfSjJSeYEAQeN7y2Z55fvFxYlQ84DfYIFHDG4VAe9k5z2gVBndAf299P1IbdlrBOT4mrb0P2vjbfRf60/fp/zgEl1dIpTeRAhRSe/0ds8jDUDd/busd0ogREZmguJlK7K4+MfYcIkC+xXV/i2di0okA6wRGWybC96B0h/l3PPBmuJ6Yw62RPM6pN3h+B0IAfJugUpvYAqPQfSmLjLpE37NA9AdGM8rVd1Autz70p3+u90jLYzdeKqDgMDIsCZDDi+urngpGM4SXkbjMQhawbemzP8sPrMvJxBUoE4GOnExtxS6fhiqktbslI59r8MFqD+oOBRwjx30yOMMKrxZPoY4mvwwbP5DMUGriIwPkr7j5FwRFYKRiAZ8tC5MKDY0JeI9aJ4c2DXuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(7416014)(376014)(366016)(18002099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261022105027099003)(261021123027099003)(261026121527099003)(261021121427099003)(261009223027099003)(261026140227099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tfLdMnNMpy6l4tKaGZkTNuiAGt9JsFiRWFKqPqlVF4V1TQynqiimHwOKYjo5?=
 =?us-ascii?Q?9tCR7uJ82/VJ5TCZmACV2CsJGEp+TE7hrCxqRVg+srM0sGuJXqNXgc+iZD2a?=
 =?us-ascii?Q?H9HQPCaFrPAR+UInrm7noM7qj32mKP3JSUjsKCI+THOs16wC7MedUStrvMCc?=
 =?us-ascii?Q?Am4PFcHvcpyLkTnnyZLttcRqnzi39T8wnin4PrSQefLum7Rm/Bzz4lxDormi?=
 =?us-ascii?Q?hcf5bIVPYqWZudzCWQNlRKU4k7XLGZ6kekxHccn+Dzm0QrZFEefx6LX24nLD?=
 =?us-ascii?Q?A6bnZU24wpAcSLSkmt4IdEPErcg50/j/ey4BoVWxV45K7MVzZre0l9BIpiB9?=
 =?us-ascii?Q?3IRXXddfSCyEhAA1yBNEljxlaTCkEjTv2Yo9D/V0ZTfIIj2uhH7hhBD21nFN?=
 =?us-ascii?Q?319Bt5DH/HltiyFJQYOUDYnJUH40LPgN6gwp0XuswPXajymvTrtkBwWQslrI?=
 =?us-ascii?Q?Kk8dGgeElMNLX4hzQLpWaYTbyKIdU6Qy4l66SDZ9nLsyizpHr0eLOWlVxQYA?=
 =?us-ascii?Q?bPCGH1357C1hhwiPiE1wIG+A81cJKNg0mauKoq2kQ1WtcV9b1pJdpefSSfBq?=
 =?us-ascii?Q?Wh3NZruk1uXZBZqiPHnmkMqkmG6xRSJ34/Hm544ELOoB9XzYPxXL49fjbEBi?=
 =?us-ascii?Q?/TAI0ZMELHepfaeJz29ZG43vbRvcpAG5P0ZBDWp3gPVtXUFSbPODZhMw58Dp?=
 =?us-ascii?Q?WutT7h07l+AEcSPuCb28PjIFnyOe2atcuGcMcFktBCh7RwtAaNlaFk9XMhAc?=
 =?us-ascii?Q?A6YeY8OD1FMkzw6+9bEivkbG1mXaV/UnSURkqqVHjbYFpUF09CLANpd/R6E6?=
 =?us-ascii?Q?Tpi1UPYeLT2ixf6TW8mPf6k9wSl2DxQU3nuSUNjDYjsOldOI9av84Cf0HNPI?=
 =?us-ascii?Q?kVYe4cO9UhEE7bFs1SUcbBwPJZJo10PaywZEGsEbTaYN5oDwSdAOO6eDnZ9L?=
 =?us-ascii?Q?LgmPZFnxuCUIt7Dc3fCZxajega4HOTW98aQB4SzXzEyyB5p30mrM3jFrxwuP?=
 =?us-ascii?Q?33JNrHKeTl+9zG1jRxU0oLyMGE5YXRS+aoASN1iqb7osAgqulGINezjCXfKe?=
 =?us-ascii?Q?xBwvdygAxJhEPBBE83xWydv1hiZSCgHQTd46+BFio8uQ/j3jgYxjJV78xN3C?=
 =?us-ascii?Q?ZzfCDJKOSGb27galGTxphGlTc96YXpxXFHVPzSjAYPo6A8vQmpb7xGpRYyh9?=
 =?us-ascii?Q?7DFaOqjNcLUsKPnDA8GPiQkcKoX0d2m9gJnanCjreGkszhG3Ij/ZclOVIN/Q?=
 =?us-ascii?Q?Wb7Lqav7e7QW/2HrDXZ8LKi1KjSCYg0PucmK970uDYo+Of9RVElybfXy+kOw?=
 =?us-ascii?Q?9388l4FGiw/yEswSmdj/3S4LSeQx9xHTQTSvwFhndq18mpkXeiCUk4s9trUt?=
 =?us-ascii?Q?0BaVsjX8+1doL8GCpmjfwUkipdtNFYx9v7nev4v7mgwHfVrjVGgdZizZzf7w?=
 =?us-ascii?Q?e8chLc7y6tCnjKudUzO0t18GQm4snDp3OZsApV4nvW7Ch40gVzIghQqKwRy8?=
 =?us-ascii?Q?ePItX9+LYzlFjrD6E+KJyi5DE4O/PKZtRArz8bnvrD+gML34AVUJ8gkOUvYd?=
 =?us-ascii?Q?WqoJrW8WyuFOMdCvMHU2TqETmrisGFB1bhdKfYwmMI01g6xfJ0TMNvx/k6hF?=
 =?us-ascii?Q?OaeCVadkLkqiovTVqBkK2CUR7JPIvYNdH4rGk/G6aFypNnJ8R3T2v2l9xSni?=
 =?us-ascii?Q?ALFj+Q1QhhkuL3qNzTP08Xc9lx+rmpztogLusl/Kx94QirqhmIgpSbThegpm?=
 =?us-ascii?Q?hmqx9wGJAw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a67ebc9-f3a5-4209-5a0a-08df4bcefb21
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:07:25.9244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4f3HR3zZFd/W8fr4EEDO5fztYwLSJj5PxG+kDRtukezWpH62MRSmYoOSvMUgouFb2dJpduQolgIYTVp2tuyGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9851

On Layerscape SoCs, some RCW fields can be overridden at runtime through
the RCWCRn registers in the DCSR space of the DCFG block. The dcfg DT
nodes currently describe only the CCSR space.

The fsl,layerscape-dcfg binding now accepts an optional second "reg"
entry, named "dcfg_dcsr", for this region. The fsl-guts driver uses it
to apply RCW overrides, for example when the Lynx 10G SerDes PHY driver
changes a lane's protocol. If the region is missing, the driver keeps
working but RCW override is not available.

This series adds the DCFG_DCSR region, with matching reg-names, to the
dcfg node of the LS1046A, LS1088A, LS208xA, LS1043A and LS1021A SoCs.

The guts driver does not yet implement RCW override for LS1043A and
LS1021A. Their regions are added anyway because DT describes the
hardware, and this way it is already in place when driver support
arrives.

Ioana Ciornei (3):
  arm64: dts: ls1046a: describe the DCFG_DCSR space in the guts DT node
  arm64: dts: ls1088a: describe the DCFG_DCSR space in the guts DT node
  arm64: dts: ls208xa: describe the DCFG_DCSR space in the guts DT node

Vladimir Oltean (2):
  arm64: dts: ls1043a: describe the DCFG_DCSR space in the guts DT node
  ARM: dts: ls1021a: describe the DCFG_DCSR space in the guts DT node

 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi          | 4 +++-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 4 +++-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 4 +++-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 4 +++-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 +++-
 5 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.25.1

