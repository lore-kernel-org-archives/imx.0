Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E78F2882BB
	for <imx@lists.linux.dev>; Wed, 24 Sep 2025 21:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758749867; cv=none; b=ZQHNX1jmg268d6q/Ng87TmIgEo4vYVCB4MDv3JljVR0gbOSrs6o42XCQ7Us5wPx1qieW43VIDj9Q4VgH9Ltk1W95ogd3hxnIPee2EPhDCKx6gqTIQ1y1QQBiSHiCA1ppG/NZhXR8stvRB6/7cNBt4iNQ9mzx1bSDFGDeeGXMki4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758749867; c=relaxed/simple;
	bh=m8y9GiGiDLlEWqGmp4t+Rh3XokhbDAVR/aMl9X3kaNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmmC5XryyJi00qQFuYZXBVK/FGUA7CRUdDRbz7zW1CJNAzYV0PUz98FQyM+HyOaA7fdTHaZkFWdOExylLVKgPmTt63vZN0DYAsYiIPxg0ZDJpYgYcpvcqPDYiazIv12U5JX4W/iCNzMhaAbc4wZr1tnBIUotASZsz+xx5taa2Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7Cyc/G7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7Cyc/G7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCCcal018220
	for <imx@lists.linux.dev>; Wed, 24 Sep 2025 21:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+LWMcHOEBBSjIu6HjaNRoCnF
	ezg9WxmzMxfF9Ioo3lg=; b=o7Cyc/G7RBSpgg9BOs9QMX6PPXKdt628WBxpdfoy
	+D5exQ9zoKhoEKG5k8AGEXEN6ISVyvgb+lWeVpNAkrxW9dM2QZYbdyimEI5jLJD8
	k+Kwka3Lo1k4lqh8iJ1vV+nAa4xqRcBcgw3jSsFGOcnOu5vNne4cJzNc1Z2llJ+z
	ZVDBgDYt0ZcgH+iMIdc2x73fcswl1rZpyR3TlS9b4L+1mCRm5GwwA+J/dQ8SgUMG
	3qG1pe7FjdBEyokycMviTqrOupZlRlCyg/H/iYQExDlI+f3HbbsannJ02pIHtHHM
	wyK5oJyU/blI7RtIFwSdI3u4IxBGcDIkfY3pomhxfedvSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk9sa0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 24 Sep 2025 21:37:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4cfa9501871so39747771cf.0
        for <imx@lists.linux.dev>; Wed, 24 Sep 2025 14:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758749864; x=1759354664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LWMcHOEBBSjIu6HjaNRoCnFezg9WxmzMxfF9Ioo3lg=;
        b=a8nzAc+rfaLC/9FsEHp75eGgukl9h6q7IchLj85K2q049rWP9M0RNo8+7OA5WMy23K
         KOBTnFkdEdXIhHP8ORTG1ZLbjQqgp7WRVKkOiOLBwIjB4hMQBdOnJZgJJBkG+NxYYBqh
         ok+nXMQlg24IJyyaOYC9zgQ2xJpyVtKs7rilPeYS2H1atKzQ5M0LO2AXBrF9PeyxvaO5
         ruqPoYsqTPTKhYtoCrGOC3TNGBorsJ3JWkEK5BWrsiox/W4wbDkr4vdeLiPoERgKgAOL
         jxiAly/5PvxO33fND+kdGw8yvoHHvMx5g89wYYzwDL830sVgElaDu0ljaSS+Pbk8Glde
         NZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCXKitbe5pBr6J7o+FTK4vBoXCIKFInNJEvYa5TYfhewjQ+N4haBLoRZOeiRdEG4fZZaKRs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeCtThkpDRN+UH39nZoz09Ae2JtMCJGcTd3qXXnA4dpQBspI7N
	rSOIJJwG9mDs/cUdYf/plkSb7sAGABTAFPuIUjTefjmY9JnCpiQByjbEhYRPF5i8TCYkPeonCJo
	JXx5PeaxvmIiLHvW3kYyIDjjXosCB02zbK5U3ftduhJhJ6jkCEKD/6kU=
