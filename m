Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D314B95B6
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726401; cv=none; b=uuPO42g12iIkJ+NwMjOO5z/dqHNxLcsMatsctrAcNFPYl87aZo6E1ThfZHZDjNNm/a8juFPN/XFeL4e4rZwsyFbu6uiWbriAb+JN5bE8crUPTlhUo8dxb4BMo28r6NPYKuyeu/Pnlln3AAHV26SBBrMiRsnJ5DLQ8ist2w1dHRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726401; c=relaxed/simple;
	bh=ItKb6XO2/XDUSUojUIMmcg3tfa5IbP14FHAxsC8QauM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWKidt5bxWEViuUE/0PR/1FcvTANHhLK/i8wt5k/M3uZk6e6HvEIN6z78Vshqg14fjZTe658LbjW3eMHC4Wwe0je90UKSYnqFBQ0Q02R2gQFvyy+NSXdZ6qyQ+opZoFa/cbVg6xBax+CIVjvo1DZFn/gSNBJkAZYnmJG63XfI9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYrEFTaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KebtMcuC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYrEFTaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KebtMcuC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA3a7U3208429
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 10:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=; b=GYrEFTaVKgXlmTVL
	FdIUe/gOgfaQNgoApN9hwMcMyZYpiVb87js0w+jlRw5HZTJt2YA12liBgJ5avDWx
	w6jnDY6sr/HfJ7qG2RRYllo0Zjc139ZmNufJTxmE9A3HhCUmyLtoCv/ub5l6Uw92
	Ym9/7PYxLhrNPNpIQGCgSfOb1dlvJ56MlVo/nX8rsOG36fxRBbgYqhPHUaWZ4aXk
	tr4/8JLjw43i+58RgJfNK2I0fFnPEK4eYzZFAVT3l0xAmZSAvCO6Ean2l4R2LbGV
	heOvq67fpXSaHWc5nqD9HFOsgh2pdtMuX0juKA8vFnMB7I0F4f7cedysaUBjulgC
	ei4tLQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dg122-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 10:13:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d206e2b4so11235161cf.2
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726392; x=1790331192; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=;
        b=KebtMcuC7cVGqwaJ3N7LDH5cVRaYHXk20IxEEjqKCeYvHb4U/6kqLOZNfguZV0/ztr
         ww3VzFCJQrVtc51/s7V/KA0rbNho81AZJ5NOUqIikB5BrR5wKzdLhOs0YBVm5M8OnlN2
         Vb4xi9hhs1SbNAi0d5u5UQ64wMzcOhEBVGoU2tQZoRRheXB89cBV+eqKLJsKJ71Be8Ue
         Pgt4j8yES//at7Iulb1PKte3X63FYvYFtspWmulSn8xExv0GPqKv9r/aBPlM63tA8594
         51p4p4cNBB9SBDoKT7EjiHKg6tYcOPdFI9Z3a226h2ASJB/3VZcl5SRl5tYJlkjsrSos
         NWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726392; x=1790331192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=;
        b=1YF8wselzOwaOIy7XzAy+vbtOfON95yDWgw7nZybHu7K2rf3cfB2z1ncYDwA2F3vTj
         EWslrkeFiBfQkcl8GI0u6j/a/YuzBXpPcA4MdQRMW4X7gbJtucmCl0NXhx7TLBjzWWzP
         Vf2IUbY09wfbcONMSLY0rtqwyeeyk73iYdhF3Cf59UUxrwXrKLOvj14KAJWqcSKJm0YE
         tv8GQcaHJw1HTmqbm3d/TYmOZUry/3dPURiIIuJ4zdrEFBfl0w6lh+28JQ3g1TcSFcN9
         7uVm61rJJ0d5FUZUWFCZfN0OnD60iJshTNr8JgUkhEyWY63wx4302Smqiig6nxRxkIKv
         GGmg==
X-Forwarded-Encrypted: i=1; AKwUvBx4Fw5wARkQvjhQyDuni7oV4ufZulwrK3sARBwG7/qCrgfzrHbnsiXfgDwMyaoIw9e/5vo=@lists.linux.dev
X-Gm-Message-State: AFuF++nDSNUtsbuEjPStCZjdHUy1kJmMG7dcvUi/QFYO6OA4L6LOtBGa
	F+MkZcnIfJ7Ab7ei40CrhdBUmMdOJ+kyKDZ6LUleEaeVezM+u+woE0QkVIR5/V9D5/bF1krlq67
	nGhGO/d5POwTWs7gaMLEXKtuonIg9zzO0mFeQqoeXK2Mkp80jezYTlvk=
