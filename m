Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB9838CFE4
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740583; cv=none; b=eoo9GHQIOyFJSfUNbT8XZVpZpZqTrYvlidk3oVo3/mXLtP4yYQ3zLBtLIbv0VL6WxmJQi9S0RAK7MbOuL504cZBsKkkufpVHiedBMK0YFDJXc7Yf6hC3j1TcNNdiTIQvi4L+In5TEg0y1lAAgEN4Syf67N6bPqpGs/K683t2KG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740583; c=relaxed/simple;
	bh=cnZiEV9qRv1m/yHobliIfyHOjF7ER5ZdH2Zqgn45D0E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Yyb59a6ElgjL9ohKHDPobbAyghYOA0qF0CAacFUzWnvOQClLFZnJRMIY6GgYwXBJK4psL1Cu26oSj4qjIO0khblTbeLPtOmlrQ3zmJL/IQf9dFPc2aJ8LC78cP7Z5nTqUvyQoUNC1OFXruA7f4aeVVelMUhl1Qc8/wlzQkpw1c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2LhjmS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXwVq47Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2LhjmS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXwVq47Y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOrA3746129
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 14:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SEZETyE0PARh6/jC3pFbG8uSXzUDG4JFO/9Ng3zjDc=; b=k2LhjmS5ACIvI3NX
	unsTFOy+rADBx+5G3nXHA0JV0jlaGnpZWpyp9ueVVrR94fWvvh550HL57gV+PIzW
	9jn+4LTQyoqQ7+v9sYn99cdpqsD6x40N6ccYcxvGX8kEHQ0RhaIYdgUpqWEhyY+d
	0hD0E52MCW3XfUrrSHMujLsnI1+qEs4XnQtXD/V7BKsWd+MqH19iAOiQzx1VFWzd
	ubVnbwrCmRJmbYPuxGgopGA7kn1SYxBefIOIn9Gc8r5XoKDY9VqKGFAeX0dZQfNK
	UzTWUpJqYW602hTtFERrNhlz1HcZxhgEv86Gt8Y6Bwa63x2cx70qmRqZGWsApQdS
	XUuqEg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs239183r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 14:09:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso532174241.2
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 07:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789740579; x=1790345379; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4SEZETyE0PARh6/jC3pFbG8uSXzUDG4JFO/9Ng3zjDc=;
        b=hXwVq47Yy3OX0Iwq0n7Bs188RJ+ziiAETi3W/uFgsm9f8/8g2gnvAwS99o8s0BN/eQ
         QG5Ed/uu/HVDmDFaWUV/p9Xlxz0txxd8RtoiBlNKK+HRRa2pvyi6F7qS/mg+RYz11vVi
         6L3fJRqEJWc3B8lIszxX9o0JrXDLXz/h67s5+3IiAKO+/nkXH5L3a/Pp07OgPZCNGV+2
         xdmYPXSP8RYqI5tHIqD22IiV6QAr622Byy9vJw0atS1yZj9d/aSiwPM3hoaHTE6KMY/H
         um6GgDoY8aa85IfsWtA+yME+P0NU091meJwKQ/UCl9vJiBaYP5aiEu3MruBVCnPypgUZ
         An4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740579; x=1790345379;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SEZETyE0PARh6/jC3pFbG8uSXzUDG4JFO/9Ng3zjDc=;
        b=OXZg/44FP0XLaBEuIFXEtK4Z7aVTtzEKZJ25TDeL2q0OKgpGwcoXQPauWz/sYUZawM
         ufgQOgq2O5wtCzUQKOWGrGLeJbVH/Ahqxr1x4AThOFKUj2eknEAHZ+O4PE4Alei7862P
         ZHqnfZ+eoa9YregV8gSQ5VHD895drsQGnRiPN4GKMfeM8nccDFmVaTamLKpcYTn+VGaZ
         KXqBnAp7pz90QtKLYQECo+aNmmu/tuIVFQUnWFN8v1VoTbq2ias+EcPUWzHCSUwVDVQs
         wO1aJSAtb5q41gcpHuVm69JVLI2VHmqnt8btCxUCiG0Gs/Iboeq2kcGIUiEUpAylsK2j
         R3KQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQFz0H3D6D1r3NGYZj1WpQ/bJ5h4vWbyJRDGlhIgtCoeYRNq42pdBFdDB+yZqmh0Cejks=@lists.linux.dev
