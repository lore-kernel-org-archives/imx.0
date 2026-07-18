Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42325B0A8
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 17:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394942; cv=none; b=ZEult+8VCuBv8GJFUkPVSiPSRUdzjwsBOAgKAo7STncOo8FzgBnDUKyl0DMAXn1jsye1d/ZNE4Ja4wjynpJz8EnXSGf7Qt5BZZt4e5lpbnGA0aHiqwIgKFf6G0dDHiA7NPQzfDa68KRzEnwcqK+dwzknHtGJs3I9qXP2sKzlZWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394942; c=relaxed/simple;
	bh=U/3ibvfFn9YH0Wjdkq0IER6asdsvGbrQN+9w6YzcXEg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nIvh6CyaJrj9/Or4zpvm0y0Gtm2gsZBXpyX3JmNWh+zvfIHa12FlDxmqkbNnWUTTRzJdJZIiwDzVLSN1Go7FNWYYaqtsZl4CiiOKQZxiHjoEFcM+QHumh+X53376RN2tI8QW4lpIm/mNoDESP1XbiC4939jNE8giAKDmWz9Lan0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtPQwwYd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPlr2Ufb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtPQwwYd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPlr2Ufb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IGPBU31098879
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 17:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S02lmnDkxR99M4VaqTHSbP6f3vLxjenlZmJ2G9hkEFs=; b=gtPQwwYdfxQMiJ5o
	uCg+4G4yykaWgo7djVy/y8MHfV9DDoaN0VZv15VNzXhZyyA/B43GiCAQr4REySaz
	qKQMUIPOEuYxb6outlxKcBdrJY4hlyYVTpyJV0YwSkPLSSufuhN8SBokVu9tVySz
	OXTnLBS0WaKK+MqIHCCP4i1BXhPxgeyj63YKysHiwT6LWA/mlMhnr0lqMHDT7pN6
	15DNlVzkVlg5U3R+FvPi++IlJrSRK1h0hsUhobSGLZWxBVhIVbR4+Ckez8Zm23fw
	0kU9437Vjq9ghC0gFzNDDvulhjGMs6NStMNd/P3VsF3kIaVCKIlpyPuL4toXIPUB
	Sbg1cg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnh6b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 17:15:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso10777977a91.3
        for <imx@lists.linux.dev>; Sat, 18 Jul 2026 10:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784394938; x=1784999738; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S02lmnDkxR99M4VaqTHSbP6f3vLxjenlZmJ2G9hkEFs=;
        b=FPlr2UfbAm3Ee9ysOu6GTGue0OXKLFP31ljn1EfA2Y+QyEQZ2KD7hO/2iLRxBub1d/
         i5xYpKDLJFYy2jmFjP7+fx8d9gP9/pQzjyr72Uils1cA+MQL05mGpAoSNduZO2QIPoEp
         LrmoZ4LenF2IU4rYp1wuDwCWpdK5N24XJUQ259cFVBrTvX0U8vD4VTfaZOgobhrX3Nbk
         gznpcOwA8rDpH4o4lhmwQEaCTzqgmz13bJ5sBO2BP9RFQJf026lDNgrVynTVy6iLzNKH
         RSjNaHygJepPvLNpAkrxG3dRUjcX66qNpuWP4jJKfkuqXhtq8pxutbjZLSWDAzfS8W29
         DD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784394938; x=1784999738;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S02lmnDkxR99M4VaqTHSbP6f3vLxjenlZmJ2G9hkEFs=;
        b=Ud0p9d4ZbTDrh8DkUQJI8NsV7hUq6UvHaW+Pmn5RutTx3Dfhd7iHuISbEkcfsl4pGp
         /sW1RddSIoTU3cF0XTEztmfFEDtUm2UfRRwozBSN3tFt35YPUI27oYL4rBj1mNjN3DVk
         LVmsOOGOfT841zqLgB4hY+SDiKDhTZeDi0rF3asdH+1YIjUNywy6jLqXJ9jbNI7lbui1
         2XXkDFA+g5d+Jeb4UPdgg7pxfFepIoZLb5J16O7QdlUAsFdzb/brLC6+Tg8tdm+GX02R
         Jo36BZWL4gQs9QIB81NyvkoJcmPkq/2BENrRBMNUwPNBqIg5thWJFP6KzMRreNERqdwo
         u5Jg==
