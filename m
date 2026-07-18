Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0FC3DCDA6
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784389355; cv=none; b=JqaC39WuLWYIMbRRaw9N1gbF+XSj60nl9OfSKFq7plB1fS/zMwcian9x/gcA5NuvdJp+Tq+xy8xIyfBvsytUOCTa+DJTFgF3w8BquOt/GjscrQlwvI5NklC0ZATtc9mNwSdM7ZRfYEN6cHWCyE3ekFQR18k1hjt/88KhKepXFxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784389355; c=relaxed/simple;
	bh=eAsLMecAnxHiwSrqw+SWBNcXmYoYosvxye5mdDucG+4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ut8b7EQ9yuWZ+rJ4vITy3GJelAa8E+8v7Ko1Wur8UDSVFWHYXn97ySlgiL9p8KYAlYL8dtCVD0MHZZmUCxBE9y0AiCnBjOcSSsn89GJd0RdmDC3+wjjswtyjli+fZHsODF19oi4gD4iVUPKfTyE3V2CzwUZLH8aBhJBN2Qpm3X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9F6S0Gn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDr18yTq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9F6S0Gn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDr18yTq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IDD9Lo385245
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 15:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3Tozc6XvAyXDRXhNm08ssVPc4HklhucZjeYpfFjPmA=; b=l9F6S0Gnb2vjgD6a
	NBQfReSJBOyCIXwIUgjQE9ha1CjdNnqVi17UErZCTYSlBRo/TxMbCbjqKp2d0Yy8
	2grbSegaeCpYWBsCtdZz1Mn3v8FEv1j5UcVICfCZoIiXa6CDvpkRuAbnTODcJZ/U
	B2BcXlqo9x1yKCfP3m63lMsLAwNF6umECQ3O2BYkakRH9Y3pltrWALui4/z2ZZDB
	Oohi70BkTEVI9LYX4Az4ZXFHWOAsSgFmcQVj/yBR+bc/KWRawPM7IARiYuzeczGl
	2Z7prJm/hdBFhaSSwCdQjPyC6p/fQJ948P1wqkX9Tl6bHTlDilZ5bfpKV/jZ9sV8
	GzU+Jw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhh12t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 15:42:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso5240996a12.3
        for <imx@lists.linux.dev>; Sat, 18 Jul 2026 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784389339; x=1784994139; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B3Tozc6XvAyXDRXhNm08ssVPc4HklhucZjeYpfFjPmA=;
        b=iDr18yTqdA5LSVemXSF/SyB7YyiecDJ2TsT61TOX23qIzPcsx1izkp8u+I7r4SHtX6
         K/f67yskcKhvC+xzxwCgBfEOvEuXY/MTrgDPX9BN5oe8BGR6l6wn40tgWeYs50Pchgok
         usPr6iCnk/DBa4uOeKEdtvVmBhyRn1HokSowuNA87byPBeuWTy+uydlAZP6P+3LMsu9P
         W91CcrnvcOrDt/YGVuLD1RfwhFnkbhwDV/eO0M+o6cByLlLzEleX+m8z+29WEaj1pK0V
         ElZJ0kZNWt2zYr4iCTUGgQhSqWoofH05N6oO1yxgrz/fKq1pAO4mTdBQxYMCoS02OumY
         7U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784389339; x=1784994139;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3Tozc6XvAyXDRXhNm08ssVPc4HklhucZjeYpfFjPmA=;
        b=GUWbwxR1K8QxDKmdHpf03ElwVM4AjiyJaZ5oFYvQjyh6qE6eG2kYk4XcST+38dTVJQ
         Nvv4ErkvoGlJ8/AjI5ULi/4EypXcsPOCDTuQwET83VT4E0TQeu1ufjXugCsKUVDWaOIJ
         LNkQxiP6VEj2CxEXoeSFwWRwDPaG97YIQAIBp1vT5eMRcXKKYGXcEu5MOBFgFA7kPJfl
         PU/kDaF3JrySlYed0iWobaqGlcBEPdzhLn1tjadu0M7a428TIYs6vYStayrmFsdTKtUu
         FjGOvgMh/yr2e0N5S5hK5FDj/BZkijKM7Riam9dA9Yea4ylaxjKNCRvYcp9D0Ryer8ox
         oljA==
X-Forwarded-Encrypted: i=1; AHgh+RrSdnmUaFvTLmik8cwy4jsBENMwg4rJiP2z/UgMvJ+ffIQDN5kGFIBKkY6Et54TNqC9syI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkuC1nr+2nIpvZhu6cDxErMYypTDmf1NX0V6NE0nD7PUl8NoKL
	zAyR6wniG9KoqqqUBMoIiSXF7dnX+CxxbCh3iIYLajAwRbw1ZmOZQ7DuH7DW75vV+yVdloEqtri
	ztxkS18a6oAgWF2e6S2BWdTQZTNth6ffQwpDvh7UxV3KUmJ3hiuQYleU=
X-Gm-Gg: AfdE7cm8giHqHkIKh88Emy8RdUg2JRsBZaQcnddDMCQSEYgJLsaoNdmbh4NmWT4E3Rw
	rmaiD/cmZOL6iy6XK0ulmB++JVrTLkE8shOqJITbTMntWP8mQLWqkngV3fG3jqlu6DDivDXFm2q
	ba7y3PDJm/61/7Y2wsDrKEAnV/fbfN9QbNGz+lCc4sA319SkrocqmlkoSep3lQnUvwldDjTbyKc
	51zxtODpJKWNDSgywi1X6xEKLf67gt/LRyx37y76EU8DRxdCqAtX2L+/Kf51j3cn4ESlmQqN88s
	IpFKwK9T/Ao2O2FEGUHfx/j/tKBEL+c6fFilmFYoOUJLrYcDJ0WuMm7XrPieio4VNAZplad0eE4
	9HiNyBw==
