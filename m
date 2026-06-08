Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD613CC7F3
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927633; cv=none; b=S+S5B0N0LS3VkS5asUqID6bvrdc8tRB7RPUlB0jIgydaaJIjciSSaaFgJLeA1zeOW9ONQFEi8i2+zzqJqh5DwE/uYeA56TxEn8BKZ9Gno4fKd9EotVl+vPSNnlRD3pOSIM1QcYjfQQKtZb2Z5LZDEHkXoOPHY1mSOwywEJBiXZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927633; c=relaxed/simple;
	bh=mQqM1w0igZ6gBceLVpA3L2XftiTNlEyJu5WZnfpZjYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvpmJEuzm374kKhqxNZHptygGLlyWaDhWo0CNfclDhL9d1dH3ijPNpnytMz08/lO5le5Tjj/dqtHkNyrH38yCOAELAvYaSnCiDXCIbpW1P9AwUVgNc2csuYJ4xPl0hrVkGqaroML6GdxjkYSlbB26/JK4d8YwceQy9YT9VBNx1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CP5/pt2v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyuNuBTy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CP5/pt2v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyuNuBTy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR43f3336091
	for <imx@lists.linux.dev>; Mon, 8 Jun 2026 14:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PuMgbKDOyQwBHJzatzWciwXjmsp+q/nFMV9PYpQ10wo=; b=CP5/pt2vogFQ9/zu
	BY6AKFYkcseBG2tu3CPfUAFZ/QYkVNlP10oR+YLVDZHOTf9L+GsOkjMPy/zi61yS
	z8nQV4eRLst/vM78FFTqmKYXr/nVsRNxdjJtu6LKcRgqGaJmO97iGnuft/dQJF3k
	x2FwWNsM2ZM/5rAlFjdSXY1ZX/igNCPdpYzb9rSZT+j0w7jjm85UN5tteoKAyULn
	fp452DF35mf7o9ZhlFPu0HhlnvCSo03diWfzkHLHAp6lHT/HCALQOCPo8O6y25LD
	em08AWL4V/dMGe69kRjVJkVTaExdo7mgwg4mvHA59QhaPnsu9SSDMXehUpmMtX4x
	RSUqCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun411cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 08 Jun 2026 14:07:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32faa62so81081335ad.2
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927630; x=1781532430; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuMgbKDOyQwBHJzatzWciwXjmsp+q/nFMV9PYpQ10wo=;
        b=CyuNuBTyPXtbGHS1wbJxzEfD/OA4ojxExGqAErxNXNzSpEHpPJCHYLW3i78szxtvo2
         quHVxjp73zAUrR7sroPnFhEwZhDDhnZz8E64G3HbBWDty3ElLBnLAez5Rr+OEiseMshr
         AL+RAk/ZHXgylbMD+7Kejtf4VTV/bMPDuxGOTBhUu4fTjLWi21hZVYvHoUS1MEZ9ZYln
         0BXE1Jwvqym/G8RuYdiEfpmJaMGtF2iiU1z0VwE2h6EFbyrbkiWOrvTshGjxD3fsWWwb
         5LMWDFExboWi8dlUCK97Ms07L4p+eIy7hwJbknSSiSCfi9qjmLJbcLNj9inj0Qu+A0md
         XjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927630; x=1781532430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PuMgbKDOyQwBHJzatzWciwXjmsp+q/nFMV9PYpQ10wo=;
        b=VSjLUKdlMJt17UdEPnYIkcqRDM9p1vsybYXVB7+4VFcKeI63lPv5nAyb2TgcmYqOHC
         B4qt+mEw4mc/Y6ugtqeF7U8DsNIs7zEhu8DkYzIR1BUfdXoofn10XSorJYX+7N29gPVs
         9VbKr4EZSBa+pQ/LhKVHsUgluXSKejnj740aclIhOqtRpzIrrKircc9nkkCpDWQGniDk
         eb05BPQ1AkEuOZ54LTh10zD+SOz0nKcdpQG8wwJk1zVYlo1+x9nURltWIyR1W6cGLoYj
         uNqgVa1qzWhQ6XY/d/EbJSyXCXhp1Gbp0LbUf4AINRXMiOS3oSzqB8aRp/iwXUcDG2ST
         Sjfw==
