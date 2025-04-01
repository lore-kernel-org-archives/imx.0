Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5B61C3BEE
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 07:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743491767; cv=fail; b=By44wWNpzrYHHp50PtK2MQdq599Qhudu/cwj6YtpF2JPbkYPR1gWMokFz6XQghIP/8l+WWyXpXie6o730/AxUwwc4Fy9hEHPW9ixH6N7JYxKNx4xOFaC95McvNq3ddtWpSl/KB7vSt12TojJHWyxOwiQe3GCvJuwLmJMw751g3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743491767; c=relaxed/simple;
	bh=4Hiyn7ercaCjXogUsPkkTPpm/jGROqRgEZp4R6XoIms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EHLd88QkmqLvHFeY/1Neyz1/0aZ+bhDe1GEIXkWULg+9ArH6qKYJ5buUPOwml3ke6pAWIg2I8fq9wgPFe4Ul/WxAsoEvHEkXOxkUjD1qn1679EbmsCtQ6Y+G0WEJmnssJQOqSKy5skz4ep+m/e/xb0sS9panW+0OR5s9kUfDtRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PuMlKJNE; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PuMlKJNE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1ol/1bxq/3odM35XVAtuOQr+FXEaR1Sy/cTh2Z81KXc014306vhE4Uv0Okuhc54uVQrL1qxwWnNdlECednWONYjp8eC4EuAzn7AxM3wYgiMam0IngvPM2Hu9BanO3dH8q3gGKpOYJDZCKOmvCjvL3BHBpfaWU6khVljJHbqIWjytsPeTb6MNpsURp+wYIiK7EbUhvSuc5NgIMtykXaKU3XOGAgzHCBK11EzOfPaIWCspYZgjOtKMKESImov+x3MQfwH7GxiBNy9ctFK4JEU1ilFIUV2EayjJXw1dGJZIni3a38+Xk3GV5tmY/g3UE+vOA2WKY154LNACo+VXKV+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXViKUwTpWPuiXZluRD4e/9DuWBeDdn2ngGIWw6rB40=;
 b=OiVHmjFHZEoECMKiWKdkvUrrxdmYmecEaxuHivAlX0bYKNooiUdy10Z3McYrpMgV6gq5kSBZEWCOUsCHZFtJ7PgKXfHgZjq/0k3957ugCGz7x0VCrcevpknSMS1BZCE94j78auO55P/+GhwZsWK9SZ/Ju2c3YMHHaXj95km4XwbmgITyVBadGvpndk/pRc+kwgrBJwcVyuj/XwNU8OQJw751PRuUK27izGdVrFgqx7Ik8Wa5ErF3CbGA+TSe5Xf/B+7FZXPnngKTJs9cOzlf5k/YsbZovubEjnAX7sEAbyJ5P5LGWfPslRJxxx2ErVYQMxAo0wImXQpeUG+V7YJhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXViKUwTpWPuiXZluRD4e/9DuWBeDdn2ngGIWw6rB40=;
 b=PuMlKJNEd1Nq4jNqeJQdH4epKCZaU87QY5DRO4p8oxemiV061vvCYSrVS3CjufNK2cam0jyQ7y8gMLMeYWrGpBGNd4e5Dhi5wzfU8nLTFfgxNVZtt2q2pjPQYVcevqdIEMnNXlSOieoxs6sbKQIzmDuBwpNDW3PIwYK/TjWTm3W1EYjQlQ6t97I8rvbJJ/ndi+rqToL/CzQ6Tj3cNwzVxcR+OhObVrfX3K5GdUJzZS4x5quwo//lP1RKKYGSvWFqsH2wSqZcMPJbKTsqfduwJGjIRoRmsbG5x5Fs1LvXAvDb7095n+F0seC2D0xWfrlEUxkb7QkpzvlDWVTanAFw9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by GVXPR04MB10611.eurprd04.prod.outlook.com (2603:10a6:150:21c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 07:16:02 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 07:16:02 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add i.MX943 EVK board
