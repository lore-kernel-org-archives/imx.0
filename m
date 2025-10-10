Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9873236124
	for <imx@lists.linux.dev>; Fri, 10 Oct 2025 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760105351; cv=none; b=UPcnr1EC+Y/6Cg8g5M+2f66iTmXJrLgvtQx4z26Q25Tuf03t+YZmR/Wft3cCpezKEzHHNt6VXgkoLQyVMkNlaD+c3/7/hjYQ1huk5EOsxZkf7e8WGu6+fCmm4jFsGLu3BiTS2m37a2tJTLAmBl+IvqnS5WHMzvDpBDLfTglZEqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760105351; c=relaxed/simple;
	bh=BVqR6BSVlRCmZYhYYZFBvrAOLZNktKtRyNOjkZoSw50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6o6O11u3l+RQExZ3iay4/+5dkvyyThtEGaqmOVmvnzoMoXEjMAqqOquvtBbpnsnl2aKkDCn8140xhFY5HuG2wCDYqNms5tVBo8JNLuvP9oeJYMrdUkDIgtosxxJV93Cks4q87xZ34oKLtW9Av8AhSkwRlgGuMSYkX3AP1QG5h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtCKZR/M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtCKZR/M"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6Whfh002465
	for <imx@lists.linux.dev>; Fri, 10 Oct 2025 14:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7wkzrxKudGSviXsY/mtwV95A
	pO2/F8bqxrMw6rKRUQs=; b=YtCKZR/MKHgtOZi6vcOxpQ3qKxJqn0UgdFTNCXsI
	sJVqDaRakSag7bU65LgFJK+ZEtLghWpshoZQpGdcZbfU69ysSXSVY6nMYoup7qmn
	/S69nHAvpHOe+A8qTrFDRHds8Q2JVhmmPdI4LK7R7iLVuFXUhxD0dtlC2opfsn6f
	CiCfBvQ5lcF+SNXOiycOUAV0cDzWQGeUdCd1qpJ6PjWBMQVSLtJ1NZBmDu+ihbeB
	2JvToGRINChtwlpNekLtlqubx4oYd1oDeBN5FvHJ02rIK8AadmMX7M1YJz9aigBp
	U9tuzgu13YAiJua6n3sRGlt4YTW02NVsgH9Hf0qjdcTaJg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49pgdsu3v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 10 Oct 2025 14:09:08 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-761169b7f11so4856465a34.3
        for <imx@lists.linux.dev>; Fri, 10 Oct 2025 07:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760105347; x=1760710147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wkzrxKudGSviXsY/mtwV95ApO2/F8bqxrMw6rKRUQs=;
        b=u/+yRlyIuxyEiICjqVUt2G1a8D7HZ1mDDGpSj3hRYAhKl+0b75MD6k7wkIcMDyKR3C
         QTK0x9Hq3r62p+Y43z3tCyi3v7kBQAI+sAPKIt2w8erZZWhzY0qnAf+g7Ll2FXSBEqqD
         3sPFu758xesA3xczpXIbRnLSqcLRQafb210y6D9dd655s/kjOUTEEo5Ry9qn1S6FJIOD
         Vr1w+GAJ8CIWND4yZBhUQv7b2vbH5o2VemzADUtHP/rzqxV/vKqjDzHluDOtd9WllVq2
         qXSyW4xgQeXsjgytn8OizhIsf0nNZXjIjG/NBdOugBWpGz9Y79ZmsP80RIiNK0Es6/Ql
         n2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUXKwtqoLLEp+mmKhQ0inHMpYgIwW6Q/Z/gLl2jXd+beU2n2F9zaPLhMIBPY7pNGXyoDmc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhwSojFJqpelaggIfIyM8Yb7VQta0TEU8VHG+oLWkvg+xPlmCO
	61RETWbw/hC9T3SenehRwcVdDOew+nFJoOojVCVqDCt1bBXVkafdAMwufXKZNfXhXOXwj3uT7iY
	GDVeyyn7gIAP5IJ1kk2r0oxBwy/wLilFnglfXzFyFomfoB4cArumnIk0=
X-Gm-Gg: ASbGncvgzdBrGLnARxUJpNSc839rRM93Oo3/GCAAD+k+PtZT4mijgokznkz1A9peIZu
	HZKx6cvBp7idDy/AJ1yEc3Xdwh+6oxqaMg7cNIRY2VwlU0/GFDxYy4VL2inBPdeHPTfP1dvckhK
	V4Qf2/Cvf0w/IGGfBbYl+2g9VmCZEbh93qJkgQMKCDm783pOVvTsQSEA02eiV6gljs12758s0g7
	QnUoFH3bs26Kl9HK+Ff1952qpDZBqRFH51nILtRVMF/hIRRuIObg8If1stJoinUcntJBio1uAFm
	k8rJvDck+awNBvJK137ehjncaa3+GBotR83kfb2/cXmAzeV/IgV4C9hIvRSqOoMz7JOr8Y62Ijv
	AA9L+mim9y0k23cX7OBnnSFo/OKomyo1QcFEwyYct2Bqr6g4j5rZm
