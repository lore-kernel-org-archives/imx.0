Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DCE560AC5
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092311; cv=none; b=ghTC+J0A2kkmjHCGeBxn2qKLpOEgweJprw320FaQ84ppKcH9mrWmHA1xEc6U/iX1Lz1bOuV9RyXc6vV0QlANJ0D8FDUcjoO5mOFWeZH6BrN7xIwl80WIg7OL4mOK4tEZgJxU9FJwmSc0F8vFOJ11aFFBT+2ZebH4ffWaov4BFmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092311; c=relaxed/simple;
	bh=h1Jirh2njNXWwpEhevaaC+b4awoAc2Rjo8bbL4rz7r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzjL3VeyjZGfBD3PJvNsMsADSyFA5sYSsAJL0gISILBaWuG7bdJGeNqDUe9Htm7nKHvyi7gvCFpOd8qRgeiAzEXFbdIvo79DqM8DIMNBfIc1szODAjeBKwgqogf6w3sbW5EowcnYwmdObuWopxF95kyiiloqnLjBmZYIq6Dhls8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7JebKBj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsmJ4NFs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7JebKBj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsmJ4NFs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjI23449493
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=; b=T7JebKBjMDSTjcvT
	jvvm6qlOAFp3Opw7JH9XLLvMpxwQ5Jx8SIE6WCmEtK8wAZHPVPkKurHVgh/qpV2o
	af1yerBOqUz8i3e4pe+Ia4j6jFrQX91Kds7/kehSZJVYzUc3KJgQoWA4BJqL8DDU
	z/NSwxieaNJhA9DuHu12joKB/Abvrn9nXKbJz2jnstzcVS1uO+Pq8nJbKDDId+Vt
	2YdLVB93mNnV+gMqTyH0I3xV7VwXGVrJ1jvEzXeu2bgkYHzCycNoSkXBnKy/rUVp
	ht6KQCMYQTaBvyEiZ3nLCL3GzwTDag/ZwEzA/0sOWBjZn25Z5QqN1v4zd7nnZSyE
	tXaQOg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyt6pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:51:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106a836457so56906d6.1
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 08:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092307; x=1790697107; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=;
        b=OsmJ4NFsxdZWLWG0LZZX0dTx3uffufErDMQw1iXfRkv8Qm8FwYbi7j5e8+R7Vxe7gQ
         PKVjLBMzD29FtAq/OIWM2CG1uDozN/Z8HkFKrRIyFHN+SRZVDKz4Q6R/fbskubf5QBH1
         X5CRkRoGScRIEFQDpTMffQSJL03CeskJ/9ipDZ4j3TQSN3TnPafeaWR2RTL8KUJrgBeN
         yV/U9+SMTYQ9D1NrXrdVxjR86q8lSpFpnHjGN7AyQOYac7x/oIMRcpkKqoWeEnqvhdGd
         g6osy2H2VG9EcwQwonbUsqaEE7IOKpfCZDtgjpX21+P0rVeRBjXNuGvt0IqfsqJ80mXG
         6BuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092307; x=1790697107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=;
        b=yGurQDYaVSD5ube5rVgDyeGO7crWdzdgsCbSZ7Ov7RF27SJ0EO/tRm8sIhshI/2Dx9
         D7oanV2EnGi3hELv26tPkiyn3zmxxXeZCgIxevJwh7KX5BBOStCKzyofZmoF/MHIWXtg
         u+PAy9VwMZgjsUvs5ftHBPspXxyrT39DM2xX3WdXGOvqCI0XVWkAWNhuggeuAmNJT298
         s+75whLo21DEw6owmYT4/Jdw5NY+eaEPW2dVIjHHDxKvcFBtfWBWLGgauL01hCS7e+PQ
         Sv5hwKqJLbBDmbsT7xH68PQXL2QUv0sPLjvDhiCSwKev+3Q/qRqtxWggLfdogoPg96cg
         7Rpg==
