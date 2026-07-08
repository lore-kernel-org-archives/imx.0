Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E843B6C0A
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522013; cv=none; b=qbXZkHa8kdOVIZgdcTh9Mm/CD0ZxS0atVq+uvbcWj559t08ddm8EAlV7CCBqtgRKoLEfLmc7U5Yu2DRiTPhCiumuWETwKaCiOQrVGm1GU5xIBLzrZGPafVhY0lfCc/74kS6yN4QmLfz5S3KwGSlWFQGlCEWUjOHJ8lucPgTNFHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522013; c=relaxed/simple;
	bh=1zXYwZ55wpzDG2rTEJEZLkC0yCnFbaZYzPzQMnJUMaU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IWC1X3PyCljWeSGgVkTAdc0kdyzoI3zF1L43AkBm1/bbQESI/LKIID6lRguDHaZmA6j4ebORHB4pZ9D6v5ol3F07cGTsXoFuiBpiEN0DkTQhieuH1XRkvjQCRcJ6Nzh4MLOwHEVRqtaK49wUDNypp2UxNd7t2Dxb1ct96pKeAjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9PTuMVs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtGxht//; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9PTuMVs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtGxht//"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3tsg2751569
	for <imx@lists.linux.dev>; Wed, 8 Jul 2026 14:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vL4MQZJyYnOZgb+t9Slt97jlU8ZMhiBcIG4lPhLxhqk=; b=l9PTuMVsLQ/lb5E7
	FUy+YKYjhfuxGpV2yPYrT8cW990iscK3mTQzOIF8tGq/IN0UGqjuAyycToz5zcmp
	b5J5Ef65ekAr1pBRTSoIVmVaCAilH9sfGD3P2WGPIs887lWUsiNiEKklxBPgWTzc
	dEcSjBxCFMfjZgSkE9LOnrD5tnmd4F1z/y65PGB1QpI4IiFBzBbHqeO8mC3y1SyT
	VijYEMNHVsbO8/EMtiW5eEhFMLHRcUpvXEZ5J4PAOgvLKXcYGSY8gNO9U3ScfM0r
	JhbjreFoT0InUzIWIFkZZMGSEQ76sA922nbzv2otnraPB1TKtoPir2rkT9lzt6gG
	mmmXMA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csstyj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 08 Jul 2026 14:46:51 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-448d51840c4so402859fac.1
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783522010; x=1784126810; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vL4MQZJyYnOZgb+t9Slt97jlU8ZMhiBcIG4lPhLxhqk=;
        b=WtGxht//Zstu/JrxzW5sd9Mr3TVtTRaHZ0676iVOvSLurCcMmmuIW2qnuDPV04QevM
         dEMLNQyF0AgRKVsT5HL+kahzQtvVzjtf9PxpLJZGdIH5/p5uSm8btsz9ZH0q0kmTlMfN
         fBTjpkMTj47WZS1WxChAjOhHPcC1BuiWuZAc6GCqxDs7ddA32si8phJqADg2BFlWzHnB
         VZ/Xhy4GZNSwtPslWc3bKc6vRMBzCRfx1ZusMpcunPghj7vYFye+E57woUhp4UjuszfU
         R/cLHN+u6sjJ/jovMKHS7ci4u2Llp9c7JQGz6qkxtA9wix+QutgAEJAKK0ND5Ze1F5RI
         2Xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522010; x=1784126810;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vL4MQZJyYnOZgb+t9Slt97jlU8ZMhiBcIG4lPhLxhqk=;
        b=Ww/GNPrNKc8oaUBS+5LhkAwLeto9DrkxU/go9Ki/AX16FuEQ8IEBhS5KOauT5SpZye
         wbFrzyJUsoGsV6XHbQwcq1/CX2EaZSdIO90tcBOTLWMJTpY4DF8GzThPlCP5xSv4eISK
         NwsnUMf8s7NaNC8gXFQhnV5e6wSAZjrR9F29CiDNoOn98/HPqVueqVNnMx2GHsXfU20d
         R77wpgQaKyCYv35ohvpu9/D7A34hYka5lCZ689Dz3XbCqWxHvSAIv0oVv9Gxj5W0J2ln
         31Lqmihh6IYkq9F7N5pjybFl9wrnjTR6RVMULPceINnUyk3U2dBcQNHkDbotLfZG6G0P
         BEPA==
X-Forwarded-Encrypted: i=1; AHgh+RoVgkWCNvVSBIwztT+H30hTXBXwhDQlCPstNCQkxNXfQco7FRJ4kofbby75HIhZAZH4lTg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtz+5gzyfwxgKjHyS0CcmgIi1GaDPI1fHw3ow6IlXNtTaVPa2h
	cy9r9fYM8DmuajFgec2Sa2R5X2AJJ2dQfc84ZwpcmflfFf9cHQvuQMlqoH+26X0yVi4twakZMHX
	lKf3TfwI33KUTJ9eQsbRpYSbnLwMR7uKkswFAmusi9hUmmS4PagKApDM=
X-Gm-Gg: AfdE7ckpwBwgwUpEzR8pKj0xXHCqtsSSZFHVkZJhbY0LWiOV9kcqSHog473jmqcIvG0
	B5kbRsWL7+9e0ZQvSBkHhs8qQsZj4zS8x0qjabC5svG+hTPkK4dUq0YcYDMCg59dC3bRqnAG8y0
	g9D0Lqv8wxt5zIVeQIAkFxdRuibbp4dhi81itLUvwEh7eTetuFU6A+XKolmzkxsolEMYGDdJLFj
	l6afy5Y06yYwd+pwPYheucGzJ7S6j7NGxFBhmC/Z3oKFBE0veR4YiB6kOpl7pBcjinCVkA8iv2G
	y4JkmxDJi42Y9F03c1g5fuRuiITvAS6eBO46OIwhsOwYjVwX1yGqaIRKdFcsqxFFE/v63z8lyF4
	3X8rzoiBHiatlqWs=
