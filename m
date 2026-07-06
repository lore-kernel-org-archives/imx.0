Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CAD416132
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 13:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344051; cv=none; b=iUqMdsEnfWtImsFn1yF9KUEKFOQjzgE/pZC6r5W3moyKeqx47CkUu0rmBOZfME3T1tFEJhsCjs/NKKfdgUYrz7nSim6VlQn/1pU4gyAu19t7Va9IL4afKM5FvmlixQRxutMzCagZs2OW/wLwE9oIHWahaJxcVAU1xhgIULSPwLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344051; c=relaxed/simple;
	bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FoQxAe1ounHfcP0EU8TB23TgTmBOeUeZgQTEvFhXLMlbcb7mR5vB3NzJxUeBRmOearLj5F4J8mpPBR6L1kDYhODl6DQnKBY/y7UtW3ZRoFlSNy+bDRffA0BbhLIo1mLVk0gzc1fl8PPtkiGDSfS1u11RwS9/Qnx7Nc0Zi4jlUow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of8SDNd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fw5N2pB3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Of8SDNd8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fw5N2pB3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax99T391072
	for <imx@lists.linux.dev>; Mon, 6 Jul 2026 13:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=Of8SDNd8nSgjJ/b5
	fAMXAah/f8yVIsJxTIQZN4IS2TX1ZZhDbCRfkHtS8STKVwFNOX8hJ6rtZjjNUEWk
	ra1QRqhWhwEJuEuVJmIkKEjCyGnYRMyRouN4tOaQAL7WKGtLf6pMWd3jpTt3Y2mH
	yIB97QBgecowYhAqufxukVzcuFZFwM+XGvXOXPI7akvWbXSao/JQePT7AfyhqsKl
	TBlSuuWv5ZI5egv8hAhp+bNRuAmFql5cHMa4v59zda0oprUQ6QKaXhc46VcuwXqD
	ZXNRNv/BvaRTphCiqzmfQNUHvh356ktFDDX9m+0cmqfA2hO64P63QMAfeXoDLHrX
	zbhaew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrwme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 06 Jul 2026 13:20:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e63df032bso332373885a.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344041; x=1783948841; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=Fw5N2pB3akGd5lSFI0mB0Ns21ioCXtVypR0XvpN6kyi8c3dzsGAGG/Ypx2V6ASTtdz
         XkzPJCh8IBGY/oE/WAajokUDeoXGc2gWIALYhgO/jUMGHOmYZvmd+79PAG7oZl3+6Me3
         XWEoHfixfB0rP+AjHELsb79Ur2pPU4LsPK0Ml0k8qp6u71o8q56plrSJGLZ3QD5cz4sI
         c5nGlZOLKecNYkQwy7zdPW2kx1g7K2oWVwBsXzhkVF9wu4iCbMVeaKazUNM+26mxaNZJ
         z4KZaXTPDvCBX1Fx1uFOeMu/sQEw93/y4oxWmuasG69q8mJpnsP7R/xK58VI4D907PzM
         780Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344041; x=1783948841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=et1iYR41927yfk/Bahym/yjpB/TsCRWDV9DOHZJXjt54q3+qY15uVOUCf+ysu+tHwm
         CQk16JFqaqi3FxaaHTYL3i8wcosRL4PM63VNTYv+4rQ53aSrt7LhyINUpFJeIzgUpN1v
         47z1A4/782O9E9n3pqQRmjauk8VLQR3o7JXjkPONEK5qma7G/H31Sa5y5dsuSHTLjdP4
         t5pjAincR1bAThGkQnblj0CO+GKWpPlfgMBH4F7jG0/Nxykhg2+pYdjL3kV2OaeKqO4p
         BNN4Xyg8mOvoQAw+kwLsmVDUKBPLdBqcYuKY4lheyAMPtkH5AuxglVIGG/S038Tzb9ob
         B57w==
X-Forwarded-Encrypted: i=1; AHgh+Rr5l/vjvcoFyixY0Bc7i9gt/WaX0z1zW6VfjA2ZtTBUo1lraq3sMRqhm3Og2umtqozl5Eo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ8KaMYw9u7HveOHrv3/a17G3ooUNFKS73Ics27uJ25O7ulXUE
	45K4Vop1kgc9ngPSSurYug0UB9VENc66Y0uY5hACk6ormW032dHoSeuftRGRkgrYE3OcLv6PPPR
	5NPF9y64M8qSvQf+1eZdnf7zDMvZCypyQ0KbVw1M4Hwy2ORt23kq1ZHg=
X-Gm-Gg: AfdE7ckXo8yBnlvVrx3ymqCcD5loVnXWHY6uERjd1S9c4byuk33A1whc1Za0tOsGz6i
	0Avi4NuKpBkVhDaVtP5/xRW2IjUjjzSJJvDwLZG2egRkNY4nnKOvBalv6qt1cYAQL3Q7bX3oiOT
	gOd7qK1BLAwMy3mDt1PGPmjoACasR76I8ZJeAPXkzCXg7T/vEa9NelS4rJ5krj+ULTqRmR55Uyt
	DAO2ZMbiGWA80SNthAP1C5F7BNLRrQCTrFs7T8q0gf2l8/KCVH4s8HRypZs83nKieKoZJBXLITn
	OPzCQCH2/ZnA+CUzvNOW6eAcAQ16JhhaXskIm3YVczQuCekQPFLnf0fGte74S3uw1Kb4ssNreoj
	SJsD2fkVbrxRifnGDEODjltIiLcZTaMwyBrFOvWNG
