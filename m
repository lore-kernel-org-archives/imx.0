Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB473C5853
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927654; cv=none; b=miP8VYC8Jdz0vh3fWNFJUTr0X7eAiptZfIE695ZJWAXNR55yNtnidSUH67VmTXAJtZw1PyY4NwkZkg1i4xE4vtGFsXsJ98/6Wu4n4fPp/uHX0vPanI4sGRfn+iyY5+bJO/rm9922fItwZqCBYjGq+ej9s150Yez0p9DSNOYomHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927654; c=relaxed/simple;
	bh=ycUtZD94R1/n0vpzgxAkoxJpZE6mj/5H3w0pL5YNCW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3BW/RGh8Sva/fm1zPhPrtxaRjqt1EVCQ+WXuvkAjnfDnKpjgBGLe9xZUAjXgKKYnZR089ZA8HTF8rR24Als+jtShdVsc8lzZDoDg9uQPFgNSSMTtkGgzmnA4E2p7zZ4yYOlilEIrOHroK5EQ0/2/RJE2E63gESXy5jWMAxMBYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnZntvAI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KAOdZn6e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnZntvAI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KAOdZn6e"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR4WN3336087
	for <imx@lists.linux.dev>; Mon, 8 Jun 2026 14:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=; b=CnZntvAIZQJCXCF1
	V+hFTzy9k2gmd1IQcKaptkh9SUwkVfMXIp7wRoWudquQkhvGuimw5O9kB1CCDrmb
	9wtJxrP8aex6lAEqk5vTKz1a2UeFBUbB6aoisGsqg60aH70uiXFaBCmwt1TfJN43
	bfjVtHV7XYHRv6m5aNQMo2uDQxaPpw641u82gfKlNNoZ2JhgNgUf2tdcWxo0luNO
	oX7l/TiALY30QSseazctqzbc2xi/m/jj+HmXCfCHiNqAhdcjc6GAElhalnjkvl3N
	onLTjCKsZI5w6cObXTo9WC44N/HP4ra3S7EEYzSMNq8ZL1BeVGAbsRUpuoWsy41Q
	DP6NyQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun411f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 08 Jun 2026 14:07:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0bf6904a6so61383585ad.1
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927652; x=1781532452; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=;
        b=KAOdZn6e2BPifnvWJC0UheGCMSE7UPLvhBZgtu9xQmDedVJkixPY5qkHvReqBWAEaS
         fFXDqk79EmZZP2g0sG7iIb68kjQcZIzwCpDz2kuNeEKDG48F+VQEDP4ED24rFTirjgRX
         IK+DbOisa9cG16ySLv+18fs0lqCTsbnwKaSiUGLBYq21wozVNsZaBICNAf/oHfhz/OIx
         OlimRXINdgM+XkrdJPYVtDMq0Slj7QTnVkHmfWJ8RMeZWAwql48eET/0kiRJUBUdMan8
         JpyTWfhepcgMEWvxjQYI7WX8CjyAy64pd+N43f2rgPgHObX0sj3+YsIAIMvMCDQvQi1A
         8FDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927652; x=1781532452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=;
        b=esfyiC0KmSYa789gqYZUfgnJ+u1SUhQQWrwr8gGKNw8PkKdwxgiSXXiVdcRAnhoAcv
         w7ilKyXcwjzETW23s6Cu7eypZ5MnG1p/TOnteXog1u6o3dZkzcGLon/WAIXmTzG2Luq6
         glWIMz9TWWeV5JZQJVpeXuEHwfELpoglOHMgzQSdJPJOB51cAETYpRvOg5BlTRTEJAEw
         UYrC3dCLyf5Yi7T93x65dhoPu1kduWeWTd7qCskPqb080OxZlNxajzVJtmEdbfZ8D+aA
         Adhb0eU65HovI+fMRE4yQi5nrS/fcsqIhH73b4R7lCnYNuqtumoCqHOq0reZpXuvt0GI
         lHkg==