X-Forwarded-Encrypted: i=1; AKwUvBzJKgFC+j9eSHffgzskJpgGX4n30CGI2BqmK7fAEB9we6+ITCv3jnEwVEOEgiuCRsDj57g=@lists.linux.dev
X-Gm-Message-State: AFuF++m+u+KKv8p4uUQDSSAgQtaKsAFdJRPSVvB8caJo+WXhBzxMEDBw
	HmqZDAfZ3m7K+xURxQdmmueXw3QrAlxrGPrBNEQY7LdNdW3VjwGrXBEZc2FjkSzjKqz5xTRJatP
	DWzM+YzvuskDKxy+bjAnuz77h7xV8xX8jvLcgyBJf5PmAhlTuXlmlsRU=
X-Gm-Gg: AYBFou2sjvomRTS6uRqY6WblddWHIzYwjV+JZVlNIXEQR5k6+GLGtlLvYez+G/oT5tO
	kyoPXEpfPq5sMzSaZlGX9ddeKPal21sz1mgOepcOIL4YOUbazx6lDMyleQORDMdgjJZUHV1yPAP
	RTs/kThXsnHsFftwbhp6hjQJalxBJRZFp5HLjmF7Ki7jMjBH5P/HMdU0Aysg+9E1dlH9tTaqge1
	uTS0rTofb2QwvGdgAaj3mdH9vHnU0So5tX0Sh4pCEl0yXe3PMpAwpKt4tH9fEMNH/0wWRjJjDT0
	ovCfeKXrwgBsftpkPUY8zwbJ27rM0jVKoRC6MHimiw/57t+mmfTF7iZAj2ASbZ2zaBCR97jeo8M
	H7lxbtNmabDSDP5KuX/fEyQ==
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr62342116d6.4.1790092307332;
        Tue, 22 Sep 2026 08:51:47 -0700 (PDT)
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr62341686d6.4.1790092306971;
        Tue, 22 Sep 2026 08:51:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440db2fsm1379520a12.3.2026.09.22.08.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:51:45 -0700 (PDT)
Message-ID: <29671684-020d-42e5-b7e2-f7882fda5ffe@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:51:42 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a_mUQW_V3Z16nF3F57l2yp0SYAL3yvoC
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2a414 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfXzg0evGipfgEO
 aQl/+OdFZG1GMbYUNaorQ8016Kkc0pY6kVGnHPjZjncisvKuBksUxMoKpBrFugfakfTGZzBF/NH
 q74QItgfYxSAo/PmBLAagreb4hy07e8j2DWqTi3bk4IsiK0T6Aud1m7k7IifJ2R60Prq81AyJy3
 s+/SHfNlfTAEjiLFEBQPXIv6T2rTErG2/DqMN0hNHH1kjgvhwCzTPd9SmQnCR2OyJBPI/RO9vJY
 ufJegpO4qC4AzFMhzkwL+NlsXBmhVI8ez6rNz1NcIiDN3Ng4jaWkv39XAMUFmBr60bZ0WBzXIZk
 IfkNOnJEydSHcn8oOoVV3mqs3TSwImm0/GTds1uYB06uN4/LUAfw+1dAkqOVqI4s4imSWILleTb
 q3LKGKujbg91lCcSoRSGApkODynN1tQpYXJwaCQ2ty6DSMES7XJjwMsz6XzTn8N4zfbIB8HwiI5
 QmEmvRD8ZdDq6tZtrAw==
X-Proofpoint-ORIG-GUID: a_mUQW_V3Z16nF3F57l2yp0SYAL3yvoC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX8JECqG+WEfui
 wG++pq0ZoGDcIlwC2JxCg0zxK6+UJzZsh/SBs5FLiBpj6PPcLUXcgN7Ae+JExJmxkjqIT/xelDC
 t4QA9pAFSerPKwszKglsReJADDxWKWs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
