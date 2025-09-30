Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E8538F9C
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759264182; cv=none; b=bhSrXozeOmyzvvqR6ipVqxpinBYEKnn2OqcLzrp8xRvp7o3muXb1ja+ehN63TeYs0ehaU1KyVwJreGvHIjcjz6FwkSI/FC+09eoz2ihrejjgmNU8TxNUXvV6MmDop46xdsIrc/aBrb9Zd7YxqBRmpH/FHZ/2C8DbvxDU7Wz7vqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759264182; c=relaxed/simple;
	bh=MyyNOT6Z8gPlEd2B1CWD4Q7bqvrx7M4Qx6OSp4ALGqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8xtEXCnyMXW9R9ORn2eFIoCRip9o8KE33bcZQ+wg8bv5j0fo/F3jBpptFoCwjoOI6l1c6diNQE6iGw2gJGCc0zQ3vUHWGXrhcoQZEccbKMygrnsZjyo+JcUunx90roj9g+ItZ4YVGGTYmoVXJJ2ucX7EG485CorvBHO4Iejp80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5LOIFdV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5LOIFdV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBknZk027551
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R5sl3ZNZwJRriIGWPQB/a/Ct
	xB1WoaSGeN5QScEiQ7Q=; b=o5LOIFdVBZ//v/2E1TnvIcqUjzye/Ka5ijY8xeC0
	d9YkC/9/1wv4SoPLu4fEQ0ZW1lZln041JrDY8SwcqEguun2K84mIpjGkPm7JkD7v
	zjCVofucFtUpNFoX33CWX21J4ED2mYM8MHunzDINF63/Rbi8Sz1Z/letyLi34kQL
	t6dSAeW3005RM/Q9mur/Fg4XuhGi6fa1fTXYw4ygq/8axfnxp+9bTI6CnKXIOnQx
	Wnk8uIyreZgUPFfe9wgn4hsqEbVhMbJSqUBcHtLj4/8EdPE12sPGoqHGfRFtqKR4
	EDhz5ZYVUf46AOpEPYCN7YccyVCzqeVUb6SP7Ni0pR4QbQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851javd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:29:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e0e7caf22eso78598761cf.3
        for <imx@lists.linux.dev>; Tue, 30 Sep 2025 13:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759264179; x=1759868979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5sl3ZNZwJRriIGWPQB/a/CtxB1WoaSGeN5QScEiQ7Q=;
        b=DDQ9M65SMKEAZA3aYkpCGezXUaw3xj9r75A9QeQinkRYRQk3JHl5XTPUrXvsPs7zVc
         fmnLyy9DqMxMPMazIRDasyPcUXDX04QTDrJQbR/GGwn4Z2S7rU6RvkK30W+phAYobmMI
         20dXyXO79VvJZHOQLHgee9ozqn+GUs+v0BWoRVxAoqJyXwmYcSYFCwK9PgcHC3u8V/Ew
         H4vRnsotymopejWsfHDIm5Yfw3IIOqz18JC17+MXhYNDU6rx4F5wsZGyyWYe2HHsCwZ+
         7Ltq4oNU++3FQXa13/28tb/RzMn6FoToaZVfGrcQgfubL71yT9sXN4/4H73JlaqjqxRR
         PFGA==
X-Forwarded-Encrypted: i=1; AJvYcCUZJuw/iUf0mradC0kZI04e8UqH8fPGCLeimcHnj57ZZs1nvO0Exm5hmcVL/lLbpMoGHic=@lists.linux.dev
X-Gm-Message-State: AOJu0Yye77OfBfUqjGLqQkAlX1NKWllESCrt73zVbehhTm409hxljhDG
	c4nUzyeaLDb/MQ3Vbb/ZvoJbZZfuodkuUIt/RvamDqjB1D8Ayikp4S/EshImU+hZII+5F0hk+Rg
	zdBOm9fsb7k2CHeQ4zpGYWLvoHNXsvYcKjib4Vgj3nZ70NRA891RCFCE=
