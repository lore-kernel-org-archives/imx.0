Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59E037A4B8
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704118; cv=none; b=f6hCs7EvyESfvRdM95en1IoDk28XALnatMwDWP5KDgq1utwTWZGXm9wmCa+C6fV39AZaRVYqVBZyM3cbtiZI9pVNUrZ7p5PNzrsrIlRfXSxtVX7NCvipWS7DlX6kUp+SwMEOlFgeoJURTHOBsUeY29pJYLLHO+dOspsT6AxcK08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704118; c=relaxed/simple;
	bh=i6izUJviyArX46Sxz3psV8CYflgOEvKVmFWmHyN2UJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IybPG9oA7PFwq0yyujvKbmF7bQMY9lNqassXO7cFKf0Jp97TZfG5im7QB07HJvzo4nUWDPVrsl/zlgPMYQ4OS1MV4D7IWH0EoJ+qs/SAImcs8S7oRpA3Wf8uHwppvhwBbW+BvfCC1Xbo/FwAMxViSBiX8GjTWKvE04Dh+ihrjj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Si5A8wQk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAIeBKyf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Si5A8wQk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PAIeBKyf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254tYOD218428
	for <imx@lists.linux.dev>; Thu, 5 Mar 2026 09:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	azIj86InPC+CXN10XsD4qgZL9tAaO+Zo/OsdMtMqGik=; b=Si5A8wQkVIgZLnx1
	siu1KnQufSbALw07L+ODCEEgkm7qe5QlRfWt0ge2kpNv6ovG0sMH6lHz/4AYyHbs
	FHvsfOZoYLuqcgA0D6/4ddqRoc4cdAmYhHzFzHUaCkciVmz9aMAem9IZXf1C+wYR
	rJAxk01tTKSGJjHusbHf4rwFcJyZ3QH2fKtwGiIQOUSMlYnzUdLGvH/xNnI3u5yQ
	rGGr9OFZdvLg4uwvHCvEh6YrVUv8N/YAhimUMXhDTaRZ1N5VPglOlENuJvxdfTqP
	B/jpEt987CcmwUT7ffiOx+4BiwfUr6SiA4+rR81NZwXQcNsKkwPxOfsnn3pFZTz6
	yNhe5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380ry7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 05 Mar 2026 09:48:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506ab115571so566045221cf.0
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 01:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704115; x=1773308915; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azIj86InPC+CXN10XsD4qgZL9tAaO+Zo/OsdMtMqGik=;
        b=PAIeBKyfP+/MqBO6cViY6G/fPYHW/ODuKrPSEZFofeIsomDpK1vxmqG6msxE9qrpRc
         5WlMNS9mjamK7/GjV5fCp+AcE8cgT9amNc2ZtATZGsw8WorCHxBNPcZ0iOsyiagVzNo4
         xAx8le7tU4FbQtwmy9+/h44mA9zUQLhjLls+C02OpSFxIjJdZF55KFrjeJvWXMQfD3ho
         bv2Q1STdCzDaR7U95u7R0PjvWT1lKIsPY7yGj27mrlBkNOZeJdM5XGqE51z2ccR1lWcI
         6JOGG7eKo5eu6nsXYnmDTHNQjyOkHFrfs14B5RST9VMErgr6RBW+57cpxqMuRHYV7i8l
         BwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704115; x=1773308915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=azIj86InPC+CXN10XsD4qgZL9tAaO+Zo/OsdMtMqGik=;
        b=D3n0uOC+rb/yPalCjYzXbmKm4t4Eip2p1Zz57pJg4M2pDuOnwyMkh2BR+5K8VDDs3r
         qD/jLeuXbvDYRqIYztp0XFQXTxR1XCxSn1SmOmjqXWNL6Hl3Fs/LCsQoHvpEYnQp/qpb
         er29T6rzK9ekgGc5i4TWS5GNKF26gfZ7ET7TWb+PUNRZS0Uowc0Kvg2+oLQEhNN+ZIbt
         Hb6IV7G0qv6X55Bud2J8krsHCNlQCv18E6kyTESvEFoINFOgczlHAT7oTARMOclW7lpe
         pLSz3wYz7/F59FRDxlA+lOCTPNQQNdM86aBphYhT7RlNSBzoFmGX+OzBoYP8m6c3yA41
         rkfw==
