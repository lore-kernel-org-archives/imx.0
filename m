Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023119.outbound.protection.outlook.com [52.101.72.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6023C768E
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.119
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596778; cv=fail; b=EiI8oLeew0z6aqDv0rKlisYOd5LRgcca1OV27gDlKrK1p6CN+zfgcQHJVK6yIqPJTH97kHa4HoPLvS2dwd/3sxssemrzjelrqeJBxt6zm4nrLWTMaEm4lJaB1X+Gmt9JbagdvTCp1Hqxa3SBsslJ1w3Ns2WhRallZb6yGsSaXXM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596778; c=relaxed/simple;
	bh=ZOgcuemagiaSu0I6daexfVf97JGpbfPIV8O3BQmxXxA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ur3/zW2qo2Cb/8qV14bXbZ8jMiz+3Y2Qg7+T8UjIdgK9K/osA/JLvDZfFFohwJxNOU59n51HIqfShIrg+nH3Y6p9jEMoFgaiLPNdtOC0rcGHiu31/J+Nf8FYEwF0q8iu7gmbRh9J87ktiINbAG40gbHiafpXw+JA+LTtGztgGw0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=kMZeXd1N; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=kMZeXd1N; arc=fail smtp.client-ip=52.101.72.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="kMZeXd1N";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="kMZeXd1N"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uDu3ifVpIhHq05X3igIlx3r4PdAIfmbh8omXqiRf9CVtKSlv2gqo08AcmzzIUW8uMyyhFM7uxGiLQoSUbCv9FOq/TtElK/W+FmyrNyQyYfIfLi27uTmJb+zAWe6CgkDfNfQkorVJOMMI7FZ7I5MUNOqtqlO5U9cDrh3+EWzjfnNaMyZLlMzV/o5Gialt9WcvsnHq+L+DxxrglkOzRwhzKTMfEEdpxYiYCSW5GKNDv9ZaWTi669eqsWDcqGzsNk+5uouzNpvq0bIVK23hnCyUIGBMbgZqwjvAmRZ4dwF3znKbKKVcbUsANV/DNXLQ5AqNs8Hyce2KBjtfW7L54ZTa9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoMbMH3s0+Vvcc3OLeaN0DHdSdek+IogtVy8k1fV2KU=;
 b=LQN9YpZM1QJT/XF4BKiYDcZoK7aAKKYH7hYR+90/C12UVb/PmhwTYIkjKFZLW5dLZfOjydbwKBTZ/c+o2wJgua9f153SHBJGYF5A49j/5jrP7B07xDDOw4oAYjJEIwGS/1RY7U9lJDZvA+ZottR4ofKXnPQRZ1y4b0f26OGEsC3jaxBTwhgUDWhU4CaMda+/jVPAl2+O5jvZM2/ATpQSapie4YWbUp/dm4BrePQL1v/2KU85zmvwyYyTgEnX3xs0cYPRqP7JoHsHkKIz3O6UJ6usyrKQcE8c4UewAeAmtZpv7Hx1vr+dA95zfLP4WA6gCbs5qPXxgy3K6xpWTIFDGA==
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
 bh=aoMbMH3s0+Vvcc3OLeaN0DHdSdek+IogtVy8k1fV2KU=;
 b=kMZeXd1NE6Unjd9cRH9bRePI8MftHEW2Z2hCrkH5bQ8T+o75+s+zXgFCLgekRas+xi20jJITDmT1cMq245/aoghR1l+oxxg5xubfAK9An26GhpQHgx6kH5FkyFYrTWXkQFoyEt/olyz7idMVFq1wYCqr4DQnHk0ndA9IlK/XQPhmMMvorR2NDxiR9VSLRo3gkVaI0x63IVhHsX1SbUmKSgqnN88VxVBYFmiuIZIwTxoX4aJElR1uL33D4CW/hgbE1tJkc/XeVEqRThB53HiXPPMP9PvdIc2/RcMZJBM1d/VfH3AJ9GWakx+sNGt1wfnCYuoaa6tZgsErmw8kE4zHPA==
Received: from AM0P309CA0029.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::20)
 by AM8PR04MB7202.eurprd04.prod.outlook.com (2603:10a6:20b:1da::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 12 May
 2026 14:39:27 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:28f:cafe::a2) by AM0P309CA0029.outlook.office365.com
 (2603:10a6:20b:28f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.4 via Frontend Transport; Tue, 12
 May 2026 14:39:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 14:39:26 +0000
Received: from emails-2269673-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 91F367FCDD;
	Tue, 12 May 2026 14:39:26 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 14:39:19 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+05OhTKyweeYS8tndSwLJEOLfPxCwxVhIhu8Z2lqlCE8j9DSf3BubQfVt2Yx/K1Q8K95/AEIih/vtEEHvVPiTQmWMwzyAmpXQ2V0DSDdggP1ij7wmnRYxBP1IbVGbvcBd/XO+VzgAdGnehmAXc3l0Z94Mjtn8xT1im9wHMGVLaUqGXUREGxgpp8PraOS7nFuCZQrXe3Ghl6Q1JQ4I57zBpLzP6pXZjwND35so+hNVyAkxv5KDVxNDQloVC80nkOXJ1S7phVCB6CSLUZEvqlDVgND6sdZolVajvw/sEo7hP9S7T7tiqFSHzJBQo8fltHKAdoSb21j+N375AYZYOOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoMbMH3s0+Vvcc3OLeaN0DHdSdek+IogtVy8k1fV2KU=;
 b=pmkLVlDeFPPRKDKuPOuQcAcTk6d6sq4ItREpjJSy2Stc127srj8sIKeRJ0vqmXHZ6CFUYzRYz+njn7ilE+tLU0Wugrxfo7YXNjTaZYKcuKuxegmT0oLGU7JkiFXpo2mnR494V+Xe0iJcKexHE5EBl2/kDxoZHSpvz6uFQ19+g+Wq3c7C4nhfWILSYA13k8GAjBptBFjTF24JPWWIki4kuXBJoMW8KSd56pncNXz+l+bEDZxuqr6S37te5KkK/6kcQ1mHZoy+zkA6/KmVEOx/0yy21liUmiIf+aDCrIoMrmAA87H5vnh8TPX6JRgMwo8GnipSIA0oltlk5wHby4kViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoMbMH3s0+Vvcc3OLeaN0DHdSdek+IogtVy8k1fV2KU=;
 b=kMZeXd1NE6Unjd9cRH9bRePI8MftHEW2Z2hCrkH5bQ8T+o75+s+zXgFCLgekRas+xi20jJITDmT1cMq245/aoghR1l+oxxg5xubfAK9An26GhpQHgx6kH5FkyFYrTWXkQFoyEt/olyz7idMVFq1wYCqr4DQnHk0ndA9IlK/XQPhmMMvorR2NDxiR9VSLRo3gkVaI0x63IVhHsX1SbUmKSgqnN88VxVBYFmiuIZIwTxoX4aJElR1uL33D4CW/hgbE1tJkc/XeVEqRThB53HiXPPMP9PvdIc2/RcMZJBM1d/VfH3AJ9GWakx+sNGt1wfnCYuoaa6tZgsErmw8kE4zHPA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DB9PR04MB11693.eurprd04.prod.outlook.com
 (2603:10a6:10:60b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:08 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:39:08 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 16:39:05 +0200
Subject: [PATCH v6 10/10] arm64: dts: Add support for LX2160 Twins board in
 single configuration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-lx2160-pci-v6-10-d0ff72d3c983@solid-run.com>
References: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
In-Reply-To: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|DB9PR04MB11693:EE_|AM1PEPF000252DE:EE_|AM8PR04MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: cfce6436-1b86-4310-cb3c-08deb03444a1
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|56012099003|22082099003|3023799003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 Bh7b56LPfB82MlCWvEVk9zgoY+EJf1PZcjZzECw+aVAbGfcB7xOF+3hhPIIUJ36eds8iHpFpowqg/8luLoYqa9yO5ux8oI2mpEvESuCwbG4esABXl+WFyj/h6uudTPoclkIW/EHyEpHf4YGdZhsd2ajCEFN9OzQ5fZl8toi1l6hIBnfG7/64q1i6CuAYvUgHHkKJK6foX6uBuuIKkdYeCP24svL87nmfnoCvWWO4zC1h4ivEEoovIYxeggWjgC1AImRtQ5TDtN211Bb7ojzPFck82lEPWmmRJ0IfWjfqx2kXW2C/JP4vL+ZR7Xaknn9wZmI7tm8+XUvOEdyrZ0u/615dudlS6fGYq/2kXzV2ALuAhhj5cAr4uTkLHUDCovEUrU6gO9FtanULO8OjRYpH/ioXlmSNkyPxWrRaoSp7PYyS9STyrAK/Q245C6CzZ38K4HYEGi+V4a+nmOMw6r2jXRfbQE3gY5rLNd/wse/KG1VwsB4qHwtDghKnO7/p2PhGKiRUeUZbMHXgK/HwsMxYqcSmUP5WXMjZBdLFsjZak5T2aBlvHansF79f/ct32h/ONSQ5lRG49nESaXu98i/yEkhhtYgtA5/QEIku770q28+QoAfMrnRQpuvwwU0u01MYkRHnCmVjGBbIBs1+66V2XtIxLClJwoC2mjI+TYkbzFpCYULNtGvtTRkGaDNqTEns/hmBZuysXXQtkdt+BI/9r5ipBD2iqtruhzQRm/91173ZjfagSc1tiegDum2wX4XzjXjdhuV0vDcfOVEORyaJlw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(56012099003)(22082099003)(3023799003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 RiRI0z7/rn+0k+PgUf67x4PjPvcmzrYq8vT2YLafMN07ySf+g7UI0am7qS4AVmFxTjaVgh4nnxiIM3yH2Hz5cFRyGyWW35MxCWQKnz40IWRdf/varb6vTxpa8su/HuEZoOTEIezZCSYMNTRNwP3ux0pZeKQdtWZTbJzEcPXEDWmwhH4TEk7HVXiCNWHCwjgjAHunda2KKN145Hq0kYRogKCOHEYfAclWEiMuzlcTy2Ie/twM8f8Mrqyih61w0CdKkLNNFmB6f8iSC6A+1pe5YqFSZn+dBDdfPOilL8puOJSjP31fVA69td2RaRL9+58bPP7JlND1B/UtswdLgeVzZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11693
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 4c3f2724ec7d40fe815d8ed005c72b2c:solidrun,office365_emails,sent,inline:419adc75474dac978fa76f6589bce4c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	498460f0-5672-4dd3-6474-08deb034395a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|14060799003|1800799024|376014|35042699022|82310400026|36860700016|22082099003|921020|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	uXrBdQIuuDPWMspJsoWZsCm/oVNqdCWy3FYhza6X+ZhoczXTqmkq/IWmbPyVSApb3zkLVpoZ+gpiB+0ZNovVp2LCstVIS6Mo3gjcFrPdAweCjpXD009Qw+Gy5erBdV7eYwu2h2JCo/uF6ilrUN3gknOuiwQwnwUiTfinhwCw5OgVmGmPi7OdH6yMr0ygR+dTUoEJ0SzbEC5GJmill+RdlFQN+eMeXdk6Je99zjXNn6YNBwwi0RE0I97O7Ilm9xqb8CoG6+6vKLlf1RZK0VYP4ZmMCkSpS1O3ae5RFdSw03LDkEcfONrVUGmaFVARZIZfW8sQj4gT/StKgjyjyu+Sb9qWk/9YkMQyeEWwC9lXWT7IfYR/hsmasr5dzyHxuetbNaIuyq4j4mBYgcjFQf88EHO9ErO4FqjUNgCJPl3FZkFhzvVBhbpQONnBjk7Vu5Gt6zVwLf9hX8zIlPl3dkW5V65UvgFmtWEsCKYiZXd/WpJR0pExsONX4JDsndoyxrsYUUKha+ERxnqOF28L+Uh2y3mOq1DUsq/Cpe6MrVGgVArA5403kriqufyzGPFSp6zjtA3E3OYIsn55Nfel6UemkqgeYcNL+bIakEvERU1xrbiSR8V2Yur5zcF+nVWO75O5W/6SMe9qETuZeK2HaEMqB5B/i+HXq9Qg2lGsT2GajvN2wD/9aiRIlQ6iI5RK2jNzf/7PWUAEItPzftg5ri5JDKTXYAh7FmyNq3DLynl2YnYo29MjPiqr6H2hXQ+EpE8hhRHpZIBbGyEu4kUXoierWw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(14060799003)(1800799024)(376014)(35042699022)(82310400026)(36860700016)(22082099003)(921020)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aY/8mzWglOiuS6AvtMPIlJNvxJVUeBYDi96eBa3AevHI9BnQxroxNdhcVY1CeAfQJ73f5m7JIvH4pt5p9sM4R7TOIS2rMqaMiKwGBd0Mywui6cURs4hyY07fjTl09QVb3pOKw4PHYbyAcmCN2Tn6VhonG96KSsiKUHgUUQVOmBm0Qy5ByN63nZKEgrUvsoxkW3WMkRJX/xAGWF/IikrVqPkHsxWhZ+NlmZLofZpZeRAAyxaQ4AGEMzzx9fJKaRTw2rxeb9K7oKaidczAn4Ipn36ENgKlvIUOSq01vDSmm/TX2RNCN3Zef9ZMRyC/X5TTuGH3+riet5X3+iQwZKtQAeJhdEv+Fpk9/mA55mOdt8prwUAeGVXIA4BulDQfh7h6EdbDIWC1JoDvCdtoTD3XcgVFuDyHMPeR+aZzxvmqKd8zkUg9KLHi+aHXAmRwPO4M
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:39:26.8614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfce6436-1b86-4310-cb3c-08deb03444a1
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7202

Add support for the SolidRun LX2160A Twins board in its single cpu
configuration.

The twins board is designed to host a pair of LX2160A CEX-7 modules,
sharing a single PCI-E connector in multi-host mode.

It may be assembled in two configurations (different assembly options
facilitating signal re-routing), with a single or with dual CEX-7
module. Their marketing names are:

- SolidWAN Single LX2160
- SolidWAN Dual LX2160

This patch adds the single configuration, featuring:
- 8x SFP (1Gbps)
- 8x SFP+ (1/10Gbps)
- PCI-E OCP card connector
- USB-3.0 front-panel header with single port
- microSD
- dual hot-swappable power supplies

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../boot/dts/freescale/fsl-lx2160a-half-twins.dts  | 826 +++++++++++++++++++++
 2 files changed, 828 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c990..59eee431562ef 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -51,6 +51,8 @@ DTC_FLAGS_fsl-lx2160a-bluebox3-rev-a := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-bluebox3-rev-a.dtb
 DTC_FLAGS_fsl-lx2160a-clearfog-cx := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-clearfog-cx.dtb
+DTC_FLAGS_fsl-lx2160a-half-twins := -Wno-interrupt_map
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-half-twins.dtb
 DTC_FLAGS_fsl-lx2160a-honeycomb := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-honeycomb.dtb
 DTC_FLAGS_fsl-lx2160a-qds := -Wno-interrupt_map
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
new file mode 100644
index 0000000000000..ee1867f5b2b6b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
@@ -0,0 +1,826 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file for single LX2160A CEX-7 on Twins board.
+//
+// Copyright 2022 SolidRun Ltd.
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "fsl-lx2160a-rev2.dtsi"
+#include "fsl-lx2160a-cex7.dtsi"
+
+/ {
+	compatible = "solidrun,twins-single", "solidrun,lx2160a-cex7", "fsl,lx2160a";
+	model = "SolidRun LX2160A SolidWAN Single";
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		gpio4 = &expander0;
+		gpio5 = &expander1;
+		gpio6 = &expander2;
+		gpio7 = &expander3;
+		i2c0 = &i2c0;
+		i2c1 = &i2c2;
+		i2c2 = &i2c4;
+		i2c3 = &fan_i2c;
+		i2c4 = &power_i2c;
+		i2c5 = &i2c_smb;
+		i2c6 = &sfp0_i2c;
+		i2c7 = &sfp1_i2c;
+		i2c8 = &sfp2_i2c;
+		i2c9 = &sfp3_i2c;
+		i2c10 = &twins_sfp_c1_at_i2c;
+		i2c11 = &twins_sfp_c1_ab_i2c;
+		i2c12 = &twins_sfp_c1_bt_i2c;
+		i2c13 = &twins_sfp_c1_bb_i2c;
+		i2c14 = &twins_sfp_c2_at_i2c;
+		i2c15 = &twins_sfp_c2_ab_i2c;
+		i2c16 = &twins_sfp_c2_bt_i2c;
+		i2c17 = &twins_sfp_c2_bb_i2c;
+		i2c18 = &twins_sfp_c3_at_i2c;
+		i2c19 = &twins_sfp_c3_ab_i2c;
+		i2c20 = &twins_sfp_c3_bt_i2c;
+		i2c21 = &twins_sfp_c3_bb_i2c;
+		i2c22 = &htwins_sfp_c3_at_i2c;
+		i2c23 = &htwins_sfp_c3_ab_i2c;
+		i2c24 = &htwins_sfp_c3_bt_i2c;
+		i2c25 = &htwins_sfp_c3_bb_i2c;
+		i2c26 = &ddr_i2c;
+		mmc0 = &esdhc0;
+		mmc1 = &esdhc1;
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_ht_c3_bt: led-sfp-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <1>;
+			gpios = <&expander3 14 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac5>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_ht_c3_bb: led-sfp-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <2>;
+			gpios = <&expander3 13 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac15>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_ht_c3_at: led-sfp-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <3>;
+			gpios = <&expander3 11 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac6>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_ht_c3_ab: led-sfp-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <4>;
+			gpios = <&expander3 12 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac11>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c1_bt: led-sfp-9 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <9>;
+			gpios = <&expander1 4 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac4>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c1_bb: led-sfp-10 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <10>;
+			gpios = <&expander1 3 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac17>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c1_at: led-sfp-11 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <11>;
+			gpios = <&expander1 1 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac3>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c1_ab: led-sfp-12 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <12>;
+			gpios = <&expander1 2 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac12>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c2_bt: led-sfp-13 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <13>;
+			gpios = <&expander1 10 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac8>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c2_bb: led-sfp-14 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <14>;
+			gpios = <&expander1 9 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac16>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c2_at: led-sfp-15 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <15>;
+			gpios = <&expander1 5 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac7>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c2_ab: led-sfp-16 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <16>;
+			gpios = <&expander1 6 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac18>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c3_bt: led-sfp-17 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <17>;
+			gpios = <&expander1 14 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac10>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c3_bb: led-sfp-18 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <18>;
+			gpios = <&expander1 13 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac14>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c3_at: led-sfp-19 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <19>;
+			gpios = <&expander1 11 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac9>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c3_ab: led-sfp-20 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <20>;
+			gpios = <&expander1 12 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac13>;
+			linux,default-trigger = "netdev";
+		};
+
+		led-status {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <0>;
+			gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-status-twin {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+		};
+
+		led-fault {
+			color = <LED_COLOR_ID_YELLOW>;
+			default-state = "off";
+			function = LED_FUNCTION_FAULT;
+			function-enumerator = <0>;
+			gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+			panic-indicator;
+		};
+
+		led-fault-twin {
+			color = <LED_COLOR_ID_YELLOW>;
+			default-state = "off";
+			function = LED_FUNCTION_FAULT;
+			function-enumerator = <1>;
+			gpios = <&gpio2 9 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	mux-controller {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * This gpio controlled mux can route the tacho signals of 6 PWM FAN connectors
+		 * to the tacho inputs of both CEX-7 modules (twins).
+		 *
+		 * The first twin controls this mux and monitors four fan connectors, two intended
+		 * for itself, and two for the OCP card.
+		 *
+		 * The second twin monitors only two fan connectors intended for itself.
+		 *
+		 * The table below maps selector GPIO states to monitored fan connector per twin:
+		 *
+		 * | SEL1 | SEL0 | Twin 1 | Twin 2 |
+		 * | ---: | ---: | :------| ------ |
+		 * |    0 |    0 | J10    |  J5024 |
+		 * |    0 |    1 | J5016  |  J5024 |
+		 * |    1 |    0 | J5026  |  J5025 |
+		 * |    1 |    1 | J5013  |  J5025 |
+		 */
+		mux-gpios = <&expander0 8 GPIO_ACTIVE_HIGH>, /* SEL0 */
+			    <&expander0 15 GPIO_ACTIVE_HIGH>; /* SEL1 */
+	};
+
+	ht_c3_bt_sfp: sfp-1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&htwins_sfp_c3_bt_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander2 13 GPIO_ACTIVE_LOW>;
+	};
+
+	ht_c3_bb_sfp: sfp-2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&htwins_sfp_c3_bb_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander2 14 GPIO_ACTIVE_LOW>;
+	};
+
+	ht_c3_at_sfp: sfp-3 {
+		compatible = "sff,sfp";
+		i2c-bus = <&htwins_sfp_c3_at_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander2 11 GPIO_ACTIVE_LOW>;
+	};
+
+	ht_c3_ab_sfp: sfp-4 {
+		compatible = "sff,sfp";
+		i2c-bus = <&htwins_sfp_c3_ab_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander2 12 GPIO_ACTIVE_LOW>;
+	};
+
+	c1_bt_sfp: sfp-9 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c1_bt_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 3 GPIO_ACTIVE_LOW>;
+	};
+
+	c1_bb_sfp: sfp-10 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c1_bb_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 4 GPIO_ACTIVE_LOW>;
+	};
+
+	c1_at_sfp: sfp-11 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c1_at_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 1 GPIO_ACTIVE_LOW>;
+	};
+
+	c1_ab_sfp: sfp-12 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c1_ab_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 2 GPIO_ACTIVE_LOW>;
+	};
+
+	c2_bt_sfp: sfp-13 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c2_bt_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 9 GPIO_ACTIVE_LOW>;
+	};
+
+	c2_bb_sfp: sfp-14 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c2_bb_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 10 GPIO_ACTIVE_LOW>;
+	};
+
+	c2_at_sfp: sfp-15 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c2_at_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 5 GPIO_ACTIVE_LOW>;
+	};
+
+	c2_ab_sfp: sfp-16 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c2_ab_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 6 GPIO_ACTIVE_LOW>;
+	};
+
+	c3_bt_sfp: sfp-17 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c3_bt_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 13 GPIO_ACTIVE_LOW>;
+	};
+
+	c3_bb_sfp: sfp-18 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c3_bb_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 14 GPIO_ACTIVE_LOW>;
+	};
+
+	c3_at_sfp: sfp-19 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c3_at_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 11 GPIO_ACTIVE_LOW>;
+	};
+
+	c3_ab_sfp: sfp-20 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c3_ab_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 12 GPIO_ACTIVE_LOW>;
+	};
+};
+
+/*
+ * This board supports industrial grade temperatures,
+ * the LX2160A SoC maximum junction temperature is 105°C.
+ *
+ * Raise thermal thresholds to allow operation near maximum temperature.
+ */
+&ccn_dpaa_alert {
+	temperature = <100000>;
+};
+
+&ccn_dpaa_crit {
+	temperature = <105000>;
+};
+
+&cluster2_3_alert {
+	temperature = <100000>;
+};
+
+&cluster2_3_crit {
+	temperature = <105000>;
+};
+
+&cluster4_alert {
+	temperature = <100000>;
+};
+
+&cluster4_crit {
+	temperature = <105000>;
+};
+
+&cluster5_alert {
+	temperature = <100000>;
+};
+
+&cluster5_crit {
+	temperature = <105000>;
+};
+
+&cluster6_7_alert {
+	temperature = <100000>;
+};
+
+&cluster6_7_crit {
+	temperature = <105000>;
+};
+
+&dce_qbman_alert {
+	temperature = <100000>;
+};
+
+&dce_qbman_crit {
+	temperature = <105000>;
+};
+
+/* sfp port 11 */
+&dpmac3 {
+	managed = "in-band-status";
+	phys = <&serdes_1 7>;
+	sfp = <&c1_at_sfp>;
+};
+
+/* sfp port 9 */
+&dpmac4 {
+	managed = "in-band-status";
+	phys = <&serdes_1 6>;
+	sfp = <&c1_bt_sfp>;
+};
+
+/* sfp port 1 */
+&dpmac5 {
+	managed = "in-band-status";
+	phys = <&serdes_1 5>;
+	sfp = <&ht_c3_bt_sfp>;
+};
+
+/* sfp port 3 */
+&dpmac6 {
+	managed = "in-band-status";
+	phys = <&serdes_1 4>;
+	sfp = <&ht_c3_at_sfp>;
+};
+
+/* sfp port 15 */
+&dpmac7 {
+	managed = "in-band-status";
+	phys = <&serdes_1 3>;
+	sfp = <&c2_at_sfp>;
+};
+
+/* sfp port 13 */
+&dpmac8 {
+	managed = "in-band-status";
+	phys = <&serdes_1 2>;
+	sfp = <&c2_bt_sfp>;
+};
+
+/* sfp port 19 */
+&dpmac9 {
+	managed = "in-band-status";
+	phys = <&serdes_1 1>;
+	sfp = <&c3_at_sfp>;
+};
+
+/* sfp port 17 */
+&dpmac10 {
+	managed = "in-band-status";
+	phys = <&serdes_1 0>;
+	sfp = <&c3_bt_sfp>;
+};
+
+/* sfp port 4 */
+&dpmac11 {
+	managed = "in-band-status";
+	phys = <&serdes_2 0>;
+	sfp = <&ht_c3_ab_sfp>;
+};
+
+/* sfp port 12 */
+&dpmac12 {
+	managed = "in-band-status";
+	phys = <&serdes_2 1>;
+	sfp = <&c1_ab_sfp>;
+};
+
+/* sfp port 20 */
+&dpmac13 {
+	managed = "in-band-status";
+	phys = <&serdes_2 6>;
+	sfp = <&c3_ab_sfp>;
+};
+
+/* sfp port 18 */
+&dpmac14 {
+	managed = "in-band-status";
+	phys = <&serdes_2 7>;
+	sfp = <&c3_bb_sfp>;
+};
+
+/* sfp port 2 */
+&dpmac15 {
+	managed = "in-band-status";
+	phys = <&serdes_2 4>;
+	sfp = <&ht_c3_bb_sfp>;
+};
+
+/* sfp port 14 */
+&dpmac16 {
+	managed = "in-band-status";
+	phys = <&serdes_2 5>;
+	sfp = <&c2_bb_sfp>;
+};
+
+/* sfp port 10 */
+&dpmac17 {
+	/* override connection to on-COM phy */
+	/delete-property/ phy-handle;
+	/delete-property/ phy-connection-type;
+	managed = "in-band-status";
+	phys = <&serdes_2 2>;
+	sfp = <&c1_bb_sfp>;
+};
+
+/* sfp port 16 */
+&dpmac18 {
+	managed = "in-band-status";
+	phys = <&serdes_2 3>;
+	sfp = <&c2_ab_sfp>;
+};
+
+&esdhc0 {
+	pinctrl-0 = <&esdhc0_cd_wp_pins>, <&esdhc0_cmd_data30_clk_vsel_pins>;
+	pinctrl-names = "default";
+	/*
+	 * Disable 1.8V modes so that microsd state is same between
+	 * power-on-reset, u-boot and linux.
+	 * This avoids sporadic read errors after hard reset with some cards.
+	 */
+	no-1-8-v;
+	status = "okay";
+};
+
+&i2c2 {
+	expander0: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@24 {
+		compatible = "nxp,pca9555";
+		reg = <0x24>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@25 {
+		compatible = "nxp,pca9555";
+		reg = <0x25>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	/* Half twins configuration; take over c3 from the other twin side */
+	i2c-mux@73 {
+		compatible = "nxp,pca9547";
+		reg = <0x73>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		htwins_sfp_c3_at_i2c: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		htwins_sfp_c3_ab_i2c: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		htwins_sfp_c3_bt_i2c: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		htwins_sfp_c3_bb_i2c: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	i2c-mux@76 {
+		compatible = "nxp,pca9547";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		twins_sfp_c1_at_i2c: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c1_ab_i2c: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c1_bt_i2c: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c1_bb_i2c: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c2_at_i2c: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c2_ab_i2c: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9547";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		twins_sfp_c2_bt_i2c: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c2_bb_i2c: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c3_at_i2c: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c3_ab_i2c: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c3_bt_i2c: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c3_bb_i2c: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&pcie5 {
+	status = "okay";
+};
+
+&pcs_mdio3 {
+	status = "okay";
+};
+
+&pcs_mdio4 {
+	status = "okay";
+};
+
+&pcs_mdio5 {
+	status = "okay";
+};
+
+&pcs_mdio6 {
+	status = "okay";
+};
+
+&pcs_mdio7 {
+	status = "okay";
+};
+
+&pcs_mdio8 {
+	status = "okay";
+};
+
+&pcs_mdio9 {
+	status = "okay";
+};
+
+&pcs_mdio10 {
+	status = "okay";
+};
+
+&pcs_mdio11 {
+	status = "okay";
+};
+
+&pcs_mdio12 {
+	status = "okay";
+};
+
+&pcs_mdio13 {
+	status = "okay";
+};
+
+&pcs_mdio14 {
+	status = "okay";
+};
+
+&pcs_mdio15 {
+	status = "okay";
+};
+
+&pcs_mdio16 {
+	status = "okay";
+};
+
+&pcs_mdio17 {
+	status = "okay";
+};
+
+&pcs_mdio18 {
+	status = "okay";
+};
+
+&rgmii_phy1 {
+	/*
+	 * COM has a phy at address 1 connected to SoC Ethernet Controller 1.
+	 * It competes for WRIOP MAC17, and no connector has been wired.
+	 */
+	status = "disabled";
+};
+
+&serdes_2 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&wriop_alert {
+	temperature = <100000>;
+};
+
+&wriop_crit {
+	temperature = <105000>;
+};

-- 
2.51.0

