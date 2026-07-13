Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CEF42A782
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948875; cv=none; b=U/k0P/7rJUOvW/HZIfJ6unRU8/7hmBuNbOAHPj358AXr2v8Ij1x2row6nvIOCoCeCcoi2/Ak+jWjQhWpX3TsGLrvrdjwrRnFyEKqsJrnCMSABR1yZrPUkim2grPvaexItzDwNTzQRx2BJ3j1IDTJLn1xg20QKQ7Q4v11nf7a4i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948875; c=relaxed/simple;
	bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sCY8tcM3jyULFVY7t8bQs8gVaIPmI9WJ3jrXC5ZrAt/O4y0YyY1k/ibcASX1k2RI6Xns9fZc3vAhZtWc0Jd4oQAu1z/l2pTPGwrzumAMGCrW+kN4mUOYiJlOgLAbirYPQEfd0Scwt6+Fz0kKajJh6S1t3QT/TMJDCaFtHUHJUbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EsujTW/5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brTrA14c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsujTW/5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brTrA14c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDkqK1398814
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 13:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=EsujTW/5s6ffD24l
	1eoxY/es2Q4PYXqBPREh5gFAIQIh+AyKnTTwi0B03NRumuzZ8IsCdWOplAmbd1WB
	n0rWQg4U069GZ20+4HgUCReJ/2eZIaGLTtyuI4vc9xb3ul7axklIfkgrCqhCYjwL
	mX/tC7VfT/Q3ezydS4BNBpBFzArKK6isUkbVOaCI8xHN+DfenK5EOemjuFMhQCe1
	p2Ve+Z6JVU82plo0OIOn8s7pgrs0LDPv7knwBanBLyJFaG/X/MvM41tzBn1e070H
	RKxJXUd1KCTTxaJP9hxvH3IimYpL/8JKo0nZG1zbjt70aRU5sD6ay0xYNCDQb+i9
	q0gc0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4rquj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 13:21:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a9764f0so53859051cf.1
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948872; x=1784553672; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=brTrA14cziXGYzP4sFPZRlq4JX1lLqs64of4wfGxLVEgg3XwrQqXYYme2TKvYKMTnr
         YLm0BgqsI/rYEG8NvV0T+QCBMh6jhWJ6IvSrI+r7lhHBIpIeamPq4VP61Hh2ltjukae9
         70KMmLp1ZSr2zk4UeEpTlStLJah4gaYYaoePFHY+zCgFTHDiIEJFGRNzMDHQ6szDLQue
         7wl6aJqPrp99l6fkNHg8609AfFvHDGm1tdw/e2lBvdDxhIyTDmoCp3e6lX8V4wCiEr63
         9EhCnrGAXYnAwcdFzx1GpispLZyw/TCgCPkKOfDSUa1ZIXBUcK5ANGmzP9H4kmHeZ1sF
         4lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948872; x=1784553672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=HOhElLJAOJynbleascMYtP/NcrtVJNrNfAiMfKF9fjzhTxRHTk/1F5DemsIqZjXNGn
         7WQ9cl78xuGOvIfDTrW/DFZs9HW3l/9hU6tG8g1AgeBA54Y+73QULIhY2+c0xm80Z25E
         sDnC61dExjDTFEG5W8FebCDHWW7uJ3iz9C+X0u3wx886R3OY4C+OV3n+BfwJDf1AVmub
         4ZIgtM65wIm9/6+4eWKP0rZqDtTwoAoGqrd9d9Af1alfgxVzEB0qWNH16rjNoLZ/0ctM
         eNcj+jY7Y4BROtjvr/TUB94QfvdnlA84cjalL1CT3/zP5jvLttvhKtqsMi6RUH+XmbMC
         7W+A==
X-Forwarded-Encrypted: i=1; AHgh+RqWohSBnd7dX4d+rpV3NEF1qQWvPAgpdIqv6oNAt2PQyYMMrod3wT6nFWSMRLH/lcK1v3w=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDyflTdxucaeUImuzqXGS3he2JMFQK3XjoFr5QER/VO9H9jfQF
	0GxWs2Rz5Jn8wiy2Gt+rknyeRoj1Hfv8kdCxycdXaSdwXvm3nNZZfEffy3JbOF01z1hHM6EUAPo
	HhhHVW6NR1eUmrgtTnF1cKG7QVMBLFw2jBc9HbJPGNJiFTqUJ/iNdQy0=
