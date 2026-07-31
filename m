Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD52335B636
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487365; cv=fail; b=ZYYwVY1w2uTn9bwEWNmtL08ewQAxI9wPPTz48u6HVgbounBX7fGR/stuz2aOVPqY7WqvIIdDy9GOL44HhBqAt6csXxcrJpZoIJGbyy4oj1SIsvzaSKW4xs0G/TlQrrp4nznoqvvdk6Y2smfdtc8vza6tnTnA/V/5Pf1Syfm5dUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487365; c=relaxed/simple;
	bh=w2WqLskbFGz3Ttj4qlzqzaN+HlKnYK0r8jKkSuT1aLk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f54xwuQJD7iRJc6y0L+jNq25nzRxvw4Fru4OXzQUYwdnx7Ygwrc948Ku6EqFYToHu3v/kbVzZ/f7uM7syhze6M6mMJ6vfiBQi4PjYp/7XJvv7HifdUzdvLYZpZGUK9G6l4p9N5nLSL0O0XHNyFseeQ/PLBi1lJHMoqkRNnne36s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uCldnilB; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uCldnilB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbN9gfVXAomPQBEv01nxrGVHT3ESfOrnpv1/9SDjzCHD5iO7ojXr6UwAAMQxXzNL0u7pCxGnh7a7Ucx93yOvSvmL+fe4RCMH/Idjy7Dr1uA8pGyzDN6e0ST4Cj7SKn3KOS6/3X11h+5o4wNX1zBMQKau9bS3JjWEqyWbIuE8gZdBkeqX1Mudo/sMpErIH4TFSC3qYOIUsctrsU+DOb6GMN/a1rMZPVyBzOwP3KD/DbnkTYjTtZT7RBFXwsHWKv4XySuroKKX30pAhI+n3qHfekeott7sbn62UD5fHGG6Nq3prDiaKo/7VXvz/hX7q8+8S/Z68/8rwPR7EhCSUKwqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MD/Clwhj46y0k1NhwZe2TGLCqtow1c3sapX+eztVfeU=;
 b=En8jGF6gmoqA3kddI0qB8c+FjxFxB6EYumPDEKuwZJY1mJqFwhmeyq0VXY5ZPzcsTKyTXVZ7MF0wKHEYk/9cIP50G3WR2r/jc6bOOJFdtr9NNCE31WKnxWX0l93o54O9KYX1IC1dETyWvIJwRU0SB0MPzLe/Jdzt9nfMzlxv7ogMVG3Nsal8gRelPAEMSZRG2asMnOU+p4e7nET9R9SFjXgz493+25M8korijxfnUed5mTLUgHNSseNBj9y65aFk1H0pxReQCT+kDgTRNO/yqgAHOsawvEustvPeIzw8O1qTgdHYKvT2WSTidgBIAsPGz8m9GRlw/qaPvbgij2ECyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MD/Clwhj46y0k1NhwZe2TGLCqtow1c3sapX+eztVfeU=;
 b=uCldnilBFgakTNfdZpdN1jEGjZKIaVERcZ2O6EW9dI7s2qUIgNlDv1MUopI4EAAYHo7AINoEtln3GfbzxLNc+aAJqpVj+E4dyMkWLkSE9zpw0qu2eZ5szKvwuv/trDbm+9bjXyfwcia0m0BPyDaii1f4q6xGUYnmxM1CZwDY83OC09NgWIrKIPjNxo/7hesyNrpr/OgJRVsum1HmXfWV4ZezE9usVLgmHInAur0cY2rP/iMKIwhDEOnGvxhgIklJzoFnj/gUxiak5Vpzq32mHsQJ82BeZ0b+ugkUnUUMJI3//0BfZijq5FzOpiZ53Z8GdnrJjxB3vaSGJJh7ozHEvg==
