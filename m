Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32878511E6B
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 16:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750733; cv=none; b=skDnvbLvttonfTeohqkRF/SIbkVY/HEO54sivSxHxiRloQRAFcywdnRRITKC5CpLOhzBGAIdKynSrnmn7FfsFZ++yfoR9+67wHLIWIJen03fsHX2RMwTTyFyuc6Qo6tQtXBgOZCwdhd5ft12X7ceZMwrHEGN6rjkv7FNIA3dQXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750733; c=relaxed/simple;
	bh=bhzXgDPDFYnoR8BS3k2HeCHiAqIg6I/VcsqlSOvkj9k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hwpSpThBh5kihIihE5xSBuyGxUoToDZ1M8CCujI4U02GTeXcWC4bRoUnBK7wS5VpbOXBgJYH840kwHcy3xlTCDniK0n0TsVa7zu9yOt1dD4mHWi02xBT7j2NodHvHcqAfINwNVklzqIVzJSMRO7vj+FCaZs+lb1NHX2rpyl2Y0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F862iJkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DHG3Mn+z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F862iJkl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DHG3Mn+z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IGoM1n676970
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 16:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=; b=F862iJklfTEspXfc
	UjvRsNylWUiwop35P1muhLn10HTOL/M7stdoCV5Frgx1dJJyqJCtb9FvturdV8sv
	z3alBIEzMWiVlVthfKBVozYtF7rTFVwi4etMJQaCL3Xb1OMzWcr3mo94SqS0NKef
	R2spGU2cf3Z4YDgyNC0YvETba6iLNRQtX+MmCmDbez6Y2pZzcL6/1A49LPfbZR3+
	EwSgfygJ0q8qQ9GphKHYvddiZI3X3ZqEQSOuyLKfi60D+5Gm3ZpMKc/Bkp7QtCxC
	19jlA5mLGS4eEQmM2YLhernOpYqFKGMWVlTYHqEyqO4snc1SdLMMuu7ckn2KAGe8
	b6XcSg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdv8jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 16:58:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-855315ccb64so1018686b3a.3
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 09:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789750724; x=1790355524; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=;
        b=DHG3Mn+zgFmsCaJItLRg3/fySBLS34hQ2LBd8LjTLfC/Od1aJ5DZGJQsZRB6YGjm86
         2fDc7cgyvWL8stqul5SGYmA0+2QqrepWGXSbhOUiXtMqBvJBD0LdPUYdkldJGJpun1T1
         ZSlLc2jF9d2HexaagD2xCXUBexTWEsqmvQiKKpRfl7uRyt1XWMvhP5AS9B2qTHJpoTtY
         bDYiwVibDQ/1m8dd7WqK/OhRUgBuuYyGu9BBo8NXmNLBRWP6OBN9iWaH/Mh62jH4k8Qf
         4OQuLDLnRqoFkqvXOH5bl88AEJ19wxnXcK31pFVGvMFu8g38LT5hyfDC7+0+qbZnHtMZ
         4iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750724; x=1790355524;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=;
        b=SUDly3xt35b/3U+shK3sA0cZlpvx2RhvHTc4PeYZZ49V2AVj5f6f3Cp7EBYzfraun0
         CHXgQz6RDgRaCWqpNqq29WuzN0CgDQ7o3ijbZT/djzLVzR9/tD8NREgd4PgZVaQylyui
         RugldZ/q37Wn9KskkaGlmKbMlHDyPmaXkEwe6fSVNv8UqCtOTroApE+R2BY2hsA2g8gq
         S65DG4BABja76vnaNNl3+bN1DMAiqRYJEmPJrJPh5CB9nr9W++Z+d3qA7thr6jQhHaTk
         uh1EpOyfZPZ6U4rYO+IDh3fUknGcoqYkF92rdE7igC/mq3wTyETj3+CpsQVqxzv0vaP7
         BsKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNRI529mAnO2BPmPyOoNwZIserZgsE0VjtLZvkD/QEaLgRfpZJYJ39r61iaoOAa0SIW6o=@lists.linux.dev
X-Gm-Message-State: AFuF++kNfW7xQfsXzPZGcYQZYP5wxlVGfoO0XlBTNKFI96CKViSFw8p3
	K63fdbkyz3xrLh+wlJfKFI6nYQPeQoEgg/WPLpQZX4sosbwl2bKBBy28XA3ceD0S0BmkYjfZH38
	s9xUvkakrjWSbh/XCQ7W1Jp+y+hKgNlRz7Bd9UGSSverCIp/bDvr351I=
X-Gm-Gg: AYBFou35cBiOr0AJQ3Izrm4UuW7UabAZGMrEx4fAUVghNMPRLXk3xie2Ss+agrsJPFw
	0y0WXMt7xu2LTIkUgldGKU4teywiNaOGl5M0SZvoftMIrflwcL5k6wXrY1mStX8JXj1fM93pALk
	tF6FSHAPvlqDFdMPzlFoblieLwFtdYg1cH5kS+MT0OgB8OyTCy+axGrKPyKD0vsP5yCHT/SyDp2
	49ohzPIpK72ErRSYbVCyT/wacupfGJo6swF8yQ6WNG/8vp8Hq46u4pxlJd3Uo07yyTKdT3Li3Bu
	p1kULEyUf5oqvaqrOc8TtDxLF5/UjY6ifrWtfKWm7zTOuaOnt7dElpqG9ncdsG/CaURKNeORK3c
	sXb6/+g==
