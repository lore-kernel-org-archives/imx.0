Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B304D3D5647
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742930; cv=none; b=XfZSf47TiP2y0OUYr3D1Es3ZS8tA3aF+M8KZhzq40dF2UgZeinCuLKRvJ3NK1IT/JzlAETIza+qfaYB8djWU+R1H5LVsMbCRgqSQG/N/m60qvgpYLcVze5hI83aGj5msZQhq91AvZEi9cbi9F0CiayDztMMUUGWQ1Z7jBhSU3mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742930; c=relaxed/simple;
	bh=grQaeezD4loaQ3dOGxCiDT5OfyrOGQRea/DATIc6/hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRlgUnb7FhaeHNmj+JfaeQblp1BY1MbxWc5N2bbCnYEhbpGDS+0neVsnngoTS/5P8UyNBR1qX9Pd72OowDDLB3aQYKUF6rUsgDeZmDVdVKn9Eg7WvdzqjVFOMiCApU5yhCUuULQHv7XZHxYvuNJu6+sVXZ05ByYzu7pTzTqtLW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neK5cG8A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U6qrTNUO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neK5cG8A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6qrTNUO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IEQvCj1020014
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 14:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=; b=neK5cG8AuR+jOvy0
	3tl6pVJjFoD/X0tupaQ1EiBON5lQjYY3VACqmtdocu5OJ2ylQi34YJ2sv/xBqw5J
	CxZp/+GWO7uPW82E/UCudAPEDe21rD4bP8LsmNGJGxFwThFHdM3MjbXlf2DQn1mx
	p13KjkULEaCUUX4AGpb7+T6326hRnViTMEW1fLL+sOSC3uVeaZGokab0OJNyRpwe
	zJ+Nk5ckVD9QTx/GIF28f1UWYgGuFUSRyBKklfmVG1LCB2v91aBl6Y+dE5h7m7a4
	DiEP0K4433MVL4nI8JYmmLeQHZgxyFQiizLYW+S2bMPsRn9EKCZvK2DwEeabTq3U
	oru+gQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs72u035m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 14:48:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so172811285a.1
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789742926; x=1790347726; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=;
        b=U6qrTNUOshXrE324NtN237LND+aU96KguFGnHWLERXq7WwmmkNurW5hctOpEJMJ7H7
         DxCr10hjLE1DY7K+MQu43jdIJwSJR+gg2igBzdQmsF9Q56nu7alsD97nGfbKp0PuoyaX
         s+H0wqiilWTygBnBtGuzjnu4YjZmHpvJUXhn0TJJhOnnmqg4tqsntEyESVJKKyJ58TQC
         or3ywJuVtbX/hHz3LB4ZIm5cuMaLVoIozou4DZ/fSzp1c3jheSI+XIesxhIIKIhxlzkQ
         E760kT/LYJYV1wOg8sKj9Qbz3CuF+Tdun1AYgBG3Qg73tw14jjrMdsaAX8ldMKo7Dsx1
         XLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742926; x=1790347726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=;
        b=uon6FBwEaXtFjvshijCQuwWZAlVRgqUEQfMR0OUHTs15uSTp1aiFKkc/iQU0SLcVKw
         kqiykyAgSAdWgWiXrIhvAzfWahkczH/gssITpoOBMkFFzkfdbVdQQuTWWHL1IlSkf6jp
         M1lqPQM0K/6zuS7Qhj1J/Jz6RnQ+4NadWFbkLUMYNX9hBMr3ON6fw3lA15wEjKbMxsBU
         eIEW8AFRdtYr/pP7/CUg1n5fjpbVtRxK84Y9bJssc+eJgX9wpXpDYXuflC+8yylsjGIQ
         NSprumLwGC0F8pEGEnFqjy6PhK/2al/sTU7qXjWJu7SUoisAuPOYQlWa0x0d5zCDfkuU
         hLog==
X-Forwarded-Encrypted: i=1; AKwUvByUKSmtezWOAdS8GMaw+b2hJiNq1OJJSyw5jPQmbcl8dNUVULRNe9tVNhrw0qMVy1jsotU=@lists.linux.dev
X-Gm-Message-State: AFuF++maBDlKGTgBOybQIb4KBMGhUP8aSU/YJKKgaAFxovzwqwB5iRdS
	aYEWvKW0mkjkKTF4gNk+5DC6re7Hs4rvgizeVnDOqcSp0p32w2cUg5UzaKtd8BEy+fb0U7GSYs+
	nv9ZDmb9H7cfOiEULJvsvAo+6kVqQj0HBIpkV+Xp+n+quGajr32blPbQ=
