Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013065.outbound.protection.outlook.com [52.101.72.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B381DF26E
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 16:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913211; cv=fail; b=llw4eOBYAoudXwq0W8FYEw2Xf8Opc8jyzh9c0sHLeYvQScw9PBEfJHw+tTPOTtYqhVd23Khyl4HHPVzHU2CZh6zeTW7MN/Thxbfc4kLnwNMmpK313dmgIqF+L+9OrjY7Do0pWYyPq46UmOiBgr16w1hzYNiCafMXXJnoxs55wAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913211; c=relaxed/simple;
	bh=0jpX1dSb1/EwnyHr6JCDBjJkn+B+AbVIOoyVFn4nO94=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=dfpMHgPMHieGbeNjjqP9K+Lj+8OUsZ3GOFZpMss1xRpl6cnf9/He0pJAHCoiCF9YM8pQu9ENaBfgkQ0VTtTR6Qj9LEqUwinGXZDhVshuxNko52z+9QXKHcsuhjMeqjP1mnieU7jAKuauNk4SVQF26O/bXfzIk+9JeKL7r9HEUDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Un5RX5UX; arc=fail smtp.client-ip=52.101.72.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Un5RX5UX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mufifp1FoHizuRI8RWCQpT3VvJfKT/DMNF35XGMxI3RagPCDX3DyzsZ++/3EV8COt/w13GcXe2kCXrEjdTVwdD+KqccE3QMTTq+8B8k5bXJJb+tLjfgZCLRNSBsqOkBp5FUcDNawD4AC0fINWeKI2e1Ww3skDw18I0rkgWSeW1LaJpTUekRHHaufo7wk59VRm/Jz5UMA0ffCAXfH7MPTOWlmQKcTi8bzaux+7Z2HaDCkQ8JKq9HVWVv1qAQIQuHoIVQzlwmsCx1Rj5W2j58RbgDOtl22onOKj/K0zQLuw/mrB0wS+aVrrO+tRw3lowOXW5uWKVbHshBfef4OfEHr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/naeNG8PjBSPhcEaCUTK2Jr6Y+ksuRNjfaDcsORLn8=;
 b=eRAMLneXHt/6DhW0gR8xTvn7yGKIjmkBO9P6fYegyDPyB8PktGOsVVgXRC8Ifysxbk1JFoO/zFQr1zBtn9sSnxqRraSX0uFXeljWINAI+NpwrbAD05/beDXxKnKvsfbF+M4cyM7fM4FaI8/AU82tOLsEK6fFjzsqs7taQ0oG2HP3LOY85mWjej96eqoPDVU763f6eRuiQiOS9kOnBU53DZt3F34bsahl/W98r6AWgeJUd87j0N0KLrBOM5icZLRfrnP2GQhrSFWRtKMPgkIdEaXiQ/15t+OK83G4vkp3Ml+sSLzPZXLExzvP6Shw8T55uqObiHi63cYseTkMdjm5HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/naeNG8PjBSPhcEaCUTK2Jr6Y+ksuRNjfaDcsORLn8=;
 b=Un5RX5UXufBA44gnCNH/Sk2p6R6dvt8FvXQAliBAk82cVXDh9kiQzHoZDDgi3JkFQfVAdgo3ZYyYav9dDTBv+p1c1pro9HS0lhFQMMEoN363WDa/T5DseqXeozWEh39onXgU+LGokMrpkISNmCIJ4f2T8xPC+VheNsRLpGJuCe+TgNQbh4fU8aPdupNGWhTlcfup3GGmIrh4ksaSTUrrdwSa9YJ8fi6R+DErjMJPJIQ9pbP08FkpUbR5b66Qof6skoTvOghtoNvrsPQNArcyh8DAOknNpGD3wMJgyQjBp85Bhx1dvVGEyBvwcIF8n1RvixmxYzG1dmomgrEISNtM/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9290.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 16:20:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 16:20:06 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/8] ARM: dts: imx28: cleanup all CHECK_DTBS warnings for
 imx23 and imx28
