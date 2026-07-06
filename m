Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A7D2475F7
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 13:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344744; cv=none; b=JDdQiwqH6tkj50/eTk7s4jUH79wyHH0l/PjITV2783zslxI1DcESI0PSH0pzzR296Q1eiPEK5X7v5BZ8LtPxTpIDA0AFoLxJ/GqkTgww47bX6exJvaNasFCcTexhmGCHWF8Kxo1Cezhu7d12rEpbR6zM3HqieXlvW9mVmogAE5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344744; c=relaxed/simple;
	bh=wby7bx1ZV24fQZnp64a0HA6/pOhXyvS+onuuxArhMOE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=re2Apws18I8Vnvdse91dZRWRqIUQejcUGQYcwLU18F2vszwRHk3SNEvoTV52gyMSFkMtO39G13N/6ZQHf4/44T7WjuVlx6D1TpyHHpodE8wis0ZXVotNadfSgAXthTzZOXK14QBrfekmSbfbswHhPMzdw1zLkeKA26eN++fYslE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fG+3SByw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jo3lpR/w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fG+3SByw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jo3lpR/w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOrj245846
	for <imx@lists.linux.dev>; Mon, 6 Jul 2026 13:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0A44HOo06DPQTnDCUPqJ4UMJjyqFyasJ88lIL5lLZ8=; b=fG+3SBywJZ4CROyC
	EBkvPSthGbsziZkeQ7K40QVe4l60fKx8Uz2ijBpMSp1CBVrM+HI0Qd48bpu+Nzhi
	b04ix3wRfk0Y6Vz8Brg9AsqOEADGYxOTg6YXVxaP6tiB5K+NL9xWmAIQdcSDsoja
	45b2aDZ3euian4+uXjzxtwYvwI7wgwpW24xN4DoAEA0dPPY4VKGbbtifFuvCkpGD
	W08lRaoc5vSPjy7BTnjfbHHH1tS2o+s/64gN7WIJ9Qc5EPV85CK276mNfFiZO5Kz
	6EK8MGQwRIYJLD/vCqeLfFfNvZBogj1cBhA/mt27j0jVSHDY5xiaxoDqHwFtLlDE
	9x26Mg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gsc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 06 Jul 2026 13:32:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84696ed3b24so4843205b3a.1
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344741; x=1783949541; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0A44HOo06DPQTnDCUPqJ4UMJjyqFyasJ88lIL5lLZ8=;
        b=jo3lpR/wbUVTUnLZYba9Z0dSNV2A8gzYMGUrO8Rw8oJKKqB2ZPEVr/vvLCbeEqcdin
         ewQgEQd4X40qqLxYJsE5mc5eLSJoBdOalpbTCisMNpn0he7sHzBJAPrZKx8XVk7/X5S2
         M1uoCjafkq1zoBOVIo1Qa/5i8R8R5NecpCIgBAfjyR9nQ3eD5iNrxDNNHkgDRSoYtkk1
         yC3OU5P6iV/msQtbJonsavPffEjXzNE43es8igMHNSIsVvxdiucfSHRidlUKJAnPLJQe
         k7v0YvgLX8dF2J7dihOxyf1v0dT5mnx3gjHPfTUhiaByRsf534KbSB8mQzaf/GCf/T2x
         K5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344741; x=1783949541;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b0A44HOo06DPQTnDCUPqJ4UMJjyqFyasJ88lIL5lLZ8=;
        b=eb8i28/03HHhDD/sao/8JSgS16M0orZUGLRi8Wm9WSZYhkCNcNN2eSOE1NVUiNfZXb
         w1+Xncy5n1xrAMQul5Iv3LKL4GaH+qFCk24asUumjYfM4Z3s4Xxp0e/PQMC1kz2WASN5
         L2D3JTeKcgZ9snXW023PPAU3gKmJ1dFHSZ2kkz5endVCebRcvHJTVfR6r/C2ChbBcD1z
         MUEApo+xrK7PbFerAlwww/cRnzhBlbX/jTWJGc2vGMtk9BHAt16aaJdPQDQ5nb1R8ixc
         W3OmXjPxN6eyeemVMgmTNuh7es6j2dxWG6gG/kl5G0QTvzWF4CJwAuAlcuA4WC6sPwys
         wH+w==
X-Forwarded-Encrypted: i=1; AHgh+RpsmjoDkLYMnOJeaGyenkc2kSOv0aHMgrIZlJDxpbHsQ57KLqC0vQoglAuZftDBVuOUV0c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnWHGMMSJKsojnwZlSyowvlOoGdn4AXdD1CYCSdT64v6mXaOCP
	mr9tymus5rEYKqxRp0FjSGcekDOWV2zPgVU2qF+fm7Zei4H9/b1YG9VAYUcNBDp5b43X8aL76ND
	+aWNPxm1NE1NRiMmPJMvD76rVGJDphj6IqT0TWPYfFlePdjF8mmFgZMY=
