Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795867532;
	b=pCOIHApVhyfg4brHeckPC3byRbQFFNLd7m87DPB5eS2Rrvn00aC4+fulwUblUso97TPV
	 ENIejaKSaY3WDsh4matmoKaQygZuVUXWiqOPDvI8C78SZPoeBvdJGwhLirJnb+CHkZ1rx
	 1uQDfn4IG3BLUEO+9Y3vz3QJfL3pEy8FbsqSdPxJuBzWP9vtt/ibnsTDMjRT2Q3oW6Nmo
	 wXWDdDQOO/mYkBupPQqb+i7Vgcx1fKhkRElZtCZiJ8N6YjYoa/Flvai8L30sBME0FTSsm
	 llyqPozEXtHdXt2EbuYzNaIX0Y9KPRdUFsUnio/l9EG/+/Rsn5kDbbwi2X+YJZBLARQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795867532;
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
	bh=9zI6SYi35CutzHC/D9GpimZI7G8JR8lro/mVzRI6blU=;
	b=cg2dqcDqvRHrtKTe3ESkd7NxHiYIlPCDaNksbushIV/rwqQE6Sid3Vi+mBnoMnXLgHPX
	 gh2YOW4vdah3uayvotbkKt6LnFqAPMClvYpCuRoDHzBmQwDAf0AeDiUcqNhZNjETg03ZT
	 5GLPprkWPPyBET86nqporkvC1jePYUcGowTZYIB6QwEMokz9Bcx1IWmVgZULHIUwDirk5
	 E6ab7vXFZsp+zuXjYWrhTUsJGqIalP1zCzxrtsz1DBzp4BB0R4kKJS6Il0FOMgFFyA3su
	 0ll56UE09kF0NPuFU3GyV9JaTtnSBHOoaFznMea4gi1w0+neBbeK9m9QBW7WQ27Oy4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.jp;
	spf=pass smtp.mailfrom=outlook.jp;
	dkim=pass header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b=CsKzX0hY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.24
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011024.outbound.protection.outlook.com [52.103.66.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFF9606A326
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 12:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFF9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b=CsKzX0hY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PklSF5WnmJciFjJqCc2EhTdfiC+oJWgyN/dgZiDfFyxJtlHbvrh2omGrKroytWPHlzKy0UqwvrIZtK0TStnkXGEJAa/jJSsXIH6MZ9cl5UdPYZWSq2QZ6vhTfrC5ugMG5lNQ8N8cRCHvEL2k7+aTqVXQFuusELljBqCd0v8YDLiYmZ3AnzN4HkuOX0U1KD1/TN8cNXnTZGdOAJgyVvAxngrDVnqy3vENgq4voh9CJBoTKQOLXopEea+RXtTq+USjMVKzjG9XSGIS/xxdzGZC/4pNjVGckkoFVgnwaBduUfKB8tygLhfe5rM9GFLOavWYgxunAt7JLWIGCLVLyDBf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zI6SYi35CutzHC/D9GpimZI7G8JR8lro/mVzRI6blU=;
 b=iGRqFJrSTh6YQ5SfOayKDr6WdQE/YTiX5oZeZMpEq3LWSL9e9lYjzehb5/SSgCE8FvF9gmnCMZVnJEjU1sdIYG/tLF2nY/g0IS79Zv77YY75F9gWO7UWT5VWs3apvdaEyiZbxs83vWtCD3vPk/FHKTJThJEc/qVETHaumO1D+G7YRgzBDL92s5pvYH7855delpzBKQhKa15/VAwLyz6k5tSg7gzKYcexOEZyv/snwke6gjxCDhajvZNB6p/WIc4xoi/ZOkX48CFBXwzghBEkrZM5D2qlKh2npt8ui4EuUmTjjT38ts40n/m5ESrwoQojmUXakGSUzBY7YQ6RJJ74Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.JP;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zI6SYi35CutzHC/D9GpimZI7G8JR8lro/mVzRI6blU=;
 b=CsKzX0hY6UpmEDSPPKFoHYyMiTm9hZfykvrOQ95n5q8E8OuknDFV67O6xshVHnQiBp6jaOUG5AAHcwEvpG8kLM0sBrEWeN/rj3O5hUEMj7LbGJmwDWOc/YHmxpKUyDjhKAseM2rSZHtTATifNhFMXDvxZKZOTTC6bVF+ebZPemJdAvfyth/hAckGkE8/vpHjzSsYQHzNhXd7BNdd3eDHu2DsHh1HKeCZGWF5NxEYR1wW1RDoJVgE+MmYmv9tJyCjtqRWl5JuwtP1+4CLuEiG4DEjdggp5fmpITMtyO9TCIHRJtCjuG18zY609GCYriq5xzmhZ6HaB4m1iCd/f29Uxg==
Received: from OS7PR01MB14363.jpnprd01.prod.outlook.com
 (2603:1096:604:388::11) by TY5PR01MB632019.jpnprd01.prod.outlook.com
 (2603:1096:403:52b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.11; Sat, 28 Nov
 2026 12:05:25 +0000
Received: from OS7PR01MB14363.jpnprd01.prod.outlook.com
 ([fe80::eeff:dfdb:bd3b:591b]) by OS7PR01MB14363.jpnprd01.prod.outlook.com
 ([fe80::eeff:dfdb:bd3b:591b%6]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 12:05:24 +0000
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
Subject: [PATCH net v2] net: fec: fix TSO DMA mapping failure handling
Thread-Topic: [PATCH net v2] net: fec: fix TSO DMA mapping failure handling
Thread-Index: AQHdfzDAT7jK1PE/AUOGnF4jhwfOTA==
Date: Sat, 28 Nov 2026 12:05:24 +0000
Message-ID: <20261128120520.20974-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14363:EE_|TY5PR01MB632019:EE_
x-ms-office365-filtering-correlation-id: 1df34837-6a70-4dca-ccbe-08df4d47e289
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|19110799012|8060799015|8062599012|31061999003|38102599003|25010399006|51005399006|25031999004|15080799012|5062599005|41001999006|10035399007|12091999003|1602099012|40105399003|102099032|440099028|3412199025|4302099013|26104999009|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VvfxUr4GPLFG1U2fa0DxxKiecksxfVKINrB8JVuCaFwRMpx0bFkF5cQbf3?=
 =?iso-8859-1?Q?BovyZ2zK/GmBGMoSLLUCbxtfjn6EwafWnqvJkheRdTfkoSGk9ICaYoifWE?=
 =?iso-8859-1?Q?sfxRqIyNepyJf3Y+VuEvXNqe40XTAWL7uXMYu5JT5qKxvf+R1fB5KmAlyF?=
 =?iso-8859-1?Q?gwMXNDh+tUvdyjdqChjWktHYhvCJKhxArCIuu53YKPQrLOlZEgQISVkFy8?=
 =?iso-8859-1?Q?6uVEEdiZtdmSHCtbBXHVmt39ITIcEZ9yVAhvV3bUvJHN40EjNC28LfMtpA?=
 =?iso-8859-1?Q?bu9f88U3C1Pf9XJt1VeMK77PHohpEXRXvpSPyNAIgTtvUME4J2FxOcUNeW?=
 =?iso-8859-1?Q?kW5t2vQp6CSfrLM+Wtyr8jeZ54IG3jGxO2IKCT0OdRbq56PvkkAETDQlyR?=
 =?iso-8859-1?Q?dXm1V1ah/jlnkBKHDwDHg9WU4KlFJUD9raRKMCIaH6eaPo4NV+bEPH8epi?=
 =?iso-8859-1?Q?gMZMlYJLxWeUA/53YeRmwtRxJVKFSENBBTSomtmfR5nY2Hsp+LreZZ6yNe?=
 =?iso-8859-1?Q?sXXY9O6qUd6sMMCXWAEHPT9tPR2ig25oQvMd6z7FT2AlG/O5QxvsJwiRyg?=
 =?iso-8859-1?Q?c7L2ffIGUGIFTefnpLnZQZTKfGn0bSM5JwCRFTO3A4/AdS54JXjPuB1O9I?=
 =?iso-8859-1?Q?H3NUwdCA625IjyUYIu4kMzP+NRv2TkhRXYYyR+WDZxg4KMi7OEdO3vOuCp?=
 =?iso-8859-1?Q?zppfoXT9TTdeIj9YLSHsDwUVPj5rlhj5/WhXroXANm3VmBskeqxMHK66eR?=
 =?iso-8859-1?Q?CKFiB82hRF11wPDXFqnBHzT/dV8BRFlLM1strfk1TrSlIXCX01MrR8HB1a?=
 =?iso-8859-1?Q?BUiX9hwaiNYnYNj0ldGpMiG8DY3A3oLpZPRzid32p+Dz8TYpxI/Fw/0dDj?=
 =?iso-8859-1?Q?fe67keo3al8Rpbs8OtBPFGVpOvgW16nV/YRDwVVVZ7uPQrI61DXz9/7xfL?=
 =?iso-8859-1?Q?yrqhUmpfteWWWXRQeveGceKK+Q0KHoxf5RK9U3p+qScRB7Qt6Sfbm8/lHv?=
 =?iso-8859-1?Q?3SvFq5PPYbCh1vj6gLXs3n0dZftumDqB0Yw56y9LN4LtxO2vWDPKw9dd73?=
 =?iso-8859-1?Q?0IIy5kyv1tL2c82+00j17i+qIq/8RyTjW0dvZBW+gPb7qPxqKdxTnbvjvq?=
 =?iso-8859-1?Q?bDMp99z+ywWspoWT3cLey4Mj0kbSkMO4lPib0FcOHgq8N9V6u6GiQQVhSM?=
 =?iso-8859-1?Q?p+dSkApVnJI3qc2AUjoxtNzmqW0IARdSPOQ=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+FMMGBShT8AIuB9Es0dr2IkC/rbvJvccjN5rgWRhOPMlYdjI97c2PRf6uE?=
 =?iso-8859-1?Q?B4YovQsi6gybixeAAXB2s21CwiV0RiJw6lprTRx0ZoPo7ZHHz2f7vKJHzT?=
 =?iso-8859-1?Q?ZwS4r+lTStlCL/is9kdZu7zE0OK5bHehXzgYv0HboNE1FUHBY6EDXhoPg0?=
 =?iso-8859-1?Q?A2QYQvIZazxMoifrApGtclyoFOjMT6tKd4Rt55OYGe/MATi+Ym2zqiv3xq?=
 =?iso-8859-1?Q?EXb5R8/IzDDyD+3Zi3NO1SVWrxyTmboqC/tUPFC1jMg2QY4/unbrN5n0T1?=
 =?iso-8859-1?Q?kraggYTrhwZ2bOG44wesw/ShH5QzN2ah2R8GEVGIflZX8GYwn/LmHdMxoJ?=
 =?iso-8859-1?Q?596vmwH9n2Lw7brB/V9gBBHwm+6dCOOmFO2pl47VRx/X6YYdzTKvDA855+?=
 =?iso-8859-1?Q?OQv28sIJnVfmuDfzMxySiwB4ZnBp09XvRdhRj1NakM+E5T4oPwHc1Son45?=
 =?iso-8859-1?Q?n999c57bu07yT9mkAjmSEDEojN7ause+L9WEJltsOhH4ceEYHmTc0c1J6L?=
 =?iso-8859-1?Q?vTixowz2igT4Vtp25FX/c66yb40Jj3MQT/UGukFW1kJA+F6BglKYDIMc0q?=
 =?iso-8859-1?Q?oGWZ+HaFVoKdmlT2iwp3L2AIQ+274hXvGnFnrtJzm2AqFAisXFXOTvIKZ6?=
 =?iso-8859-1?Q?xdaXTm1Cj7DJtRpCJUVINF9gs2gZetmjBZCP7RZ2U4ewyORRI92SsALQ3p?=
 =?iso-8859-1?Q?/C1NNmAfKti2s7qn2GM8QxddCv8W3TdPT76xja4ccld8nmQdQYMPFXm0+W?=
 =?iso-8859-1?Q?w/mlYEoSlWb6ZUjzXYCb/oKZM/IQJKPRE7J7yme+tMZFs+HkJzXgFj5WOh?=
 =?iso-8859-1?Q?LVuztEGxi43COGr9VEb79sJxL1lgnEQagCJGGMDUJP84jlfRdKDA5r9mXf?=
 =?iso-8859-1?Q?U2JKHG70lre2QZVnCQHuM8AX5TFTKgx2xE5DMA09MiJPafPDovu3P5unQN?=
 =?iso-8859-1?Q?PNDOqY+3k+fwRZz/GQXZAnXxGS4w/7SJKvquOBdP0En5gvB9/VuhEEryXV?=
 =?iso-8859-1?Q?Nb59UACyGzCHhj6fRdbBTCquJfa/GM/CILHW/IW5n4FUWtAAabGaFozNMI?=
 =?iso-8859-1?Q?GAI1bAG1+PzvtHTV8A+Dc0BrqswqvdgFlzEZAeK+SNGrzlfroTevEcBEQI?=
 =?iso-8859-1?Q?IxNij0ylcfCFF5yKEWQw05UxJs8zYD6s62obq+bS+dxH95o+RoIZWblgpQ?=
 =?iso-8859-1?Q?NdBKVH/vKPJvH+I7p3cuuWI1Y2jBqR8lvNPCbcHWrm5ns8rcr9EWOuk5yy?=
 =?iso-8859-1?Q?kpBoZ3rNV4Z/Gl6bW0B5471qxPbW+MzoV9dcVJqfYBcr/xFIsAq6HrapWo?=
 =?iso-8859-1?Q?jmSLGPrzyaKxxBSs0YE9qFxo61XpawA/X3+DhcBmvWDrL+hIl/BWEhTf1A?=
 =?iso-8859-1?Q?unZtfdWZmDCQCT6w0waajF7MhfJ5CFcIHgk8nvx3icecURRGg6nRA=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14363.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df34837-6a70-4dca-ccbe-08df4d47e289
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2026 12:05:24.7976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB632019

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
v2:=0A=
  - Use dma_wmb() after setting READY instead of wmb().=0A=
v1: https://lore.kernel.org/netdev/20261127033906.9561-1-tkdkei@outlook.jp/=
=0A=
=0A=
 drivers/net/ethernet/freescale/fec_main.c | 21 +++++++++++++--------=0A=
 1 file changed, 13 insertions(+), 8 deletions(-)=0A=
=0A=
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethern=
et/freescale/fec_main.c=0A=
index f7636f23d..2d1478a2b 100644=0A=
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
+	dma_wmb();=0A=
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
