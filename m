Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960A3382292
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 20:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789246684; cv=none; b=I4WquFqFXuu8ofBpJKszfG09+Wnlh8Hjr2NNI5TyhORMJdcO3rdX94bfyPTHNOlYEASYjE6SLCDfO0VOlitN6Q3UTzJKetWRt7qp77pAjVInWg1eylXyPp3+j/6ZrB0lTACpXdp3tIdDtdmCaKp+ARvKimkNUvtuDMfftD1NjqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789246684; c=relaxed/simple;
	bh=yDv4E3nFxbJNVOjCwEv/RLNS+1uCzdQdmOulZITXdgw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YFFZotcc8sIPGBw23dhonv40cwT9EKQnnOAGNltkkQlkmXekP98j3vvB8yAQIICW6t2MdDvlShQ5fnVtO92RXISTjDBMm/XBkLXcwxsnVgzUt7XXBDSkSg+c2WYZFlOVSf50qyHQaBxayvsI10VYfgk383JPjA2gx4rFl58pyA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MhX5Xfkv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bUSfcAq9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MhX5Xfkv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bUSfcAq9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI4fW63675870
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 20:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=; b=MhX5Xfkvk4ZQQ6g/
	KiLgU3Jnhik938QvC1TZcJUQhVGx6Aec/nDosu5TSQWGdLPmXg4d63G4TR0PmiUF
	Cin4AjgXj98K2DrMkrfKHuCE6o2gOht947UIjAP1hMdXbl1RLi/8b9ann2dnAhzG
	m+SvtDCZ2l4qwm9wlEMPk/KUohnbnKkXD2is9ZubQaMn9mvYmol/ac09N17MmOqO
	lZSrY5rDMmh3K9frCbkPHNQsghwuQZtv1W3/nFzH1+CPRd4qYq1OL1hdQXhNSqpY
	V1bxrT8hGN/BAp5Ogx2He0gf+OpcWXPo0rk+RKd94Vh0up+LukwzO+9PqVlO1EKI
	cofpHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c1w59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 20:58:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so370344485a.0
        for <imx@lists.linux.dev>; Sat, 12 Sep 2026 13:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789246681; x=1789851481; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=;
        b=bUSfcAq9jL9UDdDS/7DRR1vaiLRU0FB0WG8Ef2Qt2/ymznPwwiZ7BggcKoTyKeea87
         qxABNIglr6t1Lg45QA/6WPP5lVsdqudL/KiAtLjUd8DqViKysh7CnTfS0osGI0y8bZsR
         r9z0EBx9hfA9iiPjlgV64kw7P2PXi+9fUO+xHq6sYYPuQ1+VhmJCxbN0e0vf3CGejx2F
         M/BvEm6vwEQAF08mZpiLjI+Yz1p1aksKe9AHQUfHBswS155oYEK74ALbKBSZF/FUNa6v
         HdiIyhcjebM7xYbAvZfXlZTqVWkkp8fvvd8v5N8vLtZ2KillfZJiwYLsvRv5xgnZXKHM
         x3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789246681; x=1789851481;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=;
        b=Kp+quFnAOxONC7wTt33NP23l94/BEVyiztqnygIgEncm20s2hcbtyxTsMyj8Sr3ZDV
         ykk/4o0Q2BOzWsNlJJIV3wBcz6Pr8Kk20nO2MV0agkgHYrDROFXfMAzz85C7YdPm0YUv
         XQtVqnTjmhGu+s2AD/FB1s7JJqjw0za7UTraKYsQY40+pmcNsQKQZ3XGrtW3DY2lG9em
         UIXqHGLIyOi7wR40dc4cTFZHyfCEaxZUm8nnUJk/pNKrZz+w9/mdZ24IxMnvYewa6MZ6
         hTZpKSoWrNd4yYFXHkUEVUWGl4btENKVil8Q9O/gCwr5lS8wUBU+3aVJYiCucTzDGjYN
         1nGw==
X-Forwarded-Encrypted: i=1; AKwUvBzasvFMqiEsBQLA+uA1yvWmxdr2vwsq0roYylTxqh0WMn2qZ4DYMCiKq6F43Vqx9pwknsQ=@lists.linux.dev
X-Gm-Message-State: AFuF++kZYvkp84wSGF5SAVGf+sRl1Q9drvQMNqCN4M3uwBNqzbqSBPaR
	E6Z66Ao8pUCLvhShTNvPprSE8xEvZjKF57z2+zfnvrNnGkktk9B6ZUmBsMfoXUkkg40LDGJzaQL
	utwuGBNHAOyNqyKUPZCc5WK4gc4izPZ7xx2+lizdPPX/g4NpSCbd5aUs=
