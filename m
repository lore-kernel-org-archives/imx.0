Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979941B376
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082668; cv=fail; b=GWYiIM0i3iGqCaztWICUUX1LtLgGlI4KNqCaT8nvgo/84JtSvbXXR9c8vnAzCl1Ohbh+3CCEmu+jP5tmysMp8qQURmzpqVKjfUCu+o3fgpNXBAjtP/BiPmPOrHoTShe7MPs5tXlgC9L/Bh8i9j/1e1OQstrXPQpHuTifAPnvBNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082668; c=relaxed/simple;
	bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eWhgFJroZumFCdfPJP+kK3h4SoESiR8vjndw7zmFiZNuZcaGr3flfOAwhnh1hQkTFSAqvwTqQo4AwVPKV2RgWbBpjC77U4DbeKV0oFi4nANDZtTyj8li/u4COXBnJHY0XODvJ/QYLTHzD1hoFRAY0BimBccGn2NBAcBhOiaMr/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LA4UKmUp; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LA4UKmUp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZLOzZt0pbxIikHLf1YdOmR60IhLW/325lJejtAUJ8eC6jY5yjcpltdSk9jJWOzO64+A+9r78JdOViuE6SasX1T9FD8bEkYgSRqK/xwzZcmiJfP0Y/z0X+hClgYbIXlQnYaz81idqo6xHMp37FRNUPOUfXlSqPWv86Q9MTSydF7xOFe2KdPuzUonVG77Gco3IoONaVWFM9J7Rm7kUPBfL+SbZKTzRDuuIfDsO4uSXN9pEFlE/vACpQzeYr86rF/JuG4aILm0WJ/18RsnYpbAL5xdS3tTXsbjSM4FIMmADhfeMnXtGdBpzUqKBAUYIPuh1qLUbfXQH8NJ9sfklB94/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=xhGHCq7+oHXz7JE8nU17phDP68QAtKPoLicfJnRH7yLvHX2kgaPr/0ngZ6SH7rJkOAAlFbwi5Wq65u1XNANjRms1kcFM7zdd0JYhc15H+N21YTAq84mbBEEXTF0s6u8mNdoMiyJQAhSiaF2+bIlmf5PvvTyo9fgj5SOWxpe6iFyaIaC6GKM7L1U/K/cTtCgxE/KVVbfBLmGOTEj/hbutyFKQwQd3BEHj2fZlozVLazB12ax/qmp/cryIRV4m59OaUqh/ujO4f9W0MUBmXcXgYgnoJ1/i53ohc4A5EOnMWXO/q86OVoOKqZ3n3/2f63gs2Q+ftguUhHWRcrwCx4Dtpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=LA4UKmUpbZu9gIsOH8cDmnjIvuRDgRcgy0AyjYTP3lOymEtlnsFG8d+JuF6D8fIUHRcpxjnUW2r7BMpjkOlKHt3numVuGV9IrSsRHincqioKsJlYbUTiGNppgAR31jGUi36oCFxJ9aXpKn5KVwdlKC1dVpT04afgXkYFnrFp+CYrgUYN2u/3QZU1Fip3XenVshW21jtMDglVyORZAalCCiVD9k8hB22Z/FwTbty/ZaubVttn3pBHw8GYEm07ODYVLUW+w2L63wJawh+e63lwWPguhO+12Q0vqwyJaEe2pl5YdGxU2+Sb7qN+WreF1oflwJNb/Bdm+e48RP+aKzRVFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GVXPR04MB9801.eurprd04.prod.outlook.com (2603:10a6:150:115::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 11:51:01 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1%6]) with mapi id 15.20.9520.003; Thu, 22 Jan 2026
 11:51:01 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 22 Jan 2026 17:19:14 +0530
