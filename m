Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B26C3C5826
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927625; cv=none; b=SsV64ru1LXR32UAXF1harEGh8S1Ma46Vw2PQCSxI+B54D10QLCYLofcHhSzPtEtTC7H/5PlbbOA8CXKPAd1Ae3bEpZCjThWrGfdGeGwxp0Ijq6d/IfbOaFH9hBCTqf9dTEGS50IdRwiEHkAoYj7Am2eYqOYki1+r5Wi8oy2sAB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927625; c=relaxed/simple;
	bh=sqBeLXIeXPBQT0XNNqkPRB4j43uQZiPT+E6BZggthJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4yLYyguriD/LVVwAkpw6WyUbxkWxmk3cC1Vn0CCiD4vs+fPvGU5udaPsBv30pdI+4xvQB6z2RpOUBL47HaIt2flLw0Oo3AWEC9NoKVLYaerrikmxWvyVOZQk82Z3EOhL+F7tZVaH6ukGT8JcE9MD/ZgaZYbgoe+nC3Peo8DVD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfA0kCOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8ssBErH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UfA0kCOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8ssBErH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR6Mv3336180
	for <imx@lists.linux.dev>; Mon, 8 Jun 2026 14:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=; b=UfA0kCOE9uCPqG3g
	liU0SAShDXaNoU6BsRL/1uOoxrdPZII1lCxyDOP5apMDmj+62yWkZATABGGMrzT4
	fPpXI5IDslNlWAkvAHG7E1b1bUZFxuDNj0yADO8ouA8rB9NsJaYsv3v07bsXfsyd
	BKcOuAUJpxMnRGY8dCkLKpA70LPNej1dsCBrRKRfRtv1zNX2/ucJ/xipDFxj6DeO
	Z4DuTBxCetmLbE1lbAPPNsNxpp2L76jXimYjc7qiiwSqVPw0mt5swIbzlmOBeQH9
	Z22mPW7DeUNRKTcnYCxY0xR4BK81B5VkjVdS5ZDl6gkatRf3Z0Aa6tO8W+3n6LHK
	lEzbqQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun411bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 08 Jun 2026 14:07:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so84900815ad.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927623; x=1781532423; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=;
        b=Z8ssBErHWxjVGrsqoQ/bD7L3OrEgl9ePU+dE1rHD9ExS9cwfXTTPjt7bdASOulK9sL
         io2iuU895ZCbTNJOxVJ+plIt6BEyMqQIpwlQhYIKKRhKhYKiur4piAz6f6bzENUXx9Ux
         twhxbvDNWIGTDYm0JsyvyVWlBJw+A6tczIU9TlnSfABBtX+Cc2Bhhrqai4zOkCSuUjbR
         V2XIcrpwDwjVHuUPcxtL448Nd+Frt7B5qWhASWfqGhTYv1kZes2elFtmRW9V5DRAcBjR
         5O8sUA9OF5nmCY5XPQQJZNDFZ9FtMS3TjZr7Tjd8e0aAfA4ehYmjZGxoIH1ie6nSY0YR
         4odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927623; x=1781532423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=;
        b=PhAfBN8LyXHgqQC4xZ809PZn5Vn6l6uzfZZsq+GkOzE19W1QGwj1RzZwseKLX7yyyu
         uwYgyaw1nSj4MPMRcPqsxlsBP9FHp9bvuQ0QN5GrUTmAWtvD1il2ZM87BENhRlg/h7+Z
         Xapqd5S3VrAf+pz2bqw7dgoHlERg55rVrRfuQtVW2Io6+pkd0cspGbsZANxkytqq3nFq
         jBtzzAmUFZEs0g3+t40AGJaQYdIA+SvbZg50ZaZbnElFFb3D+6ISbym6kOLBtsmDA7bi
         Lgw+clSsG/Hv6Y8YENrvsu3q6U+pYiB8Q/b8+mVyQOiLFSdaslykorhS5zJswutUCoIR
         mXGg==