X-Forwarded-Encrypted: i=1; AHgh+RpSnEtazWkjdcbp33gW9ONBAzGIEcMd562ZVS57/PGFjKwdZwElSffF5xoaYqvD08c+Usw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfMHpQDZ8pgrCe0vTrl7TOL9vngtSI1Dh3Ahinvzxmy0KQunFR
	NMlCIXCR9+m2cX07YmnUkwPXMxo+1BlR4MVWI1SydNKGBbFWkiYqE9TJHTDYTQ/w6oKh6HWDLxQ
	voSE2eFoT+dEUQaBuT5V80sCt7pYf9dAN0+8K2Gj/wBl32e1z/evOtL8=
X-Gm-Gg: AfdE7cnwlAF2Z7vbRdBJaA89F7mV5Q0ouZ1Lniu68dhVT9645k6iPlzH9oOXOKNqzt9
	G5VnYJ21Mozfk/PZSdlJmN2yRKrpP7tO7/W+xBwcBvCJNYio4juGvn1VhyVePP0AVax5xTBx+CV
	9asfd+eqIyLfqYyAz5rKc2/Bovmx+3RZVMeUwKECKq/8FLbM3fm+7cyFkK0MrCADH5thEpdJIHS
	8WLxEbc8DaiSjHG0bjESUDsEjsdompEM4DJOduc3GKa2MEKSUUW4yz86VG7jPSAxjqE89cY3BGc
	ETSFnt8gElYPEg9jYRmQgUiKrnrXQQjWee98GP/0ZVGcTdVjfbdWvFCqjBrgzGLrC5Mhf2KfIwO
	GOifE/g==
X-Received: by 2002:a17:90b:6cc:b0:387:e0bb:57f4 with SMTP id 98e67ed59e1d1-38e4b5792a6mr8316261a91.37.1784394938090;
        Sat, 18 Jul 2026 10:15:38 -0700 (PDT)
X-Received: by 2002:a17:90b:6cc:b0:387:e0bb:57f4 with SMTP id 98e67ed59e1d1-38e4b5792a6mr8316231a91.37.1784394937552;
        Sat, 18 Jul 2026 10:15:37 -0700 (PDT)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm17263853eec.11.2026.07.18.10.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 10:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 01:15:32 +0800
Message-Id: <DK1V7NJRAMW0.2LI6ANJZPVX0U@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <Frank.Li@kernel.org>,
        <imx@lists.linux.dev>
Subject: Re: [PATCH v2 1/8] drm/arcpgu: replace struct
 drm_simple_display_pipe with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com> <20260716-drm-simple-kms-removal-v2-1-1133a8fc3785@oss.qualcomm.com> <20260716091533.1C6691F000E9@smtp.kernel.org>