X-Forwarded-Encrypted: i=1; AFNElJ+kmhBO94EhzNlKGFPrPj/2EzJLOTbjGXGnIiSvSCXMrFe7+aeUr+a3ygGSvzpMDsWaUeo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEPkKOPm6GJTeIdZU7QQ/ngkQy92DZf3rkL0YnLVQAeaVi9S79
	2bVmF/ZHxNlm4hddBG1QbkG4PvNPgjNuHQpcj7hr0sflSlGlLaXwrhNJBCQJrgo2mm6k8V/xVX2
	A9CJevwJnlDjsRolRK7G5+qAViByw+OMPOamu+o9oGD9LqCjJCew/Bg8=
X-Gm-Gg: Acq92OHUGQlrOrUIXG0DB0S4oftEhQF0ks5tlN/TJSxnJH9RyehPZIMKbg684t5kfCA
	6QJEJVUTJvsdFgfkGcMF8R48uzj3OnRQWBvg7eq5IYyBl6ssrkU+bWGAaPOG3IR2wdKwhrw7cgC
	0KSKoQHHy5ehVWC3P2eQDT5xQUH4G+E8XBlbGsrqXgCoQC0BNMRXZiFKhryztqSv87Tk1mU1pug
	nKkE7KQHGntCNnb0EA/b9NpUBvXVJYKvzyavGpMuJ/sC2BRQ4ao3Yc/j7VTb3vXpSYbcFz9yf0A
	e70TezUWdQf5yaTuWQEa3F1AZY7IAmXdnXc+7wDnDbZJ0GTeaPgAqSnCzwNd4oZMOvEX/eFVoLJ
	z34H4ndu8ErBe9Z30g6KqtjIVbvTArN7n2pCOK5rXn1bgQlKeqTjVZCF6cuT/Dzw=
X-Received: by 2002:a17:902:ef08:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2c1e820e30bmr194406495ad.13.1780927630392;
        Mon, 08 Jun 2026 07:07:10 -0700 (PDT)
X-Received: by 2002:a17:902:ef08:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2c1e820e30bmr194405945ad.13.1780927629848;
        Mon, 08 Jun 2026 07:07:09 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:09 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:39 +0530
Subject: [PATCH v2 2/7] dt-bindings: i2c: qcom-cci: Document Shikra
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
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
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=1258;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=mQqM1w0igZ6gBceLVpA3L2XftiTNlEyJu5WZnfpZjYc=;
 b=l8C0oDCVF0z+wAAe3f1ETkYCRM41rQ3byPRVTvb/6lKc/KRgZkw4TgfV7TAbSpwLqbckDutfq
 MSCZkcBP86pA3vry1LMmY+U8R5P4bc7WLYWyk1aWsCm5VV9xaA+Ftdo
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX0/iBt88D5r3m
 FkqTn2j9scLycLQ4GgThKkQOoZ/oOALc+QxAGCWEb8OlHjYZhfhErp4IemM/br13kcsdcWNWEQh
 S6cmkpoa7Vur7UIzYpqVpoyGjjA23qbTjGLKlZBsykRuzD981GElRSkxowPZuF7M4LnzD8M35xJ
 T0PbxmW3FeXHkx5R/tpjX1RhBV88ER5tLxuYzvvnL7ORvFBmR3G1N4RhRvP5KohkoQVzNvulrYp
 vJb5TcTd4qW9/vtBt+awAOjYeSEKLRUgVqpwOoHkoxEzubTM12+mrHXNXjw5cdZVwambW0hTztl
 +gLAjQhFtuL4oKMHPvkj/N+DP/hbJ+8dzJd8J3NmYnjdr3AkSy2onF+pMHjDQ+DqOgl5wkeMjV5
 N81nxDqNkfpICV0eaadrk7XHTcLl4ARoADEB9X5pCNMI4tcHTf/kJ7Yhf/VQJs43ptYuwmGNCxs
 OwJ50YT1EPnfshsLUHQ==
X-Proofpoint-ORIG-GUID: SVUoa9TEMwLtbGAblJGFj-2DyyMaJ9Y5
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26cc8f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=KKAkSRfTAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=DZeXCJrVpAJBw65Qk4Ds:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SVUoa9TEMwLtbGAblJGFj-2DyyMaJ9Y5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133

Add Shikra compatible consistent with CAMSS CCI interfaces.
It requires only two clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49e2de7dc7acdc29a 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -35,6 +35,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,shikra-cci
               - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -137,6 +138,7 @@ allOf:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
+              - qcom,shikra-cci
               - qcom,sm8750-cci
     then:
       properties:

-- 
2.34.1

