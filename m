Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BEF49CF33
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354094; cv=fail; b=T9Kw3xkcUDOr/cfccywzpqTk4aLmDQLzzEtg7WHvQ4sv5GkWnPT9PRu27wMXum6gpFT89Z42bMasEgO6cxjDZFvgklYQXBOXFM2BwN061E78/q984HfsKjTsrigD6p7HF1J7/r7Af9Lb4lR2XDbo4nl3NarU/JRMdIEXrSP9B/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354094; c=relaxed/simple;
	bh=h9AQ9vSJ+U/kqXzzjuBschWgi+IGzKAsm5UdgPagJdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZGJGfN239ecmbqYqB4LEM1KE2l4zpwNPjGfYAJjS7a1qGL47Xa3g0NApVSF9PCOJ9xmtC9uAulcC7KifqPJ5zjMDv1aYnKRJv8PGRXs8lR07cqyTNIG5v1cZrkZQtnUIWYMQQmsFhr3flFtpbA+oLsRZe0N1L4ZuesExhEmEhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=HIlMyMN3; arc=fail smtp.client-ip=52.101.46.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="HIlMyMN3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrQmTxnmcTvUQm4Tssf3TegPDaIeCMImFxIBxv+u/KTf7RHbmxgHPv2+ubhvAppOIEwgz+VDU9gEP3McrR88iGZw6Qc7YP2qsnq7s5O9av3i/R6eUobMYfqvs7Q3dFRC4+4RkHyBZRuEWKryl68w8mGGLDNMY66pumw2agTEyzy2y25FJsxb/13ZyB0SFlQD3KNQLcwwSf87lOWuZtlCT/p6LwiPD3JkdbgpK6xfSXThNh/MMwscfx4JLul4igDsQ5+kedQnMILotULK0P0d6iniiKK7rKn7AVI3NagYKIX8MnWRgPYQwHOXy5vvan37wAMvEsy2ALefGCExsni7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hISnVxC+UF1TuMOVBU8FODxzoVA+suR5aIVTwxAvSD0=;
 b=yvJ4a3ynIIEwLpZXADs1u7UYFrZiBDi4dZbzGB/Gf2oOoLX/BkMwJTxoaf+F1MRnCZnXWBhi0yAuwckbvhlIcfA0B+Ln+Q+pojVsGZxWYSfdg41d+y4RoOSdkQgHi9IYMW1OwajyiKf0pjgtWtmZfcmAeKXwdYy5HQ840wJtTWYlwyvVxcJiHUXv76+9u/S+M3tX5p71+AoZ53VkAnzioTjQX4MU00c5Mod15+rGWjp0YVYnD4KymLVXOezeJAhO4TBtV8NEWNYJXUMuSqC0vQ534s+KAf5fa2tQUj+cfH75xe5V+M08U1sgDZjb+PvCiAR8EWcoDPI/ISW0XRTyng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hISnVxC+UF1TuMOVBU8FODxzoVA+suR5aIVTwxAvSD0=;
 b=HIlMyMN3SAWC25rsQWLntIMwmuBqGpojCErz+1AbPNUVxdBgMAF8kLuQHg3eW0Bk1VeVDXhydGxq3ZJ4P28ctLvrW0gHM5KyUwF3RoFFJeXisrMsfr3ASHb/u/8G1M5xGsPGdr/5vPyryBIdPBgA6A/J/L7Mi0m4jgubYDvGalRNHDrZyDUcjzal4MznPrL+QoI9DiVP8GxUA9QiVlj1GyIwcfwVR8sdwqiuWuX7lTaScmK2Nb7gYohASqPqwZeyfJB2jZwxPmBC1X+zYLC1/h+A5LadgfTj81y7nXkrVCFi34pqCY8FWj/6HXaHSFvd5KUDxGZs1PPmNWnIG5N2Dg==