X-Received: by 2002:a05:6871:2ecf:b0:447:a321:35d with SMTP id 586e51a60fabf-4516387345cmr1779014fac.10.1783522010293;
        Wed, 08 Jul 2026 07:46:50 -0700 (PDT)
X-Received: by 2002:a05:6871:2ecf:b0:447:a321:35d with SMTP id 586e51a60fabf-4516387345cmr1778984fac.10.1783522009770;
        Wed, 08 Jul 2026 07:46:49 -0700 (PDT)
Received: from localhost ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb13d619sm18125627fac.2.2026.07.08.07.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 22:46:30 +0800
Message-Id: <DJT9S3CQRB0P.982J925T9O4B@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/9] drm/pl111: replace struct drm_simple_display_pipe
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
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-5-b4e1ca053623@oss.qualcomm.com> <747ae980-9358-4e15-84e3-6e2f3e143423@suse.de>
In-Reply-To: <747ae980-9358-4e15-84e3-6e2f3e143423@suse.de>
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e62db cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bxtzNzRwT3Q_vXoiTiMA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NSBTYWx0ZWRfX7vbwHfdG27dH
 np2q0SBhMBnmXCHLBQJoSIZ1dD3LKza3dPtNIUN2FdBlObzQt9CUKl2FyAE+9t2RVRxemP6Ye6v
 N2xuLVEUo7t9toV2IfowFK4gqXD5YzNRi2ccMaAxorpKponi0EIOv84ejOOHm9MJ5fdqmN88ojt
 CUHbN1lXmv9rDXTV4YNIXOkSm1wlUcJI+RAXR1chswlcEqpEA5cZy4yf07b+xJpjLEuIu3stxrI
 g6zy2jadueYbiZfHHwaDqP2fH/TsI9Kgyilfs0zt/C/tjQk12CuI58MUW/VtB8o0Yk7C/k8+MGK
 WLTFFsell5leJnYOjg3gm2my8y1n1t+y6O2aVn8S858Plys81tOEKV4ACiynO31E2TB2ZFCIDiu
 howeRWT1FImnXCV/flZnrSW73DsfV3X5nEd3zLNwFrwa7r/26FDPjh0B9+VIKz4c9eLnhFOzB1e
 rGPE/0bLiag3iZF463g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NSBTYWx0ZWRfX6ptf+94wibBZ
 ySQRZR/Z0X7CSU8++Lpsa8f2VylXHd3qepy5iTgbmCYab3FvxGG5bzwkUgE8hKSkKpBhHGNHnri
 w/+6+lsjrCqUAc1CSKByq8nypUrzYLc=
X-Proofpoint-GUID: fVSFInfU6zUmIAg4nPRkdI21-ck2wZSX
X-Proofpoint-ORIG-GUID: fVSFInfU6zUmIAg4nPRkdI21-ck2wZSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080145

On Wed Jul 8, 2026 at 9:03 PM CST, Thomas Zimmermann wrote:
>
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> Replace PL111 simple display pipe with explicit plane, CRTC and encoder
>> objects.
>>
>> Keep existing hardware programming and vblank behavior, and install GEM
>> framebuffer prepare helper explicitly.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/pl111/pl111_display.c | 174 ++++++++++++++++++++++++++=
--------
>>   drivers/gpu/drm/pl111/pl111_drm.h     |   5 +-
>>   drivers/gpu/drm/pl111/pl111_drv.c     |   3 +-
>>   3 files changed, 136 insertions(+), 46 deletions(-)
>>

[ ... ]

>> -static int pl111_display_check(struct drm_simple_display_pipe *pipe,
>> -			       struct drm_plane_state *pstate,
>> -			       struct drm_crtc_state *cstate)
>> +static int pl111_plane_helper_atomic_check(struct drm_plane *plane,
>> +					   struct drm_atomic_commit *state)
>>   {
>> -	const struct drm_display_mode *mode =3D &cstate->mode;
>> -	struct drm_framebuffer *old_fb =3D pipe->plane.state->fb;
>> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(stat=
e, plane);
>> +	struct drm_crtc *crtc =3D pstate->crtc;
>> +	struct drm_crtc_state *cstate;
>> +	const struct drm_display_mode *mode;
>> +	struct drm_framebuffer *old_fb =3D plane->state->fb;
>>   	struct drm_framebuffer *fb =3D pstate->fb;
>> +	int ret;
>> +
>> +	if (!crtc)
>> +		return 0;
>> +
>> +	cstate =3D drm_atomic_get_new_crtc_state(state, crtc);
>> +	if (!cstate)
>> +		return 0;
>> +
>> +	ret =3D drm_atomic_helper_check_plane_state(pstate, cstate,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  false, false);
>
> This is another case of _check_plane_state() running conditionally.
>

Acknowledged

>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!pstate->visible)
>> +		return 0;
>> +
>> +	mode =3D &cstate->mode;
>>  =20
>>   	if (mode->hdisplay % 16)
>>   		return -EINVAL;
>> @@ -117,16 +140,14 @@ static int pl111_display_check(struct drm_simple_d=
isplay_pipe *pipe,
>>   	return 0;
>>   }

[ ... ]
