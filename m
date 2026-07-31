Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013059.outbound.protection.outlook.com [52.101.83.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A083AAF65
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 08:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486958; cv=fail; b=cRMkqxBETiVgGPsMb9bMSJWaYzpEJdoG8p2ALo5taJfIT22SspJLrrcxHbfWzVir/WUEufaX2bEGvhn0E62CtQ55gQbJaNv/ETh7oHoo4Ta/b1uFCHGq7oeZkVQL/abAoqExkf6poV3FXSBWBGQSyMpufpL4O6SjKe+H9VGIDjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486958; c=relaxed/simple;
	bh=rshUOa1AfvSvMGCtoDYacFexkhDZjjEO4k2KMqANRFg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tb0ZFoTwgaKuMz850UgJKgKrF87jB8NoNxf09hO43r6U1iiDEwN014Nxshhbhvh1OxnQf1p+NyNMp2kLuM14AwxLIbOZvO2zO/tSY20/jv8YJUqRFz1viJ3yH/jbPtasMoPndK8NTJZhCWJGbOk2TeTaqCwGc25dZb3Q+Dwpol0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Kqk2VcPJ; arc=fail smtp.client-ip=52.101.83.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Kqk2VcPJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbS2kC9Lz8qbetr6aGbgshItuTf945fooldMu50ky9Mvc7uwQdAxYaHdYRUQhhhqWokOR3IU09CcV73mHGVCeDSdhjqoQhbznz5MnvT3jXqMh0cxelPX5xqtQ+N/JKIIx91XzMro3k64wX4Ib7ZJrvY49sA8oGBZXFesVq7bCcSO3Ddjr0J2UyindHO6mGMIS+tFrqz67eJlrlBzI3+v+gXNLlc3iuAZpEtP2abwW5WJ9YJJ234u3damwPjvnuumPSzsWNS9aOUHNd0t3WiXfx+PgOx94KY4nZGxWT5/wSRvl0ZKxu3iPSObREpACnZaSoSLAeQG81yKXYgz2XfrFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcbglO6TSUA83ADtMg+S6aGmH0awNPeE6tbWEjQhSL8=;
 b=tkDgLQeNLt8/w4S+hg4gI3wO35FhpgQT3/68cozObhL/wcEs8C+7bEwGCYBsWaocXYC7vihzds4i63EAapIuqhJ/utQzf4dPLReQlctwSEBY+gJIeqkbgzuzpr2Edgnz0jp8JpKvC9T05xwxDEgOQjVRHN2NsBShYigFixVg0MmrlSkqAtJYiGMC5FtrNyvFsgtamj4ezQnwp6DGm5cNJM0SsecEnerg7i+ISSmJnocU9XFcMehKtXF8whf57QlheTydpfocZ4ch+5O1Na0DY899OFYzozAkuW2GDwdJiyDyH+E3XhC5NFZFQvATueJOK090o37m7MzBRcaBz+0hMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcbglO6TSUA83ADtMg+S6aGmH0awNPeE6tbWEjQhSL8=;
 b=Kqk2VcPJghf8KP8KHdHltgPsHrx77MPwyWM39VjR4BP16UcZSVazq2YVu+X3pssUe5sttEhEoHP8V5vY5ZDW4v+sGjwLD011tJzx6cqvmFZXjN7XyYXPpdHFxlvMD6gXl4Jq24rFC6Bvbs0LebrIYCusRSduJfXTT9W2SZCXt9FBM9h32K0ujTBiRcYGeUR/y/D7l7FcrNc0KsBAiIdcBAJBJGp1lR8MfmaQZVdyPPzQIbDUiHsLc1VjLGTcdqiIkm8NP5RQiJTvCx4BAvM5yekUWNehUShXyzLbR8vRpHRwHZYjs9pcWqGDf96ZQY4CEyMLvQnKQIUW947p0E+sPg==
Received: from AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12)
 by MMZPR04MB870775.eurprd04.prod.outlook.com (2603:10a6:190:53::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 08:35:53 +0000
Received: from AS8PR04MB8150.eurprd04.prod.outlook.com
 ([fe80::24f0:af2:c6f6:38f1]) by AS8PR04MB8150.eurprd04.prod.outlook.com
 ([fe80::24f0:af2:c6f6:38f1%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:35:52 +0000
From: "Robby Cai (OSS)" <robby.cai@oss.nxp.com>
To: Andreas Kemnade <andreas@kemnade.info>, "Robby Cai (OSS)"
	<robby.cai@oss.nxp.com>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2 2/2] regulator: fp9931: Fix Runtime PM usage count
 underflow in v3p3 ops
Thread-Topic: [PATCH v2 2/2] regulator: fp9931: Fix Runtime PM usage count
 underflow in v3p3 ops
Thread-Index: AQHdG1eMFsds1/yagUC0nkA6hTW1erZ+pyCAgAitKIA=
Date: Fri, 31 Jul 2026 08:35:52 +0000
Message-ID:
 <AS8PR04MB81507E9D056A99F43F09C9ECF2C82@AS8PR04MB8150.eurprd04.prod.outlook.com>
References: <20260724103441.800522-1-robby.cai@oss.nxp.com>
	<20260724103441.800522-3-robby.cai@oss.nxp.com>
 <20260725215055.6239bae6@akphone>
In-Reply-To: <20260725215055.6239bae6@akphone>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8150:EE_|MMZPR04MB870775:EE_
x-ms-office365-filtering-correlation-id: b88d2ccd-f4d0-46e5-e409-08deeedebb7d
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 Qb6u+xb2sUpdEk+DbUdlJ1mc7Re6XsEMrsYmIlJwHpmaOwZliv6nyq4GRQ5NWG2ivv7MXaZ2yK8qjikIHfcSoRzJdZ2Hft1jUtjCULCwyKmZQEJCgH14hTZxke6NFuOWDhlWy6A3hmT1O36EpJp2bew4iqjCeAH+p5Jpep2Wtb68522fqVnR2SfGg86/1SbhSPuXRh2KqrEK0ZeLhOhWxQNwuUW40643I3rrfT1GXe83E1vTReDB9jRtGpX5AaufsU3mQmjLkN91UhLPK57+SCo/Z3MUNDyDD5EP7/gPNVv9mnmaazdrByTjDfnwhiZEry+aMUk/vJfrgKXOOFfDs1/4wqQXNc45hrMvlIXc9fcc5AZ4p8xLMGPo16ewdshKbI0igJZdonYP/EmqLG6+vsFPDRdRG+pqA+TJpi6MDwNlyrgnfE+ID3G6pmoyJCMGA0hZ+NjzVCWuOrm/u/D6/BMq0ExvORw/5JUAX28PhxUPWFHVHvtVQhZq6vuhhDu9NmIm7CyB1/sfQrazcoGz6bfc+BX/tGM4nkzQJMk2UJqmupTPCVV7w9cVH2lM0Mi3+ZkBbYONsmGdSMw1xu7Te3NKA2qessC2XBEMrYnQ6NXGsDnzLLDzbRjNz9nM0uV8/JXFiba6T+TzvTyC4z3dMXCnsAzH8a3L1Cpl9m6y6eLE1TlCdAkRyZPlZnPuyo+psQ64ng/GgfzUjwEKMp17MQW/ydIeexgzLPg8STtIB98=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8150.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PwOAj+AUxSBo3FwFHBozN0gn1tU7WXhtX0JxTw+6kSL5SOGM04Rbw02NkW47?=
 =?us-ascii?Q?9FAdX/Qwgjk8sZ2NyAoB/XHuJEtLeWlX5xltPwB2QcG+vgtv8oqbvnyK3cgp?=
 =?us-ascii?Q?ysP7T91eSYkv1hVxdmDiOuhA8GhsBUUWAHu/3meJaHvLs7YHpsvWzd3R4bdK?=
 =?us-ascii?Q?lVse1wn2hSDufIUv7cfuPkSziy2q7lMq23DDapuqfEfEIbEGlJLWG7amRE0n?=
 =?us-ascii?Q?ppjxsW/9pCh4r09jG0F5j6sln0tM/7iErCIEYeKLNWG0jbBTt5162pQJNGAI?=
 =?us-ascii?Q?ROfpkQA4iPGsotY463dvQd3czgY3tfdTpAeBJe9yVR18LdeOJ6bAUd4Ujvzq?=
 =?us-ascii?Q?qobLM046BAHubotnzVJqpA0LHOPv2iHzlzcCVHE+42Lnp+VmmO42TxlUIjhU?=
 =?us-ascii?Q?rKJsGG4/80WZdV+nSXkv+SUwSWl0Q88q9OQXMqz5imKoeDA+vVOt1xT++eg/?=
 =?us-ascii?Q?QhdjG0LfjUrKdB6wLwdbSkaZn4CY+k01TXgrG/AKbgPgoMfPzuyrbm3Atuim?=
 =?us-ascii?Q?NgECyTmZnAs8t47oL/zkjH0XGEtNDREaYtZu3OGs8kSBujglIbcNmjyrlnza?=
 =?us-ascii?Q?aTB6HJ5NkM+1RoEgVLsJZn8VkETQMleAyFMc8ocA0JloUT7G0E9te1IyVZEN?=
 =?us-ascii?Q?CoDQUCTFYl2x62wItPPALnSTrdnPYkeazo3jDjJAw5G9oT8FWkLWQ2refH/T?=
 =?us-ascii?Q?AXrsPBTB/QNygGdfmUq3k/uWXTPa2aLQG6LR5JzQ8dCdOPQYXHG2qZOqpW91?=
 =?us-ascii?Q?gzDhAE6cA19Oo3zqa1QNXM2i7pN0JA9TGZR4or2dRGvLRuQwwgTG4IBygrvr?=
 =?us-ascii?Q?tcZ0v1w6AXEOtyzhis5FYeydhqhZ8mqOPg92YcDUjuLN48mqxBvCjyrSsD92?=
 =?us-ascii?Q?Bvyw1N9yYtsF2XtEsiiERmdcgRTRIGXXcyetUDCIAVJGXrH0Pm3frXOYIbDK?=
 =?us-ascii?Q?1PbXaXdZB6IhIO95ZC6JzmOFEDI2lsEpUqwK2c6UoJpNqSF+BdywIZbr1lCN?=
 =?us-ascii?Q?oBpvaKCXdNRu5ibzv0otSePopERCzYnCEdxUUC1582yZklwlyw0gyIPDW350?=
 =?us-ascii?Q?eJSQVusBf+gpYaeWE1JhxAXWmfGKYENPXcXc44Uf+FaChM1zWgwQe6S6XmBI?=
 =?us-ascii?Q?JCw/R27PcL/c0TsNDfIHe/mDRrJt1eT6QMztbc6v+uRz+BcMk/2hz8waa+g0?=
 =?us-ascii?Q?VdZJA49dxv+JDYS9Yg7yBeRlUccfbhtUi3sSzEwua0A7MxrlkTNaKyQUGopu?=
 =?us-ascii?Q?51Pik6qV+MbBNOE6UmftTSLOU4xgohWFnOkecoeWKQeaEhb9yhf68BXyNYKB?=
 =?us-ascii?Q?dxxDrq91SuqLvZT2c3ZSH3FNzcMK9CTmG0Au9tcJ2ZGlDb3/eLKCuRyMuQiF?=
 =?us-ascii?Q?Y+/u8OGQxLd2CKyrqrs9WfwmQEX14aOTgbCB5atMu4ExIi/R9DAfdxA7ADkX?=
 =?us-ascii?Q?8ViYucLmIcafhW/lhxcXm4Sa7/bn+NQRHxZLdZ9lV9Yeo21QSW5Lievy3XVC?=
 =?us-ascii?Q?tKMhq7XMG0G8dsaaod4JY/Pi6AKI0dIo4AVTF+/Vq3kzVdiSuxYdtsaoi/z+?=
 =?us-ascii?Q?Nh87Q5beKwEQJOoQJokNwFsZqhNLK68NPOTdxbOScS7MEWjfEw6+RKGmUFsy?=
 =?us-ascii?Q?L0dIeqFYKrKc6K5Wlc4Ic9KGFMhc0Ejzi29sFGJtpCR2earsAIWgaAX5zPcE?=
 =?us-ascii?Q?jiWPk6esyPx95aK2yfhF0Fq/gO9oe6OxylNu8UUS+1v4V9yH?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b88d2ccd-f4d0-46e5-e409-08deeedebb7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 08:35:52.7951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJ3ikZrhKtwqWwN4yjBoq7Ay5BS3dBEkUIDulkp+DjUx+zSK4hJG82rZegW8CZjfUHyXh49KjVEb8TSAgk9g3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB870775



>-----Original Message-----
>From: Andreas Kemnade <andreas@kemnade.info>
>Sent: Sunday, July 26, 2026 3:51 AM
>To: Robby Cai (OSS) <robby.cai@oss.nxp.com>
>Cc: lgirdwood@gmail.com; broonie@kernel.org; linux-kernel@vger.kernel.org;
>imx@lists.linux.dev
>Subject: Re: [PATCH v2 2/2] regulator: fp9931: Fix Runtime PM usage count
>underflow in v3p3 ops
>

[...]

>> ---
>>  drivers/regulator/fp9931.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
>> index ff743a8b0dfe..0d926546221a 100644
>> --- a/drivers/regulator/fp9931.c
>> +++ b/drivers/regulator/fp9931.c
>> @@ -214,8 +214,7 @@ static int fp9931_v3p3_enable(struct regulator_dev
>> *rdev) return ret;
>>
>>  	ret =3D regulator_enable_regmap(rdev);
>> -	if (ret < 0)
>> -		pm_runtime_put_autosuspend(data->dev);
>> +	pm_runtime_put_autosuspend(data->dev);
>>
>if autosuspend kicks in, the whole chip will be powered off, so if no
>vcom/vposneg is enabled, v3p3 will  also be disabled.

Thanks for the review. That makes sense. Please disregard this patch for no=
w.

Regards,
Robby

>
>Regards,
>Andreas
