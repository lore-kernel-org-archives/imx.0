Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797636;
	b=F2x8+tY62bx3hvqz/5xfGfWO6NE7iemg5LL96ZJqSxQ5td06hjQoInvt5upp8vD3bUq3
	 hme1u32rk/ZeeqyVn02U1BXZ1/W085UwwSfq5yUYrcxHv5NhZmgjlU1s3YqvKukSZloaN
	 O1FRRuGzTV6WETRcKrQyQJebSooY/nHU+vXl8wKWtrNZVz+Bxu7s2WjKfOq+OGjdogFsG
	 OY8Jd39LoCebJ77dVVVgrNX7exrvtaUeP4l3pfrZoD50JbEK5170s4FcAgrols5PxM/fG
	 VxXmU126BVLKYVcVDuXRTkR9S/oNkDbS9brVkKA29tKyuDkWf2UYOomG8gzB1Drib5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=XUwqQ76NdAJUSx0nAgTzca4PsZDjn9b3TAqsJayi8ig=;
	b=S9mnyW2l7Mn3XCRUvSurhI/4wGzDGIl0lGOAjq8d6sY1TLCj6TaUt2frF8ahSct1Z14A
	 GhC0BUT53dVzF0qUkqE2epkdBpsBtN3szVJql+JOPXDuHx2/2wzpS7frQJ8SO/oeQ4unW
	 YTMyPOzB4k8loC07G+QvgDxkoz4NTrGzLaHxKNW9v70Z9mKbUrwqh/warW4TUrUNJkFjI
	 1dUTQSI1XIlNCDU75nHM7HE7lfD60X900sxVbl+t26dhYOUp1f+kO7q8iaWzTK+Z9/gN0
	 PL9SGBDLxjLSjNnjZfwxQ1nEOOiyCWh1ERcgadTCmh9zGop58Whaz6NGi0K9LvGBElg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mNCvgrsR;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E03606A69D
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 16:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E03606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mNCvgrsR
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso3628875a12.3
        for <imx@lists.linux.dev>; Fri, 27 Nov 2026 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795797634; x=1796402434; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUwqQ76NdAJUSx0nAgTzca4PsZDjn9b3TAqsJayi8ig=;
        b=mNCvgrsRPT/a8X4uid/7JF7kPjfX0Yc4Ium/OicmKEhjA9b5BmhXEKBrNChmckAVPT
         8c2W3ixr0/rKtWD8bb7pHZa6avJiXD4WqBVotTecyrFls4/aJ5OTpiYz5FmzYl8tkqN8
         XNm8xoybJCEDLSY9isO5idob20yHd4LRF3bnIhP9LxwkF3zODYQ1YWkJqFC1HGLvdDXf
         5yxXQiz3ecz7BjqZhkvnhUCr0ttj7OvCQrJVYPHgY2RSjr/+8lUi1wyHtFT+lISX1jpd
         mFmcUZWK5wya8nyo9LwlfLdGQ5uk95b7N/gUCNuFIcTF1YyhN88DCiaXAziEYY5o0Y4t
         u+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797634; x=1796402434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XUwqQ76NdAJUSx0nAgTzca4PsZDjn9b3TAqsJayi8ig=;
        b=Y0ZEP3zq6xI0j85UGpiGR/Dd1p60aFxiV04nZYR7kQgc9YSRWh0wemaoaLYho7oHM1
         ShPnT/MNFcc9FcesK68waNozSi7ovxOX4/vqECpaDF7VdxgAGBOqiww+sWU2oCQJIFHL
         Ej74HdUJeVUQZLs28I0sJWZIKVJoDR3iE1hqqOpqGdHB+hmRtVpoMbtVW3tXkqnF3rdH
         LUODOlwYp5g4ONcwalN54RgFPqkn1fIHnM8Eqg+W/xpNSlpS4ycNm1x8p9WTdoBLUiNN
         qdBQjNrYK34o1Nid8+4mrGtxAHjOSC4uF8WH/NOC2QzRIpsUnN4WMQ0HXvTx7HKiBN9Z
         fnnQ==
X-Forwarded-Encrypted: i=1; AL+hErH0R4UG0Ttfk1dPXAv7z1gJbVrcv/jF1heUp5bmIVGxPjJa0Fu1gYyKekKbM26rmLjVAKg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8TQq0STpVNFct5tfiP2yFOKUVAKBzuYXGkrIeG0fYwUBjzGVaV
	ntAhkhy7oMqYYYwKacQYFLdX3NS0aBlRj1Yhl/El1yd3w9591S/7U7rsX/eN4tg7vO4=
X-Gm-Gg: AZFdTZfkwKB5IFZEjFzzUjdj0tMnSwVwAj2wZBEsQQ4vQBi6bCqRH419ZOSl9TZnbNL
	JSXZfOgY1ubmymseoGSHY/g2bmoyqPjVhm9dzh7WreRDHIRw/rlHZ9ggJNNvcgpWNTtSg53ZwQ+
	MUY7KedWP8UEZnTf5siei1vFBMOw1MFSUTFAhhl+lIvyeBsKQDyQqln+GjFHkPAUgT/yUU1KXDt
	GObITpb67QbCw64pdjU/B8Is6MbQ/kCjimqWswLyKGb9FDmvxJ8b92e3bN0EKDhnKQhUWRc7T3H
	LjyBzo+g+ag/3O+rCriuEGr1t4A1XLSAfcdFv1TKALJD2UG9kJcalX4AugFNMMrfi3V/MwRnSke
	a17apQyGd9jXFxAvqB90ssGh1M5ehIsUDv5b7oykXqEL7yqyz/gzGswWIf7Jv8EE9XZ2cW9gdLy
	JZFsJSth7wd9mVkFqLD6eVugKjVDTcYO5gXA92MATtfyHrny7O6w1toQ8FhGo+cCltR4WkXFNtd
	4Xjj0jyzfdN8XRxkP0xSSgF3k2OwL49EUlzNSTk/Qs8NUeQfxloDlYhzf+l5GAczmstoBCqDX9X
	a3Da52cM0tPaYmg5V129tfrIwtH2BkuX
