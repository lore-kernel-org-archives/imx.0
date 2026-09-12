Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20F638F254
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 20:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789246265; cv=none; b=ac6SluAWyFQnSt7uJtnxKcjHuVk/pw1Y/xTRClF5kWBZ3bB7xgrwOxybgljZV1BWMWbBgPhaUj/1UuG4R/jC3Bc/yKredcLv9RpJBYROF0AQYv4UvkaB0MiRbrYowC5C3gKhkXVjBljqY2ruUj3fCzEykQVsEIl24FS+BPMwRPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789246265; c=relaxed/simple;
	bh=kttfSOKg/yQanFRXG3yh7u3S71n/ayBAbVoEgimZi1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJ+AlJv6hQj7wKqHzKUEO4GJ8aDyIdXpqD36mEc+0qryTVO2eReW/z9SIxFMC7hWhWM9xl74SfR2BZO+aTV8TaHLRg8ZwHqozVctOPefSxVAsTSFhtNbVPLbGSkmHQBY8l/v8qUrOVl6zp2lh1gZNnFTRgzJinwNoy7oDg4/9qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ay+SGGoT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kxs+ykjY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ay+SGGoT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kxs+ykjY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI4a0D360925
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 20:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KmMs3gRal1z49mHzxWm4Gkbi
	6oU8/Tm+5YR7zF+GVoc=; b=Ay+SGGoTAZSu1hitwSPfrGlcXjYxxexyI7ofZ3Y6
	S+tuVGB3y0mr7m67JyYXEJlJW7PlccZgEc5xvsTuQHApcViM4YazCNZjHozxlz3a
	vegeaylaaLj5z4zMPpM8bbowTD3CA66pMa/dI4PB7kfL1mgRKjr2ZksgcVuJWnPN
	NnKVR3DLLdPHXjfPqUQESfIWJfSuThchTAiISC/VjCGtXk1ZB8Spp3fz4xAOSkcd
	lwj/k/GWkDSyBs9IUSXv7nKyy1QD63t/UklqOTL2RJXXnxzXWR+DNLQ3o+OTIbPX
	+8jM/y+FVyLRp8lNvY6i37zAvtO9rlN5p60ncOWElO45wA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c9wqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 20:51:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so513001185a.2
        for <imx@lists.linux.dev>; Sat, 12 Sep 2026 13:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789246262; x=1789851062; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmMs3gRal1z49mHzxWm4Gkbi6oU8/Tm+5YR7zF+GVoc=;
        b=Kxs+ykjYEeJmjH6jOfs72EDYbxxoFd2tDL0xTt8r+uaG41cStWoHMEmIri0ctze7b4
         297ypGaOa+rDe6vULZP0fUPVCDJ11Midpz4jc88xOAKSndc4LUru374eGt1x+29BxVpm
         wOtaf4eqJelRpxfBjdc3qMgz0PlAAnT8oYhlQAshSDZYW5FU51ZRUXywwOXE6KkS7PUH
         lZsKlRnSPjEhVvFQD1i+QKAoVbYlgS5Ji9Y2cLq5sh2XraVb69VImrv6Cf2PaPKU7BYc
         dsxmLA5rYVb+iJtBBafcsIkenPsDMEEbEh48ZU1D/b6KoOu4LfdA0vVjAjlxRyG6Rt8O
         ZCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789246262; x=1789851062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmMs3gRal1z49mHzxWm4Gkbi6oU8/Tm+5YR7zF+GVoc=;
        b=O7nLham8RjIVJHuV+JhS+eZSRM1jE6pLjjd3KmUvXNzMYVKLDSyJ8i0nZrd/qkk/zj
         12N1FfurlBLmZUuq0ED7Xcg69RZew9eX/992UjmS5l+FdqRCQfgYZx7mpjW+ZxPD1B0V
         ZrA7itv++PsCemOhKpYO1Wh5hZg07pVoKpoQvguOtfghOUfFthx8yUlsFaHiug+oexj3
         3ZXMLbX9IMxMarMlwnjnxKp8jI70bs+brPHtmhkVAaR+AU7ZgZDX02yErTYUDO60twjU
         I1n2Xeo3vHC+XwKTcPLgr9b+CyQE6Z7mKAsEP6w+G9+44GUZlkAzcWpQL7E2eH82kOOz
         9iWw==
