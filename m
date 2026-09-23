Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C809C53B5EE
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175113; cv=none; b=O/IQlGxUbCFL0J5w45w6QLUQChka4birx/VroYKihCdqsJ9hWmXHDleyOmsclxrd8CVKm3L11emN/a7o/KB4P12NGpkSPG26xHDBygJ/R4nOAHPFmQyn//5ArswHAeBEWNFfBYNmVK3SYlp6lIulPQz78ZYSGXSHrWeNHp4IAEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175113; c=relaxed/simple;
	bh=tUeK7QUj2IKE2uFCeChn1ygOQ/iJBXWinQo0JAkeZD8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=KBB07OQF3Z5TkgF73DPRZXP7J5ym4IyyHo5TlyEk3N/DrJbt7Y9QryfMyI8UZy6ATSulXopIVlN/6ZrB6imZZ6yHJRA14WVtCUkYddbmcvXnwwfhcxPptPB/fqWZh/fEsnWhHaijtg72iA+Nkh2z72f5/zHd7OFJ4NIny+mcEEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDPluFm0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0NeJXiR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDPluFm0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0NeJXiR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbTWq3027920
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 14:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=; b=YDPluFm0OahNv9wZ
	cGvj+KSuUHVh95uSwMdsn3P3kJhzwjTDpi43NkpI/2SoCSI3jul35+60XSfNXhW2
	DzV4vf0pvvgcKlCUDELPwYzEuKHTJUDAgYnveKZy01SSwovXfd4dcd7ms1k+G0Q1
	DR544JEiBRHK5KLhHhHmydrvQ4mAx8IUEG2OSl/q1jOdNUBZrV7yzIvJJYIFO7Hn
	hNlyLG/AFRFUoIuH5dHrj50WnXxxxrN8G7TM50Rg+kYg9zpFKAMvfLYSGHWTOZwN
	+JuCpav51YiRfNXP8SN7C9RDlzxtfrlLvwFyC2iiFGL6nmABaZXj253uamIf9KuC
	98et3w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwasdrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 14:51:50 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e99615e0dso821578241.1
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790175109; x=1790779909; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=;
        b=S0NeJXiRyfzIvun/pP+YIBUDDOb0BDou/IW7a+eBLFLZ2tc6TLy9k1UIg1jfvBcWV/
         E7fwgd/UYrn6kVG1/u9gmPib+VokgS9x18vCD2mooY/5Mm8p1f5zK39Z4OFx//MpGfsK
         KMapU1g3uyReCqIpAxO2YxlmTGmGr5r0Zxp5JepUsw+bKJmAxatmt0a1CUBmMyC6iVrx
         ynQaj+AFwkXyNIr563BW+a+qMlLty1Pe2Xl24FxIHLUYEyUKL+gv8GgjQ4d1oM/kdlSN
         69lX4xaSf2R4LE+GDNv93me+bH+ZXaays8KTAZnTGQXIaYDQsePnl1KVY3hR582NFEkl
         C0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175109; x=1790779909;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=;
        b=148C6WlF0ZYNhmbPYruuiiN+11XaZ+DeIZglJLg5kbIPfKrdOB3MwSi9GsAThuk+s2
         LNZW/QRPbuwPgevQJ6aqO9PVYC51Hn99DeLXT6neKozemLuChpFHYycebpSQo/9Mlg/k
         xvL6UzqgW8Q8LwkNUrhBugGYahG5K/ZAeOtB86bsG5+0V9ZVLAnujobIU6AJ8xP8k27T
         edPae95pxo8NkRNxeWiCX2QCDMd8U1L1PnBoS1vA5bkihYnMT4/OlhQ5Aa3THKQbC0m2
         NFQJCtDrzTVG5LxmtnzrF7s2cQ9EqeTldhACw226KixUuIlWu6AlmK6kEv878qqgZRpT
         M1pA==
X-Forwarded-Encrypted: i=1; AKwUvBzfWqQ5RPqEyorDMfvp9d2VLiT6FzI6AGz6hgjiZdLzyNjmRFHfbAr4lZfSBvJP4wNCBfw=@lists.linux.dev
X-Gm-Message-State: AFuF++k8pslvXUPtMIEF20SY1oGATC9lee9Egvsj/YxyGGqvUDvjkeyr
	nWCkY+7u9ns2HM/zc67C2F3DPXM0gWG7Qalmgd31ReTg0D1o3shvW2sszMyaSLkLWBe1+gRTjSB
	3Zh4mw8a5/a2kNemJYxetl26NOwajGslE5ASyNErB9nt0JNFtAqOCeCA=
