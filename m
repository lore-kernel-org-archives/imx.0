Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BF92F617F
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 02:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769136373; cv=fail; b=e538Vcgt/ZxIfxAIe3V/HsCzWnfx8eaePNf5Y/4zdi8LqwXGRA39ASavkoSIfV3K5spzspo4OigAjqWen6raiaJ3mlQFSOzngLhpRK+aK6lPCXo9T8bFOZjRLEaEdAZ03gYAaMHwfDr5bLwxf7a7+RFo2a8bYAS8EbHiwoKdAC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769136373; c=relaxed/simple;
	bh=lhnvRhQCttmZ6DqG+Z+sDsEmhglrzFOzPp2OWP/WCys=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FLrjdMurP0auPzSD8DQbEtWsmGWsVr0InWWiI6lOyQkNfe14F18u9mVOxaRP2ncipkiWB4rRf0nvd4WQzAGcFWeTDmL9vT8Y4kShp/YdKJQeXeFX5Sjwt9dJGRFAn5PTWgMIpybnkM/aI4R2b/TkJooC/l8bhs7yuS985NWJgS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F0DRfP4J; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F0DRfP4J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDz2UxNV0plkiVAqa99raGBd/XT4aMGPZIyf+e7UQ/yRj+t+NcWtc1joCGQUOuPo3PXpQjXhP8QqZ4+IYfmTqCaV26yGtFekRfVC2hOKdwjmmXNmJ2JxnVk2jEa42Gorouo7+MuADnErMs9h/ibainVUmLo0bVBLvZ5/fTZ0iQ/9A5UaxTOhZcyKF1RwGm0k0LuvXCBOQVAq42IP55WBkwqhxnRekTl/bBbDFr/dc/RRn0WRLUu6fV0GO4ZGtlE3vQ79CJksWGFaxc+iKfauEhtKO57wTU0+hAAYp661vUXOEzZfwm7WWU4g+QiliUE3QUiwJWzOn+3yKE6HHO314A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJHynTuDMBnf9JE73UWIlx2NQTx4K9WIcuFHV3EWnz4=;
 b=sCsirRkORXObK13HwRmbFPzbjAPUd/DAKON3IT00ijpsBvReL96VYAYLCDyh6VAMZHzYWqGw49cuNpEfwol6KoX2SDISNonXsXlbsDOcpc+6zSEQkk/XD4PPiNETjVfbOYFCe3J5WdBGJ6n1EGoYRYHuSWle6NZymf1hJKj8DgijaxMN6oIFeA3HXWdwMDraYgU6x5pyz9/T+dkSWyDIoGw2F+EyGvYGtnrdtH0v1qn4aBIS0zfuiIZ30Ej9qkw92kejOkpU+aawbZz/Ke4oD/tXYQS+sKyA2ItM6Y8ioZqmVq827Nf0acjCyzquLytO5zjqv49caWILPyAmF3KaFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJHynTuDMBnf9JE73UWIlx2NQTx4K9WIcuFHV3EWnz4=;
 b=F0DRfP4JrKLsnx2oDIppHnN5P1n3uIcqG5c28Cs8Lu4cZp+kGDUqqMrmXTNpIpWNKD3VOVrw/ln+GCd9UPQ1ztu09Alvyy+mMoksahIdL1STRb9RSibmiZM+oXwo1BFi9fc7yk8L6baFHPFwa9Gfhe+QIXgUjtW/MqueAJ/zfI93IhxrMgpxgfhhOQfSIhTbzPVqmQaeZC/2wt4fjTrBvJ9KSP5VP8GQ8dpzmqfl+JPlVHNC+TOpDDmKUv9ApF6+Rvk1i/qYuO0Y0StQP9UFcTC9UZ6JgEHWkok5rlTMN34GCUI7HNKdQ+BULPfXGy56W7f53fzJG3GYQ4VYvleslw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS5PR04MB9797.eurprd04.prod.outlook.com
 (2603:10a6:20b:679::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 02:45:58 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 02:45:58 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/2] Add i.MX93 Wireless EVK board support
