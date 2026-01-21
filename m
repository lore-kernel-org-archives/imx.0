Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037F82F6900
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768987610; cv=fail; b=ARcfMeg1u+0Lb4F8Bt4pYnMJRX/LTcbvUmxfi7JBbTngMd4jqkgFiXqP/2Zo7v4ygs7gqoQGPpRZQY/lRWzCycG16W6hTlBfl5lPKdAuNXIDdcqlKhSiO57QhFKn86VXL3aewu+Bb0+JXz5FL8pgeVcf/U1JbFpcqs85mly8UQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768987610; c=relaxed/simple;
	bh=oQceM/CaCnzGIVUT/bVlbq9TiCluYsH9Z9CFgR8z6AY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jHt5JDi6EOM1u/bZOahu/+4DgOJUDUb37VKcbYlgsPMNivw8bIFESGD/pmhWhNxBDWuPCGR9Fidum3q6A1C8jtlNe98bF+2iCZIB7oN84tUXXR56tezbger65DN2EhgZtNsZeQb8FRAY3M8kHZyzAQz8qpgU4s2EGwKvKA9Ge1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PjS6Yk82; arc=fail smtp.client-ip=40.107.130.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PjS6Yk82"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bq5HuAPX8cD/Z7Sx/pLjwhxmtMsAO0Dl/KwqU764z53ms3kjn65fs51/MoQDregHS7/CuSdlXcfGzSc7ackycOMKVoXluP3mOl24fJqJHtBfdZ8hP/W6ainvOxsLuy+9nURePSKSLdqJ0XAi4QeSUT8eITLcPBPSdAcL9pv2QHoWOfzrpSTZBgpvm8sOzl9ZhJGLPVEZtClmxEijA13vGPz89uS51Mg0zkfkM5FBiwbXEg905rwbXhnFivN2Zx+9DbWB9Im56CsfAC8lmlXxMoDxt8rRdxo9SHFrCHTPY+qJr8zOXpbZR0wxT2//UHRv6wxDf6/7Y+XP12DEBmxkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQceM/CaCnzGIVUT/bVlbq9TiCluYsH9Z9CFgR8z6AY=;
 b=YmUcA9Wdppf2LL2ZN+8T/eNjkJB/wS1Cin0/Dt45a3AhEezG64AY4TtRUjOoKOTXPGBqLhsIVgpUtY1Ie81o1e6lEgEMhu8oakRWPYyEqxuBue4cTwB1EIKeK/NXV20s+gvClSmEmkIceVipZFFbRhoBrqv97ul/0tov/3NkDEVKol0d6gzlzlVWWUbYpQWV+iIP608zmyRiqv9kkxBs/NMCx4ngxqIT8CzPAWjB7XHrtk1Az1qOoCl8WdJooJWbLO/kqA+/poxx6Lsuh2grlhjDk86W72VcZj9w56FZNTcvoYqOvd7TFinc5rl7FIHZvrovecT53zgQ1ym1HMfm5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQceM/CaCnzGIVUT/bVlbq9TiCluYsH9Z9CFgR8z6AY=;
 b=PjS6Yk82lh3pfMFHopqJFAu3cOKXIRIuIsBmpPSCMz8osYedGoFJ+5zttqVmlsEP8jeV9pBBi8XmviHSJ+28qgX7z1u+4ivfxR3bfWskoZAtNJCRccPZl6h33ntFgijUrj/cHIy7wibwySh8/PQnnzhIEGauWHhpgKrK6pZEQgcLbGKGJOgI3LiQdzZE2r9H0LtAkYto2ZLmKJPzKEe/tjAWscUidokbIusZ4hV18RnFzf4IEAGueJ0IfoeG+abmCvnbHs2sM/VXslF5vTXT5ZfZGpb8S1T6kN1tNsmuTUC/TH2JZggL5SxLk1OlTo+CU/phOMXJax8lmP1Iuh6SKw==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB7556.eurprd04.prod.outlook.com
 (2603:10a6:20b:2df::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:26:42 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 09:26:42 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
CC: Frank Li <frank.li@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Daniel
 Baluta <daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Thread-Topic: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Thread-Index: AQHcifdNxgpxUKCRjUq4wrVjC4rAhrVbQV4AgACxmRCAAFoUgIAADczA
Date: Wed, 21 Jan 2026 09:26:41 +0000
Message-ID:
 <VI0PR04MB121144826785C4E171B99B7B19296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
 <20260120102604.1989725-2-sherry.sun@nxp.com>
 <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810>
 <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <CAEnQRZAfRLL1c19WHbQjJfgZfQLQx6CaBYx7KW9wSmVzVa6Q+A@mail.gmail.com>
In-Reply-To:
 <CAEnQRZAfRLL1c19WHbQjJfgZfQLQx6CaBYx7KW9wSmVzVa6Q+A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AM9PR04MB7556:EE_
x-ms-office365-filtering-correlation-id: 194dce4b-1f8a-483d-c7ae-08de58cf2ffd
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OXpYcVpmdGpxTzJvZkZqdVoyQjBxVGVkWGRZWXZBSDIwaFl3d3pFSTFKcGNM?=
 =?utf-8?B?RGd6b2ZOd0NtUWZzclNGVyt0YXZ5b2gyR3F5bjBJKzdBZkxNWkM0RkJncjJo?=
 =?utf-8?B?U1VVeWZNM1NFMk5NMHhyYUpVSGh1amtSeUtTaC80REZ5WjI0SklxeGh4aUpq?=
 =?utf-8?B?RkNncXlsdC9qWWYzRjB4VkkxU0h0bkpZY1R6b1B1ZTQzWG9MR2UzV0U0NzJa?=
 =?utf-8?B?NEczL3BlVGNrK1R3WUIvZXdsbHZLQkdSZTVmdWJrR0ZJRFJPSlZwNWJhbTVB?=
 =?utf-8?B?cVlSMlpUVjNhR1k3NUEzMXBXbVl0NGYxNFpwWUduNzlwbHErSHVUNG1hSVRZ?=
 =?utf-8?B?cW9RdDJ0TTM4ZVhSV2kvakRtNzRiSzNFZXp1ZHFGZTc5R3h1Wng2bGgwa0tI?=
 =?utf-8?B?Z1B3S0ZjQkRDQ2pOTjlMb29IcHduWjFrUHd6RFRyaW8xTW1KenJ3bENGOEFO?=
 =?utf-8?B?cFVNSEZXcHdtZEw3VmhFR1lwa0g4c3FlNmJwbGRDK3lWV0dCcFZRWWRjZGJs?=
 =?utf-8?B?Z25kaWdYekVMMDFodmlSNVkzWjYvaTdKbXpKa1dnbkErVDlPTjVheHBsZWkw?=
 =?utf-8?B?SkMrYUdNK0hUeFBCZjR3WmVPa0Vaa2N3ZWgwQVFEWVVnbnBTaEhLK0hSMENw?=
 =?utf-8?B?VGtKYWcxSnNTazlvSm90eDBUQmVQOHVkeTZqZHVhTkxjLzBhUlh5cmNXSUQ5?=
 =?utf-8?B?TnY0T0Y3Q0tsOE1oSXYxeml3enpFak9ib05EVGVtNWdDbWh1LzU3bi9vWkRv?=
 =?utf-8?B?SlppUUZzeS8zUWpaeE5ydFlGQ01TMlF3bXN2RlpQUStlOXFkY3R0ejlwWUpJ?=
 =?utf-8?B?UitlTGtXK3JTUDZoemo3T1hDNC83VXFpcXUvYzJXLyswMzNTTit3MGpULzBD?=
 =?utf-8?B?SjhXcktnMUk4NEZaRmpiSTFhZTgrZy8vSURLZGZjOHV0ZmRuUGFYSmVmVnpx?=
 =?utf-8?B?R2JyM2R3cEJXdXRhWFJKa3dYMUtIZU1BRmJ4cTk4Ky9RYXdoQmhaU1VLNzEr?=
 =?utf-8?B?VXplWWlxMnFCaDVpMzRBNy9OREN2VUs0d2hmVVdpTkdkUFQzbkZNSU9Tdi9l?=
 =?utf-8?B?VHgzd0huYncwRVFsbHAwc3FTWXZyRFQwYzMzbXR4ZXp6Y1ZKM1huSHQreHJQ?=
 =?utf-8?B?aVg3ODJLVzJmQmczMWt1SE4xa1JqN3lWSGw1WGRnUElOaW80SERlTDBlZi9N?=
 =?utf-8?B?clV5YWhGVWl1WnVPeDhTSzRrU2o1THRUSEpsMCt6Qm5wVWxRcE9IZlhKN1JD?=
 =?utf-8?B?cmdWRHdwSHZKRzZLbGs5M3RiN1RJVU85bDgwOWdTOThoT2tINHpJamRORy9F?=
 =?utf-8?B?blZvTXFrK0NxVkhEYVRxVGplZjFZQTRzbzdlclByd2pkU25vT0xwZExtcEZU?=
 =?utf-8?B?WU1wWDRDWklob0o3aVNGWVVWUFJ2eFpHYUREV3RpUG04ZnV5UHhnWW1iY1VJ?=
 =?utf-8?B?NFNRdkZxL2lkMmJpU0VlaWhpOTJWRk5tckFRbURpVGZrNkRPck1uZC9rR3FV?=
 =?utf-8?B?bjdTNTE4K1ZEa2lIREZsR0lyTnVVK01Ka0c4eWQvNVE5SW9Bdm4xa1dOYUN1?=
 =?utf-8?B?NGN1cmRsc213RVhCSDJlaS9aNzBmTXlaamoxekNLWWlINkt2M2lvbGphSTJE?=
 =?utf-8?B?cndSR0RzM1N3SWoybTUrVzlQcVBKRno4ZDJrZlkvL0tyT1J5cWhTWXVoUTcw?=
 =?utf-8?B?V1ZnSDlDSFVBdUhnYmpXY3h6Sm8rWVRQOW9MSmxZVUFrVi9FeVFjVWxqakpU?=
 =?utf-8?B?V2t4akkvYnVIM2ZBNTNHK29UR1VwbUtrb1dacUVBTExlaWdGalpURmxlYVZo?=
 =?utf-8?B?U1ZPYnJ4Z3ZVZ1huUU9Mem5KaERWanlqZDc2eUthRGxYK3A2ZHRMSjM1M1c3?=
 =?utf-8?B?L3pobVBGUFhqbFBJNDAxdWNFV2VKQUIxb0dpcTJoeFpCeHAwazRYTENPUkRI?=
 =?utf-8?B?RGV2NXdDcHZuMjdaZVg3VlFoaTU5VW1KLzBWY0t5T3NQZmlwUmNqcUFCdURO?=
 =?utf-8?B?Wjk0bFBTcEYxaTB4ZVd3bURLN3ZQeEgxQXZMZFN6NWI2aUtFNEpiL0svaTlt?=
 =?utf-8?B?QnVSNGxjajMxdS9HK2RhRTVadENiY0daaHc4cGEyTWlpbnJOYy9CQXVab2Uz?=
 =?utf-8?B?eTBFOWtNQVV0Q210RXZOMFJacElsa3JMV3FwL2NPakdRYzlYeTZaa3hVWVRU?=
 =?utf-8?Q?Z+FXX8pdLNkU6EF3TL0saww=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHo4Qll6WHFudEU1Yk1nNGVISVNrdDFVQXJNS2VPL21zZU1XejJUSkpDOGxG?=
 =?utf-8?B?MHdid0ZISFViYjVFK0ltT2VRalM3TTFGTHgzMkRxZGRGUm9ZY0ttQTRuMHM2?=
 =?utf-8?B?dXlpQi9LSzM4dW8vY2NlcnVDU21lbUdLQjVkWDJYMVNnN0VmY3lTMzRCdW16?=
 =?utf-8?B?RE42by9uWWhzQ2M0eDdRWDBIUDlWb0lUYTFtaVNEZjRtMktKVnQreWVBSFVw?=
 =?utf-8?B?L3FLcC9aSVM3NThvay9rdmFieWpHb2pnbzhNMlNkUnVxcUVNYTdXT3F5c2VP?=
 =?utf-8?B?aWlneDVUbHRhOTllK3ZMNllPeGV4bGxnV01OeTBrTWdjQkFmUHpBdDBlOWJn?=
 =?utf-8?B?SlpWdkJDWVpoWjUwUU9wb2ZySlRiUHdaTS91NzBqVEkvZTFOS25GdWtQZlRG?=
 =?utf-8?B?aHNmUGt5YSszNW9sWkx4dEo1TkhadTVwY1M1M3g5NE0ydkdJeitNL2Q5MXF2?=
 =?utf-8?B?c1c3cXpIMnpqVUNKOFg3TnVSK0FjU2JZUmZpZEdoSlVEcXZ0RGgrNGp4S214?=
 =?utf-8?B?Q29ZNCt4N25ZY1drS1FhT3I4WDFKT054SEZVcURXRStvNVdFZWsvaEV0UXVL?=
 =?utf-8?B?b3FJd2d1emlUdDN6ZVV2cGtGTlltUUhuSnZGQmNQRXJvMSt2b0JMNkhObkJv?=
 =?utf-8?B?L0tKUlE2cjI0czF4ZlFkakp0MFFEaitQVmFoZ0ZQQUo5ZERGSXhNUjY0T08z?=
 =?utf-8?B?c2VGcThNd3VsQ0R4MXVXTGFybDVoKzRSYS9DVEN1SU01UnpHQTlqeWRnanRk?=
 =?utf-8?B?SjJuTVBRZXNpbzVJaDAxMlEwTUZkZlNuemZjNVZqekNiL0tOUjJpOFNPOERU?=
 =?utf-8?B?YWlJaytCVVhKcmdHd3M2a2FNV2xyeXIybmRxeFZwMkYwVi9IVFhFMC82bmhi?=
 =?utf-8?B?WXJvZjdSRmdyRFZhMTFPeFV1ZVFPb0FSaGZXczNIbFNORk8zdENWTitDN1hE?=
 =?utf-8?B?bDVUQm1ERFZxUG1DNmVUWnRsNUFpNjRINk8yMWFWT2Q5TGdsR3hqZDk4cGpr?=
 =?utf-8?B?SDc2STlVTmdIWjh2Q0JZTElScnEvNG9iUTV4cWNwWnN5WkpkUXpiTnpCTUhv?=
 =?utf-8?B?SEhudi9uZXMySG5xaWFkRzZMOXB3QUxqSzlpOGt0QlZySHoxNDFYREMxMTYr?=
 =?utf-8?B?dGt0NGw4VUxwMkZvQzZYQVBNVkN3TjZNajdvS3dPOUFuMXYrVUh6YjNyVWI3?=
 =?utf-8?B?WU1vSUxGaVVkOEFFWXY5Y254QU1KSHZQQld4NldTZ2RXZkUwamVrNytVbVdE?=
 =?utf-8?B?ZW9GM28rd0k2K09iSWpvZDJ2RjVqYlRmYTI0anZwZEtBSEx5cU5lMm5odlFN?=
 =?utf-8?B?aUpyTk5qRDR2SGNnODFITEtua2dzelR4U0RuZTYzME9VNm5ZTzl5VW1hSXRF?=
 =?utf-8?B?RkErRFR4SXVhWm51NWhkdHNWVVUvRjFSRlIzWHlnN0pJVE43VkdKQWJsdmtv?=
 =?utf-8?B?cFhNbDZNeTJoalhDSWk0S1VJaXY5MjdWcklDc2pYWk15WFVKbnFxcUJvRTRq?=
 =?utf-8?B?aUlSMm9DZ0FFNEw3cUlpTHpQY3VnbURwNGlJcFBLOU1BYzB2cDd4cDVxbTBX?=
 =?utf-8?B?L0Q1WVBzSXp1bS9HUHVPK2NmTlB3bzVPTHdHS0NFWDVsTjBpd0ZVUzV3QUNH?=
 =?utf-8?B?S2hhMnNkdHZSVWJnZ0NkMWp2UFpYTlJUUUNsR0M0ZzhOL3dPdXZ4VUV3WmxO?=
 =?utf-8?B?b1pSSjFjNFlSbnZMaUJuL0NmUGZnTUloUGYzOERZS1hiQ0pkNS9ERjRORjVP?=
 =?utf-8?B?MmJHSDFGQUZLUjRuYzV1c0tjTEVsSmZEbWFDRStDYStEUk8wNTB4dmltNkZ0?=
 =?utf-8?B?U0paM0xob3h0eWxucEQxbktkdXV1aXU2dnFwMFFhS0NTZjAvUXdwTGNzVE1y?=
 =?utf-8?B?WFA2SFpOdEN4cEszT3h0V1VqNE1DVlFEMWVjSU4rNFFtZkkyRGpUVDNmVCtH?=
 =?utf-8?B?U0VzekhucVdJZnFTa2JHcnZDNzQwdXBkNVZyejJFVVdSK0Z5K0drcmpHVWdv?=
 =?utf-8?B?V202YVZtZXMrZ3pmM1Fyckd0MFc1M0RqcnRLdk9VSFY2Sy84U1FJQVF5WDNG?=
 =?utf-8?B?STRtQUJOMWtJdTlPQUFvU3p3THZEc3k5NmV1NTRKVlFsV3dxKzdQcDJKazdQ?=
 =?utf-8?B?NDdDT1RKK0FGMFRuNE5RTkF1R3NnV24wRVRGUkk5WlNxZHlDY21hTmszRzhw?=
 =?utf-8?B?RlZuS3lOM1BBY1BPTFlSMU9uU3BsaVkvZlNsak1YZXZzNlRTblk2SkZOdEk3?=
 =?utf-8?B?TklaOFRKZ3hYQUh5WlhxRkhNQXZKNW96MEZYR2VRYTl2TUtDWXpZS0hPQUw2?=
 =?utf-8?Q?wO6o/wGlQ6WfeC2eG2?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 194dce4b-1f8a-483d-c7ae-08de58cf2ffd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 09:26:41.9374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HG9ZOcidbusiqlpj2LNiGscC4lJccLQVRwrsSAZrkKS9+YPYvf59IjPVoU0+1pDhFEcWuJms+ZaDJWWzRlbfcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7556

DQoNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBkdC1iaW5kaW5nczogYXJtOiBmc2w6
IEFkZCBpLk1YOTNXIEVWSw0KPiA+ID4gYm9hcmQNCj4gPiA+DQo+ID4gPiBPbiBUdWUsIEphbiAy
MCwgMjAyNiBhdCAwNjoyNjowM1BNICswODAwLCBTaGVycnkgU3VuIHdyb3RlOg0KPiA+ID4gPiBB
ZGQgRFQgY29tcGF0aWJsZSBzdHJpbmcgZm9yIE5YUCBpLk1YOTNXIEVWSyBib2FyZC4NCj4gPiA+
ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU2hlcnJ5IFN1biA8c2hlcnJ5LnN1bkBueHAuY29t
Pg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vZnNsLnlhbWwgfCAxICsNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9mc2wueWFtbA0KPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2ZzbC55YW1sDQo+ID4gPiA+IGluZGV4IDkzYWQ2ZjAwMjdkMC4uMTc2
OWYyNDNkNzBmIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2ZzbC55YW1sDQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vZnNsLnlhbWwNCj4gPiA+ID4gQEAgLTE0MzIsNiArMTQzMiw3IEBA
IHByb3BlcnRpZXM6DQo+ID4gPiA+ICAgICAgICAgICAgICAgIC0gZnNsLGlteDkzLTExeDExLWV2
ayAgICAgICAjIGkuTVg5MyAxMXgxMSBFVksgQm9hcmQNCj4gPiA+ID4gICAgICAgICAgICAgICAg
LSBmc2wsaW14OTMtMTF4MTEtZnJkbSAgICAgICMgaS5NWDkzIDExeDExIEZSRE0gQm9hcmQNCj4g
PiA+ID4gICAgICAgICAgICAgICAgLSBmc2wsaW14OTMtMTR4MTQtZXZrICAgICAgICMgaS5NWDkz
IDE0eDE0IEVWSyBCb2FyZA0KPiA+ID4gPiArICAgICAgICAgICAgICAtIGZzbCxpbXg5M3ctZXZr
ICAgICAgICAgICAgIyBpLk1YOTNXIEVWSyBCb2FyZA0KPiA+ID4NCj4gPiA+IElzIDkzdyAxMXgx
MSBvciAxNHgxND8gY2FuIHlvdSBhZGQgc3VmZml4IHRvIGtlZXAgYWxpZ24gZXhpc3Rpbmcgb25l
Lg0KPiA+ID4NCj4gPg0KPiA+IEhpIEZyYW5rLA0KPiA+DQo+ID4gSU1YOTNXLUVWSyBpcyB0aGUg
b2ZmaWNpYWwgYm9hcmQgbmFtZSwgaXQgYmFzaWNhbGx5IHJldXNlIHRoZSAgaS5NWDkzDQo+ID4g
MTF4MTEgRVZLIGJvYXJkLCBhcyBkZXNjcmliZWQgaW4gdGhlIGNvdmVyIGxldHRlciBhbmQgZHRz
IHBhdGNoLiBJDQo+ID4gcHJlZmVyIHRvIHN0aWxsIHVzZSB0aGlzIG5hbWUgKGlteDkzdy1ldmsp
IHRvIGtlZXAgYWxpZ24gd2l0aCB0aGUgYm9hcmQNCj4gb2ZmaWNpYWwgbmFtZS4NCj4gDQo+IA0K
PiBObyBtYXR0ZXIgb2Ygd2hhdCBuYW1lIHdlIGRlY2lkZSB0byB1c2UgaW4gdGhlIGVuZCBwbGVh
c2UgYWRkIHRoaXMNCj4gY2xhcmlmaWNhdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+IA0K
PiBBbHNvIHBsZWFzZSBhZGQgc21hbGwgY29tbWVudCBkZXNjcmliaW5nIHdoYXQgYXJlIHRoZSBt
YWpvciBkaWZmZXJlbmNlcw0KPiBiZXR3ZWVuIGlteDkzdyBhbmQNCj4gaW14OTMgMTF4MTEgYm9h
cmQuDQo+IA0KDQpIaSBEYW5pZWwsDQoNClN1cmUsIGFjdHVhbGx5IEkgaGF2ZSBhZGRlZCB0aGUg
ZGV0YWlsZWQgZGlmZmVyZW5jZSBpbmZvIGluIHBhdGNoIzIsIHNlZW1zIEkgYWxzbw0KbmVlZCB0
byBhZGQgdGhlc2UgaW5mbyBpbiB0aGlzIHBhdGNoIHRvIGF2b2lkIGNvbmZ1c2lvbiwgdGhhbmtz
IGZvciB0aGUgcmVtaW5kZXIuDQoNCkJlc3QgUmVnYXJkcw0KU2hlcnJ5DQo=
