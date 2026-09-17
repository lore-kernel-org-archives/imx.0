Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD314DAFA9
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645299; cv=none; b=rcJ75HXsVLZCjI5OLM86jccdlkepvqF2fKlnHRQlPLsLIuBKpSf4rSsQ7oHxQSScF0uYN/v1zhIAQf9uEt1JZMUoHTFE48xz0S/itCodbpcsbVJKq9g7gK6YDUh2XuWWc+bXxJJtFgOUMV4ED9qgf8T7ItjEU3WbWcwtygVPKbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645299; c=relaxed/simple;
	bh=C29tX4FRzcgmif33GVTX6zsYFWffRjwZBgWZudoP01E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ppBzyFib/gU/+HtrjvoMqpHwCsEDL83QJYNnHE1vk6hoKHp45IYzoEp57VebpWwhaHSFjXTAfWBnvyWahC0KsQWqHtCEZITAo4ig2G2AEQi/lha20XF/sqqcJsjOs+bYketTtK9Qv1JWyrBv7M2DY5Hksr5naWYJRKsMhfMiAT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oSF2AOlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRoYMK9w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oSF2AOlt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRoYMK9w"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zl791150749
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 11:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=; b=oSF2AOlti7hnaEUl
	LJjZ64ooCgg7CcQyHp/1SHBViXqUX+LluPxpeO4mmUG8ERXc3Ip3Bp9ym8RsxXv5
	GOXXSLffY8WROWMpm/i+BiLsWbIeLXTJmVUm8TRZ+GUugDJuHrp1D526/GzxpLCQ
	TP0qNT6KB0fKIkAahjEhxF6AKfhRDN9IBbMa8SQZMBAvj2nKoWoLlpJR04vAkdB5
	nQCDZn1TL+XAGOeU3fkbbAskT700o/G84WwXlDG0DXAqkJfsoDYq8e+WyJBzckCl
	ZGL/p33x5byVp7kRf/Ezb3qgUbZUQ3BUd3EdincEYhOIQY81KmGaHh2eNCe+arMl
	EEmG5w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w8vh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 11:41:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a43fc3527so1038315b3a.1
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645295; x=1790250095; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=;
        b=hRoYMK9wCIMuZYSpt4jBfy1VLai4SKeGVlTScIuYvouBCqVYmRbQdgE/3bnPHvQk4M
         g89MV4vwJ4pC9Xw1ltc8pVNlR5NAQbJALaXXc3qz54916DuLJM+QnkXppzU20aDvSb1k
         hjdFGdAutM9RfFmavCb8IxKPicmINk2cyGyVp26XVbMMhQrDCAJoTsBr7vCqXAa20xq2
         J0f80UiTMe14GixpclwhkRAok5t2sQIi8AnbwupA1ezwMle8/JPTx4DviWDxikoa9QpN
         HBSlFP7wsEjwCHQWGR2xj9GIuW1dGjNHegfsEvhWEzjerNrWXqmQ10RU4DGOP/zXPbaD
         yR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645295; x=1790250095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=;
        b=jXmjcuEsgOQ+gwLnMEn/3RlIhzFlz+QRuXePF1K0X014MI8yYMe+FSCVIh7UumcsTr
         LrE7bO3cxKt86wAO96sZC2zwZx5GL6wJwTMhBRhceOn9N3R7RpRuM1Z8xIMfRNRgNEuu
         bdS5VXntR8foY1AzUWpkJ9YNt/09uIhSQ85hrfwIFzmA1ZM+t5E6TxQGKFBCsdWllvR2
         F3gmxELHu5LPCeOFztZjaEy/gHldh3f+qEWPAKvcc+OvClNeq6jP//orV0Y4RA+dRm/3
         pAyc8cUh7WK6RMFuBDCSQzRqkbevsLUkFFRBzpY5HGP+svNG6A60vdiYbo6w8+6jl1Cs
         Y6wA==
X-Forwarded-Encrypted: i=1; AKwUvBwjZ9xFvhdoxCqEsBFBAryIqG3NYHpjwyucwwYbmE3XfO2mY6K92+39IaNv2Xhe9DBeokY=@lists.linux.dev
X-Gm-Message-State: AFuF++li3w3M/K/4AI+p1ifskoKWAANpMhGwZvS5MkkMp/d2XVux2QWR
	Gwc4BCyC1GoHv/56J35UOCnMo+e7jKc46VluJ5oaBRFwWDsXzZcOYvWKpv2O34+c7gsxf/58hvj
	l/LhoGkVhWhNYYg/fpjMoE2cYrz3OKM8pKwAd9mslt1yDGAG5kTmfIaU=