In-Reply-To: <20260716091533.1C6691F000E9@smtp.kernel.org>
X-Proofpoint-GUID: c7yFonfXPQ5G2LO6yfCA_RYKL-_D5pbI
X-Proofpoint-ORIG-GUID: c7yFonfXPQ5G2LO6yfCA_RYKL-_D5pbI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE4MCBTYWx0ZWRfX1HfJ+J8tvqm9
 Z9e+0VF40MlJXdMCKqrpYaldxSJS6bDYbo+YnBlFEQTKc6b91pKU8TBvZfuOKvrUAGuCpGCJCJv
 menhTCLyiQbqo/AhhK6kzNpBFBw/lghRIDaunnQ9VkcTtx60/vTderhWNinG8WbfBZImW0YUYxk
 8DpGUAwn0WZIINSM3r2Kfcg++A1bs6mqQhYe3AweDqs6JMY6anISo//O2haCBi+I6IqVw2bdaNP
 IXEA6fDwuc6LTEfTP6DV8CyeIJ7GKsLVDRA8yjCdGhQthH9ajBLOJrKfd76BeNuIhkVKI+OPqk2
 UNx3l/TSMccoksQ+6zDw+3w8oZo3JCbD1BgAogOCljJGrNpmcFLXhAyrxu4Lj2GfC5f65hocSMg
 94JoHfHvBC4EyoWiEFpropS/PWyZaoBbFjHyfJFw1chZBG3NDgDOHR3PuzLSnQlXTkEdCawk9zb
 KYxqh7iiMbKRjFPMd6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE4MCBTYWx0ZWRfXysN827EB6HkU
 3Yzn8ro4nRJnm7qgjDC2vxzQ6w+ItCCy96EySu3YEl9vRR1U10PlQCsuTfdxsiQRn74Sk0F+PGL
 1P33AL6F3f+XQ6+V3H2BFFOYEWKZzfA=
X-Authority-Analysis: v=2.4 cv=YsQ/gYYX c=1 sm=1 tr=0 ts=6a5bb4bb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3AJc28u4kSigJocD1w8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180180

On Thu Jul 16, 2026 at 5:15 PM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Use-After-Free in debugfs when reading CRTC state without a lock
> - [High] Unchecked `encoder_node` passed to `of_drm_find_and_get_bridge()=
`
> - [Medium] Dynamic pixel format changes will not be programmed into the h=
ardware
> --
>
> --- Patch [1]: [PATCH v2 1/8] drm/arcpgu: replace struct drm_simple_displ=
ay_pipe with regular atomic helpers ---
> commit 053328e64a955beacd393bc82052adf8a231ec8a
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/arcpgu: replace struct drm_simple_display_pipe with regular atomic he=
lpers
>    =20
> This replaces the deprecated simple-KMS display pipe interface with regul=
ar
> atomic helpers. It instantiates the plane, CRTC, and encoder directly.
>
>> diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu=
.c
>> index c93d61ac0bb75..e0cce4798f3ed 100644
>> --- a/drivers/gpu/drm/tiny/arcpgu.c
>> +++ b/drivers/gpu/drm/tiny/arcpgu.c
>> [ ... ]
>> @@ -218,35 +223,95 @@ static void arc_pgu_disable(struct drm_simple_disp=
lay_pipe *pipe)
>> [ ... ]
>> +static int arcpgu_plane_helper_atomic_check(struct drm_plane *plane,
>> +					    struct drm_atomic_commit *commit)
>> +{
>> +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state=
(commit, plane);
>> +	struct drm_crtc *crtc =3D plane_state->crtc;
>> +	struct drm_crtc_state *crtc_state =3D NULL;
>> +
>> +	if (crtc)
>> +		crtc_state =3D drm_atomic_get_new_crtc_state(commit, crtc);
>> +
>> +	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>> +						   DRM_PLANE_NO_SCALING,
>> +						   DRM_PLANE_NO_SCALING,
>> +						   false, false);
>> +}
>
> [Severity: Medium]
> Will dynamic pixel format changes be programmed into the hardware with th=
is
> check?
>
> When a DRM client issues an atomic commit that only changes the framebuff=
er's
> pixel format without changing the display mode, this function delegates t=
o
> drm_atomic_helper_check_plane_state() but doesn't check if fb->format
> changed.
>
> Because crtc_state->mode_changed isn't set to true on format changes, and
> the hardware's pixel format register is only updated in arc_pgu_mode_set(=
)
> during atomic_enable(), does this mean the hardware might continue using =
the
> old format and cause display corruption? The previous simple-kms helper
> handled this by forcing a modeset when the format changed.

This does not appear to be introduced by this conversion. I'd like to
keep the old behavior.

