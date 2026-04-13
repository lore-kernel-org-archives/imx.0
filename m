Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DF13AEF55
	for <imx@lists.linux.dev>; Mon, 13 Apr 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071251; cv=none; b=FMW89Gv3tBtgbwgLEaJzJN/63e62R9CDF0q2iqd1Tk8NGMBPKhFdZPpBPNskqBXzqlvXaSHKXxs1293MfXBzG4ec/gBDeoBQaTTAZQr9A3SQWKieyt6EWhcnMS9AB8yGqWeNuRN5+go0g/nOGuGSQu7qJJq1Cbpp0TIdFGhgb0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071251; c=relaxed/simple;
	bh=b1tENQvXY+F8W/xm3g4+DZZXahca+UgV07xvDpCrdHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zf480GpPuf9LPNt+m2N6nIGEIjy7ZWvGRgQjIq6VT0V0zTe3JUTqwl93ALvxT8vKExdoz913Nahh51DZyznQoag5qW/1ATF8u7MSqul5RDuSp1L9qcvJFM4Y10G5Vh0Qam9bl8AwULVNzZN9z0SvV0U81qW6cadMrJoF4nduB9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9KXiMLD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8L1vzri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9KXiMLD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8L1vzri"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6tVgI3446582
	for <imx@lists.linux.dev>; Mon, 13 Apr 2026 09:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bS4CAqLyyN3vhcD+LdVe9Ic1o3rAepHQ07P
	+f8uMLn8=; b=G9KXiMLD3IsO13FTdHHxr3afEcV3tesQP4+fGLFzwnK79WLH9TJ
	z6d0QgIjp2YiUG9vjG0v2mS17+o1toCL2c9Yy2iWZ75RG78lPOQ+/PdvjKxdqeib
	uAwHmBmPbaAhs9N76sZmVJMWmvALWHvgLIzrKquunVScEC//lIrWlk0qveE7zLpI
	XPPB3ILykMeMEP/BD+Ju4Tkk9sBJt1CuPslXvz6RWzTu5gwvrHQSXmm4ThJqIFvZ
	W2Xit5OEKWxt0lUgAodvPSXPszPQwST3DIpDiQD2Sw5k/eTIBMlRyA6PUXgfZ/+c
	60ha2IjnkZfABmIZrfVPc1dpTaod7ruEu5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpc9xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 13 Apr 2026 09:07:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b220c72bbso92781071cf.1
        for <imx@lists.linux.dev>; Mon, 13 Apr 2026 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071249; x=1776676049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bS4CAqLyyN3vhcD+LdVe9Ic1o3rAepHQ07P+f8uMLn8=;
        b=i8L1vzricG4e7uFPWYEr9IJFPfrE2WSSnFWAyLndybBbuyGtZUyR0VpN8GzJQNQj1B
         C2DXWeiFpo9Swo8nplugryatxTewxgH9VSdqwKryxSdywy4Qq8FhdHg7CnKTLvWmKZ49
         kgL4iMhnoDbUzsl7evzfcAK4B+iHZXJoJW1PEyP8NDXMkWmGtcWXLrSbsUKHLvGF/tlN
         D+SsFdkgeSXckhTfqkOU9Q/ntsN943+DD95dSXCCJ7vCTJaJO+3G2gX5CoBi5ilOekwp
         J6xwk2lme4sNwcMylYmbq/vnLZf4EP+ddtPP0Jbqd1HUaDA2ir8tH/HbluuGcH1ofWR+
         0D3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071249; x=1776676049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bS4CAqLyyN3vhcD+LdVe9Ic1o3rAepHQ07P+f8uMLn8=;
        b=BcTkeUyz6uA1Sa+cTBq3a+vWgtbrMKRbCIX22cKU8Sq3CUi/n4TWTxrCsmZYzsQmGj
         TZdVQMX517C8jXZxvf6yDA8lAFMTDXBsWaYWIWvplIEspWfdD9foXbdaISUOSxmBvi5X
         8H4nK1Eyqw50UeKK9/S4RZ8t0s15Pxu+btSKFWu5gIwYhdIXW/Q/2/7TsKHeYtg2cKk9
         1bYG3Ozld6KX0gmxqIIOfgfFsDwqQguZH9pE1uK0rJQQpZm0gUoS132waA4i1b3BJARC
         mkfSVBRCl9/8z/SzEyKT/t7PTUQrGrPtMWBHluAWSDr/5lNJ2o1X3jGJiciE15EoxZs2
         fO/w==
X-Forwarded-Encrypted: i=1; AFNElJ/dj3DWKlOFRliwm5yp+ktdTbJHbbOQYiInz8X4x895UpAeAKg1Acjg2TpOnIzYwzCEDFM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsVh8SRMHJq4jUTUtRYG+p5z4t3DybAvCNfUpyroPs0scgsIvO
	nviac1TQQ7KbzT+pcVeuv5aLGlVGKPLKNcp/Tom8pMiI5cUpb9MBmYx3U/r/c+I29sLv3w9aO3S
	b/62yzkutWewV5EEbEtKEV1EC6CRnMUOtbtQMnGmaAzLLLYIV+ZuDoRI=
X-Gm-Gg: AeBDievlmoD0EGl5ZnrZA3L95fOZJYPUZMY/fUKkBxE9nPM/Rj6b0pRrQrlbqlTx/n9
	S9RfxFGqZf9hXF8466cjkbge99UX4jkVs2i29E2JtRAsEe0gFr2pqDFPaMwzcYoc9M1ljfAaXDa
	lYfqou/ztg+iJP1QHBDnS/0xqH2JBBbnR7p0DM+8zyLWcM6RezjPO53ogGf+iV9IjKrQhUFpI87
	WznCDtJJKHEtKXQXDG+8hzsKKJwajB2lbVEMP48dZ+s2lDuUU+Akb0j5c3zBXEzmfjwRCNX1xTW
	hXqnOJk6bMJ6tgkYkCoV6tD+5P4QGs2l+DRcB+o9Cjvm5TZj+dBm8pjqDWREcdUZjpNZg2SBUzp
	SLHk5/TlC+rZwNPfaA2sdtgsRO2k7zHK5gIJX
