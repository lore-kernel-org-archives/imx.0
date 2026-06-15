Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6D23CE098
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512462; cv=none; b=Q9kIOa8bqY3T4jPcQdzWOGOptsVUIWdyxHmk1+AooajwAZJZwAJStGVu1mt7huBspsSjzw9tIJYwDTGy5Fic16AfzZhX5ULtZSylA8TRM4s52jgYcvNFSQybMFg9A8PiZcQV3lyvUES+YBKL0A8lSBLh1MIA5nLfdiNbktpSV2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512462; c=relaxed/simple;
	bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nOpnVTUNr1TLO2Wmu88Lr553gSvVZX9meZ0wKI1945TGr51bpGF1xjpL2bv13diDzlsAjyKdKQEYjZMhqgjh9J0d6pDLG5+oMS5D1gk3RKShNqJZEtI1KvwaVEA4LDYGlUF/5xX7iywR4zIolZ97anDOn1XsIUPRDLI3oiL4FPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ch+9CQTZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bS0bQR8A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ch+9CQTZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bS0bQR8A"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LidE3853182
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=ch+9CQTZ/dXxcWhn
	OEHiPEEmnnGXuY9ZBEOXxs1yBK4bC7sD3QyyAVyGlJXximYY70c+C2DwnmyaKDki
	jRZGPz8CBCx7610QAYu9M9cDfiGqtcfE/TWbda5aLx1LDGjEOSUgj5jitg+rmbAx
	zdrOBY1YSGYhkW4U2foax8PEYTLQUiK7lwHmC80fwf57L9YdCOirbBQ5TvHJH6Uv
	+2OSoPxJVZS9POJWNlIM2OkR6KDxQX3aywJkoU1rlVKK0ek84R5xH8WJrMuS5Xm9
	rGZTem/cNKIM5hOjKUgJbjB20G0YIa8Qi3QJqStRd6WF2nKP8rsq8ukNq3Zcy5UM
	pVz0uw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gxg7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b982ec338so3285427a91.0
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512455; x=1782117255; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=bS0bQR8A1COLFj262HdcBsSyfY23ztIUnvKOqOqxWSo7A+KwEKemMMFfmV2ZtDGjaM
         WbgXB25xSbLUI32cwV75p0WCAmfllOwvUd19tVNCfBFyB2eBQAC4KfsVFppBu5zJfwCO
         jJ00Q/HkrP2PbBJYTP3Ly9JjWsOrgNfT0xsSUMH/53Q35CxWjQXdTmE6PTYRzvHbux3K
         m+XfSJjVzKANHN+5iQ9HLzRyIv9AMzEixQVXBAZXjmYvtuI//CUpcJhcxbj9CFE1rWly
         pBn9ND8ENo+J7WbyG6nN1BkYAfQewwWbXNrQ//BC6Mx8PDXyv0bqcSgPds1lGxQTmG4F
         KUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512455; x=1782117255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=LQFd6Cwl2rwLibiDdIUD3ockXlAGXLTyJJ556VdYoFCIHg/V7+REIPgDlrL/lKqc1k
         eEH2ja9ciAnu7AtmybHsFvMg59BvY3eReiKEbj0zVCSq1hcAasbHyD74UYV2pa8rN40r
         yD7FDcfmSmUsr185kHGl4BLv6PvHiLeF9LGsNMT5/l6jLVOj8I0jFVzHn7cL4ckN223+
         BmYJN5/W3c4JGDunHnFmomNDZyfcm/5NJ7nWhPsAkTV5ZVS3W4lkI6tFgb+1gJUGhITp
         wBwjgSUJ9yJ9y87fLh+SRVQRToxoJvl8RwjosnAZZDzod7RauNVO5NrI43fZ5cdxU/Ld
         APFA==
