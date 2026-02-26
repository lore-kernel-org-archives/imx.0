Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023135.outbound.protection.outlook.com [40.107.159.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9691E47AF43
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 16:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.135
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123819; cv=fail; b=GjYwwRBG9+dWCjJZQBLs68t/haGebnlX8K0eVp9ak/LY5SV0NUaF7evBOT6nf/yr0B2NjLVHwabeEgcuM+mdT4zZM40G7gwOHWRKlcoTBlsp/MWAfxLejLlkVZdLjfjCLV/kbfL2o7Ip/X81YfEX5D5Fa8khxDN0bzNknbZtL7M=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123819; c=relaxed/simple;
	bh=7b3yRg13OmbMX156iWmRYTWadLEimxEvdb7cM2vnVRE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DcF8D0RWCnRJ+EPR1r5e6t7nODZdYeCOhbtvuPJSkygJ4I/4+2E4uEYjGECxsdSv84s4zgTbUBcun9s6oxIlMBYQJFumF1NQzAXiQ1XMkETQewcTevWqP54b99J5hVq1nksC8v51nbhTQq6OFLdwNJqMrcL/yjecdxo+lkC9c0w=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=UJ/c3qzr; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=UJ/c3qzr; arc=fail smtp.client-ip=40.107.159.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="UJ/c3qzr";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="UJ/c3qzr"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CoPJpVMX93b9hvuYIHsdv6ldEBFXAHgEvdIOaJOEf0jdU6FBLZd8hoeGQjsI4VLdesmTJuvDUPfTv9h5H8bM9Njmn998lWSywFRXBEVBliUurBbNBKBjauOLrokdW/UFa0zeecaOG+MaWKXC/InlUH9wu/g8zscR+4sX1bKYm+H+h52/6sFKSpDwOBgxld5/fWBO1SI4kDI4UI/sXsEfaGVtCpHS4R43yQSf9fjEeEht98qH8g5qdJUzkSG1Jqm26vKobaVWxZ0Ny+43dPo91xXlTBlu34vmzBpQgDLO97DXCGVwFp78mV57TI7mSDGNFZ9Hyu0FtOfHxUUnp6E27w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1GIpvMQK3jb86ry3p7GXnOw7vh5tohfFQARyd39o0M=;
 b=PpJ/AgBY5kt5oTwHlbgu8mPQNafkl82BpnXgWiboNDKHKdx+LNZ02iGDjpxGlcZ1a6TEiHBun++gTeLCivjdcPvbglXp08QJj4dTlZDhMyQlvf9/IJpncHWYUPDrVh1WA6r8bcAOYV5XYeet4uq3+xaOS9avUtTFsk2txxVcT1f2rvOcOfK6xy9ougmuCvCDQF7z2QXC/Dod3x3wWkklxV0ax8qHdbt+4AK5cLD6XxZMnJEuJBk8uuCwLdKE4L9mxzNKa9PrXs2cL1f0zspgrARXoBMSCIFIyK43RMHqNnqA3xp22UrgTMSzwWTkmmwDEl2F3fL4Ggzjax8kwDda8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1GIpvMQK3jb86ry3p7GXnOw7vh5tohfFQARyd39o0M=;
 b=UJ/c3qzrcVRF7qGIWd3DMrNWamLjIlexwx/KXl0IwOKlbWE42YNnwzSwzrqvJuecnvlWGQmLbn7HESKnM8HzPzgGtzPF0YBDjNxigt7V85rNERRExlQEwxm9noE44wj39vg0Yb3EYTMv0BLvvyw0FybhuH6/vmzizQHbcdKpoa0=
Received: from DU2PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:10:3b::10)
 by VI0PR04MB12234.eurprd04.prod.outlook.com (2603:10a6:800:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:36:53 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::7f) by DU2PR04CA0005.outlook.office365.com
 (2603:10a6:10:3b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Thu,
 26 Feb 2026 16:36:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 16:36:53 +0000
Received: from emails-9182605-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-107.eu-west-1.compute.internal [10.20.5.107])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1689E80839;
	Thu, 26 Feb 2026 16:36:53 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Feb 26 16:36:46 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmgUKxr/LecDnSavDS2QnA0JXs6qvlrZncJkFUC1nKl/trxZuqCDi1LTCXvTyQdGEv8j68eG3zb26I6bjXPLEwaNwVJMrI0fqq+Q0M3PmSbf4xInyEuW8jiHSJVSe3th2Vwn20mcCR3T/piGdLIo1uReXAbo5cKXXdC1aYhkXGxznhfBPXB2izW36mLP67AG836PGESOpKpsGOV3fU1+jur5zkTagwoRnEPanHHjfB8IudyrIlZb/bojVdKrPeXEVv67xllw+yD23nxH3IutmVhtMOuSQe+QlsbpnRuR8MBH8vOLipivSnSbaktO6r3KN8/UBJG+pk9rB3vUnStWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1GIpvMQK3jb86ry3p7GXnOw7vh5tohfFQARyd39o0M=;
 b=Uyc7Q/tYDeGWz4FUy8TRDtqPw1IXo5ouvoHKpXz9vlMxfeKM0sp5RSDtbuzx0MAo/JcRjHQOUAv6TEg1vMgAE7jJRtOArbDtRaYO5/c6XGYYvVTnt17nyGWF/NTAyIJ0NhHSbO2HDQtRMaijuHpensyMy5xsnOWf4jdbEMcek2NuEET/N0BrBbfviE/uKfiDgylVPnqs8OvRkZcrKJGm4lnir39vIdC4s568Dv9m5X9pyfi4U1XLFeq/VA6V1MHgBx4B97upGDJo+Z8wTnDyy2iKgldltByvkrefUgNVtrFwlnZnuDfWoWNF2KZcDQTeY1b7oCv8BYN7Uvyixt2+bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1GIpvMQK3jb86ry3p7GXnOw7vh5tohfFQARyd39o0M=;
 b=UJ/c3qzrcVRF7qGIWd3DMrNWamLjIlexwx/KXl0IwOKlbWE42YNnwzSwzrqvJuecnvlWGQmLbn7HESKnM8HzPzgGtzPF0YBDjNxigt7V85rNERRExlQEwxm9noE44wj39vg0Yb3EYTMv0BLvvyw0FybhuH6/vmzizQHbcdKpoa0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 by DU4PR04MB10767.eurprd04.prod.outlook.com (2603:10a6:10:580::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 16:36:41 +0000
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a]) by AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 16:36:41 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 26 Feb 2026 18:36:33 +0200
Subject: [PATCH v9 4/8] arm64: dts: imx8mp-sr-som: build dtbs with symbols
 for overlay support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-imx8mp-hb-iiot-v9-4-4533235eeb34@solid-run.com>
