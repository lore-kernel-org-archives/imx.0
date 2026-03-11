Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF63C3E0C6E
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245307; cv=none; b=gcriK5HbcAF0WWyRF1i+E1rT8Us9CeJBG3v8jvwussmWVXq34PEZ+1B2r4BvcyKXnTVJlmOd1j9ybbApX8hwPPSNK6ZXfbY19/BfGmwzpET1EvAMLMbj7gUaXJLfAZapZWgvjzx1aauAFVsfpbrSqZ4SbWejJJlvfn0AFXsNHrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245307; c=relaxed/simple;
	bh=JwRzNt4B6EnGT7UaefAGI7rGsOlsfOONVNQNtf8/iIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hReTpot8ejPOAClLeOvRKRreq8B2p8j1uJ9exLDb8VM/GHCB5E9VqZjRpyoxy8UTqjZBOBf9pdOadywN5wEomRLAA38wqJ9w+MBVSpIKmEwmURJ/iDAo5P4zgPftZip/rA7z49leJPYqVB6tvf5ue9284O/oYmdFlf8f0lIroIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktwEc8LP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cAsW2Iv4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktwEc8LP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cAsW2Iv4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BBIYGZ2677070
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yCDmbAZx5fR0Oyd/mH7xT0WBu69Jhfu7+1RKrHRONVo=; b=ktwEc8LPImY8+HAV
	xng+4HQkaBvKlgA5ZhhjHcv6pXlox6laU6yRfFCtGWC+bR06dW+cNf4NjwZQFN52
	Gi9poDbJYJQ/Gqn07r83C2XkoodZ8zD1S93lk9VbhX6TBIgVc61wf7vhnMTyaC13
	Yk832f1AQ4zp48upEdySMhsdJX9XQl47a0P2bVHNcBHrP+RUAA8aCuJP4YbJn/8U
	+6++f0hRuhJUl/uP0T1jrGedUCSrP5n1i9uZ1TrqIFDqgmK5FzDSgqqtLIOb05SY
	wXHHxfFgoFs57AlnIluuNrwp+MXMfNkLGayBOoq+qIphPXn30eI13ExnCKA15Jdn
	8LY6Tg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd25rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6003c120943so100317137.2
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245300; x=1773850100; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCDmbAZx5fR0Oyd/mH7xT0WBu69Jhfu7+1RKrHRONVo=;
        b=cAsW2Iv463HTH9A8bw2Sz9On5JYR22r0+rHb0J2jYZrojEPSVnwN8iMLaqymbpSomJ
         x9x7dGakC25HrRepVwumgoMDonxaDCKz316xZORaVN8euEpdgJTool9mOIkXE4r/avMf
         t3g1BTago4knhZ4l58Zia0nnZ5z6ocbnF27t+AN4xtfTOjfTbiTLAEaDRmoqaSvHvmT2
         JofciVsvtsm0Qest3OYw6MFb/ousdF0Gog7YKQRO60y5iY4+kdMgUwBaT0u5Bh25YWsm
         YW36cpQUDKIEeOhaY0jBiIGJL+XoA249oPmv1/Qmsew3CiL7dqsau/6UHA/CaqmHzkf2
         fi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245300; x=1773850100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yCDmbAZx5fR0Oyd/mH7xT0WBu69Jhfu7+1RKrHRONVo=;
        b=Fjw5FdEol6I1KH2b/ihQYxz1g5OSuAQqBQWlgWr7snxzaxjOUWB9REiIvLE3fUgP1k
         H76z39J0Yulbv/w/c0YC2lJHCyWH8Ylkr/sQwNKTMvAcpM1OBpPXdPQgHU/S0g1qs4kn
         ccwlfsLVo+U3k6FoXX5CyKcHQamhQ2ORQrq1rJNaxiruNsi6bS20olSe0Guq8rBhdgdL
         vbJv/bZHYA85ExXRZoAkRSm/Sl6OvXqVpUJkNs4+7tFnwN1JyzDEGq37EJONXx9fXwHO
         tu/JCycc/2JhMLSev2n+i2ijW2g2GMTzCxHdBBFvSLccXA33y7djqlZFX0PebZL03n0q
         Ve1g==
