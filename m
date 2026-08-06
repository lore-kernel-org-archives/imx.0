Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0005E471D0C
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016647; cv=none; b=AncJ53wbyqx6BBF7ZUWQb6h01KGBjyuWRtoS7lAvujDdckY46GOsQECmIvVG7D3CdypPSbQ5KcuYukSV4tKe1hj7oTlJxwxg67jRZFZyez7y3dC2Wo12JBxKnjWDq2rx6XjUR60oBrzfwEJ81Ngp1nAMppwNYPORutQRJyaER48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016647; c=relaxed/simple;
	bh=BsfY/RscSrIjGVNJpro8koyU58IFtSj27D+QRreyTuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sQA1oAamp5LelVgbLlNfq9q0tOTrdZJISPzw8XiJBX5aOYQ5jOQxUUi1A7ReQO0Jt95A1SiBYOd316xhIdmpmaTuTA8Idcc/ZX8IaODH4Cu3VfbkR+bydfJCedhjnNf09VuNSoWrDeFfpeRgZIWCUjnxLyKngRXcQRfMAZZQ4M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8I2/bok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0bls156; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8I2/bok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0bls156"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ncGX1580548
	for <imx@lists.linux.dev>; Thu, 6 Aug 2026 11:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=; b=X8I2/bokvg579Grg
	p6iuuu3t9iiXVg7qF/WMUz3MvGU4h7/kgvBGacekChzws2uwQu/EuzQ9VLy6G8UG
	fUvfcT67dtVpfKfM1NP5FvPf2cU4KBZOE/0uEBqluL0z+3gGiKpUz+/28qJBE7dl
	q5iLcsnFS+o1+fUhGvKHhvXveG32kJ0LSvx8GmV0OPK0sg1o9Nfl+ZU2xqdIgc31
	i4+V/tskd1n5JH8aACgNTBEtlY0lCS85c4U228t3G32cavEc/Rxg1RWyxHPE2+j6
	bXsGCFASl49rVwk+4yNxBoDT0Fd2gZqbwstf3h/fk/n51OZVUS5ZjbVe/ojZ9aMU
	/DwfgA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjhexf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 06 Aug 2026 11:44:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848860def2cso2493292b3a.2
        for <imx@lists.linux.dev>; Thu, 06 Aug 2026 04:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016644; x=1786621444; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=;
        b=h0bls156FRPhJIVhVdKDXrPMZoV42G/XBGv4uFu+pX0RCOjBFf5NFKWzomT/qZg1Rt
         bBbWdPSytoRxB6BaFHqVQR9Qj1mVb/DQ7vkPg0ERNlhvtZfCfaxwjjj4zEhv6sbEP6++
         EMcNk/VhQnyylAVfBmVHG+fDxzXa+ewOFNKWJDRZaW1wnO9ycZeIdiQ6J+gl5I6QIboX
         7gcxqAC4sHhJiLEyGH6lIrkGAChj7sq6q86OItQYyYoD98z3DWza7RuSuWK5FMej4/U+
         5325qryUkadkhkLzhgnQm2Bh1O1sT6TnOFaNHE4vjplEd71fMZ6as6rzbrcYmB5ZBvuh
         R6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016644; x=1786621444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=;
        b=hYWzjFTrOh33Ty8rdiRBCJX1Ct1n+l27UI9YhkO6X3NAJdZ3ykG0jwxy0BCmE2bffn
         2hMDnPfo8ln3wRTx3T5RTtO0+vWktP0oUP5sURFHB1CTW7bErXop4WAc/irOwPxUkKUT
         Q2E9WPKK21EmEIieQnnUCMIiebMndiqeNVIYVA2nW/8wmFPspAAkKJLnF9VHYkDZ11W3
         t7iNbAatjT6wgHIq6qKn07lZTbQaROTl44PWyH26qVwtx260HWLVRXb55SuJpLfb57jF
         gRhY8zYn504nUXUiVdPDAh9byJ5PokwQAAh9o91L+Mz8xV3nM+pl86JN/XxD5TpPPwh6
         imYA==
