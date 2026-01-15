Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD2B1F4613
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469045; cv=fail; b=GnorlY5C+qvQFdRfHsHjScI3hu7uLz6YBp4fOsEu33J0u+kKFfj7rHpTIeRd2XITfVZHbGPKW9+OUassVtAbPvIUWTozRW//neIpUlCsXpnm2k7JUeWGTuxfW2N9r52kQIhLNmy3+pSw+HBCoYNMMnF91OKZI3+X7CilJLdR8rY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469045; c=relaxed/simple;
	bh=zOWZgEglGydPzw/a4xUprxwsk1GTsgDnir/+9RxVAgk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l7uglD3c+76WR5vHHNwx+06vdxqe1Rtc1KkyExGYHpyL1EoiGwFU+WGe6B0y8Cjli1EIeLLxJRJBseaWNNWteJTLR1yF3N1rVW73CVkLlDNQ5LnB01tSo5GEYLTWTPICQqOhQcAZ065pmcN9uMoW85sKvyZG9CQ4a2/RF7EEejQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kKIodCJu; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kKIodCJu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqPS4NJtD3/6sgQi2v+nIhjM8/lULGalcZAsS2X6xDPz6lLfN5Wa1Owwr5ZhguASA9OO0GBccKNVzvYJaNxivuIFtGkbpTayMjDvp/7R4k1RgIdFrbafe95MQDIP7Fleb60UaVhi1+/uk2UD4RpozYy9ujZSmlK758PGHKsOeaLUAv++72VxEtNGNPjBfgSdbh68mLGskr+DTuoFjoEwKPU0mHCh6u+IOQLrhMOkLihrM78Qr/fdBkdYw7OcaO9YGWV9dnKrdQBrkQAi/ocJtdtZXSCg+Cw3kBquisRuqJ/kGhz0F1xI6ka9iPtnj9Ix+kbtzeZOAyAB4eiLCbZLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOWZgEglGydPzw/a4xUprxwsk1GTsgDnir/+9RxVAgk=;
 b=lO2N6FFWr/VGoKLASNlglMpC82IfBfRZ8WAXxfzx8rxi2LlPDEi/7AUbiYJeb14Kou/UxJFNnVq0Rf7w9K1VyEI7dyEgj1Tf0fzMQdkxnINEgDYLZicHQ5C23+LraA3+xA4x3ADg8C4QIz2YoxBpnWbdgrrkhZScwO2Pr4+8w5NyH6jA18Bsr7BbCfyJUr6A3BafpZeYD5s/cJQlnB3sYPWdRUIr3Jnkgxnv996nMQ1BVU5AOEqoePbTd6YJRKEjzGKDnuk1O/oq84feXPTy/U3EkBsWs4ZQtewZJUfEda78eMILzeF7LGQyiD+tPfcqASoGzgP5Tj7dY4M3qk9ZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOWZgEglGydPzw/a4xUprxwsk1GTsgDnir/+9RxVAgk=;
 b=kKIodCJuJ/Pa91Tslx4RpzYD973fxrMcMfIUyN8nBTsXdK0eOfpsc/cM2ftxH54Ajigpr+fF8a8K+N2XEFfMbq4kI8ZSjFiikRCBydmzILwLBHkF8XPYg1H1MYM9ILw9YTfHCW7zmjyr5Q/Imju9nCJEHEwOgK6uPl08B+oEg4lzPZNJtflqQTIRNqCn3DpRxtv2Qt28zmWRXDeaCT+XMN1Affm46CXmlCPz+CEyk9/8EJfZieF2FRHw2fM+U9De/PvEUIfzP2WqJ/KTTXsPmdGVtShC/dLidRhTKEIsWSXyw6TYrNJXtAM9AlLIaqz95bPESDTR8Nb+M1O/MDYG2Q==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DU4PR04MB11770.eurprd04.prod.outlook.com
 (2603:10a6:10:625::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 09:23:59 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 09:23:59 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>, Hongxing Zhu
	<hongxing.zhu@nxp.com>, Frank Li <frank.li@nxp.com>, "l.stach@pengutronix.de"
	<l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] dt-bindings: PCI: fsl,imx6q-pcie: Remove the
 deprecated "reset-gpio-active-high" property