X-Forwarded-Encrypted: i=1; AJvYcCWURqK0Bbapc5SazjIhoEkz4wATi/clIGIfCSKfJklo1zRcmz9fVl5jOi6RjloJHRIA4e8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpIp3hkUQtFiipkqs1uuwvBZ226zIAn87ffnTmN4HGeTJXUbNL
	Nv207jHJirqymJzLO0W+6OCF2+TDsfZH5d88VGBPnvXbifELoZCdrAn1MnwusRX7IWJB45lO8r/
	BjvgrRj92IBykYZEFk8uPEbrH0LtBPSsGnwMZgEW421CCZgCRzCFAy1k=
X-Gm-Gg: ATEYQzzaU6zffJddeX91DEX2vFKcbAO/Ul9mEeNmKRvjvcId7+ijgNdyYpJ8LTiZC+9
	dEGCw143Ged7otrxwsFsWnFDxwmzhZVHqm+fp21qyEjMH1LQlt7ML1byIVGa2dZYtMVs3zNTq8C
	Hs2g6dCPxfMrd96LnpjPwwQQOaQlnio1jR5rQ2ACkVtDn8wpQBQBrj5nD7DsUH99p227Ta/aWGj
	+agpYEWnwHEqXXkd+xByGwl86PGMkAVJiO7cGrxnQe5/UJ9aI9DmDzYFe943uu5Jvp2fMc9Sdyx
	ecLYxA/8APZY4bCK2nanw2ISPXt4Jbz+To1WDmg0IVdJg0uZbVkxfA40tVR3oeLM9HgRiaDMNfL
	rzc0KkOk2BGBtGghRkm09fvqD8bbPiTOuDwHSX1u6XbJT
X-Received: by 2002:a05:6102:c0a:b0:600:39ed:f113 with SMTP id ada2fe7eead31-601df056388mr1247480137.40.1773245300463;
        Wed, 11 Mar 2026 09:08:20 -0700 (PDT)
X-Received: by 2002:a05:6102:c0a:b0:600:39ed:f113 with SMTP id ada2fe7eead31-601df056388mr1247451137.40.1773245300001;
        Wed, 11 Mar 2026 09:08:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:07:58 +0100