X-Received: by 2002:a05:6a20:12cc:b0:2ff:3752:8375 with SMTP id adf61e73a8af0-32da845f843mr16839518637.45.1760104966431;
        Fri, 10 Oct 2025 07:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx6lmwhdGB5tiz/Bc58mePgSBZ2wqdgFCoifjtltdKT0RsIy6in4D98ACg4FIrT0oC09J4cw==
X-Received: by 2002:a05:6a20:12cc:b0:2ff:3752:8375 with SMTP id adf61e73a8af0-32da845f843mr16839190637.45.1760104964177;
        Fri, 10 Oct 2025 07:02:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4de3sm909304e87.1.2025.10.10.07.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 07:02:41 -0700 (PDT)
Date: Fri, 10 Oct 2025 17:02:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
Message-ID: <dkblceiweall37j4anpgkumizxc5zni3axnxb5hyokv2jlsta5@immpjaczktnh>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-12-damon.ding@rock-chips.com>
 <20251001180922.6bbe42ac@booty>
 <a42ebdca-1cbc-498c-b859-336557823f26@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a42ebdca-1cbc-498c-b859-336557823f26@rock-chips.com>
X-Proofpoint-ORIG-GUID: 8BeMV7eDvyRDWf-EF-RxFqUlQl4GCgpQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA5OCBTYWx0ZWRfX4LJW26RVpwlA
 9UE8hvwX0X5uQrNnJryHCXbRI/MLagybpztcYtOBwUB4y9kJJGHNZtK65Q4BfsWUKpxkRbwfL+F
 7N8rcTTsGoNEjV8yIbfKrj19/Ion5D4XIdGRyGDpLII4rywJDRL8ffyNZxcuzf3ZCGlzuVAgsmA
 /HTVE9h5eHOZuxzY+PwcQZEsNHNhhSB1sp/1vx99eYDFIt9iDP8E0oOfqdh/tXRI+XA6HX7MJ4g
 tc3qtZ5OBf4E0oG0tUKf9raOrfZf9vf+ij91M/qhALnP9I8e3l86cpJNV+mC96EuRnOfBcOiy6A
 WhHa/1G5zJRX6L1yosTAzKSbQ7GgJprugwanzwqyzluc9qSTqOREDLowP1Y0DAK8t0OR/0I7H47
 ZgVfc0Ahh+5JEXT808t5/uX2uWwSdw==
X-Authority-Analysis: v=2.4 cv=DISCIiNb c=1 sm=1 tr=0 ts=68e91384 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=s8YR1HE3AAAA:8
 a=Y6CNJq9B8L7KKZcxe68A:9 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: 8BeMV7eDvyRDWf-EF-RxFqUlQl4GCgpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090098