X-Gm-Gg: AfdE7clXjmwQtDEz5XKyc1CEXY0f8CqbABYSjSKq3cFBFtvcN7cFwsmSVi6G3m1JsZ4
	4PwHjb91HOQB69u/e3ntg9vwDJ27YC4X8ceI8es0S2YXf/B0HB5KDBcnaMVBlNImuUSTrtaIrTY
	hRuKVkXQ+6W/9CH/QAzmlr7UVtbSPayfIpIZVcYOGUXCZYQAfOoBqbCu5sdA7jKkar5w5Vp9zjt
	e2iFPSLejS026GwdYcveVquBk47RwGzZInn80ce8h6HX6shzVKb7i9N9H5t6avrzh7kqLmUZDBM
	2x9CSTTiM34KEwJy2er7a2M+iO2Zx3kk+qoLIYSbWJQZ+WzbszzzJayq0A2GYGRJiqO6F4HhDgg
	I8CiPn9dUmKNszQE=
X-Received: by 2002:a05:6a00:c8d:b0:847:8f8a:a055 with SMTP id d2e1a72fcca58-84826bea1afmr615707b3a.17.1783344741281;
        Mon, 06 Jul 2026 06:32:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8d:b0:847:8f8a:a055 with SMTP id d2e1a72fcca58-84826bea1afmr615631b3a.17.1783344740650;
        Mon, 06 Jul 2026 06:32:20 -0700 (PDT)
Received: from localhost ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d82382sm3762898b3a.49.2026.07.06.06.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:32:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 21:32:03 +0800
Message-Id: <DJRIY04KAKRH.2XJRADHKJ4G55@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/9] drm/aspeed: replace struct drm_simple_display_pipe
 with regular atomic helpers
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
 <oleksandr_andrushchenko@epam.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-2-b4e1ca053623@oss.qualcomm.com> <4e35e133-364a-4743-9ca0-f0799bdf28f8@suse.de>
In-Reply-To: <4e35e133-364a-4743-9ca0-f0799bdf28f8@suse.de>
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bae66 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OF-i8N8vVdU2NhfsQ9oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfXza7U0y1u7oh2
 vcJDG/eJoe4bNtU7RBkf/6pOxjWkgGgpBn0j3nb9K2SuHC3v/7wtEHa77Qm9rQw05G2JVUirbZb
 CCaFRa+DsBR6hbzguptzgFFlqlX7orQqjh/+9aD1+v7nVh7HOac6V2NMsdkemIXsagfZtDJazdH
 eZ+krqvcwDvKN3Y/HLv0BVEsaBdtJ+1b5GcWuKKP3ddGyOMNL1klM7VQNN3USGCa79LeTKIlVTU
 1+gcmjVl1AgXCroIOdAMUh/jy9eiAav0+2CEAm44btYGXc+RmICjaOQGtue2wLxhZcOVyT/nGIw
 v6hD3nJovIMlGDofbeTtMNqcgNdlJTRkH0HnjOSOMpZuEuRptrmXto48YUAY5MYOmnmIudBZ4EB
 1njeIPAO0BCzbTWPyuVDKFhqlxv11WOKbOOVbSfa73ggyiIiX8+jwBjimlx9DbsiVDx5CI1q6LF
 VxYVqTm7AoeVDvpTllg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX0q7Uo9r7rL+B
 wdhzct+Ejv0phsbySHSHgXtcLUv4CzB60JyIo6JZORXIWAih7q3xSs1clObVg5/Y8lXieYtZxa1
 fjHAB9Fr1I/QhVqsskGxAe3C9MIbLnw=
X-Proofpoint-GUID: kUS0S7vCA_QXlp0cENtE8FcpNhkNbXMB
X-Proofpoint-ORIG-GUID: kUS0S7vCA_QXlp0cENtE8FcpNhkNbXMB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060137