X-Received: by 2002:a17:90b:224e:b0:3b4:22d:e066 with SMTP id 98e67ed59e1d1-3b41c7d6061mr24239538a91.5.1795797634227;
        Fri, 27 Nov 2026 08:40:34 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:6d00:8302:1937:74ad])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm38838830a91.4.2026.11.27.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:40:33 -0800 (PST)
Date: Fri, 27 Nov 2026 10:40:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Rob Herring (Arm)" <robh@kernel.org>,
	Sjur =?iso-8859-1?Q?Br=E6ndeland?= <sjur.brandeland@stericsson.com>,
	Alex Elder <elder@kernel.org>, Andrew Davis <afd@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Brian Swetland <swetland@google.com>,
	Clement Leger <cleger@kalray.eu>,
	Daniel Baluta <daniel.baluta@nxp.com>, De Leon <x0095078@ti.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Guzman Lugo <fernando.lugo@ti.com>,
	Hari Kanigeri <h-kanigeri2@ti.com>, Hari Nagalla <hnagalla@ti.com>,
	HyeongJun An <sammiee5311@gmail.com>, imx@lists.linux.dev,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Loic Pallardy <loic.pallardy@st.com>, Mark Grosen <mgrosen@ti.com>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rishabh Bhatnagar <rishabhb@codeaurora.org>,
	Robert Tivy <rtivy@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Siddharth Gupta <sidgup@codeaurora.org>, Suman Anna <s-anna@ti.com>,
	Tero Kristo <t-kristo@ti.com>, Uday Khare <udaykhare77@gmail.com>
Subject: Re: [PATCH 00/10] remoteproc: Assorted bug fixes across remoteproc
 core and drivers
Message-ID: <awmyfo4HYoQ2dqKT@p14s>
References: <20261123172140.3547896-1-lee@kernel.org>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123172140.3547896-1-lee@kernel.org>

Hi,

On Mon, Nov 23, 2026 at 05:20:44PM +0000, Lee Jones wrote:
> These issues were reported by Sashiko.
> 
> None of these changes have been tested on physical hardware.
> 
> Cc: "Rob Herring (Arm)" <robh@kernel.org>
> Cc: "Sjur Brændeland" <sjur.brandeland@stericsson.com>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Andrew Davis <afd@ti.com>
> Cc: Beleswar Padhi <b-padhi@ti.com>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Brian Swetland <swetland@google.com>
> Cc: Clement Leger <cleger@kalray.eu>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Cc: De Leon <x0095078@ti.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Guzman Lugo <fernando.lugo@ti.com>
> Cc: Hari Kanigeri <h-kanigeri2@ti.com>
> Cc: Hari Nagalla <hnagalla@ti.com>
> Cc: HyeongJun An <sammiee5311@gmail.com>
> Cc: imx@lists.linux.dev
> Cc: Iuliana Prodan <iuliana.prodan@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: Loic Pallardy <loic.pallardy@st.com>
> Cc: Mark Grosen <mgrosen@ti.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Cc: Robert Tivy <rtivy@ti.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> Cc: Siddharth Gupta <sidgup@codeaurora.org>
> Cc: Suman Anna <s-anna@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Uday Khare <udaykhare77@gmail.com>
> 
> Lee Jones (10):
>   remoteproc: core: Fix integer overflow in rproc_check_carveout_da()
>   remoteproc: k3: Fix integer overflow in k3_rproc_da_to_va()
>   remoteproc: omap: Fix integer overflow in omap_rproc_da_to_va()
>   remoteproc: elf_loader: Fix overflow in rproc_elf_load_segments()
>   remoteproc: imx_rproc: Avoid stale mailbox pointers on request failure
>   remoteproc: imx_rproc: Register SCU cleanup after resource acquisition
>   remoteproc: qcom: Clear glink->node on allocation failure
>   remoteproc: qcom: Skip unregistering uninitialised SSR subdevice
>   remoteproc: imx_dsp_rproc: Fix pointer stride in
>     imx_dsp_rproc_memset()
>   remoteproc: imx_dsp_rproc: Fix off-by-one bitmask for trailing bytes
>

Other than patches 7 and 8 that will be handled by Bjorn, I have applied this
set.

Thanks,
Mathieu
 
>  drivers/remoteproc/imx_dsp_rproc.c         | 10 ++++---
>  drivers/remoteproc/imx_rproc.c             | 33 ++++++++++++++--------
>  drivers/remoteproc/omap_remoteproc.c       | 11 +++++---
>  drivers/remoteproc/qcom_common.c           |  5 ++++
>  drivers/remoteproc/remoteproc_core.c       |  7 ++---
>  drivers/remoteproc/remoteproc_elf_loader.c |  6 ++--
>  drivers/remoteproc/ti_k3_common.c          | 27 +++++++++++-------
>  7 files changed, 61 insertions(+), 38 deletions(-)
> 
> -- 
> 2.56.1.750.gf70dc682cf-goog
> 
