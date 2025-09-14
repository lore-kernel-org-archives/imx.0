Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E86262D0B
	for <imx@lists.linux.dev>; Sun, 14 Sep 2025 12:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757851722; cv=none; b=GS/ar5W5z4888sYPGSo7vANBPuiJ7qYrwwsj931DWNniChVr1ayE2igG/dn2b1WXNWLmJeEQwVEDfth4hicK2eRF88rewgMrNcXadASw3jNojKpH3l74nxziORww6vvuvVDAjLgj1CiXzBm6r1E9bznaS7GNlskzvUGwhQR5gHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757851722; c=relaxed/simple;
	bh=/vAVhu/ngR4yHd05XqGLRzyRf/JzOKMB5L/10fK0Kk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dLZuPjBf36XGk0zDmS+hrXG2Zvx9tOzQoj273ILDfevi3oyYP/C7vhznTvsNoGpRfxhIHxJnzUTKr6+8MHFh+1AcPcsRbp/HaDDhIKPZcWEEbAxdxZWhjWm88bphNWfvrmFzSOlxreZTPIGh1riCG05MTK1PhzcZQ2DBwt7tegM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FUeAnkDJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FUeAnkDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
	b=FUeAnkDJW2mk8y1fOisF489Z0IOpfqgbpu9XulN49RNI288zmCFbSBfrEfRjRpKAZ5tK44
	7S/gQlysYWIHns+MG2wcxt9+q3ixxGadaflWsIYiKMs7qVeMvsM0b8LrcdYK46TWPA8Mgn
	GU8DJINiIk3yZCr1VyN3F7dsLXU/Lvs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-sL0oBfKmNVmNCPRQDwlllw-1; Sun, 14 Sep 2025 08:08:39 -0400
X-MC-Unique: sL0oBfKmNVmNCPRQDwlllw-1
X-Mimecast-MFC-AGG-ID: sL0oBfKmNVmNCPRQDwlllw_1757851718
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-81312a26ea3so906250285a.0
        for <imx@lists.linux.dev>; Sun, 14 Sep 2025 05:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851718; x=1758456518;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
        b=Y4yStFsARMk8MrlJY/dD07F2S0wxS3JPlm8cpIe6GWE8igfMuTLAb6xgrmamtiwVG7
         41sfG1CquywoDizXMJcTv8vq/is3A1Z9zPrqCXKzSvuy5iAfFlo061ngJlkJkwLUNxab
         2DyLaK93y6TaBDFv3V32HBcjpIjzgx0SuSqo+aNbPE0ap00ADUiX1gRBP1TgFUcmIPBb
         wEEC6OV7U1juUFUKgc5/qRzSFuxaPmfidDnNzlCdKMrTDqAbAkbBk1OA5JlCLlxXt8ZF
         wZ8MOuvZSwZlHpPprHJE/RjMNOQFat2ARfrg+OalbyZWB5Z6dEATED9i9FXvTss1cS9x
         3Msw==
X-Forwarded-Encrypted: i=1; AJvYcCX3qaTVphlgIwGOcQW0pjeABH+q650lnZZ9hgxA6nLVpq4y8d9dPMPInFepc02PvF7W4nk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUJdD55WT2yT49nt3vrjjcFG3HEiHJxmEAb3H6hpv4HWXgN96+
	wkI0RHRseb2jm6Q8iOoBB8ZgNspTFTEBx3QYMuJ6x06NnDUKy/V/rrIfoKT1mmwPjjSK6OTc7Dj
	c8ajHx8w9YYx0T3177pvZ8yQfsHaTdPIgf8pHDV+0Q4edO67uhXBaQA==
X-Gm-Gg: ASbGncvgDe30UmsC/QujIi1XkNW6J/EyviMFuffFHNn981snvbjLvP449o5xbGrBW9O
	TjeSURAMaDK+7ITZ2DGA0RqDM35Lxpo7pM0hJdW5F9slOyKNwb8GyocfiLlLISdzVkKOVfkHxe3
	0msTg/iX6uQn53PGwefMPTFitd/tNktWY6ol2utppFJbj6Ta1COxYwnht5XMxDl825/pXN2zDCO
	nXoqN2TtUYP+K7y9299sZTRYiwfeZ1B1FahzTElbfzEGFGOfSJRrh3chR5aIANhiEbvBb1XMvbl
	fioyr1ij1RbRzLmotzbd9E20ZhWPpQogPZX+w76auQ7Aagz8jotCGbb22KYRNilfJ/9orV5chFd
	qqO9IzjgvWYCD4BiFXi8ZuiPb7sZJPKY=
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id af79cd13be357-82401a95c9bmr1036169385a.69.1757851718244;
        Sun, 14 Sep 2025 05:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRdCKGXPgtbhvJpUCdDwCaaC2B0DLna/CzbBAvfkLzYJU98qL9IvUSFcqawGBto49lPMPxgQ==
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id af79cd13be357-82401a95c9bmr1036164085a.69.1757851717778;
        Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820cfcaca15sm580413985a.71.2025.09.14.05.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:08:33 -0400
From: Brian Masney <bmasney@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Message-ID: <aMawQYUIjPw9m4IO@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lJa9JyoFCpFfJ9KdnTUFeplludb3tFc-tWWvknf-0Rc_1757851718
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the drm subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Changes since v1:
> - Drop space after the cast (Maxime)
> - Added various Acked-by and Reviewed-by tags

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

I'm not sure which tree(s) this should go through. All of the patches
except patch 1 have at least one Acked-by or Reviewed-by.

Thanks,

Brian

