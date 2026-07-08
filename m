Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB693F12CB
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524578; cv=none; b=U8zdEzhxOWoAXJKPDf0cqByLKW8z2hI1uz+8lE6GF+lqOXmdJXDK2wXCoCGDF1L9TShOYid5T7utj8vX9ZghX51wADWSRkYneE1YSKhAY2ju9VX4kh4iDD28gJFCyQMPbFs23b9Uz7ErHAvt29wEdvTcRMRqMvuYro0xFDt0QVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524578; c=relaxed/simple;
	bh=/EWbXHkDyxmRFCrpZ9sOacNz3FNzYc9YRSOdSm46RNw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AZzeAhrzITsRukG5RxFkmUQVPt7cA2NGYPhmnt3Wsp8WLQy11TQg+fL0dUVytOeNeyv88aHlvtwbFVKOYvRA6pcyTV+6rxtXzPNEfp/ly00BgCbXiNXrvT3jNOJ4sRlngilgP2MLiRSpea6qhFFXvFfKWKJKB5OGVgbhMOpJs2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJxcrN1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X85zUz/w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJxcrN1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X85zUz/w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C4V0T2752750
	for <imx@lists.linux.dev>; Wed, 8 Jul 2026 15:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	70zYiNfQoqGUZwaTbkI3q8uUAT8YrVOohiWmsnW1WKY=; b=MJxcrN1JXBcMtK19
	Pfev8qimb74w+MKw5k/hUYNzgU+zE4Mw0fSpCrFZ7lOHvxSs7oJm7ErpsBWzwnpI
	un/NMMOnDxsNcpt35kidw/cp/zKCBzjBPf5Jt4Mg8aW5zQgbqsPs64EiB9yHTduO
	hOs/FTUhYu8rcejTKUgvikj1tz5ROiKrcsqFKbvtzLjwOzLrBSUFjar/QB5/mBxC
	Vdmmmh+jeVwJkXXyWVzBj6xnOpcug6wFu1X5gsWcMTLci35ybLIj71oZisxgrzwt
	vWPl0BbEThkIZX4pYpJ2aB1KhJwDUSwlzFmsg10/omwf9phFFsq/4ToVgHjd+VlX
	yF+Lqw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssu5y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 08 Jul 2026 15:29:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cccfa32670so11310425ad.2
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 08:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783524574; x=1784129374; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=70zYiNfQoqGUZwaTbkI3q8uUAT8YrVOohiWmsnW1WKY=;
        b=X85zUz/wYPxCRrdYrYxrifMWDdaqu5nolpM75uygUHllxUSZg9pVSZJ/gVuEaKs0em
         U34lfcFbU6noi1xfxxIse61j3y1GUTmUlZeQiDMjNQ+Ywb+iMOLHMgnXdsg9/pwAgVG+
         9BZ7FTTGOowwSIvy9yWu0MpYXyyJuvKUlwkSnbEL8CiXiPF6em4ooGdY6lQwUQGUM/Yu
         3XBY2a8DWY+f17Xch5PABIJE/o1kytuz+95w4gSYMFWnTpuwO7xBqLRuajUYXjYvQ42m
         eQQhafJpkf6y9v6l2WSkbUUhoOdnCc2GRbqlV42JMpX2glj/2C9/J+I72DpLqi9SaqOJ
         w+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524574; x=1784129374;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70zYiNfQoqGUZwaTbkI3q8uUAT8YrVOohiWmsnW1WKY=;
        b=PjQLMbm7P9eAGtKtwCs/Lh9NsHYhuge02nl7tWzObvJwPYJr4OjQXxTczci5AAODZQ
         MJ10WDSyCB2czQk5ixCiNkXWEArAcT8w63RfXevZfJsZHY9v1tgoYeQVKr8Bfz+KrJwX
         oFTTXF2foOdPFeVvXbb+1uPeZh24ToMF6eZitg1D7wFJRK6/OjyIFckHHnfuGVMcVrK3
         YBf8t1OH3f3LvM/61zzyTM9BDk4I+eQcwRZFcy7p0hUZV8g/gRy1GY4kzPOJ3Pw0I7JZ
         zUC8GF1pUf90jarECwYjfzdbkjUhaz2c6q7Mp4HS3YnlTlVszIkVOL2HEnggVphI8WhK
         t4Jw==
