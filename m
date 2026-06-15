Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5FB3BBA1A
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507577; cv=none; b=BBoMSrcaIIpi9ki+DAvP3RbQE4OwZpba8GKssw5kHMbtDTpJ6iRDJ/I3BvqotTCeSKysKK/SVZVTlA1O266laUpFAMiCrjb1lwDzlp3mszHncb0rETDpACWDOIKLaBL1dAzNObWQwCC3r3PE9h821zpsiVJkahFY/pIwq3PlH7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507577; c=relaxed/simple;
	bh=FD/YYzeYflttpFETR8KNzzuysuLGEKsTDke9rdJBgPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d64UV6wWIkTVvBbDPnUE/jqdq1ourxIlGhOvc3eQ26YiRpORp7TSl1f3tKqZ+NorkfnpUQh8a8jnSTMaedEtRHVJHzQIFF3BanYiUe2BZtzgRS7TVikQeZmB1SRk9qtMAA1MSOhQpa2jJIeCTANGX6f/mvPuqtol32bUSzZh/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iemi6Q5S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8FmeVkM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iemi6Q5S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8FmeVkM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KvMi3828173
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=; b=Iemi6Q5S+B1d3D4z
	UlUHeB+3DZ8h0eKj3YCeH7Yjx4D0c1CsTmaPKtLow2aucdVz+8W41Ps+o3+94PQZ
	r/fjqlSOOOO356AiNKX7wGDD3QUwERwZp4CAQwtXyZOqDoRKj/aHyKJpyoAULFDz
	9XM4dKtQPrzHu/1OsNRQDCipJc9yzwTkVqJF+PkgWQlTCdMGMrH2eQqKuSRAn6YT
	IgQZWPNPBiLPnSAkAq4V0ZxC7BcRyg8TRnm57cjVMAWBRws6M0gxClWZu/EY3v1b
	Tl1oeMopQqlL/Cb4wdCnXoRnyW08DEb5lvmCOsXXVv5nI60AMU8Ocyru1HEvmmdw
	uENgqw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u64d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:12:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b982ec338so3185279a91.0
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 00:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507574; x=1782112374; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=Z8FmeVkMKGUaFqfj85YzYzkmhUYMkEsQmxIo69S7WjLk9mz77Ap3JWJ45Dy3e1uEjh
         EVm54lgz12+LphXzb8b2+H2BvSWCNCgh8UP5TN6+ECP6GUwSi+VkF4d8SHYvM3R184PG
         0ljixjHyeyPyaWJhB8Jzo5PkBuB55i1Ukvxkdp9dHkm0uUa/gp3W1ecByCOm56inDWeZ
         ADW5nN9FztqiIXHgaTpP25FrvvRZCeqKWpmrwdC7isC2PBTnXmqWup8HRE1UzGiCRqYl
         vtrmRTgj7fnCsBwEEcxPbyhWz0mwrXxo9CJgJkmBu/jxAnAfxoYKcYwQu4TmZNSQmfAC
         HJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507574; x=1782112374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=gVgCuHLC15l9R0uFC8X6CzOpZzG2hDnEMYtzpnIRhj6dgIjw3KsK2IA5z4llFjetLU
         f3q4Byg0jrAU9fQpclYmWrsfBitWFgG5REtcitSlMCnNfI5gK0hzW+YdgTRSftZEbsX0
         aICjCvib9KiTVBHnFE1Mri+ObOLnraycVxQfbvMpcw4Fd06CdkaYiADMit9fmjmLA72r
         bmaRNDTemR3Dox03PLyhShatdqNb42cMWi6IPRL6Y3BjhWyqTNg85Iuql0DIZC9vvX0Q
         bn7FhGiHyvPyEWQA6s5YRE1OfYexhtA7dSGLFYTuckWfRYxeCJ0+CrOL4jB7gZAzhp/0
         4Z1g==
