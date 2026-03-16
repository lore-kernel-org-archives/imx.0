Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92158349B02
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 07:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773645882; cv=fail; b=qCvXCinn2hfpyQFOXbWXj7Nnlb2GRYMgc2OcAZ4/+7W9PC7YnrfvrLdRgKXrigLqEBGkaUglxfgQp2j4vRKsfpZxHCfRksT8BkHoklTQmyAcj2Dw/nHEY6A6LpQkSrjgjIN6zuMGgiz9xGoyyZStsHjLHvZYRqycthNmXoUgIG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773645882; c=relaxed/simple;
	bh=kTySurnwlvjgAAuy1HoP6qAj28hHAWuIyU2YhX6eIpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YYVoXLwm7OLK7f/pLs4AOIURzNi+Ms370olXoGgUbvO37a4cJCCpFobjaBr1+73bZddub/GoE1eOHKUzxtz5Y+x7tIrBj5K3FFrMRX3m+tjLFOJCTlITlK1TiXNiVie3uG5UFye/EQXSzhVXD5ZHS1D8XpLv8f3EK5wJXDcPAHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GXtHaW7W; arc=fail smtp.client-ip=52.101.66.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GXtHaW7W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtV7qJo6wEwF1p1UlBkX3sxVR4QDo2pBsc3drueu7qYoIIT0qdWqyKzSqKETfznz+/xpT5/6sl3uD9JnRqrDs1UoVIbEbilodiQl9Qwxyq8Zvu+Plt/y9qkYc/qb8LwaDuS+gK9ZEx+hkNuRo1MvOhD42uEDJ99yvgg8RBIEsaHsVXRZOqOCaoLnLPVmZRFAcoWLdY3+8MfApWUdtKHvD9l1oXm2CQ+YNzSPMMJP9toequg3MXIdS8vI2ESPrfMgN5RuQH34oIbQe8o8t1BayleEX3CyFCXNPwWU2AfRLdGardIVI6KTZ+mCSDm3lLLX8rxYEmLPtoKxd/n/jSeWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gI4KGmSX6lXqgEUEXmRk02EDGrFlKGqkRMyHHXcL+uo=;
 b=sRA8DALKmLe/+hlE28nBn+tkiSk6mQf+N+stdOA6pLcmcll2S/aq9QNNB0WRgMko/mMcEuumvUufl6XRx8X7fEM5lLclZuZb6ktdjgewbNCfHblByESX9H83kpbhuTxV3a4hAgbUf/g0k2q+pr4l4rLQ93ic5b+623n4JZuyIP4DEs84SERQFNN223vx/9vn5roNsWhq4cev6QaiBgwNWwUOTWyA7seGUahqbEQk8F3zNcEno6OR2+AThC9GYfisl/zzLi3d2LawPyQ5ptP0fdJqLXxt8444IWxcAv6jI3iViIPA7NiuOHyiCk+bSq+jY26494QxMjNwgnYWstFlLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gI4KGmSX6lXqgEUEXmRk02EDGrFlKGqkRMyHHXcL+uo=;
 b=GXtHaW7W/aWKevIZE6ZEdzA9OATyN6huCK8Ai4WC6mO7yIBeVr4gJECnrHCPxm5zNBjpt2/+B70tOUyD0UYATkMb8b2RJCtyO7qlXA3zOF8R4eF2UU7sfEQzKx+r29FccNVOBZL18vAoXuk7hu2wmqv5aj0mdm+MY3/3+t93JZDxNwWzPg6tBe63Z531B6ee0TMQC1jMtREohHdkMpWzdGrFIeFw2mmxXDr7kqnpG6hWs4CRpeUozGfpuIF/pYiVDGfGe7dR0vKZEAek7qXH7QLZpa8JDfU9+O6moUcnm+wzC4GAH9VDMshJZ16MqOlqZYlLPeeFZQQSjCHC51RqFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by AMDPR04MB11677.eurprd04.prod.outlook.com (2603:10a6:20b:718::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 07:24:20 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 07:24:30 +0000
Date: Mon, 16 Mar 2026 15:26:05 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andreas@kemnade.info,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] regulator: fp9931: Fix handling of mandatory
 "vin" supply
Message-ID: <20260316072605.GA3683539@shlinux88>
References: <20260313133102.2749890-1-robby.cai@nxp.com>
 <20260313133102.2749890-3-robby.cai@nxp.com>
 <20260313-antler-unburned-3af789df6085@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-antler-unburned-3af789df6085@spud>
