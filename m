Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271F919342E
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364665; cv=fail; b=fN5foVv7C09t8mq8BJJoOatuiS4wCSJXKYXzixDB3mne8CL7xO53sePrDlK92FO5exSOZSSzzxHLJ4OqYBElkvgTPPF81CY2xnrMi4+/2D4ZiSvEqhAEngoAUvBmF6W3J8/TjevdPFE1nDc9YZBjTU370DCPe79xzsLjLq0uEQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364665; c=relaxed/simple;
	bh=9yyZaHbPOs43UpLnHQgYTIJUyKbBisxLyT6yg4qPdQE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lJuuvIciSoA7vf2Mwbt+n3RKfG3W/O2IV30Q0vpObWj12ZlZ77u7zMZhItk6jJ0IxGsXTYNGRHoGOEEczB1HGgkoPbOqgu8uxnD33IaPCPMJkWAkZf9Mf1RBdKmW14BSxXjN4qQ1RHkcfeYD8hi+9G5eKziKR6FdgTp1pB/GAFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nmqb480a; arc=fail smtp.client-ip=40.107.21.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nmqb480a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0kqro5A6jzyn8+IoIlqcEulvGRuwqVmO2J5CKSA9rVJpjKd3nSQILLlB6LynqU33N/PzsrtcH+XBNetTSIklO8SCOBeAmIxyYGPeaXcNN+6dEE8mSjk2nmEoMDfHVPZ8ngP64wQxvjmd2POuM4jp48mdwK6QKGRmVbQGgNG2+eAxDQOulpr3+sxW9xakBvCmKn4qloSazpA9tan1Kpm8FFHOo14fCkOTbFr3ZqjmW9TmyH31pL5e7XY//Qnw53MYK75RXF9qf/AuzCH/IS569omNT71vLia66bAxjRT8u9AIBoE/MiufREv9b3pJO7974pbYGhdQgCQ3bvcqZjHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYocorwad8Td4EHaaQmzzyHdeapumaMXBnmaXzo4VvI=;
 b=V/66gJtkTZzVaC6jmaO8vq7neFMWegrsdkK6FAg91d3hcsVeic7lCAI42IQ2pNbzLvTZLlB8ImjlEJIi6eyfpXkfx+SwqmH8/qxSnmjZp+NVpVeQ0XNyoK7G/u8WlImCwwTd857X7ZU6dhcBtFCQRaALDd5Cs4/AW2wN66x2Nz9EPJ6rxz3lxi0A3qyJmHlj8a4UDBFGn2+i2G9d2BMhmlgf8mo3y2a/52HBrmrqgj5Elfew+5Ix6AnushSDwfrk9NIPBgE8ba/GSLVk5EzxXDirvVGchqEXsWK4RvWhzXjmyyyHtFQ250Rs1HMdDSr8f4Uq6dJe0wH/BP197qE5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYocorwad8Td4EHaaQmzzyHdeapumaMXBnmaXzo4VvI=;
 b=nmqb480aA9ILDURwgee+PkI3uqtoDjfYdMrVn6Z+Fu2rbHlLZkOTRlYVhd2wg51XuWkWHe8v8qNj/znP+rA+IUui2vBnjdfGaLRgFJTsV6IIRYQTSglcQU55GfCo+e2mkYjeW25zCgrZ5Zf2LK286iDKehnzV/7Hd0wFM3N9oFoG5DQgFiHI4ihOWCZXDSfSCbiyG8ZCTym2zZlLX0mOwlCknSdIQMadFKJ0Uo14dUGNHHbw1xGjID8MrjfL7BMn83J0RZ3hL1JuERag9pYlaQm+gLVOLm6l8eZoNtsTyn1e724BLioWL5MrxAX/CrtMldxSrvyArWgXIGu5+ERFZw==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Mon, 20 Jan
 2025 09:17:39 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:17:39 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v11 6/7] firmware: imx: adds miscdev
Thread-Topic: [PATCH v11 6/7] firmware: imx: adds miscdev
Thread-Index: AQHbaxvynA+5ublf0kqhpqzuqzhM4rMfYhCg
Date: Mon, 20 Jan 2025 09:17:39 +0000
Message-ID:
 <AM9PR04MB86047E01EC69536B58F0099D95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250120-imx-se-if-v11-0-4d7d8f7f4b56@nxp.com>
 <20250120-imx-se-if-v11-6-4d7d8f7f4b56@nxp.com>
