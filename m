Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06035375F82
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934937; cv=none; b=mxP4kBtnW9xShio01PJuW/0JoDE/02mupcxGnaoXiRquCoqLEQZat9RMjV0oO5oCZngL75UvRjZ4D9LCzdLX4SsQ1A+ISahVYEUuIIB7ZrpqdWeLtVrcUvCNvqI/mQvwokHp1xTbqz1OZSWznISYEkcXIpjiSX71gVm7djKVYR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934937; c=relaxed/simple;
	bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OpGovHzQnk22CB8Gv9ZCuxxsQubLvW7tLqEACKiFuSGOfPmpRbgdUOZCkkf7ZgeeIAjiwfRLeRTNi+Us3TYYc7hSnFh/xK+AuFLQlYZW9FldgeV5YgHebFzrcZEqd5HGz+iJix311dwuhZCVmqyiOvKE+dTsXH8B93gtrJP/xug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIYxyBky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvRSMQXV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIYxyBky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvRSMQXV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77ONh810510
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=GIYxyBky5m8eupY3
	/FMWpds89QQ+q6BcylUebA41TWzsLJInO1OV4uQLUK+Iw09i4/MpKxJF7sQB2kQg
	UBhx9vwsdb9gWwC2Q0qG6/0GWNGkKIm0Pj91x84+ZAxFeoN76yv0L6PZEa4u3L3j
	z2BpAF6AmoUwyXQnxIl0ZV7pTEkBWU5Fq585FmzVXuek6zKwFW/XHPhyFhvRDnxL
	yYJdlAD2G6BipExsveIbR88kzyvWf+DwgYhVYZgnCMRd5tmicsltPKq3fXOhKhf1
	fNVnCiZ6V5qjHpK4nAA1gJIB25WIk7rBdI5aufxkmwnR9KK3qvzUlNJDsItx80T0
	zu0fhg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsrh64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:28:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88fc985a65so2891690a12.2
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934934; x=1784539734; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=QvRSMQXVTNwiCUq3oqLpvUrgrYJImkh7Mc8APd0JDbrtPvOM5I4VB7q2xPShJhFBTU
         TMZmMtzBkffyFOjc+opHkRDZco1CJv6yf82UKPHEkUDLPOy3IIO5ZwCIwwaXOSwf5GWZ
         +xKwDZF6E8Bguo6BQv4pz9/GiykG+QsOkCUSsMTD7oh/KIjV6dXeqTB8Zi+uP9T7hpQs
         A6QoOhDFIfWdl9MOALbwBrbWdUEX9wdeJEnqEfb+zwIEzXy0K6x07u1LtlhjrrbYfMnG
         F+Wflf1tt+B0MHu87VxQKpWLy9Djw5I6yweKde+Dz1GTdx80hhWLF5Cx3gV34pf4qk+s
         s03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934934; x=1784539734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=SYhUFzz+SwcJTFsZXFLo0z9vaiAXbGzjD6yiJqov73tjCsvldWFfu1b5h4v9B0m1D7
         ENcV4k39M0ToPY/gl0Lhbh8kKkNeA+8R5oQ8CI/BEjv6D7V3nhAmbGXSj0MUTwPgYasC
         avkdNizKEak2egdhDwM0sgQybXRsGtcuaAhgpgbYADpRTbopbGUjbD6iFBAbGSoWMoxq
         2C41wdXBVHg5Cnz8udfElxBtGdC9RrS0E51hHxEmmdKbV5ARMDOLosP1RVNbnpyaQmWA
         eUOv3ZjTc6gXJlQ7Gmt7YFF9Y+knZASoNGrZeOGbwXd/jq031Eidpxx2ORGCdiSjFDdJ
         Al/w==
X-Forwarded-Encrypted: i=1; AHgh+RqLsw4vI5yRtrYsNMQLJm3LyMBUaloLOUx6PeB6iEeiN9vF6fA5f6A2KOuFM7aP8Txo8/U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yylr3fzh55ykwRW8i+RcWwBc+cC2jCCd/teVycf85nM8dA3NddY
	S9R/6GUOasv/uQnrANIwraz6ofEjXsKShdFygWNjWjq1yL7q7imPEL6PVtm535Rz8PViIiFFK3O
	+cRfOROnbat/zfUky+LorBEHhDQXtwlb9mVkdBDHPct46Z0dH8iXCMh8=