X-Gm-Gg: AYBFou3+vGLe2qd5fQieW1op33WKWGAb8nvcbXFpXRwE/kD+fy5Xt7TP0ArYEM2qjGK
	2iNoIySQ0evFv7dYXw8wC4rg+KcrPg3qXu06PfeCCGo5LdK3Jz9Mlh1OFt6BcALHqZhdCqnIaIt
	8yKN96lPI1c+Cq9FU+H7ZYa/bEEqgNI0EVCtigrkUOHtL8Bgq6nZSDapNeOnB6k9HXuHda7jeCh
	6qKjWYJsNIqpVM6KXY61LSK1m4QxLr+R59RJXPAs4czqOkV1VXk3W2WmOqLSD3LkWTfhVK1ZJyp
	S/j1VHqFUo43J/Lej9U7nBvRXp+hkx/6lNiAUi1mAp0ZTfhlnArlO+JwfTxdCr/VFw/l4s6ZUta
	j64ikyX4dhMUyPd9R9Ikxa/GVPKmCFQfsRwZuNVYN2kOmtmvj0zB4jN8q5w+nt8Q=
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id af79cd13be357-93bdc7503a2mr376114085a.36.1789742925577;
        Fri, 18 Sep 2026 07:48:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id af79cd13be357-93bdc7503a2mr376109285a.36.1789742925068;
        Fri, 18 Sep 2026 07:48:45 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcc1160a1sm12355955e9.4.2026.09.18.07.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:48:44 -0700 (PDT)
Message-ID: <b5a41e7b-3a6a-4c1a-9475-b40e85ff4916@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:48:42 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
 <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tcZQ2Mx-cU0B20doRD8YVZnIEzhsV8j_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfX57YewZWuP8A5
 SWh7KATmPwJBQsgAiks01R602+aGdMhJ9Z87qdDlkDPgFbRzsqmC7AWZswgyn0SRePFm7sveXbS
 ujU6AXtvNE1CBkG8QkCG8vwqZaLr9dw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfX50ntERmYB2XB
 UFEJ+akRux8pzdiWIzpBbwKjAZD75Vs8dxumq4qaAM2uLtJwjUlf+xI4d8KEm0drwIvedNEArPn
 etnOr8U/zWUMdwNHgQchopJD2deXkPgdXYK/YxFem44axRzzfMvLuxyoeABN3abyltiDI0vqpS3
 oT2fHx7SSAPAS29zTCjEFTznI/On8uYl7UgJYU5kQp3hUrbJOuBeMTslSAnVYmAjEV3HP8q3PsM
 jgRdw5cY54XLpg8sygh3X5cIrrNk+2pdsUYoK5BSbjFvS4lPGFFwbQRHkdYC9rYYVHyfryCGP9Y
 eweGsxlnhvrJjDz5imKz1Xqqy+THamUV1vN44kuGQQjvvJpKq0aAkYurf0hzfdfHB1q6p6EsPPZ
 f60K8M3CHOM4zjAkUf1qjbRD2eoxKjpfduu6MECtMVkj1K+U7Edh9INthtzRcG40Tb5D2WDg+uX
 noJmcJSmrg5jbkQQHUQ==
X-Proofpoint-GUID: tcZQ2Mx-cU0B20doRD8YVZnIEzhsV8j_
X-Authority-Analysis: v=2.4 cv=DO8acCNb c=1 sm=1 tr=0 ts=6aad4f4e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=EXJEmdUHkevauOIPG10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180210

On 9/18/26 15:38, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 12:13:10PM +0200, Daniel Lezcano wrote:
>> On 9/18/26 12:02, Hans de Goede wrote:
>>> Hi Daniel,
>>>
>>> On 18-Sep-26 11:53, Daniel Lezcano wrote:
>>>>
>>>> Hi Hans,
>>>>
>>>> thanks for taking care of that
>>>>
>>>>
>>>> On 9/18/26 11:29, Hans de Goede wrote:
>>>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>>
>>>>> SCMI client drivers already describe their bus match data with
>>>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>>>>> SCMI device tables. As a result, SCMI modules do not get generated module
>>>>> aliases from their id tables.
>>>>>
>>>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>>>>> visible to modpost, add the corresponding generated offsets and teach
>>>>> file2alias to emit scmi:<protocol>:<name> aliases.
>>>>>
>>>>> Use the same stable alias format for SCMI device uevents and sysfs
>>>>> modaliases. The previous string included the instance-specific device
>>>>> name, which is not useful for matching modules.
>>>>>
>>>>> Assisted-by: Codex:GPT-5.5
>>>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> ---
>>>>
>>
>> [ ... ]
>>
>>>>>     #include <linux/bitfield.h>
>>>>> +#include <linux/device-id/scmi.h>
>>>>>     #include <linux/device.h>
>>>>>     #include <linux/notifier.h>
>>>>>     #include <linux/types.h>
>>>>> @@ -951,11 +952,6 @@ struct scmi_device {
>>>>>       #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>>>>     -struct scmi_device_id {
>>>>> -    u8 protocol_id;
>>>>> -    const char *name;
>>>>> -};
>>>>> -
>>>>
>>>> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?
>>>
>>> Because of how modpost works to generate modaliases inside the .ko
>>> any string buffers in device_id structs need to have a fixed length.
>>>
>>> So the truncation / name collision issue pretty much applies to all
>>> foo_device_id structs in the kernel. People should now to make sure
>>> that any strings used will fit inside the fixed string. And I would
>>> expect the compiler to warn for overly long strings.
>> Ok, thanks for the clarification
> 
> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testing
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.
Sure, I'll try it with my t14s laptop (Hamoa)
