Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54128352034
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583529; cv=none; b=q8mAKcXi8m931R3sXaQysQSSknJxMCGQhXk/u49/j6d4L/o9D54Y7Umv8ROE2P1pSWyPZnVfjRixhHeiLiNV1OFHIzoMJpLzz/R6khSbRzptok5eifZGqt/rdLp8UjLOve7y1XYbP6sgH1XxYVEFwuKmu9BgA5ZvA666uFZhZF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583529; c=relaxed/simple;
	bh=NCPpP0PSy+yn7AsopOYr6zL63Fogw6eZBkjtUu0ajkQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wqd3t6gAFAaRHwmX7IH1QJXERWErJpIjJCXTc08RFjdCtGa6wkzFkwupyb5jj7RdTMa2n4c4WYs7GRHf8iECxi+l7NwaWloCwMYbEJ+FDyvDNwFLx7CEwyWNPoGubon7nT4x5mfVAwVmZYOPmG5fg9gudcvNuuI5p9wPymsdj9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHIsnj/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqiAn6W2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHIsnj/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqiAn6W2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvHP42006969
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 14:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JFxHaff8GjmyQ0vJusoYBKz8T8A+c6M4ZjObeJKGagM=; b=eHIsnj/yq5JMQ2R+
	dNhTfIz13oV7n3oaDZKdBTdgJbgt7jSIMcsWGDWO/D2aoncgB6DrtEz43kHfdB8E
	IFL9ar0NnPKdT9aSnhppfTJK+ajptnbjmouPYeDgNbJrysQQISoeM95kkTHZCJZo
	8BNwjOxT3RtaJUbVe74MevZ3LHysqf1H/vnGjVqCMpBOZ74allL+uBGsjFJluz29
	MSm0ps+P9Un3rtN4/BiZiqDg78n/LQS7UbwJWR/RgLYU57lpgJqcOdMzHXeX8U1x
	qKU/Cqo8sux73oofpWTscX8fY6CVv20KyevS7oYmtbZwYUIta853r3iCFVa+eROZ
	jxEt8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv798h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 14:58:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52dd69b00cfso44965681cf.3
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 07:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787583526; x=1788188326; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JFxHaff8GjmyQ0vJusoYBKz8T8A+c6M4ZjObeJKGagM=;
        b=aqiAn6W2hOHfQD8oQkHkzbnBAN4obOWwoPB/bpGTLMWNvbwvgfd8PImFzvtL1QX4MV
         n9R6G7vnt4opRHoshCsvJHx8rb8wZrkAe97sAuWGGZAo45MZzYw7Yc9R+edLjm22sVB7
         iqKWkwvgcuMlp1RBuznmR4i8SbrxIuVbBE8ln2rBhN5KrmvjsSVuBR0kqSQh25cPZmEr
         izn23vnAokohvwvPI+jX73S6KpiwFoX7uDVPoQddiekTb89Td93rhb0UBJU/CTuZgK/A
         /F0P5vmZa5I4dI4vlKB+xMLe1TAXUzMZjzmUbTek06X3vGzbxiHVK4kmAk4Ii8FPjLQB
         TQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583526; x=1788188326;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JFxHaff8GjmyQ0vJusoYBKz8T8A+c6M4ZjObeJKGagM=;
        b=Nmoakg4PQx5sPSvvE0V7DEbpD3cEBlHFXaGCcQ9l/zgMWT028HACZfJY9B0CcvKjWy
         9Vx0wIvWOf1wy71tTE/mkq6Dz8JYcd0StPfqN1QZukYq+tFwH2Prr6Um69tV8Ox8kpvA
         OSZXm6kSD9DXLbiNEKRQVfMYqs/OQg//unoIaH+nz2X+jwpYalj1E6CuXbnZARsETWeW
         5qg9KwlawCtt1Z6S96TWJZfjlMirqllpOO0U0cJN8VGXqfS7aV8KroId9YnzuUyJFmLh
         1rr6vy46Q92G+7z7DqbM+HvfK7bd86WfrpiJnBob5HQRdpFumMbKGc/YAaqfYVTG/yIb
         uuOw==