X-Gm-Gg: AfdE7ck/S/vChYL8xK8QzuS7u378HmfHnFUmgRNOnUKOO5pmYRB5w9FtJfZe5FLrfBn
	9XmvSk1OAwl4OyYZQLlsba2NNVn3ghX4qsaTLpVa2Z/paudueyPeLE1Mjn3ZE38zPwtRS5YSRzz
	HDrSSEljMaX0INks3IK0R4fky8j4c03i/ZHP0tNHi6isEzqPmVSlZO6pd4/1HC3eoSJfwfDnOC2
	8Ce2/zK7sE6f18fmczreZ5rng9o18asPlk27QIRXnRYlhjIUlFPevkXllqJ/TL8HfFZxVrj2cqz
	TAoDiEjXwCHG6Cll2q5V7mGhCJFta75+zMpUG5FtNXHuLtWVlZi/TqUyynNK/PJI5WG5tMoe01p
	aCe5envm83LKaoEJxnlgJHy+/ibUxdRHoASTp/j1tYA==
X-Received: by 2002:a17:90b:3d84:b0:38d:dc13:6f94 with SMTP id 98e67ed59e1d1-38ddc137054mr5567325a91.37.1783934933938;
        Mon, 13 Jul 2026 02:28:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3d84:b0:38d:dc13:6f94 with SMTP id 98e67ed59e1d1-38ddc137054mr5567306a91.37.1783934933515;
        Mon, 13 Jul 2026 02:28:53 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:28:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:32 +0530
Subject: [PATCH v5 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-1-db53be15dc4f@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=+t8Y8RcdzA2kLv4JripQYvKr9E0fZ7/IV7iHkNwE7x1Q81Z3ydtjnu0AhACBMTPXnbayPkTm9
 ZDCRrTDZrY/AXCpFjUng8Y6HC6anxDMgvAUrsXPlzZIGB4EelIZRIOf
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54afd6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kKdOyI8YbDlU7UpLM5By0JK00Ymwh9gJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX7xyb86Wbf4QG
 ObeweuYynAFfIzt11vWNVnTzucBHUcWxDow/2nPhPQnLHWb+XWtCSVtLEyIBBTBpyD1Pfw44HWD
 lV3ZG4QX0dst+v1LhTZ0Yr5oomFUL4M=
X-Proofpoint-GUID: kKdOyI8YbDlU7UpLM5By0JK00Ymwh9gJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX2F71N7sOWL4m
 YDTqIljrZWjanV7+Qehfg1NcvDPIqZBnYxxwP6guPN3xBotPjNQQyUgQHGBcrXDPh62VbH/FXqr
 /zEgmJG9m+CRuAKgh2/ewc51LlQfYGR/ZvDZJiML9uKJ6bHP99YPGJP13P9OvknegEOL4jMruVb
 jQXhNmZkAzIsrrdqmRULB1768TUIjcJb+Maym5Noa47H9dCwTNoX51SqLYrl8ewnJenyu3qi2dq
 CV47HL8UEzl3n3EhCW3P3Bu+HIjhKEfPa1sx3aZ734ijlIA7dGlSkEEdr9jUtT8hYdV/YGSqlGP
 dygtTgxQwxVQyEKp7jKUDVCLSTrWPaj2P2gaOZoKFUtzZN7ZiwJU29H2QQ5j0MWTPjTER3c8WaW
 T9wN+w4QwKmyVo6vq4QhHXJWDXuN2b0issh/6phSGQo3KUNZTULtla2oIYU/zGsteUAO6MQka10
 YkisvO1Y9ctA4v5rWBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..490a7f3a8c5ff9c624f46150ee651793811823de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
 
   reg:
     maxItems: 9
@@ -76,7 +80,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1