X-ClientProxiedBy: MA5P287CA0069.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::17) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|AMDPR04MB11677:EE_
X-MS-Office365-Filtering-Correlation-Id: 461df0a7-3395-4f82-8903-08de832d1036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|19092799006|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	TZqjgUx98JlKNiRHpYSMgtvv/9C2NAmAvevMRtfFi8a9g7+eCBvnImHjSqzdowYttfPsYCYj2G0Am7k7+gQg7CvpghJfiTD1o+C7lgKTPPcXW3cBotv6KJU9yY7LVTzndjCPz9NjEMaIkj6NbObP8macaQNTgKmzKHVI7OC04VB8eiOxasvKtsPe+tPqFKW5mPovCsmYBt/d48kgvHYM4JpInXZKarcfT6RIJzsrE1fwwaUbMc2Wz3+r2iq/RRkkhS2jxoYi3nPDFU4Ph3RBOReRppAySylyvOee3GQ1VJjYE2Rt5mp5H0JdffYtC0CA4lnJu6NF94PrSKF2OQFn2WB2ZrZfXShDEUwbDB/eYAQYeGoCH891GNNOFS9MnNpLT2D1uTMk0vwUI9UR3kJe1dYJ5dwkx2E140xIlrFyiM+iZar8HANjUavoPosj5LqGtzuEApMkgpIM/ZgNYZpWPy87Igv26vgGT0ysWt0ecyf0MabFOyaC1dvkmfz5rTx5Peh6eiPboKx0Lk7G07qQhzTJnOeLwGQrL5tPFdrTLQtAF9BllcnNHcK26IEhisMEjX9EztgYTec9x4oAyunNJ1Fv/9+r1cswfvCNwNXnnzEbhfGpsNIDSzPQfl+RonEmKpVPGF+fhnZjWTZ+RX4VC9Bj6XJKfL5tai1kARUnkBQ6ZPJee5gk237OotLqE9RBm3FmaJRJHVh5ElfUT6sMJvhAkvXNEqk+rOHYXYUB8bsbhLZaMkU/LglGz5rtVO4MBOiaWrFk1E/Kbab8ARs17vyIzWK1gt9BidjiDCqgWng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(19092799006)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eVbjEc9hYiJCPaXJO0qTiegLw8QaJj5CQbde467y7p5/Ew+bxaIPIIQqliaW?=
 =?us-ascii?Q?G8y/OS6ATQtn3Gcg+0xtU5m7WVHqMMsgx3p/F75UZqhrX38O85t1mvFs0r3Q?=
 =?us-ascii?Q?MWkCPwUXkl0qMKxjIJYfYVeRRNjBTU2jfAWNjR/S2KhPh7LXtaf6nSk1qitP?=
 =?us-ascii?Q?Qdr1R6MfbbKMBLbusNs2QRgFhoAJ856yk1yMFkBD8HNk32Kd5jgWinafFjtw?=
 =?us-ascii?Q?cFDvB2q7eL8Kx5ND5mDYyXJjeGmmcoO2ssFWIxqd7vkgF0o01lEao4yTG1VY?=
 =?us-ascii?Q?jxbmOFrB6b4uafRCu0DaQtlGpGXa6vAnDF+NLiJ4jPcvyQ2PeDbwYGg996jI?=
 =?us-ascii?Q?OyHWAgqDFognf3SlTjq7yj/vKJ7D67P1K4i3Jod7EahEZGwy1wb+yVkfob5Q?=
 =?us-ascii?Q?rozkXhtM1p2oPMEs/nHgk6zqlHqLpWOYYgy2sZx2MjgjLvHoRhAp8FuN5ia4?=
 =?us-ascii?Q?H7WCmpv1A1wPRzQ1+aiQ0uMSBDjSTuSehQZr5ZEH3c8oNEnqFTLQI9QAG0qY?=
 =?us-ascii?Q?RswWZiYmqqt5YMAEOrm434tPbZ6fxWIcErqWdmsGJbcfpfyq84BxwIk3npWY?=
 =?us-ascii?Q?D4Tu4BO/Skuc3+a9THcLSpq5YaDtdumlke7PjjxkTu76nf8epCyRvWU5uELh?=
 =?us-ascii?Q?EOvooRaM+dgURfOmcrxStozbZpthUa+OlvhmRx45XxHA5XAXbr45X5rcPkkQ?=
 =?us-ascii?Q?Pqi8G/Dnz3scbdDz+o3Fmtyj75mS8qqJ2zM9fHY9iMTduFv9sa2I7NrACr05?=
 =?us-ascii?Q?2nKqh8yVz9PUkgusIUTTcIwh0jx//1h2X7JNB3JrbDA7erzW6fxsDXqvvRZX?=
 =?us-ascii?Q?hOebH0CF+1VfWEI0l9+Gk55t1K8w3pUNPTE5c4FT13giVp1BHQnKoP7A2HfY?=
 =?us-ascii?Q?pn6rZtj1m22XRZ1aWhSdD2epDxie2yRcSxKRBeXJAUJ0WaaPIEWd8WFRPghh?=
 =?us-ascii?Q?jp2+zwM0PCuL39eWZAHJTMfrIG4y7+CfPkjrNQAQm4mVmaFV94kpVw/FGuXE?=
 =?us-ascii?Q?YftbT0k78bEPBz8+xh5wzef4IL01rcbET5/VhJBdKEmD7brpSK5geG17TwhT?=
 =?us-ascii?Q?voWM21vRycbdpnLhx4gKoSC2EFsLUnLdmMlOPwEnQExCn9nu4py61pkuhgOY?=
 =?us-ascii?Q?TdUhpkQBN7tRKT33XLNdvh7k9eoakzpxP5B6pk6JSNAPFQ1Kqv7sDXel8quz?=
 =?us-ascii?Q?gNvSiECQLaYy/EAZJK361PE4qceS2sGbzEcKJHCcctXtcTIYv2WHoS+pYetW?=
 =?us-ascii?Q?ujS4fAyEGTG9DjBtk63dQ0QwAF/9JUh0YPCu0fLjMvmoYgy6HyJmS8rRAGIn?=
 =?us-ascii?Q?JFf3aXWJWDtBtjjju+4zbTmqF5BK3tX8fJPOwhl+qlkvyMyu89I6KjyT38K1?=
 =?us-ascii?Q?dKLV5TzVYXaQDKbzemK6/K46Im2WZnP1pyQr/PbtNY7P9hDDujylAi8dNzJV?=
 =?us-ascii?Q?UU1pr/LQ6u8PjPDRIWa3TWI6unK17ULQaVUSVc+02AOwytFzjGB7u+N0q6JT?=
 =?us-ascii?Q?e99i3PeNPXoZSEeud0vU9D+7+omMqUSRyRL/+x4aih5vPFM4vHL3RLPfO9Z3?=
 =?us-ascii?Q?ot39J95TWWZjhDfAWQz1jO1mfLwrrSeYhffpk0iWHy1sqUkjRtJjyv89P2UB?=
 =?us-ascii?Q?gSyXmyeamdlgQtV0zDFm/tMRM6gw4CfvioCeXMCK1bTvAeSlSqO8WoTSyzJy?=
 =?us-ascii?Q?oP0c2SBe//w1dO7616JF4s2CDV0Po/r6IxiUc6dvdEH9FWseM8HGuo6cfyBb?=
 =?us-ascii?Q?FrRes/pjIg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461df0a7-3395-4f82-8903-08de832d1036
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 07:24:30.3936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aNhgOVXz70u/PxpEpKGDFZ/VIhKKwNQ9IRkOslcuAyOW1KftNFIg8I9n6tCNUdFIMRupZsq3Z7NF59sm3OXSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11677

