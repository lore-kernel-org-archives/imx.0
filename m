Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C31A2D9780
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744505; cv=none; b=BS0O1Rd6j2S7XRpYbEN7dmV5I2DVT9RovXPg7D7wyW15Oj7uxT5p9X6ljiP18dpYS2HFbb70OY8CCTmqQmG6GXimfqxNEkhH6v5YjZLh9ccofGSGqDff+z1Amql2eNFKXyKFN4tXkURnEvydk6c5iDtsS5CkQWhEF9vGEqv5Wlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744505; c=relaxed/simple;
	bh=8pH0+8dNkwSaqoyWPEEKbvS/EjWssTuyZ3oG+ok9uR8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rTmV5Bq3ngYotivxqe5AFnqpEZNmrZPn69JLnwua+LvF0SGsiVNq2nUiN1XsHUBZdCOjmNcGf6M98HFV/6xLyTO1zJMTM4KWxEoSAUamB9opFaUgx/Oez+Hni68mKGZnyECh9D6Xeh4olwq2u41USOHdRjgFg4qrhchZF8laFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTqEyIFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pv4L4kmh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTqEyIFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pv4L4kmh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOowR1354156
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 15:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=; b=DTqEyIFwhXRJLNu9
	IeYZsHOrKbXijwmdqq+ZxiPvyfet/fCUB0waQ1XFZArweh0RjYYUmoxq7nl/JEN1
	Uy5NmhOd1qusEnfpTpqRg8agzbrAvS7pZSvHR/ylobOfF2XYjSV1/YXA1xxh8us/
	0WSRuT7kO6kdLHoxx0I2EyTlfaVrjEBLOT5OPcRGUnOIkfZCR1Q/Gs7QFtUyIHF/
	pYQtElGkrqyBwxzixxweaHTo1wj2rjXG06RAMMI+IEvfVga5JiRCPKr59GAZzH1x
	JMF+HWQl287jMZVbazg42u8QTxVQ95BPg7psGMdFhgyAH+3PsFf8v+fRdN7V6mJV
	VeUpRg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv9c5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 15:15:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d959904658so15126445ad.2
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789744502; x=1790349302; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=;
        b=Pv4L4kmhSa2WSncR4SHhcP2Fe3qHUVsBEfIZtYjaJIPo/Y63TSxjMSL47VQ5pzXIGl
         jtzYFKbuTDuS+i8foFeiftKVc3n35y1iUx1AqLwkqSaC5OeZ108L2oQZ8tpKm06umQfx
         5I1luMUEvt7bl9axsjcOgR/1QXrrl5FB4Oi7Y0OKLim+nYfkVsFN4yiKIF2VhoLuUZ+4
         VTA0ao4BlpDYmSxb3MkCVsbv5hlWaHsY0GI7apdBzDumZCmoqQJgvTIUcfZmqZ6pQQ6T
         yK5GI90jjekWopN4w6oVjr1QJu5Xc30tId3NP1Wk80W+m8ZZtv60702MSNaWjfcHpbKX
         FkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744502; x=1790349302;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=;
        b=QkEOhIXEH/csPJOT2DrHgwkSV7s+GjX+aSKf2gHik5uBlrUT+IT1yixhdJEdv7FLg2
         in163tQZUgkWAgWw73U/2qlIFb6qT6NSFPqPwJUbb3F4aMLsvOHNFt4nF3+VxYwaKWPu
         szlulcB5Xvd+BwkcHtNMZ91sQabReSbUSMMbfZ8lmGu39vU8Fk1t5l63OBLs8epPNTE5
         ESlSN99EZsI3kd15s3/Yx8nW+9v93InDCYGcwRqJfhjxRy+5WpYiMrJljEVWZBAshMGD
         aDrPe0V/1jXvmKPYWgZEM7cWEzAYt8pmksCheuwhOsx4PlO/2rA+r1E8vLMDNnzKiLGU
         ERZA==
X-Forwarded-Encrypted: i=1; AKwUvBwf3LdUSqEvS/BSvnjHbtIYl6FTrCj7wlxmAbHZO2J1s9xFtx+vvYORbFvUDmcC0DOFHfY=@lists.linux.dev
X-Gm-Message-State: AFuF++kJ13m9aciji8ExFj3d3BQ16s/6SpMkScES5Vs5UGiZDARBuJ7u
	OcfFW2OMbXF7oCIBNJfi6CjrARV9RbtfONKb/88Bc0y3flv/alGm/+sf9NrDl6FqHTRfvMALJvS
	VzIkGNN1ViD10y4K3g6+O1XHKAR34jzIoO/TCYgLp9SUY6Z4OaqPE7sc=