X-Gm-Message-State: AOJu0YyysoXcCrr8h2cgp9KoafIT7g7z8fczcyr0S1xBFY8nMTSf+3Oh
	PtiAKq+E7WLjnpVVECiO/OPcpMDLGjzzTifqSZFNuyVSEmDQxko3DjmJza3+DY7PK43s+mFjsVk
	KI3IxsE1tml4T71b10h1KNLtIzjs0IRsTwFG0XEFf5W77K30sI37+iac=
X-Gm-Gg: AfdE7cmXsyt1S4foCUVPaIDj72zlktCXUrNKIgtqRk7x9BHlmcqg8HlipqN7HGHEl9o
	fJ64kJm7BNEAmNbLA+fYHefAkPR7rI5h8ahzsv5O1ZzZnK7bbx+OAMJWbN5CsU+wy/ASvunOrM8
	X0qBHSslKxTR8AKTnb4HuUCaAN+3HtE5qnxK1VTk02Wupw9uBeTa5O3xKAKS01800aktOA9C6+M
	t4uNiZWnjaNpTyl46Ciic0kyhszfZaknNxiug1cglss0xRKDqLYFcB+XfCCGIKnREPL0+xwLCd/
	tRAdOvdyJQ8rveSdrHASmB53eYqTLEgTfUuae8ElJ6bI/Egg4eOCLgw0b3vnC2/cP/yBPGO/9d7
	MU3D1glz6DqhzRFo=
X-Received: by 2002:a17:90b:1f83:b0:380:540:d499 with SMTP id 98e67ed59e1d1-3893fe5c05dmr3200405a91.6.1783524574186;
        Wed, 08 Jul 2026 08:29:34 -0700 (PDT)
X-Received: by 2002:a17:90b:1f83:b0:380:540:d499 with SMTP id 98e67ed59e1d1-3893fe5c05dmr3200358a91.6.1783524573598;
        Wed, 08 Jul 2026 08:29:33 -0700 (PDT)
Received: from localhost ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d3c675b1sm2862308a91.15.2026.07.08.08.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 23:29:18 +0800
Message-Id: <DJTAOV6K82ZR.3T4EZDN7HVQ28@oss.qualcomm.com>
Cc: <imx@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
        <Frank.Li@kernel.org>
Subject: Re: [PATCH 9/9] drm/xen: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-9-b4e1ca053623@oss.qualcomm.com> <20260704185346.627B61F000E9@smtp.kernel.org>
In-Reply-To: <20260704185346.627B61F000E9@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e6cdf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cXiuqu8dGSoeSI90gQIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MiBTYWx0ZWRfXx4vwYdorr/yS
 562bMkHAhldp26Zr2+17CmxjgN5nVIfxxBWkqC3ygAZrAXVJWGuIV+/Cl2LVkSxcwy5b3DUCZ02
 CWMEiFsO23617hQXhSdf5s6uG7zuD2vfmOb2ZiCR3TUPzzEgqhHGov46Luxn4gOjkAlDKaSvjd6
 ALu4UqRXJNmsvmA4Nb5HY/M+FPNXIE5y6cwEIA4KmNtLhmuznI383a6wPFj0/mB1SCgTuw32vCs
 C7vEFCA+OMD77yCkeTgU6tbAkLLHyHHUTMRl0qkQTM4jP4Oq0mM1rSMc3gveMFnEYMBQFIM05SR
 79B6o4qvffrRvLSBipz3QPYIO0zhcUekYgylIREZ7VMlv6EUiX7Aqeqmr9B6lECqQa8YsV+UMfx
 KByQE5+XbZeIka/hFOVMbCHeksPpL8HZY/5XLILfCMbu2DRKR6Bcv7J5DuA5AS5/dpaMGoS6Js3
 Ty3IIYZdapegYej4J7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MiBTYWx0ZWRfX8z7igsPs3G99
 PqbH/BGby0mAmhq7/PFgBX4il9hChNe11fsf5ogsvSLziGfU7roSoj49GPb9KO7iVYbhCW5yENo
 aV+B1apu8INsWpS/Dgqq7Z1wDroXJ04=
X-Proofpoint-GUID: NUooO3SLLwPHzvhBEgGRW-aZ_YBGlHV3
X-Proofpoint-ORIG-GUID: NUooO3SLLwPHzvhBEgGRW-aZ_YBGlHV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080152

