Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41BA476691
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938010; cv=none; b=n7qWGGVXiw8x6ETnaK+Ruj/LXTSMjMU/qdpMIzSAtNPM8gD8IXlS190KAGATN5+nDyYIfz/BInOtXSDNpgQbFT6xfL6ttBbia6U+07Tn6/FiRfxQ/HyK5JF1ew7M817rEZKgZt88/B8xLXu4YT+eV0y5RdDtlLFMRcBRw/v9t1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938010; c=relaxed/simple;
	bh=zqWW9GqLxAuICtzSU1LCZ2LuTRVM2uyQw6HFZppsKLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ky1k3eNTZfgx6Ds584TkorKNetSXAoLzFP56LXelZ+db5vpVvEDGlz/cjnV9rixtsxr/tMAbqjoN++th1wQVRUFOdOijzWA8k2l1FBerEavfgaoXMxSj+KeT62JBcies5GZVj4wCQAfKUekKpv0TIO0JqKowX9T/G1QFdkTfVfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7/MkG6k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK8Ikw3t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7/MkG6k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK8Ikw3t"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DHD692986572
	for <imx@lists.linux.dev>; Wed, 5 Aug 2026 13:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHDj9TXQt02YxQEnRTeluEmHbttgGScQD7kszwd7H0k=; b=W7/MkG6k5UsOh7ek
	7+SSXXYUmQNFbCVzzXSKPlG9dQ5shyQcbHAgrOg/WAG0jB3R1RqVL7xhYtndF7QA
	27DIenOEhF6awF4PD6DA3zcfpwkM5Vtd0+AUoEivnlkTTg4unq90Zl1hMeRDcu2z
	ScBpZfbYMO8qhdGd2cnOlgW6RD8RuBQjYL5CF4NhJrn5ZFBsJDnTXr740Pa9AP1A
	lPFCojZePVTPXb8T9Zhg2w36tMQ0oDwzubAvZfzTnGCA3kfPwQvpEzgoyiIHHBtU
	JSqkq4JPxlDyRx6dtaXjROGOMTn+87eH9T98211PNKnuGAMOpTKHH5sexVrAuALb
	wHgTNQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5r5pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 05 Aug 2026 13:53:27 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e6ae12b42so14160927b3.0
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 06:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785938007; x=1786542807; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHDj9TXQt02YxQEnRTeluEmHbttgGScQD7kszwd7H0k=;
        b=VK8Ikw3toAseWo7dY2fKRH56cfW3rGD2UE19fyFEWlPTWnLyZtCSueTulST+KqVYe0
         ZVDdWCkYGDeczyMeAou1d9OdYuGdghAQpFGgTvr36GPb9SzrdsV20IRO+OoRqfKIdWqK
         yjopEYBLrw9QN+CodWFHT8b0JYWI2eFniCYR5po7dDd7ubcqIJT/5rU2+1n7Wpd0I+ho
         wA5zxV/i62Gz4NHsjBz2jFMZJh2plc9pHWmQXZBdrjMN7WQ8mgmNZL7GRjy+HE+5Y8TE
         YxTa74LYF8szeSMkV7M0sXUdZCh4UEzd6oTL8RpLFWIWRXtgjnBtkLAoC11RiLNlKi83
         iOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938007; x=1786542807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHDj9TXQt02YxQEnRTeluEmHbttgGScQD7kszwd7H0k=;
        b=kl6AJmmj1T0buZI8HuPR4oCb51mhA0xkfMTaBSFpZ0YCHvsMirTQ6PfCl+157PgGJS
         nZUCWVKJ8eJnYi+l4gqnHBokOaLcfOElCd/TRcVkl7/leXaN4kw7dbKqPdxv4oKEep0p
         UOd3vSrWfAyLXi7wI+ZLCPMztydCUDNA834lBaNmDVvt3SBksCyYeoxXOIV/sUxVEJHw
         D3X4rkSfT4aPNC5aXfC1vXVCem+J3STBY8MasFsQb5YCXEd3IdS44ofysOFQMXAw3TDn
         cPSVHdvDqktCa3dXBYbFkSc5bM/MOJBX+5b/+6J0LLomWGE8sHOxwOFE4DE1UokyIY8G
         +VYA==
