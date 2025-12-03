Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046E330275E
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 20:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764794771; cv=fail; b=aWo3lFR3qtBkPh4GymfyzKcd0tECAL+kFBcNf2uzioSOejd88T3Xc+1alMlBR47WocSOgxMdfFYVUkeWGgJHx8YZkQYPV3fzzTS5cIHZxEfnTrzNBY1p5IxhQAsJp7fMPu8SiO6j2foupWn5q9YVxEsCAcQDvCv32prjl336/CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764794771; c=relaxed/simple;
	bh=TbxbzklDS532ao10M9kPxLeMwRBf4t91BIEEyDkzbhE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=q/8Ic3l4x+IUx0zbnZsPmDxLx/TlGAwl6waw9mJFi+sQpkxqb0lJ2b8bXLvXgGprOInSd64dKdZOxrJAyRKvVk2gqVfMOI/BnVZocKr/6weFSb3iMxzUdhmFKXnG3yKeBYWrK3IJXXs5r3XTv7zoPUbAkx6/o1R7WJrx3XPR1gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F+BfwZv5; arc=fail smtp.client-ip=52.101.70.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F+BfwZv5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZHLReQYQSY1dajzSAvfre6zp0rdH6q6sgKRdPfJMWojcyy8QDKJhUeG6x0+1uPOHrf28ioDwilCiz4LwANn8//rN/vP5WbFTUeLdMhPM4wTobggGEp81iChMFFNfzDzcnP7GOof4AS2sN01r64994g3K0pNlrbu3divPNqk72yTSJKYJPVzBRvlv+I/YGYoevlGKpgeQW+Ya2eiv1+vTIPl3hyRY2bEKLq3uZyk6cWKI+Q/cG+VAw8GgTso4q0gdvyNUf+E7voZoVd2lJsNplshxpMzvqGYQ1GtaiewYMCde5FWu6D2fpS6Po7xwdAaFTi4U8vzkqCLu7BLaWyw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78tc9XZVDPqnP1fwfMAad4+jt3SQZaN55IGptw4wvnE=;
 b=UfKyWJmZbxKCGu0ViEpNeCQGCCkefVJ3HLjswXf86u+B7sqfX3heARwTZ7fiIXbTscZC1Ji5M63ks298pu2kccZ9/D65ahq8/rzCV+m1D0zY5zgk1GWkgyACRin3szHSO6WUA5R/eWBJ57jM6jGpdP9xxXQ/4xNlGWE0gSXomvI+nX5oHbSRYhyoMvTwIOpM/K8ZOWmLHBFgCjG6iTSag8zw+qsKGUZJAflKh63KNmS4jAgW/Mj7S2JFUW8S9MIl/qKsfSE6EFakhRhD1J1galcLYrBrCVJSg3xR7dPR0UjxfiNQExlfAq4mF4v7sEbGjti5Csxl3a/5vlkjnAPkKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78tc9XZVDPqnP1fwfMAad4+jt3SQZaN55IGptw4wvnE=;
 b=F+BfwZv58Xd0NYL0Pvknlq/Abpfl5X0n4AyGJb6izN6l68405jyJT1Lw2dseeND5QqCSom8NrmybPlGZE/J4DXA00OEg63MSaq4adWwZ6J6yw3+jInD7m1aM6YNZb2n0oLYd7iwkl4MXW0yz0CmUT038aMwry5X6COLJmzNVKvFKWNNy8Lbxbbpbekcp0crjnZ3tPznwCPgU4VOzE+iudaz/k+MyGT8PTo+xozjt0AbCMIDMdyPoYdq1YZPaEPuGreUdrTiz2VvdJphWW4NnM/l66M5fxmg0hSAWxRnQPHSseAMV1o/N/1lB4kjcZLeBjlclHN/Kb92FswNt5zxUeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8949.eurprd04.prod.outlook.com (2603:10a6:10:2e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 20:46:06 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 20:46:04 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/2] i3c: master: switch to use new callback
 .i3c_xfers() from .priv_xfers()
