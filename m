Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FB53B5841
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521911; cv=none; b=ZJkEOxTvoadogG7iGU6DOq37Ak/u+eT1WcKtDDarmX9bwONQARNvfkg99ns64oxkO4xt1MQPDf2aKJE9K03oxkT3QIyrG6jEyl67Y/TUzbur6O6/3s12Pn/qY2omZxazRoQV0EMGtgMoyD9kjPtp1DTezrpLxWirGavLMQyWJ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521911; c=relaxed/simple;
	bh=IeN9WAeJEeMz8vA/hpWE1WXPKajEhYQVcd/X19+dE78=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=kx2fonMr5HQ30eUk6p+N6rWNHR9HuaxyOBGMHRJDQ5Sai8edgxe/AyqtnRm0csifgvZImt8eWPKAuaPDoiU7j95po+BZKT/kEMH0PicqDtUDfUckrlICVUPSXMhZw/s5M4ynhISahn6v/e9fXWUnlapMxznCEeviGjzUma5ipbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jgbop/F0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKG3KSFa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jgbop/F0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKG3KSFa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Ln62608008
	for <imx@lists.linux.dev>; Wed, 8 Jul 2026 14:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5HotaLJOpxQKOWfRZToEfRIMXX4F1I/5+Refyn+Gzmo=; b=Jgbop/F06M/fLxuR
	Ld/hazN0kxogXEm0oYZWh3+HLlQXPdoDxHaJXMA6JhYDBG8snm/OiBruJBjQCfrB
	IYLJIe5YdqA5fPqJxLyGTwspMkv5gq4mCarcBG4pFEZEn6Rk5KQmADMzscrV4+BB
	ScPU/O3CasZcORibe7bOkbStOgpLTCWDmYGGe+v3b/ZyogNA9b4Wy4ZjVaCFTM+v
	uJGy7RoVrYP5feyANUoOWZuJ4yLXZLsoEZIhFthnw7i5fziIeaTWqQWJN1UEytCF
	3i0BmEBo9OkxLMeZU134pFbmfSRXsUVFe9/f/GY7c1wBKUyqD9EZOUjdiZaxJqcs
	Q1t6pw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5b6u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 08 Jul 2026 14:45:09 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-43ccd5d5357so394805fac.0
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 07:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521908; x=1784126708; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5HotaLJOpxQKOWfRZToEfRIMXX4F1I/5+Refyn+Gzmo=;
        b=IKG3KSFaAXNM3DrtLvBoYGw1SiCISUdzda5GMNz/XGO9YtqCz9MIJ9jeqMhHtf9p+9
         Yd8GlGRT4/XqEKWKR8WDdO/aDIM5AnmTdT3fyafsHpgJ8N3q6W8HY0zysopsOrRIi+4Z
         N4oBrgEG6Io2NIqz6d5Njv2WQLTRP0u8GfJMCKqZYiNLcUsvq6ylIWF/sGJbgBrvUdYC
         Hqmht39X+/7WGWPL5WXySoag9ACxWxL4Mgwf6B3BWabtHHr0cs/6j04NvLpyfmAPVtuB
         +lemTmVC1H+7z5QlScn5B1MKv5oYFQE+gSq1UKtuMNpJtjJrUiEhTIYULGYaV6QRWdTD
         UoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521909; x=1784126709;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HotaLJOpxQKOWfRZToEfRIMXX4F1I/5+Refyn+Gzmo=;
        b=HDyJS68a4WpiFC06m3P1t8mDDJsj/gkOL/vLA5iLjNDCH0EpOHmRdHG+rw53sx7tJV
         RCzDcqaq0qOE6PPPpVxMqXM7r/LeJ8V8MEz7apigaRwZlL+mZo3q6v450gg6z+xKi0jK
         vFkBh0RMueQbTnpB2l4xuuVpYAuBFawqo8zh+yCEraHAO5HrNnxWmCgZR0R4xhL7Hpcl
         xgULUfZMEtUFicsW7A6toTiTQiZ1rIcG1eVfUVTEj3p6OeHRIn1xqpjvKxWjLIrvti/a
         lVaXzV5q9mwU/RYKaMTN96P5EcO4+0MZu+YKYUuyfZw7wc8Nf2ibHzREa2aQ3YeRFfDQ
         MUcw==
X-Forwarded-Encrypted: i=1; AFNElJ/J1/8MbYVekxEY/nab1C2p8/OZ4unKOVqDGHvq2Duv1HCEoUHdYlGHfttKH/HhyDlLaU4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+c+BtGamW96FCN1yn7gLdM+yAh3W1vLzMsqY6HflFcyoJkLSd
	1t08GylnO8MhUyGtztNHbINwGTPCEkMpWVZPVlDb/ZRBIO85yEwlI1Qi8GCsWOrKVdmofeUU0hZ
	PDJu1I9vfD3wgd9DhKLx8AHD9YloV3fzA5ad5RZ9cQ+bagAClT54vLzQ=