Subject: [PATCH 02/12] ARM: dts: imx6q: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-2-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5737;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JwRzNt4B6EnGT7UaefAGI7rGsOlsfOONVNQNtf8/iIY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNgXbB0rc0LAl1KHwoXaPRCd9wa59WNWaNHo
 QouztkHfiSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTYAAKCRDBN2bmhouD
 18n8D/4lnfhN0WnY9brTWfS7Qsf92DAXRokN0KBw3Wm1t/rPCiNgG/F+a1mb1WLopZZwORD2Pz9
 D9rBQ9fqNATVwP3H8PM9GGpt/aC29+q36p4rjiK1FBy3CqWejFAy/drest8yHocr9q5BmZzQkkz
 VXppN3lycPEpyG1QT4DBIR6QET8KL8+kHEpi/1LjhWPirSrZZbUnWAiB0c+ltR1ZjvZD538wFGo
 J6n8EZhoM2W2m7fTkz64AJYZkJTavIIPusTEHLfNt3UzFOMNP1ert4aeJkBL7k04OQnRSS6LKeX
 mKW+/t5sxX6oQeRb68VrtYcGNwhHRAw+KJJiwrQNAAlbtD8/j9nmVvyf3VJ5bxwL+0B18BC4x2t
 oM/of7qpT371mvTZYEMWgd8NxvIy5v3o4+AFcsdtrK8qYDqZ/UvnJ57bwDzjkiqoC6U1NVKh+xR
 DdNPekiKxCm07kJgQmT+BfutuIK4y5TMy1rOUt8i/n/vdWw6Jc9tPhqSlBYl2zmxULXv2pX7NLf
 40I8MwifTnUwcotDQUxH2g512FVShd2QkL5IJMyS5vJwPRnRA4ith3XMXtfcwqnNKc+Ko3fsaJ8
 n1/j7s+Wh4byOl+a11ccRciK28uJ0dgVwTTGhtw+gjTmHC+7lDYqHyvVfj98q6ChQ+8fpQVDwVW
 0PA5EEYkyCbx3nQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfXwXbFML/cl+El
 Gwtjv1HfICR5aU6rDyiSkMM3s6DyIle8QOhtBIYTNvXjWXBalWOiRg9JzzFacMnIhkQ9a3IA/QJ
 RIxiJbF67q9lea2tH0DIs/JYhObgxScBTaW5+lVqORgiR1jqz7nQzkUBrOEDSRbNl/RYLDGb6Bd
 tcLVleagDs+F2Z4QTlgjkddpT497LMZys3j6V3HrDm0Z9WSIwcJRuLvbqknu4kJLYtUtVnjyKPB
 Dn14qIyE/tWNea8YEe7Jvx5lyHMNgpfMFJNzBuo0BvtZ1/RBh1d/SlPWjhtTxgE+Xobxbb/IH1m
 3BAqZVLiW+uQZeAkXoeWll44eO+nAxgnn6MjpODpppbbsRpOXwkgkvDIU6vEct0d8pfl71tmpTr
 E9mVo//tTMBq/p7hZyl1SiJJXxx53/E1Lg/+ZRzVOQdIQEWTX2YzUVSS9KSWXzUPYmLiJ0zV+hW
 5Z4oveWLcx1XlbRu3QQ==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b19375 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ABxXHdBjjovioIR3KOcA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 2GxqKF1iZhc0wTmfm-KaqkuVl3nKXGqc
X-Proofpoint-ORIG-GUID: 2GxqKF1iZhc0wTmfm-KaqkuVl3nKXGqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110136

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi             | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts           | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
index b6c45ad3f430..a1b1348e1070 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
@@ -55,7 +55,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	/* active-high meaning opposite of regular PERST# active-low polarity */
-	reset-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	reset-gpio-active-high;
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 3ac7a4501620..8eff41bb32b2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -146,7 +146,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	/* active-high meaning opposite of regular PERST# active-low polarity */
-	reset-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	reset-gpio-active-high;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index f338be435277..64285501e086 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -93,7 +93,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	/* active-high meaning opposite of regular PERST# active-low polarity */
-	reset-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	reset-gpio-active-high;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
index 02d66523668d..7de8cf7804d1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
@@ -344,7 +344,7 @@ rtc@32 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	fsl,tx-swing-full = <103>;
 	fsl,tx-swing-low = <103>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
index 13245af8f74d..ff6c16b9a1dd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
@@ -468,7 +468,7 @@ MX6QDL_PAD_SD1_DAT3__SD1_DATA3	0x17071
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 26 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_power_on_gpio>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
index cbe580dec182..5a3783d8f15c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
@@ -425,7 +425,7 @@ MX6QDL_PAD_SD4_DAT7__SD4_DATA7		0x17059
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 8 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 8 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
index bf8fde9cb38d..e9a4b9f8015a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
@@ -330,7 +330,7 @@ &ldb {
 };
 
 &pcie {
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
index 24fc3ff1c70c..0cd0443b9df5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
@@ -459,7 +459,7 @@ lvds-channel@0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie_novena>;
-	reset-gpio = <&gpio3 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 29 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts b/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
index 3bd0e2c9e57a..fbd1dc6f6414 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
@@ -174,7 +174,7 @@ rtc: rtc@68 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 

-- 
2.51.0