In-Reply-To: <20250120-imx-se-if-v11-6-4d7d8f7f4b56@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|VE1PR04MB7360:EE_
x-ms-office365-filtering-correlation-id: 00f3e339-aaa1-4772-cf15-08dd393349a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y3B4L1dqMFg5aGhKRTdhSW9VZjFaTVJ6SEdrdTNhYkJHZkJiSVY2VlVVb29x?=
 =?utf-8?B?eFY2SUZRSXk2Uk5lR2NzT3dkM2VlM2l4N3pTMFpMS3lMTEFEemdLL3c5Q2gv?=
 =?utf-8?B?aHd4c0RPSm1aVlJ0VmViVzlMa0ErT05QTEdLc0VyejI0SjJKMnpqUlFqUTNa?=
 =?utf-8?B?UGZ1SXJIYkh1bks3V1pWaHVoVUFiTkcwUUZrM0tETGx0dktmaUs0WmM2WUIy?=
 =?utf-8?B?blZkNXRNWXZsdFpnTUk4S2JzUUVxWm9nbko1NjI1Z21QaWZUV1pzeU80MGVB?=
 =?utf-8?B?LzBhSnNhbkExVmJrZi8wLzVqT29oUjFralRoVWhQclJCL0s5OGw3VWE4K0Mw?=
 =?utf-8?B?L0FSWFJpWFkveTNQMkxIajRsN0l5MU9rSnBZanBMdWlTWWQrWWZkdlgyQURz?=
 =?utf-8?B?d1IyQ25GTEx5TWxHdThxNjlPUHMvME9rS0o4Ym5OaXdQV1Rpc0tHNjJwUmNr?=
 =?utf-8?B?TDlJUFF4bzBSTnI1Nms0dWUxbHIyVUZkVE5kRWw5TXhkc09uNHVoRjhWNXFJ?=
 =?utf-8?B?UmFSSGl5ZUJHeVdjRExuMFZ5eG9VUmNMUzU5VnRzSWV4dHdad2NEaVhpcWt1?=
 =?utf-8?B?Y0NCNThJb2U4Qldma2daWGQ3QmkzZU02ZEtBL2drYjRvRy9DSTRDUFVjbGMw?=
 =?utf-8?B?MjNPMnpFYThGdnVLVmh3dWM5L0VtZEZjSmFCQlhXS1hCbFNPYmVwQ2xnQU5y?=
 =?utf-8?B?S2ZaN0gydGpyZzFiUTQ3QkoxdG1lSGZCSjFCdFUyZWJ4YXFvZXNUTXQ2UFh6?=
 =?utf-8?B?dEdML0JNZTZxZWx0OFBCdFVlbXZHU2pCNXc1T1phWEgzOG9IT2dZM1Z3MnR1?=
 =?utf-8?B?QU9RbTRyZ3hsR2xCbzZIMFRNNU5Ra2g0b29RQjdNcDU0VG1WNXoxYjBEeVEw?=
 =?utf-8?B?d2xHUUFVVGtudTBnZXVUK3Q0QnVGNm5jaGxuVXpaRlY1aDM4K1BoVWl4YlJz?=
 =?utf-8?B?SkFkajMyaEJCKzlMbWFGbGhwLzd6WTl1QlhpQW4zakdwdU9KYS9QdytIaFhE?=
 =?utf-8?B?UXIyWkE0M1FrVDlHOFJoc2lkY1ZyNFMraEZpeFZIYWFqQU5vdGloQ2lGUkpN?=
 =?utf-8?B?QzMyTGI5MlpZVmpaRE1RSWQrSVh6c0NjU3hVcVZaVTdRRkRWUWlOM29Dbjdy?=
 =?utf-8?B?VUFobjdBY0NSTTBrS1ZUZWpVKytoRGlXVWRXT2Q0NThlaEIxNE5mc1YwRTBQ?=
 =?utf-8?B?YW16dkNyclRrTmhudjFCUEhsU09YbHFaVERCZnFSeHFPK3RuN3ZMWWF3MUl4?=
 =?utf-8?B?MGRneXdrZFJDR1VxTnNLdmlCem9qR1F6S0Z0R1NyV1F6V2VPc0d4Q0YvSlRn?=
 =?utf-8?B?bWZ2UGQ1Zk1UV2FuWTNxZmpld0I5Zlp3c1VVaHBGUFVBZFNob01NUDIrZUZW?=
 =?utf-8?B?WFg1QlBKMVh3RFplZjBwelk0RmdWN0ZxU0tqVS9HbDhZaGY5U0pHbklCTnBX?=
 =?utf-8?B?SGdwL0F2NHQwZVNRS3lmUlpCRmtRa2VHN1M3amIxOFlaLzlVL1RFVG1yMkRu?=
 =?utf-8?B?bjFUZ1plYnhIWTRzY0ZybXN5SjBiWm5zU2hwYk91a2FlRnhTRUFtOS9Cejky?=
 =?utf-8?B?U1NLSk02QzBRb3M1cGkraGxBVnlzRkpITUlSMWRQTyt2Z0F1OHFrS0RJVmpD?=
 =?utf-8?B?azVZRWt2akJqZ3JEOGJJOGRIWXpNSUZEZjJPSlVpV3B0SzVLRVhTSWdPQkg0?=
 =?utf-8?B?YXNqRlAwanY3U0Z5SHRRaVRPTnFadFZhNUhKNmo1Y0JvdXZFcWtUcnhhNzZL?=
 =?utf-8?B?TW0zWUhtQ2pBMDVGbFI1VlNRc2h3dE1QUTlPWXJsdUF1aktOVFNDWTk4WnF6?=
 =?utf-8?B?c21tMjVFSVZtTzRsa3BhZXBpMzIrVUNIYU9NUytpV1ZNVFhJdjZpanZvUDQv?=
 =?utf-8?B?YWRsbURsNmhqVFlIOWo4ZStPOGljVU44THBLRkxuTFVQTy9RdmFMZjVORUg3?=
 =?utf-8?B?dHNWN1JuU3llVGIxUi9MRU1rbyt0RWY2U3hyRk1maHpiQlZReVh4VW52RFVM?=
 =?utf-8?B?ejJYcG5NbHpBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QVdOeWx6TVl1T3VlMTBRUUdVWTRjb0VvdGw3STFSZ2xpSXVtYXNqQWVUTlVS?=
 =?utf-8?B?VXFXdytkZDB6dFJaVGNMV2NURVFxTHdRUzBPV1RwUVRxV05TWXdXU0MyZ05o?=
 =?utf-8?B?S1hGMHJwT1BUOVV6OFM3enFZK2lZdkVuWVI4WkVTNkllREZiWnlrcWY0UU1v?=
 =?utf-8?B?UHRTK1VvYnoxUDRMN0RLV2Zqc1FVVFVIU2JxOGpSblJpRjUrUm5yUThyRXEr?=
 =?utf-8?B?QktWYnVvc0Y1TkVKWXJpYmMyc0ZjTGtHYjh2azBPUFJUczZtUlkzRnRsazUv?=
 =?utf-8?B?Q3FhRzJFbUVXeGtod0xsekxzVnVubkJndUhpbjdZVzVDczJjc0FNdkR4eDZx?=
 =?utf-8?B?WEtNTjd3MXVlVWhxS3pGQWhsei94SHk1MFJkRlNTN0JWMDZSMEpWUWZwN2tk?=
 =?utf-8?B?UXhFWDdXZytVbjcwTXppajZOcmpGWmFab2tHbFNsMjBGUm1Tb2JMWFhLalRa?=
 =?utf-8?B?LzVjWkpPQUc4OWdBdFpwYjZMbG5Wd2NzUWtFekpvaGJRSi90QWY0YXcwUEJY?=
 =?utf-8?B?QmdrTmg4M09ETW1DWXRjcDRHb2ZtUlhlQVBvUzBXVjQzdGZianFYN0xjdlNz?=
 =?utf-8?B?Y2Z0SWt1SmQ4N205V09namMwU2UwT1JRZGNqVVY0Y3dKSEdvbVY5S3hOYkVt?=
 =?utf-8?B?VEsrUHJGZW1xSDN1T1RXbVVFcDZjL1gxbEhyaGJFV1MzdFhFUGVEb0g3bnhp?=
 =?utf-8?B?WUNVN1Q0NWs0Y3RaVU5oTk1iUEdUYlRoV1FMWjRydmtscHExTkUvWlFKdm16?=
 =?utf-8?B?MnNHVG5KZzg5TE9sQW1BdDVzV1lva3QrK2VHbjh5UldLUFhiQm5iMU9UanVF?=
 =?utf-8?B?Y3JYNlo3VGVkTG9yRXBHb1RIQU9MK1hzOURENFJJZnlRZWNNaytreG1EYk1P?=
 =?utf-8?B?SGFzUUlXWmNUZU4ySFdFR1doRXpZZGtkenl5OGxyZVNsaUwzN3JUUUpQeXZZ?=
 =?utf-8?B?TWdNWUlPdHhLRDAwMW53dG9YeDNLTitPelZtL09PNWowb2xzbzBObUJ0VkpU?=
 =?utf-8?B?NnhTS3hUNENGdm1IcWdZd2xBNHNXK1g4ZUVUeDJjYU9lekcvTnBmQnJLeU1I?=
 =?utf-8?B?TU1mREREOHpReHhFeFcxelhyQ0Q5TWEyMWhHTU1XSy84QXE3cXc1YXBxSFpv?=
 =?utf-8?B?OWpqeGV1VXdqUDdZR3F2Z1MyN3dVelh3blROdzNGOXFXK1RLa3NRMW9lNU4y?=
 =?utf-8?B?L3ZSQ1NURE5rY3hNN1pPS1NWSnJlVmNVejA3b2tna203TEx5TVo1VFhCWDNK?=
 =?utf-8?B?OHg1N0ZvMS8yK3F5SlR1WmVyRklhMmFvb3lXUHdkQzgxcXhZSGVyRFhjU2Jr?=
 =?utf-8?B?VmlFRmJmRVdMeTd3aWdvSDhwV1Nsbk53SzFtVDBwM0RPelJpdG9mUG5LSzYy?=
 =?utf-8?B?K05jVlhqd0VQNXZ6aWZMWEIrVmN1R2J2dXprMlZIcXY4akZLZjMwUkU3VFBa?=
 =?utf-8?B?Nnk4V3ZlSXpjRk4zSlJYMnZGaVQ2MDQva0pMUHZSRDhXeG0vZ1lUQXl5cWFB?=
 =?utf-8?B?cnlXdzRTSExjc2Y1K1dVV3laTTd0VHJXWlNENzNDN1dCcnp1S0Q3NzR0NTd6?=
 =?utf-8?B?TGs0UmhvcWhybU5iTFR1OXhBZ3F5VXo4cnNlWDJhK0h4TUtlZ1ZJbE5mMzJG?=
 =?utf-8?B?bXVDQXBsZk96dHhGTldiUFpEY2YvNmgrYzdIK0s0Z09RM3dSNkl3dG1yUjFz?=
 =?utf-8?B?bnJRR3lHM2RXYU4zZ0Rvc1BqQXFacGVOemhmN2p0TmZ4dmw1dzArQXlCRXA1?=
 =?utf-8?B?aW1CRkRFdHRRdkg0RDZFZyswYkswMmxuV1NRNS9lNWNKL0Z2OU1qVjl2WUgx?=
 =?utf-8?B?SERwK21jQ3hkbG4wdVNrR3BkN2FWSklsUEpNOGZnL3NwemdJcm5JM1lzdU9R?=
 =?utf-8?B?RG1qdXU3VlNaQmx1RngvaU4vSExXSm52d05vRzlhTUJSWlU5UVJkQzVGME1H?=
 =?utf-8?B?SndEWWFNOXQycm5Xd2U4NXhsYnhQQlFPQnNSQVJaRFRhUm5GMmExbnpzV1Ey?=
 =?utf-8?B?L1Q4VnNyakdLZ2lBaW00VjNtRG5Ed1BrYkdmRzlDMjZ4L1doOW1uazdQM3RM?=
 =?utf-8?B?TzRKY2NkOTl3KzRTU0dTWDZ5dGRxcTJKd1AzMWhNY3ZPSmdYNTdrdW8xM0dO?=
 =?utf-8?Q?I0f3PihwKTFv0Um/yD1Ty5sAT?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0425_01DB6B4A.3F5EA200"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f3e339-aaa1-4772-cf15-08dd393349a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:17:39.8260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oJYVtq+6qbqdhhukCQ139cadKH3YoX5keS6brxZ1ezY1fQDqjscrn4c0Wmg6G5B4cfVmEsSDo/9n746iuXyaXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

------=_NextPart_000_0425_01DB6B4A.3F5EA200
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

Ran "b4 send --reflect"
But it sent to all.
Please ignore.

