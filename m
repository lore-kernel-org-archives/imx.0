Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C7D45DF43
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725730; cv=none; b=XBl6SvZoiZ5tnMFn39Gv84il92yddiqfc6JP9cSE13Zu6OQFH5oxQ9rmzRya5iG0D2nYbFCCy89zznjNTqc4dSIPV5f6H/CxVgyiJMMR640+zWnpwvLDwxX2TqqhD2XuKIK1Xj9OI2KEq/1GHX5BEa+I2tZNMgf/3U7S11fHxmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725730; c=relaxed/simple;
	bh=aWdUbLPfvC6wNjFP+17bs1Vn8BgG4/eM1GE3CrUak1Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ykrl6f0CTiHBphMgBCqpRf0NO69+Pyemr/jFyPdzvASc5aL2bWHVLGvaAvW9q0RhS5gGV5VaKIOy1u+Ksw1ixv7Qmw+MbqNYUYehrepd5+4QwOY/0pyQ6GIJ/bngkhDW/FbPIsU9VTTr28QPXTesCittxxwEx6GsgAj4Af97p+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqKkK2Z+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/IYJzHz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqKkK2Z+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/IYJzHz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dYXf705507
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 10:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=; b=AqKkK2Z+nF+Z/dGt
	FWBPIBa9LfPCRuhIMDS79rzdtAonoYumPp1/erhcFZxnlhFx2qXcCfasS6QCaRzq
	PhJXaQ75jatiT5KGqZlOElNbKQgH7nwxVEuyHjgrEdJAwC8oJ9fGmXSwkOUx95Mv
	wL3HE7/XAeLp33/7aUlJ3RPC/daRq2zVZrKDWfeJvzou1Cun6Gsimf6vDEQxTfRv
	g62tVzKbpRzjhexa76EFC0MrEzbjEwUKX3WhiKKFSt87TGbCmTnqAMqa/o7sLVqA
	KK55FrH3OweXu3HkaexGQ6aJ9mMoYwLaVNuxbgDAhx3nwHn+sLQzHPBmcxsuL0YO
	CiAppw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2s6pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 10:02:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-790376c9f8cso123637137.1
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725726; x=1790330526; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=;
        b=a/IYJzHz3tDKMHKeSG2WFf9N2L9cgduNJ2vKYFhcGOLxFbAKatnYV0jbecEtUlpCv1
         sXBkM4Ju/XM787Z4DOoBTK0fMxHmUig2JlViKdYMsJhfvgkJMkvgInWP90HNyFqUBI3M
         vykgMd1rDeZ0y3exCDn8c8bmD16mBREHcr0RBC5OiLy5bZWwsb+ibatl7ux1raXXhcHI
         TuLMSbp/L5/t1a7Eio3BprWor9shMl45zYfeXJDJkv6L+Bljy78sqVXXBt67zNxhTZQo
         WKyG7iUVRLOxxifo2UihK6Tb5Q6/7+rmPDIG2imi7ZGeTufo7mpoyB+WpcFiiDDQUCQJ
         2Z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725726; x=1790330526;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=;
        b=vGJdfuewXfB6l5ezvvP7kE0M98KTNF53hTHadfBKOnMSjI53Ycp6N9lu64YiVGfgj2
         yQ70/c893JR9EYEamGPmaWGzCXRQsplg65MKWf3UiG8ACbv7qJcrPP9PehiySkyFwOr/
         kTGKks69rbzS5EvEoKEmiLvZyks95n7m7v3F//Wl4wa3v70uFzo0+lhR1240MHwPqSdh
         IjwVTm+FH/0Ls+UX59+ZSlji5D+uzBaJN5JIcrsmMKiaZdgxjyrv7AjUthDzHBGPmVdB
         GTQ+TV8HRK8tII3/8s4QPEivP+ZIPIc6m9YnyVC7M6xvkiJ8vgfJSTNv26DilCq3k3L9
         LNwQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0YLrUQHMF/sO8T1pjjomEex/RUm9vFJ6YqdsTUTiqK2qQvHJ/tDACEplENoEDNyDV2Tc=@lists.linux.dev
X-Gm-Message-State: AFuF++mAUbsiwINMyR1CLdYs7Gi3lvrvJuO5AMlM7adA4U+MKfP3tUi8
	fELkIKCcrV6TVNB7IfaIG2o6u1j5wxVjmgge1WtSYdXT9xTUZ+w/KFNhthCKghrjQ2rq+qMJ+ue
	6kO0reB4mWCLXlsBZC8xAuehOdKE5r50lNFSzhhXlHsdQGcBfz4c5Hqo=