X-Gm-Gg: AYBFou29AHwHTZn0xzFhz1TbLKMiKNLIDECjlFsBCJunX8FjzJPs0W0qN5q2fOsL3ok
	T+UkLvS7VwEJjmS3AVZBRBQFXLdNqORxczGvl2UUb7KIgXBcGy908T1EQ9QwGT4uQFzOSrgQWQf
	5QTeTAfmi4u9bSMdPZmOyC9f02uu+j8NoZO9PjQNYhkRq0QGMFVlxpgG6WVogJnuY/PT6ORpW74
	2OggCM7N09n8c0Mr6hjqme3J7weeVLRf9AZQmtbbIZrQHo1h8zMHNN4TxnjdPgfBG9Rj4Jzvesk
	nnDScHDIbcpqx6zus1bhoxYzcabj6jTZOWO75yFtQIifNYjk2kchB+8LFCeeeO3Z8WHLmbHh8Dw
	X9+ZMliUgNtt81C63r7BrFeUUHF+ODw==
X-Received: by 2002:a05:6a20:d528:b0:3db:131b:8d8 with SMTP id adf61e73a8af0-3dd72665d28mr5070592637.14.1789645295174;
        Thu, 17 Sep 2026 04:41:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:d528:b0:3db:131b:8d8 with SMTP id adf61e73a8af0-3dd72665d28mr5070531637.14.1789645294657;
        Thu, 17 Sep 2026 04:41:34 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:34 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:02 +0530
Subject: [PATCH v8 3/5] arm64: dts: qcom: shikra: Add mclks pin
 configuration for Shikra
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=C29tX4FRzcgmif33GVTX6zsYFWffRjwZBgWZudoP01E=;
 b=+ThXIethSpr4dc1t7AXKnXGlk8O7tt/aAN7e5eHJMwBsFjAbYHKM0hdc9zbVJy/q9yDhXgnYz
 NN02I8qmQYJBSrtIlA6mpaV2cl2V2LH1in1X7AwS42iGACGyt9ozb2L
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXxkuACeMpPcEX
 oUi55r1VTC82JE7Sy+cLuuFplqdhokbKA4WsSZ0AGUQMtR8HoGfP0N6R2BrMcfqFFzmqtBrAQSg
 /BuEaTFt2QpdDUlEaevIyFXXbMcB79ZttznP0lJuCYR8Bio7ctTqjwfUVQNq+du4cotrH6o4atW
 4mOUFhRN+pdBHZpGnfo8QNTRT+Rz/WWM79FB/mfC/6sTmkXT0TZRHQU1XXxLxmnE4DrM4NoWmls
 dxIAlTOYJ87ed6yDM5ok606MfSImuX/YoYVZxXvCBKfGP58qwPFFaC0ZxrVAJQvXaw+f/TKpAfa
 /c6GGQl8KcXuHDgnurtBeAaKOCSe3CZVCtNxhVQY/2X817M1ggVLIyM+ke/5p01YaiOhU1d8tbo
 Sn+42u5QVO/NDRwVYyT12iGuCpvJJ1Xv2qJgxK9WyJzP7IeA/j/Mh5uwCzZ8Q4QVSAYbkNxIl0b
 xpkw/aw1J4BIp03Okgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX+p8HrCGS+jMp
 1QXYp5nj59vpGWppgMpqAyUPuxuHfjhkm41M8QLoJl3rk3HCTzFDUkuHbcE2Uv4FbkhF5BnxW3W
 TYyknYLXyoFQRspINh8m2lD3AgHzzfQ=
X-Proofpoint-GUID: OwESP3BQiZgnr5RpotwJtcfzPDEMlFak
X-Proofpoint-ORIG-GUID: OwESP3BQiZgnr5RpotwJtcfzPDEMlFak
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aabd1f0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170162

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 5f64b4e50967d61846b7b0c565380a58e4ba3210..682f2c933c3ae76282cc399f8bcaeac3a3cdd654 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -924,6 +924,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
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