X-Gm-Gg: AfdE7cl42jSpwEH+TTvz7/M1m18TrIKtM4P2o4W2xW3Z5MxWIgLb3hDKcYRCnpUJxLw
	8fdBXYGHsBy/cVGQ9dowgae2GfxFZfNHiVUjaZSkAKmbuAapfWcQ1AoNrD9WJevXrBIOeILogNu
	LxHZMGKsX++AMCON8YiyfOXEV8WMoyL/HTQ+4v9ISV5rtKrG/GPWECcvh8P9bHdDmiV1ouVQFrM
	E4LZEYltGCHfHsJIxDOcvY4njLXSETV9oM+C1rYH3iSl01GS9KMlrl1UulIS/H9mMWALx8u6b51
	vS70dtz0uBlZumbjCK0ECo+aPVbot6hSkBNMudUT00SBgPEPpO0iAIiS0Sd3vaE6dmMjImnNLf6
	EWF5tl23iJ7XgaiI=
X-Received: by 2002:a05:6870:2150:b0:449:bccf:bb6e with SMTP id 586e51a60fabf-451637bc19bmr1788794fac.7.1783521908579;
        Wed, 08 Jul 2026 07:45:08 -0700 (PDT)
X-Received: by 2002:a05:6870:2150:b0:449:bccf:bb6e with SMTP id 586e51a60fabf-451637bc19bmr1788765fac.7.1783521907887;
        Wed, 08 Jul 2026 07:45:07 -0700 (PDT)
Received: from localhost ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb559559sm17037998fac.9.2026.07.08.07.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:45:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 22:44:52 +0800
Message-Id: <DJT9QUB9KH7L.ULPE8GOZ3RS1@oss.qualcomm.com>
Subject: Re: [PATCH 4/9] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <Frank.Li@kernel.org>,
        <imx@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-4-b4e1ca053623@oss.qualcomm.com> <20260704184456.8C1571F000E9@smtp.kernel.org>
In-Reply-To: <20260704184456.8C1571F000E9@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e6275 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yd_HwtBYiBPprMbcnowA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NSBTYWx0ZWRfXyHQiZfwiQBVs
 i6CRZCkJC3b2G7bON7JgTfPU4Om4hOGb9/0DhUGmamfpr2cH9fzT1QaPZd0p933Ihboo7jzPLIa
 3BFDEhTySoEbkX8TPpAeQluR5Zx9QaM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NSBTYWx0ZWRfXyMB71pr/L1C+
 pOcLj4vjoBRt4ZGkBIA1ywhS9ZX/0Bh9/v08E9XDmUCAAnXgf1VldvuUrMC1DSbCIEFb7zoZj6J
 p24Liz/QeFJiXU8fDtt8i0QXnEa0GWQhGw0rzeujzeSGL3fmiwwY50cUsLTXV1QJk114fqLaxgN
 gbM6WAmKPXVywUl7cALdsHOO2i2NdTqpXv8qLFasbW9E9I5phcC0lbb4VFJS/blE/NN7OAaOzBT
 Ccbzt5YH2IhoPreWFrA24m2YYI11hgKJZPMQKEjXRCAlZBXJWqKSrC5PDhh+a4Ve6DTKVsEf5Zv
 iIeFbsBqyNgDptKTI7GFlMJnJ0fQXeqbxWaOuatwb86U2YyTQI8jOYKZEdjNOQW2UryqHka0lAi
 rVMj8EH/ydOmVpyE8wu/S5fTHvvdU8U3fNALjmEQ9z9IC22oaoggiXSCOARdg/CKCe/F/FuFmhH
 ob/U2CqYyTcmvreWBrg==
X-Proofpoint-ORIG-GUID: zroLeRoeHvrwWzqn2yWAKGBLRUZkzYwB
X-Proofpoint-GUID: zroLeRoeHvrwWzqn2yWAKGBLRUZkzYwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080145