X-Gm-Gg: AfdE7ck+lkqt2mIABQdOOcbiWblNQ0PB0q1ZjXUoiiJRybqlU+W0es0bHQIvZN53Ucc
	4v3TpwrIghBX7Dty5QCIAXPjI4N6JGBagqaqVsBro0NfQTQw4YM7pvxbftzFT0/PP5+y8JcqEP6
	pMhDFDy76ERzgmxRbPdzH9FjOBgKHUVFmyifzut3hrBpsNCc+MFRcMVB695w884qrAOp34KEqqj
	3WNYlgtCVBkn+0ju2talgXuWNRl9bvNtRQplFSYIUYy+LJZiqyjKwORb3EhFRvlUP1rTT/qEDqH
	oeSZ2QPh5kP3g2kqcC7a34fk6DdgQdaUad6wYanA6jBzJZGEhnXQZ7TlfS5HB4sokTdOMx8C8aP
	KeofC+TJP73O1h/zT8GNk2p+E4WTFmXZ6Liazt+iT
X-Received: by 2002:ac8:5787:0:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-51cbf31702fmr95588631cf.45.1783948872034;
        Mon, 13 Jul 2026 06:21:12 -0700 (PDT)
X-Received: by 2002:ac8:5787:0:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-51cbf31702fmr95588121cf.45.1783948871582;
        Mon, 13 Jul 2026 06:21:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:31 +0200
Subject: [PATCH net-next v13 02/10] dt-bindings: phy: document the serdes
 PHY on sa8255p
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-2-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
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
 b=kA0DAAoBBZ0uy/82hMMByyZiAGpU5jSgupfQ73V66CmjTRYphxtOflEwg11wtoOBUjQcLl7/W
 4kCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqVOY0AAoJEAWdLsv/NoTDpj0P/2pX
 O7c/RStPXEP6H+bYPdkp+JKPZsBfBDQechWWEdF9PaW8TIv9MlI3HIhWDhE8JzJiC7X3mUt6VaK
 dim6yfe4fNXqBfv1lZPKniq6DJG6AMmY0Ca5XkfbIHIUlxXFnhuIKyhUb2TYYYidXugrvV9QDeL
 wGkZG5kUj5SnYp42cVr2U08enrxUE3a4ej3c5nkc+IKY70iFoZaWSDY17iRsEFNOrCIMo5mMdsc
 XxQHM7+vHu02zCIHTKnX2We+LgxwhprMy+pvP9LADv1T4qNiGragMfDK20QhG4YORuygBn3PWYq
 ZFX2jUhtOY4/QsYxIujXT/8mM7KTenYEd+9HXqP3W8NZTL/unLcwz1ll3ocRw1j56tg9cFK05ku
 +V087fNBNe2xi07hTBeqjzfo94+CuGbSLYWGgIW1P39NJuv4VvwevNFW9jWlqjQPkVyI5xbk5vB
 3++GRxPJiKuLCKlFBCjsJk0Udyv0Cp7+9zVsC2ypoyMKpMvr6kVM7hhOp86eSrvQcTujRIANIeW
 3AIaIYWr+XIs17ovVnBqPd49JrvJrrQPXaTV2urBfkyBtBvgOeJ7wxmEFZlBbJQ6mAZN44FcZRU
 cPNwJKPwxL7ROUWKUvaFoJrqIEFe2gIiLW29czOE8cObK3yTkyxBar+2T5tx8q8CK23GPTqmC/a
 kdRil
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54e648 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX07k7wz59eJfI
 tXRYpfS45EECd69bD9NObQTDYScV5/IP81JCOOj5DxeJCRUXk5/75n2A43uddieguCqNEX+1IBL
 NPFjEF5gFGGajj9AQ4q1t/I0lVAgLb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX72UR4zxTtYE2
 mBv923Gj72qhgtP8I3fs8DvDzlDEqseOQbVN3ueN3W/sMjhs3O6IGewo2+jpVuYsfer+1VqrO7p
 0iAlwqZl5DWNbCXn29SZZPB9KrC/KKM0fYqDPX7dH/A3PymQF9d9zJWdYjXB22p/iKJ8BP9WrJq
 zmCBdU20vMOZQo70q5mn5ZVLg0rR8cDaPPXzhsRDBxYxXoYeu7HxtdHIOKNJirq8ffU8yfkVkml
 lt0eolZPDJxI0UfDsvqbv1BvbQND9o3AB088VOHgEdXEWgO0cnEilOvuLPFCEvCi+IiZeokNs2O
 6tC8XtTUMYZQaHGpw1X1ozs6uknfWTCKWzq8wDesbdFY8kO5ovXC1V2neD84NRBf3iGqQOImAsx
 veQuypxZOEIkBFZGLbAHp3EN2G+r7OfZ5KVOnJsM9Es8TF9QiLUZqcjWwMoNAZwkiAApT6J1eaT
 P3Pkp/sVsoKddizK6Lg==
X-Proofpoint-ORIG-GUID: jLUzqx22O43gVd8ZbukhPD0VdLUbj3LR
X-Proofpoint-GUID: jLUzqx22O43gVd8ZbukhPD0VdLUbj3LR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139

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