X-Forwarded-Encrypted: i=1; AFNElJ+2qSR7q3BXPtj56niSQaVMvZ8KSgpbEB6Qis8qX/qfW0xljtTHVJQbyVsVt0V6D8iwuDA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn67uhVPVxHk41mW10zfoYUkFEUWBhVxvXe1IXM6diIXfijhpW
	ksrJwnpiW0OF5PAyDOXWCjPWnJy1a3jHpDnnBCrCItoAPFO21spysUkJCw91qShhMcTQ5urdo9V
	c+NiPDRHtTAijAny1aCreSIB1PqbeEhwkwJZWiUbvzCkvFY75kJKIShk=
X-Gm-Gg: Acq92OGY/Xe1lqneBgz9GP8Ux+syGwH0YKktclXpCAlAEFWur+aBHX0I3ma6lMvUcZk
	/yGexYj75S4/2vL5E03TMWWyH8cI4k+7/aw4Ww3ynTeEhCLMhqLdx0yyx9updC5snFtvzsUpJB0
	8RPmGeLvWoOzWlCY8IAJqkG9VB9Uy1U5cykroL45gXq3SlqKVzHoN8n1MhX0V1nRM3F0UKbq92z
	eog4JdSx1Do3g9kjUnKU93wWJFq4J1y/Wxf3+BCZlMr39A4UP0X0kb2sDJhGVGs0VwpCEUVWo9r
	idk3VYqQmKb1lQUDgEsJbH0xFEL5saCsb1ehzuodIcUIO0XNqWcDmG8K86e/1Q6JdX3jCziu0g9
	gCSY4QgqzNfyQX4oadHyF7lQJmMQXvBmtT+/7LK1F34hqZfAXVhjUSFU/tMATFSI=
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr172955045ad.16.1780927622828;
        Mon, 08 Jun 2026 07:07:02 -0700 (PDT)
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr172954375ad.16.1780927622304;
        Mon, 08 Jun 2026 07:07:02 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:02 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:38 +0530
Subject: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=1604;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=sqBeLXIeXPBQT0XNNqkPRB4j43uQZiPT+E6BZggthJA=;
 b=FZuP+b0PVwGIBsTb2GSNEUF+DkA8aVrDemOfdhdUPeRG0/7CmMVJj+ha+mLWH2JznULmJHKZy
 hFtJycnzNmXCPR/+tv5qh+moHGxZEQjCuwFQ+XkAezb5qj4THlqUzjK
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfXwtVBhNjxH7D2
 akhBI7yfhRWH3wWN/PmOqBrBQVxlOrXSXORvpJZyIyrNl5KMZ8uRMv4OJpPPy+SpPxQM2Uvy+/o
 TbGI7/WuDv6/PMV9EkCBjt+KucqJzHPIyKU3NVubUkXBLdIfx9mLAr6eINVIUEtDxm8xju8fa/t
 HEKcJBAJtB5Mhs5pgDgBku2koOmVi70WWgswvrEzCEAgIKCQF4NrOHVpRb1MIqKazt9wYTkP26X
 Z30Tmu1kLTxpeN4cpDsqJkwWlLw8nx42Yi4CbTWEAzyNAfVSD1duqAmUEL7enJ65SYmMgXr/xA7
 jW4zlsR3rmYdRmC46b9jYOExe9W9eMnheAl1BTaE/rJl9pfmybCYiLI4xDpBahdJDKhYWXNT6b8
 9lNFhtMSyZLpjWKkO7L6RVhNGKcWEZQ+gt5Kbepoz4/EIxRvzpMamQVsg7r7hacG7dGaW9v8351
 k+zcvQVNHi2s3FoaGbQ==
X-Proofpoint-ORIG-GUID: 2Tu7KSJp9Q9ODUU-QRNhN844Kn71bmsA
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26cc87 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1VV9djyPqd4hf17d6swA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 2Tu7KSJp9Q9ODUU-QRNhN844Kn71bmsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,8 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
-
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
   reg:
     maxItems: 9
 
@@ -76,7 +79,14 @@ properties:
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