X-Gm-Gg: AYBFou3gFV6Ht17YIkj5dETVV4qfnEXwiBk3YYlUIetlki0gz36HGOjTOYY3/VSoTwd
	zivflpdT4Lnj7hnbx0Ljq5GDHMw05tAahOh0uTkUYPIHqcdnLK0TUyDAq470cWkC0ZRmm/7qxHn
	CGZMUZSevzo8gxVHccxvVJ+Tz+G6iiHqA1mWzKNpWDM0uCGlpb1iGjGMWJaEO2tP8pb4tckJGy9
	Q1yqG+QkmZ39aIQNHOsyY+KC4hM7oe3OZ6BKWiq8NYyeRoLBCciswO4fgyZOszmvnNkW7oN0D+j
	daFHyTnRzcthNuld76/tPPvvqhftJszCiVugujAzt4xw0SqH97NM2WH2xsW77SIH2Bvy3QYL4g8
	hOPE8ecKA4SxfGugvGKH5+pMhplsQrTjtmzaD4HH/L1lby11270P30Us/rSr8vFgq0GMwYXkEbC
	9EdFcIELHhVUMq0HuGL4D+CA3XCZynPj/1PFdv4C66G7qYijubgvNjqvQY+qvc6TGJDkk=
X-Received: by 2002:a67:fa46:0:b0:7ab:45e4:9479 with SMTP id ada2fe7eead31-7ab45e49664mr3196575137.16.1790175109608;
        Wed, 23 Sep 2026 07:51:49 -0700 (PDT)
X-Received: by 2002:a67:fa46:0:b0:7ab:45e4:9479 with SMTP id ada2fe7eead31-7ab45e49664mr3196561137.16.1790175109223;
        Wed, 23 Sep 2026 07:51:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae60a04csm143005866b.23.2026.09.23.07.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:51:48 -0700 (PDT)
Message-ID: <50b27e3b-729b-428d-a903-b118a5bfa249@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:51:47 +0200
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
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
 <arPMAXs4jjUeu1DE@monoceros>
 <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfXzarEe5ZgfL2g
 nXuJK17j0GgKva7/vkj4FTSZf49fPwsle20tMBE/vUDlEp2dYsST4bNfDQIZxP8ks2ONujDuFgG
 lzldTfYInJMP7pS7U42NwS4rkD7XBc0S8PlRBAv9asceYX+7KeaFjPXXezpKkVu+LEo5ODEj/tK
 jLldhf7mB4NGYhZEjD2oY8mNzPF84/UKVfNba5g9JpWc1YHj1Se5h0uRgkfQcR1ip7vf+AA+zdu
 BwrfRfIrFLaoUzxrm/gm5/MZVoVwo02oUCUGvRuXnBTcFPNcm3fpEr5sTJVgthkF1jekoAK+l7L
 HN1XNenzdhyqe82Dg8KlHyqi5ZyDZjWvO9k8QuxBct9W9bqVu5F0ZkD3IOtcthHAMZtr0bs/msE
 96PitSkm9pYekv9o6mNTyiC35nBdOR9MH3QUwdIIk8Rgu5B7IEIYCYyFsV8vC1d/i9swYTmG9e9
 E9Df+BzfM6Tn45rTlJw==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3e786 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=IpJZQVW2AAAA:8
 a=wmcOPm1-qqoyX47EQMsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: 8kd-EicTqTNjY41BFkqkrj-O_9cZ86da
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX5JsCPrmFMsV8
 Fje6FafHZum8XKtfHgo3muGid/AI7bRrL8qe2+SBte+QVexRMSEsMX+JV/auDcMh59yXveod7zj
 tSg1DOC4ZECX4/4gK5E6tDl5xWsN5Xc=
X-Proofpoint-ORIG-GUID: 8kd-EicTqTNjY41BFkqkrj-O_9cZ86da
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059

Hi,

On 23-Sep-26 16:25, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 02:55:26PM +0200, Uwe Kleine-König wrote:
>> On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
>>> If Uwe is fine, yes I can take v7 as is.
>>
>> Fine for me.
>>
>> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
> 
> Thanks Uwe!
> 
>> The nice thing is that the device_id structs are not API, so this can
>> also be addressed later if someone comes up with a clever idea how to
>> implement it.
>>
> 
> Agreed.
> 
> Hans,
> 
> There were other changes in bus.c that conflicted with this. I have
> resolved the conflicts and pushed to my for-next/scmi/updates[1]
> 
> If anything is wrong or if you prefer, you can post a rebased version
> that I can pick up.

Thank you, the fixed up commit looks good to me. I'll try to also give
this new version a test spin soon-ish.

Regards,

Hans



