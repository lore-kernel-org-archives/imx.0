Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB0927A477
	for <imx@lists.linux.dev>; Fri, 15 Aug 2025 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755251288; cv=fail; b=p2vFDwjcMbVSf0S1RNQSNFIKdqMrvRhWq9o2NY4mstwK9gKUNPw6JKB74YOkvcgZhXQTtd89eaZg5wMhNIzYM8wteKGtXxSGX5WISEhfe3LtaVqg9Rx+AdYmQrdu44GhBgY+jrVm0xGAd80yFQrF0OcsZF5C/Y0bBmDwlv/TeE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755251288; c=relaxed/simple;
	bh=liLlv1f6/aTzP3V5Gq9Kn1ZELxT32FiIsQmud+bldLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CRSbeqq7Jc4IUihKYwMKPv5f3KPh6KkKMoneB8MK5n/sYEmUrxFoZA9lR/Ji741JCZkrIu9UKCnyZ3WZhVELEZAPbaYlDL6+lkvL3S35UFeOg1DbBtFQmWuTjtNhLqgSJyZkZ41WMCU+LvDZbWilLDunzRZVvOz7Yjbxgh1i+28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I7ut7F49; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I7ut7F49"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfSp8zBVbVr5EAJsbeeTdXIKqw8g2xcLGJC2OUhy+cVqzlFoIvj4JRdwZArxSBSfzpk7DdCoZrF1z+vM0a4B+kdXFNgWDy+KuokMu+m27GQaZTS3tanHGc0zmQuLaE9CBCLPwqqCuVH3nHikZOcd0Pv7O765RADNK8ImJocXk5K0qlDVPyoCAzY24BShkXaCpOJJfYMdCyON6zYQ29pPtl3AXTaOK+d23t7aPJS4lKiBtTPv9dwr/XY/dd7gShAqnscWbthtD3ntdIAegFuh+puXdyFfNRzwxQfmIn3myHMEWJI7CtdArJVCE0LIx8pNm4esxAShBRicvyNTc+UzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSArVWgAA9RjH2UNONUaTwmUkq1gpiqclcOEtDKFB5E=;
 b=QHgYYt/n8HKSMsF+yqk3Qi03ID0YC6LGJEwXtwv+0mHo8Xjvxrweb9OMY7z83QhtIQi1H27IOfVrCih5f531tUsMmLypzjUrfqXvUKtmNSxbjOO2p/uPUj+MHJc0FyxgXd1RKcmVeDp4e/pgcSM1onrkmnVa9KDmnopYdbDw9hdZZa9z+hJRuaWPhGR/0HPjjdsUpFMAeAx730pZwS7owFe3PaCyqyLhmaZI4Ehv9mx60rIWqs2iW/nSlX8FFWG30GwKQ1RiWXXzw2bWf/cU/3tcPavVb6zz3vLxwJy+ocB+3AZ/6ZD+9A+Ci2RQZtyDbUIVT9A8z0xPXa/lMMOzMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSArVWgAA9RjH2UNONUaTwmUkq1gpiqclcOEtDKFB5E=;
 b=I7ut7F49O85oftOsaak6oTNHCXKvjV4TjtSw9K6zQdPZr2YOqA3DtcvRL3eMqMEF6c6TWFHIKo/OKVYgK1FTj+h+nmZfiSjU1ycAMgz0EC/4MosMv+o5CmFzQkhQPQu+jPjE8Cc8NNFFNeDq+9GLSDFM1RI9CJFUBVtrGYWw02BzbI0IHAnfTZKKgB4mGeEiH7RIBS06QMZF997wYRQVTAgMdq+XdInTySvCRN1TGI4CwmV3nZsBiDLQKR3zeyVyZZgveQjgyHF5yfgm7bU9alSas0aptS4QIeWsMdq5PYvqBd62KPpP4XvrTH1TYeZb0anwKb/h0jyYs8HksiLcmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9557.eurprd04.prod.outlook.com (2603:10a6:20b:481::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.7; Fri, 15 Aug
 2025 09:48:04 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:48:04 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org,
	myungjoo.ham@samsung.com,
	cw00.choi@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org
Cc: swboyd@chromium.org,
	heikki.krogerus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [patch v4 2/4] dt-bindings: extcon: ptn5150: Allow "connector" node to present
Date: Fri, 15 Aug 2025 17:47:31 +0800
Message-Id: <20250815094733.2353916-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815094733.2353916-1-xu.yang_2@nxp.com>
References: <20250815094733.2353916-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0052.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::21)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9557:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bb3817-9e80-4ede-e60c-08dddbe0d47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|19092799006|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cOlthxmbucA0KaW5kKvOuNP+Ov92BMlQvOr6oBcabEa+RnxzHCHSDc8URgBR?=
 =?us-ascii?Q?WfBrJz4nzCPkbKCdu9SRl0YDUR7Z/zQ2c0ZytOlJDZbYUDIq1xNUOQdEURJ7?=
 =?us-ascii?Q?nqpyHD/IwuyYfyBHE6NWdESoMLJGCSe0+symQLZgsNrzJ3j+zra/NZC9sIYT?=
 =?us-ascii?Q?ZaRizQIVUXQIgxw0cl/mBwUA6FHYgq8R+hV9kwi06ftr60frEKI7UF3lu2UK?=
 =?us-ascii?Q?xDYbFxwXRJtrpkVbLFAOkg9pfAkrN4H0VqHG1q34neL0X0ks1GN9tpq2wKUP?=
 =?us-ascii?Q?Zk+FElhOg4ul+gWNjqQ67KI5ULx6eJHbBD1SPb9VXQCbewmuEjNeawjtEfvt?=
 =?us-ascii?Q?0VJpDM5w+B/+eWjk/cq9gined0iHjp/4kWgskepjWdjV4xqB4yPMkEyo7BmZ?=
 =?us-ascii?Q?L9QxIULP/mZjMIFpJGE/l52w0dF1DtlAIQlZmw0EotOByX0dU5c12C/R47qr?=
 =?us-ascii?Q?B/yD/c+RswpWXE02WffebZ77qOIdPatQiNmVDtxs07uf5+eZsie0rz3ioZ3W?=
 =?us-ascii?Q?AfPPRvpleKu+L0fvXsYTZBMZivyaK7HzjPmyXc4RSxfcxNkuBzpwgqYYPXVJ?=
 =?us-ascii?Q?oFAhE7zdjysndAdaU2rIrW9P0lktH6FVSEEAkbjU4bYRxlQe89J7LZX7Fz7A?=
 =?us-ascii?Q?w+skdV0aWLMgZAFXIy3LAVU6weqlAG5X64NqUG9NFybbUoM/GXX3hS8uOlht?=
 =?us-ascii?Q?lSr+V4XowLywQ258HUHJqaVeNevR3GD8bew21a3I5qqU6P5M0h6MWCkX51H9?=
 =?us-ascii?Q?VVNtt8GRMe9gruRy9+/7w7AfmeXj33js5BkOqB5Ann9qmJQZBTbYiBTM2v1S?=
 =?us-ascii?Q?wWkIbhttXyG3umTGeo/Y2SodMtP0ndYaNAqthz09sGLC6Ms/LIRk6w6m4qha?=
 =?us-ascii?Q?SoTZqBTIFSGYUJCAsTmF8Oj3FabNKEsdWBxauuuBEiRvw85FI109MsYUi0sL?=
 =?us-ascii?Q?Wubuh2fSxQNugvw5CzG5TfRHTegQKX0Bvwnyy5WdI+WN1bPNO763mv+SAVF8?=
 =?us-ascii?Q?RNFHKoze4nN0XZDW12PPPCoU+3egnHOMkld3FvXfU5EkWFZLB0ER8SjYyBKx?=
 =?us-ascii?Q?kWGizOzilYKIygZJLEe6bi6FyNG2zUgkwO+iW+vraZpvfnOGs35khR7QXCIY?=
 =?us-ascii?Q?pTTnYefxv2R6h1gDR582axeT60N/gDMWr0TQf+JQ4I+7g2g8jgaWdEM9jijl?=
 =?us-ascii?Q?N3eVheQXn0nXTtPo70LaKP32mP3tYiMUWqjk/phzRpzVv2HoKCb9Iq/jXRYz?=
 =?us-ascii?Q?BueH2cmOeYOto6Jl0LRzZkDEQpBg7DHlpa6dvwMoKql1C0bVAxGlgC8t60pg?=
 =?us-ascii?Q?sjNEJkEziI4Yuc64cIIst6g7E2zARwzHdLMRq1akzE7GYBYMBd0LCGvyJqYx?=
 =?us-ascii?Q?pW00s6IZovdlblbHLxZZwanNUnEq7+NbwAaqLhPQ/8ZdOigCniMF6mxXOe0V?=
 =?us-ascii?Q?1DbYEk+GuUqBdFYrMrD4NS+Uk4ie4UxqQmKS9L5Grr++QSnt1ecfPg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PTpp9Cwf96E9PEAGM71jzJ2GaPXio9k8eYmiKMZ6PMtHLCoVqta4S7n4zaQw?=
 =?us-ascii?Q?VhcF+Lv9j1Cqob0U5j/aXqxteYju/GsL+6z56kxyokKnTcLV2Cdapnb8+aJ7?=
 =?us-ascii?Q?FzYiwvtHEkyDFtt9nFswpc3XVhog9SerowgdScPlC1jwiXf/1SMBzH7fhjl3?=
 =?us-ascii?Q?pWaSE9J+WHM4LqdXUDxFJC9Cqjg2naoS0DKuapZsdJbRKLMWLnYVNE+pmw63?=
 =?us-ascii?Q?3yeapsXkhHdy0JZC819phGurcBZvC5GJeiNmKJwPX2fmu4CVC3QMjH0vUvf7?=
 =?us-ascii?Q?HDDRit7I5FzTL4gjfTN/JrWM9PK9wzcRKvmXfhZy87pMIWudm25dm3iLkTm3?=
 =?us-ascii?Q?QCPF4S/ul29O7ttOSoW68EmZ6E2vRLQTaffAK+4Rb7YmB3KqItIP5aAL9lQO?=
 =?us-ascii?Q?cj0Nbp/A0G/hF+1XFoEyJz7xoI6bt2bjJ31o7qeSVqgkiyOzXTurmqC4IOuL?=
 =?us-ascii?Q?PHhbVaIf3YpIltaOq3Rj4B1Kkr1WquIOk4NF5knniXx6/ryulEHhWqYciQg7?=
 =?us-ascii?Q?2hXg/Dcst9Mpn8kWB5QMNmAHC+5L4FcexwT5z69CaKpLasXxHGooj+A79Kvn?=
 =?us-ascii?Q?3+H/uOJJuUqt7PFaNQde5KYcQaXAKBB+K5FVrDQO65CWrLrw3076plH6R6px?=
 =?us-ascii?Q?ajdZ+mxQbcpXA8PuWKLjKSEmyGJKGrzXsOZqed6N5/0KMtxn+QQb6f0FLZa+?=
 =?us-ascii?Q?TLa1YcGJ3/F8dVXBY1RVbigf8qhAVaL1ugZzDBVryzPNaOvZdMLvYnBxVzSS?=
 =?us-ascii?Q?VDt0NSErUCFZy83rZjrvclzOWRkeWL/93sgJBM0YGjdlunjEdNeWDcM/eYT0?=
 =?us-ascii?Q?0RTzSBiwQcD2YN0zWi73oNrigguT6UiVH49vgYtQ8nhFFqQYVmBZG2pUmYeU?=
 =?us-ascii?Q?5yPJOdCE+yBDYz/KkJvlaEdIziJalsTCH5FeSLo7dX8El09pQVKb5UZhBxi+?=
 =?us-ascii?Q?/0TEJsA9S3aRpmTT5A5xH/RUY3ZO33wOP5FwhYOcSZvPmBmQ5c4dcFeCk8wv?=
 =?us-ascii?Q?nlIFbuQbuEJMqpncItL4e+LHw3/S2J1U9WCl321x2Y8vQDWrfRrWGPVl6/+t?=
 =?us-ascii?Q?O7ppo2ahaSR5neNS9Ie9IMzvhjI/hb0JFzKRKwF4C1UxuyB7rQzESkHrW/EF?=
 =?us-ascii?Q?ckdaC7ndbvi6+StSvJCFWp6dVFm7kdoB1U4Fq6Eoul1Ym4rJg4inB9bFIou5?=
 =?us-ascii?Q?dOXVKj9YtsZLOt+lUJwc76CZoPO2+TJGrt6XDN91zhW0jV47/tpJf69zRBw8?=
 =?us-ascii?Q?a/nxXWrkhykKOMGXqokPj9xJsDlx62TAsZMT+w0J9YENNJ2aDSvHS96Wed1w?=
 =?us-ascii?Q?Q//rXj455ABxxaNbUl/T1ELOJaEMoScCLc1IV/SuZbjKLIgaHDzl+3qVGbCW?=
 =?us-ascii?Q?W6BxL23RmQWrZE4KDfQ/gHZHzUxFrpCILHHpdHuwj7iSNn1XFTrVMUTVW+GR?=
 =?us-ascii?Q?8isYpa80pvwi3ySce18Z5wOvPQt3GNPlIommBNpdmfZR8oGi9jfM+aw9E0lm?=
 =?us-ascii?Q?+HqIzQDCMqQfLWDcpht/1dX7iwQILGSW4wrnhdtwQIILqk8pdb+krd7LgvXw?=
 =?us-ascii?Q?HyAgL5GWfyP21fNLw09s7zyHfl1c/xmmyQfUJACA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bb3817-9e80-4ede-e60c-08dddbe0d47a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 09:48:04.4002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnwymQwqQDSGGKtHme6bL7uESgUnc2KQTNX8KieZYBB2onhXixJku/+2ipA4V8ehufpqIntnixfvrN2czZQdJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9557

PTN5150 is usually used with a Type-C connector, so allow a "connector"
node to be defined under it.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - no changes
Changes in v3:
 - add Acked-by tag
Changes in v2:
 - improve commit message
---
 Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
index 072b3c0c5fd0..79f88b5f4e5c 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
+++ b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
@@ -42,6 +42,9 @@ properties:
     description:
       A port node to link the usb controller for the dual role switch.
 
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+
 required:
   - compatible
   - interrupts
-- 
2.34.1