X-Forwarded-Encrypted: i=1; AHgh+RqwSNEvWPtqqyF7ZJjLkYbXXSZqBET1n8plwdjYNGOCtSimCvL9tsVYJb8PQpGHIEsuiMo=@lists.linux.dev
X-Gm-Message-State: AFuF++maOjzZTfDxbbvSqetmnB6zJGBj2U1bqgh052E9vw14a488ExHL
	IUG+Dki67aEPt/G2LgPmHzD0uTRgtapY3lN5Fg0FkPXeUPGkAR6kCRw56NyHMC1dv4Tf7cG4W9S
	aLqGuvntPoWXJW0wXiDLabzBSptPKo7dKH/CU7gPHhQrR25W4G9U1rPs=
X-Gm-Gg: AR+sD121Kod7KrBLjY8BLAG7Z644Lzp+OG9TyIRszvCMjr0gXhIdf5OMIUnE/q00AJK
	Tuj4I0WRb98rYcxMzh8OxTEN165PWIXKnXfq/VpRzmEXqToLYBuZz7qDEQf8vFrlekb7pYd79pv
	y+mPgHJ69XkeHd4Y+Av9fo4UYXjYqL2ncChez6DzwKP3QsbSybi1s2BmW0Robrpgy3wV5nwbV9q
	5mceZiSAZWQO20QBT9I7a5aZTLm10l/Z+obqTKe8ebaM3SN9Fp0B9csU7T+DCtENpL80ec2pm6r
	4CnBBTJgY7gZVkz31Lf18ZOqZ0ZV2fBQfWyFvmG6gFUwNP2plheEoYlgwtNL5rBI7OY0sSlpNkW
	a71bMuH5j1dHU48UxB2MNBT9eWu38sagGBwea+Eci6bvD3QGM3AsYPl3NJByXLAHwwUZ8Owz1U5
	5B03cPvgDtaqmHfaj5aF4AI94Cup800mKDITofJ70Hkj5sSJVRTDz2zTJ96/i+g9SYKxk=
X-Received: by 2002:a05:622a:c85:b0:527:f4d0:4bb8 with SMTP id d75a77b69052e-52df5a3285cmr289911591cf.22.1787583526056;
        Mon, 24 Aug 2026 07:58:46 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:527:f4d0:4bb8 with SMTP id d75a77b69052e-52df5a3285cmr289910721cf.22.1787583525431;
        Mon, 24 Aug 2026 07:58:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295627sm1253359466b.15.2026.08.24.07.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:58:44 -0700 (PDT)
Message-ID: <1bf5984a-d1d2-4763-bb4c-b17ae8360192@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:58:43 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
 <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
 <aow2GFAfy84k-N2B@monoceros>
Content-Language: en-US, nl
In-Reply-To: <aow2GFAfy84k-N2B@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c5c27 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=IpJZQVW2AAAA:8 a=OCaCXozdqvtwCLTCMOQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyNiBTYWx0ZWRfX703Cr1Ha4QTu
 LCftCCWvtOCshkc2dF8GX3hIKeeBEJ5NRLAKye97ar2znqXa4Vf9VCH2//NxZIfmgutquXkXHXB
 gm1wwo+TWMxTHygFMq1xaOcroJP0sp0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyNiBTYWx0ZWRfX1XOk5j3VyIuk
 OQObfRjLEhkCLXotEukU1oyQse4DF9PO15d7AQxQBRt9cG5Pproyypd1rCgHjXJ2ayzZ85/VnTQ
 Tj9nXWULAcNA/HmhRJI7J1GDTOnBofHxo8wwmCKfTtpRbDycL75vKMHq9D+j77kfKbWh6ReTWc9
 hHMTLi3nayyBKLjsf2oLoI/KUwAmF3hlcbVbRlQ+s2MjE+TQnv+2VnScrm7nO/rtvh9n3TzyrL2
 +OHgsW8MMELJCYi3aGEPRjs0uP02MKxitUckS7M285JCjX9wIWBi6j9mdtBC799FHTXrK3R4uqd
 OyMPrNuNXoWTFbrGQgqz/a1KhY0SFtKN8VfMSDEWXUGeYgbKZF4FWON4V4np81LKngXMg+U+zyP
 afUbLP1PHED4Q5rzkVZnhYDDFgvoyImZLTVZatWUn7bVtO2TM3b9/wKjLqkO7slm0TC2mMpcqAN
 Bwudr/JVTJiJADWuW3Q==
