Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9336388E46
	for <imx@lists.linux.dev>; Fri,  8 May 2026 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240506; cv=none; b=KHcfpoUZqP6IsMKTABQWqwQX3xMOFToBAA05z21isksNi7N6gN9TWu7CJLTyfSvJyZbPVEOMMu2GmYWMNYGqLAogaUQn+5FePDHf4rZoCPX4gxkIX3QrGnqlafEESj/1NLfDwbIM5RmmSF2Q+l432nkeW4xxpp1xb8R/3I3Sy/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240506; c=relaxed/simple;
	bh=32jODA13rVX71Zub9iZ9JION5MzYjUkv5FW4RsKBnds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ub7YVhYTxzVAwM3F4KVvZ/c0GGyWR9hvOkSvH1b43amSl890Pt97YgGZABbxv5qcSRwh9bKETcsI9p8rz48U8ROHvnFpREzUjOMbRPfL4RYjBnIDO4T5S8HbkAObtt7tQQLu06iXvPdZ6jKPsUMbsPCuPyvcz0ZX6BPCuCx+bkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdAfwAgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8pO5vnf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdAfwAgf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q8pO5vnf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486K6oZ1174056
	for <imx@lists.linux.dev>; Fri, 8 May 2026 11:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=; b=GdAfwAgffubA/UlP
	7ento7RCBt/jJNAUgbQYKFTwZ6YgH+zZeJbdKQt4o2LRJa5ZbjSanxgDjVo5p3ho
	O3Fibcf8v91Twa9Fi5YrAom1Z2MSQ+CJNYGKIMHkcgzeDOL01lbatcVZjGZ2k1lV
	5n29ZDDnahfpx65AOFv3OEtzAF7kf17ELITdUP3nzaR7VwEjxA0cr5hYOEfTQ+lJ
	MRdJdSSG7Ivj5CcoQO8/xsSPxjJYF3wKAwR7Pbn7Kw2JTSV4RDx10oQ29dS5h30r
	HwwmwXuB+qlZa3Bs+cv+z8AgPam7PM3FYAH4y4yzQbmufu0ItcY221RP2EKO2Oet
	JtmxCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132haq1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 08 May 2026 11:41:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ee1a909037so382801285a.3
        for <imx@lists.linux.dev>; Fri, 08 May 2026 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240503; x=1778845303; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=;
        b=Q8pO5vnfYf37Zuam8sJzlzi51Vxbwcb/qeAh4V9ShN/LXdDqnTiA3JWNV4cm25A1oI
         vnQIMTY7zKzQKDtW1n1cPc/nXSlVb3eWf+s95S6rVmpalLx0/srUewKc9TOnI7tMxO6n
         xSFjSblGrc0hsMdqF5XETi0Tv8F/CngRIiAgmelRjpE5DBUcmjLbt6AP8HUvx8A91qHA
         ka8gkdN6nWJE9+jzLPtEGsF+hJsCgvCzl2ZV0exTL1KqhSdAz0deLeLul7unEIVYgkGm
         Ui8Kjmq1aplFQc9FuF+sJtPIof4RN6icFdXT1TsmrUDKCBTPi8mSqkVzdG18N1i0txLR
         HWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240503; x=1778845303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=;
        b=oBlDQfpP/utGizgS9GarxkDQSZ8aYKobfss22C4CA+TLK4DnZdbwGOeQqq+eetd1Gz
         b2xQx4MFcg2H13D+Bk6lgeK+tStPJA3lc9VpmH6zsT2Aysd42htFyHubgv5pNy2AbJnz
         YRfkgmDq59aNbKDUZykha8nyhhzACXK/4h9Jrhs+j9PCVB7FH6dKUGi47JPrgee6wIuQ
         6TUr1+DRTzs39aKc1nOFVdMsPnNIvtsVSU0fuxdQeNK5K9EIK5YXJwKO6H3BLA/WnXlY
         jylk01OOX3E+amc/iqdd1XFs8sI21uWkpiiBBTqE74XncAr5NLxXMU+r1DMuwzAwVV+M
         SDbg==