X-Forwarded-Encrypted: i=1; AFNElJ+soFIHI3q8/vs+RRMKc02MoHdT2mUEA+5YY6SCXneEzls3AgkccvBHneVTEnNiWLavRxQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNOD6oH5SYDyG4TOGBO39ED8vcDuZ7KFYvDogbeFh/kmKNa3p5
	m478RkiwSnhUBnH6LnvAF5HqwT2+jp8VfwCJLB5dQX3WMxDGQzqb8EonI+hiq5+b4ppDe2HxOxt
	P8bB8lUXLzVvy5qQzwbKttkhZrnnDkvWhLuh7iFLoZLv2GdXDVWOw+9k=
X-Gm-Gg: Acq92OF5HHCVJdycsxtyFwYkcDbb/v+uK3Qt4BFx6Acb5Sq7kTl0zhKuik3627tQ4lV
	FfepAtaJH3JTQ4Kd7yIowmU2LeJupBdl9IFVpN4MJIM7t/tFKgrd0hYH1lINGjm6oxCuZ7RK/SM
	ZS1YJbki19Uoh7ayjRYIb3kyymYUzFBNP/zswNVm9bHDt5tuQpsk/p9agu6KgNe81Rw2dxz1t12
	oNaRqQV3ZAO9uEfq5Puy5bHyjXGjNFjLUE9I78GBt5HLXTSQMzGcysAUURMmUDjBxAQ39icfdaR
	k7DRdigZRFZ+4/TXm5lP42Mq5XRej9ubI5pyRNsLp36LouVFwM0hTQwn52LNk8XPDsj9QyTUMAd
	F9/lwnYEq0fXc50+gIlaxYo+/P7T6g4hqFpiR6LqOvHJvGF6uF+dn
X-Received: by 2002:a17:90b:1c09:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-37a03ebe902mr12846050a91.21.1781507573923;
        Mon, 15 Jun 2026 00:12:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1c09:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-37a03ebe902mr12846012a91.21.1781507573427;
        Mon, 15 Jun 2026 00:12:53 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:12:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:13 +0530
Subject: [PATCH v3 2/6] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-2-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=3937;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=FD/YYzeYflttpFETR8KNzzuysuLGEKsTDke9rdJBgPs=;
 b=jcVZCP4apBgm09J+irO0tk1USXAmLXj/HWvbeobqVoyNCmVhZiorPB1J0WVNlRDLgp6ed+K43
 229TT5//GvtAKt3puMJbFWAriZwG18b0AiWjEqIl/DiiyBe76O/CtoE
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2fa5f7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WLx4pDztGoblVvuDBDy6P6olT4HjZ5UR
X-Proofpoint-ORIG-GUID: WLx4pDztGoblVvuDBDy6P6olT4HjZ5UR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfXxSdWFB27gDvG
 0iJy7j+RodnqlOwQ3m41JNRcJAdaRgbTLcXn44uQh3yQBRuyzl/Ovb1toJqTiyy6d9P0g1bVB3w
 +qiZH4WU4lQ/3POfsEYA0gxTPu1tvhV9joG0PakoKffxoYdIJDOEjIq61giTMl3MxFo/gS+dJFq
 idPDY/KZ+bQfsVPKtMFn9eKQ+FwcSc5MIeb2/IOYeoBdtZjKYGMHWDbYFGh5Nl8FsWxpknrNxEm
 Hc6EZwP93dB/G//Dy/7sH/JJkHAScSH3XP+zznZMYVVwy9/mrciSQNaS6nvFzCKhP0bw0ee/kEX
 sBi9qUyvJUa9h33BDebs123Pyv4+a4nrxFptrcGUeG2/XPgKZ9Cz+/Aui2d7o7Y5zUL3rgTUWmC
 WnPD0LiiS3EG2k3z76fQryRvMismmpkTqXMjs6HpvyMC+BB/zCKhVqTeDT11z+LQLFS/DYcdp56
 BBDbBpKaG21zCxKzFfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX7uvBL22JGRH6
 ILws0j4HVbX+4maG/HuCJXPSgOyoLFeWuZhoUO3SC6oc0U0I6/iJmimrUSTWQnl1JEpOXuL1L07
 /Elp5jMapTbECeZJsZkgi+/ncHCvho4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150073

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f0e827996609dab2c09834857a1bffd9560155a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,106 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1