Date: Thu, 12 Feb 2026 11:19:42 -0500
Message-Id: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ79jWkC/x3MQQqAIBBA0avErBN0AouuEiGaU80iC40SorsnL
 d/i/wcSRaYEffVApIsT76FA1RVMqw0LCfbFgBK1RKUEbxk7409nbhsDh0XQjFZKh1o1LZTuiDR
 z/p/D+L4fL33PYWMAAAA=
X-Change-ID: 20260211-imx28_dtb_warning-ef2a00b26137
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770913203; l=2407;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=0jpX1dSb1/EwnyHr6JCDBjJkn+B+AbVIOoyVFn4nO94=;
 b=PYD7QwG2W8o4nFyXmNRXJkyiAnNobQ12UTZk8MuAANDcvC9ztNLUyYnR0vineYICRg5eaKc+Y
 aLvf+KpUV4DCW81L/LqoYNl5BXcXHufNLWawCli1S+3/Ybeo/tJl7G6
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN6PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:805:106::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9290:EE_
X-MS-Office365-Filtering-Correlation-Id: 493019c4-c971-4f29-d972-08de6a52954b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkNheDRYWnBCbE1LRHJleUI3MWkrbXk2Vi9KN0FJNW5FemdpbkFIaitJNGg0?=
 =?utf-8?B?QnhIUlQ4NXFTT05STzlJd3ZiUjEycjd2S1RlYjdkUzRXdU0yNXI2R0xjclFB?=
 =?utf-8?B?VXhXK21sckpJZHVxUStmaFNnWEkvcFFpcHdDNW5vRGFLVlNOa0pMSk9BZjVn?=
 =?utf-8?B?WThtMzhqNHl0aXEva2VzVkx2Vi8rc296VzZDRlhTSGxNVFhxQkVsVjhKa1pu?=
 =?utf-8?B?QWpLQ2NFbm9JZEVNTGt3NTc1ZGVxVDcwekJldTVQRnQyZ2pvWk9SeEsyeDZy?=
 =?utf-8?B?b2VNSE1BZ0F6NXpIU2J4cWxWM2dUcFh1T3h1ZzdwTGNlbkFMQkRXdmpnUWs1?=
 =?utf-8?B?U2dEMHpGZVVqRXEzbjAySm9qZ3o5bkZMM0ZzSGV1R1lXZE50QS8rVEdzTWZj?=
 =?utf-8?B?MVRWNElPQ1V4UXpyV01KVWRBSWVPcis2RzY4czROamFLSTEzTWlqT1E3eXlZ?=
 =?utf-8?B?Rk1TYUV6UkJYMFlyMTJZSDY5Nk55dE1rNGZNTTE5L1MwcFovbDJwa1RJNlg5?=
 =?utf-8?B?Nm5jckZwWnhCUElBYWlsN0R1MTVaY2Y3RDhiRlNUWWlUM3BUb1AxbXhrdnh3?=
 =?utf-8?B?K1QxWTJjL28xbmI1OGJrcFlJbDZKeEtxanAybHFkc3dva1dacVpUa1UwVEtn?=
 =?utf-8?B?NWF6TENIVjU3YWs0K1Y0aGp0Z2VxSy9RWG40SE1xRmpSNEpSRGxqejdUenMy?=
 =?utf-8?B?YVhLZWk0T2xjRUJQVm1UOWp5WjhLdk83K3p2czJFNVFnMzNHb1o0MGFIcWpO?=
 =?utf-8?B?ajQ4WW1YaWdVb3RvbElQUDhUNGRTaU9kTGtoamU3d0s0T3VxcDltY0dmVzFx?=
 =?utf-8?B?VGMvSnNlTDVETHRsUWM2WUtlYm5Uc05wbHZpVUFSQUxkYnZOMG9xeDFidVR1?=
 =?utf-8?B?SzJtL1JpTmEveUY0QjFHLzZHckN2cE50VjhTY2w2ZlhqdWdaNDN1aG1ERTVt?=
 =?utf-8?B?Q0U2R2RGT1kwc3YycExwR3MrYnlLdjNhN0hOU3c4QStZNWtzbTJpL1dTTE4x?=
 =?utf-8?B?azJvb1FUZmgrTlF5dzJXeVAveTJyWUlrSFdyKzcyNFY4eDdyeUNEWWFYUlVt?=
 =?utf-8?B?MXhZcFJHQkhRdnJjMDM4VnBlbk9xTmd6OGZRK3ZqVDNHTGF3Wk9XakhWZHVV?=
 =?utf-8?B?QXltT2t1QytLWVFLemJzNzc4c2lHZjcwUU1odEdUUDJ4WmUvRkJwV3Y5TElP?=
 =?utf-8?B?Y2ZISVZyTUFJZ21tdkZOT3ZuU3laMGhMd1k2Mm4xYVVmMERXeVBQVHVud1lK?=
 =?utf-8?B?RllWdHRvN1pPM3daZDdlNW1YL0oyaWw4cW02TDhTSWRreS9OZko1b3dUcFNX?=
 =?utf-8?B?Mmdha1lzS2ptakowcktpOXNMVE9xbmFWTVhiMmJ5aTZrU29rOXE0aytXb1p1?=
 =?utf-8?B?M1hDekM0S1RCdWNINzFicWZSa1UyejE1azVDbzhIRVJhaFlKZE5WNDZ5UFg0?=
 =?utf-8?B?dDIzbXp6L1ZwM0gveHMyemUvT1lwYnFWOW85bUV6alY5MVJvczdjMG83MEhu?=
 =?utf-8?B?b2hNVjJPTEJqR080bTVHRE5Ca3JqaCtoRVJiNlBuTXNKMHVWL0FBd2ppTFBm?=
 =?utf-8?B?NDB1RU5tcWc1RkluOWdrdk0zanMvZ2ZNOXpFRFhoZnlrV2F5c3pJUkJ4M2tF?=
 =?utf-8?B?KytybXNTRHBTWCtRQTVnNWFoRHRKTHdmcmdmZlBJaEZTektacVVMZzZvTGxF?=
 =?utf-8?B?ZXNIRE4rODdFYVVTUmJ0WVZuQWJKazVhaVd6NFdlQm5Pb0dLZ3hkaVlKdmg4?=
 =?utf-8?B?UnVvU3RWOFl1aFFrS2JnZmlPS3RCclpMM2ZQVitJZS92L29wOGc3MGgyeFN3?=
 =?utf-8?B?Lzh3RVVCMmg4blp2RmJmTzBFRDRHYTAyb3h4c0VBVlE3ekZqSVR2UWZyV3di?=
 =?utf-8?B?ZzhZRVpNc3ZXM3BzWWhValMwdExaWXRBUWJXRHFuWEk0VEh6UjRMbnJNdzBR?=
 =?utf-8?B?N1lhYTQxT01jQzA0VllHc1ZjT0dMdW03UXhibFRSR1BjS2djRFRiTWNVTTFz?=
 =?utf-8?B?WjNCUWgzRzAyQlppaG1VWGcwN1pzNy9aYUdzakNiRElTVFM5VUlhZWV0bHl4?=
 =?utf-8?B?aUdET3EzR3FYM1R0V0d4TWd5ek9xMWZwRGwwZFJ3UE83Ui94MzBBZjh0dXEw?=
 =?utf-8?B?K1VzQkorN3kxTyttckRWeGdBeXhra29hTW9naDd6Z2t0K1hNSVhQNlZ2ZVRt?=
 =?utf-8?Q?g9jOfqFIwIMR/YZhGd1bES8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UExHTWl3UmFhL2dzNFAwMmZrWVVXb0lrUHlQTUZnWTF4NkdVNUsvSE1JSm9m?=
 =?utf-8?B?TW9LWVR1clVHSnZtVnBISndTTm5wK0ZWZmp6dVhQYjdMVEhWdVJFSjB4QXlq?=
 =?utf-8?B?SC85by81RFpqYzk4dXUrM0FPUUJDMXMrRzlWMnhtQXBpRVJzVEc5WnB4S01Z?=
 =?utf-8?B?VGZTOHFKNzJkZjZBSGRvVG5IOVVUOEFxSDU0SzREMVRETW5hMG5jK0Y4Zitj?=
 =?utf-8?B?dTZiV2M1dFFpaXdzUmZXcTIvZldDY3dPSDYrM1VsQlNISUF2elNVWUtaS1hm?=
 =?utf-8?B?cVhFbWsrWkxlYTFNZStTTU1JWU83WFJoMzh5cXpEM3FXVmhNdzJ1Y3lWUVpu?=
 =?utf-8?B?aGtGSEtLSlBwVkplWjF5cjlraVpqSzd3Vks4YUdpV3VPVVZ1THUzZERnTkJp?=
 =?utf-8?B?VFpFNkZhY3lGWXduVWVYTnMrV2xWKzhadWhBRkZvNk1TNGJqUzFMdVh5RUdu?=
 =?utf-8?B?YXlmNzFlUjkzeGlkbUN1L3BGSmMySE4rcXVwaDlqV1o1Y1pVNFpxbTlSRWNp?=
 =?utf-8?B?RDNrK2lHTlpzd05waFZJcExQRFNuTXZyNlQ2dVhUSGpQSkFPQVJ3VFROd2pR?=
 =?utf-8?B?M0xON1ArWWd0YndCY2F3NTVFMW0ySmxMMXZmcUYvam5yZEkwQVRseWcrQTgv?=
 =?utf-8?B?UU1SS1VBMEo2ckVQZ2s2aHhIMEozeFpRN29YeC9QZ1pZbFVnV2FPQlpXM2lD?=
 =?utf-8?B?VUpTaEZNeTV3QkxLNEcyVUtBcHNreko4eWV2NHhVWEpLcG5aaGYxQjV3WTNN?=
 =?utf-8?B?VTJrQ3RZbnR1WXdrRzhJcWloQjFDdUpKaDYyNmRUbHN5ekgrWlVwZ0VwYzhh?=
 =?utf-8?B?UlFETkNSZUJmS2h3UDl4ZFgwZlA1ZFhsUHplVy9jOGFhYlJ6MWFSdFlIWVhp?=
 =?utf-8?B?S1dOWE54b0F1N0x5TTNDRmcrMk1zRnBnU2tyZklIRzhOcFlqSXFWdlg0QnpT?=
 =?utf-8?B?bmwwUWJKalI2TURjMlhvOG1DcHI0UFFvTHdJZ3cyQkhnUi9qMmxiVkVqanpK?=
 =?utf-8?B?U3FScFZiNmtUdDhNTGdYNjFBYUxONmVyODNXZmNwbU5Xa1pKbEdXSU9QdXRy?=
 =?utf-8?B?OFgvSDE1TEN5ckJ3MC9VM3ZZdXpLS2lYcThLdXFZekN1VGhhTkkrZVVRdTNu?=
 =?utf-8?B?Rk5JQi9SM21DcHBRUGpQTE10UkJ4eGhDaDNJU21JRUtTMHh3R1NRTEZDMktX?=
 =?utf-8?B?WXNRN2dTNFgxaTUwclFNMUo0bUpGMFp3ZGdXQXFFYmRzcUZCdEl0WFZud1NR?=
 =?utf-8?B?MTJZdWlObnZBRVNNcVhaaDZrVTFEVGtWQnVScmcyQnlZV3JnbzNIdlFJdkxD?=
 =?utf-8?B?aVEzdVliSXRaTnFpZmpTSFhOMzMveGNzRkRsUTZibGIrZzBxbzY5ZWZNR3VV?=
 =?utf-8?B?T1pXbitldGVzZnFyU1hYR3ZlWU5KZTVEOHF0azVrN2pyUlJ0VWVOSEZtODlQ?=
 =?utf-8?B?R0w4U0F5R2VCQnN4WnkrVU9IUVJ0REwxNS9RN2grR1hiRzhJQXNaRGc2Kzhq?=
 =?utf-8?B?MmsxSTFkK1RNNmc3UmZwMmttS0VLYlRLSGRFb3FSektFVHJ1dFJYL1FQQTB1?=
 =?utf-8?B?Y0RKUmF6NUk3UGliRTRrV1A4a2IxS3M3Zk44UVVVaWFQME9tUTB1ejlpQUZy?=
 =?utf-8?B?Mm41MHcrekJNREgzQ2dsMUUxbG1qbkt0L0oxYWRBb1lDaUFFMzFPYVFwTXlo?=
 =?utf-8?B?QlRYNHFJWnQyUnJrMlJrTFV5eGZzWXRBeU1KZmd6T0ZBYThkOTdkY1lxRUZm?=
 =?utf-8?B?YnM1VHNJYjJpWGo1amc1L0dtVWRKdWJWWm1RS25KZFVLcWtUS3NmK3E0QzRB?=
 =?utf-8?B?K2lKU3lNamxKeklRZTA0Unh2TUFNSjFoOHBHY0lONDc4Y1VZeFYrdlNxQUUr?=
 =?utf-8?B?czg4dXBHSXNBNWJlSnVPVWhrMjk4YTV1QkVGZnRkZGVhYWlkNWFlbWlUcG11?=
 =?utf-8?B?UnYxQmRpUUNhc2VmamJxUlJHZDQrelp1UXZ5akJycGZSQzF2dDYrV2l1ajY2?=
 =?utf-8?B?ZjVnSk9JQjhaVVoxQ2R4M3EwelF3QnJ4MDlLODVxWEhCWUduenR3VWVlaUk4?=
 =?utf-8?B?Nk5ZYzU2c0Rqa0swQUJmSDI3TjZWSGE4NllWUVoxZ0NsSk9hMHVIcUJ6N3Jq?=
 =?utf-8?B?clYveThCZG5QeGJMckxxendrSjJHZGxicC9OcHM3WmV1eHU3ZklXYlF5YTgw?=
 =?utf-8?B?Ny92Qmc1ckVpRitWdWJWNmpJeVNQc3N2bFp5SEcycmFoaW8reGY5RW1JVGk5?=
 =?utf-8?B?SjJmc1dwL2dNN2FBZDB4bHJUVWZQb3RwZHBrY2o2TGhQckRJRWtnRnUrOWZx?=
 =?utf-8?Q?qN0/HonSAPFRDcfMdL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493019c4-c971-4f29-d972-08de6a52954b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:20:05.9444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzXvKOtiLSmd7MSHj/RSODc35wduoipp+X+YrA4NkOh+1/cqXnMao2En4IAS/YH15HUdxvU+p8skgasdiGxwMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9290

