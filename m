Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08873BB69A
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507570; cv=none; b=JMQu44Kvil68U27Nk1k5/fwXZvC4CDUzH8KE8SZ2qb/rSyqI0cCW41nHFZt6/ESgDDR1rjsCBJehbKwgUPkmp0R1ScVlnxzitKT8bY4yZtXhjvaoCbWbfePvnOC9GTgqnGZa63gKpev/FFIeMCu/hHzqN7NF2YxYZNPoIIcbizI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507570; c=relaxed/simple;
	bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=khV+txVZ4Rd7EIeloGp+7TqgIZuH0CYju+i7+aoqqHlPgaYZUWkJajqSwv/pUQLQyQL3iBZ5gi7ZvDR5gnFllhBurGKW0UUzYCXFYU0UfCIskZYeqCI5HWVem0KL4V5KyuoRsaQoaXennve21WtY5Dn73bisnpekRI7ZSSxWUy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPYp/7V1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZnlMFwi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPYp/7V1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZnlMFwi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Kmo13911473
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=DPYp/7V1v0KJTR6k
	Pb2ikbRoKdm7tBCZIv7ExGns2q6zkh5AJzlF7prfQqdeCXtF6nXkST++T4QmHZ/9
	9iDGAoGPbWSpSQG4+IqdWrM17ShIojeDAzNB+8Bc0wE2+y0q59oEExuxqKCdaG2v
	5v928V9ykaIk+BIz5pfyBpeiIUSs+lcGYbV2eafCMOMJcmTA0bCcLt0VVIzWR9i/
	gbgWMKmY1Lk4ZDTL08fhBI77CCWP6e1iENUwerWdCIXk8pk03H1mSIuSDYRsndci
	EP+9iZke4E05gj9Hg4jM8fkirUaW8MttHrUH7yCMT/OxDIl9l29x0dLAdgaWjVOf
	qd0O/A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6x5u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:12:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b982ec27aso2211409a91.1
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 00:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507567; x=1782112367; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=dZnlMFwi/iALAwwQs5HWCUotEUa8+orF1nsMwiPaCkYSBu5OJ/XsaJkzuKu9k+GGvD
         p8bsyb7epyvFYmLz1C1S0bZ7OKHAvjmVrU2Chj4aXIbhes3PTfidprjfh+qRKbBhCHHM
         O+hoM0M6CW+TOIJF0d3tjo8Ci4eMoH3X1Upqyg+WJtHUgsWxpntLelq3yVD0lGA82Bl+
         5RtbyzlWYkxiZZyYAUFXKA9Mk0c5Tal+UIAof0Nm5q4aU4t9JsK/LQBN5PmCnA+bXg/1
         /EuJRpdd7/NK7K086z2MD9tXe8ftH225Bp6mUaE6QXVc+1ZoKHT5IuW9D38K2lnHtbTy
         t87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507567; x=1782112367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=jBVdOKhoSx9gU9BvmXn525yh+f5Vh46IWTEvlHprLlapvimwW89BK7r9nWo08czTMw
         9nkkCfQ5gfrMm9I7QS2NCtWj8/9ye1t6QzINRhx9Fs2XjTph/Auxeszj/j9TwKGUdanh
         ozgqWUNgbTMWQcekBRiyNwZKhfCzuwO7yLxLDQWE3sRjBpjbW55+LIu4+lju/z99DcUK
         3v4QGggjFiU+X9OwsCzFNhIwFDehX4rZkd7TjjCmZ2rwTXKZTZL9xuJxkMX6eh4JMn7J
         nrHlYtSGG2ItxMaGDi/LhfNsKE58Mjcf6h/EsDXqMFcrV2M9HSlR+j+v2FfTVkkYoM8q
         H/UQ==