X-Received: by 2002:a05:620a:688f:b0:92e:5f7e:3089 with SMTP id af79cd13be357-92e8b4bd907mr1698931485a.19.1783344040790;
        Mon, 06 Jul 2026 06:20:40 -0700 (PDT)
X-Received: by 2002:a05:620a:688f:b0:92e:5f7e:3089 with SMTP id af79cd13be357-92e8b4bd907mr1698924685a.19.1783344040264;
        Mon, 06 Jul 2026 06:20:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:16 +0200
Subject: [PATCH net-next v12 1/7] dt-bindings: phy: document the serdes PHY
 on sa8255p
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-sa8255p-emac-v12-1-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6ubiXdhUge3ye8k09h+7C2wjU8OFOs2+lRmu
 FCvxgxqyhyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurmwAKCRAFnS7L/zaE
 w9S3D/0WsPuArRuolQJdGz26v9pT9Wt0u35Mgl6MOyqF8MpFHp1lFyjsAjDjk4AncmfnUl8tvC6
 PVNRwP4pwlRWfAsOg7ipKdd01pTeZ4FZss0kgxwsyhwvDYpCC9olobyevp+eDaonoGUFpbCe+mI
 IeoyE856odq0d7waceNBYKbUKPNM1Wn0rJwKYyNrOmp4srgyyo0ZZ64s7uIKF1dZFtpCRsd36FU
 +WK3Nc2BfpdGf0aJnTEx6WQ5dWwLf/g5nbOgU7Wz3lcHRKSkIBwUfBx7faOER/Cm99qiDp3+9Tr
 dMQWNkO7DDcZ5/2d6vJOQcnRiAUuJN6iKoYwaqaqYKIlSO1aoW//LHz/m+mD0zYciPYhazP0xKy
 eEp5FcB5PhL1n/Xb0XFnuYxJSfh1bWvVuPK+o0gS6NHanHquydjKhJ5QkIi7OsuJ5b63LU3wWmG
 Cu/MfIMUnEpiHZw9KbEV077HhSipqMXzxdG07s4sOJAOW2TwwH7igsRy+0EywCQ+LP7TSxBvaLG
 INjs00fu3a9KB1BL2O2kfmpZRawHyXgdKtMqMTRW/pPkp72D0F4KGm0iDReGqocgixQAGKSr9eX
 vKMbfamjR9j820ac19f2q34B0tVxvUosuSTcPQ+vHIwvd9S/uXcsDT0tRs2FwWTxH4xjIEFgPmv
 iYb2sLD5F8kSxfw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ut-SnVK1SyB1-8OBhlA9bgVtQ44yOJic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX7jR0y07qIj+T
 3ZErqrapfMfhYWUqY3oZ1j1VJ9NgVNfS4BSzMBTZWl1Fwc/OYi/BaO2tCHXAiW2IvMc3qRlrYBU
 Hulq9eed2pQvUzjSu269wLw+KR6daY1t6qW/54ra2XVR7RfBPnApXe64pNoEuWQAfEaBSMnrdBV
 cDhVgWKTtuNI69l7mPnziPT4JZ8TO3kyI8vNhp5aAQn8XIUVIfG3QxijuyS0x1oUWNfh2hoLxTj
 YDINOlE0Nf6wbbbP+op+zDTbho8lnS5eXcImzgBHAMLJupMyLGr7QdH2kX7SUqjS+pVm32cZN1X
 VtuOuvQO6ZG1fB0P8+VEgCqj6kTPS+sD4+dIQ+wuYfegbDNPoah+wa1FTqBT53fi3L80ZsRftnl
 l0elHY0AlF8gGDeJ2dJc7qAbSoN2LEC/RYJzxVVWK1RChQQ8Dak1XjI2ZSthLI1Uj0nrFP0RG5k
 +wFekfe1Ysrk77kM+tQ==
X-Proofpoint-ORIG-GUID: ut-SnVK1SyB1-8OBhlA9bgVtQ44yOJic
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX1iE2f5vE3d6s
 4wptUSyAZO3NoldMc7wWIiHLjiHfMCDs1Z6WCgBUh0YxlsiRefabr56SK+6dOfO4WhfmjCSYwEI
 d29I8uXdaDfaBj+T9D0DjUh92QLneSg=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4babaa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060136

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9e846e381555514bb32177f884abf0cf2c942948
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@8901000 {
+        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        #phy-cells = <0>;
+        power-domains = <&scmi7_dvfs 0>;
+        power-domain-names = "serdes";
+    };

-- 
2.47.3

