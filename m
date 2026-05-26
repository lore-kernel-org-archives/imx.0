Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CB838BF81
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815594; cv=none; b=WnmK6ZsXy804BP0XFOnl1C3nDKHq8r1gKiqA0DAyKnIjROvy+3KO6n8e3cucYa7BiRqghzfb08iHIX+o3MB1bTWCsn1okHlwzLjG6unrCDzN44FVl7vK/yqAPa7BT1/wBWFrFL98xw5CSnhS0Pg8Z/7JBc9zwUnl+Ghybeg/NJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815594; c=relaxed/simple;
	bh=uac65xjlQks8nBNaxDifvO7AVmUW4BX94tfMWeRps9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxtchpFjFVt9RoxgRzzZ5/9HBLoyTcE3sD/7HVbXiYlLLVnAzH+QAC77zUOghw71iykThZjf3XN+c7ekSwPjbJjpa3xZrd8SAJpKDEW2B6kA2PviWmIONlupbxUqf+CB8025q5jnTw8E7DPuEDcoXFAKOIJMGbHj7FuuRqUqv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fP85kTQw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhEQ65PE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fP85kTQw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhEQ65PE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH14793289956
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=; b=fP85kTQwAjLmK8j4
	Bt/s9gGVLLQ/MLsVdLGS3ORhK3gKJcWIahzQeokIqZvMK0hye2ZrxAO2J/DOOkw2
	nU6Pchy7qH2n9CHEDOnbIryC6yk6NNEzllAJxoHB4t5O078E9QVpRCJBLS0U2flD
	iNZFW9U2Bzh/0dJv9hfw8gDLh/KAISaVS2Fr9KR63wxsozGbb2UktqHF1f6wMw/A
	QoC+vx0JqIjzuOITbfA9TmjYbJDks0JXkmIpby/XIIxFxvPKFLVCe9JTPeSkJOab
	w6PTPnUKm3JTU8UTtT7WplL8MQO2mfzklkmBuqjPRYYQbmpBkn+llp5tZLDzu/Zi
	s4XK7A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edf1j864y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so5249762b3a.0
        for <imx@lists.linux.dev>; Tue, 26 May 2026 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815591; x=1780420391; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=;
        b=XhEQ65PEJWB6eQxA0rHm8r/wfRdSHq6UGSytw6PKzQZ9yiLU+VXDi6bpAKUqGGD4fm
         XuoEPeSI8r2aq11hjG0HOrFVUWzBG1rVHO3aYLYcqSptYyKS5N+xOBL5hR29ZjPSOATd
         NXSZTEXIp/PL3bFkeK+0HaeOyLMVI88Noz3lp1B0U4fSpQSH61BGdP077kWOIiqJUVLN
         MyR7nFcG7F/OKheNAbZ+ljM3CQ1LFJVaaxYrB9FsUXbfqi+/EklpEg62VqPQ3JGyZ+Vx
         DHMLI5LJzoYxYz7Pf6E63t+7TYrtRGSAj8IzlsSJGK6kKvTx2ZChqWD5i3dFmbRPbeds
         bCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815591; x=1780420391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=;
        b=L3aaks6Tw+YGUkCS/+5uylhbDSGKTANIOIgI+r22bm2gxtycBiKndDpUNCypmF0BOF
         5ykNDSN4qotsQ1xjQI/YId0+ajwTZOaj2u4KW+MsEuvJvEmm0TH1nBIy2kw2rbn5L3QF
         CWA7ifza05ZoaCaX8Lish6hjKTsiE64i8NvRp03+IOSZ+c5/pXkILaeOvszpWEfdkQqG
         z+PFh3H22cLDGWU6/4E7raea/BI5artPvvSUZXEYke642pa1wRmAAggAkZriSwYeMbap
         Jk5lBDSklQy86baFGptUfG+YbBt4O/46BfE2pPY64ug4JlEQb/NlILnQqwFFQoCgEH2B
         2TlA==