On Thu, Oct 09, 2025 at 12:10:42PM +0800, Damon Ding wrote:
> Hi Luca,
> 
> On 10/2/2025 12:09 AM, Luca Ceresoli wrote:
> > Hello Damon,
> > 
> > On Tue, 30 Sep 2025 17:09:13 +0800
> > Damon Ding <damon.ding@rock-chips.com> wrote:
> > 
> > > When multiple bridges are present, EDID detection capability
> > > (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> > > (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> > > determined by the last bridge in the chain, we handle three cases:
> > > 
> > > Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
> > >   - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
> > >     &drm_bridge_connector.bridge_edid to NULL and set
> > >     &drm_bridge_connector.bridge_modes to the later bridge.
> > >   - Ensure modes detection capability of the later bridge will not
> > >     be ignored.
> > > 
> > > Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
> > >   - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
> > >     &drm_bridge_connector.bridge_modes to NULL and set
> > >     &drm_bridge_connector.bridge_edid to the later bridge.
> > >   - Although EDID detection capability has higher priority, this
> > >     operation is for balance and makes sense.
> > > 
> > > Case 3: the later bridge declares both of them
> > >   - Assign later bridge as &drm_bridge_connector.bridge_edid and
> > >     and &drm_bridge_connector.bridge_modes to this bridge.
> > >   - Just leave transfer of these two capabilities as before.
> > 
> > I think the whole explanation can be more concisely rewritten as:
> > 
> > If the later bridge declares OP_EDID, OP_MODES or both, then both
> > .bridge_modes and .bridge_edid should be set to NULL (if any was set
> > from a previous bridge), and then .bridge_modes and/or .bridge_edid be
> > set to the later bridge as is done already.
> > 
> > Does this look correct (i.e. does it convey the same meaning)?
> > 
> > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > @@ -640,6 +640,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >   	struct drm_connector *connector;
> > >   	struct i2c_adapter *ddc = NULL;
> > >   	struct drm_bridge *bridge, *panel_bridge = NULL;
> > > +	struct drm_bridge *pre_bridge_edid, *pre_bridge_modes;
> > >   	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
> > >   	unsigned int max_bpc = 8;
> > >   	bool support_hdcp = false;
> > > @@ -668,6 +669,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >   	 */
> > >   	connector_type = DRM_MODE_CONNECTOR_Unknown;
> > >   	drm_for_each_bridge_in_chain(encoder, bridge) {
> > > +		pre_bridge_edid = bridge_connector->bridge_edid;
> > > +		pre_bridge_modes = bridge_connector->bridge_modes;
> > > +
> > >   		if (!bridge->interlace_allowed)
> > >   			connector->interlace_allowed = false;
> > >   		if (!bridge->ycbcr_420_allowed)
> > > @@ -681,6 +685,44 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >   			bridge_connector->bridge_detect = bridge;
> > >   		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > >   			bridge_connector->bridge_modes = bridge;
> > > +
> > > +		/*
> > > +		 * When multiple bridges are present, EDID detection capability
> > > +		 * (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> > > +		 * (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities
> > > +		 * are determined by the last bridge in the chain, we handle
> > > +		 * three cases:
> > > +		 *
> > > +		 * Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
> > > +		 *  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
> > > +		 *    &drm_bridge_connector.bridge_edid to NULL and set
> > > +		 *    &drm_bridge_connector.bridge_modes to the later bridge.
> > > +		 *  - Ensure modes detection capability of the later bridge
> > > +		 *    will not be ignored.
> > > +		 *
> > > +		 * Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
> > > +		 *  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
> > > +		 *    &drm_bridge_connector.bridge_modes to NULL and set
> > > +		 *    &drm_bridge_connector.bridge_edid to the later bridge.
> > > +		 *  - Although EDID detection capability has higher priority,
> > > +		 *    this operation is for balance and makes sense.
> > > +		 *
> > > +		 * Case 3: the later bridge declares both of them
> > > +		 *  - Assign later bridge as &drm_bridge_connector.bridge_edid
> > > +		 *    and &drm_bridge_connector.bridge_modes to this bridge.
> > > +		 *  - Just leave transfer of these two capabilities as before.
> > > +		 */
> > > +		if (bridge->ops & DRM_BRIDGE_OP_EDID &&
> > > +		    !(bridge->ops & DRM_BRIDGE_OP_MODES)) {
> > > +			if (pre_bridge_modes)
> > > +				bridge_connector->bridge_modes = NULL;
> > > +		}
> > > +		if (bridge->ops & DRM_BRIDGE_OP_MODES &&
> > > +		    !(bridge->ops & DRM_BRIDGE_OP_EDID)) {
> > > +			if (pre_bridge_edid)
> > > +				bridge_connector->bridge_edid = NULL;
> > > +		}
> > > +
> > 
> > If the above rewrite is correct, then I think this patch can be
> > rewritten in a simple way (build tested only):
> > 
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index a5bdd6c10643..bd5dbafe88bc 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -672,14 +672,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >                  if (!bridge->ycbcr_420_allowed)
> >                          connector->ycbcr_420_allowed = false;
> > -               if (bridge->ops & DRM_BRIDGE_OP_EDID)
> > -                       bridge_connector->bridge_edid = bridge;
> > +               if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MODES) {
> > +                       bridge_connector->bridge_edid = NULL;
> > +                       bridge_connector->bridge_modes = NULL;
> > +                       if (bridge->ops & DRM_BRIDGE_OP_EDID)
> > +                               bridge_connector->bridge_edid = bridge;
> > +                       if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > +                               bridge_connector->bridge_modes = bridge;
> > +               }
> >                  if (bridge->ops & DRM_BRIDGE_OP_HPD)
> >                          bridge_connector->bridge_hpd = bridge;
> >                  if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> >                          bridge_connector->bridge_detect = bridge;
> > -               if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > -                       bridge_connector->bridge_modes = bridge;
> >                  if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
> >                          if (bridge_connector->bridge_hdmi)
> >                                  return ERR_PTR(-EBUSY);
> > 
> 
> Yes, this is correct and maintains functional equivalence with the previous
> implementation.
> 
> I previously attempted to implement this feature by modifying the logic in
> this section. However, that approach would obscure the explicit propagation
> semantics of the bridge chain flags (OP_EDID/OP_HPD/OP_DETECT/OP_MODES).
> Therefore, I finally decided to implemented it as a specific check after
> this code block.
> 
> Dmitry, what's your take on this?

I think I prefer Luca's code, it is simpler and easier to understand. It
doesn't need a huge comment, something like "leave the last bridge which
provides either OP_EDID or OP_MODES" should be enough.

> 
> > Another thing to note is that this patch conflicts with [0], which I
> > plan to apply in the next few days. The two patches are orthogonal but
> > they insist on the same lines (those assigning
> > bridge_connector->bridge_* = bridge). Not a big deal, whichever patch
> > comes later will be easily adapted. Just wanted to ensure you are aware.
> > 
> > [0] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/
> > 
> 
> This is indeed a clever approach to the managing bridge resource cleanup in
> drm_bridge_connector. Thanks a lot for the heads-up! I'll resolve this
> conflict and rebase the patch series.
> 
> Apologies for the delayed reply as I was on vacation. ;-)
> 
> Best regards,
> Damon
> 

-- 
With best wishes
Dmitry
