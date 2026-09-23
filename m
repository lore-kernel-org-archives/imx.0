Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A486353E30F
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176508; cv=none; b=MnbCufQiv2IM0kgXEufJPPGANP/C/OiDPgK3AZT9lHXV87W433fYoDC05Z9ps+4YtyEqZSlrvEfshlpjBUYSCQL872t0s4NMKp4VpiQQL3Wh9rU/Am5rlRJUNaslMS3jE+AQ0YaVPE84E8tAH7t85B/dTcJHoXbgZJgsHHI/3f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176508; c=relaxed/simple;
	bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gSj3mGJMxZwae4nwPyk23U4RT/w12pAMQxoqNk7bSTcy4Hy0ptWfMWy3e2na6qAi8QnvCz/mMlysQDxgjC88K18rqQUspHuZDi++0AQ0SESlS3u4VqLQfPwQ8de0ANmg5WQ034+MLwRDYYSKK1TYiR1O8he8ZyIWUnmgTkPDvWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/xKcA8i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AF+OmLMB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/xKcA8i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AF+OmLMB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKimQ322224
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 15:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=g/xKcA8i+/NobfHf
	BWhEYPeXdGSHGYYpPDDeFyNv9rVep+nPuQ4CckyrbRT/aTG0JaXqJY78C1J67l7Z
	sruuwjsIeJityex8fyb/0uLQjjn1rk/EyVF2EUQwMHXnxbV9aK3wSHKQfaMn7PlP
	l6lGZC973H7vyl/V17/Tkj3HSS81jkf4dwak9FvtV/s3raXj9cIvVCmZs3DfNIYA
	2LuWTNltF2erkMJ6Y4c2T13iQwnd+m5Xwkb43l0l+/tz5kb8NPYXBho0wEu9+GA6
	dxtSfMD2ZhbMz4KATPI8PrVPNqCLi2n2Vut1lv99OldheOvVeIsiTkpqQWXDU3wt
	8B1pqQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsghbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 15:15:05 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82b120e93so402245e0c.3
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 08:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176504; x=1790781304; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=AF+OmLMBLwf7oLWIkTLzbGacDYfCMUdKgAxX68HoaxDi7cbFPpUS3fn6x+G1q7KYhZ
         7do9FgWdEBfcUU48kw61zhV8UNYIg3bGoZOw/5cxeDBvNc+/geC5gQdqAGehflXa9VAw
         QbxnJDrdaUQnG7cELXM33T41wcbiCexDHbPgGODzzmRZvwbuxPzFR7WsN2nwQBjwI9OJ
         sCEUZ6B3eYing0CfrF6WzYzRuQYcXmh8VeUpkrFgng3Oy1sViBZFagmd7nkeU+gJvHHm
         XbyCTBcXklMFgBnX8s48+eCqrlNU63ijKrzlzE+vdN9w8tDs2noFjHH87NnyqMh2SfBe
         sriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176504; x=1790781304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=YU8cY3aX4KIvB4EkT9XOhClfy+/dFQ4TcsMaqZtF8Inz6COqPX0D4efPlDlrk8/1ce
         0fVz6nzZt3ZBwWoO5a6GmJLJQvA4N1gSWyHW6EwWhqmjlOLc9UBoP36iHJqJfN/etIGn
         cq5xR/AU5Hh7F5OS65tcQ3yrAuuJEsEvRFO7m02A1lDu4iDswZx8ONr04z1cgOajKelU
         4+chw20rcNT2wU5QPeNRlMuID6eplsXD1t+lYRYrq6QQBefnEMXxepFxyYCXII7FwaNz
         69KIBgFHNyGWg6DCfvYdIXy9Lp6qtYd2gZhkbPl3V2k7hmmpp8LnATABa20XjfSspzf+
         cTCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/FE/HEItidRXdEPfEFVV3uNv96hFScneJ71xdD4hgLXpgBcW/ygCcbz0dTMYJal5aX18=@lists.linux.dev
X-Gm-Message-State: AFuF++knA7Gr7kkQ+5oTDFxZU7HuL7rYc7gNVm65RjbidziTvtoos0GF
	C7YQG6RuRlN8I3Et264kNnMNSG4S75ULKAt+wqCo5HgzDzKGta68lCIk7p0QXdzj0RtaN41ZTAE
	1ngQFwU7YazknVaby1vJYYxHX22Szw7H1fPmOybBw7FZyyX+G4uqrQBY=
X-Gm-Gg: AYBFou3Jc9ac9vUqWE3Ke+fd4H2uSVZh9qsAF9bc7QrSbgu5Ek9AXjayC4czhzI2ego
	LnL30kTy7Iiw0JD3edsxWtZOhHje3EcPXAm0eiK/h3GD6dPYoT2S1Qrsqy8lnamEc9Y6Y4z+Wgf
	W7DOZ07bOfUvoardfFlJV7gtK8nPZNPOsToeUsjuPZFLSiqp8TbSyaitHuQg2R9EIT+h+dcu934
	KSFHxa7OU4/Z5Q5ZyMi4hvJtMzqgpZA9/mzpAzEToXu0IeiI2nWeaOT0Uy0to/QkKdxPhR0Q1eH
	SW+o2BffuKyQ4xmPb85o5c9HRU5JshyZnMZ9vRIOeLqwu/HNJoctYmpGjrqbweU4RheCLYRiQDz
	uvx6cr90KvKlT4K4tAKp19bpHXdj0
X-Received: by 2002:a05:6122:21a5:b0:5c9:a617:5814 with SMTP id 71dfb90a1353d-5c9f1676503mr3187522e0c.17.1790176504396;
        Wed, 23 Sep 2026 08:15:04 -0700 (PDT)
X-Received: by 2002:a05:6122:21a5:b0:5c9:a617:5814 with SMTP id 71dfb90a1353d-5c9f1676503mr3187414e0c.17.1790176503766;
        Wed, 23 Sep 2026 08:15:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:15:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:36 +0200
Subject: [PATCH net-next v15 2/9] dt-bindings: phy: document the serdes PHY
 on sa8255p
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom-sa8255p-emac-v15-2-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqs+zk0lgESfJu4hyoxLhEt1pboqFY9LRHQZuEw
 q0ROLyv5jiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarPs5AAKCRAFnS7L/zaE
 wz4FD/4ml974ygSP/1dV7u+o15KeVGW38T1ko1qMY6cajeU7hdx6Qr106v7TNItQOExCcFYuhLI
 MMmwMRi3EjGvQgzSOiVgdoqzyt3LLFe5dVcneqhHMGt4o7RcuIwfLnvDqWtyZrZ4zHh3MS6Z95G
 RCuYcBIg9YUrkT92SYOHFyJlK/CBwKrmWWztnZ1KGv5wpDpa1iBxAj1m9B4phfGRCuBBmeEsC1U
 9fpj5D5lAiB+7uWInhm7xVA3QB+t/Pv9kt5mySVyLL/PgiPdZgMqoi/EvoKawbQORzi8lNS70AZ
 NqCrUEZiOrl5e/yRzUIEb17PYM8HJTvOksc0MyI4FOnXMSumjGdif3sY3lTs9JG2Dn7DfHJgtMS
 qLjs/KP4L6YwLyOVo8LY7DdyR7Q6lv8gx43JDteeKzQZ0z7uc2dUYWbMaRP73kP/kpIn6hu7Iup
 qWWrqOIitb29xK3xBPllY5waUZZqX1dlmv9+2DxfiGgfNDVgJuMH/c4nhBqHOplXDorkvfoUwjH
 vy9EvQ5KlHe2hO3Bz9gUxk4Nok5S4BBIpUE3XRU+sGlu6QUjpYqRRWur8AYhy1QaEWAtTTPWzhg
 FpPvfMJgXKlz6E35SUOkJYzI1aEdzFCWAL6cVs2kgdlgg8YPrK2AvV87CZYRP3M1eodmkx9Sl0/
 HTv1Ck05DDVfirw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX+Xbt3mmBsqah
 FCP8uMuOnPujSGIPbUZm0nqOYST1e3o3HWqTsJ3ewJlU7CLPeZx3j1o5zxVnbTrhBXoigsxLwIx
 oq5meTf9XWAQWlO3eAHl9AR9xpFPu9NjVG/Vm1zys7dvOjiRQHi3po3jwxsk73Xfw/2ZyeUUpaT
 esX/RVlwa90loJPlEYSN4yCHpkWx4tqgxubAzXQuvcdTAPYgWoPu8b6fFAjir2Np+5ZeGrO4rED
 Pg2wqQc59w4kcxOg2EexiTE95vDppdLxllyr6NuJY2IVew7pcOCAzJIaWve7mBy0vnOBx1nGjqn
 18WMgjD8lERrOmkVUAtcd1iew2T33VbBWizGcwRyQJgayjgVs2h6XgWKRajdojLlKKyiquoabp8
 5X3tfg4Vl3k3bx7znnTdHfOUBloQpigs91Fx8acEhxSmq3AF7YsaI8plyEhtDu2GfhW8CmXUQHN
 yWzVimitwy46NmuFm5g==
X-Proofpoint-GUID: NArRDj_Ys0tHnfoSktvLHY1W50ckMd9x
X-Proofpoint-ORIG-GUID: NArRDj_Ys0tHnfoSktvLHY1W50ckMd9x
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3ecf9 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX+ZhEH/WOGaKT
 fzXaBJB4H7s5lpUyFaGLhGI6SSt4CcO2C2THOcZCb5uoLjwJTkcyt7RSFhSNVvllDfJUh2gYi0N
 /u9tvhVnvlWxMVLuvFfxHy3yzvhhi9E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060

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

