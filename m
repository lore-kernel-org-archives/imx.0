Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3161403E90
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815627; cv=none; b=L3sd/G8hnDhuE/krybG4QRJZuQPGioanMPvhSQaV0tuPcTiPwidPsuvQVWj2Dm5vEMYbggO5mx0m4RxEVL4/HUWT5FqmAX7Z/UuegNdUfWzS20rqUUbpWn5OpE5NcFVf3rB3LEjsc05eI0niH6+k+nh7j3hha+1wxpOFoAX786s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815627; c=relaxed/simple;
	bh=rNQVM20UUvgudFA/i6n3y1WsCxjVAxnVn14FXEO7CqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IC++G/+EeB3iWyRBBci0iFkAIP8orXZNwr+FwwazgeU67oSAQ0+HUN3xDknFv77bddjbkTAv8jUZxBAV315VSly4QWfrvX3qL0wDIadwflL4krpzrdU169quvopAHs1b1VeICMY/WFi8N+jlOMeQGPg4qUjRMnGPPmXTA9gsOHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEpLz8Si; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eejTyNfW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEpLz8Si";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eejTyNfW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH18CN3086582
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=; b=aEpLz8Si6+oGEx/e
	94nD1w4n3U/F1YKkmZ+bjrBcSs00ROga91Gs6ak/4IwKMhIPvN7uTvyEv74lLbko
	T2VRWTyyzE2amMz5ojCcfn+yRMf1jlE7vDrAUs3A5Bw1xYIiL4djmiyHbpKaaeKD
	Q54hOxZSbrIaHk40GxCz+uhdkLVnfzoOFMO7SkIwDYCdEzwvuVUiYxf61tEerfyx
	R8FYioriVa7PU8LnLaWEiydgMBOtLJaEaNiA/JyDpuj3othiOWBJdtx4H2oI52cS
	n4c+3jfeoMUw2wQAvH50k63aawjEY0ActGAJ10HjoMeqNJIcEHbfBNbNJnR6hDYR
	63d9Ag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edeff0e61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc7f9b2213so78762215ad.0
        for <imx@lists.linux.dev>; Tue, 26 May 2026 10:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815622; x=1780420422; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=;
        b=eejTyNfWsJNIhpG67soR4CiY6wwe6tnUYUlTGcslxn4Pih4iQqOj2xZswKpORyzFEK
         HtgMBVZWLjRnskRYdxIK0uaCo2Rd/MlfVkpwNEq14SH5zRcz2k4lHp6Uajj4jzT00lvR
         B/PdxX2HcJB70kA7vqmGShJd8LARhnHOorNaPKSmKLuxx0Hs69tgXgs9Sg2/5KZQK6+v
         f7uaouKMZiehxlMvtQ+lnpJUwyxuT2cPkP3Tt53u2CEzzwu3zHYv10MCqXGLk8CzkZvQ
         zoRke8MRzj/wmuUS9awsFdG2fsO0WIljBM84ZgReZES8meb2jbgSmQev/pOaOt98fDNC
         h7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815622; x=1780420422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=;
        b=XtWC+s5ubb6agsn3Rgoo0RK6vXl/qQFkSwP7B3KhB2E5ukmHi3cAWdrgPWL2xylHlY
         YBj1WKmrFn9r1HJrMxcIIDd/Q3NvO9JL6V4Wy3+IJlzRRFkbESW5OdXGMrcppnQ7mZ92
         7om0GIFG61eZRt7Af6hxeqm+Qh76Pis76b1L94CsjkxDS+ya9aga3D9Q07yIW3pK+mTL
         XfG7yDm3CYn7cLjC+CMghz98PQmzHGS3IVWI7ggrIZNDVlvH9YuOHd9evlvuTK7dYP3c
         rCGvK0U0MkKWmaZOAHvbkld2gGfbwJMZzS/fE1uEE/5e8lxKgKMwbo+bPenJRXdD1PXx
         8lFg==
