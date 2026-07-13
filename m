Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6CE334C39
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934947; cv=none; b=joYjdLlIW/CeMV5VAJ4cLGVAisQ4+RoluiFOwq4nw8eDky0llIlSJpQEsrHw+GcvsY0st/2ihqYKpYcG3F3pG8SnrmybOe2IOswBZUPQyrPniAcqeewOuXC6CF+DecfrMDO5rxT+pSUQY9eiiR+/MA8a74rwt+nLdApixyqKLPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934947; c=relaxed/simple;
	bh=sJSdnjQ8F9thY4CJ2jAN6HxsC8VOY915E4kKmKwM0aY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NxVLc0FfWO7G0taiqyCCmD5wWUbBpD9KfT8tniJdAEmyAyNgWzTFcUD+em8EBw68WcKrh7PXK8LpOtDWoNxjziSldfJioNXmz2JLEZQCIaWAWk4v3kKFZX+wI4CVSeVTcdCHbZiy+6b1kpIjgf2t0dhMDHYId/PvHUIDevY3mDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTCrrdwz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kD9KJgho; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTCrrdwz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kD9KJgho"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77MNB810491
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ut4KOCe/6QCkbZVxR+fuKzOonTDjyvlhOXIbY6Oo+2A=; b=jTCrrdwzM7yV8DwL
	A59FJdHwl7m/4IMpC5V4jAtKgKbHbm/1w1YXzxMLjYce/VuikHJdsd173Zl53q6k
	8s9Mq2zLk4pCd0NVB3AYJjN+nINSdGB7hFhlkCjSPXehrpDXAJKHwsSDsQilB68B
	UulyMqIzHUEXL7ja1yVmaDIhXDC8/AmP5Wn11CRUpXODBc0Yk8iM+/hmSaZg59VT
	FsVgau60jwfv/Jij3NvaYvIN9LvsSa940QSY+PPWiC9S+4qIbkdVpivkWghg3l3/
	t6W7UWAtYSveMskhE2F/bVM65uDsrjpWqCBYdf5J/b71WJ1AaPkTUxXqsCxfQ4j2
	p5FYMA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsrh6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:29:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so2311331a91.0
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934942; x=1784539742; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ut4KOCe/6QCkbZVxR+fuKzOonTDjyvlhOXIbY6Oo+2A=;
        b=kD9KJgho9kMzwsqhHtnp6YjxGnmi/FHZxiUzdHlOhT4KVrb+6Hoc7vbLYojA13q1Bm
         P/AwqZLwlJ+Qp9PudOfRnkt3YqJnqv3x92FNAEalwM428ys5BFFNxR+vRVt5lmu1DVVT
         9yZRr3SHoOs6aOpJ+96HyTmoCbgjmAkmTW99uBeg7nlMNJBQsP0r/Bj8rorXzPp74kP6
         6CHF3MbQ3eaXB/l/3MYjKAov5J+ZFKV6HsSoVNEXzIoDntHmh+4w3yc1SAIqGbVqhmiI
         dDcPSAKuGRAo6ofhiUt9gYJldtJyQNfJ+y/hO9Y4mYdG3xU2QAk07pC0FJcK02u3GrL5
         ZjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934942; x=1784539742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ut4KOCe/6QCkbZVxR+fuKzOonTDjyvlhOXIbY6Oo+2A=;
        b=KX47lkHd3WgBKIqdKn6Z170vMFkmfFSIXvImBgrsSxXsZ/KW5/RNBe2LUT2NwKulzC
         wciL0xkvEP8t6EhvbLfxzdS7jzBoHqgAvWygsOyQY3PQ3iME0OShNP0RKrSmZPb9GghK
         oJ9CV+cgVXeS8fenEsvLiHNUT71hD23XkRfoOSbdaEbwHiXBYcBB782heFj1WxGLreZ6
         Inpx425c2HIfgAzZRIe3+TwgRC1MqgwLPqrgop1pTlwRtpJyJeP6pede8C77hF8selwg
         /SXwJHr5BaFyqMkitLQLImRke2LclSPNOZ87NkpXtNT0wnw2ByFy1LsTg5rEcJAen6af
         YaHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqM2WO12SdoUb4x3vaKYYNjYBhX9ENorjPJoQiRVyTKBLPPkFKe6dIbu0SFn8u/7AoG490=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3wOsZdJvktjbpIfICtN9Y27TCWgFzDNXqReLrCvNI/u81x55X
	FQVytxP905+wOEA5Mcx8OX/ega1cXNl2cIO2sPpM82sjsLXIVl/LHVRhm3pnCVUBOG2TkaIJ8Rk
	pdvK67kejP2FnwARlbHb6u5JZMznLxgjYb3exPCL91xT2LAsrdfS2cA0=