Received: from AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12)
 by DB4PR04MB11277.eurprd04.prod.outlook.com (2603:10a6:10:5e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 08:42:38 +0000
Received: from AS8PR04MB8150.eurprd04.prod.outlook.com
 ([fe80::24f0:af2:c6f6:38f1]) by AS8PR04MB8150.eurprd04.prod.outlook.com
 ([fe80::24f0:af2:c6f6:38f1%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:42:38 +0000
From: "Robby Cai (OSS)" <robby.cai@oss.nxp.com>
To: Andreas Kemnade <andreas@kemnade.info>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 1/2] regulator: fp9931: Fix VPOS/VNEG voltage selector
 table
Thread-Topic: [PATCH 1/2] regulator: fp9931: Fix VPOS/VNEG voltage selector
 table
Thread-Index: AQHdGPc4CQYHDSWvREW3SsE7331JFLaB1F8AgAWI+SA=
Date: Fri, 31 Jul 2026 08:42:38 +0000
Message-ID:
 <AS8PR04MB8150F517AC1AFB311919FCA9F2C82@AS8PR04MB8150.eurprd04.prod.outlook.com>
References: <20260721095959.1855436-1-robby.cai@oss.nxp.com>
	<20260721095959.1855436-2-robby.cai@oss.nxp.com>
 <20260727220438.2a5bf1a8@akphone>
In-Reply-To: <20260727220438.2a5bf1a8@akphone>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8150:EE_|DB4PR04MB11277:EE_
x-ms-office365-filtering-correlation-id: 37525b16-e83a-465f-ccc2-08deeedfad71
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|11063799006|4143699003|56012099006|18002099003|22082099003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 4IpmLDMS/ZiXUhT1t15BNtwZAb9RBirI0gCL8KdAKRhJFTs+34lZyNIqAyHQ2MdIPAKzulxhOzw/nzby+Ov0QJZsphyMLB48EbFy69GU325WFG16ks1wmsd0Nr3RpnyEpR1hmLBmZKDM2IgsY3kcspWXdBQhn53mxUimyPdfi8XbOAhtCWphbgraUZkbm9JBQcuIJSXLfIS4NmiCCLMi0BOkTqQI1jjSH2vpcJde6ApJlSigpL8whdfCW+f6S2vIxFngchyqZ8uVEpSAKTnmK9bzQaNL0z4AiF/w2lel19ugzLoVGaLC7y2u0aXvKBd/t+V3s1ig34SJO52vwsAzs4enD+hYEquPQ7cghFLqF+/5OzHKAG37QVQVRbH1xLNCqYEApORIduexdxLwqJqT7jZElYiub8Xi4ucmmsj+JoJVzb5gbvlgss1NkKtdbsdIxwWLH4TV3DQBl2IS+JEAOWiMKIifaYX0Pf5sNLdQMDNexAmmX4xXb6QqJ/a0veICog/bXS1+0sOE71EBFPsPq+WRjknJcufjsqV7c8KdjiYAtOYFyc/6C3KzSxRA2r6cYfLVLuSmUNos+sGuIla/SukiVa0ZHTUyp02ruYHZ07YG0oMJj5sFdX1PI2s8Rw4OzWw0/Jk9mQGm6o7GD3zf4H6r0O0SQKmqVpT5bc2PZAELsckUhBdepw/r8dgIF9JIQ+cL/eOFdYPKAuwJXamoO/Pp0UPuD92M+F1zGNExVhQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8150.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PsmvqwyxgmWl26ntHQftVphBjxWXwazdSf39VnoJ5kK6upnMwsK5LVMahbh6?=
 =?us-ascii?Q?+dTClyrwoA3lMEF/8PE4NUL8ihM+bOtmrdhk8ZM/bpl+a1zBLi07PyV1QOpi?=
 =?us-ascii?Q?KPvhxHQlTAt4lCiJT5llmg4Ay7VwhLcwZ9iGZ7R8h/85bbOJMXnQD11xeD7b?=
 =?us-ascii?Q?tjeXQGepEtGPm3YBp1gPfsLw3A7H26xc8MiCTPFPHJea16KZ0U0OW+d/CGxP?=
 =?us-ascii?Q?57XaoNu81eklm1cpvVnwP/BY8UKGDuSy1RI7Ztwd5+3fnFaikbVGPjh54Bsc?=
 =?us-ascii?Q?ldq0lAY5qQKrnWeWYru46Kf/drsarThEULlOIJniD03WMUnIllJGI0w7Uccs?=
 =?us-ascii?Q?ltXtEgEuU5+3J9iuR4DvqtnmhvvcD/gbEaiau4RtBMNJLKn8deef0Q6ZPh0f?=
 =?us-ascii?Q?hkmHqqMSc/2UxX+Y3pZIwKcs4kDk7zZlVxTBdBiRi+G/Q02gzY1MUbsBKVbE?=
 =?us-ascii?Q?3FDDWrjxLvjatp9VQJe8fSX0d6Unhjy209x32ojIEn3FVOioNYSeQc9lI/oW?=
 =?us-ascii?Q?iJtXBqb5ABHkGucr6Cs6+NWIstLjqF3fWvukm7wWFr964+piu9NOVGMntgyg?=
 =?us-ascii?Q?QFMEEHQS8hYMCWf30LR1PbBD2sEwmXn2z+SrpmgWoDEYtvsnSYao2cu9nyUF?=
 =?us-ascii?Q?f4FeK6mEm3lMkQICXP+6UYyjVtwl4g8WwW7M6K02Q0iuZBWEoOb7QdX12b7a?=
 =?us-ascii?Q?087E+j+YNB0OtjsEPk66p/eeX4RE+wKu/+niOpqFZ5POkprPtS4ne8AaLO0W?=
 =?us-ascii?Q?7wqQHlj7fRXh6XF+uZaYPtkn0xdWjG3ysqKGk5N/5wSvxO5a+4d7+cemUWO3?=
 =?us-ascii?Q?qbA9VOuLu8zB502zSVy7QTBgh/+EnvVCf/eKZTEWLZcMO0m5Bjmt8pxjtjw+?=
 =?us-ascii?Q?f2Bj/GKv43xXGjwDfsO+elynxElrkxFz0zhMFAPU9ia0tpwCmCCpXjxLiP9w?=
 =?us-ascii?Q?Jr78/rOrXxjRTHR3fLaalNWorsyJ8qykmSzMOimQnEifIFWD1l6k9PVjT5Nw?=
 =?us-ascii?Q?zLQapYZ0UxaHNUAwGyPveTLcMbuSTbdB23ezTWoYH19mRVbPHFfkYiMNC3u7?=
 =?us-ascii?Q?fiuyCsdCHyKSHGP9IMTKzzinLfchdCRzojusoiAQFMWoIViqWkCPtUUV5tEN?=
 =?us-ascii?Q?oW4DaZSHDbHZz+zgPHZ8XC5AvJ0e8qRIvVdZ9oW0DMzKuGSGJ4nHpUA3bf0C?=
 =?us-ascii?Q?Ia7oWyd1zwliP1k0MhP/9Lv82sflBdwHw+qAMbIxLc/iOj0dkqIrywpBp2Rh?=
 =?us-ascii?Q?sDu3HekwWdaIsF4FG561f5kWBzbS41yEziiX9YxaAQXc9XFz7A51Wu+2lmGj?=
 =?us-ascii?Q?xFIEGL+rsSQ7506EL/Exg/k1/MrwgmB3478+w+awozu3vZAR3awStr2M6o1B?=
 =?us-ascii?Q?BDvK+EjP8Qvx/cfyb8Sdjh2tr+uBND+hqsvUS0bWeH7WwbY5r+qz3chl8Kfh?=
 =?us-ascii?Q?S7+6VFDgiPMK7maK/NLi/qY1yYzrK0GPSEYGrgm4CR1impGqEZt3Q6BWQCdd?=
 =?us-ascii?Q?ryZDTSb+1t52FaLfo/AXq8Yrp/coQQEN4yZnWpz9yy59hJoeYMIRCRIIacqL?=
 =?us-ascii?Q?QKGi7q+cNvDWZL5kj42DfuIkYRE16LGGDMyQTYxdnWkefqQRMYfR+9Shp+Tw?=
 =?us-ascii?Q?HppKTW4PmZ1DvV0+EZsGetvavPDGTRxzFf6aENi4QkYFQkoRsqA9LgConGhn?=
 =?us-ascii?Q?WM2peo0LHch1e8SqRmXmcWHLJvqRxa7hIgn+53eql/69MG6D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8150.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37525b16-e83a-465f-ccc2-08deeedfad71
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 08:42:38.7864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aI9MVFC0t4ewq4oPHYrklqH2Z3JSdjLpe0t2pMZ+mG6Tv+5OPzP/za9VF8v0pltmAx3E2qETZwKHcoYlBAM14A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB11277



>-----Original Message-----
>From: Andreas Kemnade <andreas@kemnade.info>
>Sent: Tuesday, July 28, 2026 4:05 AM
>To: Robby Cai (OSS) <robby.cai@oss.nxp.com>
>Cc: lgirdwood@gmail.com; broonie@kernel.org; linux-kernel@vger.kernel.org;
>imx@lists.linux.dev
>Subject: Re: [PATCH 1/2] regulator: fp9931: Fix VPOS/VNEG voltage selector
>table
>
>On Tue, 21 Jul 2026 17:59:58 +0800
>robby.cai@oss.nxp.com wrote:
>
>> From: Robby Cai <robby.cai@nxp.com>
>>
>> The VPOSNEG_table[] mapping does not match the FP9931/JD9930
>> datasheet.
>>
>> The datasheet defines the VPOS/VNEG voltage mapping as:
>>
>>   00h-04h ->  7.04V (-7.04V)
>>   05h     ->  7.26V (-7.26V)
>>   06h     ->  7.49V (-7.49V)
>>   ...
>>   28h-3Fh -> 15.06V (-15.06V)
>>
>> However, the current table maps selector 0x05 to 7.04V instead of
>> 7.26V, causing all subsequent entries to be shifted by one position.
>>
>> Update VPOSNEG_table[] to match the documented register encoding.
>>
>> Fixes: 12d821bd13d4 ("regulator: Add FP9931/JD9930 driver")
>> Signed-off-by: Robby Cai <robby.cai@nxp.com>
>
>Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

Thanks for the review.

Just a note that there is a v2 available:=20
https://lore.kernel.org/imx/20260724103441.800522-2-robby.cai@oss.nxp.com/

Compared to v1, the table has been updated to cover the full selector range=
 defined by the datasheet. In particular, selectors 0x29-0x3f are now clamp=
ed to 15.06V, matching the hardware definition.
The main issue fixed by v1 remains the same, but v2 also ensures the voltag=
e table correctly represents all valid selector values.

Regards,
Robby