On Sun Jul 5, 2026 at 2:44 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] Uninitialized NULL pointer dereference when attaching encode=
r to connector.
>
> Pre-existing issues:
> - [High] Atomic callbacks directly access global `obj->state` pointers in=
stead of using the state passed in the `drm_atomic_commit` parameter.
> --
>
> commit 098f44a54758ae5b340970e3384cc9330909fb06
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/mcde: replace struct drm_simple_display_pipe with regular atomic help=
ers
>    =20
> Convert MCDE to explicit plane, CRTC and encoder objects.
>    =20
> Keep FIFO, event and framebuffer update sequencing intact, and install
> GEM framebuffer prepare callback explicitly.
>
>> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/=
mcde_display.c
>> index 257a6e84dd583..4d86fa5030ebf 100644
>> --- a/drivers/gpu/drm/mcde/mcde_display.c
>> +++ b/drivers/gpu/drm/mcde/mcde_display.c
>
> [ ... ]
>
>> @@ -1149,16 +1171,14 @@ static void mcde_setup_dsi(struct mcde *mcde, co=
nst struct drm_display_mode *mod
>>  	*dsi_formatter_frame =3D formatter_frame;
>>  }
>> =20
>> -static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
>> -				struct drm_crtc_state *cstate,
>> -				struct drm_plane_state *plane_state)
>> +static void mcde_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					   struct drm_atomic_commit *state)
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_plane *plane =3D &pipe->plane;
>>  	struct drm_device *drm =3D crtc->dev;
>>  	struct mcde *mcde =3D to_mcde(drm);
>> +	struct drm_crtc_state *cstate =3D crtc->state;
>
> [Severity: High]
> This isn't a bug introduced by this patch, as it was inherited from the
> simple-kms implementation, but does this newly added line introduce a dat=
a
> race?
>
> In non-blocking commits, the DRM core asynchronously executes the worker
> thread while simultaneously swapping the global state pointers. Reading t=
he
> global crtc->state here instead of fetching the new state from the state
> parameter (e.g. using drm_atomic_get_new_crtc_state()) can race with
> subsequent commits, potentially programming the hardware with mismatched
> states.
>
> [ ... ]
>
>> -static void mcde_display_update(struct drm_simple_display_pipe *pipe,
>> -				struct drm_plane_state *old_pstate)
>> +static void mcde_plane_helper_atomic_update(struct drm_plane *plane,
>> +					    struct drm_atomic_commit *state)
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_device *drm =3D crtc->dev;
>> -	struct mcde *mcde =3D to_mcde(drm);
>> -	struct drm_pending_vblank_event *event =3D crtc->state->event;
>> -	struct drm_plane *plane =3D &pipe->plane;
>> +	struct drm_crtc *crtc =3D plane->state->crtc;
>> +	struct drm_device *drm;
>> +	struct mcde *mcde;
>> +	struct drm_pending_vblank_event *event;
>>  	struct drm_plane_state *pstate =3D plane->state;
>>  	struct drm_framebuffer *fb =3D pstate->fb;
>> =20
>> +	if (!crtc)
>> +		return;
>> +
>> +	drm =3D crtc->dev;
>> +	mcde =3D to_mcde(drm);
>> +	event =3D crtc->state->event;
>
> [Severity: High]
> This is a pre-existing issue, but does accessing crtc->state->event here
> continue to expose a time-of-check to time-of-use race?
>
> If a compositor queues multiple rapid non-blocking commits, reading the e=
vent
> from the global state might clear the event belonging to a subsequent com=
mit,
> leaving the later commit's worker with a NULL event and hanging the compo=
sitor
> waiting for a page flip.
>
> [ ... ]
>
>> @@ -1510,11 +1577,30 @@ int mcde_display_init(struct drm_device *drm)
>>  	if (ret)
>>  		return ret;
>> =20
>> -	ret =3D drm_simple_display_pipe_init(drm, &mcde->pipe,
>> -					   &mcde_display_funcs,
>> -					   formats, ARRAY_SIZE(formats),
>> -					   NULL,
>> -					   mcde->connector);
>> +	ret =3D drm_universal_plane_init(drm, &mcde->plane, 0,
>> +				       &mcde_plane_funcs,
>> +				       formats, ARRAY_SIZE(formats),
>> +				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_plane_helper_add(&mcde->plane, &mcde_plane_helper_funcs);
>> +
>> +	ret =3D drm_crtc_init_with_planes(drm, &mcde->crtc, &mcde->plane,
>> +					NULL, &mcde_crtc_funcs, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_crtc_helper_add(&mcde->crtc, &mcde_crtc_helper_funcs);
>> +
>> +	ret =3D drm_encoder_init(drm, &mcde->encoder, &mcde_encoder_funcs,
>> +			       DRM_MODE_ENCODER_NONE, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mcde->encoder.possible_crtcs =3D drm_crtc_mask(&mcde->crtc);
>> +
>> +	ret =3D drm_connector_attach_encoder(mcde->connector, &mcde->encoder);
>
> [Severity: Critical]
> Will this lead to a NULL pointer dereference during probe?
>
> mcde->connector appears to be a zero-initialized struct member that is no=
t
> allocated or populated prior to this call. Because
> drm_connector_attach_encoder() unconditionally dereferences the connector
> argument, passing it a NULL pointer will lead to an immediate kernel oops=
.

Will drop drm_connector_attach_encoder() as mcde->connector is not used.
