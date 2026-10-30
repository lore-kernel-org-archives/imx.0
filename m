Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367361;
	b=gs7VAxAijgEA4jiSQ4kzaJs8Zubb4GJnhip9ynBM0RLP0Ggp+bk1jEbeG/XoR6mkb+MU
	 C7ZFm6Aet9DDfyOUu3euRQcGUuF7BBGQMYhsG6cfRT1A5d6PDVI3CiNxMI5QRna7tMnsl
	 H+OocW/7A+M9RAzn736QwCi6uFj3IXNRHS0zpzxyzXmivqxYTHEg9axp/Qf+dDggH3mkK
	 1tvD5uoV4cFwCBdUGzMuzSlPpExvg1UZ/2XVKEmwJ5BenSR4lkAfWeptbFGmE3Ncrz024
	 OAvBFFOHVcl/3kjhUpAZ2UqWEiKI2S82St+a5Z+U1L2di272bZbXMfSSdcgG6Indmqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367361;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NKmp+ui2Bo98qe07VUZSa+u7FLoONy+lMEEgOv7rH+E=;
	b=4N26McKANwtPTtjx/qHkcyIIT4MN11CzsZ/7KMVQS+fYZz3Va+8Oo+4Cf1dHVeFs/juC
	 gpIpDEt747mWQHtc0RvwtCjUFJM8QUGcOpDi88bMyYwn86lhtQjdB3YKMIlyYnK4xlYYk
	 4/qkMKA1tzJPeV9FK8zSL+D4n+q8hfcRJvZvbSgSpnkZdY4af4B2X48E6SjP8le+r+DDU
	 3tVtfnXJaajYuQBCkNLMdpVLw3Hf9x3W6ItkjEZJUUFz169pOYrWYFi6kRo6b3eDcFi1L
	 Mzhm70HWLyHILdrr6MrSw4uqCsfyuYRo/+xKAe17Vq2iKAQW0M8pr0lkqixpu0+zOrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=a8sqbx3o;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECED606A320
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 13:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AECED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=a8sqbx3o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=a8sqbx3oNNhXt0lqJ1Oxjxjwozq8dO9yMt7Z2eHUcN5GhpHTZGfVKfN2BUaOgM11ES27bKPL8uAYx
	 SIRIMgLuWtZ+MZeX7q7s1GSV7tlfLvQ/I04QNVltqxYIsn64Vww7MvseqcqvZAm9UDkFPo8mRkX9rV
	 VAdEBgeocndfTbUI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26ae49d2d3cc-b199b;
	Fri, 30 Oct 2026 21:35:49 +0800 (CST)
X-RM-TRANSID:2ee26ae49d2d3cc-b199b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[112.22.250.195])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6ae49d33695-0d785;
	Fri, 30 Oct 2026 21:35:49 +0800 (CST)
X-RM-TRANSID:2eea6ae49d33695-0d785
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: laixiangwu <laixiangwu@cmss.chinamobile.com>,
	dri-devel@lists.freedesktop.org,
	Lucas Stach <l.stach@pengutronix.de>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] drm/imx/dcss: Fix clock leak on blkctl init failure
Date: Fri, 30 Oct 2026 21:31:30 +0800
Message-ID: <20261030133355.1938-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <auRgElrEh0YlUaKc@vm>
References: <auRgElrEh0YlUaKc@vm>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,=0D
=0D
Thank you for the review!=0D
=0D
I've renamed the error labels as you suggested and sent a v2, which=0D
threads below this mail. Please take a look.=0D
=0D
Best regards,=0D
laixiangwu=0D