X-Received: by 2002:a05:6a20:d707:b0:3dd:a195:fa0e with SMTP id adf61e73a8af0-3dda195fd95mr361302637.51.1789750723372;
        Fri, 18 Sep 2026 09:58:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:d707:b0:3dd:a195:fa0e with SMTP id adf61e73a8af0-3dda195fd95mr361267637.51.1789750722830;
        Fri, 18 Sep 2026 09:58:42 -0700 (PDT)
Received: from localhost ([143.246.51.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e7433sm1426162a12.28.2026.09.18.09.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 09:58:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 00:58:17 +0800
Message-Id: <DLILO7Y6WWXC.ON1PAKLWJM1Y@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] drm/imx/lcdc: avoid duplicate clk_per enable
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Ze Huang"
 <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin" <abrodkin@synopsys.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard"
 <mripard@kernel.org>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew Jeffery"
 <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>,
        "Philipp Zabel"
 <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,
        "Marian Cichy" <m.cichy@pengutronix.de>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-1-de36e534f7a1@oss.qualcomm.com> <bbf8fd0e-8e1c-4899-98f4-b8231800de8c@suse.de>
In-Reply-To: <bbf8fd0e-8e1c-4899-98f4-b8231800de8c@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI0MiBTYWx0ZWRfX9PNdt8MgAmbM
 422ThxkZTwPg8aXsM2ZjxHEVOGnmlIJgF5rebvI8gBDt9rf/amG0tWhxJH8ot12vnzygW2S1SDT
 dLEy/TSNhOuVyxAjw698yI9RB/GZgsmYXuESR5kGyQu9BOwpMWQgn7QuAuOEeOdlwpzyKUs8KFV
 6Ks6JfHEmA78ojqbSC/GK4hkL/iZpEN0sGcqUy/PT75d522fSL16iI3BaM7MoKKqISZWJp2ufwa
 wMIEOe8CjPXCHQb+rzIs7kFrs76sIHs6etFlJT4lYVlEvYX0yWoGTR3OgEEYaibiJ3MLCgKkVY2
 VJQAubSceCzy+zOwlqwcC+jF9bNv/uk01bX5zQwjjSbk0XGClDRMKw6+z+miJhKsNKa560I6UvJ
 FDCGkQNF82R3r9c8MR6k6MJm+8QaqIVJHGvRtrqUCt0E2Eg+5rHhivkeSpScAEZdf5tf8aXcOWY
 tHdgexqq4n69iRUBy5w==
X-Proofpoint-ORIG-GUID: Lhic_NA9QpHeVE4wmm2nUXEbu6jHC3b7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI0MiBTYWx0ZWRfX+6lFKbhR0NB7
 fvKKWN6dB+ioihttW3Ypgg9nsmmptjFxp1EWpbXfjcVXIQkBwpKv+IDJ0grue+ujSOAB0ictfWf
 7oV+YTquyni7VX09cTuGUXrc/vvEJQU=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad6dc4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=LNnhWNgewsfctp/cwirQdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gNeoJdBQTLUQTwsD9V0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Lhic_NA9QpHeVE4wmm2nUXEbu6jHC3b7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180242

On Wed Sep 16, 2026 at 2:24 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 26.07.26 um 21:42 schrieb Ze Huang:
>> The simple-KMS helper calls the pipe update after enabling the CRTC.
>> On an enable commit, imx_lcdc_pipe_enable() already programs the
>> mode and enables clk_per. The following pipe update sees the plane move
>> from no CRTC to the active CRTC, treats it as a mode update, and calls
>> imx_lcdc_update_hw_registers() again.
>>
>> That second call has no old CRTC state to disable clk_per first, but it
>> enables clk_per again at the end. The disable path only drops one
>> reference, leaving clk_per enabled after each on/off cycle.
>>
>> Skip the register update from the pipe update path when the CRTC already
>> needs a modeset. The enable path has already programmed the hardware for
>> that commit; keep the event handling in pipe update unchanged.
>

Thanks for your review.

> That seems reasonable. Once the driver uses regular DRM helpers instead=
=20
> of simple_kms,=20

> it can all be untangled and this test won't be necessary any longer.

Yes, that's the goal.

IMO it's better to spilt the operations in imx_lcdc_update_hw_registers()
or distinguish the caller.

However, it might be risky to make big changes without hardware validation,
I think it accpetable for now.

>
>>
>> Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
>> ---
>>   drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/l=
cdc/imx-lcdc.c
>> index f52832b43aca..81024f7d9e96 100644
>> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> @@ -311,7 +311,8 @@ static void imx_lcdc_pipe_update(struct drm_simple_d=
isplay_pipe *pipe,
>>   	else if (old_crtc !=3D crtc)
>>   		mode_changed =3D true;
>>  =20
>> -	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
>> +	if (!drm_atomic_crtc_needs_modeset(crtc->state))
>> +		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
>>  =20
>>   	if (event) {
>>   		crtc->state->event =3D NULL;
>>


