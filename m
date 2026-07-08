Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FF53839A8
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523877; cv=none; b=FVxCVJJe2O2fNuwjaXuacf29gNJID2kEzm8qJVlBBNT96fcJuFGcC+lUuotm+je51R3gJGbixMJVymWPh0cNAeKLEuaCLAPl4pnZ0GxPC9wK/sxfiJnV7Xvgf39Xb6eje113sKumjJ0vUVoJkcZHL80gr8D0yiYDtVvFjUqZodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523877; c=relaxed/simple;
	bh=PWEB2lF8cr5qMedCt78Z00Z9NLu78thWleeb4ALOpV8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WjDuPp3rJtfibzIalyhx7QH0IJ8eeJ2ndXXuhUFCarnfPHklQ1UBTKWqbNKZwZgHBjmsnQFTGjFQH5gclZNUP9b9kkYgsdK33mSekGq8SVy0XtDwn3RCNrSW99SxLG2s5lclboxgitHn7aEk/nCV38h23yCGd0NORLiAlADkq+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyohbZrh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULbDzCXP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyohbZrh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULbDzCXP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3S6O2579673
	for <imx@lists.linux.dev>; Wed, 8 Jul 2026 15:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+HbO3q8cH7T+zYjIIdCRY6caTKPU+Ebh5i0go2meuU=; b=jyohbZrhJnWKjS2S
	jgxZv8TF6w/+aD1tw347JwBuBawqRoSyHQt4KBTGdAd6Ctw9bWxtSGBMiP5FwhRv
	+G3a6E4nMmpi0JOmkWKmYO6Xh0V+QhK0D98Z4rs0uVGwTxN7krtdmSxCJf9GIXeS
	3T3OWo/8rfGd7IGSRhycRPhmvG0MnEuc6zatXrBmgOoFe14WkfbAF/5SZuyZKO1/
	G9TFnm8eoYpIfo6ytwjjOCH5y31VqcH+irN8F7N0cUNI+0b3P80xsZZJpGauXKXI
	RbU1ymK68OZ4X8TbQx9dOYHYi0VPKKvlB7vX1tTdIL38OXQ2m4O50K8wR746yurM
	L7jRiQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gbdrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 08 Jul 2026 15:17:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38101e6fc6cso1488278a91.0
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523874; x=1784128674; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B+HbO3q8cH7T+zYjIIdCRY6caTKPU+Ebh5i0go2meuU=;
        b=ULbDzCXPs9ZKBuHN2OD/mBWriow9zsehUiByPTwCr1fy244VlmZVpfnYKRkvyEhV36
         LuBIFwIxhGZlOkmD27fwDx2hsNfvAMe98npMXVUsMVsC32gG3WKEJo2C1vQFPg619s2d
         vImb+hTlgYdfe0FyrBcPCCv4TdgOTgvbF2MiMuW7RasE+ZynFyUsXfFtACqQv3pYvqnO
         HlSDjP9DEW7qxAa2rZcu9uLYPNPoS2pA0MWIophmfuzQUf89EM4LhuUj3GriYU62Cbcv
         C5QfqLSNLRybwvFDoNywHgffqUo+/10Z57llXIAHu0gYvUmPbjpqkbtmqhOLogH/0E7D
         E6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523874; x=1784128674;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+HbO3q8cH7T+zYjIIdCRY6caTKPU+Ebh5i0go2meuU=;
        b=q9+siuv8edrGB7PhdzOUcwHMYtLQqnFisec+KyMS7RNaZMGUbpZcR5TPnmQthkHE1G
         ZNFTZnEjs3lbNV0b54bvX3/NG3+6MPirmuypkWTEVayS0cFuweGnW5HztqhY50u/WYgg
         EApG64WXbuQdVsDnC3VqmVtpDoVckC5G6XoHiCWZT9XZ3WOhfHeosyKGwERPTXmkxcV5
         Phq53n3Y7Qj5kT7S998fXgnCnGvufmATH6gmcwavlVQeUljxiimdvnwTJW2S2+4MTucz
         Sb2HoXGH43/XBE/oNzJh2eWqgbFKTtiZJMdmvV6t1Wp2U8S1n5cMRDLD9UrPTXKnkptH
         lOYg==
