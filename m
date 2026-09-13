Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F455348C4B
	for <imx@lists.linux.dev>; Sun, 13 Sep 2026 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302754; cv=none; b=ZEI8Pt9XODK4+Reon5op6NjYrI3EwgQNRDQJorJh+pJ2siZTWVdQkZTNUwsBbEvBR5Et9ip2YycagOeBeqdAhmrxOqmaZB0TkfUAlucDkEK4T91j+3C04ZO1UM+hrRzvOq+Kvctb21eio1tmkkL7bw9DoI40IPWSjoPO/9ulpao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302754; c=relaxed/simple;
	bh=pFYD9xnmywcXUkGLbix3V2jspMeKMaccoDyDTjuRfBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBPZbygVHx30lm/WHqvSTJWksrx11V29gK6uG/yILMx8Eu4qD69gjfUcrd1u4x+Ro4LGtV/4mDKI/9c/F7D9nix0pFMb6ZG2MOObD6G9Mjot5xlHAiGXKZ102HcoTyR8X0stuYzI+doyDeeBEKBPp6Oj+osE0hRaWGTqvyMZkUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6Smo9kF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3lPmV4q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6Smo9kF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3lPmV4q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAUNhC1368243
	for <imx@lists.linux.dev>; Sun, 13 Sep 2026 12:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfP
	Qn4Ziz5U=; b=U6Smo9kFJivHvkMds8U2IxKIiqYkWh1SgPCHvlOv3ToV6rfhIVx
	aiA7G1W061+QCitNeFESvaWnf7l5Sdx6GysnzFL7frFWJx4qVLd9gDhlH/M/cppB
	hguAc2gH/1hKHSNEnAvtTIUaqTeyW+5xCWooOItBKlVlcmA3v2j7+jQn+NMhmhm6
	BwESPjPzRpDR6BIEDIwhfXuEXFkznPV4vTDiHlL0nuQYhUEJAbNgDhUOY10U8nDi
	IHWOe0crgKe8YGX82cVwyCWbbKyMmlLW5VTNd5mDZJu12gZNnuWKzf+PAPrGt0Q4
	CTdRcpd8XtoXJXpnJJsJ1UXzLuf9WtCirlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9db6f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 13 Sep 2026 12:32:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso276222785a.2
        for <imx@lists.linux.dev>; Sun, 13 Sep 2026 05:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302750; x=1789907550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfPQn4Ziz5U=;
        b=W3lPmV4q+S585pYY5y2VMdI+xGpDeucXGrmpUiR6PgBJ+TY7OtCmK3yc+TCSYChIvu
         v/rKyqg6ZesJ7zrkVv3krLsCvDT0szkgaUQ66jYh/vGJKmKCSP9uGjr8XQeDF3ZmfWFa
         nOK0oKTk7N5zIL1zRy1dwZIB788eCePYy3ehc1FYXYpfg4orBybme7S5mswuMhslNeW4
         6o0z5YVeCH1mMK3hdeLT3T9iLI6BDxWUv36WOkB22s2UcaTYyA6Abcr7+O6B1LaGMCYg
         /ONvp5knQas/90dSb5bGlQSFUi25UZ7t/maFY9jGKJdNP1c8Lkx/hKk7mfu/FmrueKJi
         T2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302750; x=1789907550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfPQn4Ziz5U=;
        b=MX/z3rgqDe6+6yWHpYn7l9YZyFC5HlEz+Dj72vrHSMGMJZ1LHF+nfhRgs6D5uwKM2o
         7BMEII8yP49XA8erv3c8loDP0kfDwH/LSSY7GHIB7AwqLfwu4pBbyQSc+D9ORLQXihE6
         EZ4I7KkdS3bwmOzX1lowQj71nMmNCcJj7clLE6MSKZvXHlM9Bo0QFWN7Ucivek5gsXR1
         x4RzaPuXDYia++c/25MA4FSfKAtgJUbpJXEobN1H0X4K1k+WrK/gThmvuoTsD5Yy9GPs
         2ADz7Y/rUzeTqz66JOpy0eNYo4E2FQ36BItCIHiWAh4HFM1z9n+vonyVZ2dSJI775d9r
         iGoA==