X-Gm-Gg: AYBFou1QUEUkkVc6TkRIZyApiirYrcj5ACn6i+Uwcl+gBWCs2yh1cj9ao86Waqb94xy
	PhinrUbUHYx2k1b65pd/JUCB1l7wB2xAAYxVZEtvPfXDPQBVjJN/z5tSQsbmpN6CYyHkeCk6i4/
	uNcreM+5/WNrSQpqi6SXumJDioTLG5hGwHcwlbWKGIxKJJSdCaWry6nmYVrtL8hbwX+jYE6Um2M
	/m/VLFh8yUxM1wTGYBIlEDk3pK9vhJq0rdtQD1ZPj4ezRCsV/2Gp1HLZOj8XXWSM3Gd82UkAPjU
	KIERET+98Cmd8ImVZO0V1UAQSfg4NE0djn9A6QodYNGA8L2QV/2IQdDVkFvqwMB3bXb7IQ+hJoK
	D8v3Xfl17DZ9s7Mh8d1oBNifIJxmXLySSgQKiCDB+mZ3QJIWiINDvc/ggxKbsscWmqv5J3s42Wh
	tdATmIXdajYAhqgZlZno2xTBI3KsVAN+XaQDWzoCWvZy1s/5vyAEW4J2Wqs5AlHzoA3go=
X-Received: by 2002:a05:620a:4386:b0:939:6db3:6cad with SMTP id af79cd13be357-939ea13c648mr1411257385a.12.1789246680716;
        Sat, 12 Sep 2026 13:58:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4386:b0:939:6db3:6cad with SMTP id af79cd13be357-939ea13c648mr1411253885a.12.1789246680244;
        Sat, 12 Sep 2026 13:58:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b59644f2sm1993071a12.29.2026.09.12.13.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 13:57:58 -0700 (PDT)
Message-ID: <a7f109e5-50fb-45ab-bf8f-c674d9e8fb3b@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 22:57:57 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] firmware: arm_scmi: Fix
 scmi_protocol_table_register() error handling
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
 <k2agmmtgq2tbx2zyokidn3dsdkcjpdjbasx7vlch6b3xz5sjuk@pfhc5npwwegc>
Content-Language: en-US, nl
In-Reply-To: <k2agmmtgq2tbx2zyokidn3dsdkcjpdjbasx7vlch6b3xz5sjuk@pfhc5npwwegc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PgP7Rncrsb_j29uxsiaa4GWODzM3qA3W
X-Proofpoint-GUID: PgP7Rncrsb_j29uxsiaa4GWODzM3qA3W
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa5bcd9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ePD8OZhNOdW2f7jq964A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMwNSBTYWx0ZWRfX1dpOadA9LssR
 lUpCgxe9tSf4UXah3PCfSiuikCRLOL9HGWODgFU4gvSCZyx22AnM3dAjSxTv76E15yZHRIfeUpV
 tLNCpRomzlWycKwveyaQTl27Yup2X0PkT6LM+8e5/fXT9GmHzUk4fzYz3guIh41FgcBC5nCWDoK
 Ru2BA4iruqYKC7CbE407xmh8HmpEtpW4Z+cJ9+Sz7ti/ZMJshzGebYSt6WjkyH7oDAzz+Pgne4N
 cfk/Z64uocOobXXalpFyH3vaQAHLVa3Puis/GQeqkJJ2PW9RAYsoF3mAltVADlrA0x5sOxqJU76
 VKSCYgbPfHd1bulK1AHv1BxcLdFDCQb35NvRF1cvsWW3QaHWAxrhjwwYC31FFRI7QfejPc2nT1m
 miHcOCjRo9X7mj54aCe9KBfKqDnc7jGMJ4yeeiLOUGU0aZo2gsHDMsrzLjhchoJXxNtI9GaW/u5
 fdwPKjDwMd6YXa7zkYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMwNSBTYWx0ZWRfX0V6sSejN4hTT
 QotoxKi0ObxzcRNvqoMjnFkfPJVLxyfPV/XNcx5/zAGafTwnR5u9vJ6/uFs0U0/lLmoXQE1v+OM
 LT8mIYmeJ1kOYh5HnF2ot83zxAd8LtU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120305

Hi,

On 12-Sep-26 22:50, Abel Vesa wrote:
> On 26-09-11 17:23:27, Hans de Goede wrote:
>> scmi_protocol_table_register() stops at the first failure to request
>> one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
>> previously successfully requested device-ids in place.
>>
>> Unrequest any successfully requested device-ids on error to fix this.
>>
>> The code manually unrequests these rather then calling
>> scmi_protocol_table_unregister() because one way this can fail is because
>> of duplicate device-ids and in that case the original device-id must not
>> be unrequested.
>>
>> This also moves scmi_protocol_table_register() to below
>> scmi_protocol_device_unrequest() since it now calls that local function.
>>
>> Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> This was already done by the commit:
> 
> 2224b622260b ("firmware: arm_scmi: Roll back partial protocol table registration")

Thank you for pointing that out, this can be dropped from the set then.

I believe the other 3 should still apply cleanly with that dropped.

Regards,

Hans