Subject: [PATCH v25 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-imx-se-if-v25-2-5c3e3e3b69a8@nxp.com>
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
In-Reply-To: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769082570; l=3201;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
 b=8XqCqMCuQfEMVFTXI0OBbGZvAzmqutWn37x3yq6ceRmLleKvUkAuTSzvlpyBvMrYW3rWePtLW
 qNPJb18S2eYCwbfxuuAEd23Ws2dAQ3TNqAMqpIc276YXS4U7sTAWDoc
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|GVXPR04MB9801:EE_
X-MS-Office365-Filtering-Correlation-Id: ad5e5118-d5e8-460d-fc99-08de59ac83ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|366016|376014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlNVaERlbTJZVG1Nd1B2ZGxuMERKMXVKS3JlbG1OblhXUU1mbmZqR3pqY3lZ?=
 =?utf-8?B?VXFXK2NWUXVST2htaHF6VllLZzZtWTZhdzY1QzhvVE5makU2QU5uNm1GV1FX?=
 =?utf-8?B?T0ZsaDVvMmJIbW4wTzBZRmRSaXMzZWp2bk9xblNFOUhGbVIwS29rQjFzS0ZH?=
 =?utf-8?B?TzZZd2xqR3JWS1VadHd3UHFvTDdVM2ozVjZ3bzg0bWo5ZXErNlJ4UnB5YzRo?=
 =?utf-8?B?VlpQWXlaekx4aXJldlpTdnFlYXBtMTFWTjlHdWlCTzdYdEl3THRJR1ljcHBl?=
 =?utf-8?B?Nk5NbkpPNUh2QXphYnJYSWZoZlpuYW5zZ0czMmd0Z2xtcXMweG8xcUlIV3c2?=
 =?utf-8?B?Q1pqR055SFU0WEZaU2NZbU1GV1ZIUjJCZ1FSdm5XdzlYVXRWMnlDUkx1N2Nt?=
 =?utf-8?B?R3QzLzMyRUNCaWRvVE9BTDA1a2hBajRTNjM3Ym43dnZxMkJ3amJEbVB2SzFY?=
 =?utf-8?B?cFhla1dQRDVGYzBWMDY4TjFnQUJzVFBrdCtRc2ZXNFZlWStJMW5RTVpQOXJx?=
 =?utf-8?B?QUhpd21VeXJYUTBDR3BVQlBZS2lmdEJRL0wwWWYwT0FDMFRwYnFIem5tTS9N?=
 =?utf-8?B?THNScGV5SkZSaEJFTUxCRkRlbC9FaFFZTFlQNEdVVTIwd2tNSW1JUjgrTGJK?=
 =?utf-8?B?VGs0NG4ybFJGcGlLTWRMNVlPOGdtQzJpNGJNcWtDQStyTDhhSlBudUt2WTgw?=
 =?utf-8?B?THp3RUZjUUFJV3N1TS9rL0FHY3JsWmN4STFocVJXemI2LzkrM2dDVXl2Zi91?=
 =?utf-8?B?WU4zU0Z1MGZxVmRkcUhhalNXeWdaM0hVMVBHL2RMN0o2Y0YyZGlFZElueElm?=
 =?utf-8?B?UzU3RlVhNFRtNjZydWVtNDFhVUlKbTY3OGJpMkc5RlZtRFViZDZqY1BHZWk1?=
 =?utf-8?B?cHlabitYcGdpQjF6WGZDUWdxZkZZU2ZxMmZrM2FUMWVyanNQYThGQWFyencv?=
 =?utf-8?B?Q003VUwrY0VsNHpEMmJKaTFoSG9IR2VuZ1RFV2ZpTnNrRXdIcEpJVnZaaUFE?=
 =?utf-8?B?VVVkZmdoS0J0N0xSdm1lL0IrcDEvMlJxMEJMNGxCZ2RmdnBRcTBvUDByaDJI?=
 =?utf-8?B?M2R2aFFRT2NVUHRaaENsNnpzU3R4QmlPbmZXUmFzOGdpWW1sZWtiNHF1TDRL?=
 =?utf-8?B?S1o4SnV1elo2MFNybHYwSVkxeDNBLzVQMkZsSzJUbzE4QkQ5eDgwZVdNa2h4?=
 =?utf-8?B?NHlnd3YvYmN2OU5sa3E5MFZna09tSWVkTU94VEIrUUVEZkcybnJFL0VPT2Q2?=
 =?utf-8?B?TlVWN2QwOG0raXA4b0NQOU1DcVhPbVQ5OEVSSjdkTlZ6alBsakxycWRRMlYz?=
 =?utf-8?B?ODVtaWNkcm5Kc1liM1QvL0VndGRualBNZDJOOElCKzR5dmthbklzU2puQTV0?=
 =?utf-8?B?bHFPWFF6d2czTnFNaHBDV0lQaFNVYTNvM2FmSXRIUVZTT3ZwVGpJakVJOUNL?=
 =?utf-8?B?WnZnbzd0YzJINm13azRtZjJJWWNzYjZYcXJ6ejVlZHRKSlNhQVJ3TjlJTzkv?=
 =?utf-8?B?RGwzWFlsNE5VSXNwVGp6elJydkR5NUlxS2xFcTBlUk1nTFdZZlFDWDFPWWZo?=
 =?utf-8?B?YW9qaVo5bWdTcXU0eFNvSlVjMTM1bllpQ3g2Q2NLRkk3Q0VYcUNEUXN6ZTlw?=
 =?utf-8?B?YmhuQ3F0clN3OEErQ1Bvd2xMa1dlZDdpdzY5WXFlbmpYa29TUzZZRXJVR0JX?=
 =?utf-8?B?VjRTYStWT29QTmtqbjN1a01hSzMxdisybFNMMlh1aS96aEUvQ0xrRDlSNDh2?=
 =?utf-8?B?WitESWE5QzhBaWptUzVRVGt0UXNxMys1ZnhaL0ZCT2hua3BSdXh2aVk3OFhs?=
 =?utf-8?B?ZW16aDk1WGp2SnFhT21nRzFIdWk5ZjVjemJydFBwcEg5WVlCSElLK2lYWWZZ?=
 =?utf-8?B?c0owUFJ1cVIzRnA1NVlQb0RFOERzbEo0TU1UTEJFcGYvQkRJOWZZUFh5MDVD?=
 =?utf-8?B?dTQxK3piK0hSRzdvakVOODR5T2hZWCtBcEpLTzdxT1I3ZVh2eG1DU1l4eTZp?=
 =?utf-8?B?RmNqUjlrYkhOT08yMWJROUdRSWQzYlJLUEt4N1dyVWwrYTR5YUppVSszMWov?=
 =?utf-8?B?ZkIvVUZUYnZDYVJidkRMYzd2UkV6STBJdnJKd2oxQnU3R0k2OS9tdWtOT0l0?=
 =?utf-8?Q?VsOn7nsrdBnSSixdpREMwoMv5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(366016)(376014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVgzZlByZTBqK1daQ0NIaTBzZEhWbmt1S0FBNHBkOWhTZGd6WG5YdGh6alJ1?=
 =?utf-8?B?TG1Ld1VRRlB4YkE4eTBUTzIvOU5VYlYrR0NMT2pBQWpna0ptSWR6M0FWNzBh?=
 =?utf-8?B?QVZpeU5rYlFHTnY1SEk4SW41eTQwdjR4R0N0NEhPdmFmZUJteFRJanZyYVQ4?=
 =?utf-8?B?dTVZczdsdlJxNERoeUtIWDRnTkc2Vmg3WlJsMGd3Z2NjYkRoR0JSS2JIdzFy?=
 =?utf-8?B?MisyUlVaM0xxSXdwOVZ6OEptd3YzOExOaE5Ra3NiZlY0VldjNjBaTlhTSmlZ?=
 =?utf-8?B?cVJqaDFGVnV3a0Q5ZlU5RGhXWDVxVkxQUFZPbmRlWU9CN0lMWmdUZG9JYVkw?=
 =?utf-8?B?cDZtSE9xNm5JRjZadzZNR3dpMzN3UGxNM0pNcXM1YW52cFVZSStHVDlUVFdI?=
 =?utf-8?B?WDVMSkdhQUxNeEc2cTBlM3JCNnVtTnpwZFk4L0ZNb0xhWHYyem1uaFU2b2FX?=
 =?utf-8?B?QWovWVFnM1U3R3NrcUlXRkM3Q3NBMnBGbXJ2UkxsTThzWGdkSkgxMXBDTXlZ?=
 =?utf-8?B?WWczZE1VcXU5aGxwQnFoUG1GcktOeWxHZUhIL0lUTzJNM3pQOE5jRjFYaTRL?=
 =?utf-8?B?aTZpM3Fnd0t1THo0bmdRdWozaE4zUGZZWEkrRUQ3VWl2blpONlVQWDhLZUc4?=
 =?utf-8?B?S3Z5MU5takpnc2twRGN5RmIvejFGdU1FdEN6RGIyanVHN0xmQTJqbW9xRkpj?=
 =?utf-8?B?Qk1PZkFNUHFzUXhSYnA5ZzhDcnloTk4vZGkySUtRSGdQV0Z3S3pGSjBKWmw3?=
 =?utf-8?B?NHM2anozTGRwSjRvS2JlNDhnNmhMY2dCNlkrU2puaW16N2Y5cU90SkVaUlFt?=
 =?utf-8?B?cjRidHFkSGxFSXNnWEZBNlJqNWE4RjNxS3B3aUEzY0xxMzY1YUhUVlA2bzNC?=
 =?utf-8?B?R2ZTOU4xMENDa1lpUWlJZ1lzMTlab2g3SDVyaVkyNmdFVHlYRWtUVy9vcHM4?=
 =?utf-8?B?T3BEeGh2ZEVxNTdBQnRGcW1hYU9KSllzbWc1azVQK3ZjZzFCQWgwamhnbXZF?=
 =?utf-8?B?OWk5ZDFOZFFvNVVOQzNoeUQvTEFFVk56bEZTbkZ6MEs3clNyM1p4K2o5NjRR?=
 =?utf-8?B?S2owVGF0U0FDL0ViRUw3elRacVBDeFc0R0IxUjh5a1VMRkg5b2tLSC9SclQz?=
 =?utf-8?B?em5vaXpnS3YvMC9ZS0ltb1dhZWRTOG9wYnhYanAwQVlpeDA2cEtIWGd0SGU1?=
 =?utf-8?B?d0gySE1WeTBWK21RVWw0N2UxaWEyRG5Tc1JxOVhMeXdzSzZ0bEdIZ0FmZ05z?=
 =?utf-8?B?YStFdE44amhiamhDMGRISlkxdUNVQldDNnJBNDI3UW1uNVdEaWJtcDRYQkVU?=
 =?utf-8?B?K1R4dHVhYXhRQU5YQlEzYkZJVTgrWW5FRTgwQ1dNT25TQndLckJ3L0hCNzFN?=
 =?utf-8?B?WEM3RHY5RG9KNXB1MzhtQXk1RllRNTQxUnFYNTJIU1crZ01jMys1cWhNcWho?=
 =?utf-8?B?YWRGTHV3Sk82cEVhOVNSODZJcEhsR3ZmWmtPTFVXc2RMSHNDQkZtK2pIWm9N?=
 =?utf-8?B?R25MSjdjd3l1NFNXV3FhVFcrajcrRWJ5RU9qZnEyclRCSi9JY201OG14OExs?=
 =?utf-8?B?aGQvQjhoSEF2VHBqc0Nwamt4cFFWSjlJcDZFY2FLNmxLcElvV092NytkMkpX?=
 =?utf-8?B?ZmhGTk0wZXY2VHcxb0hVclQ2QUR5bGJUM3JSUDdFbFRnakVxamorZDJUWnhq?=
 =?utf-8?B?Rmozb3JydnpzaWJEdjNZUkUyUzZEcWF1bGxMM0c3WFdCWURmVU9BaVBxTXdD?=
 =?utf-8?B?UG9pWElKUENoalo1N2ZwYlpPc3dNVVlTNEkvc2pEMUszR0N6dWZZa1NNdmlm?=
 =?utf-8?B?YzlLdzFxSnNjQ1VlQkgrVXpuR3pRL2ZOL1k3SzFkQ3dBbGZkdC9iSmRJMU02?=
 =?utf-8?B?cEduc3JNVzc0Y2tzZmY4SHFOR3crVzFVRE5ISXRaN3kyaWRiUGQxQVR0d2g4?=
 =?utf-8?B?NjJJOFpNT3BGajZFNWtmL29Eb3ZIVkZKcXlGL1o3d3ZQRlRtaG8yRGc0NUpm?=
 =?utf-8?B?dXVvSUFsMWVyTkFRb2pXVGx4Ry9ETkdyNlcva255ZTYwZFNtM3VjUlBpNGJU?=
 =?utf-8?B?NjF0blQ3cFV4TisvWmQ1R25lYXJwaXoxaHF1UmNYc04yUkM1WFYzOWtoQlJk?=
 =?utf-8?B?MXRMcXJvQlR5N1ora2dTbXl2MUR6d0dUcmxKd0VUYXdoVjRydjhkaEQrcXNQ?=
 =?utf-8?B?NkN0VDR3VHFXU1psQkMxb0xSNlpEYmFFeG5Ha3lGdi9VS09pL1JNTkJrMmht?=
 =?utf-8?B?VHN1WkUxek1QODdFUUF0OENHUmJWUFNMdWh6clhUeWJhd1d5Y1J0WXpVZ0ZN?=
 =?utf-8?B?WndlYndIQzdLSjlyMWtEK2FBdWhNeTlFNTZPbWFmVUlXQjFIZ2Mzdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5e5118-d5e8-460d-fc99-08de59ac83ba
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:51:01.4028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkf/Atx7kr7f1C6QXSuiFLms90LVPT/kQEPuhnBhxDkTNryN8BcHJgCtrG7jqwFGni9xZ/5UW6sP/YwoU/XBQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9801

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