On Sun Jul 5, 2026 at 2:53 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Hardcoded `possible_crtcs` mask restricts all primary planes to =
CRTC 0, breaking multi-display support.
> - [High] Direct access of global `plane->state` and `crtc->state` in atom=
ic commit hooks leads to race conditions and stalled events.
> --
>
> commit 8a32b307abb3d8e006d032d01a1802aa1e4ae6f0
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/xen: replace struct drm_simple_display_pipe with regular atomic helpe=
rs
>
> Replace Xen frontend simple display pipe with explicit plane, CRTC and
> encoder objects for each pipeline. Keep generic plane-state validation
> before Xen-specific checks, and install GEM framebuffer prepare helper
> explicitly.
>
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/x=
en/xen_drm_front_kms.c
>> index 48772b5fe71cf..57e1bef452f83 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
>> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
>
> [ ... ]
>
>> @@ -105,17 +105,15 @@ static void send_pending_event(struct xen_drm_fron=
t_drm_pipeline *pipeline)
>>  	spin_unlock_irqrestore(&dev->event_lock, flags);
>>  }
>> =20
>> -static void display_enable(struct drm_simple_display_pipe *pipe,
>> -			   struct drm_crtc_state *crtc_state,
>> -			   struct drm_plane_state *plane_state)
>> +static void xen_drm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					      struct drm_atomic_commit *state)
>>  {
>> -	struct xen_drm_front_drm_pipeline *pipeline =3D
>> -			to_xen_drm_pipeline(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct xen_drm_front_drm_pipeline *pipeline =3D to_xen_drm_pipeline(cr=
tc);
>> +	struct drm_plane_state *plane_state =3D pipeline->plane.state;
>
> [Severity: High]
> Is it safe to access the global pipeline->plane.state directly here? If
> non-blocking commits overlap, this pointer might point to a newer,
> uncommitted state. Should this code use drm_atomic_get_new_plane_state()
> to extract the state from the drm_atomic_commit object instead?
>
>>  	struct drm_framebuffer *fb =3D plane_state->fb;
>>  	int ret, idx;
>
> [ ... ]
>
>> @@ -242,15 +259,19 @@ static int display_check(struct drm_simple_display=
_pipe *pipe,
>>  	return 0;
>>  }
>> =20
>> -static void display_update(struct drm_simple_display_pipe *pipe,
>> -			   struct drm_plane_state *old_plane_state)
>> +static void xen_drm_plane_helper_atomic_update(struct drm_plane *plane,
>> +					       struct drm_atomic_commit *state)
>>  {
>> -	struct xen_drm_front_drm_pipeline *pipeline =3D
>> -			to_xen_drm_pipeline(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_s=
tate(state, plane);
>> +	struct drm_crtc *crtc =3D plane->state->crtc ?: old_plane_state->crtc;
>
> [Severity: High]
> Can accessing the global plane->state pointer here cause race conditions?
> It might be safer to use drm_atomic_get_new_plane_state(state, plane)->cr=
tc
> to ensure the correct state is referenced during the atomic commit.
>
>> +	struct xen_drm_front_drm_pipeline *pipeline;
>>  	struct drm_pending_vblank_event *event;
>>  	int idx;
>> =20
>> +	if (!crtc)
>> +		return;
>> +
>> +	pipeline =3D to_xen_drm_pipeline(crtc);
>>  	event =3D crtc->state->event;
>
> [Severity: High]
> Similarly, does reading and modifying the global crtc->state directly ris=
k
> fetching state from a concurrent commit instead of the current one?
>
>>  	if (event) {
>>  		struct drm_device *dev =3D crtc->dev;
>
> [ ... ]
>
>> @@ -331,10 +395,37 @@ static int display_pipe_init(struct xen_drm_front_=
drm_info *drm_info,
>> =20
>>  	formats =3D xen_drm_front_conn_get_formats(&format_count);
>> =20
>> -	return drm_simple_display_pipe_init(dev, &pipeline->pipe,
>> -					    &display_funcs, formats,
>> -					    format_count, NULL,
>> -					    &pipeline->conn);
>> +	ret =3D drm_universal_plane_init(dev, &pipeline->plane, 1,
>> +				       &display_plane_funcs,
>> +				       formats, format_count,
>> +				       NULL,
>> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
>
> [Severity: High]
> Does hardcoding the possible_crtcs mask to 1 restrict all primary planes =
to
> CRTC 0? For pipelines with an index greater than 0, the CRTC might fail t=
o
> find a compatible primary plane during atomic validation. Would using
> 1 << pipeline->index allow multi-display configurations to work correctly=
?
>

Will change possible_crtcs to 0 to populate automatically.

>> +	if (ret)
>> +		return ret;