X-Gm-Gg: AYBFou3euQ0tljRslUTBdvlV6Ue7fBYtbXnOoZ0L4twLwb9vB/KvWJuKT9DC9L1x5fI
	Nglnw9RZcUrUlH+sy5zpBIWfvBx6w9Q86rZKF678lf5/shwjTANIhwmQcbPDNDxfONz41L/nW/b
	v9w9S+mP5vh6gBIW281CQtTpBbssuUJERChVOXmRU8C+spw0OYQY6n8RCddAIoz9aauxlPi7eYe
	aKdyrSwtGB7kcfFPm1Lw39G89DvjkmM+quuXffdcRyX0i8EWLAg9YDsEBwNP1u1a9KsSG06ZYGE
	aTRFtay4KWYTf5WbIBGPxZpOs680PQ/mdsymLG/tokEZ6uCEm77HjpT7nvuLm/PtCriM+7YrgtL
	uzOTcdQ==
X-Received: by 2002:a17:903:906:b0:2dd:c053:e669 with SMTP id d9443c01a7336-2ddc053e6a2mr4634935ad.47.1789744501626;
        Fri, 18 Sep 2026 08:15:01 -0700 (PDT)
X-Received: by 2002:a17:903:906:b0:2dd:c053:e669 with SMTP id d9443c01a7336-2ddc053e6a2mr4634335ad.47.1789744501092;
        Fri, 18 Sep 2026 08:15:01 -0700 (PDT)
Received: from localhost ([143.246.51.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb73db302sm10267015ad.2.2026.09.18.08.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 08:15:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 23:14:35 +0800
Message-Id: <DLIJGTK5M3G0.2PNROS5SMQWNF@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
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
 <oleksandr_andrushchenko@epam.com>,
        "Philipp Zabel"
 <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,
        "Marian Cichy" <m.cichy@pengutronix.de>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com> <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
In-Reply-To: <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxNyBTYWx0ZWRfXyeJwcKoMPTle
 GD3XB3+oLSpH9jVQW9oYTMUJGsgJqlVF61AD3G7KKGDS9T66nynLtVSYqCKtzqB/COWhguCuGOF
 shzTPzqEK7S44tfad2AOilSbVrQ7L7w=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad5576 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=LNnhWNgewsfctp/cwirQdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=nI5uWgR6GCbiVoZM8DwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxNyBTYWx0ZWRfX7gXusn4a5cPL
 EANQxkNIPIHyWMGD5HqolDvqS0MEkCyE0WspONsX7ssndUQGR4X6FfqkL8BFA8WUjJmG46d8mQz
 LeXbBlxRpRdyIm8sEQXG021OGLgNSYR/9fxSGlYY8H7uvgKghb3+pV591CJn/vrJc9+MYiJmAMN
 Je0FDBlv+36Tbnx14zTK8WW+QL4NQptT2NtSGMBGvVsV+PoI8P8j8kzOKUA1DwvrPclCm7NAlZM
 iPd5O/KohsZcNGh5WFXkohmJg9FALLC0lrmimybnqKX7PKrqxFtTrW15UcsQ4C63YFqPmh7HJ3J
 nD8to/zJTyyULLsoP81L+mQ9Up69DjMQ7ovyT9aqIKO3ysGOkQC39mG4/K27sDtB2OXNGt+/OG1
 +DlMiU8zGr0nYmBH62qXia4o7JNIjJEq0fc25hnFVg9bovD+y7ZzUNmhbWyqItwNz3Aw499GM/n
 7dZ93ZfW+1ia3x5bH4w==
X-Proofpoint-ORIG-GUID: 4ZSl9fVQRHB3IBzRpwesFXJn-UpPQJnp
X-Proofpoint-GUID: 4ZSl9fVQRHB3IBzRpwesFXJn-UpPQJnp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180217

On Wed Sep 16, 2026 at 2:50 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 26.07.26 um 21:42 schrieb Ze Huang:
>> Convert i.MX LCDC to explicit primary plane, CRTC and encoder objects.
>> Keep no-scaling plane check and GEM framebuffer prepare callback from
>> simple-KMS path.
>>
>> Wire the vblank lifecycle explicitly with CRTC vblank callbacks and
>> drm_crtc_vblank_on()/drm_crtc_vblank_off(). Use the old CRTC state in th=
e
>> disable path for clock unwinding so the clock reference count remains
>> paired with the previous active state.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>> +

[ ... ]

>> +static void imx_lcdc_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>> +					      struct drm_atomic_commit *commit)
>> +{
>> +	struct drm_crtc_state *new_crtc_state =3D drm_atomic_get_new_crtc_stat=
e(commit, crtc);
>> +	struct drm_pending_vblank_event *event =3D new_crtc_state->event;
>> +
>> +	if (!event)
>> +		return;
>> +
>> +	new_crtc_state->event =3D NULL;
>> +
>> +	spin_lock_irq(&crtc->dev->event_lock);
>> +	if (new_crtc_state->active && drm_crtc_vblank_get(crtc) =3D=3D 0)
>> +		drm_crtc_arm_vblank_event(crtc, event);
>> +	else
>> +		drm_crtc_send_vblank_event(crtc, event);
>> +	spin_unlock_irq(&crtc->dev->event_lock);
>>   }
>
> Please use drm_crtc_vblank_atomic_flush(). [1]
>
> [1]=20
> https://elixir.bootlin.com/linux/v7.2.5/source/drivers/gpu/drm/drm_vblank=
_helper.c#L51

Thanks! will follow

>
> Best regards
> Thomas
>
