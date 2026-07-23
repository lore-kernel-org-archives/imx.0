Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945313932E6
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 04:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781888; cv=none; b=VEcKbVRpvgIFa6CDP65s6EFP1e8C0Q3HFdDq6VhDHOdEhBeXgTDsFBPBqL/UwbUa51PIqJdmcRF9y16RKEzGT6X3HB/8JFM2nTzJ9GMhs862BEsTDIr6D2Imi9LtEv2y7P/6664QwjGWxE405UlB8bUoEk48/CeRS4b6kASIob0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781888; c=relaxed/simple;
	bh=zp1GXufqizR+5VEnn6BfS8arlJZLATjlbuLg+yCNhPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6QO8ew7HDjuT15v+bdzas8F1OO7rrVgHxdG3t4xL1J6hn6ED8EkivGfXq09EcnCVsqVuRu5gCxkm2iQVKY08qSG6mIKw69h6m5bI6QHKTRY+yeZ9/2edNSseQ3qeYYhJgk4O+/lUOML4dIRHXReauR7jMzLhebOW57u0CwAaA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBNC1nRO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rap5omu5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBNC1nRO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rap5omu5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WtYV2537764
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 04:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=; b=TBNC1nROiCH80PBP
	dKH1XXCDWeEj5ck3aIfOAEDUXyQW4A3eLzei8UeMNORT36rgJTyig4ioAuOJIasp
	wUlY4byea5Sg/Q0mh8BvnEYua5a+8JGGKHJLqZ0Ne039qluXAElKRUMe+5CCxdsj
	r2TbShV9m5cIKFAH0nGV+w0K3AErPxkGuaSRfOrTmBe88y2aqZc/Do2s+RIn4rec
	shEyg+RSij5KQoafvQPYAxQd3zqRrafEuc4IJe7+N6ZDRWBEHXIKKU3y9LF0VJEg
	d4l6EQuMCpzIXyqlxXcRFgKLgYcDkkiSkl7gY09gBcqiPQsa/6bjdEbsdkmJx5Jm
	y46DpQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc1dfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 04:44:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484b9fb055so622429b3a.0
        for <imx@lists.linux.dev>; Wed, 22 Jul 2026 21:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781878; x=1785386678; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=;
        b=Rap5omu5KkziA2LXEU3USp/bIU+ZzC3KBr1xcN8nQbtdpMSTG/jt8Zi7E9FY5mwRnf
         5EHv29FcP5LHPREDrIfe1xEFdE2pWije3ma0dFjNV/6eYBGKXp5kXLoc53TAB2PJwO8A
         Gr9EATQonhLJB3gAG3GTFBmBUTv53o4cBsJ+emk844xNXOMXsYljeoAmSYeMZ1/2IHhA
         Y0XLj10+aQNbnPYoZColIYjC0xljDebcguwv+nsbs+x4+eeXxgT/G5hx7walB/Oh1i07
         /K8BLs8ZW1cmQKorcYA2MzMs8eZRqxJzkxDY7VquTGVlLPrA/xxbwPlr4NQBzgxrRkv3
         +X6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781878; x=1785386678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=;
        b=acfMVItUNKu3o2/GODYJHB2zgtLZMsVtj5bcWrwrd/d+BCVWDpIt+lERHQbdnNh6AT
         OFmyyUewjmWaxb3rK1tmxPp94zPTFaw5wnMxGkrOSMEmXKAI0BzsHslTWyAJdlTiCRWP
         7Z5hAIE0czm9qkoNIZxz9t7TCfk39ZHOJAJLcwiuATCBsFyAGqbgNA59ydgJm6yd24iQ
         PErc4dbkWIZ7gKfcRsGuqe2GhStiOwHXhg42tEhhNHvN+TcDQU8ea7zkwv3zV89kzMY5
         vm8bHLwF2LHBJl+a5uQq7DSfpGunP1HTrR13/b3nFfmyLuGvzGbRAcCb5yZ6OqIxXpvz
         S7Ig==
