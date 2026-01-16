Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CC030BF69
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563498; cv=fail; b=HJRYP2+gD+5QSGCtePVJ/qf6tVvv4F0Iw2GBQu65pDRwgNJbt2mU62ettqfGcxs5ovF7Isnkl5S6VbcnDld1ImuQP2RBmyp4Se1sx6iMK4WgPOh5b+VyrIIFjFlA30B/3upKocU+UyBfmXjmZ5g1zf7AOPyYxSDLVjLn7tv7dz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563498; c=relaxed/simple;
	bh=nAtiVOQnzDGO65/91kBCsLwHj5yWCFQB2FGddpoYadc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BoCrAKNohJ51OZY9NZNd5YwVFHK2cJIZcLH4QnyDLwyBiIcK4srFACg8nbvCJKvijSK6PaGagfll2WJDAb++lwLxxD6te9FO9kMXQDMOFvP3nuKIrsP4ZXG9bS81TEBxBavNXJif/weJLSJd8cSioMLEjusM+qlGh1V9lGXtPOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DdpbYcnQ; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DdpbYcnQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZ8VznzA8QONmEeWxa5QWLXonNn/SNU7uxvScmHR9Q2Rb7OP+4mkPIOHqbpPy0xcuF0dapcFCsGsSnNuvgdk2wrul5gS+AhVFi/5ZjjcjtCi1Uj7IkIw/x3pw/t89WZ8qMcckomyVkBWT9hThuBw4axKNORNhcFM1Ylpj/AH4RCS509khsC5gcvpEJj3zYc8AwoXrVnVuXAZAn9lq5kqqS55rgyvXr3yRO1vCW0NIQ7eAdbjZeIMuHjhKcuXEYW6CwJFs6+740NQG8y7EKCd1ViGHIpb0a4bLFZ2+wdYCiA5TAB3+kyP44/TjgcNP8e7Usucin3oznSZQP379S/lAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMURAvxjLVcmaanqmGgB4Baf6gcTvTxiOsttmPA80Ps=;
 b=C1RYpdlaGliQUltbk/CzInwanGvuEIVCwxqoZHkCzpFx9JsaW+9s9Aw/2iUmqKIfogPRmKw1+P44iAYD/Ek6sZ6YQeXakFsH2FTgoXbAHPPz7oIcaCvxa2hawxUDGjEtC/IdIHIj9c+NsNDM7b1PE6elJ4nnAUStwwRcF7xcWx+seIrYIIS9fBMB3HkPnGmo+ZOD35aNlaoR3AY4QRh3GtMOHMrjGwv0M3jPLs5tw0TXIOSX/1xqQiCXQw1YRdGXYS2p5kFNzyX6sEgOxa0Qwgg0tvmMmo07RhkjaLCS5B++YzIJ1Fg42rWm3NM+ezB7xF34NCEyzWq3arRkxWy8jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMURAvxjLVcmaanqmGgB4Baf6gcTvTxiOsttmPA80Ps=;
 b=DdpbYcnQrQ3/UCEgLarOJ1Asysm4YpF2XChFWH4QPj/0HfJ189uISKnSJnbY7GxECoWmFi3ftT6lN1KzHvSF8wgM3a1/kgOcqH8ZNJTA4oywcuqnUgKUJzYZgztlk6pkV+z5fSHX2Cq0l1Q07hGLqMiatbtRXqRpKCfrqEspMvFZ5FIJfiM63T2QzkPdJlNcdvY56cKaK9kMu1SLjim2py1WP7J2hPTydT9d9jjeSVDrB3JVoGhwTAzs5W/63Ro2VWOmTPFSVKAsUko2CPgeic21wqCHRKJ5wiDi8HSgXGBwiRuegWohk5t6OUS6A3kCIvufUTecefIlSIP6xuYEEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB8856.eurprd04.prod.outlook.com (2603:10a6:10:2e3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 16 Jan
 2026 11:38:13 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 11:38:13 +0000
Date: Fri, 16 Jan 2026 19:30:58 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, neil.armstrong@linaro.org, 
	shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, 
	Frank.Li@nxp.com, linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <rrmva3t4tesocitdrz5yfb35wer4htr5lkymzoyhjx4ajy7tt6@fbhlvrqzswd5>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
 <c1425564-9dca-45dc-ac5e-093150a3ff01@lunn.ch>
 <aWdkapV39bOArR-d@vaman>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWdkapV39bOArR-d@vaman>
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU2PR04MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0f0213-59e4-442c-be2d-08de54f3bba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3JhUkp4MG9ncmZSc3pDTHBmeHA5b0p0M0hEK2RnZjJxaERuOTI1WDIwYUlr?=
 =?utf-8?B?emRCSDBQcWNlU0E5OFpmMWQvcGJ6ZFhkSG92ejJ6RVpucGx4ckR1b1hqSW5j?=
 =?utf-8?B?MkQzZmhXMGhoTjRIRUNnNVNGa09xckJuWGJZaHNuOS9TZzlSRmFuVG9qRVZY?=
 =?utf-8?B?RVhrdEFmQmdrNlROd0lPNktsQ1RzL1JnMkVRUEVWMGlmZnh2Nk1jMFM2bGwz?=
 =?utf-8?B?T00vVmwvY3dBTmljeUhCWmJsVWpTdkd3TjBlYVZwRE03cTRvTjZzUlJZb0VX?=
 =?utf-8?B?YUVyZHUzQ2JORzZEQmYzREwxNkF6alJzUlVvZGhmSTljc3lRd3k5WEhpSHJy?=
 =?utf-8?B?VXRaVkFmY1FYdXcyd0E4ZTB6dVZlTnpGeVNJSU9PZWh3djRQTlhjbTlsYnhV?=
 =?utf-8?B?UUpNTnpQd1lCUFk0UUZlbHFseE4zMTBOelc4K2dROGZNT3VQTjZTQ1ZtQlZ1?=
 =?utf-8?B?RTB4WVpTbk5mQ3puUGhIQWF0UlB6d0srNHZSUTJrbXNkYWY2d3Rrd2tTaVBD?=
 =?utf-8?B?ajhoWjF0WS9kRURUY2t1dmRwWUZtbytZK2JDZ2VkVlVjRDJ0N2V4UXNtNy9k?=
 =?utf-8?B?OW9aRDc3cXVUSE5IV2NJQ3B1MG9XUm95Mm42RXZUR1Nmd3FHMEZkdVZUNzk1?=
 =?utf-8?B?VVg4M2ZyMVdzUE9ud2RUaE9JdXFJWjY2Y04wYXhJZzNlSi9ScnJNSVJYdi80?=
 =?utf-8?B?eFJOMUhXRkgrcHR5azFGT2tkYkt5M1pGczJNQVArSWQ2dlcrVE4ybkVQR0J0?=
 =?utf-8?B?MElmYUZRNHJQQkErQnRMMFpMVUlBSG0reVhKRGprM3BYS2YyTFVEdzVOMXVK?=
 =?utf-8?B?N1pQUUk0VURCcWV0R1FBb20xelJ2ekVOWTRWRVNlc0R0bTVUS2dqQjhuVmlP?=
 =?utf-8?B?Rjl5c0tRcktwVDJ5TzVIdGJLUGtoS1ZpZjhLZkx2Mjd3UjBwN256M3hXSjhE?=
 =?utf-8?B?T3ZHR2luaDlrczYvYzd4a0RJcWJlYkE4a29NYThIWHYyUXpvMGwrQzRlTWZM?=
 =?utf-8?B?a0hZcVNDY0tlSVBCNGg5Z1QrVzFtdWJ0NkZqaVZ1dGtiK2p2QzZRMDBDSGhs?=
 =?utf-8?B?QUxDTnNyR3U5ZEREQmt4am5sWjdNMFAvN25CcTNxWS9UY1NwNXlucmhaU3Rj?=
 =?utf-8?B?QjBPTkg2cHNmVmVLdTQ3a1RndkUrZlBhK29DWG5yemJoQUJqOFdXYUxnUTk4?=
 =?utf-8?B?Z1BkNlVUeWdsd0NqT3ZTVng1UFpmZUZibHBPckxIYjBpZ2s0aFpMZ0RXYlJK?=
 =?utf-8?B?aERMZFc2cnoxcFF1REtaVFpnK2RrYUFMazFQSnhwNnNlTUxISHB3dlptUzdj?=
 =?utf-8?B?WTFIMmcrRjZtREE5R2xPcGxSeW1hcHZCcVMvY2xWUk1LdWhwY21LaEFkUCsw?=
 =?utf-8?B?Ry9vbE15Um12anFYUHNuUTFtOHZJOFh5Z3E5U25QNkZ6S3BnUi9rRmxvSGVj?=
 =?utf-8?B?NVg1c1BzUERiaW9kK3hRSHFmNm11YWlwM28zM2VYSXIvdk5jUXZ6TDhsajdY?=
 =?utf-8?B?U05WRzdUSXVPekg0N3FwOEFsNFBualB5T1FmeU0zTGFHOVJ0OFlnRWVydjFj?=
 =?utf-8?B?NTVXaVVGVXluZjlBK0pYeUNYZnI4cituZDJVZVJkVHZMRnZQQjhhMlpzSGEx?=
 =?utf-8?B?dE5ZV1I5RndXVXRqTjlJcXdRd3BqZjRlRGJQaGpHQzZHQkpHZ0RLem80Yjhn?=
 =?utf-8?B?bmlqZTBLN25pa1JsckpoSzcxdEpnVGxWeFN0TGxQaE1FTXNFVE5kcWFSZzVq?=
 =?utf-8?B?cFk1WU8yd01NZVgveU5uaDQxVGlrVFNWSmdxeHNNWlppcUxoTk5vbCt3ampt?=
 =?utf-8?B?NDNzbzEvRDN4eHFvSTIrZzN4SGxZZ3IrN1NXa2RYS1M4ZWwzWVZyNGlzdit4?=
 =?utf-8?B?R2lJUEVPbkFNRHprV09jeURZRFA1dldOcDAydG5YVHJidUJhZmZrT1R6RExI?=
 =?utf-8?B?eFZlbUlla0cvZm5lTGpHalZPck5td1YwbmVnYWRlR3loaVlDU2ZKaGVQZ0la?=
 =?utf-8?B?bVJQUW9LUnZ0c3lTdEdYVWZmSWZBVW1kazNwTnN3ZVlUZlloRTdtV2d0QUR5?=
 =?utf-8?B?NkZpMGtCNit1RS9CTzJnYTI1S1dBcHowRW80VFRwcHJ5RmR0QUxPRm1MSTdO?=
 =?utf-8?B?WjlKc0VFZGJoQ2R4cjB5dS9ja0dlYmlIZWx1TlJhUFpnQ2hvNnVMTVh2VzB5?=
 =?utf-8?Q?0HUaBo3Hl4thHQOo1bWsLRs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHBOeTdUUW5qeFNXRy9mYS9mS2NiY3VhSTYxUE5Fdk1jUzJ0bUpMYmJRRjBp?=
 =?utf-8?B?cWJlSEpuWEJhUUZ4Q09FTDZ5YUFhT0V3cUhrQzcwYUVrQ29RNU1sYnArYktj?=
 =?utf-8?B?VEZwOHNQdHJsYytMUlIraTYrWmZJYm9QemFjN2huWS83MnE5OFMvNEtkbEZ5?=
 =?utf-8?B?UWtIVG9hYXh3bXd5bmt5Znpmdno0UUhqbHdVUlV3cUlKTm00bDhlNnRxZnVh?=
 =?utf-8?B?TGw5ME5aMDh4ZmZ3ZThNQVUybk1LSGlUQU8zVmpFWVFJaUpGRGh0NFN0eWxV?=
 =?utf-8?B?QzJtVUl6T1J2T2NUS0FkRThLNWJaUGRlUkpiMWRWYXBEdk1iekR3LzR4Y2tW?=
 =?utf-8?B?NllMNXBpMTY4eGRTelA2c2dsRDh6MFNCU08rdzdUSGltSE1XRExpZU1ZcDl0?=
 =?utf-8?B?TU1wSE91R05VZmxUemJ4Y0lTcUFmN1c0UnpkZmpxejlLY3habDNNYTBKcGpt?=
 =?utf-8?B?NGFsZHAxdk90STc5TUVpNlZTNTV5ZEw1VjlxOTcvMDU2TzdhTkhNMG1tMVpI?=
 =?utf-8?B?WlJyMktPaWt4ZHB6WjZOMTU4MERsai9ZTE5XM1kzUnltOVpkUlE5STFPOHY3?=
 =?utf-8?B?eW9XMy9Yd1FPcEw3Q0xFVktYckQ3cFJmQURlTTJKK29RQnpNN0VVbkcvYzZj?=
 =?utf-8?B?OXFsdktXWjhTRzRNL0FNZUpFdVZyOW9reDJqN3NtcUdhVFRWVytrQkhRL2RE?=
 =?utf-8?B?WnczN2c2d0YrSE1sNnd4c3doTGlZTDRQMlBoWUE5dnFGTlkwT0FBeDVQeUQ5?=
 =?utf-8?B?ejZUZlQ3aVhXZnpZZ1o4SVUrV3cwMlViMTB4WncrTG8vRHlsc00xUlFrTVhD?=
 =?utf-8?B?cC9BR3loWm42cGYzalFIeWdOWVhKanpaQTBWV3R2eHZNS3B3WTBaN3FwMDFQ?=
 =?utf-8?B?U1hEM3UwcjZTRWVhOWNtaHNDQy8zc2NTU2x0eTIwYkdRSmZUMmVaOG5ZQlE5?=
 =?utf-8?B?NW02ZUxCa1JTV3R3TDVVNXNWQ090a3ErZ0MvZHpzSWMxM3AydzB2TWRvcVYx?=
 =?utf-8?B?bGFpR21RN1d3bzRrV2NGdkNJdlVzYm5LOFF1NDBzNVd4T2c0YXNBVFRtakp2?=
 =?utf-8?B?K0p4dktiTTkxY093bTNKTWlCTFVVRnVCL05IalN4eFl5eFpGVGdBTzh6R0t3?=
 =?utf-8?B?cHExdjVUKy9EOE1wb091TTdVOVBLdmxjZ3RsME1PYlQrZ09mK1h4UU5NYkJy?=
 =?utf-8?B?c0V0YzZkakhnNk1SajNEOTByTGJNYmFScURPOXpSMnNhSmRtNWZBdmlCbXda?=
 =?utf-8?B?RG9aLzJpVE91L0ovM1JFNUg5ZHdUL2dZSnZnYjJ3aFYzMWw5Vy9pd3JqK0pk?=
 =?utf-8?B?UG9WYjJBQTNYTWh5dTZOaHNYYTQ4cm1ydWtYT3pkOGQ3bjdIZU4vK3BxSGhi?=
 =?utf-8?B?WGZtTkJob0hBdkhuSVdJQ3R2dFNmQzZhQi9aQksvajlJL2ZrOWIyWXBVU1lh?=
 =?utf-8?B?THhQeXJ6bUlmUDBDa1pIYXBsSk9FaUZHL2h5ZlVFdzVORDJkQ0F2djh0UnVW?=
 =?utf-8?B?Z2hSblpvNXhncXI1Y2U3K09GUEUzcjNlMW9zWHdITy9tamNmaGkycWxFekNy?=
 =?utf-8?B?NmNTYjFIeFRqdW1ORHY0YUMxR1BqS1JYeVhHYWtCanNrMjBaUUFpNEpGdW80?=
 =?utf-8?B?dDBHYUxjcy9lZ2hORWdpVENtSklOMysybTJkZDZjZ3Y0WTdNaE40Sml0SmZJ?=
 =?utf-8?B?MlBPbndPTkdwaEZZM2x3NmU1RXNGU2ZLWGpPUnRLQXE3aHEvdUk3UXRrdjdw?=
 =?utf-8?B?bXhiM2VTeFNhWS9ySEZrendpMFZqZFlFQ2R3NU05Qkh4Q3ZjMC9OV2o1aVBk?=
 =?utf-8?B?U09EaGxvbXZEWU1HZGpMYlhvbDZRVkkwMmR6bkh3cEhVR1lialpDbndmcFdk?=
 =?utf-8?B?cHRuMVNnYThvZkNuRFozS2ROTnhsRWR4bXB4Ymh4M0dpUVdvamtlTGJSNUlk?=
 =?utf-8?B?TXZEcWdZT3ZLYUpRUDlIb2J1NVkrdXlHWFRnOHJYM2pHSG5CRnovK2xwcDBN?=
 =?utf-8?B?cDU1bzR0U3gySDhaS2J3OGg0UUp5MnlsaVdoazU0enZpc2JkMVRjeEk0ZURZ?=
 =?utf-8?B?QWNEQ2tpby9EejNmK1FzRE5vSUc2TnhHeFQyWDVVUER2UzZSUHgxVytnOWQ2?=
 =?utf-8?B?UVE3S1NKV2tDdUljWUNoWWpyblBWQkU3UXl1ZDRUMXBLYXhFWU55Nm9lN1hx?=
 =?utf-8?B?SnhMN3lFVldvSDlxVERsWU5uWmJjSnF3THpkRGpEY3MwQWhsVEp4QnoxdW5D?=
 =?utf-8?B?ZHg0ckE4NkxGUTM3WlhQc3g3eXQ1b3BjbFlML0svUU9vT0Fybit3cWsvd2t2?=
 =?utf-8?B?WVZGQldrakhwbUlCNmhLV1NRY1FITUxXSGNTRjRrNis0L1FOSGxXUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0f0213-59e4-442c-be2d-08de54f3bba1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:38:13.6795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /baFK9+XYrfZ8Zur1Q82uwR2Jwx+iUBJeZxBttmg/dchCQOTdoqQECjQ69PiYd5yImS4x1Yjj/XzybqXqbb6CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8856

On Wed, Jan 14, 2026 at 03:09:54PM +0530, Vinod Koul wrote:
> On 08-01-26, 19:24, Andrew Lunn wrote:
> > On Thu, Jan 08, 2026 at 04:36:41PM +0800, Xu Yang wrote:
> > > The CR port is a simple 16-bit data/address parallel port that is
> > > provided for on-chip access to the control registers inside the
> > > USB 3.0 femtoPHY[1]. While access to these registers is not required
> > > for normal PHY operation, this interface enables you to access
> > > some of the PHY’s diagnostic features during normal operation or
> > > to override some basic PHY control signals.
> > > 
> > > 3 debugfs files are created to read and write control registers,
> > > all use hexadecimal format:
> > > ctrl_reg_base: the register offset to write, or the start offset
> > >                to read.
> > > ctrl_reg_count: how many continuous registers to be read.
> > > ctrl_reg_value: read to show the continuous registers value from
> > >                 the offset in ctrl_reg_base, to ctrl_reg_base
> > >                 + ctrl_reg_count - 1, one line for one register.
> > >                 when write, override the register at ctrl_reg_base,
> > >                 one time can only change one 16bits register.
> > > 
> > > Link[1]: https://www.synopsys.com/dw/doc.php/phy/usb3.0/femto/phy/x652_usb3_ss14lpp_18_ns/4.07a/dwc_usb3.0_femtophy_ss14lpp_08V18V_x1_databook.pdf
> > 
> > Please don't ignore my comments to V2. Think about the code split
> > between the generic IP licensed from Synopsys and the vendor specific
> > code used for integration into the SoC. You want to avoid making a
> > mess you later need to cleanup because somebody else licensed the same
> > IP core from Synopsys, and need to put their own vendor specific
> > integration code around the generic code.
> 
> Agree with Andrew here, please do mix, splitting would be better

OK, will try.

Thanks,
Xu Yang

> 
> > 
> >     Andrew
> 
> -- 
> ~Vinod
