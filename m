Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4C03A759C
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320646; cv=none; b=GDXxCpkfttmAOPQw/xheOMfE+2vubGp3cDcr0wo4WLtIQXwyk/92t5pzBJIsL/uP/TSNlDZSCVC501eymIScrc60dGixpsKWrZ0oPTdAgA+xG/we3jufBzqwilLBEpfbu9dQPFKL7B4OATUK2WCq8nPWQK8IcVW0dnfNIZ6wD5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320646; c=relaxed/simple;
	bh=UDmJ1k1aLBInIvFNqEcNOlLzi9eOR2sEjPHpu1oXk5o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LkKLypV6AUwH0v4ROY//6aPcNcZX+nAvVG9jABsAPIT6qHSX497yXg+LP58HvQEv0rxgvsbYoLfWx3wcfviBLE+TMPyXMCddOW4fs+WnWDKh5XwX3VHOZ2ok4o46rzYhx/k/csv1FG6qEh6J7qI3Szo38PU5/YzxNYYfa99MA4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMm++gvs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjRuC5nK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMm++gvs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TjRuC5nK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518diub4110250
	for <imx@lists.linux.dev>; Mon, 1 Jun 2026 13:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=; b=SMm++gvsFKSE5wBA
	g5VS7Jqcx7dcNO2P86vhYJWGVcerVWx0P9ivsVJ/5bPFjCoumIJr0oItSxwxL+Co
	MliHmyCSqwUR1fNrtr6SMp1xY07Xy3ydfng1lpyPXatpimcb7npllGgqe7pQ4aKt
	7h7cwcYwO5gbtd3kLiHku4DB5teQvOdbC8bsG0kEkAYzy/TyHZwXV8Vy2Yj+u3YR
	f3IiuxovmzbWED14m3FJkiUEiKMRcWCID7ajSWFnS/xr+zTZQ0C7ONhgPE+2Of68
	GrGxcFcnBZDVFMsN43OPuf0LQT3/5ffZWftqpJ7hayxl40W0qA4NOM7hFPdjLvFt
	oRJ51A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3s47w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 01 Jun 2026 13:30:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso2795605a91.2
        for <imx@lists.linux.dev>; Mon, 01 Jun 2026 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780320643; x=1780925443; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=;
        b=TjRuC5nKNRXC0uUVJClexlbsC2dHbTMtxEAYmiJ52ZFOM3LoHWaOsFwsN4gkK6xz/Z
         iHEREU9RokAq5C6Pq+3C9VFMuHs7w2+VOp61aQPqikjtX6wxCIjYkLPavFEgEJIjlCqs
         5fah80R4kL92QYzEQpao+GcbAeBpS2c9sDpqXIqS9RBSIcHBGh4vsz3R+vGVgwmiCBkM
         MO+IY7J7xC7dkjJQF7ImdFzMUTNDU7H/3pt/lx2zAVq9JfXH9WqVYNSZAiag0oFIfC/t
         ThPfgW8fMjJuUACj1Ysc7lz99qwOTSI1cg8Qin09R3tP0hILE2eCRu/8bTnxHp/ORQE/
         JMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320643; x=1780925443;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=;
        b=VNwiWNfixrbRPI4W2M8EH5JNm8a8gf1mQboclgSAIxXyD19Xef9MWfsyf907K14Li7
         q5QydvMDHR02U/8kdHg6njdGzUg73+77F5ii4IENvd9ZvxhtHEVugGdMdeAZmRWApNh9
         MZFXd7qtNvWvwitnRp/rmPDUUsqY5sUarMDtyuIqFbXejvxJCOCUQQeleVl5DOgFCBM1
         X7QYtQXU+GVBiV6+6AUnpM9tRuDqoIIuMV6rnRvm6VHi+dbbQ6M1uVq072v27SuIEwnT
         Q1Y8gui22zAU5ODE5CgcVIzTOr02VrXt+bUujZ6GKIA3//yxwWIBp8Wt2oRr240RcP/M
         3xzQ==
X-Forwarded-Encrypted: i=1; AFNElJ81cyjo2TqeLH8BKtXagF0zUUrlQQP4ropoMxFVG5YLt66rxtTYE0x3jQN1rM2BOlaeHh4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4E1Y1TLhnVfHHU/S6lEatqszFRfOgPBwcZPIFZY6ou4R5saKf
	dsLR7mYMPf+um9U/smSa8sKJVkJmkr6oRN6IXvYmTLM56Hc1FyEvwjzR+DIJ48+TsRPbp2MC3F/
	y1jUK9R4zb1BSOuZyzUfy0WxZV8ltr+QE4C6yVQbWTTHqNtR0jlmT1/0=