-----Original Message-----
From: Pankaj Gupta
Sent: Monday, January 20, 2025 2:46 PM
To: Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof 
Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn Guo 
<shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix 
Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; 
Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; 
devicetree@vger.kernel.org; imx@lists.linux.dev; 
linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 6/7] firmware: imx: adds miscdev

Adds the driver for communication interface to secure-enclave, for exchanging 
messages with NXP secure enclave HW IP(s) like EdgeLock Enclave from:
- User-Space Applications via character driver.

ABI documentation for the NXP secure-enclave driver.

User-space library using this driver:
- i.MX Secure Enclave library:
  -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
- i.MX Secure Middle-Ware:
  -- URL: https://github.com/nxp-imx/imx-smw.git

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 Documentation/ABI/testing/se-cdev   |  43 ++
 drivers/firmware/imx/ele_base_msg.c |   8 +-
 drivers/firmware/imx/ele_common.c   |  85 ++--
 drivers/firmware/imx/ele_common.h   |   6 +-
 drivers/firmware/imx/se_ctrl.c      | 790 
+++++++++++++++++++++++++++++++++++-
 drivers/firmware/imx/se_ctrl.h      |  42 ++
 include/uapi/linux/se_ioctl.h       | 101 +++++
 7 files changed, 1040 insertions(+), 35 deletions(-)

diff --git a/Documentation/ABI/testing/se-cdev 
b/Documentation/ABI/testing/se-cdev
new file mode 100644
index 000000000000..3451c909ccc4
--- /dev/null
+++ b/Documentation/ABI/testing/se-cdev
@@ -0,0 +1,43 @@
+What:		/dev/<se>_mu[0-9]+_ch[0-9]+
+Date:		May 2024
+KernelVersion:	6.8
+Contact:	linux-imx@nxp.com, pankaj.gupta@nxp.com
+Description:
+		NXP offers multiple hardware IP(s) for secure enclaves like EdgeLock-
+		Enclave(ELE), SECO. The character device file descriptors
+		/dev/<se>_mu*_ch* are the interface between userspace NXP's secure-
+		enclave shared library and the kernel driver.
+
+		The ioctl(2)-based ABI is defined and documented in
+		[include]<linux/firmware/imx/ele_mu_ioctl.h>.
+		ioctl(s) are used primarily for:
+			- shared memory management
+			- allocation of I/O buffers
+			- getting mu info
+			- setting a dev-ctx as receiver to receive all the commands from FW
+			- getting SoC info
+			- send command and receive command response
+
+		The following file operations are supported:
+
+		open(2)
+		  Currently the only useful flags are O_RDWR.
+
+		read(2)
+		  Every read() from the opened character device context is waiting on
+		  wait_event_interruptible, that gets set by the registered mailbox 
callback
+		  function, indicating a message received from the firmware on message-
+		  unit.
+
+		write(2)
+		  Every write() to the opened character device context needs to acquire
+		  mailbox_lock before sending message on to the message unit.
+
+		close(2)
+		  Stops and frees up the I/O contexts that were associated
+		  with the file descriptor.
+
+Users:		https://github.com/nxp-imx/imx-secure-enclave.git,
+		https://github.com/nxp-imx/imx-smw.git
+		crypto/skcipher,
+		drivers/nvmem/imx-ocotp-ele.c
diff --git a/drivers/firmware/imx/ele_base_msg.c 
b/drivers/firmware/imx/ele_base_msg.c
index aa00e95d6aee..ff9a39530fa9 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -67,7 +67,7 @@ int ele_get_info(struct se_if_priv *priv, struct 
ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_GET_INFO_REQ_MSG_SZ,
 			       rx_msg,
@@ -139,7 +139,7 @@ int ele_ping(struct se_if_priv *priv)
 		goto exit;
 	}

-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_PING_REQ_SZ,
 			       rx_msg,
@@ -194,7 +194,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	tx_msg->data[3] = lower_32_bits(addr);
 	tx_msg->data[4] = se_add_msg_crc((uint32_t *)&tx_msg[0],
 						 ELE_SERVICE_SWAP_REQ_MSG_SZ);
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg,
@@ -255,7 +255,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, 
phys_addr_t addr)
 	tx_msg->data[0] = lower_32_bits(addr);
 	tx_msg->data[2] = addr;

-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_FW_AUTH_REQ_SZ,
 			       rx_msg,
diff --git a/drivers/firmware/imx/ele_common.c 
b/drivers/firmware/imx/ele_common.c
index 923eaa90cdd4..acabbccf3e36 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -18,38 +18,62 @@ u32 se_add_msg_crc(u32 *msg, u32 msg_len)
 	return crc;
 }

-int ele_msg_rcv(struct se_if_priv *priv,
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx,
 		struct se_clbk_handle *se_clbk_hdl)
 {
-	int err = 0;
+	struct se_if_priv *priv = dev_ctx->priv;
+	bool wait_timeout_enabled = true;
+	unsigned int wait;
+	int err;

 	do {
-		/* If callback is executed before entrying to wait state,
-		 * it will immediately come out after entering the wait state,
-		 * but completion_done(&se_clbk_hdl->done), will return false
-		 * after exiting the wait state, with err = 0.
-		 */
-		err = wait_for_completion_interruptible(&se_clbk_hdl->done);
+		if (priv->cmd_receiver_clbk_hdl.dev_ctx == dev_ctx) {
+			/* For NVM-D that are slaves of SE-FW, are waiting indefinitly
+			 * to receive the command from SE-FW.
+			 */
+			wait_timeout_enabled = false;
+
+			/* If callback is executed before entrying to wait state,
+			 * it will immediately come out after entering the wait state,
+			 * but completion_done(&se_clbk_hdl->done), will return false
+			 * after exiting the wait state, with err = 0.
+			 */
+			err = wait_for_completion_interruptible(&se_clbk_hdl->done);
+		} else {
+			/* FW must send the message response to application in a finite
+			 * time.
+			 */
+			wait = msecs_to_jiffies(10000);
+			err = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, wait);
+		}
 		if (err == -ERESTARTSYS) {
-			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
+			if (priv->waiting_rsp_clbk_hdl.dev_ctx) {
 				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
 				continue;
 			}
-			dev_err(priv->dev,
-				"Err[0x%x]:Interrupted by signal.\n",
-				err);
 			err = -EINTR;
 			break;
 		}
-	} while (err != 0);
+		if (err == 0) {
+			if (wait_timeout_enabled) {
+				err = -ETIMEDOUT;
+				dev_err(priv->dev,
+					"Fatal Error: SE interface: %s%d, hangs indefinitely.\n",
+					get_se_if_name(priv->if_defs->se_if_type),
+					priv->if_defs->se_instance_id);
+			}
+			break;
+		}
+	} while (err < 0);

-	return err ? err : se_clbk_hdl->rx_msg_sz;
+	return (err >= 0) ? se_clbk_hdl->rx_msg_sz : err;
 }

-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	struct se_msg_hdr *header;
 	int err;

@@ -62,7 +86,8 @@ int ele_msg_send(struct se_if_priv *priv,
 	if (header->size << 2 != tx_msg_sz) {
 		err = -EINVAL;
 		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			dev_ctx->devname,
 			*(u32 *)header,
 			header->size << 2, tx_msg_sz);
 		goto exit;
@@ -70,7 +95,9 @@ int ele_msg_send(struct se_if_priv *priv,

 	err = mbox_send_message(priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(priv->dev,
+			"%s: Error: mbox_send_message failure.",
+			dev_ctx->devname);
 		return err;
 	}
 	err = tx_msg_sz;
@@ -80,32 +107,36 @@ int ele_msg_send(struct se_if_priv *priv,  }

 /* API used for send/receive blocking call. */ -int ele_msg_send_rcv(struct 
se_if_priv *priv,
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx,
 		     void *tx_msg,
 		     int tx_msg_sz,
 		     void *rx_msg,
 		     int exp_rx_msg_sz)
 {
 	int err;
+	struct se_if_priv *priv = dev_ctx->priv;

 	guard(mutex)(&priv->se_if_cmd_lock);

+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;

-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0)
 		goto exit;

-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);

 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		err = -EINTR;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
 		dev_err(priv->dev,
-			"Err[0x%x]:Interrupted by signal.\n",
+			"%s: Err[0x%x]:Interrupted by signal.\n",
+			dev_ctx->devname,
 			err);
 	}
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;

 exit:
 	return err;
@@ -152,7 +183,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void 
*msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		dev_dbg(dev,
-			"Selecting cmd receiver for mesg header:0x%x.",
+			"Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,
 			*(u32 *) header);

 		/* Pre-allocated buffer of MAX_NVM_MSG_LEN @@ -161,7 +193,8 @@ void 
se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 */
 		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname,
 				*(u32 *) header,
 				rx_msg_sz, se_clbk_hdl->rx_msg_sz);