X-Gm-Gg: AfdE7ckDVoyBL6lyWpQ1lSnH73Up7tjbWWFTjL4sZ+vrkx56fp3/vkKeCZGMYgXvaZj
	i+S22K6kS4H/TuqP5BOh89NQbUi5shBPFEDgsPQBhiQr8hUrUePFVY9KcvIvM3c2ui0WEMXTdsS
	yTmjZYm+xFW95mtS7rYaz8vvkWWasnvKerT4+BbAtYdLU4DKWErEfqtfHUWD+lxg0bb/F6j8k55
	u4X1SJ2fLhvP4d3WQbGvb9kr6HlenYEfmHokdqOJgFT3S6QXxjVtpZU809xnRq7k16ksFDNA0a4
	6JXbQbHx/XHSsSwtfJd0EWBBkVXguhn+/dXkO0wK18t22x/ldvzSc/dNCILDIbdt769VkbNTuCy
	paamZuy3Fw3DE/p5B3iyn1sgIC/t4NG0J4Ajm7tlebQ==
X-Received: by 2002:a17:90a:e70f:b0:37f:fda5:8d98 with SMTP id 98e67ed59e1d1-38dc7e28254mr5920220a91.0.1783934941809;
        Mon, 13 Jul 2026 02:29:01 -0700 (PDT)
X-Received: by 2002:a17:90a:e70f:b0:37f:fda5:8d98 with SMTP id 98e67ed59e1d1-38dc7e28254mr5920205a91.0.1783934941389;
        Mon, 13 Jul 2026 02:29:01 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:01 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:33 +0530
Subject: [PATCH v5 2/6] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-2-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=3937;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=sJSdnjQ8F9thY4CJ2jAN6HxsC8VOY915E4kKmKwM0aY=;
 b=ExFXa4TwS4p+Rvq4zfW1IXT0AAGbxMEnwbUW7xnnh/d6w+npzuOOhBiCrxSUD2EqJgB5h/BMV
 fnHIzCQvvCWDxJkkjK+Jp1iZmGkEPftJMA3LHQu5V7XmifTM55C49uD
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54afde cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: d36MxeIsSVNNcpkIvf2nqTGAusB0N6ZC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfXyWDpiLAJqgJq
 vCHeF+7mHvd6utKZkjeyuNEa0XUPDmbUiPvx2qB6Jll4waQazlwgmpYanlXhXs3qsY7PLUA/RU+
 +BFOoO050yXbVr5eD93wJyj72i/0dHs=
X-Proofpoint-GUID: d36MxeIsSVNNcpkIvf2nqTGAusB0N6ZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX8lxk4MFFvjmo
 5gatW/GA4phKbkkOawnsEIln+zkoLQIJsDoE85o8AlOmvrX+3JVsyRxMXn8eX58Senv8bmo3vd1
 eGyunDmg1t+rv5t93E7nNJESi1T+ZKcAG8n7Awfjre0xkiWDm3ojqKkzusTfQZPZUly9wAUoHI4
 a4xN6yXhwlSbUd92VuCilr1DztjgyUKVHBPMbekzLYz1bkX51PToEJOzvQcJ0QuSlXtG327QiPE
 Op4UgvvFSXpfAzljGl0rQ/U939LGOi8nCMNTv4R62NkJw83Ve5Mv7Uh6d7mCgD3epcg8N2mnvOz
 JVJBUpxQuxbJkorF6TdLDw2Ks5FKLv2S8mr2Z2s7yi5RQX5NwUp3sC2SvXD5WwiCCdfZ66v6nwG
 uB+F+nbKJXu6J1PWikiriG+q88W0KP0slH24nX2M4dQvmK0QIXKJ73/8bo31/ksIgxs//acPZbY
 0uuJ9R8+3wxYWKT9Iww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098

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
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..6335caca329808ee04d9067f1f95e8075e2fc3ed 100644
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