X-Forwarded-Encrypted: i=1; AFNElJ/TR7pf5moOIlfFQ+PoP46AolIUn1ospgruARAguEgHTBywJjch/uzpYk7PlwiRSvdLZpU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo+hUeidHkLPdvcl2fFMSRpKVTSc9UIEVgFT8HRZoKVIinfg4k
	NoqldbxkmjQNIF4AtYA0HApMFUg+spBigIPT2SwytvfBGoTqOO+Vy9EqBAEpStKca1Mbai8U5aq
	y5x3E/GdwU/sZXJL4RnwL/AuHNKxYLo6Mf0LQorOiVhOxEKZ/IqcvXSY=
X-Gm-Gg: Acq92OFug6rNnDEA+v1EP0yV9dTn0kHZBFJI7Ja9rMENCIL914ZHnQf4+wsLBWJlcTd
	nmBWX8jNZKi94OGsz/Nv3xl7Nj6A4sViC7JSUON/AbF3C/N6WTrdyXBUwn5B3s0gLuCDjHVwZC4
	UDNrHk8fQO7Sj7qtAofSevaeOB3oIrm/FytybqIT6kWSJNKD52eYZrxoKug5QHnKhmrGVk00YKS
	xQlYsKhgWPAVgU/QqEqkrFOkA+l8ADvuaeuvczfofLFvBguYCg9tOXCW+UWGl6PKLVP1Y2fLN2b
	jLV84MP2LUFDGbObSahm9EnL024QDoNYA1KrvsScsSwXqoFn9HfcOyADvB7Bu1FG3GluLDShqPi
	MMlXmwBkGRapAvIQgh66KhtWpoaEjBaD5RMlHBcWLybfo8d7hFnqI
X-Received: by 2002:a17:902:e80a:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c413eb775cmr160950795ad.34.1781512455203;
        Mon, 15 Jun 2026 01:34:15 -0700 (PDT)
X-Received: by 2002:a17:902:e80a:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c413eb775cmr160950555ad.34.1781512454746;
        Mon, 15 Jun 2026 01:34:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:14 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:54 +0530
Subject: [PATCH v4 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-1-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=15Up0J+FbwJVIGRY9JiOD8U4yeRHLJFpCKpZF7hc/+3ZGfnZWARaRaYWZU3DWtZwSxjPeU/aQ
 xdOt8iCMATcCF3QAkYKbQzM+Zsx3S4HetByuuecNdzg5Enl55/MbJmF
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX+DcowG9qABTr
 t/9gsUg75BVFA9h4GQkC3otZNsxRzevVMGcXZB5nKKlCAJ/ptH88xUF+i8FHwicL9SRO5xsR7Sj
 5mRhvR97lvPmiY6Elxw5+eVEt23RMwA=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2fb908 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX06nCml2yM6dY
 uDt5HiiGV1o7KNden5S7RQD7HdIa99CD5/MGaBT9rQzKGad/roN6UeRUHNB41LenmEwDMOsh/1e
 iWsrEOZKtyHmGqn9pHr9tK10TcojSFBIbLpMIgQU5JsHv5KF8AO3Mg2EWSIFBt4mrplmjZHAnhS
 7QoBNz0Mq7QWtam1vj4LYsf5QnNDPqSpdVsNZRwg84YBmb4PyILraB6shQa1K4E6z6mXbsi0P5n
 OuZDopt6nIQ2pu+lQN4RBkfK49OGg/5FAfZ37zdmvIoBTbFlpOgx77OmJaDTS6E+CJj761MV1mZ
 CKhFAQ+apt15cZSXoHpSZE5qc3s0+ra5zohEPvhkrAukpFhdMtEaH5tZwOyED+yRhlfGV01nhzP
 ZjaNuDr0dgx5uJhUpleKNuYB4qnUeZi671U1PN2l3Gw9P3EhARy1iWXbcRU+F2ODVkO67btE9/2
 BVM4i2uMRuryz2f88Bw==
X-Proofpoint-GUID: CI2lhMk6CgSsHVJBKK51TgHVYS2flJLx
X-Proofpoint-ORIG-GUID: CI2lhMk6CgSsHVJBKK51TgHVYS2flJLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089

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