X-Gm-Message-State: AFuF++nd4Ja0dJg0pri2FwtsTQf2zB5Vp2KwYkPmo3CAC0KmcUco3tvK
	fU2Bhhiu2ltAEMNt8Q0OT+Nwdcpnzwq5GqskfSxfLIF4A61WixOBBZ0ZE6l8/UzeqNK3zsH7/KL
	t9nyr6lVemQMKvrLNaky+7fllYonOc22+aLQOInnBV9DW9J9lPGUmchs=
X-Gm-Gg: AYBFou0RiyFNlrlSeXEtA34GGMJGJhJ5sFnBJvzOaWWct/V0j7Ssoc+DOGNFniBnEJs
	VEfk79IY4YipuleomnLP6Rbkj8/R6qwUkbfa4zVY+l/PIEuNOei4PR3qmNQF5aET1AexIB0okwg
	pa0JZBpCvO3fXBbTC1739gflI+2o5g5OvbNxoHa2zPQNwiJ7bpsxXf4JF2U3rHWxasMif05ZS01
	xejESS/kxuzUVOutJJubDvLSBZMNwIhw+9+PgkBkbqHtGGY+s97PBctVApHSGqfJ2t2syxCDrDB
	R7J4a9/4wH+g+CmRdtkKAZorc+flSoBbI1Aho/girXARvVDK/iuMC/9Ai41ssWcMpm17xMzclQ0
	kL76VKw5z6o/LsujzCZ3CdoMAHb2MkHHEjdnU2AbbmDDaNRKlGmr5O33+rM/Di3XLiPL+GpX6Ut
	qtTneVE9GHWRMHJ11E7tieT2e6aaWu+o7XdOWomfQNAkFw3KcwvTZqxeHU43KBIxVUXw==
X-Received: by 2002:a05:6102:578e:b0:7a2:2a6d:2d7e with SMTP id ada2fe7eead31-7a55b1407dcmr1308028137.8.1789740579195;
        Fri, 18 Sep 2026 07:09:39 -0700 (PDT)
X-Received: by 2002:a05:6102:578e:b0:7a2:2a6d:2d7e with SMTP id ada2fe7eead31-7a55b1407dcmr1307923137.8.1789740578364;
        Fri, 18 Sep 2026 07:09:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a3a06sm58558766b.2.2026.09.18.07.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:09:37 -0700 (PDT)
Message-ID: <dca62a09-2af7-463e-9ba0-1be935a95502@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:09:36 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfX5Y59RdShLBAa
 Sc+5MzauFjAwHP5ecOUFR3PtjPZTxdkp7hts99FtrR2xCP//Fdc/yoKO/Eph53ZQjQ126yO7NUw
 M+9swG5ihR2oY84dqs8TWOBcixsc0cI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfX4WkkZbTotfVg
 OFIkeRUj3PlpoCosdj2VJgW8VAGoH0WkWmv8vxYhl+tG2glMNSxJ1Tk/0pImHUGZCJZx74mNY9N
 CkSa3MjaT+qpCpTfNYyGdWI+rFNvUBDzaWiEiXWOXxfu+YhIWxgs8gOA6HWdw6rGeWX2sYeyDGT
 kf5N+RBQJ5ubEWO2UWu5Di8NuIVaZu6D/dDSSIBWkCSexUiIVb+rqX2Xv0tFJcnYUo7mFazw2xc
 NoXUuHfz99D0s3vVygQjMDfMbRs7SJso2Jp+EYt/DJArOrOt3OD/gJdr/XrYA5fPK+gKRFoN3ks
 5T1xBnFEvGHP1woX8iKJOHeWn5X0Mj6sWDcvDebQnKnBmxEelUeUtYb1fNkhWH6LQkjtwn0EIMG
 /U+zUjscl1zQVvXRL6vt/RNS0q+zXndp2HjJZdioAa/gf3P1zsKyOyuy+DgTVaEfcTXCibKCKDB
 9kqUDqj334Au3QI8l0Q==