X-Forwarded-Encrypted: i=1; AHgh+RqjmGou4P6lH11nhbOzY3iAyvJZdv8+hERNeaa4uRZ9hu9H1NLSLH7HVTCt0wzCZuFFDk0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyD6+6BF9yOThSAIjlg2WcbTi83EPWexojQw3qsBVazejwY15ze
	3glwIpooQ54t8N9DCjs3QEMkEvwBkUzTsLBtV0a+6QIWtyaZ7s+gfTBfN1wwfHpFBJNXHoIto96
	Yrt0MP38iWT/z9UuFxKXp2u1FW3Z02YPx9l3dARH241e0C5PVa/wyOjA=
X-Gm-Gg: AfdE7cmx7gwCMypzkIz2+x8j2ZUNSDdRqNI4vYixM2Gtx5edirmroNjJW8xZUx5eW1c
	UOfQGgslkVu/0mXM4omWQotuPh+IHMxuXF5NxIQWBQ1boG6MoV6EPzBAQQWeETwrhuEq1be35kT
	rVbAcdnXBfazEMQFS4um6aJ/787dlbcbwS/w5cKC6BY5sWKBCMOJPhePeqNJ21KaKxRJcNmMycr
	wMr4FffiZlVHnRr4I6QjjOJE/EGMu7xi72NobKewpx3Wo0K9nSvCVo/IX3clQaEUD8EtD50ixw8
	1HER+yz6lT4gUau7xp3ZLHpF6rat45E3AvbRNkVuwBwnoI9If1qNm28kk/pPdlnBaK0w+fS35X4
	kogjxOrBVTF1u2W4=
X-Received: by 2002:a17:90b:2fc6:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38940631b27mr3071843a91.14.1783523873584;
        Wed, 08 Jul 2026 08:17:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2fc6:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38940631b27mr3071804a91.14.1783523873102;
        Wed, 08 Jul 2026 08:17:53 -0700 (PDT)
Received: from localhost ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm3005125a91.6.2026.07.08.08.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 23:17:37 +0800
Message-Id: <DJTAFX7D6MMM.N6Y4NZOI1GF8@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <Frank.Li@kernel.org>,
        <imx@lists.linux.dev>
Subject: Re: [PATCH 8/9] drm/tve200: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-8-b4e1ca053623@oss.qualcomm.com> <20260704184615.466FA1F000E9@smtp.kernel.org>
In-Reply-To: <20260704184615.466FA1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MSBTYWx0ZWRfX1EU9wrczf3jh
 MyslR8sFqU8km4bFW4XdE02ZWP5fLdEA8rz7+Fm0dgo2uz6QcVckC09itObf6WY59O684xtkCn/
 HL/Ay8gGngC3N11pfRkv4njI0qsiniU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MSBTYWx0ZWRfX/fxXtAkYaSi4
 VfqIpZavit/4je/yAawW6FwDmwkesLG7iNd2Jsr1e3fZG7qayamolJ9m9VuRId9c/RG9lE0kg83
 hluYxcvw7vmy0yMQUF3WK4unN/mZEOtIDjX+axa1ePhrUdstkeuZFs8GYYilVunXJedrHAuUMMj
 cXARQjOtpqMnsKU5eMQEiA17Wz5NTNKPpWSz5TgvW8e/WYJyqVk5UF+FT0SuNv3W6udD+yEJoxa
 gNkoC8npvoeA9mdStClKagAMwbYeePCol8FOEynN3vJZmU2dJrXU9glXlB3lysLZx/bKubwA4/f
 l/UIMzt4fMbVXjgo0UkhuEwTQfKFKV/6RwnNbeFACurIAJCJAlA6EF8NroquyEsSaV483lUkOxM
 VDZwbZXsnbpGfwrEgtu/AC3A66u1fSH66nhaW01dp3jByMmBw5R42fKEwhqMhmjin0PLNdAD+ve
 0r8C2Ert1pPSWgosryg==