Thread-Topic: [PATCH 3/3] dt-bindings: PCI: fsl,imx6q-pcie: Remove the
 deprecated "reset-gpio-active-high" property
Thread-Index: AQHche9OCxoDZtfNNEu/dvHz4ZCmA7VS8P2AgAAEFBA=
Date: Thu, 15 Jan 2026 09:23:59 +0000
Message-ID:
 <VI0PR04MB1211405BEFB0BE5A24F75BB1E928CA@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260115071816.115798-1-sherry.sun@nxp.com>
 <20260115071816.115798-4-sherry.sun@nxp.com>
 <eadcc6da-ffff-4f3c-91db-b70998b50f6d@kernel.org>
In-Reply-To: <eadcc6da-ffff-4f3c-91db-b70998b50f6d@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|DU4PR04MB11770:EE_
x-ms-office365-filtering-correlation-id: 7cb72319-a76d-45fd-a3a6-08de5417d0c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VGhsNnBkZVQwU00zNmRodTZxNXB3dG1iczA2SWpnUHNVNjFLQ2Nic00xNWdj?=
 =?utf-8?B?MXlpMEpsNHdFRXNhU0V6M2hHUzZRZ0szSjZoUkEzL2xBbkllaGEzLzdhdWxw?=
 =?utf-8?B?UVowbi8wb1NlOE1nUzBqdkpUR2lFcDBEV2sxa3hrMVRNS3hVWWEwMWV3YU0r?=
 =?utf-8?B?T0lsMzVuSEJ4WkFSVGtEb1dHSDhrT2tvN3Q0S0tzeDFzaEFJZlplNFdnckxJ?=
 =?utf-8?B?ZUR0T20zVGt4L3Q4V3hQMlphRmN4K0R0RUxxdkZUeUFGSlgrTkhpMUFFY2Jt?=
 =?utf-8?B?dUI4Sm5rdkFQbDA5TEhwT2ZlamhtTU9HeDBXM2hab0xaQUVtZElHRmJEVUho?=
 =?utf-8?B?S0VOQ3UrQkNNWEo0dEcyeE00dXl2c2lkeXJTb3UrK3hYK0h1MTNQeWpiMEps?=
 =?utf-8?B?OU8rWnBQZzlGdS8rdmZRd013M2JLRjZSeVhkcE1BRWY3U0pOcEE1cmFZcXJk?=
 =?utf-8?B?eGNxdW5jNFF5ak1zWVZ4eno5Y3gyMzZwamtFaXp6dzYrMjNHVjdjMnRqZ002?=
 =?utf-8?B?T3BlcnlPb0E0RE1PZ0xPSk1kNksxVHFMcjAvSzA3cE1zTkhjMHNBZnVjV2JE?=
 =?utf-8?B?b2dMT0dWQSt6U2FqRU5kOWVpN2NHRWNvRmZQSGQ5ZEYvQ3Rmb0EwdFgyTytN?=
 =?utf-8?B?cnVkcnBGbmlpc2htWVdaUFJWVHpTdDE3VjR6UGxOQng2M21qaTd1dzJDZU83?=
 =?utf-8?B?Q01wUDhMUkRJVWJQWVdrdmpZcm5TVEpZZWVOVzNTWVo5NXpodnNtd2VwQ1NR?=
 =?utf-8?B?S0VrS0lZYjVOd1oyVitScFZFdEIwLzBjSGdYSlBodytJUU1rWHAxYzBGRnVN?=
 =?utf-8?B?dVRib2N6WjV4dm1HZmhMRXN2VTVXdmd3QTJaVmJCVWlhUHJPWG1UWnNpSmZr?=
 =?utf-8?B?ZDk2R1ZSVzhUc0c5SjRpaGorZWFqaTFSZ2V2bDhHdC9ScTlXdGRZRHJUM3Zi?=
 =?utf-8?B?OFNLb0FxRVhmcEM2M3NaVXBFeEtPYnFRNnR1NmVnZFJGbGZqYjU1UDMrdGZo?=
 =?utf-8?B?ZWMyVGxoRHRMRExmcll4clc3T0pqcWcxSEV6QnYza3dEdXZsR1YyWkhvblFF?=
 =?utf-8?B?VkJDeGNzVmNkUzhPeUc3N3JaaWZkU204Qkg4eVNSenFCRXY5L0gwdytJTkhX?=
 =?utf-8?B?WCs5T2kweVhWMjI3WGNVa0hXM2JJajBZMFNwYmFFUms2eEJXV002MzlIZWs1?=
 =?utf-8?B?cWVNTEo0ZUhRUkFRMGZJNHdZWE9aK1NycTY1Wk1UU3ErRXJXZEY5VitOamRn?=
 =?utf-8?B?TTJ3R21lUHh5aGZIamh0MlhST1VMakZ0ZkQ3Ni9LKyszZExJTkVaRHVPdGF3?=
 =?utf-8?B?bk84d2tRVm1BdnpXU2E0TUszK21LZkw5TkFPQWN2bHJzdUxHWkxTV3RLdU1F?=
 =?utf-8?B?d3hGYUZLZ2F2UVFTZ05QSTFKY3hudkFrNStRT05VTzNMaG5WREFXdXhXOVIy?=
 =?utf-8?B?YjQ1blN6a1Z1L1AvNCtmU09iLzlhV205VlJjRWhibUtFN3N4S1h0TDF4b0Q5?=
 =?utf-8?B?VGE2dG1NV0lzbTFFSXBRbzNtaW9JdmRiSytSYm51Ujd2akpRQ2pwbWpUYjcz?=
 =?utf-8?B?M0ZYdzNqZForOURyUGFJL0haVEd4UG40dnN2SWYzT0dWM25ETDJHUURMSGd0?=
 =?utf-8?B?SE1iRFVXUlVkeTI5SUo1Y2x6Q29VbEJCNDlzTnFDRzN3VitoRC80WlRHY2Fj?=
 =?utf-8?B?VFlLQlhZZCtKVkUyUGZ2N29EcnA4ZGJwNTNsSThESU5NYXBjWGt5YzR0b3do?=
 =?utf-8?B?U3J5bVZJdEpxVTZPWnNaMVB5ZGRrQ0xXSlFlSmhaQWxDd0wyNG0zMVVEYnRi?=
 =?utf-8?B?bjZxMUtnS0NISkZaS0Q0ZHNDZFBBaklOdG1uVDZLRjF2SW9BcTNLeG03bEJx?=
 =?utf-8?B?bG1uVGxjWGl5a2NlUFQyUHE0ZTZvbStGMUlEK05ocmk2Nm9RM3RNM1liYkpT?=
 =?utf-8?B?RlFYRVFucFNtUXlvSjVMN0cycldrTjA2SFZJRWMrTDV3NUZZVitSY1FpV0tJ?=
 =?utf-8?B?QmUvRlZRRXF5bG02Z1c1V25tWjRScTBTM0hGcnh0Rm1JZ1loVGowL09rbmMy?=
 =?utf-8?B?dEJMekxDemdLWU0zTHY0ZGc4bCtiV3huZ1VhVFQ2a1hYTy9ZU3lEblA1bmNv?=
 =?utf-8?B?ZDhnN3ZIUTBubFVKYnBkSmRKZGh2T1ZEYzN2cWVHWHR5VURTcndYZ1pLS2lr?=
 =?utf-8?Q?4iOqWoFVZ4It/W8px8puYJJg2+zcQB8nTXJS7iRq6oG/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2UwbEtTejNFNWVmeGR1ZHNCTmdaeGVWYndTK2JwNUMzZnA1MFVUTUhpOGlH?=
 =?utf-8?B?RGFXN2RYNW1RWG1oV3FRNFUrbDZUMzFqV3M1VFhCUStoRERvSzAvSnpHMThk?=
 =?utf-8?B?NGdjUjJJeFhocFhPOWp2dFNNMjlJRm9XWDFrZkpLSk0vK3N4UEtmMlNUR1RJ?=
 =?utf-8?B?cE5kZFY4bEJyMVNNU1JvRUJJTlVpVjdpWDV4dGtQM1RxcEJGRmloZHZyL3ZG?=
 =?utf-8?B?OVhDOVdwR21SWFlpcHZDd2RFdGk5QTJZRDMwbDVHUElQelVGSHB0VTR1eWhZ?=
 =?utf-8?B?WmRoYnRwclNqZFVZWHUzU2FTOGFoMFFUQWw4NHFzb2J0Y3ZjcXNyd1JTS2lF?=
 =?utf-8?B?M3FxYWNrWEFlazJPd1k2Mk9pVmZVWjVRTFFWaG9qS3pDWmM0ajMydDhVUEpv?=
 =?utf-8?B?VU9RUjZKZU9HYWlscXNMOTZtbk50a05ERS9ER05SdFhxR0Mya2ZNS01OOHRr?=
 =?utf-8?B?a3ZWNysvRHhhR2pzb1J4cmFJMEV3RmVuMEtnQytZVDZQeXhQcXpsdzVTOE10?=
 =?utf-8?B?U1JWQ21lQXFPbXhGdW1QQjFncUtqSnd4blZKaEt2RC81OEZoTkJZWmZ6MjB3?=
 =?utf-8?B?NEI5c0NYN1U3YmdHZkxlb3puRU5pTUFQYVVIcyt3eFgvQW05M2hsUGdXcWUz?=
 =?utf-8?B?SUppaXoyNEkxRFptUHVsZ05wZzluREtDbGUybUphREhtbmZmRUdvS3BFV2Zu?=
 =?utf-8?B?aXJ4UWpRMjZDS1BFS0ViMnNBaWtMQ3huRCtvM2xPQ0VaMW1FV1NKZkxvRDNH?=
 =?utf-8?B?YjhMNnBLSHpZL0xCNmlsUUFQZmF2QTNTMmZ2eDdrQ0cxYkdOY2gvYlN4bVZj?=
 =?utf-8?B?a01GT1lhczhvc3J0dWpIOVYvWHMwbzNIcThKSTRnUlRMcmt2SHdsL0RxSitT?=
 =?utf-8?B?dmU5Szg5NVZWdVE3cit5Mmp6Q0RGMXVwUmRnY0s1aFp3OFh0VmdPMlhURFlO?=
 =?utf-8?B?MXNpOFIxWWhyRTF5WjdLTHE2MEJHeFYyWUpTTDlaZ0grd1lNa1o3QlA3Um1L?=
 =?utf-8?B?a0xScTFTanJBMWRIRFpObkpORVAvMUQ2dnZnZ0N2U0VNVzJMb1g2eHM3VHhY?=
 =?utf-8?B?YmZTanl0bDlzbVQxRW1GMHNIcmY5em9lWExaejEvc29obmxLTUpyN0laQXdE?=
 =?utf-8?B?WUtBemZiY0VqbW1SZjlzRWF5Tk95S01WcDdBTmordnlpbHRZZEVFTHBzZUJS?=
 =?utf-8?B?WFpDd1lpUHNtR2c4S0NadUFHb1FlSk5YVjhpRkZsQk9zSk50cHovOFpERG9Z?=
 =?utf-8?B?NTdsVjhLUHJsdmJmY0JkR29nRUJKQlhlMjcwbWxNM0JreE1BbTdNYWVZUkIw?=
 =?utf-8?B?dFdxSjhqVWVHcG9ZM1IrZHBpNDhqcE9HWWtTTmMzcmYrR2hNZlh1UWFpQnoy?=
 =?utf-8?B?SHVOQU1SWHE1TkxiZmJnNUNIeldKcGFsbWZHYzhxS2g4RXRYODBjWHQrSElk?=
 =?utf-8?B?QTduS2s4MDRPRE9ZWSs0clBNMWJUSUZoRnRUeXZkMXd6alhYTEpzSzRuakxF?=
 =?utf-8?B?WDJOTkRmdTlPSVZHRUJBRFozR2dYVWFWSGV3Tlo3Y1lOVGJiMGw2NEV0Um8v?=
 =?utf-8?B?MklwRzgwNWFkWldSK0lXTTlTSTRVWXN2SzBGeTlIbmhhdVJXZFJrWG5FZUdy?=
 =?utf-8?B?K0FjaFIrTHhSdHpCVVhJTVR5YnpmeHBzeWY5dTBxWFZ1Ny9kcW9uQXpnNlRV?=
 =?utf-8?B?MGhIa016M0hoWlJSOC9TeW1nTjE0L3dHdEtodVdSSVdXeE52VmN4SEtRV0xn?=
 =?utf-8?B?WmNYY1lIbXdLWVhjeUlCVC9zMStrVHR6dXFDZUdMak5GZmxxODFRWTRCUjVF?=
 =?utf-8?B?UmV5Z3JZUHdxQlFjemh6QUpvS0w0YnhQL0N3UkorR1BMc0pLR3ZZR3RLeHFP?=
 =?utf-8?B?U1JLRG90S1FtUFNQTHJwejRmWmRUWmR4aVBkdDBxOVdvVzMvbHZhWFUrR2h0?=
 =?utf-8?B?MFNiMlpSc2w5MUR0WTZ4N1R4UnNPV3RJK1lRMmxRUUcwSnJESmlhTjU2dWFh?=
 =?utf-8?B?MHBGZXVkbFM2Ui9PMlF2bE8yeXJ0YWJlek1xRzkxRW5WODhsSmZIQysyWlVV?=
 =?utf-8?B?dllCMlYycTBTVjRscC9ac1U1N3k1b01SbU5lK3ZwblN1OFpySzJsQ2RCZzBX?=
 =?utf-8?B?WmVvQ0lPZmNEMzNuMmF4Wklaa3RSZ0JWMFo0VjI1Y1VaNm5vNDBGZGRzczJm?=
 =?utf-8?B?ZnhGb3FzM3BOS3cyc2k2SG1YT2Q1VGVTRXQrdXZmb0JvUTQ3YWR1VC9HaGt5?=
 =?utf-8?B?dU9MRWMzMi9ZclQ5QzhyY3RQbGZSbW1Dc3FIUzNxbzdISVN2b2lxc0tDYWF5?=
 =?utf-8?Q?Abm72seuHFWk6wc09h?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb72319-a76d-45fd-a3a6-08de5417d0c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 09:23:59.6488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H45kXZHaIt84Xe5pxY6MDG9W2VUMG7uIXY+ckcSIwfZ/N8ggVOaxNrKCfh+5T1ouQH5N81s/rZYK3g1zb0LRtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11770

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSAxNSwgMjAy
NiA1OjA4IFBNDQo+IFRvOiBTaGVycnkgU3VuIDxzaGVycnkuc3VuQG54cC5jb20+OyByb2JoQGtl
cm5lbC5vcmc7DQo+IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgc2hh
d25ndW9Aa2VybmVsLm9yZzsNCj4gcy5oYXVlckBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21h
aWwuY29tOyBrd2lsY3p5bnNraUBrZXJuZWwub3JnOw0KPiBtYW5pQGtlcm5lbC5vcmc7IGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbTsNCj4gYmhlbGdhYXNAZ29vZ2xlLmNvbTsgSG9u
Z3hpbmcgWmh1IDxob25neGluZy56aHVAbnhwLmNvbT47IEZyYW5rIExpDQo+IDxmcmFuay5saUBu
eHAuY29tPjsgbC5zdGFjaEBwZW5ndXRyb25peC5kZTsgbHBpZXJhbGlzaUBrZXJuZWwub3JnDQo+
IENjOiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBp
bXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAz
LzNdIGR0LWJpbmRpbmdzOiBQQ0k6IGZzbCxpbXg2cS1wY2llOiBSZW1vdmUgdGhlDQo+IGRlcHJl
Y2F0ZWQgInJlc2V0LWdwaW8tYWN0aXZlLWhpZ2giIHByb3BlcnR5DQo+IA0KPiBPbiAxNS8wMS8y
MDI2IDA4OjE4LCBTaGVycnkgU3VuIHdyb3RlOg0KPiA+IENvbW1pdCAyZTgxMTIyZDY4MWMgKCJQ
Q0k6IGlteDY6IENvbnZlcnQgdG8gdXNlIGFnbm9zdGljIEdQSU8gQVBJIikNCj4gPiBkZWxldGVk
IHRoZSBzdXBwb3J0IG9mICJyZXNldC1ncGlvLWFjdGl2ZS1oaWdoIiBwcm9wZXJ0eSBpbiBpbXg2
IFBDSWUNCj4gPiBkcml2ZXIuIFRoaXMgZGVwcmVjYXRlZCBwcmVvcGVydHkgaXMgbm8gbG9uZ2Vy
IHVzZWQgaW4gYW55IERUUyBmaWxlLA0KPiA+IGxldCdzIGFsc28gcmVtb3ZlIHRoaXMgaW4gZHQt
YmluZGluZy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNoZXJyeSBTdW4gPHNoZXJyeS5zdW5A
bnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BjaS9mc2wsaW14NnEtcGNpZS55YW1sIHwgNiAtLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDYgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BjaS9mc2wsaW14NnEtcGNpZS55YW1sDQo+ID4gYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxpbXg2cS1wY2llLnlhbWwNCj4gPiBpbmRl
eCAxMmEwMWY3YTU3NDQuLjZiMTgyNjRhZmVjZiAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxpbXg2cS1wY2llLnlhbWwNCj4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxpbXg2cS1wY2llLnlh
bWwNCj4gPiBAQCAtNjMsMTIgKzYzLDYgQEAgcHJvcGVydGllczoNCj4gPiAgICAgICAgcmVzZXQg
c2lnbmFsLiBJdCdzIG5vdCBwb2xhcml0eSBhd2FyZSBhbmQgZGVmYXVsdHMgdG8gYWN0aXZlLWxv
dyByZXNldA0KPiA+ICAgICAgICBzZXF1ZW5jZSAoTD1yZXNldCBzdGF0ZSwgSD1vcGVyYXRpb24g
c3RhdGUpIChvcHRpb25hbCByZXF1aXJlZCkuDQo+ID4NCj4gPiAtICByZXNldC1ncGlvLWFjdGl2
ZS1oaWdoOg0KPiA+IC0gICAgZGVzY3JpcHRpb246IElmIHByZXNlbnQgdGhlbiB0aGUgcmVzZXQg
c2VxdWVuY2UgdXNpbmcgdGhlIEdQSU8NCj4gPiAtICAgICAgc3BlY2lmaWVkIGluIHRoZSAicmVz
ZXQtZ3BpbyIgcHJvcGVydHkgaXMgcmV2ZXJzZWQgKEg9cmVzZXQgc3RhdGUsDQo+ID4gLSAgICAg
IEw9b3BlcmF0aW9uIHN0YXRlKSAob3B0aW9uYWwgcmVxdWlyZWQpLg0KPiANCj4gWW91IGhhZCBv
bmUgY29tbWFuZCB0byBydW4gYmVmb3JlIHByZXBhcmluZyBzdWNoIHBhdGNoOg0KPiANCj4gZ2l0
IGdyZXAgcmVzZXQtZ3Bpby1hY3RpdmUtaGlnaA0KPiANCj4gc28gbm93IHlvdSBtYWRlIHRoaXMg
QUJJIHVuZG9jdW1lbnRlZC4NCj4gDQpIaSBLcnp5c3p0b2YsDQpZZXMsIEZyYW5jZXNjbyBhbHNv
IHJlbWluZGVkIG1lIGZvciB0aGlzLCB0aGFua3MgZm9yIHRoZSBjYXRjaCwgd2lsbCBiZSBtb3Jl
IGNhcmVmdWwgbmV4dCB0aW1lLg0KDQpCZXN0IFJlZ2FyZHMNClNoZXJyeQ0K