X-Forwarded-Encrypted: i=1; AFNElJ/C63RfjR3IOKl3wFpqY9AEWvslpZ27Ae3ry3RsGdbHXrgMlWKVRGnu/QC8l0xUi7hTyKc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqaACjIkvXWuWVnjWD0LUTGRNwQ+avAyI9XxJm8iKeDQaKCu+s
	2L2ZSZMCJbqsze9l9FyySQzwvHr2UfyCrs1347oOjFmZSj12fFmQo7z8UGG1hQkP4StFlzE5G7K
	+VT9608CzZH1ySiym89CcAVLLg5Bx6g8JjFOc1u0nH5731ICV7P+3nJk=
X-Gm-Gg: Acq92OGqPD+6ju6qGb/IsSNckwkJzRt0GGkZzNxu0j0FqbZZ7qR7GB6Ilri2QufJGdG
	y2q2rP8yAEOH2RK0x7X2lzvp4ut+lMmizSv9pJu8EG3onjGEbVPQbDk/LkGTyZXcZ+mY2yRdtMN
	Qmk+8tJ/kRQfF9deZKJj7Lqsishbaf2crOANHgCY0CNP/0+Mu99esK/yQrZwXW32CW/tG9uZy0+
	0k+iAbyMMZzYEky9gSa4zHFFC0rXDUl9BSKQnoMqWg6PloGGmpTnglPWp6j53Vz2ELT/zx3bKD5
	CE71M1xIc2+uRB1y9trmR3Iak8xR5M0UZrqvS/OQh8jORyiIRJKrn0f7jPtE1E2hu9sK7nKqSqY
	8m1SBPvi8tA2z61SnLfPPCRMnIoq3XEQ8Dfcl4wfZf5Hd+iiHJQiJ
X-Received: by 2002:a17:90a:d406:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37c2bcef7d4mr9908000a91.16.1781507566655;
        Mon, 15 Jun 2026 00:12:46 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37c2bcef7d4mr9907946a91.16.1781507566199;
        Mon, 15 Jun 2026 00:12:46 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:12:45 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:12 +0530
Subject: [PATCH v3 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-1-8183481f48d0@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=f6wJE4CawInMX9KIDvKJViD6Wlt5Tb8NHLZYnQ3WetCaKjTUaanZjZR6mQRiCRIVFywgsCQa2
 swTrlMBOBRpDRRcvKXIC37+gh3lI9mSmlKbAJyP4d8IYj/e0sooWdzj
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfXwGpcDxNLd1C5
 r/9j8TZyTRsraxOGIEuyI8bP5Sl8JnduJsM8omfXF6nqMA4Q4qtu8EviXrM6m7Ro/jwAk+Hue6d
 1hX1McRj3xmnK58muCf8VwuJm1X85gQ=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2fa5ef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WdAa8D9vQOvhkG5hwwYJv5lW3CN0Vc3-
X-Proofpoint-ORIG-GUID: WdAa8D9vQOvhkG5hwwYJv5lW3CN0Vc3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX6D7YpAXoT7Eh
 g9K3kIZeZCYMUNDDki3UtNw5Y/+2caVNyhqWKsd8SNVakOgU7B/5nV7oQvKo2BDArMCxxKXHUl1
 6Zas1WyQAqqAWDaKOegxzdBYJ5asWYsTfAG/EsAXfFmrYMbWmTzxjyGmKicuGMiLMQKppzdtqJE
 3IbjFHLcMvX76Qu6JO4+B/jvRtPAR5Hzki1bxWY5tgDO31akryZwQ/E/96qX5o29sxCw0Q96gIW
 0mJlvhZdE59IU4/aoOFGmC9tQhAtBomKSMyA118i3xOJRwZ1NpY7UbsMqdk1t4QeUtN7Dws/11G
 49xd5MpudvFzytKXlZadHmzgUHOJ9vPernD+147wXQ3SWRv3e7yTz1lb1ZOyMINcWh0llbnUDm9
 E72dORR+3nKeSFuY2tp1z9CTZuC0zh6litkiNzG1WyErK51krOUwU54Hx+QpMfLNiu6easdco02
 z9tcmk5zaqPC402v2Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150073

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