X-Proofpoint-ORIG-GUID: toct5qIDh5NZGqmkdbj4bIf29VdwurfG
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e6a22 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=egV5sixoXBkJpWEyV9UA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: toct5qIDh5NZGqmkdbj4bIf29VdwurfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080151

On Sun Jul 5, 2026 at 2:46 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Vblank event is leaked on CRTC disable and may be delivered prem=
aturely on CRTC enable.
> - [Medium] Calling `drm_connector_attach_encoder()` on an uninitialized c=
onnector.
>
> Pre-existing issues:
> - [High] Calling `usleep_range()` from a CRTC `atomic_enable` callback.
> - [High] Direct, lockless access to global state pointers `plane->state` =
and `crtc->state` in atomic commit callbacks.
> --
>
> Note: The format of this review has been altered to a free-form summary d=
ue
> to mailing list quoting restrictions.
>
> Commit: 2c5e6508a64461d7a207075c4328681142076aef
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
> Subject: drm/tve200: replace struct drm_simple_display_pipe with regular =
atomic helpers
> Summary: This commit converts the TVE200 driver to use explicit plane, CR=
TC,
> and encoder objects instead of the simple display pipe helpers, while kee=
ping
> generic plane-state validation and GEM framebuffer preparation.
>
> [Severity: High]
> In drivers/gpu/drm/tve200/tve200_display.c,
> tve200_plane_helper_atomic_update() checks if the CRTC is NULL and return=
s
> early. Does this cause the pending vblank event to be leaked during a CRT=
C
> disable, since the plane is also disabled (making crtc NULL) and the even=
t
> is never consumed?

Will fix it

>
> Additionally, since commit_planes() executes before commit_modeset_enable=
s(),
> is the event processed and delivered prematurely on CRTC enable? Could th=
e
> event consumption be moved to CRTC callbacks like atomic_enable,
> atomic_disable, or atomic_flush instead of handling it in the plane callb=
ack?
>

Yes, will move them to atomic_flush

> [Severity: Medium]
> In drivers/gpu/drm/tve200/tve200_drv.c, tve200_modeset_init() gets the
> connector using drm_panel_bridge_connector() and immediately passes it to
> drm_connector_attach_encoder(). Since drm_bridge_attach() has not run yet=
,
> is this modifying an uninitialized DRM object structure?
>
> Would it be better to rely on panel_bridge_attach(), which already
> automatically handles attaching the connector to the encoder, making this
> manual call redundant?

Will move drm_bridge_attach() before drm_panel_bridge_connector() and drop
drm_connector_attach_encoder() like:

    priv->panel =3D panel;
    priv->bridge =3D bridge;

    ret =3D drm_bridge_attach(&priv->encoder, bridge, NULL, 0);
    if (ret) {
    dev_err(dev->dev, "failed to attach bridge\n");
    goto out_bridge;
    }

    priv->connector =3D drm_panel_bridge_connector(bridge);
    if (!priv->connector) {
    ret =3D -ENODEV;
    goto out_bridge;
    }

>
> [Severity: High]
> This isn't a bug introduced by this patch, but in
> drivers/gpu/drm/tve200/tve200_display.c, tve200_crtc_helper_atomic_enable=
()
> contains a hardware polling loop that calls usleep_range(30000, 50000).
> Since CRTC atomic enable callbacks run in atomic context during non-block=
ing
> commits where sleeping is strictly forbidden, can this cause kernel warni=
ngs
> or deadlocks? Should this be replaced with non-sleeping delay functions l=
ike
> udelay or ndelay?
>
> [Severity: High]
> This is a pre-existing issue, but it appears to be expanded here. In
> drivers/gpu/drm/tve200/tve200_display.c, tve200_plane_helper_atomic_updat=
e()
> and tve200_crtc_helper_atomic_enable() directly access the global state
> pointers plane->state and priv->plane.state.
>
> In non-blocking commits, these global pointers can be swapped if userspac=
e
> submits a concurrent commit. Does this create a TOCTOU race where a
> concurrent commit setting the framebuffer to NULL could lead to a NULL
> pointer dereference when accessing fb->format->format? Should this code u=
se
> the proper drm_atomic_get_new_plane_state() (or equivalent) accessors on =
the
> passed state object instead?