References: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
In-Reply-To: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TLZP290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::13) To AM9PR04MB8747.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR04MB8747:EE_|DU4PR04MB10767:EE_|DB3PEPF0000885A:EE_|VI0PR04MB12234:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8c90a2-c0df-4fa3-6420-08de75553f8a
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 kzGXHBmt5haC09IqtZv4M8T/gx9aagj2Rei9ldXKAaxshW4FtVPaw8UQ5QCtO6UjUp5HMPzFK2rxXdLjX0DTj9/EahY+5MOdopqIHJqZgtVmeo6Q6hdyHoxJHjAUV8ehs/FtEKjF3P2bP1nMyAznq8xiMsP1vfrl+PE2uFE2JshrO39gDyY1/J5DIOefnrWKRdNo7B509rbVu/4/NXKWzez+/sjt8+2ttmpep5sJVrI2f5DUeoK+pRz62afP+fQyrNeCy5HC4a+N8Kixta/pbnk94FPVL20FRw8HgCNZOAIN2Pv9IHZcG9XN9H1BfQysBjC+d9Hizq6KXSl1TBTGnjoE9yXlOAqaD4YdeSN6PoOeqYjr8rrVFamFBNTzYajiOh/TH9vACUrUKqKcgf9hGU0xfcIqAMyO1R2uF+xWT+kPsJzhumaVGZ/oZIKM8vxcs5+78UK8pMb2lQBvrjN992VdOUTfAev8/H5Qj6ZHZ15rHcNctWpVVOnqx+nBXCHyFq3AdgN16ListGAnIVhS03EKZbucWk8pIlrdUTNRd3FOjwZahB+arvrGl4V+S970FwJcl4ooaGt+QJdLcNmsYn+EfX9bDaJcSohI40QJdZqQwf3wdTO37yjfyYX5Z4CF7OFRSrET/mqUM+DaJS4QypvVvKhYucZp/m8AImJo13G14xH6oZw/9n76YOQjwxj5Wj0KYIovBmoy1U4hNpCiankH0TccUE9Yo7kUtoi/IQRxPBppObCSjfx09TVAVBavy9PtSq/22O+DwYqm3iAmnUWTJ0vmUmKmuQQVwFaDijg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8747.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10767
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 62bf0e6998ed4b8a8a588ccade654060:solidrun,office365_emails,sent,inline:c670fe34631ff287f38cd6f3c87efa4b
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3b59daf-78b0-46e6-6881-08de75553842
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|376014|7416014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	wqAwFsJd6Cx85iU58JWBBngoarZG394v1SpfUGHu9A5E8nnjZC/8v0/hactIaEzBfSnQuhy5gzVUACHcwy9NpdtHMqCZsGKaurWrnBqq5glP05aQQTNLmqjdljPZaQk43z0rscUIjhYiIBNVO7aN195RsD8Q1FNtd5sXJsJkjFzs+U10GdNBMgEBPfT2MlqdrZz8pH5coIumE5ggYwmGqL9/JGmkQyn3tjBhM+rKTO2XIlLHnY+D5BJacHtdx1oueAsIG+c0Sn18Tyy3/Rbj0UoBPOuZ6FwdGv9ireoWdndb7vQ1ef8u4Y2qbyuBubndu6HmN+idDAgrjhE9hAf76K/7N1oKp3bMj8L/m/oq/VYQECxnghUEzgrPwTdN+nYciiM7mH7Vt7Zjw/0A3iWDXkpxbesvMENsdMGD9/kcCXeixOhnCC3gOPxgrUIa+h6at6QFT98VtfaPkGibaj2DiTXurDSzBZWFies6cyJYWEvFPDYt5cjsvgbbVMRHByhRz+wG0SXyaezPNs/BOvMZvVr6G0ZKRJOwMaynyFVzvVNXGP3eYLCuEblrko7aijXuq+CiZTmXyxis/sDObviuEJIHG065+ZI+iNPtQKxKx7P2Pw3rMj3ymB0rIr92Wxr4HJ6yI8bBjTkaw4VYJjZAOcYzkcJmCn4mNGHr2FAVrTSzVPPc85ZlTZm7npia9Bh45ALV+LZNT0wRwTS1mYNVQcipdBykL9Rl7NbQgoFQmO8CJo5LiOIJT07BBVKp7qaQ3a5wY7G7us7PrGql/lO35/MPLgLmUbioEssvEtjkauih73HiuadMyvecSNLcGkIx4Ht4OEcu2LUf3BwQvTiBGw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(376014)(7416014)(82310400026)(14060799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tsR4UsrQS+y5scLmVEQfF7k0DS0jqNfyQqgqY4WAh9G89BErhnUCuDDpn3pt6sO5j10Njzc8qWRniQGgH69BINmQPTHgAuAfSdY3Rq1AJ+S0aE9FrN/qQ2ocotT0xnvS8umYoObyLbCQqg5NWX6vNLyYci/yofxYwnOkOHfOwEYD9BKYYkKlQD0Rlv7gGglpSPBWTxGw8pH6lvFCEK1ADC5gzd1cc193ns5yYHJOxV3yHHTaqXgFBTjjsMdCkNkyw+KTHkUzhJ+Nqg3rVUo92NQU2YxIOnxGonJoJUjqZATeIK+bjmMIls8LBTKpaJejr1gFf1r4Z0T9Ms/WhkmVBhGzTmSbSbKYSe4TWgxsPgEkL2yBUppVmFSRG4yIwD0oqH6+825/Rn73eiIcQfByU8qZ++CzorPm8sQ/Fsr4O8PqfRvlP6UjADBoBCO49XXN
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:36:53.1449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8c90a2-c0df-4fa3-6420-08de75553f8a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12234

Build all dtbs based on SolidRun i.MX8MP SoM with symbols (adding -@ to
dtc flags) to allow applying of device-tree overlays e.g. by the
bootloader.

The SoM has a basler camera connector that can be configured for a
particular camera by device-tree overlay. By extension all boards based
on this SoM have this connector and should support device-tree overlays.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e60..baf71afdc466 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -223,6 +223,7 @@ imx8mp-aristainetos3-helios-lvds-dtbs += imx8mp-aristainetos3-helios.dtb imx8mp-
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-helios-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-proton2s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
+DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
@@ -234,9 +235,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
+DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
+DTC_FLAGS_imx8mp-hummingboard-pro := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
+DTC_FLAGS_imx8mp-hummingboard-pulse := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
+DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb

-- 
2.43.0