X-Gm-Gg: Acq92OHSlWmZYH5fUre/YBIt4KtBIRzyBlQ3wHd0J6iquqMv6ANQR/DPooodzm9KqTr
	eSiRB1piPEWDWNYz6PpaLp4jm8AWcaNdjyGVIk2dPSX5hNsLqYvRLVMh/DYLh8is340KhKsDq9q
	opCy6RDF1TGkC/dGbSaHlSUULg+jm9q4JhT1m/lEA9K0ISNacWwl+hotycz+DLkGYfdyH11kSUL
	i4flEPmBHpdwexqHeWxcyuTB6MYR8eYfBKsFTVM7h0xju+ZLQiflUqSQUOasd+MTJyfrF8u8W7S
	LsKOBvJKI12OzfmX0fclQqHQhr20FyiKOE6fHHZBOy9vVNus0/+VGeAicyvsrZxMB/7/cszDPnV
	5jjb14r3Cc7A1RDDgEMUGU4dctM5+/YRg4A2knfK7A4oiQvqpW7bkBD74Yzb7xA==
X-Received: by 2002:a17:902:d58d:b0:2bf:2e28:db28 with SMTP id d9443c01a7336-2bf368263d0mr123080645ad.29.1780320642779;
        Mon, 01 Jun 2026 06:30:42 -0700 (PDT)
X-Received: by 2002:a17:902:d58d:b0:2bf:2e28:db28 with SMTP id d9443c01a7336-2bf368263d0mr123079815ad.29.1780320642277;
        Mon, 01 Jun 2026 06:30:42 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6ff5sm143718315ad.7.2026.06.01.06.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:30:41 -0700 (PDT)
Message-ID: <c1d1a8db-9cd2-462c-ab6b-d14eb97c644c@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 19:00:33 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
To: bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
 <178000641103.4557.14582699057810501776.b4-reply@b4>
Content-Language: en-US
In-Reply-To: <178000641103.4557.14582699057810501776.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1d8983 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=FPLoCuxg6rETm2Q1RYYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzNSBTYWx0ZWRfX2Bm1lxqHI+Gf
 4wBXQHK8aieT7KKGRwEDkDM+32qOBzhqk5FHMUXKdYvCO3J9OhG4u1fqw3EWeVWh9lrhAZE4vl5
 7ZP+4Hv6fEBK9Dgy3FOgEhXWBy08jRbN3bdkqKRvgo2ADdtind0cZuVL8UA3621nWX7MGgJ+ffb
 qBJo5PzYEm1+yYBXnqIJ3vNohDXBuvgfNuPWeB4Ch7jHOuaLS1UY3wd9MKAWt2+Qd+6L47DKJXn
 wu3nXlAKFae1gMX8nrtTrrANnU9B7qi5o0nNmFABh/6Ptxx60pKqBnIMoZNZOFWvwI7nmr5pbGc
 6ZnobtViPQqaNlyUR4gd0/mJn1Z6mqNV+InU9VCt+MmO1H003f2CFYa4bY9Z8plMLqrwb6mAyoj
 dK72eH4Qv5OjiIeGUUsMYjIGzHyGwCSLHKA6aSnfAFHsLOoSvu3J8HqiHoIrdOWWg/c0NQP532Q
 b1kjk0ZctddXqFbGF3g==
X-Proofpoint-GUID: 9V27zNr6MsoOK2eOvW6sZOm4JlfVKSWb
X-Proofpoint-ORIG-GUID: 9V27zNr6MsoOK2eOvW6sZOm4JlfVKSWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010135



On 29-05-2026 03:43, bod@kernel.org wrote:
> NAK - what is the point of this identifier ? It literally just adds a new
> define and a new string.
> 
> Unless there is an actual difference with 2290 which thus far we haven't
> see, this new type is not required.
Understood.

As mentioned by Vikram, Shikra will use a new compatible string with 
fallback to qcm2290, similar to CCI approach. 
The CAMSS_2390 identifier and the driver changes will be dropped in v2.

--
Regards,
Nihal Kumar Gupta