X-Proofpoint-ORIG-GUID: eYGCZLSOw8f9qrWMYEYplc4wu_cMpji1
X-Proofpoint-GUID: eYGCZLSOw8f9qrWMYEYplc4wu_cMpji1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240126

Hi Uwe,

On 24-Aug-26 14:22, Uwe Kleine-König wrote:
> Hello,
> 
> I just replied to v2 and only then found out there is a v3 already.
> There is something wrong with my mail filtering, sorry.

Not sure if it is your filtering, v2 is somewhat old
and I only just revived this series.

I'll add you to the Cc list for v4.

> I'm forwarding my review comments to here (the part that still applies).
> 
> On Thu, Aug 20, 2026 at 09:48:48PM +0200, Hans de Goede wrote:
>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
>> new file mode 100644
>> index 000000000000..4150481524d4
>> --- /dev/null
>> +++ b/include/linux/device-id/scmi.h
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef LINUX_DEVICE_ID_SCMI_H
>> +#define LINUX_DEVICE_ID_SCMI_H
>> +
>> +#ifdef __KERNEL__
>> +#include <linux/types.h>
>> +typedef unsigned long kernel_ulong_t;
>> +#endif
>> +
>> +#define SCMI_NAME_SIZE		32
>> +#define SCMI_MODULE_PREFIX	"scmi:"
>> +
>> +struct scmi_device_id {
>> +	__u8 protocol_id;
>> +	char name[SCMI_NAME_SIZE];
>> +	kernel_ulong_t driver_data;
> 
> Please use
> 
> 	union {
> 		kernel_ulong_t driver_data;
> 		const void *driver_data_ptr;
> 	};
> 
> here instead of the plain driver_data member (or don't add driver_data
> at all if not needed). This yields better type-safety, see e.g.
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com
> for an extended explanation.

Ack, I'll check if driver_data is used at all.

> 
>> +};
>> +
>> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
>> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
>> index a397213bedac..d241421c36aa 100644
>> --- a/include/linux/mod_devicetable.h
>> +++ b/include/linux/mod_devicetable.h
>> @@ -49,6 +49,7 @@
>>  #include "device-id/pnp.h"
>>  #include "device-id/rio.h"
>>  #include "device-id/rpmsg.h"
>> +#include "device-id/scmi.h"
> 
> Please don't add new includes to mod_devicetable.h. That header is ugly
> and each include makes it worse. Just add <linux/device-id/scmi.h> to
> the modpost source.

Hmm, I did that at first, but that is quite ugly also because
file2alias.c, does:

#include "../../include/linux/mod_devicetable.h"

So I ended up needing to change that to:

#include "../../include/linux/device-id/scmi.h"
#include "../../include/linux/mod_devicetable.h"

my thinking was that the purpose would be to move other
consumers of mod_devicetable.h to directly include
linux/device-id/*.h"

And keep mod_devicetable.h as a file which includes all
of them for use in devicetable-offsets.c + file2alias.c

But I can see how actually getting there will be a long time
in the making and in the mean time this will cause longer
compile times.

So if you're saying the somewhat ugly thing of adding
linux/device-id/scmi.h directly to devicetable-offsets.c +
file2alias.c is the right thing to do, then I'm happy to
do that for v4.

If I'm reading your comment correctly, that is what you
want me to do, right ?

Regards,

Hans