X-Forwarded-Encrypted: i=1; AFNElJ/y0cdM6Dp5GawImuQ/G4zseBwWpqWcvjnT4yAYyKmYyjlXVRo2ZBVpM6PD4xCGzY1+0tY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyN1V6YPfV6nn+l+JKNhxTaX/O+4jCVF03O57bi8Lh9J/8dji6E
	VhbuRN0OteqOAKMwrtwW98VRbNSVo94XLfK4N5XQiWCdm2kqRygBnu1163dqcyvQylpfJ0NW0XG
	BeWw0YzVrY1PljUlSfhZlOCyLSFa6MyyasSBYr8CSLtVu/Ikd8ZUe5sE=
X-Gm-Gg: Acq92OEQOeCoSdjKhXqQuhPH/fy1m53tOTuitaEpPGBmz1RMLCHv9DiXLQcTXZGPR/w
	kKAJ8maoA8uVNGj8UOkB/g6lGSqRm8Ur6l6uTjVX37P4MGOW39kHEjTUF5hvjl/v3a+h9DeMvW8
	5KYCqJQLdahI54hucFPLmqNA29bUW4/0L9yx50I08er85QOKoqy6CKB5eihckaxvypJQycNNhvt
	v1tVC+Yv+0qrubO9psI6CRZEqU4iXQNMh3QCSnOZdsP3lyMawE6XQSv1fso7rxQ9eyIkOFc+Gal
	oluhalk+QRrcMLip627pnYvdL5He6XkNSQNpIt8J+f9hDWj+2zKy4wCDCBVWL6h9WMbVpBafJBE
	0x2DmKxI6HzO5S8nUA3tsi1kxZpJ2OZduKPyqKrJ4Vc59wNBZNNu4
X-Received: by 2002:a05:6a20:244d:b0:3a2:d79c:415c with SMTP id adf61e73a8af0-3b328fde9edmr19895563637.47.1779815621724;
        Tue, 26 May 2026 10:13:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:3a2:d79c:415c with SMTP id adf61e73a8af0-3b328fde9edmr19895511637.47.1779815621220;
        Tue, 26 May 2026 10:13:41 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:40 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:50 +0530
Subject: [PATCH 6/8] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-6-645d2c8c75a7@qti.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a15d4c6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8fHhTolRNNEGZtKOGWoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Ul2zxi0yD6nR7ZDW_C0iyRnnVGHwuBIH
X-Proofpoint-GUID: Ul2zxi0yD6nR7ZDW_C0iyRnnVGHwuBIH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX797+R1D8/BtK
 dhhihEnUes8dgCkHs6wDgzRph/icRgCaZuf0Au6JsHwgc0wMydD7mLghEab8w0Rj/cC3qhtjdQH
 2Fz+zwVVx9J3jikm7/TW16f0ms3jHVHsKEXB+9jU7UF1uF2FIz2TbGIfrpgxj93nKpLoYlmSwCi
 eufTwprxzx6UjUZLyMAx7AUtNdWW696LzXIwAhdzWgcCENr8pUySlgO9/OnkcHNqx1YP6Y+BR7s
 55J+6Gs5/oTW7yC5pUEXl+I/1+kj6Yk7VEE1LWZn0qmqRA5565JEGxkh5FZw5GrGGhJNd0Fs7ma
 dI7SsN+O1DNRInNOBvXgMAklmhEUv+fCQIQAvmwe/uunWlD0GaP5hVbPd3bJamwmFG1LlYsBxGX
 WBQoNSU+yzeuUj8C9a9nJ1yQtOynMVgc9LHwd7qY+CsXsv08Td0SBjefbqXCEOoaMh38vtxjiMg
 xtzxGVDb8BAUOpMWryQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149

Add pinctrl configuration for the four available camera master clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 46de35971f629ded990827ebd76134e652758ce3..3fdb0c45d17880f1c1c6b90ee6e91b154e313738 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			mclk0_default: mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk1_default: mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk2_default: mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk3_default: mclk3-default-state {
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

