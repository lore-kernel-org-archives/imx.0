Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795750758;
	b=i4vmxVwbJOYtpM2DsSk6paTiXuNkwdFshgJ1wH4Jn938gSZy4bblaeSuTC61MWsE/ZSz
	 xA3+ak6VB6jiITIeBC3iQ6eN+moOuymQ+xDpaH3knF6i1SCPk1EGhfwoaLFxsseaDUBuB
	 RpPVdz3zA56bB4qLO2why+4KjLHZTZLN0oKGDR06J4MI3LnJLSuy6F18TSoo3TrVOjDMC
	 uZTZqMtP6OMu1iv3vx2gyScIWNyZC+Rc2492ZRWmIkLD1PXEWnl7KxJntxZbUQW4F9DWs
	 Un2b3EFWw7hIgm2gE/B1Iw53Yc2982nnGfs4xwzzbAp6GT0Dgb+dzg1+05v7RL5T2fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750758;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ALuSj99FBaUnJ+bOtnbCmbIxEfrEfPl2S9XIyhAztYE=;
	b=m+KApGLxJI9q7gTLFb8/97Z5NOBLvWtInPU1pJe4n3uHqe3PUuwc12imm0xncBwsEnH2
	 /dLjPAXMLgdaKbqsbqvkZ9J8CEkI6brJ8/KJksvZIQhQLX1FcVYmszOlCz9r2rG0I+c2Q
	 UNXAvGpFNpAYFhB5Lyd8li58zez2wKLpcNd5dxlhwwsOY60uHcanQ88lvKSVkmPZt8rPG
	 uWDIRMy85g6TjIq+c+raf+rV21x0BGP8N9vHrL39etLw3qIzyn978PEc/Ps1Cep+uEIF6
	 MfzpB16EsYh9CG9wcfcf/uBMIoNp5DuQcQDnDyrgp6rPtzTNP4eR7KiIHa8WmZOjyWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.jp;
	spf=pass smtp.mailfrom=outlook.jp;
	dkim=pass header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b=RujjHGkW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.35
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011035.outbound.protection.outlook.com [52.103.43.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51857606A329
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 03:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51857606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b=RujjHGkW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmLsq2UStdbwk0Vt20DwQVXtlX9OLIX2x4LXSKCLYuNF50s55GWXSKalj2bCv1hlAYJ2wDQMT3HabGJNILO1fLF/o4kxg8+GCM9tguklaxl7FLdczf8zsSl9qf43zXWwFE0Yo8AIRCGRby4ou+eC7Mb1/UtPqIJOOHuE4+pjrfRgQ52DB35CbBaI/zIcoVJaa+UIOfH1Qf3BeVyrZ28wkFm5YCLi1XMmurVe3ncNq3WwYA0rt3eKWA8cL7g38d3zil9YpprMyOuTtq8aN2Agxv4pM/RKkA9/H1jzisygJNi5/0UaoJvUQxnptAXWGqWW5ADoZWG2Q47jPsklqMpe3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALuSj99FBaUnJ+bOtnbCmbIxEfrEfPl2S9XIyhAztYE=;
 b=RWUil3fZFvQDsseamqa9eY+j2+Z6qB/Id+an1ecw0Gfu7urPXsiXZeQ05jjgn4/NNNoT6QPVO4jlbWGwlBaG35jk8BJnSAJMbf/OhTE+ot1gTIunLeXcVd+KwdSy52mANM9tH83p3PSykr+ypCaFgJ0Mtgjrw7dJC8Ve7nmoGiohHeouepdnL7aVwGgqnXcbz+WUgbP3VzlbBsxTHCilJ2uBuBd7xjxn5ZwCihTSodUIT1HqI+79Dj96LTdcqBFlrA9Db+KDBlYgQ8QDcjKgspguawvVcJtVI3XMzhjtXKXNlNN3uiXlWkw2M5PQU99M8Xw1GsDcCDGtiG2lrcf/3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.JP;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALuSj99FBaUnJ+bOtnbCmbIxEfrEfPl2S9XIyhAztYE=;
 b=RujjHGkWlC9jpPoVi++JNEHl575dNvL4TkCtBmt1wR4JrQ5zNXgyqm4Bt1EZbMDmWN3JRsWGtngWErjrUthyOw5xLUmJaAcN3bb8yhLrbnzb0eCactOOGTXBJZ4B5ZMFoFWbKQbBjHW/ICZsprsfQ0a65hjP3cM19w1vQcXzPwq41QvFeSgjJOPziupO5aVKoOHy7LOdhH3WAUXmN62cUxKYce/INIaDeWIcK1Eg6Vubs/W/Yqm9jruNgNYoRRTj40knj1agNtyrTxyY9l/XuWPDl3Rs9UVbMZ5DPnullrw43i20M1BfUq9bm1ofmq5yxdmavO2fYLCTYpgfS1tn9w==
Received: from TY4PR01MB14364.jpnprd01.prod.outlook.com
 (2603:1096:405:23c::10) by TYWPR01MB8510.jpnprd01.prod.outlook.com
 (2603:1096:400:171::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 03:39:12 +0000
Received: from TY4PR01MB14364.jpnprd01.prod.outlook.com
 ([fe80::a8e9:98df:8239:8b9]) by TY4PR01MB14364.jpnprd01.prod.outlook.com
 ([fe80::a8e9:98df:8239:8b9%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 03:39:12 +0000
From: Keisuke Tsukuda <tkdkei@outlook.jp>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "wei.fang@nxp.com"
	<wei.fang@nxp.com>
CC: "frank.li@nxp.com" <frank.li@nxp.com>, "shenwei.wang@nxp.com"
	<shenwei.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@kernel.org"
	<edumazet@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Keisuke Tsukuda <tkdkei@outlook.jp>
Subject: [PATCH net] net: fec: fix TSO DMA mapping failure handling
Thread-Topic: [PATCH net] net: fec: fix TSO DMA mapping failure handling
Thread-Index: AQHdfiDdXJAPFXqILkmzJeyyha/umw==
Date: Fri, 27 Nov 2026 03:39:11 +0000
Message-ID: <20261127033906.9561-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14364:EE_|TYWPR01MB8510:EE_
x-ms-office365-filtering-correlation-id: dd7da656-f484-4935-a6da-08df4c38007a
x-microsoft-antispam:
 BCL:0;ARA:14566002|25031999004|15080799012|5062599005|39105399006|41001999006|24021099003|31061999003|8060799015|19110799012|8062599012|4140399003|25010399006|22121099003|38102599003|26104999009|3412199025|440099028|102099032|12091999003|40105399003|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?DR56txtBeb+26VB/2w0zOGBG4wmP5ckFaht7kqfY9yF8q3dI3A+R5NFcq/?=
 =?iso-8859-1?Q?ats8n4VyuflBuChIF+gYA1/8HNJq8PNgW+ZU6Tr3YcQEeJ057xhNIlJWbM?=
 =?iso-8859-1?Q?kmdI7ye46VNVBzxRViSXN2Nlimq6Wr+IucucrqXIdvtfOME9f6Fj7WqWdV?=
 =?iso-8859-1?Q?VPr9bFF4cCI84Zg/H8uDU9JWciOcGuSGsL36yoP44sZhobIh+vtDdA7MEx?=
 =?iso-8859-1?Q?skr+8yf0EsrfziIYqkeu4LyZ5WZfwVOwGJbOXH+K0tu7SHhNQZ9pIl8CHa?=
 =?iso-8859-1?Q?ZeXpazsGYzERpp2oJDILvEGjiMS/uZCXFaoCv6Jv4KC4F6SW4Vn8zVV5I/?=
 =?iso-8859-1?Q?PVwKNwl70BXYEqekL5k5y4ceEgERkvIGQ7jViewCjB4ued0cjWbKkjBcE2?=
 =?iso-8859-1?Q?X6JWLH1GdRCh211TP6ey4K1UaHDoYiup1GZ6hEJwL1veCpKHALyHL5LyWE?=
 =?iso-8859-1?Q?ZFl1O/NDT4rrYgGu8w3YD3AscG0JpocTDE9NdvEoeSogk8sPxWXyuch1o6?=
 =?iso-8859-1?Q?DH/sfMuYa6y9DoMboc1joY6FJFnq9PK8jg+wYvvSta/C8kNdRYZD5qLtqB?=
 =?iso-8859-1?Q?ViE11xgKEY0iBRi5yAuCO1XsGnBdUq/iC+GjW3XOaoxVdLbDEZ2wlR0FmB?=
 =?iso-8859-1?Q?IjW+F3w1OcX0MAX/ewuoeALI3yF3XBG3O/irBjAHuJqEuRtAvSYCFZsWCJ?=
 =?iso-8859-1?Q?kpVe5Yn9DdmfhHVfLkh5vHIwn6oc74cTJXMMFgfRRNNWTFZH/ROO0+PQ+a?=
 =?iso-8859-1?Q?xpsUNa+5VyC4lYh9hO6oNVpnQz7R8/vKqvHVojew/6VG0WAQASGw9EbtzZ?=
 =?iso-8859-1?Q?IkJgH4XDmdtoGXDRzulokiDV17WG38Os15P7Xfh1Nd+frevE5wQW8IkwOb?=
 =?iso-8859-1?Q?98c0PqRLHNvYTkvBw7qYH/r0hspvQwMkGAbwTwh3ycaB0UfoQmZa8RwyM2?=
 =?iso-8859-1?Q?Qwk/qGo3Y5CWL97eMQcY7CzmjbWRIByxf24HfhNKJ9QbxBUUnhzF7xZxjy?=
 =?iso-8859-1?Q?0uzOSOisuceVqSl0YR3wd0Fhb/TCoxQ8MAVECyKL+Q5ggENssWARTtOZQE?=
 =?iso-8859-1?Q?XlEwEEnAuFXEdofZQwyVSnAYyxBowmKXVaK0iywxFdUwwUu5EfnH3nVn+I?=
 =?iso-8859-1?Q?fErE69TP5s/iQb3eIwNxHTx6KO05dRqCqTF2h6wZUUPVvSPE9rgQ5YJmtg?=
 =?iso-8859-1?Q?+fTlKDUqrEwodw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xl2q+3F3i4OHvGS9XLEyElmi3pTSp8bgmn6mNu4N2aIKLeqvugJ/3C5Xco?=
 =?iso-8859-1?Q?s3upNKFUDP4UgYchDcMmZCRDZPjc45IGriZuBbA0xe30lzZNQjWOqmakFo?=
 =?iso-8859-1?Q?XMI0GmbnCNyUMH93n1momNYdl+5gepaAKF3ThGCVMokKr/m4kn9MexhDiy?=
 =?iso-8859-1?Q?XS6hjrryv7Z7awWx3yo26MoMoUbN6WZO9ZnJjJwD/ATHdvANaryn0upJdc?=
 =?iso-8859-1?Q?kYtJa9bLo2pWrque1zznpXrT9dDjRfqbz+J6+wNjgD9TgkB0ASnZjyMJbr?=
 =?iso-8859-1?Q?/uya2oWwgmDkPpAqkjGf4y+UT9PtytzwIloGAbQ8epXIulYwY52x1+QawF?=
 =?iso-8859-1?Q?qyaXPqgSxp4jY0sB8HY5la5E/QcRlrgWNF4TEYkKoJPCcm+qwfHX6kpuYn?=
 =?iso-8859-1?Q?fZ1gkT5SKx2DVvXzqZwsukfR/xqWunEpqyMTGU/qxiq08O1zYbT/yBL460?=
 =?iso-8859-1?Q?gSQfdrr8o3e/gR9yJ0i4sgF8Nrs0FEzy/11zaLE+HzkRmg+XMtTTiCBQTI?=
 =?iso-8859-1?Q?H4d77j+Rz0sIDSFSEmJdbjzbqqPBVIky8FX9U1DrBqNhRIs15Sflak3IfS?=
 =?iso-8859-1?Q?wvUIUD9/SXQby1bpstnJO2bSqbMq7bD69T3OgAB7xBIzS6XBOwhOfiq9cX?=
 =?iso-8859-1?Q?nY7e/OrWwfqngNeI9aq5uaxZMFZWSvyjUsKZU4cho2cR1AhWjLLckcXsAJ?=
 =?iso-8859-1?Q?qwlNjk+2mrgmzLrUkyzM7XFEn9wRFiL0r5+cMpeiT0qt24Z13Sh6UUROeB?=
 =?iso-8859-1?Q?0FwF0arAxLTHOHztESCPBU+MmhIj/YS0nCTuzqWrdSNa3BH4WqweKnnJmf?=
 =?iso-8859-1?Q?yM9CENxUmrmNpGQHSs/tA/ufYeH2fuMKrInNsRiwhXGjmBpV3AAy6pb5I0?=
 =?iso-8859-1?Q?7tQZu+Ak9OM57IWupE42332gF04VYEWG+gpUi4QbqXVQsP138er7B5VY2a?=
 =?iso-8859-1?Q?ktUEkVF1wsbrK8Ulyg+TrgMcfidcL5XZ0P/C8CJ1ZsqQ1/DN7BTKBle7NW?=
 =?iso-8859-1?Q?WWESoyd59WgLNjRdvaXkjxRwwCo04CAZ+FP7FcqXY3z4G2DNE+Gm0olrBA?=
 =?iso-8859-1?Q?ZXSFPZeuScQm6uxS9pbx0NnLj8nTr+yLK1dYiQmFR1x2y2GWRfuhoClKob?=
 =?iso-8859-1?Q?YRd9cDmOHp3mpjaEFpVPaKBxGvDfu2ZyDMBqthIiq2SqWNC8RwCFv0D0NW?=
 =?iso-8859-1?Q?bK8M7tQKYIGnOnHPoZKB9aCeZCKnrNLmmj8VeJKujEL7kPfeCYVooLwOiW?=
 =?iso-8859-1?Q?h7wun0PmtGo6qvfbCitkKDjxBG5fmCO0zUNX1KuyYQJN2HPdUbsedpO5W8?=
 =?iso-8859-1?Q?SeICm3qb7IfDXjcuV8oSV9TO/6VTIXQZ3//4njZD0CL3vMA/gERbs2CtuC?=
 =?iso-8859-1?Q?CkAwiTWh8zvQdabIj0W8GhJRttg/Qt/1vrYmVVH+xuTpfI9gJ0XJI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14364.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7da656-f484-4935-a6da-08df4c38007a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 03:39:11.9679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8510

From: Keisuke Tsukuda <tkdkei@outlook.jp>=0A=
=0A=
The TSO descriptor helpers free the skb and return NETDEV_TX_OK when=0A=
dma_map_single() fails. As this is zero, fec_enet_txq_submit_tso()=0A=
continues after the failure. A failed data mapping then reaches=0A=
tso_build_data() with the freed skb, causing a use-after-free.=0A=
=0A=
Return -ENOMEM from the helpers without freeing the skb. The caller=0A=
can unmap staged descriptors, free the skb once, and return=0A=
NETDEV_TX_OK after consuming the failed packet.=0A=
=0A=
That cleanup must retain BD_ENET_TX_WRAP at the end of the ring.=0A=
It must also avoid touching descriptors already owned by the MAC:=0A=
the helpers currently set READY as each descriptor is built, so a=0A=
prior transmission can advance into a partly mapped TSO packet before=0A=
a later mapping fails. Leave the first descriptor unready until all=0A=
mappings succeed, then publish it after dma_wmb().=0A=
=0A=
The error cleanup in fec_enet_txq_submit_tso() came from commit=0A=
61dc1fd9205b ("net: fec: implement TSO descriptor cleanup").=0A=
Backports to older trees need that cleanup or an equivalent.=0A=
=0A=
The mismatch was found by inspecting the TSO error path. On an i.MX6Q=0A=
board, test-only 7.4.0-rc2 RAM kernels injected a failure before=0A=
the first data DMA mapping using an unregistered netdev and fake TX=0A=
ring. The unfixed full caller produced a KASAN use-after-free in=0A=
tso_build_data(). With this change, a ring-end test kept the first=0A=
descriptor unready, retained WRAP, and freed the skb once without a=0A=
KASAN report. The probes performed no real DMA map or transmission.=0A=
The hardware race and header mapping failure were not reproduced.=0A=
Network selftests were not run.=0A=
The updated FEC object built under ARM allyesconfig and allmodconfig=0A=
with W=3D1 using GCC 13.3.=0A=
=0A=
Fixes: 06a4df5863f7 ("net: fec: fix improper use of NETDEV_TX_BUSY")=0A=
Cc: stable@vger.kernel.org=0A=
Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>=0A=
---=0A=
 drivers/net/ethernet/freescale/fec_main.c | 21 +++++++++++++--------=0A=
 1 file changed, 13 insertions(+), 8 deletions(-)=0A=
=0A=
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethern=
et/freescale/fec_main.c=0A=
index f7636f23d..a2c760218 100644=0A=
--- a/drivers/net/ethernet/freescale/fec_main.c=0A=
+++ b/drivers/net/ethernet/freescale/fec_main.c=0A=
@@ -746,10 +746,9 @@ fec_enet_txq_put_data_tso(struct fec_enet_priv_tx_q *t=
xq, struct sk_buff *skb,=0A=
 =0A=
 	addr =3D dma_map_single(&fep->pdev->dev, data, size, DMA_TO_DEVICE);=0A=
 	if (dma_mapping_error(&fep->pdev->dev, addr)) {=0A=
-		dev_kfree_skb_any(skb);=0A=
 		if (net_ratelimit())=0A=
 			netdev_err(ndev, "Tx DMA memory map failed\n");=0A=
-		return NETDEV_TX_OK;=0A=
+		return -ENOMEM;=0A=
 	}=0A=
 =0A=
 	bdp->cbd_datlen =3D cpu_to_fec16(size);=0A=
@@ -792,8 +791,11 @@ fec_enet_txq_put_hdr_tso(struct fec_enet_priv_tx_q *tx=
q,=0A=
 	unsigned int estatus =3D 0;=0A=
 =0A=
 	status =3D fec16_to_cpu(bdp->cbd_sc);=0A=
-	status &=3D ~BD_ENET_TX_STATS;=0A=
-	status |=3D (BD_ENET_TX_TC | BD_ENET_TX_READY);=0A=
+	status &=3D ~(BD_ENET_TX_STATS | BD_ENET_TX_READY);=0A=
+	status |=3D BD_ENET_TX_TC;=0A=
+	/* Keep the first descriptor unavailable until all mappings succeed. */=
=0A=
+	if (bdp !=3D txq->bd.cur)=0A=
+		status |=3D BD_ENET_TX_READY;=0A=
 =0A=
 	bufaddr =3D txq->tso_hdrs + index * TSO_HEADER_SIZE;=0A=
 	dmabuf =3D txq->tso_hdrs_dma + index * TSO_HEADER_SIZE;=0A=
@@ -808,10 +810,9 @@ fec_enet_txq_put_hdr_tso(struct fec_enet_priv_tx_q *tx=
q,=0A=
 		dmabuf =3D dma_map_single(&fep->pdev->dev, bufaddr,=0A=
 					hdr_len, DMA_TO_DEVICE);=0A=
 		if (dma_mapping_error(&fep->pdev->dev, dmabuf)) {=0A=
-			dev_kfree_skb_any(skb);=0A=
 			if (net_ratelimit())=0A=
 				netdev_err(ndev, "Tx DMA memory map failed\n");=0A=
-			return NETDEV_TX_OK;=0A=
+			return -ENOMEM;=0A=
 		}=0A=
 	}=0A=
 =0A=
@@ -901,6 +902,10 @@ static int fec_enet_txq_submit_tso(struct fec_enet_pri=
v_tx_q *txq,=0A=
 	txq->tx_buf[index].buf_p =3D skb;=0A=
 =0A=
 	skb_tx_timestamp(skb);=0A=
+	dma_wmb();=0A=
+	txq->bd.cur->cbd_sc |=3D cpu_to_fec16(BD_ENET_TX_READY);=0A=
+	/* Make the READY update visible before advancing the ring cursor. */=0A=
+	wmb();=0A=
 	txq->bd.cur =3D bdp;=0A=
 =0A=
 	/* Trigger transmission start */=0A=
@@ -922,7 +927,7 @@ static int fec_enet_txq_submit_tso(struct fec_enet_priv=
_tx_q *txq,=0A=
 					 DMA_TO_DEVICE);=0A=
 =0A=
 		/* Clear standard buffer descriptor fields */=0A=
-		tmp_bdp->cbd_sc =3D 0;=0A=
+		tmp_bdp->cbd_sc &=3D cpu_to_fec16(BD_ENET_TX_WRAP);=0A=
 		tmp_bdp->cbd_datlen =3D 0;=0A=
 		tmp_bdp->cbd_bufaddr =3D 0;=0A=
 =0A=
@@ -937,7 +942,7 @@ static int fec_enet_txq_submit_tso(struct fec_enet_priv=
_tx_q *txq,=0A=
 =0A=
 	dev_kfree_skb_any(skb);=0A=
 =0A=
-	return ret;=0A=
+	return NETDEV_TX_OK;=0A=
 }=0A=
 =0A=
 static netdev_tx_t=0A=
