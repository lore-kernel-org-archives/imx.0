Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCAB3783CC
	for <imx@lists.linux.dev>; Fri,  8 May 2026 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240444; cv=none; b=phf0OXAq5Ak8ybybyS4KGFojL0ARMjhYI5M2+RPaD7n3qjFQaNV3QHlxoQLWK+ayu5esw26LYLM3NW6c0qJHCltep5EbC4auN6yQf/0metUp2dmj/qtbbHJQdEjH8WLUE3LS7GudGrhJ/okyByPNJFcki/i38Gzk1dPOvizPOpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240444; c=relaxed/simple;
	bh=tlYXAbOvt31oXqu51oDItTmnecupft6tIG0TNcDPb/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFSa5M+/AqOScM+w7iSgMhlhBXMhjgZxl3SAB0k0ixpTBc96BVaugWaph+rCn8UQDJ74cA75OL9vsh2dERnEpvZ8mV8ikPLFfk9tYFi38slNYfDVAFenestfDHNwK/T7YQpmFX/1kVpUYn5jxOVawOWX65BpSfEUK0YlRmcgUJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ed/6gaIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buZGNGgk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ed/6gaIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buZGNGgk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489Ffus2770839
	for <imx@lists.linux.dev>; Fri, 8 May 2026 11:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OZp+cY3PvWZ7AXX+8WUitd6Y
	Yr2WXghfEWf102S3Vyk=; b=Ed/6gaIAZdihHgkd595agWOjbCz7EywPKc6N6jQ0
	qMZp7fybfb7YONqb322y1Wz0aUDcy11h/vBcHFuHIcCURCs0JOe9uHaO2j0P8nfd
	FxlbFeRXW31Wti7FtVQtiqp6ooaDQVk4MkwtnkDer0GnMMk6RdjRJytLHC0LScY5
	AdN/mE9Bw5piiSNoDhsTYhiUdw41dJhUeJO7NLslP14XSO+85oKtxwGsm32bYiAh
	+5Kcm0gtguOPxTE1y7K/FcJX/3bGfmCG144AU/l8aqgxKeBnIC4TnMB9CW3Xdn7M
	qn7wP0AXOfCY+sK7QKCJ1DiDLnPKbtbiN6wIMEY/CZseoA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5kh3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 08 May 2026 11:40:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51306c1076dso40081751cf.3
        for <imx@lists.linux.dev>; Fri, 08 May 2026 04:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240442; x=1778845242; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OZp+cY3PvWZ7AXX+8WUitd6YYr2WXghfEWf102S3Vyk=;
        b=buZGNGgkWmAY9j2VBb2CIB78IZ/sMGhs3iX82ukuAlxI/54C4pPU+QMRnH4WytklfB
         nvQnWLV5ax70Ena2yqNYPQGZ9zQlcAlQmpWqXsjqwynzeymlzZQGmmYk8KcGbH7n5w0A
         7tC21cx2XKbjtT75SpEW8GprIHdr4U2zDIRVW5GfLAeNMbS/o9mh7lOnRV6olz/k7CMH
         5wqd3V0W/qxrxDbkkinIMzaV9XO1hXV46iFHCgsHcBltAg5Pwb7EMBtqOVU1BdrAkzXF
         zGKuCkAhWSGMzkDGv0QN/+QODm38ZeQqLzTIsC0rsppyTVkFRFHOMw0+N3zmxyNZXaui
         495w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240442; x=1778845242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZp+cY3PvWZ7AXX+8WUitd6YYr2WXghfEWf102S3Vyk=;
        b=gilMO+dg9y5OCGt6pv/Xibi1B/LD866qZkwjX7HJJIu/T7FmnTQ1trFDD55uN/8EoE
         vHrDVSX5zzzWjIwldXxNHLW1lpBU4aTD3XoeN59Vlo43xk74675dCH3xjAMRjQJyT0ry
         r2tDlDusYgwmOJlS5qXg8n5SLzaeBLYkyHV1OKeW/xBfZMzuZ3zlaYPSf7YNpGdNY35U
         kJV80QUslHqjFsTgWCWjOZ3Bp3oZOyl4DFlFQXjI4vEW7WDGuF6qlQYdhxOCrgjiYd9r
         PwDUgU+rwMMV5YciCh7W3VLdSNUigr7pbxH3nHpYQ1wZ59ZD90AINBJw5gyet4WWlj84
         AuvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nGZq004egZym4Q0IiJ7sxghL8FfPHm37xbuO63vVlHSpPhNIuHUxJxF5saytA2Kpd9dU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2BF16hrejZjiK9e11o21p62ffXsJvgEn9TrpxqNOC13X/87Wk
	SoyWgMyPZRmnXC5UyAA5XfQXBgXBLeUHCPxVeDIHZ8trMARF1SGC7un9KJIzqquXqQ0gxNw8DNv
	n4gQ4NedHFfTZjDj8OBdTkGMBLbvzH6IJ3Pq5ChP57eoLpe136xicdZg=