X-Forwarded-Encrypted: i=1; AKwUvByeo8YaC6CfLXUd8e+FvJLtdzMxfl5oEhn99YXNphd2vvqBdkkuRV0ArHXAAt9EvP3Ih9Q=@lists.linux.dev
X-Gm-Message-State: AFuF++naiHaNBZW0e0csa5fFYbpCdbBUQAXT9q+3JyCR8nS3gm7rOlCG
	eNLPK5LJcJRSTJLFK5kGHBkVSDpTV+UL6Mx/jm+aAQyMMdAqIyukAKIj8dpC/YCC5fF9Qhm5CYN
	7ZpzsULcN1MlUJmelXhz4txFf5weNTT0Pdy5ZdHC40IYL0tUiQSWqbDI=
X-Gm-Gg: AYBFou2SjBSrHDN5yVph8nSHSlcwoX6QeI8+F563w44Ghji+GMZqz8PJ9S//yF+JZFZ
	aVGXtkSFamJK5GR1Y6H/b6VAPeC6e4+L0lnltEZL+FQXgKFRwBvwJ0KVZ6b02KGTW9RmolqhK0K
	S+AMMeoejEqG95pTtScHWxdYLDxJaI9YsM6/4jaqf6W7jkQd1Wn5cpCTbzJLWQJzTs9CHJLM9SO
	jDkDg0pLmnxTlrDlikEKXbbufC9QeSO8ipoNW5PCQao+wJiB78zxezOU998I0Vv4QoHzEGF9OCa
	PFcfyAhOzLKx4uODjVd66SY0oCEGE8rHSYQVavgztylC9QCICu9DGTqQbF5um2TVv5YveHb+jKS
	npgSio5YGaN/dNlQ=
X-Received: by 2002:a05:620a:a0ca:10b0:939:ec25:e58d with SMTP id af79cd13be357-939ec260367mr1128822785a.12.1789302749601;
        Sun, 13 Sep 2026 05:32:29 -0700 (PDT)
X-Received: by 2002:a05:620a:a0ca:10b0:939:ec25:e58d with SMTP id af79cd13be357-939ec260367mr1128819485a.12.1789302749044;
        Sun, 13 Sep 2026 05:32:29 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm329566615e9.3.2026.09.13.05.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:32:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michal Simek <michal.simek@amd.com>, Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: pinctrl: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:32:24 +0200
Message-ID: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11926; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=pFYD9xnmywcXUkGLbix3V2jspMeKMaccoDyDTjuRfBw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppfXhbn/AsH2HCU28b+w1iRFMdoj44HN03Qm3
 9qsEYLGX6mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaX1wAKCRDBN2bmhouD
 1zKAD/46HmSfdDukAVteVmwTPNNO1cL5boOFPkv4ZaaxjHIhnpTCrIW0WdWOE5fgJvjVwV+bPeB
 POxVwkDqBR8WdNMwhBksOAN2B9t6K/mT8VWgirLj4kJaweY68/N6GGVuwTqLJmHfJqFYDsFD9hW
 ez45yd6g1zgqrDDsd9oyrX3ERmzTtM4bqxvLFp0E2Qv9FgDpXXc4xGzsu2BD+0BwBfTaEFpepMo
 HjC2RXjiLCLufXzHIAA9i4agQ+x1I0M2+sAOk4sioEvDOeeBfDBDCVXQ+YPq+YqMnLMFUMmRzxd
 EeKQgkHRm7XMkDF/5QQxKdjDnf7dkG7MMQbgdooZGIGAAJG+WNIOpqQDfRpHHeXbeT3u6j1F4Tv
 sm90tdMOKMibTPwOr0oo5kSUS/jVKmg5Q2YzEFqlzDdRasM1ko5zYnSS7SsSmBYsxtE9Ewlau2r
 +3jATULQBaJ6vc3gJTdNu1ocY8OLKu3KDmdIUZ47C8ERQu1PBRlmQXC/DWMlwvG8KLRXGeD8Cfy
 vOZWuvUaw2+sU8pCu6gn/BqrmlhAdMDkwfBSVkFx3/Pse8y2L6RQ5stekSCSs6ru9avZLM0zNvb
 y9v20RgSOGflXFIFA69CaqMWm/hptbvXEVCzWUaTuzzPBysthZSsQMYhab3Jd84wdjQuZonyysF YnhKsJOyWxJxDXQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX4Kq5Ksxw3dEf
 mcfA9TRpUq1zxBmKDwE1xwGVySqcxKGL6So0b2KW5JEI49T1w530qRjEmcLqcLY3dEQupiAVnx0
 j4Vpat5Q4a4q7gxR88gNIg03eIsv4qQrRwULmWehJC1TPHLsDakRtO2WicANbjYQcJmyceZjxgx
 b4oPYd245m+cukCjMDBQN2fGtUSjTHFQZm2I6DClPy414kaIaSbxJ+NrpVo9ov8iA1trxYBTZzO
 Zb++5YSDCgk40s4aGD3I90juuFb+dnf3y0wzua+B7VrUTvFDSAkLc7yhj9MohvkVm6wfdd1VIOl
 3Dizls7sFc8W9M8RaHgge8oPG3dD8AOROXWbTZHjJmLjvz/T/jTxr+//QZ1LIVrI1+iYhSRWdWa
 lHaL7DlJsWILVeLhWoXNUQXWdG/6IHYdiMunzPkOxlA8wmMXkWN2A2FbQ5BhSV4gcoBA0AFbfxU
 OrEkqruRLMisOYL5PhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX/U5gA780lnST
 I0UQc5Pp0vszBPGAQvY+HH9w+Q93HXSrG0MwXdMGg9mEc/n3fkke0DJKpZ6eSXvOtjHBRNlWVbA
 kw5OQ+LiMkyEgZzBFnfqm9reJQ/39KI=
X-Proofpoint-GUID: XeA7oyPV9IUhkWgRuymi57qo4PX6C7AO
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa697de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9YUYMJPlCa3gOHXfvi8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: XeA7oyPV9IUhkWgRuymi57qo4PX6C7AO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../pinctrl/awinic,aw9523-pinctrl.yaml        | 50 +++++++++----------
 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  2 +-
 .../bindings/pinctrl/fsl,imx7d-pinctrl.yaml   |  8 +--
 .../bindings/pinctrl/intel,lgm-io.yaml        | 14 +++---
 .../pinctrl/mediatek,mt8183-pinctrl.yaml      |  4 +-
 .../pinctrl/mediatek,mt8195-pinctrl.yaml      |  2 +-
 .../bindings/pinctrl/qcom,hawi-tlmm.yaml      |  4 +-
 .../bindings/pinctrl/qcom,kaanapali-tlmm.yaml |  4 +-
 .../bindings/pinctrl/qcom,maili-tlmm.yaml     |  4 +-
 .../bindings/pinctrl/semtech,sx1501q.yaml     |  4 +-
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 46 ++++++++---------
 11 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
index 98c310a3c63c..1c09c0fd4930 100644
--- a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
@@ -108,32 +108,32 @@ examples:
         #size-cells = <0>;
 
         aw9523: gpio-expander@58 {
-                compatible = "awinic,aw9523-pinctrl";
-                reg = <0x58>;
-                interrupt-parent = <&tlmm>;
-                interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 16>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+            compatible = "awinic,aw9523-pinctrl";
+            reg = <0x58>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&tlmm 0 0 16>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
 
-                keyboard-matrix-col-pins {
-                        pins = "gpio8", "gpio9", "gpio10", "gpio11",
-                               "gpio12", "gpio13", "gpio14", "gpio15";
-                        function = "gpio";
-                        input-disable;
-                        output-low;
-                };
+            keyboard-matrix-col-pins {
+                pins = "gpio8", "gpio9", "gpio10", "gpio11",
+                       "gpio12", "gpio13", "gpio14", "gpio15";
+                function = "gpio";
+                input-disable;
+                output-low;
+            };
 
-                keyboard-matrix-row-pins {
-                        pins = "gpio0", "gpio1", "gpio2", "gpio3",
-                               "gpio4", "gpio5", "gpio6", "gpio7";
-                        function = "gpio";
-                        bias-pull-up;
-                        drive-open-drain;
-                        input-enable;
-                };
+            keyboard-matrix-row-pins {
+                pins = "gpio0", "gpio1", "gpio2", "gpio3",
+                       "gpio4", "gpio5", "gpio6", "gpio7";
+                function = "gpio";
+                bias-pull-up;
+                drive-open-drain;
+                input-enable;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
index 8ed53496c386..4ab1f00775cc 100644
--- a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
@@ -86,6 +86,6 @@ examples:
                 pinmux = <CIX_PAD_GPIO012_FUNC_GPIO012>;
                 bias-pull-up;
                 drive-strength = <8>;
-           };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
index 948160cfbc5f..7275215918bb 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
@@ -106,8 +106,8 @@ examples:
       fsl,input-sel = <&iomuxc>;
 
       pinctrl_gpio_lpsr: gpio1-grp {
-          fsl,pins =
-            <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
-            <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
-        };
+        fsl,pins =
+          <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
+          <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
+      };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
index 1144ca2896e3..96c405711f65 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
@@ -64,13 +64,13 @@ examples:
         reg = <0xe2880000 0x100000>;
 
         uart0-pins {
-             pins = <64>, /* UART_RX0 */
-                    <65>; /* UART_TX0 */
-             function = "CONSOLE_UART0";
-             pinmux = <1>,
-                      <1>;
-             groups = "CONSOLE_UART0";
-          };
+            pins = <64>, /* UART_RX0 */
+                   <65>; /* UART_TX0 */
+            function = "CONSOLE_UART0";
+            pinmux = <1>,
+                     <1>;
+            groups = "CONSOLE_UART0";
+        };
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
index 3db2438fadc7..4bcee7741fcd 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -221,8 +221,8 @@ examples:
 
             i2c0_pins_a: i2c0-pins {
                 pins1 {
-                  pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
-                           <PINMUX_GPIO49__FUNC_SDA5>;
+                    pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
+                             <PINMUX_GPIO49__FUNC_SDA5>;
                     mediatek,pull-up-adv = <3>;
                     drive-strength-microamp = <1000>;
                 };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
index 33cb71775db9..0bcafa78acb2 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
@@ -234,7 +234,7 @@ examples:
   - |
     #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #
+
     pio: pinctrl@10005000 {
       compatible = "mediatek,mt8195-pinctrl";
       reg = <0x10005000 0x1000>,
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
index 3b3961789860..2b1354e212e5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
@@ -113,8 +113,8 @@ examples:
         #interrupt-cells = <2>;
 
         qup-uart7-state {
-          pins = "gpio62", "gpio63";
-          function = "qup1_se7";
+            pins = "gpio62", "gpio63";
+            function = "qup1_se7";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
index 53534a07a1f0..ea7d4768483d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
@@ -120,8 +120,8 @@ examples:
         #interrupt-cells = <2>;
 
         qup-uart7-state {
-          pins = "gpio62", "gpio63";
-          function = "qup1_se7";
+            pins = "gpio62", "gpio63";
+            function = "qup1_se7";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
index 64fe90b2391b..a0b56adb3388 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
@@ -113,8 +113,8 @@ examples:
         #interrupt-cells = <2>;
 
         qup-uart7-state {
-          pins = "gpio62", "gpio63";
-          function = "qup1_se7";
+            pins = "gpio62", "gpio63";
+            function = "qup1_se7";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
index 39d7dad3313b..f7a7551d7f50 100644
--- a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
@@ -244,8 +244,8 @@ examples:
             interrupt-controller;
 
             gpio1-cfg {
-                  pins = "gpio1";
-                  bias-pull-up;
+                pins = "gpio1";
+                bias-pull-up;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
index ce66fd15ff9c..300d38f87f2d 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
@@ -317,37 +317,37 @@ examples:
     #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
     zynqmp_firmware: zynqmp-firmware {
         pinctrl0: pinctrl {
-          compatible = "xlnx,zynqmp-pinctrl";
+            compatible = "xlnx,zynqmp-pinctrl";
 
-          pinctrl_uart1_default: uart1-default {
-             mux {
-                 groups = "uart0_4_grp", "uart0_5_grp";
-                 function = "uart0";
-             };
+            pinctrl_uart1_default: uart1-default {
+                mux {
+                    groups = "uart0_4_grp", "uart0_5_grp";
+                    function = "uart0";
+                };
 
-             conf {
-                groups = "uart0_4_grp";
-                slew-rate = <SLEW_RATE_SLOW>;
-                power-source = <IO_STANDARD_LVCMOS18>;
-             };
+                conf {
+                    groups = "uart0_4_grp";
+                    slew-rate = <SLEW_RATE_SLOW>;
+                    power-source = <IO_STANDARD_LVCMOS18>;
+                };
 
-             conf-rx {
-                pins = "MIO18";
-                bias-pull-up;
-             };
+                conf-rx {
+                    pins = "MIO18";
+                    bias-pull-up;
+                };
 
-             conf-tx {
-                pins = "MIO19";
-                bias-disable;
-                input-schmitt-disable;
-             };
-          };
+                conf-tx {
+                    pins = "MIO19";
+                    bias-disable;
+                    input-schmitt-disable;
+                };
+            };
         };
     };
 
     uart1 {
-         pinctrl-names = "default";
-         pinctrl-0 = <&pinctrl_uart1_default>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_uart1_default>;
     };
 
 ...
-- 
2.53.0