>
>> [ ... ]
>> @@ -285,6 +353,30 @@ static int arcpgu_load(struct arcpgu_drm_private *a=
rcpgu)
>> [ ... ]
>>  	/*
>>  	 * There is only one output port inside each device. It is linked with
>>  	 * encoder endpoint.
>> @@ -293,29 +385,24 @@ static int arcpgu_load(struct arcpgu_drm_private *=
arcpgu)
>>  	if (endpoint_node) {
>>  		encoder_node =3D of_graph_get_remote_port_parent(endpoint_node);
>>  		of_node_put(endpoint_node);
>> -	} else {
>> -		connector =3D &arcpgu->sim_conn;
>> -		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulati=
on platform\n");
>> -		ret =3D arcpgu_drm_sim_init(drm, connector);
>> -		if (ret < 0)
>> -			return ret;
>> -	}
>> =20
>> -	ret =3D drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe=
_funcs,
>> -					   arc_pgu_supported_formats,
>> -					   ARRAY_SIZE(arc_pgu_supported_formats),
>> -					   NULL, connector);
>> -	if (ret)
>> -		return ret;
>> -
>> -	if (encoder_node) {
>>  		/* Locate drm bridge from the hdmi encoder DT node */
>>  		struct drm_bridge *bridge __free(drm_bridge_put) =3D
>>  			of_drm_find_and_get_bridge(encoder_node);
>
> [Severity: High]
> Could this lead to attaching an unrelated bridge or indefinitely deferrin=
g
> the probe?
>
> In arcpgu_load(), if endpoint_node has no remote parent, encoder_node wil=
l
> be NULL. In the previous code, the bridge lookup was guarded by an explic=
it
> if (encoder_node) check. Now, of_drm_find_and_get_bridge(NULL) is called
> unconditionally.

Yes, it is possible

>
> If a NULL node is passed, the bridge lookup iterates through registered
> bridges and might return the first bridge with a NULL of_node, incorrectl=
y
> attaching it. If none are found, it fails with -EPROBE_DEFER, which might
> leave the system without a working display. Should this retain the
> encoder_node check?
>

I'll check the encoder_node after of parent get

    encoder_node =3D of_graph_get_remote_port_parent(endpoint_node);
+   if (!encoder_node)
+       return -ENODEV;
    of_node_put(endpoint_node);


>>  		if (!bridge)
>>  			return -EPROBE_DEFER;
>
>> [ ... ]
>> @@ -342,7 +429,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, =
void *arg)
>>  	struct drm_device *drm =3D node->minor->dev;
>>  	struct arcpgu_drm_private *arcpgu =3D dev_to_arcpgu(drm);
>>  	unsigned long clkrate =3D clk_get_rate(arcpgu->clk);
>> -	unsigned long mode_clock =3D arcpgu->pipe.crtc.mode.crtc_clock * 1000;
>> +	unsigned long mode_clock =3D arcpgu->crtc.state->mode.crtc_clock * 100=
0;
>
> [Severity: High]
> Does this introduce a use-after-free risk when reading the CRTC state?
>    =20
> In arcpgu_show_pxlclock(), the new code accesses arcpgu->crtc.state witho=
ut
> holding the crtc->mutex lock.
>
> If a user reads the pxlclock debugfs file concurrently with a display mod=
e
> setting operation completing, drm_atomic_helper_swap_state() might swap o=
ut
> the old CRTC state and free it asynchronously. Dereferencing this dynamic=
ally
> allocated state pointer without synchronization could lead to a kernel oo=
ps.
>
> The previous simple-KMS code avoided this by reading pipe.crtc.mode, whic=
h
> is embedded in the CRTC struct itself and updated safely for legacy acces=
s.
>

I'll lock it first

    ret =3D drm_modeset_lock_single_interruptible(&arcpgu->crtc.mutex);
    if (ret)
        return ret;
    mode_clock =3D arcpgu->crtc.state->mode.crtc_clock * 1000;
    drm_modeset_unlock(&arcpgu->crtc.mutex);


>>  	seq_printf(m, "hw  : %lu\n", clkrate);
>>  	seq_printf(m, "mode: %lu\n", mode_clock);