X-Forwarded-Encrypted: i=1; AFNElJ/Zty95sLf5f5mI/DYAs/Cps2pQ9ECqMgU7fq69TsqxXGe65mbAZaykOT++B6bFoeov5As=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfUaiZB1s9HmNrpxjiB0jKflzT5IU2yiqmCHaiMH6TtUtWNB5D
	5PzPKTsVSciQsveRluTGNAeqpw96Wudffum5q9loqXueltikbcSdpRThk6/MQc5S9/DAJUTUNmg
	f5raCocRq9qr7BAXz2jT8eTvvLaXUKPlpI+MY43Ascpyd6axDmhkSLQM=
X-Gm-Gg: Acq92OGod6LA9sfc5IZvVA5G1snRVFJ4+cLkX3PpZfiv0Ah5jUDW5EBLTRqII4pECFf
	Tl3k+aLoJnLrcgT4c4rixgp6qjK3+gZCGvwyBh6jt+nB/M+1FgQ835l2JdQZolG7+WBnEoFDV+9
	sGSUJVJs+zQvEKpBoa4Ds+AuwWesg5FTGiyp/NW8G0n+8OPirzgMqAnk2EbG8+1NiFFLf8G+eaT
	nnq9zBMATQnURoEkUBt1T+PF6nLDAtMQxqfrPUtdAvd4rKrU1SPIq2MpcDZH4y1NB3oLMAPCMqh
	MjQzT7njWg1fCpHbZFQu8WxaQmIyy5SToKo/QmKjHay4LGOk/oElK9oZ8j7CywT3b+9r8KBEw/S
	RYu9vDva2oBAyus02BdJN4OVQw43Hr4klipkiV0BsKJm1dJ3YJfjx
X-Received: by 2002:a05:6a00:2da4:b0:82f:85c8:fc19 with SMTP id d2e1a72fcca58-8415f314ba2mr17283036b3a.11.1779815591520;
        Tue, 26 May 2026 10:13:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da4:b0:82f:85c8:fc19 with SMTP id d2e1a72fcca58-8415f314ba2mr17282999b3a.11.1779815590996;
        Tue, 26 May 2026 10:13:10 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:10 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:46 +0530
Subject: [PATCH 2/8] dt-bindings: i2c: qcom-cci: Document Shikra compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-2-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZNjnX37b c=1 sm=1 tr=0 ts=6a15d4a8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfXyP03ABagiz8t
 7KrTxYwavWqVIxu+PU3u+8I10xeeOV5TSd6KANEkBMDMNjRiPo2OEmUtZ4WuhB8g+YarFnGlwK8
 ftg6SyT5nOfq2ufxicst4HbogC6Qb971BZG0RVUE0JltvM2uqmUKPw2JXNsYV3Wkzm05l9daT8y
 G5OahRbtLNbQukQHdab53XQC3RHFZGw/eDtyFvdXu2Uf628hk8KmHEA1B+M51AXr1DeOFIFnos7
 wRNnLong+VbxrjJvMfS1PlpXU4PhSEEpOwxSxz6rwBtTCSympmaU0gjVCZj2UQJBzdDJ9Uwcr/X
 Owpd/nxHdRWuEmfHHaYT8xKI4vWfv881Ydxj3XkuWnTTdL3YBByyxuNT6ZMZq54OjO/p4Nxy39+
 14nVIrH1E2/E7CUJIcRdFI0DEiukwQmA8U1AJICilk4NYFDmUGlJmY4/jsajTPrkoxU+T4amYKM
 bBdJlVaX4/s/OWNquUQ==
X-Proofpoint-ORIG-GUID: TC28_p2vT7Be9bNQk7t0K-xnM6p1wR2K
X-Proofpoint-GUID: TC28_p2vT7Be9bNQk7t0K-xnM6p1wR2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149

Add Shikra compatible consistent with CAMSS CCI interfaces.
It requires only two clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
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