X-Gm-Gg: AYBFou2Gz1051uBaVjfG5/FOssTSSm6etZZ8Q5hhCBir8cn6jRaNpATgDUNHujR3xX6
	jzUg574xIyvb2n2e9/MqJSDbJzmoRiCh5eISYkSNED7wczF8otXyjQEOPw34Vv1ngn2qmdALnb7
	HUFrTx0w1ms0KFeYB0B4jNTBs94fTawHnS+YQ4YWoJw1uYzQC0Gg+Ei+S1uy8j0wFXRpL7K/K5X
	J4jWZxH9LJxHb9PJDy+YRMn8YzZ7LaD1lLVrFH+wNAZZt2SitEAGtz4pKAGNbe4YieGEMiOpgtm
	vWFR1dX6kv6YT7kamLl85Ot0Zi5uq+O6RL8qfIhCZBR+adEG93usTGRBnEYyjtZhbRijbPg4ak0
	+GUyR+0gQYVRfpEZcn5B3eOMbPNUg9GaY33k2r1brvDCKIepRqYTMQToO1Oy+il4=
X-Received: by 2002:a05:620a:27d3:b0:939:710:536c with SMTP id af79cd13be357-93bdc8c8c09mr231185185a.43.1789726392494;
        Fri, 18 Sep 2026 03:13:12 -0700 (PDT)
X-Received: by 2002:a05:620a:27d3:b0:939:710:536c with SMTP id af79cd13be357-93bdc8c8c09mr231182085a.43.1789726392001;
        Fri, 18 Sep 2026 03:13:12 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7b7a6d9sm36299205e9.2.2026.09.18.03.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:13:11 -0700 (PDT)
Message-ID: <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:13:10 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Frank.Li@kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX2HzSvApLY9hE
 AevtbjsZs1wa9qKW61kbmQHLbLno8loh80mNFqNoxXzg9xEKyRXhxTx9I0p0KAOqKfDds3xt3FM
 7F6BxMw2f+nM986BH3q8rLLbkhBT6qU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfXxmjrvOtFEbWz
 FqScp+KWFVtWAs1ak7rEdzHUFfLShwPe8Mb43WhFxMJt6R0VJdH5rvSOPy81P/71ZdzTsAC4elD
 itxGmAydowvL71cSF708r/97EuqkFhnJzCAifqV/u53epaNnAy9pq12K0Xzv99pbm67xjc+GmoP
 EoTZ6lhpYGWC4vXpuqGg15MhXZ0oe8+i4fLdm9lPWrJmdP2sYGKlYAw9zgY429Bi9CCFzc32lxV
 kUIZ5mqOWfaV099/J77RAWMTxVEjnT6lsjWJcefKJLqowlKR6xN5iRNAfgPUPs78IinJ6U0K+yN
 e8pb6g+HwEMMjV2MXiJj+qtXN2GNO6H1GNgxZ91Qpg+Zr9hjMxqVxaIvZD2w47vP2hN1UTOHale
 4cUzKguTwwUADlwmWmGAtB7UrRZ1CKSaPp0gndXW9PXL7ebW1ack9MStEO2ijwt6rjMOCwM/GMW
 1m1g866XPeXIcuBBNiA==
X-Proofpoint-GUID: OhRZPNka5pMXqXhMaN2N__OKt-3j89sZ
X-Proofpoint-ORIG-GUID: OhRZPNka5pMXqXhMaN2N__OKt-3j89sZ
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad0eb9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=OcJ0dzw6xdPU1XpcOr0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180141

On 9/18/26 12:02, Hans de Goede wrote:
> Hi Daniel,
> 
> On 18-Sep-26 11:53, Daniel Lezcano wrote:
>>
>> Hi Hans,
>>
>> thanks for taking care of that
>>
>>
>> On 9/18/26 11:29, Hans de Goede wrote:
>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>
>>> SCMI client drivers already describe their bus match data with
>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>>> SCMI device tables. As a result, SCMI modules do not get generated module
>>> aliases from their id tables.
>>>
>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>>> visible to modpost, add the corresponding generated offsets and teach
>>> file2alias to emit scmi:<protocol>:<name> aliases.
>>>
>>> Use the same stable alias format for SCMI device uevents and sysfs
>>> modaliases. The previous string included the instance-specific device
>>> name, which is not useful for matching modules.
>>>
>>> Assisted-by: Codex:GPT-5.5
>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> ---
>>

[ ... ]

>>>    #include <linux/bitfield.h>
>>> +#include <linux/device-id/scmi.h>
>>>    #include <linux/device.h>
>>>    #include <linux/notifier.h>
>>>    #include <linux/types.h>
>>> @@ -951,11 +952,6 @@ struct scmi_device {
>>>      #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>>    -struct scmi_device_id {
>>> -    u8 protocol_id;
>>> -    const char *name;
>>> -};
>>> -
>>
>> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?
> 
> Because of how modpost works to generate modaliases inside the .ko
> any string buffers in device_id structs need to have a fixed length.
> 
> So the truncation / name collision issue pretty much applies to all
> foo_device_id structs in the kernel. People should now to make sure
> that any strings used will fit inside the fixed string. And I would
> expect the compiler to warn for overly long strings.
Ok, thanks for the clarification