X-Proofpoint-ORIG-GUID: NnaMlVAgIaJIAVfYEwkT5crcVFNvDFRi
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad4624 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=vTr9H3xdAAAA:8 a=2jV7UpksSA8eYliVEwMA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: NnaMlVAgIaJIAVfYEwkT5crcVFNvDFRi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180201

Hi Sudeep,

On 18-Sep-26 15:32, Sudeep Holla wrote:

[...]

>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
>> new file mode 100644
>> index 000000000000..1b4ccfa9dcc5
>> --- /dev/null
>> +++ b/include/linux/device-id/scmi.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef LINUX_DEVICE_ID_SCMI_H
>> +#define LINUX_DEVICE_ID_SCMI_H
>> +
>> +#ifdef __KERNEL__
>> +#include <linux/types.h>
>> +#endif
>> +
>> +#define SCMI_NAME_SIZE		32
>> +#define SCMI_MODULE_PREFIX	"scmi:"
>> +
>> +struct scmi_device_id {
>> +	__u8 protocol_id;
>> +	char name[SCMI_NAME_SIZE];
>> +};
>> +
>> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> 
> You need to include this above file in include/linux/mod_devicetable.h
> to avoid duplication of its inclusion elsewhere. That's the pattern followed
> I see.

That is what I did for v3, but Uwe, who is leading the splitting
of mod_devicetable.h from one large monster include to smaller
per subsystem/bus includes explicitly requested me to follow this
pattern, see:

https://lore.kernel.org/arm-scmi/aow2GFAfy84k-N2B@monoceros/

[...]

>> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
>> index b4178c42d08f..91ec3704ee2b 100644
>> --- a/scripts/mod/devicetable-offsets.c
>> +++ b/scripts/mod/devicetable-offsets.c
>> @@ -1,5 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  #define COMPILE_OFFSETS
>> +#include <linux/device-id/scmi.h>
> 
> Drop this for above mentioned reason.

This was explictly added at request of Uwe because the goal is to
get rid of mod_devicetable.h including all the device-id headers
in a big single catch-all include. This is done because currently
many files include mod_devicetable.h and then if any of the device-id
headers changes everything needs to be rebuild, making incremental
kernel builds much slower.

(and the same for the second include you point out)

Also replying to your other question here:

> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testing
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.

I tested Bjorn's original patch-series but since that makes the kernel
call modprobe it does not work when the scmi bus is enumerated during
the initramfs phase and the modules are only part of the rootfs.

So I've replaced this with a rewrite of Christian's approach to always
instantiate standard protocol devices. The rewrite was done because
of various lifetime management issues with Cristian's original approach
found by Shashiko.

Note that Bjorn's modprobe approach also only used the protocol id
as modalias, which means that if a vendor protocol id of say 0x80
were used and we have multiple vendor protocol drivers in kernel
which share 0x80 as id, modules from both vendors would get loaded.
This is something which I did not realize at the time, but this is
another good reason to go with the new approach from this version
of the series.

As for testing, I was the main reporter of this issue since I'm
trying to get Qualcomm Snapdragon laptops to work OOTB with standard
unmodified Fedora aarch64 live/installer media and scmi_cpufreq
needs a workaround to be manually loaded there, see:

https://fedoraproject.org/wiki/Snapdragon_WoA_Laptop_Install_(Fedora_Beta)

As you can see only a few workarounds are still necessary and
manual SCMI auto-loading is one of them. So I really hope that we
can get this series merged in time for 7.4 .

Regards,

Hans



