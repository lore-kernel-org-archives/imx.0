Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BF5408039
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815622; cv=none; b=tRXcpGA/Xt/n0zngz7cvfTCXbt27xb/0jKWlRuYkXfsBg9lLNo4ZMAcqzEFC2TBkO1YF5hIODHJKWwQXbGA2mT5qNtAE1AcfMV5mnZ99T/4BjmPlWBwd3Pb1oy1/JKV8ILmewx/uTI/2k+xnk7by9FZdG88wpfSYPraZiFnllTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815622; c=relaxed/simple;
	bh=sB1CH5fqfkvydQKUGQkQAAWvvAtcksY1vgaxmjxAO3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7LJpU2useiN6kB6W0U+epL+OnTMflRHtdnRkLyDDrj9Fj5938HAEaSIyokhwgrOQaJeGCv8n3KKDWaWmxEU+NMrvS9fMWi5qIA4tt1rzM9/31+evMx2uiw6UUI7qcUsVAwDO05C22vmKzAwCTT9zhwjaOvUNvLdBI9iH+WOCvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ie5Ycloo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOZ26Xs3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ie5Ycloo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOZ26Xs3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1dWQ069496
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=; b=Ie5YclooSa+2jjm+
	azDNWrWUux0GlIlJQMFIR2ueQrGqWRhIVaTDWjADBXdx99tdFq7EK5gZlUDT0BJd
	kehYR9JUwXNRi3S79lpV9uG06MSYShkJDdW789uCs4ew8ltvPxf+CK/H47GWR/UD
	gybrQBqbJVJtCGnLlUvA2muzqFi1nzrGAY4zuSrM40cXmqQ1EgkbIrd1y7s0b6a1
	6AkIIq3G+JjnpCT3TD4WEt93mNQsHvzDw5bjovGiAOaBdXvT9rtBFexVWCSXUyKZ
	gg0M+HnEDegjbsDorfS3H1ieWPWjyV7woA45JLja91RCii46p1L5j4JOw2J/vm1z
	8ePCrA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2yhabk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353df9bc7eso10694879b3a.2
        for <imx@lists.linux.dev>; Tue, 26 May 2026 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815614; x=1780420414; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=;
        b=dOZ26Xs3AUNVkeICJfoZlrEbHeUdbnxjxddo+7G6BcWu6StNzEgUBJhHN9cMA8n5qA
         pMMzFU4roldLJgRMS3Oi5c1QOusxUMrhefccGIszaDp7tBTnAFhpBxF+4DSD+hs+DAsH
         UMWV5DnKWcLSeqUfYuHCJRXcMnVaPjj7n2PRMHOEjyZvSoFGIRh5ZUo8lrd0HihGa+sc
         qo8GomU630svKdG4Qu7DMhudp4q+zcVOSotwVF7wnHhOtfusrW35vc4skfqd4MjnRJco
         6z+WXaJPvATetB+EzlxMUkAWUsXvqaduFwyjhPNuCfRmMmZJ7Te82eWViaHDCC3nkVRi
         wjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815614; x=1780420414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=;
        b=XFQiwsuC/ehiTVJr8yGP7xVxxkfRo81k2Dkb4qrzyqViCol+ikHoHtekzyJHfUIgvD
         NB/lxLiceWuM63H8n0jEyB40L0gvL1lxu4Ada4aZFCF8imA9getrUYOwfaHSu0vg0Kv9
         ykyfYroxZkmtQ/ciTidQxzyIkl9lGtZ2ye+dkaqsdFayDMz4Yei55oz+68AM6+URJ7t4
         sBhQF5NwB9hXGUy5pTmqyRKp0eSjvHADBMdVAUh5hsw+cWBAEVorcer7ryMbmW1FciZK
         j78Mr+iSsgMwrkCjMQOVVBcN0mEo4KSeMwgn5xN6GI7DfrVAE6Dj/aBnI0aGgGsdcgGv
         1k4g==