X-Gm-Gg: ASbGnctEPScxF9YrtlQ1E+r3asvj3/zlotjeohMT3cqcRK3jvdcresb2I+fweUc+2KZ
	/TOOIiTXDGVgKo4NWTV+Mz58DvxyYvhBd8sHXzQRQPZOmOR9/ZJQEshzIuTaF5x9YWksz64O3rV
	50ikMuKmevuRGCSCLk/hD6wqDnzrMZ5jbmMCf5uHKKvioAtRkKD/+wbys61PVjsPkzrjMT7H9qM
	RIKQQPbcHa2UdLYKkUv1+lFESySM3zbZBUxA1vGE9IiBEfngCeJkbpl1X4Fxjw0V9/iaryZGyID
	Qt3RCUuf1MYf+GYzqvLl7jrlVuYkF4DRalYSG6tP8ihhKXbcugXs8SzBvIMPCkaBaLiQVxD1nm1
	7fzIoSU2aL4AWYepWQw+n656+dsHH326900oDP146VLzF9sH7GHEA
X-Received: by 2002:a05:622a:1a17:b0:4b5:d6db:eea1 with SMTP id d75a77b69052e-4dace86a5cbmr4251831cf.39.1758749863898;
        Wed, 24 Sep 2025 14:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPfyIi2ayPb/sO/lv0mAYAzgDsHeJzF67rIJ9gVVx+aqAsQhGtcbFiIHBvkxUQvaj+Ma8akQ==
X-Received: by 2002:a05:622a:1a17:b0:4b5:d6db:eea1 with SMTP id d75a77b69052e-4dace86a5cbmr4251521cf.39.1758749863458;
        Wed, 24 Sep 2025 14:37:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4772ca2sm680451fa.12.2025.09.24.14.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 14:37:41 -0700 (PDT)
Date: Thu, 25 Sep 2025 00:37:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/imx: drop unused module aliases
Message-ID: <rtzqwhocoa5hd3qxepuyitimlvrvecvcc57v6kynrnwbnwrfec@pnslpeadk3mr>
References: <20250924092643.26113-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924092643.26113-1-johan@kernel.org>
X-Proofpoint-GUID: TZ2qJFM7GmPNX6Zsfhg7ataJdVY_VttH
X-Proofpoint-ORIG-GUID: TZ2qJFM7GmPNX6Zsfhg7ataJdVY_VttH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX38V9LcgPrwRB
 7Z/HTSv0Sea4hzo52mhlix44y6tviU/33xL1vnV0bJaq4OIxaLu/0BV7XqTeVtuBFo5Il+02fdQ
 ALtpPWCa7mDhnLHEuEJXv+IoZrq2xY9EG4uBrosb1SIOKZUOLgdveTBCJjoK7hAM9KJG8EnO+Fb
 /I0Blegq29noluogfIySSvQtjE88vxfiIttnU35nr3nFL06L2tApSvjDcvS+hRW1vBYFJjRq1zp
 MZRKmyjyP06JmPPdKJI8YBYB6Oema8+N2mYDWBbd9qB6OAB7OKnu/U/CPKfLCeEohimW3M6rgaD
 wlYX84f38tIK+GDp9zXUVA2AX1RpQO0jK/Bmv5Jrhz2jDtvaTlnd8NxFHT9k/pU8UyjFIuCpUmC
 WfpOvdXd
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d464a8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=biaaIsZr-oeAOlJ4UdQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On Wed, Sep 24, 2025 at 11:26:39AM +0200, Johan Hovold wrote:
> When fixing up a device reference leak in the tve drivers I noticed it
> had an unused platform alias. This series drops unused aliases from the
> imx drm drivers.
> 
> Johan
> 

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