X-Forwarded-Encrypted: i=1; AHgh+RqIwC7lrqxdllK1Ss03PSlMFwBeF15lH9xsSymSJstIPta9vwmFB/RtrtbOoFUy46BATXI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk+z/PR71z1+IOE6JJ/L2v3At3ewuSHCl9bhIb+G1rhQlbonPY
	H2pOTSMYFrDgBOw2Ldwel5OH7vtu5MvWc34uh4fZgAAsMqb9DM/tvi85yD1RwTUDp35ljE0X5Ik
	gPPFFFHF7ee9qaBCBtbXje9XsIvB60yGFFdMOxmI2uV+vtOCZJD/L72Q=
X-Gm-Gg: AR+sD11qDwz2HrhXBG1Dp4ZWDJpvN1wb3bTrY9BS+xw/bHStm4Ftr84iLqmtg7/nJrX
	hserDXBLkGJ9s/sCEbb8fCZLO9v0sC0H0h5OolLKZyGLhxpJDgS0zBMOIUVeZJpzl4GskAXT7sW
	bNEPQSD+lDXQRcsJZahV6xwBaCRRPN1OUh/HvZtn757p3ZYlmV0M7CdcF51GKLLgRmVAj1/RnZN
	h4yUMUsneOjGnTNXxpfDy+fnfKTfXnhB93bRr97D1p3TwIaQVY8ndgWQc92HAhIS/TTCJojA8Ua
	cp2qHlaOtmNQDp11/K2n9YiEs+yezTzkYCVziRs+oZxkEufkAi+zCCcY1Dy5LJLmyYvTFS4oI+E
	Cpr2vHCic0ncvoIMBjrk1TbjQydXvnUw=
X-Received: by 2002:a05:6a00:a1f:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84f2e04a630mr15131058b3a.19.1786016643810;
        Thu, 06 Aug 2026 04:44:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:a1f:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84f2e04a630mr15130998b3a.19.1786016643390;
        Thu, 06 Aug 2026 04:44:03 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:44:03 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 17:13:28 +0530
Subject: [PATCH v7 3/5] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-shikra-camss-review-v7-3-c7360fd6a5ac@oss.qualcomm.com>
References: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
In-Reply-To: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BsfY/RscSrIjGVNJpro8koyU58IFtSj27D+QRreyTuE=;
 b=5iO8ro9F0y5HaNuqHqy2tlRv6TBHqL2SHdP2suiPVV+hF8RhV/0nGXdaOKPtwXGRmfsPDDos9
 UzjC301rQpYBgNf/2I7PodACkZnHELG4/yUPGlSJmdb+3CNA3S897gg
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a747384 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Qg98mde2AAGi0kAX5uWvgumete56Riwx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfXxkTrT13RsBJf
 fUCbcFlVvZANRAGo+g5sOGkJ6WnHWgamGh+LaP5KJLAuZrEIMAEBBt0LTKLlH2gyJGmQrHA9qcZ
 ZytEeeDXaYeu73rxoGyqKxKVDjbne5o=
X-Proofpoint-GUID: Qg98mde2AAGi0kAX5uWvgumete56Riwx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX6iwXdiD+O+g9
 wOwUfRnm0XmhNDq3SgLIEZ0OEaXFS3/EBZfLCA8w7gEOD25+bmJ61emvBCrsoNqY0cZwBqtG5p/
 ZlBepwPf9KzksTfi/w/PLXJNXFSVQe9YwlZ9GLbmK26lap7Q+ONYTowe8TS6F4mePUwv1DWskpU
 VealnID+yxicGUyRMPHr464TVyMCsZodW9vQRID6TH8v23kQU5M6AfhAO0hXrz48JTgoiJ2fMR/
 0lX3QteIwZ7Qv6M2/ZqomrPc3I4tJhoaCIOc/4V1DvvStGAi204MsiJscrdIFPs/bK5gxWH6Tp2
 MIkD/nxcvImIaueTRKfvZoeq6XPMqm0BUkt6fa1Xq5xI4PL8OhZkjeXoy3yjB7uTFXM8cTiRWq6
 ovUYbCNu7dT5M1nxZKIxCdMIkS09uefIZVkDeEXGO8FVi+KDpev1/eexPjrEQkdychleo2BFndK
 Np/LStDykpbaqOgqU6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060092

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index ce5887b9b1d4a186fe967779b9615ab4e4727ff8..661eca4ba85eb83f776278a6750cb969a409c974 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -827,6 +827,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
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