On Fri, Mar 13, 2026 at 05:24:31PM +0000, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 09:31:02PM +0800, Robby Cai wrote:
> > The FP9931 requires a mandatory "vin" power supply to operate.
> > Replace devm_regulator_get_optional() with devm_regulator_get() to
> > enforce this mandatory dependency.
> > 
> > Fixes: 12d821bd13d42 ("regulator: Add FP9931/JD9930 driver")
> > Signed-off-by: Robby Cai <robby.cai@nxp.com>
> > ---
> >  drivers/regulator/fp9931.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
> > index 69b3c712e5d58..d4ba818ec2c15 100644
> > --- a/drivers/regulator/fp9931.c
> > +++ b/drivers/regulator/fp9931.c
> > @@ -444,7 +444,7 @@ static int fp9931_probe(struct i2c_client *client)
> >  		return dev_err_probe(&client->dev, PTR_ERR(data->regmap),
> >  				     "failed to allocate regmap!\n");
> >  
> > -	data->vin_reg = devm_regulator_get_optional(&client->dev, "vin");
> > +	data->vin_reg = devm_regulator_get(&client->dev, "vin");
> 
> And this isn't an ABI break because the regulator core will invent a
> dummy regulator?
> 
> What's the functional difference here?
> 

Yes, this change does not introduce an ABI break.

If the DT already specifies the 'vin' supply, nothing changes.

If the DT omits 'vin', the previous driver treated that as "no regulator"
via devm_regulator_get_optional() [1]. After this change, the driver still
continues to probe; the regulator core reports that a dummy supply is
being used.

[1] The original handling of devm_regulator_get_optional() had a defect,
    which v1 attempted to fix. Switching to devm_regulator_get() reflects
    the actual hardware requirement.


Regards,
Robby
