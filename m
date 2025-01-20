Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BB11A3029
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365112; cv=fail; b=In4CU50wgwkM49kpbW4W58Vr9dk5S96GoS7HZ2Op7Pg24kJlZG/XVIlxeaAWQ9OCiEVFwfZuf+KT1zknQWzEoBfCHGikcN3tCIvbi0M3008/TxvigBTXgPUYM/UaAc9N79mfdORxy0uNFoEJOvjlJgpkjW4LMgEWO9yx5mHRfNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365112; c=relaxed/simple;
	bh=h6wxAfwijUWH5YAUvDQ2GVNNTvVc/xiZ5ehGeCHAcbM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kleQn7txb9+kvD9ct7NurBdY2M7VZisFJWDDxiNeGie6fvnTuBn4yZFfB1yrQFeAD0bgCWZaUKIPs190sNOAREVhc+ZCJe+w7V+ugZ1jCWmjQYrdGSaUaB5a7J0fqn9zyQVxONXLYmO1WH60Z5Ue2NMqnAZdthky24jWDLiB4xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ibi6qIfP; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ibi6qIfP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVXrH1VlNWNqh7Uwi+6tZKnMcEGstF2TQI2IyeBXPpWU940218rKuHxYAk1gAK66c4TU/SYM9XHOuPpsp23DRHR5BSxE18vq+U478ofJz2sgiiuhUOHQBsS7wDOD7jvziiRLf5Xd4ZbrdsPHJkql0YDB/1oh6QCae4ZGRk6g7rKmlSdV/jaAwiE6/ytjEMX2+u6d21Sg8t0eyGXvemNSvGjFlk2Risy986N/20e22Sv4BHw+PY/0TXXBB6/prqmDbdbGp2iM16PX3X2/c04AeWirrYMJaw2pYlsumDIDuO81uu8FaorfdHg44h/pWqVWujIZxoYL2Rb69ZvWOEnHJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6wxAfwijUWH5YAUvDQ2GVNNTvVc/xiZ5ehGeCHAcbM=;
 b=hmh3vF2LCPwHVzcuPkK3puWfnheyKM70jj5yEu+H4mlqFA92PaKbGTsGc8Mk+38rmRJjamL7dD6wd7CuajtImOiOrXe41sYNs3Go6CnSOF/gDlV1yDVzLuwD2oD19DXm32chjxhB9ZX5Lns5nh25dU4ytN1L54EjXp5cJXntl9Wb8akJ4cwJpaOJ3An0HYtfoPktChSY2znME+fw3S/KzAJoi0uJa3IbCR4am+gzBXIHu8k0fDGXh10yNhAYDromy74a8Sc/j1nLHas7V7LuT674wEaA+8cN30edskgXDbkyWYa6kszHTlD5JJSrN1FflSCwH2eKtmjW31Yt6lyAcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6wxAfwijUWH5YAUvDQ2GVNNTvVc/xiZ5ehGeCHAcbM=;
 b=ibi6qIfPdyZSCmLkl2+riu+hxJWK08cNMNwbqPSqOuq0qzFrZJS3OplrX1ITIf5iGfYd2wq+3hL7SWY1O4d77RW7/+J9PrEKfn4yHPGjjCYR9reAvMgS42HfYGt09cSksZhFZe/2rf73BIzcmUlsynXVULQbwU+gXK2vqji5xP5FIBKWGOFAL3Af66qXqvMwbcuTVYn7TEpreyf3dpq0gmQ7GYx7K7ZZXhUqE/djdAQ8EF9o5fPpOeU6oO6JifWwgfxvh+uOFep0gi7RXvTesgQjHFk79n1YDUU6yDbT6wLPvRou10alg9sEJ9AGYgxEuW53v3OvcQ0Um94csiLtTg==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI2PR04MB10954.eurprd04.prod.outlook.com (2603:10a6:800:278::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:25:06 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:25:06 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Subject: Recall: [PATCH v11 2/7] dt-bindings: arm: fsl: add imx-se-fw binding
 doc
Thread-Topic: [PATCH v11 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Thread-Index: AQHbax0x7rla2vSU20uyfWB43qS7zA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 20 Jan 2025 09:25:06 +0000
Message-ID:
 <AM9PR04MB860478C7D0630E34BC01F91495E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic:
 AM9PR04MB8604:EE_|VI2PR04MB10954:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ad0b283-457a-43c7-44bc-08dd393453ce
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gq9KIbQGhtqdWbdcc7z1x+Qf59dt0iNdvfsAS3fWJ04mYAa8kLPD5ZqjF3Mz?=
 =?us-ascii?Q?Ywur1pn60jo8kp7B6O90RQ+WperI3G2N5N0aL+yzLfRDKDqrGSMNP7JlvT0V?=
 =?us-ascii?Q?kAYyjOWsJx/VXnFHaAzdftrIwxk8JLm3crGT9q6mG5H1gIIgzFCiQzkStRkY?=
 =?us-ascii?Q?hGNzs5OrMcLa1El91DHlFlausKS0VLRp/olDFHAnpNVIHvWcpqC4dvhGZEVA?=
 =?us-ascii?Q?CBrJy77CHQZ4Phk/u/9Whu1/WjFs6LoATl7KasSj7cjl8IMXCmrgg3KcZ6Wv?=
 =?us-ascii?Q?Lty+nhEIQw0SfQ81D4FGN2mm8t35AE60mb3J8upM26aw4uAWZqZRZbNcF/R5?=
 =?us-ascii?Q?uHeuUHYGExR8VG8x9QikwLTQTRmcN/GnjQNCHrNRQVVAZfpaP1IZ2JT82SYu?=
 =?us-ascii?Q?4AcQSPCwgRgsrvhXgRNPq+owDei8RnWu8RqtBNTceJm02mTXAFPG5R6Yu8fb?=
 =?us-ascii?Q?zqfVwn0E0uOPaGctDYkWjPgrdGSNbIizHcqr1pzvLqSQpUv1hTfFUOd1ScGa?=
 =?us-ascii?Q?RzWBIN2XwqxJc+aDtMAhGoknNsmMJow1+zhO55SHX72W8jF5/R5dwY+7v6lc?=
 =?us-ascii?Q?EGicC+WXqw70OhuxoV1EJ6XkUKgpA20/jACgZglmQAKcyIbg7xd9hiQo3fEX?=
 =?us-ascii?Q?qt7oC++/xZHAHZCZqjWpz4PYAArtr6VDczL2hJ3cdQmc/tWnxDxzdhJfkIa4?=
 =?us-ascii?Q?3AARCUlJNq2KfgO7kvXp75C3bcfK9GXlC4Yo5B0Bf3tsY6qTi+Zj5h72PYAG?=
 =?us-ascii?Q?jCPm0UKdD3E8iWZoO3dKveHz6Ib7EjiU7B7qwt245nvqH91TGj1JG2pxf//w?=
 =?us-ascii?Q?7bSk94gAspjxoBgD6Lo5tFp2BCHtue/zQD8t73YN35vlaWes+/K3qLu5YsfX?=
 =?us-ascii?Q?9RJN9ECoUtLhz8DuDHWe4OIDg/GEvTijDCq+CVXFDYtVIEpHPAye0mY176WH?=
 =?us-ascii?Q?B2BWqxwlAXcD5YtOYFARg3Fm17GprmXFfj9h8eO2iH1vN8nx/Q4qbcWr+isF?=
 =?us-ascii?Q?Sq3I6oRAcUgBCyRxW8i6+F1ZSLGtlawz1EMCbN9QAzXYSC1XBqIWNfF/cIIg?=
 =?us-ascii?Q?s7qaJnCy+PDV5lBiSCQ3ILMRyv08kSzJHI1Hdk/o7y38oTy4xEk3E0Uoaory?=
 =?us-ascii?Q?XMdUVx/UmidzfqiWlzP55fXId/ChGZQjvkyzejYU5RWL6Eo3tKGT2AtOPsvW?=
 =?us-ascii?Q?80PTLTqClti1CB73HGLmcshT2w1p7W6wZUBVX+vkztppuSi6sL5q6Weu4egN?=
 =?us-ascii?Q?2WcxP1wcSyGW+/nDKO/PobwI9MZSYKIetUkYFX/t0IP3GqUipqYQLXYEHaLn?=
 =?us-ascii?Q?b/QA/3waYsiy9XdOMnI6CySRZTQZHCZBmRrxBgI/HlAOGPY2hVvYvB32vUsj?=
 =?us-ascii?Q?z4Kzw2GEDSCLrRweMoIdkm9ByThAr8fDWN5opw+vBi30Dp4kOWHMuOUbE1+F?=
 =?us-ascii?Q?LoqRDidSjON8hr7FoBDucDdjR8jdAWYf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?svy6+BO4n/dw9G1a/uzzjWrhhl4cc2NdIdNsOqL9Yi1bQ/djCR38Z4IDa+e+?=
 =?us-ascii?Q?FNFuiufjtfAScMb9jX9mqhOTJNidBhgJvtO5qodlmJyXuBH2tGwkFyGq1Wst?=
 =?us-ascii?Q?n6NDmc6YUkBXCHEkxjLzCi9dYL/3CfS29j8oVODSvyDgGkMRnNmwpJYUGd/t?=
 =?us-ascii?Q?Ko6mDbVBwGbpJXxpGX+jDKatoLJU6P0kziDOBc3+UyVyaacRocxGFABjNUs0?=
 =?us-ascii?Q?XNCN84cEmfQgBMRVICrnerBSB4CMpCPx6BNgxOicO/ffun9TIEaq4fWuNJkz?=
 =?us-ascii?Q?V70UlF3uKVj4yOcOu9dG1mEVU8Hax2jorNCBsigCv3nrUtq7ozyiorKuuFPd?=
 =?us-ascii?Q?YbLxnCJogstU75Ql9B7jYsTLaTQr29rIyRxmE/nfYDNvoXyqrKJZSLZg+0XM?=
 =?us-ascii?Q?KxNpdd38Nif+DfuSovuINdABQ9srln/JdKdky+oCSFocvVzConY1bZobZ9kx?=
 =?us-ascii?Q?e33OxqJozxMarsVM8etcGlyxsuaIlCJqbSHSLScdDM6mCmrTISeES+TL9k8Y?=
 =?us-ascii?Q?GaebIshXI7/9f7H0mDRyJ5XonhsuKJA6N4widqHFdsGSkDqOlJZWgiMhg4Ya?=
 =?us-ascii?Q?VqYYF5yvVs3W06qHTx31BU1WknqC3G2s6CFet+B6DkUgeqNdcWIrYNEVtbgK?=
 =?us-ascii?Q?OAg4+d8LLffHClmagVPJgzsYu3DSVH4ZMgQ4aGxpyowMSslUK0t6f8010YUs?=
 =?us-ascii?Q?FLZy6RrxtsN0XY9bjSFhdTf7HEYfWlaTG+KzJwVEMUXGyKTHwh6kR95aBHKQ?=
 =?us-ascii?Q?ixyUgsHlF2dgr/2Xpi98b4NgbGivSW2ziw6pW2/Z8q9FwdPKuDfn5DMrZ/L1?=
 =?us-ascii?Q?2JEKUM5f4Z9PfzqO0bjRUSbCPAYvh90XVt83RQemGyg2sMgIWhJb5wUAdo19?=
 =?us-ascii?Q?MXWuh5KWjDEqD/7eRLxRdSmyUCfTcxOiuDUSIPB/AFTSsuORZAy2JUoGQoMk?=
 =?us-ascii?Q?lT4GM9rbiq/Z0c98Gg/Fwkhg7q84yg4ldAbKWqGr64mDL7qo40wzj/kqPJbI?=
 =?us-ascii?Q?o/nxUsPTKe2MdHxRiD69v2vtT5u+/gS6OCLVJR0kGPZIsxYYXRnWavYc14mb?=
 =?us-ascii?Q?qXrwo7VIddy2O1ApAZybz1n6ppaD0w9yW4P4Q3vx8oTBgfb147jaqKmV7mop?=
 =?us-ascii?Q?LmIutBdXvg/NvDBnjm/wZceoDINAblVWZJLBPOuCwMX138GMsKKQwt4PAx6A?=
 =?us-ascii?Q?fP/DH1h9CDNgIRG17lrYUVcUE4dFnSuxxaDqtiYNiE75F3PC8xOQTlkckmcY?=
 =?us-ascii?Q?l5nykgwIk8W5M2SCUV0gUyC1+Y4+vHKE3OeuDFB8U4OKRZ2NOdIWrIX8lkok?=
 =?us-ascii?Q?C4n2WCT2BlUbQUGISH8Sq4wcOdaXRF0Cw+aE9pCD64/3vkCiYO46AQ9zfh2+?=
 =?us-ascii?Q?pK47D8vCZngM0daf0vX3nwQZnB665ee7Yl7OAI7/2xquNy6QKfVnLnxlap2C?=
 =?us-ascii?Q?h+BJ6GuixMvlVnSy66os/GAHs3Ny0urPv7Qra1TOfHVcVbPVLjt/wmWX+K7D?=
 =?us-ascii?Q?qDUY9uni9kqOJtuwowbVUM8tM+JvkZja9+ikU/bXgqmOYouRHV335n5fdI9H?=
 =?us-ascii?Q?xjVM0L5cBq4fL1YZ8cOOavgSoKhAiu9Znfj71DS5?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad0b283-457a-43c7-44bc-08dd393453ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:25:06.3210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C3h0/kdsdMNZqqk8VUWc6vMEKeRFGI0c/eAcSd6JN5EfSrJ2dTC0nVy6IfXhWJttsdg8HeeOKPh6K2pn++e7Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10954

Pankaj Gupta would like to recall the message, "[PATCH v11 2/7] dt-bindings=
: arm: fsl: add imx-se-fw binding doc".=