On Mon Jul 6, 2026 at 4:31 PM CST, Thomas Zimmermann wrote:
> Hi,
>
> common points from my arcgpu review applied here as well. See below for=
=20
> a new other things.
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> Replace simple display pipe with explicit plane, CRTC and encoder
>> objects. Move callbacks to plane and CRTC helpers, with vblank handling
>> through drm_crtc_funcs.
>>
>> This removes intermediate simple-pipe layer and uses standard atomic
>> helper wiring.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/aspeed/aspeed_gfx.h      |   5 +-
>>   drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 156 +++++++++++++++++++++++=
--------
>>   drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
>>   3 files changed, 123 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspee=
d/aspeed_gfx.h
>> index 4e6a442c3886..a34811564c0d 100644
>> --- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
>> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
>> @@ -2,7 +2,6 @@
>>   /* Copyright 2018 IBM Corporation */
>>  =20
>>   #include <drm/drm_device.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>  =20
>>   struct aspeed_gfx {
>>   	struct drm_device		drm;
>> @@ -17,7 +16,9 @@ struct aspeed_gfx {
>>   	u32				throd_val;
>>   	u32				scan_line_max;
>>  =20
>> -	struct drm_simple_display_pipe	pipe;
>> +	struct drm_plane		plane;
>> +	struct drm_crtc			crtc;
>> +	struct drm_encoder		encoder;
>>   	struct drm_connector		connector;
>>   };
>>   #define to_aspeed_gfx(x) container_of(x, struct aspeed_gfx, drm)
>> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/=
aspeed/aspeed_gfx_crtc.c
>> index 7877a57b8e26..3294795c31c4 100644
>> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
>> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
>> @@ -5,6 +5,8 @@
>>   #include <linux/reset.h>
>>   #include <linux/regmap.h>
>>  =20
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_fb_dma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> @@ -12,20 +14,13 @@
>>   #include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_panel.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>   #include <drm/drm_vblank.h>
>>  =20
>>   #include "aspeed_gfx.h"
>>  =20
>> -static struct aspeed_gfx *
>> -drm_pipe_to_aspeed_gfx(struct drm_simple_display_pipe *pipe)
>> -{
>> -	return container_of(pipe, struct aspeed_gfx, pipe);
>> -}
>> -
>
> Please create a new helper
>
>  =C2=A0 struct drm_aspeed_gfx *to_aspeed_gfx(drm_device *drm)
>
> that does the upcast.
>

Will do

>>   static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv, u32 *bpp)
>>   {
>> -	struct drm_crtc *crtc =3D &priv->pipe.crtc;
>> +	struct drm_crtc *crtc =3D &priv->crtc;
>>   	struct drm_device *drm =3D crtc->dev;
>>   	const u32 format =3D crtc->primary->state->fb->format->format;
>>   	u32 ctrl1;
>> @@ -79,7 +74,7 @@ static void aspeed_gfx_disable_controller(struct aspee=
d_gfx *priv)
>>  =20
>>   static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
>>   {
>> -	struct drm_display_mode *m =3D &priv->pipe.crtc.state->adjusted_mode;
>> +	struct drm_display_mode *m =3D &priv->crtc.state->adjusted_mode;
>>   	u32 ctrl1, d_offset, t_count, bpp;
>>   	int err;
>>  =20
>> @@ -139,33 +134,31 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct a=
speed_gfx *priv)
>>   	writel(priv->throd_val, priv->base + CRT_THROD);
>>   }
>>  =20
>> -static void aspeed_gfx_pipe_enable(struct drm_simple_display_pipe *pipe=
,
>> -			      struct drm_crtc_state *crtc_state,
>> -			      struct drm_plane_state *plane_state)
>> +static void aspeed_gfx_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +						 struct drm_atomic_commit *state)
>
> Please see my comment on arcgpu for the new naming of 'state'.
>

OK

>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct aspeed_gfx *priv =3D container_of(crtc, struct aspeed_gfx, crtc=
);
>
> Please use=C2=A0 your helper=C2=A0 to_aspeed_gfx(crtc->dev)=C2=A0 to do t=
he upcast.=C2=A0=20
> Here any in other places.
>

OK

>>  =20
>>   	aspeed_gfx_crtc_mode_set_nofb(priv);
>>   	aspeed_gfx_enable_controller(priv);
>>   	drm_crtc_vblank_on(crtc);
>>   }
>>  =20
>> -static void aspeed_gfx_pipe_disable(struct drm_simple_display_pipe *pip=
e)
>> +static void aspeed_gfx_crtc_helper_atomic_disable(struct drm_crtc *crtc=
,
>> +						  struct drm_atomic_commit *state)
>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct aspeed_gfx *priv =3D container_of(crtc, struct aspeed_gfx, crtc=
);
>
> Another upcast issue
>

Acknowledged

>>  =20
>>   	drm_crtc_vblank_off(crtc);
>>   	aspeed_gfx_disable_controller(priv);
>>   }
>>  =20
>> -static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe=
,
>> -				   struct drm_plane_state *plane_state)
>> +static void aspeed_gfx_plane_helper_atomic_update(struct drm_plane *pla=
ne,
>> +						  struct drm_atomic_commit *state)
>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_framebuffer *fb =3D pipe->plane.state->fb;
>> +	struct aspeed_gfx *priv =3D container_of(plane, struct aspeed_gfx, pla=
ne);
>
> to_aspeed_gfx(plane->dev)
>