Date: Wed, 03 Dec 2025 15:45:49 -0500
Message-Id: <20251203-i3c_xfer_cleanup_master-v2-0-7dd94d04ee2d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2hMGkC/4WNQQqDMBBFryKzbkoSkdiueg8RieOkDtQYEisW8
 e5NvUCX78F/f4dEkSnBvdgh0sqJZ59BXwrA0fonCR4yg5a6UlIbwSV2m6PY4Yusf4dusmmhKNC
 ZyhqlBzQIeR0iOd7OctNmHjktc/ycR6v62f/NVQkp6NY77GVd2rJ++C1ccZ6gPY7jC/VOqBu8A
 AAA
X-Change-ID: 20251027-i3c_xfer_cleanup_master-cf75a712dc7c
To: Jorge Marques <jorge.marques@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764794762; l=1190;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=TbxbzklDS532ao10M9kPxLeMwRBf4t91BIEEyDkzbhE=;
 b=IVMzZlFOV2DPv6Z1OA5C/950Y76J3A982Y4fr+f8Kfj+QfEtWugE0DLneaqcY80UVrFeLeDOX
 LJ84CoSCcLJCP35Zpz3cJYXpvjS9D7gss50Izwibne5xM1REJ+qJ9ws
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::28) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: 498d6af6-876b-431a-9b5c-08de32acf9f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWx3NTMzQ1poMk5iMkRKcW1DY1pDN3kxenRtcnhoWFBieWtZZW15U1Y1NjRC?=
 =?utf-8?B?S2c2cTArWVZpVmdMVDBkbU9YaUcxeHdKVUFxanJnSlE5U2d3clZlaHRGUUFR?=
 =?utf-8?B?NjR6QzB5ODJNai84RDdhTzVqQ0FLcGRPeTcycEtFM3pJdlk0ZUNybEhxaU5E?=
 =?utf-8?B?SlZBUDQrQlQ1Tml0UzlPdDQzdWtyYUZadSs3aEk4S296cFZhdDNzbFlkZDBP?=
 =?utf-8?B?MlRQYnZkazJUZTNpdTVjSXQ5QTFrd2VtdmFCdWpuWWZqS1pvY1VGNmJFWnpY?=
 =?utf-8?B?SUh3OEMyaHIrNXprZWhKOUw3cmJTTC8rcGU3VDNqLzBiYjJDZDd6akd4VEZ2?=
 =?utf-8?B?VVNoTXg0VVpZRXpuVW5KMDE0eUxpY281MDNZWkRjQTFnZnZhdTNTcWtUQWVj?=
 =?utf-8?B?VENZU1FCSXF2T2pobnU3YjRGeC9aOEdIaEpOMkJBZm03cGRpOEttNUNjOGIr?=
 =?utf-8?B?YmxSSGlOUmpkSEVSTTN5UytJMmhCVng5Z3U2eU1iTG52MUdxVUd5bFZ2SU5E?=
 =?utf-8?B?YWxLK1ZvNEdRUkluNmtjRUluaUE3Z1UzY2RqL1hscTZxNUZqSDg3azFFajg1?=
 =?utf-8?B?WFdGbnhhVUlSdjVaemUzM0NmVFlUU3MwTDFUS29aQzFuMkZjcTB6UTFpQUc5?=
 =?utf-8?B?TTExREJTOWRiamtGbkExZkswM0JldXZLYzB6TnRTa2hsSjBJZ3FUZG1KRUlw?=
 =?utf-8?B?ZTZRNjVnL1hFQkhqMEdLWFBuWUxoUnVwY0REbFg3OHNyaDNMVkhHZEF5T2lJ?=
 =?utf-8?B?S2Z1R21DeHlSZndiamxFZ1J2ODJOYW45RTJKMy9mdFZMb1JPbjZaR081Z3Zi?=
 =?utf-8?B?RU9pd3oxOE53M3NUMWt1RkxJVkdDaXIwSzQ5bmpGU1JCU2lEZVRzUllkdzVD?=
 =?utf-8?B?QSsrbnZiSFRUNlYxaHl2aURvVGZSdGIzaTllaTR0YTNtM2JBQXdqOEJDN0p0?=
 =?utf-8?B?SUtzZXVtNjNWSmVaSTRpUDVFNmJ0aXk4aG9odVVEZUZqQWVlRHM2WEIzUHo0?=
 =?utf-8?B?VEZMK1FxZjB3QlI5Q28rS21TUEhmeURRMis0NGU1ZS9rNHZvZEJ1eEhIMHVW?=
 =?utf-8?B?YUkrRDBJVXFvQlZnTU9xZGVaOWFPaE1neUVkVnk0OExkTkY4TzRmMjBLR0VC?=
 =?utf-8?B?ODVDNmZCNUZJWThKbXhWM1JmVi9TVnJxLy9NYThmRmphK3c2SVl4amx3Rmw0?=
 =?utf-8?B?UHNuZnpaZUc4T25yRHc0TENSZCtCNTNDK25lS2RMc2JCQTJRK2dQWTU2b29k?=
 =?utf-8?B?enZMVU1HN1p3ZzZQdkdGY3loWEZRS3ZGKzZIS2ZQOGdYVXJwbG5tbi9vb3R5?=
 =?utf-8?B?NGJNUWNqQ0ZFUHBJU1lzb2xkR20wWERSMGNxL0dsVmN3YlI2SjdNWStEUi8v?=
 =?utf-8?B?cmZ0eWhtU1hlK0tTMGdxTW45NzNKV29RdzNUODZYeWFBYkhGYzRaT0YzNDBq?=
 =?utf-8?B?UG52ajJvZ0c2aGNvS2t3RUN5MDQrZVR5UHF5TTVYNmJ4eUpub0NZSi84ZGIy?=
 =?utf-8?B?a3VHWFdmaEtiSzVGNEhLQ3dVZzJGZWJJd3QrWEplaEtwMktPRFJ2bzgxT1p4?=
 =?utf-8?B?TGRJclc2Skx4THljVERyYW5PdFA5cGZSRHkyVThqODVKUVJ2em0vdFJiN0cz?=
 =?utf-8?B?aC9sOTd5V0NNeFd5MVQwTDNOR1lTdUg5aG9mY1o5ZXhDeDQ4MzFHd1hKUWlv?=
 =?utf-8?B?L0xFY05tSU9pTjNmOC9odVVhL0lVdElsa3dndktkYlVOT1p4c3FRSmFzSEZY?=
 =?utf-8?B?OHU4R0RidEMwdVZpNFgvZ1pMN25FMnFCank4QVZEMW5DKy82VGkrcEd2djh1?=
 =?utf-8?B?bjZvbmZzV3J4MUxGZGFyZ0hWcUIxa3RtK05MeHVhQ2FBWGxGOTltN3ROSGEw?=
 =?utf-8?B?YTNDbW5qNzdvcmVFMGMyczBvaDR3bzIyQ3dpYzQvblRMblB2OXhUaFdpS3BC?=
 =?utf-8?B?bmR1YVc4aGJhMWtOWmFLZVRxOWVubi9TczliRTVnSTN1WXhOTGJjOWpSRzZQ?=
 =?utf-8?B?dlRDNDlSQ2RBQm5FYy9FMUhhR29vZ0xaN0JFZUg5QWxtWHhvYzluRGFvRzVt?=
 =?utf-8?B?VDZtbUZQcWlOOHFvSnpaNTdWRlJ3TjRiV2lvZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDI0elZFM2pYa2pDYkI3VGI3SDRkb3U2L1ZHUWI4ZFBwL24veUdpeVRvQ01q?=
 =?utf-8?B?OXg4NU41MzhmMjZNd2Q5Yk9MelIwUVBRbGZjaHJYOXIxSlhDdTl4MFFMbHI2?=
 =?utf-8?B?RnZUQ1JIRU8xZEQ5SFJ6L3FvZG5majl6K1dFQldXdzJkTDBwVmZ0T3Z3WFJP?=
 =?utf-8?B?c3ZzZW5ZRG84TzlPT2E3SDhsc3lONUhGVFByaTdaNzdVa0JsN3djQnRuWDdS?=
 =?utf-8?B?M0h4eWhZYVFsWjQ5bWJldkxCVHZMTHFyVEVhTU0wKzA3K0pXZkdUWGsrTzgw?=
 =?utf-8?B?MHcvR3FlaE9NUjE5bXUwYWJUWUNsaWR6VDVvQ3IwcVJYb1pVK21kUFVPYXRl?=
 =?utf-8?B?WFplUXFDajNBdVB2UnBVajlPNCt5Q1lxSTg5Q0QvTlB3cnoxUkd3NjQ3YzB0?=
 =?utf-8?B?a3BZME84YWpqNERwUWlBZlRHRktZTmFwdEd5dkRteTVSR2RzOFlBc2NVVXVu?=
 =?utf-8?B?c2M4Z3NYN2lyNk5NMFVubHBLMzMyZlpGc01aZWtWdUJ6OTU4UG9YaVRYcWRL?=
 =?utf-8?B?L09maEZnRDg2U012MklnU3B5R0NZTlpObGh3ZkxRQ2lWL01PaDcvZkFaQTVv?=
 =?utf-8?B?UHlSNzd6aTFaWFU2dEtlNVgzY2cvZWFlQk90eS9DaFFwT0VITW5XcXhJMVdm?=
 =?utf-8?B?MHZhOTBUTVc5ekMvVmgycTZ4YW91U3VRNWpmSDJjOFVhdkcyZXZVelJxcUhZ?=
 =?utf-8?B?VzNlNERKUHpzRHJ4VUxIeTU1NnFtN2tyVXlEbE5OTzdYeXN6ZXlkWElQZDhQ?=
 =?utf-8?B?R1RkaVBQZFVXNDZUQTZIOTNzMXhGZENLTXFnZzRXVUZ4MEVqMUZVKzNFQmhl?=
 =?utf-8?B?b3luU3JkQm10M1VQL2ZSMVF0S0JWd1o2NjhBMzlUQWIvWkF3R1MwUll6ck9p?=
 =?utf-8?B?cXB0aXNrb082VDdZSVlwaENzdHFzMEI5T0FaZzFDL0RkdUoxelB2eEFERnBQ?=
 =?utf-8?B?N2xtMHRLS0xpT3VsNVg2QzVpUEl1UlpYSmlBeE0yTzJnbzk3b1lRTHo4V1Jo?=
 =?utf-8?B?NUFwTlFDM2lBbXhINTFPTlplaXQ5QVRnY3lPWnlHUi9DUlZidkdwQjJBOXpS?=
 =?utf-8?B?K3piZkgvcVhEMDJJOGJLaEc2SDlqZ2tMSlZTTi9tREIvWmc4WVhaamVHOFl3?=
 =?utf-8?B?blpCcDBYcWFkU2ppMFdnZHlHN2lhZkQvNDFrQ3RSTDdEeVpkT0l4bHdZVFQv?=
 =?utf-8?B?YjZVRGpNaUxKcmF1d3N6WkpZK1V5VjAwUWRRb2JCRTRreXBsN0tLbExzcmc5?=
 =?utf-8?B?NVE5K05MVzlydkJUNVYvTmlFOElDYlJLQ3dPNVNjT3JSZXN6M0JidjA0QjE4?=
 =?utf-8?B?MSszdG13UUt6Vi9YcENHeCtqTWRLQU9LREltaXhUb25WVFVNNFdHdTJVUnBW?=
 =?utf-8?B?Z3dlblJKSlFwQmdCU1l6dm5tc0ZFZUpzYUtIRHRaVk91ZkdDUC95d21CVGJO?=
 =?utf-8?B?bHZDNHFWZ0dsajN2WENyTG5JVjlXemNoKzZIUnJzSEEvTXNUNDZLeE5LWldI?=
 =?utf-8?B?Rm9vZkhuTHo3WmhLdDlmdFJsVC9zcWVBbUhZYlBBQmJhWFhRb3dPVTZBTHZy?=
 =?utf-8?B?cG13OTJpa0JBcFQ4aFJ6Q1NKck0yTkIxRzAvdlhiNHVrbUlMWFlIeWhXS3Iv?=
 =?utf-8?B?bHV0cWE0TjNLQkNGYmVUc1lqTk52NXViQnZQcGtUK0dNOUhMcmJCZHU0YVVv?=
 =?utf-8?B?bVRFVUIzcHRkaUJseTUwNzhTZTUrSlpsV1g3UldqYTJHd3Jqcy9wajVVTEpH?=
 =?utf-8?B?YjhYT1lzUWVFUFNDajI1SnAxdU85UGY2ZlRiTnRQdXJLM2ZsOWJLbXBFeFNM?=
 =?utf-8?B?RG5TZ3lCeWNDUWZDZ2NHcXcza0RPM0tzK29Yem4yLzh2ajgwUXRzckd4Qi85?=
 =?utf-8?B?eVd4dmN1RTBIVTJOS21TMzdjUEYyYjhLSTlNWVowZEtraWxzbVk0V2h3K3FI?=
 =?utf-8?B?RE5MZi8wNWpEcTNnZGVNZkFXOVVuMHFnL1FsTXN6bTZSd1B4L2xVWFV3YVFT?=
 =?utf-8?B?TkVjNzlzVEVUazR2Qk1CWU5MVEM1azJVeGFQdUovNTBaektFM1YreDhrcWhW?=
 =?utf-8?B?ak8rQURPOExyMEU0Y3pTSTQySjl3Z25vcTRWWXhPVmp0WElJT1ZZbGl2NmZM?=
 =?utf-8?Q?p0UfFHBBePZqkYx/BnccVqWge?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 498d6af6-876b-431a-9b5c-08de32acf9f8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 20:46:04.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tl/1Sw9BhAa8QQ1aOJO2IrGUXes6rwqvJDm2CzINl+IARtbFv2fk73DrOVo2c17JiZjLyHbF4HhUaCx/SkDVkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8949

