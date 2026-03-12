Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013050.outbound.protection.outlook.com [52.101.72.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7723348452
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 02:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773281327; cv=fail; b=paHqYG6m4u1jaFE4wnyuqpMJi3d7jajeFw2e5isNfW7vjVMCd7uIn/Z8vzqIqEwOZctW3lfHeqXb2bZKOfYzsxZDo4/3TgIIUatFxvRyosrS3xLRB6ZmQt+YtYv8GlsXJM7g35oLTL0KNGdBUC78r86dyvVdS9gyKOdsSQE0dA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773281327; c=relaxed/simple;
	bh=1qEYPYrwxbbvadYbEGX/dKZoLJWF2aV1AXV6Lm6yriM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oe+38319tDbA4XW8giYZhYY57kqwXdTitbQrQTT+Pid4k1xcjUit/eto35Ps5cOcNBvcFPen6PO2dOWNk1peqfvuUPgKNpJTMz1VnIy/LRYCHaPm+BTsjzj8kqyHxn1DUpZfBdW9k8sR2KGr9McULGvZrlhJW+/UoP8lP3NyCVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n/f4rsRx; arc=fail smtp.client-ip=52.101.72.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n/f4rsRx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9eTVWpvoSGveh8DUo9jbLwwv4ogkajDinLWWjf/GRclBmnupVz9brsr7LQh/Pi4Ag7sYcMYIo35Fyz+pK45MXkE6OFKTG72ueM/3Y7vgnKWX9YY5S21VR1n45ujxxoOPTDqhgN+s+td/Bg3qAokO/IkiEPT4uDqN34Cy/wko+axKeabP7s7zsSNYyO6fQbAd+7VnuUXi+IboJF2bc6oYsCtGxrB9XqUEdPaYmqcP+6tEPP6vXSiNfk7SW3/5Em7/GjUAnSrOKGRbVG4uX1GPiUHmIDsp3yUjMVL5YqfJGLtaXzVIouXrAEGDu9LFSlqzappDh8xRCwqrFfMmUl3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qEYPYrwxbbvadYbEGX/dKZoLJWF2aV1AXV6Lm6yriM=;
 b=pYqkztAMXxjyKSd4za0sLUdlGjMzk/dW1WLRon2W/IGPSKvNdimgMGm9poyVRigdurCDmeQi6MSNob3ZUkrxLLvxqRGxKJF9qOoIXKY+7VgxAWRpeAzAAnZiUFhJ3VQ6os0tBJ1fN5XhmF8xJTr7nrMnZCEZT4X/0GqiAJ2GF42e8O/wRcj2r3FqMnla4iMmwtT7bnZIGluEgcb/RvENreIvx1DE7KPl57mN+49yn6pCB6yZtJJsAnhaMNyl75IUdHzHdhtyqDRYlMYJWCYr/cW3xnZlESFvu+gGJEycqI19TJhOXyFlQzXk7M6KTD4T1eQLUORQ/VX1tbLUAvvrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qEYPYrwxbbvadYbEGX/dKZoLJWF2aV1AXV6Lm6yriM=;
 b=n/f4rsRxEQclnbuUQCe8XXEaxU34YnwjRCiB0x5NgTmBBVaK67T1eLsGYcaHwDvJ7s51OXM7+AvjkRTadtKKPPxnXYx8FcO+bbmkWk31OU2lNQyvMM6bs95HZPsLPgecw13wKm9oGAxDQF4WX0+WizaW0lhLR6BVMGrC6NYc2S9fS3Wz8MO6+SIf7vs1rhf6l19thMZKTBSCxCoaK2iu+Vbgy2rnJ5zLhYartEpVYgl7sCMz4k/VBAZhcZPDN8Z2SzG7cwDvz2ShUjX+kBxQjM/JrMgN18aHHlxKa8sEf2QXVaT6Dnk7D2/4nrAGw/ssu0v3rNZ43rX0O9E9vppkcQ==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10655.eurprd04.prod.outlook.com (2603:10a6:150:207::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 02:08:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 02:08:39 +0000
From: Frank Li <frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, "Ciprian Marian Costea (OSS)"
	<ciprianmarian.costea@oss.nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Lucas
 Stach <l.stach@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-S32 <S32@nxp.com>, Christophe
 Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo
	<eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, Larisa Ileana
 Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH v6 3/5] irqchip/imx-irqsteer: add NXP S32N79 support
Thread-Topic: [PATCH v6 3/5] irqchip/imx-irqsteer: add NXP S32N79 support
Thread-Index: AQHcscUkPGqjK1btJUy0y26QJlCXkw==
Date: Thu, 12 Mar 2026 02:08:39 +0000
Message-ID:
 <PA4PR04MB9366C3CC828B63CAB1E6EBA08844A@PA4PR04MB9366.eurprd04.prod.outlook.com>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
 <20260311081154.381881-4-ciprianmarian.costea@oss.nxp.com>
 <87h5qmraum.ffs@tglx> <abGPVJpvXCOtMcCs@lizhi-Precision-Tower-5810>
 <20260311222148.GA875265-robh@kernel.org>
In-Reply-To: <20260311222148.GA875265-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9366:EE_|GV1PR04MB10655:EE_
x-ms-office365-filtering-correlation-id: 99175072-04da-48ae-388a-08de7fdc46d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 yoU3XaW2NqDiDmYOOAabpafRHnzp8SHy6X6qqk0mDE5elyqwrcI30VNxpnTd4Q0sjMZlXiMK8Lc250NOkniyuCc1SD8XWqNUCDhFO7WBvBdR+Pw289cySF8Sg9ziXNQSWQ0F0qZLEo0dv0+lpqZDdSomrWUuP47G4u6MEMRZREC67KZtX/LUWHHm5O1V/ONkJN+UcUujMA2EU62VZLjXHvCflOgEewWpopEaQsgOwUfg6i8hR+5zOiKzDtrMseYgrqOyT4she4LcvC6EmJNR6dYrl84Yco7FM/DQokDOyrnbMd3SQDbL6gXyLHwrk5iTe2mHC00egenb8ia+LbBNjWFF21+6eEx7WNVeOLgLgn9Jwjh20nGVsmaXHn4fD6lqtbx3TwLswyL6ECK6HxkyOGyVZXiEjf1M8CD9cWVxnxcRGHOruFw3o9cy8ktzErUGwKGs2y2VjYvOyjJjtedVJh/o5dq7aeF+TLU+j/xesQShOhNzc+AsZSRdOQWTP9qe4QHlo4WhdWHTcN+TD3wQZl+78NGpJrca8rMlup6gOkZUNEqdeLAUczWdC0mxskh7IdxmGBysaKRli5dCDORNsiCJx9b9jkAZODKwxQ5YxqCJOtmHM1A4KnLqktkL8qFkthndS+Tfrn1aai7CsKrZcs9XzP4MULjBZIJDaIuo6JTFG5wkcTc/TE2K4V87Pbo/b8itB+c+rSkJBKWsXhsEO2g99ua1sFM2MpXHlZfvb4FSvGW0gsLJcTHRHaY4iuM5/mEIVvqMyuulLAHMVpvldhO7LR5MsUxfFU3KgMFyslg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?A7/3SvV+VFWLQdREJnN6lnnXpMLcPtvne+IJalbkHf76MkR4mjImYrj5eC+m?=
 =?us-ascii?Q?dlNo+oeOkaimj8nzXmqqwGa0ZlMAAI6Ugah6u7I7JHF1GxVT+M+WwyouXM4C?=
 =?us-ascii?Q?2NEacCEHSimKhHYnQcEKUrJA3z/2oO2O7FkgIcoHYA4zDK+DRnnn4n+q2bwB?=
 =?us-ascii?Q?z2nMu5FYicSRdWbytDWkKbM/YNMf7y75ChapebRE5bUWe1SEErFxdr+gRp+k?=
 =?us-ascii?Q?8WeEMjZBOO2HIsdsB30vwB+HbX+4hMjg+9cr6D5HgW3TB9qHWylecTa15JsI?=
 =?us-ascii?Q?e5On4ZJyNcgIv25cF0ms2GmKGchAayjaYKJPbWaTY3tNsLaMFhlmKrw6oZLc?=
 =?us-ascii?Q?uttw7r/ZAu9D1COFJx1DR+DmKdK1Dj0Jhy6R7KLRsbqV1B21zHK6SvIZ1GQ2?=
 =?us-ascii?Q?yy3JU0HqVb74+L8O8Of6wN9raTaxlnr8F9lp9WxglPvqD7R0hOY2yZkSs0EU?=
 =?us-ascii?Q?KewVlfaPu8CIPgBzQDjChBICNXeom2CQXfUpD0UK3sBR12vfgD+uKMHyarar?=
 =?us-ascii?Q?6+oS1Qoi44haEwa55CH8PYwmf9L4UDCiqpyhJP3dPh3GiwkNbuNZ4bf25J12?=
 =?us-ascii?Q?h9POSgrCn5ELZXWHgNOK40R57c7I//gk0zB7sC7eOlMxZf1qhN149R8hcWFd?=
 =?us-ascii?Q?m2xtX91mOfZ7ESynzCjDcYgJRObm01tjt5dytJcvvZw0LpmiEBP8QYdwdRA6?=
 =?us-ascii?Q?WiHpqIiqTM4mqXNtuReGiUTyK7Rb2U1oVxG1yGm318r6ArgbaEEtZMWNgWr2?=
 =?us-ascii?Q?+1OoENpzvuYOcA/qUQ6/IXABp3t6Bft3wbv6q9F63yL1ac2LtTgBkpm6zojW?=
 =?us-ascii?Q?GC29xA7KzdjETgEOzbIG2zOXqYb2Zw4OfHc6bGSPJmqbZ9diQj5sYpofbgO5?=
 =?us-ascii?Q?tCg+CB4HXj1o+NYC/J521cmE1uBN1TarBVwo+1NVQn38qC3Iq7MQenk10w4s?=
 =?us-ascii?Q?ibJL5EdiTbgMj9JRIv/RIT40ppJSosdtcDb6uJkIpc3S81hQZyWtg3VZiA/A?=
 =?us-ascii?Q?NRKL9hI44ty4+gWMIQ54s6zH6thbNJgVeom86eizEhUPBFRbpWTtVvjv/0kJ?=
 =?us-ascii?Q?bf/NCuKHZdym8NRynpJswqc0uTb91GYMibEvyBddtCE6K5AiMpUw+RO07rYV?=
 =?us-ascii?Q?hWaUo1h6KXWX3Q+a31MYxFP74K2xqge5+LWsYfHHD1ecAvXoZhvv3SaDEkva?=
 =?us-ascii?Q?y2+Yd7BTH4F8d9d+YTagLEyamI7lt8uSIEvmaJ/26Nf/981y9OzlQclQhs3T?=
 =?us-ascii?Q?0EjizsLHb+q4emt43txKPRuYjEd/gSeT+5wovpMUCZLV6DcYJs8GdjqNZA7q?=
 =?us-ascii?Q?9ShQfr+JvhnyG5GmD0TjYOPegrm0CkDOfEj6TVghodaCVfq+prA+vHjRQUxi?=
 =?us-ascii?Q?rB/7fReJS2Abu9a/h38tfRDlSSwLaOeL4Md3obeqO2d1m3viWJicD1J4Et9B?=
 =?us-ascii?Q?vcbgeB3YtNxwCOG2GxhcNI4tDFs/Q9K5fjxIucA6s9mWmdrooYg9bVeeTgiN?=
 =?us-ascii?Q?UcLevaExFb57dJklAJ80EL+TAth7U1qoK3WNECZqPJQqi3jgzk3fj1DFRHt1?=
 =?us-ascii?Q?DNul2WXk+tAHq4pIt5UIg6I0tbO/X1sgAy4ipdRutwAohK38MBkK+rhzxLkY?=
 =?us-ascii?Q?H56rwTdQZ/5W11vEQa4pKZnoQZcWQ/nLqELdWchU3WsIfotQ6dZVlpOT3dqt?=
 =?us-ascii?Q?PkeQsYePeeNlQRzrZFNSCa1dGq9roLPePkT7GPytOFL8pXWM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99175072-04da-48ae-388a-08de7fdc46d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 02:08:39.0893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRX4+qRTDwVkg5qr/7GBAWbmDpeLJrvZvmJlqiP/YJZYA/hY/wCQLONyYzotzHx+Il6Cyyl4ETZJPVnS3UYzBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10655

> > >
> > > I've picked up this one. Can the ARM64 folks please pick up the DT mu=
ck
> > > as that really has close to zero relevance to irqchips.
> >
> > Did you pick binding one?
>=20
> The replies to the thread clearly say what was applied.

Sorry, I miss understand by thing it is dts file, not binding file.

Frank