@@ -172,13 +205,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void 
*msg)
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
 		dev_dbg(dev,
-			"Selecting resp waiter for mesg header:0x%x.",
+			"Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,
 			*(u32 *) header);

 		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz
 				&& !exception_for_size(priv, header)) {
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname,
 				*(u32 *) header,
 				rx_msg_sz, se_clbk_hdl->rx_msg_sz);

diff --git a/drivers/firmware/imx/ele_common.h 
b/drivers/firmware/imx/ele_common.h
index 3d8b6f83fb9d..9bded800c103 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -14,12 +14,12 @@
 #define IMX_ELE_FW_DIR                 "imx/ele/"

 uint32_t se_add_msg_crc(uint32_t *msg, uint32_t msg_len); -int 
ele_msg_rcv(struct se_if_priv *priv,
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx,
 		struct se_clbk_handle *se_clbk_hdl);
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz);
-int ele_msg_send_rcv(struct se_if_priv *priv,
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx,
 		     void *tx_msg,
 		     int tx_msg_sz,
 		     void *rx_msg,
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c 
index 7f6b9199e6ac..b597ad0398f6 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
+#include <uapi/linux/se_ioctl.h>

 #include "ele_base_msg.h"
 #include "ele_common.h"
@@ -31,8 +32,6 @@
 #define MAX_SOC_INFO_DATA_SZ		256
 #define MBOX_TX_NAME			"tx"
 #define MBOX_RX_NAME			"rx"
-#define SE_TYPE_STR_HSM			"hsm"
-#define SE_TYPE_ID_HSM			0x2

 struct se_fw_img_name {
 	const u8 *prim_fw_nm_in_rfs;
@@ -140,6 +139,24 @@ static const struct of_device_id se_match[] = {
 	{},
 };

+char *get_se_if_name(u8 se_if_id)
+{
+	switch (se_if_id) {
+	case SE_TYPE_ID_DBG: return SE_TYPE_STR_DBG;
+	case SE_TYPE_ID_HSM: return SE_TYPE_STR_HSM;
+	}
+
+	return NULL;
+}
+
+static uint32_t get_se_soc_id(struct se_if_priv *priv) {
+        const struct se_if_node_info_list *info_list
+                        = device_get_match_data(priv->dev);
+
+        return info_list->soc_id;
+}
+
 static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv) 
{
 	return &var_se_info.load_fw;
@@ -289,6 +306,756 @@ static int se_load_firmware(struct se_if_priv *priv)
 	return ret;
 }

+static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx) {
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = 
&dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
+
+	/*
+	 * Allocate some memory for data exchanges with S40x.
+	 * This will be used for data not requiring secure memory.
+	 */
+	se_shared_mem_mgmt->non_secure_mem.ptr
+			= dma_alloc_coherent(priv->dev,
+					     MAX_DATA_SIZE_PER_USER,
+					     &se_shared_mem_mgmt->non_secure_mem.dma_addr,
+					     GFP_KERNEL);
+	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
+		return -ENOMEM;
+
+	se_shared_mem_mgmt->non_secure_mem.size = MAX_DATA_SIZE_PER_USER;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+
+	return 0;
+}
+
+static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx) {
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = 
&dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	/* Unmap secure memory shared buffer. */
+	if (se_shared_mem_mgmt->secure_mem.ptr)
+		devm_iounmap(priv->dev,
+				(void __iomem *)se_shared_mem_mgmt->secure_mem.ptr);
+
+	se_shared_mem_mgmt->secure_mem.ptr = NULL;
+	se_shared_mem_mgmt->secure_mem.dma_addr = 0;
+	se_shared_mem_mgmt->secure_mem.size = 0;
+	se_shared_mem_mgmt->secure_mem.pos = 0;
+
+	/* Free non-secure shared buffer. */
+	dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+			  se_shared_mem_mgmt->non_secure_mem.ptr,
+			  se_shared_mem_mgmt->non_secure_mem.dma_addr);
+
+	se_shared_mem_mgmt->non_secure_mem.ptr = NULL;
+	se_shared_mem_mgmt->non_secure_mem.dma_addr = 0;
+	se_shared_mem_mgmt->non_secure_mem.size = 0;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0; }
+
+/* Need to copy the output data to user-device context.
+ */
+static int se_dev_ctx_cpy_out_data(struct se_if_device_ctx *dev_ctx) {
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = 
&dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_buf_desc *b_desc, *temp;
+	bool do_cpy = true;
+
+	list_for_each_entry_safe(b_desc, temp, &se_shared_mem_mgmt->pending_out, 
link) {
+		if (b_desc->usr_buf_ptr && b_desc->shared_buf_ptr && do_cpy) {
+
+			dev_dbg(priv->dev,
+				"Copying output data to user.");
+			if (do_cpy && copy_to_user(b_desc->usr_buf_ptr,
+					 b_desc->shared_buf_ptr,
+					 b_desc->size)) {
+				dev_err(priv->dev,
+					"Failure copying output data to user.");
+				do_cpy = false;
+			}
+		}
+
+		if (b_desc->shared_buf_ptr)
+			memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+		list_del(&b_desc->link);
+		kfree(b_desc);
+	}
+
+	return do_cpy ? 0 : -EFAULT;
+}
+
+/*
+ * Clean the used Shared Memory space,
+ * whether its Input Data copied from user buffers, or
+ * Data received from FW.
+ */
+static void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx
+*dev_ctx) {
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = 
&dev_ctx->se_shared_mem_mgmt;
+	struct list_head *pending_lists[] = {&se_shared_mem_mgmt->pending_in,
+						&se_shared_mem_mgmt->pending_out};
+	struct se_buf_desc *b_desc, *temp;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		list_for_each_entry_safe(b_desc, temp,
+					 pending_lists[i], link) {
+
+			if (b_desc->shared_buf_ptr)
+				memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+			list_del(&b_desc->link);
+			kfree(b_desc);
+		}
+	}
+	se_shared_mem_mgmt->secure_mem.pos = 0;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0; }
+
+static int add_b_desc_to_pending_list(void *shared_ptr_with_pos,
+			       struct se_ioctl_setup_iobuf *io,
+			       struct se_if_device_ctx *dev_ctx) {
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = 
&dev_ctx->se_shared_mem_mgmt;
+	struct se_buf_desc *b_desc = NULL;
+
+	b_desc = kzalloc(sizeof(*b_desc), GFP_KERNEL);
+	if (!b_desc)
+		return -ENOMEM;
+
+	b_desc->shared_buf_ptr = shared_ptr_with_pos;
+	b_desc->usr_buf_ptr = io->user_buf;
+	b_desc->size = io->length;
+
+	if (io->flags & SE_IO_BUF_FLAGS_IS_INPUT) {
+		/*
+		 * buffer is input:
+		 * add an entry in the "pending input buffers" list so
+		 * that copied data can be cleaned from shared memory
+		 * later.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_in);
+	} else {
+		/*
+		 * buffer is output:
+		 * add an entry in the "pending out buffers" list so data
+		 * can be copied to user space when receiving Secure-Enclave
+		 * response.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_out);
+	}
+
+	return 0;
+}
+
+/* interface for managed res to unregister a character device */ static
+void if_misc_deregister(void *miscdevice) {
+	misc_deregister(miscdevice);
+}
+
+static int init_device_context(struct se_if_priv *priv, int ch_id,
+			struct se_if_device_ctx **new_dev_ctx,
+			const struct file_operations *se_if_fops) {
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	if (ch_id)
+		dev_ctx = kzalloc(sizeof(*dev_ctx), GFP_KERNEL);
+	else
+		dev_ctx = devm_kzalloc(priv->dev, sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx) {
+		ret = -ENOMEM;
+		return ret;
+	}
+
+	dev_ctx->priv = priv;
+
+	if (ch_id)
+		dev_ctx->devname = kasprintf(GFP_KERNEL, "%s%d_ch%d",
+					     get_se_if_name(priv->if_defs->se_if_type),
+					     priv->if_defs->se_instance_id,
+					     ch_id);
+	else
+		dev_ctx->devname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s%d_ch%d",
+					     get_se_if_name(priv->if_defs->se_if_type),
+					     priv->if_defs->se_instance_id,
+					     ch_id);
+	if (!dev_ctx->devname) {
+		ret = -ENOMEM;
+		if (ch_id)
+			kfree(dev_ctx);
+
+		return ret;
+	}
+
+	mutex_init(&dev_ctx->fops_lock);
+
+	*new_dev_ctx = dev_ctx;
+
+	if (ch_id) {
+		list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
+		priv->active_devctx_count++;
+
+		ret = init_se_shared_mem(dev_ctx);
+		if (ret < 0) {
+			kfree(dev_ctx->devname);
+			kfree(dev_ctx);
+			*new_dev_ctx = NULL;
+			return ret;
+		}
+
+		return ret;
+	}
+
+	/* Only for ch_id = 0:
+	 * - register the misc device.
+	 * - add action
+	 */
+	dev_ctx->miscdev = devm_kzalloc(priv->dev, sizeof(*dev_ctx->miscdev), 
GFP_KERNEL);
+	if (!dev_ctx->miscdev) {
+		ret = -ENOMEM;
+		*new_dev_ctx = NULL;
+		return ret;
+	}
+
+	dev_ctx->miscdev->name = dev_ctx->devname;
+	dev_ctx->miscdev->minor = MISC_DYNAMIC_MINOR;
+	dev_ctx->miscdev->fops = se_if_fops;
+	dev_ctx->miscdev->parent = priv->dev;
+	ret = misc_register(dev_ctx->miscdev);
+	if (ret) {
+		dev_err(priv->dev, "failed to register misc device %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = devm_add_action(priv->dev, if_misc_deregister,
+			      dev_ctx->miscdev);
+	if (ret) {
+		dev_err(priv->dev,
+			"failed[%d] to add action to the misc-dev\n",
+			ret);
+		misc_deregister(dev_ctx->miscdev);
+	}
+
+	return ret;
+}
+
+static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
+					    u64 arg)
+{
+	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int err = 0;
+
+	if (copy_from_user(&cmd_snd_rcv_rsp_info, (u8 __user *)arg,
+			   sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev,
+			"%s: Failed to copy cmd_snd_rcv_rsp_info from user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+
+	if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ) {
+		dev_err(priv->dev,
+			"%s: User buffer too small(%d < %d)\n",
+			dev_ctx->devname,
+			cmd_snd_rcv_rsp_info.tx_buf_sz,
+			SE_MU_HDR_SZ);
+		err = -ENOSPC;
+		goto exit;
+	}
+
+	rx_msg = kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
+	if (!rx_msg) {
+		err = -ENOMEM;
+		goto exit;
+	}
+
+	tx_msg = memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
+			     cmd_snd_rcv_rsp_info.tx_buf_sz);
+	if (IS_ERR(tx_msg)) {
+		err = PTR_ERR(tx_msg);
+		goto exit;
+	}
+
+	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
+		err = -EINVAL;
+		goto exit;
+	}
+
+	if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
+		!get_load_fw_instance(priv)->is_fw_loaded) {
+		err = se_load_firmware(priv);
+		if (err) {
+			dev_err(priv->dev, "Could not send the message as FW is not loaded.");
+			err = -EPERM;
+			goto exit;
+		}
+	}
+	err = ele_msg_send_rcv(dev_ctx,
+			       tx_msg,
+			       cmd_snd_rcv_rsp_info.tx_buf_sz,
+			       rx_msg,
+			       cmd_snd_rcv_rsp_info.rx_buf_sz);
+	if (err < 0)
+		goto exit;
+
+	dev_dbg(priv->dev,
+		"%s: %s %s\n",
+		dev_ctx->devname,
+		__func__,
+		"message received, start transmit to user");
+
+	/* We may need to copy the output data to user before
+	 * delivering the completion message.
+	 */
+	err = se_dev_ctx_cpy_out_data(dev_ctx);
+	if (err < 0)
+		goto exit;
+
+	/* Copy data from the buffer */
+	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
+			     rx_msg,
+			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
+
+	if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
+			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
+		dev_err(priv->dev,
+			"%s: Failed to copy to user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+exit:
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	if (copy_to_user((void __user *)arg, &cmd_snd_rcv_rsp_info,
+			 sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev,
+			"%s: Failed to copy cmd_snd_rcv_rsp_info from user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+static int se_ioctl_get_mu_info(struct se_if_device_ctx *dev_ctx,
+				u64 arg)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_if_node_info *info;
+	struct se_ioctl_get_if_info if_info;
+	int err = 0;
+
+	info = container_of(priv->if_defs, typeof(*info), if_defs);
+
+	if_info.se_if_id = 0;
+	if_info.interrupt_idx = 0;
+	if_info.tz = 0;
+	if_info.did = info->se_if_did;
+	if_info.cmd_tag = priv->if_defs->cmd_tag;
+	if_info.rsp_tag = priv->if_defs->rsp_tag;
+	if_info.success_tag = priv->if_defs->success_tag;
+	if_info.base_api_ver = priv->if_defs->base_api_ver;
+	if_info.fw_api_ver = priv->if_defs->fw_api_ver;
+
+	dev_dbg(priv->dev,
+		"%s: info [se_if_id: %d, irq_idx: %d, tz: 0x%x, did: 0x%x]\n",
+			dev_ctx->devname,
+			if_info.se_if_id, if_info.interrupt_idx,
+			if_info.tz, if_info.did);
+
+	if (copy_to_user((u8 __user *)arg, &if_info, sizeof(if_info))) {
+		dev_err(priv->dev,
+			"%s: Failed to copy mu info to user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+
+exit:
+	return err;
+}
+
+/*
+ * Copy a buffer of data to/from the user and return the address to use
+in
+ * messages
+ */
+static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
+					u64 arg)
+{
+	struct se_shared_mem *shared_mem = NULL;
+	struct se_ioctl_setup_iobuf io = {0};
+	int err = 0;
+	u32 pos;
+
+	if (copy_from_user(&io, (u8 __user *)arg, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev,
+			"%s: Failed copy iobuf config from user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+
+	dev_dbg(dev_ctx->priv->dev,
+		"%s: io [buf: %p(%d) flag: %x]\n",
+		dev_ctx->devname,
+		io.user_buf, io.length, io.flags);
+
+	if (io.length == 0 || !io.user_buf) {
+		/*
+		 * Accept NULL pointers since some buffers are optional
+		 * in FW commands. In this case we should return 0 as
+		 * pointer to be embedded into the message.
+		 * Skip all data copy part of code below.
+		 */
+		io.ele_addr = 0;
+		goto copy;
+	}
+
+	/* No specific requirement for this buffer. */
+	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
+
+	/* Check there is enough space in the shared memory. */
+	dev_dbg(dev_ctx->priv->dev,
+		"%s: req_size = %d, max_size= %d, curr_pos = %d",
+		dev_ctx->devname,
+		round_up(io.length, 8u),
+		shared_mem->size, shared_mem->pos);
+
+	if (shared_mem->size < shared_mem->pos ||
+		round_up(io.length, 8u) > (shared_mem->size - shared_mem->pos)) {
+		dev_err(dev_ctx->priv->dev,
+			"%s: Not enough space in shared memory\n",
+			dev_ctx->devname);
+		err = -ENOMEM;
+		goto exit;
+	}
+
+	/* Allocate space in shared memory. 8 bytes aligned. */
+	pos = shared_mem->pos;
+	shared_mem->pos += round_up(io.length, 8u);
+	io.ele_addr = (u64)shared_mem->dma_addr + pos;
+
+	memset(shared_mem->ptr + pos, 0, io.length);
+	if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
+	    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
+		/*
+		 * buffer is input:
+		 * copy data from user space to this allocated buffer.
+		 */
+		if (copy_from_user(shared_mem->ptr + pos, io.user_buf,
+				   io.length)) {
+			dev_err(dev_ctx->priv->dev,
+				"%s: Failed copy data to shared memory\n",
+				dev_ctx->devname);
+			err = -EFAULT;
+			goto exit;
+		}
+	}
+
+	err = add_b_desc_to_pending_list(shared_mem->ptr + pos,
+					 &io,
+					 dev_ctx);
+	if (err < 0)
+		dev_err(dev_ctx->priv->dev,
+			"%s: Failed to allocate/link b_desc.",
+			dev_ctx->devname);
+
+copy:
+	/* Provide the EdgeLock Enclave address to user space only if success.*/
+	if (copy_to_user((u8 __user *)arg, &io, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev,
+			"%s: Failed to copy iobuff setup to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+exit:
+	return err;
+}
+
+/* IOCTL to provide SoC information */
+static int se_ioctl_get_se_soc_info_handler(struct se_if_device_ctx *dev_ctx,
+					     u64 arg)
+{
+	struct se_ioctl_get_soc_info soc_info;
+	int err = -EINVAL;
+
+	soc_info.soc_id = get_se_soc_id(dev_ctx->priv);
+	soc_info.soc_rev = var_se_info.soc_rev;
+
+	err = (int)copy_to_user((u8 __user *)arg, (u8 *)(&soc_info), 
sizeof(soc_info));
+	if (err) {
+		dev_err(dev_ctx->priv->dev,
+			"%s: Failed to copy soc info to user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+
+exit:
+	return err;
+}
+
+/*
+ * File operations for user-space
+ */
+
+/* Write a message to the MU. */
+static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
+				size_t size, loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err;
+
+	dev_dbg(priv->dev,
+		"%s: write from buf (%p)%zu, ppos=%lld\n",
+		dev_ctx->devname,
+		buf, size, ((ppos) ? *ppos : 0));
+
+	if (mutex_lock_interruptible(&dev_ctx->fops_lock))
+		return -EBUSY;
+
+	if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+		err = -EINVAL;
+		goto exit;
+	}
+
+	if (size < SE_MU_HDR_SZ) {
+		dev_err(priv->dev,
+			"%s: User buffer too small(%zu < %d)\n",
+			dev_ctx->devname,
+			size, SE_MU_HDR_SZ);
+		err = -ENOSPC;
+		goto exit;
+	}
+
+	tx_msg = memdup_user(buf, size);
+	if (IS_ERR(tx_msg)) {
+		err = PTR_ERR(tx_msg);
+		goto exit;
+	}
+
+	print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
+			     tx_msg, size, false);
+
+	err = ele_msg_send(dev_ctx, tx_msg, size);
+	if (err < 0)
+		goto exit;
+exit:
+	mutex_unlock(&dev_ctx->fops_lock);
+	return err;
+}
+
+/*
+ * Read a message from the MU.
+ * Blocking until a message is available.
+ */
+static ssize_t se_if_fops_read(struct file *fp, char __user *buf,
+			       size_t size, loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err;
+
+	dev_dbg(priv->dev,
+		"%s: read to buf %p(%zu), ppos=%lld\n",
+		dev_ctx->devname,
+		buf, size, ((ppos) ? *ppos : 0));
+
+	if (mutex_lock_interruptible(&dev_ctx->fops_lock))
+		return -EBUSY;
+
+	if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+		err = -EINVAL;
+		goto exit;
+	}
+
+	err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
+	if (err < 0) {
+		dev_err(priv->dev,
+			"%s: Err[0x%x]:Interrupted by signal.\n",
+			dev_ctx->devname, err);
+		dev_dbg(priv->dev,
+			"Current active dev-ctx count = %d.\n",
+			dev_ctx->priv->active_devctx_count);
+		goto exit;
+	}
+
+	/* We may need to copy the output data to user before
+	 * delivering the completion message.
+	 */
+	err = se_dev_ctx_cpy_out_data(dev_ctx);
+	if (err < 0)
+		goto exit;
+
+	/* Copy data from the buffer */
+	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
+			     priv->cmd_receiver_clbk_hdl.rx_msg,
+			     priv->cmd_receiver_clbk_hdl.rx_msg_sz,
+			     false);
+
+	if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg,
+			 priv->cmd_receiver_clbk_hdl.rx_msg_sz)) {
+		dev_err(priv->dev,
+			"%s: Failed to copy to user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+	err = priv->cmd_receiver_clbk_hdl.rx_msg_sz;
+exit:
+	priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
+
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	mutex_unlock(&dev_ctx->fops_lock);
+	return err;
+}
+
+/* Open a character device. */
+static int se_if_fops_open(struct inode *nd, struct file *fp) {
+	struct miscdevice *miscdev = fp->private_data;
+	struct se_if_priv *priv = dev_get_drvdata(miscdev->parent);
+	struct se_if_device_ctx *misc_dev_ctx = priv->priv_dev_ctx;
+	struct se_if_device_ctx *dev_ctx;
+	int err = 0;
+
+	if (mutex_lock_interruptible(&misc_dev_ctx->fops_lock))
+		return -EBUSY;
+
+	priv->dev_ctx_mono_count++;
+	err = init_device_context(priv,
+				  priv->dev_ctx_mono_count ?
+					priv->dev_ctx_mono_count
+					: priv->dev_ctx_mono_count++,
+				  &dev_ctx, NULL);
+	if (err) {
+		dev_err(priv->dev,
+			"Failed[0x%x] to create device contexts.\n",
+			err);
+		goto exit;
+	}
+
+	fp->private_data = dev_ctx;
+
+exit:
+	mutex_unlock(&misc_dev_ctx->fops_lock);
+	return err;
+}
+
+/* Close a character device. */
+static int se_if_fops_close(struct inode *nd, struct file *fp) {
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	if (mutex_lock_interruptible(&dev_ctx->fops_lock))
+		return -EBUSY;
+
+	/* check if this device was registered as command receiver. */
+	if (priv->cmd_receiver_clbk_hdl.dev_ctx == dev_ctx) {
+		priv->cmd_receiver_clbk_hdl.dev_ctx = NULL;
+		kfree(priv->cmd_receiver_clbk_hdl.rx_msg);
+		priv->cmd_receiver_clbk_hdl.rx_msg = NULL;
+	}
+
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+	cleanup_se_shared_mem(dev_ctx);
+
+	priv->active_devctx_count--;
+	list_del(&dev_ctx->link);
+
+	mutex_unlock(&dev_ctx->fops_lock);
+	kfree(dev_ctx->devname);
+	kfree(dev_ctx);
+
+	return 0;
+}
+
+/* IOCTL entry point of a character device */ static long
+se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg) {
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err;
+
+	/* Prevent race during change of device context */
+	if (mutex_lock_interruptible(&dev_ctx->fops_lock))
+		return -EBUSY;
+
+	switch (cmd) {
+	case SE_IOCTL_ENABLE_CMD_RCV:
+		if (!priv->cmd_receiver_clbk_hdl.dev_ctx) {
+			if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
+				priv->cmd_receiver_clbk_hdl.rx_msg
+					= kzalloc(MAX_NVM_MSG_LEN,
+						  GFP_KERNEL);
+				if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
+					err = -ENOMEM;
+					break;
+				}
+			}
+			priv->cmd_receiver_clbk_hdl.rx_msg_sz = MAX_NVM_MSG_LEN;
+			priv->cmd_receiver_clbk_hdl.dev_ctx = dev_ctx;
+			err = 0;
+		} else {
+			err = -EBUSY;
+		}
+		break;
+	case SE_IOCTL_GET_MU_INFO:
+		err = se_ioctl_get_mu_info(dev_ctx, arg);
+		break;
+	case SE_IOCTL_SETUP_IOBUF:
+		err = se_ioctl_setup_iobuf_handler(dev_ctx, arg);
+		break;
+	case SE_IOCTL_GET_SOC_INFO:
+		err = se_ioctl_get_se_soc_info_handler(dev_ctx, arg);
+		break;
+	case SE_IOCTL_CMD_SEND_RCV_RSP:
+		err = se_ioctl_cmd_snd_rcv_rsp_handler(dev_ctx, arg);
+		break;
+	default:
+		err = -EINVAL;
+		dev_dbg(priv->dev,
+			"%s: IOCTL %.8x not supported\n",
+			dev_ctx->devname,
+			cmd);
+	}
+
+	mutex_unlock(&dev_ctx->fops_lock);
+
+	return (long)err;
+}
+
+/* Char driver setup */
+static const struct file_operations se_if_fops = {
+	.open		= se_if_fops_open,
+	.owner		= THIS_MODULE,
+	.release	= se_if_fops_close,
+	.unlocked_ioctl = se_ioctl,
+	.read		= se_if_fops_read,
+	.write		= se_if_fops_write,
+};
+
 /* interface for managed res to free a mailbox channel */  static void 