X-Forwarded-Encrypted: i=1; AFNElJ+AgFUpvmDIqj7NRoq29fcTLverGA26eQXtdEL7jfRbIpdbwWLz5r/dS8FI3smarLHdFhE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7Fv4N48e9hrl2lmjVcUssi1ODSIPsQltZUIobVa9mevTgABMW
	IbwCiQw39if+Buq6jx3cv3frmZ6cvzJ3nvKuxaX35lVcHl8Nwyt7d72Q/SiHp/IAX2HAFmiYNjq
	gC7mp+opMOh8g2r3bnW7fOxQgru8n4p2rxBBeFKFE8U0YlnLTzQMzRrQ=
X-Gm-Gg: Acq92OGPgKlOD4N7DbwzP2VWQY/4NwqGYlqMnbAVPxzp65pb/Azltc8yKR0iH/2GdIj
	Np0pF/MDapuxDDkd4ZYJFkMUNxM5f473jPMKY4oL3RcY++PzyBsasjW8gB8NsoT5sH44VqgQQsA
	l++qpmylL7Nb/vnv0nc7A+wSjEz+l7hAP88F/yCO7v9eUsgSw9EbhDqd7DgDVBvOgvQDuovlBgD
	M5AKKj6lS1hf/23PmNcuFQEcS8D4LSGCyzN/nv1opvOapx+bxrVq0tSPmNoskyrDmTrgRVVN2tC
	uJJ6tlRaEyE9If/Ar9HLuoMYirae0bqWa2JlYaIYCJN03MX3uRuhIT6NDJQldaiM51hG9riD9If
	ttVjl3IXXnxDeg5KfFi94EkrxKuvgcB6npxd1j3bWqHFyfrUn6eYgSNWlWP9ZAdg=
X-Received: by 2002:a17:902:c94c:b0:2c2:33a4:aa8f with SMTP id d9443c01a7336-2c233a4ade9mr98641935ad.13.1780927652176;
        Mon, 08 Jun 2026 07:07:32 -0700 (PDT)
X-Received: by 2002:a17:902:c94c:b0:2c2:33a4:aa8f with SMTP id d9443c01a7336-2c233a4ade9mr98641525ad.13.1780927651705;
        Mon, 08 Jun 2026 07:07:31 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:31 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:42 +0530
Subject: [PATCH v2 5/7] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-5-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=1392;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ycUtZD94R1/n0vpzgxAkoxJpZE6mj/5H3w0pL5YNCW4=;
 b=1cRNlukU2nfxNsqQpCxEMOWi8oORFoQw1ad5ofMs+sOgQWnHyRAYleyfD6cQ6PgGOlOqRWLLR
 N9AZrqsh6gSBbtWxqnF2lIZigMvXTar0tQAvvLRUF+EXwNfg9WIwrMT
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX++SX2wblS65/
 ukZkVr7z+WqpTJojTJJ8JVzOvtIMe/rVN6ENYQvf0wnpMnXLqU8qaZYnDXH86pSD5Yp+R8mifmN
 2B0yFa9QZcesNttnOMZzcYO88nU8Je5pTF1bvPHU9dCIidL+F95dp9ern56SWZh99ZemhLjl7Qz
 uLYxtbbIfLYtXCBaxU1CgF0cM/1wEYCRIBf/35sLbbI2t/jbl0zu0mPGHzm++Nj1C2YndLk/RCe
 pqgIiQEy93/aQR9+mbRSPOoFl7NyoJ/pYnvFqsHY3fKzrYXO6C//LBUfbMHgKYjOETT6vQwaYJB
 /hq+iSYEy5vUNuF7kD+uTozbUbNEpxkKB5K70d6SJ5efSjj/Z8BOYW+KjYZdi2hNS5bmXDAVauU
 f7ckCSQWDEJjbFRLXr6kZSO03Buw2/p8kbQe0hwaUAbDLZb+HKw7Bt2Ybcy3Yae+7mnVN71kyDA
 cWHTytNnF9P0yzayDag==
X-Proofpoint-ORIG-GUID: NERRnipodiHb1zwwsxtlb6JTZ86XeKGt
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26cca4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8fHhTolRNNEGZtKOGWoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: NERRnipodiHb1zwwsxtlb6JTZ86XeKGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133

Add pinctrl configuration for the four available camera master clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index fed71131491ebf6e261bfcd14b5d4a2624837878..2f0f7710c2897e140495afd8d4e8bde50f356096 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";

-- 
2.34.1