X-Gm-Gg: ASbGnctA0e1zHRiQrp7TVoRFo7lYr803mq7ZbWDixJqNolTgh3GzJjX53vzkrzp28da
	10gy+VfeTCbiD/B+UqKUm6bv01FLbDZUW83qRfBr8wgv2dd7nuOhznXWX55CdOrHQHyylRFFZGm
	tZFO590D2G9SwbeV8eWWWy/KBe/qs0/OPQgRimRKReh/2YyBZwR+pOr3P1oGjhqlcj7renVuut+
	7+TURn2po3PJFKTztzTOllhGaNq/bGnM9hGE4qRce+LOU8rYPgvmZnk+11RT6+fjr28gBjxPYF5
	r1sACU+R9XOO24dC0otgqvUjVoEIiFtSH0bgZDObHYfMJRbNoVzBs1+ZbvbXQkiKYrPCJyMEQC6
	aGTkJIkJMzXoPLc3y8Gm76minG/W5r8CwL2sNupyESGN7CtpfoYRqFkrZpg==
X-Received: by 2002:a05:622a:58c3:b0:4b5:ffc4:d87b with SMTP id d75a77b69052e-4e41e25672cmr12692901cf.63.1759264178867;
        Tue, 30 Sep 2025 13:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWqYNQ5DcdbJzz/fom5G6oGKnCTXV+GrXUnR7tUKQp7CbjCVYz/Y9aUaVBAEusZAM09X6HlA==
X-Received: by 2002:a05:622a:58c3:b0:4b5:ffc4:d87b with SMTP id d75a77b69052e-4e41e25672cmr12692511cf.63.1759264178263;
        Tue, 30 Sep 2025 13:29:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665671csm5160974e87.75.2025.09.30.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:29:37 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:29:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com,
        luca.ceresoli@bootlin.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
Message-ID: <hvakijaevs7ucwvlnf6x6aqj5k465g2rc3ba7zexjmamy7mxg6@gnyhlf5jj3wn>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-1-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dc3db4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=6YOL-LhRVAKcL1tHTEcA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfXwgwGCekYrFWl
 R9WAY5WWmkZsusDdEY1Msfk8EeqrEPdynCtpoO+26Fo8SFmesahlfQXB4M6M6QgCZjAhS5sWrEU
 KUwFg3uuC3s6OSFEu1qSpQKvcqaGzoCZ8LeV+Bfq4Ezpssze5zAlI9/V1Ieh9o8v98LiEn32HeM
 9VxKHiGmL9NYEEtcA+JLlzaqgP6q6Dmhh3LOyKS2rVJPpp/Rdphdr+9gSlsweCO4rOTCXkLJm/U
 GHWAFq5Fz7+WEkXcz0mGOPE6GnvWNxaUwz3rXbWAo0jBGzrF8McKu3Ht/22htArK7SjkWhxwY3R
 T0Iup5HHpyMgzfDxdGHpxlxMFxkDxGDbTboGN24H3cVkbyQDIj8tMfXlOjf8j65W8YzX/cW8Ofc
 xHwytPI/tQXSJRQJckN63zojZF2+DA==
X-Proofpoint-ORIG-GUID: kh9NtdCpLqctKC8TWSj4ZwfHacCsHYMo
X-Proofpoint-GUID: kh9NtdCpLqctKC8TWSj4ZwfHacCsHYMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Tue, Sep 30, 2025 at 05:09:02PM +0800, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3 is to add a new parameter to store the point of next bridge.
> PATCH 4 is to make legacy bridge driver more universal.
> PATCH 5-10 are preparations for apply drm_bridge_connector helper.
> PATCH 11 is to ensure last bridge determines OP_EDID/OP_MODES capabilities.
> PATCH 12 is to apply the drm_bridge_connector helper.
> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
> PATCH 16 is to attach the next bridge on Analogix side uniformly.
> PATCH 17-18 are to apply the panel_bridge helper.

Note, only patches 1-13 made it to the list:

https://lore.kernel.org/dri-devel/41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com/#related


-- 
With best wishes
Dmitry