X-Gm-Gg: AYBFou2xTV8MPCuh4VDeHAJvtiO2S3+H3OA9vwjmpqQNe2dSLObV0jXhDGwrH5r+3+k
	NRGqkLR6PsNABmaNuLxjYG0h7QqnsCySSKmmEK5HXJIZeKPxfibDUoUQEP4Xrb4zhym9dYHDxe4
	XnK1rUdhvARkUtsrsSANEVssRmP5SCllDSfoXv/IYdUrIDfTe0lMweYe6sqB1hGoFonIRnf0ZDd
	m/DsgYoSwVdMxmgM0WBcURkbjk2sYSqL1mknNZV4IYlDBDlPjNzzWNtTGs1t7+kOTOVzEVodhds
	PjaA0VAGUK4+vxSZxLd5AjH34zRpIUdxozFxhsF9s6A9k05zpjBxcFvwRN/sVzt4OnieZS5s0Qc
	4Nu9NYHe7NiiVERkDo4uTQ71SSPxkqWENLsFRr23ydIhno8FIVI7lBCeXjN3ve3Af5iLneZGUxB
	SmMg+ScU9z0OjhKbkER+2H+dLv4kaozTzKltcAEgmDzBRjEpC5/1+1Qzw0jFD/pHeOSw==
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id ada2fe7eead31-7a55af2df71mr615831137.4.1789725725466;
        Fri, 18 Sep 2026 03:02:05 -0700 (PDT)
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id ada2fe7eead31-7a55af2df71mr615773137.4.1789725724990;
        Fri, 18 Sep 2026 03:02:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a88sm37992566b.54.2026.09.18.03.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:02:04 -0700 (PDT)
Message-ID: <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:02:03 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
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
Content-Language: en-US, nl
In-Reply-To: <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfX/i9Xg8M6+G/9
 cUwP51dac3P21p9P2XmR7uYM4EETyb3mrTVNHRXNFpQfr5oLgXNiQR8pAa+P7CCXIAA2gKKX3QC
 crWfU8hlbk5n200y8pQOdPdefXZrxnw=
X-Proofpoint-GUID: thEdfEY7t3QNe8-iKZo86Gh9wr5KmzIz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfXy2EVp47dggPX
 +SvAZ/qJ75KtfdNYE6V0vGylqHBBzkTeSDMnA5YDfe6V1AvrQm3BxDEESCV50wsm0m2A8TvnYYV
 8I+zYSr1p1gNCowUoqlcEBLINEOu8BCARlhgHWbErbx8eII4p1l9da/jOtv/It+hLDTb3XpAKJk
 kn4yPpdyKDZTTVE2VetiRZuXWnz92CSYnahLlOq6+boKPTqv1/f/pHVNSYd5aPnnQSiQWs1lIlr
 kOWw1ZjYHOMRsblEWruMfcSoLDjWh91WxAQ/nClZRPJFNvgI1HOnDGE6DYbpA+LM2crOPCEtZJD
 L+pP5ocdEPNPaZfrxmn5TEobUb4HHBUCLcD+qizWas1AsA7RTDjKIB8eacX3sMlmzIeYqV6gGM5
 6NR67XV9Js1zPc/+qnSNaySXSq3fYQVUT6OT9KJMd7xS2U+q3hvwW8uQNCYvxxBEbApk5ellkp9
 V7RncXy8cQzAEbQdjww==
X-Proofpoint-ORIG-GUID: thEdfEY7t3QNe8-iKZo86Gh9wr5KmzIz
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aad0c1e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=9vOhfBaG-gSLgbD7qJAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180139

Hi Daniel,

On 18-Sep-26 11:53, Daniel Lezcano wrote:
> 
> Hi Hans,
> 
> thanks for taking care of that
> 
> 
> On 9/18/26 11:29, Hans de Goede wrote:
>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>
>> SCMI client drivers already describe their bus match data with
>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>> SCMI device tables. As a result, SCMI modules do not get generated module
>> aliases from their id tables.
>>
>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>> visible to modpost, add the corresponding generated offsets and teach
>> file2alias to emit scmi:<protocol>:<name> aliases.
>>
>> Use the same stable alias format for SCMI device uevents and sysfs
>> modaliases. The previous string included the instance-specific device
>> name, which is not useful for matching modules.
>>
>> Assisted-by: Codex:GPT-5.5
>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
> 
> [ ... ]
> 
>>   -#define SCMI_UEVENT_MODALIAS_FMT    "%s:%02x:%s"
>> +#define SCMI_UEVENT_MODALIAS_FMT    SCMI_MODULE_PREFIX "%02x:%s"
>>     BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>>   EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
>> @@ -185,7 +186,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
>>       const struct scmi_device_id *entry;
>>       int ret;
>>   -    for (entry = id_table; entry->name; entry++) {
>> +    for (entry = id_table; entry->name[0]; entry++) {
> 
> Is it possible to rely on a NULL sentinel?
> 
> Here if the id_table is NULL, entry->name | entry->name[0] dereference the NULL pointer

The NULL deref on id_table is NULL already happened with
the old code, which would deref entry to check the name pointer,

This just adjusts the check to check for name being an empty
string since it now is a fixed-size string / char array.

>     for (entry = id_table; entry != NULL; entry++)
> 
>>           ret = scmi_protocol_device_request(entry);
> 
> [ ... ]
> 
>>   #include <linux/bitfield.h>
>> +#include <linux/device-id/scmi.h>
>>   #include <linux/device.h>
>>   #include <linux/notifier.h>
>>   #include <linux/types.h>
>> @@ -951,11 +952,6 @@ struct scmi_device {
>>     #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>   -struct scmi_device_id {
>> -    u8 protocol_id;
>> -    const char *name;
>> -};
>> -
> 
> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?

Because of how modpost works to generate modaliases inside the .ko
any string buffers in device_id structs need to have a fixed length.

So the truncation / name collision issue pretty much applies to all
foo_device_id structs in the kernel. People should now to make sure
that any strings used will fit inside the fixed string. And I would
expect the compiler to warn for overly long strings.

Regards,

Hans