switch all controller driver use new callback .i3c_xfers() from
.priv_xfers() and remove .priv_xfers() in framework.

This serise is base on
https://lore.kernel.org/linux-i3c/20251027-i3c_ddr-v7-0-866a0ff7fc46@nxp.com/T/#t

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- rebase to linux-i3c/next
- Link to v1: https://lore.kernel.org/r/20251027-i3c_xfer_cleanup_master-v1-0-e9bfcb083a38@nxp.com

---
Frank Li (2):
      i3c: master: switch to use new callback .i3c_xfers() from .priv_xfers()
      i3c: master: cleanup callback .priv_xfers()

 drivers/i3c/master.c                   | 14 ++------------
 drivers/i3c/master/adi-i3c-master.c    |  8 ++++----
 drivers/i3c/master/dw-i3c-master.c     |  8 ++++----
 drivers/i3c/master/i3c-master-cdns.c   |  8 ++++----
 drivers/i3c/master/mipi-i3c-hci/core.c |  8 ++++----
 drivers/i3c/master/renesas-i3c.c       |  6 +++---
 include/linux/i3c/master.h             | 11 +----------
 7 files changed, 22 insertions(+), 41 deletions(-)
---
base-commit: 79c3ae7ada0548d5097bdb65dde5d24a7d660fae
change-id: 20251027-i3c_xfer_cleanup_master-cf75a712dc7c

Best regards,
--
Frank Li <Frank.Li@nxp.com>