Date: Tue,  1 Apr 2025 15:17:07 +0800
Message-Id: <20250401071709.1138872-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401071709.1138872-1-ping.bai@nxp.com>
References: <20250401071709.1138872-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:3:17::16) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|GVXPR04MB10611:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0a3561-4287-4891-8b84-08dd70ed0f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rPTlA79gnu64DlNbKGf0j8GWYNtOjJYDjYM5tIi0SkL9F98CBstUxBEYlpNU?=
 =?us-ascii?Q?ZhkxrLd2tMczaci/vQeGDWWHD5EGJVbyvzg/fqh+v5x6e9TuPGDNuwQa37M4?=
 =?us-ascii?Q?tsFX6Pj8qF/sWz83f+fyhLcZqh3anoFJoA2Ua25bZyWD0o40AFAqzGFJSb4r?=
 =?us-ascii?Q?/Ei7MjPFCJNe7WfbQho/vMU/1IkQ62R3jBQFmfZs3it+6CQ4QDaW1eUCgYpe?=
 =?us-ascii?Q?3YK7EACp5yv+G0M7vz3d5hM4XusrLz+7mYcYUHogZOxrkYfH7QyOO36TcKIb?=
 =?us-ascii?Q?i6CybUJQd2rGyvR0jp8FgE6V+9uHpvVIMs3/oKwvi89ItKXkP+bNSGKtsdC2?=
 =?us-ascii?Q?v113BQGUK/ouSxvUTYhX6veMf0ff9AkZ21ShCzeMvdi74E5/wdYXPWdiH3YG?=
 =?us-ascii?Q?YWEVATCfeBIbBh0hNQETxVuq1TXNKXkH/z9FqC5mYH26BCLtzOxQbLEHKWIW?=
 =?us-ascii?Q?4P7a5Nn0vqm8NzsKFCXAiJmklR65EHql/9j58Ioo4WaDaxQUjOO0CwSJ0TB+?=
 =?us-ascii?Q?laa/DrvQhfP7R8eOgh2a4ZhVnjaE223JpBEUa6GJqLSpFGhKEYsIfRo6rjf+?=
 =?us-ascii?Q?U76oMA/ytjeKZ827WbFjono8SViSlxno72YSs5JNbfGi4kCajU3hJROMipsX?=
 =?us-ascii?Q?uZtmr5iqnS5qLfCeHCklmvHZnXkjbtnqB7pittlzo9umGV+qs+nUKDRt/25W?=
 =?us-ascii?Q?aIid+UD1Df4zLxmHOuBP3wD8k0uwlwqUl153eYhB0vwk6+TipgmuSb55dza/?=
 =?us-ascii?Q?B7c55lCZPeX5yRk5IGTwAVmDRKOapLNt0GLfQdYcvuqjXiclbWXE+wJMXjZh?=
 =?us-ascii?Q?YP6jGh3FBU0waFs7KHnuROSMrWWHwE6SqotfxzvtxPv4wYiKEHRXL/8b6kil?=
 =?us-ascii?Q?e6MbkmPrA0NilZxizc27Q8WtQMKZwjT4557jWYq6vBY5fOOQDSmH79LCuIoT?=
 =?us-ascii?Q?zo1MJw4ErEf7CrjQ/FtsGWTSwLIxRJ3CVB70l1+N7X9v/v2hhy+sxaQ7szQl?=
 =?us-ascii?Q?QB4M4cKuyp6RxZHK2Q+dVpHE1NTPvvSQc6DW9dafb39ZjnuY5VjosSRB42oh?=
 =?us-ascii?Q?zXcGMCX8FGbMmy0JBivgpj5Z7Pkz/2aouQ0uaGjGwEVOyFHmPlCsN0euhruq?=
 =?us-ascii?Q?F84AwLMW8kD/UfgoY4egvnFZjcwGO9V++gGyO4B9Pwv1KcgvEwkG1AQFOoSI?=
 =?us-ascii?Q?biSqecqOp7+O14nrtGoj4bLiOKwEbCpDLs9dS/PPLw3WfTHHl9eEjhlMV5FP?=
 =?us-ascii?Q?P5TGmcrCg3YOasEloP23dZLxM7oSK2+u949qOwNHoPvzXDa7k96PitqN8TAg?=
 =?us-ascii?Q?5n16HkzuxDOs/8JztoAmIeTBHQo38kh23BIbxBQDN+ndYqbrfSSl1RH8Fvf5?=
 =?us-ascii?Q?XPJL/xoqxBh1CFfLx0dP3YeCtAWijujBorVslAtir+yj7fBErycWl/nyQTFJ?=
 =?us-ascii?Q?fuUuMpH97lNlQ09zkySiVNRBHlK7wfZxiuToP7LNRG6JCm27CEOxxg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1FOI4yVhwf6a6y0fJZ/SDctZ6VX0MuzU/qw7x/RrclIQ27iNRXYuAbJpedll?=
 =?us-ascii?Q?i72kO9DPKbEtqldcE/qaG1UqQQcBxzg5YN4DVSGEQte2Tt8HYPtzvZ3sJ+Eh?=
 =?us-ascii?Q?eyJzdrujgf7ipUX+VmOCj0e3+tyje8dLPOUsBFrrLQaajlK+NlPUQYFbuE4S?=
 =?us-ascii?Q?EwWyxcyg4bscWFbHcBJPXh96qE9IA0rfYYfLOKNNvGb4yZMgAx0LVuIfKVeT?=
 =?us-ascii?Q?ZSEVnd4/Dus2ZahKEb4TkLKAEHN073M0BbBSpYytyvDJyAc/ugZhGzrlK6Xf?=
 =?us-ascii?Q?mgd1beYT4wGIBOaNSILoyiJ86jzMMOxrixUkaiJnxTc9BGXJBmVIMLziT35e?=
 =?us-ascii?Q?DLao0bUeM3rXjh+DoauNWD4MkvrsWpEKj2j3fxwolNvS+JumkX15uUFx5lV+?=
 =?us-ascii?Q?x1C1Dg5321d1ytc8OmX3JSAH4Pw2Zvambj+dkXSwDG5mW19HwBVRF1ku9xkG?=
 =?us-ascii?Q?5lZXXpsknbHcD0fGtKG7a1nWnxL6uKssQtnoXvVgz8Ci8Hmgw0DEYW+R1R5K?=
 =?us-ascii?Q?GUPbK6q3cPP4pA0+CSmku3prLcLyUO7s1NIrLQ4eRWIw7wQgJSfLlv7peYtM?=
 =?us-ascii?Q?i/rcxXhZG0f+mK+S4lPEMGxGemtgc7brT4uRsn78SuDb6iiK8+HiqxKdFysw?=
 =?us-ascii?Q?+j2wqgp0t9Q3p6UNaOHLXtfAy5TO6mlpSnVNNb+6srNGD84j57ludyP+m7fa?=
 =?us-ascii?Q?Tm/e78ZIjvDHtnalkVJrcJXgQ9O2IhQ+2YKhDzu8KaPV+VywYYfh5wWdSaru?=
 =?us-ascii?Q?EkS/NjiWlLq7tQR4ScX/Vvgf9FALXiQ1BFbWc9cFEIwbSgzjTphtynhdDB9w?=
 =?us-ascii?Q?1OQij8fkvffh3pUUS/whlVOV0utC3ylQvWOSyOYoJU9jZSts/bcF2vh1rPX9?=
 =?us-ascii?Q?5rOl83seAEeu1kzne+s0z1A4nw8YyaytLhKFfCUY9L7Mgtbgs3BJtNgOvQNn?=
 =?us-ascii?Q?GMojXXAsr93q2UPdwU8x+Iy1QTEMG31w5tObQK4SqxCpEqFJ9GebW6oYN6+b?=
 =?us-ascii?Q?d1Lo14YVEWI9bB5Sokq6seRUH8DqZDVrSXOvBge7IUKU0BRYy1tQt9d5Svea?=
 =?us-ascii?Q?v0fJdiz8emqrDc332iC7BBdvXSr0IaAZIZNwz8NtTg1RhPeZEUAWPPUHrn+S?=
 =?us-ascii?Q?8+MGHK+nqct/knY2bLSuoqkHEO54p8J7gm1FniXZ/X66NBRyM5s7a20p/GKR?=
 =?us-ascii?Q?EaqbsP4fa34xq7ZiU1XEh9YwqJcvpcHTKzIRnNv/+ayGNmbvRc71R+fVebOq?=
 =?us-ascii?Q?/5ONRH0GPplZX9idpfcKClxN+byCEB9odgynWwDwzPhmlO1kPazIs91r2TKu?=
 =?us-ascii?Q?Rtcx5BOYZdTekkktucIRcj+myc7LPBuVdj73cjmaqOa1jw535kPuytpZob1K?=
 =?us-ascii?Q?37Rh70bVgdfUiadfGJejQlO5sunRMCgMDNDcOO7XNIUsmdNIIFYD9FH+rQC2?=
 =?us-ascii?Q?FmTROKzhn+sHKkLg/6GCc1s0ww90MGTOEq/NC1FlKXo4yszSNcJLDtsLQbW0?=
 =?us-ascii?Q?pGqVQcv9iEvltd481OpOZbPwQO/6KNceKxX0I3NIOcynMtTK3LpGqUljHGqz?=
 =?us-ascii?Q?5PzmtAwIdFee5qiOUElYlbkX71DkfmaTw1K3aur9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0a3561-4287-4891-8b84-08dd70ed0f28
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 07:16:02.4607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RrkyHiNf0leuCreI+vIz7C7dduhgwr2+MDt1fBPJbhbiX23L+dDVJy68c+YkNOFhGfuU0GQb7GouhfI0MagQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10611

Add DT compatible string for NXP i.MX943 EVK board.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
----
 - v4 changes:
  - no

 - v3 changes:
  - no

 - v2 changes:
  - newly added
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a2..873f9eb25cda 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1347,6 +1347,12 @@ properties:
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
           - const: fsl,imx93
 
+      - description: i.MX94 based Boards
+        items:
+          - enum:
+              - fsl,imx943-evk            # i.MX943 EVK Board
+          - const: fsl,imx94
+
       - description: i.MX95 based Boards
         items:
           - enum:
-- 
2.34.1

