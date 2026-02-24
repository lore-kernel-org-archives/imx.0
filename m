Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013026.outbound.protection.outlook.com [52.101.83.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18BB2BDC0B
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 17:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771952465; cv=fail; b=e1c9s8P0Nar0W8m0iB88KORlD7FNsrAvZQawzPdkJQ9omIz3of7a81/tFDUiQNQJSGmWP6rkAR5afXN9qOGys/Wr0rFFuIHEbWIsvVuILu40RYtvEALDURtXrW7WnVstJKWSZhXmA+crD+rEFxYn0BOjc112C4TaQsyAascYgVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771952465; c=relaxed/simple;
	bh=Ki/0MMyZLJZ71W8As3yRGlo5EV6AmGccvy2dT2OK5ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S9ZvFm3Kd5v86f1dVgpWPKe+dzIHvRknqfbD678w7a2OqmlG7UJoCVxVQSUcp+ZVbqCogc096YHbn6Rc0DtYuYaLjwvjYhJr2xqXgjjs1e5VEkTMY8F0bSmiVeqa7/KAWN82GlwGSDKg50BkDY9yC9rRfM/BjzFX5nZLXYhgH+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cHJW30Ia; arc=fail smtp.client-ip=52.101.83.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cHJW30Ia"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDQXjUqYgc9zTKjTUSXGLX1AJtaqJuNwCU9movsZoHsSg1ChL42PvBn+thSPieTvVMldVBBiVovhMtz0BHgn3Kuc0JJHhOcZyy1/roXLL5BtiL13C5RfwOGoLuJ/uJC03KxYFS1LPY7gDjEAMMEc5ysw/BBPjxLWzbZ1A95aEd4TxZQDmxdtF1/W09sb3VxcwGxaw0ySgpQh6zCIgIZSm5YsA+4iUAcw0d12Bx9035vexXDr3rr+DDVZUsY72bNJTTLM7aC/0V02HaQk7ZHQ/FIc1BqJ+n7/YcQFC7jgr45l1EGrv/h9i9Sw0mVbbr/4acvVUL5ETV5GA9wWopTdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ay2SxuZki8bJo072ZnmXHrBl6vGHoZOYCg/ND11LteQ=;
 b=EjRvRwuzYn1JUctZcxgU/L0ps6CEk5iDpWVP2Q9vcrwwICNOJay7NcNmt1gGpV3kv/xkNij1AKqw42cafNw9lxecKlxxyTsDtbujt4M/jTW6oSv+Ab4p4HQjYUpui1kX+6qfLAb14a0BbSK0X8Sy0K3a1KGG96eC2ZisboNH8/rWd/s2WJLP96+9s6nb+MJMQbrafOUnXbGWOaa4BEKb7hP4XWquiza8uevNCpSzy38fGX+7gTAxjhp0S9JPCNGsBoqA3pY/NKEamg3+gU62N8oNGNrhk/7P8tzRFNjiYmJSEA2cZi3r+GCX1vKZWFlO8J08RYrSUR4zpJn1vIAYIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ay2SxuZki8bJo072ZnmXHrBl6vGHoZOYCg/ND11LteQ=;
 b=cHJW30Ia6U1KEZiNYzgXw3PGuINk5PNNP1wif/l4fFKQJmiwSK7nPmWtS6TSbhQiz8eN/gpI37bd7S/RDOrCz30gTpXTLXeYoJVfOK4obg+wl5amH2i9V1FlYV2W56M35KYn41WhAiSrkUIQcFRkqGVfDOXamtlVHF2Fi7zB+kz9kVIgt2T5edbOdodpFZps/Hx05HgTK+VXQsZ+Hw5KGHz0jhlk7YfS9Di9DM4AiYaNrMkGF46rDWWQit7q2y8mua1weTJ2Z/bmJ8HgCM0vtWLznAMW1E/bIUbPjyiQDGIdwWnp4qYQy8bPFOlNjrvtLzoOIQlr3VuJhafXN8Yilg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AS8PR04MB8803.eurprd04.prod.outlook.com (2603:10a6:20b:42e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 17:01:00 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 17:00:59 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: Fix LEDs name collision
Date: Tue, 24 Feb 2026 12:00:43 -0500
Message-ID: <177195242681.2919847.2757638952820524604.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119103411.50397-1-francesco@dolcini.it>
References: <20260119103411.50397-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AS8PR04MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 758b1e57-bee0-4ae6-086d-08de73c648de
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UU1VZzRCakZ5NzVnVGFKY25uRXZvZWJDWGtuc0RjNi80eHJVNk5lRVYvbFYz?=
 =?utf-8?B?RE9DaGdFVzVjekVkamRFMTB1M0lsUVc4WEEzLzFhTGlBU21BRjZwaU1kS2VJ?=
 =?utf-8?B?aGZxS1EwcDAvaXVEd1kxQStmZmtDNUdKd3RHemk0NjM5MVhEejdoTzdkZWd1?=
 =?utf-8?B?U01lTGsxNkV3eVpjN3dmUFUyU0twaVBabHM1dWlnbXFlcTJwc3daSUtNaGRh?=
 =?utf-8?B?ek1mSm5zVkhtZ1dJbUJjT0t4dXhoSzlmVVF6UGZrU2ZiMU1CeDBHQVNHSFJZ?=
 =?utf-8?B?M3FzWk9ucjV2cXNFbURNYVJkZnRzbWw1MFlSekxKdDVXcVA1dzdzSVNUd1dr?=
 =?utf-8?B?SzhEK3FISE1mMmpYcnBwRXh5MVF4UEJnSE1aSGtXVEJvcHpqbVA0NEphNGRv?=
 =?utf-8?B?bVhrNVhDV2N5cEdSdlJwaWtDU2c0YzJZVWhqT2NVMU5lL25nN1J6V2FEaUtv?=
 =?utf-8?B?UmhjTnFCdVNWdmFnU2lCMy8zc1l3OFlKbFNvTUpsUmVmSmgzZXBNUHdxemRi?=
 =?utf-8?B?elJPT3NocnE5OTAzRzNzMXJjcVErdk1jc2pyWit2cmJJV1dPYnF5Q0ZRTldD?=
 =?utf-8?B?TXdjcmd2eGI1SUlxcmhhR0pGcTdTU0laeTFyRXdFS1dEMThNS3d3aFZvcHlW?=
 =?utf-8?B?NkN2ZllhcEwrNTJkS0gvaU9BN2F4bitPditBUjBZUWVXV2lMaTQzUCtHcm1B?=
 =?utf-8?B?REdlRkZMaytPbkxqRXBMUFdRWjhzRE9PRDZKUzFKL2VGOWYvZ2JWOHMvVkVr?=
 =?utf-8?B?K1JCUEFMUlI1MnY3cnE3VW54SVRQd2ZwRzNIdUM5L3dWNUZiUk9mbWFaZFJy?=
 =?utf-8?B?VlRNTHRIVEphcWM2Ny9RckhVRFNtdGo3TmgycHFnM1NqcXBxMnMrc1pxeUdt?=
 =?utf-8?B?Q3FTb2FGV24vMGpaSW1xUXVLTktBRzd4dHhQcjBWWkdzdS9iRDlDOVNOdVdM?=
 =?utf-8?B?OEVTais5WWd1eUFwVVdubVEvVjlDRmFRWW9KS0ZmUFhUVHRGcnhaU1ZWUXZR?=
 =?utf-8?B?VVEzdjVVTTE3My91MS9KSFF5NHNMcjQzN3B1UzZJWDFRSTJWakNRZkJtekpw?=
 =?utf-8?B?TDlrc0V6ZDRKSVEvSjgxTmJqVnJBSUNEYk9IaFBiUFc1R2Fna3ZOR0Zub3pa?=
 =?utf-8?B?UnRLemkwSUJqWjVLU2UwTWRsNXRXa1gwMk9LM3BjQitzditlRkpGQnJxRGMv?=
 =?utf-8?B?b1ptWmJZaENpMlVGS1BQcklPU056TUN6eWU2VGNUdnBtdlN4Y3Z0RWtkWnFC?=
 =?utf-8?B?S09ZTzdGOFhwSC9wcWp4M3d0UlBmMWZCbU81MEplUkhLK2JVRWEwbEErTHJh?=
 =?utf-8?B?QmJVVmk1THg1NHdUTWRYL1k3ZTFxcklIR1I3ZDBCQkU2TTZTWitEOGFyN29I?=
 =?utf-8?B?dzBFU0JmdEVBTFd2TUw2QnhHR25rblVyNi9XWnQ1REtEdE0yV1I5aEx6ZEFO?=
 =?utf-8?B?Q04weWtCVG1yaE5MTU53M2V5ZDVvdkxyb2NGRW5Ia1hDY2paRHpvaTZjRnlm?=
 =?utf-8?B?TE83V1hNN3d6K1g5NVIwTWRNMTJ3cGIrNkpGRCsxTnFGbFZnRFJPM0pDNGQ2?=
 =?utf-8?B?Rjd1bnBtc3RCdXdPWTVya2tPMlorUklFeE9tVnJHT2FaNjRVWENJZEtac2Ns?=
 =?utf-8?B?SVB6NFk0TUJUUk5kbTBWbjgxMHc1YlVpeWdLU3B4Sm9xMGlUWFV2UXZRMjN0?=
 =?utf-8?B?eGZSS3AvZnhSYnhPSmM2dWJYM2doS1NHTEt6RmoyN3R4Zk5DY2thNUlqN2xT?=
 =?utf-8?B?VC95b1lYNlh1cnRVV2RlcFFkaXY4RnpDNnA3anVVMzFweXo4cmFEUGFSVkxC?=
 =?utf-8?B?NXBFcEJJeHdBYjU1eVhONHo4MXRLTnZBMVlFOUdMMkVUc0hJYWd3VG5ObnBs?=
 =?utf-8?B?MEdPQ0lBVmJzODlHRFJBQjkzaTZqRkIwS2VXRUJQRVFFcmJYYUgwS2VUTnRm?=
 =?utf-8?B?dUxVZnFEVHR6L0wwTElYamk3REkyY1I5NXRONWtNUnhkMm5GVUxVdi84QmY4?=
 =?utf-8?B?ZnJkOUM5dVgwcTIzcnlyanA1bDQ5N1BZNWJtMjFVSllrbE51T1VIQXdlMnpV?=
 =?utf-8?B?Ukx0NXlLdHl3UjBnRW9zQlVudmlNMFFyTExhVGJCaXdEVVFXR3QwMitmZ3A4?=
 =?utf-8?B?VmUvU3dLdkRKVlhpUFdPZ0U1TE9nQWdXTGZhbTBnbnVVditLSk1oMGJpVkgz?=
 =?utf-8?Q?0t136iAegjjBgpywwxbG7Yc=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?d2RVTkZsZndidGVGY3cyL2lmbHh2TFNCRWkzRjl4Nmp6YnIrNUFISWk3UFJC?=
 =?utf-8?B?YUZ2YytSc2ZjZWF5VU1rTE5LOExCVER5M1NmTWlaWmsyS3VyOFdRbm1ycEN4?=
 =?utf-8?B?OXorZ3pEZ21HSmdEL0pkUUdXS0dNUlliTkxlVjZ4N1pxcGtKWmd5UFJHRENa?=
 =?utf-8?B?c2NONVBWcEluVGF1OGZyZmJvcGt5YjFmVWlKZFlJaGlIdkw2WmFMSlhGOWsw?=
 =?utf-8?B?Ly83VktwV0VLek12RUdQQ1ZuZ2RpT0Q3NitnN2NBeUZiRGpycTFUTEw3UkxU?=
 =?utf-8?B?citCRWRsUmJCZ1d3NTJ5bDdQdndody9ZQTRzaXJUdzloTXlBWG9GbjBWeUda?=
 =?utf-8?B?MkU0OWxLMDd1YitxbFFVUmJiZGdsTGZjelNJa1FQeUo3S1lMTGRSaXZJbGVh?=
 =?utf-8?B?bnFwZnMrbVBzVm9tNUR0alhqUzNadDhkNmc0amFHS056bG9CSk1kWTY5NzlF?=
 =?utf-8?B?K0JIR3crc1RnRFAzWXNwOXNVRm5xSjhRQk1CWG1LRHJKT0lGM2VLMVJrdHQz?=
 =?utf-8?B?ZEdISXp5Tjh5R2FncUl4N3RPbGFWd1M1amZJNm9PQlhFRVl3T2IwcXEwM1pj?=
 =?utf-8?B?L1R1cWxLVThjUHZFRFJLbmlpWGVPc0xtSFpRRHVDcW9xTnozWDkzTTZBbWhl?=
 =?utf-8?B?NW9vWFp4NW53RGJvc2VlN0krMHlHRFVjN0RkWW5DZzgwMXg5b0JSeFoweUlm?=
 =?utf-8?B?cTlUQjM1TXNSZ3hrZThBamZ1dnhIaFQzMGNhY3pVb0Q4R2hxSTA1cVZWbEs2?=
 =?utf-8?B?YnMvbWxreEJGWFNDMTk4ajJsRUlTdHJya2dkSHlMVUx0ZmxmVUkvWkhvY1hj?=
 =?utf-8?B?aWVqa2s5Sng1L3ZxRGJHSVVhK2xZMEdyMEMydCt1K0NFdFBWZUgzL2tlSitJ?=
 =?utf-8?B?TVcraTI2ancrQ0hzVDZuWmh1RERBaUo0ZlY5dWNMemxKLzJqRkxzM1hOS2dz?=
 =?utf-8?B?NGlCVGJOa3IvanJOU1d0aTVYQXZ3TTN0RVhWbUxxUXkvZzV0MTI3bTFaaGhl?=
 =?utf-8?B?VEo5L1BzRXEyL3dWTlpuQzNvRWpUZCtzWWVNWXAvekJScWxZYTVJS0ZpYWZ5?=
 =?utf-8?B?SzNGUitwT1AvdDJldTU0U2ZaTU1NM1J3QmpzUGIva3JHT3BTOUhGU3hVRnlL?=
 =?utf-8?B?Zk13WVN6QUowTGRyZW4xaUlXRGdleTRZZWlPbkJ2K0FNUXJUWjV5Tm82QTdT?=
 =?utf-8?B?ODl4bDIrQTVEc3VyM3BCRmdVWmV1RVgwS0xpUk0wcURhT1FyS3JtNkxYVmYx?=
 =?utf-8?B?bWNINjNQSUhIVUpxN3pDa1NLa3Z0Z2kzcG1pSTBnZWxGVU9tYkMvRDkrSGdX?=
 =?utf-8?B?OHRMWURzeDJNNDJZK2ErR2JLcFFicUNIL3laNUdUSGs0bWZ0QVFoRG9tWVl2?=
 =?utf-8?B?cTdGbkRMQ2pWcDRzUlNpbjFqWG1IM1JwNXUrclpRVVUyMjhWM0xOSngyS3cr?=
 =?utf-8?B?L2RIS0V3djYwbDZOdWVtOGVnelo4TDhYY2o1MnZsR0VCY01PL1ZiWjcxNnd6?=
 =?utf-8?B?ZjIvT25mSTBmQ1NkbUY4Y1pUZ1oxaWl4NWw2d04vQTBVa1dESG94QURqaDRt?=
 =?utf-8?B?aFNjbUx3dFJoVXNlNTljaDFpVWNXb0FEdjNSeUhweUtob0k3anZ6STFiQlBj?=
 =?utf-8?B?bXkyaU9sb09SWHBzdzhyeUtXVXAyT3hOL0xmeENVVjF2TTZORW1pS3YyWm9j?=
 =?utf-8?B?VmxJZktCaVRPOHJZeGU4VFF6ZTNpV3JJMUhlMEs2ZElNRENuOS9JbDFiWkd0?=
 =?utf-8?B?ZjZaUmUrQlJrOGdZdkF0ZFkyY1JDNHd5SWU0UWZMOEdndDA2cFZucXhnT29q?=
 =?utf-8?B?SU15NmRUVys1ZHJQejY2azhja0dTbEtzb2FRZGtnMU1OeCt5S094NmVIbUlu?=
 =?utf-8?B?SlRnUlZJbHZJL2VTLzdCUTNRL3NHcFZhVEdwUGttb1liaGg2TmF4MzRTVXZX?=
 =?utf-8?B?QlJIYktkR1RRMUhXdmljWkljOHV1Q0FFWi8zU1Jad0tkVU9kb2QvOHp2ektO?=
 =?utf-8?B?SVBKWUpKaGhvSit4ZS8veUZOME1HVW52c1dVRThMY2E3OHBjR3BFdjI4VzNq?=
 =?utf-8?B?eGhXZnA1VnN6MzlBaUk2ZlpnRjg3dTVHenkyOGY5cmYvdWw3dTVJNkNHQ3pl?=
 =?utf-8?B?N1h2OHJPSG5sdnprdVZOTmVvYkRqeU1zUnlPN1YvV1RTenp4dEVSdFNHREQ5?=
 =?utf-8?B?SjQ2dVJ2SmVEcGlSNzF0VmptcGg0ZDdGVmYrbDMwZEFBKzdBdXlKVEpMcDZP?=
 =?utf-8?B?ckJ6dlRpUjlpMWtZandwOE0zY2UycG55MHF0TmxSeXl4ZlNPekRqQnFneG0x?=
 =?utf-8?Q?PYiD0ffUs7BPvTnrfM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758b1e57-bee0-4ae6-086d-08de73c648de
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 17:00:59.9291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ga51+Dlmk92X5XP8od7TQSEbF9vFT0Pwhv6HTonhlDCGLpxDiDs/SUtaavmvg7OGFeo/TYr0vwxWijI7kiNr+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8803


On Mon, 19 Jan 2026 11:34:09 +0100, Francesco Dolcini wrote:
> Ixora boards have multiple instances of status leds, to avoid a name
> collision add the function-enumerator property.
>
> This fixes the following Linux kernel warnings:
>
>   leds-gpio leds: Led green:status renamed to green:status_1 due to name collision
>   leds-gpio leds: Led red:status renamed to red:status_1 due to name collision
>
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8-apalis: Fix LEDs name collision

Best regards,
--
Frank Li <Frank.Li@nxp.com>