X-Forwarded-Encrypted: i=1; AFNElJ/1tABtpuVIfwS9IVO/Bc+fmNLc3U/SWEAoZ/4DmTey2kuaYOU4xbH8V7vTNMRQCIPeJHs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6gsTZ9aGrDx/EaJnZPnuQC/x9yzlnn3f8syXvqTPbaH4BGcTu
	mwcqlZom2Y+4/idYI2qe0d+ub0t9Myq1en+Z0KMWzLh2IXQpKXd04C/YY+qYdZpdkimb2p3J6xn
	6qysq3jJ5F3qTZHLx6xaeoidnm/nQ52qaExQlgT7Sq4EtBUl9Ie1qaxM=
X-Gm-Gg: Acq92OHcbxlnchz2UmA4iBcKlj1iWbHPN2iH6F5IbFa9P3hsWIb1EYEruDIFpQiHrQi
	K16p2dMf0VyHogUL7soeQ1Cakwpn/aXGZ5dyYG2l94gan6GHDa1X+yctcbKEdzjFruBvyzAolLi
	V3v3nFAHs9KC9mgIyxwTKTRFXcmrpn5VvTpxfuHAWvSbvX3MPMykND9KYqd09zswt+OSdXr9njp
	BmgzWDoxuDWPLlfRz1ILAB3FzZfZgHSapSeryz+zTkJ4f2Z5fCXoUImH3EavkikaHZiX1xq8iNm
	F61bqjQPdjnlS8RPyrifklS3SLe1oC11o/AOvVbxTWkhuWXGrTlJL9pjyADrp0LT2DJba4SK1gS
	8hA2FRwKtHADt0pQ55LW+IT1v3BVdedTT0gTaEprRYX5fyuJpIPRA
X-Received: by 2002:a05:6a00:ac8a:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-8415f158babmr19801921b3a.12.1779815614347;
        Tue, 26 May 2026 10:13:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8a:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-8415f158babmr19801887b3a.12.1779815613876;
        Tue, 26 May 2026 10:13:33 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:33 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:49 +0530
Subject: [PATCH 5/8] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-5-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 5yrAZ4ulkeLvvdm3b_ZaHYWTlkO_Z_bX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfXyUCnNyWp09uN
 PwGek8NpF0qobDYYtvh0maSsSGLsKSYLARAhYD32GypLNl6hAX+yfZA/CEMacAcZdBmsYUd4lx0
 dae5csr56VaIuQUXv5DCh2aGa5E5YDWWKUoLKfiIdWtzB9RkNAwb85ughPA62PhFUn67g89A3dY
 /jYgKLC3RdXbE1asUhrxc0HbG2QcUWRyiWy5Fk9pfddIbGcmJ/ELj1pKCD4kW2rzbd1fctavvkw
 MzncrXpK2ZC0ERJbTyDsbw/AJDyYIX/eiln27lZERdIeZQGTJ34W7Op37o7ouUA0F1xoWCvx9HW
 xjbakXt8Wq7M+SRuVtWsrNkLeWJSFFyYNbLLP9JAypPksea9wTaqNAq7+DyFDcb32/kAI8Dsm1J
 shVgLtqX16HLt1oDenBjBDpgMRq3NXIeG36/Y7PZFGvBH7gKWajzYn1SRD5AgozDSiUp1flaZpP
 dQpgasud/boa27q/pUA==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a15d4bf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XuEftVTFR-VjiOTT8WQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 5yrAZ4ulkeLvvdm3b_ZaHYWTlkO_Z_bX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 6c47cf2a7ef26b4bb7d7f642a240b435cf5208d8..46de35971f629ded990827ebd76134e652758ce3 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
 			gpio-ranges = <&tlmm 0 0 165>;
 			wakeup-parent = <&mpm>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";
@@ -701,6 +733,44 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+		};
+
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		qupv3_0: geniqup@4ac0000 {

-- 
2.34.1