Date: Fri, 23 Jan 2026 10:44:46 +0800
Message-Id: <20260123024448.3909345-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::22)
 To VI0PR04MB12114.eurprd04.prod.outlook.com (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS5PR04MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b27ec0f-c877-4aaf-e11e-08de5a29899d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Tp+1wM8094iOnRHrXBfiblYjCQb9swFHBHmUMv7gtb2YEdI7puuxxUu+YbuS?=
 =?us-ascii?Q?M9cqEnwrFk8D8We/Qy+UcckS1qYraK9yjXKcHS9sy9W4ohU1G+f5qDaEFMVU?=
 =?us-ascii?Q?l2prlvohN+GUqAV4toelm2qh9Kt39nXA5Y5xn1POOjYzIJT2RMuRKnKJwikr?=
 =?us-ascii?Q?M8vv6ffX7Z6Cxs0/3T0ecEOq9njqnxUaMzDJ1wQtID7N2jP6lwW+c1ADbHrc?=
 =?us-ascii?Q?EKnQDo19KQFDUJL+qqVmr9JTRnzpiaftzdiRl/1nnB6+DScUbBdoMmiN/xLk?=
 =?us-ascii?Q?TZzDs4B63OQZnlRjba4/Ze+kbRD/0R+0blYikYw6DUSS8uicwW/nZnbRPvBE?=
 =?us-ascii?Q?L1piy2G0E13V5suWG2olfYAFCV1VJHeXNOo3rN1nC9xBfsMHps13gf1DhBBr?=
 =?us-ascii?Q?ZOhTT4urB473Tapamdy1enVy3UGiwwAvggQQ4SdJIGxj49S2If4maOo2WtgX?=
 =?us-ascii?Q?CcuQGjf1I5zWT1/moITJq9x/ECJiJ9BGfmxxhiUQ1I4Ffrke/86L7gGgSStg?=
 =?us-ascii?Q?MTv1mr+9bdzI3y1Fgdksj6CRZe6y3y83uYmocf0twl/GfHaUCYvcIqa4z5q0?=
 =?us-ascii?Q?hVZmCSGVdYWZkChvDwtArLWYtSX+lJKPANXvQuCkWgZnQw7wuRtWv80jDLkM?=
 =?us-ascii?Q?VRfgQSi+BmqLDQnCjOUDedCBP0ruehY5RVe11I98n/uGlLBivGn3nvBPHQaC?=
 =?us-ascii?Q?lkOU//PPsaY4C2LXYF3DAOd1V/5upX2lVAuCYGdja7GO++rZ2MZ2mbaAQD+l?=
 =?us-ascii?Q?KLXOWeBTefS4YtzHpfoIy5C/PhP7L0lpnV8rscUkIJ4jSPI6MI8XoVD1pAJv?=
 =?us-ascii?Q?b1QrsYAgB8J+0ZhyWUEqV06M/rT6EJ5495bjAgbLttuDrNXwGYBVYb8TRYTs?=
 =?us-ascii?Q?mIrlx4qCUjY7ORdRET+oQrT85rMOhdvEsExvQOhKQiThcdzQfUOoM4WKUaDs?=
 =?us-ascii?Q?j99MZLKg8vw9oGlVDbhpK5Drq3b3ri0mvWhBZFCbX3t7vnqfsRNRArbnIEbj?=
 =?us-ascii?Q?PitrSOTzzbSBbSfsy+mYgvhQaSHW2zURer0FMX25k+hvopM926x/aVa1bvm2?=
 =?us-ascii?Q?bXX7nozqK64sngCcYHumQaO7LDdnCVgO1B5jGvQtlvzn52AHarre8M3TYn+O?=
 =?us-ascii?Q?MN8OTreskzFxY3V4sa9jOuSJm14fML61XexUNiWBZWYH6CsnVu2WiYmKf9rH?=
 =?us-ascii?Q?eRszLd72w5VsjOXRdPzn4D9l70nJdllP7COKSzo7iqOEOhBknSgKQlZmFltc?=
 =?us-ascii?Q?epyazsg0KNGj9+GfyK0QPdlGillQoqzPPQanoybKHD9DFrcp7rVfdCSE515Z?=
 =?us-ascii?Q?6HWSXw2ifFt5PmVTfK3VwFrl8QfmvqzmN/GuV8SWMMB9wc/pM7ehO52c8wcH?=
 =?us-ascii?Q?pffgabPEqgYO/pFucnYClCtT3ESZt2ON4l41h5++gCWRmS5cMtZTadt40EF+?=
 =?us-ascii?Q?W/iMEaX9URVwhC6Yp+RoBLhUTEtek6EsN81+vSEOlxc+qMdcSmmXup4K8pPn?=
 =?us-ascii?Q?zrcvv8dkBDC9xO41qas4hIDBeymnk7TiCoAFzrOEJ/YKjVIqJss2N8zkLw+9?=
 =?us-ascii?Q?uRNhyn9mvRTdYrtYb9IKuRKCe6zE0UW0zGDrvMlH5/eZDGTcbGdxi7jwGXhe?=
 =?us-ascii?Q?sLSNm49NQhR45tnFjXlFTwYU8va1Uno4/kDAE4rt3vDY?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?yCvPWcYc/YkcmruetcHBRT/EGSNfU6k91nyI3dchLo9dd4Z9z0rBwASJ2dWy?=
 =?us-ascii?Q?nGyxY/hUbNYWfPwMgexadQxPXCfwPuzfy8nr77efkNDsfaCwL+atBUD9j0GD?=
 =?us-ascii?Q?ONkZ6Etm/nzP4PL7U7I/VZi5WaiNZQ0tnO4aTGVqW1KY6v7Pne+NQj0owkHA?=
 =?us-ascii?Q?Zz/1eIgtpcE2JqQlQspegMk6hnd5tG0CJkX8HjX9FrZCSfw7qV9HwvUUz0hf?=
 =?us-ascii?Q?UmvshAbahw1NB8PEAcASlVJckBJ8OcPWC6KwXOdeu1DueLCT7R+djxujQVs2?=
 =?us-ascii?Q?Clbvj9wXk+nPbjtih8B4aiJYWELSTmuTA3Vo/mOir6LzLWpEmGbc8+pauqRb?=
 =?us-ascii?Q?RZ/Au+R9owD+A/laFidkQCoerxLPEqCCA0ClDUNUljbeiCdT10LrScIK3KT/?=
 =?us-ascii?Q?qEItyznBuQ/23PUwG05qP1G2jzYdc72SwnTJ1b71j4J2hWuYfcgURkT/dwWx?=
 =?us-ascii?Q?MQZeNyv+XvG4TTm8snWYKpzLtJxHNQVm8sNkDY0wNjgheSTXUpaBmNSOdpcO?=
 =?us-ascii?Q?Y8wucmWPfcsC5lzOZoF2T+ovcB207vDi6siSnkYdIauQTG85fJFK/ARjhi4p?=
 =?us-ascii?Q?45J5pH8SdLpN7xV/emW8ug6I9PyBAQs2A/pDezP5mFFRpTpXr9o1TpXUD3C7?=
 =?us-ascii?Q?p5Tf3mThIA0flWlMqfE4wjPLatSYw0V+uiiKbaSsL8Z4fkQn2jBWM0XqKoJZ?=
 =?us-ascii?Q?6Ap/XyM02Wz3qmlsbNS0E5DdpPLJvnbmLrhyLKcEgRkOj1jMIj8jLV1xraDc?=
 =?us-ascii?Q?cLsm3PuNCbEk6SavxnxPhACcpVEkBh1hZ1NDGg6awqBSy+99XTr8jy3h8s2G?=
 =?us-ascii?Q?hsVrBCeurVZmcl0O/hLtvlXtSka5FhiyelNZ1fbmFRAkJGrkKZSSivBuQjj1?=
 =?us-ascii?Q?qWNnWfmpNnYAqGvfGmo5nk1ol0v8Ep8KQzmKoKCfMHv5lZaXVXHw5aGVAkKP?=
 =?us-ascii?Q?VJZ1J7ng0JnXtJUR1L3dqSNN5vq4NCe4nvZOIJk5YknCe7ItrE4XRrqZ+qJr?=
 =?us-ascii?Q?hEY1+tQ+vDsbqM+ypqi/yOjc2PBk8Tc1KMvDasZhhylLeRv8QPX/P03VgqnL?=
 =?us-ascii?Q?SXtCX1kT1MXPXRIi+k3sxCrTNuR0405k9442Asgs26yr1QoGJEzD90EtnIdy?=
 =?us-ascii?Q?HlMYp1RArKVdm3RvcA6epUJ6qwfohIcKJ1VlgzUsBdgyNvvwgYF0XbMj+UES?=
 =?us-ascii?Q?JERZ32rkjSL97MgK9eGk2MZqs9Lo+JBP3FkWlaNlqZoj5x/uDy4eleqy8hVp?=
 =?us-ascii?Q?H+FMUkE8C1EhClqtULvKTeTQMeJKhdWRdrcq+xxF6pz3069UsHrTBUY3mjBw?=
 =?us-ascii?Q?Yh5r/soiGmPhIT2iRxkx4BAgWFngNVLfaenKwBaNuywc8fd2jac6/Uz0AdAI?=
 =?us-ascii?Q?y5O5d3p+iSpjZwpnvvuJIF4ZzO7wNtG4yzkaw2o1Ki2oz11F8nNlun3IKvyk?=
 =?us-ascii?Q?ewEIudujSkLJ/axn8KJKB9sH+fZxJfRfF8X4RIjIdvHk0Emmcb+zG8iMmxzd?=
 =?us-ascii?Q?BVr4thNZUIn8zET76LgV2s2DgsU+En2e7D7O61mDhH3BvL6DIjysMiGDdV3W?=
 =?us-ascii?Q?g3YSRS4AlvNMYr3oUxEETkwcUe7vDfVaL5NMWALeagE4AnJVVuNWUrTsKjDK?=
 =?us-ascii?Q?sEyjl7nA1gaRhkaltSKrTR3mGvPg0iMsDvXOaAOwj8Mf1r00gOy327pJhH1s?=
 =?us-ascii?Q?THejXc0+tm1dUlkj+wvJbEuo60Am0vDpfrznDHOuvD9+fySWe0uDz6zdlU1F?=
 =?us-ascii?Q?G6l82hD9jw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b27ec0f-c877-4aaf-e11e-08de5a29899d
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 02:45:58.4979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ev5QRcZRfkxsgX/UU/2+T8rQJMtWsuCi8fqbqsWcrtnNgDJiT6qfqHqAs75nXw0UOG+f6880og7xAruinTtUJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9797

i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
(Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
functional and pin connection differences.

Add device tree and dt-binding for i.MX93 Wireless EVK.

---
Changes in V2:
1. Rename the compatible string to fsl,imx93-wireless-evk which is more
   clearer and better aligned with the naming convention used on previous
   NXP boards.
2. Impreove the patch#1 commit message to add more info. 
---
Sherry Sun (2):
  dt-bindings: arm: fsl: Add i.MX93 Wireless EVK board
  arch: arm64: imx93-wevk: Add i.MX93 Wireless EVK board support

 .../devicetree/bindings/arm/fsl.yaml          |  1 +
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 arch/arm64/boot/dts/freescale/imx93w-evk.dts  | 73 +++++++++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts

-- 
2.37.1