if_mbox_free_channel(void *mbox_chan)  { @@ -324,6 +1091,7 @@ static int 
se_if_request_channel(struct device *dev,

 static void se_if_probe_cleanup(void *plat_dev)  {
+	struct se_if_device_ctx *dev_ctx, *t_dev_ctx;
 	struct platform_device *pdev = plat_dev;
 	struct device *dev = &pdev->dev;
 	struct se_fw_load_info *load_fw;
@@ -348,6 +1116,13 @@ static void se_if_probe_cleanup(void *plat_dev)
 		load_fw->imem.buf = NULL;
 	}

+	if (priv->dev_ctx_mono_count) {
+		list_for_each_entry_safe(dev_ctx, t_dev_ctx, &priv->dev_ctx_list, link) {
+			list_del(&dev_ctx->link);
+			priv->active_devctx_count--;
+		}
+	}
+
 	/* No need to check, if reserved memory is allocated
 	 * before calling for its release. Or clearing the
 	 * un-set bit.
@@ -431,6 +1206,7 @@ static int se_if_probe(struct platform_device *pdev)
 			goto exit;
 		}
 	}
+	INIT_LIST_HEAD(&priv->dev_ctx_list);

 	if (info->reserved_dma_ranges) {
 		ret = of_reserved_mem_device_init(dev); @@ -442,6 +1218,14 @@ static int 
se_if_probe(struct platform_device *pdev)
 		}
 	}

+	ret = init_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
+	if (ret) {
+		dev_err(dev,
+			"Failed[0x%x] to create device contexts.\n",
+			ret);
+		goto exit;
+	}
+
 	if (info->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = se_soc_info(priv);
 		if (ret) {
@@ -473,7 +1257,7 @@ static int se_if_probe(struct platform_device *pdev)
 		}
 	}
 	dev_info(dev, "i.MX secure-enclave: %s%d interface to firmware, 
configured.\n",
-			SE_TYPE_STR_HSM,
+			get_se_if_name(priv->if_defs->se_if_type),
 			priv->if_defs->se_instance_id);
 	return ret;

diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h 
index 12c201b503b1..91a2f084b1f4 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -13,6 +13,7 @@
 #define MAX_FW_LOAD_RETRIES		50

 #define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_DATA_SIZE_PER_USER		(65 * 1024)
 #define MAX_NVM_MSG_LEN			(256)
 #define MESSAGING_VERSION_6		0x6
 #define MESSAGING_VERSION_7		0x7
@@ -31,6 +32,7 @@
 struct se_clbk_handle {
 	struct completion done;
 	bool signal_rcvd;
+	struct se_if_device_ctx *dev_ctx;
 	u32 rx_msg_sz;
 	/* Assignment of the rx_msg buffer to held till the
 	 * received content as part callback function, is copied.
@@ -45,6 +47,40 @@ struct se_imem_buf {
 	u32 state;
 };

+struct se_buf_desc {
+	u8 *shared_buf_ptr;
+	void __user *usr_buf_ptr;
+	u32 size;
+	struct list_head link;
+};
+
+struct se_shared_mem {
+	dma_addr_t dma_addr;
+	u32 size;
+	u32 pos;
+	u8 *ptr;
+};
+
+struct se_shared_mem_mgmt_info {
+	struct list_head pending_in;
+	struct list_head pending_out;
+
+	struct se_shared_mem secure_mem;
+	struct se_shared_mem non_secure_mem;
+};
+
+/* Private struct for each char device instance. */ struct
+se_if_device_ctx {
+	struct se_if_priv *priv;
+	struct miscdevice *miscdev;
+	const char *devname;
+
+	struct mutex fops_lock;
+
+	struct se_shared_mem_mgmt_info se_shared_mem_mgmt;
+	struct list_head link;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */  struct 
se_msg_hdr {
 	u8 ver;
@@ -89,6 +125,12 @@ struct se_if_priv {

 	struct gen_pool *mem_pool;
 	const struct se_if_defines *if_defs;
+
+	struct se_if_device_ctx *priv_dev_ctx;
+	struct list_head dev_ctx_list;
+	u32 active_devctx_count;
+	u32 dev_ctx_mono_count;
 };

+char *get_se_if_name(u8 se_if_id);
 #endif
diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h new 
file mode 100644 index 000000000000..5cf3d56734f4
--- /dev/null
+++ b/include/uapi/linux/se_ioctl.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR
+BSD-3-Clause*/
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef SE_IOCTL_H
+#define SE_IOCTL_H
+
+#include <linux/types.h>
+
+#define SE_TYPE_STR_DBG			"dbg"
+#define SE_TYPE_STR_HSM			"hsm"
+#define SE_TYPE_ID_UNKWN		0x0
+#define SE_TYPE_ID_DBG			0x1
+#define SE_TYPE_ID_HSM			0x2
+/* IOCTL definitions. */
+
+struct se_ioctl_setup_iobuf {
+	void __user *user_buf;
+	__u32 length;
+	__u32 flags;
+	__u64 ele_addr;
+};
+
+struct se_ioctl_shared_mem_cfg {
+	__u32 base_offset;
+	__u32 size;
+};
+
+struct se_ioctl_get_if_info {
+	__u8 se_if_id;
+	__u8 interrupt_idx;
+	__u8 tz;
+	__u8 did;
+	__u8 cmd_tag;
+	__u8 rsp_tag;
+	__u8 success_tag;
+	__u8 base_api_ver;
+	__u8 fw_api_ver;
+};
+
+struct se_ioctl_cmd_snd_rcv_rsp_info {
+	__u32 __user *tx_buf;
+	int tx_buf_sz;
+	__u32 __user *rx_buf;
+	int rx_buf_sz;
+};
+
+struct se_ioctl_get_soc_info {
+	__u16 soc_id;
+	__u16 soc_rev;
+};
+
+/* IO Buffer Flags */
+#define SE_IO_BUF_FLAGS_IS_OUTPUT	(0x00u)
+#define SE_IO_BUF_FLAGS_IS_INPUT	(0x01u)
+#define SE_IO_BUF_FLAGS_USE_SEC_MEM	(0x02u)
+#define SE_IO_BUF_FLAGS_USE_SHORT_ADDR	(0x04u)
+#define SE_IO_BUF_FLAGS_IS_IN_OUT	(0x10u)
+
+/* IOCTLS */
+#define SE_IOCTL			0x0A /* like MISC_MAJOR. */
+
+/*
+ * ioctl to designated the current fd as logical-reciever.
+ * This is ioctl is send when the nvm-daemon, a slave to the
+ * firmware is started by the user.
+ */
+#define SE_IOCTL_ENABLE_CMD_RCV	_IO(SE_IOCTL, 0x01)
+
+/*
+ * ioctl to get the buffer allocated from the memory, which is shared
+ * between kernel and FW.
+ * Post allocation, the kernel tagged the allocated memory with:
+ *  Output
+ *  Input
+ *  Input-Output
+ *  Short address
+ *  Secure-memory
+ */
+#define SE_IOCTL_SETUP_IOBUF	_IOWR(SE_IOCTL, 0x03, \
+					struct se_ioctl_setup_iobuf)
+
+/*
+ * ioctl to get the mu information, that is used to exchange message
+ * with FW, from user-spaced.
+ */
+#define SE_IOCTL_GET_MU_INFO	_IOR(SE_IOCTL, 0x04, \
+					struct se_ioctl_get_if_info)
+/*
+ * ioctl to get SoC Info from user-space.
+ */
+#define SE_IOCTL_GET_SOC_INFO      _IOR(SE_IOCTL, 0x06, \
+					struct se_ioctl_get_soc_info)
+
+/*
+ * ioctl to send command and receive response from user-space.
+ */
+#define SE_IOCTL_CMD_SEND_RCV_RSP _IOWR(SE_IOCTL, 0x07, \
+					struct se_ioctl_cmd_snd_rcv_rsp_info) #endif