X-Forwarded-Encrypted: i=1; AHgh+Rq3tZjiDZSP2DNM/xDlnqptkYEq6nB+5DajbSzpH1V1AJBXNGiAF3mfR4ighUqAg8jkh2U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxENqm5aoRkPPrgXgzJEO2SU9dOpUGQREwb/khnOkGROb4ePBpn
	lCmhbzTjLK+4aVMmTw4eS+jR/tVAQO9QYaKF+eVkxiq5OuOaXH2vZgAbIsF2VwNAVBYPd0NdicD
	GeHWu1s2TL0SrWOxpAI8xocO/SLv5gfz9D8pF/zl8+Q5uKyFgsgF5eXM=
X-Gm-Gg: AR+sD13DPvo1tJ+JLbGX3Fu4hPWQmOoUUgH8Dm8b3BhumQzV7dONDDfRY29oqfJbNy2
	pTKR8Z1PwRanDpJV4SoZmu4pgA9VVOMdQ7T2LFA0IT9OQUJ+O3GfqJVe5Blj6U7DYYFM71Nz4Rf
	6C7CcUuywFu538fDA+LKn1GSEEJn69XGdiCFZIotWb/GJgJNLd56jPV1xMxCG+A2HgWgL26aJ9E
	ay5GsLbjDNFoR4lfDEVwJFmSD76FcAhHB9lm56MhiyqCQRr/NcSgBgJ7O7qy1mniiXWijx3vJyN
	RKU1WUXQh2MFMeFpK6ovGTboffMKQv4RXvCM8zbvYJco5Qy5rTRQDIZsSUSiSP4wS8gFJe/AlXN
	wpO45Sq+FzWnQuZE1uFr7J3fIyVz+bmw=
X-Received: by 2002:a05:6a00:2918:b0:847:7f38:27ad with SMTP id d2e1a72fcca58-84e2c1e978cmr1885733b3a.53.1784781878429;
        Wed, 22 Jul 2026 21:44:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2918:b0:847:7f38:27ad with SMTP id d2e1a72fcca58-84e2c1e978cmr1885703b3a.53.1784781878031;
        Wed, 22 Jul 2026 21:44:38 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:37 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:58 +0530
Subject: [PATCH v6 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-4-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=zp1GXufqizR+5VEnn6BfS8arlJZLATjlbuLg+yCNhPE=;
 b=xoCCReuM9sWmw9kwbpJND8v84xB2buMxPsVSRf7mjtzpq3bfp9trleSKgaTamcnh56dc3gAFZ
 ogFomEK2UvCAtlL8vCc9kDfL9gV/aOlRgg+U5cxJSTwqio8CseL/pBR
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: _hxz3xmFEtR8cZpTkUav-E4NUf-8pJkh
X-Proofpoint-GUID: _hxz3xmFEtR8cZpTkUav-E4NUf-8pJkh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXwTI3ZmWDePQs
 +fKPTo6qjVZp6Ot62gzOwZckg4fH/6h7CRAp606FCR/1Fy+KAWEyAM5vEEiymBJGtj45pSStf5A
 K09m3zwUkPbyYZVf0rQ0HytT+Dj/BrE=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a619c37 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX+ilwGq3NyQUg
 BFSMWj0DWkrlBly2A3ZRD8NBX2T5x3wdchGtp5PWnJ2aTihXMVeY3adsfM0CgRw0kIZ0LfLdYt3
 YczRMTjJutnqhVLPGlUBS6ogwEY2DTqKNoou4S0m5QNUroJFEr6C90sbXENKbh7OhB6DmhxF5T2
 dmP9+hY9AIgtrr2sLuCMBgqaqW9gsQv7m9FEhKJDsXCq607WVxErTrxZ/7+dIEVql+7PRi9/Aku
 sUsBmivY6qFrkOSwoqhZBwn6H8wiITx52cyQoXfDHr2vTAZjLKMkUv2Rkmk1CHDuV8Pb6Z6qUnt
 tGgBLMevu5bHBZl4FzhUl1BQEFrcKzNlVInceHxnRL+AeKBZxEenVbPmbxhXvKnS2S5CEgePxNU
 RzW3qTevSAJGTvePdIcNyQbnfMu2bnt/edNE8uV++JgPVeM3yXUkJlUDIZvd3pjUC1+bqPR7+8x
 qSPPbGoAo/tUQnI4MpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230045

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 215ca0743d943dde71045c331f7cef6ee4d9e9d2..446141e4f45fbafc750f5b90e4bb67cace5c3031 100644
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