Acknowledged

>> +	struct drm_crtc *crtc =3D &priv->crtc;
>> +	struct drm_framebuffer *fb =3D plane->state->fb;
>>   	struct drm_pending_vblank_event *event;
>>   	struct drm_gem_dma_object *gem;
>>  =20
>> @@ -190,9 +183,9 @@ static void aspeed_gfx_pipe_update(struct drm_simple=
_display_pipe *pipe,
>>   	writel(gem->dma_addr, priv->base + CRT_ADDR);
>>   }
>>  =20
>> -static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pip=
e)
>> +static int aspeed_gfx_crtc_enable_vblank(struct drm_crtc *crtc)
>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> +	struct aspeed_gfx *priv =3D container_of(crtc, struct aspeed_gfx, crtc=
);
>>   	u32 reg =3D readl(priv->base + CRT_CTRL1);
>>  =20
>>   	/* Clear pending VBLANK IRQ */
>> @@ -204,9 +197,9 @@ static int aspeed_gfx_enable_vblank(struct drm_simpl=
e_display_pipe *pipe)
>>   	return 0;
>>   }
>>  =20
>> -static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *p=
ipe)
>> +static void aspeed_gfx_crtc_disable_vblank(struct drm_crtc *crtc)
>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> +	struct aspeed_gfx *priv =3D container_of(crtc, struct aspeed_gfx, crtc=
);
>>   	u32 reg =3D readl(priv->base + CRT_CTRL1);
>>  =20
>>   	reg &=3D ~CRT_CTRL_VERTICAL_INTR_EN;
>> @@ -216,12 +209,75 @@ static void aspeed_gfx_disable_vblank(struct drm_s=
imple_display_pipe *pipe)
>>   	writel(reg | CRT_CTRL_VERTICAL_INTR_STS, priv->base + CRT_CTRL1);
>>   }
>>  =20
>> -static const struct drm_simple_display_pipe_funcs aspeed_gfx_funcs =3D =
{
>> -	.enable		=3D aspeed_gfx_pipe_enable,
>> -	.disable	=3D aspeed_gfx_pipe_disable,
>> -	.update		=3D aspeed_gfx_pipe_update,
>> -	.enable_vblank	=3D aspeed_gfx_enable_vblank,
>> -	.disable_vblank	=3D aspeed_gfx_disable_vblank,
>> +static int aspeed_gfx_plane_helper_atomic_check(struct drm_plane *plane=
,
>> +						struct drm_atomic_commit *state)
>> +{
>> +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state=
(state, plane);
>> +	struct drm_crtc *crtc =3D plane_state->crtc;
>> +	struct drm_crtc_state *crtc_state =3D NULL;
>> +	int ret;
>> +
>> +	if (crtc)
>> +		crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
>> +
>> +	ret =3D drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  false, false);
>> +	return ret;
>> +}
>
> Return directly.
>

OK

>> +
>> +static const struct drm_plane_helper_funcs aspeed_gfx_plane_helper_func=
s =3D {
>> +	.prepare_fb	=3D drm_gem_plane_helper_prepare_fb,
>> +	.atomic_check	=3D aspeed_gfx_plane_helper_atomic_check,
>> +	.atomic_update	=3D aspeed_gfx_plane_helper_atomic_update,
>> +};
>> +
>> +static const struct drm_plane_funcs aspeed_gfx_plane_funcs =3D {
>> +	.update_plane		=3D drm_atomic_helper_update_plane,
>> +	.disable_plane		=3D drm_atomic_helper_disable_plane,
>> +	.destroy		=3D drm_plane_cleanup,
>> +	.reset			=3D drm_atomic_helper_plane_reset,
>> +	.atomic_duplicate_state	=3D drm_atomic_helper_plane_duplicate_state,
>> +	.atomic_destroy_state	=3D drm_atomic_helper_plane_destroy_state,
>> +};
>> +
>> +static int aspeed_gfx_crtc_helper_atomic_check(struct drm_crtc *crtc,
>> +					       struct drm_atomic_commit *state)
>> +{
>> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(st=
ate, crtc);
>> +	int ret;
>> +
>> +	if (!crtc_state->enable)
>> +		goto out;
>> +
>> +	ret =3D drm_atomic_helper_check_crtc_primary_plane(crtc_state);
>> +	if (ret)
>> +		return ret;
>> +
>> +out:
>> +	return drm_atomic_add_affected_planes(state, crtc);
>> +}
>
> See arcpgu on a possible style improvement.
>

Will do, thanks


> Best regards
> Thomas
>

[ ... ]