X-Forwarded-Encrypted: i=1; AJvYcCWLpJ5zWY0dsLnzDep3+w5zJHy+VmkbQOA8lw41m2DjNcwCE422qSttXqNOYd6TBidD/T0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCtHA0OdMMsDgX197rgMqdNtaOnko9zGXdg4xDTdgFcsuMg2tK
	vxmafUAcW/xXY0v7UDwZ0s4tpxI/IF08fCGg3h7MsQ6qmRgLkKqMHmBwcFNnoEiEe2U228g/kvS
	NlAUnxqhLCrdPmd5Xvcxas63zhJw1NEPMerRoejNqHZZenS7QN4KWuok=
X-Gm-Gg: ATEYQzw6Rv7ngHyROgtLNoMNmjb+mgXr41YuCr8PdxxqLGXA+mFIroeSJNs0/j2ml78
	Y2zIu0tMm6SWJ/Uv1M4aGKG4pfmtgaIzJhXHj0qd1YyCCUQh8u0QW4kVI2lx1RaeJ4a8VlgmkqZ
	iVEHkrmrCKgC53FhDEsLIuoMmdhNXl/bbOdlMHUqf+yTz8E5ruZTEgZFJeNko3Lx7Z901j2yZsC
	bGXM5nBEGNITaLXA+8qJxfdFu/4DFUAZxDXvhDZ4r+/AKkSnWJD/EIU7B2KAN5PocOGtbHxmk+C
	c9Llb1RNQKv8+bsO2RwWOqWqS9RNCZoMDKMSUYBInZZXkO2iz9KrEiCY3a1xUIAbwTIQR/BvByx
	bQuuJblb+tEg+0SUdjGS0t23V8gZGALoG9aZo3HRNtn/iChL6kb9vw+DAlQFOU501K8UeCUNfw5
	Z3btixhJGw7eGn
X-Received: by 2002:a05:622a:354:b0:507:3ee:23be with SMTP id d75a77b69052e-508db25dc3fmr65561971cf.9.1772704115060;
        Thu, 05 Mar 2026 01:48:35 -0800 (PST)
X-Received: by 2002:a05:622a:354:b0:507:3ee:23be with SMTP id d75a77b69052e-508db25dc3fmr65561781cf.9.1772704114585;
        Thu, 05 Mar 2026 01:48:34 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:12 +0800
Subject: [PATCH v6 1/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-1-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=1336;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=i6izUJviyArX46Sxz3psV8CYflgOEvKVmFWmHyN2UJg=;
 b=61XRv9AhrNpd1bojD8c5P7j8kwKYTzIdkkCrl5q3FdMqWSZvfOltv2e354lZ5/0tJ6DNK/Xby
 xvWi93boORvDrN4S40rT/4FyP90rUd7qmkTAai4hPS2SHvehiAcgs0z
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a95173 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UHGjisO4C0SBheCDbiIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PvqOKd7qdPVjEhDWjS3gBJOYB8c23hN5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX3wL39VAdGEFt
 n0P90MpTmURcxt2Nr8bn7tdFVWzrJaFK/9RAoY+fdU68rwqyByZ4RyJDbFsjrKWiWrtjSNYeZB5
 Fjemkn8mVR8oiW6l163pZlYZi2NzTR+RA7HGhNI9ur5s52Ta8JOq2SC1GDa9RvtIYMc7ypEt5kv
 09TlO+oQ7qbPhxJn3PQRMiXo4++xy9FAT1rQWo0Gar1OdxVF5SUOtoetUzfRCE2StwSZZrdpHgG
 2ErVSAjfZMio/psF+Kd4v9K4mGFHLHcrFjwDHeUulxjYn0Go40MbHvIdOtlIaMjXzK7B6cBpr/j
 pzSwJ/cn6UlBUnJTbJIWpYzNLVPpBIModpv1tylbBh7ZepBCQFpdIqAiCWj8a5hqGOhC5vMR5dh
 a5eqktNdBXME0Bw6gDQFOUV+F+ElQmMuAH95hn6sGdE/13lhTbhRBamzLv5TfbervEexvt41n/U
 WMS/WULswlsLggftb5A==
X-Proofpoint-GUID: PvqOKd7qdPVjEhDWjS3gBJOYB8c23hN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078

Add the sm6150 CCI device string compatible.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 399a09409e071b7caad8df7fb831c429a8bc7750..35d3a0685ac4468d49e68621d0359dea1988cbcb 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -34,6 +34,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -251,6 +252,7 @@ allOf:
           contains:
             enum:
               - qcom,sa8775p-cci
+              - qcom,sm6150-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci

-- 
2.34.1