X-Forwarded-Encrypted: i=1; AHgh+RrAiPa+kYSWgKgZ5BJkTsCP087xii/RU3zZ4U1FMBBWTw/88COjEBPyLw9/RYHcordo/Nc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwcN/kl8GkE0y2BPuSNHhrSSaBDA+13LBeL/YYVxZs4igjou83
	7O4ReOgRoe57K30ZxaRcGErXgSN/cO1UQD0saJvFs9AumYZgql+fhU2vMnLyAvq2Yh6STOiOaHn
	RkaNZyc5xGuXhuNVAXRHLHikmtDkDjgQdMAwaQ6lhTIM3I8TCCiVwWR4=
X-Gm-Gg: AR+sD10CakAfs8bdhbVAEm579hDqO3/8u2Ga+Z+eqfTjiFlQradgmewaqvnA8ytYM7s
	PSO2efcdQIz3uMX/NxzosUM0TFnClDOMM7K5ikGqjitkkmRyFVxT67WAWT+9yX1csZhcgt5LQRy
	S8S+oQ779a0Yal9i/YD6tLklSw2Y4X0OFI5QeGTKYHLrnvg5nIXA9j+uT8otl5LgBFvrh3AXOxh
	uwx0AcpqkHmY2qwYgygiGUOlFpBXjWR/VAyQqU4Al+Kw/ipdcWPhGa+7KX0Ner2UOjVqncp4rkX
	oKmYqV2MxKN6Bx7d6UdOA0z09+T1+GAfqoafFkBaULSi1FSAVdSoHr9YlT1HBWJIWlph93/tHFK
	H0+AZkIjfClKa4BTwn2CbWQhpKeMDwxY=
X-Received: by 2002:a05:690c:4b86:b0:7db:a109:f12f with SMTP id 00721157ae682-8201bc73833mr37282577b3.1.1785938007004;
        Wed, 05 Aug 2026 06:53:27 -0700 (PDT)
X-Received: by 2002:a05:690c:4b86:b0:7db:a109:f12f with SMTP id 00721157ae682-8201bc73833mr37282077b3.1.1785938006455;
        Wed, 05 Aug 2026 06:53:26 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:26 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 19:22:48 +0530
Subject: [PATCH RESEND v6 3/5] arm64: dts: qcom: shikra: Add pin
 configuration for mclks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-shikra-camss-review-v6-3-a8dbc66f0d87@oss.qualcomm.com>
References: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
In-Reply-To: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=zqWW9GqLxAuICtzSU1LCZ2LuTRVM2uyQw6HFZppsKLA=;
 b=sPuLgU939muF7lwZr37xaWm5GG4BsPu9vMW9m34ozfu+Pq6sMHMdoRAxVeqnsYL+ofo7mtjLA
 8q1T7zV8HxTDVId9Gns+28i2uGBlQRNdE1/TRBXtuXIsyXP+kmGawY0
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: taQ1YNPqapuG21AYW6BRevHYITMklcg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX3j+flJxv3yhV
 o+LZFoMrdOt72w3qAJ7xAzrLipkuuf1C2RmLooAhOSNxUGgyMDN6x32cpyvZGqoJubsPFBE+hsf
 cVXGMkvGM9a9pXxGzpI4EK5rZqX8N4eB1eZRn8wCHFYCEa4xdGyM3neukFaPIlkruaxDh+y4VZY
 Dac/0Yz4W3i9GKXjFHwD/FkXr8/dBHlt6S8vrgQvHxc+4wMphOimEP9kbXnCnTOHl2IiRIk2ZiS
 5QtPb+jfB7oveKU7e+TeFjENNGGOCK5kKe+494SKw/3+Em7LYqEBF+lP+BrW1WjCZ15JLaeQ/Ze
 QeCAj863fapS6drvroClBCIlXXoYoNW6DDONGwSyKFJWhYm96J2SjYbz5kApUT5z78b24JLOwnR
 E4e2+aw2VVQPmGCTDGR8mMqXRXklT8d5YmXC21Yhi/jNK2atL/Y2ctrhcgBQLIy7j8lT0pBDb/l
 Ht/zl4zi4r/pj8AmDNg==
X-Proofpoint-ORIG-GUID: taQ1YNPqapuG21AYW6BRevHYITMklcg3
X-Authority-Analysis: v=2.4 cv=RcygzVtv c=1 sm=1 tr=0 ts=6a734057 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfXy9TILbUGR91R
 RZzKFfmTMFzUKbJPAulQvKFxLawawp06ORwGTlHvg52MY5BNQtQIoCqBMUyOXoJ142ySR/+l0HR
 NEVcRdCwX/QN2SDKTXYc/4l01+7LJyY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050112

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index ddfcfb137bb29439ce20ba6ebf3a76693792b56c..c6839aa2349f397b041f3201b8a33fa90e36c77f 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -387,6 +387,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
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
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1

