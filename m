Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653B3BF693
	for <imx@lists.linux.dev>; Tue, 26 May 2026 05:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773964; cv=fail; b=epUk06IYgkyBC45AHgTcnBjLEFXuogjahA6v7b/b8mGRhoJEICLXg3THqZZl01vCuAXFdjRjsJ2gVPHh3LCfk/uFsxa2so4qxjBofx0dhCdEckANq6euh5MNsWJYb/YwMlFeCBsADJqN/Cwfv8M9mqYbYK6P7Z0xfQ3KwQKo1rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773964; c=relaxed/simple;
	bh=rY4Q5/dt2zqX9zMuA6kJiYomxvvdw1gTJONG5G7dcbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GaImjaJaOQy3Hm10cH/YzhRpHa57BDGyf+7vTG4jBS5WzUIPIUXBLjx76jQFr6BXat1EyPIuILSFq3QaQB+NrGm/Z+Sw8pafBsUsi0V6ERvZ67sGlX57QdpOaec8WnvkOjri8lOxmjf1Gw6lIVbQc6osOHrpTMh9eJ9y1DKGq14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UmtM0NYo; arc=fail smtp.client-ip=52.101.72.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UmtM0NYo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEYFSPT+A7gKuJtCJZJt3Tr3PRJejYIfY5DHe6nbz3hYuB10c+5WEWct1IiOTCkGczduE9w632if//Nyw0qXcxDvvN0tb0Ii0w+PRyuGRz0ooLs4+BNAuP3zvBW3Uo9WdUA0jYuXCGTnBvRwq1L3w9mz5khp8VtVRNf9iLqfrWvcmK2ppJZRwSNEtyyL8LMGZxw6t3d9Ab/Dyyac4ifapRUnSedZdXQqeMigKV5IE6qurmOgyEq8m+mjNvBe2WQaVRRLqhmlwqmzPcPuWgjpCXy04cHgsFqz/9z9gpWtsbctMKTv8jCzOhD7qU/D7508OScY061yw9pGo+qMsp7yCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyqP/aV77HrOGYWYMooRXv5V1QRyVGnnTCtdUwsE4yA=;
 b=GwStK7a4eBtoes+h4DBVoaiI+1T9Qxe6nu14oUPOojWgruXawDhs7UrTizmTCOCS5gH7GvGYE1wqQJdTqCigPLGNsn1GduNnU+ptoM58z8AMXBjmALtoAMdMwwXfMkvHniDYom5LE+jv9r9Hep16l194rFygalodumBuV24AI23vsXDvV2pMtn7MBNd8kHtPjH7bs0hdwPGom2HMkYBpyqtJ4YhyoAm2y6gdMODV2Wo4O++OlRELKpmkQqR8CwdzPMlL74vTkQvAe17a5oOiT3GKrDY7iLk+mLUqg9n1pGVDIzepEn2bowbZvfEkgXUksx/5NV5aSw+zrKRqnx+5GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyqP/aV77HrOGYWYMooRXv5V1QRyVGnnTCtdUwsE4yA=;
 b=UmtM0NYoQuQRwJ8/DVqfhsSSItchb3zOe9gSZs2IWkzsr1H7YlRrR9UEU46KhRYIGSf8w3gSyRT7wmS6ZhXvvLjar7dP/mnhmWqqRPSOAaNJ+DQCu4QSCea31xoq9SIJKB0udrmpOm5aO9Si2EP8C+FIoluJytkKZFblYLQ5jO1x5h1f3gPlEB9NFPDt6/ZFs9pQLT94bucIu1tJv9dA3YgAcvjx3BfRd5cGswYNva4kY0alokoTrTx5vMj719IaN10gHnkUwKCDsoXGU8Q+XvLHK5411+L9G/IK5usTa0Gps44KlESc3JGOb31wohuqyuveMKih5uRisB/vTfxyYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PAXPR04MB9708.eurprd04.prod.outlook.com (2603:10a6:102:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 05:39:17 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Tue, 26 May 2026
 05:39:17 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: dt-bindings: fsl,rpmsg: Add hp-det-gpios property
Date: Tue, 26 May 2026 14:38:13 +0900
Message-ID: <20260526053815.140008-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260526053815.140008-1-chancel.liu@nxp.com>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0082.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::15) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PAXPR04MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3d91fb-b34e-4fa5-2e9f-08debae920b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|52116014|38350700014|22082099003|18002099003|56012099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	D1nG27zbrGqeEefmqVcPWk4bzj8kiLbp25e+7ZCJ96uSvcXrVxxi4LgZ/NFRFCE26MQCowzYZ9OB2ZOqkN/J7kkB7X9HjyGXr2qIToXxWiWsRcbc9aTewhs9+bOCymajzY/PQw5MnhkQ0omrD7Zu7phHl5cN7XN2D8ick5x/Jwi2YPraBXN3BObqFEVUzID9sVnOvTFmn8TL562pWtoKurSIBlCiRdebOuMMxxQdSh2aIaNPIkLXStzQywygk/M2ZWx6zttLx7jAaYOKeKcrGReZWwGMRKDpipMd7/BqMnJkqh3p4WagSnN2cjM/Tf/Kf3YaayvNzPVEa9/K3zxP9z0QQ2cUOkp4D/ef+M97tG83g2xfxZrIcHn+qx6mVYwJw7yB/DYw72CIn4KLOzBFeaix2pMVfxHs+4u3MrP7AnqOt9i31cHujxWX4nSKto765e0mfey7lzhWCxU0oaZYtN/fAT60G41KTzCg258NqD442tQVmKeEo5lmgDymnKRR6ZWCJ/oXfPeud9TTmzoZEHgFGgYdyanKFFspaKrWEYut71/aJj0Rqx2y5WB7jtURieTiQi/zhb23xPIi8eHwRGLxTomob2nKxj20PqFQgvbG2QWIi4RQI5FsJ2DZMZdyucmLU1IfL3HBy2C+if/i5M5oh6rAkeKh+3awzwOOfAnjFqCNXAFx5gbdcR8ryq5g72efqESSe3ImMEb7zZoi/v20JRKt1ITJ9Bn7Q5u+6/0IctSbKvekVOkaR//YBSKO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DzUJK94imoQJX4PwddT7sMyNrvgcZOKjBDUpsuJAimVuLJjP2d43PCYi4ICa?=
 =?us-ascii?Q?fMwhcyorQZp3lvBoMQA4GAmqZyMRwXtN9S8SY8VDDolvzOvcJtunFnAV9dvl?=
 =?us-ascii?Q?QjzzHVh45kiLQUVbr6n2Rfnb/66byo1bW/MYop5md9mV4h+0AUEFqRs3WSJL?=
 =?us-ascii?Q?cjm8Vqz+h+ehaegzMhgTnMCBFWus+HSv4bIDtKM+aQFF1bgNgKnRscTsyPoe?=
 =?us-ascii?Q?CNvpRsLaLMfig74EE7P1l6CWEGsYCe/PfAg+YeJ3HP6GNNMRNNOwJb1gE3wN?=
 =?us-ascii?Q?sXmtui0JqsehZz1IRd9kp4HRQDHWeIyileYl+Wd3ycwa1sbUwbUUetsU9oAG?=
 =?us-ascii?Q?/9fx2Jp/vJD+rLjAlMa9n5IOk8vg/HS09ktXO1+wYPQln9fHLgoUlY3fZtWr?=
 =?us-ascii?Q?3XtrDFhKsZXRztq3+5Y35+XwsMTOYEhhz2i5iiR0CTPUK/WK7j2ftArWGTnJ?=
 =?us-ascii?Q?KkGz82ZnyI9vZ3G8P3U+hHbpnnkn4nmCGPDsVyRSFS1wHbOEEgfcxtvmYfGu?=
 =?us-ascii?Q?4WEU57MEHPHF/kRrJJvRM4yjdLWZ0vyQG7AZ4o2POYbHCx0NLarKnHq4FdhH?=
 =?us-ascii?Q?2Bz0wRAVaEe80cNaXjkcgtprIN6eH8m3x+onay1ruiA6HMsPz0N9GR44DG+O?=
 =?us-ascii?Q?Rtl7020Ws3dn+FfCO50P8StHEOOaAokI49v+wOh7m8sDHe5uQXPS6t5F4xee?=
 =?us-ascii?Q?cQ1k4950I6EEmmtpPtAI0gs1DhC2/ReSO+i5NnnrKnuqyo2NdlbI+ZLPGGAN?=
 =?us-ascii?Q?5Tp/iud+vy6HIkojYu2996ZGVMzFUtq07IHE/lag0hhDJcLAY3eqTqsq4BID?=
 =?us-ascii?Q?nHtCMBkvoHmJBgMqk/1D52AMPqtKV2/9u+scsrRL1i31EBgCv8YWnWOdZVfH?=
 =?us-ascii?Q?Ifi8Vbg2v5yd/mK97KZAKi/N0iKcqhJwWIPCGsL3dAtjMpR/JkjtfMCSOzAK?=
 =?us-ascii?Q?cOtDgRxMjSTTJhdEzI0bbTqGgMLEeGA7eeXN+uUmsLlyoMzejTShaiPJge3B?=
 =?us-ascii?Q?RqcMg5Qa1iSSx1dtGnF5A64OtCmGVuyOcTK4JqcxQ5JjxShIbY19XI65tMCk?=
 =?us-ascii?Q?KgT1eckuQVsciPsLbeO/+XZ5wU4T1B9m/7tTIFxIUxcXNuf6eG6i8DfOuGS1?=
 =?us-ascii?Q?i1sOI7L0wt/udblEpcEo0nLX1goFwP2Xs+1PUS1dPRfoVoRx3Fvb3hKjWSW2?=
 =?us-ascii?Q?O5zebboIIkWTOyI4LUERpXhUvYWbx4chB37OgtuaCV8HCSpS0p4CQg6TXHDi?=
 =?us-ascii?Q?Ue6ePl97cwQdPwaDsUjpI3TDTyIp9iXUzEjRxRx1g3qVuUsqCwTMl52zKoJb?=
 =?us-ascii?Q?qYb4EL3CVun3RFFdkBMoD/cIgoxkSZHXa+Q7Bh8nWhn8YJ/IuAQtlVaB/iK7?=
 =?us-ascii?Q?S9aqg2X2RxRlCakXlMnWdwlrQDPiQ9kKDQbgqA9aQiISKXDLo8rGXp/G5zMR?=
 =?us-ascii?Q?2Z7PSik6jKBnsYufTnXuNxuNOOen+goOt9eDxvADaG2JguCGuG0qpKUhObJS?=
 =?us-ascii?Q?kn+0AhZ3ZoaYrymChHTlp/+412C7z0fvOscapbWIFO/MB0Cuob8Fd5yLun0B?=
 =?us-ascii?Q?KvCgll1P5hdNIvgqn5m2uSF1vlASD4k4DJbjKv1PR6UxYPC8GkkuyE9qOMcD?=
 =?us-ascii?Q?9xLQSGp9vvT8Vpt//8cLWzF5QVYyvaQQJrx/Oyz2Z6vHWJEUVIAGJ4EbdHiX?=
 =?us-ascii?Q?S6yyWn9nu6nr4ZKRbWZwqma3L4mw2Q7/5vjuOogngSSoquUshThuUphRZC9J?=
 =?us-ascii?Q?amVA0/eKrw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3d91fb-b34e-4fa5-2e9f-08debae920b6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 05:39:17.5917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75JiIYk1pBxM+AUJXgFiyfK7OzNODz03fg1QlqUgHL9rLu+VtpAKu1bqUfofLUJWrc1T0cOr6aT1M2Npm38TCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9708

Sound cards using the i.MX RPMSG audio interface may connect a
headphone jack with GPIO-based insertion detection. Add the
"hp-det-gpios" property to the fsl,rpmsg binding to support this
configuration.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index 3a32f7517d0c..e3cadb93c183 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -98,6 +98,10 @@ properties:
       - rpmsg-audio-channel
       - rpmsg-micfil-channel
 
+  hp-det-gpios:
+    maxItems: 1
+    description: The GPIO that detect headphones are plugged in
+
 required:
   - compatible
 
-- 
2.50.1