X-Gm-Gg: AeBDietD5TBxUhd/4x9Dpn0RnhWkV9iNC51RzR0llCT6e7bUUGTdEQkTxafV3eNcTjI
	U8i9x6Hj2ZeEU3kQ4xBLmCgCWqb4llrSNCIoQCjYWgsVZdW+NwH+w5fWLqZrqif/FLvS3hxq3x2
	QY52MOauRyLk5L/0zpRjfSsLSC7QyzDsbXcd8un1CjT1mVhqFOEp8tp40PZ6JiuZ2/fg8P2E3vf
	+6v871gC9gdfB3h27HlR8zDwu2L8RukLFSwog/d7VRUMI8k5dZhNAPjqC/Gb2wpPcg3drc7Sncd
	hLZy9GBrAwoVWQ6B9U+1c9Zi+U/7TxAkcqEWTTkSxG/oKdhn98Y6ibt9WOzPS9W9btcrqT3sieu
	Y3sqBa28Jf2iDcf65o8PX9LBpe2TW5vYxnm2ubJXAfODKN4JzECR+f5jY8zpP6zE7RwSgfAoZMh
	/1lSCNJBqncaDdVTRgSLGz06zv5mdpAWdI5Aw=
X-Received: by 2002:ac8:5ccd:0:b0:509:39b5:a97f with SMTP id d75a77b69052e-51461f9dd73mr171209701cf.29.1778240441786;
        Fri, 08 May 2026 04:40:41 -0700 (PDT)
X-Received: by 2002:ac8:5ccd:0:b0:509:39b5:a97f with SMTP id d75a77b69052e-51461f9dd73mr171209351cf.29.1778240441234;
        Fri, 08 May 2026 04:40:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f613ed94sm3958371fa.31.2026.05.08.04.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:40:40 -0700 (PDT)
Date: Fri, 8 May 2026 14:40:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: imx93-mipi-dsi: Fix mode validation
Message-ID: <utzkrmbx3uqys7gfepoi3gasylzxid3oqrcvdte6hn63pd3a3x@huwqowsbjgv4>
References: <20260227-imx93-mipi-dsi-fix-mode-validation-v1-1-a9cd67991280@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-imx93-mipi-dsi-fix-mode-validation-v1-1-a9cd67991280@nxp.com>
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdcbba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=8AirrxEcAAAA:8
 a=ghoAkTYV6uPXXgQErFYA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: Cf_LVhsw2H7ioc_8tRdbMQGEgMGiVpMd
X-Proofpoint-ORIG-GUID: Cf_LVhsw2H7ioc_8tRdbMQGEgMGiVpMd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX7EzIOGH/F4yz
 Mcp5YDZqX2Gh9gIWZlHNVKxs16z247DsWqeSiC4ivpPXqAgYBWK8UsGDv2eOycZg8Rf2Fr4Wo2t
 O+9FWZHBKz1Yh6g3e3nH8XxWdXV0cPgXbkMFUnPssSrFJM7+dpETL/B/05b5/Sin3z7CWrA/6z6
 eZGnG4jJaVQBFeTt4+6MOjthgIzipZtE4TtrIgAGSkbwPIWePz2PxJ2/fDGYsYsNwrqiEE2Z5FL
 /l3mO57D+9Yu4SOpwLWNCe7ouk1JZc7JzHPZhsa5oeUV5jMPqyG78Sa2JPgw7hSmlyoU3QZp8p0
 8EWABP/cZXfNohSnOuz9AmIRAgQjTrhzNJkAWcL/xcpx/IXxfKnU/jwWz7smAnbmLmeR5ADdbOe
 +c069JMTdFk7x8Ja5aQ8qrdpct7JSUvou9J+7DqplxtGdjA0S7cAj836hRCBQnyGOhxOT42Y2i0
 sxVKI08yh+ZyURUqU5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121

On Fri, Feb 27, 2026 at 03:36:41PM +0800, Liu Ying wrote:
> Instead of checking the last bridge's operation bit masks against
> DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_EDID to determine if allowing
> +/-0.5% pixel clock rate deviation, check any bridge after this bridge,
> because the last bridge is usually a display connector bridge without
> any operation bit mask when the clock rate deviation is allowed.

It would be nice to add an explanation, why this check is performed only
for these bridges.

> 
> Fixes: ce62f8ea7e3f ("drm/bridge: imx: Add i.MX93 MIPI DSI support")
> Fixes: 5849eff7f067 ("drm/bridge: imx93-mipi-dsi: use drm_bridge_chain_get_last_bridge()")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 33 ++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry
