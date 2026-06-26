Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F6B3DF019
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782460210; cv=fail; b=iiY5rgXKuhCaRPI4t4zRioV/xulgz/nPFr6ERo5oKndRPXZ001UQ2T+nLnqCTroPVPzm+/6ccheuo1TTcLV5hWdmOX2+ox1de+7gsXNr7MS4tM1hxQdNS8c6BY0Gi/0QH4lMoslJ/3j6QSsF0WkYtPZ/yuyhsbLwn8vAgRnXrAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782460210; c=relaxed/simple;
	bh=deRMKTZ/O3xzihVI+v2DOcNHvifYEYbgF52vWtp13Ek=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V3TgewiQlsWFHySj/RGmyxzbo/i2h4On3eE4sHisltsBXmkZpXD+PR6bumlBUKXCMpW45JjXYW2euwWEqPVFxD199WpAL8mJ62aGxOc8aT/YtgsFhxyIOTzpdgf5PvoPVXgdcpg8kZC99sPo2zPosPo9fTaOkkzZkgAD/qaJ2PA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WIFjo53W; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WIFjo53W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFgE1gJje1PT96jbXwxBFpzcm/utkv9Y6gl3fj8UQe7pUNuSbWe5f6PTgzbUBROzObSGbyAKAnNebSNoyxKjUxKg/no4SeW55aZTRwbQ6VQNq22inCNnsrMAxCEWVCdWMCpa+FFtUxf9PfRvuf7yx0eLLf/NFBPI2oYyufheG3EuaEo/TMTRwJ9ZU9gGON+YV756lzpk6ICw727VZCM4XVxUg6MyeysS9QvIQsFgtFyH/aY586sy7JGT77KqoLZeYooQ06Iumfxjgjv4ET9kr5qH3G2TYNcqVWP7GhCXsqOZ2JrQ5mo2Gnbu94fAO8E6NGr5Sxb1WKFEqU9WKjgrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKCBeFsCXaNuLJFdYCL686ENNyJ5DcId7EPJeT4o5dY=;
 b=hWFy9zoT5WZnJAtZg0Qe0tJHOecJDasGeVoerzMJaU43gs03ugDEZh3OeWz/rw/J+lr3cGoxb3L0v+TIQkcfNPc6PfO1A9q/1ftT9Oc9eUdrha+KR34uNa0eLrn8gEOGSJFdZEXb7UjQpD3AztHyA0QVzr7toGdV4ORmdUtuEgikNwD1xUeLydq9oxgRQynkWIWGpQthVG168CkrRFEcjPk59SSlzahtwOJvEtvuGJnfYk4hff7CLVupfDAbdVPXGsP5TnmPpoS8ahf49Z0Q34mB4D32BQ1MckDZJeb4szueCYhIAeT7HMLjcEBrOZ5uQzR+6n/l0q3QpEhG/gibRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKCBeFsCXaNuLJFdYCL686ENNyJ5DcId7EPJeT4o5dY=;
 b=WIFjo53W7bI0VKzimhv/+DMHWr4Oo2x/igIG7dLNklihIfRFDUxS0PhM4TEhkrOZph4Qk1wLQjIuWWNTUuahjvDa5ahAC49cnkXrma6dn8f45jaoQicBnefiR2pW4WPt2Ya5eT/b8D7hE7GMlQrMD5JaSbXmHuRzKO1ZZFIwi/di5pUTNdKqclNmoKVy1jhwGeRZ5V4gzVcvY8BrB511iEErSTO+QB6M0dHmr/HVM/dF1bzqMuXNNrrFvSmrpOz5llfjvZpk2ClL4pcTXTl3G7zgvHl47SQhljzlW7ipFitgW7jDD4nnyEXkQswhHaPZCN6FX1ATMyGZKjKX5EtTaA==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by GVXPR04MB9950.eurprd04.prod.outlook.com (2603:10a6:150:11a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 07:50:03 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 07:50:03 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Jassi Brar
	<jassisinghbrar@gmail.com>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] mailbox: imx: return TXDB_V2 timeout errors
Thread-Topic: [PATCH] mailbox: imx: return TXDB_V2 timeout errors
Thread-Index: AQHdA+b2UcB8BMFwn0ytyz+ZPZtYhrZQeNaw
Date: Fri, 26 Jun 2026 07:50:03 +0000
Message-ID:
 <MRWPR04MB1233037C743B0F50B83B13CCA88EB2@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <20260624143707.49344-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260624143707.49344-1-pengpeng@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|GVXPR04MB9950:EE_