X-Received: by 2002:ac8:5944:0:b0:509:211e:3624 with SMTP id d75a77b69052e-50dd5b15e8amr185842641cf.4.1776071248771;
        Mon, 13 Apr 2026 02:07:28 -0700 (PDT)
X-Received: by 2002:ac8:5944:0:b0:509:211e:3624 with SMTP id d75a77b69052e-50dd5b15e8amr185842301cf.4.1776071248352;
        Mon, 13 Apr 2026 02:07:28 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c98fsm30759347f8f.35.2026.04.13.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:07:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Xu Yang <xu.yang_2@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8ulp-evk: Correct Type-C int GPIO flags
Date: Mon, 13 Apr 2026 11:07:24 +0200
Message-ID: <20260413090723.53277-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=b1tENQvXY+F8W/xm3g4+DZZXahca+UgV07xvDpCrdHg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp3LJLy1g4Z3wLsTX9TEjDy5k3oRMGgxKGR72pO
 vd4nUJlFOaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadyySwAKCRDBN2bmhouD
 11ufD/9ZfBbErQA0qwmvgVga1ZWnncoEdQfgPmQ5Atvcd8AjusNJNHwI3JxEtW4603nVn215Wat
 sFBZ5kd/GbFG/fQy6AIBQjANCQKaCd7Iv54odcNpyoW3SDFeTDDImTfP8TNQZE/acMLO+yxVrdJ
 mppQKhxN9bUvlN0tvBA1xLoF1unBTLUONg5gRj9LA0N8TKaghrtY5sesJrLaqAj0INi2PurPF4Y
 Py7Czn7wu2B9CMUUN+UUnKVsh38kguO3FAgWrVZ0m0bah3VlXQQEbbbpsmvp1/BA7ioMZp4VY51
 yg7rYiMy0cdhO/52ohzD3odmMaTCYMLeH9vxogDPUAf0HsDLnyNQDZm8EMe9lOFQhdQdj136rIf
 b2YZQYEtt4QBjPUNOS2KucLApABH8lbbEC+jecObhc9vGanpi7oXlJQi/2bIOEauFyxCYEvSWGK
 LNgfXXMMO0dsnQyouIR3LZJLEZ13StW/7GWs1+lsuoQDpdQeJm69e0Bly/VJyRoX5KiRK04Pc4t
 UnA4SyICpw1YXR/7a+jFA1O7wWgvufkIBSrLEmYBzrAviVxEIVQuFmSHvHAmP9OLjlIAR/+j8cl
 zRFc7DV99va+L8jJZWfncZ8tkznxc6FCjf74hhFRensYTBrFHQS9d6N3JOD5kOkZredA3CkyFgA pPZvVLJdACruOkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dcb251 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7SNBkYlbXATC84MHoTAA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 859p2TULA6KAHFhWFEv1cvltnra9TpqQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX7XjhI4a/7Ghi
 d1voEI+co6wUcumS7JUE/lk0NBZmjFdTq+Ty4dTsUfgcjjjJA3Xk1JCQlmKzB4gpTmXOQEVmIGG
 fIyZlzpHfI9k73SXqEtk5g9CA+1UA8LLNYTezNjMx0HCZEaUbQY9JzvgrdE8gla1IYJuMQCt4ws
 Le7Fo6htZMPtJFomoiQ40HyScsuyPkvEWvYtHefpggzAh+nr4fQFjJsAPDWVn6Vd8aCicp4O6n9
 aX82psRhMtFfE9rH/D4tQhyB3l/2c/A/j209mwAQ8J/hpm24OLhxdc6nUz96i3ofhmxIvTmaOYt
 dlidqjhJrcACDpX8mwFIKjLznGlLLnGbTF+jzhxUbHuP5Mv45AMZSEFqCECziquuovx7nWVeUYX
 W3NTaIvPOoi3t7qJ1yWekG7z7FqbIL52/VP9IxdETxPiUjy2RRnuzK525kQtagrJkBEvzJMAEH8
 tR0BH3gFSKZiN2Q5Q4A==
X-Proofpoint-GUID: 859p2TULA6KAHFhWFEv1cvltnra9TpqQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088

IRQ_TYPE_xxx flags are not correct in the context of GPIO flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning: IRQ_TYPE_EDGE_FALLING = 2 = GPIO_SINGLE_ENDED.

Correct the Type-C int-gpios to use proper flags, assuming the author of
the code wanted similar logical behavior:

  IRQ_TYPE_EDGE_FALLING => GPIO_ACTIVE_LOW

Fixes: c4b4593ecb0b ("arm64: dts: imx8ulp-evk: enable usb nodes and add ptn5150 nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..5dea66c1e7aa 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -166,7 +166,7 @@ &lpi2c7 {
 	ptn5150_1: typec@1d {
 		compatible = "nxp,ptn5150";
 		reg = <0x1d>;
-		int-gpios = <&gpiof 3 IRQ_TYPE_EDGE_FALLING>;
+		int-gpios = <&gpiof 3 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_typec1>;
 		status = "disabled";
@@ -182,7 +182,7 @@ pcal6408: gpio@21 {
 	ptn5150_2: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
-		int-gpios = <&gpiof 5 IRQ_TYPE_EDGE_FALLING>;
+		int-gpios = <&gpiof 5 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_typec2>;
 		status = "disabled";
-- 
2.51.0