--
2.34.1


------=_NextPart_000_0425_01DB6B4A.3F5EA200
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIImZTCCBaIw
ggOKoAMCAQICCE4Rpu+H69FRMA0GCSqGSIb3DQEBCwUAMGUxIjAgBgNVBAMMGU5YUCBJbnRlcm5h
bCBQb2xpY3kgQ0EgRzIxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJ
RWluZGhvdmVuMQswCQYDVQQGEwJOTDAeFw0yMzA0MjEwNjQzNDVaFw0yODA0MTkwNjQzNDVaMIG2
MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQ
IEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmS
JomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTEL
MAkGA1UEBhMCTkwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAWrnSkYP60A8wj4AO
kATDjnbdgLv6waFfyXE/hvatdWz2YYtb1YSRi5/wXW+Pz8rsTmSj7iusI+FcLP8WEaMVLn4sEIQY
NI8KJUCz21tsIArYs0hMKEUFeCq3mxTJfPqzdj9CExJBlZ5vWS4er8eJI8U8kZrt4CoY7De0FdJh
35Pi5QGzUFmFuaLgXfV1N5yukTzEhqz36kODoSRw+eDHH9YqbzefzEHK9d93TNiLaVlln42O0qaI
MmxK1aNcZx+nQkFsF/VrV9M9iLGA+Qb/MFmR20MJAU5kRGkJ2/QzgVQM3Nlmp/bF/3HWOJ2j2mpg
axvzxHNN+5rSNvkG2vSpAgMBAAGjggECMIH/MFIGCCsGAQUFBwEBBEYwRDBCBggrBgEFBQcwAoY2
aHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFBJbnRlcm5hbFBvbGljeUNBRzIuY2VyMB0G
A1UdDgQWBBRYlWDuTnTvZSKqve0ZqSt6jhedBzASBgNVHRMBAf8ECDAGAQH/AgEAMEUGA1UdHwQ+
MDwwOqA4oDaGNGh0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEludGVybmFsUG9saWN5Q0FH
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
ggEKAoIBAQCsljsxzffby7IAt42e7cJH7K+49RL+7i56h3ORt8dS8WNVSdDlejp6uS6mLk/UX0wn
sSxDK1S5KquGJQzaT/3gxE8tdgvfFNBVdrgr48DeCVwWDr1o/UF3RmGcMdxqRz1M/oLDJ03C8n6h
L/0JXiwsNx0KZJoqDrN/48yX5TkoeKJmHFftZ5Op57xV0WkZJ/yLxSC1Om75jOG/UPdqsDzl+wi7
YVj5egV24hoaXgHBxtCeJzUgsHcJlo9nFtGe11j6H1vqFzkPzN9ydjRmhQATV/WLqpG8uot79u0m
6n7Mjwsd/HmJf+8xpovMcHPO2a0axppssKso/3APP6mR1FuVAgMBAAGjggORMIIDjTAOBgNVHQ8B
Af8EBAMCB4AwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMAwGA1UdEwEB/wQCMAAwHQYD
VR0OBBYEFLNr0DCWM1fCXv4ubOt/elkvcoiaMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRw
YW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFua2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAU5TJ6
9GbBR5Ykf/wngDlY3ysX4rswggFKBgNVHR8EggFBMIIBPTCCATmgggE1oIIBMYaByGxkYXA6Ly8v
Q049TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1ubGFtc3BraTAwMDQsQ049Q0RQLENOPVB1
YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2Jp
LERDPW54cCxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNz
PWNSTERpc3RyaWJ1dGlvblBvaW50hjFodHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFAtRW50
ZXJwcmlzZS1DQTQuY3JshjFodHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFAtRW50ZXJwcmlz
ZS1DQTQuY3JsMIIBEAYIKwYBBQUHAQEEggECMIH/MIG7BggrBgEFBQcwAoaBrmxkYXA6Ly8vQ049
TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2Vydmlj
ZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jQUNl
cnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTA/BggrBgEF
BQcwAoYzaHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFAtRW50ZXJwcmlzZS1DQTQuY2Vy
MDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRVhu2FOILrmUuaklY/hMbNXILljX4C
AWQCAT8wJwYJKwYBBAGCNxUKBBowGDAKBggrBgEFBQcDAjAKBggrBgEFBQcDBDANBgkqhkiG9w0B
AQsFAAOCAQEAWS4IrHXWhCGNWk5vn20xV7mlLkM7JPwltVJzB6MRzwUB438upbyUMwNHcEgAmHcs
xL9hafErN+n9rLL00wEqZsCV732s7YOxSRRjZTE3CmZQ2+TYjXR7A6AzQKo0fv/x43bpSes8ttQ6
Qtt8nzIbGBkDAcI7wfXsUPF5o0NwLOxre+Z+JCPNH0eaOj2J7EKD2ERLCClmvohrYdlmu85iXfyi
nJo42eq9g08FtnxTXVQSIZCtiETiGtXA7+t2Aa8429XXunsijRznaYw2SwI/s4sVmvaK3XHaif0D
QaUYxQp4s2ctzgz3eU6hK68OnNzbhBtF/lx6PHbifqHDzrtUbzCCB+8wggbXoAMCAQICEy0ACwRu
JYOozH+yQuYAAQALBG4wDQYJKoZIhvcNAQELBQAwgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNl
IENBIDUxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVu
MRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPy
LGQBGRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDY29tMQswCQYDVQQGEwJOTDAeFw0yMzEyMjAwOTIw
NDdaFw0yNTEyMTkwOTIwNDdaMIGaMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQB
GRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDd2JpMQwwCgYDVQQLEwNOWFAxCzAJBgNVBAsTAklOMRYw
FAYDVQQLEw1NYW5hZ2VkIFVzZXJzMRMwEQYDVQQLEwpEZXZlbG9wZXJzMREwDwYDVQQDEwhueGEx
ODcxNzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL2JT+kRihW1mBdeZFOoCLGIl4DZ
VL7FWt3V1iFFJJe/bZDw/SUf5z1HeA8xv9+S8rqMyybjlSRHFLgiMm7qrGpVEDniKe8eiqP8Un4Y
3fHgK5FKZIVVn0KlaMuD5G30AMk9HyUdc2MkVRL8YSQCewkQDEVjB8gnx/e6xfbWEVHf5+dOWJoR
aket5+0JKV0l/dPV7cT4hL3BFtiBhq8976Li6rn8gxIi63u0G3qvm9Scqk+EHzemDhw/W+eMmGR4
nwKVLKzumxko8l6EOnnvqqF4vj2hKTpB+2lsEXH1giireMEsvB2RY40lnRUXVQ0FDklOIQV4Qdgi
EJfUdq/ZhCUCAwEAAaOCBA4wggQKMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRV
hu2FOILrmUuaklY/gbeCPIPthzICAWQCAT4wEwYDVR0lBAwwCgYIKwYBBQUHAwQwDgYDVR0PAQH/
BAQDAgUgMAwGA1UdEwEB/wQCMAAwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDCBlAYJKoZI
hvcNAQkPBIGGMIGDMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAS0wCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBGTALBglghkgBZQMEAQIwCwYJYIZIAWUDBAEFMAoGCCqGSIb3DQMHMAcGBSsOAwIHMA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAgAwHQYDVR0OBBYEFMJ81PK4p3H8Q7gn7u/5OwWx
uAwGMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRwYW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFu
a2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAUWJVg7k5072Uiqr3tGakreo4XnQcwggFGBgNV
HR8EggE9MIIBOTCCATWgggExoIIBLYaByGxkYXA6Ly8vQ049TlhQJTIwRW50ZXJwcmlzZSUyMENB
JTIwNSxDTj1ubGFtc3BraTAwMDUsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENO
PVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hi9o
dHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybIYvaHR0cDovL3d3
dy5wa2kubnhwLmNvbS9jcmwvTlhQRW50ZXJwcmlzZUNBNS5jcmwwggEQBggrBgEFBQcBAQSCAQIw
gf8wgbsGCCsGAQUFBzAChoGubGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENO
PUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0
aW9uLERDPXdiaSxEQz1ueHAsREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1j
ZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MD8GCCsGAQUFBzAChjNodHRwOi8vbnd3LnBraS5ueHAuY29t
L2NlcnRzL05YUC1FbnRlcnByaXNlLUNBNS5jZXIwDQYJKoZIhvcNAQELBQADggEBALwIIuww1PaF
EbpQoy5vgJ/4N3xS+niIpFTKyYNAD0Ar38FcUlSnj0FIHKRj8rUmZP9WTky3U8m5B3LOyhJ14FPh
iy1EwkhZmds9fJiZyEEFiwQWYDG/uknu6zIKOTlLmtlYPfbzfi58keGcjD3T5H8D8DpCGWI1lAwe
clR9fJCbcYnQSQnuicSCfrHjjXiDZ2O8h7WbE1CC6Cj/qwo5nmS0lMv7yoG94rTNBvYe8iqOkcav
7KiZA6SdhXms3ppvFmBukI6pTheMvT39SM0S6E0dgeqZSGSxHrM7dcxUdAL4fnYMv3Sa+GAgyXB6
rihWC11+goz2eawt5TRU2w45TmcxggSzMIIErwIBATCBzjCBtjEcMBoGA1UEAwwTTlhQIEVudGVy
cHJpc2UgQ0EgNDELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5k
aG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJ
kiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYTAk5MAhM/AAV1goSs
wyqoLYNbAAUABXWCMAkGBSsOAwIaBQCgggK5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTI1MDEyMDA5MTczN1owIwYJKoZIhvcNAQkEMRYEFDCyu/TF9FnoMNev3a3y
hceXeIoZMIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggq
hkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsO
AwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIBMIHfBgkrBgEEAYI3EAQx
gdEwgc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjCB4QYLKoZIhvcNAQkQAgsx
gdGggc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjANBgkqhkiG9w0BAQEFAASC
AQAzFTtjA0xiXfq4Iq7O0SBM2c6ES0/m18WUB3GKYIJL5hJ1P3Jvufa4eiIrbF28uMLWAfdWyGnT
2kS6e73gTqKtPY+AARo4K7De1VX3v5eWSKvyUPoKq3PVcxcCJ6OM8k2CtUmNK/Gh0xC8H2eVMRa0
kqVCxNEre8KDFEYDIGC4ejCzCfPrIRb8D9NkXIgs0KMPOcSoj/e33Psv5udF/Hhc/HHT0cTm9yHh
d89qHQkpNpAIcEy6J30DeJlYqOHa4dDk9DRrZC/AtF4Nyd00oBB6vyQSmE7JImr8IKXqCOItVGvS
mPN3l+p78j5y99XFYyNBysiaAhKWU7iKHxx+GhobAAAAAAAA

------=_NextPart_000_0425_01DB6B4A.3F5EA200--