Received: from CH2PR14CA0023.namprd14.prod.outlook.com (2603:10b6:610:60::33)
 by PH3PPFD4406E430.namprd22.prod.outlook.com (2603:10b6:518:1::6cc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 13:01:26 +0000
Received: from BN5PEPF0004698C.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::8a) by CH2PR14CA0023.outlook.office365.com
 (2603:10b6:610:60::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:01:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN5PEPF0004698C.mail.protection.outlook.com (10.167.245.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:01:25 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 2622119249;
	Wed,  2 Sep 2026 16:01:22 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] ARM: dts: imx: bx50v3: ignore HDMI rxsense
Date: Wed,  2 Sep 2026 16:01:15 +0300
Message-ID: <20260902130117.2731-3-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260902130117.2731-1-ian.ray@gehealthcare.com>
References: <20260902130117.2731-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698C:EE_|PH3PPFD4406E430:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c94649c6-f4de-4d90-510b-08df08f24be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hxdDCUe+HN1kQ0ftHq9rjHzBCPl1PV7ZvxiBDfT2PlwPqoW5aTAg2gkVF6EmegHVJVXeMT7gSnZL8cOhKdD7B3h5PeqM+apR2TSt5Ji16T0rg8CbpzCM5PNPcFoCM/wFrVrn1YkyQfkwl8Urg+d0/dggyY2AUm6FTVGiKxlRDz8Vlz1ZvcBZf+rDovv+d8ZGIi3QtdRzG2iXiyII4egyTm6AAh2yRLtNYjMYyZ1WJQAVNPjAXNQINB0TM57IXCZm8iTYDvWAzgm6pACLEqXjHfbVvngBzSSq+RvDRbZoal49lTsQBn+pgin7CH1eVRFWA2CKakPdUPfDkDWIVhCissIHVQujD4MEjybkfoKZ2J5wXyLGGRTBDNC86f4TYM3uo9VyEc/GPuDvdnNysWS2UCggDw5Pv6lWB0CWnSYy9p4fAgMuZ26z8ogr04BmZpwg8xgtznYxF+meqEfMa2I8UOr+9E74ZTF+MFw/sf4hN1Iw7U23Ggsh1rJHzJfEVNkfLjdtCVzb0F6P06HVXEA4ITnk6KjNyIjnp5mfEI7/GaRjoL/Mh4VyVqbhHeMnS4CwU6AUSA5mx0khxryc/OR1vvi740Qe1JSzD3T6IMNTXfSLM8WbJEEUTOqCh1GBraT6cgm9df1x/CCHgkewdmh0eLjprxRX+A7/wQJHUdapkrmxpnyAsBPtAf7I9mpV+c+T8GOjS46KD6gV7Z2S1dhaDQ==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bEhXZbtZrz1s+CGqe1gC+jGnvlXY3uIbipzu7gIeYYOjBkGa1yS1JKE1uSDKxuHPk2VFlkN1JHOJXIl5ZLDJfpMtsSqvGTM71ghssKcCTNmDFmudAGlb7PCpkwyeFyavu6HP2C4q4XApWol92Xx62llDCFCl3ElHv/i+OVFyFAl69Mb2RjmVijTBhoK1C8osudzvPabXpmP1nTXRDLh449F8kl0MeO8UfiKwdB9ql+GHfaXwKL5l2UOXUXYi3u7EMRs3RhKlEBoa+QZZ8Xsn630kvcZnOeW/kafNts80lMHOcnAdaeQ6SC3YM9tTTrs5ThnJnaILhnvY1/rQfJUFB4eNrHo6aJ9U0/AnL+wpo3jhWMJcdbQhnDw+0ZJeiUQNrSnqwifnJc/lQQWZAc/0syv7PJewa07KmOw3AcA66WKj2OO0C55JbnYIjfRIZ9zw
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:01:25.6157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c94649c6-f4de-4d90-510b-08df08f24be3
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN5PEPF0004698C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD4406E430

HDMI is converted to DP in the B450, B650, and B850 boards; as such the
rxsense must be ignored for hotplug detect to work.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
index 2c8d2ab8cda1..8e129b1bdbbf 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
@@ -174,6 +174,11 @@ m25_eeprom: eeprom@0 {
 	};
 };
 
+&hdmi {
+	/* converted to DP using STDP2600 */
+	ignore-rxsense;
+};
+
 &i2c1 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-1 = <&pinctrl_i2c1_gpio>;
-- 
2.47.3