X-Received: by 2002:a05:6300:95:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c3ad9717d4mr7925883637.40.1784389339432;
        Sat, 18 Jul 2026 08:42:19 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c3ad9717d4mr7925851637.40.1784389338852;
        Sat, 18 Jul 2026 08:42:18 -0700 (PDT)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm22974922eec.5.2026.07.18.08.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 08:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Jul 2026 23:42:10 +0800
Message-Id: <DK1T85P7OAAY.RXCY4AX71VRX@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
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
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com> <20260716-drm-simple-kms-removal-v2-5-1133a8fc3785@oss.qualcomm.com> <26981ae1-4aef-4965-8600-f5e30a1b564a@suse.de>
In-Reply-To: <26981ae1-4aef-4965-8600-f5e30a1b564a@suse.de>
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5b9edc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZBS7nKAnUslcPLfxFb0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: WDCwq-NxCH2j9I9vU8uU2_K2G5x0goAJ
X-Proofpoint-ORIG-GUID: WDCwq-NxCH2j9I9vU8uU2_K2G5x0goAJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE2MyBTYWx0ZWRfX/T0EuOrB7t6i
 qDiu2+I7Tg4/JtPG44hxfdQ3YX2A1kDGrG8uRLH+VTT7PH486v7mg68XwGn2pkR+vvBJxXuamVv
 P+HRNQeQ/PME9xOBrfpr7JShQE7htoKL4PJboOUpwckhJ59KuVHkVRWzxKNyBWg5a5nUsXCPcgQ
 jjPBjofw5CYbEdFRpJU1qdEcfI6wUBhJd9o/2dAB/EJ0IIov0/QOzmhoz2hKP4Ul1NjQISrwANE
 cQ4v5oNaMgu4lfWULwE6ogiuzQ0iEhOwQNvvyPY4/O6Dxd0b7a2aWyZGA8NCh1fNvChCaJ7nLQ/
 3UNbVJb4+zuKfuRLKOHdC3uwAiAORasp9vzJR4MKrgNtnEUa7Ub8eMNRAVjNFXHJ9ObT8HgGsTp
 ScuKD+qQU8JEzSbEon5kHumAzsbKQgj02pwEVWp64xtLUBlOc5Ze9qczNa9SXwLeDbI09dNkvjX
 B8BA3kq87OOU8hRhEEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE2MyBTYWx0ZWRfX9Wh0uHpRvoIZ
 t6HnUPqbXlvGSgBwzlcb91+cfh7gxxuVN8noDHMHFxgoGSCeHPNQEWBe5lnGFGXzvwJHiFSQr8k
 2K6fL4d2U+cQQvlUzC1mMs8cucg9uW8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180163

On Fri Jul 17, 2026 at 3:18 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 16.07.26 um 11:01 schrieb Ze Huang:
>> Convert gm12u320 to direct primary plane, CRTC and encoder setup.
>>
>> Keep shadow-plane helper state, framebuffer access helpers and
>> no-scaling plane-state check from simple-KMS path.
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/tiny/gm12u320.c | 132 ++++++++++++++++++++++++++++++++=
--------
>>   1 file changed, 107 insertions(+), 25 deletions(-)
>>
> [...]
>>  =20
>> -static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
>> -				 struct drm_crtc_state *crtc_state,
>> -				 struct drm_plane_state *plane_state)
>> +static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					       struct drm_atomic_commit *commit)
>>   {
>>   	struct drm_rect rect =3D { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT=
 };
>> -	struct gm12u320_device *gm12u320 =3D to_gm12u320(pipe->crtc.dev);
>> +	struct gm12u320_device *gm12u320 =3D to_gm12u320(crtc->dev);
>> +	struct drm_plane_state *plane_state =3D gm12u320->plane.state;
>
> Did you see the reply from the Sashiko bot?
>
> What happens is that user space can apply multiple atomic commits in a=20
> row, but they are applied to hardware asynchronously. So if you take the=
=20
> plane state here directly from the plane, it could have been replaced by=
=20
> a later atomic commit already.=C2=A0 Rather get the correct plane state w=
ith=20
> the helper drm_atomic_get_new_plane_state().
>

I think I misunderstood this point. I had assumed that
drm_atomic_get_*_state() was only needed for the state object directly
matching the helper callback, for example crtc_state in
*_crtc_helper_atomic_enable() and plane_state in
*_plane_helper_atomic_update(), while other state could be accessed via
the device-private structure.

From your explanation, I see that this is wrong. In the atomic commit
path, any state associated with the current commit should be obtained
through drm_atomic_get_*_state(), because the object=E2=80=99s ->state may
already refer to a later commit.

> I did not look at all of the series' patches for this problem, but the ru=
le
> applies to all of the mode-setting code.
>
> Best regards
> Thomas

This affects other patches in the series as well, and some drivers may
need additional fixes in internal helpers too, e.g. arc_pgu_set_pxl_fmt()
in arcpgu.c [1].

I will audit the full series and fix such cases in the next version.

Best regards
Ze
