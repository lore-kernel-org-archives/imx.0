Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2083.outbound.protection.outlook.com [40.107.104.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F113D6D
	for <imx@lists.linux.dev>; Wed, 13 Mar 2024 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710313555; cv=fail; b=p6ao5Gp1zzkaF8hGyl6hU2UQDOvajMbXCUMTDXK8rgERC+lfL3B90pewxfCYAWwxIXzZpiREKBA3ymnmdESa0PC60isgj+LRD1QwQcXr4gPLn3uNUcLnRCeybCqh0BSVVlyCRFl2E7B3raQIlUGPCraizZtTb1ecm8GejYwqCb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710313555; c=relaxed/simple;
	bh=K+/WHMJ6k5qvKcVyq8VUs8DgpOpMtkv/MLQg0iPhvb4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FAAO3usucUbbUvTuK3Cv86J0Hxc6jou0dgepeg1Wn5Ghou8AaO8wkfqLBt3X8IEGRvo6cerCCFG0DKFN0EaU+uQotnpY0SI5lyHsDK9kECfK2+oZqbg8oQomOKFD/Awf+zuxBSrvTG0A2f9haxyjQ1VHPHRD/SuYfs232/acH7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=C1vE4qI0; arc=fail smtp.client-ip=40.107.104.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="C1vE4qI0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkVVycSYHbMQ0L1HRvlZDgdmfjRX2bJBA9CAsLEJhjBR90nIkdtbKK8HrihKqNO4dEyY/31m3T5ximTSYBTPAJ42a24qTI8nIvmd5Qs3+5ju6Po0XG2pUIFaNFxa3Pupkl7WlMDEJ5D11QESc6OctWkMNij3oVZtVv2FTzFMjVZ7wzVtGdb5Y3+/5YxZfQ3cFFpNZkbO2U4hrtyX2tZz3hk1OBLmFsD8Pe7PhaLaMnkr5CIJHQw7+PDhUfCnjaxIRnrElLFQE3wByfKYkLoryA/itO6fvAjYaUDBlxz8GhyBihNjLdTiJnEfeSPOwKsMxUUrOvamD9rpcd/09SuJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTFEgD7AfafWoH2xgnIq2wzjtX6N36IQXQk0eJdeSkk=;
 b=SEw6s22CccvadKTslNZ+Y6yfrsUUqElkbsfHpPb5hDUgD2WUJsiCBaUS/CZQ/A8b71Dh6PUW2QgquYyoXhZsA/P6BEZahYPBF/QwwB8YF7pX9Nn7vx7bH3tBxsBGvF/00jSJjITLcWE6fUq/mV7PV4aysm3Gbcpcv2Zls6tnkKgVRjXtISYkpv149PaB7DCaLCCdKLw3u20VP9IfGe5MFCj2vBsqJITj8JuTpLBK3GExDMubcV/prOGZzC8ho7WjeqfFlN+DQ9JFvSksgDMz4wGFdlhhuABphoXKQfZmKtEPwZ+KQdQ7JlnC8KDYGCao8tK0Mbo3BakeDD27NtTIwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTFEgD7AfafWoH2xgnIq2wzjtX6N36IQXQk0eJdeSkk=;
 b=C1vE4qI08KdPuftIK9tU6yPUJkf12wSQ4jI7dmzWGJa6QBYPigloPVCsMeL6GXe6ja916ZjzNfPHPoHQHa5Ncm6+c2auRMwZfRi+AKT9iX959HRkBmQV8OGET2eEZEd3hwjYNj9bYyY/wAlFi6KhhyAChccGPrekCBIP+Uqdf0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4SPRMB0002.eurprd04.prod.outlook.com (2603:10a6:20b:4c0::13)
 by AM9PR04MB8456.eurprd04.prod.outlook.com (2603:10a6:20b:3df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 07:05:50 +0000
Received: from AS4SPRMB0002.eurprd04.prod.outlook.com
 ([fe80::2d8e:f92f:308e:25be]) by AS4SPRMB0002.eurprd04.prod.outlook.com
 ([fe80::2d8e:f92f:308e:25be%4]) with mapi id 15.20.7362.035; Wed, 13 Mar 2024
 07:05:49 +0000
From: Joy Zou <joy.zou@nxp.com>
To: linux-firmware@kernel.org
Cc: sherry.sun@nxp.com,
	tom.hochstein@nxp.com,
	frank.li@nxp.com,
	joy.zou@nxp.com,
	imx@lists.linux.dev
Subject: [PATCH v1] imx: sdma: update firmware to v3.6/v4.6
Date: Wed, 13 Mar 2024 15:13:32 +0800
Message-Id: <20240313071332.1784885-1-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To AS4SPRMB0002.eurprd04.prod.outlook.com
 (2603:10a6:20b:4c0::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4SPRMB0002:EE_|AM9PR04MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b65378-39ef-44dc-95c8-08dc432c036a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C5U91k5T9Ht3LsSiepe/79G5GtBZ2VAw1CtVSerZIDA5sB5c9UQ5CSYAS/LsQSqIK2VZ4gmVyLIwTJfJG2DY8sp9qvhx2Ue8n4ua77FyyDeBXmKchaTTXwup88ysraTEt+o8bzFk/Qd8nZ79tn4egw+gPd61ZHs+pT4X7R812FDMdqlLU9pJOsus92caw315CPwoQ56bGy+pmQMl/DbKEdSuyuLpl96FCjRYSscOS7pQ1W0u//80OZXMVOJGfMDj7o7PZHj3L5AkueyM4uSnBUVZhCPfsBmSiS8e5XYMIjD67t/ckpWhe33l/rk9rAWXIZ+MNV5IoLuk4LPVC0rnjwehzRm6955hFvnJLUwnaLzDu9ijJLqXwZtFstPWIDWkiPwGT3gKnhqctDwcKB63Ep1VibP37/8R3Pp1G5gr3EcUoiXbLsAL/J026V7ckBUruE9uOVhJmzKeW0GWK3XoeUylJf/a/a/X2CjeBjcAzU7m/zAZiV1khPl9U74PK6sQYEdkTzmgXsb8tzD5bM6W8zz0WhEe8pqVjHvcNWrC8HQnbbgTwDmEcwU2BKun3HjMDytNEGJwMhHAn/AMNdjGKWo1MVFk8shqlyttEXYImZIzN2BtMsJDbs2JY0Tzsbket8bHRSnOeVcIdByzAC5thvLX8Qt1nXHYIuJ7sUy3byzyCcoB4D/8LN8z7kM4v4d23tcRidhe99PcNkotNVzy2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4SPRMB0002.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g303X1TkUNoXIMCKtkJrQrlJNDzl52BRzUoJVwqKVYGZC4ukqZFOKK2K1+Wr?=
 =?us-ascii?Q?sM60BDKBqp7unV1nZa1q6wdNbWQAIQw2761omy4JrtNn1lRn6MIj5mcojSuV?=
 =?us-ascii?Q?TAuj7/y8TV3yTFtTR/nGKiRNIuk2IcWBfW3G+d7cTSc0v8J911DpgMB519JL?=
 =?us-ascii?Q?ctpqu9qsDaxeYz3lgCyrrSDtEqwulsDZrNKIhcEGRT2TOdV/WSt/eNDBZ1hn?=
 =?us-ascii?Q?Cha2TTYlYQeqjvw2pMJJwHjAEQ2PRmlU/AUTxmz+mXn6ECZiuaddX1CHgA89?=
 =?us-ascii?Q?PKO41V5uPKYAIELuO3l2ALqVZ14AeZy4DrXfLGG2/y1qsvOSpoLbXsItfC92?=
 =?us-ascii?Q?VKPjfzxlDTarEwaRrSTrhpnK4VXnXlp/R1qZhkfhe56/hGJIlGISWKahEWel?=
 =?us-ascii?Q?6YSWqtP3IiF6uqqdfArB6ksEB0rgR4088OKyyD2pya3RnOWeJzQTw0chDI2Y?=
 =?us-ascii?Q?RKqjZ+HqoKIZJKNypH/P07PB2NKgSBd1no5NMhEc89oAc1EzCBrYgOV/1TcV?=
 =?us-ascii?Q?cJPP7Cp/zO230ob0cDDg1CTCDAYOfP55bpPSc4HpNEx2W4UANgZ62LX9z56f?=
 =?us-ascii?Q?hih4snatEIkYmvbnZg0dz3UZpwZw5jtvKunvq4gDHD6WNw4j1xHsW1jajDSv?=
 =?us-ascii?Q?eKIsJiCMCoQ14FTt722KwzUecPedECQtkeHbf/QVs42FQJse0cWUQjSP3Mcr?=
 =?us-ascii?Q?N4gCpdHOlL2gxnCK5PzO4JsTKgbbQRRUvZZRGlTIZIP3ryVJI8JYvEPjAN80?=
 =?us-ascii?Q?jA6Bvoo6TTL2mpzhQ0ygeVqE3E4lHVi+asO/6dwzIekoF8490Ysum1regLsd?=
 =?us-ascii?Q?jYqB6lOKOE6B/TgukpxJl7on+Q97w1/L4GZk/0iQNdybPzcy6VdhQsuBGY0w?=
 =?us-ascii?Q?eftTvnxVYMKCpkUBM3YHgtQhDUXEET4+1hwFgXiBfNIBjc8HI9/hxKyEzitV?=
 =?us-ascii?Q?H9iPITT7fRaCxuAi08rhNiPVj8d3eLU2Ql0XtOmqlIANRP1e7son1jsoCcDx?=
 =?us-ascii?Q?iFWUHwAWIudzIbsLq8XFWjbNKX3l/CdRG73Kdqk0P988VXoZSsqZJ2w2g3ZW?=
 =?us-ascii?Q?gmkM/pL5XUJuYZaZ81ys1m/QO+OZyCXzO20EMAIzqSxi6iv4WQhO9Qjsqd53?=
 =?us-ascii?Q?MCUHec4XKLWEmzLTWY4x8ORqdAQJ8H2wveW0HunhRpsgK8CvFmsc0Urf4HNW?=
 =?us-ascii?Q?lsxHpkiwuAegiaMRcUNJqS8qBHQqFtCDkSzDNolBkpvfAoadOMHphn336Y9+?=
 =?us-ascii?Q?cLfPTTuWa/MGXL85D8ZHNTDIA7xbq9mTajda+z4+/PCz0p6j5RfEClh4kZGO?=
 =?us-ascii?Q?DSZiOrUzKVFC0u83Wej7j3sahwUVk8LQ2S7tpBVR/uXkcNnY5Z2H828tmSE7?=
 =?us-ascii?Q?G8y44MScUeWFpAd9yZAD8+OdFF7R4Cm4oUogkYOES3CHOxk6Dixvs4PqpSs+?=
 =?us-ascii?Q?gWNpogLAwCcy9nced/svLW49EA4xL9RuafnOrBTFs8FXjiyXcmr4BlBLl7U6?=
 =?us-ascii?Q?9ouf7XUrhf9E1v6uVVcomQePMzvpXAhn3gHqSC0SiHt40wVVrhG8zkZZgNLX?=
 =?us-ascii?Q?vtLbjdA+erq9jgVHAU4RgBvH8CSdIEHLfx4V95uW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b65378-39ef-44dc-95c8-08dc432c036a
X-MS-Exchange-CrossTenant-AuthSource: AS4SPRMB0002.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 07:05:49.7022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22aO2BUUbnQcrx5ZLx+x+aBUWEHZtTTgWipmHRU2plnOQQJhu4/8eBXFW4Ya4mPT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8456

Update sdma firmware to v3.6/v4.6:
	-- add i2c script.
	-- update multi-fifo SAI scripts to support multi-lans-per-fifo.
	-- add dual fifo support for p_2_p on i.mx7d as i.mx6.
	-- add 24bit support for multi-fifo script.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 imx/sdma/sdma-imx6q.bin | Bin 2746 -> 2970 bytes
 imx/sdma/sdma-imx7d.bin | Bin 2862 -> 3202 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/imx/sdma/sdma-imx6q.bin b/imx/sdma/sdma-imx6q.bin
index 4d0593cec7dfdae1a8bf28a2d83bdd1e95839b82..420256546e32ff52c07489ba46433b8e6e0cbd10 100644
GIT binary patch
delta 1667
zcmaJ>ZA@EL7(Vy(e)L}02QbzGgYvP_Zf>9xr^ak^WGtYmV+CA?GL}nl><n-rS=O0*
zxtV{aS=8X!kKVS#CN47ze*D^u6Ei6$s~I6=#6_&=kNLx-n=UdVfhF}l_rgFYwt3t4
zJ@5NI=Q-y*=UmN?xJsM$`u8{xLL%4(uxhaH!4e8WZ(@W7%Dk@37exqV;FE@d^98n_
zzhU6;3&wL0bwc(V=xqm^2P=0YbOCI<5TPdk+sOkS#5&mRk<`JNfI#L0e0hT0B=4c`
z5U0O`k}BSwgwX_v3pkWiW#ZI)L^Pn&FX(g7#fMKNnt3I`g>4KDswW3hJGZ?UR@AC~
zxpQlOu8=Eyf|JB+I7(6dU9BUGL$aDAYB(R^kitA#$31EI!V((m%I?ZbD2a+?aQ{u|
zCQwSZ*+}QZvi4Jt1hmpE$S+yM&MZUg4^NFO(n}v&<IF)B_qBy3#)UY4`_=iELk92A
zPxC(gY3($>UMrbW)KftJ<N|%M^@PEd!2%j)v~5!{k@KScziFsGtzoldN>;^Iu8f21
z+{5gjko`mB%zVVK{x8oeved$rN@_IPEpE(9AIPlA5i-TY0`iwwOT0vnVNX%&z*_F!
zv-zC;<qAY3A$t=qQi^vsw3~{$9ai%A!b*-vSQlH5nw70ygY&Q>`BgiSmE*{3dJDMn
za5Q48tX8(3g^0zByTW2x<nUzInv3YWO}ft!sJ>>-22#z#cnr&$2GG7h5=JKN5gqYY
z%ya1LK(gu3$Sob=i}bpq;<Xv`0-nZL-zCkMhr!sXVJ!^jITM&~Cekx{x5VkSk>irC
z9g}#y3vjvBN`wY)fh^xev?VUkwz$|MiF&V;rQ;B8;oCeBMwfZzRzw^5!o8a#eA_zX
zZIL#jdQQiY%TOd*Mf)Y(vazjN;<U>V7kVB3xl-CP2)j4@!??LLZDWLf%9rMJLE~gM
z!%y~<gLToL`Qp;PNU}$K2wxBIpGB5h&$3o`!6<>d)5*7e01!gxI$^#QQ@>EW^Aa#z
zf-nHWW|8S;Jm79Nv+d!uar27F{EU)=GlhnPwYcyt{YWS_R+O}*=*_wd6um=hNXaB*
z<YJkew0`>*^n70nrffa`4vM{_Jr-r>-jEUlS!7Yuixsw}w?GBUD|WsHME~ysmX=p&
z-vLiZ4LvSyTDM%%#g?QeBb4Bhf=4xNzcLeaM0|=nL;n)J6(3tX*^x7*m0&~G2#Xbn
z6*5HkNFIem?cSqNN~BuPY;-Mb;AC%-geymTow20)OH?LqgWH7s9(|17ki5!QQ3>&C
zHW6a<f#hB_8}*U92Cu#W57Sjz=B&%!67vz4HS$V~_Bks(g)zG$2#Gl>5#*bBAGvQR
z30Lex`nj{t^?r<PEPF<?$N>1vQ^)}ID+Re7F-CGSz&UY{<G=jzNQ~~1x8`4sIi*y)
zBAr8{fg5mz?!XlqqK4eDdIBcQz+;K<MC|!#dQaZxt{z;%uL9r3uNtH;Dem0NKPCuH
QKd>fPe{k^83F-&`24&7ILjV8(

delta 1395
zcmZuxUu;ul6hHUt{nL9pw{=)n2BRCewj^v5jk?6>fWR_I%J6Q3S=uqW&5Y~#^RiIL
zy}Q9T14iffVDG&(!NeCrG%?W^W7KsCHepMaOmuGbg^3Zng@+LlmRQf%?hiq3a_&9n
zcfNDZ?>qUmcJ(*Dy3PZUeJ%hH(6*s9qD`ayB?G)m0LJP=)rH7bfC4^w1YX@z@~>?j
z>pc{{?FV>R1JHxD%XsPo)&sHQXd{U4!QO5jfNta38+WCYMAN7|xO=ops1iOWSuJF`
z>Y#l|-<KjuIg!=&rhGt>3iId~_o6ALB$ym38`_jnGF<A{@rCjEW6LV1Rk*!S@P7{r
zv0K0y@55CgA743|<Xy%EzR_sWFYp0<YWAGR>&kcbxdcNV>>pJUCr2+KgI;71TV)_d
zkC|za3n7b+yw1*V>V)>&`q!zcSveu@kFq3($%i_$|E+(8^rmK&g!mMkWjz1Ogy}p9
zdb%O9*?5H9`%+YswtGa7pmeD?jksFh5G^I~0@8YZl~$ib3^7`61*0L83$PXaxk|3t
z@&S*l5~Fe=7;VCc#f*`{VtUIJD7%YGD|P=P^%1W&zis`a&UbxFCW)-;*g348MP#Og
z7{JG^%kYDm?R;zeX9GxtUgCGQ*w$y{H$sfpCEMyn%i|S@p29URt1Dfa)M5-voN?EB
zM>6zN5^oG)U#|R1i{|+4l{bncNjD$gfp){9icoW4+T!ESn(vA92()v?H7jQOKuoej
z9TMq&F5WD0dd#kdv-sueX!j?$qyD)OYoq%Eiw+5O-U=+78RoGxdwK_21+|3Qz!p1u
zT3l~`58EHLH%f6aLcO;QD~05bT6U0+Gi#%gSo_)$n~!f)2JM(#8eSM?;{g`B*yTBW
z#EM(YFDPD8s4*p?Ulq>LlVYv85L?sZni@B>7(gw)tlya{X;D-MM*CdEs3cWH)_P6$
zK3;tHtm|-TU5CHxlgQWycjiRZqoEY*xX_vuZ(@ewik1#Pkzla=#PMBvSPRiTQiBW;
zUr~w|=_x57i*P>E#VeWf^i%02&PRWdLOb_5Y$($e8yiGxEg~#dFjllyTJH`h|JtS6
z6`LM%?+;vYDseM2XR=x<IB_QJWD`k8*8C>d0Fi*vN3Xj>%A1Y^e4<RV9GY|cpSj|M
zwI!2JT*ROEVamw|%f3UTx`^C!s452oU#wOvV&YLT(ZhG~VeP)DWUf1}(2wPV{$QHX
zCCO~Uqcxz<JOw@4<ndQMa2U%Om2;CGj_=6bcj$Iyx9@P;EzO@$q{}d&-bCpyqV!wo
z38lY$AT2=w|8sy0q<_lMX{F6S@z{XO`hZMvfS0BpAF!DFkk%@VoAXcUpG*G-==#6i

diff --git a/imx/sdma/sdma-imx7d.bin b/imx/sdma/sdma-imx7d.bin
index 148f4fe87bed695d16a610d91000feaa8317107e..3cec13a2c9a28e5683f9f161aa09c3fb6e70979b 100644
GIT binary patch
literal 3202
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
Z@$;<PVY<=r!GfOMNOZh^2Onp${{@C?S)Bj?

delta 1588
zcmZ`(YfKzf6h3oz9y_yZ3zP-=u)77iEDetz#Kxqt0;z_W(CWYf-Le!HF*x$j#3qo;
z>_k(OHdPb6G1-}264K}o(^PF^e~7ge&}0+KFKVSc+NNluq5Q(&1I>EwF0TaK<jkJ?
z-8<*|?wRl2cXof4=W94tU&8}{fUysw0^>GDNC7xY00s|~<fnG+1xVp<5rHGSGkM?M
z!L}F59u@%H+yk&5-~9?#1z8QmPGKBDyvhNfVEwNVr#`N(yfmgnDxz{{Su{t;5iXOY
zR$@AQP`9Yp#7Ms!Nov(G50HL^W%MJi$`oS~-0E_7dB)shT<q@XFQYTfODd=BbY?@U
z;3mws{s^4$J`4*B;gzO--eC;z<;K(c0Poc&rrvO6I~E$+9fBcuc0`rP%h9({K^rP)
zT~#24n$3jBm7t0f3p!iBs{!gB>epfuQ*uPC4Y5fMC;!r+Zdv~l<xNZ}5pf%w&A7JA
z1n7O@cLkw7&-e$mx5sF&wBIFy1er~R=}V4hIgt)JJXJd^f2hRdysRa^u8OI&JiudX
z#E=~EhbnNy#!P|2#`Lbk>;4U!l&SV8MtNSXeAW6>ooT#IZV_46C1M2BK13!nhyi@q
zx&Ys*$%d1ocMKr)^j*Hlw5^ZH93jS0$+p@s7Em+MW7yXvb)`|0{6@FL89!OCOU?Rg
z5^r>2U2ew}i?-asFYp1-;IKf$!y@S?K|cJX4#%Ci&S8*Xe)NXLhjY#IB7G6+IO9{R
z(Ds0sUUxzw!QybG#F=`boezByr*l3U9K!yTPM@(RyEmvFZA+Ex*|~{IjxJfr9&w%O
z9#ZYI$F+?rvb|MsvXc*+8)cH6ax~B8!y9EdyU@;vN_8_?0P~HkKb(HX3R^5sDcK~o
z$CQXZEF89n;5}hP7#6a~2!EMx<V9F>uAt4gu6cLOxoO{;Y2$j)xQF#i(;4H6>MPN9
z2Qjip4w1DslRZzRpDpXAU0gTq&-#bhRu5d77FCyqzV&e>YrY-C8HOucaE8i==4@VG
zst537(g&nihI&uhxYe{r^2#C%j5YG^v1jNf(o<x{rn8d2NQ^UDW=lrw#}Lv88!I?g
zG=Uy;dX?|&%*&%TJ?^aas_`sr+GKB1i}}ZUBk^S9Xk69`Ozt4mdksJR+*zXJ$0gt+
zZtZlOK5!O1p~eH+qRB^eybW@xAV23mi%5PNxfZ8QvfuaC>Kj*a;_viC3x0rr_PgmG
zdo%v;3{A+#Y9FWdk^W@Fr7d92G6ggCFKaUHUNWIxGA32dNm_vaCeD;+MjY>%9f{Lw
zcbO+Q;gn`hE7AoRSAW36^cWA5Ks%I<9fuMUr107TawuWX(%Z`OHRltoM;Xp@m}fZ8
zCH{}|WMVVt)!8O`Kq(Jg*@p6B!ac|C#F^$56&+|yYTqa57p^jLKSA%g3UdEI4tBRL
jr&-zEx}2bj+vmA~Dl?bs+SZEat}~jvqM@xj%N_a;aMu5I

-- 
2.37.1