X-Forwarded-Encrypted: i=1; AKwUvBz0JYL58SXiGDuF9S4Bgv3AQx/8gvHbC6FrIrukIuLWn0DYITX70vPXm3LxZ+36zhpzRQI=@lists.linux.dev
X-Gm-Message-State: AFuF++lWnUjDWD0LIeH0FkoAsvMXBUfV/D/IqIxLZMFRZmazMoQpGhBY
	+kloB0HFtu5qASiw+Rng7L5IA37AwhnOOR48k87RV2Xd3ng6XugIbFl72gJA5QLBXcMVpd4eBzR
	mq9DiGg/BPxaJ7lvKTXRksGsdKY+ogXkzTBOa+H1aNWavMPEgIs09/Yg=
X-Gm-Gg: AYBFou1naudiO1j9w+z8HJs2g34a48dNSXHxVo0YjCDNbrN8c8fOzoU7ZfOTRiE3Lht
	589TBhuAStVI3bJQMQzwGvbPkN48ECvEL5xAh5OfTADzYJzr328/+lP2r+oUqgWBW0fFRCPHv++
	5VeK2+zjmu0DGPpHShjHm3BNO5RxAduVlP4INhr4LGRs9kpcSFIcXPntT1ZSR7mpV8UDnHtkpSw
	jZ9ThehDA5Lj+iBezT1YEySCaebb7n5QY+LLLf+TQ6BQUiOdArgwmw1fmcl4WOEXdBXLZt0pUVj
	A5wLDj8O+hwcX5sDvugv0iobVIYnVeAY9FhuKk7jyp3kB2b6l8d+DQG1dmDNUWctzwkpwNMtBbo
	ohSe2xc5+X1G/8Q==
X-Received: by 2002:a05:620a:260f:b0:939:3a81:326 with SMTP id af79cd13be357-93a0390793emr670206785a.37.1789246261936;
        Sat, 12 Sep 2026 13:51:01 -0700 (PDT)
X-Received: by 2002:a05:620a:260f:b0:939:3a81:326 with SMTP id af79cd13be357-93a0390793emr670202885a.37.1789246261354;
        Sat, 12 Sep 2026 13:51:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fc02sm14093160f8f.16.2026.09.12.13.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 13:51:00 -0700 (PDT)
Date: Sat, 12 Sep 2026 23:50:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] firmware: arm_scmi: Fix
 scmi_protocol_table_register() error handling
Message-ID: <k2agmmtgq2tbx2zyokidn3dsdkcjpdjbasx7vlch6b3xz5sjuk@pfhc5npwwegc>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMwNCBTYWx0ZWRfX2/fDGrRfCuBd
 pObnzvDQNTxXhjPsdToozfncq+Wv3uiil2/Xp9OhRwix1lZgag8OP7De69RvpmUJkYucjVORrND
 SCUTjYFOsNWiO5eeCjfU6GX425087os=
X-Proofpoint-GUID: zKbBs_UEQnwxoi5HqL5k3mHhSG5ox09F
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa5bb37 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yiJOAx8gJh0FWUIRsxYA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zKbBs_UEQnwxoi5HqL5k3mHhSG5ox09F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMwNCBTYWx0ZWRfXwo2ACJ9llqcZ
 n+Xh3hljTQ4ByWT6dC8S35ObqdWZup2gauPNja2sVD5epkXEL1o8Xrez/UG1+YifjijIYSCHOP1
 SSmZnYPEeZgGdq/9qrh+rVI83ADtzqkckSDewTkQk4tXTnjhfyngeHaFjhXoJdzq6xx0wmnQE56
 zYLbMzPXJKJq7pxfbbsMpuwpqgUJowQtVMy4k5rheQNweHXbrZwjo95a04LtsfFjKR3YJe1HJdn
 BssNW3BXekJj/ZOYuy7rzI/fHrIi3uCdfN2mFTe6LiAXiakFI0A1UxwkkhZeLmXGPF17SKiTo6q
 IsTsg9kB0xoRChZw1G97PQWTfvkTmDzIcojt/sdXtU2smHAuH02YpTQ8pTwQ/JAQQCxXf9VVCYK
 vQNhvj9sulAPQgZHotXAvExT8moiPSw9xZzROFH/B1igOVKCuTMkREHBjChy8Kz/dskzm4yaMWd
 E9uNgAMJMtffMYjf1pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120304

On 26-09-11 17:23:27, Hans de Goede wrote:
> scmi_protocol_table_register() stops at the first failure to request
> one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
> previously successfully requested device-ids in place.
> 
> Unrequest any successfully requested device-ids on error to fix this.
> 
> The code manually unrequests these rather then calling
> scmi_protocol_table_unregister() because one way this can fail is because
> of duplicate device-ids and in that case the original device-id must not
> be unrequested.
> 
> This also moves scmi_protocol_table_register() to below
> scmi_protocol_device_unrequest() since it now calls that local function.
> 
> Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

This was already done by the commit:

2224b622260b ("firmware: arm_scmi: Roll back partial protocol table registration")