Clean up all CHECK_DTBS warnings for imx23 and imx28.

66379a677ad41 ARM: dts: imx28-tx28: rename compatible to "edt,edt-ft5206"
Not sure board use exact edt,edt-ft5206, but it is comaptible with
edt,edt-ft5306 and edt,edt-ft5406.

6346f7ecad97a ARM: dts: imx28-tx28: remove undocumented aliases
Not sure why set these mystery aliases.

Anyways, after these change, fix all CHECK_DTBS warnings.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (8):
      ARM: dts: imx23/28: set #size-cells of NAND controller to 0
      ARM: dts: imx28: add nand@0 node and partitions
      ARM: dts: imx23: fix interrupt names for dma-controller@80024000
      ARM: dts: imx23/28: add "led-" prefix to LED subnodes
      ARM: dts: imx28: rename gpios-reset to reset-gpios of hx8357
      ARM: dts: imx28-sps1: remove undocumented fallback compatible "mr25h256"
      ARM: dts: imx28-tx28: rename compatible to "edt,edt-ft5206"
      ARM: dts: imx28-tx28: remove undocumented aliases

 arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts      |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx23.dtsi               |  8 +--
 arch/arm/boot/dts/nxp/mxs/imx28-apf28.dts          | 64 +++++++++++++---------
 arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts       |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dts     |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts       |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts       |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dts       |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10056.dts       |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-485.dts |  4 +-
 .../boot/dts/nxp/mxs/imx28-duckbill-2-enocean.dts  |  6 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2.dts     |  4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill.dts       |  4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-evk.dts            |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi           |  2 -
 arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts         | 32 +++++++----
 arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts           |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts           | 15 +++--
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi               |  2 +-
 19 files changed, 87 insertions(+), 72 deletions(-)
---
base-commit: b9a67124977e281689c35e81f886dbfd45ec69b8
change-id: 20260211-imx28_dtb_warning-ef2a00b26137

Best regards,
--
Frank Li <Frank.Li@nxp.com>

