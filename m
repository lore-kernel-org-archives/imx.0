Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023086.outbound.protection.outlook.com [40.107.162.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182973624B9
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 18:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.86
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775673949; cv=fail; b=db6YT1XYoK2xe39qxPTBUvg51nWxNEalvXUzKeah3M54aHZnDEwrZg9pA/eOiBOK1A6drA2r2PwiQy0I3Vo8pdNCxRoNy3rmUo7KD0ygWThNtr1omViVgzDWelbfMzi4rL+Ij5Y3PzSBdkmiMvHSTivsP7EvOyrbogq1+QUUEI4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775673949; c=relaxed/simple;
	bh=pypAsxqYL+n33QDzXngYgZMCZLrE7q7NL6cULV5F9yY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qZ4yDmFUyrmj+FPl1b6Cm7xl3j3KzD7V/8c6S3K+GWCKsMSOXKQZ2SSkuwA4n4skQf24s/rg49WsgmBK/q9G9ZSBT2B7rBIMfqXv/1Lx2d6NU0YMosIh5zTDUkWWPx1ZUCG/PJ1CB641ZqVqUh7QFIz8E/5kuS+ZOnxEuqynW7g=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=t53N7Pyf; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=t53N7Pyf; arc=fail smtp.client-ip=40.107.162.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="t53N7Pyf";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="t53N7Pyf"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jc2cJlEVYzSEuJIoHUmrNwFGbmCs/lyODuGbpJ1CuAh+4iGnqepWfZb4XywZaRnivpsc5XsuLGvn5KUDCbYwxONWkVKH/YeR1qbFU+avJWbgN0MKQ4uwDZEvM8fX6siaLwF5dww8H3a0I+hrYmWVKoT9r91hwTxN5HsTaCG9RySHXmtTY67mr54My0nVagGhy9Nvth1yDpX4YtDq8Ukv9MzWAH/rvkbaW3pgJ7wztNpYz+M+llsIIjqcB5+yOm5lLG8bsfopJS9oemg1axqGhsM2EuWaBkXv7Is/77DdNwfB9pj1xlsW1ddt23GAnoBcW4a735/E0rYxFm5QxDOSiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pypAsxqYL+n33QDzXngYgZMCZLrE7q7NL6cULV5F9yY=;
 b=Mf4N6YFyxI2+Ey4e1AfPWuAegEKvo0+Ug0T4gYrPFNQpIh6JNLej0B1W12xltvoRgEQdTmLQu5gfSO2A/4hbsMbya6XnzJ6U/XVipFvdYZe3OZ+wbmiD1ih9IlI93e0AsB+DfOxTZRIVedDEOnIKPu9J1fhIENKz3AYhIOEtQ5Wge+hAsouvba61llyHUnjKVvYTZGBFISnZw9rk1jZySUeryf7lHd3OBLLTxkGV2QjzMTCcuvyKg+pWiID9e/KA7KUQqqr3MWVzTxO71ycTpGxgUHadbYAlQanlZrqN10kdw7PGCDjHzMpaWrME+r9OMhbALyDPO61mJysrhxJpjg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pypAsxqYL+n33QDzXngYgZMCZLrE7q7NL6cULV5F9yY=;
 b=t53N7Pyfj1V1qlUKYHPbooOeM3G7Abcxn0xTS9UWOIP5ZtgbtUMI/JosvLmNYAn+YraT1ZT+juSlKH7PZN2pgQ55iDj9iIjJSSAtRPG/jHlO6SSPRdFTFqqtLNUvZOq1hRke5b9RLccIJmpEjQ8Kq5gVpM6PgDGq+qHSX6bBeDdkJGScYBLnnUzsbIYHm9/O73c4q1dUe/IoI8vRlpYznAnkvpGzkSVz1meKpXCvkY1VZL5qRqAF86WJEb8VWIBcwTaDsGWWePmdG+LWdc9uy+E+xOz9r6wtADesZsl2nyBxnOMRIvW4IlQMFN6j7gTRWyn/kZhDjqlT3hwm7R154A==
Received: from CWLP265CA0438.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::18)
 by VI0PR04MB10542.eurprd04.prod.outlook.com (2603:10a6:800:265::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 18:45:43 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:400:1d7:cafe::3a) by CWLP265CA0438.outlook.office365.com
 (2603:10a6:400:1d7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 18:45:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 18:45:42 +0000
Received: from emails-1456500-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-209.eu-west-1.compute.internal [10.20.6.209])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 84F83802A5;
	Wed,  8 Apr 2026 18:45:42 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Wed Apr  8 18:45:36 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYbs36pgVeea7hCwkgRT/otG+KYIplcw4kOo6kbtnGscc6UQ7/bO8Gf2gEG+pGwWaT7EIIdX428sCxXWSj24ZuHGjKB5zioLg/UB8r4pRVa6h4DACpK1V+aODO/CvLOyk7L11IQh4Kwwu5Z/3UFXHaVQn1sxlegkg52L3MbQPQ3zqbLUaeqcn2aKmSqk98lu7tZFBmTfR9nAW2iN//x+38aooFls61SgBuCxCvawNlIhclwhP75a2n6s9i6cCbBbPRqbFE/5yWNaaaDB6i+ulOgEIeUrt2Px2XCO87XUGO+lEQJk4fIqTRsjYgys7zw69LFuiFf4KmCwGAqVQPETTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pypAsxqYL+n33QDzXngYgZMCZLrE7q7NL6cULV5F9yY=;
 b=CyvQNDXMEFrmEyaWlxwUs6IuXLclo8jjzY9IrUEPbleHWLq/ie6J3oMNQbOhFuDuQak/L3GFh30EAq3Zo7nmyv0JxOv1VpGqDfZvBG6y3Bi1K3uxFRZ5Tp6BcU2yYLsMQLsXtubaxbnq6hoSh+qxjCWQNRUlg8FNbHSJTcf9HdlUov7NI5mhY6j+DRz16B5RId49seRtqufks8Fwj6FFvWUjITPRZ5cs/e+tps8vXplPerQNrxgfbc/n0uEYE646NSxwJLaOOOQawNE4lm5BqETijz5qENmzDfdxzxtMo6DtmhrFlu9v7JfkWPnOpTTvrEsbgwOgFXkyoWyfzYfTfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pypAsxqYL+n33QDzXngYgZMCZLrE7q7NL6cULV5F9yY=;
 b=t53N7Pyfj1V1qlUKYHPbooOeM3G7Abcxn0xTS9UWOIP5ZtgbtUMI/JosvLmNYAn+YraT1ZT+juSlKH7PZN2pgQ55iDj9iIjJSSAtRPG/jHlO6SSPRdFTFqqtLNUvZOq1hRke5b9RLccIJmpEjQ8Kq5gVpM6PgDGq+qHSX6bBeDdkJGScYBLnnUzsbIYHm9/O73c4q1dUe/IoI8vRlpYznAnkvpGzkSVz1meKpXCvkY1VZL5qRqAF86WJEb8VWIBcwTaDsGWWePmdG+LWdc9uy+E+xOz9r6wtADesZsl2nyBxnOMRIvW4IlQMFN6j7gTRWyn/kZhDjqlT3hwm7R154A==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DU2PR04MB8904.eurprd04.prod.outlook.com
 (2603:10a6:10:2e3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 18:45:32 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 18:45:32 +0000
From: Josua Mayer <josua@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: Yazan Shhady <yazan.shhady@solid-run.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Alexander Dahl <ada@thorsis.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Thread-Topic: [PATCH 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Thread-Index: AQHcx4bvr9BLL5JY8kGqWpBHUUp00bXVgLKA
Date: Wed, 8 Apr 2026 18:45:32 +0000
Message-ID: <1e716929-f54a-4b7b-a6ff-0f0a9814d9d0@solid-run.com>
References: <20260408-imx8dxl-sr-som-v1-0-ce5a39acd713@solid-run.com>
 <20260408-imx8dxl-sr-som-v1-2-ce5a39acd713@solid-run.com>
In-Reply-To: <20260408-imx8dxl-sr-som-v1-2-ce5a39acd713@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|DU2PR04MB8904:EE_|AMS1EPF00000047:EE_|VI0PR04MB10542:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1b5c1e-2925-4af6-b309-08de959f09b5
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 JfyFMQlGyiSBOf/QX45tzf/q49ZXTDMKFTf7T96j7tPuqzm9razBxJgWb65boI/vTiOwbM8zRWDonSGbduHXmsM85IOIXfTUCl9tk0ZbupwnYvDpOaaAB2y2rshhrghcufnju8ZerrCvuFp1px+9M/RAh7YJ3rdgbsPM1cAcgab9fT4fbT86cWfXNWoUdrwlkN7Aj2yWaHZiOyAw/hSRmKQKQiGmNPdePyWYrGmsRPeuZa5K1irSx+ITc7DTPo02j/W53IVub7kjgN5Rb3UwGAI8Hvg4KgNxgPaVIWp9rRzEjZlyvwZHCFh6+mQR8kjVED9SlzKehhT7jM2SNonoMpgjg+xDuKevM7y8ZvG+J/56mFVkqOyCP+kX2czuQsNY1xgaPKiA1DRV1BKsjERU0jE/ZwlbFCBszkVxWbuQHo0nFwQBAUyBYwErEws0Nt5qsulfTPb6fwxKK7lD1z5dpWzbRI5q26Et7SjFGK/llaQW/TAI+VuPrJPMfYtUEDPG0cmuld4e/BvDVvLhfX8Jk1oI71Gac71SdKryxf72jJMsph4G3OoWXQoPwho+zW3ro3obdk8CoF09Dv/KFiQpSren4fM7OvWelw9I7e4QAevU2ZDsWEpr+ODKO7LM0aQnq+6++gHSqTO4ALPibSHwaoTNkHxOCUMglPxOuY2Dd9v2rjuubOXlvQNJpNCjRyyUYVml7d9nmO+i9whV9yJPozRevpLSbSSxDYVOJ3kZkPqgXNcROU29J3C1eJsjpMK0SfhFpzb3/0Cxhcm3ArQMww==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <07D3E30B9EBF76498AA29032D47627E7@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 kuy+MRlQ+2ImuKGVm+LcRoqx7mhz119CPKQNAKYrMZR8PPQReMfEBriaZQWzjw7zYg2FTsdBe6/CVy++2pzbJ3yX7Jy13R0j3xvSQIj3B5Wp9gfVf0kUPv8yh7qm8Vn/cDPJMnCS0jGESA8GpUznTa8IS+tjE937g3LTp2GIbq3uoLhEKOhOxKFcnG2+1jMTm30D9y15kLlOpySPGv5EIgt+gKUBVAHPBc8hsSR70pMz0b7ilf4J0VKwdivOfT5v1/ejibUn87tXM1HKf6yi+PVo0oEczPM/6uMWXe3EajnDWCWn98e/s598z71KBAT6WARYNYZ+geAB9azhHi0q6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8904
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 1300e38fffd3402c98f06941094d8aa9:solidrun,office365_emails,sent,inline:eb28aa9cc6e2b22717c85a10bbb5412d
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fadcf663-ce1c-4ba3-6c7d-08de959f0354
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|7416014|376014|36860700016|35042699022|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CNMPBaqJmR+INkBTVjpJ2UFyZnygaoNGIkr7I/2kL8g9/LJe7dDeAMT36P1ff0hZ8FQCDiBGBYdtHW+7qQXyygZPlFmEqD79Jjlb9UxNtTZRx5AnB28LEqZiFkULhVYqOzurLc6q091l//oLVU5PbbHkFS6OQ7ucl4P+wjIn0iOpgmFln7fnAZ6aLCQxoWaoC+lVy7mJlyOT+pez2e/PXo38N/lDY8zQLG21kyLbZj4FfTGAM7V/VuKdWEts4OdjXv8pbm0KyhdOnCOx4MnXtN//P3zYnoDttL5J1pSL6+BA+BA87V3+g9omfmCVL2aGdBlt128Om8LWehGlVYrSBb59fGORBPxiOygglnI1dBOp7V1kGcvhnOO0XaeLc5pHNOWPt4WpJjufH11V25QTBmQAHDdWA/Cp6XQTTx2+aVkAIcwZcV9U29wvvBEOMYID8TzyEKGkrgzd25O68cexklDVn5mJ/NU1ptqClT+AaHGQMRfzC/GwedsUWG1PplBfowk+NjZPE1pU9cYb7TRur29PQxfB5Qyg5X2JHwlFYh/H1IjOXkleSBwS5SRJDmiJwT+LsW75/85YIaafj80mHVnYiO74Aqnfi1uQMxf1J8ZdJSFkpx2euOGtI1hZg8ySDW8bj+I4WSCJ4LWKdy4Rm+VwfLaMU3CL5kL3ZrwdfyTX/xQSUd8CyGgkIs9QfX1fNsKfkzlbM59bl4vMCO7nX2Q1BrijADALfJyFgV9c5aK4tJAeIb5hl3C7YmUyKHug
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(7416014)(376014)(36860700016)(35042699022)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v8zkwTIB/LN2d8CWwAfpzppS90FkCvghyHDTfOpKj0JJXSOSGSoB5Gljk2zFOZVPasmVDRPm5eNSLw/M5KRgt3VIIWJXhoOW+l3uEAEpwMiVXA7bQVwETcwwh5JGJLNtNHv2eUYBmqkbgY02lVGl0U3HOa35S6ev7At50pYBvNCtKBCxanGzQkTwVvxZ2+KRROPj8N1V2ugDj7G14KyzKpuf7ovhNDI4qJzyqejLXv1Z7GAIlyZUGHunt3mcS1dA+hlrsXKkhfB5cAtOP1gcrOurjmMPlw9+s+756YItIMUq4cCJO3ZCORABjkH4mkj7RNgk2aCrqeAo8/GWEzBX36KabTHC2MOCeKGd8ZtmpYehbg4t/uXqdFASGeWOCPGhGB0+ieiML8fflw0feAcrwY3UlStjKCN5ZRMOMoirMcyJN/w7569FypvWlqFyZd5e
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 18:45:42.7391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1b5c1e-2925-4af6-b309-08de959f09b5
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10542

QW0gMDguMDQuMjYgdW0gMjA6Mzggc2NocmllYiBKb3N1YSBNYXllcjoNCj4gQWRkIHN1cHBvcnQg
Zm9yIHRoZSBTb2xpZFJ1biBpLk1YOERYTCBTeXN0ZW0tb24tTW9kdWxlIChyZXZpc2lvbiAyLjEp
DQo+IGFuZCBpdHMgY29ycmVzcG9uZGluZyBldmFsdWF0aW9uIGNhcnJpZXIgYm9hcmQsIHRoZSBI
dW1taW5nQm9hcmQNCj4gVGVsZW1hdGljcyAocmV2aXNpb24gMi4wKS4NCmN1dA0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXNyLXNvbS5kdHNpIGIv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXNyLXNvbS5kdHNpDQo+IGluZGV4
IDNjZGIwYmMwYWI3MjEuLjE2ZDQyODBhMWFlNjUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1zci1zb20uZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtc3Itc29tLmR0c2kNCj4gQEAgLTEwLDcgKzEwLDYg
QEAgLyB7DQo+ICAJY29tcGF0aWJsZSA9ICJzb2xpZHJ1bixpbXg4bXAtc3Itc29tIiwgImZzbCxp
bXg4bXAiOw0KPiAgDQo+ICAJY2hvc2VuIHsNCj4gLQkJYm9vdGFyZ3MgPSAiZWFybHljb249ZWNf
aW14NnEsMHgzMDg5MDAwMCwxMTUyMDAiOw0KPiAgCQlzdGRvdXQtcGF0aCA9ICZ1YXJ0MjsNCj4g
IAl9Ow0KSSB3aWxsIGRyb3AgdGhpcyB1bmludGVudGlvbmFsIGNoYW5nZSBmb3IgbmV4dCByZXZp
c2lvbiAuLi4gLi4uIGJ1dCBJJyBsbCB3YWl0IGEgd2hpbGUgZm9yIGNvbW1lbnRzLg==