X-Forwarded-Encrypted: i=1; AFNElJ8XCnmcWxpSW5s0y2/C07GlLFUmEymVsAnKl5wOULSoa2ab/As8z9XjejKd2jecvOK1Ck0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/82IAiUZPtRHsXOACOwxf4//MB69mC10TbDa0WDEKk9floNDa
	XWS3Q2mcnfWuIbT1ehHfgkJ1dy1DFMaNN7tKytcNXPmMcoJBsFnIYYtM0ijXlcWG1WOa43wEcpI
	oFiLDrUa2oAyY+GX1qEoTgBH1w8SRxQlyj4M2hkfSb93AR0JhTPDZydo=
X-Gm-Gg: AeBDietY8xj5OYsD76jdcasiVBQbLHHInbr0LRakxC8aEHc//re+GT9ZfVJ2qcDeg4/
	Na2vDmGPgaq/4+rvrM+d+L1bCcoMu07yByx2GQ8YTtrwdCx+c+xGSth+wubq3eqj3EE9AByFjzs
	1ODGPAqltK+nRS+727phtRPCmjOA23D7brG4zzpBLWy5Q68+HpBtPiob5+kSMjQsMAQIpg1Z1W1
	2tgdbzykWSF0q/JC+AhzI+3i0uakXUZCkmyuASErASexKKZQyvZ5vqERkOitvlTrtzCutijbtSZ
	e4BWkhMyolm25wcvY+xXvwRDeS6VIpodgzQKvgVz7nl8ke2re2vH7qnhrhyYxV9RVrlMYGiDW+2
	paRt4nCB+1Qdx9dqsnbLgVxNia7IzAOtR7QynbqkLcgvzs3b7TDCx0H2x1h97RxmwlT1q9U+nSw
	Q7Yv9pirWzFSecEpVPLwLXpFg=
X-Received: by 2002:a05:620a:408d:b0:8ee:30e:cb97 with SMTP id af79cd13be357-907b9674f78mr285703985a.21.1778240503050;
        Fri, 08 May 2026 04:41:43 -0700 (PDT)
X-Received: by 2002:a05:620a:408d:b0:8ee:30e:cb97 with SMTP id af79cd13be357-907b9674f78mr285698485a.21.1778240502612;
        Fri, 08 May 2026 04:41:42 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:42 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:02 +0800
Subject: [PATCH v2 6/7] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1119;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TIwiNaPtfGEt7M6lhlfidGbwYXL1gLP4Ebpm5LfFo1U=;
 b=j2xXh8saEgkacjWqHlWFnlm8eiG2Fo8yBQdInRz8Wor/E59qm4wk9Uu4mQ+9JxOMgl1DUPP3s
 +hAxpV2N4eyBKU1apy7polO2QWDqEgYhPEOF3Lao/DsaUEnCMw0WvTm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX0rZ32Zn3wpS7
 fYwapRemJDiNJ51ga8pR4/1ZAeZ40w+9EiwgZ/ODJYJ+SD3prdTDm2TlgkK5f5Aul7QyJry4dq2
 v9u+Z9cSo3iAQx10NIkwZyX8hKQD2y92LSPVfHE+WimgMbm9ZJ9UnuyPEkJYZaUYSsvwlbN568p
 xd6TIyT1f/jTvKJipQbIR2wXqLC0Ih7BsJlxD/j0CfCF5JTT7EgSQVFc8Ddmiw2cCnfiLiEFOSr
 oHW8vIB/cVxEnmjagR1flae4cD0XpEGuKJ6s1TyGRnV2xYyaJ1iq4rP4d1CMkgwJjguvJQmZYmv
 z72KmkrXU5hxL3fELgUqSWe05wdkZtBK3ykWTrgg4wLlG8mxk2g/MnQ3yZRnxVwiLma17OhU6H6
 Bc10i+RG0sbCNitF61XLzMsUDYBGmeC4fl++n+G1N4oyyqDa2gUZiTF01zsVDTL79o0Hpf6ISXX
 2ZHi5oaA7O9lldNZMwg==
X-Proofpoint-ORIG-GUID: l2bRZ29L8fOpPns6TeLAh8qx0eD-pDMW
X-Proofpoint-GUID: l2bRZ29L8fOpPns6TeLAh8qx0eD-pDMW
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fdcbf7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Qfmkza9QUpqA5zW9Gk0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080121

From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

Add pm8010 L4M regulator which is used by Camera I2C pull-up.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 9c5e77df0054763c8a1bc8de72e296f4efdf9c58..5c9fc0315f7dc125e3176dc4038ec655b7fc4018 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -376,6 +376,21 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	/* PM8010_M */
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &iris {

-- 
2.34.1