x-ms-office365-filtering-correlation-id: f62c4792-ab1d-4ac5-30ee-08ded3578838
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|10070799003|23010399003|38070700021|22082099003|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 P7w20qJt/1y7gn4k5jIyAERzQ4EuIVbDyRtqEHFpj62FCZbbojvZuB+MawzsWi1CuR9kxaPrnQizzQj83/CsHefxn6tRjmkc7UVrPgm5sxFJXHHkLuwnSHfOiPlaL6dL//kDa+UH0VKa1f+nhrScWr6PGwdmBSdJZIC+2IXOxiEuy7kZKqixPcyQ0dYjTtRLAoPaGvY+75vHVLTBtuXAR6PCiaOWQ0yQxg3flOx6R5Ue0m7oXoUzpeGr3Z2GaAZyb54XgFpQ2L/YLh9mQyDlapzZlY3CwF1ziyzvmNAJm5f7UmmCzu7kQectJLuJEwWHpU6uwaeLk5LHIe5m/BXkYJGZkhQNgsFBXQk+S7BQyxcYBn+SgaZL8vgzIwkDgUDgWh9d5OefS2Skx2dJpUtmkmx/me/0JC5tGsdvu62P5dDICWfzkIfg3V81s3PFK4iOiN7t9BttAnCddgRZzjz0CBvlbCXHfL+UcYyBAyOHK6QA3B9Hz3mmv9m59Ay4dciIDabJ4i3fcZxDhIPHnChxWVaxfP854bJzPd0ITlupqHyuEQV1tEYjV/6nMYZBQsjLzEtoq6kUqj+c3yExVxeP+zmpW9zVxVWx26re8VEwHx6PhUBt6fPaw5j65kqxtCQLLve7tJkt+JpzQ90KDm2Vc0VOnIc7S6xCVgttbdRic+kGCKA2vpmnIFKbW+McgxVQ4SS8drKon6gTfkZOohAPY6/M/w/+arhBOYseAinbkdo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(10070799003)(23010399003)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DOs58gDxmZ+K8HkmnUPC19JGBzeifw1iwiN+y3+qRm46v9pkqHjbeVrtpbOq?=
 =?us-ascii?Q?YBURkq34O2ftPzB9TaYKJLdiyTBEZ1IWKiG3ib7tSVBdOdC+AR84JpzYaIa0?=
 =?us-ascii?Q?MNoyQHbKf61dZGQ7aXP9CKNBoAPRpqQNczVXpSUf/Py80hMbuAkgS/Lx33me?=
 =?us-ascii?Q?RRwxNM1xfDD/Qi0p7NAQvxP5HuGIPFXtS7dNpQbBv0zOiYzs/1GI49UjrJli?=
 =?us-ascii?Q?V1iAVGr+cVxczjxUzKvHVCbWqVNZuqo39Rp0FstzjLOzUMKM4UE+LObl6gMc?=
 =?us-ascii?Q?Uxu5cwnG2CtIoPToMmon3mgDJWgLelCXNsYRmX0gs2RV7ZwUBoTjjv0Mxxe3?=
 =?us-ascii?Q?0BmP/FcfmTnBLc1ucMvoS3ruyJ16WLdYAqzOUhrk3uLBuf+kFfkdkHVsWZ55?=
 =?us-ascii?Q?uNleMZ4UAv1KNhVEtVssDfvHVfVCqrPq7lrPyDKOQCljWwh8KfLzWWa9MCHx?=
 =?us-ascii?Q?mEU+YdxucMAYprEzR3WdF9N7oEepg5QNGIl1hr2gWxmlsMh6Upoewzy4EDZh?=
 =?us-ascii?Q?jZGlx9BeFOt/QwDNR1h3YRSk+SBjZi9TcvOujV+nnABHIvBOzk8/SKYiCV9Z?=
 =?us-ascii?Q?1OE2sQYA9FWQ3jO6okfqfSYnjXdp7I1zKY1RfD/6hLo/590O9tCIXW1CLI1u?=
 =?us-ascii?Q?Qoz/NwBzBfUtMyKstjW0yHMA5+AGH+/N0nU45VWrUrFPFbhx4rYEx7mILcah?=
 =?us-ascii?Q?4b5rqT6hSP7S1s+9zUn5f2JiM05lwPLyZ1KKTmqQVrMLqFLO1sLhwe9Knkjf?=
 =?us-ascii?Q?VPRrdSyvFmdV2t3axRgjCdDoqtnt3prwpfC1luK7RORmj4hOVfe8EmW6eDt2?=
 =?us-ascii?Q?E5rvGpZad3oiN5WYHZVtEbNyaHLzikHVANucXL/n3AJnY/ddcF9/iI/A5QaO?=
 =?us-ascii?Q?Ezyo3MuSKowxSBCp+Kt9lUvU6a+2gOsRD3wfqMUGM6VW2GgZMnD6MHbNBg7b?=
 =?us-ascii?Q?Y9QD5nkKp9Wi+lqmf42YQw/adJVPNChFyQv3QvqycVFCyzd9sk1z8/norTdu?=
 =?us-ascii?Q?09EvfbLndxH3QjnBeLlfBbswwCR4C9PneC9ncbVBwocmImq6Z7RRDC9D8aJV?=
 =?us-ascii?Q?oyG09ue/7TF7Zu2EsqGx9Q25xXFKdi+8b1aKXZQ1t+LECqceNH+D22REsxv9?=
 =?us-ascii?Q?N+7SkTHaeJBQ95w4FHo3yn1OEE700v7pl+/GHyQdPjANWYGoAVWNbZ4WImqR?=
 =?us-ascii?Q?B+T8jJiKIHteyNKlze8edC40Nx2iHkjTtX8I5bN4DEQw+OsZPx7zYi9u09p+?=
 =?us-ascii?Q?MyYr2t1l6EdpHHPUE8N2n7yBE1m3x9L/59FIrGmf4qeV0Jy3RMI7CwkgJiVn?=
 =?us-ascii?Q?I2eN9/WsqIB2VSs5VsfYscF6tUr0nAS5vZbIKr/euZbgrWgz3Fi4uG9m2zIq?=
 =?us-ascii?Q?FeIcZm6A7hf+gVjkrOtaqW3O/PEL+ZJTXOobHFa/ZaN66D1n62w28KvMWtyv?=
 =?us-ascii?Q?ucd90nm7OTYSy8tbnCZgsfwXLwU5bbtcQQMmRwV4+tCMgqvWypnoneg4x6Ya?=
 =?us-ascii?Q?km9L6zPnMa4rLTaKeqHFuVta3BI2QJeVjM3bzDBwrmIg64zXFnD9qLVmwhph?=
 =?us-ascii?Q?7BJXyy/6dJeWu3AvZyxRs302K7hGbUoEP9mB0xkwZCL/kpP+8kqogClmYFtB?=
 =?us-ascii?Q?YyGWUgPwFO8RkKSeZQmUKY83BiTsjb1qLnRiXe5Y3qGMvhqCZcc9nLQdLKZM?=
 =?us-ascii?Q?M3EglzcFPYJ4HWK7Po0NVeDNZajXgSxwAbrq2d2PkcI0TpF9Eqpi4myZYCIr?=
 =?us-ascii?Q?EiTpurAIKjLdzp8Ew9i8VyoGjZwlVTEqcOUWqqR93vp25smWnQYu?=
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
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62c4792-ab1d-4ac5-30ee-08ded3578838
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 07:50:03.3729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o8vb3Tfle/qkjMxXnw18IzrvXGs7FoPbPxjKWAtJ3Zn9HLrN8HYwrI/F+KRzMXLx/m07JelNwmyppBbefbpIug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9950

> Subject: [PATCH] mailbox: imx: return TXDB_V2 timeout errors


Same issue:
https://lore.kernel.org/all/20260617-imx_mbox_rproc-v3-1-77948112defc@linut=
ronix.de/

Regards
Peng.

>=20
> imx_mu_generic_tx() retries TXDB_V2 doorbell sends until the GIR bit
> clears, but falls through to the common success return even when
> every
> readl_poll_timeout() attempt failed.
>=20
> Return the final timeout error after the retry loop so mailbox clients
> can observe a failed doorbell send instead of treating it as successful.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/mailbox/imx-mailbox.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-
> mailbox.c index 246a9a9e3..86a8a590b 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -253,6 +253,8 @@ static int imx_mu_generic_tx(struct
> imx_mu_priv *priv,
>  						     cp->type,
> ++count);
>  			}
>  		}
> +		if (ret)
> +			return ret;
>  		break;
>  	default:
>  		dev_warn_ratelimited(priv->dev, "Send data on wrong
> channel type: %d\n", cp->type);
> --
> 2.50.1 (Apple Git-155)
>=20

